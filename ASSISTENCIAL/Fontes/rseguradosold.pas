unit RSegurados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  StdCtrls;

type
  TRptSegurados = class(TFrmCmReport)
    RpSeg: TppReport;
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
    ppLabelTotal: TppLabel;
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
    ppLabelDataCancel: TppLabel;
    ppDBTextDataCancel: TppDBText;
    ppDBCalc2: TppDBCalc;
    QryRptCMTITULAR: TStringField;
    QryRptCMPATROCINADORA: TStringField;
    QryRptCMPLANO: TStringField;
    QryRptCMDATAENTRADA: TDateTimeField;
    QryRptCMDATACANCELAMENTO: TDateTimeField;
    QryRptCMMATRICULA: TStringField;
    QryRptCMINSCRICAO: TFloatField;
    QryRptCMDATAINSCRICAO: TDateTimeField;
    QryRptCMFLGINTERNO: TStringField;
    QryRptCMSITPARTICIPANTE: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
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
  RptSegurados: TRptSegurados;

implementation

Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptSegurados.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptSegurados.CrmRptCMBeforePrint(Sender: TObject);
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
          ' PT.NOME AS TITULAR,'+
          ' PJ.NOME AS PATROCINADORA,'+
          ' PL.NOME AS PLANO,'+
          ' BF.DATAENTRADA,'+
          ' PS.DATACANCELAMENTO,'+
          ' EL.MATRICULA AS MATRICULA,'+
          ' PP.INSCRICAONUMERO AS INSCRICAO,'+
          ' PS.DATAENTRADA AS DATAINSCRICAO,'+
          ' SP.FLGINTERNO,'+
          ' ST.DESCRICAO AS SITUACAO,'+
          ' SP.DESCRICAO AS SITPARTICIPANTE'+

          ' FROM'+
          ' PESSOA PT,'+
          ' PESSOA PJ,'+
          ' PESSOAFISICA PF,'+
          ' PARTPREVPLAN PP,'+
          ' ELEGPATRO EL,'+
          ' PARTASS PS,'+
          ' BENEFASS BF,'+
          ' PLANASS PL,'+
          ' SITPART ST,'+
          ' SITPLANOASS SP'+

          ' WHERE'+

          ' (PT.IDPESSOA=PF.IDPESSOA) AND'+
          ' (PT.IDPESSOA=PT.IDPESSOA) AND'+
          ' (PT.IDPESSOA=PP.IDPESSOA) AND'+

          ' (PT.IDPESSOA=EL.IDPESSOA) AND'+
          ' (PT.IDPESSOA=BF.IDTITULAR) AND'+
          ' (PT.IDPESSOA=PS.IDPESSOA) AND';

          If Not CmpRptCM.ParamValues[0].IsNull Then
          begin
            ppSummary.Visible:=False;
            sSql := sSql+' (PJ.IDPESSOA='+CmpRptCM.ParamValues[0].AsString+') AND';
          end
          else Exit;

          sSql:=sSql+
          ' (PJ.IDPESSOA=PP.IDPESSJUR) AND'+
          ' (PJ.IDPESSOA=PJ.IDPESSOA) AND'+
          ' (PJ.IDPESSOA=EL.IDPESSJUR) AND'+
          ' (PJ.IDPESSOA=PS.IDPESSJUR) AND'+
          ' (PJ.IDPESSOA=BF.IDPESSJUR) AND'+

          ' (PP.IDPESSJUR=PS.IDPESSJUR)AND'+
          ' (PP.IDPESSOA=PP.IDPESSOA) AND'+
          ' (PP.IDPLANOPREV=PS.IDPLANOPREV) AND'+
          ' (PP.IDSITPART=ST.IDSITPART) AND'+

          ' (EL.IDPESSJUR=PS.IDPESSJUR) AND'+

          ' (PS.IDPESSOA=BF.IDTITULAR) AND'+

          ' (PS.IDSITPART=SP.IDSITPLANOASS) AND';

          If Not CmpRptCM.ParamValues[1].IsNull Then
            sSql := sSql+' (SP.IDSITPLANOASS='+CmpRptCM.ParamValues[1].AsString+') AND';

          sSql:=sSql+

          ' (BF.IDPLANASS=PS.IDPLANASS) AND'+
          ' (BF.IDPLANASS=PL.IDPLANASS)'+

          ' ORDER BY PLANO, PATROCINADORA, TITULAR';
    Sql.Clear;
    Sql.Add(sSql);

    Open;
    AQryRptCM.Sql.Assign(Sql);
    
    If QryRptCM.FieldByName('FlgInterno').AsString<>'CA' then
    begin
      ppLabelDataCancel.Visible:=False;
      ppDbTextDataCancel.Visible:=False;
    end;
  End;

end;

procedure TRptSegurados.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptSegurados.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptSegurados.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptSegurados.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

end.

(*
    SELECT
            PT.NOME AS TITULAR,
            PJ.NOME AS PATROCINADORA,
            PL.NOME AS PLANO,
            BF.DATAENTRADA,
            PS.DATACANCELAMENTO,
            EL.MATRICULA AS MATRICULA,
            PP.INSCRICAONUMERO AS INSCRICAO,
            PS.DATAENTRADA AS DATAINSCRICAO,
            SP.FLGINTERNO,
            ST.DESCRICAO AS SITUACAO,
            SP.DESCRICAO AS SITPARTICIPANTE

            FROM
            PESSOA PT,
            PESSOA PJ,
            PESSOAFISICA PF,
            PARTPREVPLAN PP,
            ELEGPATRO EL,
            PARTASS PS,
            BENEFASS BF,
            PLANASS PL,
            SITPART ST,
            SITPLANOASS SP

            WHERE

            (PT.IDPESSOA=PF.IDPESSOA) AND
            (PT.IDPESSOA=PT.IDPESSOA) AND
            (PT.IDPESSOA=PP.IDPESSOA) AND

            (PT.IDPESSOA=EL.IDPESSOA) AND
            (PT.IDPESSOA=BF.IDTITULAR) AND
            (PT.IDPESSOA=PS.IDPESSOA) AND

            (PJ.IDPESSOA=  1) AND

            (PJ.IDPESSOA=PP.IDPESSJUR) AND
            (PJ.IDPESSOA=PJ.IDPESSOA) AND
            (PJ.IDPESSOA=EL.IDPESSJUR) AND
            (PJ.IDPESSOA=PS.IDPESSJUR) AND
            (PJ.IDPESSOA=BF.IDPESSJUR) AND

            (PP.IDPESSJUR=PS.IDPESSJUR)AND
            (PP.IDPESSOA=PP.IDPESSOA) AND
            (PP.IDPLANOPREV=PS.IDPLANOPREV) AND
            (PP.IDSITPART=ST.IDSITPART) AND

            (EL.IDPESSJUR=PS.IDPESSJUR) AND

            (PS.IDPESSOA=BF.IDTITULAR) AND

            (PS.IDSITPART=SP.IDSITPLANOASS) AND

            (SP.IDSITPLANOASS='NO') AND

            (BF.IDPLANASS=PS.IDPLANASS) AND
            (BF.IDPLANASS=PL.IDPLANASS)

            ORDER BY PLANO, PATROCINADORA, TITULAR *)
