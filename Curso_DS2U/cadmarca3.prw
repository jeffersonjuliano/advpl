#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"

User Function CADMARCA()

	//axCadastro("ZA0")
	//getTela()
	execMod3()
	//execMVC()

Return

Static Function getTela()

Local oDlg
Local cTitulo := "Cadastro de Marca"
Local oFont := TFont():New('Courier new',,-18,.T.)
Local oSay
Local oGet
Local cCodigo
Local cDesc

clear( @cCodigo, @cDesc )

DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 150,300 PIXEL
 	
	@ 005,005 SAY oSay PROMPT 'Código' SIZE 200,10 OF oDlg PIXEL
	@ 015,005 GET oGet VAR cCodigo SIZE 040,12 OF oDlg PIXEL VALID vldID( cCodigo )
	
	TSay():New( 030, 005,{|| "Descrição" },oDlg,,,,,,.T.,CLR_BLACK,CLR_WHITE,100,12)
	TGet():New( 040, 005, { | u | If( PCount() == 0, cDesc, cDesc := u ) },oDlg,100, 012, "@!",, 0, 16777215,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F. ,,"cDesc",,,,  )

	//@060,005 BUTTON "Cancelar" SIZE 040, 015 PIXEL OF oDlg ACTION ( oDlg:End() )
	//TButton():New( 060, 100, "Confirmar",oDlg,{|| oDlg:End() }, 40,15,,,.F.,.T.,.F.,,.F.,,,.F. )
	DEFINE SBUTTON FROM 060, 005 TYPE 1 ACTION ( grvMarca( cCodigo, cDesc ), clear( @cCodigo, @cDesc ) ) ENABLE OF oDlg
	DEFINE SBUTTON FROM 060, 100 TYPE 2 ACTION ( oDlg:End() ) ENABLE OF oDlg

ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function grvMarca( cCodigo, cDesc, nOpc )

Local lInc
Local lDel

dbSelectArea( "ZA0" )
ZA0->( dbSetOrder( 1 ) )

lInc := !ZA0->( dbSeek( fwxFilial( "ZA0" ) + cCodigo ) )
lDel := ( nOpc == 5 )

if ( recLock( "ZA0", lInc, lDel ) )

	if ( lDel )
	
		ZA0->( dbDelete() )
	
	else

		ZA0->ZA0_FILIAL := fwxFilial( "ZA0" )
		ZA0->ZA0_ID := cCodigo
		ZA0->ZA0_DESC := cDesc
		
	endif
	
	ZA0->( msUnLock() )

endif

Return

Static Function clear( cID, cDesc )

cID := space( tamSX3( "ZA0_ID" )[1] )
cDesc := space( tamSX3( "ZA0_DESC" )[1] )

Return

Static Function vldID( cCodigo )

Local lRet := .T.

dbSelectArea( "ZA0" )
ZA0->( dbSetOrder( 1 ) )

if ( dbSeek( fwxFilial("ZA0") + cCodigo ) )
	lRet := .F.
	alert( "ID já existe no cadastro de Marcas!" )
endif

Return lRet

Static Function execMod3()

	local cAlias		:= "ZA0"
	private cCadastro	:= "Cadastro de Marcas"
	private aRotina		:= {}

	AADD( aRotina, { "Pesquisar"	, "AxPesqui"	, 0, 1 })
	AADD( aRotina, { "Visualizar"	, "U_TELA"		, 0, 2 })
	AADD( aRotina, { "Incluir"		, "U_TELA"		, 0, 3 })
	AADD( aRotina, { "Alterar"		, "U_TELA"		, 0, 4 })
	AADD( aRotina, { "Excluir"		, "AxDeleta"	, 0, 5 })

	dbSelectArea( cAlias )
	dbSetOrder( 1 )

	mBrowse(6, 1, 22, 75, cAlias)

Return

