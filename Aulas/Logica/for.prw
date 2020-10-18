#include 'protheus.ch'
#include 'parmtype.ch'

user function for()
	
	Local nCount
	Local nNum := 0
	
	For nCount := 0 To 10 Step 2
	
		nNum += nCount
		Alert("Valor: " + cValToChar(nNum))
	
	Next
	
	Alert("Valor Total: " + cValToChar(nNum))
	
return