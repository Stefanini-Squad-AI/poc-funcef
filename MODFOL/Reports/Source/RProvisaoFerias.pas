// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RProvisaoFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient,
  uCMClientDataSet, uCmSqlParams, IvDictio, IvMulti, uCtrlDiasTrab,
  TXRB;

type
  TRptProvisaoFerias = class(TFrmCmReport)
    rpProvisaoFerias: TppReport;
    HdrBnd: TppHeaderBand;
    Lbl1: TppLabel;
    DBTxt1: TppDBText;
    Line1: TppLine;
    Lbl3: TppLabel;
    Calc1: TppCalc;
    Lbl4: TppLabel;
    Calc2: TppCalc;
    Lbl6: TppLabel;
    Lbl7: TppLabel;
    Lbl11: TppLabel;
    Lbl8: TppLabel;
    Lbl10: TppLabel;
    Lbl9: TppLabel;
    Lbl5: TppLabel;
    rpProvisaoFeriasLblMESREF: TppLabel;
    DtlBnd: TppDetailBand;
    DBTxt4: TppDBText;
    DBTxt5: TppDBText;
    FootBnd: TppFooterBand;
    SmryBnd: TppSummaryBand;
    Group1: TppGroup;
    GrpHdrBnd1: TppGroupHeaderBand;
    GrpFootBnd1: TppGroupFooterBand;
    ppProvisaoFerias: TppBDEPipeline;
    dsProvisaoFerias: TwwDataSource;
    sqlProvisaoFerias: TCMSqlParams;
    CdsProvisaoFerias: TCMClientDataSet;
    sqlValorRubrica: TCMSqlParams;
    CdsValorRubrica: TCMClientDataSet;
    DBTxt6: TppDBText;
    DBTxt7: TppDBText;
    DBTxt8: TppDBText;
    DBTxt9: TppDBText;
    Group0: TppGroup;
    GrpHdrBnd0: TppGroupHeaderBand;
    GrpFootBnd0: TppGroupFooterBand;
    Line2: TppLine;
    Lbl13: TppLabel;
    Lbl14: TppLabel;
    Lbl18: TppLabel;
    Lbl15: TppLabel;
    Lbl17: TppLabel;
    Lbl16: TppLabel;
    Lbl12: TppLabel;
    DBTxt3: TppDBText;
    DBCalc1: TppDBCalc;
    DBCalc2: TppDBCalc;
    DBCalc3: TppDBCalc;
    Line3: TppLine;
    Lbl19: TppLabel;
    DBCalc4: TppDBCalc;
    DBCalc5: TppDBCalc;
    DBCalc6: TppDBCalc;
    Line4: TppLine;
    Lbl20: TppLabel;
    DBCalc7: TppDBCalc;
    DBCalc8: TppDBCalc;
    DBCalc9: TppDBCalc;
    Line5: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    DBTxt10: TppDBText;
    CdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure SmryBndAfterPrint(Sender: TObject);
    procedure CdsProvisaoFeriasAfterScroll(DataSet: TDataSet);
  private
    DataRef: TDate;
    CtrlDiasTrab: TCtrlDiasTrab;

    procedure AbrirQueryValorRubrica;
    function  MontarJoin_Provento_X_TipoFolha(ListaRubricas: string): string;
    function  GetValorBase: double;
    function  CalcularAvos: double;
    function  CalcularSaldo(Avos: double): double;
    function  CalcularEncargo(Saldo: double): double;
    procedure GerarDadosRelat;
    procedure ConfigurarLayoutRelat;
  end;

var
  RptProvisaoFerias: TRptProvisaoFerias;

implementation

uses uSistema, uCMTypes, uCtrlPadroes, uCtrlFuncoesRH, fAguarde,
  uCtrlUsoGeralRH;


  {$R *.DFM}

