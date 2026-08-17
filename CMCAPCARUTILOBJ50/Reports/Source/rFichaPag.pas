{*******************************************************************************
  Alterações:
********************************************************************************
-------------------------------------------------------------------------------
 Data      : 09.01.2007
 Autor     : Antonio Marcos (amf)
 Pendência : 20958 ** descoberto na homologação que faltava esta alteração na pendência
 Descrição : No item "Documento Pagto:" assume a conta corrente cadastrada no documento. Era exibida
             sempre a preferencial.
--------------------------------------------------------------------------------
 Data      : 04.10.2006
 Autor     : Antonio Marcos (amf)
 Pendência : 20958
 Descrição : Acrescentado o campo que traz detalhes sobre o pagamento:
             "Liquidado" ou "Documento Em Aberto".
-------------------------------------------------------------------------------
 Componente: QryContabBaixa
 Data      : 27/10/2004
 Autor     : Flavio Dias
 Pendência : 17726
 Descrição : Apresentação de múltiplas contas de baixa
             Alteração do RptContabBaixa (sub-relatório)
-------------------------------------------------------------------------------
 Componente: QryContabLanc
 Data      : 17/08/2004
 Autor     : Andre Tavares
 Pendência : 17128
 Descrição : Acerto no join entre as tabelas lancamento e planoprevcontabil
-------------------------------------------------------------------------------}
{ Rotina    : RptApGrGroupHeaderBand1BeforePrint
 Data      : 09/03/2004
 Autor     : David Ayrolla
 Pendência : 16143
 Descrição : Resolução de problema na impressão do cabeçalho de contabilizações
             cujo campo "PLNCODIGO" estava vazio.
-------------------------------------------------------------------------------
 Componente: QryContabLanc
 Data      : 09/03/2004
 Autor     : David Ayrolla
 Pendência : 16077
 Descrição : Incluídos na query os campos PATROCINADORA e PLANO.
-------------------------------------------------------------------------------}

Unit rFichaPag;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppReport,
  ppSubRpt, ppMemo, ppStrtch, ppRegion, ppClass, ppVar, ppCtrls, ppPrnabl,
  ppCache, ppProd, Db, DBTables, Wwdatsrc, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra,
  uExtensoCM, Wwquery, TXRB;

