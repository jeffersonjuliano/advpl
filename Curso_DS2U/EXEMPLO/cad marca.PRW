#include "protheus.ch"

//----------------------------------------------------------
/*/{Protheus.doc} CadMarca
//Fun��o para cadastro de Marca do projeto Estacimaneto
@author hermes

@since 10/08/2019
@version 1.0
@return ${return}, ${return_description}
@type function
/*/
//----------------------------------------------------------
User Function CadMarca()

	AxCadastro( "ZA0" , "Cadastros de Marcas" )
	
Return


//-----------------------------------------------
/*/{Protheus.doc} FVldMarc
//Fun��o de Valida��o do campo ID Marca
@author hermes

@since 10/08/2019
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
//-----------------------------------------------
User Function FVldMarc()

	Local lRetorno := .T.
	
	// criar uma regra que me fala se pode ou n�o continuar
	//Pode ser usada a fun��o ExistChav("ZA0",M->ZA0_ID)
	dbSelectArea("ZA0")
	dbSetOrder( 1 )
	If dbSeek( FWxFilial("ZA0") + M->ZA0_ID )
	
		lRetorno := .F.
		Alert( "J� existe registro com este c�digo. Para a Marca: " +  ZA0->ZA0_DESC  )

	EndIf

Return lRetorno


/*
User Function CadMarca()
	
	Alert( "Hello Word" )
	
	Alert( "Irei chamar a segunda FUN��O" )
	
	U_FTESTE1()

Return
*/