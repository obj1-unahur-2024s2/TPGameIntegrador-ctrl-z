import wollok.game.*
import Jugador.*
import NPC.*
import Items.*
import niveles.*

object puebaGame {
    method inicio() {
      game.width(15)
      game.height(15)
      game.cellSize(30)
      game.boardGround("escenario.png")
      gameManager.nivel().start()
      console.println("empieza el juego")
      game.title("katos")
      prueba.gameManager.keyConfig()
      
    }
}

object gameManager {
  var  nivel = niveles.nivel0
  var muertes = 0

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
    nivel.cambiarNivel()
  }
  
  method terminarJuego() {
    muertes = muertes + 1
    console.println("has muerto")
    nivel.clearGame()
    nivel = niveles.nivelM
    console.println("nivel M!")
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
