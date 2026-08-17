unit RContrat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppCtrls,
  ppBands, ppPrnabl, ppDB, ppCache, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt;

type
  TRptContrat = class(TFrmCmReport)
    rpContrat: TppReport;
    ppContrat: TppBDEPipeline;
    dsContrat: TwwDataSource;
    CdsContrat: TCMClientDataSet;
    sqlContrat: TCMSqlParams;
    rpContratHdrBnd: TppHeaderBand;
    rpContratDtlBnd: TppDetailBand;
    rpContratFootBnd: TppFooterBand;
    rpContratDBTxt1: TppDBText;
    rpContratLbl1: TppLabel;
    rpContratDBTxt2: TppDBText;
    rpContratGroup0: TppGroup;
    rpContratGrpHdrBnd: TppGroupHeaderBand;
    rpContratGrpFootBnd: TppGroupFooterBand;
    rpContratLbl4: TppLabel;
    rpContratLblEfet: TppLabel;
    rpContratLblEspec: TppLabel;
    rpContratLblTemp: TppLabel;
    rpContratLblEstag: TppLabel;
    rpContratLine1: TppLine;
    rpContratDBTxt3: TppDBText;
    rpContratDbEfet: TppDBText;
    rpContratDbEspec: TppDBText;
    rpContratDbTemp: TppDBText;
    rpContratDbEstag: TppDBText;
    rpContratLine2: TppLine;
    rpContratSumEfet: TppDBCalc;
    rpContratSumEspec: TppDBCalc;
    rpContratSumTemp: TppDBCalc;
    rpContratSumEstag: TppDBCalc;
    rpContratLbl9: TppLabel;
    rpContratLbl2: TppLabel;
    rpContratLbl3: TppLabel;
    rpContratSysVar1: TppSystemVariable;
    rpContratSysVar2: TppSystemVariable;
    rpContratSmryBnd: TppSummaryBand;
    rpContratSR1: TppSubReport;
    ppChildReport1: TppChildReport;
    sqlContrat1: TCMSqlParams;
    CdsContrat1: TCMClientDataSet;
    dsContrat1: TwwDataSource;
    ppContrat1: TppBDEPipeline;
    rpContratSRDtlBnd: TppDetailBand;
    rpContratSRSmryBnd: TppSummaryBand;
    rpContratSRLbl1: TppLabel;
    rpContratSRDbTxt6: TppDBText;
    rpContratSRLbl2: TppLabel;
    rpContratSRLine1: TppLine;
    rpContratSRLbl7: TppLabel;
    rpContratSRLbl8: TppLabel;
    rpContratSRSysVar1: TppSystemVariable;
    rpContratSRSysVar2: TppSystemVariable;
    rpContratSRDbTxt1: TppDBText;
    rpContratSRLine2: TppLine;
    rpContratSRLbl9: TppLabel;
    rpContratSRHdrBnd: TppHeaderBand;
    rpContratDbTerc: TppDBText;
    rpContratDbProp: TppDBText;
    rpContratDbAuto: TppDBText;
    ppDBText4: TppDBText;
    rpContratSumTerc: TppDBCalc;
    rpContratSumProp: TppDBCalc;
    rpContratSumAuto: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    rpContratLblTerc: TppLabel;
    rpContratLblProp: TppLabel;
    rpContratLblAuto: TppLabel;
    ppLabel4: TppLabel;
    rpLblEfet: TppLabel;
    rpLblEspec: TppLabel;
    rpLblTemp: TppLabel;
    rpLblEstag: TppLabel;
    rpLblTerc: TppLabel;
    rpLblProp: TppLabel;
    rpLblAuto: TppLabel;
    ppLabel12: TppLabel;
    rpDbEfet: TppDBText;
    rpDbEspec: TppDBText;
    rpDbTemp: TppDBText;
    rpDbEstag: TppDBText;
    rpDbTerc: TppDBText;
    rpDbProp: TppDBText;
    rpDbAuto: TppDBText;
    ppDBText12: TppDBText;
    rpSumEfet: TppDBCalc;
    rpSumEspec: TppDBCalc;
    rpSumTemp: TppDBCalc;
    rpSumEstag: TppDBCalc;
    rpSumTerc: TppDBCalc;
    rpSumProp: TppDBCalc;
    rpSumAuto: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpContratDtlBndBeforePrint(Sender: TObject);
  private
    wAno, wMes, wDia: word;
    procedure GerarDadosRelTotal;
  end;

