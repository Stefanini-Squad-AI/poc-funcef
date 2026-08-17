//------------------------------------------------------------------------------
//==============================================================================
//  Alterações:
//  N. Sol..........: 179594
//  N. Kintana......: 1655911
//  Data............: 08/05/2012
//  Responsável.....: Fanuel Marinho dos Santos Junior
//  Descrição.......: Solicito ganho de performance na extração do relatório
//                    Valores Recebidos
//==============================================================================
// Data:      11/07/2006
// Autor:     andre tavares
// Pendência: 22818/22820
// Descrição: Retirar os hints +rule das queries
//==============================================================================
// Data:      14/06/2006
// Autor:     Alex Pereira
// Pendência: 22358
// Descrição: Inserido um AlterJoin na query com o valor do alterador, documentos
//            sem alteradores não estavam saindo no relatório
//==============================================================================
// Data:      19/05/2006
// Autor:     Rodolpho da Silva
// Pendência: 22358
// Descrição: Corrigido o erro em que não aparecia o valor do alterador e valor
//            bruto do documento, para os relatórios simples
//==============================================================================
// Data:      18/02/2005
// Autor:     Rodolpho da Silva
// Pendência: 18538/18539
// Descrição: Implementar filtro por Patrocinadora
//==============================================================================
// Data:      15/02/2005
// Autor:     Rodolpho da Silva
// Pendência: 17839
// Descrição: Correção nos valores Recebidos em Lança e Baixa Simultaneamente
//            pois estavam vindo negativos (-0,00)
//==============================================================================
// Data:      06/01/2004
// Autor:     Rodolpho da Silva
// Pendência: 18316
// Descrição: Implementar um relatório para que saia valores separados por plano
//==============================================================================



Unit rValoresRecPag;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBTables, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE,
  ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCtrlParamIntegra, uCmSqlParams, CMProcuraSubTipo,
  ppStrtch, uSistema, ppSubRpt, ppModule, raCodMod, TXRB, ppParameter;

Type
  TRptValoresRecPag = Class(TFrmCmReport)
    RptValoresRecPag: TppReport;
    ppHeaderBand10: TppHeaderBand;
    LblTitRel: TppLabel;
    ppLine35: TppLine;
    ppLabel13: TppLabel;
    ppDetailBand29: TppDetailBand;
    LblndicaEstorno: TppLabel;
    RptValoresRecPagDBText1: TppDBText;
    RptValoresRecPagDBText5: TppDBText;
    RptValoresRecPagDBText8: TppDBText;
    RptValoresRecPagDBText3: TppDBText;
    RptValoresRecPagDBText4: TppDBText;
    RptValoresRecPagDBText6: TppDBText;
    RptValoresRecPagDBText7: TppDBText;
    RptValoresRecPagDBText9: TppDBText;
    RptValoresRecPagDBText10: TppDBText;
    RptValoresRecPagDBText11: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppLine36: TppLine;
    ppLabel38: TppLabel;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    RptValoresRecPagSummaryBand1: TppSummaryBand;
    LblTotalRecPag: TppLabel;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    RptValoresRecPagGroup2: TppGroup;
    RptValoresRecPagGroupHeaderBand2: TppGroupHeaderBand;
    RptValoresRecPagLabel2: TppLabel;
    RptValoresRecPagDBText2: TppDBText;
    ppLabel40: TppLabel;
    RptValoresRecPagLabel3: TppLabel;
    RptValoresRecPagLabel4: TppLabel;
    RptValoresRecPagLabel5: TppLabel;
    LblFormaRecPag: TppLabel;
    RptValoresRecPagLabel7: TppLabel;
    RptValoresRecPagLabel1: TppLabel;
    RptValoresRecPagLabel6: TppLabel;
    RptValoresRecPagLabel9: TppLabel;
    RptValoresRecPagLabel10: TppLabel;
    RptValoresRecPagGroupFooterBand2: TppGroupFooterBand;
    RptValoresRecPagLabel8: TppLabel;
    RptValoresRecPagDBCalc2: TppDBCalc;
    RptValoresRecPagLine1: TppLine;
    RptValoresRecPagDBCalc5: TppDBCalc;
    RptValoresRecPagDBCalc6: TppDBCalc;
    RptValoresRecPagDBCalc3: TppDBCalc;
    PpValoresRecPag: TppBDEPipeline;
    DsValoresRecPag: TwwDataSource;
    CdsValoresRecPag: TCMClientDataSet;
    SqlValoresRecPag: TCMSqlParams;
    CdsVlBruto: TCMClientDataSet;
    CdsHistorico: TCMClientDataSet;
    CdsVlalt: TCMClientDataSet;
    SqlVlBruto: TCMSqlParams;
    SqlHistorico: TCMSqlParams;
    SqlVlalt: TCMSqlParams;
    SqlTeste: TCMSqlParams;
    CdsTeste: TCMClientDataSet;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    rptValoresRecPagPlano: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLbTituloRel: TppLabel;
    ppLine1: TppLine;
    ppLbEmpresa: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShpCorLinha: TppShape;
    ppLabel4: TppLabel;
    RptValoresRecPagNomePessoa: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLbNomeSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLabel6: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel7: TppLabel;
    ppDBText12: TppDBText;
    ppLabel8: TppLabel;
    ppDBText13: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape2: TppShape;
    ppLabel9: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppLine3: TppLine;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLine4: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine5: TppLine;
    ppLabel22: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    CdsValoresRecPagPlano: TCMClientDataSet;
    SqlValoresRecPagPlano: TCMSqlParams;
    ppValoresRecPagPlano: TppBDEPipeline;
    dsValoresRecPagPlano: TwwDataSource;
    ppDBText14: TppDBText;
    ppLabel2: TppLabel;
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
    Procedure FormCreate(Sender: TObject);
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppShpCorLinhaPrint(Sender: TObject);
    procedure ppLbEmpresaPrint(Sender: TObject);
    procedure ppLbNomeSistemaPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptValoresRecPag: TRptValoresRecPag;

