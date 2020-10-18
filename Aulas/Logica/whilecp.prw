#include 'protheus.ch'
#include 'parmtype.ch'

user function whilecp()

	Local nNum1 := 1
    Local cNome := "RCTI"

    While nNum1 != 10 .AND. cNome != "PROTHEUS"

        nNum1++

        IF nNum1 == 5
        cNome := "PROTHEUS" 
        ENDIF
 
            Alert("Número: " + cValToChar(nNum1))
            Alert("Nome: " + cValToChar(cNome))
    ENDDO
        
	
return