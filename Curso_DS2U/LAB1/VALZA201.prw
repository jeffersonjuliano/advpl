User Function VALZA201()

Local lRet := .T.
Local dDataEnt := M->ZA2_DTENTR

if ( dDataEnt > date() )

    lRet := .F.
    alert( "Data de entrada não pode ser maior que " + dToC( date() ) )

endif

Return lRet

User Function VALZA202()

Local lRet      := .T.
Local cHoraEnt  := M->ZA2_HRENTR
Local cHrLimIni := "09:00:00"
Local cHrLimFim := "18:00:00"
Local cHrMinEst := "00:30:00"

if ( cHoraEnt > time() )

    lRet := .F.
    alert( "Hora de entrada não pode ser maior que " + time() )

elseif ( cHoraEnt < cHrLimIni )

    lRet := .F.
    alert( "Hora de entrada não pode ser menor que " + cHrLimIni )

elseif ( ElapTime( cHrLimFim, cHoraEnt ) < cHrMinEst )

    lRet := .F.
    alert( "Tempo de estadia deve ser maior que " + cHrMinEst )

endif

Return lRet

User Function VALZA203()

Local lRet      := .T.
Local nTamPlaca := tamSX3( "ZA2_PLACA" )[1]
Local cPlaca    := M->ZA2_PLACA

if !( len( allTrim( cPlaca ) ) == nTamPlaca )

    lRet := .F.
    alert( "Digite corretamente a placa do veículo!" )

endif

Return lRet