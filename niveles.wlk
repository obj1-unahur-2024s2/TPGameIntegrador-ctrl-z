import wollok.game.*
import Juego.*
import Jugador.*
import items.*

class Nivel {
  const objetos = [Jugador.katos]
  const posicionInicial
  const posicionSalida
  
  method inicializarObjetos() {
    objetos.forEach({ o => game.addVisual(o) })
    game.whenCollideDo(katos, { e => e.colision() })
  }
  
  method instanciarElementos() {
    Jugador.katos.position(posicionInicial)
  }
  
  method start() {
    self.instanciarElementos()
    self.inicializarObjetos()
  }
  
  method cambiarNivel() {
    objetos.forEach({ o => game.removeVisual(o) })
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
  posicionSalida = game.at(7, 8)
) {
  override method instanciarElementos() {
    super()
    objetos.add(items.espada)
    objetos.add(new Llave(position = game.at(5, 2)))
    objetos.add(new Salida(position = posicionSalida))
  }
  
  override method cambiarNivel() {
    super()
    Juego.gameManager.nivel(nivel2)
    self.start()
  }
}

object nivel2 inherits Nivel (
  posicionInicial = game.at(1, 8),
  posicionSalida = game.at(2, 2)
) {
  override method instanciarElementos() {
    super()
    objetos.add(new Llave(position = game.at(5, 2)))
    objetos.add(new Salida(position = posicionSalida))
  }
  
  override method cambiarNivel() {
    super() //Juego.gameManager.nivel(nivel3)
    
    self.start()
  }
}