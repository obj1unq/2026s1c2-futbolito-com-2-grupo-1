/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method patear() {
		if (not game.colliders(self).isEmpty()){
			const pelota2= game.uniqueCollider(self)
			pelota2.cambiarPosicion((pelota.position().x()+3).min(game.width()-1))
		}

	}

}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method cambiarPosicion(_nuevaPosition) {
	  self.position(game.at(_nuevaPosition, self.position().y()))
	}
}



