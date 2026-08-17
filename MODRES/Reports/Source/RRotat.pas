unit RRotat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppCtrls,
  ppBands, ppPrnabl, ppDB, ppCache, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, TXRB;

type
  TRptRotat = class(TFrmCmReport)
    rpRotat: TppReport;
    ppRotat: TppBDEPipeline;
    dsRotat: TwwDataSource;
    CdsRotat: TCMClientDataSet;
    sqlRotat: TCMSqlParams;
    rpRotatHdrBnd: TppHeaderBand;
    rpRotatDtlBnd: TppDetailBand;
    rpRotatFootBnd: TppFooterBand;
    rpRotatDBTxt1: TppDBText;
    rpRotatLbl1: TppLabel;
    rpRotatDBTxt2: TppDBText;
    rpRotatGroup0: TppGroup;
    rpRotatGrpHdrBnd: TppGroupHeaderBand;
    rpRotatGrpFootBnd: TppGroupFooterBand;
    rpRotatLbl4: TppLabel;
    rpRotatLbl5: TppLabel;
    rpRotatLbl6: TppLabel;
    rpRotatLbl7: TppLabel;
    rpRotatLbl8: TppLabel;
    rpRotatLine1: TppLine;
    rpRotatDBTxt3: TppDBText;
    rpRotatDBTxt4: TppDBText;
    rpRotatDBTxt5: TppDBText;
    rpRotatDBTxt6: TppDBText;
    rpRotatDBTxt7: TppDBText;
    rpRotatLine2: TppLine;
    rpRotatDBCalc1: TppDBCalc;
    rpRotatDBCalc2: TppDBCalc;
    rpRotatDBCalc3: TppDBCalc;
    rpRotatDBCalc4: TppDBCalc;
    rpRotatLbl9: TppLabel;
    rpRotatLbl2: TppLabel;
    rpRotatLbl3: TppLabel;
    rpRotatSysVar1: TppSystemVariable;
    rpRotatSysVar2: TppSystemVariable;
    rpRotatSmryBnd: TppSummaryBand;
    rpRotatSR1: TppSubReport;
    ppChildReport1: TppChildReport;
    sqlRotat1: TCMSqlParams;
    CdsRotat1: TCMClientDataSet;
    dsRotat1: TwwDataSource;
    ppRotat1: TppBDEPipeline;
    rpRotatSRDtlBnd: TppDetailBand;
    rpRotatSRSmryBnd: TppSummaryBand;
    rpRotatSRLbl1: TppLabel;
    rpRotatSRDbTxt6: TppDBText;
    rpRotatSRLbl2: TppLabel;
    rpRotatSRLbl3: TppLabel;
    rpRotatSRLbl4: TppLabel;
    rpRotatSRLbl5: TppLabel;
    rpRotatSRLbl6: TppLabel;
    rpRotatSRLine1: TppLine;
    rpRotatSRLbl7: TppLabel;
    rpRotatSRLbl8: TppLabel;
    rpRotatSRSysVar1: TppSystemVariable;
    rpRotatSRSysVar2: TppSystemVariable;
    rpRotatSRDbTxt1: TppDBText;
    rpRotatSRDbTxt2: TppDBText;
    rpRotatSRDbTxt3: TppDBText;
    rpRotatSRDbTxt4: TppDBText;
    rpRotatSRDbTxt5: TppDBText;
    rpRotatSRLine2: TppLine;
    rpRotatSRDBCalc1: TppDBCalc;
    rpRotatSRDBCalc2: TppDBCalc;
    rpRotatSRDBCalc3: TppDBCalc;
    rpRotatSRDBCalc4: TppDBCalc;
    rpRotatSRLbl9: TppLabel;
    rpRotatSRHdrBnd: TppHeaderBand;
    ppLblCCusto: TppLabel;
    ppLblCCustoTot: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpRotatDtlBndBeforePrint(Sender: TObject);
  private
    wAno, wMes, wDia: word;

    procedure GerarDadosRelat;
  end;

var
  RptRotat: TRptRotat;

implementation

uses uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptRotat.CrmRptCMBeforePrint(Sender: TObject);
var
  c: integer;