User Function tela( cAlias, nReg, nOpc )

	local olDlg
	local alSize    	:= MsAdvSize()
	local olLayer1 		:= FWLayer():new()
	local cTudoOk		:= "AllwaysTrue"
	local lMemoria		:= .T.
	local lColumn		:= .F.
	local caTela		:= ""
	local lNoFolder		:= .F.
	local lProperty		:= .F.
	local cLinOk		:= "AllwaysTrue"
	local cTudoOk		:= "AllwaysTrue"
	local cIniCpos		:= ""
	local nFreeze		:= 000
	local nMax			:= 999
	local cFieldOk		:= "AllwaysTrue"
	local cSuperDel		:= "AllwaysTrue"
	local cDelOk 		:= "AllwaysTrue"
	
	private cCadastro	:= "Cadastro de Marcas"
	private aCpoEnch	:= {}
	private aAlterEnch	:= {}
	private aAlterGDa	:= {}
	private aHeader		:= {}
	private aCols		:= {}
	
	private aTELA[0][0]
	private aGETS[0]
	
	RegToMemory("ZA0", ( nOpc == 3 ), .T. )
	
	// Monta a estrutura dos arrays para o objeto MsMGet
	getMsMGet()
	
	// Prepara arrays aHeader e aCols do objeto MsNewGetDados
	getGrid( nOpc )

	DEFINE MSDIALOG olDlg TITLE cCadastro From alSize[7],0 To alSize[6],alSize[5] OF oMainWnd PIXEL
	
		olLayer1:init( olDlg,.T.)
		olLayer1:addCollumn('Col01',100,.T.)
		
		olLayer1:addWindow('Col01','C1_Win01',"Cabeçalho"	,40,.F.,.T.,{||  },,{||  })
		olLayer1:addWindow('Col01','C1_Win02',"Itens"		,60,.F.,.T.,{||  },,{||  })
		
		olMsmGet := MsmGet():New(	cAlias,;
									nReg,;
									nOpc,;
									/*aCRA*/,;
									/*cLetras*/,;
									/*cTexto*/,;
									aCpoEnch,;
									{0,0,0,0},;
									aAlterEnch,;
				   					3,;
				   					/*nColMens*/,;
				   					/*cMensagem*/,;
				   					cTudoOk,;
				   					olLayer1:getWinPanel('Col01','C1_Win01'),;
				   					/*lF3*/,;
				   					.T.)
				   					
	   	olMsmGet:oBox:align := CONTROL_ALIGN_ALLCLIENT
	   	
	   	oGetD:= MsNewGetDados():New(	0,0,0,0,;
	   									GD_INSERT + GD_UPDATE + GD_DELETE,;							
	   									cLinOk,;
	   									cTudoOk,;
	   									cIniCpos,;
	   									aAlterGDa,;
	   									nFreeze,;
	   									nMax,;
	   									cFieldOk,;
	   									cSuperDel,;							
	   									cDelOk,;
	   									olLayer1:getWinPanel('Col01','C1_Win02'),;
	   									aHeader,;
	   									aCols)
	   									
	   	oGetD:oBrowse:align := CONTROL_ALIGN_ALLCLIENT
	
	ACTIVATE MSDIALOG olDlg CENTER ON INIT EnchoiceBar(olDlg, {|| grvData( nOpc ), olDlg:End() }, {|| olDlg:End() },,)

Return

/*/{Protheus.doc} getMsMGet
Prepara arrays dos campos do objeto MsMGet
@author DS2U (SDA)
@since 08/12/2018
@version 1.0

@type function
/*/
Static Function getMsMGet()

	dbSelectArea("SX3")
	SX3->( dbSetOrder( 1 ) )
	
	if ( SX3->( dbSeek("ZA0") ) )
	
		while ( .not. SX3->( eof() ) .and. SX3->X3_ARQUIVO == "ZA0" )	
		
			if ( cNivel >= SX3->X3_NIVEL .And. X3Uso( SX3->X3_USADO ) )		
				AADD(aCpoEnch,SX3->X3_CAMPO)	
			endif	
			
			SX3->( dbSkip() )
		endDo
		
		aAlterEnch := aClone( aCpoEnch )
		
	endif
	
Return

