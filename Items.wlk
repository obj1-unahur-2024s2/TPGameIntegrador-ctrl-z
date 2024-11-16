import wollok.game.*

class Item {
  var property image 
  var property position 
}

object espada inherits Item(image = "espadita", position = game.origin().right(7)) {
  var property dano = 10
}

object llave inherits Item(image = "llave.png", position = game.origin().up(1)) {
}
