unit RDTotalCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptDTotalCalc = class(TFrmCmReport)
    PpRptCM: TppBDEPipeline;
    DsRptCM: TwwDataSource;
    Cds: TClientDataSet;
    Dsp: TDataSetProvider;
    QryRptCM: TwwQuery;
    AQryFundacao: TADOQuery;
    ppFundacao: TppBDEPipeline;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    DspFundacao: TDataSetProvider;
    CdsFundacao: TClientDataSet;
    aQryRptCm: TADOQuery;
    rpDTotalCalc: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLabel40: TppLabel;
    ppLabel42: TppLabel;
    ppDBText1: TppDBText;
    ppDBImage3: TppDBImage;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppLabel41: TppLabel;
    ppDBText61: TppDBText;
    DetalheTotalCalc: TppDetailBand;
    RodapeRelTotalContrib: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppCalc29: TppSystemVariable;
    ppCalc30: TppSystemVariable;
    SummaryBand: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    CabecalhoGruporpPATRORelTotalContrib: TppGroupFooterBand;
    ppLabel45: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel46: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLabel47: TppLabel;
    lblQtdTotal: TppLabel;
    rpRelaCalcContribAssGroup1: TppGroup;
    rpRelaCalcContribAssGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel48: TppLabel;
    rpRelaCalcContribAssGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel49: TppLabel;
    ppDBText5: TppDBText;
    ppLabel50: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLabel51: TppLabel;
    dbValorPatroTotal: TppDBCalc;
    lblPatroTotal: TppLabel;
    lbQtdTitular: TppLabel;
    lbQtdPatro: TppLabel;
    rpRelTotalContribGroup1: TppGroup;
    rpRelTotalContribGroupHeaderBand1: TppGroupHeaderBand;
    rpRelTotalContribGroupFooterBand1: TppGroupFooterBand;
    QryRptCMPATROCINADORA: TStringField;
    QryRptCMIDPESSJUR: TFloatField;
    QryRptCMPLANO: TStringField;
    QryRptCMIDPLANASS: TFloatField;
    QryRptCMINSCRICAO: TFloatField;
    QryRptCMDEPENDENTE: TStringField;
    QryRptCMTITULAR: TStringField;
    QryRptCMVALOR: TFloatField;
    QryRptCMMESREFERENCIA: TStringField;
    QryRptCMMESCOBRANCA: TStringField;
    QryRptCMTIT: TFloatField;
    QryRptCMFLGINTERNO: TStringField;
    QryRptCMVLRPATRO: TFloatField;
    QryRptCMPAG: TStringField;
    ppLine1: TppLine;
    ppDBTextValor: TppDBText;
    ppDBTextValorPatro: TppDBText;
    ppLine2: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure FormCreate(Sender: TObject);
    procedure lblQtdTotalPrint(Sender: TObject);
    procedure rpDTotalCalcBeforePrint(Sender: TObject);
    procedure lbQtdTitularPrint(Sender: TObject);
    procedure lbQtdPatroPrint(Sender: TObject);
    procedure ppDBTextValorPrint(Sender: TObject);
    procedure ppDBTextValorPatroPrint(Sender: TObject);
  private
    { Private declarations }
    QtdTitular, QtdPatro, QtdTotal : Integer;
  public
    { Public declarations }
  end;

var
  RptDTotalCalc: TRptDTotalCalc;

implementation


Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }


