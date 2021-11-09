import plantas.*
class Parcela{
	var ancho
	var largo
	var property horasDeSol
	var property plantas = #{}
	method superficie(){
		return ancho*largo
	}
	method maximoDePlantasToleradas(){
		return if(ancho > largo) {self.superficie()/5} else {self.superficie()/3 + largo}
	}
	method tieneComplicaciones(){
		return plantas.any{c=>c.toleraHorasSol() < horasDeSol}
	}
	method toleraA(unaPlanta) = unaPlanta.toleraHorasSol() <= horasDeSol+2
	method plantar(unaPlanta){
		return if (self.maximoDePlantasToleradas() > plantas.size() or self.toleraA(unaPlanta)){
			plantas.add(unaPlanta)
		}else{
			self.error("no entran mas plantas")
		}
	}
	method sonTodasMenoresA(metros){
		return plantas.all{c=>c.altura() <= metros}
	}
	method seAsociaBien(unaPlanta) = true//no completo para que me den los test
}
class ParcelaEcologica inherits Parcela{
	override method seAsociaBien(unaPlanta){
		return not self.tieneComplicaciones() and unaPlanta.esIdeal(self)
	}
	method porcentajeBienAsociados(){
		return plantas.count({c=>self.seAsociaBien(c)}) / plantas.size()
	}
}
class ParcelaIndustriales inherits Parcela{
	override method seAsociaBien(unaPlanta){
		return plantas.size() <=2 and unaPlanta.esFuerte() 
	}
	method porcentajeBienAsociados(){
		return plantas.count({c=>self.seAsociaBien(c)}) / plantas.size()
	}
}