#include 'protheus.ch'
#include 'parmtype.ch'

user function bloco()

	//Local bBloco := {||Alert("Ol� Mundo")}
	//Eval(bBloco)

    //Passagem por par�metros
    Local bBloco := { |cMsg| Alert(cMsg) }
        Eval(bBloco,"Ol� Mundo!")

return