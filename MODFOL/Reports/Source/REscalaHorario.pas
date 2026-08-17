unit REscalaHorario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppVar, ppPrnabl, ppClass, ppBands, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient,
  uCMClientDataSet, uCmSqlParams, IvDictio, IvMulti,  uCtrlPadroes,
  uCtrlListTerceirosRH, uCtrlDiaExtra, uCtrlFerias, uCtrlCargo, uCtrlHorarioVariavel,
  uCtrlTurnoSem, uCtrlTurnoDia, TXRB;

type
  TRptEscalaHorario = class(TFrmCmReport)
    rpEscalaHorario: TppReport;
    rpEscalaHorarioHdrBnd: TppHeaderBand;
    rpEscalaHorarioDtlBnd: TppDetailBand;
    rpEscalaHorarioShape1: TppShape;
    rpEscalaHorarioShape4: TppShape;
    rpEscalaHorarioShape3: TppShape;
    rpEscalaHorarioShape2: TppShape;
    rpEscalaHorarioShape5: TppShape;
    rpEscalaHorarioShape12: TppShape;
    rpEscalaHorarioShapeDIA29_1: TppShape;
    rpEscalaHorarioShapeDIA31_1: TppShape;
    rpEscalaHorarioShapeDIA30_1: TppShape;
    rpEscalaHorarioShapeDIA31_4: TppShape;
    rpEscalaHorarioShapeDIA30_4: TppShape;
    rpEscalaHorarioShapeDIA29_4: TppShape;
    rpEscalaHorarioShape7: TppShape;
    rpEscalaHorarioShapeDIA29_2: TppShape;
    rpEscalaHorarioShape27: TppShape;
    rpEscalaHorarioShape26: TppShape;
    rpEscalaHorarioShape25: TppShape;
    rpEscalaHorarioShape24: TppShape;
    rpEscalaHorarioShape23: TppShape;
    rpEscalaHorarioShape22: TppShape;
    rpEscalaHorarioShape21: TppShape;
    rpEscalaHorarioShape20: TppShape;
    rpEscalaHorarioShape19: TppShape;
    rpEscalaHorarioShape18: TppShape;
    rpEscalaHorarioShape16: TppShape;
    rpEscalaHorarioShape15: TppShape;
    rpEscalaHorarioShape14: TppShape;
    rpEscalaHorarioShape13: TppShape;
    rpEscalaHorarioShapeDIA31_3: TppShape;
    rpEscalaHorarioShapeDIA30_3: TppShape;
    rpEscalaHorarioShapeDIA29_3: TppShape;
    rpEscalaHorarioShape10: TppShape;
    rpEscalaHorarioShape9: TppShape;
    rpEscalaHorarioShapeDIA31_2: TppShape;
    rpEscalaHorarioShapeDIA30_2: TppShape;
    rpEscalaHorarioShape11: TppShape;
    rpEscalaHorarioShape28: TppShape;
    rpEscalaHorarioShape6: TppShape;
    rpEscalaHorarioLbl2: TppLabel;
    rpEscalaHorarioLbl3: TppLabel;
    rpEscalaHorarioDBTxt1: TppDBText;
    rpEscalaHorarioLblDia01: TppLabel;
    rpEscalaHorarioLblDia02: TppLabel;
    rpEscalaHorarioLblDia03: TppLabel;
    rpEscalaHorarioLblDia04: TppLabel;
    rpEscalaHorarioLblDia05: TppLabel;
    rpEscalaHorarioLblDia06: TppLabel;
    rpEscalaHorarioLblDia07: TppLabel;
    rpEscalaHorarioLblDia08: TppLabel;
    rpEscalaHorarioLblDia09: TppLabel;
    rpEscalaHorarioLblDia10: TppLabel;
    rpEscalaHorarioLblDia11: TppLabel;
    rpEscalaHorarioLblDia12: TppLabel;
    rpEscalaHorarioLblDia13: TppLabel;
    rpEscalaHorarioLblDia14: TppLabel;
    rpEscalaHorarioLblDia15: TppLabel;
    rpEscalaHorarioLblDia16: TppLabel;
    rpEscalaHorarioLblDia17: TppLabel;
    rpEscalaHorarioLblDia18: TppLabel;
    rpEscalaHorarioLblDia19: TppLabel;
    rpEscalaHorarioLblDia20: TppLabel;
    rpEscalaHorarioLblDia21: TppLabel;
    rpEscalaHorarioLblDia22: TppLabel;
    rpEscalaHorarioLblDia23: TppLabel;
    rpEscalaHorarioLblDia24: TppLabel;
    rpEscalaHorarioLblDia25: TppLabel;
    rpEscalaHorarioLblDia26: TppLabel;
    rpEscalaHorarioLblDia27: TppLabel;
    rpEscalaHorarioLblDia28: TppLabel;
    rpEscalaHorarioLblDia29: TppLabel;
    rpEscalaHorarioLblDia30: TppLabel;
    rpEscalaHorarioLblDia31: TppLabel;
    rpEscalaHorarioLbl5: TppLabel;
    rpEscalaHorarioLbl6: TppLabel;
    rpEscalaHorarioShape8: TppShape;
    rpEscalaHorarioLbl8: TppLabel;
    rpEscalaHorarioLbl9: TppLabel;
    rpEscalaHorarioLbl10: TppLabel;
    rpEscalaHorarioLbl11: TppLabel;
    rpEscalaHorarioLbl13: TppLabel;
    rpEscalaHorarioLbl14: TppLabel;
    rpEscalaHorarioLbl15: TppLabel;
    rpEscalaHorarioDBTxt5: TppDBText;
    rpEscalaHorarioDBTxt3: TppDBText;
    rpEscalaHorarioDBTxt4: TppDBText;
    rpEscalaHorarioDBTxt6: TppDBText;
    rpEscalaHorarioLbl7: TppLabel;
    rpEscalaHorarioLbl12: TppLabel;
    rpEscalaHorarioDBTxt2: TppDBText;
    rpEscalaHorarioCalc1: TppCalc;
    rpEscalaHorarioLbl1: TppLabel;
    rpEscalaHorarioDBTxt7: TppDBText;
    rpEscalaHorarioDBTxt9: TppDBText;
    rpEscalaHorarioDBTxt11: TppDBText;
    rpEscalaHorarioDBTxt13: TppDBText;
    rpEscalaHorarioDBTxt15: TppDBText;
    rpEscalaHorarioDBTxt17: TppDBText;
    rpEscalaHorarioDBTxt19: TppDBText;
    rpEscalaHorarioDBTxt21: TppDBText;
    rpEscalaHorarioDBTxt23: TppDBText;
    rpEscalaHorarioDBTxt25: TppDBText;
    rpEscalaHorarioDBTxt27: TppDBText;
    rpEscalaHorarioDBTxt29: TppDBText;
    rpEscalaHorarioDBTxt31: TppDBText;
    rpEscalaHorarioDBTxt33: TppDBText;
    rpEscalaHorarioDBTxt35: TppDBText;
    rpEscalaHorarioDBTxt37: TppDBText;
    rpEscalaHorarioDBTxt39: TppDBText;
    rpEscalaHorarioDBTxt41: TppDBText;
    rpEscalaHorarioDBTxt43: TppDBText;
    rpEscalaHorarioDBTxt45: TppDBText;
    rpEscalaHorarioDBTxt47: TppDBText;
    rpEscalaHorarioDBTxt49: TppDBText;
    rpEscalaHorarioDBTxt51: TppDBText;
    rpEscalaHorarioDBTxt53: TppDBText;
    rpEscalaHorarioDBTxt55: TppDBText;
    rpEscalaHorarioDBTxt57: TppDBText;
    rpEscalaHorarioDBTxt59: TppDBText;
    rpEscalaHorarioDBTxt61: TppDBText;
    rpEscalaHorarioDBTxtDia29a: TppDBText;
    rpEscalaHorarioDBTxtDia30a: TppDBText;
    rpEscalaHorarioDBTxtDia31a: TppDBText;
    rpEscalaHorarioDBTxtEnt31: TppDBText;
    rpEscalaHorarioDBTxtEnt30: TppDBText;
    rpEscalaHorarioDBTxtEnt29: TppDBText;
    rpEscalaHorarioDBTxtEnt28: TppDBText;
    rpEscalaHorarioDBTxtEnt27: TppDBText;
    rpEscalaHorarioDBTxtEnt26: TppDBText;
    rpEscalaHorarioDBTxtEnt25: TppDBText;
    rpEscalaHorarioDBTxtEnt24: TppDBText;
    rpEscalaHorarioDBTxtEnt23: TppDBText;
    rpEscalaHorarioDBTxtEnt22: TppDBText;
    rpEscalaHorarioDBTxtEnt21: TppDBText;
    rpEscalaHorarioDBTxtEnt20: TppDBText;
    rpEscalaHorarioDBTxtEnt19: TppDBText;
    rpEscalaHorarioDBTxtEnt18: TppDBText;
    rpEscalaHorarioDBTxtEnt17: TppDBText;
    rpEscalaHorarioDBTxtEnt16: TppDBText;
    rpEscalaHorarioDBTxtEnt15: TppDBText;
    rpEscalaHorarioDBTxtEnt14: TppDBText;
    rpEscalaHorarioDBTxtEnt13: TppDBText;
    rpEscalaHorarioDBTxtEnt12: TppDBText;
    rpEscalaHorarioDBTxtEnt11: TppDBText;
    rpEscalaHorarioDBTxtEnt10: TppDBText;
    rpEscalaHorarioDBTxtEnt09: TppDBText;
    rpEscalaHorarioDBTxtEnt08: TppDBText;
    rpEscalaHorarioDBTxtEnt07: TppDBText;
    rpEscalaHorarioDBTxtEnt06: TppDBText;
    rpEscalaHorarioDBTxtEnt05: TppDBText;
    rpEscalaHorarioDBTxtEnt04: TppDBText;
    rpEscalaHorarioDBTxtEnt03: TppDBText;
    rpEscalaHorarioDBTxtEnt02: TppDBText;
    rpEscalaHorarioDBTxtEnt01: TppDBText;
    rpEscalaHorarioDBTxtSai01: TppDBText;
    rpEscalaHorarioDBTxtSai02: TppDBText;
    rpEscalaHorarioDBTxtSai03: TppDBText;
    rpEscalaHorarioDBTxtSai04: TppDBText;
    rpEscalaHorarioDBTxtSai05: TppDBText;
    rpEscalaHorarioDBTxtSai06: TppDBText;
    rpEscalaHorarioDBTxtSai07: TppDBText;
    rpEscalaHorarioDBTxtSai08: TppDBText;
    rpEscalaHorarioDBTxtSai09: TppDBText;
    rpEscalaHorarioDBTxtSai10: TppDBText;
    rpEscalaHorarioDBTxtSai11: TppDBText;
    rpEscalaHorarioDBTxtSai12: TppDBText;
    rpEscalaHorarioDBTxtSai13: TppDBText;
    rpEscalaHorarioDBTxtSai14: TppDBText;
    rpEscalaHorarioDBTxtSai16: TppDBText;
    rpEscalaHorarioDBTxtSai17: TppDBText;
    rpEscalaHorarioDBTxtSai18: TppDBText;
    rpEscalaHorarioDBTxtSai19: TppDBText;
    rpEscalaHorarioDBTxtSai20: TppDBText;
    rpEscalaHorarioDBTxtSai21: TppDBText;
    rpEscalaHorarioDBTxtSai22: TppDBText;
    rpEscalaHorarioDBTxtSai23: TppDBText;
    rpEscalaHorarioDBTxtSai24: TppDBText;
    rpEscalaHorarioDBTxtSai25: TppDBText;
    rpEscalaHorarioDBTxtSai26: TppDBText;
    rpEscalaHorarioDBTxtSai27: TppDBText;
    rpEscalaHorarioDBTxtSai28: TppDBText;
    rpEscalaHorarioDBTxtSai29: TppDBText;
    rpEscalaHorarioDBTxtSai30: TppDBText;
    rpEscalaHorarioDBTxtSai31: TppDBText;
    rpEscalaHorarioDBTxtSai15: TppDBText;
    rpEscalaHorarioLbl4: TppLabel;
    rpEscalaHorarioLine1: TppLine;
    rpEscalaHorarioLine2: TppLine;
    rpEscalaHorarioLbl17: TppLabel;
    rpEscalaHorarioDBTxt8: TppDBText;
    rpEscalaHorarioDBTxt10: TppDBText;
    rpEscalaHorarioDBTxt12: TppDBText;
    rpEscalaHorarioDBTxt14: TppDBText;
    rpEscalaHorarioDBTxt16: TppDBText;
    rpEscalaHorarioDBTxt18: TppDBText;
    rpEscalaHorarioDBTxt20: TppDBText;
    rpEscalaHorarioDBTxt22: TppDBText;
    rpEscalaHorarioDBTxt24: TppDBText;
    rpEscalaHorarioDBTxt26: TppDBText;
    rpEscalaHorarioDBTxt28: TppDBText;
    rpEscalaHorarioDBTxt30: TppDBText;
    rpEscalaHorarioDBTxt32: TppDBText;
    rpEscalaHorarioDBTxt34: TppDBText;
    rpEscalaHorarioDBTxt36: TppDBText;
    rpEscalaHorarioDBTxt38: TppDBText;
    rpEscalaHorarioDBTxt40: TppDBText;
    rpEscalaHorarioDBTxt42: TppDBText;
    rpEscalaHorarioDBTxt44: TppDBText;
    rpEscalaHorarioDBTxt46: TppDBText;
    rpEscalaHorarioDBTxt48: TppDBText;
    rpEscalaHorarioDBTxt50: TppDBText;
    rpEscalaHorarioDBTxt52: TppDBText;
    rpEscalaHorarioDBTxt54: TppDBText;
    rpEscalaHorarioDBTxt56: TppDBText;
    rpEscalaHorarioDBTxt58: TppDBText;
    rpEscalaHorarioDBTxt60: TppDBText;
    rpEscalaHorarioDBTxt62: TppDBText;
    rpEscalaHorarioDBTxtDia29b: TppDBText;
    rpEscalaHorarioDBTxtDia30b: TppDBText;
    rpEscalaHorarioDBTxtDia31b: TppDBText;
    rpEscalaHorarioShapeDIA29_5: TppShape;
    rpEscalaHorarioShapeDIA30_5: TppShape;
    rpEscalaHorarioShapeDIA31_5: TppShape;
    rpEscalaHorarioLbl16: TppLabel;
    ppEscalaHorario: TppDBPipeLine;
    dsEscalaHorario: TwwDataSource;
    sqlEscalaHorario: TCMSqlParams;
    CdsEscalaHorario: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsFerias: TCMClientDataSet;
    CdsDiasExtras: TCMClientDataSet;
    CdsFeriado: TCMClientDataSet;
    CdsHorarioVariavel: TCMClientDataSet;
    CdsTurno: TCMClientDataSet;
    CdsTurnoDiario: TCMClientDataSet;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
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
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
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
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    CdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsEscalaHorarioAfterScroll(DataSet: TDataSet);
    procedure rpEscalaHorarioHdrBndAfterPrint(Sender: TObject);
    procedure rpEscalaHorarioDtlBndBeforePrint(Sender: TObject);
    procedure rpEscalaHorarioBeforePrint(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlDiaExtra: TCtrlDiaExtra;
    CtrlFerias: TCtrlFerias;
    CtrlCargo: TCtrlCargo;
    CtrlHorarioVariavel: TCtrlHorarioVariavel;
    CtrlTurnoSem: TCtrlTurnoSem;
    CtrlTurnoDia: TCtrlTurnoDia;

    iNumDiasMes, iMes, iAno: integer;
    ArrayHorario: variant;
    bHorarioVariavel: boolean;
    sListaIdFuncSel: string;
    dtDataIni, dtDataFim: TDateTime;

    procedure GerarDadosRelat;
    procedure AbrirQueryAuxiliar;
    procedure MontaArrayHorario;
    procedure RefazHorario(Posicao: integer);
  end;

var
  RptEscalaHorario: TRptEscalaHorario;

implementation

uses uCMTypes,  fAguarde, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptEscalaHorario.FormCreate(Sender: TObject);
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

  CtrlHorarioVariavel := TCtrlHorarioVariavel.Create;
  CtrlHorarioVariavel.InitializeAs(Padroes);

  CtrlTurnoSem := TCtrlTurnoSem.Create;
  CtrlTurnoSem.InitializeAs(Padroes);

  CtrlTurnoDia := TCtrlTurnoDia.Create;
  CtrlTurnoDia.InitializeAs(Padroes);
end;

procedure TRptEscalaHorario.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlDiaExtra);
  FreeAndNil(CtrlFerias);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlHorarioVariavel);
  FreeAndNil(CtrlTurnoSem);
  FreeAndNil(CtrlTurnoDia);
  inherited;
