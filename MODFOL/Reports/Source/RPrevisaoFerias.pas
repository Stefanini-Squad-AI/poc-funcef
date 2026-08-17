// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RPrevisaoFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppStrtch, ppMemo, ppVar,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, TXRB;

type
  TRptPrevisaoFerias = class(TFrmCmReport)
    rpPrevisaoFerias: TppReport;
    rpPrevisaoFeriasHdrBnd1: TppHeaderBand;
    rpPrevisaoFeriasLbl1: TppLabel;
    rpPrevisaoFeriasDBTxt1: TppDBText;
    rpPrevisaoFeriasDBTxt2: TppDBText;
    rpPrevisaoFeriasDBTxt3: TppDBText;
    rpPrevisaoFeriasDBTxt4: TppDBText;
    rpPrevisaoFeriasLine1: TppLine;
    rpPrevisaoFeriasLbl3: TppLabel;
    rpPrevisaoFeriasLbl4: TppLabel;
    rpPrevisaoFeriasLbl2: TppLabel;
    rpPrevisaoFeriasDBTxt5: TppDBText;
    rpPrevisaoFeriasLbl5: TppLabel;
    rpPrevisaoFeriasDBTxt6: TppDBText;
    rpPrevisaoFeriasSysVar1: TppSystemVariable;
    rpPrevisaoFeriasSysVar2: TppSystemVariable;
    rpPrevisaoFeriasDtlBnd1: TppDetailBand;
    rpPrevisaoFeriasDBTxt9: TppDBText;
    rpPrevisaoFeriasDBTxt10: TppDBText;
    rpPrevisaoFeriasMemo1: TppMemo;
    rpPrevisaoFeriasDBTxt14: TppDBText;
    rpPrevisaoFeriasDBTxt11: TppDBText;
    rpPrevisaoFeriasDBTxt12: TppDBText;
    rpPrevisaoFeriasDBTxt13: TppDBText;
    rpPrevisaoFeriasDBTxt15: TppDBText;
    rpPrevisaoFeriasDBTxt16: TppDBText;
    rpPrevisaoFeriasDBTxt17: TppDBText;
    rpPrevisaoFeriasDBTxt18: TppDBText;
    rpPrevisaoFeriasDBTxt19: TppDBText;
    rpPrevisaoFeriasLbl18: TppLabel;
    ppDBText52: TppDBText;
    rpPrevisaoFeriasFootBnd1: TppFooterBand;
    rpPrevisaoFeriasGrp1: TppGroup;
    rpPrevisaoFeriasGrpHdrBnd1: TppGroupHeaderBand;
    rpPrevisaoFeriasLbl6: TppLabel;
    rpPrevisaoFeriasDBTxt8: TppDBText;
    rpPrevisaoFeriasLine2: TppLine;
    rpPrevisaoFeriasLbl7: TppLabel;
    rpPrevisaoFeriasLbl8: TppLabel;
    ProvisaoFeriasrpLblAvos1: TppLabel;
    rpPrevisaoFeriasLbl10: TppLabel;
    rpPrevisaoFeriasLbl13: TppLabel;
    rpPrevisaoFeriasLbl15: TppLabel;
    rpPrevisaoFeriasLbl16: TppLabel;
    rpPrevisaoFeriasLbl11: TppLabel;
    rpPrevisaoFeriasDBTxt7: TppDBText;
    rpPrevisaoFeriasLbl9: TppLabel;
    rpPrevisaoFeriasLbl12: TppLabel;
    rpPrevisaoFeriasLbl17: TppLabel;
    rpPrevisaoFeriasLbl14: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    rpPrevisaoFeriasGrpFootBnd1: TppGroupFooterBand;
    rpPrevisaoFeriasLine3: TppLine;
    rpPrevisaoFeriasLbl19: TppLabel;
    rpPrevisaoFeriasDBCalc1: TppDBCalc;
    rpPrevisaoFeriasDBCalc2: TppDBCalc;
    rpPrevisaoFeriasDBCalc3: TppDBCalc;
    ppPrevisaoFerias: TppBDEPipeline;
    dsPrevisaoFerias: TwwDataSource;
    sqlPrevisaoFerias: TCMSqlParams;
    CdsPrevisaoFerias: TCMClientDataSet;
    rpPrevisaoFeriasSmryBnd: TppSummaryBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsPrevisaoFeriasAfterScroll(DataSet: TDataSet);
    procedure rpPrevisaoFeriasSmryBndAfterPrint(Sender: TObject);
  private
    function  CalculaDatas: boolean;
    procedure GerarDadosRelat;
  end;

