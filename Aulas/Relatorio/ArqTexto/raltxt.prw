#include 'protheus.ch'

user function reltxt()

If MSGYESNO("Est�o Fun��o tem como objetico gerar um arquivo TXT")

    GeraArq()

else

    Alert("Cancelado pelo Operador")

Endif

return Nil

/*Fun��o que gera o arquivo TXT*/
static function GeraArq()

Local cDir := "D:\Totvs\"
Local cArq := "Teste_arquivo.txt"
Local nHandle := FCreate(cDir+cArq)

    If nHandle < 0
        MsgAlert("Erro ao criar o arquivo", "Erro")

    else
            For nlinha := 1 to 200
                FWrite(nHandle,"Gravando a linha" + StrZero(nlinha,3) + CRLF)           
            Next nLinha

            FClose(nHandle)

    Endif

    If FILE("D:\Totvs\Teste_arquivo.txt") 

        MsgInfo("Arquivo criado com sucesso")

    else
        MsgAlert("N�o foi poss�vel encontrar o arquivo","Alerta")
    Endif

Return

