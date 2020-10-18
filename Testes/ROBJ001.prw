#include 'protheus.ch'
#include 'parmtype.ch'
#include 'TopConn.ch'

/*/{Protheus.doc} ROBJ001
//TODO Descri��o auto-gerada.
@author Jefferson
@since 31/12/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/

//Se for Espanhol
#Ifdef SPANISH
	#Define STR_TESTE '� espanhol'
	#Define STR_TITULO 'Precauci�n'

//Se n�o
#Else

	//Se for 
	#Ifdef ENGLISH
		#Define STR_TESTE 'With great power'
		#Define STR_TITULO 'Caution'

	//Se n�o
	#Else
	 
		#Define STR_TESTE 'Portugu�s Porra!'
		#Define STR_TITULO 'Aten��o'
	#Endif
#Endif

//Constante pula
#Define STR_PULA Chr(13)+Chr(10)

user function ROBJ001()
Local aArea := getArea()

MsgAlert(STR_TESTE + STR_PULA + "...", STR_TITULO)

RestArea(aArea)

return