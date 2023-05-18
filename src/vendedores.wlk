import mapa.*
import centrosDeDist.*

class VendedorFijo{
	const property ciudad
	const certificaciones=[]
	
	method esPersonaFisica()=true
	method puedeTrabajar(unaCiudad)=unaCiudad.equals(ciudad)
	
	
	method agregarCertificacion(cert){certificaciones.add(cert)}
	
	method esVersatil()=certificaciones.size()>=3 and certificaciones.any({c=>c.esProducto()})
		and certificaciones.any({c=>not c.esProducto()})
		
	method esFirme()=certificaciones.sum({c=>c.puntos()})>=30
	
	method esInfluyente()=ciudad.size()
	
	 method tieneAfinidadPorCentro(unCentro)=unCentro.ciudad()==ciudad
	 
	 	method cantidadCertificaciones()=certificaciones.size()
	 
	 
	 method esVendedorCandidatoPara(unCentro)= self.esVersatil() and self.tieneAfinidadPorCentro(unCentro)
	
}

class Viajante{
	var property provinciasHabilitadas=#{}
	var property certificaciones=[]
	var property ciudad=[]
	
	method esPersonaFisica()=true
	method puedeTrabajar(unaCiudad)=provinciasHabilitadas.contains(unaCiudad.provincia())
	
	method cantidadCertificaciones()=certificaciones.size()
	
	method agregarCertificacion(cert){certificaciones.add(cert)}
	
	method esVersatil()=certificaciones.size()>=3 and certificaciones.any({c=>c.esProducto()})
		and certificaciones.any({c=>not c.esProducto()})
		
	method esFirme()=certificaciones.sum({c=>c.puntos()})>=30
	
	method tieneAfinidadPorCentro(unCentro)=provinciasHabilitadas.contains(unCentro.ciudad())
	
	method esVendedorCandidatoPara(unCentro)= self.esVersatil() and self.tieneAfinidadPorCentro(unCentro)
	
}

class ComercioCorresponsal{
	const property sucursales=#{}
	var property certificaciones=[]
	const property ciudad=sucursales
	
	
	method esPersonaFisica()=false
	method puedeTrabajar(unaCiudad)=sucursales.contains({s=>s.provincia()})
	method agregarCertificacion(cert){certificaciones.add(cert)}
	
	method esVersatil()=certificaciones.size()>=3 and certificaciones.any({c=>c.esProducto()})
		and certificaciones.any({c=>not c.esProducto()})
	
	method esGenerico()=certificaciones.any({ c=> not c.esProducto()})
	
	method puntosTotalesPorCertificacion()=certificaciones.sum({c=>c.puntos()})
	
	method cantidadCertificacionesDeProductos()=certificaciones.esProducto().size()
		
	method esFirme()= self.puntosTotalesPorCertificacion()>=30
		
	method esInfluyente()=sucursales.size()>=5 or self.provinciaDeCiudades().size()>=3
	
	method provinciaDeCiudades()=sucursales.map({c=>c.provincia()}).asSet()
	
	method tieneAfinidadPorCentro(unCentro)=self.puedeTrabajar(unCentro.ciudad()) and sucursales.any({c=>not unCentro.puedeCubrir(sucursales)})
	
	method esVendedorCandidatoPara(unCentro)= self.esVersatil() and self.tieneAfinidadPorCentro(unCentro)
}

class Certificacion{
	var property puntos=0 //cantpuntos
	var property esProducto //booleano
	
}