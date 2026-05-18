/** First Wollok example */
import wollok.game.*
import rolActual.*

object lionel {
	
	var property position = game.at(3,5)

	var property rolActual = titular

	method image() {
		return rolActual.imagen()
	}

	method titular() {
		rolActual = titular
	}

	method suplente() {
		rolActual = suplente
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y())
	}

	method taquito() { 
		if (not game.colliders(self).isEmpty()) {
			const balon = game.uniqueCollider(self)
			balon.hacerTaquito()
		} 
	}
	
	method patear() {
		if (not game.colliders(self).isEmpty()){
			const pelota2= game.uniqueCollider(self)
			pelota2.cambiarPosicion((pelota.position().x()+3).min(game.width()-1))
		}
	}

	method camiseta() {
		self.validarCambiarCamiseta()
		self.cambiarCamiseta()
	}

	method validarCambiarCamiseta() {
		if ( self.position().x() != 0 ) {
			self.error( "Solo se puede cambiar si lionel está sobre el borde izquierdo" )
		}
	}

	method cambiarCamiseta() {
		if (rolActual == "titular"){
			rolActual = "suplente"
		} else {
			rolActual = "titular"
		}
	}

}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method hacerTaquito() {
		self.position(game.at(self.nuevoX(), self.position().y()))
	}

	method nuevoX() {
		return 0.max(self.position().x() - 2)
	}

	method cambiarPosicion(_nuevaPosition) {
	  	self.position(game.at(_nuevaPosition, self.position().y()))
	}
	
	method levantar(){
		game.colliders(lionel).contains(self) //compara posiciones
		position = game.at (self.position().x(), self.position().y() +1)
     	game.schedule(2000, { => position = game.at (self.position().x(), self.position().y() -1) })
	}	
}


