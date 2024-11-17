import wollok.game.*
import Jugador.*
import NPC.*
import Items.*

object puerta {
  var property position = game.origin().up(8).right(7)
  var property puedeAbrir = false
  
  method image() = "puertita"
  
  method katosPuedeAbrir() {
    if (katos.tieneLlave()) {
      puedeAbrir = true
    }
  }
}