import wollok.game.*
import Config.*
import Jugador.*
import Items.*
import NPC.*
import dialogos.*



class Nivel {
  var property objetos = [Jugador.katos]
  const posicionInicial
  const posicionSalida
  var property atributos = [] 
  var property timers = []
  
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
    game.onTick(1000,"timer katos",{self.instanciarTimers()})
  }
  
  
  method cambiarNivel() {
  }

  method clearGame() {
		game.allVisuals().forEach({ visual => game.removeVisual(visual) })
    game.removeTickEvent("timer katos")
	}

method instanciarTimers() {
  katos.agregarTiempo()
  console.println(katos.timer().toString())
    // timers.forEach({ visual => game.removeVisual(visual) })
    timers = [
        new DialogoManager(text = "Tiempo :" + katos.timer().toString(), position = game.at(12, 3))
        ]
    timers.forEach({ visual => game.addVisual(visual) })
  }

  method instanciarAtributos() {
    atributos.forEach({ visual => game.removeVisual(visual) })
    atributos = [
        new DialogoManager(text = "Vida:" + katos.vida().toString(), position = game.at(12, 2)),
        new DialogoManager(text = "Daño:" + katos.danio().toString(), position = game.at(12, 1))
      ]
    atributos.forEach({ visual => game.addVisual(visual) })
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
  method instanciarPociones(listaPosiciones){
    listaPosiciones.forEach({pos=> objetos.add(new PocionDeSalud(position = pos))})
  }
  method instanciarEnemigosBasicos(listaPosiciones){
    listaPosiciones.forEach({pos=> objetos.add(new Basico(position = pos))})
  }
  method instanciarEnemigosTop(listaPosiciones){
    listaPosiciones.forEach({pos=> objetos.add(new Top(position = pos))})
  }
}