var
  RptPrevisaoFerias: TRptPrevisaoFerias;

implementation

uses uSistema, uCtrlFuncoesRH, dCds, fAguarde, uCtrlUsoGeralRH, uDiasUteis;

{$R *.DFM}

{ TRptPrevisaoFerias }

procedure TRptPrevisaoFerias.CrmRptCMBeforePrint(Sender: TObject);
var
  DocID: array[1..2] of integer;
  bFeriasReduzidas: boolean;
  sDiasFerias: String;
begin
  inherited;
  rpPrevisaoFeriasDBTxt2.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpPrevisaoFeriasDBTxt3.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpPrevisaoFeriasDBTxt4.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;

  sDiasFerias :=
    '    CASE WHEN HT.JORNADAMENSAL > 125 THEN 30'+CR_LF+
    '         WHEN HT.JORNADAMENSAL > 110 THEN 18'+CR_LF+
    '         WHEN HT.JORNADAMENSAL > 100 THEN 16'+CR_LF+
    '         WHEN HT.JORNADAMENSAL >  75 THEN 14'+CR_LF+
    '         WHEN HT.JORNADAMENSAL >  50 THEN 12'+CR_LF+
    '         WHEN HT.JORNADAMENSAL >  25 THEN 10'+CR_LF+
    '         WHEN HT.JORNADAMENSAL >   0 THEN 08'+CR_LF+
    '         ELSE 30'+CR_LF+
    '    END';


  DocID[1] := 0;
  DocID[2] := 0;

  // Documentos
  with (dmCds.sql) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''ESTADUAL:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
  end;

  with (dmCds.Cds) do
  begin
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'ESTADUAL:') then
        DocID[1] := FieldByName('IDDOCUMENTO').asInteger
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'MUNICIPAL:') then
        DocID[2] := FieldByName('IDDOCUMENTO').asInteger;
      Next;
    end;
  end;

  bFeriasReduzidas := (CmpRptCM.ParamByName('FeriasReduzidas').asInteger = 0);

  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Dados do Estabelecimento
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB,');
    Add('  (''CNPJ:'' || PJ.NUMDOCUMENTO) AS CGC,');

    // Pendência 28012 - 30/05/2008 (Estas 10 linhas substituiram as comnetadas abaixo
    if (not bFeriasReduzidas) then
    begin
      Add('  DECODE(NVL(SALDOFERIAS.DIASACUMFERIAS,0),0,0,');
      Add('  30-SALDOFERIAS.DIASACUMFERIAS) AS SALDOFERIAS, 30 AS DIASCORRIDOS,');
    end
    else
    begin
      Add('  DECODE(NVL(SALDOFERIAS.DIASACUMFERIAS,0),0,0,');
      Add('  '+sDiasFerias+'-SALDOFERIAS.DIASACUMFERIAS) AS SALDOFERIAS, '+sDiasFerias+' AS DIASCORRIDOS,');
    end;


