unit rlancamentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptLancamentos = class(TFrmCmReport)
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
    rpLancamentos: TppReport;
    rpRelBoletosHeaderBand1: TppHeaderBand;
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
    ppLine1: TppLine;
    rpRelBoletosDetailBand1: TppDetailBand;
    rpRelBoletosDBText3: TppDBText;
    rpRelBoletosDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppLine5: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppDBText6: TppDBText;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppVarValor: TppVariable;
    rpRelBoletosFooterBand1: TppFooterBand;
    rpRelBoletosLine3: TppLine;
    ppLabelSistema: TppLabel;
    rpRelBoletosCalc1: TppSystemVariable;
    rpRelBoletosCalc2: TppSystemVariable;
    rpRelBoletosSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabelTipo: TppLabel;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppLabel10: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLabel4: TppLabel;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel8: TppLabel;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText1: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine20: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure CloseQry;
   
  public
    { Public declarations }
  end;

var
  RptLancamentos: TRptLancamentos;

implementation

Uses uDataBase, uAdmAss;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptLancamentos.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptLancamentos.CrmRptCMBeforePrint(Sender: TObject);
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
     'SELECT '+
     ' PL.PLNPLANIL AS PLANILHA, '+
     ' PL.PLNDATDIA AS DATA_PLANILHA, '+
     ' PL.PERNUMERO||''/''||PL.PEREXERCICIO AS REFERENCIA, '+
     ' PL.PLNTOTDEB AS TOTAL_DEBITO, '+
     ' PL.PLNTOTCRE AS TOTAL_CREDITO, '+
     ' LC.LACNUMLAN AS ORDEM, '+
     ' LC.LACDEBCRE AS DEB_CRED, '+
     ' LC.PLACONTA, '+
     ' LC.LACHIST2 AS PRODUTO, '+
     ' LC.LACHIST1||'', ''||LC.LACHIST2||'', ''||LC.LACHIST3||'', ''||'+
     ' LC.LACHIST4||'', ''||LC.LACHIST5 AS HISTORICO, '+
     ' LC.LACVALOR '+
     ' FROM PLANILHA PL, LANCAMENTO LC '+
     ' WHERE PL.IDMODULO = '+IntToStr(Sistema.IdModulo);
    If CmpRptCM.ParamValues[0].AsString<>'' Then
      sSql := sSql+' AND TO_CHAR(PL.PLNDATDIA,''DD/MM/YYYY'') = '+
        Chr(39)+CmpRptCM.ParamValues[0].AsString+Chr(39)
    else Exit;
    sSql := sSql+
     ' AND PL.PLNCODIGO = LC.PLNCODIGO '+
     ' ORDER BY LC.PLNCODIGO, LC.LACNUMLAN ';
    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;
end;

procedure TRptLancamentos.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptLancamentos.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptLancamentos.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptLancamentos.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

end.
