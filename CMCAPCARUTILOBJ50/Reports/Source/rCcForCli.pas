{*******************************************************************************

                        Sistema - Contas a Receber

 *******************************************************************************
 Data      : 12/03/2018
 Autor     : Everson Luiz Pereira da Cunha
 SIG       : SIG TIBERO
 Descrição : Melhoria em adequação ao TIBERO.
             Inserir alias nas tabelas e campos.
             Retirar INDEX, +rule, etc
--------------------------------------------------------------------------------}

unit rCcForCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, DBTables, ppBands, ppClass, ppVar,
  ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, Wwdatsrc, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCtrlParamIntegra, uCMTypes, StdCtrls,
  CMProcuraSubTipo, TXRB;

type
  TRptCcForCli = class(TFrmCmReport)
    PpContaFornCli: TppBDEPipeline;
    DsContaFornCli: TwwDataSource;
    RptContaFornCli: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppReport1Label1: TppLabel;
    LblCc: TppLabel;
    LblPeridoCc: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppReport1DBText1: TppDBText;
    ppReport1DBText2: TppDBText;
    ppReport1DBText3: TppDBText;
    RptContaFornCliDBText2: TppDBText;
    RptContaFornCliDBText4: TppDBText;
    ppDBCalc15: TppDBCalc;
    ppDBText77: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppReport1Line1: TppLine;
    ppReportSistema: TppLabel;
    ppReport1Calc1: TppSystemVariable;
    ppReport1Calc2: TppSystemVariable;
    RptContaFornCliSummaryBand1: TppSummaryBand;
    RptContaFornCliLabel1: TppLabel;
    LblTotDeb: TppDBCalc;
    LblTotCred: TppDBCalc;
    RptContaFornCliLine1: TppLine;
    ppDBCalc18: TppDBCalc;
    ppGroup15: TppGroup;
    ppGroupHeaderBand15: TppGroupHeaderBand;
    ppLabel39: TppLabel;
    ppDBText78: TppDBText;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppGroupFooterBand15: TppGroupFooterBand;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppLabel42: TppLabel;
    SqlContaFornCli: TCMSqlParams;
    CdsContaFornCli: TCMClientDataSet;
    ppDBText1: TppDBText;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCcForCli: TRptCcForCli;

implementation

uses uString, uModulo;

{$R *.DFM}

