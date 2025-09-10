// mensajeria.wlk
import mensajeros.*

object mensajeria {
  const property mensajeros = #{}
  const property pendientes = #{}
  const property enviados = #{}
  
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
  
  method primerEmpleadoPuedeEntregar(paquete) = paquete.puedeSerEntregadoPor(
    mensajeros.asList().first()
  )
  
  method pesoDelUltimoEmpleado() = mensajeros.asList().last().peso()
  
  method puedeEntregar(paquete) = mensajeros.any(
    { m => paquete.puedeSerEntregadoPor(m) }
  )
  
  method mensajerosQuePuedenEntregar(paquete) = mensajeros.filter(
    { m => paquete.puedeSerEntregadoPor(m) }
  )
  
  method tieneSobrepeso() = (mensajeros.map(
    { m => m.peso() }
  ).sum() / mensajeros.size()) > 500
  
  method enviar(paquete) {
    if (not self.puedeEntregar(paquete)) {
      pendientes.add(paquete)
      return
    } else {
      enviados.add(paquete)
    }
  }
  
  method paquetesPendientes() = pendientes
  
  method paquetesEnviados() = enviados
  
  method facturacion() = enviados.fold(0, { acc, p => acc + p.precio() })
  
  method enviarTodos(paquetes) {
    paquetes.forEach({ paquete => self.enviar(paquete) })
  }
  
  method agregarPendiente(paquete) {
    pendientes.add(paquete)
  }
  
  method enviarMasCaroPendiente() {
    const masCaro = pendientes.max({ p => p.precio() })
    if (masCaro.precio() > 0) {
      self.enviar(masCaro)
      pendientes.remove(masCaro)
    }
  }
}