#include "protheus.ch"

//----------------------------------------------------------
/*/{Protheus.doc} CadMarca
//Função para cadastro de Marca do projeto Estacimaneto
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
//Função de Validação do campo ID Marca
@author hermes

@since 10/08/2019
@version 1.0
@return ${return}, ${return_description}

@type function
/*/
//-----------------------------------------------
User Function FVldMarc()

	Local lRetorno := .T.
	
	// criar uma regra que me fala se pode ou não continuar
	//Pode ser usada a função ExistChav("ZA0",M->ZA0_ID)
	dbSelectArea("ZA0")
	dbSetOrder( 1 )
	If dbSeek( FWxFilial("ZA0") + M->ZA0_ID )
	
		lRetorno := .F.
		Alert( "Já existe registro com este código. Para a Marca: " +  ZA0->ZA0_DESC  )

	EndIf

Return lRetorno


/*
User Function CadMarca()
	
	Alert( "Hello Word" )
	
	Alert( "Irei chamar a segunda FUNÇÃO" )
	
	U_FTESTE1()

Return
*/