unit RQtBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptQtBenef = class(TFrmCmReport)
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
    RpQtBenef: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBImage4: TppDBImage;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppLabel5: TppLabel;
    ppDBText69: TppDBText;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppDetailBand2: TppDetailBand;
    rpRelaQuantBenefGrpDBText4: TppDBText;
    rpRelaQuantBenefGrpDBText3: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine4: TppLine;
    ppLabelSistema: TppLabel;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    rpRelaQuantBenefGrpGroup2: TppGroup;
    rpRelaQuantBenefGrpGroupHeaderBand2: TppGroupHeaderBand;
    rpRelaQuantBenefGrpDBText2: TppDBText;
    ppLabel1: TppLabel;
    rpRelaQuantBenefGrpGroupFooterBand2: TppGroupFooterBand;
    rpRelaQuantBenefGrpDBCalc2: TppDBCalc;
    ppVarDescPatrocinadora: TppVariable;
    rpRelaQuantBenefSitGroup1: TppGroup;
    rpRelaQuantBenefSitGroupHeaderBand1: TppGroupHeaderBand;
    rpRelaQuantBenefGrpDBText1: TppDBText;
    rpRelaQuantBenefSitGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppLabel2: TppLabel;
    ppVarDescPlano: TppVariable;
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
  RptQtBenef: TRptQtBenef;

implementation


Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptQtBenef.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptQtBenef.CrmRptCMBeforePrint(Sender: TObject);
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

     sSql:=
       'SELECT'+
       ' PA.NOME AS PLANOASSISTENCIAL,'+
       ' PJ.NOME AS PATROCINADORA,'+
       ' SP.DESCRICAO AS SITUACAO,'+
       ' COUNT(*) AS NUMBENEF'+
       
       ' FROM'+
       ' BENEFASS BA,'+
       ' PARTPREVPLAN PP,'+
       ' SITPART SP,'+
       ' PESSOA PJ,'+
       ' PLANASS PA'+
       
       ' WHERE'+
       ' (BA.DTCANCELAMENTO IS NULL) AND'+
       ' (PP.IDPESSJUR = BA.IDPESSJUR) AND'+
       ' (PP.IDPLANOPREV = BA.IDPLANOPREV) AND'+
       ' (PP.FLGDESATIVADO = 0) AND'+
       ' (PP.IDPESSOA = BA.IDTITULAR) AND'+
       ' (PP.SEQPROPOSTA =   BA.SEQPROPOSTA) AND'+
       ' (SP.IDSITPART = PP.IDSITPART) AND'+
       ' (PJ.IDPESSOA = BA.IDPESSJUR) AND'+
       ' (PA.IDPLANASS = BA.IDPLANASS)'+
       ' GROUP BY PA.NOME,PJ.NOME,SP.DESCRICAO'+
       ' ORDER BY PJ.NOME,PA.NOME,SP.DESCRICAO';

    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptQtBenef.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptQtBenef.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptQtBenef.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptQtBenef.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptQtBenef.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

end.