procedure TRptDTotalCalc.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql :String;
begin
  inherited;
 
    {**
    Evento utilizado para montagem do(s) sql(´s) do relatório de acordo com
    os parâmetros do ParamReports CmpRptCM.
    Os parêmetros podem ser acessados pelo índice (PARAMVALUES) ou pelo nome (PARAMBYNAME).
    É interessante observar o tipo de conexão em uso oque implica que o(s) SQL(´s) montados
    sejam atribuidos ao DATASET correto ou a todos os DATASET´S
  **}
  //sSql := '';

  With QryRptCM Do
  Begin
     If Active Then Close;

     sSql:=
       'SELECT'+
       ' PJ.NOME AS PATROCINADORA,'+
       ' PJ.IDPESSOA AS IDPESSJUR,'+
       ' PA.NOME AS PLANO,'+
       ' PA.IDPLANASS,'+
       ' PPP.INSCRICAONUMERO AS INSCRICAO,'+
       ' P.NOME AS DEPENDENTE,'+
       ' PT.NOME AS TITULAR,'+
       ' H.VALORESPERADO AS VALOR,'+
       ' H.MES AS MESREFERENCIA,'+
       ' H.MESCOBRANCA,'+
       ' DECODE(DT.IDDEPENDENCIA,''PRP'',0,1) AS TIT,'+
       ' S.FLGINTERNO,'+
       ' QRYPATRO.VLRPATRO,'+
       ' DECODE(H.FLGCOBCARNE,0,''Folha '',''Banco '') || DECODE(S.FLGINTERNO,''AT'','+
       ' DECODE(H.FLGCOBCARNE,0,''de Pagamento'',''Débito em Conta''),''AS'','+
       ' DECODE(H.FLGCOBCARNE,0,''de Benefício'',''Carnê''),''MA'',''Carnê'') AS PAG'+
       ' FROM'+
       ' HSTCONTRIBASS H,'+
       ' PARTPREVPLAN PPP,'+
       ' PESSOA P,'+
       ' PESSOA PJ,'+
       ' PESSOA PT,'+
       ' PLANASS PA,'+
       ' CONTRIBASS CA,'+
       ' DEPENTIT DT,'+
       ' SITPART S,'+
       ' (SELECT H2.VALORESPERADO AS VLRPATRO,'+
       ' H2.IDPESSJUR,'+
       ' H2.IDPLANOPREV,'+
       ' H2.IDTITULAR,'+
       ' H2.IDDEPENDENTE,'+
       ' H2.IDPLANASS,'+
       ' H2.MES,'+
       ' H2.MESCOBRANCA'+
       
       ' FROM HSTCONTRIBASS H2'+
       ' WHERE H2.IDPAGADOR = H2.IDPESSJUR AND ';
     If Not CmpRptCM.ParamValues[0].IsNull Then
      sSql := sSql+' H2.MES = '+ Chr(39) +
       CmpRptCM.ParamValues[0].AsString + Chr(39)+ ') QRYPATRO'
     else Exit;  

     sSql:=sSql+
       ' WHERE'+
       ' (H.IDTITULAR = H.IDPAGADOR) AND'+
       ' (H.IDTITULAR = PPP.IDPESSOA) AND'+
       ' (H.IDPESSJUR    = PPP.IDPESSJUR) AND'+
       ' (H.IDPLANOPREV  = PPP.IDPLANOPREV) AND'+
       ' (H.IDTITULAR    =  PT.IDPESSOA) AND'+
       ' (H.IDDEPENDENTE =   P.IDPESSOA) AND'+
       ' (H.IDPESSJUR    =  PJ.IDPESSOA) AND'+
       ' (H.IDPLANASS    =  PA.IDPLANASS) AND'+
       ' (H.IDPLANASS    =  CA.IDPLANASS) AND'+
       ' (H.IDCONTASS    =  CA.IDCONTASS) AND'+
       ' (H.IDTITULAR    =  QRYPATRO.IDTITULAR(+)) AND'+
       ' (H.IDPESSJUR    =  QRYPATRO.IDPESSJUR(+)) AND'+
       ' (H.IDDEPENDENTE =  QRYPATRO.IDDEPENDENTE(+)) AND'+
       ' (H.IDPLANOPREV  =  QRYPATRO.IDPLANOPREV(+)) AND'+
       ' (H.IDPLANASS    =  QRYPATRO.IDPLANASS(+)) AND';
       
     If Not CmpRptCM.ParamValues[0].IsNull Then
      sSql := sSql+' (H.MES = '+ Chr(39) +
       CmpRptCM.ParamValues[0].AsString + Chr(39)+ ') AND'
     else Exit;  

     sSql:=sSql+
       ' (H.MES = QRYPATRO.MES(+)) AND'+
       ' (H.MESCOBRANCA = QRYPATRO.MESCOBRANCA(+)) AND'+
       ' (DT.IDTITULAR = H.IDTITULAR) AND'+
       ' (DT.IDPESSOA = H.IDDEPENDENTE) AND'+
       ' (PPP.IDSITPART = S.IDSITPART)'+
      
       ' ORDER BY PJ.NOME,PAG,PT.NOME,P.NOME';
    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptDTotalCalc.CrmRptCMChangeDataBaseName(Sender: TObject;
  sDataBaseName: String);
