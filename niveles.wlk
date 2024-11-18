import wollok.game.*
import prueba.*
import Jugador.*
import Items.*
import NPC.*
import dialogos.*



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
  posicionSalida = game.at(1, 13)
) {
  override method instanciarElementos() {
    super()
    objetos.add(Items.espada)
    objetos.add(new PocionDeSalud(position = game.at(13, 4)))
    objetos.add(new PocionDeSalud(position = game.at(8, 7)))
    objetos.add(new PocionDeSalud(position = game.at(10, 7)))
    objetos.add(new PocionDeSalud(position = game.at(1, 12)))
    objetos.add(new PocionDeSalud(position = game.at(12, 12)))
    objetos.add(new Llave(position = game.at(13, 13)))
    objetos.add(new Salida(position = posicionSalida))
    objetos.add(new Basico(position = game.at(11, 4)))
    objetos.add(new Basico(position = game.at(11, 5)))
    objetos.add(new Top(position = game.at(12, 13)))
    objetos.add(new Top(position = game.at(13, 12)))
    objetos.add(new Top(position = game.at(2, 12)))
    objetos.add(new Top(position = game.at(2, 13)))
    objetos.add(new Basico(position = game.at(9, 9)))
    objetos.add(new Basico(position = game.at(9, 8)))
  }
  
  override method cambiarNivel() {
    self.clearGame()
    prueba.gameManager.nivel(niveles.nivel2)
    console.println("nivel 2!")
    gameManager.nivel().start()
  }

  override method paredes() {
    super()
    const nuevasParedes = []

    (0 .. 3).forEach({ n => nuevasParedes.add(new Position(x = n, y = 2 )) })
    (5 .. 6).forEach({ n => nuevasParedes.add(new Position(x = n, y = 2 )) })
    (2 .. 6).forEach({ n => nuevasParedes.add(new Position(x = 6, y = n )) })
    (8 .. 15).forEach({ n => nuevasParedes.add(new Position(x = n, y = 1 )) })
    (8 .. 15).forEach({ n => nuevasParedes.add(new Position(x = n, y = 2 )) })
    (8 .. 15).forEach({ n => nuevasParedes.add(new Position(x = n, y = 3 )) })
    (6 .. 15).forEach({ n => nuevasParedes.add(new Position(x = n, y = 6 )) })
    (6 .. 7).forEach({ n => nuevasParedes.add(new Position(x = n, y = 7 )) })
    (6 .. 7).forEach({ n => nuevasParedes.add(new Position(x = n, y = 8 )) })
    (6 .. 8).forEach({ n => nuevasParedes.add(new Position(x = n, y = 9 )) })
    (11 .. 15).forEach({ n => nuevasParedes.add(new Position(x = n, y = 7 )) })
    (11 .. 15).forEach({ n => nuevasParedes.add(new Position(x = n, y = 8 )) })
    (10 .. 15).forEach({ n => nuevasParedes.add(new Position(x = n, y = 9 )) })
    (3 .. 12).forEach({ n => nuevasParedes.add(new Position(x = 3, y = n )) })
    (3 .. 11).forEach({ n => nuevasParedes.add(new Position(x = 2, y = n )) })
    (3 .. 11).forEach({ n => nuevasParedes.add(new Position(x = 1, y = n )) })
    (3 .. 11).forEach({ n => nuevasParedes.add(new Position(x = n, y = 12 )) })
    (3 .. 12).forEach({ n => nuevasParedes.add(new Position(x = n, y = 11 )) })
    

    nuevasParedes.forEach({ pos => objetos.add(new Pared(position = pos)) })
  }
  
}

object nivel2 inherits Nivel (
  posicionInicial = game.at(7, 11),
  posicionSalida = game.at(2, 2)
) {
  override method instanciarElementos() {
    objetos.add(new Llave(position = game.at(5, 2)))
    objetos.add(new Salida(position = posicionSalida))
    objetos.add(new Basico(position = game.at(4, 9)))
    objetos.add(new Top(position = game.at(9, 9)))
    super()
  }
  
  override method cambiarNivel() {
    
  }
}

object nivel0 inherits Nivel (
  posicionInicial = game.at(7,7),
  posicionSalida = game.at(7, 2)
  ) {
  override method instanciarElementos() {
    objetos.add(new DialogoManager(text = "THE LEGEND OF KATOS",position = game.at(7, 13)))
    objetos.add(new DialogoManager(text = "utiliza las flechas direccionales para moverte
    suerte en tu aventura",position = game.at(7, 10)))
    objetos.add(new Llave(position = game.at(7, 3)))
    objetos.add(new Salida(position = posicionSalida))
    super()
  }
  
  override method cambiarNivel() {
    self.clearGame()
    prueba.gameManager.nivel(niveles.nivel1)
    console.println("nivel 1!")
    gameManager.nivel().start()
  }

  override method paredes() {
    super()
    const nuevasParedes = []

    (0 .. 5).forEach(
      { n => nuevasParedes.add(new Position(x = n, y = 4 )) }
    )

    (9 .. 15).forEach(
      { n => nuevasParedes.add(new Position(x = n, y = 4 )) }
    )

    nuevasParedes.forEach({ pos => objetos.add(new Pared(position = pos)) })
  }
}