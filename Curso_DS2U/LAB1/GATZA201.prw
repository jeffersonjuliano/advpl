/*/{Protheus.doc} GATZA201
    (long_description)
    @type  Function
    @author user
    @since date
    @version version
    @param param, param_type, param_descr
    @return return, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function GATZA201()
/* Local cIdMarca := POSICIONE("ZA1",1,xFilial( "ZA1" ) + M->ZA2_IDMODE,"ZA1_IDMARC")
Return POSICIONE("ZA0",1,xFilial( "ZA0" ) + cIdMarca,"ZA0_DESC")

Static Functio exemplo1() */

Local cDescMarc := ""

dbSelectArea( "ZA1" )
ZA1->( dbSetOrder( 1 ) )

if ( ZA1->( dbSeek( xFilial( "ZA1" ) + M->ZA2_IDMODE ) ) )

    dbSelectArea( "ZA0" )
    ZA0->( dbSetOrder( 1 ) )

    if ( ZA0->( dbSeek( xFilial( "ZA0" ) + ZA1->ZA1_IDMARC ) ) )

        cDescMarc := ZA0->ZA0_DESC

    endif

else
    alert( "ID de modelo não encontrado" )
endif

Return cDescMarc