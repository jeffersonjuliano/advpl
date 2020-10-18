#include 'protheus.ch'
#include 'parmtype.ch'

//Local cCli := AllTrim(M->AB9_CODCLI)


USER FUNCTION AT480GRV()
    ALERT('PONTO DE ENTRADA AT480GRV CHAMADO COM SUCESSO!')
        Reclock("SE2",.F.)
        SE2->E2_HIST := 'PE F040FCR OK' //CAMPOS DA AB9
		//SE2->E2_HIST := cCli
		
    MsUnlock()
	//RestArea(aArea) //Fecha a atabela
RETURN


//GRAVAR INFORMAÇÃO NO CAMPO HISTÓRICO
//TABELA SE2 - JÁ ESTA POSICIONADO
//PRECISA RECEBER INFORMAÇÃO DA TABELA AB9

  //  Local aArea := GetArea()
  // Local cCli := AllTrim(M->AB9_)
  //Local cCont := Alltrim(M->AB9_)

    	//Abrindo a tabela de produtos e setando o índice
	//DbSelectArea('AB9')
	//AB9->(DbSetOrder(1)) //INDICE 1 DA TABELA AB9
	//AB9->(DbGoTop())

	//Iniciando a transação, tudo dentro da transação, pode ser desarmado (cancelado)
	//Begin Transaction
	//	MsgInfo("Antes da Alteração!", "Atenção")
		
		//Se conseguir posicionar no produto de código E00001
		//If SB1->(DbSeek(FWxFilial('SB1') + 'E00001'))
			//Quando passo .F. no RecLock, o registro é travado para Alteração
			//RecLock('SA2', .F.)
		//		B1_X_CAMPO := "XXX"
			//	A2_DESC := SA2->A2_HIST := "TESTE"
			//	SA2->(MsUnlock())
			
			/*
				Ao invés de só utilizar o :=, pode se também utilizar o comando Replace:
				Replace [CAMPO] With [CONTEUDO]
				Replace B1_X_CAMPO With "XXX"
			*/
		//EndIf
		
		//Quando passo .T. no RecLock, o registro é travado para Inclusão
		//RecLock('SA2', .T.)
			//B1_FILIAL := FWxFilial('SB1')
		//SB1->(MsUnlock())
		
		//MsgInfo("Após a Alteração!", "Atenção")
		
		//Ao desarmar a transação, toda a manipulação de dados é cancelada
	//	DisarmTransaction()
	//End Transaction
	
	//Se conseguir posicionar no produto de código E00001
	//If SB1->(DbSeek(FWxFilial('SB1') + 'E00001'))
		//Quando faço a alteração fora de uma transação, automaticamente os dados são salvos
		//RecLock('SB1', .F.)
		//	B1_DESC := Alltrim(SB1->B1_DESC) + "."
		//SB1->(MsUnlock())
	//EndIf


/*/
#include 'protheus.ch'
#include 'parmtype.ch'

USER FUNCTION AT480GRV()
    ALERT('PONTO DE ENTRADA AT480GRV CHAMADO COM SUCESSO!')
        Reclock("SE2",.F.)
        SE2->E2_HIST := 'PE F040FCR OK' //CAMPOS DA AB9
    MsUnlock()
	//RestArea(aArea) //Fecha a atabela
RETURN
/*/

    /*/iF (cTipo = "PA" .AND. cConta = "001") 
        Alert("A conta <b> " + cConta + "</b> não pode estar"+ ;
        "associada a um produto do tipo <b>" + cTipo)

        
    EndIf
    /*/

   // RestArea(aArea) //Fecha a atabela



//return ()