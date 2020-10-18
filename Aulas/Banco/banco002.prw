#include 'protheus.ch'
#include 'parmtype.ch'

user function banco002()

Local aArea := SB1->(GetArea())
Local cMsg := ""

DbSelectArea("SB1") //Tabela
SB1->(DbSetOrder(1)) //Indice da tabela
SB1->(DbGoTop()) //Posiciona no inicio da tabela

cMsg := Posicione('SB1',1,FWXfilial('SB1')+'000002','B1_DESC') //Pesquisa

Alert("Descrição do Produto: "+cMsg, "AVISO")

RestArea(aArea)

return