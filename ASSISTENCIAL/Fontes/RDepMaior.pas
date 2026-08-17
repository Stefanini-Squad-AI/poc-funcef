unit RDepMaior;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptDepMaior = class(TFrmCmReport)
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
    rpDepMaior: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLabel52: TppLabel;
    ppDBImage2: TppDBImage;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppLabel53: TppLabel;
    ppDBText53: TppDBText;
    ppDetailBand16: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText9: TppDBText;
    rpRelDepenMaioridadeLabel2: TppLabel;
    RodapeDepenMaioridade: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppCalc31: TppSystemVariable;
    ppCalc32: TppSystemVariable;
    rpRelDepenMaioridadeSummaryBand1: TppSummaryBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText11: TppDBText;
    lblGrupoMaioridade: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText19: TppDBText;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    QryRptCMPATROCINADORA: TStringField;
    QryRptCMTITULAR: TStringField;
    QryRptCMINSCRICAO: TFloatField;
    QryRptCMDEPENDENTE: TStringField;
    QryRptCMIDDEPENDENCIA: TStringField;
    QryRptCMDATANASC: TDateTimeField;
    QryRptCMGRUPO: TStringField;
    QryRptCMIDADE: TFloatField;
    QryRptCMFLGINTERNO: TStringField;
    ppDBText3: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppLabelTotalPrint(Sender: TObject);
    procedure lblGrupoMaioridadePrint(Sender: TObject);
    procedure rpDepMaiorBeforePrint(Sender: TObject);
    procedure ppDBText17Print(Sender: TObject);
  private
    { Private declarations }
    Procedure CloseQry;

  public
    { Public declarations }
  end;

var
  RptDepMaior     : TRptDepMaior;
//  iTotal          : Integer;

implementation

Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptDepMaior.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptDepMaior.CrmRptCMBeforePrint(Sender: TObject);
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
      'SELECT DISTINCT'+
      ' PJ.NOME AS PATROCINADORA,'+
      ' UPPER(PT.NOME) AS TITULAR,'+
      ' PPP.INSCRICAONUMERO AS INSCRICAO,'+
      ' UPPER(PD.NOME) AS DEPENDENTE,'+
      ' DT.IDDEPENDENCIA,'+
      ' PF.DATANASC,'+
      ' IDADES.GRUPO,'+
      ' TRUNC((SYSDATE - PF.DATANASC)/365.5) AS IDADE,'+
      ' ST.FLGINTERNO'+

      ' FROM'+
      ' PESSOA PT,'+
      ' PESSOA PJ,'+
      ' PESSOA PD,'+
      ' PESSOAFISICA PF,'+
      ' PARTPREVPLAN PPP,'+
      ' DEPENTIT DT,'+
      ' BENEFASS B,'+
      ' PARTASS PA,'+
      ' SITPART ST,'+
      ' (SELECT 21 AS IDADEMIN, 24 AS IDADEMAX, ''G1'' AS GRUPO FROM DUAL UNION'+
      ' SELECT 25 AS IDADEMIN, 99 AS IDADEMAX, ''G2'' AS GRUPO FROM DUAL) IDADES'+

      ' WHERE'+
      ' (DT.IDDEPENDENCIA = ''FIL'') AND'+  {}  //INIBIR CASO FOR TESTE
      ' (ST.FLGINTERNO = ''AT'' ) AND'+
      ' (PA.IDPESSOA = PPP.IDPESSOA) AND'+
      ' (PA.IDPESSJUR = PPP.IDPESSJUR) AND'+
      ' (PA.IDPLANOPREV = PPP.IDPLANOPREV) AND'+
      ' (PA.SEQPROPOSTA = PPP.SEQPROPOSTA) AND'+

      ' (PA.IDPESSOA = PT.IDPESSOA) AND'+
      ' (PA.IDPESSJUR = PJ.IDPESSOA) AND';

     If Not CmpRptCM.ParamValues[0].IsNull Then
           sSql := sSql+' (PJ.IDPESSOA='+CmpRptCM.ParamValues[0].AsString+') AND';

     sSql:=sSql+
      ' (PA.IDPESSOA = DT.IDTITULAR) AND'+
      ' (DT.IDPESSOA = PD.IDPESSOA) AND'+
      ' (PD.IDPESSOA = PF.IDPESSOA) AND'+

      ' (PPP.IDSITPART = ST.IDSITPART) AND'+
      ' (TRUNC((SYSDATE - PF.DATANASC)/365.5) >= IDADES.IDADEMIN) AND'+  
      ' (TRUNC((SYSDATE - PF.DATANASC)/365.5) <= IDADES.IDADEMAX) AND'+  

      ' (PA.IDPESSOA = B.IDTITULAR) AND'+
      ' (PA.IDPESSJUR = B.IDPESSJUR) AND'+
      ' (PA.IDPLANOPREV = B.IDPLANOPREV) AND'+
      ' (PA.SEQPROPOSTA = B.SEQPROPOSTA) AND'+
      ' (DT.IDTITULAR = B.IDTITULAR) AND'+
      ' (DT.IDPESSOA = B.IDDEPENDENTE)'+

      ' ORDER BY PATROCINADORA, IDADES.GRUPO, PF.DATANASC DESC';
    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptDepMaior.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptDepMaior.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptDepMaior.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptDepMaior.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptDepMaior.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

procedure TRptDepMaior.ppLabelTotalPrint(Sender: TObject);
begin
  inherited;
//  ppLabelTotal.Caption:='Total => '+IntToStr(iTotal);
//  iTotal:=0;
end;

procedure TRptDepMaior.lblGrupoMaioridadePrint(Sender: TObject);
begin
  inherited;
  if QryRptCm.FieldByName('GRUPO').AsString = 'G1' then
     lblGrupoMaioridade.Text := 'Maiores de 21 anos e Menores de 24'
  else lblGrupoMaioridade.Text := 'Maiores de 24 anos';
end;

procedure TRptDepMaior.rpDepMaiorBeforePrint(Sender: TObject);
begin
  inherited;
//  iTotal:=0;
end;

procedure TRptDepMaior.ppDBText17Print(Sender: TObject);
begin
  inherited;
//  Inc(iTotal,1);
end;

end.
