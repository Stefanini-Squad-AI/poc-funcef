unit RDCalcContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, CmParamReport, Db, DBTables,
  Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppCtrls, ppPrnabl, TXComp, FCmReport, uCmRptManager,
  ADODB, DBClient, Provider, uSistema, MontaSelect, ppModule, raCodMod,
  {$IFNDEF Versao05} UcmTypes {$ELSE} uComum {$ENDIF};

type
  TRptDCalcContr = class(TFrmCmReport)
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
    rpDCalcContr: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel18: TppLabel;
    rpRelaCalcContribAssLabel4: TppLabel;
    rpRelaCalcContribAssDBText8: TppDBText;
    ppDBImage14: TppDBImage;
    ppDBText142: TppDBText;
    ppDBText143: TppDBText;
    ppDBText144: TppDBText;
    ppDBText145: TppDBText;
    ppLabel19: TppLabel;
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    bndDetalheCalcContrib: TppDetailBand;
    dbValor: TppDBText;
    rpRelaCalcContribAssDBText2: TppDBText;
    dbValorPatro: TppDBText;
    rpRelaCalcContribAssDBText15: TppDBText;
    rpRelaCalcContribAssDBText11: TppDBText;
    rpRelaCalcContribAssDBText14: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLabelSistema: TppLabel;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    rpRelaCalcContribAssSummaryBand: TppSummaryBand;
    rpRelaCalcContribAssGroup4: TppGroup;
    HeaderGrupoPRODUTO: TppGroupHeaderBand;
    rpRelaCalcContribAssDBText7: TppDBText;
    rpRelaCalcContribAssLabel5: TppLabel;
    rpRelaCalcContribAssLabel6: TppLabel;
    ppLine6: TppLine;
    rpRelaCalcContribAssLabel1: TppLabel;
    rpRelaCalcContribAssGroupFooterBand4: TppGroupFooterBand;
    rpRelaCalcContribAssLabel12: TppLabel;
    rpRelaCalcContribAssDBText10: TppDBText;
    rpRelaCalcContribAssLabel13: TppLabel;
    rpRelaCalcContribAssDBCalc2: TppDBCalc;
    rpRelaCalcContribAssLabel2: TppLabel;
    dbValorDescontoPatro: TppDBCalc;
    lbQtdTitularCalc: TppLabel;
    lbQtdDescontoPatro: TppLabel;
    lblQtdDescontoPatro: TppLabel;
    lblValorDescontoPatro: TppLabel;
    rpRelaCalcContribAssGroup3: TppGroup;
    rpRelaCalcContribAssGroupHeaderBand3: TppGroupHeaderBand;
    rpRelaCalcContribAssDBText1: TppDBText;
    rpRelaCalcContribAssDBText3: TppDBText;
    rpRelaCalcContribAssDBText9: TppDBText;
    rpRelaCalcContribAssLabel9: TppLabel;
    rpRelaCalcContribAssLabel3: TppLabel;
    rpRelaCalcContribAssDBText5: TppDBText;
    rpRelaCalcContribAssDBText6: TppDBText;
    rpRelaCalcContribAssDBText4: TppDBText;
    rpRelaCalcContribAssGroupFooterBand3: TppGroupFooterBand;
    rpRelaCalcContribAssDBCalc4: TppDBCalc;
    rpRelaCalcContribAssLine3: TppLine;
    LineSomaPatro: TppLine;
    dbSomaValorPatro: TppDBCalc;
    rpRelaCalcContribAssLine5: TppLine;
    QryRptCMSITDEPENDENTE: TStringField;
    QryRptCMRESPONSAVEL: TStringField;
    QryRptCMDATANASC: TStringField;
    QryRptCMGRAU_DEPEN: TStringField;
    QryRptCMPATROCINADORA: TStringField;
    QryRptCMPLANO: TStringField;
    QryRptCMPRODUTO: TStringField;
    QryRptCMINSCRICAO: TFloatField;
    QryRptCMDEPENDENTE: TStringField;
    QryRptCMIDDEPENDENTE: TFloatField;
    QryRptCMMATRICULA: TStringField;
    QryRptCMTITULAR: TStringField;
    QryRptCMVALOR: TFloatField;
    QryRptCMVLRPATRO: TFloatField;
    QryRptCMMESREFERENCIA: TStringField;
    QryRptCMMESCOBRANCA: TStringField;
    QryRptCMCODIGORUBRICA: TStringField;
    QryRptCMFLGINTERNO: TStringField;
    QryRptCMSITUACAO: TStringField;
    QryRptCMTIT: TFloatField;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbValorPatroPrint(Sender: TObject);
    procedure dbValorPrint(Sender: TObject);
    procedure lbQtdTitularCalcPrint(Sender: TObject);
    procedure lbQtdDescontoPatroPrint(Sender: TObject);
  private
    { Private declarations }
    Procedure CloseQry;
  public
    { Public declarations }
  end;

