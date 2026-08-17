unit RCartaoPonto;
//4121                                                      
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  DBClient, uCMClientDataSet, uCmSqlParams,  uCtrlPadroes, uCtrlListTerceirosRH,
  uCtrlDiaExtra, uCtrlFerias, uCtrlCargo, uCtrlRegAcessoFunc, 
  uCtrlHorarioVariavel, uCtrlTurnoSem, TXRB;

type
  TRptCartaoPonto = class(TFrmCmReport)
    sqlCartaoPonto: TCMSqlParams;
    CdsCartaoPonto: TCMClientDataSet;
    rpCartaoPonto: TppReport;
    rpCartaoPontoHdrBnd: TppColumnHeaderBand;
    rpCartaoPontoDtlBnd: TppDetailBand;
    rpCartaoPontoShapeDia31_2: TppShape;
    rpCartaoPontoShapeDia30_2: TppShape;
    rpCartaoPontoShapeDia29_2: TppShape;
    rpCartaoPontoShapeDia30_1: TppShape;
    rpCartaoPontoShapeDia29_1: TppShape;
    rpCartaoPontoShape4: TppShape;
    rpCartaoPontoShape2: TppShape;
    rpCartaoPontoShape3: TppShape;
    rpCartaoPontoShape5: TppShape;
    rpCartaoPontoShapeDia31_1: TppShape;
    rpCartaoPontoShape6: TppShape;
    rpCartaoPontoShape1: TppShape;
    rpCartaoPontoShape7: TppShape;
    rpCartaoPontoShape20: TppShape;
    rpCartaoPontoShape19: TppShape;
    rpCartaoPontoShape18: TppShape;
    rpCartaoPontoShape17: TppShape;
    rpCartaoPontoShape16: TppShape;
    rpCartaoPontoShape15: TppShape;
    rpCartaoPontoShape14: TppShape;
    rpCartaoPontoShape13: TppShape;
    rpCartaoPontoShape12: TppShape;
    rpCartaoPontoShape11: TppShape;
    rpCartaoPontoShape10: TppShape;
    rpCartaoPontoShape9: TppShape;
    rpCartaoPontoShape8: TppShape;
    rpCartaoPontoLbl1: TppLabel;
    rpCartaoPontoLblDia01: TppLabel;
    rpCartaoPontoLblDia02: TppLabel;
    rpCartaoPontoLblDia03: TppLabel;
    rpCartaoPontoLblDia04: TppLabel;
    rpCartaoPontoLblDia05: TppLabel;
    rpCartaoPontoLblDia06: TppLabel;
    rpCartaoPontoLblDia07: TppLabel;
    rpCartaoPontoLblDia08: TppLabel;
    rpCartaoPontoLblDia09: TppLabel;
    rpCartaoPontoLblDia10: TppLabel;
    rpCartaoPontoLblDia11: TppLabel;
    rpCartaoPontoLblDia12: TppLabel;
    rpCartaoPontoLblDia13: TppLabel;
    rpCartaoPontoLblDia14: TppLabel;
    rpCartaoPontoLblDia15: TppLabel;
    rpCartaoPontoLbl15: TppLabel;
    rpCartaoPontoLbl13: TppLabel;
    rpCartaoPontoDBTxt6: TppDBText;
    rpCartaoPontoLine8: TppLine;
    rpCartaoPontoLine10: TppLine;
    rpCartaoPontoDBTxt2: TppDBText;
    rpCartaoPontoDBTxt1: TppDBText;
    rpCartaoPontoDBTxt5: TppDBText;
    rpCartaoPontoDBTxt4: TppDBText;
    rpCartaoPontoDBTxt3: TppDBText;
    rpCartaoPontoDBTxt7: TppDBText;
    rpCartaoPontoDBTxt9: TppDBText;
    rpCartaoPontoDBTxt8: TppDBText;
    rpCartaoPontoDBTxt10: TppDBText;
    rpCartaoPontoLbl16: TppLabel;
    rpCartaoPontoLbl18: TppLabel;
    rpCartaoPontoLbl19: TppLabel;
    rpCartaoPontoLine15: TppLine;
    rpCartaoPontoLbl21: TppLabel;
    rpCartaoPontoLbl17: TppLabel;
    rpCartaoPontoLblDia16: TppLabel;
    rpCartaoPontoLblDia17: TppLabel;
    rpCartaoPontoLblDia18: TppLabel;
    rpCartaoPontoLblDia19: TppLabel;
    rpCartaoPontoLblDia20: TppLabel;
    rpCartaoPontoLblDia21: TppLabel;
    rpCartaoPontoLblDia22: TppLabel;
    rpCartaoPontoLblDia23: TppLabel;
    rpCartaoPontoLblDia24: TppLabel;
    rpCartaoPontoLblDia25: TppLabel;
    rpCartaoPontoLblDia26: TppLabel;
    rpCartaoPontoLblDia27: TppLabel;
    rpCartaoPontoLblDia28: TppLabel;
    rpCartaoPontoLblDia29: TppLabel;
    rpCartaoPontoLine12: TppLine;
    rpCartaoPontoLine11: TppLine;
    rpCartaoPontoLblDia30: TppLabel;
    rpCartaoPontoLblDia31: TppLabel;
    rpCartaoPontoLbl7: TppLabel;
    rpCartaoPontoLbl6: TppLabel;
    rpCartaoPontoLbl5: TppLabel;
    rpCartaoPontoLbl3: TppLabel;
    rpCartaoPontoLbl2: TppLabel;
    rpCartaoPontoLine1: TppLine;
    rpCartaoPontoLbl8: TppLabel;
    rpCartaoPontoLbl9: TppLabel;
    rpCartaoPontoLbl4: TppLabel;
    rpCartaoPontoLbl10: TppLabel;
    rpCartaoPontoLbl11: TppLabel;
    rpCartaoPontoLine3: TppLine;
    rpCartaoPontoLine6: TppLine;
    rpCartaoPontoTextDia01: TppDBText;
    rpCartaoPontoTextDia02: TppDBText;
    rpCartaoPontoTextDia03: TppDBText;
    rpCartaoPontoTextDia04: TppDBText;
    rpCartaoPontoTextDia05: TppDBText;
    rpCartaoPontoTextDia06: TppDBText;
    rpCartaoPontoTextDia07: TppDBText;
    rpCartaoPontoTextDia08: TppDBText;
    rpCartaoPontoTextDia09: TppDBText;
    rpCartaoPontoTextDia10: TppDBText;
    rpCartaoPontoTextDia11: TppDBText;
    rpCartaoPontoTextDia12: TppDBText;
    rpCartaoPontoTextDia13: TppDBText;
    rpCartaoPontoTextDia14: TppDBText;
    rpCartaoPontoTextDia15: TppDBText;
    rpCartaoPontoTextDia16: TppDBText;
    rpCartaoPontoTextDia17: TppDBText;
    rpCartaoPontoTextDia18: TppDBText;
    rpCartaoPontoTextDia19: TppDBText;
    rpCartaoPontoTextDia20: TppDBText;
    rpCartaoPontoTextDia21: TppDBText;
    rpCartaoPontoTextDia22: TppDBText;
    rpCartaoPontoTextDia23: TppDBText;
    rpCartaoPontoTextDia24: TppDBText;
    rpCartaoPontoTextDia25: TppDBText;
    rpCartaoPontoTextDia26: TppDBText;
    rpCartaoPontoTextDia27: TppDBText;
    rpCartaoPontoTextDia28: TppDBText;
    rpCartaoPontoTextDia29: TppDBText;
    rpCartaoPontoTextDia30: TppDBText;
    rpCartaoPontoTextDia31: TppDBText;
    rpCartaoPontoLbl12: TppLabel;
    rpCartaoPontoLine7: TppLine;
    rpCartaoPontoLine13: TppLine;
    rpCartaoPontoLine2: TppLine;
    rpCartaoPontoLine4: TppLine;
    rpCartaoPontoLine5: TppLine;
    rpCartaoPontoDBImage1: TppDBImage;
    rpCartaoPontoShape22: TppShape;
    rpCartaoPontoShape21: TppShape;
    rpCartaoPontoMemo1: TppMemo;
    rpCartaoPontoMemo3: TppMemo;
    rpCartaoPontoLbl23: TppLabel;
    rpCartaoPontoMemo2: TppMemo;
    rpCartaoPontoLbl22: TppLabel;
    rpCartaoPontoDBTxt11: TppDBText;
    rpCartaoPontoSaldo: TppLabel;
    rpCartaoPontoIni: TppLabel;
    rpCartaoPontoFim: TppLabel;
    rpCartaoPontoShapeDia29_4: TppShape;
    rpCartaoPontoShapeDia30_4: TppShape;
    rpCartaoPontoShapeDia31_4: TppShape;
    rpCartaoPontoColFootBnd: TppColumnFooterBand;
    ppCartaoPonto: TppBDEPipeline;
    dsCartaoPonto: TwwDataSource;
    CdsFeriado: TCMClientDataSet;
    CdsDiasExtras: TCMClientDataSet;
    CdsFerias: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    rpCartaoPontoSmryBnd: TppSummaryBand;
    ppIMG: TppBDEPipeline;
    ppIMGppField1: TppField;
    dsIMG: TwwDataSource;
    CdsIMG: TCMClientDataSet;
    CdsPonto: TCMClientDataSet;
    rpCartaoPontoTextObs01: TppDBText;
    rpCartaoPontoTextObs02: TppDBText;
    rpCartaoPontoTextObs03: TppDBText;
    rpCartaoPontoTextObs04: TppDBText;
    rpCartaoPontoTextObs05: TppDBText;
    rpCartaoPontoTextObs06: TppDBText;
    rpCartaoPontoTextObs07: TppDBText;
    rpCartaoPontoTextObs08: TppDBText;
    rpCartaoPontoTextObs09: TppDBText;
    rpCartaoPontoTextObs10: TppDBText;
    rpCartaoPontoTextObs11: TppDBText;
    rpCartaoPontoTextObs12: TppDBText;
    rpCartaoPontoTextObs13: TppDBText;
    rpCartaoPontoTextObs14: TppDBText;
    rpCartaoPontoTextObs15: TppDBText;
    rpCartaoPontoTextObs16: TppDBText;
    rpCartaoPontoTextObs17: TppDBText;
    rpCartaoPontoTextObs18: TppDBText;
    rpCartaoPontoTextObs19: TppDBText;
    rpCartaoPontoTextObs20: TppDBText;
    rpCartaoPontoTextObs21: TppDBText;
    rpCartaoPontoTextObs22: TppDBText;
    rpCartaoPontoTextObs23: TppDBText;
    rpCartaoPontoTextObs24: TppDBText;
    rpCartaoPontoTextObs25: TppDBText;
    rpCartaoPontoTextObs26: TppDBText;
    rpCartaoPontoTextObs27: TppDBText;
    rpCartaoPontoTextObs28: TppDBText;
    rpCartaoPontoTextObs29: TppDBText;
    rpCartaoPontoTextObs30: TppDBText;
    rpCartaoPontoTextObs31: TppDBText;
    CdsHorarioVariavel: TCMClientDataSet;
    CdsTurnoSem: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CdsCartaoPontoAfterScroll(DataSet: TDataSet);
    procedure rpCartaoPontoSmryBndAfterPrint(Sender: TObject);
    procedure rpCartaoPontoHdrBndAfterPrint(Sender: TObject);
    procedure rpCartaoPontoDtlBndBeforePrint(Sender: TObject);
    procedure rpCartaoPontoSaldoPrint(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlDiaExtra: TCtrlDiaExtra;
    CtrlFerias: TCtrlFerias;
    CtrlCargo: TCtrlCargo;
    CtrlRegAcessoFunc: TCtrlRegAcessoFunc;
    CtrlHorarioVariavel: TCtrlHorarioVariavel;
    CtrlTurnoSem: TCtrlTurnoSem;

    bHorarioVariavel: boolean;
    ArrayHorario: variant;
    sDataIni,sDataFim,sListaIdFuncSel: string;

    procedure GerarDadosRelat;
    procedure AbrirQueryAuxiliar;
    procedure MontaArrayHorario;
  end;

var
  RptCartaoPonto: TRptCartaoPonto;

implementation

uses uCMTypes, dCds, fAguarde, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptCartaoPonto.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlDiaExtra := TCtrlDiaExtra.Create;
  CtrlDiaExtra.InitializeAs(Padroes);

  CtrlFerias := TCtrlFerias.Create;
  CtrlFerias.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlRegAcessoFunc := TCtrlRegAcessoFunc.Create;
  CtrlRegAcessoFunc.InitializeAs(Padroes);

  CtrlHorarioVariavel := TCtrlHorarioVariavel.Create;
  CtrlHorarioVariavel.InitializeAs(Padroes);

  CtrlTurnoSem := TCtrlTurnoSem.Create;
  CtrlTurnoSem.InitializeAs(Padroes);
end;

procedure TRptCartaoPonto.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlDiaExtra);
  FreeAndNil(CtrlFerias);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlRegAcessoFunc);
  FreeAndNil(CtrlHorarioVariavel);
  FreeAndNil(CtrlTurnoSem);
  inherited;
