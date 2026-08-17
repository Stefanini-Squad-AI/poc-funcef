unit RListaAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppCtrls,
  ppPrnabl, ppBands, ppCache, ppVar;

type
  TRptListaAval = class(TFrmCmReport)
    rpListaAval: TppReport;
    ppListaAval: TppBDEPipeline;
    dsListaAval: TwwDataSource;
    CdsListaAval: TCMClientDataSet;
    sqlListaAval: TCMSqlParams;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    ppLabel2: TppLabel;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppLabel6: TppLabel;
    ppDBText38: TppDBText;
    ppLabel1: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText4: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  public
    sCurso, sEntid, sInstrutor, sIdCurso, sIdEntid, sIdInstrutor,
    sIniPlan, sFimPlan, sIniReal, sFimReal, sDataIni, sDataFim,
    sLocal, sCarga, sInstrutores, sDataHora: string;
  end;

var
  RptListaAval: TRptListaAval;

implementation

{$R *.DFM}

uses uSistema, uCtrlUsoGeralRH;

procedure TRptListaAval.CrmRptCMBeforePrint(Sender: TObject);
var
  sSql: string;
begin
  inherited;
  sSQL := 'SELECT P.NOME AS EMPREGADO,';
  sSQL := sSQL + ' DECODE(F.MATRICULA,NULL,TO_CHAR(P.IDPESSOA),F.MATRICULA) AS MATRICULA,';
  sSQL := sSQL + ' DECODE(F.MATRICULA,NULL,''Candidato Externo'',C.NOME) AS CENTROCUSTO,';
  sSQL := sSQL + QuotedStr(Sistema.NomeEmpresa) + ' AS EMPRESA, ';
  sSQL := sSQL + QuotedStr(sCurso) + ' AS DESCRICAO, ';
  sSQL := sSQL + QuotedStr(sEntid) + ' AS ENTIDADE, ';
  sSQL := sSQL + QuotedStr(sInstrutor) + ' AS INSTRUTOR, ';
  sSQL := sSQL + QuotedStr(sLocal) + ' AS LOCAL, ';
  sSQL := sSQL + QuotedStr(sDataIni) + ' AS DATAINI, ';
  sSQL := sSQL + QuotedStr(sDataFim) + ' AS DATAFIM, ';
  sSQL := sSQL + QuotedStr(sCarga) + ' AS CARGAHORARIA, ';
  sSQL := sSQL + ' DECODE(NVL(H.AVALTEOR,0),0,''          '',TO_CHAR(H.AVALTEOR)) AS AVALTEOR, ';
  sSQL := sSQL + ' DECODE(NVL(H.AVALPRAT,0),0,''          '',TO_CHAR(H.AVALPRAT)) AS AVALPRAT ';
  sSQL := sSQL + 'FROM   PESSOA P, FUNCIONARIO F, CENTCUST C, HSTTRN H ';

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
  sSQL := sSQL + ' ORDER BY UPPER(P.NOME)';

  sqlListaAval.Sql.Clear;
  sqlListaAval.Sql.Add(sSql);
  sqlListaAval.Open;
end;

end.