var
  RptDCalcContr: TRptDCalcContr;
  TotalTitular,
  TotalPatro   : Integer;

implementation


Uses uDataBase, UAdmAss;

{$R *.DFM}

{ TFrmCmReprot1 }

Procedure TRptDCalcContr.CloseQry;
begin
  Cds.Close;
  AQryRptCM.Close;
  QryRptCM.Close;
  QryFundacao.Close;
  CdsFundacao.Close;
  aQryFundacao.Close;
end;

procedure TRptDCalcContr.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql :String;
begin
  inherited;
  TotalTitular:=0;
  TotalPatro:=0;
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
     
      ' SI.DESCRICAO  AS SITDEPENDENTE,'+

      ' DECODE(HT.IDPAGADOR,HT.IDTITULAR,PT.NOME,'+
      ' PR.NOME|| '' - Participante Falecido ( '' || PT.NOME ||'' )'' ) AS RESPONSAVEL,'+

      ' PF.DATANASC || '' - ('' || TRUNC((SYSDATE - PF.DATANASC)/365.5) || '' ANOS)'' AS DATANASC,'+

      ' DP.DESCRICAO|| '' - '' || DECODE(DT.FLGDEPLEGAL,1,''DEP.LEGAL'',NULL,''AGREGADO'') AS GRAU_DEPEN,'+

      ' PJ.NOME AS PATROCINADORA,'+
      ' PA.NOME AS PLANO,'+
      ' PA.NOME AS PRODUTO,'+

      ' PP.INSCRICAONUMERO AS INSCRICAO,'+
      ' PD.NOME AS DEPENDENTE,'+
      ' HT.IDDEPENDENTE,'+
      ' EP.MATRICULA,'+
      ' PT.NOME AS TITULAR,'+

      ' HT.VALORESPERADO AS VALOR,'+

      ' DECODE(QRYPATRO.VLRPATRO,NULL,0,QRYPATRO.VLRPATRO) AS VLRPATRO,'+

      ' HT.MES AS MESREFERENCIA,'+
      ' HT.MESCOBRANCA,'+
      ' RP.CODPROVDESC AS CODIGORUBRICA,'+
      ' ST.FLGINTERNO,'+
      ' ST.DESCRICAO AS SITUACAO,'+
      ' DECODE(DT.IDDEPENDENCIA,''PRP'',0,1) AS TIT'+
       
      ' FROM'+
      ' PESSOA PD,'+
      ' PESSOA PJ,'+
      ' PESSOA PT,'+
      ' PESSOA PR,'+
      ' PESSOAFISICA PF,'+
      ' DEPENTIT DT,'+
      ' DEPENDENTE DE,'+
      ' ELEGPATRO EP,'+
      ' PARTPREVPLAN PP,'+
      ' (SELECT SUM(VALORATUAL) AS VALPENSAO,'+
      '         IDPLANOPREV,'+
      '         IDTITULAR,'+
      '         IDPESSJUR,'+
      '         SEQPROPOSTA'+
      '         FROM BENEFBFCIARIO'+
      (* Filtro para pegar apenas os benefícios com situação NORMAL *)
      '         WHERE (IDSITBENEFICIO = 1)'+
   
      '         GROUP BY IDPLANOPREV, IDTITULAR, IDPESSJUR, SEQPROPOSTA) PENSAO,'+
      ' (SELECT VALORESPERADO AS VLRPATRO,'+
      '         IDPLANOPREV,'+
      '         IDPESSJUR,'+
      '         IDTITULAR,'+
      '         IDDEPENDENTE,'+
      '         IDPLANASS,'+
      '         MES,'+
      '         MESCOBRANCA'+
      '         FROM HSTCONTRIBASS'+
      '         WHERE IDPAGADOR = 1 AND';

     If Not CmpRptCM.ParamValues[0].IsNull Then
       sSql := sSql+' MESCOBRANCA = '+ Chr(39) +
        CmpRptCM.ParamValues[0].AsString + Chr(39)+ ') QRYPATRO,' 
     else Exit;   

     sSql:=sSql+
      ' HSTCONTRIBASS HT,'+
      ' RUBRICAXPESS RP,'+
      ' BENEFASS BE,'+
      ' FUNCIONARIO FO,'+
      ' CONTRIBASS CA,'+
      ' DEPEN DP,'+
      ' SITPART ST,'+
      ' PLANASS PA,'+
      ' SITDEPENDENTE SI'+
      ' WHERE'+
     (* JOIN HSTCONTRIBASS COM PESSOA DEPENDENTE *)
      ' (HT.IDDEPENDENTE =  PD.IDPESSOA) AND'+
     (* JOIN HSTCONTRIBASS COM PESSOA PATROCINADORA *)
      ' (HT.IDPESSJUR    =  PJ.IDPESSOA) AND'+
     (* JOIN HSTCONTRIBASS COM PESSOA TITULAR *)
      ' (HT.IDTITULAR    =  PT.IDPESSOA) AND'+
     (* JOIN HSTCONTRIBASS COM PESSOA RESPONSAVEL *)
      ' (HT.IDPAGADOR    = PR.IDPESSOA) AND'+
     (* JOIN HSTCONTRIBASS COM PESSOAFISICA *)
      ' (HT.IDDEPENDENTE = PF.IDPESSOA(+)) AND'+
     (* JOIN HSTCONTRIBASS COM DEPENTIT *)
      ' (HT.IDTITULAR    = DT.IDTITULAR) AND'+
      ' (HT.IDDEPENDENTE = DT.IDPESSOA) AND'+
     (* JOIN DEPENTIT COM DEPEN *)
      ' (DT.IDDEPENDENCIA = DP.IDDEPENDENCIA) AND'+
     (* JOIN HSTCONTRIBASS COM DEPENDENTE *)
      ' (HT.IDDEPENDENTE = DE.IDPESSOA(+)) AND'+
     (* JOIN DEPENDENTE COM SITDEPENDENTE *)
      ' (DE.IDSITDEPENDENTE = SI.IDSITDEPENDENTE(+)) AND'+

     (* JOIN HSTCONTRIBASS COM ELEGPATRO *)
      ' (HT.IDTITULAR    =  EP.IDPESSOA) AND'+
      ' (HT.IDPESSJUR    =  EP.IDPESSJUR) AND'+
     (* JOIN HSTCONTRIBASS COM PARTPREVPLAN *)
      ' (HT.IDTITULAR    = PP.IDPESSOA) AND'+
      ' (HT.IDPESSJUR    = PP.IDPESSJUR) AND'+
      ' (HT.IDPLANOPREV  = PP.IDPLANOPREV) AND'+
     (* JOIN PARTPREVPLAN COM SITPART *)
      ' (PP.IDSITPART    = ST.IDSITPART) AND'+

     (* JOIN HSTCONTRIBASS COM PENSAO *)
      ' (HT.IDTITULAR    =  PENSAO.IDTITULAR(+)) AND'+
      ' (HT.IDPESSJUR    =  PENSAO.IDPESSJUR(+)) AND'+
      ' (HT.IDPLANOPREV  =  PENSAO.IDPLANOPREV(+)) AND'+
      ' (HT.SEQPROPOSTA  =  PENSAO.SEQPROPOSTA(+)) AND'+
     (* JOIN HSTCONTRIBASS COM QRYPATRO *)
      ' (HT.IDTITULAR    =  QRYPATRO.IDTITULAR(+)) AND'+
      ' (HT.IDPESSJUR    =  QRYPATRO.IDPESSJUR(+)) AND'+
      ' (HT.IDDEPENDENTE =  QRYPATRO.IDDEPENDENTE(+)) AND'+
      ' (HT.IDPLANOPREV  =  QRYPATRO.IDPLANOPREV(+)) AND'+
      ' (HT.IDPLANASS    =  QRYPATRO.IDPLANASS(+)) AND'+
      ' (HT.MES          =  QRYPATRO.MES(+)) AND'+
      ' (HT.MESCOBRANCA  =  QRYPATRO.MESCOBRANCA(+)) AND'+
     (* JOIN HSTCONTRIBASS COM CONTRIBASS *)
      ' (HT.IDPLANASS    =  CA.IDPLANASS) AND'+
      ' (HT.IDCONTASS    =  CA.IDCONTASS) AND'+
     (* JOIN CONTRIBASS COM RUBRICAXPESS *)
      ' (CA.IDEMPRESA    =  RP.IDPESSOA(+)) AND'+
      ' (CA.IDPROVENTO   =  RP.IDRUBRICA(+)) AND'+
     (* JOIN HSTCONTRIBASS COM BENEFASS *)
      ' (HT.IDTITULAR    = BE.IDTITULAR) AND'+
      ' (HT.IDDEPENDENTE = BE.IDDEPENDENTE) AND'+
      ' (HT.IDPLANASS    = BE.IDPLANASS) AND'+
      ' (HT.IDPESSJUR    = BE.IDPESSJUR) AND'+
     (* JOIN HSTCONTRIBASS COM FUNCIONARIO *)
      ' (HT.IDTITULAR    = FO.IDPESSOA(+)) AND'+
     (* JOIN HSTCONTRIBASS COM PLANASS *)
      ' (HT.IDPLANASS    = PA.IDPLANASS) AND';

     If Not CmpRptCM.ParamValues[1].IsNull Then
       sSql := sSql+' (HT.MES = '+ Chr(39) +
        CmpRptCM.ParamValues[1].AsString + Chr(39)+ ')'
     else Exit;   

     sSql:=sSql+' ORDER BY PT.NOME,PD.NOME';

    Sql.Clear;
    Sql.Add(sSql);
    Open;
    AQryRptCM.Sql.Assign(Sql);
  End;

