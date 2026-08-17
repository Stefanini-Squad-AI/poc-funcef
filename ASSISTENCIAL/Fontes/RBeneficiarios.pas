unit RBeneficiarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptBeneficiarios = class(TFrmCmReport)
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
    rpBenef: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppLabel87: TppLabel;
    ppDBImage17: TppDBImage;
    ppDBText165: TppDBText;
    ppDBText166: TppDBText;
    ppDBText167: TppDBText;
    ppDBText168: TppDBText;
    ppLabel98: TppLabel;
    ppDBText169: TppDBText;
    ppDBText170: TppDBText;
    ppDBText171: TppDBText;
    ppDBText172: TppDBText;
    ppDetailBand18: TppDetailBand;
    ppDBText36: TppDBText;
    ppDBText40: TppDBText;
    ppFooterBand18: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppCalc39: TppSystemVariable;
    ppCalc40: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    rpRelBenSaudeLabel6: TppLabel;
    rpRelBenSaudeLabel7: TppLabel;
    rpRelBenSaudeCalc3: TppVariable;
    rpRelBenSaudeCalc4: TppVariable;
    rpRelBenSaudeGroup2: TppGroup;
    rpRelBenSaudeGroupHeaderBand2: TppGroupHeaderBand;
    rpRelBenSaudeGroupFooterBand2: TppGroupFooterBand;
    rpRelBenSaudeLabel4: TppLabel;
    rpRelBenSaudeLabel5: TppLabel;
    rpRelBenSaudeCalc1: TppVariable;
    rpRelBenSaudeCalc2: TppVariable;
    rpRelBenSaudeLabel3: TppLabel;
    rpRelBenSaudeDBText2: TppDBText;
    rpRelBenSaudeDBText1: TppDBText;
    rpRelBenSaudeLabel2: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    rpRelBenSaudeLabel1: TppLabel;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppDBText43: TppDBText;
    ppDBText49: TppDBText;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    QryRptCMDEPENDENTE: TStringField;
    QryRptCMTITULAR: TStringField;
    QryRptCMRESPONSAVEL: TStringField;
    QryRptCMGRAU_DEPEN: TStringField;
    QryRptCMPATROCINADORA: TStringField;
    QryRptCMPRODUTO: TStringField;
    QryRptCMPLANO: TStringField;
    QryRptCMMES: TStringField;
    QryRptCMINSCRICAO: TFloatField;
    QryRptCMSITUACAO: TStringField;
    PpRptCMppField1: TppField;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure CloseQry;
  public
    { Public declarations }
  end;

var
  RptBeneficiarios: TRptBeneficiarios;

implementation

Uses uDataBase;

{$R *.DFM}

Procedure TRptBeneficiarios.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptBeneficiarios.CrmRptCMBeforePrint(Sender: TObject);
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

  With QryRptCM Do
  Begin
     If Active Then Close;
     
     sSql:='SELECT'+
           ' UPPER(PD.NOME) AS DEPENDENTE,'+
           ' UPPER(PT.NOME) AS TITULAR,'+
           ' UPPER(PR.NOME) AS RESPONSAVEL,'+
           ' UPPER(DP.DESCRICAO) AS GRAU_DEPEN,'+
           ' RTRIM(PJ.NOME) AS PATROCINADORA,'+
           ' PS.NOME AS PRODUTO,'+
           ' PA.NOME AS PLANO,'+
           ' HT.MES,'+
           ' PP.INSCRICAONUMERO AS INSCRICAO,'+
           ' DECODE(ST.FLGINTERNO,''AS'',''ASSISTIDO'','+
                                ' ''CA'',''CANCELADO'','+
                                ' ''MA'',''MANTIDO'','+
                                ' ''AT'',''ATIVO'') AS SITUACAO'+
           ' FROM'+
           ' PESSOA PD,'+
           ' PESSOA PJ,'+
           ' PESSOA PT,'+
           ' PESSOA PR,'+
           ' PESSOAFISICA PF,'+
           ' DEPENTIT DT,'+
           ' DEPENDENTE DE,'+
           ' PARTPREVPLAN PP,'+
           ' HSTCONTRIBASS HT,'+
           ' DEPEN DP,'+
           ' SITPART ST,'+
           ' PLANASS PA,'+
           ' PRODASS PS'+
           ' WHERE';
     If Not CmpRptCM.ParamValues[0].IsNull Then
      sSql := sSql+' (HT.MES='+ Chr(39) +
       CmpRptCM.ParamValues[0].AsString + Chr(39)+ ') AND';

     sSql:=sSql+
           ' (HT.IDDEPENDENTE = PD.IDPESSOA)  AND'+
           ' (HT.IDPESSJUR    =  PJ.IDPESSOA) AND'+
           ' (HT.IDTITULAR    =  PT.IDPESSOA) AND'+
           ' (HT.IDPAGADOR    = PR.IDPESSOA)  AND'+
           ' (HT.IDDEPENDENTE = PF.IDPESSOA)  AND'+
           ' (HT.IDTITULAR    = DT.IDTITULAR) AND'+
           ' (HT.IDDEPENDENTE = DT.IDPESSOA)  AND'+
           ' (DT.IDDEPENDENCIA= DP.IDDEPENDENCIA) AND'+
           ' (HT.IDDEPENDENTE = DE.IDPESSOA) AND'+
            
           ' (HT.IDTITULAR    = PP.IDPESSOA) AND'+
           ' (HT.IDPESSJUR    = PP.IDPESSJUR) AND'+
           ' (HT.IDPLANOPREV  = PP.IDPLANOPREV) AND'+
           ' (PP.IDSITPART    = ST.IDSITPART) AND'+
           ' (HT.IDPLANASS    = PA.IDPLANASS) AND'+
           ' (PA.IDPRODASS=PS.IDPRODASS)'+ 

           ' ORDER BY PRODUTO, PLANO, PJ.NOME,ST.FLGINTERNO,RESPONSAVEL,PD.NOME';
    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;
end;

procedure TRptBeneficiarios.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptBeneficiarios.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptBeneficiarios.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptBeneficiarios.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptBeneficiarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

end.
