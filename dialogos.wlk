import wollok.game.*

class DialogoManager {
  var property text = String

  var property textColor = paleta.aqua()
  
  var property position = posicionDeDialogo.position()
}
object paleta {
  const property green = "00FF00FF"
  const property red = "FF0000FF"
  const property blue = "0000FFFF"
  const property yellow = "FFFF00FF"
  const property aqua = "00FFFFFF"
}

object posicionDeDialogo {
  method position() = game.at(2,1)
} 

