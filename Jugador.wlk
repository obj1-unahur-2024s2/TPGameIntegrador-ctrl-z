import wollok.game.*


object katos {
  method image() = "katos.png"
  var property position = game.origin().up(8).right(7)
  method tocaLlave(){
    game.onCollideDo(llave, game.say(self,"hola"))
  }
}

object llave {
  method image() = "llave.png"
  var property position = game.center()
}
    
