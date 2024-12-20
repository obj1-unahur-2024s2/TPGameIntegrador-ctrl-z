import Config.*
import wollok.game.*
import Jugador.*

class Item {
  var property position
  var property danio = 0
  
  method image()
  
  method pisable() = true

  method esItem() = true
  
  method colision() {
    katos.agregarYValidarItem(self)
    game.removeVisual(self)
  }
}

object espada inherits Item (position = game.at(13, 5), danio = 10) {
  override method image() = "espada.png"
}

class Llave inherits Item {
  override method image() = "llave.png"
}

class Salida inherits Item {
  override method image() = "puerta.png"
  
  override method colision() {
    console.println(katos.inventario())
    if (katos.tieneLlave()) Config.gameManager.cambiarNivel()
  }
}

class Pared inherits Item {
  override method image() = "pared.png"
  
  override method pisable() = false
}

class PocionDeSalud inherits Item {
  override method image() = "pocionDeVida.png"
  
  override method colision() {
    super()
    katos.curarVida(5)
  }
}

class Invisible inherits Item {
  override method image() = false
}