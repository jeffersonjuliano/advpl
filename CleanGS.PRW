#INCLUDE "rwmake.ch"
#INCLUDE "protheus.ch"

/*/{Protheus.doc} CleanGS
Limpa arquivos de base do Gest�o de Servi�os de forma simples e sem valida��es

@author Adrianne Furtado
@since 26/03/2017
@version R12.1.17

/*/

User Function CleanGS()
Local cQuery := ''

Local aTabs := {"ABB","AB9","TGY","TGZ","TDV","ABR",;							// tabelas de aloca��es (sem mov agil)
				"TGZ","TDV","ABR","TW3","TW5","TW4",;							// tabelas da mov agil
				"CN9","CNA","CNB","CNC","CPD","CNN",;							// tabelas de contratos		
				"CND", "CNE","TFV","TFW","TFX","TFY","TWB",;					// tabelas de medi��o 	
				"TFL","TFF","TFG","TFH","TFJ","ABP","TFU","TFI","TEV",;			// tabelas de or�amentos
				"AD1","AD2","AD3","AD4","AD9","ADJ","ADY","ADZ","AO4","ADC","AIJ",;// tabelas de oportunidade e proposta
				"SLY",;															// tabelas de vinculos de benef�cios
				"TW0","TW1",;													// tabelas de rota de cobertura
				"AA3","AA4",;													// base de atendimento
				"AAT","AAU",;													// vistoria t�cnica
				"AB6","AB7","AB8"}												// O.S.
Local nX := 1
Local cDelet := ""
Local cNDel	:= ""
//Local cSepara := ""
Local nResult := 0
				
If Aviso( "ATEN��O", "Essa rotina vai limpar definitivamente os dados da base de GS, " + ;
					"tem certeza que deseja continuar?", {"N�o", "Sim"}) = 2 							
	
	For nX := 1 to len(aTabs)
		cQuery := "DELETE FROM " + RetSqlName( aTabs[nX] )
	
		nResult := TcSqlExec(cQuery)

		If nResult < 0
			If !Empty(RetSqlName( aTabs[nX] ))
				cNDel += RetSqlName( aTabs[nX] ) + ", "
			Else
				cNDel += aTabs[nX] + ", "
			EndIf
		Else
			If Len(RetSqlName( aTabs[nX] )) > 0
				cDelet += RetSqlName( aTabs[nX] ) + ", "
			Else
				cDelet += aTabs[nX] + ", "
			EndIf
		EndIf
		
	Next nX
	
	cNDel  := SubStr(cNDel , 1, Len(cNDel )-2)
	cDelet := SubStr(cDelet, 1, Len(cDelet)-2)
	
	Aviso("Dados deletados","As seguintes tabelas tiveram seus dados deletados: "+ cDelet,{"OK"})
	Conout("As seguintes tabelas tiveram seus dados deletados: "+ cDelet)
		
	Aviso("Dados n�o deletados","As seguintes tabelas N�O tiveram seus dados deletados: "+ cNDel,{"Ok"})		
	Conout("As seguintes tabelas N�O tiveram seus dados deletados: "+ cNDel)
		
EndIf

Return .T.