end;

procedure TRptCartaoPonto.CrmRptCMBeforePrint(Sender: TObject);
var
  c: integer;
begin
  inherited;
  sDataIni := CmpRptCM.ParamByName('DataRef').asString;
  sDataFim := DateToStr(FU.IncData2(CmpRptCM.ParamByName('DataRef').asDateTime,-1,1,0));

  // Montar os dias se for <> mês calendário
  if copy(sDataIni, 1, 2) <> '01' then
  for c := 0 to 30 do
    TppLabel(Self.FindComponent('rpCartaoPontoLblDia' + FU.PoeZero(c+1))).
      Caption := copy(DateToStr(StrToDate(sDataIni)+c), 1, 2);

  // Monta Query Auxiliar
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.IDPESSOA AS IDESTAB,');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB,');
    Add('  CGC.NUM AS CGC,');
    Add('  CGC.MASCARA AS MASCARA_CGC,');
    Add('  E.IDCIDADES,');
    Add('  PAISUF.IDPAIS,');
    Add('  RTRIM(ES.CODESTADO) AS UF,');
    Add('  (');
    Add('    RTRIM(E.LOGRADOURO) ||');
    Add('    (CASE');
    Add('       WHEN E.NUMERO IS NULL THEN ''''');
    Add('       ELSE '', ''|| TO_CHAR(E.NUMERO)');
    Add('     END) ||');
    Add('    (CASE');
    Add('       WHEN E.COMPLEMENTO IS NULL THEN ''''');
    Add('       ELSE '' - '' || RTRIM(E.COMPLEMENTO)');
    Add('     END) ||');
    Add('    (CASE');
    Add('       WHEN E.BAIRRO IS NULL THEN ''''');
    Add('       ELSE '' - '' || RTRIM(E.BAIRRO)');
    Add('     END)');
    Add('  ) AS ENDERECO,');
    Add('  RTRIM(ES.NOMEESTADO) AS ESTADO,');
    // Dados do Funcionário
    Add('  F.IDPESSOA,');
    Add('  F.MATRICULA,');
    if copy(sDataIni, 1, 2) <> '01' then
    begin
      rpCartaoPontoDBTxt10.Font.Size := 5;
      Add('  ' +QuotedStr(FU.MesExtensoAno(copy(sDataIni,7,4) +'/'+ copy(sDataIni,4,2))+
        '-'+FU.MesExtensoAno(copy(sDataFim,7,4) +'/'+ copy(sDataFim,4,2)))+ ' AS REFERENCIA,');
    end
    else
      Add('  ' +QuotedStr(FU.MesExtensoAno(copy(sDataIni,7,4) +'/'+ copy(sDataIni,4,2)))+ ' AS REFERENCIA,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  RTRIM(CC.NOME) AS C_CUSTO,');
    Add('  (CASE');
    Add('     WHEN HST.IDCARGO IS NULL THEN F.IDCARGO');
    Add('     ELSE HST.IDCARGO');
    Add('   END) AS IDCARGO,');
    Add('  (CASE');
    Add('     WHEN HST.IDFUNCAO IS NULL THEN F.IDFUNCAO');
    Add('     ELSE HST.IDFUNCAO');
    Add('   END) AS IDFUNCAO,');
    Add('  F.DATAADMISSAO,');
    // Horário
    Add('  HT.FLGTIPOHORARIO,');
    Add('  HT.NOMEHORARIO,');
    Add('  HT.HORASFOLGA1,');
    Add('  HT.HORASSERVICO,');
    Add('  HT.HORASFOLGA2,');
    // Turno Semanal
    Add('  TS.IDHORARIO,');
    Add('  TS.IDDIASEMANA,');
    // Turno Diário
    Add('  TD.IDTURNODIARIO,');
    Add('  TD.INICIOEXPEDIENTE,');
    Add('  TD.INICIOALMOCO,');
    Add('  TD.FINALALMOCO,');
    Add('  TD.FINALEXPEDIENTE,');
    Add('  TO_CHAR(FERIAS_EM_ABERTO.DATA,''DD/MM/YYYY'') AS PER_AQUI_INI');
    // -------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, ENDPESS E, ESTADO ES, CIDADES,');
    Add('  CENTCUST CC, HORATRAB HT, TURNODIA TD, TURNOSEM TS, SITFUNC ST,');
    // -------------------------------------------------------------------------- //
    // Última evolução Funcional do Funcionário
    // -------------------------------------------------------------------------- //
    Add('  (SELECT EF.IDCARGO, EF.IDFUNCAO, EF.IDPESSOA, EF.IDEMPRESA, EF.CODCENTROCUSTO');
    Add('    FROM   EVOLFUNC EF,');
    Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('           FROM   EVOLFUNC');
    Add('           WHERE  (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(CmpRptCM.ParamByName('DataRef').asString)+ ',''DD/MM/YYYY''))');
    Add('           GROUP BY IDPESSOA) HST2,');
    Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
    Add('           FROM   EVOLFUNC');
    Add('           WHERE (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(CmpRptCM.ParamByName('DataRef').asString)+ ',''DD/MM/YYYY''))');
    Add('           GROUP BY IDPESSOA) HST3');
    Add('    WHERE  (EF.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('           (EF.IDPESSOA      = HST2.IDPESSOA) AND');
    Add('           (EF.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
    Add('           (EF.IDPESSOA      = HST3.IDPESSOA)) HST,');
    // ------------------------------------------------------------------------------- //
    // Férias em Aberto do Funcionário
    Add('  (SELECT IDPESSOA, MAX(INIPERIODOFERIAS) AS DATA');
    Add('   FROM FERIAS');
    Add('   WHERE (FLGOCORRIDA       = 0) AND');
    Add('         (INIPERIODOFERIAS <= TO_DATE('+QuotedStr(
      CmpRptCM.ParamByName('DataRef').asString)+',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) FERIAS_EM_ABERTO,');
    // -------------------------------------------------------------------------- //
    // UF do País
    Add('  (SELECT PS.IDPAIS, UF.CODESTADO');
    Add('   FROM   ESTADO UF, PAIS PS');
    Add('   WHERE (PS.IDPAIS = UF.IDPAIS)) PAISUF,');
    // -------------------------------------------------------------------------- //
    // CGC da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, TDP.MASCARA,');
    Add('          RTRIM(DP.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('          (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DP.IDPESSOA) AND');
    Add('          (DP.IDDOCUMENTO      = TDP.IDDOCUMENTO)) CGC');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA        = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND');

    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      Add(FU.MontaLinhaSelSQL('  (F.IDPESSOA',CmpRptCM.ParamByName('ListaIdFunc').asString, 8))
    else
    begin
      if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
        Add(FU.MontaLinhaSelSQL(
        '  (LTRIM(RTRIM(CASE'+CR_LF+
        '                 WHEN HST.CODCENTROCUSTO IS NULL THEN F.CODCENTROCUSTO'+CR_LF+
        '                 ELSE HST.CODCENTROCUSTO'+CR_LF+
        '               END))',CmpRptCM.ParamByName('ListaCodCCusto').asString,1))

      else
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        Add(FU.MontaLinhaSelSQL(
        '  (LTRIM(RTRIM(CASE'+CR_LF+
        '                 WHEN HST.CODCENTROCUSTO IS NULL THEN F.CODCENTROCUSTO'+CR_LF+
        '                 ELSE HST.CODCENTROCUSTO'+CR_LF+
        '               END))',CtrlUsoGeralRH.UsuXCCusto,1));

      Add(FU.MontaLinhaSelSQL('  (ST.TIPOSIT',CmpRptCM.ParamByName('SitFunc').asString, 7));
      Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',CmpRptCM.ParamByName('TipoContrato').asString, 3));
    end;

    if (CmpRptCM.ParamByName('ListaIdCargo').asString <> '') then
    begin
      if (CmpRptCM.ParamByName('FlgDoisCargos').asInteger = 1) then
        Add(FU.MontaLinhaSelSQL(
          '  (CASE'+CR_LF+
          '     WHEN HST.IDFUNCAO IS NULL THEN'+CR_LF+
          '       (CASE'+CR_LF+
          '          WHEN HST.IDCARGO IS NULL THEN'+CR_LF+
          '            (CASE'+CR_LF+
          '               WHEN F.IDFUNCAO IS NULL THEN F.IDCARGO'+CR_LF+
          '               ELSE F.IDFUNCAO'+CR_LF+
          '             END)'+CR_LF+
          '          ELSE HST.IDCARGO'+CR_LF+
          '        END)'+CR_LF+
          '     ELSE HST.IDFUNCAO'+CR_LF+
          '   END',CmpRptCM.ParamByName('ListaIdCargo').asString,1))
      else
        Add(FU.MontaLinhaSelSQL(
          '  (CASE'+CR_LF+
          '     WHEN HST.IDCARGO IS NULL THEN F.IDCARGO'+CR_LF+
          '     ELSE HST.IDCARGO'+CR_LF+
          '   END',CmpRptCM.ParamByName('ListaIdCargo').asString,1));
    end;

    Add('  (HT.FLGTIPOHORARIO  = 0) AND');
    Add('  (ST.IDSITFUNC       = F.IDSITFUNC) AND');
    Add('  (F.IDHORARIO        = HT.IDHORARIO) AND');
    Add('  (PJ.IDPESSOA        = F.IDESTAB) AND');
    Add('  ((CASE');
    Add('      WHEN HST.CODCENTROCUSTO IS NULL THEN F.CODCENTROCUSTO');
    Add('      ELSE HST.CODCENTROCUSTO');
    Add('    END)              = CC.CODCENTROCUSTO) AND');
    Add('  ((CASE');
    Add('      WHEN HST.IDEMPRESA IS NULL THEN F.IDEMPRESA');
    Add('      ELSE HST.IDEMPRESA');
    Add('    END)              = CC.IDEMPRESA) AND');
    Add('  (F.IDPESSOA         = PF.IDPESSOA) AND');
    Add('  (F.IDHORARIO        = HT.IDHORARIO) AND');
    Add('  (PJ.IDPESSOA        = CGC.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL  = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA        = E.IDPESSOA) AND');
    Add('  (E.IDCIDADES        = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO   = ES.IDESTADO) AND');
    Add('  (ES.IDPAIS          = PAISUF.IDPAIS) AND');
    Add('  (F.IDHORARIO        = TS.IDHORARIO) AND');
    Add('  (TS.IDTURNODIARIO   = TD.IDTURNODIARIO) AND');
    Add('  (F.IDPESSOA         = FERIAS_EM_ABERTO.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA         = HST.IDPESSOA(+))');
    SaveToFile(FU.DirTempLog + '\qry.txt');
  end;
  AbrirQueryAuxiliar;

  // Montar Query Principal
  GerarDadosRelat;

  frmAguarde.Max := CdsCartaoPonto.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptCartaoPonto.CdsCartaoPontoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptCartaoPonto.rpCartaoPontoHdrBndAfterPrint(Sender: TObject);
var
  iNumDias: integer;
begin
  iNumDias := CdsCartaoPonto.FieldByName('NUM_DIAS_MES').asInteger;

  rpCartaoPontoShapeDia29_1.Visible := (iNumDias >= 29);
  rpCartaoPontoShapeDia29_2.Visible := (iNumDias >= 29);
  //rpCartaoPontoShapeDia29_3.Visible := (iNumDias >= 29);
  rpCartaoPontoShapeDia29_4.Visible := (iNumDias >= 29);

  rpCartaoPontoShapeDia30_1.Visible := (iNumDias >= 30);
  rpCartaoPontoShapeDia30_2.Visible := (iNumDias >= 30);
  //rpCartaoPontoShapeDia30_3.Visible := (iNumDias >= 30);
  rpCartaoPontoShapeDia30_4.Visible := (iNumDias >= 30);

  rpCartaoPontoShapeDia31_1.Visible := (iNumDias  = 31);
  rpCartaoPontoShapeDia31_2.Visible := (iNumDias  = 31);
  //rpCartaoPontoShapeDia31_3.Visible := (iNumDias  = 31);
  rpCartaoPontoShapeDia31_4.Visible := (iNumDias  = 31);

  rpCartaoPontoLblDia29.Visible := (iNumDias >= 29);
  rpCartaoPontoLblDia30.Visible := (iNumDias >= 30);
  rpCartaoPontoLblDia31.Visible := (iNumDias  = 31);

  rpCartaoPontoTextDia29.Visible := (iNumDias >= 29);
  rpCartaoPontoTextDia30.Visible := (iNumDias >= 30);
  rpCartaoPontoTextDia31.Visible := (iNumDias  = 31);
end;

procedure TRptCartaoPonto.rpCartaoPontoDtlBndBeforePrint(Sender: TObject);
var
  c: integer;
  SetDias: array [1..5] of string;
begin
  SetDias[1] := FU.CMTranslate('DOMINGO');
  SetDias[2] := FU.CMTranslate('SÁBADO');
  SetDias[3] := FU.CMTranslate('FERIADO');
  SetDias[4] := FU.CMTranslate('FÉRIAS');
  SetDias[5] := FU.CMTranslate('FOLGA');

  for c:=1 to 31 do
    TppDBText(Self.FindComponent('rpCartaoPontoTextDia'+FU.PoeZero(c))).Visible :=
      (FU.StringEm(CdsCartaoPonto.FieldByName('DIA'+FU.PoeZero(c)).asString, SetDias) > -1) or
      (Pos(':',CdsCartaoPonto.FieldByName('DIA'+FU.PoeZero(c)).asString) > 0);
end;

procedure TRptCartaoPonto.rpCartaoPontoSaldoPrint(Sender: TObject);
var
  DataProx: TDate;
  AchouMax: boolean;
begin
  if (CdsCartaoPonto.FieldByName('ESTAB').asString <> 'XXX') then
  begin
    AchouMax := false;

    DataProx := CtrlFerias.GetPeriodoAquisitivo(
      CdsCartaoPonto.FieldByName('IDPESSOA').asFloat, false, false);

    if (DataProx = 0) then
    begin
      DataProx := CtrlFerias.GetPeriodoAquisitivo(
        CdsCartaoPonto.FieldByName('IDPESSOA').asFloat, true, true);

      if (DataProx > 0) then
      begin
        DataProx := FU.IncData2(DataProx,0,0,1);
        AchouMax := true;
      end
      else
        DataProx := CdsCartaoPonto.FieldByName('DATAADMISSAO').asDateTime;
    end;

    dmCds.Cds.IndexName := '';
    dmCds.sql.SQL.Text :=
      'SELECT'+CR_LF+
      '  (30 - ACUM.DIAS) AS DIASSALDOFERIAS'+CR_LF+
      'FROM'+CR_LF+
      '  (SELECT'+CR_LF+
      '     NVL('+CR_LF+
  //    '       ' +FU.IFF(TTipoBDPadrao(iTipoBD_Padrao) = tbdOracle, 'MOD', '(CAST')
  //    '   (' +CR_LF+
      '         SUM('+CR_LF+
      '           TO_NUMBER(FIMGOZOFERIAS - INIGOZOFERIAS) + 1 +'+CR_LF+
      '           (CASE'+CR_LF+
      '              WHEN FLGABONO = 0 THEN 0'+CR_LF+
      '              ELSE (CASE'+CR_LF+
      '                      WHEN NVL(QTDIASABONO,0) = 0 THEN'+CR_LF+
      '                        TRUNC((TO_NUMBER(FIMGOZOFERIAS - INIGOZOFERIAS) + 1)/2)'+CR_LF+
      '                      ELSE QTDIASABONO'+CR_LF+
      '                    END)'+CR_LF+
      '            END)'+CR_LF+
      //'         )' +FU.IFF(TTipoBDPadrao(iTipoBD_Padrao) = tbdOracle, ',', ' AS INT) % ')+ '30' +CR_LF+
      '       ),'+CR_LF+
      '       0'+CR_LF+
      '     ) AS DIAS'+CR_LF+
      '  FROM'+CR_LF+
      '    FERIAS'+CR_LF+
      '  WHERE'+CR_LF+
      '    (IDPESSOA    = ' +CdsCartaoPonto.FieldByName('IDPESSOA').asString+ ') AND'+CR_LF+
      '    (FLGOCORRIDA = 1)) ACUM';
    dmCds.sql.Open;

    if (FU.IncData2(DataProx,0,0,1) > CdsCartaoPonto.FieldByName('EMISSAO').asDateTime) and
       (dmCds.Cds.FieldByName('DIASSALDOFERIAS').asInteger = 30) then
      rpCartaoPontoSaldo.Caption := '0'
    else
      rpCartaoPontoSaldo.Caption := dmCds.Cds.FieldByName('DIASSALDOFERIAS').asString;

    if (dmCds.Cds.FieldByName('DIASSALDOFERIAS').asInteger <> 30) and (AchouMax) then
      DataProx := FU.IncData2(DataProx,0,0,-1);

    rpCartaoPontoIni.Caption := DateToStr(DataProx);
    rpCartaoPontoFim.Caption := DateToStr(FU.IncData2(DataProx,-1,0,1));
  end;
end;

procedure TRptCartaoPonto.rpCartaoPontoSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptCartaoPonto.AbrirQueryAuxiliar;
begin
  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');
  // Abrir Query
  dmCds.sql.Open;
  // Criar o índice
  case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
    0 : dmCds.Cds.AddIndex('Index1', 'EMPREGADO;C_CUSTO', [ixCaseInsensitive], '', 'EMPREGADO;C_CUSTO');
    1 : dmCds.Cds.AddIndex('Index1', 'MATRICULA;C_CUSTO', [ixCaseInsensitive], '', 'C_CUSTO');
    2 : dmCds.Cds.AddIndex('Index1', 'C_CUSTO;EMPREGADO', [ixCaseInsensitive], '', 'C_CUSTO;EMPREGADO');
    3 : dmCds.Cds.AddIndex('Index1', 'C_CUSTO;MATRICULA', [ixCaseInsensitive], '', 'C_CUSTO');
  end;
  dmCds.Cds.IndexName := 'Index1';
  dmCds.Cds.First;
end;

procedure TRptCartaoPonto.GerarDadosRelat;
var
  Achou, bTemPonto: boolean;
  dtDataRef: TDateTime;
  IdPessoa: double;
  c: integer;
  sValor: string;
begin
  sqlCartaoPonto.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    dtDataRef := StrToDate(sDataIni);

    // Pego o Logotipo do estabelecimento
    CdsIMG.Data := CtrlListTerceirosRH.ListImagemPessoa(
      dmCds.Cds.FieldByName('IDESTAB').asFloat);

    // Todos os feriados no período
    CdsFeriado.Data := CtrlListTerceirosRH.ListFeriados(
      dmCds.Cds.FieldByName('IDCIDADES').asInteger,
      dmCds.Cds.FieldByName('IDPAIS').asInteger,
      dmCds.Cds.FieldByName('UF').asString,
      StrToDate(sDataIni),
      StrToDate(sDataFim),
      'O,E');

    // Pego o ID de cada funcionário Listado na Query Auxiliar para ver se têm Férias para o
    // período especificado
    sListaIdFuncSel := '';
    repeat
      if (sListaIdFuncSel = '') then
        sListaIdFuncSel := dmCds.Cds.FieldByName('IDPESSOA').asString
      else
        sListaIdFuncSel := sListaIdFuncSel +','+ dmCds.Cds.FieldByName('IDPESSOA').asString;

      IdPessoa := dmCds.Cds.FieldByName('IDPESSOA').asFloat;
      repeat
        dmCds.Cds.Next;
      until (IdPessoa <> dmCds.Cds.FieldByName('IDPESSOA').asFloat) or (dmCds.Cds.EOF);
    until (dmCds.Cds.EOF);

    // Todos os dias extras no período para os funcionários selecionados
    CdsDiasExtras.Data := CtrlDiaExtra.ListDiasExtra(sListaIdFuncSel,
      StrToDate(sDataIni), StrToDate(sDataFim));

    // Todos os períodos de férias no período
    CdsFerias.Data := CtrlFerias.ListFeriasNoPeriodo(sListaIdFuncSel,
      StrToDate(sDataIni), StrToDate(sDataFim));

    // Cargos dos Empregados
    CdsCargo.Data := CtrlCargo.ListCargo;

    // ---------------------------------------------------------------------------
    // Gravo registros
    // ---------------------------------------------------------------------------
    dmCds.Cds.First;
    repeat
      CdsCartaoPonto.Append;
      CdsCartaoPonto.FieldByName('ESTAB').asString := dmCds.Cds.FieldByName('ESTAB').asString;
      CdsCartaoPonto.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;
      CdsCartaoPonto.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('ENDERECO').asString;
      CdsCartaoPonto.FieldByName('UF').asString := dmCds.Cds.FieldByName('ESTADO').asString;
      CdsCartaoPonto.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
      CdsCartaoPonto.FieldByName('REFERENCIA').asString := dmCds.Cds.FieldByName('REFERENCIA').asString;
      CdsCartaoPonto.FieldByName('EMISSAO').asString := CmpRptCM.ParamByName('DataRef').asString;
      CdsCartaoPonto.FieldByName('DATAADMISSAO').asString := dmCds.Cds.FieldByName('IDPESSOA').asString;
      CdsCartaoPonto.FieldByName('IDPESSOA').asString := dmCds.Cds.FieldByName('IDPESSOA').asString;
      CdsCartaoPonto.FieldByName('NUM_DIAS_MES').asInteger :=
        Round(StrToDate(sDataFim) - StrToDate(sDataIni) + 1);
      if (Trim(dmCds.Cds.FieldByName('PER_AQUI_INI').asString) = '') then
        CdsCartaoPonto.FieldByName('PER_AQUI_INI').asString :=
          dmCds.Cds.FieldByName('DATAADMISSAO').asString
      else
        CdsCartaoPonto.FieldByName('PER_AQUI_INI').asString :=
          dmCds.Cds.FieldByName('PER_AQUI_INI').asString;

      CdsCartaoPonto.FieldByName('PER_AQUI_FIN').asDateTime :=
        FU.IncData2(CdsCartaoPonto.FieldByName('PER_AQUI_INI').asDateTime,-1,0,1);

      CdsCartaoPonto.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
      CdsCartaoPonto.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('C_CUSTO').asString;
      CdsCartaoPonto.FieldByName('DATAADMISSAO').asString := dmCds.Cds.FieldByName('DATAADMISSAO').asString;
      CdsCartaoPonto.FieldByName('NOMEHORARIO').asString := dmCds.Cds.FieldByName('NOMEHORARIO').asString;

      if (CmpRptCM.ParamByName('FlgDoisCargos').asInteger = 1) and
         (not dmCds.Cds.FieldByName('IDFUNCAO').IsNull) and
         (CdsCargo.Locate('IDCARGO', dmCds.Cds.FieldByName('IDFUNCAO').asFloat, [])) then
        CdsCartaoPonto.FieldByName('CARGO').asString := CdsCargo.FieldByName('TITULO').asString
      else
      begin
        CdsCargo.Locate('IDCARGO', dmCds.Cds.FieldByName('IDCARGO').asFloat, []);
        CdsCartaoPonto.FieldByName('CARGO').asString := CdsCargo.FieldByName('TITULO').asString;
      end;

      IdPessoa := dmCds.Cds.FieldByName('IDPESSOA').asFloat;

      // Traz os registros do Ponto
      CdsPonto.Data := CtrlRegAcessoFunc.ListAcessosPeriodo(
        IdPessoa, 'P', StrToDate(sDataIni), StrToDate(sDataFim));

      // Verifica Horario Variavel
      CdsHorarioVariavel.Data := CtrlHorarioVariavel.ListHorarioVariavel(
        IdPessoa, sDataIni, sDataFim);
      bHorarioVariavel := not CdsHorarioVariavel.Eof;
      if bHorarioVariavel then
        MontaArrayHorario;


      // Calculo os Tipos de Dia no Período
      CdsFerias.First;
      for c:=0 to 30 do
      begin
        // Verifico se o dia é do mês
        if (StrToDate(sDataFim) - StrToDate(sDataIni) + 1) < (c + 1) then
        begin
          CdsCartaoPonto.FieldByName('DIA'+FU.PoeZero(c+1)).asString := 'XXXXXXXXXX';
          continue;
        end;

        // Verifico se houve marcação de ponto
        if not(CdsPonto.IsEmpty) then
        begin
          bTemPonto := false;
          CdsPonto.First;
          while not(CdsPonto.EOF) do
          begin
            if (FormatDateTime('dd/mm/yyyy',CdsPonto.FieldByName('ENTRADA').asDateTime) =
                DateToStr(dtDataRef + c)) then
            begin
              CdsCartaoPonto.FieldByName('DIA'+FU.PoeZero(c+1)).asString :=
                FormatDateTime('hh:mm',CdsPonto.FieldByName('ENTRADA').asDateTime) + ' '+
                FormatDateTime('hh:mm',CdsPonto.FieldByName('SAIDAINTERVALO').asDateTime) + ' '+
                FormatDateTime('hh:mm',CdsPonto.FieldByName('RETORNOINTERVALO').asDateTime) + ' '+
                FormatDateTime('hh:mm',CdsPonto.FieldByName('SAIDA').asDateTime);
              if (CdsCartaoPonto.FieldByName('DIA'+FU.PoeZero(c+1)).asString = '00:00 00:00 00:00 00:00') then
                CdsCartaoPonto.FieldByName('OBS'+FU.PoeZero(c+1)).asString :=
                  FU.CMTranslate('Falta Justif.')
              else if (CdsPonto.FieldByName('FLGABONADO').asString = '1') then
                CdsCartaoPonto.FieldByName('OBS'+FU.PoeZero(c+1)).asString :=
                  FU.CMTranslate('Abonado');

              if (CdsPonto.FieldByName('MOTIVO').asString <> '') then
                CdsCartaoPonto.FieldByName('OBS'+FU.PoeZero(c+1)).asString :=
                  CdsPonto.FieldByName('MOTIVO').asString
              else if (CdsPonto.FieldByName('OBSERVACAO').asString <> '') then
                CdsCartaoPonto.FieldByName('OBS'+FU.PoeZero(c+1)).asString :=
                  CdsPonto.FieldByName('OBSERVACAO').asString;

             bTemPonto := true;
              break;
            end;
            CdsPonto.Next;
          end;

          if (bTemPonto) then
            continue;
        end;

        // Verifico os dias extras do funcionário
        if not(CdsDiasExtras.IsEmpty) and (CdsDiasExtras.Locate('IDPESSOA;DIATRAB',
            VarArrayOf([IdPessoa, dtDataRef + c]), [])) then
        begin
          CdsCartaoPonto.FieldByName('DIA'+FU.PoeZero(c+1)).asString := '';
          continue;
        end;

        // Vejo se o dia atual está no período de férias
        Achou := CdsFerias.Locate('IDPESSOA',IdPessoa,[]);
        if (Achou) and
           ((dtDataRef + C) >= CdsFerias.FieldByName('INIGOZOFERIAS').asDateTime) and
           ((dtDataRef + C) <= CdsFerias.FieldByName('FIMGOZOFERIAS').asDateTime) then
          sValor := FU.CMTranslate('FÉRIAS')
        else
        begin
          // Vejo se o dia atual é uma folga (EXCETO SÁBADOS E DOMINGOS)
          if bHorarioVariavel then
          begin
            CdsTurnoSem.Data := CtrlTurnoSem.ListDiasDaSemana(ArrayHorario[c]);
            Achou := CdsTurnoSem.Locate('IDDIASEMANA',
              DayOfWeek(dtDataRef + c), []);
          end
          else
            Achou := dmCds.Cds.Locate('IDDIASEMANA;IDPESSOA',
              VarArrayOf([DayOfWeek(dtDataRef + c), IdPessoa]), []);

          if not(Achou) and not(DayOfWeek(dtDataRef + c) in [1,7]) then
            sValor := FU.CMTranslate('FOLGA')
          else
          begin
            if (Achou) then
              sValor := ' '
            else
            case DayOfWeek(dtDataRef + c) of
              1 : sValor := FU.CMTranslate('DOMINGO');
              7 : sValor := FU.CMTranslate('SÁBADO');
            end;
          end;

          // Vejo se o dia atual é um feriado
          if (sValor = ' ') and (CdsFeriado.Locate('DATAFERIADO', DateToStr(dtDataRef + C),[loCaseInsensitive])) then
            sValor := FU.CMTranslate('FERIADO');
        end;
        CdsCartaoPonto.FieldByName('DIA'+FU.PoeZero(c+1)).asString := sValor;
        if trim(CdsCartaoPonto.FieldByName('DIA'+FU.PoeZero(c+1)).asString) = '' then
          CdsCartaoPonto.FieldByName('OBS'+FU.PoeZero(c+1)).asString := 'Falta Injust.';
      end;

      // Movo para o último registro do funcionário
      repeat
        dmCds.Cds.Next;
      until (dmCds.Cds.FieldByName('IDPESSOA').asFloat <> IdPessoa) or
            (dmCds.Cds.EOF);

      CdsCartaoPonto.Post;
    until (dmCds.Cds.EOF);

    // Máscara do CGC
    if (Trim(dmCds.Cds.FieldByName('MASCARA_CGC').asString) <> '') then
      rpCartaoPontoDBTxt2.DisplayFormat :=
        dmCds.Cds.FieldByName('MASCARA_CGC').asString+';0;_';
  end
  else
  begin
    CdsCartaoPonto.Insert;
    CdsCartaoPonto.FieldByName('ESTAB').asString := 'XXX';
    CdsCartaoPonto.Post;
    CdsIMG.Data := CtrlListTerceirosRH.ListImagemPessoa(-1);
    CdsIMG.Insert;
    CdsIMG.Post;
  end;
  CdsCartaoPonto.First;
end;

procedure TRptCartaoPonto.MontaArrayHorario;
var
  i: integer;
begin
{  ArrayHorario := VarArrayCreate([0,
    round(FU.TrazUltDiaData(CmpRptCM.ParamByName('DataRef').asDateTime) -
    CmpRptCM.ParamByName('DataRef').asDateTime)], varInteger);
  for i := 0 to Round(FU.TrazUltDiaData(CmpRptCM.ParamByName('DataRef').asDateTime) -
    CmpRptCM.ParamByName('DataRef').asDateTime) do
}
  // Correção feita em 18/04/06:  como estava acima dava erro no array
  // Foi alterado para as 2 linhas abaixo, criando sempre com 31 elementos
  ArrayHorario := VarArrayCreate([0, 30], varInteger);
  for i := 0 to 30 do
  begin
    ArrayHorario [i] := dmCds.Cds.FieldByName('IDHORARIO').asInteger;
    CdsHorarioVariavel.First;
    while not CdsHorarioVariavel.Eof do
    begin
      if (CdsHorarioVariavel.FieldByName('DATAINI').asDateTime <= CmpRptCM.ParamByName('DataRef').asDateTime+i) and
         (CdsHorarioVariavel.FieldByName('DATAFIM').asDateTime >= CmpRptCM.ParamByName('DataRef').asDateTime+i) then
      begin
        ArrayHorario[i] := CdsHorarioVariavel.FieldByName('IDHORARIO').asInteger;
        break;
      end;
      CdsHorarioVariavel.Next;
    end;
  end;
end;

end.
