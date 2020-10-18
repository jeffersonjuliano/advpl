#include 'protheus.ch'
#include 'parmtype.ch'

user function reltxt2()

If MSGYESNO("Estão Função tem como objetico gerar um arquivo TXT")

    Processa({ ||  MntQry()    },,"Processando...")
    MsAguarde({ || GeraArq()    },,"O Arquivo TXT está sendo gerado...")

else

    Alert("Cancelado pelo Operador")

Endif

return Nil

//Montar Query SQL
Static function MntQry()

    Local cQuery := ""

    cQuery := " SELECT B1_FILIAL AS FILIAL, B1_COD AS CODIGO, "
    cQuery += " B1_DESC AS DESCRICAO "
    cQuery += " FROM SB1990 WHERE D_E_L_E_T_ = ''"

    cQuery := ChangeQuery(cQuery)
        DbUseArea(.T.,"TOPCONN", TCGENQRY(,,cQuery), 'TMP',.F.,.T.)

Return Nil


/*Função que gera o arquivo TXT*/
static function GeraArq()

Local cDir := "D:\Totvs\"
Local cArq := "Arquivo2.txt"
Local nHandle := FCreate(cDir+cArq)

    If nHandle < 0
        MsgAlert("Erro ao criar o arquivo", "Erro")

    else
           While TMP->(!EOF())

                FWrite(nHandle, TMP->(FILIAL) + " | " + TMP->(CODIGO) + " | " + TMP->(DESCRICAO) + CRLF) 
                TMP->(dbSkip())

            EndDo

            FClose(nHandle)

    Endif

    If FILE("D:\Totvs\Arquivo2.txt") 

        MsgInfo("Arquivo criado com sucesso")

    else
        MsgAlert("Não foi possível encontrar o arquivo","Alerta")
    Endif

Return
