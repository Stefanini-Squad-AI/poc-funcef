unit FExecCargaFCRTConfere;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97, ExtCtrls, DBTables, Wwtable, Db, Wwquery,
   Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, DBGrids;


type
   // ----------------------------------------------------------------------------------------------

   TRegistroBaca = Record
      IDTipoContrato    : Integer;
      IDContrato        : Int64;
      IDItem            : Integer;
      HmeTipoMov        : Integer;
      HmeOrigem         : Integer;
      HmeCentraliza     : Integer;
      HmeDestacado      : Integer;
      HmeParcela        : Integer;
      HmeNumParcelas    : Integer;
      HmeSeqCobranca    : Integer;
      HmeFormaCobranca  : String;
      HmeTipoFolha      : String;
      HmeVlrPrevisto    : Currency;
      HmeVlrEfetivo     : Currency;
      VlrJuros          : Currency;
      VlrPrincipal      : Currency;
      VlrEncargos       : Currency;
      VlrPagamento      : Currency;
      VlrDevido         : Currency;
      HmeSaldoDev       : Currency;
      HmeData           : TDateTime;
      HmeDataPrevista   : TDateTime;
      HmeDataVencto     : TDateTime;
      HmeDataEfetiva    : TDateTime;
      HmeDataAtualiza   : TDateTime;
      HmeAnoCompetencia : Integer;
      HmeMesCompetencia : Integer;
      HmeAnoCobranca    : Integer;
      HmeMesCobranca    : Integer;
      FlgBaixado        : Integer;
      FlgEnvio          : Integer;
      HmeRecPag         : String;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   TfrmExecCargaFCRTConfere = class(TFrmOkCancelarImob)
      qryContrato: TwwQuery;
      tblContrato: TwwTable;
      dsCC: TwwDataSource;
      dsParcela: TwwDataSource;
      qryParcela: TwwQuery;
      tblParcela: TwwTable;
      tblContratoMATRIC: TStringField;
      tblContratoSEQ: TStringField;
      tblContratoPROTOC: TStringField;
      tblContratoTIPO: TStringField;
      tblContratoCONVENIO: TStringField;
      tblContratoPARC_TOTAL: TStringField;
      tblContratoDIGITO: TStringField;
      tblContratoIENCARG: TStringField;
      tblContratoJUROS: TFloatField;
      tblContratoEMISSAO: TStringField;
      tblContratoAPROVACAO: TStringField;
      tblContratoCONCESSAO: TStringField;
      tblContratoPRIM_VCTO: TStringField;
      tblContratoULT_VCTO: TStringField;
      tblContratoULT_CAPIT: TStringField;
      tblContratoCANCEL: TStringField;
      tblContratoMOT_CANCEL: TStringField;
      tblContratoAUT_ESPEC: TStringField;
      tblContratoCONTAB: TStringField;
      tblContratoULT_PARC: TStringField;
      tblContratoCRED_APROV: TFloatField;
      tblContratoJUROS_APRO: TFloatField;
      tblContratoCORR_MONET: TFloatField;
      tblContratoTX_ADM: TFloatField;
      tblContratoVLR_BRUTO: TFloatField;
      tblContratoCOTA_QUIT: TFloatField;
      tblContratoSLD_FINANC: TFloatField;
      tblContratoSLD_ABERTO: TFloatField;
      tblContratoPRIM_PARC: TFloatField;
      tblContratoOUTR_PARC: TFloatField;
      tblContratoNUM_FAT: TStringField;
      tblContratoPATROC: TStringField;
      tblContratoCLS_PART: TStringField;
      tblContratoSIT_PART: TStringField;
      tblContratoBRANCO: TStringField;
      DBgrdContratos: TDBGrid;
      DBgrdParcelas: TDBGrid;
      tblParcelaMATRIC: TStringField;
      tblParcelaSEQ: TStringField;
      tblParcelaPROTOC: TStringField;
      tblParcelaTIPO: TStringField;
      tblParcelaNUM_PARCEL: TStringField;
      tblParcelaSEQ_PGTO: TStringField;
      tblParcelaDT_INCLU: TStringField;
      tblParcelaCONTABIL: TStringField;
      tblParcelaFOLHA: TStringField;
      tblParcelaDT_VCTO: TStringField;
      tblParcelaDT_CAPIT: TStringField;
      tblParcelaVLR_PRINCI: TFloatField;
      tblParcelaVLR_JUR_CO: TFloatField;
      tblParcelaVLR_CORR_M: TFloatField;
      tblParcelaVLR_TAXA: TFloatField;
      tblParcelaVLR_JUR_AT: TFloatField;
      tblParcelaCORR_MON_A: TFloatField;
      tblParcelaTX_ADM: TFloatField;
      tblParcelaJUR_INADI: TFloatField;
      tblParcelaCOR_MON_IN: TFloatField;
      tblParcelaVLR_DESC_A: TFloatField;
      tblParcelaVLR_TOT_PG: TFloatField;
      tblParcelaVLR_ULT_EN: TFloatField;
      tblParcelaSEQ_ULT_PG: TStringField;
      tblParcelaBRANCO: TStringField;
      qryParcelaMATRIC: TStringField;
      qryParcelaSEQ: TStringField;
      qryParcelaPROTOC: TStringField;
      qryParcelaTIPO: TStringField;
      qryParcelaNUM_PARCEL: TStringField;
      qryParcelaSEQ_PGTO: TStringField;
      qryParcelaDT_INCLU: TStringField;
      qryParcelaCONTABIL: TStringField;
      qryParcelaFOLHA: TStringField;
      qryParcelaDT_VCTO: TStringField;
      qryParcelaDT_CAPIT: TStringField;
      qryParcelaVLR_PRINCI: TFloatField;
      qryParcelaVLR_JUR_CO: TFloatField;
      qryParcelaVLR_CORR_M: TFloatField;
      qryParcelaVLR_TAXA: TFloatField;
      qryParcelaVLR_JUR_AT: TFloatField;
      qryParcelaCORR_MON_A: TFloatField;
      qryParcelaTX_ADM: TFloatField;
      qryParcelaJUR_INADI: TFloatField;
      qryParcelaCOR_MON_IN: TFloatField;
      qryParcelaVLR_DESC_A: TFloatField;
      qryParcelaVLR_TOT_PG: TFloatField;
      qryParcelaVLR_ULT_EN: TFloatField;
      qryParcelaSEQ_ULT_PG: TStringField;
      qryParcelaBRANCO: TStringField;
      qryTipoContr: TwwQuery;
      StringField1: TStringField;
      IntegerField1: TIntegerField;
      qryDistinct: TwwQuery;
      tblContratoFind: TwwTable;
      tblContratoFindMATRIC: TStringField;
      tblContratoFindSEQ: TStringField;
      tblContratoFindPROTOC: TStringField;
      tblContratoFindTIPO: TStringField;
      tblContratoFindCONVENIO: TStringField;
      tblContratoFindPARC_TOTAL: TStringField;
      tblContratoFindDIGITO: TStringField;
      tblContratoFindIENCARG: TStringField;
      tblContratoFindJUROS: TFloatField;
      tblContratoFindEMISSAO: TStringField;
      tblContratoFindAPROVACAO: TStringField;
      tblContratoFindCONCESSAO: TStringField;
      tblContratoFindPRIM_VCTO: TStringField;
      tblContratoFindULT_VCTO: TStringField;
      tblContratoFindULT_CAPIT: TStringField;
      tblContratoFindCANCEL: TStringField;
      tblContratoFindMOT_CANCEL: TStringField;
      tblContratoFindAUT_ESPEC: TStringField;
      tblContratoFindCONTAB: TStringField;
      tblContratoFindULT_PARC: TStringField;
      tblContratoFindCRED_APROV: TFloatField;
      tblContratoFindJUROS_APRO: TFloatField;
      tblContratoFindCORR_MONET: TFloatField;
      tblContratoFindTX_ADM: TFloatField;
      tblContratoFindVLR_BRUTO: TFloatField;
      tblContratoFindCOTA_QUIT: TFloatField;
      tblContratoFindSLD_FINANC: TFloatField;
      tblContratoFindSLD_ABERTO: TFloatField;
      tblContratoFindPRIM_PARC: TFloatField;
      tblContratoFindOUTR_PARC: TFloatField;
      tblContratoFindNUM_FAT: TStringField;
      tblContratoFindPATROC: TStringField;
      tblContratoFindCLS_PART: TStringField;
      tblContratoFindSIT_PART: TStringField;
      tblContratoFindBRANCO: TStringField;
      dsParcela2: TwwDataSource;
      qryContratoMATRIC: TStringField;
      qryContratoSEQ: TStringField;
      qryContratoPROTOC: TStringField;
      qryContratoTIPO: TStringField;
      qryContratoCONVENIO: TStringField;
      qryContratoPARC_TOTAL: TStringField;
      qryContratoDIGITO: TStringField;
      qryContratoIENCARG: TStringField;
      qryContratoJUROS: TFloatField;
      qryContratoEMISSAO: TStringField;
      qryContratoAPROVACAO: TStringField;
      qryContratoCONCESSAO: TStringField;
      qryContratoPRIM_VCTO: TStringField;
      qryContratoULT_VCTO: TStringField;
      qryContratoULT_CAPIT: TStringField;
      qryContratoCANCEL: TStringField;
      qryContratoMOT_CANCEL: TStringField;
      qryContratoAUT_ESPEC: TStringField;
      qryContratoCONTAB: TStringField;
      qryContratoULT_PARC: TStringField;
      qryContratoCRED_APROV: TFloatField;
      qryContratoJUROS_APRO: TFloatField;
      qryContratoCORR_MONET: TFloatField;
      qryContratoTX_ADM: TFloatField;
      qryContratoVLR_BRUTO: TFloatField;
      qryContratoCOTA_QUIT: TFloatField;
      qryContratoSLD_FINANC: TFloatField;
      qryContratoSLD_ABERTO: TFloatField;
      qryContratoPRIM_PARC: TFloatField;
      qryContratoOUTR_PARC: TFloatField;
      qryContratoNUM_FAT: TStringField;
      qryContratoPATROC: TStringField;
      qryContratoCLS_PART: TStringField;
      qryContratoSIT_PART: TStringField;
      qryContratoBRANCO: TStringField;
      tblContaCorrente: TwwTable;
      tblContaCorrenteCHAVE: TStringField;
      tblContaCorrentePREST: TStringField;
      tblContaCorrenteDEBITO: TStringField;
      tblContaCorrenteANTERIOR: TStringField;
      tblContaCorrenteCREDMES: TStringField;
      tblContaCorrenteFIL1: TStringField;
      tblContaCorrentePARC: TStringField;
      tblContaCorrenteFIL3: TStringField;
      tblContaCorrenteDT_VCT: TStringField;
      tblContaCorrenteFIL2: TStringField;
      tblContaCorrenteDT_PGT: TStringField;
      tblContaCorrenteSALDO: TStringField;
      tblContaCorrenteCAMPO7: TStringField;
      tblContaCorrentePROTOC: TStringField;
      tblContaCorrenteMATRIC: TStringField;
      DBGrid1: TDBGrid;
      tblParcela2: TwwTable;
      StringField2: TStringField;
      StringField3: TStringField;
      StringField4: TStringField;
      StringField5: TStringField;
      StringField6: TStringField;
      StringField7: TStringField;
      StringField8: TStringField;
      StringField9: TStringField;
      StringField10: TStringField;
      StringField11: TStringField;
      StringField12: TStringField;
      FloatField1: TFloatField;
      FloatField2: TFloatField;
      FloatField3: TFloatField;
      FloatField4: TFloatField;
      FloatField5: TFloatField;
      FloatField6: TFloatField;
      FloatField7: TFloatField;
      FloatField8: TFloatField;
      FloatField9: TFloatField;
      FloatField10: TFloatField;
      FloatField11: TFloatField;
      FloatField12: TFloatField;
      StringField13: TStringField;
      StringField14: TStringField;
      DBGrid2: TDBGrid;
      dsContrato: TwwDataSource;


   private { Private declarations }

   public { Public declarations }

   end;



