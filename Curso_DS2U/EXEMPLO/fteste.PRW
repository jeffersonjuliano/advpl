#include "protheus.ch"

User Function Fteste1()
	
	Local cVar 		:= "Executando Fun��o 1" // String
	Local nVar 		:= 10					// Numerico
	Local lVar 		:= .T. 					// True
	Local lFalse 	:= .F. 					// False
	Local aVar	 	:=  { "" , 0 ,  .T. } 	// Array
	Local dVar	 	:= CtoD("")				// Data 

	Alert( cVar )
	
	FTeste2( cVar )
	
	Alert( cVar )
	
Return

Static Function FTeste2( cVar )

	Private cPVariavel := "variavel private" 
	
	Alert( " Testando Fun��o TESTE 2"  )
	
	Fteste3( cVar )

Return

Static Function Fteste3( cVar )
	
	Alert( cPVariavel )
	
	Alert( cVar )

	Alert( " testando fun��o TESTE 3"  )
	
Return