procedure TRptProvisaoFerias.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  CtrlDiasTrab := TCtrlDiasTrab.Create;
  CtrlDiasTrab.InitializeAs(Padroes);
  try
    DataRef := CmpRptCM.ParamByName('DataBase').asDateTime;

    // Montar Query Auxiliar
    with (sqlAux.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  PJ.IDPESSOA AS IDESTAB,');
      Add('  PJ.RAZAOSOCIAL AS NOME_ESTAB,');
      Add('  F.MATRICULA,');
      Add('  F.CODCENTROCUSTO,');
      Add('  CC.NOME AS NOME_CENTROCUSTO,');
      Add('  F.IDPESSOA,');
      Add('  PF.NOME AS EMPREGADO,');
      Add('  SF.TIPOSIT AS SITUACAO,');
      Add('  (CASE');
      Add('     WHEN ULT_FERIAS.NUM IS NULL THEN TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'')');
      Add('     ELSE TO_CHAR(ADD_MONTHS(ULT_FERIAS.NUM,12),''DD/MM/YYYY'')');
      Add('   END) AS DATAREF,');
      Add('  NVL(DF.NUM,0) AS DIASFERIAS_PENDENTES');
      // --------------------------------------------------------------------------------- //
      Add('FROM');
      Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, CENTCUST CC, SITFUNC SF,');
      // --------------------------------------------------------------------------------- //
      Add('  (SELECT');
      Add('     IDPESSOA,');
      Add('     MOD(SUM((TO_NUMBER(FIMGOZOFERIAS - INIGOZOFERIAS) + 1 +');
      //Add('       FLGABONO * QTDIASABONO) * DECODE(INDCOMPLETA,0,1,0)),' +IntToStr(DIAS_CORRIDOS)+ ') AS NUM');
      Add('       FLGABONO * QTDIASABONO)),' +IntToStr(DIAS_CORRIDOS)+ ') AS NUM'); // P/ EVITAR O CAMPO INDCOMPLETA
      Add('   FROM');
      Add('     FERIAS');
      Add('   WHERE');
      Add('     (FLGOCORRIDA    = 1) AND');
      Add('     (INIGOZOFERIAS <= TO_DATE(' +QuotedStr(FormatDateTime('DD/MM/YYYY',DataRef))+ ',''DD/MM/YYYY''))');
      Add('   GROUP BY');
      Add('     IDPESSOA) DF,');
      // --------------------------------------------------------------------------------- //
      // Últimas férias gozadas de cada pessoa
      Add('  (SELECT');
      Add('     IDPESSOA, MAX(INIPERIODOFERIAS) AS NUM');
      Add('   FROM');
      Add('     FERIAS'); 
      Add('   WHERE');
      Add('     (FLGOCORRIDA    = 1) AND');
      Add('     (INIGOZOFERIAS <= TO_DATE(' +QuotedStr(FormatDateTime('DD/MM/YYYY',DataRef))+ ',''DD/MM/YYYY''))');
      Add('   GROUP BY');
      Add('     IDPESSOA) ULT_FERIAS');
      // --------------------------------------------------------------------------------- //
      if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      begin
        Add('WHERE');
        Add(FU.QuebrarListaFiltro(2,'(F.IDPESSOA       ',CmpRptCM.ParamByName('ListaIdFunc').asString,50)+ ' AND');
        Add('  (SF.IDSITFUNC      = F.IDSITFUNC) AND');
      end
      else
      // Buscar de acordo com a última evolução/alteração Funcional da Pessoa
      if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
      begin
        // Histórico da Evolução Funcional
        Add('  ,');
        Add('  (SELECT EF.IDPESSOA, EF.IDESTAB, EF.IDEMPRESA, EF.CODCENTROCUSTO');
        Add('   FROM   EVOLFUNC EF,');
        Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
        Add('           FROM   EVOLFUNC');
        Add('           WHERE  (DATAALTERFUNC <= TO_DATE(' +
          QuotedStr(FormatDateTime('DD/MM/YYYY',DataRef))+ ',''DD/MM/YYYY''))');
        Add('           GROUP BY IDPESSOA) HST2,');
        Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
        Add('           FROM   EVOLFUNC');
        Add('           WHERE  (DATAALTERFUNC <= TO_DATE(' +
          QuotedStr(FormatDateTime('DD/MM/YYYY',DataRef))+ ',''DD/MM/YYYY''))');
        Add('           GROUP BY IDPESSOA) HST3');
        Add('   WHERE  (EF.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
        Add('          (EF.IDPESSOA      = HST2.IDPESSOA) AND');
        Add('          (EF.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
        Add('          (EF.IDPESSOA      = HST3.IDPESSOA)) HST_EVOL,');
        // Histórico da Situação Funcional
        Add('  (SELECT H.IDPESSOA, H.IDSITFUNC');
        Add('   FROM   HSTSITFUNC H,');
        Add('          (SELECT MAX(DATASITFUNC) AS DATASITFUNC, IDPESSOA');
        Add('           FROM   HSTSITFUNC');
        Add('           WHERE  (DATASITFUNC <= TO_DATE(' +
          QuotedStr(FormatDateTime('DD/MM/YYYY',DataRef))+ ',''DD/MM/YYYY''))');
        Add('           GROUP BY IDPESSOA) HST2,');
        Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
        Add('           FROM   HSTSITFUNC');
        Add('           WHERE  (DATASITFUNC <= TO_DATE(' +
          QuotedStr(FormatDateTime('DD/MM/YYYY',DataRef))+ ',''DD/MM/YYYY''))');
        Add('           GROUP BY IDPESSOA) HST3');
        Add('   WHERE  (H.DATASITFUNC   = HST2.DATASITFUNC) AND');
        Add('          (H.IDPESSOA      = HST2.IDPESSOA) AND');
        Add('          (H.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
        Add('          (H.IDPESSOA      = HST3.IDPESSOA)) HST_SIT');
        Add('WHERE');
        Add(FU.MontaLinhaSelSQL('  (SF.TIPOSIT',CmpRptCM.ParamByName('SitFunc').asString,7));
        Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',CmpRptCM.ParamByName('TipoContrato').asString,3));
        Add('  (F.DATAADMISSAO   <= TO_DATE(' +
          QuotedStr(FormatDateTime('DD/MM/YYYY',DataRef))+ ',''DD/MM/YYYY'')) AND');

        Add(FU.MontaLinhaSelSQL(
          '  (CASE'+CR_LF+
          '     WHEN HST_EVOL.IDESTAB IS NULL THEN F.IDESTAB'+CR_LF+
          '     ELSE HST_EVOL.IDESTAB'+CR_LF+
          '   END',CmpRptCM.ParamByName('ListaIdEstab').asString,12));

        if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        begin
          Add(FU.MontaLinhaSelSQL(
            '  (LTRIM(RTRIM(CASE'+CR_LF+
            '                 WHEN HST_EVOL.CODCENTROCUSTO IS NULL THEN F.CODCENTROCUSTO'+CR_LF+
            '                 ELSE HST_EVOL.CODCENTROCUSTO'+CR_LF+
            '               END))',CtrlUsoGeralRH.UsuXCCusto,1));
          Add('  (CASE');
          Add('     WHEN HST_EVOL.IDEMPRESA IS NULL THEN F.IDEMPRESA');
          Add('     ELSE HST_EVOL.IDEMPRESA');
          Add('   END            = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
        end;

        Add('  (CASE');
        Add('     WHEN HST_SIT.IDSITFUNC IS NULL THEN F.IDSITFUNC');
        Add('     ELSE HST_SIT.IDSITFUNC');
        Add('   END               = SF.IDSITFUNC) AND');
      end
      else
      begin
        Add('WHERE');
        Add(FU.MontaLinhaSelSQL('  (SF.TIPOSIT',CmpRptCM.ParamByName('SitFunc').asString,7));
        Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',CmpRptCM.ParamByName('TipoContrato').asString,3));
        Add(FU.MontaLinhaSelSQL('  (F.IDESTAB',CmpRptCM.ParamByName('ListaIdEstab').asString,8));

        if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        begin
          Add(FU.MontaLinhaSelSQL(
            '  (LTRIM(RTRIM(F.CODCENTROCUSTO))',CtrlUsoGeralRH.UsuXCCusto,1));
          Add('  (F.IDEMPRESA    = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
        end;

        Add('  (SF.IDSITFUNC      = F.IDSITFUNC) AND');
      end;

      Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
      Add('  (F.IDEMPRESA       = CC.IDEMPRESA) AND');
      Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
      Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
      Add('  (F.IDPESSOA        = ULT_FERIAS.IDPESSOA(+)) AND');

      if not(CmpRptCM.ParamByName('BuscaHist').asBoolean) or
            (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
        Add('  (F.IDPESSOA        = DF.IDPESSOA(+))')
      else
      begin
        Add('  (F.IDPESSOA        = DF.IDPESSOA(+)) AND');
        Add('  (F.IDPESSOA        = HST_EVOL.IDPESSOA(+)) AND');
        Add('  (F.IDPESSOA        = HST_SIT.IDPESSOA(+))');
      end;

      Add('ORDER BY');
      case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
        0 : Add('  IDESTAB, EMPREGADO');
        1 : Add('  IDESTAB, MATRICULA');
        2 : Add('  IDESTAB, NOME_CENTROCUSTO, EMPREGADO');
        3 : Add('  IDESTAB, NOME_CENTROCUSTO, MATRICULA');
      end;
      SaveToFile(FU.DirTempLog + '\qry.txt');
    end;

    GerarDadosRelat;

    frmAguarde.Min := 0;
    frmAguarde.Max := CdsProvisaoFerias.RecordCount;
    ConfigurarLayoutRelat;
  finally
    CtrlDiasTrab.Free;
  end;
end;

procedure TRptProvisaoFerias.CdsProvisaoFeriasAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptProvisaoFerias.SmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptProvisaoFerias.AbrirQueryValorRubrica;
var
  sListaIdFunc: string; 
begin
  sListaIdFunc := '';
  repeat
    FU.InserirCodigoEm(sListaIdFunc, CdsAux.FieldByName('IDPESSOA').asString);
    CdsAux.Next;
  until (CdsAux.EOF);
  CdsAux.First;

  with (sqlValorRubrica.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  H.IDPESSOA,');
    Add('  SUM(DECODE(PD.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO)) AS VALOR');
    Add('FROM');
    Add('  HISTRUBSAL H, PROVDESC PD,');
    Add('  (SELECT IDPESSOA');
    Add('   FROM   FUNCIONARIO');
    Add('   WHERE');
    Add(FU.QuebrarListaFiltro(5, '(IDPESSOA',sListaIdFunc,50));
    Add('  ) F');
    Add('WHERE');
    Add('  (H.MES            = ' +QuotedStr(FormatDateTime('YYYY/MM',DataRef))+ ') AND');
    Add(MontarJoin_Provento_X_TipoFolha(CmpRptCM.ParamByName('ListaIdRubrica').asString));
    Add('  (F.IDPESSOA       = H.IDPESSOA) AND');
    Add('  (PD.IDPROVENTO    = H.IDRUBRICA)');
    Add('GROUP BY');
    Add('  H.IDPESSOA');
  end;

  //sqlValorRubrica.SQL.SaveToFile('c:\qry1.txt');
  sqlValorRubrica.SQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry1.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sqlValorRubrica.Open;
  CdsValorRubrica.Filter := '';
  CdsValorRubrica.Filtered := true;
end;

function TRptProvisaoFerias.MontarJoin_Provento_X_TipoFolha(ListaRubricas: string): string;
var
  iPos: integer;
  sRubrica, sCodRubrica, sCodTipFol, sListaIdRub: string;
begin
  Result := '';
  sListaIdRub := '';
  while (ListaRubricas <> '') do
  begin
    FU.ExtraiString(ListaRubricas, sRubrica, ',');

    iPos := Pos('=', sRubrica);
    // Pegar o Código da Rubrica Atual
    sCodRubrica := QuotedStr(Copy(sRubrica, 1, iPos-1));
    // Pegar o Código do Tipo de Folha Atual
    sCodTipFol := Copy(sRubrica, iPos+1, Length(sRubrica) - iPos+1);

    if (sCodTipFol = '') then
      FU.InserirCodigoEm(sListaIdRub, sCodRubrica)
    else
      Result := Result + FU.IFF(Result = '', '', CR_LF+ '    OR')+CR_LF+
        '    ((H.CODPROVDESC = ' +sCodRubrica+ ') AND'+CR_LF+
        '     (H.IDMOTIVO    = ' +sCodTipFol+ '))'
  end;

  if (sListaIdRub <> '') then
    Result :=
      FU.MontaLinhaSelSQL('    (H.CODPROVDESC', sListaIdRub, 1, false)+
      FU.IFF(Result = '', '', CR_LF+ '    OR' +Result);

  if (Result <> '') then
    Result := '  ('+CR_LF +Result+ CR_LF+'  ) AND';
end;

function TRptProvisaoFerias.GetValorBase: double;
begin
  CdsValorRubrica.Filter := 'IDPESSOA = ' + CdsAux.FieldByName('IDPESSOA').asString;
  Result := CdsValorRubrica.FieldByName('VALOR').asFloat;
end;

function TRptProvisaoFerias.CalcularAvos: double;
var
  DataIniPerAquis: TDate;
  iDifDias, iAvoDifDias, iDiasPend, iDias, iMeses,iAnos: integer;
begin
  // Obter o início do período aquisitivo em aberto descontando o período de afastamento
  DataIniPerAquis := CtrlDiasTrab.GetDataIniPerAquis(CdsAux.FieldByName('IDPESSOA').asFloat,
    CdsAux.FieldByName('DATAREF').asDateTime, DataRef);

  // Caso o usuário tenha selecionado para fazer o cálculo sobre incremento, a quantidade
  // de avos deve ser:
  // -> Igual a 0 - caso a pessoa ainda esteja afastada ou tenha retornado a menos de 15 dias
  // -> Igual a 1 - caso contrário
  if (CmpRptCM.ParamByName('TipoCalc').asInteger = 1) then
  begin
    // Calcular o número de dias entre o início do período aquisitivo e a data base
    // informada pelo usuário
    if (FU.ExtraiDia(DataRef) < FU.ExtraiDia(DataIniPerAquis)) then
      iDifDias := Round(DataRef - DataIniPerAquis)
    else
      iDifDias := Round(DataRef + 1 - DataIniPerAquis);

    if (CdsAux.FieldByName('SITUACAO').asString = 'F') or (iDifDias < 15) then
      Result := 0
    else
      Result := 1;
  end
  else
  begin
    // Calcular o número de dias pendentes das férias já gozadas
    if (CdsAux.FieldByName('DIASFERIAS_PENDENTES').asInteger <> 0) then
      iDiasPend := DIAS_CORRIDOS - CdsAux.FieldByName('DIASFERIAS_PENDENTES').asInteger
    else
      iDiasPend := 0;

    // Calcular o número de dias entre o início do período aquisitivo e a data base
    // informada pelo usuário
    if (FU.ExtraiDia(DataRef) < FU.ExtraiDia(DataIniPerAquis)) then
      iDifDias := FU.ExtraiDia(DataRef) - FU.ExtraiDia(DataIniPerAquis)
    else
      iDifDias := FU.ExtraiDia(DataRef) + 1 - FU.ExtraiDia(DataIniPerAquis);

    // Caso a diferença entre a data base e o início do período aquisitivo em aberto for
    // maior ou igual a 15, a quantidade de avos deverá ser acrescida
    if (iDifDias >= 15) then
      iAvoDifDias := 1
    else
      iAvoDifDias := 0;

    // Calcular a quantidade de avos somando o número de meses entre o início do período
    // aquisitivo em aberto até a data base com o avo de diferença de dias e os avos de
    // dias pendentes de férias já gozadas
    FU.CalculaDifData(DateToStr(DataIniPerAquis), DateToStr(DataRef), iDias, iMeses,iAnos);
    Result := iMeses + iAvoDifDias + (iDiasPend * 12 / DIAS_CORRIDOS);
  end;
end;

function TRptProvisaoFerias.CalcularSaldo(Avos: double): double;
var
  dValorBase: double;
begin
  CdsValorRubrica.Filter := 'IDPESSOA = ' + CdsAux.FieldByName('IDPESSOA').asString;
  dValorBase := CdsValorRubrica.FieldByName('VALOR').asFloat;

  if (CmpRptCM.ParamByName('SomaUmTercoFerias').asInteger = 1) then
    Result := (dValorBase * Avos / 12)
  else
    Result := (dValorBase * 1.3333 * Avos / 12);
end;

function TRptProvisaoFerias.CalcularEncargo(Saldo: double): double;
begin
  Result := (Saldo * CmpRptCM.ParamByName('Percent').asFloat / 100);
end;

procedure TRptProvisaoFerias.GerarDadosRelat;
var
  dAvos, dSaldo, dEncargo: double;
begin
  sqlProvisaoFerias.Open;
  sqlAux.Open;
  if (CdsAux.IsEmpty) then
  begin
    CdsProvisaoFerias.Append;
    CdsProvisaoFerias.Post;
  end
  else
  begin
    AbrirQueryValorRubrica;
    repeat
      CdsProvisaoFerias.Append;
      CdsProvisaoFerias.FieldByName('IDESTAB').asFloat := CdsAux.FieldByName('IDESTAB').asFloat;
      CdsProvisaoFerias.FieldByName('NOME_ESTAB').asString := CdsAux.FieldByName('NOME_ESTAB').asString;
      CdsProvisaoFerias.FieldByName('MATRICULA').asString := CdsAux.FieldByName('MATRICULA').asString;
      CdsProvisaoFerias.FieldByName('CODCENTROCUSTO').asString := CdsAux.FieldByName('CODCENTROCUSTO').asString;
      CdsProvisaoFerias.FieldByName('NOME_CENTROCUSTO').asString := CdsAux.FieldByName('NOME_CENTROCUSTO').asString;
      CdsProvisaoFerias.FieldByName('EMPREGADO').asString := CdsAux.FieldByName('EMPREGADO').asString;

      dAvos := CalcularAvos;
      dSaldo := CalcularSaldo(dAvos);            
      dEncargo := CalcularEncargo(dSaldo);             

      CdsProvisaoFerias.FieldByName('BASECALC').asFloat := GetValorBase;
      CdsProvisaoFerias.FieldByName('AVOS').asFloat := dAvos;
      CdsProvisaoFerias.FieldByName('SALDO').asFloat := dSaldo;
      CdsProvisaoFerias.FieldByName('ENCARGO').asFloat := dEncargo;
      CdsProvisaoFerias.FieldByName('TOTAL').asFloat := dSaldo + dEncargo;

      CdsProvisaoFerias.Post;
      CdsAux.Next;
    until (CdsAux.EOF);
  end;
  CdsProvisaoFerias.First;
end;

procedure TRptProvisaoFerias.ConfigurarLayoutRelat;
begin
  rpProvisaoFeriasLblMESREF.Caption := FU.MesExtensoAno(FormatDateTime('YYYY/MM',DataRef));
                    
  if (CmpRptCM.ParamByName('Ordenacao').asInteger > 1) then
  begin
    GrpHdrBnd0.Visible := false;
    GrpHdrBnd1.Visible := true;
    GrpFootBnd1.Visible := true;
    Group1.BreakName := 'CODCENTROCUSTO';
  end
  else
  begin
    GrpHdrBnd0.Visible := true;
    GrpHdrBnd1.Visible := false;
    GrpFootBnd1.Visible := false;
    Group1.BreakName := '';
  end;
end;

end.
