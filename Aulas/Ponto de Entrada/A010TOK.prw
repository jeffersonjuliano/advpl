#include 'protheus.ch'
#include 'parmtype.ch'

user function A010TOK()

    Local lExecuta := .T.
    Local cTipo := AllTrim(M->B1_TIPO)
    Local cConta := Alltrim(M->B1_CONTA)

    iF (cTipo = "PA" .AND. cConta = "001") 
        Alert("A conta <b> " + cConta + "</b> não pode estar"+ ;
        "associada a um produto do tipo <b>" + cTipo)

        lExecuta := .F.
    EndIf

    RestArea(aArea) //Fecha a atabela



return (lExecuta)