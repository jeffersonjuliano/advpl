#include 'protheus.ch'
#include 'parmtype.ch'

user function estrutur()

	Local nNum1 := 22
	Local nNum2 := 100
	
	if(nNum1 = nNum2)
		MsgInfo("A Variavel nNUm1 � igual a  nNum2")
	Elseif (nNUm1 > nNum2) 
		Alert("A Variavel � maior")
	Elseif (nNUm1 != nNum2)
		Alert("A variavel nNum1 � diferente de nNum2")
	Endif
	
		
return