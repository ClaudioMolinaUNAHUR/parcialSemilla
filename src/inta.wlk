object inta {
	var parcelas = #{}
	method promedioDePlantas(){
		return parcelas.sum({c=>self.plantasPor(c)}) / parcelas.size()
	}
	method plantasPor(unaParcela){
		return unaParcela.plantas().size()
	}
	method masAutosustentable(){
		return parcelas.find({c=>self.plantasPor(c) > 4 && c.porcentajeBienAsociados()})
	}
}
