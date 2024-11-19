import niveles.*
import dialogos.*
import wollok.game.*
import NPC.*
import Items.*
import Juego.*

object katos {
  var property vida = 6
  var property danio = 5
  const property inventario = []
  var property position = game.at(7, 6)
  
  method image() = "katos.png"
  
  method mover(direccion) {
    if (self.puedeMoverseA(direccion)) {
      position = direccion.siguiente(self.position())
      //cambiar imagen a katos_DIRECCION.png
    }
  }
  
  method puedeMoverseA(direccion) = game.getObjectsIn(
    direccion.siguiente(self.position())
  ).isEmpty() or game.getObjectsIn(direccion.siguiente(self.position())).all(
    { o => o.pisable() }
  )
  
  method agregarAlInventario(unObjeto) {
    inventario.add(unObjeto)
    game.removeVisual(unObjeto)
  }
  
  method tieneArma(unArma) {
    if (inventario.contains(unArma)) {
      danio += unArma.danio()
      self.actualizarAtributos()
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
    self.actualizarAtributos()
    if (vida == 0) Juego.gameManager.terminarJuego()
  }
  
  method curarVida(unValor) {
    vida += unValor
    self.actualizarAtributos()
  }
  
  method actualizarAtributos() {
    Juego.gameManager.nivel().instanciarAtributos()
  }
  
  method tieneLlave() = inventario.any({ i => i.image() == "llave.png" })
  
  method limpiarInventario() {
    inventario.filter({ i => i.image() != "espada.png" }).forEach(
      { i => inventario.remove(i) }
    )
  }
}