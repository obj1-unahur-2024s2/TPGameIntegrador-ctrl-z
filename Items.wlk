import wollok.game.*
import Jugador.*

class Item {
  var property position
  var property image
  
  
  method colisionarConJugador() {
    katos.agregarYValidarItem(self)
    game.removeVisual(self)
  }
}

object espada inherits Item (image= "espadita" ,position = game.origin().right(7)) {
  var property dano = 10
  
 
}

object llave inherits Item (image = "llave.png",position = game.origin().up(1)) {
 
}