begin
  inherited;
  {**
    Ente evento é disparado quando é atribuído o DataBaseName a ser utilizado
    pelos BDEDATASETS do relatório.
    A função ChangeDataBaseName auxilia na atribuição do mesmo pois tem como
    parâmetro um ARRAY de DATASETS onde podemos atrbuir a todos os datasets do form
    a alteração do DATABSENAME. Esta função esta na uDataBase
  **}
  ChangeDataBaseName([QryRptCM,QryFundacao],sDataBaseName);
end;

procedure TRptDTotalCalc.CrmRptCMChangeConnectionType(Sender: TObject;
  ConnectionType: TDbConnectionType);
begin
  inherited;
  {**
    O tipo de conexão pode variar de acordo com o tipo de aplicação
    e isso implica que sejam apontados para os respectivos DATASETPROVIDERS
    as Queryes de acordo com o tipo de Conexão.
    Temos hoje as seguintes conexões previstas:
    cntBDE >> BDE
    cntADO >> ADO
    cntIB  >> Inter Base
    cntDOA >> Direct Oracle Acces
  **}
  Case ConnectionType of
    cntBDE: begin
              Dsp.DataSet := QryRptCM;
              DspFundacao.Dataset := QryFundacao;
            end;
    cntADO: begin
              Dsp.DataSet := aQryRptCM;
              DspFundacao.DataSet :=aQryFundacao;
            end;

    cntIB: ;
    cntDOA: ;
  End;
end;

procedure TRptDTotalCalc.CrmRptCMChangeConnection(Sender: TObject;
  Connection: TADOConnection);
begin
  inherited;
  {**
    Assim como no OnChangeDataBaseName, se estamos utilizando a conexão via
    ADO temos que atribuir o ADOCONNECTION do nosso sistema as Queryes ADO do
    form de relatório
   *}
  AQryRptCM.Connection := Connection;
  AQryFundacao.Connection := Connection;
end;

procedure TRptDTotalCalc.FormCreate(Sender: TObject);
begin
  inherited;
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptDTotalCalc.lblQtdTotalPrint(Sender: TObject);
begin
  inherited;
  lblQtdTotal.Text := IntToStr(QtdTotal);
  QtdTotal := 0;
end;

procedure TRptDTotalCalc.rpDTotalCalcBeforePrint(Sender: TObject);
begin
  inherited;
  QtdTitular := 0;
  QtdPatro   := 0;
  QtdTotal   := 0;
end;

procedure TRptDTotalCalc.lbQtdTitularPrint(Sender: TObject);
begin
  inherited;
  lbQtdTitular.Text:= IntToStr(QtdTitular);
  QtdTotal := QtdTotal + QtdTitular;
  QtdTitular := 0;
end;

procedure TRptDTotalCalc.lbQtdPatroPrint(Sender: TObject);
begin
  inherited;
  lbQtdPatro.Text:= IntToStr(QtdPatro);
  QtdTotal := QtdTotal + QtdPatro;
  QtdPatro     := 0;
end;

procedure TRptDTotalCalc.ppDBTextValorPrint(Sender: TObject);
begin
  inherited;
  if ppDBTextValor.Text <> '' then  Inc(QtdTitular,1);
end;

procedure TRptDTotalCalc.ppDBTextValorPatroPrint(Sender: TObject);
begin
  inherited;
  if ppDBTextValorPatro.Text <> '' then  Inc(QtdPatro,1);
end;

end.





