unit RRelEvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppPrnabl,
  ppBands, ppCache, ppVar, ppStrtch, ppMemo, ppRegion, ppSubRpt, uCtrlGlobalRH, uCtrlRegTrein,
  TXRB;

type
  TRptRelEvento = class(TFrmCmReport)
    rpRelEvento: TppReport;
    ppRelEvento: TppBDEPipeline;
    dsRelEvento: TwwDataSource;
    CdsRelEvento: TCMClientDataSet;
    sqlRelEvento: TCMSqlParams;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    ppLabel2: TppLabel;
    ppDBText24: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppLabel6: TppLabel;
    ppDBText38: TppDBText;
    ppLabel1: TppLabel;
    ppLabelTeor: TppLabel;
    ppLabel9: TppLabel;
    ppDBText4: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabelPrat: TppLabel;
    ppDBTextTeor: TppDBText;
    ppDBTextPrat: TppDBText;
    ppLabel7: TppLabel;
    ppObserv: TppBDEPipeline;
    dsObserv: TwwDataSource;
    CdsObserv: TCMClientDataSet;
    sqlObserv: TCMSqlParams;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel15: TppLabel;
    ppDBText6: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppLabel19: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppAval: TppBDEPipeline;
    dsAval: TwwDataSource;
    CdsAval: TCMClientDataSet;
    sqlAval: TCMSqlParams;
    ppSubAvalCurso: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLine3: TppLine;
    ppLabel13: TppLabel;
    ppDBText12: TppDBText;
    SubObserv: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppDBMemo2: TppDBMemo;
    Region2: TppRegion;
    SubInstrutores: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppLabel3: TppLabel;
    ppDBText25: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppLabel14: TppLabel;
    ppRegion1: TppRegion;
    ppDBMemo3: TppDBMemo;
    ppLabel24: TppLabel;
    SubHorario: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    ppLabel25: TppLabel;
    ppDBMemo4: TppDBMemo;
    SubCompetencias: TppSubReport;
    ppChildReport5: TppChildReport;
    ppFator: TppBDEPipeline;
    dsFator: TwwDataSource;
    CdsFator: TCMClientDataSet;
    sqlFator: TCMSqlParams;
    ppTitleBand5: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppSummaryBand6: TppSummaryBand;
    ppLabel26: TppLabel;
    ppDBText13: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
  public
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlRegTrein: TCtrlRegTrein;

    bAvalAluno: boolean;
    sCurso, sEntid, sInstrutor, sIdCurso, sIdEntid, sIdInstrutor,
    sIniPlan, sFimPlan, sIniReal, sFimReal, sDataIni, sDataFim,
    sLocal, sDataHora, sInstrutores, sCarga: string;
  end;

var
  RptRelEvento: TRptRelEvento;

implementation

{$R *.DFM}

uses uSistema, uCtrlPadroes, uCtrlUsoGeralRH, dCds;

procedure TRptRelEvento.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);
  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGAVALALUNO');
  bAvalAluno := (dmCds.Cds.FieldByName('FLGAVALALUNO').asInteger = 1);
  if (bAvalAluno) then
  begin
    ppLabelPrat.Caption := 'Avaliação %';
    ppLabelTeor.Visible := False;
    ppDBTextTeor.Visible:= False;
  end;

  CtrlRegTrein := TCtrlRegTrein.Create(false, false, false, false, Sistema.IdEmpresa,
    Sistema.IdUsuario, Sistema.NomeUsuario, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRegTrein.InitializeAs(Padroes);
end;

procedure TRptRelEvento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlGlobalRH);
end;

procedure TRptRelEvento.CrmRptCMBeforePrint(Sender: TObject);
var
  sSql: string;