Type
  TRptFichaPag = Class(TFrmCmReport)
    PpApGr: TppBDEPipeline;
    DsAp: TwwDataSource;
    PpContabLanc: TppBDEPipeline;
    DsContab3: TwwDataSource;
    PpContab3: TppBDEPipeline;
    DsContabBaixa: TwwDataSource;
    PpLancAlt: TppBDEPipeline;
    DsLancAlt: TwwDataSource;
    PpRateioParc: TppBDEPipeline;
    DsRateioParc: TwwDataSource;
    RptApGr: TppReport;
    ppHeaderBand27: TppHeaderBand;
    ppLabel122: TppLabel;
    LblApGr: TppLabel;
    ppLine55: TppLine;
    RptApGrLabel16: TppLabel;
    RptApGrDBText26: TppDBText;
    ppDetailBand28: TppDetailBand;
    ppFooterBand27: TppFooterBand;
    RptApGrShape5: TppShape;
    RptApGrShape4: TppShape;
    RptApGrShape3: TppShape;
    RptApGrShape2: TppShape;
    RptApGrShape1: TppShape;
    ppLine56: TppLine;
    ppLabel126: TppLabel;
    RptApGrLabel1: TppLabel;
    Lblfa1: TppLabel;
    Lblfa2: TppLabel;
    Lblfa3: TppLabel;
    Lblfa4: TppLabel;
    Lblfa5: TppLabel;
    LblAutentica: TppLabel;
    ppCalc48: TppSystemVariable;
    ppCalc49: TppSystemVariable;
    RptApGrGroup1: TppGroup;
    RptApGrGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText56: TppDBText;
    ppLabel135: TppLabel;
    RptApGrLabel3: TppLabel;
    RptApGrDBText2: TppDBText;
    RptApGrRegion1: TppRegion;
    RptApGrLabel8: TppLabel;
    RptApGrLabel9: TppLabel;
    RptApGrLabel10: TppLabel;
    RptApGrLabel11: TppLabel;
    RptApGrLabel12: TppLabel;
    RptApGrLine1: TppLine;
    LblSaldoDoc: TppLabel;
    RptApGrRegion2: TppRegion;
    Regiao2: TppLine;
    ppDBText55: TppDBText;
    ppDBText60: TppDBText;
    ppLabel134: TppLabel;
    ppLabel138: TppLabel;
    LblNumChq: TppLabel;
    DbNumChq: TppDBText;
    RptApGrLabel4: TppLabel;
    RptApGrDBText3: TppDBText;
    RptApGrDBText8: TppDBText;
    RptApGrLabel6: TppLabel;
    RptApGrDBText14: TppDBText;
    RptApGrLabel7: TppLabel;
    LblFormaPagto: TppLabel;
    RptApGrDBText24: TppDBText;
    DbDocBaixa: TppDBText;
    LblTipoDoc: TppLabel;
    MemoHistorico: TppDBMemo;
    RptApGrLabel5: TppLabel;
    RptApGrDBText9: TppDBText;
    RptApGrDBText15: TppDBText;
    RptApGrLabel13: TppLabel;
    RptApGrDBText1: TppDBText;
    RptApGrLabel14: TppLabel;
    RptApGrDBText25: TppDBText;
    lblNoDocumento: TppLabel;
    PpExtenso: TppRegion;
    RptApGrLabel2: TppLabel;
    MenValorExtenso: TppMemo;
    RptApGrLabel17: TppLabel;
    ppCPFCNPJ: TppDBText;
    ppDBText19: TppDBText;
    RptApGrGroupFooterBand1: TppGroupFooterBand;
    RptContabBaixa: TppSubReport;
    RptApGrChildReport3: TppChildReport;
    RptApGrDetailBand2: TppDetailBand;
    RptApGrDBText10: TppDBText;
    RptApGrDBText11: TppDBText;
    RptApGrDBText12: TppDBText;
    RptApGrDBText13: TppDBText;
    RptApGrChildReport3DBText1: TppDBText;
    RptApGrChildReport3DBText2: TppDBText;
    RptContab3: TppSubReport;
    RptApGrChildReport2: TppChildReport;
    RptApGrDetailBand1: TppDetailBand;
    RptApGrDBText4: TppDBText;
    RptApGrDBText5: TppDBText;
    RptApGrDBText6: TppDBText;
    RptApGrDBText7: TppDBText;
    RptApGrChildReport2DBText1: TppDBText;
    RptApGrChildReport2DBText2: TppDBText;
    RptApGrChildReport2DBText3: TppDBText;
    RptContabLanc: TppSubReport;
    RptApGrChildReport1: TppChildReport;
    RptApGrChildReport1HeaderBand1: TppHeaderBand;
    RptApGrChildReport1Label1: TppLabel;
    RptApGrChildReport1Label2: TppLabel;
    RptApGrChildReport1Label3: TppLabel;
    RptApGrChildReport1Label4: TppLabel;
    RptApGrChildReport1Label5: TppLabel;
    RptApGrChildReport1Line1: TppLine;
    RptApGrChildReport1Label6: TppLabel;
    RptApGrChildReport1Label7: TppLabel;
    RptApGrChildReport1Label8: TppLabel;
    RptApGrChildReport1DetailBand1: TppDetailBand;
    RptApGrChildReport1DBText1: TppDBText;
    RptApGrChildReport1DBText3: TppDBText;
    RptApGrChildReport1DBText4: TppDBText;
    RptApGrChildReport1DBText2: TppDBText;
    RptApGrChildReport1DBText5: TppDBText;
    RptApGrChildReport1DBText6: TppDBText;
    RptApGrChildReport1DBText7: TppDBText;
    RptRateioParc: TppSubReport;
    RptApGrChildReport5: TppChildReport;
    RptApGrDetailBand4: TppDetailBand;
    RptApGrChildReport5DBText1: TppDBText;
    RptApGrChildReport5DBText2: TppDBText;
    RptApGrChildReport5DBText3: TppDBText;
    RptApGrChildReport5DBText4: TppDBText;
    DsContabLanc: TwwDataSource;
    Extenso: TExtensoCM;
    RptAlteradores: TppSubReport;
    RptApGrChildReport4: TppChildReport;
    RptApGrChildReport4TitleBand1: TppTitleBand;
    RptApGrChildReport4Label1: TppLabel;
    RptApGrChildReport4Label2: TppLabel;
    RptApGrChildReport4Label3: TppLabel;
    RptApGrChildReport4Label4: TppLabel;
    RptApGrChildReport4Label5: TppLabel;
    RptApGrChildReport4Line1: TppLine;
    RptApGrDetailBand3: TppDetailBand;
    RptApGrDBText20: TppDBText;
    RptApGrDBText21: TppDBText;
    RptApGrDBText22: TppDBText;
    RptApGrDBText23: TppDBText;
    PpContabBaixa: TppBDEPipeline;
    SqlTeste: TCMSqlParams;
    CdsTeste: TCMClientDataSet;
    QryRateioParc: TwwQuery;
    QryContabBaixa: TwwQuery;
    QryLancAlt: TwwQuery;
    QryContabLanc: TwwQuery;
    QryContab3: TwwQuery;
    QryAP: TwwQuery;
    QryAPCODDOCUMENTO: TFloatField;
    QryAPNUMFATURA: TFloatField;
    QryAPNUMSLIP: TStringField;
    QryAPNODOCUMENTO: TFloatField;
    QryAPCOMPLDOCUMENTO: TStringField;
    QryAPDOCCOMPL: TStringField;
    QryAPDESCOPERACAO: TStringField;
    QryAPDATAEMISSAO: TDateTimeField;
    QryAPDATAVENCTO: TDateTimeField;
    QryAPDATAPROGRAMADA: TDateTimeField;
    QryAPPLNCODIGO: TFloatField;
    QryAPSTATUSDOC: TStringField;
    QryAPSTATUSCONTAB: TStringField;
    QryAPDATALANCTO: TDateTimeField;
    QryAPRAZAOSOCIAL: TStringField;
    QryAPCPFCNPJ: TStringField;
    QryAPVALOR: TFloatField;
    QryAPVALOROUTRAMOEDA: TFloatField;
    QryAPHISTORICOCOMPL: TStringField;
    QryAPDESCTIPODOC: TStringField;
    QryAPDESCRICAO: TStringField;
    QryAPDESCPORTFORMA: TStringField;
    QryAPTIPODOCBAIXA: TStringField;
    QryAPOPERACAO: TStringField;
    QryAPPLACONTA: TStringField;
    QryAPSALDOANTERIOR: TFloatField;
    ppDBText1: TppDBText;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine1: TppLine;
    ppDBText2: TppDBText;
    ppLabel6: TppLabel;
    QryAPIDPROCESSO: TFloatField;
    ppDBText3: TppDBText;
    QryAPPAGTO: TStringField;
    Procedure RptApGrBeforePrint(Sender: TObject);
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure RptApGrGroupHeaderBand1BeforePrint(Sender: TObject);
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
    procedure QryContabBaixaAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptFichaPag: TRptFichaPag;

