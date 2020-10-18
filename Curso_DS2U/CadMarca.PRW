#include "protheus.ch"
/*
User Function CadMarca() //Sempre 8 caracteres para nome de User Function - O sistema desconsidera tudo após os 8.
						 //Chamadas de função sempre U_nome da função
	Alert("Hello Word")	 //Static Function aceita até 10 caracteres				 
	Alert("Irei chamar a segunda função")
						 
	U_FTESTE1()
*/

//CTRD+ALT+D

/*/{Protheus.doc} CadMarca
//Função para cadastro de Marcas.
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
	
	//Criar regra que me fala se pode ou não continuar
	//Pode ser usada a função ExistChav("ZA0",M->ZA0_ID)
	dbSelectArea("ZA0")  
	dbSetOrder( 1 )
	If dbSeek( FWxFilial("ZA0") + M->ZA0_ID )
	
		lRetorno := .F.
		Alert ("Já existe registro com esse código. Para a Marca: " + ZA0->ZA0_DESC)
	
	Else
	
		lRetorno := .T.
		
	EndIf

Return lRetorno