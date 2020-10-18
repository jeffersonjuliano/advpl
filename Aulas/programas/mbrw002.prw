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

// Função BINLCUI

user function BInclui(cAlias,nReg,nOpc)

Local nOpcao := 0
nOpcao := AxInclui(cAlias,nReg,nOpc)
    If nOpcao == 1
        MsgInfo("Inclusão efetuada com sucesso!")
    else
        MsgAlert("A inclusão foi cancelada")
    Endif


return 

// Função BAltera

user function BAltera(cAlias,nReg,nOpc)

Local nOpcao := 0
nOpcao := AxAltera(cAlias,nReg,nOpc)
    If nOpcao == 1
        MsgInfo("Alteração efetuada com sucesso!")
    else
        MsgAlert("A alteração foi cancelada")
    Endif


return 

// Função BDeleta

user function BDeleta(cAlias,nReg,nOpc)

Local nOpcao := 0
nOpcao := AxDeleta(cAlias,nReg,nOpc)
    If nOpcao == 1
        MsgInfo("Delete efetuado com sucesso!")
    else
        MsgAlert("Delete foi cancelada")
    Endif


return 

// Função BLegenda

user function BLegenda()

    Local aLegenda := {}

        AADD(aLegenda, {"BR_VERDE",     "Pessoa Fisica"     })
        AADD(aLegenda, {"BR_AMARELO",   "Pessoa Juridica"   })
        AADD(aLegenda, {"BR_LARANJA",   "Exportação"        })
        AADD(aLegenda, {"BR_MARROM",    "Fornecedor Rural"  })
        AADD(aLegenda, {"BR_PRETO",     "Não Classificao"   })

        BrwLegenda(cCadastro, "Legenda", aLegenda)

return  