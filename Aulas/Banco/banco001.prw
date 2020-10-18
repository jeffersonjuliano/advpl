#include 'protheus.ch'
#include 'parmtype.ch'

user function banco001()

	Local aArea := SB1->(GetArea()) //Referência a tabela
    Local cTst  := ""
    //Local cMsg := ""

    DbSelectArea("SB1") //Abrir a tabela
    SB1->(DbSetOrder(1)) //Posiciona no indice 1  
    SB1->(DbGoTop())


        //Posiciona o produto de código 000001
    IF SB1->(dbSeek(FWXFilial("SB1")+"000001")) //Procura o código "000001" 

        cTst := SB1->B1_DESC
        Alert(SB1->B1_DESC)
        B1_TST := cTst



    ENDIF

    RestArea(aArea) //Fecha a atabela



return