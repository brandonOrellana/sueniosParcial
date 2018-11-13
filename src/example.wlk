class Carrera{
	var nombreCarrera 
	var property felicidad
	method darFelicidad(alguien){alguien.agregarFelicidad(felicidad)}
	method validacion(alguien){
		if(!alguien.esSuenio(self) || alguien.suenioCumplidos(self)){self.error("error")}
	}
}
class ViajarADestnoDeseado{var  property felicidad
	method darFelicidad(alguien){alguien.agregarFelicidad(felicidad)}
}
object tenerHijos{var property felicidad
	method darFelicidad(alguien){alguien.agregarFelicidad(felicidad)}
}
class Laburo{
	var property sueldo
	var property felicidad
	method darFelicidad(alguien){alguien.agregarFelicidad(felicidad)}
	method validacion(alguien){
		if (alguien.sueldoDeseado()>self.sueldo()){self.error("error")}
	}
}
class AdoptarHijo{
	var property felicidad
	method darFelicidad(alguien){alguien.agregarFelicidad(felicidad)}
	method validacion(alguien){
		if(alguien.hijos().isEmpty()){self.error("error")}
	}
}

 
class Persona{
	var property edad
	var property carreraDeseada
	var property sueldoDeseado
	var property destinoDeseado
	var hijos = []
	var sueniosQueCumplir = []
	var sueniosCumplidos = []
	var felicidad
	method cumplirSuenio(unSuenio){
		unSuenio.validacion(self)
		unSuenio.darFelicidad(self)
		sueniosQueCumplir.remove(unSuenio)
		sueniosCumplidos.add(unSuenio)
	}
	method agregarFelicidad(unaFelicidad){felicidad += unaFelicidad}
	method esSuenio(unSuenio){
		return sueniosQueCumplir.contains(unSuenio)
	}
	method suenioCumplido(unSuenio){
	return sueniosCumplidos.contains(unSuenio)
	}
	method hijos(){return hijos}
	method suenioMultiple(suenio1,suenio2,suenio3){
		self.cumplirSuenio(suenio1)
		self.cumplirSuenio(suenio2)
		self.cumplirSuenio(suenio3)
	}
	method esFeliz(){
		return felicidad > sueniosQueCumplir.sum({unSuenio=>unSuenio.felicidad()}) 
	}
	method esAmbiciosa(){
		var lista = sueniosQueCumplir + sueniosCumplidos
		return ((lista.size()>3) && (lista.sum({unSuenio=>unSuenio.felicidad()}) > 100))
	}
}

class PersonaRealista inherits Persona{
	method suenioMasDeseado(){
		self.cumplirSuenio(sueniosQueCumplir.max({unSuenio => unSuenio.filicidad()}))
	}
}
class PersonaAlocada inherits Persona{
	method suenioMasDeseado(){
		self.cumplirSuenio(sueniosQueCumplir.anyOne())
	}
}
class PersonaObsesiva inherits Persona{
	method suenioMasDeseado(){
		self.cumplirSuenio(sueniosQueCumplir.first())
	}
}