Implementation

{$R *.DFM}

Procedure TRptFichaPag.RptApGrBeforePrint(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'R' Then
    LblFormaPagto.Caption := 'Tipos de Cobrança';
End;

Procedure TRptFichaPag.CrmRptCMBeforePrint(Sender: TObject);
var balteratitulo : boolean;
Begin
  Inherited;
  balteratitulo := true;
  with TCMClientDataSet.create(nil) do
  try
     Data:= ParamIntegra.GetDataPacket('select Descricao from configreportscm where IDREPORTS = '+FloattoStr(CrmRptCM.IdReports) +
                                       '   and ORIGEMCM = 1 and IDPESSOA  = '+ FloattoStr(CrmRptCM.idEmpresa));
     balteratitulo := isempty;
  finally
     Free;
  end;

  If Not CmpRptCM.ParamValues[0].isnull Then
  Begin
    If Not CmpRptCM.ParamValues[1].AsBoolean Then
      RptContabLanc.Visible := False;
    qryAp.Close;
    With QryAp Do
    Begin
      SQL.Clear;
      SQL.Text := ' SELECT  D.CODDOCUMENTO, D.NUMSLIP, D.NUMFATURA, ' +

                  //  Rodolpho da Silva - P: 19565 - 27/06/2005  - Incluído na QryAp tmb.
                  '   D.IDPROCESSO, ' +

                  '         D.NODOCUMENTO, D.COMPLDOCUMENTO, '+
                  '         d.NODOCUMENTO  || '' '' || d.COMPLDOCUMENTO as DOCCOMPL, '+
                  '         decode(rtrim(l.operacao),''1'',''Lançamento Efetivo'',''2'',''Lançamento Efetivo'',''3'',''Lançamento Efetivo'',''10'',''Lançamento Efetivo'', ' +
                  '        ''11'',''Lançamento de Previsão'',''12'',''Lançamento de Previsão'',''13'',''Lançamento de Previsão'', '+
                  '        ''14'',''Lançamento de Adiantamento'',''15'',''Lançamento de Adiantamento'',''16'',''Lançamento de Adiantamento'',''17'',''Lançamento de Adiantamento'') as DESCOPERACAO, '+
                  '        D.DATAEMISSAO, D.DATAVENCTO, D.DATAPROGRAMADA, L.PLNCODIGO, '+
                  '        DECODE(D.STATUS,''2'',''DOCUMENTO BAIXADO'','''') AS STATUSDOC, '+
                  '        DECODE(L.PLNCODIGO,NULL,''NÃO INTEGRADO COM A CONTABILIDADE'',''INTEGRADO COM A CONTABILIDADE'') AS STATUSCONTAB, '+
                  '        L.DATALANCTO,  P.RAZAOSOCIAL, ' +
                  '        decode(P.tipo,''F'',substr(P.numdocumento,1,3)||''.''||substr(P.numdocumento,4,3)||''.''||substr(P.numdocumento,7,3)||''-''||substr(P.numdocumento,10,2), '+
                  '        substr(P.numdocumento,1,2)||''.''||substr(P.numdocumento,3,3)||''.''||substr(P.numdocumento,6,3)||''/''||substr(P.numdocumento,9,4)||''-''||substr(P.numdocumento,13,2) ) as cpfcnpj  , '+
                  '        L.VALOR, L.VALOROUTRAMOEDA, L.HISTORICOCOMPL, TD.DESCRICAO AS DESCTIPODOC, '+
                  '        F.DESCRICAO, PF.DESCRICAO AS DESCPORTFORMA, DECODE(D.NUMLEITCODBARRAS,NULL,DECODE(D.NUMDIGCODBARRAS,NULL, '+
                  '        CONTA.DESCCONTA,D.NUMDIGCODBARRAS),D.NUMLEITCODBARRAS) AS TIPODOCBAIXA, '+
                  '        D.OPERACAO, D.PLACONTA, SALDO.SALDOANTERIOR, '+

                  //amf 04.10.2006 20958
                  '        DECODE(VWS.SALDO, 0, ''Documento Liquidado'', ''Documento em Aberto'') PAGTO '+
                  'FROM DOCUMENTO D, LANCTODOCUM L, FORMARECPAG F,PESSOA P, TIPODOCRECPAG TD, PORTADORFORMA PF, '+

                  //amf 04.10.2006 20958
                  '     VWSALDODOC VWS, '+
                  '     (SELECT DOC.CODDOCUMENTO, SUM(DECODE(DOC.RECPAG,''R'',DECODE(LAN.DEBCRE,''D'',LAN.VALOR, LAN.VALOR*-1),DECODE(LAN.DEBCRE,''C'',LAN.VALOR, LAN.VALOR*-1))) AS SALDOANTERIOR '+
                  '      FROM LANCTODOCUM LAN, DOCUMENTO DOC ' +
                  '      WHERE (DOC.CODDOCUMENTO = LAN.CODDOCUMENTO) AND '+
                  '            (DOC.CODDOCUMENTO in  (' + CmpRptCM.ParamValues[0].AsString + ') ) '+
                  '      GROUP BY DOC.CODDOCUMENTO) SALDO, '+
                  '     (SELECT DISTINCT C.IDCBANCARIA, C.IDPESSOA, '+
                  '             '' Banco '' || RTRIM(B.NUMBANCO) || '' Agência ''  || RTRIM(A.NUMAGENCIA) || '' Conta: '' || RTRIM(C.CONTACORRENTE) AS DESCCONTA '+
                  '      FROM CONTABANCARIA C, AGENCIABANCARIA A, BANCO B '+
                  '      WHERE (C.IDAGENCIA(+) = A.IDPESSOA)           AND '+
                  '            (A.IDBANCO(+)   = B.IDPESSOA)) CONTA        '+
                  'WHERE (D.CODDOCUMENTO        in (' +  CmpRptCM.ParamValues[0].AsString + ') )          AND '+
                  '      (CONTA.IDCBANCARIA(+)  = D.IDCBANCARIA)          AND '+
                  '      (D.CODPORTFORMA        = PF.CODPORTFORMA(+))     AND '+
                  '      (D.CODDOCUMENTO        = L.CODDOCUMENTO)         AND '+
                  '      (D.OPERACAO            = L.OPERACAO)             AND '+
                  '      (P.IDPESSOA            = D.IDFORCLI)             AND '+
                  '      (D.CODFORMA            = F.CODFORMA(+))          AND '+
                  '      (TD.CODTIPDOC          = D.CODTIPDOC)            AND '+
                  '      (SALDO.CODDOCUMENTO    = D.CODDOCUMENTO)         AND '+
                  '      (D.CODDOCUMENTO        = VWS.CODDOCUMENTO)'+
                  'ORDER BY D.CODDOCUMENTO ';
    End;
    LblAutentica.Caption := CmpRptCM.ParamValues[3].AsString;
    If ParamIntegra.RecPag = 'R' Then
    Begin
      LblTipoDoc.Visible := False;
      DbDocBaixa.Visible := False;
      if balteratitulo then
         LblApGr.Caption := 'Ficha Financeira para Recebimento' + CmpRptCM.ParamValues[2].AsString;
      ppLabel135.Caption := 'Cliente';
    End
    Else
    Begin
      if balteratitulo then
         LblApGr.Caption := 'Ficha Financeira para Pagamento' + CmpRptCM.ParamValues[2].AsString;
      ppLabel135.Caption := 'Favorecido';
    End;
  End;

  QryAp.open;
End;

Procedure TRptFichaPag.RptApGrGroupHeaderBand1BeforePrint(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'R' Then
    LblSaldoDoc.Caption := 'Valor a Receber: '
  Else
    LblSaldoDoc.Caption := 'Valor a Pagar: ';

  If Not QryAp.IsEmpty Then
    RptApGrChildReport1HeaderBand1.Visible := TRUE
  Else
    RptApGrChildReport1HeaderBand1.Visible := false;

  MenValorExtenso.Lines.Clear;
  Extenso.Valor := QryAp.FieldByName('SaldoAnterior').AsFloat;
  Extenso.SetaIdiomaPadrao;
  Extenso.SetaMoedaPadrao;
  Extenso.Escreve;
  MenValorExtenso.Lines.Text := Extenso.Extenso;

End;

Procedure TRptFichaPag.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Var
  LblRelats: TppLabel;
Begin
  Inherited;
  SqlTeste.SQL.Text := 'SELECT NOMECOMPO,VALOR FROM PARAMRELATS WHERE (IDMODULO = '
    + FloatToStr(CrmRptCM.IdModulo) + ') AND (IDPESSOA = '
    + FloatToStr(CrmRptCM.idEmpresa) + ')';
  SqlTeste.Open;
  CdsTeste.First;
  While Not CdsTeste.Eof Do
  Begin
    Try
      LblRelats := (FindComponent(CdsTeste.FieldByName('NOMECOMPO').AsString) As TppLabel);
      If LblRelats = Nil Then
        LblRelats := (FindComponent(Cdsteste.FieldByName('NOMECOMPO').AsString) As TppLabel);

      If LblRelats <> Nil Then
        LblRelats.Caption := CdsTeste.FieldByName('VALOR').AsString;
    Finally
      CdsTeste.Next;
    End;
  End;
End;

procedure TRptFichaPag.QryContabBaixaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RptContabBaixa.Visible := True;
  if QryContabBaixa.EOF Then
     RptContabBaixa.Visible := False;
end;

End.





