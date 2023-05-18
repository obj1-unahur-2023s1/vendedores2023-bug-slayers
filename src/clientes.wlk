import vendedores.*
class Cliente {
	method puedeSerAtendido()
	
	
}

class ClienteInseguro{
	
	method puedeSerAtendidoPor(unVendedor)=unVendedor.esVersatil()and unVendedor.esFirme()
}

class ClienteDetallista{
	
	method puedeSerAtendidoPor(unVendedor)=unVendedor.cantidadDeCertificacionesDeProductos()>=3
}

class ClienteHumanista{
	
	method puedeSerAtendidoPor(unVendedor)=unVendedor.esPersonaFisica()
}