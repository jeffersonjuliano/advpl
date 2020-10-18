User Function AUTOCLI()

Local aCli := {}

Private lMsErroAuto := .F.

AADD(aCli, {"A1_FILIAL" , xFilial("SA1")		, Nil}) 
AADD(aCli, {"A1_COD"    , "TST001"				, Nil}) 
AADD(aCli, {"A1_LOJA"   , "01"					, Nil}) 
AADD(aCli, {"A1_NOME"   , "TESTE EXECAUTO"		, Nil}) 
AADD(aCli, {"A1_NREDUZ" , "EXECAUTO"			, Nil}) 
AADD(aCli, {"A1_END"    , "END TESTE"			, Nil}) 
AADD(aCli, {"A1_TIPO"   , "F"					, NIL}) 
AADD(aCli, {"A1_EST"    , "SP"					, Nil}) 
AADD(aCli, {"A1_MUN"    , "MUN TESTE"			, Nil}) 

lMsErroAuto := .F. 

MsExecAuto( {|x,y| MATA030(x,y)}, aCli, 3)
 
If lMsErroAuto 
	MostraErro()     
EndIf

Return

User Function AUTOCLI2()

Local aCli := {}

Private lMsErroAuto := .F.

AADD(aCli, {"A1_FILIAL" , xFilial("SA1")		, Nil}) 
AADD(aCli, {"A1_COD"    , "TST002"				, Nil}) 
AADD(aCli, {"A1_LOJA"   , "01"					, Nil}) 
AADD(aCli, {"A1_NOME"   , "TESTE EXECAUTO"		, Nil}) 
AADD(aCli, {"A1_NREDUZ" , "EXECAUTO"			, Nil}) 
AADD(aCli, {"A1_END"    , "END TESTE"			, Nil}) 
AADD(aCli, {"A1_TIPO"   , "F"					, NIL}) 
AADD(aCli, {"A1_EST"    , "99"					, Nil}) 
AADD(aCli, {"A1_MUN"    , "MUN TESTE"			, Nil}) 

lMsErroAuto := .F. 

MsExecAuto( {|x,y| MATA030(x,y)}, aCli, 3)
 
If lMsErroAuto 
	MostraErro()     
EndIf

Return

User Function AUTOCLI3()

Local oModel := FWLoadModel("MATA030")
Local oSA1Mod
Local lErro  := .F.
Local aErro  := {} 

oModel:SetOperation(3)
oModel:Activate()
  
//Pegando o model dos campos da SA1
oSA1Mod:= oModel:getModel("MATA030_SA1")
oSA1Mod:setValue("A1_FILIAL",     xFilial("SA1")  ) // Codigo
oSA1Mod:setValue("A1_COD",       "TST003"        ) // Codigo 
oSA1Mod:setValue("A1_LOJA",      "01"       ) // Loja
oSA1Mod:setValue("A1_NOME",      "TESTE 03"       ) // Nome             
oSA1Mod:setValue("A1_NREDUZ",    "TST 03"   ) // Nome reduz. 
oSA1Mod:setValue("A1_END",       "TST 03 END"   ) // Endereco
oSA1Mod:setValue("A1_TIPO",      "F"         ) // Tipo 
oSA1Mod:setValue("A1_EST",       "SP"        ) // Estado
oSA1Mod:setValue("A1_MUN",       "MUNICIPIO TESTE"    ) // Municipio
  
//Se conseguir validar as informações
If oModel:VldData()
      
    //Tenta realizar o Commit
    If !( oModel:CommitData() )
        lErro := .T.
    EndIf
    
Else
    lErro := .T.  
EndIf
 
if ( lErro )

	aErro := oModel:GetErrorMessage()
	      
	//Monta o Texto que será mostrado na tela
	AutoGrLog("Id do formulário de origem:"  + ' [' + AllToChar(aErro[01]) + ']')
	AutoGrLog("Id do campo de origem: "      + ' [' + AllToChar(aErro[02]) + ']')
	AutoGrLog("Id do formulário de erro: "   + ' [' + AllToChar(aErro[03]) + ']')
	AutoGrLog("Id do campo de erro: "        + ' [' + AllToChar(aErro[04]) + ']')
	AutoGrLog("Id do erro: "                 + ' [' + AllToChar(aErro[05]) + ']')
	AutoGrLog("Mensagem do erro: "           + ' [' + AllToChar(aErro[06]) + ']')
	AutoGrLog("Mensagem da solução: "        + ' [' + AllToChar(aErro[07]) + ']')
	AutoGrLog("Valor atribuído: "            + ' [' + AllToChar(aErro[08]) + ']')
	AutoGrLog("Valor anterior: "             + ' [' + AllToChar(aErro[09]) + ']')
	  
	//Mostra a mensagem de Erro
	MostraErro()
    
