unit RProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptProduto = class(TFrmCmReport)
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
    rpProduto: TppReport;
    QryRptCMNOME: TStringField;
    QryRptCMDESCRICAO: TStringField;
    ppHeaderBand8: TppHeaderBand;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    rpprodassistenciasintLabel1: TppLabel;
    rpprodassistenciasintLabel2: TppLabel;
    ppDBImage9: TppDBImage;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppLabel95: TppLabel;
    ppDBText109: TppDBText;
    ppDetailBand8: TppDetailBand;
    rpprodassistenciasintDBText1: TppDBText;
    rpprodassistenciasintDBText2: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine15: TppLine;
    ppLabelSistema: TppLabel;
    ppCalc15: TppSystemVariable;
    ppCalc16: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabelTotal: TppLabel;
    ppLine1: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rpProdutoBeforePrint(Sender: TObject);
    procedure rpprodassistenciasintDBText1Print(Sender: TObject);
    procedure ppLabelTotalPrint(Sender: TObject);
  private
    { Private declarations }
    Procedure CloseQry;
  public
    { Public declarations }
  end;

var
  RptProduto: TRptProduto;
  iTotal   : Integer;

implementation
      
Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptProduto.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptProduto.CrmRptCMBeforePrint(Sender: TObject);
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

     sSql:='SELECT PROD.NOME, PROD.DESCRICAO'+
           ' FROM PRODASS PROD, PLANASS PLAN'+
           ' WHERE PROD.IDPRODASS = PLAN.IDPRODASS'+
           ' ORDER BY PROD.NOME';

    Sql.Clear; 
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptProduto.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptProduto.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptProduto.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptProduto.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

procedure TRptProduto.rpProdutoBeforePrint(Sender: TObject);
begin
  inherited;
  iTotal:=0;
end;

procedure TRptProduto.rpprodassistenciasintDBText1Print(Sender: TObject);
begin
  inherited;
  iTotal:=iTotal+1;
end;

procedure TRptProduto.ppLabelTotalPrint(Sender: TObject);
begin
  inherited;
  ppLabelTotal.Caption:='Total de Produtos => '+IntToStr(iTotal);
end;

end.
