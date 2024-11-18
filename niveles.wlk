import wollok.game.*
import prueba.*
import Jugador.*
import Items.*
import NPC.*


class Nivel {
  var property objetos = [Jugador.katos]
  const posicionInicial
  const posicionSalida
  
  method inicializarObjetos() {
    objetos.forEach({ o => game.addVisual(o) })
    game.onCollideDo(Jugador.katos, { e => e.colision() })
  }
  
  method instanciarElementos() {
    Jugador.katos.position(posicionInicial)
    self.paredes()
  }
  
  method start() {
    prueba.gameManager.keyConfig()
    self.instanciarElementos()
    self.inicializarObjetos()
  }
  
  method cambiarNivel() {
  }

  method clearGame() {
		game.allVisuals().forEach({ visual => game.removeVisual(visual) })
	}
  
  method paredes() {
    //	PAREDES
    const ancho = game.width() - 1
    const largo = game.height() - 1
    
    const posicionesParedes = []
    (0 .. ancho).forEach(
      { n => posicionesParedes.add(new Position(x = n, y = 0)) }
    ) // bordeAbajo
    
    (0 .. ancho).forEach(
      { n => posicionesParedes.add(new Position(x = n, y = largo)) }
    ) // bordeArriba 
    
    (0 .. largo).forEach(
      { n => posicionesParedes.add(new Position(x = 0, y = n)) }
    ) // bordeIzq 
    
    (0 .. largo).forEach(
      { n => posicionesParedes.add(new Position(x = ancho, y = n)) }
    ) // bordeDer
    
    posicionesParedes.forEach({ pos => objetos.add(new Pared(position = pos)) })
  }
}

object nivel1 inherits Nivel (
  posicionInicial = game.at(1, 1),
  posicionSalida = game.at(7, 11)
) {
  override method instanciarElementos() {
    super()
    objetos.add(Items.espada)
    objetos.add(new Llave(position = game.at(5, 2)))
    objetos.add(new Salida(position = posicionSalida))
    objetos.add(new Basico(position = game.at(5, 9)))
    objetos.add(new Top(position = game.at(7, 9)))
  }
  
  override method cambiarNivel() {
    self.clearGame()
    prueba.gameManager.nivel(niveles.nivel2)
    console.println("nivel 2!")
    gameManager.nivel().start()
  }

  
}

object nivel2 inherits Nivel (
  posicionInicial = game.at(7, 11),
  posicionSalida = game.at(2, 2)
) {
  override method instanciarElementos() {
    objetos.add(new Llave(position = game.at(5, 2)))
    objetos.add(new Salida(position = posicionSalida))
    objetos.add(new Basico(position = game.at(5, 9)))
    objetos.add(new Top(position = game.at(7, 9)))
    super()
  }
  
  override method cambiarNivel() {
  }
}