begin
  inherited;
  Decodedate(Date, wAno, wMes, wDia);

  ppLblCCusto.Visible := (CmpRptCM.ParamByName('MASCARA').asString <> '**********');
  if (CmpRptCM.ParamByName('MASCARA').asString <> '**********') then
    ppLblCCusto.Caption := ppLblCCusto.Caption +
      CmpRptCM.ParamByName('MASCARA').asString +
      FU.IFF(CmpRptCM.ParamByName('NomeCC').asString <> '**********',
      ' - ' + CmpRptCM.ParamByName('NomeCC').asString, '');
  ppLblCCustoTot.Visible := ppLblCCusto.Visible;
  ppLblCCustoTot.Caption := ppLblCCusto.Caption;

  with (sqlRotat.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ.NOME AS EMPRESA, E.MESREF, NVL(A.ADMISSOES,0) AS ADMISSOES,');
    Add('  NVL(D.DEMISSOES,0) AS DEMISSOES, NVL(E.EFETIVO,0) AS EFETIVO,');
    Add('  DECODE(NVL(E.EFETIVO,0),0,0,ROUND(NVL(D.DEMISSOES,0) * 100 / E.EFETIVO,2)) AS TURNOVER,');
    Add('  DECODE(TO_NUMBER(E.MESREF),1,''Janeiro'',2,''Fevereiro'',3,''Março'',4,''Abril'',');
    Add('  5,''Maio'',6,''Junho'',7,''Julho'',8,''Agosto'',9,''Setembro'',10,''Outubro'',');
    Add('  11,''Novembro'',''Dezembro'') AS NOMEMES,');
    Add('  ' +CmpRptCM.ParamByName('Ano').asString+ ' AS ANOREF');
    Add('FROM');
    Add('  PESSOA PJ,');

    // Admissões
    Add('  (SELECT');
    Add('     COUNT(*) AS ADMISSOES, IDESTAB, TO_CHAR(DATAADMISSAO,''MM'') AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO');
    Add('   WHERE');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('     (SUBSTR(CODCENTROCUSTO, ' +IntToStr(c)+
            ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ') AND');

    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('     (IDPESSOA         = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('     (CODCENTROCUSTO  IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('     (CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('     (IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) AND')
      else
        Add('     (IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if not(CmpRptCM.ParamByName('Efet').asBoolean) then
      Add('     (TIPOCONTRATO <> ''E'') AND');
    if not(CmpRptCM.ParamByName('Efes').asBoolean) then
      Add('     (TIPOCONTRATO <> ''S'') AND');
    if not(CmpRptCM.ParamByName('Temp').asBoolean) then
      Add('     (TIPOCONTRATO <> ''T'') AND');
    if not(CmpRptCM.ParamByName('Estg').asBoolean) then
      Add('     (TIPOCONTRATO <> ''G'') AND');
    if not(CmpRptCM.ParamByName('Terc').asBoolean) then
      Add('     (TIPOCONTRATO <> ''3'') AND');
    if not(CmpRptCM.ParamByName('Prop').asBoolean) then
      Add('     (TIPOCONTRATO <> ''P'') AND');
    if not(CmpRptCM.ParamByName('Auto').asBoolean) then
      Add('     (TIPOCONTRATO <> ''A'') AND');

    Add('     (TO_CHAR(DATAADMISSAO,''YYYY'') = ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString)+ ')');
    Add('   GROUP BY');
    Add('     IDESTAB, TO_CHAR(DATAADMISSAO,''MM'')) A,');
    Add('  --****');
    // Demissões
    Add('  (SELECT');
    Add('     COUNT(*) AS DEMISSOES, F.IDESTAB, TO_CHAR(F.DATADESLIGAMENTO,''MM'') AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.TIPOSIT   = ''D'') AND');
    Add('     (SF.IDSITFUNC = F.IDSITFUNC) AND');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('     (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
              ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ') AND');

    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('     (F.IDPESSOA         = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('     (F.CODCENTROCUSTO  IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('     (F.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) AND')
      else
        Add('     (F.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if not(CmpRptCM.ParamByName('Efet').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''E'') AND');
    if not(CmpRptCM.ParamByName('Efes').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''S'') AND');
    if not(CmpRptCM.ParamByName('Temp').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''T'') AND');
    if not(CmpRptCM.ParamByName('Estg').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''G'') AND');
    if not(CmpRptCM.ParamByName('Terc').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''3'') AND');
    if not(CmpRptCM.ParamByName('Prop').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''P'') AND');
    if not(CmpRptCM.ParamByName('Auto').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''A'') AND');

    Add('     (TO_CHAR(F.DATADESLIGAMENTO,''YYYY'') = ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString)+ ')');
    Add('   GROUP BY');
    Add('     F.IDESTAB, TO_CHAR(F.DATADESLIGAMENTO,''MM'')) D,');
    Add('  --****');
    Add('  (SELECT');
    Add('     COUNT(*) AS EFETIVO, F.IDESTAB, ''01'' AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.IDSITFUNC = F.IDSITFUNC) AND');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('     (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
            ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ') AND');

    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('     (F.IDPESSOA        = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('     (F.CODCENTROCUSTO IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('     (F.IDESTAB        IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) AND')
      else
        Add('     (F.IDESTAB         = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if not(CmpRptCM.ParamByName('Efet').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''E'') AND');
    if not(CmpRptCM.ParamByName('Efes').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''S'') AND');
    if not(CmpRptCM.ParamByName('Temp').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''T'') AND');
    if not(CmpRptCM.ParamByName('Estg').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''G'') AND');
    if not(CmpRptCM.ParamByName('Terc').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''3'') AND');
    if not(CmpRptCM.ParamByName('Prop').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''P'') AND');
    if not(CmpRptCM.ParamByName('Auto').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''A'') AND');

    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYYMM'') <= ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'01')+ ') AND');
    Add('     (TO_CHAR(F.DATADESLIGAMENTO,''YYYYMM'') > ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'01')+ ' OR SF.TIPOSIT <> ''D'')');
    Add('   GROUP BY');
    Add('     F.IDESTAB');
    Add('   --****');
    Add('   UNION');
    Add('   --****');
    Add('   SELECT');
    Add('     COUNT(*) AS EFETIVO, F.IDESTAB, ''02'' AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.IDSITFUNC = F.IDSITFUNC) AND');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('     (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
            ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ') AND');

    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('     (F.IDPESSOA         = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('     (F.CODCENTROCUSTO  IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('     (F.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) AND')
      else
        Add('     (F.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if not(CmpRptCM.ParamByName('Efet').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''E'') AND');
    if not(CmpRptCM.ParamByName('Efes').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''S'') AND');
    if not(CmpRptCM.ParamByName('Temp').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''T'') AND');
    if not(CmpRptCM.ParamByName('Estg').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''G'') AND');
    if not(CmpRptCM.ParamByName('Terc').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''3'') AND');
    if not(CmpRptCM.ParamByName('Prop').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''P'') AND');
    if not(CmpRptCM.ParamByName('Auto').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''A'') AND');

    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYYMM'') <= ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString + '02')+ ') AND');
    Add('     (TO_CHAR(F.DATADESLIGAMENTO,''YYYYMM'') > ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString + '02')+ ' OR SF.TIPOSIT <> ''D'')');
    Add('   GROUP BY');
    Add('     F.IDESTAB');
    Add('   --****');
    Add('   UNION');
    Add('   --****');
    Add('   SELECT');
    Add('     COUNT(*) AS EFETIVO, F.IDESTAB, ''03'' AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.IDSITFUNC = F.IDSITFUNC) AND');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('     (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
            ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ') AND');

    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('     (F.IDPESSOA         = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('     (F.CODCENTROCUSTO  IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('     (F.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) AND')
      else
        Add('     (F.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if not(CmpRptCM.ParamByName('Efet').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''E'') AND');
    if not(CmpRptCM.ParamByName('Efes').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''S'') AND');
    if not(CmpRptCM.ParamByName('Temp').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''T'') AND');
    if not(CmpRptCM.ParamByName('Estg').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''G'') AND');
    if not(CmpRptCM.ParamByName('Terc').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''3'') AND');
    if not(CmpRptCM.ParamByName('Prop').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''P'') AND');
    if not(CmpRptCM.ParamByName('Auto').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''A'') AND');

    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYYMM'') <= ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'03')+ ') AND');
    Add('     (TO_CHAR(F.DATADESLIGAMENTO,''YYYYMM'') > ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'03') +' OR SF.TIPOSIT <> ''D'')');
    Add('   GROUP BY');
    Add('     F.IDESTAB');
    Add('   --****');
    Add('   UNION');
    Add('   --****');
    Add('   SELECT');
    Add('     COUNT(*) AS EFETIVO, F.IDESTAB, ''04'' AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.IDSITFUNC = F.IDSITFUNC) AND');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('     (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
            ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ') AND');

    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('     (F.IDPESSOA         = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('     (F.CODCENTROCUSTO  IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('     (F.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) AND')
      else
        Add('     (F.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if not(CmpRptCM.ParamByName('Efet').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''E'') AND');
    if not(CmpRptCM.ParamByName('Efes').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''S'') AND');
    if not(CmpRptCM.ParamByName('Temp').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''T'') AND');
    if not(CmpRptCM.ParamByName('Estg').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''G'') AND');
    if not(CmpRptCM.ParamByName('Terc').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''3'') AND');
    if not(CmpRptCM.ParamByName('Prop').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''P'') AND');
    if not(CmpRptCM.ParamByName('Auto').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''A'') AND');

    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYYMM'') <= ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'04') +') AND');
    Add('     (TO_CHAR(F.DATADESLIGAMENTO,''YYYYMM'') > ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'04')+ ' OR SF.TIPOSIT <> ''D'')');
    Add('   GROUP BY');
    Add('     F.IDESTAB');
    Add('   --****');
    Add('   UNION');
    Add('   --****');
    Add('   SELECT');
    Add('     COUNT(*) AS EFETIVO, F.IDESTAB, ''05'' AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.IDSITFUNC = F.IDSITFUNC) AND');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('     (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
            ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ') AND');

    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('     (F.IDPESSOA         = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('     (F.CODCENTROCUSTO  IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('     (F.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) AND')
      else
        Add('     (F.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if not(CmpRptCM.ParamByName('Efet').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''E'') AND');
    if not(CmpRptCM.ParamByName('Efes').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''S'') AND');
    if not(CmpRptCM.ParamByName('Temp').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''T'') AND');
    if not(CmpRptCM.ParamByName('Estg').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''G'') AND');
    if not(CmpRptCM.ParamByName('Terc').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''3'') AND');
    if not(CmpRptCM.ParamByName('Prop').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''P'') AND');
    if not(CmpRptCM.ParamByName('Auto').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''A'') AND');

    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYYMM'') <= ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'05') +') AND');
    Add('     (TO_CHAR(F.DATADESLIGAMENTO,''YYYYMM'') > ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'05') +' OR SF.TIPOSIT <> ''D'')');
    Add('   GROUP BY');
    Add('     F.IDESTAB');
    Add('   --****');
    Add('   UNION');
    Add('   --****');
    Add('   SELECT');
    Add('     COUNT(*) AS EFETIVO, F.IDESTAB, ''06'' AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.IDSITFUNC = F.IDSITFUNC) AND');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('     (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
              ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ') AND');

    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('     (F.IDPESSOA         = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('     (F.CODCENTROCUSTO  IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('     (F.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) AND')
      else
        Add('     (F.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if not(CmpRptCM.ParamByName('Efet').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''E'') AND');
    if not(CmpRptCM.ParamByName('Efes').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''S'') AND');
    if not(CmpRptCM.ParamByName('Temp').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''T'') AND');
    if not(CmpRptCM.ParamByName('Estg').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''G'') AND');
    if not(CmpRptCM.ParamByName('Terc').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''3'') AND');
    if not(CmpRptCM.ParamByName('Prop').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''P'') AND');
    if not(CmpRptCM.ParamByName('Auto').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''A'') AND');

    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYYMM'') <= ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'06') +') AND');
    Add('     (TO_CHAR(F.DATADESLIGAMENTO,''YYYYMM'') > ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'06') +' OR SF.TIPOSIT <> ''D'')');
    Add('   GROUP BY');
    Add('     F.IDESTAB');
    Add('   --****');
    Add('   UNION');
    Add('   --****');
    Add('   SELECT');
    Add('     COUNT(*) AS EFETIVO, F.IDESTAB, ''07'' AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.IDSITFUNC = F.IDSITFUNC) AND');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('     (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
              ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ') AND');

    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('     (F.IDPESSOA         = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('     (F.CODCENTROCUSTO  IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('     (F.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) AND')
      else
        Add('     (F.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if not(CmpRptCM.ParamByName('Efet').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''E'') AND');
    if not(CmpRptCM.ParamByName('Efes').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''S'') AND');
    if not(CmpRptCM.ParamByName('Temp').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''T'') AND');
    if not(CmpRptCM.ParamByName('Estg').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''G'') AND');
    if not(CmpRptCM.ParamByName('Terc').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''3'') AND');
    if not(CmpRptCM.ParamByName('Prop').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''P'') AND');
    if not(CmpRptCM.ParamByName('Auto').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''A'') AND');

    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYYMM'') <= ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'07') +') AND');
    Add('     (TO_CHAR(F.DATADESLIGAMENTO,''YYYYMM'') > ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'07') +' OR SF.TIPOSIT <> ''D'')');
    Add('   GROUP BY');
    Add('     F.IDESTAB');
    Add('   --****');
    Add('   UNION');
    Add('   --****');
    Add('   SELECT');
    Add('     COUNT(*) AS EFETIVO, F.IDESTAB, ''08'' AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.IDSITFUNC = F.IDSITFUNC) AND');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('     (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
              ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ') AND');

    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('     (F.IDPESSOA         = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('     (F.CODCENTROCUSTO  IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('     (F.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) AND')
      else
        Add('     (F.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if not(CmpRptCM.ParamByName('Efet').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''E'') AND');
    if not(CmpRptCM.ParamByName('Efes').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''S'') AND');
    if not(CmpRptCM.ParamByName('Temp').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''T'') AND');
    if not(CmpRptCM.ParamByName('Estg').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''G'') AND');
    if not(CmpRptCM.ParamByName('Terc').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''3'') AND');
    if not(CmpRptCM.ParamByName('Prop').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''P'') AND');
    if not(CmpRptCM.ParamByName('Auto').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''A'') AND');

    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYYMM'') <= ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'08') +') AND');
    Add('     (TO_CHAR(F.DATADESLIGAMENTO,''YYYYMM'') > ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'08') +' OR SF.TIPOSIT <> ''D'')');
    Add('   GROUP BY');
    Add('     F.IDESTAB');
    Add('   --****');
    Add('   UNION');
    Add('   --****');
    Add('   SELECT');
    Add('     COUNT(*) AS EFETIVO, F.IDESTAB, ''09'' AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.IDSITFUNC = F.IDSITFUNC) AND');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('     (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
              ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ') AND');

    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('     (F.IDPESSOA         = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('     (F.CODCENTROCUSTO  IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('     (F.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) AND')
      else
        Add('     (F.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if not(CmpRptCM.ParamByName('Efet').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''E'') AND');
    if not(CmpRptCM.ParamByName('Efes').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''S'') AND');
    if not(CmpRptCM.ParamByName('Temp').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''T'') AND');
    if not(CmpRptCM.ParamByName('Estg').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''G'') AND');
    if not(CmpRptCM.ParamByName('Terc').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''3'') AND');
    if not(CmpRptCM.ParamByName('Prop').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''P'') AND');
    if not(CmpRptCM.ParamByName('Auto').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''A'') AND');

    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYYMM'') <= ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'09') +') AND');
    Add('     (TO_CHAR(F.DATADESLIGAMENTO,''YYYYMM'') > ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'09') +' OR SF.TIPOSIT <> ''D'')');
    Add('   GROUP BY');
    Add('     F.IDESTAB');
    Add('   --****');
    Add('   UNION');
    Add('   --****');
    Add('   SELECT');
    Add('     COUNT(*) AS EFETIVO, F.IDESTAB, ''10'' AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.IDSITFUNC = F.IDSITFUNC) AND');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('     (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
            ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ') AND');

    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('     (F.IDPESSOA         = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('     (F.CODCENTROCUSTO  IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('     (F.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) AND')
      else
        Add('     (F.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if not(CmpRptCM.ParamByName('Efet').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''E'') AND');
    if not(CmpRptCM.ParamByName('Efes').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''S'') AND');
    if not(CmpRptCM.ParamByName('Temp').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''T'') AND');
    if not(CmpRptCM.ParamByName('Estg').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''G'') AND');
    if not(CmpRptCM.ParamByName('Terc').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''3'') AND');
    if not(CmpRptCM.ParamByName('Prop').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''P'') AND');
    if not(CmpRptCM.ParamByName('Auto').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''A'') AND');

    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYYMM'') <= ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'10') +') AND');
    Add('     (TO_CHAR(F.DATADESLIGAMENTO,''YYYYMM'') > ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'10') +' OR SF.TIPOSIT <> ''D'')');
    Add('   GROUP BY');
    Add('     F.IDESTAB');
    Add('   --****');
    Add('   UNION');
    Add('   --****');
    Add('   SELECT');
    Add('     COUNT(*) AS EFETIVO, F.IDESTAB, ''11'' AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.IDSITFUNC = F.IDSITFUNC) AND');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('     (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
              ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ') AND');

    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('     (F.IDPESSOA         = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('     (F.CODCENTROCUSTO  IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('     (F.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) AND')
      else
        Add('     (F.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if not(CmpRptCM.ParamByName('Efet').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''E'') AND');
    if not(CmpRptCM.ParamByName('Efes').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''S'') AND');
    if not(CmpRptCM.ParamByName('Temp').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''T'') AND');
    if not(CmpRptCM.ParamByName('Estg').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''G'') AND');
    if not(CmpRptCM.ParamByName('Terc').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''3'') AND');
    if not(CmpRptCM.ParamByName('Prop').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''P'') AND');
    if not(CmpRptCM.ParamByName('Auto').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''A'') AND');

    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYYMM'') <= ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'11') +') AND');
    Add('     (TO_CHAR(F.DATADESLIGAMENTO,''YYYYMM'') > ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'11') +' OR SF.TIPOSIT <> ''D'')');
    Add('   GROUP BY');
    Add('     F.IDESTAB');
    Add('   --****');
    Add('   UNION');
    Add('   --****');
    Add('   SELECT');
    Add('     COUNT(*) AS EFETIVO, F.IDESTAB, ''12'' AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.IDSITFUNC = F.IDSITFUNC) AND');

    if (CmpRptCM.ParamByName('Mascara').asString <> '**********') then // Máscara do Centro de Custo
      for c:=1 to Length(Trim(CmpRptCM.ParamByName('Mascara').asString)) do
        if (Copy(CmpRptCM.ParamByName('Mascara').asString,c,1) <> '*')  then
          Add('     (SUBSTR(F.CODCENTROCUSTO, ' +IntToStr(c)+
              ', 1) = ' +QuotedStr(Copy(CmpRptCM.ParamByName('Mascara').asString,c,1))+ ') AND');

    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('     (F.IDPESSOA         = ' +CtrlUsoGeralRH.IdUsuarioGeral+ ') AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('     (F.CODCENTROCUSTO  IN (' +CtrlUsoGeralRH.UsuXCCusto+ ')) AND')
      else
        Add('     (F.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
        Add('     (F.IDESTAB         IN (' +CtrlUsoGeralRH.UsuXFilial+ ')) AND')
      else
        Add('     (F.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if not(CmpRptCM.ParamByName('Efet').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''E'') AND');
    if not(CmpRptCM.ParamByName('Efes').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''S'') AND');
    if not(CmpRptCM.ParamByName('Temp').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''T'') AND');
    if not(CmpRptCM.ParamByName('Estg').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''G'') AND');
    if not(CmpRptCM.ParamByName('Terc').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''3'') AND');
    if not(CmpRptCM.ParamByName('Prop').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''P'') AND');
    if not(CmpRptCM.ParamByName('Auto').asBoolean) then
      Add('     (F.TIPOCONTRATO <> ''A'') AND');

    Add('     (TO_CHAR(F.DATAADMISSAO,''YYYYMM'') <= ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'12') +') AND');
    Add('     (TO_CHAR(F.DATADESLIGAMENTO,''YYYYMM'') > ' +
      QuotedStr(CmpRptCM.ParamByName('Ano').asString+'12') +' OR SF.TIPOSIT <> ''D'')');
    Add('   GROUP BY');
    Add('     F.IDESTAB) E');
    Add('--****');
    Add('WHERE');

    if (CmpRptCM.ParamByName('ListaEstab').asString <> '') then
      if (Pos(',',CmpRptCM.ParamByName('ListaEstab').asString) > 0) then
        Add('  (E.IDESTAB IN (' +CmpRptCM.ParamByName('ListaEstab').asString+ ')) AND')
      else
        Add('  (E.IDESTAB = ' +CmpRptCM.ParamByName('ListaEstab').asString+ ') AND');

    Add('  (E.IDESTAB = PJ.IDPESSOA) AND');
    Add('  (E.IDESTAB = A.IDESTAB(+)) AND');
    Add('  (E.MESREF  = A.MESREF(+)) AND');
    Add('  (E.IDESTAB = D.IDESTAB(+)) AND');
    Add('  (E.MESREF  = D.MESREF(+))');
    Add('ORDER BY');
    Add('  EMPRESA, MESREF');

    SaveToFile('c:\qry.txt');
  end;
  CdsRotat.IndexName := '';
  sqlRotat.Open;

  GerarDadosRelat;
end;

procedure TRptRotat.rpRotatDtlBndBeforePrint(Sender: TObject);
begin
  rpRotatDtlBnd.Visible := (CmpRptCM.ParamByName('Ano').asInteger <> wAno) or
                           (CdsRotat.FieldByName('MesRef').asInteger <= wMes);
end;

procedure TRptRotat.GerarDadosRelat;
var
  sNomeMes, sNomeEstab: string;
  iNumEstab, iAdmissoes, iDemissoes, iEfetivo: integer;
begin
  iNumEstab := 0;
  CdsRotat.First;
  while not(CdsRotat.EOF) do
  begin
    sNomeEstab := CdsRotat.FieldByName('EMPRESA').asString;
    repeat
      CdsRotat.Next;
    until (CdsRotat.EOF) or (sNomeEstab <> CdsRotat.FieldByName('EMPRESA').asString);
    Inc(iNumEstab);
  end;
  CdsRotat.First;
  rpRotatSR1.Visible := (iNumEstab > 1);

  sqlRotat1.Open;
  if (iNumEstab > 1) then
  begin
    rpRotatSR1.DataPipeline := ppRotat1;
    CdsRotat.IndexName := 'CdsRotatIndex1';
    CdsRotat.First;
    repeat
      sNomeMes := CdsRotat.FieldByName('NOMEMES').asString;
      iAdmissoes := 0;
      iDemissoes := 0;
      iEfetivo := 0;
      repeat
        iAdmissoes := iAdmissoes + CdsRotat.FieldByName('ADMISSOES').asInteger;
        iDemissoes := iDemissoes + CdsRotat.FieldByName('DEMISSOES').asInteger;
        iEfetivo := iEfetivo + CdsRotat.FieldByName('EFETIVO').asInteger;
        CdsRotat.Next;
      until (CdsRotat.EOF) or (sNomeMes <> CdsRotat.FieldByName('NOMEMES').asString);
      CdsRotat1.Insert;
      CdsRotat1.FieldByName('NOMEMES').asString := sNomeMes;
      CdsRotat1.FieldByName('ANOREF').asInteger := CdsRotat.FieldByName('ANOREF').asInteger;
      CdsRotat1.FieldByName('ADMISSOES').asInteger := iAdmissoes;
      CdsRotat1.FieldByName('DEMISSOES').asInteger := iDemissoes;
      CdsRotat1.FieldByName('EFETIVO').asInteger := iEfetivo;
      if (iEfetivo = 0) then
        CdsRotat1.FieldByName('TURNOVER').asFloat := 0
      else
        CdsRotat1.FieldByName('TURNOVER').asFloat := (iDemissoes * 100 / iEfetivo);
      CdsRotat1.Post;
    until (CdsRotat.EOF);
    CdsRotat.IndexName := '';
    CdsRotat.First;
  end
  else
    rpRotatSR1.DataPipeline := nil;
end;

end.