var
  frmExecCargaFCRTConfere: TfrmExecCargaFCRTConfere;



implementation
{$R *.DFM}



end.



{


IDPROVENTO DESCRICAO                                                       NUMPRIORIDADE  NUMPRIORIDADEFB
---------- --------------------------------------------------------------- -------------  ---------------
3518       AÇÕES FINANCIAMENTOS                                            95             95
3519       AÇÕES FINANCIAMENTO PENDÊNCIA                                   106            106
3241       PAGAMENTO FARMÁCIA DO SESI                                      <null>         <null>
3242       PAGAMENTO EMPRÉSTIMO SIMPLES                                    <null>         <null>
3243       PAGAMENTO DE CONVENIOS DIVERSOS                                 <null>         <null>
3245       PAGAMENTO CONVÊNIO FÁCIL                                        <null>         <null>
3247       Fundação Convênios           (FCRT - AD 314) (FCRT-AP/PENS 314) <null>         <null>
3248       Devolução de Empréstimo                                         <null>         <null>
3250       Atraso de Empréstimo                                            <null>         <null>
3251       Atraso de Convênio                                              <null>         <null>
1432       CONVENIOS                                                       200            200
1435       EMPRESTIMOS                                                     200            200


IDRUBRICA  IDPESSOA   CODPROVDESC     DESCRPROVDESC
---------- ---------- --------------- --------------------------------
1432       1          52500           CONVENIOS
1435       1          52600           EMPRESTIMOS
3250       1          52600           Atraso de Empréstimo
3248       1          52600           Devolução de Empréstimo
3251       1          52500           Atraso de Convênio
3250       50028      7880            Atraso de Empréstimo
3248       50028      7880            Devolução de Empréstimo
3251       50028      7830            Atraso de Convênio
3242       50028      7880            PAGAMENTO EMPRÉSTIMO SIMPLES
3241       50028      7830            PAGAMENTO FARMÁCIA DO SESI
3243       50028      7830            PAGAMENTO DE CONVENIOS DIVERSOS
3245       50028      7880            PAGAMENTO CONVÊNIO FÁCIL
1432       50028      7830            CONVENIOS
1435       50028      7880            EMPRESTIMOS
3251       50031      7780            Atraso de Convênio
1432       50031      7780            CONVENIOS
3250       50031      7790            Atraso de Empréstimo
3248       50031      7790            Devolução de Empréstimo
1435       50031      7790            EMPRESTIMOS


}


