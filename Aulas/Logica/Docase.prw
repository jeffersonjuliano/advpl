#include 'protheus.ch'
#include 'parmtype.ch'

user function Docase()

	Local cData := "20/12/207"
	
	Do Case 
		Case cData == "20/12/207"
		Alert("N�o � Natal " + cData)
		
		Case cData == "25/12/2017"
		Alert("� Natal")
		
		OtherWise //Caso nenhuma das op��es sejam verdadeiras
		MsgAlert("N�o sei qual dia � hoje!")
		
	EndCase
	
	
return