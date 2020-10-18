User Function CRMA980()

Local aParam   := PARAMIXB
Local oObj
Local cIdPonto 
Local cIdModel
Local aNewBtn := {}
Local uRet := .T.

If aParam <> NIL //Identifica que foram enviado os parâmetros.
    
    oObj     := aParam[1] //Modelo ativado.
    cIdPonto := aParam[2] //Determina o ponto de chamada.
    cIdModel := aParam[3] //Identificador do modelo.
    
    If cIdPonto == 'BUTTONBAR'
    
    	AADD( aNewBtn, { "Btn MVC", "", {|| Alert("Btn MVC") }, "Btn MVC Posicionado" } )
    	uRet := aClone( aNewBtn )
    
    EndIf
    
EndIf

Return uRet