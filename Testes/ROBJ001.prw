#include 'protheus.ch'
#include 'parmtype.ch'
#include 'TopConn.ch'

/*/{Protheus.doc} ROBJ001
//TODO Descrição auto-gerada.
@author Jefferson
@since 31/12/2018
@version 1.0
@return ${return}, ${return_description}

@type function
/*/

//Se for Espanhol
#Ifdef SPANISH
	#Define STR_TESTE 'É espanhol'
	#Define STR_TITULO 'Precaución'

//Se não
#Else

	//Se for 
	#Ifdef ENGLISH
		#Define STR_TESTE 'With great power'
		#Define STR_TITULO 'Caution'

	//Se nâo
	#Else
	 
		#Define STR_TESTE 'Português Porra!'
		#Define STR_TITULO 'Atenção'
	#Endif
#Endif

//Constante pula
#Define STR_PULA Chr(13)+Chr(10)

user function ROBJ001()
Local aArea := getArea()

MsgAlert(STR_TESTE + STR_PULA + "...", STR_TITULO)

RestArea(aArea)

return