Static Function getGrid( nOpc )

	local nUsado := 0
	local nX

	dbSelectArea("SX3")
	SX3->( dbSetOrder( 1 ) )
	dbSeek("ZA1")
	
	While !Eof() .And. SX3->X3_ARQUIVO == "ZA1"	
		
		If !(AllTrim(SX3->X3_CAMPO) $ "ZA1_FILIAL") .And. cNivel >= SX3->X3_NIVEL .And. X3Uso(SX3->X3_USADO)		
			AADD(aAlterGDa,SX3->X3_CAMPO)	
		EndIf	
		
		dbSkip()
	
	EndDo
	
	dbSelectArea("SX3")
	dbSeek("ZA1")
	
	aHeader:={}
	
	While !Eof() .And. (X3_ARQUIVO == "ZA1")	
	
		If X3USO(x3_usado).And.cNivel>=x3_nivel		
		
			nUsado := nUsado+1		
			AADD(aHeader,{	TRIM(X3_TITULO), X3_CAMPO, X3_PICTURE,;			
							X3_TAMANHO, X3_DECIMAL,"AllwaysTrue()",;			
							X3_USADO, X3_TIPO, X3_ARQUIVO, X3_CONTEXT } )	
							
		Endif	
		
		dbSkip()
	EndDo
	
	If nOpc == 3 // Incluir	
		
		aCols:={ Array(nUsado+1) }	
		aCols[1,nUsado+1]:=.F.	
		
		For nX:=1 to nUsado		
			aCols[1,nX]:= CriaVar( aHeader[nX,2] )		
		Next nX
		
	Else	
		
		aCols:={}	
		
		dbSelectArea("ZA1")	
		ZA1->( dbSetOrder( 3 ) ) // ZA1_FILIAL + ZA1_IDMARC
		
		if ( ZA1->( dbSeek( fwxFilial("ZA1") + M->ZA0_ID ) ) )	
		
			while ( .not. eof() .and. ZA1_IDMARC == M->ZA0_ID)		
			
				AADD(aCols,Array(nUsado+1))	
				
				For nX:=1 to nUsado			
					
					// Retorna informacao do conteudo do campo aHeader[nX,2]
					aCols[Len(aCols),nX] := FieldGet( FieldPos( aHeader[nX,2] ) )		
				
				Next nX		
				
				aCols[Len(aCols),nUsado+1] := .F.		
				
				dbSkip()	
			
			EndDo
			
		endif
		
	Endif

Retur

Static Function grvData( nOpc )

Local cCodigo
Local cDesc
Local nIndice
Local lInc

if ( nOpc == 3 .or. nOpc == 4 .or. nOpc == 5 )

	cCodigo := M->ZA0_ID
	cDesc   := M->ZA0_DESC
	
	dbSelectArea( "ZA1" )
	ZA1->( dbSetOrder( 1 ) )
	
	Begin Transaction
	
		// Grava cabeçalho
		grvMarca( cCodigo, cDesc, nOpc )
		
		// Grava itens (modelos)
		for nIndice := 1 To len( oGetD:aCols )
		
			lInc := !ZA1->( dbSeek( fwxFilial( "ZA1" ) + oGetD:aCols[nIndice][1] ) )
			lDel := ( nOpc == 5 ) .or. aTail( oGetD:aCols[nIndice] ) // Delete geral ou delete de linha
			
			// Maneira Paulo
			if !( lDel .and. lInc )
				if ( recLock( "ZA1", lInc, lDel ) )
				
					if ( lDel )
					
						ZA1->( dbDelete() )
				
					else
					
						ZA1->ZA1_FILIAL := fwxFilial( "ZA1" )
						ZA1->ZA1_ID := oGetD:aCols[nIndice][1]
						ZA1->ZA1_DESC := oGetD:aCols[nIndice][2]
						ZA1->ZA1_IDMARC := cCodigo
						
					endif
					
					ZA1->( msUnLock() )
				
				endif
			endif
			
		
//			if ( lDel .and. lInc ) // Cenario para quando a linha esta deletada e nao existe no banco
//				loop
//			else
//		
//				if ( recLock( "ZA1", lInc, lDel ) )
//				
//					if ( lDel )
//					
//						ZA1->( dbDelete() )
//				
//					else
//					
//						ZA1->ZA1_FILIAL := fwxFilial( "ZA1" )
//						ZA1->ZA1_ID := oGetD:aCols[nIndice][1]
//						ZA1->ZA1_DESC := oGetD:aCols[nIndice][2]
//						ZA1->ZA1_IDMARC := cCodigo
//						
//					endif
//					
//					ZA1->( msUnLock() )
//				
//				endif
//				
//			endif
			
		next nIndice
	
	End Transaction
	
endif

Return