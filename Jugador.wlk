import wollok.game.*
import NPC.*
import Items.*

object katos {
  var property vida = 6
  var property dano = 5
  const property inventario= []
  method image() = "katos.png"
  var property position = game.origin().up(6).right(7)
  
  method agregarAlInventario(unObjeto){
    inventario.add(unObjeto)
    game.removeVisual(unObjeto)
  }

  method tieneArma(unArma){
    if (inventario.contains(unArma)){
      dano +=  unArma.dano()
    }
  }

  method agregarYValidarItem(unItem){
    self.agregarAlInventario(unItem)
    self.tieneArma(unItem)
  }

  method tocarItem(unItem){
    game.onCollideDo(unItem, {katos => katos.agregarYValidarItem(unItem)})
  }

  method perderVida(unValor){
    vida -= unValor
    if (vida <= 0){
      game.removeVisual(self)
    }
  }
}
