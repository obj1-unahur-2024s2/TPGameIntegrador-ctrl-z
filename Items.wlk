import Juego.*
import wollok.game.*
import Jugador.*

class Item {
  var property position
  
  method image()
  
  method pisable() = true
  
  method colision() {
    katos.agregarYValidarItem(self)
    game.removeVisual(self)
  }
}

object espada inherits Item (position = game.origin().right(7)) {
  var property danio = 10
  
  override method image() = "espada.png"
}

class Llave inherits Item {
  override method image() = "llave.png"
}

class Salida inherits Item {
  override method image() = "puerta.png"
  
  override method colision() {
    Juego.gameManager.cambiarNivel()
  }
}

class Pared inherits Item {
  override method image() = "pared.png"
  
  override method pisable() = false
}