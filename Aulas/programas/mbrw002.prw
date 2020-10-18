#include 'protheus.ch'
#include 'parmtype.ch'

user function mbrw002()

Local cAlias            := "SA2"
Local aCores            := {}
Local cFiltra           := "A2_FILIAL ==   '"+xFilial('SA2')+"' .AND. A2_EST == 'SP'"
Private cCadastro       := "Cadastro MBROWSE"
Private aRotina         := {}
Private aIndexSA2       := {}
Private bFiltraBrw      := {|| FilBrowse(cAlias,@aIndexSA2,@cFiltra)}

AADD(aRotina, {"Pesquisar"    , "AxPesqui"        , 0, 1 })
AADD(aRotina, {"Visualizar"   , "AxVisual"        , 0, 2 })
AADD(aRotina, {"Iniciar"      , "U_BInclui"       , 0, 3 })
AADD(aRotina, {"Trocar"       , "U_BAltera"       , 0, 4 })
AADD(aRotina, {"Excluir"      , "U_BDeleta"       , 0, 5 })
AADD(aRotina, {"Legenda"    , "U_BLegenda"      , 0, 6 })

// Acores

AADD(aCores,{"A2_TIPO == 'F'" ,"BR_VERDE"      })
AADD(aCores,{"A2_TIPO == 'J'" ,"BR_AMARELO"    })
AADD(aCores,{"A2_TIPO == 'X'" ,"BR_LARANJA"    })
AADD(aCores,{"A2_TIPO == 'R'" ,"BR_MARROM"     })
AADD(aCores,{"Empty (A2_TIPO)" ,"BR_PRETO"     })


dbSelectArea(cAlias)
dbSetOrder(1)
eval(bFiltraBrw)
dbGotop()
mBrowse(6,1,22,75,cAlias,,,,,,aCores)

EndFilBrw(cAlias,aIndexSA2)

return Nil

// Fun��o BINLCUI

user function BInclui(cAlias,nReg,nOpc)

Local nOpcao := 0
nOpcao := AxInclui(cAlias,nReg,nOpc)
    If nOpcao == 1
        MsgInfo("Inclus�o efetuada com sucesso!")
    else
        MsgAlert("A inclus�o foi cancelada")
    Endif


return 

// Fun��o BAltera

user function BAltera(cAlias,nReg,nOpc)

Local nOpcao := 0
nOpcao := AxAltera(cAlias,nReg,nOpc)
    If nOpcao == 1
        MsgInfo("Altera��o efetuada com sucesso!")
    else
        MsgAlert("A altera��o foi cancelada")
    Endif


return 

// Fun��o BDeleta

user function BDeleta(cAlias,nReg,nOpc)

Local nOpcao := 0
nOpcao := AxDeleta(cAlias,nReg,nOpc)
    If nOpcao == 1
        MsgInfo("Delete efetuado com sucesso!")
    else
        MsgAlert("Delete foi cancelada")
    Endif


return 

// Fun��o BLegenda

user function BLegenda()

    Local aLegenda := {}

        AADD(aLegenda, {"BR_VERDE",     "Pessoa Fisica"     })
        AADD(aLegenda, {"BR_AMARELO",   "Pessoa Juridica"   })
        AADD(aLegenda, {"BR_LARANJA",   "Exporta��o"        })
        AADD(aLegenda, {"BR_MARROM",    "Fornecedor Rural"  })
        AADD(aLegenda, {"BR_PRETO",     "N�o Classificao"   })

        BrwLegenda(cCadastro, "Legenda", aLegenda)

return  