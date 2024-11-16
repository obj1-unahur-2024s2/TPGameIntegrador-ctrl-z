import wollok.game.*
import NPC.*
import items.*

object katos {
  var property vida = 6
  var property dano = 5
  const property inventario = []
  var property position = game.at(7, 6)
  
  method image() = "katos.png"
  
  method mover(direccion) {
    if (game.getObjectsIn(direccion.siguiente(self.position())).pisable()) {
      position = direccion.siguiente(self.position())
      //cambiar imagen a katos_DIRECCION.png
    }
  }
  
  method agregarAlInventario(unObjeto) {
    inventario.add(unObjeto)
    game.removeVisual(unObjeto)
  }
  
  method tieneArma(unArma) {
    if (inventario.contains(unArma)) {
      dano += unArma.dano()
    }
  }
  
  method agregarYValidarItem(unItem) {
    self.agregarAlInventario(unItem)
    self.tieneArma(unItem)
  }
<<<<<<< HEAD
  
  method tocarItem(unItem) {
    game.onCollideDo(unItem, { katos => katos.agregarYValidarItem(unItem) })
=======

 method tocarItem(unItem){
  game.onCollideDo(unItem, {katos => katos.agregarYValidarItem(unItem)})
>>>>>>> 1c9ddaa5a11209a1a91564c886c55c9cddbf916e
  }
  
  method recibirDanio(unValor) {
    vida = 0.max(vida - unValor)
    if (vida == 0) Juego.gameManager.terminarJuego()
  }
<<<<<<< HEAD
  
  method tieneLlave() = inventario.any({ i => i.image() == "llave.png" })
}
=======

  method pelea(unEnemigo) {
    unEnemigo.quitarVida(self.dano())
    self.perderVida(unEnemigo.dano())
    
  } 
}

>>>>>>> 1c9ddaa5a11209a1a91564c886c55c9cddbf916e
