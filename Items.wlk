import wollok.game.*
import Jugador.*

class Item {
<<<<<<< Updated upstream
  var property position
  
  method image()
  
  method colisionarConJugador() {
    katos.agregarYValidarItem(self)
    game.removeVisual(self)
  }
}

object espada inherits Item (position = game.origin().right(7)) {
  var property dano = 10
  
  override method image() = "espada.png"
}

object llave inherits Item (position = game.origin().up(1)) {
  override method image() = "llave.png"
}
=======
  var property image 
  var property position 
  
}

object espada {
  var property dano = 10
  var property position = game.at(7,6)
 method image() = "espadita"
}

object llave{
  var property position =game.at(1,1) 
  method image() = "llave.png"
}

>>>>>>> Stashed changes
