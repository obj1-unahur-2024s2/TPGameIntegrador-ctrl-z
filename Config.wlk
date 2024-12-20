import wollok.game.*
import Jugador.*
import NPC.*
import Items.*
import niveles.*
import dialogos.*

object gameManager {
  var nivel = niveles.nivel0
  var muertes = 0
 
  method startGame() {
    game.width(15)
    game.height(15)
    game.cellSize(32)
    game.boardGround("escenario.png")
    self.nivel().start()
    game.title("katos")
    self.keyConfig()
  }
  
  method muertes() = muertes
  
  method nivel(unNivel) {
    nivel = unNivel
  }
  
  method nivel() = nivel
  
  method keyConfig() {
    keyboard.up().onPressDo({ katos.mover(arriba) })
    keyboard.down().onPressDo({ katos.mover(abajo) })
    keyboard.left().onPressDo({ katos.mover(izquierda) })
    keyboard.right().onPressDo({ katos.mover(derecha) })
  }
  
  method cambiarNivel() {
    katos.limpiarInventario()
    nivel.cambiarNivel()
  }
  
  method terminarJuego() {
    muertes += 1
    nivel.clearGame()
    nivel = niveles.nivelM
    nivel.start()
  }
}

class Direccion {
  method siguiente(position)
}

object izquierda inherits Direccion {
  override method siguiente(position) = position.left(1)
  
  method opuesto() = derecha
}

object derecha inherits Direccion {
  override method siguiente(position) = position.right(1)
  
  method opuesto() = izquierda
}

object abajo inherits Direccion {
  override method siguiente(position) = position.down(1)
  
  method opuesto() = arriba
}

object arriba inherits Direccion {
  override method siguiente(position) = position.up(1)
  
  method opuesto() = abajo
}