var
  RptContrat: TRptContrat;

implementation

uses uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptContrat.CrmRptCMBeforePrint(Sender: TObject);
var
  c: integer;
begin
  inherited;
  Decodedate(Date, wAno, wMes, wDia);
  with (sqlContrat.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ.NOME AS EMPRESA, E.MESREF, NVL(E.EFETIVOS,0) AS EFETIVOS,');
    Add('  NVL(S.EFETESPECS,0) AS EFETESPECS, NVL(T.TEMPORARIOS,0) AS TEMPORARIOS,');
    Add('  NVL(G.ESTAGIARIOS,0) AS ESTAGIARIOS, NVL(R.TERCEIROS,0) AS TERCEIROS,');
    Add('  NVL(P.PROPRIETARIOS,0) AS PROPRIETARIOS, NVL(A.AUTONOMOS,0) AS AUTONOMOS,');
    Add('  NVL(E.EFETIVOS,0) + NVL(S.EFETESPECS,0) + NVL(T.TEMPORARIOS,0) + ');
    Add('  NVL(G.ESTAGIARIOS,0) + NVL(R.TERCEIROS,0) + ');
    Add('  NVL(P.PROPRIETARIOS,0) + NVL(A.AUTONOMOS,0) AS TOTAL,');
    Add('  DECODE(TO_NUMBER(E.MESREF),1,''Janeiro'',2,''Fevereiro'',3,''Março'',4,''Abril'',');
    Add('  5,''Maio'',6,''Junho'',7,''Julho'',8,''Agosto'',9,''Setembro'',10,''Outubro'',');
    Add('  11,''Novembro'',''Dezembro'') AS NOMEMES,');
    Add('  ' +CmpRptCM.ParamByName('Ano').asString+ ' AS ANOREF');
    Add('FROM');
    Add('  PESSOA PJ,');

    // Efetivos
    Add('  (SELECT');
    Add('     COUNT(*) AS EFETIVOS, IDESTAB, TO_CHAR(DATAADMISSAO,''MM'') AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO');
    Add('   WHERE (TIPOCONTRATO = ''E'') AND');

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
    Add('     IDESTAB, TO_CHAR(DATAADMISSAO,''MM'')) E,');
    Add('  --****');
    // Efetivos Especiais
    Add('  (SELECT');
    Add('     COUNT(*) AS EFETESPECS, IDESTAB, TO_CHAR(DATAADMISSAO,''MM'') AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO');
    Add('   WHERE (TIPOCONTRATO = ''S'') AND');

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
    Add('     IDESTAB, TO_CHAR(DATAADMISSAO,''MM'')) S,');
    Add('  --****');
    // Temporários
    Add('  (SELECT');
    Add('     COUNT(*) AS TEMPORARIOS, IDESTAB, TO_CHAR(DATAADMISSAO,''MM'') AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO');
    Add('   WHERE (TIPOCONTRATO = ''T'') AND');

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
    Add('     IDESTAB, TO_CHAR(DATAADMISSAO,''MM'')) T,');
    Add('  --****');
    // Estagiários
    Add('  (SELECT');
    Add('     COUNT(*) AS ESTAGIARIOS, IDESTAB, TO_CHAR(DATAADMISSAO,''MM'') AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO');
    Add('   WHERE (TIPOCONTRATO = ''G'') AND');

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
    Add('     IDESTAB, TO_CHAR(DATAADMISSAO,''MM'')) G,');
    Add('  --****');
    // Terceiros
    Add('  (SELECT');
    Add('     COUNT(*) AS TERCEIROS, IDESTAB, TO_CHAR(DATAADMISSAO,''MM'') AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO');
    Add('   WHERE (TIPOCONTRATO = ''3'') AND');

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
    Add('     IDESTAB, TO_CHAR(DATAADMISSAO,''MM'')) R,');
    Add('  --****');
    // Proprietários
    Add('  (SELECT');
    Add('     COUNT(*) AS PROPRIETARIOS, IDESTAB, TO_CHAR(DATAADMISSAO,''MM'') AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO');
    Add('   WHERE (TIPOCONTRATO = ''P'') AND');

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
    Add('     IDESTAB, TO_CHAR(DATAADMISSAO,''MM'')) P,');
    Add('  --****');
    // Autônomos
    Add('  (SELECT');
    Add('     COUNT(*) AS AUTONOMOS, IDESTAB, TO_CHAR(DATAADMISSAO,''MM'') AS MESREF');
    Add('   FROM');
    Add('     FUNCIONARIO');
    Add('   WHERE (TIPOCONTRATO = ''A'') AND');

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
    Add('     IDESTAB, TO_CHAR(DATAADMISSAO,''MM'')) A');
    Add('--****');
    Add('WHERE');

    if (CmpRptCM.ParamByName('ListaEstab').asString <> '') then
      if (Pos(',',CmpRptCM.ParamByName('ListaEstab').asString) > 0) then
        Add('  (E.IDESTAB IN (' +CmpRptCM.ParamByName('ListaEstab').asString+ ')) AND')
      else
        Add('  (E.IDESTAB = ' +CmpRptCM.ParamByName('ListaEstab').asString+ ') AND');

    if (CmpRptCM.ParamByName('Efet').asBoolean) then
    begin
      Add('    (E.IDESTAB = PJ.IDPESSOA) AND');
      Add('    (E.MESREF  = S.MESREF(+)) AND');
      Add('    (E.MESREF  = T.MESREF(+)) AND');
      Add('    (E.MESREF  = G.MESREF(+)) AND');
      Add('    (E.MESREF  = R.MESREF(+)) AND');
      Add('    (E.MESREF  = P.MESREF(+)) AND');
      Add('    (E.MESREF  = A.MESREF(+)) AND');
    end
    else if (CmpRptCM.ParamByName('Efes').asBoolean) then
    begin
      Add('    (S.IDESTAB = PJ.IDPESSOA) AND');
      Add('    (S.MESREF  = E.MESREF(+)) AND');
      Add('    (S.MESREF  = T.MESREF(+)) AND');
      Add('    (S.MESREF  = G.MESREF(+)) AND');
      Add('    (S.MESREF  = R.MESREF(+)) AND');
      Add('    (S.MESREF  = P.MESREF(+)) AND');
      Add('    (S.MESREF  = A.MESREF(+)) AND');
    end
    else if (CmpRptCM.ParamByName('Temp').asBoolean) then
    begin
      Add('    (T.IDESTAB = PJ.IDPESSOA) AND');
      Add('    (T.MESREF  = S.MESREF(+)) AND');
      Add('    (T.MESREF  = E.MESREF(+)) AND');
      Add('    (T.MESREF  = G.MESREF(+)) AND');
      Add('    (T.MESREF  = R.MESREF(+)) AND');
      Add('    (T.MESREF  = P.MESREF(+)) AND');
      Add('    (T.MESREF  = A.MESREF(+)) AND');
    end
    else if (CmpRptCM.ParamByName('Estg').asBoolean) then
    begin
      Add('    (G.IDESTAB = PJ.IDPESSOA) AND');
      Add('    (G.MESREF  = S.MESREF(+)) AND');
      Add('    (G.MESREF  = T.MESREF(+)) AND');
      Add('    (G.MESREF  = E.MESREF(+)) AND');
      Add('    (G.MESREF  = R.MESREF(+)) AND');
      Add('    (G.MESREF  = P.MESREF(+)) AND');
      Add('    (G.MESREF  = A.MESREF(+)) AND');
    end
    else if (CmpRptCM.ParamByName('Terc').asBoolean) then
    begin
      Add('    (R.IDESTAB = PJ.IDPESSOA) AND');
      Add('    (R.MESREF  = S.MESREF(+)) AND');
      Add('    (R.MESREF  = T.MESREF(+)) AND');
      Add('    (R.MESREF  = G.MESREF(+)) AND');
      Add('    (R.MESREF  = E.MESREF(+)) AND');
      Add('    (R.MESREF  = P.MESREF(+)) AND');
      Add('    (R.MESREF  = A.MESREF(+)) AND');
    end
    else if (CmpRptCM.ParamByName('Prop').asBoolean) then
    begin
      Add('    (P.IDESTAB = PJ.IDPESSOA) AND');
      Add('    (P.MESREF  = S.MESREF(+)) AND');
      Add('    (P.MESREF  = T.MESREF(+)) AND');
      Add('    (P.MESREF  = G.MESREF(+)) AND');
      Add('    (P.MESREF  = R.MESREF(+)) AND');
      Add('    (P.MESREF  = E.MESREF(+)) AND');
      Add('    (P.MESREF  = A.MESREF(+)) AND');
    end
    else if (CmpRptCM.ParamByName('Auto').asBoolean) then
    begin
      Add('    (A.IDESTAB = PJ.IDPESSOA) AND');
      Add('    (A.MESREF  = S.MESREF(+)) AND');
      Add('    (A.MESREF  = T.MESREF(+)) AND');
      Add('    (A.MESREF  = G.MESREF(+)) AND');
      Add('    (A.MESREF  = R.MESREF(+)) AND');
      Add('    (A.MESREF  = P.MESREF(+)) AND');
      Add('    (A.MESREF  = E.MESREF(+)) AND');
    end;
    Add('    (1 = 1)');
    Add('ORDER BY');
    Add('  EMPRESA, MESREF');

    SaveToFile('c:\qry.txt');
  end;
  CdsContrat.IndexName := '';
  sqlContrat.Open;

  GerarDadosRelTotal;

  if (CmpRptCM.ParamByName('Efet').asBoolean) then
  begin
    rpContratLblEfet.Font.Color := clBlack;
    rpContratDbEfet.Font.Color  := clBlack;
    rpContratSumEfet.Font.Color := clBlack;
    rpLblEfet.Font.Color := clBlack;
    rpDbEfet.Font.Color  := clBlack;
    rpSumEfet.Font.Color := clBlack;
  end
  else
  begin
    rpContratLblEfet.Font.Color := clSilver;
    rpContratDbEfet.Font.Color  := clSilver;
    rpContratSumEfet.Font.Color := clSilver;
    rpLblEfet.Font.Color := clSilver;
    rpDbEfet.Font.Color  := clSilver;
    rpSumEfet.Font.Color := clSilver;
  end;

  if (CmpRptCM.ParamByName('Efes').asBoolean) then
  begin
    rpContratLblEspec.Font.Color := clBlack;
    rpContratDbEspec.Font.Color  := clBlack;
    rpContratSumEspec.Font.Color := clBlack;
    rpLblEspec.Font.Color := clBlack;
    rpDbEspec.Font.Color  := clBlack;
    rpSumEspec.Font.Color := clBlack;
  end
  else
  begin
    rpContratLblEspec.Font.Color := clSilver;
    rpContratDbEspec.Font.Color  := clSilver;
    rpContratSumEspec.Font.Color := clSilver;
    rpLblEspec.Font.Color := clSilver;
    rpDbEspec.Font.Color  := clSilver;
    rpSumEspec.Font.Color := clSilver;
  end;

  if (CmpRptCM.ParamByName('Temp').asBoolean) then
  begin
    rpContratLblTemp.Font.Color := clBlack;
    rpContratDbTemp.Font.Color  := clBlack;
    rpContratSumTemp.Font.Color := clBlack;
    rpLblTemp.Font.Color := clBlack;
    rpDbTemp.Font.Color  := clBlack;
    rpSumTemp.Font.Color := clBlack;
  end
  else
  begin
    rpContratLblTemp.Font.Color := clSilver;
    rpContratDbTemp.Font.Color  := clSilver;
    rpContratSumTemp.Font.Color := clSilver;
    rpLblTemp.Font.Color := clSilver;
    rpDbTemp.Font.Color  := clSilver;
    rpSumTemp.Font.Color := clSilver;
  end;

  if (CmpRptCM.ParamByName('Estg').asBoolean) then
  begin
    rpContratLblEstag.Font.Color := clBlack;
    rpContratDbEstag.Font.Color  := clBlack;
    rpContratSumEstag.Font.Color := clBlack;
    rpLblEstag.Font.Color := clBlack;
    rpDbEstag.Font.Color  := clBlack;
    rpSumEstag.Font.Color := clBlack;
  end
  else
  begin
    rpContratLblEstag.Font.Color := clSilver;
    rpContratDbEstag.Font.Color  := clSilver;
    rpContratSumEstag.Font.Color := clSilver;
    rpLblEstag.Font.Color := clSilver;
    rpDbEstag.Font.Color  := clSilver;
    rpSumEstag.Font.Color := clSilver;
  end;

  if (CmpRptCM.ParamByName('Terc').asBoolean) then
  begin
    rpContratLblTerc.Font.Color := clBlack;
    rpContratDbTerc.Font.Color  := clBlack;
    rpContratSumTerc.Font.Color := clBlack;
    rpLblTerc.Font.Color := clBlack;
    rpDbTerc.Font.Color  := clBlack;
    rpSumTerc.Font.Color := clBlack;
  end
  else
  begin
    rpContratLblTerc.Font.Color := clSilver;
    rpContratDbTerc.Font.Color  := clSilver;
    rpContratSumTerc.Font.Color := clSilver;
    rpLblTerc.Font.Color := clSilver;
    rpDbTerc.Font.Color  := clSilver;
    rpSumTerc.Font.Color := clSilver;
  end;

  if (CmpRptCM.ParamByName('Prop').asBoolean) then
  begin
    rpContratLblProp.Font.Color := clBlack;
    rpContratDbProp.Font.Color  := clBlack;
    rpContratSumProp.Font.Color := clBlack;
    rpLblProp.Font.Color := clBlack;
    rpDbProp.Font.Color  := clBlack;
    rpSumProp.Font.Color := clBlack;
  end
  else
  begin
    rpContratLblProp.Font.Color := clSilver;
    rpContratDbProp.Font.Color  := clSilver;
    rpContratSumProp.Font.Color := clSilver;
    rpLblProp.Font.Color := clSilver;
    rpDbProp.Font.Color  := clSilver;
    rpSumProp.Font.Color := clSilver;
  end;

  if (CmpRptCM.ParamByName('Auto').asBoolean) then
  begin
    rpContratLblAuto.Font.Color := clBlack;
    rpContratDbAuto.Font.Color  := clBlack;
    rpContratSumAuto.Font.Color := clBlack;
    rpLblAuto.Font.Color := clBlack;
    rpDbAuto.Font.Color  := clBlack;
    rpSumAuto.Font.Color := clBlack;
  end
  else
  begin
    rpContratLblAuto.Font.Color := clSilver;
    rpContratDbAuto.Font.Color  := clSilver;
    rpContratSumAuto.Font.Color := clSilver;
    rpLblAuto.Font.Color := clSilver;
    rpDbAuto.Font.Color  := clSilver;
    rpSumAuto.Font.Color := clSilver;
  end;

end;

procedure TRptContrat.rpContratDtlBndBeforePrint(Sender: TObject);
begin
  rpContratDtlBnd.Visible := (CmpRptCM.ParamByName('Ano').asInteger <> wAno) or
                           (CdsContrat.FieldByName('MesRef').asInteger <= wMes);
end;

procedure TRptContrat.GerarDadosRelTotal;
var
  sNomeMes, sNomeEstab: string;
  iNumEstab, iEfetivos, iEfetEspecs, iTemporarios, iEstagiarios, iTerceiros,
  iProprietarios, iAutonomos, iTotal: integer;
begin
  iNumEstab := 0;
  CdsContrat.First;
  while not(CdsContrat.EOF) do
  begin
    sNomeEstab := CdsContrat.FieldByName('EMPRESA').asString;
    repeat
      CdsContrat.Next;
    until (CdsContrat.EOF) or (sNomeEstab <> CdsContrat.FieldByName('EMPRESA').asString);
    Inc(iNumEstab);
  end;
  CdsContrat.First;
  rpContratSR1.Visible := (iNumEstab > 1);

  sqlContrat1.Open;
  if (iNumEstab > 1) then
  begin
    rpContratSR1.DataPipeline := ppContrat1;
    CdsContrat.IndexName := 'CdsContratIndex1';
    CdsContrat.First;
    repeat
      sNomeMes := CdsContrat.FieldByName('NOMEMES').asString;
      iEfetivos := 0;  iEfetEspecs := 0;    iTemporarios := 0; iEstagiarios := 0;
      iTerceiros := 0; iProprietarios := 0; iAutonomos := 0;   iTotal := 0;
      repeat
        iEfetivos      := iEfetivos + CdsContrat.FieldByName('Efetivos').asInteger;
        iEfetEspecs    := iEfetEspecs + CdsContrat.FieldByName('EfetEspecs').asInteger;
        iTemporarios   := iTemporarios + CdsContrat.FieldByName('Temporarios').asInteger;
        iEstagiarios   := iEstagiarios + CdsContrat.FieldByName('Estagiarios').asInteger;
        iTerceiros     := iTerceiros + CdsContrat.FieldByName('Terceiros').asInteger;
        iProprietarios := iProprietarios + CdsContrat.FieldByName('Proprietarios').asInteger;
        iAutonomos     := iAutonomos + CdsContrat.FieldByName('Autonomos').asInteger;
        iTotal         := iTotal + CdsContrat.FieldByName('Total').asInteger;
        CdsContrat.Next;
      until (CdsContrat.EOF) or (sNomeMes <> CdsContrat.FieldByName('NOMEMES').asString);
      CdsContrat1.Insert;
      CdsContrat1.FieldByName('NOMEMES').asString := sNomeMes;
      CdsContrat1.FieldByName('ANOREF').asInteger := CdsContrat.FieldByName('ANOREF').asInteger;
      CdsContrat1.FieldByName('Efetivos').asInteger      := iEfetivos;
      CdsContrat1.FieldByName('EfetEspecs').asInteger    := iEfetEspecs;
      CdsContrat1.FieldByName('Temporarios').asInteger   := iTemporarios;
      CdsContrat1.FieldByName('Estagiarios').asInteger   := iEstagiarios;
      CdsContrat1.FieldByName('Terceiros').asInteger     := iTerceiros;
      CdsContrat1.FieldByName('Proprietarios').asInteger := iProprietarios;
      CdsContrat1.FieldByName('Autonomos').asInteger     := iAutonomos;
      CdsContrat1.FieldByName('Total').asInteger         := iTotal;
      CdsContrat1.Post;
    until (CdsContrat.EOF);
    CdsContrat.IndexName := '';
    CdsContrat.First;
  end
  else
    rpContratSR1.DataPipeline := nil;
end;

end.
