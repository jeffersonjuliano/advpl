User Function EX01()

Local lINCLUI := .F.
Local lALTERA := .T.


//if ( lINCLUI .and. lALTERA ) // .T.	
//	conout("Primeiro")
//else
//	conout("Segundo")
//endif

if ( dbSeek() .and. u_positvo() )
	conout("Primeiro")
else
	conout("Segundo")
endif

Return