#include 'protheus.ch'
#include 'parmtype.ch'

/*/{Protheus.doc} Escopo1
//TODO Descrição auto-gerada.
@author jeffe
@since 26/01/2020
@version 1.0
@return ${return}, ${return_description}

@type function
/*/

	Static cStat := ''

user function Escopo1()
	
	//Variaveis  locais
	Local nVar0 := 1
	Local nVar1 := 20
	
	//Variaveis Private
	Private cPri := 'private!'
	
	//Variaveis Publicas
	Public __cPublic := 'RCTI'

	
	TestEsc(nVar0, @nVar1)
	
return

	//Função Static 
	
Static Function TestEsc(nValor1, nValor2)
	
		Local __cPublic := 'Alterei'
		Default nValor1 := 0 //nValor1 será sempre 0
		//Alterando conteúdo da Variavel
		nValor2 := 10
		
		//Mostrar conteudo da variavel private
		Alert("Private: " + cPri)
		
		//Alterar Valor da variavel public
		Alert("Publica: " + __cPublic)
		
		MsgAlert(nValor2)
		Alert ("Variavel Static " + cStat)
		
	
return