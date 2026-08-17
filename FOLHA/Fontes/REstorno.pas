// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qryEstRub filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit REstorno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, DBTables,
  Wwquery, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands, ppCache,
  ppDB, ppDBPipe, ppDBBDE, ppPrnabl, ppCtrls, UDatabase, ppVar, ppStrtch,
  ppMemo, uAdmPrevFB, TXRB;

type
  TRptEstorno = class(TFrmCmReport)
    qryEstRub: TwwQuery;
    ppEstRub: TppBDEPipeline;
    rptEstRub: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBImage17: TppDBImage;
    ppDBText165: TppDBText;
    qryFundacao: TwwQuery;
    dtsEstRub: TwwDataSource;
    dtsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    ppLabel87: TppLabel;
    ppLine1: TppLine;
    ppCalc39: TppSystemVariable;
    ppLabel90: TppLabel;
    ppCalc40: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppLabel6: TppLabel;
    ppDBText8: TppDBText;
    ppLine2: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText22: TppDBText;
    qryFundacaoIDPESSOA: TFloatField;
    qryFundacaoNOME: TStringField;
    qryFundacaoRAZAOSOCIAL: TStringField;
    qryFundacaoLOGRADOURO: TStringField;
    qryFundacaoNUMERO: TStringField;
    qryFundacaoCOMPLEMENTO: TStringField;
    qryFundacaoBAIRRO: TStringField;
    qryFundacaoCIDADE: TStringField;
    qryFundacaoCODESTADO: TStringField;
    qryFundacaoCEP: TStringField;
    qryFundacaoIMAGEM: TBlobField;
    qryFundacaoENDERECO: TStringField;
    qryFundacaoBARCIDUF: TStringField;
    lblTpEstorno: TppLabel;
    ppDBText3: TppDBText;
    qryEstRubGRUPO: TStringField;
    qryEstRubIDHSTFOLHABENEF: TFloatField;
    qryEstRubIDPESSJUR: TFloatField;
    qryEstRubIDPLANOPREV: TFloatField;
    qryEstRubIDTITULAR: TFloatField;
    qryEstRubIDRECEBEDOR: TFloatField;
    qryEstRubTIPOESTORNO: TStringField;
    qryEstRubDATAESTORNO: TDateTimeField;
    qryEstRubPATROCINADORA: TStringField;
    qryEstRubMOTIVO: TStringField;
    qryEstRubINSCRICAONUMERO: TFloatField;
    qryEstRubMATRICULA: TStringField;
    qryEstRubTITULAR: TStringField;
    qryEstRubRECEBEDOR: TStringField;
    qryEstRubHISTORICO: TStringField;
    qryEstRubPLANO: TStringField;
    qryEstRubMES: TStringField;
    qryEstRubESTADO: TStringField;
    qryEstRubCODIGO: TStringField;
    qryEstRubRUBRICA: TStringField;
    qryEstRubVALOR: TFloatField;
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptEstorno: TRptEstorno;

implementation

Uses uObjFolha;

{$R *.DFM}

procedure TRptEstorno.CrmRptCMChangeDataBaseName(Sender: TObject;
  sDataBaseName: String);
begin
  inherited;
  ChangeDataBaseName( [qryEstRub,qryFundacao], sDataBaseName );
end;

procedure TRptEstorno.CrmRptCMBeforePrint(Sender: TObject);
var
	sSelect : String;
  nAux : integer;