begin
  inherited;
  if sDataHora = '' then
  begin
    SubHorario.Visible := False;
    SubHorario.DataPipeline := nil;
  end;

  if (sInstrutor = '') and (sInstrutores = '') then
  begin
    SubInstrutores.Visible := False;
    SubInstrutores.DataPipeline := nil;
  end;

  sSQL := 'SELECT P.NOME AS EMPREGADO, H.IDPESSOA, H.IDCURSO, H.NUMSEQ,';
  sSQL := sSQL + ' DECODE(F.MATRICULA,NULL,TO_CHAR(P.IDPESSOA),F.MATRICULA) AS MATRICULA,';
  sSQL := sSQL + ' DECODE(F.MATRICULA,NULL,''Candidato Externo'',C.NOME) AS CENTROCUSTO,';
  sSQL := sSQL + QuotedStr(Sistema.NomeEmpresa) + ' AS EMPRESA, ';
  sSQL := sSQL + QuotedStr(sCurso) + ' AS DESCRICAO, ';
  sSQL := sSQL + QuotedStr(sEntid) + ' AS ENTIDADE, ';
  sSQL := sSQL + QuotedStr(sInstrutor) + ' AS INSTRUTOR, ';
  sSQL := sSQL + QuotedStr(sInstrutores) + ' AS INSTRUTORES, ';
  sSQL := sSQL + QuotedStr(sDataHora) + ' AS DATAHORA, ';
  sSQL := sSQL + QuotedStr(sLocal) + ' AS LOCAL, ';
  sSQL := sSQL + QuotedStr(sDataIni) + ' AS DATAINI, ';
  sSQL := sSQL + QuotedStr(sDataFim) + ' AS DATAFIM, ';
  if sFimReal <> '' then
    sSQL := sSQL + '''Realizado'' AS STATUS, '
  else if sIniReal <> '' then
    sSQL := sSQL + '''Iniciado'' AS STATUS, '
  else if sIniPlan <> '' then
    sSQL := sSQL + '''Programado'' AS STATUS, '
  else
    sSQL := sSQL + '''A Programar'' AS STATUS, ';
  sSQL := sSQL + QuotedStr(sCarga) + ' AS CARGAHORARIA, ';
  sSQL := sSQL + ' DECODE(NVL(H.AVALTEOR,0),0,''          '',TO_CHAR(H.AVALTEOR)) AS AVALTEOR, ';
  sSQL := sSQL + ' DECODE(NVL(H.AVALPRAT,0),0,''          '',TO_CHAR(H.AVALPRAT)) AS AVALPRAT, ';
  sSQL := sSQL + ' NVL(H.VALOR,0) AS VALOR, ';
  sSQL := sSQL + ' NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0) AS DESPESAS, ';
  sSQL := sSQL + ' NVL(H.VALOR,0) + NVL(H.DESP_VIAG,0) + NVL(H.DESP_ESTAD,0) + NVL(H.DESP_OUTR,0) AS TOTAL, ';
  sSQL := sSQL + ' LP.PRESENCAS ';
  sSQL := sSQL + 'FROM   PESSOA P, FUNCIONARIO F, CENTCUST C, HSTTRN H, ';

  sSQL := sSQL + '  (SELECT IDPESSOA, COUNT(*) AS PRESENCAS FROM LISTAPRESENCA L '  ;
  sSQL := sSQL + '   WHERE L.IDCURSO  = ' + sIdCurso;
  sSQL := sSQL + '   AND   L.DATAPRESENCA BETWEEN TO_DATE(' +QuotedStr(sDataIni)+ ',''DD/MM/YYYY'')';
  sSQL := sSQL + '   AND TO_DATE(' +QuotedStr(sDataFim)+ ',''DD/MM/YYYY'') ';
  sSQL := sSQL + '   GROUP BY IDPESSOA) LP ';

  sSQL := sSQL + 'WHERE  H.IDCURSO = ' + sIdCurso;

  if sEntid <> '' then
    sSQL := sSQL + 'AND    H.IDENTIDINSTR = ' + sIdEntid;

  if sInstrutor <> '' then
    sSQL := sSQL + 'AND    H.IDINSTRUTOR = ' + sIdInstrutor;

  if sIniPlan <> '' then begin
    sSQL := sSQL + 'AND    H.DATPLINI = TO_DATE('''     ;
    sSQL := sSQL + sIniPlan + ''',''dd/mm/yyyy'') '     ;
  end
  else
    sSQL := sSQL + 'AND    H.DATPLINI  IS NULL '        ;

  if sFimPlan <> '' then begin
    sSQL := sSQL + 'AND    H.DATPLFIM = TO_DATE('''     ;
    sSQL := sSQL + sFimPlan + ''',''dd/mm/yyyy'') '     ;
  end
  else
    sSQL := sSQL + 'AND    H.DATPLFIM  IS NULL '        ;

  if sIniReal <> '' then begin
    sSQL := sSQL + 'AND    H.DATREINI = TO_DATE('''     ;
    sSQL := sSQL + sIniReal + ''',''dd/mm/yyyy'') '     ;
  end
  else
    sSQL := sSQL + 'AND    H.DATREINI  IS NULL '        ;

  if sFimReal <> '' then begin
    sSQL := sSQL + 'AND    H.DATREFIM = TO_DATE('''     ;
    sSQL := sSQL + sFimReal + ''',''dd/mm/yyyy'') '    ;
  end
  else
    sSQL := sSQL + 'AND    H.DATREFIM  IS NULL '        ;

  if sLocal <> '' then
    sSQL := sSQL +
      'AND (REPLACE(REPLACE(REPLACE(H.LOCALCURSO,CHR(13)),CHR(10)),'' '') = ' +
        QuotedStr(StringReplace(StringReplace(StringReplace(sLocal,#13,'',
        [rfReplaceAll]),#10,'',[rfReplaceAll]),' ','',[rfReplaceAll]))+ ')'
  else
    sSQL := sSQL + 'AND     H.LOCALCURSO  IS NULL ';

  if sInstrutores <> '' then
    sSQL := sSQL +
      'AND (REPLACE(REPLACE(REPLACE(H.INSTRUTORES,CHR(13)),CHR(10)),'' '') = ' +
        QuotedStr(StringReplace(StringReplace(StringReplace(sInstrutores,#13,'',
        [rfReplaceAll]),#10,'',[rfReplaceAll]),' ','',[rfReplaceAll]))+ ')'
  else
    sSQL := sSQL + 'AND     H.INSTRUTORES  IS NULL ';

  if sDataHora <> '' then
    sSQL := sSQL +
      'AND (REPLACE(REPLACE(REPLACE(H.DATAHORA,CHR(13)),CHR(10)),'' '') = ' +
        QuotedStr(StringReplace(StringReplace(StringReplace(sDataHora,#13,'',
        [rfReplaceAll]),#10,'',[rfReplaceAll]),' ','',[rfReplaceAll]))+ ')'
  else
    sSQL := sSQL + 'AND     H.DATAHORA  IS NULL ';

  if CtrlUsoGeralRH.UsuXCCusto <> '' then
    sSQL := sSQL + ' F.CODCENTROCUSTO IN ' + CtrlUsoGeralRH.UsuXCCusto + ' AND ';

  if CtrlUsoGeralRH.UsuXFilial <> '' then
    sSQL := sSQL + ' F.IDESTAB IN ' + CtrlUsoGeralRH.UsuXFilial + ' AND ';

  sSQL := sSQL + 'AND     P.IDPESSOA       = H.IDPESSOA ';
  sSQL := sSQL + 'AND     P.IDPESSOA       = F.IDPESSOA(+) ';
  sSQL := sSQL + 'AND     F.IDEMPRESA      = C.IDEMPRESA(+) ';
  sSQL := sSQL + 'AND     F.CODCENTROCUSTO = C.CODCENTROCUSTO(+) ';
  sSQL := sSQL + 'AND     P.IDPESSOA       = LP.IDPESSOA(+) ';
  sSQL := sSQL + ' ORDER BY UPPER(P.NOME)';

  sqlRelEvento.Sql.Clear;
  sqlRelEvento.Sql.Add(sSql);
  sqlRelEvento.Open;

  // Observação do Curso
  sSQL := 'SELECT VALOR, OBSERVACAO, OBSERVACAO2 ';
  sSQL := sSQL + 'FROM CURSO ';
  sSQL := sSQL + 'WHERE IDCURSO = ' + sIdCurso;
  sqlObserv.Sql.Clear;
  sqlObserv.Sql.Add(sSql);
  sqlObserv.Open;
  if (CdsObserv.FieldByName('OBSERVACAO').IsNull) and
     (CdsObserv.FieldByName('OBSERVACAO2').IsNull) then
  begin
    SubObserv.Visible := False;
    SubObserv.DataPipeline := nil;
  end;

  // Avaliação do Curso
  sSQL := 'SELECT F.IDFATORAVAL, F.DESCRICAO, AV.CONTA, AV.MEDIA ';
  sSQL := sSQL + 'FROM FATORAVALCURSO F, ';
  sSQL := sSQL + '(';

  sSQL := sSQL + 'SELECT A.IDFATORAVAL, F.DESCRICAO, ';
  sSQL := sSQL + 'COUNT(*) AS CONTA, SUM(A.AVALCURSO) * 100 / NVL(P.VALMAXAVALTRN,100) / COUNT(*) AS MEDIA ';
  sSQL := sSQL + 'FROM HSTTRN H, AVALCURSO A, FATORAVALCURSO F, PARAMRH P ';
  sSQL := sSQL + 'WHERE  H.IDPESSOA = A.IDPESSOA ';
  sSQL := sSQL + ' AND     NVL(A.FLGCURSOALUNO,0) = 0';  

  sSQL := sSQL + ' AND     H.IDCURSO IN (' +sIdCurso+ ')';

  if sEntid <> '' then
    sSQL := sSQL + ' AND     H.IDENTIDINSTR IN (' +sIdEntid+ ')';

  if sInstrutor <> '' then
    sSQL := sSQL + ' AND    H.IDINSTRUTOR = ' + sIdInstrutor;

  if sIniPlan <> '' then begin
    sSQL := sSQL + ' AND    H.DATPLINI = TO_DATE('''     ;
    sSQL := sSQL + sIniPlan + ''',''dd/mm/yyyy'') '     ;
  end
  else
    sSQL := sSQL + ' AND    H.DATPLINI  IS NULL '        ;

  if sFimPlan <> '' then begin
    sSQL := sSQL + ' AND    H.DATPLFIM = TO_DATE('''     ;
    sSQL := sSQL + sFimPlan + ''',''dd/mm/yyyy'') '     ;
  end
  else
    sSQL := sSQL + ' AND    H.DATPLFIM  IS NULL '        ;

  if sIniReal <> '' then begin
    sSQL := sSQL + ' AND    H.DATREINI = TO_DATE('''     ;
    sSQL := sSQL + sIniReal + ''',''dd/mm/yyyy'') '     ;
  end
  else
    sSQL := sSQL + ' AND    H.DATREINI  IS NULL '        ;

  if sFimReal <> '' then begin
    sSQL := sSQL + ' AND    H.DATREFIM = TO_DATE('''     ;
    sSQL := sSQL + sFimReal + ''',''dd/mm/yyyy'') '    ;
  end
  else
    sSQL := sSQL + ' AND    H.DATREFIM  IS NULL '        ;

  sSQL := sSQL + ' AND    H.IDCURSO  = A.IDCURSO';
  sSQL := sSQL + ' AND    H.NUMSEQ   = A.NUMSEQ';
  sSQL := sSQL + ' AND    A.IDFATORAVAL = F.IDFATORAVAL';
  sSQL := sSQL + ' AND    F.FLGAVALCURSO = 0';
  sSQL := sSQL + ' GROUP BY A.IDFATORAVAL, F.DESCRICAO, P.VALMAXAVALTRN ';

  sSQL := sSQL + 'UNION ';

  sSQL := sSQL + 'SELECT A.IDFATORAVAL, F.DESCRICAO, ';
  sSQL := sSQL + 'COUNT(*) AS CONTA, SUM(A.AVALCURSO * 100 / E.QTDECONCEITOS) / COUNT(*) AS MEDIA ';
  sSQL := sSQL + 'FROM HSTTRN H, AVALCURSO A, FATORAVALCURSO F, ESCALACONCEITOS E ';
  sSQL := sSQL + 'WHERE  H.IDPESSOA = A.IDPESSOA';
  sSQL := sSQL + ' AND     NVL(A.FLGCURSOALUNO,0) = 0';
  sSQL := sSQL + ' AND     F.IDESCALACONCEITOS = E.IDESCALACONCEITOS';

  sSQL := sSQL + ' AND     H.IDCURSO IN (' +sIdCurso+ ')';

  if sEntid <> '' then
    sSQL := sSQL + ' AND     H.IDENTIDINSTR IN (' +sIdEntid+ ')';

  if sInstrutor <> '' then
    sSQL := sSQL + ' AND    H.IDINSTRUTOR = ' + sIdInstrutor;

  if sIniPlan <> '' then begin
    sSQL := sSQL + ' AND    H.DATPLINI = TO_DATE('''     ;
    sSQL := sSQL + sIniPlan + ''',''dd/mm/yyyy'') '     ;
  end
  else
    sSQL := sSQL + ' AND    H.DATPLINI  IS NULL '        ;

  if sFimPlan <> '' then begin
    sSQL := sSQL + ' AND    H.DATPLFIM = TO_DATE('''     ;
    sSQL := sSQL + sFimPlan + ''',''dd/mm/yyyy'') '     ;
  end
  else
    sSQL := sSQL + ' AND    H.DATPLFIM  IS NULL '        ;

  if sIniReal <> '' then begin
    sSQL := sSQL + ' AND    H.DATREINI = TO_DATE('''     ;
    sSQL := sSQL + sIniReal + ''',''dd/mm/yyyy'') '     ;
  end
  else
    sSQL := sSQL + ' AND    H.DATREINI  IS NULL '        ;

  if sFimReal <> '' then begin
    sSQL := sSQL + ' AND    H.DATREFIM = TO_DATE('''     ;
    sSQL := sSQL + sFimReal + ''',''dd/mm/yyyy'') '    ;
  end
  else
    sSQL := sSQL + ' AND    H.DATREFIM  IS NULL '        ;

  sSQL := sSQL + ' AND    H.IDCURSO  = A.IDCURSO';
  sSQL := sSQL + ' AND    H.NUMSEQ   = A.NUMSEQ';
  sSQL := sSQL + ' AND    A.IDFATORAVAL = F.IDFATORAVAL';
  sSQL := sSQL + ' AND    F.FLGAVALCURSO = 1 ';
  sSQL := sSQL + 'GROUP BY A.IDFATORAVAL, F.DESCRICAO, E.QTDECONCEITOS ';
  sSQL := sSQL + ') AV ';
  sSQL := sSQL + 'WHERE F.IDFATORAVAL = AV.IDFATORAVAL(+) ';
  sSQL := sSQL + 'AND   NVL(F.INDAPLICACAO,0) = 0 ';
  sSQL := sSQL + 'ORDER BY 1';
  sqlAval.Sql.Clear;
  sqlAval.Sql.Add(sSql);
  sqlAval.Open;

  if CdsAval.RecordCount = 0 then
  begin
    ppSubAvalCurso.Visible := False;
    ppSubAvalCurso.DataPipeline := nil;
  end;


  // Competências do Curso
  sSQL := 'SELECT F.DESCRFATORAVAL ';
  sSQL := sSQL + 'FROM CURSOXAVALDES C, FATORAVAL F ';
  sSQL := sSQL + 'WHERE C.IDCURSO = ' + sIdCurso;
  sSQL := sSQL + ' AND   C.IDFATORAVAL = F.IDFATORAVAL ';
  sSQL := sSQL + 'ORDER BY UPPER(DESCRFATORAVAL)';
  sqlFator.Sql.Clear;
  sqlFator.Sql.Add(sSql);
  sqlFator.Open;

  if CdsFator.RecordCount = 0 then
  begin
    SubCompetencias.Visible := False;
    SubCompetencias.DataPipeline := nil;
  end;


end;

procedure TRptRelEvento.ppDetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
  if bAvalAluno then
  begin
    CdsRelEvento.edit;
    CdsRelEvento.FieldByName('AVALPRAT').asInteger := Round(
           CtrlRegTrein.MediaAvaliacaoAlunoPorFatores(
           CdsRelEvento.FieldByName('IDPESSOA').asFloat,
           CdsRelEvento.FieldByName('IDCURSO').asFloat,
           CdsRelEvento.FieldByName('NUMSEQ').asInteger));
    CdsRelEvento.Post;
  end;
end;

end.
