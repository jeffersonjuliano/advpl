User Function RELMARC3()

	local alArea	:= getArea()
	local olReport

	reportDef( @olReport )
	olReport:PrintDialog()
	
	restArea( alArea )

Return

Static Function reportDef( olReport )

	local olSection1
	local clReport	:= "RELMARC3"
	local clPerg	:= "REM1"
	local clTitulo	:= "Relatório de Marcas"
	local clDescri	:= "Este programa irá emitir um relatório de marcas."
	local blReport	:= { |olReport| reportPrint( @olReport, clPerg ) }
	
	olReport := TReport():New( clReport, clTitulo, clPerg, blReport, clDescri )
	
	olSection1 := TRSection():New( olReport, "Marcas", {"ZA0"}, /*aOrd*/ )
	
	TRCell():New( olSection1, "ZA0_ID"		, "ZA0", "ID"			, /*Picture*/, /*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)
	TRCell():New( olSection1, "ZA0_DESC"	, "ZA0", "Descricao"	, /*Picture*/, /*Tamanho*/,/*lPixel*/,/*{|| code-block de impressao }*/)
	
Return

Static Function reportPrint( olReport, clPerg )

	local olSection1	:= olReport:section( 1 )
	local clAlias		:= getNextAlias()
	
	pergunte(clPerg,.F.)
	
	if ( select( clAlias ) )
		( clAlias )->( dbCloseArea() )
	endif
	
	olSection1:beginQuery()
	
	BEGINSQL Alias clAlias
		
		SELECT 
			ZA0.*
			 
		FROM 
			%TABLE:ZA0% ZA0
			
		WHERE 
			ZA0.ZA0_FILIAL = %XFILIAL:ZA0%
			AND ZA0.ZA0_ID BETWEEN %EXP:MV_PAR01% AND %EXP:MV_PAR02%
			AND ZA0.%NOTDEL%

	ENDSQL
	
	olSection1:endQuery()
	olSection1:print()
	
Return