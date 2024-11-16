import Juego.*
import wollok.game.*


class Item {
<<<<<<< HEAD
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
=======
  var property image 
  var property position 
}

object espada inherits Item(image = "espadita", position = game.origin().right(7)) {
  var property dano = 10
}

object llave inherits Item(image = "llave.png", position = game.origin().up(1)) {
}
>>>>>>> 1c9ddaa5a11209a1a91564c886c55c9cddbf916e
