#include "protheus.ch"
/*
User Function CadMarca() //Sempre 8 caracteres para nome de User Function - O sistema desconsidera tudo ap�s os 8.
						 //Chamadas de fun��o sempre U_nome da fun��o
	Alert("Hello Word")	 //Static Function aceita at� 10 caracteres				 
	Alert("Irei chamar a segunda fun��o")
						 
	U_FTESTE1()
*/

//CTRD+ALT+D

/*/{Protheus.doc} CadMarca
//Fun��o para cadastro de Marcas.
@author Jefferson
@since 10/08/2019
@version 1.0
@return ${return}, ${return_description}

@type function
/*/

User Function CadMarca()
	
	AxCadastro("ZA0" , "Cadastro de Marcas" , )
	
Return

User Function FVLDMARC()
 
	Local lRetorno := .T.
	
	//Criar regra que me fala se pode ou n�o continuar
	//Pode ser usada a fun��o ExistChav("ZA0",M->ZA0_ID)
	dbSelectArea("ZA0")  
	dbSetOrder( 1 )
	If dbSeek( FWxFilial("ZA0") + M->ZA0_ID )
	
		lRetorno := .F.
		Alert ("J� existe registro com esse c�digo. Para a Marca: " + ZA0->ZA0_DESC)
	
	Else
	
		lRetorno := .T.
		
	EndIf

Return lRetorno