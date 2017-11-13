object escuela {
	var profesores = []
	var estudiantes = []

	method esProfesor(alguien) 
		= profesores.contains(alguien)

	method agregarProfesor(alguien) {
		profesores.add(alguien)
	} 

	method agregarEstudiante(alguien) {
		estudiantes.add(alguien)
	}

}

class Estudiante{
	var platos
	constructor(_platos){
		platos = _platos
	}
	method puedeSalir() 
		= self.buenaOnda()
	
	method buenaOnda()

	method comer(cant){
		platos+=cant
	}
	method platos() = platos
}

class Deglutidor inherits Estudiante{
	var auto 
	constructor(platos,_auto)
		= super(platos){
			auto = _auto
	}
	override method buenaOnda() = auto and platos>20
	
}

class Critico inherits Estudiante{
	var horasTele
	constructor( platos, _horasTele)
		= super(platos){
			horasTele = _horasTele
	}
	override method buenaOnda() = horasTele >= 10*platos 

	method horasTele() = horasTele
	
}

class Gira{
	var casasDeComidas = []
	var personas = []
	
	method personas() = personas
	
	method agregarLugar(lugar){
		casasDeComidas.add(lugar)
	}
	method valeLaPena()
		= casasDeComidas.all{casa=>
			casa.valeLaPena(self.cantidadPersonas())}
			
	method sumarA(persona){
		if (!persona.puedeSalir())
			throw noPuedeIrDeGira 
		personas.add(persona)
	}
	method realizar(){
		personas.forEach{p=>p.comer(self.cantidadPersonas())}
	}
			
	method cantidadPersonas() = personas.size()
}

class Restaurante {
	var tenedores
	var chef
	constructor(_tenedores, _chef) {
		tenedores = _tenedores
		chef = _chef
	}
	method valeLaPena(_)
		= tenedores >=3 and chef.famosoOProfesor()
}

class RestauranteEtnico inherits Restaurante{
	var lugar
	constructor(tenedores, chef, _lugar)
		= super(tenedores, chef){
			lugar = _lugar
	}
	override method valeLaPena(_)
		= super(_) or lugar.exotico()
}

class Bodegon {
	var cantidadPlatos 
	constructor(platos){cantidadPlatos = platos}

	method valeLaPena(cantidadPersonas)
		= cantidadPlatos >= cantidadPersonas
}

class Chef{
	var famoso = true

	method cambiarFama() {famoso = !famoso} 
	
	method famosoOProfesor() 
		= famoso or escuela.esProfesor(self)
}

class Lugar{
	var exotico 
	constructor(_exotico){
		exotico = _exotico
	}
	method exotico() = exotico
}


object noPuedeIrDeGira inherits Exception{}

