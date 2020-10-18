#include "protheus.ch"

User Function ValZA201()
	
Local lRet := .T.
Local dDataEnt := M->ZA2_DENTRA

	if (dDataEnt > Date())
	
		lRet := .F.
		Alert("Data de entrada não pode ser maior que hoje!")
	endif

Return lRet

User Function ValZA202()
	
Local lRet 		 := .T.
Local hHoraEnt 	 := M->ZA2_HENTRA
Local cHorLimIni := "09:00:00"
Local cHorLimFim := "18:00:00"
Local cHrMinEst  := "00:30:00"


	if (hHoraEnt > TIME())
	
		lRet := .F.
		Alert("Hora de entrada não pode ser maior que " + TIME())
	
	elseif (dHoraEnt < cHrlimIni)
	
		lRet := .F.
		Alert("Hora de entrada não pode ser menor que " + cHrLimIni)
		
	elseif (Elaptime(cHrLimFim, hHorEnt) < cHrMinEst)
	
		lRet := .F.
		Alert("Tempo de estadia não deve ser menor que " + cHrMinEst)
		
	endif
	
	

Return lRet


User Function ValZA203()
	
Local lRet := .T.
Local cPlaca := M->ZA2_PLACA
Local nTamPlaca := 8

	if !(len(allTrim(cPlaca)) == nTamPlaca) //AllTrim - Tira espaços a esquerda e direita Len = conta caracteres
	
		lRet := .F.
		Alert("Digite corretamente a placa do veiculo")
	endif

Return lRet

User Function ValZA204()
	
Local lRet 			:= .T.
Local hHoraEnt 	 	:= M->ZA2_HENTRA
Local hHoraSai 	 	:= M->ZA2_HSAIDA
Local nValor 		:= "0.00"
Local nTemp			:= "00:00:00"

	if (hHoraSai > "00:00:00")
	
		nTemp := ElapTime( hHoraEnt, hHoraSai )
	
			Alert( "Tempo de estadia " + nTemp )
			
	endif

	if ( nTemp > "00:14:59" .and. nTemp < "00:29:59" )
	
		nValor := "5.00"
		M->ZA2_VALOR := VAL(nValor)
		lRet := .T.

		elseif ( nTemp > "00:30:00" )

			nValor := "10.00"
			M->ZA2_VALOR := VAL(nValor)
			lRet := .T.
	
	endif
	
Return lRet

// fazer validação do campo Valor, não pode ser menor que zero, e calcular o valor pela quantidade de hora decorrida

