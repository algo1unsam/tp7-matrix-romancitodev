// mensajeros.wlk
// mensajeros.wlk
// mensajeros.wlk
object morfeo {
  var property transporte = camion
  var property destino = puente
  const peso = 90
  var property puedeLlamar = false
  
  method peso() = peso + transporte.peso()
}

object trinity {
  var property transporte = camion
  var property destino = puente
  const peso = 900
  var property puedeLlamar = true
  
  method peso() = peso + transporte.peso()
}

object neo {
  var property transporte = camion
  var property destino = puente
  const peso = 0
  var property puedeLlamar = false
  
  method peso() = peso + transporte.peso()
}

object camion {
  var property acoplados = 1
  const peso = 500
  
  method peso() = acoplados * peso
}

object monopatin {
  const property peso = 1
}

object puente {
  method dejarPasar(persona) = persona.peso() < 1000
}

object paquete {
  var property peso = 0
  var property pago = false
  var property destino = null
  
  method estaPago() = pago
  
  method pagar() {
    pago = true
  }
  
  method puedeSerEntregadoPor(
    mensajero
  ) = pago && (mensajero.destino() == destino)
}