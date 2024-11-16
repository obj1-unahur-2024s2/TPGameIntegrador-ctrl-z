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
  
  method tocarItem(unItem) {
    game.onCollideDo(unItem, { katos => katos.agregarYValidarItem(unItem) })
  }
  
  method recibirDanio(unValor) {
    vida = 0.max(vida - unValor)
    if (vida == 0) Juego.gameManager.terminarJuego()
  }
  
  method tieneLlave() = inventario.any({ i => i.image() == "llave.png" })
}