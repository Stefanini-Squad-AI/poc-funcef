// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RFolhaFreq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  DBClient, uCMClientDataSet, uCmSqlParams, uCtrlPadroes, uCtrlListTerceirosRH, uCtrlDiaExtra,
  uCtrlFerias, uCtrlCargo, ppRegion, TXRB, Usistema;

type
  TRptFolhaFreq = class(TFrmCmReport)
    sqlFolhaFreq: TCMSqlParams;
    CdsFolhaFreq: TCMClientDataSet;
    rpFolhaFreq: TppReport;
    rpFolhaFreqHdrBnd: TppColumnHeaderBand;
    rpFolhaFreqDtlBnd: TppDetailBand;
    rpFolhaFreqShapeDia31_3: TppShape;
    rpFolhaFreqShapeDia30_3: TppShape;
    rpFolhaFreqShapeDia29_3: TppShape;
    rpFolhaFreqShapeDia31_2: TppShape;
    rpFolhaFreqShapeDia30_2: TppShape;
    rpFolhaFreqShapeDia29_2: TppShape;
    rpFolhaFreqShapeDia30_1: TppShape;
    rpFolhaFreqShapeDia29_1: TppShape;
    rpFolhaFreqShape4: TppShape;
    rpFolhaFreqShape2: TppShape;
    rpFolhaFreqShape3: TppShape;
    rpFolhaFreqShape5: TppShape;
    rpFolhaFreqShapeDia31_1: TppShape;
    rpFolhaFreqShape6: TppShape;
    rpFolhaFreqShape1: TppShape;
    rpFolhaFreqShape7: TppShape;
    rpFolhaFreqShape20: TppShape;
    rpFolhaFreqShape19: TppShape;
    rpFolhaFreqShape18: TppShape;
    rpFolhaFreqShape17: TppShape;
    rpFolhaFreqShape16: TppShape;
    rpFolhaFreqShape15: TppShape;
    rpFolhaFreqShape14: TppShape;
    rpFolhaFreqShape13: TppShape;
    rpFolhaFreqShape12: TppShape;
    rpFolhaFreqShape11: TppShape;
    rpFolhaFreqShape10: TppShape;
    rpFolhaFreqShape9: TppShape;
    rpFolhaFreqShape8: TppShape;
    rpFolhaFreqLbl1: TppLabel;
    rpFolhaFreqLblDia01: TppLabel;
    rpFolhaFreqLblDia02: TppLabel;
    rpFolhaFreqLblDia03: TppLabel;
    rpFolhaFreqLblDia04: TppLabel;
    rpFolhaFreqLblDia05: TppLabel;
    rpFolhaFreqLblDia06: TppLabel;
    rpFolhaFreqLblDia07: TppLabel;
    rpFolhaFreqLblDia08: TppLabel;
    rpFolhaFreqLblDia09: TppLabel;
    rpFolhaFreqLblDia10: TppLabel;
    rpFolhaFreqLblDia11: TppLabel;
    rpFolhaFreqLblDia12: TppLabel;
    rpFolhaFreqLblDia13: TppLabel;
    rpFolhaFreqLblDia14: TppLabel;
    rpFolhaFreqLblDia15: TppLabel;
    rpFolhaFreqLbl15: TppLabel;
    rpFolhaFreqLbl13: TppLabel;
    rpFolhaFreqLbl14: TppLabel;
    rpFolhaFreqDBTxt6: TppDBText;
    rpFolhaFreqLine9: TppLine;
    rpFolhaFreqLine8: TppLine;
    rpFolhaFreqLine10: TppLine;
    rpFolhaFreqDBTxt2: TppDBText;
    rpFolhaFreqDBTxt1: TppDBText;
    rpFolhaFreqDBTxt5: TppDBText;
    rpFolhaFreqDBTxt4: TppDBText;
    rpFolhaFreqDBTxt3: TppDBText;
    rpFolhaFreqDBTxt7: TppDBText;
    rpFolhaFreqDBTxt9: TppDBText;
    rpFolhaFreqDBTxt8: TppDBText;
    rpFolhaFreqDBTxt10: TppDBText;
    rpFolhaFreqLbl16: TppLabel;
    rpFolhaFreqLbl18: TppLabel;
    rpFolhaFreqLbl19: TppLabel;
    rpFolhaFreqLbl20: TppLabel;
    rpFolhaFreqLine15: TppLine;
    rpFolhaFreqLbl21: TppLabel;
    rpFolhaFreqLine14: TppLine;
    rpFolhaFreqLbl17: TppLabel;
    rpFolhaFreqLblDia16: TppLabel;
    rpFolhaFreqLblDia17: TppLabel;
    rpFolhaFreqLblDia18: TppLabel;
    rpFolhaFreqLblDia19: TppLabel;
    rpFolhaFreqLblDia20: TppLabel;
    rpFolhaFreqLblDia21: TppLabel;
    rpFolhaFreqLblDia22: TppLabel;
    rpFolhaFreqLblDia23: TppLabel;
    rpFolhaFreqLblDia24: TppLabel;
    rpFolhaFreqLblDia25: TppLabel;
    rpFolhaFreqLblDia26: TppLabel;
    rpFolhaFreqLblDia27: TppLabel;
    rpFolhaFreqLblDia28: TppLabel;
    rpFolhaFreqLblDia29: TppLabel;
    rpFolhaFreqLine12: TppLine;
    rpFolhaFreqLine11: TppLine;
    rpFolhaFreqLblDia30: TppLabel;
    rpFolhaFreqLblDia31: TppLabel;
    rpFolhaFreqLbl7: TppLabel;
    rpFolhaFreqLbl6: TppLabel;
    rpFolhaFreqLbl5: TppLabel;
    rpFolhaFreqLbl3: TppLabel;
    rpFolhaFreqLbl2: TppLabel;
    rpFolhaFreqLine1: TppLine;
    rpFolhaFreqLbl8: TppLabel;
    rpFolhaFreqLbl9: TppLabel;
    rpFolhaFreqLblEmpregado: TppLabel;
    rpFolhaFreqLbl10: TppLabel;
    rpFolhaFreqLbl11: TppLabel;
    rpFolhaFreqLine3: TppLine;
    rpFolhaFreqLine6: TppLine;
    rpFolhaFreqTextDia01: TppDBText;
    rpFolhaFreqTextDia02: TppDBText;
    rpFolhaFreqTextDia03: TppDBText;
    rpFolhaFreqTextDia04: TppDBText;
    rpFolhaFreqTextDia05: TppDBText;
    rpFolhaFreqTextDia06: TppDBText;
    rpFolhaFreqTextDia07: TppDBText;
    rpFolhaFreqTextDia08: TppDBText;
    rpFolhaFreqTextDia09: TppDBText;
    rpFolhaFreqTextDia10: TppDBText;
    rpFolhaFreqTextDia11: TppDBText;
    rpFolhaFreqTextDia12: TppDBText;
    rpFolhaFreqTextDia13: TppDBText;
    rpFolhaFreqTextDia14: TppDBText;
    rpFolhaFreqTextDia15: TppDBText;
    rpFolhaFreqTextDia16: TppDBText;
    rpFolhaFreqTextDia17: TppDBText;
    rpFolhaFreqTextDia18: TppDBText;
    rpFolhaFreqTextDia19: TppDBText;
    rpFolhaFreqTextDia20: TppDBText;
    rpFolhaFreqTextDia21: TppDBText;
    rpFolhaFreqTextDia22: TppDBText;
    rpFolhaFreqTextDia23: TppDBText;
    rpFolhaFreqTextDia24: TppDBText;
    rpFolhaFreqTextDia25: TppDBText;
    rpFolhaFreqTextDia26: TppDBText;
    rpFolhaFreqTextDia27: TppDBText;
    rpFolhaFreqTextDia28: TppDBText;
    rpFolhaFreqTextDia29: TppDBText;
    rpFolhaFreqTextDia30: TppDBText;
    rpFolhaFreqTextDia31: TppDBText;
    rpFolhaFreqLbl12: TppLabel;
    rpFolhaFreqLine7: TppLine;
    rpFolhaFreqLine13: TppLine;
    rpFolhaFreqLine2: TppLine;
    rpFolhaFreqLine4: TppLine;
    rpFolhaFreqLine5: TppLine;
    rpFolhaFreqDBImage1: TppDBImage;
    rpFolhaFreqShape21: TppShape;
    rpFolhaFreqMemoHoraEmpreg: TppMemo;
    rpFolhaFreqMemoEmpreg: TppMemo;
    rpFolhaFreqLbl23: TppLabel;
    rpFolhaFreqLbl22: TppLabel;
    rpFolhaFreqShapeDia29_4: TppShape;
    rpFolhaFreqShapeDia30_4: TppShape;
    rpFolhaFreqShapeDia31_4: TppShape;
    rpFolhaFreqColFootBnd: TppColumnFooterBand;
    ppFolhaFreq: TppBDEPipeline;
    ppFolhaFreqppField1: TppField;
    ppFolhaFreqppField2: TppField;
    ppFolhaFreqppField3: TppField;
    ppFolhaFreqppField4: TppField;
    ppFolhaFreqppField5: TppField;
    ppFolhaFreqppField6: TppField;
    ppFolhaFreqppField7: TppField;
    ppFolhaFreqppField8: TppField;
    ppFolhaFreqppField9: TppField;
    ppFolhaFreqppField10: TppField;
    ppFolhaFreqppField11: TppField;
    ppFolhaFreqppField12: TppField;
    ppFolhaFreqppField13: TppField;
    ppFolhaFreqppField14: TppField;
    ppFolhaFreqppField15: TppField;
    ppFolhaFreqppField16: TppField;
    ppFolhaFreqppField17: TppField;
    ppFolhaFreqppField18: TppField;
    ppFolhaFreqppField19: TppField;
    ppFolhaFreqppField20: TppField;
    ppFolhaFreqppField21: TppField;
    ppFolhaFreqppField22: TppField;
    ppFolhaFreqppField23: TppField;
    ppFolhaFreqppField24: TppField;
    ppFolhaFreqppField25: TppField;
    ppFolhaFreqppField26: TppField;
    ppFolhaFreqppField27: TppField;
    ppFolhaFreqppField28: TppField;
    ppFolhaFreqppField29: TppField;
    ppFolhaFreqppField30: TppField;
    ppFolhaFreqppField31: TppField;
    ppFolhaFreqppField32: TppField;
    ppFolhaFreqppField33: TppField;
    ppFolhaFreqppField34: TppField;
    ppFolhaFreqppField35: TppField;
    ppFolhaFreqppField36: TppField;
    ppFolhaFreqppField37: TppField;
    ppFolhaFreqppField38: TppField;
    ppFolhaFreqppField39: TppField;
    ppFolhaFreqppField40: TppField;
    ppFolhaFreqppField41: TppField;
    ppFolhaFreqppField42: TppField;
    ppFolhaFreqppField43: TppField;
    ppFolhaFreqppField44: TppField;
    ppFolhaFreqppField45: TppField;
    dsFolhaFreq: TwwDataSource;
    CdsFeriado: TCMClientDataSet;
    CdsDiasExtras: TCMClientDataSet;
    CdsFerias: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    rpFolhaFreqSmryBnd: TppSummaryBand;
    ppIMG: TppBDEPipeline;
    ppIMGppField1: TppField;
    dsIMG: TwwDataSource;
    CdsIMG: TCMClientDataSet;
    rpRegFerias: TppRegion;
    rpFolhaFreqMemo2: TppMemo;
    rpFolhaFreqDBTxt11: TppDBText;
    rpFolhaFreqSaldo: TppLabel;
    rpFolhaFreqIni: TppLabel;
    rpFolhaFreqFim: TppLabel;
    rpFolhaFreqMemoEstag: TppMemo;
    rpFolhaFreqMemoHoraEstag: TppMemo;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CdsFolhaFreqAfterScroll(DataSet: TDataSet);
    procedure rpFolhaFreqSmryBndAfterPrint(Sender: TObject);
    procedure rpFolhaFreqHdrBndAfterPrint(Sender: TObject);
    procedure rpFolhaFreqDtlBndBeforePrint(Sender: TObject);
    procedure rpFolhaFreqSaldoPrint(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlDiaExtra: TCtrlDiaExtra;
    CtrlFerias: TCtrlFerias;
    CtrlCargo: TCtrlCargo;

    sMes, sAno, sListaIdFuncSel: string;

    procedure GerarDadosRelat;
  end;

var
  RptFolhaFreq: TRptFolhaFreq;

implementation

uses dCds, fAguarde, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptFolhaFreq.FormCreate(Sender: TObject);
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
end;

procedure TRptFolhaFreq.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlDiaExtra);
  FreeAndNil(CtrlFerias);
  FreeAndNil(CtrlCargo);
  inherited;
