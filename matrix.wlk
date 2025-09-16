object neo {
method esElegido() = true
var property energia = 100
method saltar() {
    energia=energia/2
}
method vitalidad()= energia * 0.1 
}

object morfeo {
method esElegido() = false
var vitalidad = 8
var cansado = false
method saltar() {
    vitalidad = (vitalidad -1).max(0)
    cansado = !cansado
}
method vitalidad() = vitalidad
method estaCansado() = cansado
}

object trinity {
  method vitalidad() = 0
  method saltar() {
      }
  method esElegido() = false  
}

object nave {
  const pasajeros = #{neo, morfeo, trinity}
  method cantidadDePasajeros() = pasajeros.size()
  method pasajeroConMayorVitalidad() = pasajeros.max({p=>p.vitalidad()}) 
  method estaElElegido() = pasajeros.any({p=> p.esElegido()})
  method chocar() {
    pasajeros.forEach({p=>p.saltar()})
    pasajeros.clear()
  }
  method pasajerosQueNoSonElegidos() = pasajeros.filter({ p=> not p.esElegido()})

  method acelerar() {
    self.pasajerosQueNoSonElegidos().forEach({p=>p.saltar()})
  }
}

