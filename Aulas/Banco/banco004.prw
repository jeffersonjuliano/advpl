#include 'protheus.ch'
#include 'parmtype.ch'

user function banco004()

    Local aArea := SB1->(GetArea())

    DbSelectArea('SB1')
    SB1->(DbSetOrder(1))
    SB1->(DbGoTop())

    //Iniciar a Transa��o
    Begin Transaction 

    MsgInfo("A descri��o do produto ser� alterada.","Aten��o")

    If SB1->(DbSeek(FWXfilial('SB1') + '000002'))
        RecLock('SB1', .F.) //.F. trava registro para altera��o de dados / .T. trava para inclus�o
            Replace B1_DESC With "FARINHA"
        SB1->(MsUnlock())
    Endif

    MsgAlert("Altera��o efetuada!","Aten��o")
    //DisarmTransaction()

    End Transaction
    RestArea(aArea)

return