#include "Protheus.ch"
User Function Calcula()

alert (soma( {5, 2, 3, 4} ) )

Return

Static Function soma( aNumeros )

Local nResultado := 0

Default aNumeros := {}

for nIndice := 1 to len( aNumeros )
	nResultado += aNumeros[nIndice]
next nIndice

Return nResultado