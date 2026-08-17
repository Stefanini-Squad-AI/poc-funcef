// ATUALIZAÇÕES
{--------------------------------------------------------------------------------------------------
N. Sol..........: 193143-13062
N. Kintana......: 1891259
Data............: 24/12/2012
Responsável.....: Edilaine Ferraresi
Descrição.......: Alterar local da gravação da qry.txt
Rotina..........: CrmRptCMBeforePrint
-------------------------------------------------------------------------------------------------- }


unit RRequi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppCtrls,
  ppVar, ppPrnabl, ppCache, TXRB;

type
  TRptRequi = class(TFrmCmReport)
    rpRequi: TppReport;
    ppRequi: TppBDEPipeline;
    dsRequi: TwwDataSource;
    CdsRequi: TCMClientDataSet;
    sqlRequi: TCMSqlParams;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel2: TppLabel;
    ppLabel6: TppLabel;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine1: TppLine;
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
    ppSummaryBand1: TppSummaryBand;
    ppLabel11: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel12: TppLabel;
    ppShape1: TppShape;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    procedure GerarDadosRelat;
  end;

var
  RptRequi: TRptRequi;

implementation

uses dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptRequi.CrmRptCMBeforePrint(Sender: TObject);
var
  c: integer;
begin
  inherited;
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('   PJ.NOME AS EMPRESA, ('' '') AS EMPREGADO, C.TITULO AS CARGOREQ,');
    Add('   CC.NOME AS CENTROCUSTO, R.DATAREQ, ');
    Add('   ('' '') AS CARGO, R.NUMREQ, R.DATAPLAN,');
    Add('   DECODE(R.SITUACAO,''A'',1,0) AS Q41,');
    Add('   DECODE(R.SITUACAO,''E'',1,0) AS Q42,');
    Add('   DECODE(R.SITUACAO,''C'',1,0) AS Q43,');
    Add('   DECODE(R.TIPOREQ,2,1,0) AS Q14,');
    Add('   DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,1,1,0),0) AS Q24,');
    Add('   DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,2,1,0),0) AS Q34,');
    Add('   DECODE(R.SITUACAO,''A'',DECODE(R.TIPOREQ,2,1,0),0) AS Q11,');
    Add('   DECODE(R.SITUACAO,''E'',DECODE(R.TIPOREQ,2,1,0),0) AS Q12,');
    Add('   DECODE(R.SITUACAO,''C'',DECODE(R.TIPOREQ,2,1,0),0) AS Q13,');
    Add('   DECODE(R.SITUACAO,''A'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,1,1,0),0),0) AS Q21,');
    Add('   DECODE(R.SITUACAO,''E'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,1,1,0),0),0) AS Q22,');
    Add('   DECODE(R.SITUACAO,''C'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,1,1,0),0),0) AS Q23,');
    Add('   DECODE(R.SITUACAO,''A'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,2,1,0),0),0) AS Q31,');
    Add('   DECODE(R.SITUACAO,''E'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,2,1,0),0),0) AS Q32,');
    Add('   DECODE(R.SITUACAO,''C'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,2,1,0),0),0) AS Q33,');
    Add('   DECODE(R.TIPOREQ,1,''Ampl.''||DECODE(R.TIPOAMPL,1,'''',''Não '')||');
    Add('   ''Prevista'',''Substituição'') AS TIPOREQ,');

    if CmpRptCM.ParamByName('Ence').asBoolean then
      Add('   ROUND(SYSDATE - DECODE(N.DATAADMISSAO,NULL,R.DATAREQ,N.DATAADMISSAO),0) AS TEMPO,')
    else
      Add('   ROUND(SYSDATE - R.DATAREQ,0) AS TEMPO,');

    Add('   DECODE(R.SITUACAO,''A'',''Aberta'',''E'',''Encerrada'',''Cancelada'') AS SITREQ');

    Add('FROM PESSOA PJ, REQUIPES R, CARGO C, CENTCUST CC');

    if CmpRptCM.ParamByName('Ence').asBoolean then
       Add('    , FUNCIONARIO N');

    Add('WHERE   R.IDCARGO  = C.IDCARGO');
    if CmpRptCM.ParamByName('ListaEstab').asString <> '' then
      Add('AND     R.IDESTAB IN (' +CmpRptCM.ParamByName('ListaEstab').asString+ ')');
    if CmpRptCM.ParamByName('ListaCargo').asString <> '' then
      Add('AND     R.IDCARGO IN (' +CmpRptCM.ParamByName('ListaCargo').asString+ ')');
    Add('AND     R.IDESTAB   = PJ.IDPESSOA');
    Add('AND     R.IDEMPRESA = CC.IDEMPRESA');
    Add('AND     R.CODCENTROCUSTO  = CC.CODCENTROCUSTO');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('  AND (SUBSTR(R.CODCENTROCUSTO, ' +IntToStr(c)+
              ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ')');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('  AND (R.CODCENTROCUSTO  IN ' +CtrlUsoGeralRH.UsuXCCusto+ ')')
      else
        Add('  AND (R.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ')');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('  AND (R.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ '))')
      else
        Add('  AND (R.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ')');

    Add('   AND R.DATAREQ BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
    Add('   AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY'')');

    if not(CmpRptCM.ParamByName('Aber').asBoolean) then
      Add('AND    R.SITUACAO <> ''A''');
    if not(CmpRptCM.ParamByName('Ence').asBoolean) then
      Add('AND    R.SITUACAO <> ''E''');
    if not(CmpRptCM.ParamByName('Canc').asBoolean) then
      Add('AND    R.SITUACAO <> ''C''');

    if (CmpRptCM.ParamByName('Ence').asBoolean) then
      Add('AND    R.IDNOVOOCUP = N.IDPESSOA(+)');


    if (CmpRptCM.ParamByName('ListaCand').asInteger = 0) then
    begin
      Add('AND  NOT EXISTS (SELECT RC.NUMREQ FROM REQUICAND RC WHERE R.NUMREQ = RC.NUMREQ)');

      Add('UNION SELECT');
      Add('PJ.NOME AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGOREQ,');
      Add('   CC.NOME AS CENTROCUSTO, R.DATAREQ, ');
      Add('   C2.TITULO AS CARGO, R.NUMREQ, R.DATAPLAN,');
      Add('   DECODE(R.SITUACAO,''A'',1,0) AS Q41,');
      Add('   DECODE(R.SITUACAO,''E'',1,0) AS Q42,');
      Add('   DECODE(R.SITUACAO,''C'',1,0) AS Q43,');
      Add('   DECODE(R.TIPOREQ,2,1,0) AS Q14,');
      Add('   DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,1,1,0),0) AS Q24,');
      Add('   DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,2,1,0),0) AS Q34,');
      Add('   DECODE(R.SITUACAO,''A'',DECODE(R.TIPOREQ,2,1,0),0) AS Q11,');
      Add('   DECODE(R.SITUACAO,''E'',DECODE(R.TIPOREQ,2,1,0),0) AS Q12,');
      Add('   DECODE(R.SITUACAO,''C'',DECODE(R.TIPOREQ,2,1,0),0) AS Q13,');
      Add('   DECODE(R.SITUACAO,''A'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,1,1,0),0),0) AS Q21,');
      Add('   DECODE(R.SITUACAO,''E'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,1,1,0),0),0) AS Q22,');
      Add('   DECODE(R.SITUACAO,''C'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,1,1,0),0),0) AS Q23,');
      Add('   DECODE(R.SITUACAO,''A'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,2,1,0),0),0) AS Q31,');
      Add('   DECODE(R.SITUACAO,''E'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,2,1,0),0),0) AS Q32,');
      Add('   DECODE(R.SITUACAO,''C'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,2,1,0),0),0) AS Q33,');
      Add('   DECODE(R.TIPOREQ,1,''Ampl.''||DECODE(R.TIPOAMPL,1,'''',''Não '')||');
      Add('   ''Prevista'',''Substituição'') AS TIPOREQ,');

      if (CmpRptCM.ParamByName('Ence').asBoolean) then
        Add('   ROUND(SYSDATE - DECODE(N.DATAADMISSAO,NULL,R.DATAREQ,N.DATAADMISSAO),0) AS TEMPO,')
      else
        Add('   ROUND(SYSDATE - R.DATAREQ,0) AS TEMPO,');

      Add('   DECODE(R.SITUACAO,''A'',''Aberta'',''E'',''Encerrada'',''Cancelada'') AS SITREQ');

      Add('FROM PESSOA PJ, PESSOA PF, REQUIPES R, FUNCIONARIO F, CARGO C,');
      Add('     CARGO C2, CENTCUST CC, REQUICAND RC');

      if (CmpRptCM.ParamByName('Ence').asBoolean) then
        Add('    , FUNCIONARIO N');

      Add('WHERE   R.IDCARGO  = C.IDCARGO');

      if (CmpRptCM.ParamByName('ListaEstab').asString <> '') then
        Add('AND     R.IDESTAB IN (' +CmpRptCM.ParamByName('ListaEstab').asString+ ')');

      if (CmpRptCM.ParamByName('ListaCargo').asString <> '') then
        Add('AND     R.IDCARGO IN (' +CmpRptCM.ParamByName('ListaCargo').asString+ ')');

      Add('AND     PF.IDPESSOA = F.IDPESSOA');
      Add('AND     PF.IDPESSOA = RC.IDPESSOA');
      Add('AND     R.NUMREQ    = RC.NUMREQ');
      Add('AND     R.IDESTAB   = PJ.IDPESSOA');
      Add('AND     C2.IDCARGO  = F.IDCARGO');
      Add('AND     R.IDEMPRESA = CC.IDEMPRESA');
      Add('AND     R.CODCENTROCUSTO  = CC.CODCENTROCUSTO');

      if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
        for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
          if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
            Add('  AND (SUBSTR(R.CODCENTROCUSTO, ' +IntToStr(c)+
                ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ')');

      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  AND (R.CODCENTROCUSTO  IN ' +CtrlUsoGeralRH.UsuXCCusto+ ')')
        else
          Add('  AND (R.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ')');

      if (CtrlUsoGeralRH.UsuXFilial <> '') then
        if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
          Add('  AND (R.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ '))')
        else
          Add('  AND (R.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ')');

      Add('   AND R.DATAREQ BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
      Add('   AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY'')');

      if not(CmpRptCM.ParamByName('Aber').asBoolean) then
        Add('AND    R.SITUACAO <> ''A''');
      if not(CmpRptCM.ParamByName('Ence').asBoolean) then
        Add('AND    R.SITUACAO <> ''E''');
      if not(CmpRptCM.ParamByName('Canc').asBoolean) then
        Add('AND    R.SITUACAO <> ''C''');
      if CmpRptCM.ParamByName('Ence').asBoolean then
         Add('AND    R.IDNOVOOCUP = N.IDPESSOA(+)');

      Add('UNION');
      Add('SELECT');
      Add('  PJ.NOME AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGOREQ,');
      Add('  CC.NOME AS CENTROCUSTO, R.DATAREQ, ');
      Add('  C2.TITULO AS CARGO, R.NUMREQ, R.DATAPLAN,');
      Add('  DECODE(R.SITUACAO,''A'',1,0) AS Q41,');
      Add('  DECODE(R.SITUACAO,''E'',1,0) AS Q42,');
      Add('  DECODE(R.SITUACAO,''C'',1,0) AS Q43,');
      Add('  DECODE(R.TIPOREQ,2,1,0) AS Q14,');
      Add('  DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,1,1,0),0) AS Q24,');
      Add('  DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,2,1,0),0) AS Q34,');
      Add('  DECODE(R.SITUACAO,''A'',DECODE(R.TIPOREQ,2,1,0),0) AS Q11,');
      Add('  DECODE(R.SITUACAO,''E'',DECODE(R.TIPOREQ,2,1,0),0) AS Q12,');
      Add('  DECODE(R.SITUACAO,''C'',DECODE(R.TIPOREQ,2,1,0),0) AS Q13,');
      Add('  DECODE(R.SITUACAO,''A'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,1,1,0),0),0) AS Q21,');
      Add('  DECODE(R.SITUACAO,''E'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,1,1,0),0),0) AS Q22,');
      Add('  DECODE(R.SITUACAO,''C'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,1,1,0),0),0) AS Q23,');
      Add('  DECODE(R.SITUACAO,''A'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,2,1,0),0),0) AS Q31,');
      Add('  DECODE(R.SITUACAO,''E'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,2,1,0),0),0) AS Q32,');
      Add('  DECODE(R.SITUACAO,''C'',DECODE(R.TIPOREQ,1,DECODE(R.TIPOAMPL,2,1,0),0),0) AS Q33,');
      Add('  DECODE(R.TIPOREQ,1,''Ampl.''||DECODE(R.TIPOAMPL,1,'''',''Não '')||');
      Add('  ''Prevista'',''Substituição'') AS TIPOREQ,');

      if (CmpRptCM.ParamByName('Ence').asBoolean) then
        Add('  ROUND(SYSDATE - DECODE(N.DATAADMISSAO,NULL,R.DATAREQ,N.DATAADMISSAO),0) AS TEMPO,')
      else
        Add('  ROUND(SYSDATE - R.DATAREQ,0) AS TEMPO,');

      Add('  DECODE(R.SITUACAO,''A'',''Aberta'',''E'',''Encerrada'',''Cancelada'') AS SITREQ');

      Add('FROM');
      Add('  PESSOA PJ, PESSOA PF, REQUIPES R, CANDIDAT F, CARGO C,');
      Add('  CARGO C2, CENTCUST CC, REQUICAND RC');

      if (CmpRptCM.ParamByName('Ence').asBoolean) then
        Add('    , FUNCIONARIO N');

      Add('WHERE   R.IDCARGO  = C.IDCARGO');

      if (CmpRptCM.ParamByName('ListaEstab').asString <> '') then
        Add('AND     R.IDESTAB IN (' +CmpRptCM.ParamByName('ListaEstab').asString+ ')');

      if (CmpRptCM.ParamByName('ListaCargo').asString <> '') then
        Add('AND     R.IDCARGO IN (' +CmpRptCM.ParamByName('ListaCargo').asString+ ')');

      Add('AND     PF.IDPESSOA = F.IDPESSOA');
      Add('AND     PF.IDPESSOA = RC.IDPESSOA');
      Add('AND     R.NUMREQ    = RC.NUMREQ');
      Add('AND     R.IDESTAB   = PJ.IDPESSOA');
      Add('AND     C2.IDCARGO  = F.IDCARGO');
      Add('AND     R.IDEMPRESA = CC.IDEMPRESA');
      Add('AND     R.CODCENTROCUSTO  = CC.CODCENTROCUSTO');

      if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
        for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
          if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
            Add('  AND (SUBSTR(R.CODCENTROCUSTO, ' +IntToStr(c)+
                ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ')');

      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  AND (R.CODCENTROCUSTO  IN ' +CtrlUsoGeralRH.UsuXCCusto+ ')')
        else
          Add('  AND (R.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ')');

      if (CtrlUsoGeralRH.UsuXFilial <> '') then
        if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
          Add('  AND (R.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ '))')
        else
          Add('  AND (R.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ')');

      Add('   AND R.DATAREQ BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataIni').asString)+ ',''DD/MM/YYYY'')');
      Add('   AND TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFim').asString)+ ',''DD/MM/YYYY'')');

      if not CmpRptCM.ParamByName('Aber').asBoolean then
        Add('AND    R.SITUACAO <> ''A''');
      if not CmpRptCM.ParamByName('Ence').asBoolean then
        Add('AND    R.SITUACAO <> ''E''');
      if not CmpRptCM.ParamByName('Canc').asBoolean then
        Add('AND    R.SITUACAO <> ''C''');
      if CmpRptCM.ParamByName('Ence').asBoolean then
         Add('AND    R.IDNOVOOCUP = N.IDPESSOA(+)');
    end;

    case (CmpRptCM.ParamByName('SeqRelat').asInteger) of
      0 : Add('ORDER BY 1, 4, 3, 5, 2');
      1 : Add('ORDER BY 1, 3, 4, 5, 2');
      2 : Add('ORDER BY 1, 5, 4, 3, 2');
     else Add('ORDER BY 1, 5, 3, 4, 2');
    end;

    //SaveToFile('c:\qry.txt');            // Edilaine - SOL 193143-13062 / KTN 1891259 - COMENTADO
    SaveToFile('C:\PLANUS\TEMP\qry.txt');  // Edilaine - SOL 193143-13062 / KTN 1891259

  end;
  GerarDadosRelat;
