#INCLUDE "PROTHEUS.CH"

User Function Calcula()

Local nResult := 0 

Private aNumeros := {5, 2, 3, 4}

nResult := soma()

conout( nResult )

Return

Static Function soma()

Local nResultado := 0
Local nIndice := 0

for nIndice := 1 to len( aNumeros )
	nResultado += aNumeros[nIndice]
next nIndice

Return nResultado

Static Function subtrai()

Local nResultado := 0
Local nIndice := 0

for nIndice := 1 to len( aNumeros )
	nResultado -= aNumeros[nIndice]
next nIndice

Return nResultado