Implementation

{$R *.DFM}

Procedure TRptValoresRecPag.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Var
  x: String;
Begin
  Inherited;
    if ParamIntegra.recpag = 'R' then
  begin
     CmpRptCM.ParamValues[0].Caption := 'Cliente';
     CmpRptCM.ParamValues[0].ProcuraFCSettings.ForCli := fcCliente;
     CmpRptCM.ParamValues[0].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  end
  else
  begin
     CmpRptCM.ParamValues[0].Caption := 'Fornecedor';
     CmpRptCM.ParamValues[0].ProcuraFCSettings.ForCli := fcFornecedor;
     CmpRptCM.ParamValues[0].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  end;
  CmpRptCM.ParamValues[1].LookupSettings.SQL.text :=
    'SELECT CODPORTFORMA, DESCRICAO ' + #13 +
    '   FROM PORTADORFORMA ' + #13 +
    '   WHERE RECPAG = ''' + ParamIntegra.RecPag + '''' + ' AND ' + #13 +
    '       IDPESSOA = ' + Floattostr(CrmRptCM.IdEmpresa);

  x := 'SELECT CODTIPDOC,DESCRICAO FROM TIPODOCRECPAG a ' + #13 +
    '  WHERE a.RECPAG = ''' + ParamIntegra.RecPag + '''' + #13 +
    ' and not exists (select 1 from UsuarioxTpdocto b ' + #13 +
    '  where b.idusuario=' + Floattostr(CrmRptCM.IdUsuario) + ' and RECPAG= '''
    + ParamIntegra.RecPag + '''' + ') ' + #13 +
    ' union SELECT CODTIPDOC,DESCRICAO                    ' + #13 +
    '  FROM TIPODOCRECPAG a                               ' + #13 +
    ' WHERE a.RECPAG = ''' + ParamIntegra.RecPag + '''' +
    ' and  exists                   ' + #13 +
    ' (select 1 from UsuarioxTpdocto b where a.codtipdoc=b.codtipdoc  ' + #13 +
    ' and b.idusuario=' + Floattostr(CrmRptCM.IdUsuario) + ' and RECPAG= ''' +
    ParamIntegra.RecPag + '''' + ')  ' + #13 + '  ORDER BY DESCRICAO  ';
  CmpRptCM.ParamValues[2].LookupSettings.SQL.text := x;
  CmpRptCM.ParamValues[3].TextDefault := DateToStr(date);
  CmpRptCM.ParamValues[4].TextDefault := DateToStr(date);

End;

Procedure TRptValoresRecPag.FormCreate(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'P' Then
  Begin
    CmpRptCM.Caption := 'Parâmetros do Relatórios de Valores Pagos';
    CmpRptCM.ParamValues[1].Caption := 'Conta/Caixa x Forma de Pagamento';
    CmpRptCM.ParamValues[3].Caption := 'Data do Pagamento Inicial';
    CmpRptCM.ParamValues[4].Caption := 'Data do Pagamento Final';
    CmpRptCM.ParamValues[7].Caption := 'Inclui no relatório os valores recebidos';
  End;
  CmpRptCM.ParamValues[3].AsString := DateToStr(Date);
  CmpRptCM.ParamValues[4].AsString := DateToStr(Date);
End;



Procedure TRptValoresRecPag.CrmRptCMBeforePrint(Sender: TObject);
var
sCaptionRelatorio: string;


Begin
//  Início - Rodolpho - 18316
  If ParamIntegra.RecPag = 'R' Then
  begin
     sCaptionRelatorio     := 'Listagem dos Valores Recebidos Entre ' +  CmpRptCM.ParamValues[3].AsString + ' e ' + CmpRptCM.ParamValues[4].AsString;
     LblTitRel.Caption     := sCaptionRelatorio;
     ppLbTituloRel.Caption := sCaptionRelatorio;
  end
  Else
  begin
     sCaptionRelatorio     := 'Listagem dos Valores Pagos Entre ' + CmpRptCM.ParamValues[3].AsString + ' e ' + CmpRptCM.ParamValues[4].AsString;
     LblTitRel.Caption     := sCaptionRelatorio;
     ppLbTituloRel.Caption := sCaptionRelatorio;
  end;


  //  Caso o usuário deseje que o relatório saia rateado por plano,
  // este bloco é executado
  if CmpRptCM.ParamValues[5].AsBoolean then
  begin
     //  Informa o report para lay-out
     CrmRptCM.Report := rptValoresRecPagPlano;

     with SqlValoresRecPagPlano do
     begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT ');
       Sql.Add('PLN.NOME AS PLANO,');

       //  Rodolpho da Silva - P: 18538/18539 - 18/02/2005
       Sql.Add('DESCPATRO.RAZAOSOCIAL AS PATRO,');
       Sql.Add('EP.MATRICULA,');
       Sql.Add('LAN.CODDOCUMENTO,');
       Sql.Add('DOC.NUMFATURA,');
       Sql.Add('LAN.NUMLANCTO,');
       Sql.Add('LAN.DATALANCTO,');
       Sql.Add('LAN.OPERACAO,');
       Sql.Add('LAN.VALOROUTRAMOEDA,');
       Sql.Add('DOC.RECPAG,');
       Sql.Add('LAN.DEBCRE,');

       //  Aqui, a qry pega o valor líquido do documento, baseado na tabela RATEIODOCUM
       //já com o valor corrigido em base na tabela LANCTODOCUM
       Sql.Add('DECODE((SELECT COUNT(CODDOCUMENTO)');
       Sql.Add('        FROM RATEIODOCUM');
       Sql.Add('        WHERE CODDOCUMENTO = DOC.CODDOCUMENTO),1,');
       Sql.Add('        DECODE(LAN.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LAN.VALOR*1,LAN.VALOR),');
       Sql.Add('        DECODE(DOC.RECPAG,''P'',LAN.VALOR*1,LAN.VALOR)),');
       Sql.Add('        DECODE(LAN.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'', RAT.VALOR*1,');
       Sql.Add('               ROUND((RAT.VALOR / (SELECT SUM(VALOR)/100 FROM RATEIODOCUM WHERE CODDOCUMENTO = DOC.CODDOCUMENTO) * (LAN.VALOR/100)),2)),');
       Sql.Add('        DECODE(DOC.RECPAG,''P'',RAT.VALOR*1,');
       Sql.Add('               ROUND((RAT.VALOR / (SELECT SUM(VALOR)/100 FROM RATEIODOCUM WHERE CODDOCUMENTO = DOC.CODDOCUMENTO) * (LAN.VALOR/100)),2)))');
       Sql.Add('       ) AS VLRLIQUIDO,');

       //  Aqui a qry pega o valor do alterador, subtraindo o valor líquido do valor bruto
       Sql.Add('(DECODE((SELECT COUNT(CODDOCUMENTO)');
       Sql.Add('         FROM RATEIODOCUM');
       Sql.Add('         WHERE CODDOCUMENTO = DOC.CODDOCUMENTO),1,');
       Sql.Add('         DECODE(LAN.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LAN.VALOR*1,LAN.VALOR),');
       Sql.Add('         DECODE(DOC.RECPAG,''P'',LAN.VALOR*1,LAN.VALOR)),');
       Sql.Add('         DECODE(LAN.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',RAT.VALOR*1,');
       Sql.Add('            ROUND((RAT.VALOR / (SELECT SUM(VALOR)/100 FROM RATEIODOCUM WHERE CODDOCUMENTO = DOC.CODDOCUMENTO) * (LAN.VALOR/100)),2)),');
       Sql.Add('         DECODE(DOC.RECPAG,''P'',RAT.VALOR*1,');
       Sql.Add('            ROUND((RAT.VALOR / (SELECT SUM(VALOR)/100 FROM RATEIODOCUM WHERE CODDOCUMENTO = DOC.CODDOCUMENTO) * (LAN.VALOR/100)),2)))');
       Sql.Add('                              ) - ');
       Sql.Add('(DECODE((SELECT COUNT(CODDOCUMENTO)');
       Sql.Add('         FROM RATEIODOCUM');
       Sql.Add('         WHERE CODDOCUMENTO = DOC.CODDOCUMENTO),1,');
       Sql.Add('              (SELECT SUM (DECODE(L.DEBCRE,''C'',');
       Sql.Add('                      DECODE(D.RECPAG,''P'',L.VALOR,L.VALOR * 1),');
       Sql.Add('                      DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR * 1))) AS VALOR');
       Sql.Add('          FROM LANCTODOCUM L, DOCUMENTO  D');
       Sql.Add('          WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)');
       Sql.Add('          AND   (L.DATALANCTO <= LAN.DATALANCTO)');
       Sql.Add('          AND   (L.OPERACAO  = ''4'')');

       Sql.Add('          AND   (L.NUMLANCTO <> LAN.NUMLANCTO OR (L.NUMLANCTO = LAN.NUMLANCTO AND L.OPERACAO = ''10''))');
       Sql.Add('          AND   (D.CODDOCUMENTO = DOC.CODDOCUMENTO)),RAT.VALOR))');
       Sql.Add(')   AS VALORALT,');

       //  Aqui a qry busca o valor bruto. Caso o documento não esteja rateado,
       //a qry pega o valor da LANCTODOCUM, caso contrário, pega o valor da RATEIODOCUM
       Sql.Add('DECODE((SELECT COUNT(CODDOCUMENTO)');
       Sql.Add('        FROM RATEIODOCUM');
       Sql.Add('        WHERE CODDOCUMENTO = DOC.CODDOCUMENTO),1,');
       Sql.Add('       (SELECT SUM (DECODE(L.DEBCRE,''C'',');
       Sql.Add('                    DECODE(D.RECPAG,''P'',L.VALOR,L.VALOR * 1),');
       Sql.Add('                    DECODE(D.RECPAG,''R'',L.VALOR,L.VALOR * 1))) AS VALOR');
       Sql.Add('        FROM LANCTODOCUM L, DOCUMENTO  D');
       Sql.Add('        WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)');
       Sql.Add('        AND   (L.DATALANCTO <= LAN.DATALANCTO)');
       Sql.Add('  AND (L.OPERACAO NOT IN (''4'',''5'',''10'',''15'')) ' );
       Sql.Add('        AND   (L.NUMLANCTO <> LAN.NUMLANCTO OR (L.NUMLANCTO = LAN.NUMLANCTO AND L.OPERACAO = ''10''))');
       Sql.Add('        AND   (D.CODDOCUMENTO = DOC.CODDOCUMENTO)),RAT.VALOR');
       Sql.Add(') AS VLRBRUTO,');

       //  Aqui a qry define o histórico do documento
       Sql.Add('(SELECT L.HISTORICOCOMPL AS HISTLANC');
       Sql.Add(' FROM   LANCTODOCUM L');
       Sql.Add(' WHERE (RTRIM(L.OPERACAO) IN (''1'',''2'',''3'',''10'',''14'',''15''))');
       Sql.Add(' AND L.CODDOCUMENTO = DOC.CODDOCUMENTO');
       Sql.Add(' ) AS HISTORICO,');
       Sql.Add('REC.NUMCHQBORDERO,');
       Sql.Add('PESSFIS.RAZAOSOCIAL AS NOMEPESSOA,');
       Sql.Add('PF.DESCRICAO AS DESCPORTFORMA,');
       Sql.Add('DOC.NOSSONUMERO,');
       Sql.Add('PESSFIS.NOME AS NOMEFANTASIA,');
       Sql.Add('(RTRIM(TO_CHAR(DOC.NODOCUMENTO)) || '' '' || RTRIM(DOC.COMPLDOCUMENTO)) AS CODDOCU,');
       Sql.Add('TIP.DESCRICAO,');
       Sql.Add('LAN.ESTORNO,');
       Sql.Add('REC.CODPORTFORMA');
       Sql.Add('FROM');
       Sql.Add('   LANCTODOCUM LAN, DOCUMENTO DOC, RECBTOPAGTO REC, RATEIODOCUM RAT,');
       Sql.Add('   PESSOA PESSFIS, TIPODOCRECPAG TIP, PLANPREVCONTABIL PLN, PORTADORFORMA PF, ELEGPATRO EP, PATRO PAT,');
       Sql.Add('(SELECT RAZAOSOCIAL, IDPESSOA FROM PESSOA) DESCPATRO ');
       Sql.Add('WHERE (RTRIM(LAN.OPERACAO) IN (''5'',''15'',''10''))');
       Sql.Add('AND (LAN.DATALANCTO BETWEEN TO_DATE(''' + CmpRptCM.ParamValues[3].AsString + ''',''DD/MM/YYYY'')  AND');
       Sql.Add('                            TO_DATE(''' + CmpRptCM.ParamValues[4].AsString + ''',''DD/MM/YYYY''))');

       Sql.Add('AND (LAN.NUMLANCTO    = REC.NUMLANCTO)');
       Sql.Add('AND (PF.CODPORTFORMA  = REC.CODPORTFORMA)');
       Sql.Add('AND (PESSFIS.IDPESSOA = EP.IDPESSOA(+))');
       Sql.Add('AND (LAN.CODDOCUMENTO = REC.CODDOCUMENTO)');
       Sql.Add('AND (DOC.CODDOCUMENTO = LAN.CODDOCUMENTO)');
       Sql.Add('AND (LAN.CODDOCUMENTO = RAT.CODDOCUMENTO)');
       Sql.Add('AND (RAT.IDPLANOPREV  = PLN.IDPLANOPREV)');
       Sql.Add('AND (RAT.IDPATRO(+)   = PAT.IDPESSOA)');
       Sql.Add('AND (PAT.IDPESSOA     = DESCPATRO.IDPESSOA)');

       if CmpRptCM.ParamValues[6].AsString <> '' then
          Sql.Add('AND (RAT.IDPATRO      = ' + CmpRptCM.ParamValues[6].AsString + ')');

       Sql.Add('AND (DOC.IDPESSOA = ' + Floattostr(CrmRptCM.IdEmpresa) + ')');
       Sql.Add('AND (DOC.RECPAG = ''' + ParamIntegra.RecPag + ''') ');
       If CmpRptCM.ParamValues[0].AsInteger <> 0 Then
          Sql.Add('   AND (DOC.IDFORCLI = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) + ')');
       If Not CmpRptCM.ParamValues[1].IsNull Then
          Sql.Add('   AND (REC.CODPORTFORMA = ' + CmpRptCM.ParamValues[1].AsString + ')');
       If Not CmpRptCM.ParamValues[2].IsNull Then
          Sql.Add('   AND (TIP.CODTIPDOC = ' + CmpRptCM.ParamValues[2].AsString + ')');
       Sql.Add('AND  DOC.CODTIPDOC IN (SELECT B.CODTIPDOC');
       Sql.Add('                     FROM TIPODOCRECPAG B');
       Sql.Add('                     WHERE (B.RECPAG = ''' + ParamIntegra.RecPag + ''')');
       Sql.Add('                     AND (NOT EXISTS (SELECT 1');
       Sql.Add('                                      FROM USUARIOXTPDOCTO U');
       Sql.Add('                                      WHERE (U.IDUSUARIO = ' + Floattostr(CrmRptCM.IdUsuario) + ')');
       Sql.Add('                                      AND (U.RECPAG = ''' + ParamIntegra.RecPag + ''')))');
       Sql.Add('                     UNION');
       Sql.Add('                     SELECT A.CODTIPDOC');
       Sql.Add('                     FROM  TIPODOCRECPAG A, USUARIOXTPDOCTO B');
       Sql.Add('                     WHERE (A.RECPAG = ''' + ParamIntegra.RecPag + ''')');
       Sql.Add('                     AND   (A.CODTIPDOC = B.CODTIPDOC)');
       Sql.Add('                     AND   (B.IDUSUARIO = ' + Floattostr(CrmRptCM.IdUsuario) + ') )');
       Sql.Add('                     AND   (DOC.IDFORCLI = PESSFIS.IDPESSOA)');
       If Not CmpRptCM.ParamValues[7].AsBoolean Then
       Begin
          If ParamIntegra.RecPag = 'R' Then
          Begin
             Sql.Add('   AND (LAN.ESTORNO IS NULL)                               ');
             Sql.Add('   AND (((LAN.DEBCRE = ''C'') AND (LAN.OPERACAO <> ''10''))');
             Sql.Add('     OR ((LAN.DEBCRE = ''D'') AND (LAN.OPERACAO = ''10'')))');
          End
          Else
          Begin
             Sql.Add('   AND (LAN.ESTORNO IS NULL)                               ');
             Sql.Add('   AND (((LAN.DEBCRE = ''D'') AND (LAN.OPERACAO <> ''10''))');
             Sql.Add('     OR ((LAN.DEBCRE = ''C'') AND (LAN.OPERACAO = ''10'')))');
          End;
       End;
       Sql.Add('                     AND   (TIP.CODTIPDOC = DOC.CODTIPDOC)');
       Sql.Add('ORDER BY');
       Sql.Add('   LAN.DATALANCTO,REC.NUMCHQBORDERO, PLANO');
       Open;
     end;
  end
  else
  begin
     CrmRptCM.Report := RptValoresRecPag; 

     With SqlValoresRecPag Do
     Begin
       Close;
       Sql.Clear;
       Sql.Add(' SELECT LAN.CODDOCUMENTO, DOC.NUMFATURA, LAN.NUMLANCTO, LAN.DATALANCTO, LAN.OPERACAO,');
       Sql.Add('        LAN.VALOROUTRAMOEDA, DOC.RECPAG,LAN.DEBCRE,                       ');
       Sql.Add('   DECODE(LAN.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LAN.VALOR*1,LAN.VALOR),       ');
       Sql.Add('       DECODE(DOC.RECPAG,''P'',LAN.VALOR*1,LAN.VALOR)) AS VALOR,               ');
       Sql.Add('        ''                                                                                                   '' AS HISTORICO,');
       Sql.Add('        REC.NUMCHQBORDERO, PESSFIS.RAZAOSOCIAL AS NOMEPESSOA, PF.DESCRICAO AS DESCPORTFORMA, ');
       Sql.Add('        DOC.NOSSONUMERO, ');
       Sql.Add('        PESSFIS.NOME AS NOMEFANTASIA, ');
       Sql.Add('        (RTRIM(TO_CHAR(DOC.NODOCUMENTO)) || '' '' || RTRIM(DOC.COMPLDOCUMENTO)) AS CODDOCU,  ');
       //Fanuel Marinho Teste - Inicio   SOL179594 Kintana1655911 - Melhora de performance
       //Sql.Add('        TIP.DESCRICAO, LAN.ESTORNO, REC.CODPORTFORMA, DOCVLB.VLRBRUTO, DOCALT.VALORALT   ');
       Sql.Add('        TIP.DESCRICAO, LAN.ESTORNO, REC.CODPORTFORMA,    ');

       //Fanuel Marinho Teste - Inicio   SOL179594 Kintana1655911 - Melhora de performance
        Sql.Add('  (SELECT  SUM(DECODE(D.RECPAG,          ');
       Sql.Add('                    ''P'',                 ');
       Sql.Add('                    DECODE(L.DEBCRE, ''C'', L.VALOR, L.VALOR * -1),                 ');
       Sql.Add('                    DECODE(L.DEBCRE, ''D'', L.VALOR, L.VALOR * -1))) AS VALORALT    ');
       Sql.Add('    FROM LANCTODOCUM L, DOCUMENTO D           ');
       Sql.Add('   WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)    ');
       Sql.Add('              AND (DOC.CODDOCUMENTO = D.CODDOCUMENTO(+))   ');
       Sql.Add('     AND (RTRIM(L.OPERACAO) = ''4'')) VALORALT,            ');
       Sql.Add(' (SELECT  SUM(DECODE(LN.DEBCRE,                            ');
       Sql.Add('                    ''C'',                                   ');
       Sql.Add('                    DECODE(DC.RECPAG, ''P'', LN.VALOR, LN.VALOR * -1),   ');
       Sql.Add('                    DECODE(DC.RECPAG, ''R'', LN.VALOR, LN.VALOR * -1))) AS VLRBRUTO   ');
       Sql.Add('    FROM LANCTODOCUM LN, DOCUMENTO DC                      ');
       Sql.Add('   WHERE (LN.CODDOCUMENTO = DC.CODDOCUMENTO)               ');
       Sql.Add('     AND (RTRIM(LN.OPERACAO) NOT IN (''4'', ''5'', ''10'', ''15''))     ');
       Sql.Add('     AND (DOC.CODDOCUMENTO = DC.CODDOCUMENTO)                   ');
       Sql.Add('     AND ((LAN.NUMLANCTO <> LN.NUMLANCTO) OR                    ');
       Sql.Add('         (LAN.NUMLANCTO = LN.NUMLANCTO) AND (RTRIM(LAN.OPERACAO) = ''10'')) ) VLRBRUTO  ');
       //Fanuel Marinho Teste - Fim   SOL179594 Kintana1655911 - Melhora de performance


       Sql.Add(' FROM LANCTODOCUM LAN, DOCUMENTO DOC, RECBTOPAGTO REC,    ');

      //Fanuel Marinho Teste - Inicio   SOL179594 Kintana1655911 - Melhora de performance
        {Sql.Add(' (SELECT D.CODDOCUMENTO, ');
       Sql.Add('     SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1), ');
       Sql.Add('                      DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1))) AS VALORALT ');
       Sql.Add(' FROM DOCUMENTO D, LANCTODOCUM L ');
       Sql.Add(' WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO) ');
       Sql.Add('   AND (L.OPERACAO = ''4'' ) ');
       Sql.Add(' GROUP BY D.CODDOCUMENTO) DOCALT, ');   }

       {Sql.Add('(SELECT DC.CODDOCUMENTO,LN.NUMLANCTO, ' );
       Sql.Add('  SUM(DECODE(LN.DEBCRE, ''C'', ' );
       Sql.Add('             DECODE(DC.RECPAG,   ''P'', LN.VALOR,  LN.VALOR*-1), ' );
       Sql.Add('             DECODE(DC.RECPAG,   ''R'', LN.VALOR,  LN.VALOR*-1))) AS VLRBRUTO ' );
       Sql.Add(' FROM ' );
       Sql.Add('  LANCTODOCUM LN, ' );
       Sql.Add('  DOCUMENTO DC ' );
       Sql.Add('WHERE ' );
       Sql.Add('  (LN.CODDOCUMENTO = DC.CODDOCUMENTO) AND ' );
       Sql.Add('  (RTRIM(LN.OPERACAO) NOT IN (''4'',''5'',''10'',''15'')) ' );
       Sql.Add('GROUP BY ' );
       Sql.Add('DC.CODDOCUMENTO,LN.NUMLANCTO) DOCVLB, ' );  }
       //Fanuel Marinho Teste - fim   SOL179594 Kintana1655911 - Melhora de performance

       Sql.Add('      PESSOA PESSFIS, TIPODOCRECPAG TIP,PORTADORFORMA PF  ');
       Sql.Add(' WHERE (RTRIM(LAN.OPERACAO) IN (''5'',''15'',''10''))     ');
       Sql.Add('   AND (LAN.DATALANCTO BETWEEN TO_DATE(''' + CmpRptCM.ParamValues[3].AsString + ''',''DD/MM/YYYY'')  AND ');
       Sql.Add('        TO_DATE(''' + CmpRptCM.ParamValues[4].AsString + ''',''DD/MM/YYYY''))');
       Sql.Add('   AND (LAN.NUMLANCTO = REC.NUMLANCTO)                 ');
       Sql.Add('   AND (PF.CODPORTFORMA = REC.CODPORTFORMA)            ');

       //Fanuel Marinho Teste - Inicio   SOL179594 Kintana1655911 - Melhora de performance
       //Sql.Add('   AND (DOC.CODDOCUMENTO = DOCALT.CODDOCUMENTO(+)) ');
       //Sql.Add('   AND (DOC.CODDOCUMENTO = DOCVLB.CODDOCUMENTO) ');
       //Sql.Add('   AND ((LAN.NUMLANCTO <> DOCVLB.NUMLANCTO) OR (LAN.NUMLANCTO = DOCVLB.NUMLANCTO) AND  (RTRIM(LAN.OPERACAO) = ''10'')) ');
       Sql.Add('   AND (LAN.CODDOCUMENTO = REC.CODDOCUMENTO)           ');
       Sql.Add('   AND (DOC.CODDOCUMENTO = LAN.CODDOCUMENTO)           ');
       Sql.Add('   AND (DOC.IDPESSOA = ' + Floattostr(CrmRptCM.IdEmpresa) + ')');
       Sql.Add('   AND (DOC.RECPAG = ''' + ParamIntegra.RecPag + ''') ');
       If CmpRptCM.ParamValues[0].AsInteger <> 0 Then
         Sql.Add('   AND (DOC.IDFORCLI = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) + ')');
       If Not CmpRptCM.ParamValues[1].IsNull Then
         Sql.Add('   AND (REC.CODPORTFORMA = ' + CmpRptCM.ParamValues[1].AsString + ')');
       If Not CmpRptCM.ParamValues[2].IsNull Then
         Sql.Add('   AND (TIP.CODTIPDOC = ' + CmpRptCM.ParamValues[2].AsString + ')');
       Sql.Add(' AND DOC.CODTIPDOC IN ( ');
       Sql.Add('SELECT B.CODTIPDOC FROM TIPODOCRECPAG B');
       Sql.Add('  WHERE (B.RECPAG = ''' + ParamIntegra.RecPag + ''') AND');
       Sql.Add('        (NOT EXISTS (SELECT 1 FROM USUARIOXTPDOCTO U');
       Sql.Add('                     WHERE (U.IDUSUARIO = ' + Floattostr(CrmRptCM.IdUsuario) + ')');
       Sql.Add('                       AND (U.RECPAG = ''' + ParamIntegra.RecPag + ''')))');
       Sql.Add('UNION ');
       Sql.Add('SELECT A.CODTIPDOC FROM  TIPODOCRECPAG A, USUARIOXTPDOCTO B');
       Sql.Add(' WHERE (A.RECPAG = ''' + ParamIntegra.RecPag + ''')');
       Sql.Add('   AND (A.CODTIPDOC = B.CODTIPDOC)');
       Sql.Add('   AND (B.IDUSUARIO = ' + Floattostr(CrmRptCM.IdUsuario) + ') )');
       Sql.Add('   AND (DOC.IDFORCLI = PESSFIS.IDPESSOA) ');
       If Not CmpRptCM.ParamValues[7].AsBoolean Then
       Begin
         If ParamIntegra.RecPag = 'R' Then
         Begin                                                                             
           Sql.Add('   AND (LAN.ESTORNO IS NULL)                               ');
           Sql.Add('   AND (((LAN.DEBCRE = ''C'') AND (LAN.OPERACAO <> ''10''))');
           Sql.Add('     OR ((LAN.DEBCRE = ''D'') AND (LAN.OPERACAO = ''10'')))');
         End
         Else
         Begin
           Sql.Add('   AND (LAN.ESTORNO IS NULL)                               ');
           Sql.Add('   AND (((LAN.DEBCRE = ''D'') AND (LAN.OPERACAO <> ''10''))');
           Sql.Add('     OR ((LAN.DEBCRE = ''C'') AND (LAN.OPERACAO = ''10'')))');
         End;
       End;
       Sql.Add('   AND (TIP.CODTIPDOC = DOC.CODTIPDOC) ');
       Sql.Add('ORDER BY LAN.DATALANCTO,REC.NUMCHQBORDERO');
       Open;
     End;
     With CdsValoresRecPag Do
     Begin
       If CmpRptCM.ParamValues[8].AsBoolean Then
       Begin
         First;
         While Not EOF Do
         Begin                                             
           Edit;

           SqlHistorico.Prepare;
           SqlHistorico.parambyname('coddocumento').asinteger := fieldbyname('coddocumento').asinteger;
           SqlHistorico.open;
           If Not CdsHistorico.isempty Then
             FIELDBYNAME('HISTORICO').ASSTRING :=
               CdsHistorico.FIELDBYNAME('HISTLANC').ASSTRING;
           POST;
           NEXT;
         End;
         first;
       End;
     End;
  end;
  Inherited;
End;



procedure TRptValoresRecPag.ppShpCorLinhaPrint(Sender: TObject);
begin
  inherited;
  if ppShpCorLinha.Brush.Color = clWhite then
     ppShpCorLinha.Brush.Color := $00C6FFC6
  else
     ppShpCorLinha.Brush.Color := clWhite;
end;



procedure TRptValoresRecPag.ppLbEmpresaPrint(Sender: TObject);
begin
  inherited;
  ppLbEmpresa.Caption := Sistema.NomeEmpresa;
end;



procedure TRptValoresRecPag.ppLbNomeSistemaPrint(Sender: TObject);
begin
  inherited;
  ppLbNomeSistema.Caption := Sistema.NomeCompleto;
end;



End.


