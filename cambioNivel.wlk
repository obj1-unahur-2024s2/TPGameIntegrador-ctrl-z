import wollok.game.*
import Jugador.*
import NPC.*
import items.*

<<<<<<< HEAD
object puerta {
  var property position = game.origin().up(8).right(7)
=======
object puerta{
  method image() = "puertita"
  var property position = game.origin().up(8).right(7) 
>>>>>>> 1c9ddaa5a11209a1a91564c886c55c9cddbf916e
  var property puedeAbrir = false
  
  method image() = "puertita"
  
  method katosPuedeAbrir() {
    if (katos.tieneLlave()) {
      puedeAbrir = true
    }
  }
}