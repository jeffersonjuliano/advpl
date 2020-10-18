#include 'protheus.ch'
#include 'parmtype.ch'

user function banco004()

    Local aArea := SB1->(GetArea())

    DbSelectArea('SB1')
    SB1->(DbSetOrder(1))
    SB1->(DbGoTop())

    //Iniciar a Transação
    Begin Transaction 

    MsgInfo("A descrição do produto será alterada.","Atenção")

    If SB1->(DbSeek(FWXfilial('SB1') + '000002'))
        RecLock('SB1', .F.) //.F. trava registro para alteração de dados / .T. trava para inclusão
            Replace B1_DESC With "FARINHA"
        SB1->(MsUnlock())
    Endif

    MsgAlert("Alteração efetuada!","Atenção")
    //DisarmTransaction()

    End Transaction
    RestArea(aArea)

return