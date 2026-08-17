unit REnvRet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod;

type
  TRptEnvRet = class(TFrmCmReport)
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
    rpEnvRet: TppReport;
    ppHeaderBand21: TppHeaderBand;
    ppLabel88: TppLabel;
    ppLabel93: TppLabel;
    rptRecadastramentoDBImage1: TppDBImage;
    rptRecadastramentoDBText1: TppDBText;
    rptRecadastramentoDBText2: TppDBText;
    rptRecadastramentoDBText3: TppDBText;
    rptRecadastramentoDBText4: TppDBText;
    rptRecadastramentoDBText5: TppDBText;
    rptRecadastramentoDBText7: TppDBText;
    rptRecadastramentoDBText6: TppDBText;
    rptRecadastramentoLabel1: TppLabel;
    rptRecadastramentoDBText8: TppDBText;
    ppDetailBand19: TppDetailBand;
    rpCompEnvioDBText3: TppDBText;
    rpCompEnvioDBText4: TppDBText;
    rpCompEnvioDBText5: TppDBText;
    rpCompEnvioDBText6: TppDBText;
    rpCompEnvioDBText7: TppDBText;
    rpCompEnvioDBText8: TppDBText;
    rpCompEnvioDBText9: TppDBText;
    rpCompEnvioDBText10: TppDBText;
    ppFooterBand19: TppFooterBand;
    rpCompEnvioLabel95: TppLabel;
    ppCalc41: TppSystemVariable;
    ppCalc42: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    rpCompEnvioLabel20: TppLabel;
    rpCompEnvioLabel21: TppLabel;
    rpCompEnvioLabel22: TppLabel;
    rpCompEnvioDBCalc3: TppDBCalc;
    rpCompEnvioDBCalc4: TppDBCalc;
    rpCompEnvioLine3: TppLine;
    rpCompEnvioLabel23: TppLabel;
    rpCompEnvioLabel24: TppLabel;
    rpCompEnviodrt: TppLabel;
    rpCompEnviovrt: TppLabel;
    rpCompEnvioLabel27: TppLabel;
    rpCompEnvioLabel28: TppLabel;
    rpCompEnvioddt: TppLabel;
    rpCompEnviovdt: TppLabel;
    rpCompEnvioLabel31: TppLabel;
    rpCompEnvioLabel32: TppLabel;
    rpCompEnviovst: TppLabel;
    rpCompEnviodst: TppLabel;
    rpCompEnvioGroup1: TppGroup;
    rpCompEnvioGroupHeaderBand1: TppGroupHeaderBand;
    rpCompEnvioShape1: TppShape;
    rpCompEnvioLabel1: TppLabel;
    rpCompEnvioLabel2: TppLabel;
    rpCompEnvioDBText1: TppDBText;
    rpCompEnvioDBText2: TppDBText;
    rpCompEnvioLabel3: TppLabel;
    rpCompEnvioLabel4: TppLabel;
    rpCompEnvioLabel5: TppLabel;
    rpCompEnvioLabel6: TppLabel;
    rpCompEnvioLabel7: TppLabel;
    rpCompEnvioLabel8: TppLabel;
    rpCompEnvioLabel9: TppLabel;
    rpCompEnvioLabel10: TppLabel;
    rpCompEnvioLine1: TppLine;
    rpCompEnvioGroupFooterBand1: TppGroupFooterBand;
    rpCompEnvioLabel11: TppLabel;
    rpCompEnvioLabel12: TppLabel;
    rpCompEnvioLabel13: TppLabel;
    rpCompEnvioDBCalc1: TppDBCalc;
    rpCompEnvioDBCalc2: TppDBCalc;
    rpCompEnvioLine2: TppLine;
    rpCompEnvioLabel14: TppLabel;
    rpCompEnvioLabel15: TppLabel;
    rpCompEnviodrp: TppLabel;
    rpCompEnviovrp: TppLabel;
    rpCompEnvioLabel16: TppLabel;
    rpCompEnvioLabel17: TppLabel;
    rpCompEnvioddp: TppLabel;
    rpCompEnviovdp: TppLabel;
    rpCompEnvioLabel18: TppLabel;
    rpCompEnvioLabel19: TppLabel;
    rpCompEnviosdp: TppLabel;
    rpCompEnviovsp: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure ppSummaryBand5BeforeGenerate(Sender: TObject);
    procedure ppDBTextTitularPrint(Sender: TObject);
  private
    { Private declarations }
    iTotal: Integer;
  public
    { Public declarations }
  end;

var
  RptEnvRet: TRptEnvRet;

implementation


Uses uDataBase;

{$R *.DFM}

{ TFrmCmReprot1 }
 
procedure TRptEnvRet.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql :String;
begin
  inherited;
  iTotal:=0;
    {**
    Evento utilizado para montagem do(s) sql(´s) do relatório de acordo com
    os parâmetros do ParamReports CmpRptCM.
    Os parametros podem ser acessados pelo índice (PARAMVALUES) ou pelo nome (PARAMBYNAME).
    É interessante observar o tipo de conexão em uso o que implica que o(s) SQL(´s) montados
    sejam atribuidos ao DATASET correto ou a todos os DATASET´S
  **}
  //sSql := '';

  With QryRptCM Do
  Begin
     If Active Then Close;

     sSql:='SELECT PT.IDPESSOA, '+
          'UPPER(PT.NOME) AS TITULAR, '+
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
    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptEnvRet.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptEnvRet.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptEnvRet.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptEnvRet.ppSummaryBand5BeforeGenerate(Sender: TObject);
begin
  inherited;
 //ppLabelTotalT.Caption:='Total de Segurados => '+IntToStr(iTotal);
end;

procedure TRptEnvRet.ppDBTextTitularPrint(Sender: TObject);
begin
  inherited;
 iTotal:=iTotal+1;
end;

end.