{
    Add('  DECODE(NVL(SALDOFERIAS.DIASACUMFERIAS,0),0,');
    Add('  DECODE(TRUNC(TO_NUMBER(TO_CHAR(TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataRef').asString)+
      ',''DD/MM/YYYY''),''J'')) / TO_NUMBER(TO_CHAR(ADD_MONTHS(DECODE(FERIAS.DATA,'''',');

    if (not bFeriasReduzidas) then
      Add('  ADD_MONTHS(F.DATAADMISSAO,-12),FERIAS.DATA),24),''J''))),0,0,30),'+
        '30-SALDOFERIAS.DIASACUMFERIAS) AS SALDOFERIAS, 30 AS DIASCORRIDOS,')
    else
      Add('  ADD_MONTHS(F.DATAADMISSAO,-12),FERIAS.DATA),24),''J''))),0,0,'+sDiasFerias+'),'+
        sDiasFerias+'-SALDOFERIAS.DIASACUMFERIAS) AS SALDOFERIAS, '+sDiasFerias+' AS DIASCORRIDOS,');
}

    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUM),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUM),NULL,NULL,');
    Add('    ''Inscrição Municipal: '' || MUNICIPAL.NUM),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUM)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CIDADES.NOME),NULL,'''','' - '' || RTRIM(CIDADES.NOME)) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    // Dados do Funcionário
    Add('  F.MATRICULA,');
    Add('  UPPER(PF.NOME) AS EMPREGADO,');
    Add('  CC.CODCENTROCUSTO,');
    Add('  RTRIM(CC.NOME) AS NOMECENTROCUSTO,');
    Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'') AS DATAADMISSAO,');
    Add('  TO_CHAR(FERIAS_EM_ABERTO.DATA,''DD/MM/YYYY'') AS DT_FERIAS_EM_ABERTO,');

    if (CmpRptCM.ParamByName('ExibeDataProgramada').asBoolean) then
    begin
      Add('  TO_CHAR(FERIAS_EM_ABERTO.GOZO,''DD'') AS DIA_DT_PROG,');
      Add('  TO_CHAR(FERIAS_EM_ABERTO.GOZO,''MM'') AS MES_DT_PROG,');
      Add('  TO_CHAR(FERIAS_EM_ABERTO.GOZO,''YYYY'') AS ANO_DT_PROG,');
    end;

    Add('  TO_CHAR(FERIAS.DATA,''DD/MM/YYYY'') AS DT_FERIAS,');
    Add('  TO_CHAR(FERIAS.ULT_FERIAS,''DD/MM/YYYY'') AS ULT_FERIAS');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, CIDADES, ESTADO ES, CENTCUST CC,');
    Add('  SITFUNC ST,');
    if bFeriasReduzidas then
      Add('  HORATRAB HT,');
    // -------------------------------------------------------------------------- //
    // Férias gozadas do Funcionário
    Add('  (SELECT IDPESSOA, MAX(INIGOZOFERIAS) AS ULT_FERIAS, MAX(INIPERIODOFERIAS) AS DATA');
    Add('   FROM   FERIAS');
    Add('   WHERE');

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('     (IDPESSOA         IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('     (IDPESSOA          = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end;

    Add('     (FLGOCORRIDA       = 1) AND');
    Add('     (INIPERIODOFERIAS <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataRef').asString)+',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) FERIAS,');
    // -------------------------------------------------------------------------- //
    // Férias em Aberto do Funcionário
    if (CmpRptCM.ParamByName('ExibeDataProgramada').asBoolean) then
      Add('  (SELECT IDPESSOA, MAX(INIPERIODOFERIAS) AS DATA, MAX(INIGOZOFERIAS) GOZO')
    else
      Add('  (SELECT IDPESSOA, MAX(INIPERIODOFERIAS) AS DATA');

    Add('   FROM FERIAS');
    Add('   WHERE');

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('     (IDPESSOA         IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('     (IDPESSOA          = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end;

    Add('     (FLGOCORRIDA       = 0) AND');
    Add('     (INIPERIODOFERIAS <= TO_DATE('+
      QuotedStr(CmpRptCM.ParamByName('DataRef').asString)+ ',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) FERIAS_EM_ABERTO,');
    // -------------------------------------------------------------------------- //
    // Saldo de Férias do Funcionário
    if (not bFeriasReduzidas) then
    begin
      Add('  (SELECT IDPESSOA,');
      Add('    MOD(SUM(FIMGOZOFERIAS - INIGOZOFERIAS + 1 +');
      Add('    DECODE(FLGABONO,0,0,DECODE(NVL(QTDIASABONO,0),0,');
      Add('    TRUNC((FIMGOZOFERIAS - INIGOZOFERIAS + 1)/2), QTDIASABONO))),30)');
      Add('    AS DIASACUMFERIAS');
      Add('   FROM  FERIAS');
      Add('   WHERE ');

      // Funcionário(s) selecionado(s)
      if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      begin
        if (Pos(',',CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
          Add('     (IDPESSOA         IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
        else
          Add('     (IDPESSOA          = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
      end;

      Add('     (INIPERIODOFERIAS <= TO_DATE('+
        QuotedStr(CmpRptCM.ParamByName('DataRef').asString)+ ',''DD/MM/YYYY''))');
      Add('   GROUP BY IDPESSOA) SALDOFERIAS, ');
    end
    else
    begin
      Add('  (SELECT FE.IDPESSOA,');
      Add('    MOD(SUM(FE.FIMGOZOFERIAS - FE.INIGOZOFERIAS + 1 +');
      Add('    DECODE(FE.FLGABONO,0,0,DECODE(NVL(FE.QTDIASABONO,0),0,');
      Add('    TRUNC((FE.FIMGOZOFERIAS - FE.INIGOZOFERIAS + 1)/2), FE.QTDIASABONO))),'+sDiasFerias+')');
      Add('    AS DIASACUMFERIAS');
      Add('   FROM  FERIAS FE, FUNCIONARIO F, HORATRAB HT');
      Add('   WHERE ');

      // Funcionário(s) selecionado(s)
      if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      begin
        if (Pos(',',CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
          Add('     (FE.IDPESSOA         IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
        else
          Add('     (FE.IDPESSOA          = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
      end;
      Add('     (FE.IDPESSOA          = F.IDPESSOA) AND');
      Add('     (HT.IDHORARIO         = F.IDHORARIO) AND');
      Add('     (FE.INIPERIODOFERIAS <= TO_DATE('+
        QuotedStr(CmpRptCM.ParamByName('DataRef').asString)+ ',''DD/MM/YYYY''))');
      Add('   GROUP BY FE.IDPESSOA, HT.JORNADAMENSAL) SALDOFERIAS, ');
    end;
    // ------------------------------------------------------------------------------- //
    // Inscrição Estadual
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDPESSOA   IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('         (IDDOCUMENTO = ' +IntToStr(DocID[1])+ ')) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    Add('  (SELECT IDPESSOA, NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDPESSOA   IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('         (IDDOCUMENTO = ' +IntToStr(DocID[2])+ ')) MUNICIPAL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    // C. Custo(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
        Add('  (CC.CODCENTROCUSTO  IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
      else
        Add('  (CC.CODCENTROCUSTO   = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitado(s) para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
    end;

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
      begin
        Add('  (F.IDPESSOA         IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND');
        Add('  (PF.IDPESSOA        IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND');
      end
      else
      begin
        Add('  (F.IDPESSOA          = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
        Add('  (PF.IDPESSOA         = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
      end;
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;

      if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          Add('  (ST.TIPOSIT IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
        else
          Add('  (ST.TIPOSIT  = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

      if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
          Add('  (F.TIPOCONTRATO IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
        else
          Add('  (F.TIPOCONTRATO  = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');
    end;

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = FERIAS.IDPESSOA(+)) AND');
    if bFeriasReduzidas then
      Add('  (F.IDHORARIO       = HT.IDHORARIO) AND');
    Add('  (F.IDPESSOA        = FERIAS_EM_ABERTO.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = SALDOFERIAS.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  NOMECENTROCUSTO, EMPREGADO');
      1 : Add('  NOMECENTROCUSTO, MATRICULA');
      2 : Add('  CODCENTROCUSTO, EMPREGADO');
      3 : Add('  CODCENTROCUSTO, MATRICULA');
      4 : Add('  EMPREGADO');
      5 : Add('  MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  // Monta Query Principal
  GerarDadosRelat;

  frmAguarde.Max := CdsPrevisaoFerias.RecordCount;
  frmAguarde.Min := 0;

  // Especifico Configurações do Relatório
  rpPrevisaoFeriasLbl6.Visible := (CmpRptCM.ParamByName('Ordenacao').asInteger < 4);
  rpPrevisaoFeriasDBTxt7.Visible := rpPrevisaoFeriasDBTxt7.Visible;
  rpPrevisaoFeriasDBTxt8.Visible := rpPrevisaoFeriasDBTxt7.Visible;

  if (rpPrevisaoFeriasDBTxt7.Visible) then
    rpPrevisaoFeriasGrp1.BreakName := 'NOMECENTROCUSTO'
  else
    rpPrevisaoFeriasGrp1.BreakName := '';
end;

procedure TRptPrevisaoFerias.CdsPrevisaoFeriasAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptPrevisaoFerias.rpPrevisaoFeriasSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

function TRptPrevisaoFerias.CalculaDatas: boolean;
var
  FeriasProp, FeriasVenc: integer;
  AuxFeriasProp, AuxDataRef: TDate;
  sDataLimite, sDataPerAquis: string;
begin
  // Seleciono qual data usar como Início do Período Aquisitivo
  if (Trim(dmCds.Cds.FieldByName('DT_FERIAS_EM_ABERTO').asString) <> '') then
    sDataPerAquis := dmCds.Cds.FieldByName('DT_FERIAS_EM_ABERTO').asString
  else
  if (Trim(dmCds.Cds.FieldByName('DT_FERIAS').asString) <> '') then
  begin
    sDataPerAquis := dmCds.Cds.FieldByName('DT_FERIAS').asString;
    if ((dmCds.Cds.FieldByName('SALDOFERIAS').asInteger = 0) or
        (dmCds.Cds.FieldByName('SALDOFERIAS').asInteger =
         dmCds.Cds.FieldByName('DIASCORRIDOS').asInteger)) then
      sDataPerAquis := FU.IncData(dmCds.Cds.FieldByName('DT_FERIAS').asString,0,0,1);
  end
  else
    sDataPerAquis := dmCds.Cds.FieldByName('DATAADMISSAO').asString;
  
  // Calculo a Data Limite
  sDataLimite := FU.IncData(sDataPerAquis,
    FU.IFF(dmCds.Cds.FieldByName('SALDOFERIAS').asInteger = 0,
     -dmCds.Cds.FieldByName('DIASCORRIDOS').asInteger,
     -dmCds.Cds.FieldByName('SALDOFERIAS').asInteger), 24, 0);

  Result := not(CmpRptCM.ParamByName('SelDataLimite').asBoolean) or
    ((StrToDate(sDataLimite) >= CmpRptCM.ParamByName('DataLimiteInicial').asDateTime) and
     (StrToDate(sDataLimite) <= CmpRptCM.ParamByName('DataLimiteFinal').asDateTime));

  if (Result) then
  begin
    // Calculo as férias vencidas
    FeriasVenc := (DiasUteis.IntervaloMeses(StrToDate(sDataPerAquis),
      CmpRptCM.ParamByName('DataRef').asDateTime) div 12);

    // ----------------------------------------------------------------------------------
    // Calculo as férias proporcionais
    FeriasProp := 0;
    AuxFeriasProp := StrToDate(FU.IncData(sDataPerAquis,0,0,FeriasVenc));
    AuxDataRef := CmpRptCM.ParamByName('DataRef').asDateTime;

    // Incremento o Contador das férias proporcionais até que as férias proporcionais sejam
    // maiores ou igual à data de referência
    while (AuxFeriasProp < AuxDataRef) do
    begin
      AuxFeriasProp := StrToDate(FU.IncData(DateToStr(AuxFeriasProp),0,1,0));
      if (AuxFeriasProp < AuxDataRef) then
        Inc(FeriasProp);
    end;

    // Faço o acerto do Contador das férias proporcionais
    // Ex: Ini Per Aquis (11/07/2000) - Data Ref (31/07/2000)
    // Tem mais de quinze (15) dias entre eles, por isso incrementa o Contador das férias proporcionais
    AuxFeriasProp := StrToDate(FU.IncData(DateToStr(AuxFeriasProp),0,-1,0));
    if ((AuxDataRef - AuxFeriasProp) >= 15) then
      Inc(FeriasProp);
    // Se após a contagem das férias proporcionais, esta for maior ou igual a um ano
    // acrescente um às férias vencidas
    if (FeriasProp >= 12) then
    begin
      FeriasProp := 0;
      Inc(FeriasVenc);
    end;
    // ----------------------------------------------------------------------------------

    // Gravo os dados
    CdsPrevisaoFerias.FieldByName('PER_AQUIS_INI').asString := sDataPerAquis;
    CdsPrevisaoFerias.FieldByName('PER_AQUIS_FIN').asString :=
      DateToStr(StrToDate(FU.IncData(sDataPerAquis,0,0,1))-1);
    CdsPrevisaoFerias.FieldByName('DATA_LIMITE').asString := sDataLimite;
    CdsPrevisaoFerias.FieldByName('FERIAS_VENC').asInteger := FeriasVenc;
    CdsPrevisaoFerias.FieldByName('FERIAS_PROP').asInteger := FeriasProp;
  end;
end;

procedure TRptPrevisaoFerias.GerarDadosRelat;
var
  iNumRegistro: integer;
begin
  dmCds.sql.Open;
  sqlPrevisaoFerias.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    iNumRegistro := 0;
    repeat
      Inc(iNumRegistro);
      CdsPrevisaoFerias.Insert;
      if (CalculaDatas) then
      begin
        CdsPrevisaoFerias.FieldByName('EMPRESA').asString := CmpRptCM.ParamByName('NomeEmpresa').asString;
        // Dados do Estabelecimento
        CdsPrevisaoFerias.FieldByName('ESTAB').asString := dmCds.Cds.FieldByName('ESTAB').asString;
        CdsPrevisaoFerias.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;
        CdsPrevisaoFerias.FieldByName('ESTADUALMUNICIPAL').asString := dmCds.Cds.FieldByName('ESTADUALMUNICIPAL').asString;
        CdsPrevisaoFerias.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('ENDERECO').asString;
        CdsPrevisaoFerias.FieldByName('UF').asString := dmCds.Cds.FieldByName('UF').asString;
        // Dados do Funcionário
        CdsPrevisaoFerias.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
        CdsPrevisaoFerias.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
        CdsPrevisaoFerias.FieldByName('CODCENTROCUSTO').asString := dmCds.Cds.FieldByName('CODCENTROCUSTO').asString;
        CdsPrevisaoFerias.FieldByName('NOMECENTROCUSTO').asString := dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString;
        CdsPrevisaoFerias.FieldByName('DATAADMISSAO').asString := dmCds.Cds.FieldByName('DATAADMISSAO').asString;
        CdsPrevisaoFerias.FieldByName('DT_FERIAS_EM_ABERTO').asString := dmCds.Cds.FieldByName('DT_FERIAS_EM_ABERTO').asString;
        CdsPrevisaoFerias.FieldByName('DT_FERIAS').asString := dmCds.Cds.FieldByName('DT_FERIAS').asString;
        CdsPrevisaoFerias.FieldByName('SALDOFERIAS').asInteger := dmCds.Cds.FieldByName('SALDOFERIAS').asInteger;
        CdsPrevisaoFerias.FieldByName('ULT_FERIAS').asString := dmCds.Cds.FieldByName('ULT_FERIAS').asString;
        CdsPrevisaoFerias.FieldByName('DATA_REF').asString := CmpRptCM.ParamByName('DataRef').asString;
        CdsPrevisaoFerias.FieldByName('NUM_REGISTRO').asInteger := iNumRegistro;

        if (CmpRptCM.ParamByName('ExibeDataProgramada').asBoolean) then
        begin
          CdsPrevisaoFerias.FieldByName('DIA_DT_PROG').asString := dmCds.Cds.FieldByName('DIA_DT_PROG').asString;
          CdsPrevisaoFerias.FieldByName('MES_DT_PROG').asString := dmCds.Cds.FieldByName('MES_DT_PROG').asString;
          CdsPrevisaoFerias.FieldByName('ANO_DT_PROG').asString := dmCds.Cds.FieldByName('ANO_DT_PROG').asString;
        end;

        CdsPrevisaoFerias.Post;
      end
      else
        CdsPrevisaoFerias.Cancel;

      dmCds.Cds.Next;
    until (dmCds.Cds.EOF);
  end
  else
  begin
    CdsPrevisaoFerias.Insert;
    CdsPrevisaoFerias.Post;
  end;

  CdsPrevisaoFerias.First;  
end;

end.
