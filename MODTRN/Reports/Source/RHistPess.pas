{ *****************************************************************************
 ***************************** REGISTRO DE ALTERAÇÕES ************************
 *****************************************************************************
------------------------------------------------------------------------------
SIG         : 123893
Autor(a)    : Ewerton Beltramini
Data        : 23/03/2022
Descricao   : Alteração de Campo do total de horas.
------------------------------------------------------------------------------
Autor(a)    :  Ádler Teodoro de Souza
Data        :  13/05/2009
Pendência   :  SOL 116806 KINTANA 549481
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
-----------------------------------------------------------------------------}
unit RHistPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, ppBands, ppCache, ppClass, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  ppCtrls, ppPrnabl, ppVar, ppStrtch, ppSubRpt, ppRegion, ppMemo, TXRB;

type
  TRptHistPess = class(TFrmCmReport)
    sqlHistPess: TCMSqlParams;
    CdsHistPess: TCMClientDataSet;
    dsHistPess: TwwDataSource;
    ppHistPess: TppBDEPipeline;
    rpHistPess: TppReport;
    rpAtivHistDtlBnd: TppDetailBand;
    rpAtivPessSmryBnd: TppSummaryBand;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabelEmpregado: TppLabel;
    ppLine1: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel9: TppLabel;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel2: TppLabel;
    ppDBText9: TppDBText;
    ppLabel7: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText13: TppDBText;
    rpAtivLblResultado: TppLabel;
    ppShape1: TppShape;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    ppLabelPres: TppLabel;
    ppDBTextPres: TppDBText;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppLblFaltas: TppLabel;
    ppDbTxtFaltas: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel5: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpAtivHistDtlBndBeforePrint(Sender: TObject);
  private

  public
    sIdPessoa, sTipoPessoa, DataIni, DataFim: String;
    IncPorConta, TipoCusto, SeqRelat, Consolida, CalcFalta: Integer;
    SelCurso1, SelCurso2, SelCurso3, SelCurso4: Boolean;
  end;

var
  RptHistPess: TRptHistPess;
  
implementation

uses uCtrlFuncoesRH, uSistema;

{$R *.DFM}

