#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWBROWSE.CH"
#INCLUDE "FWMVCDEF.CH"

User Function CMCMVC()

	local alArea	:= ZA0->( getArea() )

	private oBrowse

	dbSelectArea("ZA0")

	oBrowse 	:= FWMBrowse():New()
	oBrowse:SetAlias("ZA0")
	oBrowse:SetDescription("Cadastro Marcas e Modelos")
	oBrowse:Activate()
	
	restArea( alArea )

Return

Static Function MenuDef()

	local alRotina := {}
	
	ADD OPTION alRotina TITLE "Pesquisar"	ACTION "PesqBrw"		OPERATION 1 ACCESS 0 // "Pesquisar"
	ADD OPTION alRotina TITLE "Visualizar"	ACTION "VIEWDEF.CMCMVC"	OPERATION 2 ACCESS 0 // "Visualizar"
	ADD OPTION alRotina TITLE "Incluir"		ACTION "VIEWDEF.CMCMVC"	OPERATION 3 ACCESS 0 // "Incluir"
	ADD OPTION alRotina TITLE "Alterar"		ACTION "VIEWDEF.CMCMVC"	OPERATION 4 ACCESS 0 // "Alterar"
	ADD OPTION alRotina TITLE "Excluir"		ACTION "VIEWDEF.CMCMVC"	OPERATION 5 ACCESS 0 // "Excluir" 

Return alRotina

Static Function ModelDef()

	local olModel
	local alRelation := {}
	local oStruZA0	:= FWFormStruct( 1, 'ZA0', { |x| .T.  }, /*lViewUsado*/ )
	//local oStruZA1	:= FWFormStruct( 1, 'ZA1', /*bAvalCampo*/, /*lViewUsado*/ )
	
	//-- Cria a estrutura basica	
	olModel := MPFormModel():New('MCADMVCM', /* bPreValidacao*/,/*bPosValidacao*/, /*bCommit*/, /*bCancel*/ )
	
	// Adiciona ao modelo uma estrutura de formulário de edição por campo
	olModel:AddFields( 'ZA0MASTER', /*cOwner*/, oStruZA0, /*bPreValidacao*/, /*bPosValidacao*/, /*bCarga*/ )
	
	// Adiciona ao modelo uma estrutura de formulário de edição por grid
	//olModel:AddGrid( 'ZA1DETAIL', 'ZA0MASTER', oStruZA1, /*bLinePre*/, /*bLinePost*/,/*bPreVal*/, /*bPosVal*/, /*B*/ )
	
	// Faz relaciomaneto entre os compomentes do model
	//AADD( alRelation, { 'ZA1_FILIAL', 'ZA0_FILIAL' } )
	//AADD( alRelation, { 'ZA1_IDMODE', 'ZA0_ID' } )
	
	//olModel:SetRelation( 'ZA1DETAIL', alRelation, ZA1->( IndexKey( 1 ) ) )
	
	olModel:SetDescription('Cadastro Marcas')
	olModel:getModel('ZA0MASTER' ):SetDescription('Cadastro Marcas')
	olModel:SetPrimaryKey({ "ZA0_FILIAL","ZA0_ID"}) 
	
	//olModel:getModel('ZA1DETAIL'):SetOptional( .F. )
	//olModel:getModel('ZA1DETAIL'):SetUniqueLine( {"ZA1_DESC"} )
	
	//olModel:SetActivate( /*{|olModel| cotaLoad( olModel ) }*/ )

Return olModel

Static Function ViewDef()

	// Cria um objeto de Modelo de Dados baseado no ModelDef do fonte informado
	local oStruZA0	:= FWFormStruct( 2, 'ZA0', /*{ |x|  }*/, /*lViewUsado*/ )
	//local oStruZA1	:= FWFormStruct( 2, 'ZA1' )
	
	// Cria a estrutura a ser usada na View
	local olModel    := FWLoadModel( 'CMCMVC' )
	local olView
	
	// Cria o objeto de View
	olView := FWFormView():New()

	// Define qual o Modelo de dados será utilizado
	olView:SetModel( olModel )

	//Adiciona no nosso View um controle do tipo FormFields(antiga enchoice)
	olView:AddField( 'VIEW_ZA0', oStruZA0, 'ZA0MASTER' )		
		
	//Adiciona no nosso View um controle do tipo FormGrid(antiga newgetdados)
	//olView:AddGrid( 'VIEW_ZA1', oStruZA1, 'ZA1DETAIL' )
	
	// Criar um "box" horizontal para receber algum elemento da view
	olView:CreateHorizontalBox( 'SUPERIOR', 100 )
	//olView:CreateHorizontalBox( 'INFERIOR', 80 )
	
	// Relaciona o ID da View com o "box" para exibicao
	olView:SetOwnerView( 'VIEW_ZA0', 'SUPERIOR' )
	//olView:SetOwnerView( 'VIEW_ZA1', 'INFERIOR' )
	
	//olView:EnableTitleView( 'VIEW_ZA1', 'Modelos' )
	
	//olView:SetViewProperty("VIEW_ZA1"	, "GRIDFILTER", {.T.})
	//olView:SetViewProperty("VIEW_ZA1"	, "GRIDSEEK", {.T.})
	
	//olView:AddUserButton("Marca Modelo","MAGIC_BMP",{|| U_AUTOCLI6() },"Comentário do botão 1")
	//olView:AddUserButton("Cliente ERRO","MAGIC_BMP",{|| U_AUTOCLI4() },"Comentário do botão 2")
	
//	olView:setCloseOnOk( {|| alert( "setCloseOnOk" ), .T. } )

Return olView