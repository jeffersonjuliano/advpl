#include 'protheus.ch'
#include 'parmtype.ch'

user function Operador()

	Local nNum1 := 10
	Local nNum2 := 20

	Alert(nNum1 + nNum2)
	Alert("nNum1 - nNum2: " + cValtoChar(nNum2 - nNum1))
	Alert("nNum1 * nNum2: " + nNum1 * nNum2)
	Alert("nNum1 / nNum2: " + nNum2 / nNum1)
	Alert("nNum1 % nNum2: " + nNum2 % nNum1)  //Resto da divis�o - (m�dulo))
		
	//Operadores relacionais
	Alert("nNum1 < nNum2: " + nNum1 < nNum2) //Compara��o menor
	Alert("nNum1 > nNum2: " + nNum1 > nNum2) // Compara��o maior
	Alert("nNum1 = nNum2: " + nNum1 = nNum2) //  Compara��o igual
	Alert("nNum1 == nNum2: " + nNum1 == nNum2) // Exatamente igual
	Alert("nNum1 <= nNum2: " + nNum1 <= nNum2) // Menor ou igual
	Alert("nNum1 >= nNum2: " + nNum1 >= nNum2) // Maior ou igual 
	Alert("nNum1 != nNum2: " + nNum1 != nNum2) // Diferente 


//Operadores de atribui��o

	nNum1 := 10 // Atribui��o simples00
	nNum1 += nNum2 // nNum1 = nNum1 + nNum2
	nNum2 -= nNum1 // nNum2 = nNum2 - nNum1
	nNum1 *= nNum2 // nNum1 = nNum1 * nNum2
	nNum2 /= nNum1 // nNum2 = nNum2 / nNum1
	//nNum2 %= nNum1 // nNum2 = nNum2 % nNum1


return