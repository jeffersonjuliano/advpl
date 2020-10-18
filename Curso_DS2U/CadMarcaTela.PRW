#include Totvs.ch

User Function CadMarcaT()

getTela()

Return

Static Function getTela()

Local oDig
Local cTitulo := "Cadastro de Marca"
Local oFont := TFont() :New('Courier new',,-18,.T.)
Local oSay
Local oGet
//TODO
Local cCodigo := space ( tamSX3("ZA0_ID" )[1] ) //Capta o tamanho do campo na tabela SX3
Local cDesc := space ( tamSX3("ZA0_DESC" )[1] )

clear ( @cCodigo, @cDesc )

DEFINE MSDIAG oDig TITLE cTitulo FROM 000,000 TO 100,300 PIXEL

@ 005, 005 SAY oSay PRONPT 'Codigo' SIZE 200,20 OF oDig PIXEL
@ 015, 005 GET oGet VAR cPassW SIZE 040,12 OF oDig PIXEL //VALID !empty(cPassw) PASSWORD

Tsay() :New ( 026, 005, (|| "Descrição"), oDig,,,,,,.T.,CLR_BLACK,CLR_WHITE,100,12
Tget() :New ( 040, 005, (| u | If (Pcount() == 0, cDesc, cDesc := u ) ),oDig,100, 012, "@!",, 0, 16777215,,.F.,,.T.,,)

//075,005 BUTTON "Cancelar" SIZE 080,047 PIXEL OF oDig ACTION (oDig:End())
//TButton() :New(060 100, "Confirmar",oDig,(|| oDig:End()), 40,10,,,.F.,.T.,.F.,,.F.,,,.F.)
DEFINE SBUTTON FROM 060, 005 TYPE 1 ACTION ( grvMarca ( cCodigo, cDesc ), clear( @cCodigo, @cDesc) ) ENABLE OF oDig
DEFINE SBUTTON FROM 060, 100 TYPE 2 ACTION ( oDig:End()) ENABLE OF oDig

ACTIVE MSDIALOG oDig CENTERED

Return ()

Static Function grvMarca( cCodigo, cDesc )

if (recLock ( "ZA0", .T. ) )

	ZA0->ZA0_FILIAL := fwxFilial ("ZA0")
	ZA0->ZA0_ID := cCodigo
	ZA0->ZA0_DESC :=  cDesc

ZA0-> (msUnLock())

endif

Return

Static Function clear ( cCodigo, cDesc )

cID := space ( tamSX3 ("ZA0_ID"))

Return