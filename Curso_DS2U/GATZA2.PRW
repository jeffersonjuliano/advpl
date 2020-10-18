#include "protheus.ch"

User Function GATZA201()

//Loca cIDMarca := POSOCIONE("ZA1",1,xFilial("ZA1")+ZA1->ZA1_)
	
Local cDescMarc := ""

	dbSelectArea('ZA1')	
	ZA1-> (dbSetOrder(1))
	
		if (ZA1->(dbSeek(xFilial("ZA1")+M->ZA2_IDMOD)))
		
			dbSelectArea('ZA0')	
			ZA0-> (dbSetOrder(1))
			
				if (ZA0->(dbSeek(xFilial("ZA0")+ZA1->ZA1_IDMARC)))
	
				cDescMarc := ZA0->ZA0_DESC
				
				endif
		else
			
			alert("id de modelo não encontrado")
		
		endif
	
Return cDescMarc