endif

//Desativa o modelo de dados
oModel:DeActivate()

Return

User Function AUTOCLI4()

Local oModel := FWLoadModel("MATA030")
Local oSA1Mod
Local lErro  := .F.
Local aErro  := {} 

oModel:SetOperation(3)
oModel:Activate()
  
//Pegando o model dos campos da SA1
oSA1Mod:= oModel:getModel("MATA030_SA1")
oSA1Mod:setValue("A1_FILIAL",     xFilial("SA1")  ) // Codigo 
oSA1Mod:setValue("A1_COD",       "TST003"        ) // Codigo 
oSA1Mod:setValue("A1_LOJA",      "01"       ) // Loja
oSA1Mod:setValue("A1_NOME",      "TESTE 03"       ) // Nome             
oSA1Mod:setValue("A1_NREDUZ",    "TST 03"   ) // Nome reduz. 
oSA1Mod:setValue("A1_END",       "TST 03 END"   ) // Endereco
oSA1Mod:setValue("A1_TIPO",      "F"         ) // Tipo 
oSA1Mod:setValue("A1_EST",       "SP"        ) // Estado
oSA1Mod:setValue("A1_MUN",       "MUNICIPIO TESTE"    ) // Municipio
  
//Se conseguir validar as informações
If oModel:VldData()
      
    //Tenta realizar o Commit
    If !( oModel:CommitData() )
        lErro := .T.
    EndIf
    
Else
    lErro := .T.  
EndIf
 
if ( lErro )

	aErro := oModel:GetErrorMessage()
	      
	//Monta o Texto que será mostrado na tela
	AutoGrLog("Id do formulário de origem:"  + ' [' + AllToChar(aErro[01]) + ']')
	AutoGrLog("Id do campo de origem: "      + ' [' + AllToChar(aErro[02]) + ']')
	AutoGrLog("Id do formulário de erro: "   + ' [' + AllToChar(aErro[03]) + ']')
	AutoGrLog("Id do campo de erro: "        + ' [' + AllToChar(aErro[04]) + ']')
	AutoGrLog("Id do erro: "                 + ' [' + AllToChar(aErro[05]) + ']')
	AutoGrLog("Mensagem do erro: "           + ' [' + AllToChar(aErro[06]) + ']')
	AutoGrLog("Mensagem da solução: "        + ' [' + AllToChar(aErro[07]) + ']')
	AutoGrLog("Valor atribuído: "            + ' [' + AllToChar(aErro[08]) + ']')
	AutoGrLog("Valor anterior: "             + ' [' + AllToChar(aErro[09]) + ']')
	  
	//Mostra a mensagem de Erro
	MostraErro()
    
endif

//Desativa o modelo de dados
oModel:DeActivate()

Return

User Function AUTOCLI5()

Local oModel := FWLoadModel("MATA030")
Local oSA1Mod
Local lErro  := .F.
Local aErro  := {} 

oModel:SetOperation(3)
oModel:Activate()
  
//Pegando o model dos campos da SA1
oSA1Mod:= oModel:getModel("MATA030_SA1")
oSA1Mod:setValue("A1_FILIAL",     xFilial("SA1")  ) // Codigo
oSA1Mod:setValue("A1_COD",       "TST003"        ) // Codigo 
oSA1Mod:setValue("A1_LOJA",      "01"       ) // Loja
oSA1Mod:setValue("A1_NOME",      "TESTE 03"       ) // Nome             
oSA1Mod:setValue("A1_NREDUZ",    "TST 03"   ) // Nome reduz. 
oSA1Mod:setValue("A1_END",       "TST 03 END"   ) // Endereco
oSA1Mod:setValue("A1_TIPO",      "F"         ) // Tipo 
oSA1Mod:setValue("A1_EST",       "SP"        ) // Estado
oSA1Mod:setValue("A1_MUN",       "MUNICIPIO TESTE"    ) // Municipio
  
