#include 'protheus.ch'
#include 'parmtype.ch'

user function mbrw001()

Local cAlias := "SB1"
Private cTitulo := "Cadastro de Produtos - Mbrouse "
Private aRotina := {}

AADD(aRotina, {"Pesquisar"    , "AxPesqui"        , 0, 1 })
AADD(aRotina, {"Visualizar"   , "AxVisual"        , 0, 2 })
AADD(aRotina, {"Iniciar"      , "AxInclui"        , 0, 3 })
AADD(aRotina, {"Trocar"       , "AxAltera"        , 0, 4 })
AADD(aRotina, {"Excluir"      , "AxDeleta"        , 0, 5 })
AADD(aRotina, {"Olá Mundo"    , "U_avetor"        , 0, 6 })

dbSelectArea(cAlias)
dbSetOrder(1)
mBrowse(,,,,cAlias)
//mBrowse(6,1,22,75,cAlias)


return Nil