begin
  inherited;
  try
    QryFundacao.Close;
    QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
    qryFundacao.Open;
  except
  end;

  sSelect := 'SELECT	PJ.NOME||PV.NOME||E.MATRICULA||PR.NOME||                ' + #13 +
             'to_char( ME.IDHSTFOLHABENEF ) as GRUPO,                        ' + #13 +
             'ME.IDHSTFOLHABENEF,                                            ' + #13 +
             'ME.IDPESSJUR,                                                  ' + #13 +
             'ME.IDPLANOPREV,                                                ' + #13 +
             'ME.IDTITULAR,                                                  ' + #13 +
             'ME.IDRECEBEDOR,                                                ' + #13 +
             ' DECODE(ME.TIPOESTORNO, '+
               ' 0, ''ESTORNO COMPLETO DA FOLHA'', '+
               ' 11, ''PAGAMENTO PENDENTE COM ALTERADOR (CAP NÃO BAIXADO)'', '+
               ' 12, ''ESTORNO POR ERRO COM ALTERADOR (CAP NÃO BAIXADO)'', '+
               ' 13, ''NOVO CAP COM ALTERADOR (CAP NÃO BAIXADO)'', '+
               ' 14, ''REPROCESSAMENTO COM ALTERADOR (CAP NÃO BAIXADO)'', '+
               ' 21, ''PAGAMENTO PENDENTE COM CAR (BANCO) (CAP BAIXADO)'', '+
               ' 22, ''ESTORNO POR ERRO COM CAR (PAGADOR) (CAP BAIXADO)'', '+
               ' 23, ''NOVO CAP COM CAR (PAGADOR) (CAP BAIXADO)'', '+
               ' 24, ''REPROCESSAMENTO COM CAR (PAGADOR) (CAP BAIXADO)'', '+
               ' 25, ''ALTERAÇÃO DA FORMA DE PAGAMENTO (DOCUMENTO COM ÚNICO RECEBEDOR)'') AS TIPOESTORNO, '+
             'ME.DATAESTORNO,                                                ' + #13 +
             'PJ.NOME as PATROCINADORA,                                      ' + #13 +
             'ME.MOTIVO,                                                     ' + #13 +
             'PP.INSCRICAONUMERO,                                            ' + #13 +
             'E.MATRICULA,                                                   ' + #13 +
             'PT.NOME as TITULAR,                                            ' + #13 +
             'PR.NOME as RECEBEDOR,                                          ' + #13 +
             'HF.HISTORICO,                                                  ' + #13 +
             'PV.NOME as PLANO,                                              ' + #13 +
             'H.MES,                                                         ' + #13 +
             'DECODE( PD.FLGESPECIAL, NULL, NULL,                            ' + #13 +
             'DECODE( PD.FLGESPECIAL, 0, DECODE( PD.FLGDESCONTO, 0, ''P'',   ' + #13 +
             ' 1, ''D'', ''I'' ), ''I'' ) ) AS ESTADO,                       ' + #13 ;

  If SistemaFolha.FlgUsaCodRubExt = 0 Then
    sSelect := sSelect +
             'TO_CHAR(PD.IDPROVENTO) AS CODIGO,                              ' + #13 +
             'PD.DESCRICAO AS RUBRICA,                                       ' + #13 +
             'DECODE(H.VALORPROVENTO,0,H.VALORINFO,H.VALORPROVENTO) AS VALOR ' + #13
  Else
    sSelect := sSelect +
             'PD.CODPROVDESC AS CODIGO,                                      ' + #13 +
             'PD.DESCRPROVDESC AS RUBRICA,                                   ' + #13 +
             'DECODE(H.VALORPROVENTO,0,H.VALORINFO,H.VALORPROVENTO) AS VALOR ' + #13 ;

  sSelect := sSelect +
             ' FROM                                                          ' + #13 +
             'MOTIVOESTORNOFB ME,                                            ' + #13 +
             'PESSOA PJ,                                                     ' + #13 +
             'PESSOA PT,                                                     ' + #13 +
             'PESSOA PR,                                                     ' + #13 +
             'PARTPREVPLAN PP,                                               ' + #13 +
             'ELEGPATRO E,                                                   ' + #13 +
             'HSTFOLHABENEF HF,                                              ' + #13 +
             'PLANPREV PV,                                                   ' + #13 +
             'HISTRUBSAL H,                                                  ' + #13 +
             'PROVDESC PD                                                    ' + #13 +
             ' WHERE                                                             ' + #13 +
             '( ME.IDHSTFOLHABENEF  = HF.IDHSTFOLHABENEF    ) AND            ' + #13 +
             '( ME.IDPESSJUR		      = PP.IDPESSJUR      (+) ) AND            ' + #13 +
             '( ME.IDTITULAR			     = E.IDPESSOA        (+) ) AND            ' + #13 +
             '( ME.IDPESSJUR	  	    = E.IDPESSJUR     		(+) ) AND            ' + #13 +
             '( ME.IDTITULAR  		    = PT.IDPESSOA       (+) ) AND            ' + #13 +
             '( ME.IDPLANOPREV      = PV.IDPLANOPREV    (+) ) AND            ' + #13 +
             '( ME.IDPESSJUR  	   		= PJ.IDPESSOA       (+) ) AND            ' + #13 +
             '( ME.IDTITULAR	  		   = PP.IDPESSOA       (+) ) AND            ' + #13 +
             '( ME.IDPLANOPREV		    = PP.IDPLANOPREV    (+) ) AND            ' + #13 +
             '( ME.IDRECEBEDOR  		  = PR.IDPESSOA       (+) ) AND            ' + #13 +
             '( ME.IDPESSJUR        = H.IDPATRO         (+) ) AND            ' + #13 +
             '( ME.IDHSTFOLHABENEF  = H.IDHSTFOLHABENEF (+) ) AND            ' + #13 +
             '( ME.IDTITULAR        = H.IDTITULAR       (+) ) AND            ' + #13 +
             '( ME.IDRECEBEDOR      = H.IDRESPONSAVEL   (+) ) AND            ' + #13 +
             '( ME.IDPLANOPREV      = H.IDPLANOPREV     (+) ) AND            ' + #13 +
             '( H.IDRUBRICA         = PD.IDPROVENTO     (+) )                ' + #13 ;

	if not CmpRptCM.ParamValues[0].IsNull then
  sSelect := sSelect +
   ' and ( ME.IDPESSJUR  = ' + CmpRptCM.ParamValues[0].AsString + ' ) ' + #13;

	if not CmpRptCM.ParamValues[1].IsNull then
  sSelect := sSelect +
   ' and ( ME.IDHSTFOLHABENEF  = ' + CmpRptCM.ParamValues[1].AsString + ' ) ' + #13;

	if not CmpRptCM.ParamValues[2].IsNull then
  sSelect := sSelect +
   ' and ( ME.IDPLANOPREV  = ' + CmpRptCM.ParamValues[2].AsString + ' ) ' + #13;

	if not CmpRptCM.ParamValues[3].IsNull then
  sSelect := sSelect +
   ' and ( PT.NOME like ''' + UpperCase( CmpRptCM.ParamValues[3].AsString ) + '%'' ) ' + #13;


	if not CmpRptCM.ParamValues[4].IsNull then
  begin
    nAux := StrToIntDef( CmpRptCM.ParamValues[4].AsString, -1 );
    if nAux > 0 then
		  sSelect := sSelect +
  	   ' and ( PP.INSCRICAONUMERO = ' + IntToStr( nAux ) + ' ) ' + #13;
	end;

	if not CmpRptCM.ParamValues[5].IsNull then
  begin
    nAux := StrToIntDef( CmpRptCM.ParamValues[5].AsString, -1 );
    if nAux > 0 then
		  sSelect := sSelect +
  	   ' and ( E.MATRICULA = ' + QuotedStr( IntToStr( nAux ) ) + ' ) ' + #13;
  end;

	if not CmpRptCM.ParamValues[6].IsNull then
  sSelect := sSelect +
     ' and ( PR.NOME like ''' + UpperCase( CmpRptCM.ParamValues[6].AsString ) + '%'' ) ' + #13;

	if not CmpRptCM.ParamValues[7].IsNull then
  	sSelect := sSelect +
     ' and ( ME.DATAESTORNO >= ' + QuotedStr( CmpRptCM.ParamValues[7].AsString ) + ' ) ';

	if not CmpRptCM.ParamValues[8].IsNull then
  	sSelect := sSelect +
     ' and ( ME.DATAESTORNO <= ' + QuotedStr( CmpRptCM.ParamValues[8].AsString ) + ' ) ';

	sSelect := sSelect +
             'ORDER BY ' + #13 +
             'GRUPO, ' + #13 +
             'H.SEQRUBRICA ' + #13 ;

 	qryEstRub.SQL.Text := sSelect;
  qryEstRub.Open;

