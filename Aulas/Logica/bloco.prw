#include 'protheus.ch'
#include 'parmtype.ch'

user function bloco()

	//Local bBloco := {||Alert("Olá Mundo")}
	//Eval(bBloco)

    //Passagem por parâmetros
    Local bBloco := { |cMsg| Alert(cMsg) }
        Eval(bBloco,"Olá Mundo!")

return