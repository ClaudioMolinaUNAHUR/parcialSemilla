class Planta{
	var property anioObtencion
	var property altura
	method toleraHorasSol()
	method esFuerte(){
		return self.toleraHorasSol() > 10
	}
	method daNuevasSemilla(){
		return self.esFuerte() or self.condicionAlternativa()
	}
	method espacioOcupado()
	method condicionAlternativa()
	method esIdeal(unaParcela)
}
class Menta inherits Planta{
	override method toleraHorasSol() = 6
	override method condicionAlternativa() = altura > 0.4
	override method espacioOcupado() = altura*3
	override method esIdeal(unaParcela) = unaParcela.superficie() > 6
}
class Soja inherits Planta{
	override method toleraHorasSol(){
		return if (altura < 0.5){
			6
		}else if(altura.between(0.5 , 1)){
			7
		}else{
			9
		}
	}
	override method condicionAlternativa() = anioObtencion > 2007 && altura > 1
	override method espacioOcupado() = altura/2
	override method esIdeal(unaParcela) = unaParcela.horasDeSol() == self.toleraHorasSol()
}
class Quinoa inherits Planta{
	var property toleraHorasSol
	override method espacioOcupado() = 0.5
	override method condicionAlternativa() = anioObtencion < 2005
	override method esIdeal(unaParcela) = unaParcela.sonTodasMenoresA(1.5)
}
class SojaTransgenica inherits Soja{
	override method daNuevasSemilla() = false
	override method esIdeal(unaParcela) = unaParcela.maximoDePlantasToleradas() == 1
}
class Hierbabuena inherits Menta{
	override method espacioOcupado() = super()*2
}