end;

end.
{==============================================================================|
| UNIT                       : FRelEstorno.pas                                 |
| DESCRIÇÃO FUNCIONAL        : Imprimir dados sobre estornos segundo           |
|                              parametrização definida pelo usuário.           |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR              : David Ayrolla dos Santos                        |
| PERÍODO DE IMPLEMENTAÇÃO   : de 11/01/2001 a 17/01/2001                      |
| VERSÃO PARA LIBERAÇÃO      : 3.02.11c                                        |
| CLIENTE                    : REFER                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO : Criação do relatório.                           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR              : David Ayrolla dos Santos                        |
| PERÍODO DE IMPLEMENTAÇÃO   : de 06/03/2001 a 06/03/2001                      |
| VERSÃO PARA LIBERAÇÃO      : 3.02.11e                                        |
| CLIENTE                    : FUNCEF                                          |
| DESCRIÇÃO DA IMPLEMENTAÇÃO : Alteração da query que traz os dados do estorno,|
|                              para que sejam trazidos inclusive aqueles sem   |
|                              tiular, patrocinadora, plano ou responsável     |
|                              específicos.                                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 12/04/2002 A 12/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12i                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NA QUERY qryEstRub SUBSTITUINDO IDPESSJUR POR IDPATRO            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03/05/2002 A 03/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12k                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CORREÇÃO NA CONSULTA DA TELA DE PARAMETRIZAÇÃO DO RELATÓRIO PARA O CAMPO   |
| VERSÃO DA FOLHA.                                                             |
| - ALTERAÇÃO DA QUERY QRYFUNDACAO QUE ESTAVA MUITO LENTA.                     |
| - ALTERAÇÃO PARA COLOCAR A COLUNA VALOR COM 2 DECIMAIS                       |
|                                                                              |
|------------------------------------------------------------------------------}

