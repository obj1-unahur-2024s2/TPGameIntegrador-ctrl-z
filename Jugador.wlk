import wollok.game.*


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

object espada{
  method image() = "espadita"
  var property position = game.origin().right(7)
  var property dano = 10
}

object llave {
  method image() = "llave.png"
  var property position = game.origin().up(1)
}

object enemigo {
  var property position = game.center()
  var property vida = 10
  var property dano = 5
  
  method image() = "maloso"

  method quitarVida(unValor){
    vida -= unValor
    if (vida <= 0){
      game.removeVisual(self)
    }
  }
}

object puerta{
  method image() = "puertita"
  var property position = game.origin().up(8).right(7) 
  var property puedeAbrir = false

  method katosPuedeAbrir(){
    if (katos.inventario.contains(llave)){
      puedeAbrir = true
    }
  }
}


    
