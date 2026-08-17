unit RInadimp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptInadimp = class(TFrmCmReport)
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
    rpInadimp: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLabel37: TppLabel;
    ppLine22: TppLine;
    ppDBImage12: TppDBImage;
    ppDBText126: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppDBText129: TppDBText;
    ppDBText130: TppDBText;
    ppLabel38: TppLabel;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppDetailBand14: TppDetailBand;
    rpInadimplentesDBText2: TppDBText;
    rpInadimplentesDBText3: TppDBText;
    rpInadimplentesDBText4: TppDBText;
    rpInadimplentesDBText5: TppDBText;
    rpInadimplentesDBText6: TppDBText;
    rpInadimplentesDBText7: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppLine23: TppLine;
    ppLabelSistema: TppLabel;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    rpInadimplentesGroup1: TppGroup;
    rpInadimplentesGroupHeaderBand1: TppGroupHeaderBand;
    rpInadimplentesDBText1: TppDBText;
    rpInadimplentesLabel1: TppLabel;
    rpInadimplentesLabel2: TppLabel;
    rpInadimplentesLabel3: TppLabel;
    rpInadimplentesLabel4: TppLabel;
    rpInadimplentesLabel5: TppLabel;
    rpInadimplentesLabel6: TppLabel;
    rpInadimplentesGroupFooterBand1: TppGroupFooterBand;
    ppLabelTotal: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure ppLabelTotalPrint(Sender: TObject);
    procedure rpInadimplentesDBText2Print(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure CloseQry;

  public
    { Public declarations }
  end;

var
  RptInadimp: TRptInadimp;
  iTotal    : Integer;

implementation


Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptInadimp.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptInadimp.CrmRptCMBeforePrint(Sender: TObject);
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

     sSql:=
       'SELECT'+
       ' PA.NOME NOMEPLANO, H.MES, PT.NOME NOMETIT,'+
       ' PD.NOME NOMEDEP, H.VALORESPERADO, H.VALORRECEBIDO,'+
       ' CO.NOME NOMECONTRIBUICAO, PA.IDREGRACANCELAME, H.DATA,'+
       ' H.DATAPREVISAO'+
       ' FROM'+
       ' HSTCONTRIBASS H, PLANASS PA, PESSOA PT, PESSOA PD,'+
       ' CONTRIBUICAO CO, CONTRIBASS CA'+
       ' WHERE'+
       ' (H.IDPLANASS = PA.IDPLANASS) AND'+
       ' (H.IDCONTASS = CO.IDCONTRIBUICAO) AND'+
       ' (H.IDDEPENDENTE = PD.IDPESSOA) AND'+
       ' (H.IDTITULAR = PT.IDPESSOA) AND'+
       ' (H.SITRECEBIMENTO = 3) AND'+    {} {COLOCAR SINAL <> CASO FOR TESTE}
       ' (H.DATAPREVISAO < H.DATA) AND'+    {} //inibir caso for teste
       ' (H.IDCONTASS = CA.IDCONTASS) AND'+
       ' (H.IDPLANASS = CA.IDPLANASS) AND'+
       ' (CA.PAGADOR = ''C'')'+
       ' ORDER BY PT.NOME';
    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptInadimp.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptInadimp.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptInadimp.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptInadimp.ppLabelTotalPrint(Sender: TObject);
begin
  inherited;
  ppLabelTotal.Caption:='Total => '+IntToStr(iTotal);
  iTotal:=0;
end;

procedure TRptInadimp.rpInadimplentesDBText2Print(Sender: TObject);
begin
  inherited;
  Inc(iTotal,1);
end;

procedure TRptInadimp.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptInadimp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

end.
