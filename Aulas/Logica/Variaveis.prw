#include 'protheus.ch'
#include 'parmtype.ch'

/*/{Protheus.doc} Variaveis
//TODO Descri��o auto-gerada.
@author jeffe
@since 08/12/2019
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
user function Varia()

	Local nNum := 66
	Local lLogic := .T.
	Local cCarac := "String"
	Local dData := Date()
	Local aArray := {"Jo�o", "Maria", "Pedra"}
	Local bBloco := {|| nValor := 2, MsgAlert("O n�mero �: "+ cValtoChar(nValor))}
	
	Alert(nNum) 
	Alert(lLogic)
	Alert(cValtoChar(cCarac))
	Alert(dData)
	Alert(aArray[1])
	Eval(bBloco) //Para imprimir bloco de c�digos
		
	
return