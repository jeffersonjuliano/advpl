#include 'protheus.ch'
#include 'parmtype.ch'

user function banco005()

    Local aArea := GetArea()
    Local aDados := {}
    Private lMSERROAuto := .F. //Sempre inicializar com false

    aDados := {;
                {"B1_COD",   "1111111",         Nil},;
                {"B1_DESC",   "PRODUTO TESTE",  Nil},;
                {"B1_TIPO",   "GG",             Nil},;
                {"B1_UM",   "PC",               Nil},;
                {"B1_LOCPAD",   "01",           Nil},;
                {"B1_PICM",   0,                Nil},;
                {"B1_IPI",   0,                 Nil},;
                {"B1_CONTRAT",   "N",           Nil},;
                {"B1_LOCALIZ",   "N",           Nil};    
                }

    //Iniciar a Transação
    Begin Transaction 
        //Chama o cadastro de produto
        MSExecAuto({|x,y|Mata010(x,y)},aDados,3) //numero 3 incluir - numero 4 alteração - numero 5 exclusão

            //Caso ocorra algum erro
            If lMSERROAuto
                Alert("Ocorreram erros durante a operção!")
                MostraErro()
                DisarmTransaction()
                else
                    MsgInfo("Operação Finalizada!", "Aviso")
            Endif

    End Transaction
    RestArea(aArea)

return