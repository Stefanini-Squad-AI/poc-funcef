unit RBoletos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptBoletos = class(TFrmCmReport)
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
    rpBoletos: TppReport;
    rpRelBoletosHeaderBand1: TppHeaderBand;
    ppLabelTipo: TppLabel;
    ppDBImage8: TppDBImage;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppLabel94: TppLabel;
    ppDBText101: TppDBText;
    rpRelBoletosDetailBand1: TppDetailBand;
    rpRelBoletosDBText1: TppDBText;
    rpRelBoletosDBText2: TppDBText;
    rpRelBoletosDBText3: TppDBText;
    rpRelBoletosDBText4: TppDBText;
    rpRelBoletosDBText5: TppDBText;
    rpRelBoletosDBText6: TppDBText;
    rpRelBoletosFooterBand1: TppFooterBand;
    rpRelBoletosLine3: TppLine;
    ppLabelSistema: TppLabel;
    rpRelBoletosCalc1: TppSystemVariable;
    rpRelBoletosCalc2: TppSystemVariable;
    rpRelBoletosSummaryBand1: TppSummaryBand;
    rpRelBoletosDBCalc3: TppDBCalc;
    rpRelBoletosLabel12: TppLabel;
    rpRelBoletosDBCalc4: TppDBCalc;
    rpRelBoletosLabel13: TppLabel;
    rpRelBoletosLine5: TppLine;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBProduto: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabelDataEmissao: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure FormCreate(Sender: TObject);
    procedure ppLabelDataEmissaoPrint(Sender: TObject);
    procedure ppLabelTipoPrint(Sender: TObject);
  private
    { Private declarations }
    Procedure CloseQry;
   
  public
    { Public declarations }
  end;

var
  RptBoletos: TRptBoletos;

implementation

Uses uDataBase, uAdmAss;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptBoletos.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptBoletos.CrmRptCMBeforePrint(Sender: TObject);
Var sSql :String;
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
      'SELECT DISTINCT '+
      'P.IDPESSOA,'+
      'EL.MATRICULA,'+
      'DC.NODOCUMENTO,'+
      'P.NOME,'+
      'LC.VALOR,'+
      'DC.DATAEMISSAO,'+
      'DC.DATAVENCTO,'+
      'PD.NOME AS PRODUTO,'+
      'PJ.NOME AS LOCAL,'+
      'ST.IDSITPART,'+
      'ST.DESCRICAO,'+
      'DECODE(DC.STATUS,''0'',''EM ABERTO'','+
      '''1'',''PENDENTE'',''2'',''BAIXADO'') AS STATUS '+
      ' FROM '+
      ' PESSOA       P,'+
      ' PESSOA       PJ,'+
      ' DEPENTIT     DT,'+
      ' PARTPREVPLAN PV,'+
      ' ELEGPATRO    EL,'+
      ' PARTASS      PT,'+
      ' BENEFASS     BF,'+
      ' PLANASS      PL,'+
      ' PRODASS      PD,'+
      ' LANCTODOCUM  LC,'+
      ' DOCUMENTO    DC,'+
      ' SITPART      ST '+
      ' WHERE '+
      ' PV.IDPESSOA = P.IDPESSOA'+
      ' AND PV.IDPESSOA = EL.IDPESSOA'+
      ' AND PV.IDPESSJUR = PJ.IDPESSOA'+
      ' AND PV.IDPESSOA = PT.IDPESSOA'+
      ' AND PV.IDPESSJUR = PT.IDPESSJUR'+
      ' AND PV.IDPLANOPREV = PT.IDPLANOPREV'+
      ' AND PT.IDPESSOA = BF.IDTITULAR'+
      ' AND BF.IDDEPENDENTE = DT.IDPESSOA'+
      ' AND DT.IDPESSOA   = DC.IDFORCLI'+
      ' AND DC.IDMODULO   = 17'+
      ' AND LC.CODDOCUMENTO = DC.CODDOCUMENTO'+
      ' AND LC.NUMLANCTO    = LC.NUMLANCTO ';

    If CmpRptCM.ParamValues[0].AsString<>'' Then
       sSql := sSql+' AND TO_CHAR(DC.DATAEMISSAO,''YYYY/MM'') = '+
        Chr(39)+CmpRptCM.ParamValues[0].AsString+Chr(39)
    else Exit;

    sSql := sSql+
      ' AND PT.IDPLANASS=PL.IDPLANASS'+
      ' AND PL.IDPRODASS=PD.IDPRODASS'+
      ' AND PV.IDSITPART = ST.IDSITPART';

    If CmpRptCM.ParamValues[1].AsString='REC' Then
      sSql:=sSql+' AND (DC.STATUS = ''2'') '
    else
      If CmpRptCM.ParamValues[1].AsString='PEN' Then
        // FERNANDO - P. 16259 - INICIO
        // sSql:=sSql+' AND (DC.STATUS = ''0'') ';
        sSql:=sSql+' AND (DC.STATUS IN (''0'',''1'')) ';
        // FERNANDO - P. 16259 - FIM

    sSql := sSql+' ORDER BY PRODUTO,P.NOME';

    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;
end;

procedure TRptBoletos.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptBoletos.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptBoletos.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptBoletos.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptBoletos.ppLabelDataEmissaoPrint(Sender: TObject);
begin
  inherited;
  If CmpRptCM.ParamValues[0].AsString<>'' Then
   ppLabelDataEmissao.Text:='Ano/Mês de Emissão: '+CmpRptCM.ParamValues[0].AsString
  else ppLabelDataEmissao.Text:='Ano/Mês de Emissão: TODAS.';
end;

procedure TRptBoletos.ppLabelTipoPrint(Sender: TObject);
begin
  inherited;
  If CmpRptCM.ParamValues[1].AsString='APR' then
    ppLabelTipo.Text:='BOLETOS (Apropriação)'
  else
  If CmpRptCM.ParamValues[1].AsString='REC' then
    ppLabelTipo.Text:='BOLETOS (Recebidos)'
  else
    If CmpRptCM.ParamValues[1].AsString='PEN' then
       ppLabelTipo.Text:='BOLETOS (Pendência)';
end;

end.
