import wollok.game.*
import Jugador.*
import NPC.*
import Items.*


object puerta{
  method image() = "puertita"
  var property position = game.origin().up(8).right(7) 
  var property puedeAbrir = false

  method katosPuedeAbrir(){
    if (katos.inventario.contains(Items.llave)){
      puedeAbrir = true
    }
  }
}