{


IDCONTRATO IDTIPOCONTR IDPESSOA IDPATRO IDPLANO DATAASSINA VLRCONTRATO VLRPARCELA NUMPARCELAS DATACREDITO DATAPRIMPARC
---------- ----------- -------- ------- ------- ---------- ----------- ---------- ----------- ----------- ------------
1548025    18          3753     50031   3       31/05/2002 233,2       233,2      1           31/05/2002  30/06/2002
1648025    18          3753     50031   3       31/05/2002 233,74      233,74     1           31/05/2002  30/06/2002
1002236    19          2307     50031   3       13/09/2000 81,1        81,1       1           13/09/2000  30/09/2000
1002036    19          2307     50031   3       20/07/2000 82,24       82,24      1           20/07/2000  31/08/2000
1002136    19          2307     50031   3       01/08/2000 80,61       80,61      1           01/08/2000  31/08/2000
1050610    10          3591     50031   3       17/03/1995 13,58       13,58      1           17/03/1995  30/04/1995
1051911    10          3591     50031   3       24/03/1995 36,52       36,52      1           24/03/1995  30/04/1995
1052476    10          3591     50031   3       28/03/1995 6,44        6,44       1           28/03/1995  30/04/1995
1045494    9           6483     50031   16      14/04/1996 68,02       68,02      1           14/04/1996  30/04/1996
1047496    12          3153     50031   3       10/07/1996 30,83       30,83      1           10/07/1996  31/07/1996
2002536    19          6858     50031   16      12/12/2000 79,02       79,02      1           12/12/2000  31/12/2000
1002536    19          2307     50031   3       12/12/2000 79,02       79,02      1           12/12/2000  31/12/2000
1002336    19          2307     50031   3       18/10/2000 80,59       80,59      1           18/10/2000  30/11/2000
2002436    19          6858     50031   16      10/11/2000 80,41       80,41      1           10/11/2000  30/11/2000
1002436    19          2307     50031   3       10/11/2000 80,41       80,41      1           10/11/2000  30/11/2000


}
