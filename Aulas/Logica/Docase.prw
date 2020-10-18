#include 'protheus.ch'
#include 'parmtype.ch'

user function Docase()

	Local cData := "20/12/207"
	
	Do Case 
		Case cData == "20/12/207"
		Alert("Não é Natal " + cData)
		
		Case cData == "25/12/2017"
		Alert("È Natal")
		
		OtherWise //Caso nenhuma das opções sejam verdadeiras
		MsgAlert("Não sei qual dia é hoje!")
		
	EndCase
	
	
return