import vendedores.*

class CentroDeDistribucion{
	var property ciudad
	var property vendedores=#{}
	
	
	
	method agregarVendedor(unVendedor){ 
		if (vendedores.contains(unVendedor)) 
			self.error("El vendedor ya está agregado")
		vendedores.add(unVendedor)
	}
	
	method vendedorEstrella()=vendedores.max({v=>v.puntosTotalesPorCertificacion()})
	
	method puedeCubrir(unaCiudad)=vendedores.any({v=>v.puedeTrabajar(unaCiudad)})
	
	method vendedoresGenericos()=vendedores.filter({v=> v.esGenerico()}).asSet()
	
	method esRobusto()=self.vendedoresFirmes()>=3
	
	method vendedoresFirmes()=vendedores.filter({v=>v.esFirme()}).size()
	
	method repartirCertificacion(unaCertificacion){vendedores.forEach({v=>v.agregarCertificacion(unaCertificacion)})}

}
