#INCLUDE "TOTVS.CH"

User Function CADMARC2()

	//axCadastro("ZA0")
	getTela()

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

Static Function grvMarca( cCodigo, cDesc )

dbSelectArea( "ZA0" )

if ( recLock( "ZA0", .T. ) )

	ZA0->ZA0_FILIAL := fwxFilial( "ZA0" )
	ZA0->ZA0_ID := cCodigo
	ZA0->ZA0_DESC := cDesc
	
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