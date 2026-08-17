Unit rpartcancel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables, 
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  StdCtrls, {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptPartCancel = class(TFrmCmReport)
    rpPartCancel: TppReport;
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
    ppHeaderBand23: TppHeaderBand;
    ppLine34: TppLine;
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
    ppDetailBand21: TppDetailBand;
    ppDBText195: TppDBText;
    ppDBTextTitular: TppDBText;
    ppDBText199: TppDBText;
    ppDBTextSit: TppDBText;
    ppDBText4: TppDBText;
    ppDBText1: TppDBText;
    ppLabelObs: TppLabel;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
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
    lbSituacao: TppLabel;
    lbPremio: TppLabel;
    ppLabel4: TppLabel;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppDBCalcPart: TppDBCalc;
    ppVariable1: TppVariable;
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
    Function DataIn(St:String): String;

    Procedure CloseQry;

  public
    { Public declarations }
  end;

var
  RptPartCancel: TRptPartCancel;

implementation

Uses uDataBase, uAdmAss;

{$R *.DFM}

{ TFrmCmReprot1 }

Function TRptPartCancel.DataIn(St:String): String;
begin
  If DataValida(St,False) then
   Result:=Copy(St,7,4)+'/'+Copy(St,4,2)+'/'+Copy(St,1,2)
  else Result:='';
end;

Procedure TRptPartCancel.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptPartCancel.CrmRptCMBeforePrint(Sender: TObject);
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
      ' PS.DATAENTRADA,'+
      ' PS.DATACANCELAMENTO,'+
      ' PS.OBSCANCEL,'+
      ' EL.MATRICULA AS MATRICULA,'+
      ' PS.DATAENTRADA AS DATAINSCRICAO,'+
      ' SP.DESCRICAO AS SITPARTICIPANTE'+
      ' FROM'+
      ' PESSOA PT,'+
      ' PESSOA PJ,'+
      ' ELEGPATRO EL,'+
      ' PARTASS PS,'+
      ' PLANASS PL,'+
      ' SITPLANOASS SP'+

      ' WHERE'+
      ' (PT.IDPESSOA=PT.IDPESSOA) AND'+
      ' (PT.IDPESSOA=EL.IDPESSOA) AND'+
      ' (PT.IDPESSOA=PS.IDPESSOA) AND';
    If StrToIntDef(CmpRptCM.ParamValues[0].AsString,0)>0 Then
    begin
      ppSummary.Visible:=False;
      sSql := sSql+' (PJ.IDPESSOA='+CmpRptCM.ParamValues[0].AsString+') AND';
    end;

    sSql:=sSql+
      ' (PJ.IDPESSOA=PJ.IDPESSOA) AND'+
      ' (PJ.IDPESSOA=EL.IDPESSJUR) AND'+
      ' (PJ.IDPESSOA=PS.IDPESSJUR) AND'+
      ' (EL.IDPESSJUR=PS.IDPESSJUR) AND'+
      ' (PS.FLGINSCRICAOCANC=1) AND'+
      ' (PS.DATACANCELAMENTO IS NOT NULL) AND'+
      ' (PS.IDSITPART=SP.IDSITPLANOASS) AND';

    If StrToIntDef(CmpRptCM.ParamValues[1].AsString,0)>0 Then
     sSql:=sSql+' (PS.IDPLANASS='+CmpRptCM.ParamValues[1].AsString+') AND';

    If (DataIn(CmpRptCM.ParamValues[2].AsString)<>'') And
        (DataIn(CmpRptCM.ParamValues[3].AsString)<>'') Then
      sSql := sSql+' (TO_CHAR(PS.DATACANCELAMENTO,''YYYY/MM/DD'')'+
                   ' BETWEEN '+Chr(39)+DataIn(CmpRptCM.ParamValues[2].AsString)+Chr(39)+' AND'+
                   ' '+Chr(39)+DataIn(CmpRptCM.ParamValues[3].AsString)+Chr(39)+') AND';

    sSql:=sSql+
      ' (PS.IDPLANASS=PL.IDPLANASS)'+
      ' ORDER BY PATROCINADORA, TITULAR';

    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;
end;

procedure TRptPartCancel.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptPartCancel.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptPartCancel.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptPartCancel.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

end.

