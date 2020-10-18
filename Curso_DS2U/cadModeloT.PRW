#INCLUDE "TOTVS.CH"

User Function CADMODT()

	//axCadastro("ZA1")
	getTela2()

Return

Static Function getTela2()

Local oDlg
Local cTitulo := "Cadastro de Modelos"
Local oFont := TFont():New('Courier new',,-18,.T.)
Local oSay
Local oGet
Local cCodigo
Local cDesc
Local cCodigoM
Local cDescM

clear( @cCodigo, @cDesc, @cCodigoM, @cDescM )

DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 280,300 PIXEL
 	
	@ 005,005 SAY oSay PROMPT 'Código Modelo' SIZE 200,10 OF oDlg PIXEL
	@ 015,005 GET oGet VAR cCodigo SIZE 040,12 OF oDlg PIXEL VALID vldID( cCodigo )
	
	TSay():New( 030, 005,{|| "Descrição Modelo" },oDlg,,,,,,.T.,CLR_BLACK,CLR_WHITE,100,12)
	TGet():New( 040, 005, { | u | If( PCount() == 0, cDesc, cDesc := u ) },oDlg,100, 012, "@!",, 0, 16777215,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F. ,,"cDesc",,,,  )
	
	@ 055,005 SAY oSay PROMPT 'Código Marca' SIZE 200,10 OF oDlg PIXEL
	@ 065,005 MSGET oGet VAR cCodigoM SIZE 040,12 OF oDlg F3"ZA0" PIXEL //VALID vldID( cCodigoM )
	//@065,005 GET oGet VAR M->ZA1_IDMARC F3 "ZA0" valid IDMARC(M->ZA1_IDMARC) SIZE 040, 100
		
	TSay():New( 080, 005,{|| "Descrição Marca" },oDlg,,,,,,.T.,CLR_BLACK,CLR_WHITE,130,12)
	TGet():New( 090, 005, { | u | If( PCount() == 0, cDescM, cDescM := u ) },oDlg,100, 012, "@!",, 0, 16777215,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F. ,,"cDescM",,,,  )

	//@060,005 BUTTON "Cancelar" SIZE 040, 015 PIXEL OF oDlg ACTION ( oDlg:End() )
	//TButton():New( 060, 100, "Confirmar",oDlg,{|| oDlg:End() }, 40,15,,,.F.,.T.,.F.,,.F.,,,.F. )
	DEFINE SBUTTON FROM 120, 005 TYPE 1 ACTION ( grvMarca( cCodigo, cDesc, cCodigoM ), clear( @cCodigo, @cDesc, @cCodigoM, @cDescM ) ) ENABLE OF oDlg
	DEFINE SBUTTON FROM 120, 100 TYPE 2 ACTION ( oDlg:End() ) ENABLE OF oDlg

ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function grvMarca( cCodigo, cDesc, cCodigoM )

dbSelectArea( "ZA1" )

if ( recLock( "ZA1", .T. ) )

	ZA1->ZA1_FILIAL := fwxFilial( "ZA1" )
	ZA1->ZA1_IDMODE := cCodigo
	ZA1->ZA1_DMODEL := cDesc
	ZA1->ZA1_IDMARC := cCodigoM
	
	ZA1->( msUnLock() )

endif

Return

Static Function clear( cID, cDesc, cIDM, cDescM )

cID := space( tamSX3( "ZA1_IDMODE" )[1] )
cDesc := space( tamSX3( "ZA1_DMODEL" )[1] )
cIDM := space( tamSX3( "ZA1_IDMARC" )[1] )
cDescM := space( tamSX3( "ZA1_DMARCA" )[1] )

Return

Static Function vldID( cCodigo )

Local lRet := .T.

dbSelectArea( "ZA1" )
ZA0->( dbSetOrder( 1 ) )

if ( dbSeek( fwxFilial("ZA1") + cCodigo ) )
	lRet := .F.
	alert( "ID já existe no cadastro de Marcas!" )
endif

Return lRet