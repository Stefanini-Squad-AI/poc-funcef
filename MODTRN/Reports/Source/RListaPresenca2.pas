unit RListaPresenca2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppPrnabl,
  ppBands, ppCache, ppVar, ppStrtch, ppMemo;

type
  TRptListaPresenca2 = class(TFrmCmReport)
    rpListaPresenca: TppReport;
    ppListaPresenca: TppBDEPipeline;
    dsListaPresenca: TwwDataSource;
    CdsListaPresenca: TCMClientDataSet;
    sqlListaPresenca: TCMSqlParams;
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
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel10: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppLine3: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  public
    sCurso, sEntid, sInstrutor, sIdCurso, sIdEntid, sIdInstrutor,
    sIniPlan, sFimPlan, sIniReal, sFimReal, sDataIni, sDataFim,
    sLocal, sCarga, sInstrutores, sDataHora: String;
    iOpcao: integer;
  end;

var
  RptListaPresenca2: TRptListaPresenca2;

implementation

{$R *.DFM}

uses uSistema, uCtrlFuncoesRH;

procedure TRptListaPresenca2.CrmRptCMBeforePrint(Sender: TObject);
var
  sSql: string;
  dDataRef: TDate;
  i: integer;
begin
  inherited;
  if (iOpcao = 0) or (sDataFim = '') then
    sDataFim := sDataIni;

  for i:= 1 to Round(StrToDate(sDataFim) - StrToDate(sDataIni) + 1) do
  begin
    dDataRef := StrToDate(sDataIni) + i - 1;
    if i > 1 then
      sSQL := sSQL + ' UNION SELECT UPPER(P.NOME) AS UPNOME, P.NOME AS EMPREGADO,'+CR_LF
    else
      sSQL := 'SELECT UPPER(P.NOME) AS UPNOME, P.NOME AS EMPREGADO,'+CR_LF;
    sSQL := sSQL + 'TO_DATE('+QuotedStr(DateToStr(dDataRef))+',''DD/MM/YYYY'') AS DATASEQ, '+CR_LF;
    sSQL := sSQL + QuotedStr(DateToStr(dDataRef)) + ' AS DATAINI, '+CR_LF;
    sSQL := sSQL + ' DECODE(F.MATRICULA,NULL,TO_CHAR(P.IDPESSOA),F.MATRICULA) AS MATRICULA,'+CR_LF;
    sSQL := sSQL + ' DECODE(F.MATRICULA,NULL,''Candidato Externo'',C.NOME) AS CENTROCUSTO,'+CR_LF;
    sSQL := sSQL + QuotedStr(Sistema.NomeEmpresa) + ' AS EMPRESA, '+CR_LF;
    sSQL := sSQL + QuotedStr(sCurso) + ' AS DESCRICAO, '+CR_LF;
    sSQL := sSQL + QuotedStr(sEntid) + ' AS ENTIDADE, '+CR_LF;
    sSQL := sSQL + QuotedStr(sInstrutor) + ' AS INSTRUTOR, '+CR_LF;
    sSQL := sSQL + 'H.INSTRUTORES, H.DATAHORA,'+CR_LF;
    sSQL := sSQL + QuotedStr(sLocal) + ' AS LOCAL, '+CR_LF;
    sSQL := sSQL + QuotedStr(sCarga) + ' AS CARGAHORARIA '+CR_LF;
    sSQL := sSQL + 'FROM   PESSOA P, FUNCIONARIO F, CENTCUST C, '+CR_LF;

    sSQL := sSQL + '       (SELECT H.IDPESSOA, H.INSTRUTORES, H.DATAHORA, H.LOCALCURSO'+CR_LF;
    sSQL := sSQL + '        FROM HSTTRN H '+CR_LF;
    sSQL := sSQL + '        WHERE  H.IDCURSO = ' + sIdCurso+CR_LF;
    if sEntid <> '' then
      sSQL := sSQL + '        AND    H.IDENTIDINSTR = ' + sIdEntid+CR_LF;
    if sInstrutor <> '' then
      sSQL := sSQL + '        AND    H.IDINSTRUTOR = ' + sIdInstrutor+CR_LF;
    if sIniPlan <> '' then begin
      sSQL := sSQL + '        AND    H.DATPLINI = TO_DATE('''+CR_LF;
      sSQL := sSQL + sIniPlan + ''',''dd/mm/yyyy'') '+CR_LF;
    end
    else
      sSQL := sSQL + '        AND    H.DATPLINI  IS NULL '+CR_LF;
    if sFimPlan <> '' then begin
      sSQL := sSQL + '        AND    H.DATPLFIM = TO_DATE('''+CR_LF;
      sSQL := sSQL + sFimPlan + ''',''dd/mm/yyyy'') '+CR_LF;
    end
    else
      sSQL := sSQL + '        AND    H.DATPLFIM  IS NULL '+CR_LF;
    if sIniReal <> '' then begin
      sSQL := sSQL + '        AND    H.DATREINI = TO_DATE('''+CR_LF;
      sSQL := sSQL + sIniReal + ''',''dd/mm/yyyy'') '+CR_LF;
    end
    else
      sSQL := sSQL + '        AND    H.DATREINI  IS NULL '+CR_LF;
    if sFimReal <> '' then begin
      sSQL := sSQL + '        AND    H.DATREFIM = TO_DATE('''+CR_LF;
      sSQL := sSQL + sFimReal + ''',''dd/mm/yyyy'') '+CR_LF;
    end
    else
      sSQL := sSQL + '        AND    H.DATREFIM  IS NULL '+CR_LF;

    sSQL := sSQL + '      AND (NOT EXISTS (SELECT IDPESSOA'+CR_LF;
    sSQL := sSQL + '                       FROM   LISTAPRESENCA L'+CR_LF;
    sSQL := sSQL + '                       WHERE  (L.DATAPRESENCA = TO_DATE('+
      QuotedStr(DateToStr(dDataRef))+ ',''DD/MM/YYYY'')) AND'+CR_LF;
    sSQL := sSQL + '                              (L.FLGSEMAULA   = 1) AND'+CR_LF;
    sSQL := sSQL + '                              (L.IDPESSOA     = H.IDPESSOA) AND'+CR_LF;
    sSQL := sSQL + '                              (L.IDCURSO      = H.IDCURSO) AND'+CR_LF;
    sSQL := sSQL + '                              (L.NUMSEQ       = H.NUMSEQ)))'+CR_LF;

    sSQL := sSQL + ') H'+CR_LF;

    sSQL := sSQL + 'WHERE   P.IDPESSOA       = H.IDPESSOA '+CR_LF;

    if sLocal <> '' then
      sSQL := sSQL +
        'AND (REPLACE(REPLACE(REPLACE(H.LOCALCURSO,CHR(13)),CHR(10)),'' '') = ' +
          QuotedStr(StringReplace(StringReplace(StringReplace(sLocal,#13,'',
          [rfReplaceAll]),#10,'',[rfReplaceAll]),' ','',[rfReplaceAll]))+ ')'+CR_LF
    else
      sSQL := sSQL + 'AND     H.LOCALCURSO  IS NULL '+CR_LF;

    if sInstrutores <> '' then
      sSQL := sSQL +
        'AND (REPLACE(REPLACE(REPLACE(H.INSTRUTORES,CHR(13)),CHR(10)),'' '') = ' +
          QuotedStr(StringReplace(StringReplace(StringReplace(sInstrutores,#13,'',
          [rfReplaceAll]),#10,'',[rfReplaceAll]),' ','',[rfReplaceAll]))+ ')'+CR_LF
    else
      sSQL := sSQL + 'AND     H.INSTRUTORES  IS NULL '+CR_LF;

    if sDataHora <> '' then
      sSQL := sSQL +
        'AND (REPLACE(REPLACE(REPLACE(H.DATAHORA,CHR(13)),CHR(10)),'' '') = ' +
          QuotedStr(StringReplace(StringReplace(StringReplace(sDataHora,#13,'',
          [rfReplaceAll]),#10,'',[rfReplaceAll]),' ','',[rfReplaceAll]))+ ')'+CR_LF
    else
      sSQL := sSQL + 'AND     H.DATAHORA  IS NULL '+CR_LF;

    sSQL := sSQL + 'AND     P.IDPESSOA       = F.IDPESSOA(+)'+CR_LF;
    sSQL := sSQL + 'AND     F.IDEMPRESA      = C.IDEMPRESA(+) '+CR_LF;
    sSQL := sSQL + 'AND     F.CODCENTROCUSTO = C.CODCENTROCUSTO(+) '+CR_LF;
  end;

  sSQL := sSQL + ' ORDER BY 3, 1';

  sqlListaPresenca.Sql.Clear;
  sqlListaPresenca.Sql.Add(sSql);
  sqlListaPresenca.Open;
end;

end.