procedure TRptCcForCli.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamValues[0].TextDefault := DateToStr(Date);
  CmpRptCM.ParamValues[1].TextDefault := DateToStr(Date);

  if ParamIntegra.recpag = 'R' then
  begin
     CmpRptCM.ParamValues[2].Caption := 'Cliente';
     CmpRptCM.ParamValues[2].ProcuraFCSettings.ForCli := fcCliente;
     CmpRptCM.ParamValues[2].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  end
  else
  begin
     CmpRptCM.ParamValues[2].Caption := 'Fornecedor';
     CmpRptCM.ParamValues[2].ProcuraFCSettings.ForCli := fcFornecedor;
     CmpRptCM.ParamValues[2].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  end;

  if ParamIntegra.recpag = 'R' then
  begin
    CmpRptCM.ParamValues[4].Caption := 'Tipo Cliente';
    CmpRptCM.ParamValues[4].LookupSettings.SQL.text :=
      'SELECT IDTIPOCLIENTE, DESCRICAO FROM TIPOCLIENTE ORDER BY DESCRICAO ';
  end
  else
  begin
    CmpRptCM.ParamValues[4].Caption := 'Ramo Fornecedor';
    CmpRptCM.ParamValues[4].LookupSettings.Chave := 'idramofornecedor';
    CmpRptCM.ParamValues[4].LookupSettings.Display := 'descramofornecedor';
    CmpRptCM.ParamValues[4].LookupSettings.SQL.text :=
      'select idramofornecedor,descramofornecedor from ramofornecedor';
  end;
  CmpRptCM.ParamValues[5].LookupSettings.SQL.text :=
    'SELECT CODTIPDOC, DESCRICAO FROM TIPODOCRECPAG ' + #13 +
    '  WHERE RECPAG = ''' + ParamIntegra.RecPag + ''' ORDER BY DESCRICAO';
  CmpRptCM.ParamValues[6].ProcuraCCSettings.Mascara := ParamIntegra.MascaraCC;
  CmpRptCM.ParamValues[6].ProcuraCCSettings.Plano := ParamIntegra.plano;
end;

procedure TRptCcForCli.CrmRptCMBeforePrint(Sender: TObject);
var
  nop : String;
begin
  inherited;
  if ParamIntegra.recpag = 'R' then
  begin
    LblCc.Caption := 'Conta Corrente de Clientes';
    ppLabel39.caption := 'Cliente';
  end
  else
  begin
    LblCc.Caption := 'Conta Corrente de Fornecedores';
    ppLabel39.caption := 'Forcecedor';
  end;

  LblPeridoCc.caption := 'Período entre ' + CmpRptCM.ParamValues[0].AsString +
    ' e ' + CmpRptCM.ParamValues[1].AsString;
  with SqlContaFornCli do
  begin
    SQL.Clear;
//    SQL.Add('SELECT /*+ RULE */ DISTINCT                   ');   //Everson TIBERO
    SQL.Add('SELECT DISTINCT                   '); //Everson TIBERO
    SQL.Add('   U.RAZAOSOCIAL,                 ');
    SQL.Add('   U.NODOCUMENTODEF,              ');
    SQL.Add('   U.NODOCUMENTO,                 ');
    SQL.Add('   U.COMPLDOCUMENTO,              ');
    SQL.Add('   U.CODDOCUMENTO,                ');
    SQL.Add('   U.NUMLANCTO,                   ');
    SQL.Add('   U.OPERACAO,                    ');
    SQL.Add('   DECODE(U.HISTORICO,NULL,DECODE(U.OPERACAO,''2 '',''LANÇAMENTO DE DOCUMENTO'',');
    SQL.Add('   DECODE(U.OPERACAO,''4 '',''LANÇAMENTO DE ALTERADOR'',                 ');
    SQL.Add('   DECODE(U.OPERACAO,''5 '',''BAIXA DE DOCUMENTO'',                      ');
    SQL.Add('   DECODE(U.OPERACAO,''10'',''LANÇAMENTO E BAIXA'',                      ');
    SQL.Add('   DECODE(U.OPERACAO,''15'',''ADIANTAMENTO'',                            ');
    SQL.Add('   DECODE(U.OPERACAO,''16'',''REGULARIZAÇÃO DE ADIANTAMENTO'',           ');
    SQL.Add('   DECODE(U.OPERACAO,''17'',''REGULARIZAÇÃO DE ADIANTAMENTO''))))))),U.HISTORICO) AS HISTORICO,  ');
    SQL.Add('   U.DATALANCTO,                  ');
    SQL.Add('   U.DATAPROGRAMADA,              ');
    SQL.Add('   U.IDFORCLI,                    ');
    SQL.Add('   U.SALDOANT,                    ');
    SQL.Add('   U.MOVDEB,                      ');
    SQL.Add('   U.MOVCRE,                       ');
    SQL.Add('   DECODE(U.RECPAG,''R'', (U.SALDOANT + U.MOVDEB - U.MOVCRE), (U.SALDOANT + U.MOVCRE - U.MOVDEB)) AS SALDO, ');
    SQL.Add('   U.NUMSLIP,                      ');
    SQL.Add('   ''           '' AS NUMOP, ''               '' NUMCHQBORDERO     ');
    SQL.Add('FROM                              ');
    SQL.Add('((SELECT                          ');
    SQL.Add('   P.RAZAOSOCIAL,                 ');
    SQL.Add('   D.NODOCUMENTO,                 ');
    SQL.Add('   DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),                  ');
    SQL.Add('   (TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTODEF, ');
    SQL.Add('   D.COMPLDOCUMENTO,              ');
    SQL.Add('   D.CODDOCUMENTO,                ');
    SQL.Add('   L.OPERACAO,                    ');
    SQL.Add('   D.RECPAG,                      ');
    SQL.Add('   L.NUMLANCTO,                   ');
    SQL.Add('   DECODE(L.HISTORICOCOMPL, NULL, T.DESCRICAO, L.HISTORICOCOMPL) AS HISTORICO, ');
    SQL.Add('   L.DATALANCTO,                  ');
    SQL.Add('   D.DATAPROGRAMADA,              ');
    SQL.Add('   D.IDFORCLI,                    ');
    SQL.Add('   0 AS SALDOANT,                 ');
    SQL.Add('   DECODE(L.OPERACAO,''10'',L.VALOR,DECODE(L.DEBCRE,''D'',L.VALOR, 0)) AS MOVDEB, ');
    SQL.Add('   DECODE(L.OPERACAO,''10'',L.VALOR,DECODE(L.DEBCRE,''C'',L.VALOR, 0)) AS MOVCRE, ');
    SQL.Add('   D.NUMSLIP                        ');
    SQL.Add('FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P, TIPOALTERADOR T                        ');
    SQL.Add('WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                          ');
    if CmpRptCM.ParamValues[3].AsBoolean then
      SQL.Add('  AND (L.OPERACAO IN (''1 '',''2 '',''4 '',''5 '',''10'',''17'')) ')
    else
      SQL.Add('  AND (L.OPERACAO IN (''1 '',''2 '',''4 '',''5 '',''10'',''15'',''16'',''17'')) ');
    SQL.Add('  AND (L.DATALANCTO >= TO_DATE(''' +
      CmpRptCM.ParamValues[0].AsString + ''',''DD/MM/YYYY''))   ');
    SQL.Add('  AND (L.DATALANCTO <= TO_DATE(''' +
      CmpRptCM.ParamValues[1].AsString + ''',''DD/MM/YYYY''))   ');
    SQL.Add('  AND (P.IDPESSOA = D.IDFORCLI)                                      ');
    SQL.Add('  AND (T.CODALTERADOR(+) = L.CODALTERADOR)                              ');
    if not CmpRptCM.ParamValues[5].IsNull then
      SQL.Add('  AND (D.CODTIPDOC = ' + CmpRptCM.ParamValues[5].AsString + ')');
    if not CmpRptCM.ParamValues[6].IsNull then
      SQL.Add('  AND (D.PLACONTA = ''' +
        Espaco(CmpRptCM.ParamValues[6].AsString, 18) + ''') ');
    if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      SQL.Add('  AND( D.IDFORCLI = ' + IntToStr(CmpRptCM.ParamValues[2].AsInteger) +
        ')   ');
    SQL.Add('  AND (D.RECPAG = ''' + ParamIntegra.RecPag +
      ''')                    ');
    SQL.Add('  AND (D.IDPESSOA = ' + FloatToStr(CrmRptCM.idEmpresa) +
      '))            ');
    SQL.Add('UNION ALL                                                        ');
    SQL.Add('(SELECT                                                          ');
    SQL.Add('   P.RAZAOSOCIAL,                                                ');
    SQL.Add('   0 AS NODOCUMENTO,                                             ');
    SQL.Add('   '''' AS NODOCUMENTODEF,                                       ');
    SQL.Add('   '''' AS COMPLDOCUMENTO,                                       ');
    SQL.Add('   0 AS CODDOCUMENTO,                                            ');
    SQL.Add('   ''  '' AS OPERACAO,                                           ');
    SQL.Add('   D.RECPAG,                      ');
    SQL.Add('   0 AS NUMLANCTO,                ');
    SQL.Add('   ''SALDO ANTERIOR'' AS HISTORICO,                                ');
    SQL.Add('   (TO_DATE(''' + CmpRptCM.ParamValues[0].AsString +
      ''',''DD/MM/YYYY'')-1)  AS DATALANCTO,      ');
    SQL.Add('   (TO_DATE(''' + CmpRptCM.ParamValues[1].AsString +
      ''',''DD/MM/YYYY'')-1)  AS DATAPROGRAMADA,  ');
    SQL.Add('   D.IDFORCLI,                                                     ');
    SQL.Add('   SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR, L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR, L.VALOR*-1))) AS SALDOANT, ');
    SQL.Add('   0 AS MOVDEB,                                                  ');
    SQL.Add('   0 AS MOVCRE,                                                  ');
    SQL.Add('   ''           '' AS NUMSLIP                                    ');
    SQL.Add('FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P                        ');
    SQL.Add('WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                          ');
    if CmpRptCM.ParamValues[3].AsBoolean then
      SQL.Add('  AND (L.OPERACAO IN (''1 '',''2 '',''4 '',''5 '',''17''))        ')
    else
      SQL.Add('  AND (L.OPERACAO IN (''1 '',''2 '',''4 '',''5 '',''15'',''16'',''17'')) ');
    SQL.Add('  AND (L.DATALANCTO < TO_DATE(''' + CmpRptCM.ParamValues[0].AsString
      + ''',''DD/MM/YYYY''))');
    SQL.Add('  AND (P.IDPESSOA = D.IDFORCLI)                                  ');
    if not CmpRptCM.ParamValues[5].IsNull then
      SQL.Add('  AND (D.CODTIPDOC = ' + CmpRptCM.ParamValues[5].AsString + ')');
    if not CmpRptCM.ParamValues[6].IsNull then
      SQL.Add('  AND (D.PLACONTA = ''' +
        Espaco(CmpRptCM.ParamValues[6].AsString, 18) + ''') ');
    if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      SQL.Add('  AND( D.IDFORCLI = ' + IntTostr(CmpRptCM.ParamValues[2].AsInteger) +
        ')    ');
    SQL.Add('  AND (D.RECPAG = ''' + ParamIntegra.RecPag +
      ''')                    ');
    SQL.Add('  AND (D.IDPESSOA = ' + FloatToStr(CrmRptCM.idEmpresa) +
      ')             ');
    SQL.Add('GROUP BY    P.RAZAOSOCIAL,                                       ');
    SQL.Add('   D.RECPAG,                      ');
    SQL.Add('   D.IDFORCLI                                                    ');
    SQL.Add('HAVING SUM(DECODE(D.RECPAG,''R'',DECODE(L.DEBCRE,''D'',L.VALOR, L.VALOR*-1),DECODE(L.DEBCRE,''C'',L.VALOR, L.VALOR*-1))) <> 0 ');
    SQL.Add(') ) U                                                            ');
    if ParamIntegra.RecPag = 'R' then
    begin
      if not CmpRptCM.ParamValues[4].IsNull then
      begin
        SQL.Add(',CLIENTEPESS C                  ');
        SQL.Add('WHERE (U.IDFORCLI = C.IDPESSOA) ');
        SQL.Add('  AND (C.IDTIPOCLIENTE = ' + CmpRptCM.ParamValues[4].AsString +
          ')  ');
      end;
    end
    else
    begin
      if not CmpRptCM.ParamValues[4].IsNull then
      begin
        SQL.Add(',FORNXRAMO F ');
        SQL.Add('WHERE (U.IDFORCLI = F.IDPESSOA)                         ');
        SQL.Add('  AND (F.IDRAMOFORNECEDOR = ' + CmpRptCM.ParamValues[4].AsString
          + ')');
      end;
    end;
    SQL.Add('ORDER BY U.RAZAOSOCIAL, U.IDFORCLI, U.DATALANCTO                 ');
    Open;
  end;
  if ParamIntegra.RecPag = 'P' then
  begin
    CdsContaFornCli.First;
    while not CdsContaFornCli.Eof do
    begin
       nop := Modulo.PegaNumeroOP(CdsContaFornCli.FieldByName('CODDOCUMENTO').AsFloat);
       if (Trim(nop) <> '') and (CdsContaFornCli.FieldByName('OPERACAO').AsInteger in [5,10,15,16,17] ) then
       begin
          CdsContaFornCli.Edit;
          CdsContaFornCli.FieldByName('NUMOP').AsString := nop;
          if CdsContaFornCli.FieldByName('OPERACAO').AsInteger <> 10 then
             CdsContaFornCli.FieldByName('NUMSLIP').AsString := '';
          CdsContaFornCli.post;
       end;
       CdsContaFornCli.Next;
    end
  end
 else
 begin
   CdsContaFornCli.First;
   while not CdsContaFornCli.Eof do
   begin
     nop := Modulo.PegaNumeroNUMCHQBORDERO(CdsContaFornCli.FieldByName('CODDOCUMENTO').AsFloat);
     if (Trim(nop) <> '') and (CdsContaFornCli.FieldByName('OPERACAO').AsInteger in [5,10,15,16,17] ) then
     begin
       CdsContaFornCli.Edit;
       CdsContaFornCli.FieldByName('NUMCHQBORDERO').AsString := nop;
       CdsContaFornCli.post;
     end;
     CdsContaFornCli.Next;
  end;
 end;
end;

end.

