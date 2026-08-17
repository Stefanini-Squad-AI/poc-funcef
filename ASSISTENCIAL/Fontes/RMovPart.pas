unit RMovPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod;

type
  TRptMovPart = class(TFrmCmReport)
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
    rpMovPart: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppLabel31: TppLabel;
    ppDetailBand11: TppDetailBand;
    insctit: TppDBText;
    exctit: TppDBText;
    inscdep: TppDBText;
    excdep: TppDBText;
    totalinc: TppDBText;
    totaldep: TppDBText;
    periodos: TppDBText;
    acumulado: TppLabel;
    ppFooterBand11: TppFooterBand;
    ppLine16: TppLine;
    ppLabel32: TppLabel;
    ppCalc21: TppSystemVariable;
    ppCalc22: TppSystemVariable;
    rpapurainscritosGroup1: TppGroup;
    rpapurainscritosGroupHeaderBand1: TppGroupHeaderBand;
    rpapurainscritosShape4: TppShape;
    rpapurainscritosShape3: TppShape;
    rpapurainscritosShape1: TppShape;
    rpapurainscritosLabel1: TppLabel;
    rpapurainscritosDBText1: TppDBText;
    rpapurainscritosLabel3: TppLabel;
    rpapurainscritosLabel4: TppLabel;
    rpapurainscritosLabel5: TppLabel;
    rpapurainscritosLabel6: TppLabel;
    rpapurainscritosLabel7: TppLabel;
    rpapurainscritosLabel9: TppLabel;
    rpapurainscritosLabel10: TppLabel;
    rpapurainscritosLabel2: TppLabel;
    rpapurainscritosLabel11: TppLabel;
    rpapurainscritosLabel12: TppLabel;
    rpapurainscritosLabel8: TppLabel;
    rpapurainscritosLine2: TppLine;
    rpapurainscritosDBText2: TppDBText;
    rpapurainscritosGroupFooterBand1: TppGroupFooterBand;
    ppDBImage19: TppDBImage;
    ppDBText187: TppDBText;
    ppDBText188: TppDBText;
    ppDBText189: TppDBText;
    ppDBText190: TppDBText;
    ppLabel113: TppLabel;
    ppDBText191: TppDBText;
    ppDBText192: TppDBText;
    ppDBText194: TppDBText;
    ppDBText193: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure ppDBTextTitularPrint(Sender: TObject);
  private
    { Private declarations }
    iTotal: Integer;
  public
    { Public declarations }
  end;

var
  RptMovPart: TRptMovPart;

implementation


Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }


procedure TRptMovPart.CrmRptCMBeforePrint(Sender: TObject);
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
  //sSql := '';

  With QryRptCM Do
  Begin
     If Active Then Close;

     sSql:='SELECT PT.IDPESSOA, '+
          'LOWER(PT.NOME) AS TITULAR, '+
          'RTRIM(PJ.NOME) AS PATROCINADORA, '+
          'UPPER(PD.NOME) AS DEPENDENTE, '+
          'PL.NOME AS PLANO, '+
          'BF.DATAENTRADA, '+
          'BF.DTCANCELAMENTO, '+
          'EL.MATRICULA AS MATRICULA, '+
          'PP.INSCRICAONUMERO AS INSCRICAO, '+
          'PS.DATAENTRADA AS DATAINSCRICAO, '+
          'DECODE(ST.FLGINTERNO,''AS'',''ASSISTIDO'' , '+
                               '''CA'',''CANCELADO'', '+
                               '''MA'',''MANTIDO'', '+
                               '''AT'',''ATIVO'') AS SITUACAO '+
          'FROM'+
          ' PESSOA PT,'+
          ' PESSOA PJ,'+
          ' PESSOA PD,'+
          ' PESSOAFISICA PF,'+
          ' PARTPREVPLAN PP,'+
          ' ELEGPATRO EL,'+
          ' SITPART ST,'+
          ' DEPENTIT DP,'+
          ' PARTASS PS,'+
          ' BENEFASS BF,'+
          ' PLANASS PL '+

          'WHERE';
          (*
          If Not CmpRptCM.ParamValues[0].IsNull Then
           sSql := sSql + ' (PT.IDPESSOA=' +
            CmpRptCM.ParamValues[0].AsString + ') AND ';
          *)
          sSql:=sSql+
          ' (PT.IDPESSOA=PF.IDPESSOA) AND'+
          ' (PT.IDPESSOA=PT.IDPESSOA) AND'+
          ' (PT.IDPESSOA=PP.IDPESSOA) AND'+

          ' (PT.IDPESSOA=EL.IDPESSOA) AND'+
          ' (PT.IDPESSOA=BF.IDTITULAR) AND'+
          ' (PT.IDPESSOA=PS.IDPESSOA) AND'+
          ' (PT.IDPESSOA=DP.IDTITULAR) AND';

          If Not CmpRptCM.ParamValues[0].IsNull Then
           sSql := sSql+' (PJ.NOME='+ Chr(39) +
            CmpRptCM.ParamValues[0].AsString + Chr(39)+ ') AND';

          sSql:=sSql+
          ' (PJ.IDPESSOA=PP.IDPESSJUR) AND'+
          ' (PJ.IDPESSOA=PJ.IDPESSOA) AND'+
          ' (PJ.IDPESSOA=EL.IDPESSJUR) AND'+
          ' (PJ.IDPESSOA=PS.IDPESSJUR) AND'+
          ' (PJ.IDPESSOA=BF.IDPESSJUR) AND'+

          ' (PD.IDPESSOA=DP.IDPESSOA) AND'+
          ' (PD.IDPESSOA=BF.IDDEPENDENTE) AND'+
          ' (BF.DTCANCELAMENTO IS NULL) AND'+

          ' (PP.IDPESSJUR=PS.IDPESSJUR)AND'+
          ' (PP.IDPESSOA=PP.IDPESSOA) AND'+
          ' (PP.IDSITPART=ST.IDSITPART) AND'+
          ' (PP.IDPLANOPREV=PS.IDPLANOPREV) AND'+

          ' (EL.IDPESSJUR=PS.IDPESSJUR) AND'+

          ' (PS.IDPESSOA=BF.IDTITULAR) AND'+

          ' (BF.IDPLANASS=PS.IDPLANASS) AND'+
          ' (BF.IDPLANASS=PL.IDPLANASS) and (rownum<50)'+

          ' ORDER BY PATROCINADORA, TITULAR';

    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptMovPart.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptMovPart.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptMovPart.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptMovPart.ppDBTextTitularPrint(Sender: TObject);
begin
  inherited;
 iTotal:=iTotal+1;
end;

end.
