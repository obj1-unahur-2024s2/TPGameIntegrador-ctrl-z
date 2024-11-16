import wollok.game.*

class Enemigo {
  var property position = game.center()
  var property vida = 10
  var property dano = 5
  
  method image() ="maloso"

  method quitarVida(unValor){
    vida -= unValor
    if (vida <= 0){
      game.removeVisual(self)
    }
  }
}

object enemigo1 inherits Enemigo() {
 
}