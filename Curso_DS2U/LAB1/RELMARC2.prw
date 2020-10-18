#INCLUDE "PROTHEUS.CH"

User Function RELMARC2()

	local olExcel
	local olExcelApp
	
	if ( pergunte( "REM1", .T. ) )
	
		olExcel := FWMsExcelEx():New()
		
		olExcel:AddworkSheet("Marcas")
		olExcel:AddTable("Marcas","Tabela de Marcas")
		olExcel:AddColumn("Marcas","Tabela de Marcas","Código",1,1)
		olExcel:AddColumn("Marcas","Tabela de Marcas","Descrição",1,1)
		
		dbSelectArea( "ZA0" )
		ZA0->( dbSetOrder( 1 ) )
		
		ZA0->( dbGoTop() )
		
		while ( .not. ZA0->( eof() ) )
	
			if ( ZA0->ZA0_ID >= MV_PAR01 .and. ZA0->ZA0_ID <= MV_PAR02 )
				olExcel:AddRow("Marcas","Tabela de Marcas",{ZA0->ZA0_ID, ZA0->ZA0_DESC})
			endif
			
			ZA0->( dbSkip() )
		endDo
		
		olExcel:Activate()
		olExcel:GetXMLFile("c:\temp\TESTE.xml")
		
		if ( msgYesNo( "Deseja abrir o relatório ?" ) )
		
			olExcelApp := MsExcel():New()
			olExcelApp:WorkBooks:Open("c:\temp\TESTE.xml") // Abre a planilha
			olExcelApp:SetVisible(.T.)
			
		endif
		
	endif

Return