end;

procedure TRptDCalcContr.CrmRptCMChangeDataBaseName(Sender: TObject;
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

procedure TRptDCalcContr.CrmRptCMChangeConnectionType(Sender: TObject;
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

procedure TRptDCalcContr.CrmRptCMChangeConnection(Sender: TObject;
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

procedure TRptDCalcContr.FormCreate(Sender: TObject);
begin
  inherited;
  CloseQry;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

procedure TRptDCalcContr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseQry;
end;

procedure TRptDCalcContr.dbValorPatroPrint(Sender: TObject);
begin
  inherited;
  If StrFloat(dbValorPatro.Text,1)>0 then Inc(TotalPatro,1);
end;

procedure TRptDCalcContr.dbValorPrint(Sender: TObject);

begin
  inherited;
  If StrFloat(dbValor.Text,1)>0 then Inc(TotalTitular,1);
end;

procedure TRptDCalcContr.lbQtdTitularCalcPrint(Sender: TObject);
begin
  inherited;
  lbQtdTitularCalc.Text:=IntToStr(TotalTitular);
  TotalTitular:=0;
end;

procedure TRptDCalcContr.lbQtdDescontoPatroPrint(Sender: TObject);
begin
  inherited;
  lbQtdDescontoPatro.Text:=IntToStr(TotalPatro);
  TotalPatro:=0;
end;

end.
