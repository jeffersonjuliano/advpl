User Function EX01()

//inverter valor de variavel
Local lINCLUI := .T.
Local lALTERA := .T.


conout ( iif (lINCLUI, ".T.", ".F."))

conout ( iif (!lINCLUI, ".T.", ".F."))

if (lINCLUI .and. lALTERA)

	canout("Daniel")

else

	canout("Sergio")

endif

Return