end;

procedure TRptEscalaHorario.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  iMes := CmpRptCM.ParamByName('MesRef').asInteger;
  iAno := CmpRptCM.ParamByName('AnoRef').asInteger;
  iNumDiasMes := FU.TrazUltDiaMes(iMes, iAno);
  dtDataIni := StrToDate('01/'+ FU.PoeZero(iMes) +'/'+ IntToStr(iAno));
  dtDataFim := StrToDate((IntToStr(iNumDiasMes) +'/'+ FU.PoeZero(iMes) +'/'+ IntToStr(iAno)));

  // Monta Query Auxiliar
  with (sqlAux.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB,');
    Add('  CGC.NUM AS CNPJ,');
    Add('  E.IDCIDADES,');
    Add('  ES.IDPAIS,');
    Add('  RTRIM(ES.CODESTADO) AS UF,');
    Add('  F.IDPESSOA,');
    Add('  F.MATRICULA,');
    Add('  ' +QuotedStr(FU.MesExtensoAno(IntToStr(iAno) +'/'+ FU.PoeZero(iMes)))+ ' AS REFERENCIA,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  CTPS.NUM AS CTPS,');
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
    Add('  HT.FLGTIPOHORARIO,');
    Add('  HT.NOMEHORARIO,');
    Add('  TS.IDHORARIO,');
    Add('  TS.IDDIASEMANA,');
    Add('  TD.IDTURNODIARIO,');
    Add('  TD.INICIOEXPEDIENTE,');
    Add('  TD.INICIOALMOCO,');
    Add('  TD.FINALALMOCO,');
    Add('  TD.FINALEXPEDIENTE');
    // -------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, ENDPESS E, ESTADO ES, CIDADES,');
    Add('  CENTCUST CC, HORATRAB HT, TURNODIA TD, TURNOSEM TS, SITFUNC ST,');
    // ------------------------------------------------------------------------------- //
    // Última evolução Funcional do Funcionário
    // --------------------------------------------------------------------------------//
    Add('  (SELECT EF.IDCARGO, EF.IDFUNCAO, EF.IDPESSOA, EF.IDEMPRESA, EF.CODCENTROCUSTO');
    Add('   FROM   EVOLFUNC EF,');
    Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('           FROM   EVOLFUNC');
    Add('           WHERE  (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(DateToStr(dtDataFim))+ ',''DD/MM/YYYY''))');
    Add('           GROUP BY IDPESSOA) HST2,');
    Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
    Add('           FROM   EVOLFUNC');
    Add('           WHERE  (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(DateToStr(dtDataFim))+ ',''DD/MM/YYYY''))');
    Add('           GROUP BY IDPESSOA) HST3');
    Add('    WHERE  (EF.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('           (EF.IDPESSOA      = HST2.IDPESSOA) AND');
    Add('           (EF.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
    Add('           (EF.IDPESSOA      = HST3.IDPESSOA)) HST,');
    // -------------------------------------------------------------------------- //
    // CGC da Empresa
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, FILIALPESSOA FP');
    Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    Add('           (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('          (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('          (FP.IDFILIALPESSOA   = DP.IDPESSOA) AND');
    Add('          (DP.IDDOCUMENTO      = TDO.IDDOCUMENTO)) CGC,');
    // -------------------------------------------------------------------------- //
    // CTPS do Empregado
    Add('  (SELECT DP.IDPESSOA, RTRIM(DP.NUMDOCUMENTO)||'' (''||RTRIM(ES.CODESTADO)||'')'' AS NUM');
    Add('   FROM   DOCPESSOA DP, ESTADO ES, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPAIS          = ES.IDPAIS) AND');
    Add('         (DP.IDESTADO        = ES.IDESTADO)) CTPS');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add(FU.MontaLinhaSelSQL('  (PJ.IDPESSOA',CmpRptCM.ParamByName('ListaIdEstab').asString, 7));

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
    Add('  (F.IDHORARIO        = TS.IDHORARIO) AND');
    Add('  (TS.IDTURNODIARIO   = TD.IDTURNODIARIO) AND');
    Add('  (PJ.IDPESSOA        = CGC.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL  = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA        = E.IDPESSOA) AND');
    Add('  (E.IDCIDADES        = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO   = ES.IDESTADO) AND');
    Add('  (PF.IDPESSOA        = CTPS.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA         = HST.IDPESSOA(+))');
    SaveToFile(FU.DirTempLog + '\qry.txt');
  end;
  AbrirQueryAuxiliar;

  // Montar Query Principal
  GerarDadosRelat;

  frmAguarde.Max := CdsEscalaHorario.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptEscalaHorario.AbrirQueryAuxiliar;
begin
  sqlAux.Open;
  // Criar o índice
  case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
    0 : CdsAux.AddIndex('Index1', 'EMPREGADO;C_CUSTO', [ixCaseInsensitive], '', 'EMPREGADO;C_CUSTO');
    1 : CdsAux.AddIndex('Index1', 'MATRICULA;C_CUSTO', [ixCaseInsensitive], '', 'C_CUSTO');
    2 : CdsAux.AddIndex('Index1', 'C_CUSTO;EMPREGADO', [ixCaseInsensitive], '', 'C_CUSTO;EMPREGADO');
    3 : CdsAux.AddIndex('Index1', 'C_CUSTO;MATRICULA', [ixCaseInsensitive], '', 'C_CUSTO');
  end;
  CdsAux.IndexName := 'Index1';
  CdsAux.First;
end;

procedure TRptEscalaHorario.CdsEscalaHorarioAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptEscalaHorario.rpEscalaHorarioBeforePrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptEscalaHorario.rpEscalaHorarioHdrBndAfterPrint(Sender: TObject);
begin
  rpEscalaHorarioLblDia29.Visible := (iNumDiasMes >= 29);
  rpEscalaHorarioLblDia30.Visible := (iNumDiasMes >= 30);
  rpEscalaHorarioLblDia31.Visible := (iNumDiasMes  = 31);

  rpEscalaHorarioShapeDIA29_1.Visible := (iNumDiasMes >= 29);
  rpEscalaHorarioShapeDIA29_2.Visible := (iNumDiasMes >= 29);
  rpEscalaHorarioShapeDIA29_3.Visible := (iNumDiasMes >= 29);
  rpEscalaHorarioShapeDIA29_4.Visible := (iNumDiasMes >= 29);
  rpEscalaHorarioShapeDIA29_5.Visible := (iNumDiasMes >= 29);

  rpEscalaHorarioShapeDIA30_1.Visible := (iNumDiasMes >= 30);
  rpEscalaHorarioShapeDIA30_2.Visible := (iNumDiasMes >= 30);
  rpEscalaHorarioShapeDIA30_3.Visible := (iNumDiasMes >= 30);
  rpEscalaHorarioShapeDIA30_4.Visible := (iNumDiasMes >= 30);
  rpEscalaHorarioShapeDIA30_5.Visible := (iNumDiasMes >= 30);

  rpEscalaHorarioShapeDIA31_1.Visible := (iNumDiasMes = 31);
  rpEscalaHorarioShapeDIA31_2.Visible := (iNumDiasMes = 31);
  rpEscalaHorarioShapeDIA31_3.Visible := (iNumDiasMes = 31);
  rpEscalaHorarioShapeDIA31_4.Visible := (iNumDiasMes = 31);
  rpEscalaHorarioShapeDIA31_5.Visible := (iNumDiasMes = 31);

  rpEscalaHorarioDBTxtDia29a.Visible := (iNumDiasMes >= 29);
  rpEscalaHorarioDBTxtDia29b.Visible := (iNumDiasMes >= 29);

  rpEscalaHorarioDBTxtDia30a.Visible := (iNumDiasMes >= 30);
  rpEscalaHorarioDBTxtDia30b.Visible := (iNumDiasMes >= 30);

  rpEscalaHorarioDBTxtDia31a.Visible := (iNumDiasMes = 31);
  rpEscalaHorarioDBTxtDia31b.Visible := (iNumDiasMes = 31);

  rpEscalaHorarioDBTxtEnt29.Visible := (iNumDiasMes >= 29);
  rpEscalaHorarioDBTxtSai29.Visible := (iNumDiasMes >= 29);

  rpEscalaHorarioDBTxtEnt30.Visible := (iNumDiasMes >= 30);
  rpEscalaHorarioDBTxtSai30.Visible := (iNumDiasMes >= 30);

  rpEscalaHorarioDBTxtEnt31.Visible := (iNumDiasMes = 31);
  rpEscalaHorarioDBTxtSai31.Visible := (iNumDiasMes = 31);
end;

procedure TRptEscalaHorario.rpEscalaHorarioDtlBndBeforePrint(Sender: TObject);
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
  begin
    TppDBText(Self.FindComponent('rpEscalaHorarioDBTxtEnt'+FU.PoeZero(c))).Visible :=
      (FU.StringEm(CdsEscalaHorario.FieldByName('DIA'+FU.PoeZero(c)).asString, SetDias) = -1) and
      (CmpRptCM.ParamByName('ImprimeHorarios').asBoolean);
    TppDBText(Self.FindComponent('rpEscalaHorarioDBTxtSai'+FU.PoeZero(c))).Visible :=
      (FU.StringEm(CdsEscalaHorario.FieldByName('DIA'+FU.PoeZero(c)).asString, SetDias) = -1) and
      (CmpRptCM.ParamByName('ImprimeHorarios').asBoolean);
  end;
end;

procedure TRptEscalaHorario.GerarDadosRelat;
var
  bAchou: boolean;
  IdPessoa: double;
  c: integer;
  sValor: string;
begin
  sqlEscalaHorario.Open;
  if not(CdsAux.IsEmpty) then
  begin
    // Turnos diários
    CdsTurnoDiario.Data := CtrlTurnoDia.ListTurnoDiario;

    // Todos os feriados no período
    CdsFeriado.Data := CtrlListTerceirosRH.ListFeriados(
      CdsAux.FieldByName('IDCIDADES').asInteger,
      CdsAux.FieldByName('IDPAIS').asInteger,
      CdsAux.FieldByName('UF').asString,
      dtDataIni, dtDataFim, 'O,E');

    // Pego o ID de cada funcionário Listado na Query Auxiliar para ver se têm Férias para o
    // período especificado
    sListaIdFuncSel := '';
    repeat
      if (sListaIdFuncSel = '') then
        sListaIdFuncSel := CdsAux.FieldByName('IDPESSOA').asString
      else
        sListaIdFuncSel := sListaIdFuncSel +','+ CdsAux.FieldByName('IDPESSOA').asString;

      IdPessoa := CdsAux.FieldByName('IDPESSOA').asFloat;
      repeat
        CdsAux.Next;                  
      until (IdPessoa <> CdsAux.FieldByName('IDPESSOA').asFloat) or (CdsAux.EOF);
    until (CdsAux.EOF);

    // Todos os dias extras no período para os funcionários selecionados
    CdsDiasExtras.Data := CtrlDiaExtra.ListDiasExtra(sListaIdFuncSel, dtDataIni, dtDataFim);

    // Todos os períodos de férias no período
    CdsFerias.Data := CtrlFerias.ListFeriasNoPeriodo(sListaIdFuncSel, dtDataIni, dtDataFim);

    // Cargos dos Empregados
    CdsCargo.Data := CtrlCargo.ListCargo;

    // ---------------------------------------------------------------------------
    // Gravo registros
    // ---------------------------------------------------------------------------
    CdsAux.First;
    repeat
      CdsEscalaHorario.Append;
      CdsEscalaHorario.FieldByName('ESTAB').asString := CdsAux.FieldByName('ESTAB').asString;
      CdsEscalaHorario.FieldByName('CNPJ').asString := CdsAux.FieldByName('CNPJ').asString;
      CdsEscalaHorario.FieldByName('MATRICULA').asString := CdsAux.FieldByName('MATRICULA').asString;
      CdsEscalaHorario.FieldByName('REFERENCIA').asString := CdsAux.FieldByName('REFERENCIA').asString;
      CdsEscalaHorario.FieldByName('EMPREGADO').asString := CdsAux.FieldByName('EMPREGADO').asString;
      CdsEscalaHorario.FieldByName('CTPS').asString := CdsAux.FieldByName('CTPS').asString;
      CdsEscalaHorario.FieldByName('C_CUSTO').asString := CdsAux.FieldByName('C_CUSTO').asString;
      CdsEscalaHorario.FieldByName('DATAADMISSAO').asString := CdsAux.FieldByName('DATAADMISSAO').asString;
      CdsEscalaHorario.FieldByName('NOMEHORARIO').asString := CdsAux.FieldByName('NOMEHORARIO').asString;

      if (CmpRptCM.ParamByName('FlgDoisCargos').asInteger = 1) and
         (not CdsAux.FieldByName('IDFUNCAO').IsNull) and
         (CdsCargo.Locate('IDCARGO', CdsAux.FieldByName('IDFUNCAO').Value, [])) then
        CdsEscalaHorario.FieldByName('CARGO').asString := CdsCargo.FieldByName('TITULO').asString
      else
      begin
        CdsCargo.Locate('IDCARGO', CdsAux.FieldByName('IDCARGO').Value, []);
        CdsEscalaHorario.FieldByName('CARGO').asString := CdsCargo.FieldByName('TITULO').asString;
      end;

      IdPessoa := CdsAux.FieldByName('IDPESSOA').asFloat;

      CdsHorarioVariavel.Data := CtrlHorarioVariavel.ListHorarioVariavel(
        IdPessoa, DateToStr(dtDataIni), DateToStr(dtDataFim));
      bHorarioVariavel := not(CdsHorarioVariavel.IsEmpty);
      if (bHorarioVariavel) then
      begin
        MontaArrayHorario;
        CdsTurno.Data := CtrlTurnoSem.ListDiasDaSemana(-1);
      end;  

      // Calculo os Tipos de Dia no Período
      CdsFerias.First;
      for c:=0 to iNumDiasMes-1 do
      begin
        // Verifico se o dia é do mês
        if (iNumDiasMes < (c+1)) then
        begin
          CdsEscalaHorario.FieldByName('DIA'+FU.PoeZero(c+1)).asString := FU.CMTranslate('FINAL');
          continue;
        end;

        // Verifico os dias extras do funcionário
        if not(CdsDiasExtras.IsEmpty) and (CdsDiasExtras.Locate('IDPESSOA;DIATRAB',
           VarArrayOf([IdPessoa, dtDataIni + c]), [])) then
        begin
          CdsEscalaHorario.FieldByName('DIA'+FU.PoeZero(c+1)).asString := '';
          continue;
        end;

        // Vejo se o dia atual está no período de férias
        bAchou := CdsFerias.Locate('IDPESSOA', IdPessoa, []);
        if (bAchou) and
           ((dtDataIni + c) >= CdsFerias.FieldByName('INIGOZOFERIAS').asDateTime) and
           ((dtDataIni + c) <= CdsFerias.FieldByName('FIMGOZOFERIAS').asDateTime) then
          sValor := FU.CMTranslate('FÉRIAS')
        else
        begin
          if (bHorarioVariavel) then
          begin
            RefazHorario(c);
            // Ver se dia atual é uma folga (EXCETO SÁBADOS E DOMINGOS)
            bAchou := CdsTurno.Locate('IDDIASEMANA', DayOfWeek(dtDataIni + c), []);

            if (bAchou) then
            begin
              CdsTurnoDiario.Locate('IDTURNODIARIO',
                CdsTurnoDiario.FieldByName('IDTURNODIARIO').asInteger, []);

              CdsEscalaHorario.FieldByName('INICIOALMOCO_'+FU.PoeZero(c+1)).asString :=
                CdsTurnoDiario.FieldByName('INICIOALMOCO').asString;
              CdsEscalaHorario.FieldByName('FINALALMOCO_'+FU.PoeZero(c+1)).asString :=
                CdsTurnoDiario.FieldByName('FINALALMOCO').asString;

              CdsEscalaHorario.FieldByName('ENTRADA_'+FU.PoeZero(c+1)).asString :=
                CdsTurnoDiario.FieldByName('INICIOEXPEDIENTE').asString;
              CdsEscalaHorario.FieldByName('SAIDA_'+FU.PoeZero(c+1)).asString :=
                CdsTurnoDiario.FieldByName('FINALEXPEDIENTE').asString;
            end;
          end
          else
          begin
            // Ver se dia atual é uma folga (EXCETO SÁBADOS E DOMINGOS)
            bAchou := CdsAux.Locate('IDDIASEMANA;IDPESSOA',
              VarArrayOf([DayOfWeek(dtDataIni + c), IdPessoa]), []);

            if (bAchou) then
            begin
              CdsEscalaHorario.FieldByName('INICIOALMOCO_'+FU.PoeZero(c+1)).asString :=
                CdsAux.FieldByName('INICIOALMOCO').asString;
              CdsEscalaHorario.FieldByName('FINALALMOCO_'+FU.PoeZero(c+1)).asString :=
                CdsAux.FieldByName('FINALALMOCO').asString;
              CdsEscalaHorario.FieldByName('ENTRADA_'+FU.PoeZero(c+1)).asString :=
                CdsAux.FieldByName('INICIOEXPEDIENTE').asString;
              CdsEscalaHorario.FieldByName('SAIDA_'+FU.PoeZero(c+1)).asString :=
                CdsAux.FieldByName('FINALEXPEDIENTE').asString;
            end;
          end;

          if not(bAchou) and not(DayOfWeek(dtDataIni + c) in [1,7]) then
            sValor := FU.CMTranslate('FOLGA')
          else
          begin
            if (bAchou) then
              sValor := ' '
            else
            case DayOfWeek(dtDataIni + c) of
              1 : sValor := FU.CMTranslate('DOMINGO');
              7 : sValor := FU.CMTranslate('SÁBADO');
            end;
          end;

          // Vejo se o dia atual é um feriado
          if (sValor = ' ') and
             (CdsFeriado.Locate('DATAFERIADO', DateToStr(dtDataIni + c), [loCaseInsensitive])) then
          begin
            if (CdsFeriado.FieldByName('FLGTIPO').asString = 'E') then
              sValor := FU.CMTranslate('COMPENSADO')
            else
              sValor := FU.CMTranslate('FERIADO');
          end;
        end;
        CdsEscalaHorario.FieldByName('DIA'+FU.PoeZero(c+1)).asString := sValor;
      end;

      // Movo para o último registro do funcionário
      repeat
        CdsAux.Next;
      until (CdsAux.FieldByName('IDPESSOA').asFloat <> IdPessoa) or (CdsAux.EOF);

      CdsEscalaHorario.Post;
    until (CdsAux.EOF);
  end
  else
  begin
    CdsEscalaHorario.Insert;
    CdsEscalaHorario.Post;
  end;
  CdsEscalaHorario.First;
end;

procedure TRptEscalaHorario.MontaArrayHorario;
var
  c: integer;
begin
  ArrayHorario := VarArrayCreate([0, iNumDiasMes-1], varInteger);

  for c:=0 to iNumDiasMes-1 do
  begin
    ArrayHorario[c] := CdsAux.FieldByName('IDHORARIO').asInteger;
    CdsHorarioVariavel.First;
    while not(CdsHorarioVariavel.EOF) do
    begin
      if (CdsHorarioVariavel.FieldByName('DATAINI').asDateTime <= dtDataIni + c) and
         (CdsHorarioVariavel.FieldByName('DATAFIM').asDateTime >= dtDataIni + c) then
      begin
        ArrayHorario[c] := CdsHorarioVariavel.FieldByName('IDHORARIO').asInteger;
        break;
      end;
      CdsHorarioVariavel.Next;
    end;
  end;
end;

procedure TRptEscalaHorario.RefazHorario(Posicao: integer);
begin
  if (CdsTurno.FieldByName('IDHORARIO').asInteger <> ArrayHorario[Posicao]) then
  begin
    CdsTurno.Data := CtrlTurnoSem.ListDiasDaSemana(ArrayHorario[Posicao]);
    CdsTurnoDiario.Locate('IDTURNODIARIO', CdsTurno.FieldByName('IDTURNODIARIO').asInteger, []);
  end;
end;

end.
