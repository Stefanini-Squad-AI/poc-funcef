unit RListaPresenca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppPrnabl,
  ppBands, ppCache, ppVar;

type
  TRptListaPresenca = class(TFrmCmReport)
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
    ppLabel1: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
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
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppLabel6: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  public
    sCurso, sEntid, sInstrutor, sIdCurso, sIdEntid, sIdInstrutor,
    sIniPlan, sFimPlan, sIniReal, sFimReal, sDataIni, sDataFim,
    sLocal, sCarga, sInstrutores, sDataHora: String;
  end;

var
  RptListaPresenca: TRptListaPresenca;

implementation

{$R *.DFM}

uses uSistema, uCtrlFuncoesRH;

procedure TRptListaPresenca.CrmRptCMBeforePrint(Sender: TObject);
var
  sSql: string;
  dDataRef: TDate;
  i: integer;
const
  sDiaSem: array[1..7] of string = ('Dom','Seg','Ter','Qua','Qui','Sex','Sab');
begin
  inherited;
  sSQL := 'SELECT P.NOME AS EMPREGADO, '   ;
  sSQL := sSQL + QuotedStr(Sistema.NomeEmpresa) + ' AS EMPRESA, ';  
  sSQL := sSQL + QuotedStr(sCurso) + ' AS DESCRICAO, ';
  sSQL := sSQL + QuotedStr(sEntid) + ' AS ENTIDADE, ';
  sSQL := sSQL + QuotedStr(sInstrutor) + ' AS INSTRUTOR, ';
  sSQL := sSQL + QuotedStr(sLocal) + ' AS LOCAL, ';
  sSQL := sSQL + QuotedStr(sCarga) + ' AS CARGAHORARIA ';
  for i:=1 to Round(StrToDate(sDataFim) - StrToDate(sDataIni) + 1) do
  begin
    dDataRef := StrToDate(sDataIni) + i - 1;
    sSQL := sSQL + ', H' + IntToStr(i) + '.IDPESSOA, H' + IntToStr(i) + '.DIA' + IntToStr(i) + ', ';
    sSQL := sSQL + QuotedStr(DateToStr(dDataRef)) + ' AS DATA' + IntToStr(i) + ', ';
    sSQL := sSQL + 'H' + IntToStr(i) + '.SEM' + IntToStr(i) + ' ';
  end;

  sSQL := sSQL + 'FROM   PESSOA P, '            ;

  for i:=1 to Round(StrToDate(sDataFim) - StrToDate(sDataIni) + 1) do
  begin
    if i > 1 then
       sSQL := sSQL + '  ,';
    dDataRef := StrToDate(sDataIni) + i - 1;

    sSQL := sSQL + '       (SELECT H.IDPESSOA, H.NUMSEQ, ';
    sSQL := sSQL + '        DECODE(LP.IDPESSOA,NULL,'''',DECODE(NVL(LP.FLGSEMAULA,0),0,''Presente'',''Sem Aula'')) AS DIA' + IntToStr(i) + ', ';
    sSQL := sSQL + QuotedStr(sDiaSem[DayOfWeek(dDataRef)]) + ' AS SEM' + IntToStr(i) + ' ';
    sSQL := sSQL + '        FROM HSTTRN H,  '  ;

    sSQL := sSQL + '         (SELECT IDPESSOA, NUMSEQ, FLGSEMAULA FROM LISTAPRESENCA L '  ;
    sSQL := sSQL + '                       WHERE L.IDCURSO  = ' + sIdCurso;
    sSQL := sSQL + '                       AND   L.DATAPRESENCA = TO_DATE('        ;
    sSQL := sSQL + QuotedStr(DateToStr(dDataRef)) + ',''DD/MM/YYYY'')) LP ';

    sSQL := sSQL + '        WHERE  H.IDCURSO = ' + sIdCurso;

    if sEntid <> '' then
      sSQL := sSQL + '        AND    H.IDENTIDINSTR = ' + sIdEntid;

    if sInstrutor <> '' then
      sSQL := sSQL + '        AND    H.IDINSTRUTOR = ' + sIdInstrutor;

    if sIniPlan <> '' then begin
      sSQL := sSQL + '        AND    H.DATPLINI = TO_DATE('''     ;
      sSQL := sSQL + sIniPlan + ''',''dd/mm/yyyy'') '     ;
    end
    else
      sSQL := sSQL + '        AND    H.DATPLINI  IS NULL '        ;

    if sFimPlan <> '' then begin
      sSQL := sSQL + '        AND    H.DATPLFIM = TO_DATE('''     ;
      sSQL := sSQL + sFimPlan + ''',''dd/mm/yyyy'') '     ;
    end
    else
      sSQL := sSQL + '        AND    H.DATPLFIM  IS NULL '        ;

    if sIniReal <> '' then begin
      sSQL := sSQL + '        AND    H.DATREINI = TO_DATE('''     ;
      sSQL := sSQL + sIniReal + ''',''dd/mm/yyyy'') '     ;
    end
    else
      sSQL := sSQL + '        AND    H.DATREINI  IS NULL '        ;

    if sFimReal <> '' then begin
      sSQL := sSQL + '        AND    H.DATREFIM = TO_DATE('''     ;
      sSQL := sSQL + sFimReal + ''',''dd/mm/yyyy'') '    ;
    end
    else
      sSQL := sSQL + '        AND    H.DATREFIM  IS NULL '        ;

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

    sSQL := sSQL + '        AND    H.IDPESSOA = LP.IDPESSOA(+) '  ;
    sSQL := sSQL + '        AND    H.NUMSEQ   = LP.NUMSEQ(+)) H' + IntToStr(i) + ' '  ;
  end;


{    if sUsuXccusto <> '' then
      sSQL := sSQL + ' F.CODCENTROCUSTO IN ' + sUsuXccusto + ' AND ';

    if sUsuXfilial <> '' then
      sSQL := sSQL + ' F.IDESTAB IN ' + sUsuXfilial + ' AND ';
}
  for i:=1 to Round(StrToDate(sDataFim) - StrToDate(sDataIni) + 1) do
    if (i = 1) then
      sSQL := sSQL + 'WHERE   P.IDPESSOA       = H' + IntToStr(i) + '.IDPESSOA '
    else
      sSQL := sSQL + 'AND     P.IDPESSOA       = H' + IntToStr(i) + '.IDPESSOA ';

  sSQL := sSQL + ' ORDER BY UPPER(P.NOME)';

  sqlListaPresenca.Sql.Clear;
  sqlListaPresenca.Sql.Add(sSql);
  sqlListaPresenca.Open;
end;

end.
