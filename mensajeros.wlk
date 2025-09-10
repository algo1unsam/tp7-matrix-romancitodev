// mensajeros.wlk
// mensajeros.wlk
// mensajeros.wlk
// mensajeros.wlk
// mensajeros.wlk
object morfeo {
  var property transporte = camion
  var property destinos = #{}
  const peso = 90
  var property puedeLlamar = false
  
  method agregarDestino(destino) {
    destinos.add(destino)
  }
  
  method peso() = peso + transporte.peso()
}

object trinity {
  var property transporte = camion
  var property destinos = #{}
  const peso = 900
  var property puedeLlamar = true
  
  method agregarDestino(destino) {
    destinos.add(destino)
  }
  
  method peso() = peso + transporte.peso()
}

object neo {
  var property transporte = camion
  var property destinos = #{puente}
  const peso = 0
  var property puedeLlamar = false
  
  method agregarDestino(destino) {
    destinos.add(destino)
  }
  
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
  ) = (pago && mensajero.destinos().contains(destino)) && destino.dejarPasar(
    mensajero
  )
}

object paquetito {
  var property peso = 0
  const property pago = true
  var property destino = null
  
  method estaPago() = pago
  
  method pagar() {
    
  }
  
  method puedeSerEntregadoPor(
    mensajero
  ) = pago && (mensajero.destino() == destino)
}

object paqueton {
  const property destinos = #{}
  var property peso = 0
  var property pago = false
  var property precio = 50
  
  method estaPago() = precio <= 0
  
  method pagar() {
    pago = true
  }
  
  method pagar(valor) {
    precio -= valor
  }
  
  method puedeSerEntregadoPor(mensajero) = pago && destinos.contains(
    mensajero.destino()
  )
}