end;

procedure TRptFolhaFreq.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  sAno := Copy(CmpRptCM.ParamByName('DataRef').asString, 7, 4);
  sMes := Copy(CmpRptCM.ParamByName('DataRef').asString, 4, 2);

  // Monta Query Auxiliar
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.IDPESSOA AS IDESTAB,');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB,');
    Add('  CGC.NUM AS CGC,');
    Add('  CGC.MASCARA AS MASCARA_CGC,');
    Add('  E.IDCIDADES, ES.IDPAIS,');
    Add('  RTRIM(ES.CODESTADO) AS UF,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,NULL,'' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),NULL,NULL,'' - ''|| RTRIM(E.BAIRRO)) AS ENDERECO,');
    Add('  RTRIM(ES.NOMEESTADO) AS ESTADO,');
    // Dados do Funcionário
    Add('  F.IDPESSOA,');
    Add('  F.MATRICULA, F.TIPOCONTRATO,');
    Add('  '+QuotedStr(FU.MesExtensoAno(sAno +'/'+ sMes))+' AS REFERENCIA,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  RTRIM(CC.NOME) AS C_CUSTO,');
    Add('  DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) AS IDCARGO,');
    Add('  DECODE(HST.IDFUNCAO,NULL,F.IDFUNCAO,HST.IDFUNCAO) AS IDFUNCAO,');
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
    // --------------------------------------------------------------------------------------
    Add('  (SELECT EVOL.IDCARGO, EVOL.IDFUNCAO, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('           FROM   EVOLFUNC');
    Add('           WHERE');
    Add('            (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(CmpRptCM.ParamByName('DataRef').asString)+
      ',''DD/MM/YYYY''))');
    Add('           GROUP BY IDPESSOA) HST2,');
    Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
    Add('           FROM   EVOLFUNC');
    Add('           WHERE');
    Add('            (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(CmpRptCM.ParamByName('DataRef').asString)+
      ',''DD/MM/YYYY''))');
    Add('           GROUP BY IDPESSOA) HST3');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('           (EVOL.IDPESSOA      = HST2.IDPESSOA) AND');
    Add('           (EVOL.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
    Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST,');
    // ------------------------------------------------------------------------------- //
    // Férias em Aberto do Funcionário
    Add('  (SELECT IDPESSOA, MAX(INIPERIODOFERIAS) AS DATA');
    Add('   FROM FERIAS');
    Add('   WHERE (FLGOCORRIDA       = 0) AND');
    Add('         (INIPERIODOFERIAS <= TO_DATE('+QuotedStr(
      CmpRptCM.ParamByName('DataRef').asString)+',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) FERIAS_EM_ABERTO,');
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
    Add('  (PJ.IDPESSOA       IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (F.IDPESSOA        IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA         = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO))  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;

      if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          Add('  (ST.TIPOSIT        IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
        else
          Add('  (ST.TIPOSIT         = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

      if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
          Add('  (F.TIPOCONTRATO    IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
        else
          Add('  (F.TIPOCONTRATO     = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');
    end;

    if (CmpRptCM.ParamByName('ListaIdCargo').asString <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('ListaIdCargo').asString) > 0) then
      begin
        if (CmpRptCM.ParamByName('FlgDoisCargos').asInteger = 1) then
          Add('  (DECODE(HST.IDFUNCAO,NULL,DECODE(HST.IDCARGO,NULL,DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO),HST.IDCARGO),HST.IDFUNCAO) IN (' +CmpRptCM.ParamByName('ListaIdCargo').asString+ ')) AND')
        else
          Add('  (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) IN (' +CmpRptCM.ParamByName('ListaIdCargo').asString+ ')) AND');
      end
      else
        if (CmpRptCM.ParamByName('FlgDoisCargos').asInteger = 1) then
          Add('  (DECODE(HST.IDFUNCAO,NULL,DECODE(HST.IDCARGO,NULL,DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO),HST.IDCARGO),HST.IDFUNCAO) = ' +CmpRptCM.ParamByName('ListaIdCargo').asString+ ') AND')
        else
          Add('  (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = ' +CmpRptCM.ParamByName('ListaIdCargo').asString+ ') AND');
    end;

    Add('  (HT.FLGTIPOHORARIO  = 0) AND');
    Add('  (ST.IDSITFUNC       = F.IDSITFUNC) AND');
    Add('  (F.IDHORARIO        = HT.IDHORARIO) AND');
    Add('  (PJ.IDPESSOA        = F.IDESTAB) AND');
    Add('  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = CC.IDEMPRESA) AND');
    Add('  (DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO) = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDPESSOA         = PF.IDPESSOA) AND');
    Add('  (F.IDHORARIO        = HT.IDHORARIO) AND');
    Add('  (PJ.IDPESSOA        = CGC.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL  = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA        = E.IDPESSOA) AND');
    Add('  (E.IDCIDADES        = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO   = ES.IDESTADO) AND');
    Add('  (F.IDHORARIO        = TS.IDHORARIO) AND');
    Add('  (TS.IDTURNODIARIO   = TD.IDTURNODIARIO) AND');
    Add('  (F.IDPESSOA         = FERIAS_EM_ABERTO.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA         = HST.IDPESSOA(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  UPPER(EMPREGADO), UPPER(C_CUSTO)');
      1 : Add('  MATRICULA, UPPER(C_CUSTO)');
      2 : Add('  UPPER(C_CUSTO), UPPER(EMPREGADO)');
      3 : Add('  UPPER(C_CUSTO), MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  dmCds.sql.Open;

  // Monta Query Principal
  GerarDadosRelat;

  frmAguarde.Max := CdsFolhaFreq.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptFolhaFreq.CdsFolhaFreqAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
  rpRegFerias.Visible := CdsFolhaFreq.FieldByName('TIPOCONTRATO').asString <> 'G';
  rpFolhaFreqMemoEmpreg.Visible := CdsFolhaFreq.FieldByName('TIPOCONTRATO').asString <> 'G';
  rpFolhaFreqMemoHoraEmpreg.Visible := CdsFolhaFreq.FieldByName('TIPOCONTRATO').asString <> 'G';
  rpFolhaFreqMemoEstag.Visible := CdsFolhaFreq.FieldByName('TIPOCONTRATO').asString = 'G';
  rpFolhaFreqMemoHoraEstag.Visible := CdsFolhaFreq.FieldByName('TIPOCONTRATO').asString = 'G';

  if (CdsFolhaFreq.FieldByName('TIPOCONTRATO').asString = 'G') then
  begin
    rpFolhaFreqLblEmpregado.Caption := 'Estagiário';
    rpFolhaFreqLbl22.Caption := 'ALTERAÇÃO DE HORÁRIO DE ESTÁGIO';
  end
  else
  begin
    rpFolhaFreqLblEmpregado.Caption := 'Empregado';
    rpFolhaFreqLbl22.Caption := 'ALTERAÇÃO DE HORÁRIO DE TRABALHO';
  end;
end;

procedure TRptFolhaFreq.rpFolhaFreqHdrBndAfterPrint(Sender: TObject);
var
  iNumDias: integer;
begin
  iNumDias := CdsFolhaFreq.FieldByName('NUM_DIAS_MES').asInteger;

  rpFolhaFreqShapeDia29_1.Visible := (iNumDias >= 29);
  rpFolhaFreqShapeDia29_2.Visible := (iNumDias >= 29);
  rpFolhaFreqShapeDia29_3.Visible := (iNumDias >= 29);
  rpFolhaFreqShapeDia29_4.Visible := (iNumDias >= 29);

  rpFolhaFreqShapeDia30_1.Visible := (iNumDias >= 30);
  rpFolhaFreqShapeDia30_2.Visible := (iNumDias >= 30);
  rpFolhaFreqShapeDia30_3.Visible := (iNumDias >= 30);
  rpFolhaFreqShapeDia30_4.Visible := (iNumDias >= 30);

  rpFolhaFreqShapeDia31_1.Visible := (iNumDias  = 31);
  rpFolhaFreqShapeDia31_2.Visible := (iNumDias  = 31);
  rpFolhaFreqShapeDia31_3.Visible := (iNumDias  = 31);
  rpFolhaFreqShapeDia31_4.Visible := (iNumDias  = 31);

  rpFolhaFreqLblDia29.Visible := (iNumDias >= 29);
  rpFolhaFreqLblDia30.Visible := (iNumDias >= 30);
  rpFolhaFreqLblDia31.Visible := (iNumDias  = 31);

  rpFolhaFreqTextDia29.Visible := (iNumDias >= 29);
  rpFolhaFreqTextDia30.Visible := (iNumDias >= 30);
  rpFolhaFreqTextDia31.Visible := (iNumDias  = 31);
end;

procedure TRptFolhaFreq.rpFolhaFreqDtlBndBeforePrint(Sender: TObject);
const
  SetDias: array [1..5] of string = ('DOMINGO','SÁBADO','FERIADO','FÉRIAS','FOLGA');
var
  c: integer;
begin
  for c:=1 to 31 do
    TppDBText(Self.FindComponent('rpFolhaFreqTextDia'+FU.PoeZero(c))).Visible :=
      (FU.StringEm(CdsFolhaFreq.FieldByName('DIA'+FU.PoeZero(c)).asString, SetDias) > -1);
end;

procedure TRptFolhaFreq.rpFolhaFreqSaldoPrint(Sender: TObject);
var
  DataProx: TDate;
  AchouMax: boolean;
begin
  if (CdsFolhaFreq.FieldByName('ESTAB').asString <> 'XXX') then
  begin
    AchouMax := false;

    DataProx := CtrlFerias.GetPeriodoAquisitivo(
      CdsFolhaFreq.FieldByName('IDPESSOA').asFloat, false, false);

    if (DataProx = 0) then
    begin
      DataProx := CtrlFerias.GetPeriodoAquisitivo(
        CdsFolhaFreq.FieldByName('IDPESSOA').asFloat, true, true);

      if (DataProx > 0) then
      begin
        DataProx := StrToDate(FU.IncData(DateToStr(DataProx),0,0,1));
        AchouMax := True;
      end
      else
        DataProx := CdsFolhaFreq.FieldByName('DATAADMISSAO').asDateTime;
    end;

    dmCds.sql.SQL.Text :=
      'SELECT'+CR_LF+
      '  (30 - ACUM.DIAS) AS DIASSALDOFERIAS'+CR_LF+
      'FROM'+CR_LF+
      '  (SELECT'+CR_LF+
      '     NVL(MOD(SUM(FIMGOZOFERIAS - INIGOZOFERIAS + 1 +'+CR_LF+
      '     DECODE(FLGABONO,0,0,DECODE(NVL(QTDIASABONO,0),0,'+CR_LF+
      '     TRUNC((FIMGOZOFERIAS - INIGOZOFERIAS + 1)/2), QTDIASABONO))),30),0) AS DIAS'+CR_LF+
      '  FROM'+CR_LF+
      '    FERIAS'+CR_LF+
      '  WHERE'+CR_LF+
      '    (IDPESSOA    = ' +CdsFolhaFreq.FieldByName('IDPESSOA').asString+ ') AND'+CR_LF+
      '    (FLGOCORRIDA = 1)) ACUM';
    dmCds.sql.Open;

    if (StrToDate(FU.IncData(DateToStr(DataProx),0,0,1)) >
        CdsFolhaFreq.FieldByName('EMISSAO').asDateTime) and
       (dmCds.Cds.FieldByName('DIASSALDOFERIAS').asInteger = 30) then
      rpFolhaFreqSaldo.Caption := '0'
    else
      rpFolhaFreqSaldo.Caption := dmCds.Cds.FieldByName('DIASSALDOFERIAS').asString;

    if (dmCds.Cds.FieldByName('DIASSALDOFERIAS').asInteger <> 30) and (AchouMax) then
      DataProx := StrToDate(FU.IncData(DateToStr(DataProx),0,0,-1));

    rpFolhaFreqIni.Caption := DateToStr(DataProx);
    rpFolhaFreqFim.Caption := FU.IncData(DateToStr(DataProx),-1,0,1);
  end;
end;

procedure TRptFolhaFreq.rpFolhaFreqSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptFolhaFreq.GerarDadosRelat;
var
  Achou: boolean;
  dtDataRef: TDateTime;
  IdPessoa: double;
  c: integer;
  sValor: string;
begin
  CdsFolhaFreq.IndexName := '';
  if (CdsFolhaFreq.IndexDefs.Count > 0) then
    CdsFolhaFreq.DeleteIndex('Index1');

  sqlFolhaFreq.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    dtDataRef := StrToDate('01/' + Copy(CmpRptCM.ParamByName('DataRef').asString,4,7));

    // Pego o Logotipo do estabelecimento
    CdsIMG.Data := CtrlListTerceirosRH.ListImagemPessoa(
      dmCds.Cds.FieldByName('IDESTAB').asFloat);

    // Todos os feriados no período
    CdsFeriado.Data := CtrlListTerceirosRH.ListFeriados(
      dmCds.Cds.FieldByName('IDCIDADES').asInteger,
      dmCds.Cds.FieldByName('IDPAIS').asInteger,
      dmCds.Cds.FieldByName('UF').asString,
      StrToDate('01/'+ sMes +'/'+ sAno),
      StrToDate((FU.PoeZero(FU.TrazUltDiaMes(StrToInt(sMes),StrToInt(sAno))) +'/'+ sMes +'/'+ sAno)),
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
      until (IdPessoa <> dmCds.Cds.FieldByName('IDPESSOA').asFloat) or
            (dmCds.Cds.EOF);
    until (dmCds.Cds.EOF);

    // Todos os dias extras no período para os funcionários selecionados
    CdsDiasExtras.Data := CtrlDiaExtra.ListDiasExtra(sListaIdFuncSel,
      StrToDate('01/' + sMes +'/'+ sAno),
      StrToDate(FU.PoeZero(FU.TrazUltDiaMes(StrToInt(sMes),StrToInt(sAno))) +'/'+ sMes +'/'+ sAno));

    // Todos os períodos de férias no período
    CdsFerias.Data := CtrlFerias.ListFeriasNoPeriodo(sListaIdFuncSel,
      StrToDate('01/' + sMes +'/'+ sAno),
      StrToDate(FU.PoeZero(FU.TrazUltDiaMes(StrToInt(sMes),StrToInt(sAno))) +'/'+ sMes +'/'+ sAno));

    // Cargos dos Empregados
    CdsCargo.Data := CtrlCargo.ListCargo;

    // ---------------------------------------------------------------------------
    // Gravo registros
    // ---------------------------------------------------------------------------
    dmCds.Cds.First;
    repeat
      CdsFolhaFreq.Insert;
      CdsFolhaFreq.FieldByName('ESTAB').asString := dmCds.Cds.FieldByName('ESTAB').asString;
      CdsFolhaFreq.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;
      CdsFolhaFreq.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('ENDERECO').asString;
      CdsFolhaFreq.FieldByName('UF').asString := dmCds.Cds.FieldByName('ESTADO').asString;
      CdsFolhaFreq.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
      CdsFolhaFreq.FieldByName('REFERENCIA').asString := dmCds.Cds.FieldByName('REFERENCIA').asString;
      CdsFolhaFreq.FieldByName('EMISSAO').asString := CmpRptCM.ParamByName('DataRef').asString;
      CdsFolhaFreq.FieldByName('DATAADMISSAO').asString := dmCds.Cds.FieldByName('IDPESSOA').asString;
      CdsFolhaFreq.FieldByName('IDPESSOA').asString := dmCds.Cds.FieldByName('IDPESSOA').asString;
      CdsFolhaFreq.FieldByName('NUM_DIAS_MES').asInteger :=
        FU.TrazUltDiaMes(StrToInt(Copy(CmpRptCM.ParamByName('DataRef').asString,4,2)),
        StrToInt(Copy(CmpRptCM.ParamByName('DataRef').asString,7,4)));

      if (Trim(dmCds.Cds.FieldByName('PER_AQUI_INI').asString) = '') then
        CdsFolhaFreq.FieldByName('PER_AQUI_INI').asString :=
          dmCds.Cds.FieldByName('DATAADMISSAO').asString
      else
        CdsFolhaFreq.FieldByName('PER_AQUI_INI').asString :=
          dmCds.Cds.FieldByName('PER_AQUI_INI').asString;

      CdsFolhaFreq.FieldByName('PER_AQUI_FIN').asString := DateToStr(StrToDate(
        FU.IncData(CdsFolhaFreq.FieldByName('PER_AQUI_INI').asString,0,0,1))-1);

      CdsFolhaFreq.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
      CdsFolhaFreq.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('C_CUSTO').asString;
      CdsFolhaFreq.FieldByName('DATAADMISSAO').asString := dmCds.Cds.FieldByName('DATAADMISSAO').asString;
      CdsFolhaFreq.FieldByName('NOMEHORARIO').asString := dmCds.Cds.FieldByName('NOMEHORARIO').asString;
      CdsFolhaFreq.FieldByName('TIPOCONTRATO').asString := dmCds.Cds.FieldByName('TIPOCONTRATO').asString;

      if (CmpRptCM.ParamByName('FlgDoisCargos').asInteger = 1) and
         (not dmCds.Cds.FieldByName('IDFUNCAO').IsNull) and
         (CdsCargo.Locate('IDCARGO', dmCds.Cds.FieldByName('IDFUNCAO').asFloat, [])) then
        CdsFolhaFreq.FieldByName('CARGO').asString := CdsCargo.FieldByName('TITULO').asString
      else
      begin
        CdsCargo.Locate('IDCARGO', dmCds.Cds.FieldByName('IDCARGO').asFloat, []);
        CdsFolhaFreq.FieldByName('CARGO').asString := CdsCargo.FieldByName('TITULO').asString;
      end;

      IdPessoa := dmCds.Cds.FieldByName('IDPESSOA').asFloat;

      // Calculo os Tipos de Dia no Período
      CdsFerias.First;
      for c:=0 to 30 do
      begin
        // Verifico se o dia é do mês
        if (FU.TrazUltDiaMes(StrToInt(sMes), StrToInt(sAno))) < (c + 1) then
        begin
          CdsFolhaFreq.FieldByName('DIA'+FU.PoeZero(c+1)).asString := 'XXXXXXXXXX';
          continue;
        end;

        // Verifico os dias extras do funcionário
        if not(CdsDiasExtras.IsEmpty) and (CdsDiasExtras.Locate('IDPESSOA;DIATRAB',
            VarArrayOf([IdPessoa, dtDataRef + c]), [])) then
        begin
          CdsFolhaFreq.FieldByName('DIA'+FU.PoeZero(c+1)).asString := '';
          continue;
        end;

        // Vejo se o dia atual está no período de férias
        Achou := CdsFerias.Locate('IDPESSOA',IdPessoa,[]);
        if (Achou) and
           ((dtDataRef + C) >= CdsFerias.FieldByName('INIGOZOFERIAS').asDateTime) and
           ((dtDataRef + C) <= CdsFerias.FieldByName('FIMGOZOFERIAS').asDateTime) then
          sValor := 'FÉRIAS'
        else
        begin
          // Vejo se o dia atual é uma folga (EXCETO SÁBADOS E DOMINGOS)
          Achou := dmCds.Cds.Locate('IDDIASEMANA;IDPESSOA',
            VarArrayOf([DayOfWeek(dtDataRef + c), IdPessoa]), []);

          if not(Achou) and not(DayOfWeek(dtDataRef + c) in [1,7]) then
            sValor := 'FOLGA'
          else
          begin
            if (Achou) then
              sValor := ' '
            else
            case DayOfWeek(dtDataRef + c) of
              1 : sValor := 'DOMINGO';
              7 : sValor := 'SÁBADO';
            end;
          end;
          // Vejo se o dia atual é um feriado
          if (sValor = ' ') and (CdsFeriado.Locate('DATAFERIADO', DateToStr(dtDataRef + C),[loCaseInsensitive])) then
            sValor := 'FERIADO';
        end;
        CdsFolhaFreq.FieldByName('DIA'+FU.PoeZero(c+1)).asString := sValor;
      end;

      // Movo para o último registro do funcionário
      repeat
        dmCds.Cds.Next;
      until (dmCds.Cds.FieldByName('IDPESSOA').asFloat <> IdPessoa) or
            (dmCds.Cds.EOF);

      CdsFolhaFreq.Post;
    until (dmCds.Cds.EOF);

    // Máscara do CGC
    if (Trim(dmCds.Cds.FieldByName('MASCARA_CGC').asString) <> '') then
      rpFolhaFreqDBTxt2.DisplayFormat :=
        dmCds.Cds.FieldByName('MASCARA_CGC').asString+';0;_';
  end
  else
  begin
    CdsFolhaFreq.Insert;
    CdsFolhaFreq.FieldByName('ESTAB').asString := 'XXX';
    CdsFolhaFreq.Post;
    CdsIMG.Data := CtrlListTerceirosRH.ListImagemPessoa(-1);
    CdsIMG.Insert;
    CdsIMG.Post;
  end;

  case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
    0 : CdsFolhaFreq.AddIndex('Index1', 'EMPREGADO;C_CUSTO', []);
    1 : CdsFolhaFreq.AddIndex('Index1', 'MATRICULA;C_CUSTO', []);
    2 : CdsFolhaFreq.AddIndex('Index1', 'C_CUSTO;EMPREGADO', []);
    3 : CdsFolhaFreq.AddIndex('Index1', 'C_CUSTO;MATRICULA', []);
  end;
  CdsFolhaFreq.IndexName := 'Index1';
  CdsFolhaFreq.First;
end;

end.
