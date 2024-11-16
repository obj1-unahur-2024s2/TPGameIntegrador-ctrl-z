import wollok.game.*
import Jugador.*

class Item {
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