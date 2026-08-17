unit RResFinan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptResFinan = class(TFrmCmReport)
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
    rpResFinan: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLabel33: TppLabel;
    ppLine19: TppLine;
    rpHistFinancLabel1: TppLabel;
    rpHistFinancDBText2: TppDBText;
    rpHistFinancLabel2: TppLabel;
    rpHistFinancDBText3: TppDBText;
    rpHistFinancLabel3: TppLabel;
    rpHistFinancDBText4: TppDBText;
    rpHistFinancLine1: TppLine;
    rpHistFinancLabel4: TppLabel;
    rpHistFinancLabel5: TppLabel;
    rpHistFinancLabel6: TppLabel;
    rpHistFinancLabel7: TppLabel;
    rpHistFinancLabel8: TppLabel;
    rpHistFinancLabel9: TppLabel;
    rpHistFinancLabel10: TppLabel;
    rpHistFinancLabel11: TppLabel;
    rpHistFinancLabel12: TppLabel;
    rpHistFinancLabel13: TppLabel;
    rpHistFinancLabel14: TppLabel;
    rpHistFinancLine2: TppLine;
    rpHistFinancLabel15: TppLabel;
    rpHistFinancLabel16: TppLabel;
    rpHistFinancLine3: TppLine;
    rpHistFinancLabel17: TppLabel;
    rpHistFinancLabel18: TppLabel;
    rpHistFinancLabel20: TppLabel;
    rpHistFinancDBText17: TppDBText;
    ppDBImage11: TppDBImage;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppLabel34: TppLabel;
    ppDBText125: TppDBText;
    ppDetailBand13: TppDetailBand;
    rpHistFinancDBText1: TppDBText;
    rpHistFinancDBText5: TppDBText;
    rpHistFinancDBText6: TppDBText;
    rpHistFinancDBText7: TppDBText;
    rpHistFinancDBText8: TppDBText;
    rpHistFinancDBText9: TppDBText;
    rpHistFinancDBText10: TppDBText;
    rpHistFinancDBText11: TppDBText;
    rpHistFinancDBText12: TppDBText;
    rpHistFinancDBText13: TppDBText;
    rpHistFinancDBText14: TppDBText;
    rpHistFinancDBText15: TppDBText;
    rpHistFinancDBText16: TppDBText;
    ppFooterBand13: TppFooterBand;
    ppLine21: TppLine;
    ppLabelSistema: TppLabel;
    rpHistFinancLabel19: TppLabel;
    ppCalc25: TppSystemVariable;
    ppCalc26: TppSystemVariable;
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
  RptResFinan: TRptResFinan;

implementation


Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptResFinan.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptResFinan.CrmRptCMBeforePrint(Sender: TObject);
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
       'select'+
       ' h.mes,'+
       ' h.mescobranca,'+
       ' m.descricao        motivo,'+
       ' pa.nome            planass,'+
       ' prev.nome          planprev,'+
       ' pp.inscricaonumero inscprev,'+
       ' pj.nome            patro,'+
       ' pt.nome            titular,'+
       ' pd.nome            dependente,'+
       ' c.nome             contribuicao,'+
       ' pg.nome            pagador,'+
       ' decode(h.flgcobcarne,'+
       ' 0,''FL'','+
       ' 1,''BC'')      folha,'+
       ' h.valoresperado,'+
       ' h.valorrecebido,'+
       ' h.dataprevisao,'+
       ' h.data             datapagto,'+
       ' f.descricao        forma,'+
       ' h.idtipo,'+
       ' decode(h.sitrecebimento,'+
       ' 0,''NE'','+
       ' 1,''NR'','+
       ' 2,''OK'','+
       ' 3,''DV'','+
       ' 4,''TR'','+
       ' 9,''CN'','+
       '   ''##'') situacao'+
       
      ' from'+
      ' hstcontribass h,'+
      ' motivo        m,'+
      ' planass       pa,'+
      ' planprev      prev,'+
      ' partprevplan  pp,'+
      ' pessoa        pj,'+
      ' pessoa        pt,'+
      ' pessoa        pd,'+
      ' pessoa        pg,'+
      ' contribuicao  c,'+
      ' contribass    cb,'+
      ' portadorforma f'+
      ' where'+
      ' (h.idmotivo = m.idmotivo) and'+ 
      ' (h.idplanass = pa.idplanass) and'+
      ' (h.idplanoprev = prev.idplanoprev) and';

     If Not CmpRptCM.ParamValues[0].IsNull Then
      sSql := sSql+' (PJ.IdPessoa='+CmpRptCM.ParamValues[0].AsString+ ') and';

     sSql:=sSql+
      ' (h.idpessjur = pj.idpessoa) and'+
      ' (h.idtitular = pt.idpessoa) and'+
      ' (h.iddependente = pd.idpessoa) and'+
      ' (h.idpagador = pg.idpessoa) and'+
      ' (h.idcontass = c.idcontribuicao) and'+
      ' (h.idpessjur   = pp.idpessjur) and'+
      ' (h.idplanoprev = pp.idplanoprev) and'+
      ' (h.idtitular   = pp.idpessoa) and'+
      ' (h.idplanass = cb.idplanass) and'+
      ' (h.idcontass = cb.idcontass) and'+
      ' (cb.pagador = ''C'') and'+
      ' (h.codportforma = f.codportforma(+))'+
      ' order by h.mes, h.mescobranca';

    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptResFinan.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptResFinan.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptResFinan.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptResFinan.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptResFinan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

end.