object nivel1 inherits Nivel (
  posicionInicial = game.at(1, 1),
  posicionSalida = game.at(1, 13)
) {
  override method instanciarElementos() {
    super()
    objetos.add(new Invisible(position = posicionInicial))
    objetos.add(Items.espada)
    objetos.add(new Llave(position = game.at(13, 13)))
    objetos.add(new Salida(position = posicionSalida))
    self.instanciarPociones([game.at(13, 4),game.at(8, 7),game.at(10, 7),game.at(1, 12),game.at(12, 12)])
    self.instanciarEnemigosBasicos([game.at(11, 4),game.at(11, 5),game.at(9, 9),game.at(9, 8)])
    self.instanciarEnemigosTop([game.at(12, 13),game.at(13, 12),game.at(2, 12),game.at(2, 13)])
  }
  
  override method cambiarNivel() {
    self.clearGame()
    Config.gameManager.nivel(niveles.nivel2)
    Config.gameManager.nivel().start()
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
  posicionInicial = game.at(1, 1),
  posicionSalida = game.at(13, 13)
) {
  override method instanciarElementos() {
    objetos.add(new Invisible(position = posicionInicial))
    objetos.add(new Llave(position = game.at(9, 11)))
    objetos.add(new Salida(position = posicionSalida))
    self.instanciarPociones([game.at(4, 13),game.at(4, 3),game.at(13, 11),game.at(13, 10),game.at(12, 11),game.at(12, 10),game.at(10, 2),game.at(9, 5),game.at(8, 4),game.at(8, 10)])
    self.instanciarEnemigosBasicos([game.at(2, 5),game.at(2, 7),game.at(2, 9),game.at(2, 11),game.at(13, 5),game.at(13, 6),game.at(5, 1),game.at(6, 1),game.at(7, 1),game.at(4, 9)])
    self.instanciarEnemigosTop([game.at(12, 13),game.at(11, 13),game.at(10, 13),game.at(3, 10),game.at(2, 10),game.at(1, 10),game.at(3, 8),game.at(2, 8),game.at(1, 8),game.at(3, 6),
    game.at(2, 6),game.at(1, 6),game.at(3, 4),game.at(2, 4),game.at(1, 4),game.at(13, 8),game.at(13, 7),game.at(9, 3),game.at(8, 3),game.at(7, 3),game.at(8, 4),game.at(7, 5),
    game.at(7, 4),game.at(9, 9),game.at(8, 9),game.at(7, 9),game.at(7, 11),game.at(7, 10),game.at(9, 4),game.at(8, 5),game.at(8, 11),game.at(9, 10)])
    super()
  }

   override method paredes() {
    super()
    const nuevasParedes = []

    (2 .. 15).forEach({ n => nuevasParedes.add(new Position(x = n, y = 12 )) })
    (0 .. 9).forEach({ n => nuevasParedes.add(new Position(x = n, y = 2 )) })
    (11 .. 15).forEach({ n => nuevasParedes.add(new Position(x = n, y = 1 )) })
    (11 .. 15).forEach({ n => nuevasParedes.add(new Position(x = n, y = 2 )) })
    (4 .. 12).forEach({ n => nuevasParedes.add(new Position(x = 4, y = n )) })
    (4 .. 9).forEach({ n => nuevasParedes.add(new Position(x = 12, y = n )) })
    (4 .. 12).forEach({ n => nuevasParedes.add(new Position(x = 11, y = n )) })
    (4 .. 12).forEach({ n => nuevasParedes.add(new Position(x = 10, y = n )) })
    (3 .. 10).forEach({ n => nuevasParedes.add(new Position(x = 6, y = n )) })
    (8 .. 10).forEach({ n => nuevasParedes.add(new Position(x = n, y = 6)) })
    (6 .. 8).forEach({ n => nuevasParedes.add(new Position(x = n, y = 8)) })



    nuevasParedes.forEach({ pos => objetos.add(new Pared(position = pos)) })
  }
  
  override method cambiarNivel() {
    self.clearGame()
    Config.gameManager.nivel(niveles.nivelF)
    Config.gameManager.nivel().start()
  }
}

object nivel0 inherits Nivel (
  posicionInicial = game.at(7,7),
  posicionSalida = game.at(7, 2)
  ) {
  override method instanciarElementos() {
    objetos.add(new Invisible(position = posicionInicial))
    objetos.add(new DialogoManager(text = "THE LEGEND OF KATOS",position = game.at(7, 13)))
    objetos.add(new DialogoManager(text = "Utiliza las flechas direccionales para moverte
    suerte en tu aventura",position = game.at(7, 10)))
    objetos.add(new Llave(position = game.at(7, 3)))
    objetos.add(new Salida(position = posicionSalida))
    super()
  }
  
  override method cambiarNivel() {
    self.clearGame()
    Config.gameManager.nivel(niveles.nivel1)
    Config.gameManager.nivel().start()
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

object nivelM inherits Nivel (
  posicionInicial = game.at(7,7),
  posicionSalida = game.at(4, 2)
  ) {
  override method instanciarElementos() {
    objetos.add(new Invisible(position = posicionInicial))
    objetos.add(new PocionDeSalud(position = game.at(7, 6)))
    objetos.add(new DialogoManager(text = "
    Busca cambiar tu destino
    La muerte te hace mas fuerte",position = game.at(7, 10)))
    objetos.add(new Llave(position = game.at(7, 3)))
    objetos.add(new Salida(position = posicionSalida))
    super()
  }
  
  override method cambiarNivel() {
    self.clearGame()
    Config.gameManager.nivel(niveles.nivel0)
    Config.gameManager.nivel().start()
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

object nivelF inherits Nivel (
  posicionInicial = game.at(7,7),
  posicionSalida = game.at(7, 2)
  ) {
  override method instanciarElementos() {
    objetos.add(new Invisible(position = posicionInicial))
    objetos.add(new DialogoManager(text = "THE LEGEND OF KATOS",position = game.at(7, 13)))
    objetos.add(new DialogoManager(text = "Gracias por jugar",position = game.at(7, 10)))
    objetos.add(new DialogoManager(text = "Tus muertes: " + Config.gameManager.muertes().toString(),position = game.at(7, 8)))
    objetos.add(new DialogoManager(text = "Tiempo de compleción: " + katos.timer().toString(),position = game.at(7, 7)))
    objetos.add(new Llave(position = game.at(7, 3)))
    objetos.add(new Salida(position = posicionSalida))
    super()
  }
  
  override method cambiarNivel() {
    game.stop()
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