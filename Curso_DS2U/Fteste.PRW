#include "PROTHEUS.CH"

User Function FTESTE1()

Local cVar := "Executando função 1" //Texto
Local nVar := 10 					//Numerico
Local lVar := .T. 					//True
Local lFalse := .F. 				//False
Local aVar := ("" , 0 , .T. ) 		//Array 
Local dVar := CtoD("") 				//Data


	Alert ( cVar )
	
	Alert("Executando função teste 1")
	
	Fteste2(cVar , nVar , lVar )
		
Return

Static Function Fteste2( cVar , nVar , lVar )
	
	Private cPVariavel := "Variavel Private"
	
	Alert("Testando função teste 2")
	
	Alert ( cPVariavel )
	
	Fteste3()

Return

Static Function Fteste3()

	Alert ( cPVariavel )

	Alert ( cVar )
	
	Alert("Testando função 3")

Return