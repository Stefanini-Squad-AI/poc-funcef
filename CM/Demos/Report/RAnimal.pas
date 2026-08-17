unit RAnimal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema;

type
  TRptAnimal = class(TFrmCmReport)
    RptCM: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBImage1: TppDBImage;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    PpRptCM: TppBDEPipeline;
    DsRptCM: TwwDataSource;
    QryRptCM: TwwQuery;
    QryRptCMNAME: TStringField;
    QryRptCMSIZE: TSmallintField;
    QryRptCMWEIGHT: TSmallintField;
    QryRptCMAREA: TStringField;
    QryRptCMBMP: TBlobField;
    LblEmpresa: TppLabel;
    LblSistema: TppLabel;
    AQryRptCM: TADOQuery;
    Dsp: TDataSetProvider;
    Cds: TClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptAnimal: TRptAnimal;

implementation


Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }


procedure TRptAnimal.CrmRptCMBeforePrint(Sender: TObject);
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
  sSql := '';
  With QryRptCM Do
  Begin
     If Active Then Close;

     If Not CmpRptCM.ParamValues[0].IsNull Then
        sSql := ' WHERE NAME ' +
                CmpRptCM.ParamValues[0].Comparador + ' ''' +
                CmpRptCM.ParamValues[0].AsString + '''';

     If Not CmpRptCM.ParamValues[1].IsNull Then
     Begin
        If sSql = '' Then
           sSql := ' WHERE AREA ' +
                   CmpRptCM.ParamValues[1].Comparador + ' ''' +
                   CmpRptCM.ParamValues[1].AsString + ''''
        Else
           sSql := sSql + ' AND AREA ' +
                   CmpRptCM.ParamValues[1].Comparador + ' ''' +
                   CmpRptCM.ParamValues[1].AsString + '''';
     End;

     Sql.Text := 'SELECT * FROM ANIMALS' + sSql;

     AQryRptCM.Sql.Assign(Sql);
  End;
end;

procedure TRptAnimal.CrmRptCMChangeDataBaseName(Sender: TObject;
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
  ChangeDataBaseName([QryRptCM],sDataBaseName);
end;

procedure TRptAnimal.CrmRptCMChangeConnectionType(Sender: TObject;
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
    cntBDE: Dsp.DataSet := QryRptCM;
    cntADO: Dsp.DataSet := aQryRptCM;
    cntIB: ;
    cntDOA: ;
  End;
end;

procedure TRptAnimal.CrmRptCMChangeConnection(Sender: TObject;
  Connection: TADOConnection);
begin
  inherited;
  {**
    Assim como no OnChangeDataBaseName, se estamos utilizando a conexão via
    ADO temos que atribuir o ADOCONNECTION do nosso sistema as Queryes ADO do
    form de relatório
   *}
  AQryRptCM.Connection := Connection;
end;

end.
