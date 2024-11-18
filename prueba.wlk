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
    }
}

object gameManager {
  var  nivel = niveles.nivel1

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
    console.println("has muerto")
    game.stop() //un poco brutal
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