procedure TRptHistPess.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  ppLblFaltas.Visible := (CalcFalta = 0);
  ppDbTxtFaltas.Visible := (CalcFalta = 0);
  ppFooterBand1.Visible := (CalcFalta = 0);

  if (CalcFalta = 1) then
  begin
    ppDBTextPres.Left := 1012;
    pplabelPres.Left  := 992;
  end;

  with (sqlHistPess.SQL) do
  begin
    Clear;
    if sTipoPessoa = 'F' then
    begin
      ppLabelEmpregado.Caption := 'Empregado';
      if Consolida = 1 then // Normal: NÃO consolida
      begin
        Add('SELECT');
        Add('PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO, F.MATRICULA,');
        //Add('   CU.DESCRICAO, CU.IDCURSO, H.DUR_PRAT + H.DUR_TEOR AS DUR_TOT, NVL(H.VALOR,0) ');   //Ewerton Beltramini - 23/03/2022 - SIG 123893
        Add('   CU.DESCRICAO, CU.IDCURSO, H.DUR_TOT, NVL(H.VALOR,0) ');                              //Ewerton Beltramini - 23/03/2022 - SIG 123893
        
        if TipoCusto = 0 then
          Add('  + NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0) ');
        Add('   AS CUSTO,');
        Add('   CC.NOME AS CENTROCUSTO, H.DATREINI, H.DATREFIM, H.AVALPRAT, H.AVALTEOR,');
        Add('   EN.NOME AS ENTIDADE, H.DATPLINI,');
        Add('''Período: '' || ' +QuotedStr(DataIni)+' || '' a ''');
        Add('   || ' +QuotedStr(DataFim)+ ' AS PERIODO,');
        Add('   H.DATPLFIM, H.FLGAVALTEOR, H.AVALTEOR, CU.AVALIACAO AS MINTEOR,');
        Add('               H.FLGAVALPRAT, H.AVALPRAT, CU.AVALPRAT AS MINPRAT,');
        Add('   DECODE(NVL(H.FLGAVALCURS,0), 0, ''NA'', TO_CHAR(H.AVALCURSO)) AS AVALCURSOREL,');
        Add('   DECODE(H.DATREINI, NULL, H.DATPLINI, H.DATREINI) AS DATREF, CU.IDTIPOCURSO, F.CODCENTROCUSTO,');
        Add('   DECODE(H.DATREFIM, NULL, H.DATPLFIM, H.DATREFIM) AS DATFIM,');
        if CalcFalta = 0 then
          Add('   DECODE(H.DATREFIM, NULL, 0, H.DATREFIM - H.DATREINI + 1 - NVL(LP2.PRESENCAS,0)) AS FALTAS,')
        else
          Add('   0 AS FALTAS,');
        Add('   LP.PRESENCAS, INS.INSCRITOS ');
        Add('FROM PESSOA PJ, PESSOA PF, PESSOA EN, HSTTRN H, FUNCIONARIO F, CARGO C, CURSO CU, CENTCUST CC,');

        Add('  (SELECT IDPESSOA, IDCURSO, NUMSEQ, COUNT(*) AS PRESENCAS FROM LISTAPRESENCA L ');
        Add('   WHERE NVL(L.FLGSEMAULA,0) = 0 AND');
        Add('   L.DATAPRESENCA BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
        Add('   AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY'') ');
        Add('   GROUP BY IDPESSOA, IDCURSO, NUMSEQ) LP,');

        if CalcFalta = 0 then
        begin
          Add('  (SELECT IDPESSOA, IDCURSO, NUMSEQ, COUNT(*) AS PRESENCAS FROM LISTAPRESENCA L ');
          Add('   WHERE ');
          Add('   L.DATAPRESENCA BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('   AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY'') ');
          Add('   GROUP BY IDPESSOA, IDCURSO, NUMSEQ) LP2,');
        end;

        Add('  (SELECT IDCURSO, DATREINI, DATPLINI, DATREFIM, DATPLFIM, IDENTIDINSTR,');
        Add('   COUNT(*) AS INSCRITOS FROM HSTTRN H ');
        Add('   GROUP BY IDCURSO, DATREINI, DATPLINI, DATREFIM, DATPLFIM, IDENTIDINSTR) INS');

        Add('WHERE   F.IDPESSOA = PF.IDPESSOA');

        if IncPorConta = 1 then
          Add('AND     H.FLGCONTROLE = 1');

        Add('AND     F.IDPESSOA = ' +sIdPessoa);
        Add('AND     F.IDESTAB  = PJ.IDPESSOA');

        Add('AND     (');

        if (SelCurso1) then
        begin
          Add('   (H.DATPLINI IS NOT NULL AND');
          Add('    H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('    AND TO_DATE(' +QuotedStr(DataFim )+ ',''DD/MM/YYYY''))');
        end;

        if (SelCurso2) then
        begin
          if (SelCurso1) then
            Add(' OR');

          Add('   (H.DATPLINI IS NULL AND');
          Add('    H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('    AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY''))');
        end;

        if (SelCurso3) then
        begin
          if (SelCurso1) or
             (SelCurso2) then
            Add(' OR');

          Add('   (H.DATREFIM IS NULL AND');
          Add('    H.DATPLFIM BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('    AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY''))');
        end;

        if (SelCurso4) then
        begin
          if (SelCurso1) or
             (SelCurso2) or
             (SelCurso3) then
            Add(' OR');

          Add('   (H.DATREINI IS NULL AND H.DATPLINI IS NULL)');
        end;

        Add(' )');
        Add('AND     F.IDCARGO    = C.IDCARGO');
        Add('AND     H.IDCURSO    = CU.IDCURSO');
        Add('AND     H.IDPESSOA   = F.IDPESSOA');
        Add('AND     F.IDEMPRESA  = CC.IDEMPRESA');
        Add('AND     F.CODCENTROCUSTO  = CC.CODCENTROCUSTO');
        Add('AND     H.IDCURSO    = INS.IDCURSO');
        Add('AND     NVL(H.DATREINI,SYSDATE-40000) = NVL(INS.DATREINI,SYSDATE-40000)');
        Add('AND     NVL(H.DATPLINI,SYSDATE-40000) = NVL(INS.DATPLINI,SYSDATE-40000)');
        Add('AND     NVL(H.DATREFIM,SYSDATE-40000) = NVL(INS.DATREFIM,SYSDATE-40000)');
        Add('AND     NVL(H.DATPLFIM,SYSDATE-40000) = NVL(INS.DATPLFIM,SYSDATE-40000)');
        Add('AND     NVL(H.IDENTIDINSTR,0) = NVL(INS.IDENTIDINSTR,0)');
        Add('AND     H.IDENTIDINSTR    = EN.IDPESSOA(+)');
        Add('AND     H.IDPESSOA        = LP.IDPESSOA(+)');
        Add('AND     H.IDCURSO         = LP.IDCURSO(+)');
        Add('AND     H.NUMSEQ          = LP.NUMSEQ(+)');
        if CalcFalta = 0 then
        begin
          Add('AND     H.IDPESSOA        = LP2.IDPESSOA(+)');
          Add('AND     H.IDCURSO         = LP2.IDCURSO(+)');
          Add('AND     H.NUMSEQ          = LP2.NUMSEQ(+)');
        end;
      end
      else
      begin     // Consolida os registros do mesmo curso
        Add('SELECT');
        Add('PJ.RAZAOSOCIAL AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO, F.MATRICULA,');
        Add('   CU.DESCRICAO, CU.IDCURSO, H.DUR_TOT, H.CUSTO,');
        Add('   CC.NOME AS CENTROCUSTO, H.DATREINI, H.DATREFIM, 0 AS AVALPRAT, 0 AS AVALTEOR,');
        Add('   EN.NOME AS ENTIDADE,');
        Add('''Período: '' || ' +QuotedStr(DataIni)+' || '' a ''');
        Add('   || ' +QuotedStr(DataFim)+ ' AS PERIODO,');
        Add('   H.DATREFIM AS DATPLFIM, 0 AS FLGAVALTEOR, 0 AS AVALTEOR, CU.AVALIACAO AS MINTEOR,');
        Add('               0 AS FLGAVALPRAT, 0 AS AVALPRAT, CU.AVALPRAT AS MINPRAT,');
        Add('   H.AVALCURSOREL,');
        Add('   H.DATREINI AS DATREF, H.DATREFIM AS DATFIM, CU.IDTIPOCURSO, F.CODCENTROCUSTO,');
        if CalcFalta = 0 then
          Add('   LP.PRESENCAS, (H.EXTENSAO - NVL(LP2.PRESENCAS,0)) AS FALTAS ')
        else
          Add('   LP.PRESENCAS, 0 AS FALTAS ');
        Add('FROM PESSOA PJ, PESSOA PF, PESSOA EN, FUNCIONARIO F, CARGO C, CURSO CU, CENTCUST CC,');

        Add('  (SELECT IDPESSOA, IDCURSO, COUNT(*) AS PRESENCAS FROM LISTAPRESENCA L ');
        Add('   WHERE NVL(L.FLGSEMAULA,0) = 0 AND');
        Add('   L.DATAPRESENCA BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
        Add('   AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY'') ');
        Add('   GROUP BY IDPESSOA, IDCURSO) LP, ');

        if CalcFalta = 0 then
        begin
          Add('  (SELECT IDPESSOA, IDCURSO, NUMSEQ, COUNT(*) AS PRESENCAS FROM LISTAPRESENCA L ');
          Add('   WHERE ');
          Add('   L.DATAPRESENCA BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('   AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY'') ');
          Add('   GROUP BY IDPESSOA, IDCURSO) LP2,');
        end;

        Add('     (SELECT IDPESSOA, IDCURSO, IDENTIDINSTR,');
        //Add('      SUM(H.DUR_PRAT + H.DUR_TEOR) AS DUR_TOT,');  //Ewerton Beltramini - 23/03/2022 - SIG 123893
        Add('      SUM(H.DUR_TOT) AS DUR_TOT,');                  //Ewerton Beltramini - 23/03/2022 - SIG 123893

        if CalcFalta = 0 then
          Add('    SUM(H.DATREFIM - H.DATREINI + 1) AS EXTENSAO,')
        else
          Add('    0 AS EXTENSAO,');

        Add('      SUM(NVL(H.VALOR,0)');
        Add('      + NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0)');
        Add('      ) AS CUSTO, MIN(DATREINI) AS DATREINI, MAX(DATREFIM) AS DATREFIM,');
        Add('      DECODE(SUM(NVL(H.FLGAVALCURS,0)), 0, ''NA'', TO_CHAR(AVG(NVL(H.AVALCURSO,0)))) AS AVALCURSOREL');
        Add('      FROM HSTTRN H');
        Add('      WHERE (');
        if (SelCurso1) then
        begin
          Add('   (H.DATPLINI IS NOT NULL AND');
          Add('    H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('    AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY''))');
        end;

        if (SelCurso2) then
        begin
          if (SelCurso1) then
            Add(' OR');

          Add('   (H.DATPLINI IS NULL AND');
          Add('    H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('    AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY''))');
        end;

        if (SelCurso3) then
        begin
          if (SelCurso1) or
             (SelCurso2) then
            Add(' OR');

          Add('   (H.DATREFIM IS NULL AND');
          Add('    H.DATPLFIM BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('    AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY''))');
        end;

        if (SelCurso4) then
        begin
          if (SelCurso1) or
             (SelCurso2) or
             (SelCurso3) then
            Add(' OR');

          Add('   (H.DATREINI IS NULL AND H.DATPLINI IS NULL)');
        end;
        Add(' )');

        if IncPorConta = 1 then
          Add('AND     H.FLGCONTROLE = 1');

        Add('      GROUP BY IDPESSOA, IDCURSO, IDENTIDINSTR  ) H');
        Add('WHERE   F.IDPESSOA = PF.IDPESSOA');

        Add('AND     F.IDPESSOA =' +sIdPessoa);

        Add('AND     F.IDESTAB  = PJ.IDPESSOA');
        Add('AND     F.IDCARGO    = C.IDCARGO');
        Add('AND     H.IDCURSO    = CU.IDCURSO');
        Add('AND     H.IDPESSOA   = F.IDPESSOA');
        Add('AND     F.IDEMPRESA  = CC.IDEMPRESA');
        Add('AND     F.CODCENTROCUSTO  = CC.CODCENTROCUSTO');
        Add('AND     H.IDENTIDINSTR    = EN.IDPESSOA(+)');
        Add('AND     H.IDPESSOA        = LP.IDPESSOA(+)');
        Add('AND     H.IDCURSO         = LP.IDCURSO(+)');
        if CalcFalta = 0 then
        begin
          Add('AND     H.IDPESSOA        = LP2.IDPESSOA(+)');
          Add('AND     H.IDCURSO         = LP2.IDCURSO(+)');
        end;
      end;
    end // final empregado
    else
    begin // início candidato
      ppLabelEmpregado.Caption := 'Candidato';
      if Consolida = 1 then // Normal: NÃO consolida
      begin
        Add('SELECT');
        Add(QuotedStr(Sistema.NomeEmpresa) +' AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO, F.IDPESSOA AS MATRICULA,');
        //Add('   CU.DESCRICAO, CU.IDCURSO, H.DUR_PRAT + H.DUR_TEOR AS DUR_TOT, NVL(H.VALOR,0) ');    //Ewerton Beltramini - 23/03/2022 - SIG 123893
        Add('   CU.DESCRICAO, CU.IDCURSO, H.DUR_TOT, NVL(H.VALOR,0) ');                               //Ewerton Beltramini - 23/03/2022 - SIG 123893

        if TipoCusto = 0 then
          Add('  + NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0) ');
        Add('   AS CUSTO,');
        Add('   '' '' AS CENTROCUSTO, H.DATREINI, H.DATREFIM, H.AVALPRAT, H.AVALTEOR,');
        Add('   EN.NOME AS ENTIDADE, H.DATPLINI,');
        Add('''Período: '' || ' +QuotedStr(DataIni)+' || '' a ''');
        Add('   || ' +QuotedStr(DataFim)+ ' AS PERIODO,');
        Add('   H.DATPLFIM, H.FLGAVALTEOR, H.AVALTEOR, CU.AVALIACAO AS MINTEOR,');
        Add('               H.FLGAVALPRAT, H.AVALPRAT, CU.AVALPRAT AS MINPRAT,');
        Add('   DECODE(NVL(H.FLGAVALCURS,0), 0, ''NA'', TO_CHAR(H.AVALCURSO)) AS AVALCURSOREL,');
        Add('   DECODE(H.DATREINI, NULL, H.DATPLINI, H.DATREINI) AS DATREF, CU.IDTIPOCURSO, '' '' AS CODCENTROCUSTO,');
        Add('   DECODE(H.DATREFIM, NULL, H.DATPLFIM, H.DATREFIM) AS DATFIM,');
        if CalcFalta = 0 then
          Add('   DECODE(H.DATREFIM, NULL, 0, H.DATREFIM - H.DATREINI + 1 - NVL(LP2.PRESENCAS,0)) AS FALTAS,')
        else
          Add('   0 AS FALTAS,');
        Add('   LP.PRESENCAS, INS.INSCRITOS ');
        Add('FROM PESSOA PF, PESSOA EN, HSTTRN H, CANDIDAT F, CARGO C, CURSO CU,');

        Add('  (SELECT IDPESSOA, IDCURSO, NUMSEQ, COUNT(*) AS PRESENCAS FROM LISTAPRESENCA L ');
        Add('   WHERE NVL(L.FLGSEMAULA,0) = 0 AND');
        Add('   L.DATAPRESENCA BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
        Add('   AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY'') ');
        Add('   GROUP BY IDPESSOA, IDCURSO, NUMSEQ) LP,');

        if CalcFalta = 0 then
        begin
          Add('  (SELECT IDPESSOA, IDCURSO, NUMSEQ, COUNT(*) AS PRESENCAS FROM LISTAPRESENCA L ');
          Add('   WHERE ');
          Add('   L.DATAPRESENCA BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('   AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY'') ');
          Add('   GROUP BY IDPESSOA, IDCURSO, NUMSEQ) LP2,');
        end;

        Add('  (SELECT IDCURSO, DATREINI, DATPLINI, DATREFIM, DATPLFIM, IDENTIDINSTR,');
        Add('   COUNT(*) AS INSCRITOS FROM HSTTRN H ');
        Add('   GROUP BY IDCURSO, DATREINI, DATPLINI, DATREFIM, DATPLFIM, IDENTIDINSTR) INS');

        Add('WHERE   F.IDPESSOA = PF.IDPESSOA');

        if IncPorConta = 1 then
          Add('AND     H.FLGCONTROLE = 1');

        Add('AND     F.IDPESSOA = ' +sIdPessoa);

        Add('AND     (');

        if (SelCurso1) then
        begin
          Add('   (H.DATPLINI IS NOT NULL AND');
          Add('    H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('    AND TO_DATE(' +QuotedStr(DataFim )+ ',''DD/MM/YYYY''))');
        end;

        if (SelCurso2) then
        begin
          if (SelCurso1) then
            Add(' OR');

          Add('   (H.DATPLINI IS NULL AND');
          Add('    H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('    AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY''))');
        end;

        if (SelCurso3) then
        begin
          if (SelCurso1) or
             (SelCurso2) then
            Add(' OR');

          Add('   (H.DATREFIM IS NULL AND');
          Add('    H.DATPLFIM BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('    AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY''))');
        end;

        if (SelCurso4) then
        begin
          if (SelCurso1) or
             (SelCurso2) or
             (SelCurso3) then
            Add(' OR');

          Add('   (H.DATREINI IS NULL AND H.DATPLINI IS NULL)');
        end;

        Add(' )');
        Add('AND     F.IDCARGO    = C.IDCARGO');
        Add('AND     H.IDCURSO    = CU.IDCURSO');
        Add('AND     H.IDPESSOA   = F.IDPESSOA');
        Add('AND     H.IDCURSO    = INS.IDCURSO');
        Add('AND     NVL(H.DATREINI,SYSDATE-40000) = NVL(INS.DATREINI,SYSDATE-40000)');
        Add('AND     NVL(H.DATPLINI,SYSDATE-40000) = NVL(INS.DATPLINI,SYSDATE-40000)');
        Add('AND     NVL(H.DATREFIM,SYSDATE-40000) = NVL(INS.DATREFIM,SYSDATE-40000)');
        Add('AND     NVL(H.DATPLFIM,SYSDATE-40000) = NVL(INS.DATPLFIM,SYSDATE-40000)');
        Add('AND     NVL(H.IDENTIDINSTR,0) = NVL(INS.IDENTIDINSTR,0)');
        Add('AND     H.IDENTIDINSTR    = EN.IDPESSOA(+)');
        Add('AND     H.IDPESSOA        = LP.IDPESSOA(+)');
        Add('AND     H.IDCURSO         = LP.IDCURSO(+)');
        Add('AND     H.NUMSEQ          = LP.NUMSEQ(+)');
        if CalcFalta = 0 then
        begin
          Add('AND     H.IDPESSOA        = LP2.IDPESSOA(+)');
          Add('AND     H.IDCURSO         = LP2.IDCURSO(+)');
          Add('AND     H.NUMSEQ          = LP2.NUMSEQ(+)');
        end;
      end
      else
      begin     // Consolida os registros do mesmo curso
        Add('SELECT');
        Add(QuotedStr(Sistema.NomeEmpresa) +' AS EMPRESA, PF.NOME AS EMPREGADO, C.TITULO AS CARGO, F.IDPESSOA AS MATRICULA,');
        Add('   CU.DESCRICAO, CU.IDCURSO, H.DUR_TOT, H.CUSTO,');
        Add('   '' '' AS CENTROCUSTO, H.DATREINI, H.DATREFIM, 0 AS AVALPRAT, 0 AS AVALTEOR,');
        Add('   EN.NOME AS ENTIDADE,');
        Add('''Período: '' || ' +QuotedStr(DataIni)+' || '' a ''');
        Add('   || ' +QuotedStr(DataFim)+ ' AS PERIODO,');
        Add('   H.DATREFIM AS DATPLFIM, 0 AS FLGAVALTEOR, 0 AS AVALTEOR, CU.AVALIACAO AS MINTEOR,');
        Add('               0 AS FLGAVALPRAT, 0 AS AVALPRAT, CU.AVALPRAT AS MINPRAT,');
        Add('   H.AVALCURSOREL,');
        Add('   H.DATREINI AS DATREF, H.DATREFIM AS DATFIM, CU.IDTIPOCURSO, '' '' AS CODCENTROCUSTO,');
        if CalcFalta = 0 then
          Add('   LP.PRESENCAS, (H.EXTENSAO - NVL(LP2.PRESENCAS,0)) AS FALTAS ')
        else
          Add('   LP.PRESENCAS, 0 AS FALTAS ');
        Add('FROM PESSOA PF, PESSOA EN, CANDIDAT F, CARGO C, CURSO CU,');

        Add('  (SELECT IDPESSOA, IDCURSO, COUNT(*) AS PRESENCAS FROM LISTAPRESENCA L ');
        Add('   WHERE NVL(L.FLGSEMAULA,0) = 0 AND');
        Add('   L.DATAPRESENCA BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
        Add('   AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY'') ');
        Add('   GROUP BY IDPESSOA, IDCURSO) LP, ');

        if CalcFalta = 0 then
        begin
          Add('  (SELECT IDPESSOA, IDCURSO, NUMSEQ, COUNT(*) AS PRESENCAS FROM LISTAPRESENCA L ');
          Add('   WHERE ');
          Add('   L.DATAPRESENCA BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('   AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY'') ');
          Add('   GROUP BY IDPESSOA, IDCURSO) LP2,');
        end;

        Add('     (SELECT IDPESSOA, IDCURSO, IDENTIDINSTR,');
        //Add('      SUM(H.DUR_PRAT + H.DUR_TEOR) AS DUR_TOT,');   //Ewerton Beltramini - 23/03/2022 - SIG 123893
        Add('      SUM(H.DUR_TOT) AS DUR_TOT,');                   //Ewerton Beltramini - 23/03/2022 - SIG 123893

        if CalcFalta = 0 then
          Add('    SUM(H.DATREFIM - H.DATREINI + 1) AS EXTENSAO,')
        else
          Add('    0 AS EXTENSAO,');

        Add('      SUM(NVL(H.VALOR,0)');
        Add('      + NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0)');
        Add('      ) AS CUSTO, MIN(DATREINI) AS DATREINI, MAX(DATREFIM) AS DATREFIM,');
        Add('      DECODE(SUM(NVL(H.FLGAVALCURS,0)), 0, ''NA'', TO_CHAR(AVG(NVL(H.AVALCURSO,0)))) AS AVALCURSOREL');
        Add('      FROM HSTTRN H');
        Add('      WHERE (');
        if (SelCurso1) then
        begin
          Add('   (H.DATPLINI IS NOT NULL AND');
          Add('    H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('    AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY''))');
        end;

        if (SelCurso2) then
        begin
          if (SelCurso1) then
            Add(' OR');

          Add('   (H.DATPLINI IS NULL AND');
          Add('    H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('    AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY''))');
        end;

        if (SelCurso3) then
        begin
          if (SelCurso1) or
             (SelCurso2) then
            Add(' OR');

          Add('   (H.DATREFIM IS NULL AND');
          Add('    H.DATPLFIM BETWEEN TO_DATE(' +QuotedStr(DataIni)+ ',''DD/MM/YYYY'')');
          Add('    AND TO_DATE(' +QuotedStr(DataFim)+ ',''DD/MM/YYYY''))');
        end;

        if (SelCurso4) then
        begin
          if (SelCurso1) or
             (SelCurso2) or
             (SelCurso3) then
            Add(' OR');

          Add('   (H.DATREINI IS NULL AND H.DATPLINI IS NULL)');
        end;
        Add(' )');

        if IncPorConta = 1 then
          Add('AND     H.FLGCONTROLE = 1');

        Add('      GROUP BY IDPESSOA, IDCURSO, IDENTIDINSTR  ) H');
        Add('WHERE   F.IDPESSOA = PF.IDPESSOA');

        Add('AND     F.IDPESSOA =' +sIdPessoa);

        Add('AND     F.IDCARGO    = C.IDCARGO');
        Add('AND     H.IDCURSO    = CU.IDCURSO');
        Add('AND     H.IDPESSOA   = F.IDPESSOA');
        Add('AND     H.IDENTIDINSTR    = EN.IDPESSOA(+)');
        Add('AND     H.IDPESSOA        = LP.IDPESSOA(+)');
        Add('AND     H.IDCURSO         = LP.IDCURSO(+)');
        if CalcFalta = 0 then
        begin
          Add('AND     H.IDPESSOA        = LP2.IDPESSOA(+)');
          Add('AND     H.IDCURSO         = LP2.IDCURSO(+)');
        end;
      end;
    end; // final candidato

    Add('ORDER BY');

    case (SeqRelat) of
      0 : Add('  DATREF, DESCRICAO');       // Data Ascendente, Curso
      1 : Add('  DATREF DESC, DESCRICAO');  // Data Descendente, Curso
      2 : Add('  DESCRICAO, DATREF');       // Curso, Data Ascendente
     else Add('  DESCRICAO, DATREF DESC');  // Curso, Data Descendente
    end;

