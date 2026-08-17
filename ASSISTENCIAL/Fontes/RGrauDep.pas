unit RGrauDep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptGrauDep = class(TFrmCmReport)
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
    rpGrauDep: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppLabel54: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppLabel26: TppLabel;
    ppDBText44: TppDBText;
    ppDetailBand15: TppDetailBand;
    ppDBTextDependente: TppDBText;
    ppLabel57: TppLabel;
    rpRelGrauDependenciaDBText1: TppDBText;
    ppFooterBand15: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppCalc33: TppSystemVariable;
    ppCalc34: TppSystemVariable;
    rpRelGrauDependenciaSummaryBand: TppSummaryBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText13: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText18: TppDBText;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel70: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLabelTotal: TppLabel;
    ppLabelTotalPatro: TppLabel;
    ppLine1: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure ppDetailBand15BeforeGenerate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rpGrauDepBeforePrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppLabelTotalPrint(Sender: TObject);
    procedure ppLabelTotalPatroPrint(Sender: TObject);
  private
    { Private declarations }
    Procedure CloseQry;

  public
    { Public declarations }
  end;

var
  RptGrauDep: TRptGrauDep;
  iTotalPatro,
  iTotal: Integer;

implementation

Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptGrauDep.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptGrauDep.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql :String;
begin
  inherited;
  iTotal:=0;
  iTotalPatro:=0;
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
      'SELECT  DISTINCT'+
        ' PJ.NOME AS PATROCINADORA,'+
        ' UPPER(PT.NOME) AS TITULAR,'+
        ' PPP.INSCRICAONUMERO AS INSCRICAO,'+
        ' UPPER(PD.NOME) AS DEPENDENTE,'+
        ' D.DESCRICAO AS GRAUDEPEN,'+
        ' ST.DESCRICAO AS SITUACAO'+

      ' FROM'+
        ' PESSOA PT,'+
        ' PESSOA PJ,'+
        ' PESSOA PD,'+
        ' PARTPREVPLAN PPP,'+
        ' DEPENTIT DT,'+
        ' BENEFASS B,'+
        ' PARTASS PA,'+
        ' DEPEN D,'+
        ' SITPART ST'+

      ' WHERE'+

        ' (B.DTCANCELAMENTO IS NULL) AND'+
        ' (ST.FLGINTERNO = ''AT'' ) AND'+
        ' (D.IDDEPENDENCIA <> ''PRP'' ) AND'+ {} //colocar sinal = caso for teste
        ' (PA.IDPESSOA = PPP.IDPESSOA) AND'+
        ' (PA.IDPESSJUR = PPP.IDPESSJUR) AND'+
        ' (PA.IDPLANOPREV = PPP.IDPLANOPREV) AND'+
        ' (PA.SEQPROPOSTA = PPP.SEQPROPOSTA) AND'+

        ' (PA.IDPESSOA = B.IDTITULAR) AND'+
        ' (PA.IDPESSJUR = B.IDPESSJUR) AND'+
        ' (PA.IDPLANOPREV = B.IDPLANOPREV) AND'+
        ' (PA.SEQPROPOSTA = B.SEQPROPOSTA) AND'+
        ' (DT.IDTITULAR = B.IDTITULAR) AND'+
        ' (DT.IDPESSOA = B.IDDEPENDENTE) AND'+

        ' (PA.IDPESSOA = PT.IDPESSOA) AND'+
        ' (PA.IDPESSJUR = PJ.IDPESSOA) AND';

     If Not CmpRptCM.ParamValues[0].IsNull Then
       sSql := sSql+' (PJ.IDPESSOA = '+CmpRptCM.ParamValues[0].AsString +') AND';

     sSql:=sSql+
        ' (PA.IDPESSOA = DT.IDTITULAR) AND'+
        ' (DT.IDPESSOA = PD.IDPESSOA) AND'+
        ' (DT.IDDEPENDENCIA = D.IDDEPENDENCIA) AND'+

        ' (PPP.IDSITPART = ST.IDSITPART)'+

        ' ORDER BY PATROCINADORA, TITULAR';
    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptGrauDep.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptGrauDep.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptGrauDep.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptGrauDep.ppDetailBand15BeforeGenerate(Sender: TObject);
begin
  inherited;
  Inc(iTotal,1);
  Inc(iTotalPatro,1);
end;

procedure TRptGrauDep.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptGrauDep.rpGrauDepBeforePrint(Sender: TObject);
begin
  inherited;
  iTotal:=0;
end;

procedure TRptGrauDep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

procedure TRptGrauDep.ppLabelTotalPrint(Sender: TObject);
begin
  inherited;
  ppLabelTotal.Caption:='Total do Relatório => '+IntToStr(iTotal);
  iTotal:=0;
end;

procedure TRptGrauDep.ppLabelTotalPatroPrint(Sender: TObject);
begin
  inherited;
  ppLabelTotalPatro.Caption:='Total da Patrocinadora => '+IntToStr(iTotalPatro);
  iTotalPatro:=0;
end;

end.
