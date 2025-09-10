import mensajeros.*

object mensajeria {
  const property mensajeros = #{}
  
  method contratar(_mensajero) {
    mensajeros.add(_mensajero)
  }
  
  method despedir(_mensajero) {
    mensajeros.remove(_mensajero)
  }
  
  method despedirATodos() {
    mensajeros.clear()
  }
  
  method esMensajeriaGrande() = mensajeros.size() > 2
  
  method primerEmpleadoPuedeEntregar() = paquete.puedeSerEntregadoPor(
    mensajeros.asList().first()
  )
  
  method pesoDelUltimoEmpleado() = mensajeros.asList().last().peso()
}