//    SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlHistPess.Open;

  CdsHistPess.First;
end;

procedure TRptHistPess.rpAtivHistDtlBndBeforePrint(Sender: TObject);
begin
  rpAtivLblResultado.Caption := 'NA';
  if (not CdsHistPess.FieldByName('DATREFIM').IsNull) then
    rpAtivLblResultado.Caption := 'Realizado'
  else if (not CdsHistPess.FieldByName('DATREINI').IsNull) then
    rpAtivLblResultado.Caption := 'Em Andamento'
  else if (not CdsHistPess.FieldByName('DATPLINI').IsNull) then
    rpAtivLblResultado.Caption := 'Programado'
  else
    rpAtivLblResultado.Caption := 'A Programar';

  if (not CdsHistPess.FieldByName('DATREFIM').IsNull) and
     ((CdsHistPess.FieldByName('FLGAVALTEOR').asInteger = 1) or
      (CdsHistPess.FieldByName('FLGAVALPRAT').asInteger = 1)) then
  begin
    rpAtivLblResultado.Caption := 'Aprovado(a)';

    if ((CdsHistPess.FieldByName('FLGAVALTEOR').asInteger = 1) and
        (CdsHistPess.FieldByName('AVALTEOR').asInteger <
         CdsHistPess.FieldByName('MINTEOR').asInteger)) or
       ((CdsHistPess.FieldByName('FLGAVALPRAT').asInteger = 1) and
        (CdsHistPess.FieldByName('AVALPRAT').asInteger <
         CdsHistPess.FieldByName('MINPRAT').asInteger)) then
         rpAtivLblResultado.Caption := 'Reprovado(a)';
  end;
end;

end.