//Se conseguir validar as informações
If oModel:VldData()
      
    //Tenta realizar o Commit
    If !( oModel:CommitData() )
        lErro := .T.
    EndIf
    
Else
    lErro := .T.  
EndIf
 
if ( lErro )

	aErro := oModel:GetErrorMessage()
	      
	//Monta o Texto que será mostrado na tela
	AutoGrLog("Id do formulário de origem:"  + ' [' + AllToChar(aErro[01]) + ']')
	AutoGrLog("Id do campo de origem: "      + ' [' + AllToChar(aErro[02]) + ']')
	AutoGrLog("Id do formulário de erro: "   + ' [' + AllToChar(aErro[03]) + ']')
	AutoGrLog("Id do campo de erro: "        + ' [' + AllToChar(aErro[04]) + ']')
	AutoGrLog("Id do erro: "                 + ' [' + AllToChar(aErro[05]) + ']')
	AutoGrLog("Mensagem do erro: "           + ' [' + AllToChar(aErro[06]) + ']')
	AutoGrLog("Mensagem da solução: "        + ' [' + AllToChar(aErro[07]) + ']')
	AutoGrLog("Valor atribuído: "            + ' [' + AllToChar(aErro[08]) + ']')
	AutoGrLog("Valor anterior: "             + ' [' + AllToChar(aErro[09]) + ']')
	  
	//Mostra a mensagem de Erro
	MostraErro()
    
endif

//Desativa o modelo de dados
oModel:DeActivate()

Return

User Function AUTOCLI6()

Local oModel := FWLoadModel("CADMVCM")
Local oMarca
Local oCadMod
Local lErro  := .F.
Local aErro  := {}
Local nLinhaAtu

oModel:SetOperation(3)
oModel:Activate()
  
//Pegando o model dos campos da SA1
oMarca:= oModel:getModel("ZA0MASTER")
oMarca:setValue("ZA0_FILIAL"	, FWxFilial("ZA0")  ) 
oMarca:setValue("ZA0_DESC"		, "FIAT"       )
 
oCadMod:= oModel:getModel("ZA1DETAIL")

nLinhaAtu := oCadMod:AddLine()
If( nLinhaAtu  == oCadMod:Length() )

	oCadMod:GoLine( nLinhaAtu )
	oCadMod:setValue("ZA1_FILIAL"	, FWxFilial("ZA1")  )
	oCadMod:setValue("ZA1_DESC"	, "PALIO"  )
	
EndIf

nLinhaAtu := oCadMod:AddLine()
If( nLinhaAtu  == oCadMod:Length() )

	oCadMod:GoLine( nLinhaAtu )
	oCadMod:setValue("ZA1_FILIAL"	, FWxFilial("ZA1")  )
	oCadMod:setValue("ZA1_DESC"	, "UNO"  )
	
EndIf
 
//Se conseguir validar as informações
If oModel:VldData()
      
    //Tenta realizar o Commit
    If !( oModel:CommitData() )
        lErro := .T.
    EndIf
    
Else
    lErro := .T.  
EndIf
 
if ( lErro )

	aErro := oModel:GetErrorMessage()
	      
	//Monta o Texto que será mostrado na tela
	AutoGrLog("Id do formulário de origem:"  + ' [' + AllToChar(aErro[01]) + ']')
	AutoGrLog("Id do campo de origem: "      + ' [' + AllToChar(aErro[02]) + ']')
	AutoGrLog("Id do formulário de erro: "   + ' [' + AllToChar(aErro[03]) + ']')
	AutoGrLog("Id do campo de erro: "        + ' [' + AllToChar(aErro[04]) + ']')
	AutoGrLog("Id do erro: "                 + ' [' + AllToChar(aErro[05]) + ']')
	AutoGrLog("Mensagem do erro: "           + ' [' + AllToChar(aErro[06]) + ']')
	AutoGrLog("Mensagem da solução: "        + ' [' + AllToChar(aErro[07]) + ']')
	AutoGrLog("Valor atribuído: "            + ' [' + AllToChar(aErro[08]) + ']')
	AutoGrLog("Valor anterior: "             + ' [' + AllToChar(aErro[09]) + ']')
	  
	//Mostra a mensagem de Erro
	MostraErro()
    
endif

//Desativa o modelo de dados
oModel:DeActivate()

Return