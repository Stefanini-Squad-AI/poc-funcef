unit RDRubric;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptDRubric = class(TFrmCmReport)
    PpRptCM: TppBDEPipeline;
    DsRptCM: TwwDataSource;
    Cds: TClientDataSet;
    Dsp: TDataSetProvider;
    QryRptCM: TwwQuery;
    AQryFundacao: TADOQuery;
    ppFundacao: TppBDEPipeline;
    ppFundacaoppField1: TppField;
    ppFundacaoppField2: TppField;
    ppFundacaoppField3: TppField;
    ppFundacaoppField4: TppField;
    ppFundacaoppField5: TppField;
    ppFundacaoppField6: TppField;
    ppFundacaoppField7: TppField;
    ppFundacaoppField8: TppField;
    ppFundacaoppField9: TppField;
    ppFundacaoppField10: TppField;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    DspFundacao: TDataSetProvider;
    CdsFundacao: TClientDataSet;
    aQryRptCm: TADOQuery;
    rpDRubric: TppReport;
    ppHeaderBand19: TppHeaderBand;
    ppLabel69: TppLabel;
    rpRelRubricaAssLabel2: TppLabel;
    rpRelRubricaAssLine1: TppLine;
    rpRelRubricaAssLine2: TppLine;
    rpRelRubricaAssLabel1: TppLabel;
    rpRelRubricaAssLabel3: TppLabel;
    rpRelRubricaAssLabel4: TppLabel;
    rpRelRubricaAssLabel5: TppLabel;
    rpRelRubricaAssLabel6: TppLabel;
    rpRelRubricaAssLabel7: TppLabel;
    rpRelRubricaAssLine3: TppLine;
    ppDBImage7: TppDBImage;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppLabel60: TppLabel;
    ppDBText93: TppDBText;
    ppDetailBand17: TppDetailBand;
    rpRelRubricaAssDBText1: TppDBText;
    rpRelRubricaAssDBText2: TppDBText;
    rpRelRubricaAssDBText3: TppDBText;
    rpRelRubricaAssDBText4: TppDBText;
    rpRelRubricaAssDBText5: TppDBText;
    rpRelRubricaAssDBText6: TppDBText;
    ppFooterBand17: TppFooterBand;
    ppLine28: TppLine;
    rpRelRubricaAssLabel20: TppLabel;
    ppCalc37: TppSystemVariable;
    ppCalc38: TppSystemVariable;
    rpRelRubricaAssSummaryBand1: TppSummaryBand;
    rpRelRubricaAssGroup5: TppGroup;
    rpRelRubricaAssGroupHeaderBand5: TppGroupHeaderBand;
    rpRelRubricaAssGroupFooterBand5: TppGroupFooterBand;
    rpRelRubricaAssDBCalc3: TppDBCalc;
    rpRelRubricaAssDBCalc4: TppDBCalc;
    rpRelRubricaAssLabel11: TppLabel;
    rpRelRubricaAssLabel12: TppLabel;
    rpRelRubricaAssLine6: TppLine;
    rpRelRubricaAssLine7: TppLine;
    rpRelRubricaAssLabel13: TppLabel;
    rpRelRubricaAssLabel14: TppLabel;
    rpRelRubricaAssLabel15: TppLabel;
    rpRelRubricaAssLabel16: TppLabel;
    rpRelRubricaAssLabel17: TppLabel;
    rpRelRubricaAssLabel18: TppLabel;
    rpRelRubricaAssCalc4: TppVariable;
    rpRelRubricaAssCalc5: TppVariable;
    rpRelRubricaAssCalc6: TppVariable;
    rpRelRubricaAssCalc7: TppVariable;
    rpRelRubricaAssCalc8: TppVariable;
    rpRelRubricaAssCalc9: TppVariable;
    rpRelRubricaAssCalc10: TppVariable;
    rpRelRubricaAssCalc11: TppVariable;
    rpRelRubricaAssCalc12: TppVariable;
    rpRelRubricaAssGroup1: TppGroup;
    rpRelRubricaAssGroupHeaderBand1: TppGroupHeaderBand;
    rpRelRubricaAssGroupFooterBand1: TppGroupFooterBand;
    rpRelRubricaAssGroup2: TppGroup;
    rpRelRubricaAssGroupHeaderBand2: TppGroupHeaderBand;
    rpRelRubricaAssLabel8: TppLabel;
    rpRelRubricaAssGroupFooterBand2: TppGroupFooterBand;
    rpRelRubricaAssDBCalc1: TppDBCalc;
    rpRelRubricaAssDBCalc2: TppDBCalc;
    ppLine27: TppLine;
    rpRelRubricaAssLabel9: TppLabel;
    rpRelRubricaAssLabel10: TppLabel;
    rpRelRubricaAssLine4: TppLine;
    rpRelRubricaAssCalc1: TppVariable;
    rpRelRubricaAssCalc2: TppVariable;
    rpRelRubricaAssCalc3: TppVariable;
    rpRelRubricaAssGroup3: TppGroup;
    rpRelRubricaAssGroupHeaderBand3: TppGroupHeaderBand;
    rpRelRubricaAssGroupFooterBand3: TppGroupFooterBand;
    rpRelRubricaAssLine5: TppLine;
    rpRelRubricaAssGroup4: TppGroup;
    rpRelRubricaAssGroupHeaderBand4: TppGroupHeaderBand;
    rpRelRubricaAssGroupFooterBand4: TppGroupFooterBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure ppDBTextTitularPrint(Sender: TObject);
  private
    { Private declarations }
    iTotal: Integer;
  public
    { Public declarations }
  end;

var
  RptDRubric: TRptDRubric;

implementation


Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }


procedure TRptDRubric.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql :String;
begin
  inherited;
  iTotal:=0;
    {**
    Evento utilizado para montagem do(s) sql(´s) do relatório de acordo com
    os parâmetros do ParamReports CmpRptCM.
    Os parêmetros podem ser acessados pelo índice (PARAMVALUES) ou pelo nome (PARAMBYNAME).
    É interessante observar o tipo de conexão em uso oque implica que o(s) SQL(´s) montados
    sejam atribuidos ao DATASET correto ou a todos os DATASET´S
  **}

  With QryRptCM Do
  Begin
    If Active Then Close;

    sSql:='';
     
    Sql.Clear; 
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptDRubric.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptDRubric.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptDRubric.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptDRubric.ppDBTextTitularPrint(Sender: TObject);
begin
  inherited;
 iTotal:=iTotal+1;
end;

end.