end;

procedure TRptRequi.GerarDadosRelat;
var
  sNumReq: string;
begin
  dmCds.sql.Open;
  sqlRequi.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    sNumReq := '';
    while not(dmCds.Cds.EOF) do
    begin
      CdsRequi.Append;

      CdsRequi.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
      CdsRequi.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
      CdsRequi.FieldByName('CARGOREQ').asString := dmCds.Cds.FieldByName('CARGOREQ').asString;
      CdsRequi.FieldByName('CENTROCUSTO').asString := dmCds.Cds.FieldByName('CENTROCUSTO').asString;
      CdsRequi.FieldByName('DATAREQ').asString := dmCds.Cds.FieldByName('DATAREQ').asString;
      CdsRequi.FieldByName('CARGO').asString := dmCds.Cds.FieldByName('CARGO').asString;
      CdsRequi.FieldByName('DATAPLAN').asString := dmCds.Cds.FieldByName('DATAPLAN').asString;
      CdsRequi.FieldByName('TIPOREQ').asString := dmCds.Cds.FieldByName('TIPOREQ').asString;
      CdsRequi.FieldByName('SITREQ').asString := dmCds.Cds.FieldByName('SITREQ').asString;
      CdsRequi.FieldByName('NUMREQ').asInteger := dmCds.Cds.FieldByName('NUMREQ').asInteger;

      if (dmCds.Cds.FieldByName('NUMREQ').asString <> sNumReq) then
      begin
        sNumReq := dmCds.Cds.FieldByName('NUMREQ').asString;
        CdsRequi.FieldByName('NUMREQ_ATUAL').asInteger := 1;
        CdsRequi.FieldByName('Q41').asInteger := dmCds.Cds.FieldByName('Q41').asInteger;
        CdsRequi.FieldByName('Q42').asInteger := dmCds.Cds.FieldByName('Q42').asInteger;
        CdsRequi.FieldByName('Q43').asInteger := dmCds.Cds.FieldByName('Q43').asInteger;
        CdsRequi.FieldByName('Q14').asInteger := dmCds.Cds.FieldByName('Q14').asInteger;
        CdsRequi.FieldByName('Q24').asInteger := dmCds.Cds.FieldByName('Q24').asInteger;
        CdsRequi.FieldByName('Q34').asInteger := dmCds.Cds.FieldByName('Q34').asInteger;
        CdsRequi.FieldByName('Q11').asInteger := dmCds.Cds.FieldByName('Q11').asInteger;
        CdsRequi.FieldByName('Q12').asInteger := dmCds.Cds.FieldByName('Q12').asInteger;
        CdsRequi.FieldByName('Q13').asInteger := dmCds.Cds.FieldByName('Q13').asInteger;
        CdsRequi.FieldByName('Q21').asInteger := dmCds.Cds.FieldByName('Q21').asInteger;
        CdsRequi.FieldByName('Q22').asInteger := dmCds.Cds.FieldByName('Q22').asInteger;
        CdsRequi.FieldByName('Q23').asInteger := dmCds.Cds.FieldByName('Q23').asInteger;
        CdsRequi.FieldByName('Q31').asInteger := dmCds.Cds.FieldByName('Q31').asInteger;
        CdsRequi.FieldByName('Q32').asInteger := dmCds.Cds.FieldByName('Q32').asInteger;
        CdsRequi.FieldByName('Q33').asInteger := dmCds.Cds.FieldByName('Q33').asInteger;
        CdsRequi.FieldByName('TEMPO').asInteger := dmCds.Cds.FieldByName('TEMPO').asInteger;
      end;

      CdsRequi.Post;
      dmCds.Cds.Next;
    end;
  end;
end;

end.
