import wollok.game.*
import Jugador.katos

class Enemigo {
  var property position
  var vida
  var danio
  
  method pisable() = true

  method image()
  
  method danio() = danio
  
  method vida() = vida
  
  method recibirDanio(unValor) {
    vida = 0.max(vida - unValor)
    if (vida == 0) game.removeVisual(self)
  }
  
  method colision() {
    self.recibirDanio(katos.danio())
    katos.recibirDanio(self.danio())
  }
}

class Basico inherits Enemigo (vida = 5, danio = 1) {
  override method image() = "enemigo.png"
}

class Top inherits Enemigo (vida = 10, danio = 3) {
  override method image() = "enemigoFuerte.png"
}