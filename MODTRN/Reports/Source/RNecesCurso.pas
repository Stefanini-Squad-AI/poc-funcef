// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  13/05/2009
// Pendência   : SOL 116806 KINTANA 549481
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RNecesCurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, ppBands, ppCache, ppClass, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  ppCtrls, ppPrnabl, ppVar, TXRB, USistema;

type
  TRptNecesCurso = class(TFrmCmReport)
    sqlNecesCurso: TCMSqlParams;
    CdsNecesCurso: TCMClientDataSet;
    dsNecesCurso: TwwDataSource;
    ppNecesCurso: TppBDEPipeline;
    rpNecesCurso: TppReport;
    rpNecesCursoDtlBnd: TppDetailBand;
    rpNecesCursoSmryBnd: TppSummaryBand;
    rpNecesCursoHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine1: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabelTipo: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  end;

var
  RptNecesCurso: TRptNecesCurso;

implementation

{$R *.DFM}

procedure TRptNecesCurso.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlNecesCurso.SQL) do
  begin
    if CmpRptCM.ParamByName('Imprescindivel').asInteger < 9 then
    begin
      Clear;
      // Cursos Fora de Pacotes
      Add('SELECT');
      Add('PJ. RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO,');
      Add('   CU.DESCRICAO, CU.IDCURSO, CU.DUR_PRAT, CU.DUR_TEOR, CU.VALOR, F.MATRICULA');

      Add('FROM PESSOA PJ, PESSOA PF, FUNCIONARIO F, CARGO C, CURSO CU, CURSOREQ CR');

      Add('WHERE   F.IDPESSOA = PF.IDPESSOA');
      if CmpRptCM.ParamByName('ListaCurso').asString <> '' then
        Add('AND     CU.IDCURSO IN (' +CmpRptCM.ParamByName('ListaCurso').asString+ ')');
      Add('AND     F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')');
      Add('AND     F.IDESTAB  = PJ.IDPESSOA');

      if CmpRptCM.ParamByName('Imprescindivel').asInteger < 2 then
        Add('AND     NVL(CR.FLGIMPRESCIND,1)  = ' +
            IntToStr(1 - CmpRptCM.ParamByName('Imprescindivel').asInteger));

      if CmpRptCM.ParamByName('TipoCargo').asInteger = 0 then
        Add('AND     F.IDCARGO  = C.IDCARGO')
      else
        Add('AND     F.IDFUNCAO  = C.IDCARGO');

      Add('AND     C.IDCARGO  = CR.IDCARGO');
      Add('AND     CU.IDCURSO = CR.IDCURSO');
      Add('AND     (NOT EXISTS (SELECT H.IDCURSO');
      Add('                     FROM HSTTRN H');
      Add('                     WHERE (H.DATREFIM IS NOT NULL)  AND');
      Add('                           (CU.IDCURSO  = H.IDCURSO) AND');
      Add('                           (NVL(H.FLGAVALTEOR,0) = 0 OR NVL(H.AVALTEOR,0) >= NVL(CU.AVALIACAO,0)) AND');
      Add('                           (NVL(H.FLGAVALPRAT,0) = 0 OR NVL(H.AVALPRAT,0) >= NVL(CU.AVALPRAT,0))  AND');
      Add('                           (H.IDPESSOA = F.IDPESSOA)))');

      Add('AND     (NOT EXISTS (SELECT CU2.IDCURSO');
      Add('                     FROM CURSO CU2');
      Add('                     WHERE (CU2.IDPACOTE IS NOT NULL)  AND');
      Add('                           (CU.IDCURSO  = CU2.IDCURSO)))');

      if CmpRptCM.ParamByName('IncProgramados').asInteger = 1 then
      begin
        Add('AND     (NOT EXISTS (SELECT H.IDCURSO');
        Add('                     FROM HSTTRN H');
        Add('                     WHERE (H.DATREFIM IS NULL)  AND');
        Add('                           (CU.IDCURSO  = H.IDCURSO) AND');
        Add('                           (H.IDPESSOA = F.IDPESSOA)))');
      end;

      // Pacotes do Tipo 0 (cursos complementares = todos são necessários)
      Add('UNION SELECT');
      Add('PJ. RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO,');
      Add('   CU.DESCRICAO, CU.IDCURSO, CU.DUR_PRAT, CU.DUR_TEOR, CU.VALOR, F.MATRICULA');

      Add('FROM PESSOA PJ, PESSOA PF, FUNCIONARIO F, CARGO C, CURSO CU,');
      Add('  (SELECT DISTINCT');
      Add('     CR.IDCARGO, C2.IDCURSO, CR.FLGIMPRESCIND');
      Add('   FROM');
      Add('     CURSOREQ CR, CURSO C1, CURSO C2, PACOTE PC');
      Add('   WHERE');
      Add('    (CR.IDCURSO     = C1.IDCURSO) AND');
      Add('    (C2.IDPACOTE    = PC.IDPACOTE) AND');
      Add('    (NVL(PC.TIPO,0) = 0) AND');
      Add('    (C1.IDPACOTE = C2.IDPACOTE)) CR');

      Add('WHERE   F.IDPESSOA = PF.IDPESSOA');
      if CmpRptCM.ParamByName('ListaCurso').asString <> '' then
        Add('AND     CU.IDCURSO IN (' +CmpRptCM.ParamByName('ListaCurso').asString+ ')');
      Add('AND     F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')');
      Add('AND     F.IDESTAB  = PJ.IDPESSOA');

      if CmpRptCM.ParamByName('Imprescindivel').asInteger < 2 then
        Add('AND     NVL(CR.FLGIMPRESCIND,1)  = ' +
            IntToStr(1 - CmpRptCM.ParamByName('Imprescindivel').asInteger));

      if CmpRptCM.ParamByName('TipoCargo').asInteger = 0 then
        Add('AND     F.IDCARGO  = C.IDCARGO')
      else
        Add('AND     F.IDFUNCAO  = C.IDCARGO');

      Add('AND     C.IDCARGO  = CR.IDCARGO');
      Add('AND     CU.IDCURSO = CR.IDCURSO');
      Add('AND     (NOT EXISTS (SELECT H.IDCURSO');
      Add('                     FROM HSTTRN H');
      Add('                     WHERE (H.DATREFIM IS NOT NULL)  AND');
      Add('                           (CU.IDCURSO  = H.IDCURSO) AND');
      Add('                           (NVL(H.FLGAVALTEOR,0) = 0 OR NVL(H.AVALTEOR,0) >= NVL(CU.AVALIACAO,0)) AND');
      Add('                           (NVL(H.FLGAVALPRAT,0) = 0 OR NVL(H.AVALPRAT,0) >= NVL(CU.AVALPRAT,0))  AND');
      Add('                           (H.IDPESSOA = F.IDPESSOA)))');

      if CmpRptCM.ParamByName('IncProgramados').asInteger = 1 then
      begin
        Add('AND     (NOT EXISTS (SELECT H.IDCURSO');
        Add('                     FROM HSTTRN H');
        Add('                     WHERE (H.DATREFIM IS NULL)  AND');
        Add('                           (CU.IDCURSO  = H.IDCURSO) AND');
        Add('                           (H.IDPESSOA = F.IDPESSOA)))');
      end;

      // Pacotes do Tipo 1 (cursos mutuamente exclusivos = basta um deles)
      Add('UNION SELECT');
      Add('PJ. RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO,');
      Add('   CU.DESCRICAO, CU.IDCURSO, CU.DUR_PRAT, CU.DUR_TEOR, CU.VALOR, F.MATRICULA');

      Add('FROM PESSOA PJ, PESSOA PF, FUNCIONARIO F, CARGO C, CURSO CU, CURSOREQ CR');

      Add('WHERE   F.IDPESSOA = PF.IDPESSOA');
      if CmpRptCM.ParamByName('ListaCurso').asString <> '' then
        Add('AND     CU.IDCURSO IN (' +CmpRptCM.ParamByName('ListaCurso').asString+ ')');
      Add('AND     F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')');
      Add('AND     F.IDESTAB  = PJ.IDPESSOA');

      if CmpRptCM.ParamByName('Imprescindivel').asInteger < 2 then
        Add('AND     NVL(CR.FLGIMPRESCIND,1)  = ' +
            IntToStr(1 - CmpRptCM.ParamByName('Imprescindivel').asInteger));

      if CmpRptCM.ParamByName('TipoCargo').asInteger = 0 then
        Add('AND     F.IDCARGO  = C.IDCARGO')
      else
        Add('AND     F.IDFUNCAO  = C.IDCARGO');

      Add('AND     C.IDCARGO  = CR.IDCARGO');
      Add('AND     CU.IDCURSO = CR.IDCURSO');

      Add('AND     (NOT EXISTS (SELECT H.IDCURSO');
      Add('                     FROM HSTTRN H');
      Add('                     WHERE (H.DATREFIM IS NOT NULL)  AND');
      Add('                           (H.IDCURSO IN');
      Add('                             (SELECT DISTINCT C2.IDCURSO');
      Add('                              FROM');
      Add('                              CURSOREQ CR2, CURSO C1, CURSO C2');
      Add('                              WHERE');
      Add('                               (CR2.IDCARGO = C.IDCARGO) AND');
      Add('                               (CR2.IDCURSO = C1.IDCURSO) AND');
      Add('                               (C1.IDPACOTE = C2.IDPACOTE))) AND');
      Add('                           (NVL(H.FLGAVALTEOR,0) = 0 OR NVL(H.AVALTEOR,0) >= NVL(CU.AVALIACAO,0)) AND');
      Add('                           (NVL(H.FLGAVALPRAT,0) = 0 OR NVL(H.AVALPRAT,0) >= NVL(CU.AVALPRAT,0))  AND');
      Add('                           (H.IDPESSOA = F.IDPESSOA)))');
      Add('AND     (EXISTS (SELECT CU2.IDCURSO');
      Add('                     FROM CURSO CU2, PACOTE PC');
      Add('                     WHERE (CU2.IDPACOTE   = PC.IDPACOTE) AND');
      Add('                           (NVL(PC.TIPO,0) = 1) AND');
      Add('                           (CU.IDCURSO     = CU2.IDCURSO)))');

      if CmpRptCM.ParamByName('IncProgramados').asInteger = 1 then
      begin
        Add('AND     (NOT EXISTS (SELECT H.IDCURSO');
        Add('                     FROM HSTTRN H');
        Add('                     WHERE (H.DATREFIM IS NULL)  AND');
        Add('                           (CU.IDCURSO  = H.IDCURSO) AND');
        Add('                           (H.IDPESSOA = F.IDPESSOA)))');
      end;

    end
    else // Necessidades pela Aval. Desempenho
    begin
      ppLabelTipo.Caption := '(Baseadas nas Avaliações de Desempenho)';
      Clear;
      Add('SELECT DISTINCT');
      Add('PJ. RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO,');
      Add('   CU.DESCRICAO, CU.IDCURSO, CU.DUR_PRAT, CU.DUR_TEOR, CU.VALOR, F.MATRICULA');

      Add('FROM PESSOA PJ, PESSOA PF, FUNCIONARIO F, CARGO C, CURSO CU, CURSOXAVALDES CR,');
      Add('PESOFATGRP PS,');
      Add('(SELECT IDPESSOA, IDFATORAVAL, MAX(GRAU) AS GRAU');
      Add(' FROM HSTDESEMP GROUP BY IDPESSOA, IDFATORAVAL) HD');

      Add('WHERE   F.IDPESSOA = PF.IDPESSOA');
      if CmpRptCM.ParamByName('ListaCurso').asString <> '' then
        Add('AND     CU.IDCURSO IN (' +CmpRptCM.ParamByName('ListaCurso').asString+ ')');
      Add('AND     F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')');
      Add('AND     F.IDESTAB  = PJ.IDPESSOA');

      if CmpRptCM.ParamByName('Imprescindivel').asInteger < 2 then
        Add('AND     NVL(CR.FLGIMPRESCIND,1)  = ' +
            IntToStr(1 - CmpRptCM.ParamByName('Imprescindivel').asInteger));

      if CmpRptCM.ParamByName('TipoCargo').asInteger = 0 then
        Add('AND     F.IDCARGO  = C.IDCARGO')
      else
        Add('AND     F.IDFUNCAO  = C.IDCARGO');

      Add('AND     C.CODGRPFUNC   = PS.CODGRPFUNC');
      Add('AND     CR.IDFATORAVAL = PS.IDFATORAVAL');
      Add('AND     CU.IDCURSO = CR.IDCURSO');
      Add('AND     ((F.IDPESSOA = HD.IDPESSOA');
      Add('          AND PS.IDFATORAVAL = HD.IDFATORAVAL');
      Add('          AND NVL(HD.GRAU,0) < ' + CmpRptCM.ParamByName('Nota').asString + ') OR ');
      Add('         (NOT EXISTS (SELECT H.IDPESSOA');
      Add('                      FROM HSTDESEMP H');
      Add('                      WHERE (F.IDPESSOA = H.IDPESSOA)  AND');
      Add('                            (CR.IDFATORAVAL  = H.IDFATORAVAL))))');

      Add('AND     (NOT EXISTS (SELECT H.IDCURSO');
      Add('                     FROM HSTTRN H');
      Add('                     WHERE (H.DATREFIM IS NOT NULL)  AND');
      Add('                           (CU.IDCURSO  = H.IDCURSO) AND');
      Add('                           (NVL(H.FLGAVALTEOR,0) = 0 OR NVL(H.AVALTEOR,0) >= NVL(CU.AVALIACAO,0)) AND');
      Add('                           (NVL(H.FLGAVALPRAT,0) = 0 OR NVL(H.AVALPRAT,0) >= NVL(CU.AVALPRAT,0))  AND');
      Add('                           (H.IDPESSOA = F.IDPESSOA)))');

      if CmpRptCM.ParamByName('IncProgramados').asInteger = 1 then
      begin
        Add('AND     (NOT EXISTS (SELECT H.IDCURSO');
        Add('                     FROM HSTTRN H');
        Add('                     WHERE (H.DATREFIM IS NULL)  AND');
        Add('                           (CU.IDCURSO  = H.IDCURSO) AND');
        Add('                           (H.IDPESSOA = F.IDPESSOA)))');
      end;
    end;

    if CmpRptCM.ParamByName('SeqRelat').asInteger = 0 then
      Add('ORDER BY DESCRICAO, EMPREGADO')
    else
      Add('ORDER BY DESCRICAO, F.MATRICULA');

//    SaveToFile ('c:\qry.txt');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlNecesCurso.Open;
end;

end.
