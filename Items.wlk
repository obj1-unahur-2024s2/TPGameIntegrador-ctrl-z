import prueba.*
import wollok.game.*
import Jugador.*

class Item {
  var property position
  var property danio = 0
  
  method image()
  
  method pisable() = true
  
  method colision() {
    katos.agregarYValidarItem(self)
    game.removeVisual(self)
  }
}

object espada inherits Item (position = game.at(6, 3),danio = 10) {
  override method image() = "espada.png"
}

class Llave inherits Item {
  override method image() = "llave.png"
}

class Salida inherits Item {
  override method image() = "puerta.png"
  
  override method colision() {
    if (katos.tieneLlave()){
      prueba.gameManager.cambiarNivel()
    }
  }
}

class Pared inherits Item {
  override method image() = "pared.png"
  
  override method pisable() = false
}