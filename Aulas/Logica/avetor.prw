#include 'protheus.ch'
#include 'parmtype.ch'

user function avetor()

	LocaL dData := Date()
    Local aValores := {"Jo", dData, 100}

    Alert(aValores[2]) //Exibe a posi��o do Array
    Alert(aValores[3])
    
return