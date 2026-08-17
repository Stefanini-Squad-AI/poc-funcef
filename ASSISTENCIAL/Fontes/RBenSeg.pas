unit RBenSeg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  StdCtrls,{$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptBenSeg = class(TFrmCmReport)
    RpBenSeg: TppReport;
    ppHeaderBand23: TppHeaderBand;
    ppLine34: TppLine;
    ppLine36: TppLine;
    ppLabelTituloSeg: TppLabel;
    ppDetailBand21: TppDetailBand;
    ppDBText195: TppDBText;
    ppDBTextTitular: TppDBText;
    ppDBText199: TppDBText;
    ppFooterBand21: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppSVarSistema: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummary: TppSummaryBand;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppLabel120: TppLabel;
    ppDBText198: TppDBText;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel118: TppLabel;
    ppGroupFooterBand13: TppGroupFooterBand;
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
    ppDBImage19: TppDBImage;
    ppDBText187: TppDBText;
    ppDBText188: TppDBText;
    ppDBText189: TppDBText;
    ppDBText190: TppDBText;
    ppLabel113: TppLabel;
    ppDBText191: TppDBText;
    ppDBText192: TppDBText;
    ppDBText193: TppDBText;
    ppDBText194: TppDBText;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBCalc3: TppDBCalc;
    QryRptCMBENEFICIARIO: TStringField;
    QryRptCMPATROCINADORA: TStringField;
    QryRptCMTITULAR: TStringField;
    QryRptCMMATRICULA: TStringField;
    QryRptCMSITUACAO: TStringField;
    QryRptCMPLANO: TStringField;
    QryRptCMDATAINCLUSAO: TDateTimeField;
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
  RptBenSeg: TRptBenSeg;

implementation

Uses uDataBase, uMensErro;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptBenSeg.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptBenSeg.CrmRptCMBeforePrint(Sender: TObject);
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

  With QryRptCM Do
  Begin
     If Active Then Close;

     sSql:=
       'SELECT'+
       ' PD.NOME AS BENEFICIARIO,'+
       ' PJ.NOME AS PATROCINADORA,'+
       ' PT.NOME AS TITULAR,'+
       ' EL.MATRICULA,'+
       ' DECODE(BG.FLGATIVO,1,''NORMAL'',0,''CANCELADO'') AS SITUACAO,'+
       ' PL.NOME AS PLANO,'+
       ' BG.TRGDTINCLUSAO AS DATAINCLUSAO'+

       ' FROM'+
       ' PESSOA PD,'+
       ' PESSOA PJ,'+
       ' PESSOA PT,'+
       ' ELEGPATRO EL,'+
       ' PARTASS PS,'+
       ' BENSEGASS BG,'+
       ' PLANASS PL'+

       ' WHERE'+
       ' (PT.IDPESSOA = PS.IDPESSOA) AND'+
       ' (PT.IDPESSOA = PT.IDPESSOA) AND'+
       ' (PT.IDPESSOA = EL.IDPESSOA) AND'+
       ' (PJ.IDPESSOA = PS.IDPESSJUR) AND';

     If Not CmpRptCM.ParamValues[0].IsNull Then
     begin
       ppSummary.Visible:=False;
       sSql := sSql+' (PJ.IDPESSOA='+CmpRptCM.ParamValues[0].AsString+') AND';
     end;

     sSql:= sSql+
       ' (PS.IDPESSOA = PS.IDPESSOA) AND'+
       ' (PS.IDPESSOA = BG.IDTITULAR) AND'+
       ' (PS.FLGINSCRICAOCANC = 0) AND'+
       ' (PS.IDPLANOPREV = BG.IDPLANOPREV) AND'+
       ' (PS.IDPLANASS = BG.IDPLANASS) AND'+
       ' (PD.IDPESSOA = BG.IDBENEFSEGURO) AND'+
       ' (BG.FLGATIVO = 1) AND'+
       ' (PS.IDPLANASS = PL.IDPLANASS)'+

       ' ORDER BY PLANO, PATROCINADORA, TITULAR, BENEFICIARIO';

    Sql.Clear;
    Sql.Add(sSql);

    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;
end;

procedure TRptBenSeg.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptBenSeg.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptBenSeg.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptBenSeg.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

end.
