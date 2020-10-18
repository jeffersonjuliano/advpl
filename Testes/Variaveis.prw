#Include "Protheus.ch"

#Define STR_PULA	Chr(13)+Chr(10) //Pula linha em um alert
#Define STR_TITULO	'Resultado de fórmula' //Título da mensagem de alerta

/*/{Protheus.doc} zteste2
//TODO Descrição auto-gerada.
@author Jefferson
@since 11/09/2018
@version undefined

@type function
/*/
User function zteste2()
Local aArea := GetArea()

	//Declaração de variáveis
	Local nValor := 0
	Local dData := Date()

	//Executando o bloco de código
	
		nValor := 10 + 10
		Alert("Resultado " + cValToChar(nValor) + " " + cValToChar(dData), STR_TITULO)


		RestArea(aArea)
Return
