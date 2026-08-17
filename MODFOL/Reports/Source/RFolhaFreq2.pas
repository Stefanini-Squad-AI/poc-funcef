// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RFolhaFreq2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppVar, ppPrnabl, ppClass, ppBands, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlPadroes, uCtrlListTerceirosRH, uCtrlDiaExtra,
  uCtrlFerias, uCtrlCargo, TXRB;

type
  TRptFolhaFreq2 = class(TFrmCmReport)
    rpFolhaFreq2: TppReport;
    rpFolhaFreq2HdrBnd: TppHeaderBand;
    rpFolhaFreq2DtlBnd: TppDetailBand;
    rpFolhaFreq2Shape1: TppShape;
    rpFolhaFreq2Shape4: TppShape;
    rpFolhaFreq2Shape3: TppShape;
    rpFolhaFreq2Shape2: TppShape;
    rpFolhaFreq2Shape5: TppShape;
    rpFolhaFreq2Shape12: TppShape;
    rpFolhaFreq2ShapeDIA29_1: TppShape;
    rpFolhaFreq2ShapeDIA31_1: TppShape;
    rpFolhaFreq2ShapeDIA30_1: TppShape;
    rpFolhaFreq2ShapeDIA31_4: TppShape;
    rpFolhaFreq2ShapeDIA30_4: TppShape;
    rpFolhaFreq2ShapeDIA29_4: TppShape;
    rpFolhaFreq2Shape7: TppShape;
    rpFolhaFreq2ShapeDIA29_2: TppShape;
    rpFolhaFreq2Shape27: TppShape;
    rpFolhaFreq2Shape26: TppShape;
    rpFolhaFreq2Shape25: TppShape;
    rpFolhaFreq2Shape24: TppShape;
    rpFolhaFreq2Shape23: TppShape;
    rpFolhaFreq2Shape22: TppShape;
    rpFolhaFreq2Shape21: TppShape;
    rpFolhaFreq2Shape20: TppShape;
    rpFolhaFreq2Shape19: TppShape;
    rpFolhaFreq2Shape18: TppShape;
    rpFolhaFreq2Shape16: TppShape;
    rpFolhaFreq2Shape15: TppShape;
    rpFolhaFreq2Shape14: TppShape;
    rpFolhaFreq2Shape13: TppShape;
    rpFolhaFreq2ShapeDIA31_3: TppShape;
    rpFolhaFreq2ShapeDIA30_3: TppShape;
    rpFolhaFreq2ShapeDIA29_3: TppShape;
    rpFolhaFreq2Shape10: TppShape;
    rpFolhaFreq2Shape9: TppShape;
    rpFolhaFreq2ShapeDIA31_2: TppShape;
    rpFolhaFreq2ShapeDIA30_2: TppShape;
    rpFolhaFreq2Shape11: TppShape;
    rpFolhaFreq2Shape28: TppShape;
    rpFolhaFreq2Shape6: TppShape;
    rpFolhaFreq2Lbl2: TppLabel;
    rpFolhaFreq2Lbl3: TppLabel;
    rpFolhaFreq2DBTxt1: TppDBText;
    rpFolhaFreq2LblDia01: TppLabel;
    rpFolhaFreq2LblDia02: TppLabel;
    rpFolhaFreq2LblDia03: TppLabel;
    rpFolhaFreq2LblDia04: TppLabel;
    rpFolhaFreq2LblDia05: TppLabel;
    rpFolhaFreq2LblDia06: TppLabel;
    rpFolhaFreq2LblDia07: TppLabel;
    rpFolhaFreq2LblDia08: TppLabel;
    rpFolhaFreq2LblDia09: TppLabel;
    rpFolhaFreq2LblDia10: TppLabel;
    rpFolhaFreq2LblDia11: TppLabel;
    rpFolhaFreq2LblDia12: TppLabel;
    rpFolhaFreq2LblDia13: TppLabel;
    rpFolhaFreq2LblDia14: TppLabel;
    rpFolhaFreq2LblDia15: TppLabel;
    rpFolhaFreq2LblDia16: TppLabel;
    rpFolhaFreq2LblDia17: TppLabel;
    rpFolhaFreq2LblDia18: TppLabel;
    rpFolhaFreq2LblDia19: TppLabel;
    rpFolhaFreq2LblDia20: TppLabel;
    rpFolhaFreq2LblDia21: TppLabel;
    rpFolhaFreq2LblDia22: TppLabel;
    rpFolhaFreq2LblDia23: TppLabel;
    rpFolhaFreq2LblDia24: TppLabel;
    rpFolhaFreq2LblDia25: TppLabel;
    rpFolhaFreq2LblDia26: TppLabel;
    rpFolhaFreq2LblDia27: TppLabel;
    rpFolhaFreq2LblDia28: TppLabel;
    rpFolhaFreq2LblDia29: TppLabel;
    rpFolhaFreq2LblDia30: TppLabel;
    rpFolhaFreq2LblDia31: TppLabel;
    rpFolhaFreq2Lbl5: TppLabel;
    rpFolhaFreq2Lbl6: TppLabel;
    rpFolhaFreq2Shape8: TppShape;
    rpFolhaFreq2Lbl8: TppLabel;
    rpFolhaFreq2Lbl9: TppLabel;
    rpFolhaFreq2Lbl10: TppLabel;
    rpFolhaFreq2Lbl11: TppLabel;
    rpFolhaFreq2Lbl13: TppLabel;
    rpFolhaFreq2Lbl14: TppLabel;
    rpFolhaFreq2Lbl15: TppLabel;
    rpFolhaFreq2DBTxt5: TppDBText;
    rpFolhaFreq2DBTxt3: TppDBText;
    rpFolhaFreq2DBTxt4: TppDBText;
    rpFolhaFreq2DBTxt6: TppDBText;
    rpFolhaFreq2Lbl7: TppLabel;
    rpFolhaFreq2Lbl12: TppLabel;
    rpFolhaFreq2DBTxt2: TppDBText;
    rpFolhaFreq2Calc1: TppCalc;
    rpFolhaFreq2Lbl1: TppLabel;
    rpFolhaFreq2DBTxt7: TppDBText;
    rpFolhaFreq2DBTxt9: TppDBText;
    rpFolhaFreq2DBTxt11: TppDBText;
    rpFolhaFreq2DBTxt13: TppDBText;
    rpFolhaFreq2DBTxt15: TppDBText;
    rpFolhaFreq2DBTxt17: TppDBText;
    rpFolhaFreq2DBTxt19: TppDBText;
    rpFolhaFreq2DBTxt21: TppDBText;
    rpFolhaFreq2DBTxt23: TppDBText;
    rpFolhaFreq2DBTxt25: TppDBText;
    rpFolhaFreq2DBTxt27: TppDBText;
    rpFolhaFreq2DBTxt29: TppDBText;
    rpFolhaFreq2DBTxt31: TppDBText;
    rpFolhaFreq2DBTxt33: TppDBText;
    rpFolhaFreq2DBTxt35: TppDBText;
    rpFolhaFreq2DBTxt37: TppDBText;
    rpFolhaFreq2DBTxt39: TppDBText;
    rpFolhaFreq2DBTxt41: TppDBText;
    rpFolhaFreq2DBTxt43: TppDBText;
    rpFolhaFreq2DBTxt45: TppDBText;
    rpFolhaFreq2DBTxt47: TppDBText;
    rpFolhaFreq2DBTxt49: TppDBText;
    rpFolhaFreq2DBTxt51: TppDBText;
    rpFolhaFreq2DBTxt53: TppDBText;
    rpFolhaFreq2DBTxt55: TppDBText;
    rpFolhaFreq2DBTxt57: TppDBText;
    rpFolhaFreq2DBTxt59: TppDBText;
    rpFolhaFreq2DBTxt61: TppDBText;
    rpFolhaFreq2DBTxtDia29a: TppDBText;
    rpFolhaFreq2DBTxtDia30a: TppDBText;
    rpFolhaFreq2DBTxtDia31a: TppDBText;
    rpFolhaFreq2DBTxtEnt31: TppDBText;
    rpFolhaFreq2DBTxtEnt30: TppDBText;
    rpFolhaFreq2DBTxtEnt29: TppDBText;
    rpFolhaFreq2DBTxtEnt28: TppDBText;
    rpFolhaFreq2DBTxtEnt27: TppDBText;
    rpFolhaFreq2DBTxtEnt26: TppDBText;
    rpFolhaFreq2DBTxtEnt25: TppDBText;
    rpFolhaFreq2DBTxtEnt24: TppDBText;
    rpFolhaFreq2DBTxtEnt23: TppDBText;
    rpFolhaFreq2DBTxtEnt22: TppDBText;
    rpFolhaFreq2DBTxtEnt21: TppDBText;
    rpFolhaFreq2DBTxtEnt20: TppDBText;
    rpFolhaFreq2DBTxtEnt19: TppDBText;
    rpFolhaFreq2DBTxtEnt18: TppDBText;
    rpFolhaFreq2DBTxtEnt17: TppDBText;
    rpFolhaFreq2DBTxtEnt16: TppDBText;
    rpFolhaFreq2DBTxtEnt15: TppDBText;
    rpFolhaFreq2DBTxtEnt14: TppDBText;
    rpFolhaFreq2DBTxtEnt13: TppDBText;
    rpFolhaFreq2DBTxtEnt12: TppDBText;
    rpFolhaFreq2DBTxtEnt11: TppDBText;
    rpFolhaFreq2DBTxtEnt10: TppDBText;
    rpFolhaFreq2DBTxtEnt09: TppDBText;
    rpFolhaFreq2DBTxtEnt08: TppDBText;
    rpFolhaFreq2DBTxtEnt07: TppDBText;
    rpFolhaFreq2DBTxtEnt06: TppDBText;
    rpFolhaFreq2DBTxtEnt05: TppDBText;
    rpFolhaFreq2DBTxtEnt04: TppDBText;
    rpFolhaFreq2DBTxtEnt03: TppDBText;
    rpFolhaFreq2DBTxtEnt02: TppDBText;
    rpFolhaFreq2DBTxtEnt01: TppDBText;
    rpFolhaFreq2DBTxtSai01: TppDBText;
    rpFolhaFreq2DBTxtSai02: TppDBText;
    rpFolhaFreq2DBTxtSai03: TppDBText;
    rpFolhaFreq2DBTxtSai04: TppDBText;
    rpFolhaFreq2DBTxtSai05: TppDBText;
    rpFolhaFreq2DBTxtSai06: TppDBText;
    rpFolhaFreq2DBTxtSai07: TppDBText;
    rpFolhaFreq2DBTxtSai08: TppDBText;
    rpFolhaFreq2DBTxtSai09: TppDBText;
    rpFolhaFreq2DBTxtSai10: TppDBText;
    rpFolhaFreq2DBTxtSai11: TppDBText;
    rpFolhaFreq2DBTxtSai12: TppDBText;
    rpFolhaFreq2DBTxtSai13: TppDBText;
    rpFolhaFreq2DBTxtSai14: TppDBText;
    rpFolhaFreq2DBTxtSai16: TppDBText;
    rpFolhaFreq2DBTxtSai17: TppDBText;
    rpFolhaFreq2DBTxtSai18: TppDBText;
    rpFolhaFreq2DBTxtSai19: TppDBText;
    rpFolhaFreq2DBTxtSai20: TppDBText;
    rpFolhaFreq2DBTxtSai21: TppDBText;
    rpFolhaFreq2DBTxtSai22: TppDBText;
    rpFolhaFreq2DBTxtSai23: TppDBText;
    rpFolhaFreq2DBTxtSai24: TppDBText;
    rpFolhaFreq2DBTxtSai25: TppDBText;
    rpFolhaFreq2DBTxtSai26: TppDBText;
    rpFolhaFreq2DBTxtSai27: TppDBText;
    rpFolhaFreq2DBTxtSai28: TppDBText;
    rpFolhaFreq2DBTxtSai29: TppDBText;
    rpFolhaFreq2DBTxtSai30: TppDBText;
    rpFolhaFreq2DBTxtSai31: TppDBText;
    rpFolhaFreq2DBTxtSai15: TppDBText;
    rpFolhaFreq2Lbl4: TppLabel;
    rpFolhaFreq2Line1: TppLine;
    rpFolhaFreq2Line2: TppLine;
    rpFolhaFreq2Lbl17: TppLabel;
    rpFolhaFreq2DBTxt8: TppDBText;
    rpFolhaFreq2DBTxt10: TppDBText;
    rpFolhaFreq2DBTxt12: TppDBText;
    rpFolhaFreq2DBTxt14: TppDBText;
    rpFolhaFreq2DBTxt16: TppDBText;
    rpFolhaFreq2DBTxt18: TppDBText;
    rpFolhaFreq2DBTxt20: TppDBText;
    rpFolhaFreq2DBTxt22: TppDBText;
    rpFolhaFreq2DBTxt24: TppDBText;
    rpFolhaFreq2DBTxt26: TppDBText;
    rpFolhaFreq2DBTxt28: TppDBText;
    rpFolhaFreq2DBTxt30: TppDBText;
    rpFolhaFreq2DBTxt32: TppDBText;
    rpFolhaFreq2DBTxt34: TppDBText;
    rpFolhaFreq2DBTxt36: TppDBText;
    rpFolhaFreq2DBTxt38: TppDBText;
    rpFolhaFreq2DBTxt40: TppDBText;
    rpFolhaFreq2DBTxt42: TppDBText;
    rpFolhaFreq2DBTxt44: TppDBText;
    rpFolhaFreq2DBTxt46: TppDBText;
    rpFolhaFreq2DBTxt48: TppDBText;
    rpFolhaFreq2DBTxt50: TppDBText;
    rpFolhaFreq2DBTxt52: TppDBText;
    rpFolhaFreq2DBTxt54: TppDBText;
    rpFolhaFreq2DBTxt56: TppDBText;
    rpFolhaFreq2DBTxt58: TppDBText;
    rpFolhaFreq2DBTxt60: TppDBText;
    rpFolhaFreq2DBTxt62: TppDBText;
    rpFolhaFreq2DBTxtDia29b: TppDBText;
    rpFolhaFreq2DBTxtDia30b: TppDBText;
    rpFolhaFreq2DBTxtDia31b: TppDBText;
    rpFolhaFreq2ShapeDIA29_5: TppShape;
    rpFolhaFreq2ShapeDIA30_5: TppShape;
    rpFolhaFreq2ShapeDIA31_5: TppShape;
    rpFolhaFreq2Lbl16: TppLabel;
    ppFolhaFreq2: TppBDEPipeline;
    ppFolhaFreq2ppField1: TppField;
    ppFolhaFreq2ppField2: TppField;
    ppFolhaFreq2ppField3: TppField;
    ppFolhaFreq2ppField4: TppField;
    ppFolhaFreq2ppField5: TppField;
    ppFolhaFreq2ppField6: TppField;
    ppFolhaFreq2ppField7: TppField;
    ppFolhaFreq2ppField8: TppField;
    ppFolhaFreq2ppField9: TppField;
    ppFolhaFreq2ppField10: TppField;
    ppFolhaFreq2ppField11: TppField;
    ppFolhaFreq2ppField12: TppField;
    ppFolhaFreq2ppField13: TppField;
    ppFolhaFreq2ppField14: TppField;
    ppFolhaFreq2ppField15: TppField;
    ppFolhaFreq2ppField16: TppField;
    ppFolhaFreq2ppField17: TppField;
    ppFolhaFreq2ppField18: TppField;
    ppFolhaFreq2ppField19: TppField;
    ppFolhaFreq2ppField20: TppField;
    ppFolhaFreq2ppField21: TppField;
    ppFolhaFreq2ppField22: TppField;
    ppFolhaFreq2ppField23: TppField;
    ppFolhaFreq2ppField24: TppField;
    ppFolhaFreq2ppField25: TppField;
    ppFolhaFreq2ppField26: TppField;
    ppFolhaFreq2ppField27: TppField;
    ppFolhaFreq2ppField28: TppField;
    ppFolhaFreq2ppField29: TppField;
    ppFolhaFreq2ppField30: TppField;
    ppFolhaFreq2ppField31: TppField;
    ppFolhaFreq2ppField32: TppField;
    ppFolhaFreq2ppField33: TppField;
    ppFolhaFreq2ppField34: TppField;
    ppFolhaFreq2ppField35: TppField;
    ppFolhaFreq2ppField36: TppField;
    ppFolhaFreq2ppField37: TppField;
    ppFolhaFreq2ppField38: TppField;
    ppFolhaFreq2ppField39: TppField;
    ppFolhaFreq2ppField40: TppField;
    ppFolhaFreq2ppField41: TppField;
    ppFolhaFreq2ppField42: TppField;
    ppFolhaFreq2ppField43: TppField;
    ppFolhaFreq2ppField44: TppField;
    ppFolhaFreq2ppField45: TppField;
    ppFolhaFreq2ppField46: TppField;
    dsFolhaFreq2: TwwDataSource;
    sqlFolhaFreq2: TCMSqlParams;
    CdsFolhaFreq2: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsFerias: TCMClientDataSet;
    CdsDiasExtras: TCMClientDataSet;
    CdsFeriado: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsFolhaFreq2AfterScroll(DataSet: TDataSet);
    procedure rpFolhaFreq2HdrBndAfterPrint(Sender: TObject);
    procedure rpFolhaFreq2DtlBndBeforePrint(Sender: TObject);
    procedure rpFolhaFreq2BeforePrint(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlDiaExtra: TCtrlDiaExtra;
    CtrlFerias: TCtrlFerias;
    CtrlCargo: TCtrlCargo;

    sListaIdFuncSel: string;

    procedure GerarDadosRelat;
  end;

var
  RptFolhaFreq2: TRptFolhaFreq2;

implementation

uses dCds, fAguarde, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptFolhaFreq2.FormCreate(Sender: TObject);
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

procedure TRptFolhaFreq2.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlDiaExtra);
  FreeAndNil(CtrlFerias);
  FreeAndNil(CtrlCargo);
  inherited;
end;

procedure TRptFolhaFreq2.CrmRptCMBeforePrint(Sender: TObject);
var
  iMes, iAno: integer;
begin
  inherited;
  iMes := CmpRptCM.ParamByName('MesRef').asInteger;
  iAno := CmpRptCM.ParamByName('AnoRef').asInteger;

  // Monta Query Auxiliar
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB,');
    Add('  CGC.NUM AS CNPJ,');
    Add('  E.IDCIDADES, ES.IDPAIS,');
    Add('  RTRIM(ES.CODESTADO) AS UF,');
    Add('  F.IDPESSOA,');
    Add('  F.MATRICULA,');
    Add('  '+QuotedStr(FU.MesExtensoAno(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger)))+' AS REFERENCIA,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  CTPS.NUM AS CTPS,');
    Add('  RTRIM(CC.NOME) AS C_CUSTO,');
    Add('  DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) AS IDCARGO,');
    Add('  DECODE(HST.IDFUNCAO,NULL,F.IDFUNCAO,HST.IDFUNCAO) AS IDFUNCAO,');
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
    Add('  (SELECT EVOL.IDCARGO, EVOL.IDFUNCAO, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('           FROM   EVOLFUNC');
    Add('           WHERE');
    Add('            (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+ IntToStr(iAno))+
      ',''DD/MM/YYYY''))');
    Add('           GROUP BY IDPESSOA) HST2,');
    Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
    Add('           FROM   EVOLFUNC');
    Add('           WHERE  (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+
      IntToStr(iAno))+ ',''DD/MM/YYYY''))');
    Add('           GROUP BY IDPESSOA) HST3');
    Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
    Add('           (EVOL.IDPESSOA      = HST2.IDPESSOA) AND');
    Add('           (EVOL.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
    Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST,');
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
    Add('  (PJ.IDPESSOA       IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    // Funcionário selecionado
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (F.IDPESSOA        IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA         = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      begin
        if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO))  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
      end;

      if (CmpRptCM.ParamByName('SitFunc').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          Add('  (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
        else
          Add('  (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

      if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
        if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
          Add('  (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
        else
          Add('  (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');
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
    Add('  (PJ.IDPESSOA        = F.IDESTAB) AND');
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
    Add('  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = CC.IDEMPRESA) AND');
    Add('  (DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO) = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDPESSOA         = HST.IDPESSOA(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  UPPER(EMPREGADO), UPPER(C_CUSTO)');
      1 : Add('  MATRICULA, UPPER(C_CUSTO)');
      2 : Add('  UPPER(C_CUSTO), UPPER(EMPREGADO)');
      3 : Add('  UPPER(C_CUSTO), MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    //SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  dmCds.sql.Open;

  // Monta Query Principal
  GerarDadosRelat;
  //CdsFolhaFreq2.SaveToFile('c:\FolhaFreq.xml',dfXML);
  //CdsFolhaFreq2.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\FolhaFreq.xml',dfXML);//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  frmAguarde.Max := CdsFolhaFreq2.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptFolhaFreq2.CdsFolhaFreq2AfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptFolhaFreq2.rpFolhaFreq2BeforePrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptFolhaFreq2.rpFolhaFreq2HdrBndAfterPrint(Sender: TObject);
var
  iNumDias: byte;
begin
  iNumDias := CdsFolhaFreq2.FieldByName('NUM_DIAS_MES').asInteger;

  rpFolhaFreq2LblDia29.Visible := (iNumDias >= 29);
  rpFolhaFreq2LblDia30.Visible := (iNumDias >= 30);
  rpFolhaFreq2LblDia31.Visible := (iNumDias  = 31);

  rpFolhaFreq2ShapeDIA29_1.Visible := (iNumDias >= 29);
  rpFolhaFreq2ShapeDIA29_2.Visible := (iNumDias >= 29);
  rpFolhaFreq2ShapeDIA29_3.Visible := (iNumDias >= 29);
  rpFolhaFreq2ShapeDIA29_4.Visible := (iNumDias >= 29);
  rpFolhaFreq2ShapeDIA29_5.Visible := (iNumDias >= 29);

  rpFolhaFreq2ShapeDIA30_1.Visible := (iNumDias >= 30);
  rpFolhaFreq2ShapeDIA30_2.Visible := (iNumDias >= 30);
  rpFolhaFreq2ShapeDIA30_3.Visible := (iNumDias >= 30);
  rpFolhaFreq2ShapeDIA30_4.Visible := (iNumDias >= 30);
  rpFolhaFreq2ShapeDIA30_5.Visible := (iNumDias >= 30);

  rpFolhaFreq2ShapeDIA31_1.Visible := (iNumDias = 31);
  rpFolhaFreq2ShapeDIA31_2.Visible := (iNumDias = 31);
  rpFolhaFreq2ShapeDIA31_3.Visible := (iNumDias = 31);
  rpFolhaFreq2ShapeDIA31_4.Visible := (iNumDias = 31);
  rpFolhaFreq2ShapeDIA31_5.Visible := (iNumDias = 31);

  rpFolhaFreq2DBTxtDia29a.Visible := (iNumDias >= 29);
  rpFolhaFreq2DBTxtDia29b.Visible := (iNumDias >= 29);

  rpFolhaFreq2DBTxtDia30a.Visible := (iNumDias >= 30);
  rpFolhaFreq2DBTxtDia30b.Visible := (iNumDias >= 30);

  rpFolhaFreq2DBTxtDia31a.Visible := (iNumDias = 31);
  rpFolhaFreq2DBTxtDia31b.Visible := (iNumDias = 31);

  rpFolhaFreq2DBTxtEnt29.Visible := (iNumDias >= 29);
  rpFolhaFreq2DBTxtSai29.Visible := (iNumDias >= 29);

  rpFolhaFreq2DBTxtEnt30.Visible := (iNumDias >= 30);
  rpFolhaFreq2DBTxtSai30.Visible := (iNumDias >= 30);

  rpFolhaFreq2DBTxtEnt31.Visible := (iNumDias = 31);
  rpFolhaFreq2DBTxtSai31.Visible := (iNumDias = 31);
end;

procedure TRptFolhaFreq2.rpFolhaFreq2DtlBndBeforePrint(Sender: TObject);
const
  SetDias: array [1..7] of string =
    ('DOMINGO','SÁBADO','FERIADO','FÉRIAS','FOLGA','COMPENSADO','FINAL');
var
  c: integer;
begin
  for c:=1 to 31 do
  begin
    TppDBText(Self.FindComponent('rpFolhaFreq2DBTxtEnt'+FU.PoeZero(c))).Visible :=
      (FU.StringEm(CdsFolhaFreq2.FieldByName('DIA'+FU.PoeZero(c)).asString, SetDias) = -1) and
      (CmpRptCM.ParamByName('ImprimeHorarios').asBoolean);
    TppDBText(Self.FindComponent('rpFolhaFreq2DBTxtSai'+FU.PoeZero(c))).Visible :=
      (FU.StringEm(CdsFolhaFreq2.FieldByName('DIA'+FU.PoeZero(c)).asString, SetDias) = -1) and
      (CmpRptCM.ParamByName('ImprimeHorarios').asBoolean);
  end;
end;

procedure TRptFolhaFreq2.GerarDadosRelat;
var
  Achou: boolean;
  dtDataRef: TDateTime;
  IdPessoa: double;
  iNumDiasMes, C: integer;
  sValor: string;
  F: TextFile;
begin
  CdsFolhaFreq2.IndexName := '';
  if (CdsFolhaFreq2.IndexDefs.Count > 0) then
    CdsFolhaFreq2.DeleteIndex('Index1');

  //AssignFile(F, 'c:\FolhaFreq.log');
  //AssignFile(F, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\FolhaFreq.log');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  Rewrite(F);

  Writeln(F, 'N. Registros -> ' + IntToStr(dmCds.Cds.RecordCount));
  sqlFolhaFreq2.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    dtDataRef := StrToDate('01' +'/'+ FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger) +'/'+
      CmpRptCM.ParamByName('AnoRef').asString);
    iNumDiasMes := FU.TrazUltDiaMes(CmpRptCM.ParamByName('MesRef').asInteger,
      CmpRptCM.ParamByName('AnoRef').asInteger)-1;

    Writeln(F, 'Datas');

    // Todos os feriados no período
    CdsFeriado.Data := CtrlListTerceirosRH.ListFeriados(
      dmCds.Cds.FieldByName('IDCIDADES').asInteger,
      dmCds.Cds.FieldByName('IDPAIS').asInteger,
      dmCds.Cds.FieldByName('UF').asString,
      StrToDate('01/'+ CmpRptCM.ParamByName('MesRef').asString +'/'+
        CmpRptCM.ParamByName('AnoRef').asString),
      StrToDate((FU.PoeZero(FU.TrazUltDiaMes(CmpRptCM.ParamByName('MesRef').asInteger,
        CmpRptCM.ParamByName('AnoRef').asInteger)) +'/'+
        CmpRptCM.ParamByName('MesRef').asString +'/'+
        CmpRptCM.ParamByName('AnoRef').asString)),
      'O,E');

    Writeln(F, 'Feriados -> ' +FU.IFF(CdsFeriado.IsEmpty,'Não','Sim'));
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

    Writeln(F, 'Lista IdPessoa -> ' +sListaIdFuncSel);
    // Todos os dias extras no período para os funcionários selecionados
    CdsDiasExtras.Data := CtrlDiaExtra.ListDiasExtra(sListaIdFuncSel,
      StrToDate('01/' + CmpRptCM.ParamByName('MesRef').asString +'/'+
        CmpRptCM.ParamByName('AnoRef').asString),
      StrToDate(FU.PoeZero(FU.TrazUltDiaMes(CmpRptCM.ParamByName('MesRef').asInteger,
        CmpRptCM.ParamByName('AnoRef').asInteger)) +'/'+
        CmpRptCM.ParamByName('MesRef').asString +'/'+
        CmpRptCM.ParamByName('AnoRef').asString));

    Writeln(F, 'Dias Extras -> ' +FU.IFF(CdsDiasExtras.IsEmpty,'Não','Sim'));
    // Todos os períodos de férias no período
    CdsFerias.Data := CtrlFerias.ListFeriasNoPeriodo(sListaIdFuncSel,
      StrToDate('01/' + CmpRptCM.ParamByName('MesRef').asString +'/'+
        CmpRptCM.ParamByName('AnoRef').asString),
      StrToDate(FU.PoeZero(FU.TrazUltDiaMes(CmpRptCM.ParamByName('MesRef').asInteger,
        CmpRptCM.ParamByName('AnoRef').asInteger)) +'/'+
        CmpRptCM.ParamByName('MesRef').asString +'/'+
        CmpRptCM.ParamByName('AnoRef').asString));

    Writeln(F, 'Ferias -> ' +FU.IFF(CdsFerias.IsEmpty,'Não','Sim'));
    // Cargos dos Empregados
    CdsCargo.Data := CtrlCargo.ListCargo;

    // ---------------------------------------------------------------------------
    // Gravo registros
    // ---------------------------------------------------------------------------
    Writeln(F, 'Cargos -> ' +FU.IFF(CdsCargo.IsEmpty,'Não','Sim'));
    dmCds.Cds.First;
    repeat
      CdsFolhaFreq2.Insert;
      CdsFolhaFreq2.FieldByName('ESTAB').asString := dmCds.Cds.FieldByName('ESTAB').asString;
      CdsFolhaFreq2.FieldByName('CNPJ').asString := dmCds.Cds.FieldByName('CNPJ').asString;
      CdsFolhaFreq2.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
      CdsFolhaFreq2.FieldByName('REFERENCIA').asString := dmCds.Cds.FieldByName('REFERENCIA').asString;
      CdsFolhaFreq2.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
      CdsFolhaFreq2.FieldByName('CTPS').asString := dmCds.Cds.FieldByName('CTPS').asString;
      CdsFolhaFreq2.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('C_CUSTO').asString;
      CdsFolhaFreq2.FieldByName('DATAADMISSAO').asString := dmCds.Cds.FieldByName('DATAADMISSAO').asString;
      CdsFolhaFreq2.FieldByName('NOMEHORARIO').asString := dmCds.Cds.FieldByName('NOMEHORARIO').asString;
      CdsFolhaFreq2.FieldByName('INICIOALMOCO').asString := dmCds.Cds.FieldByName('INICIOALMOCO').asString;
      CdsFolhaFreq2.FieldByName('FINALALMOCO').asString := dmCds.Cds.FieldByName('FINALALMOCO').asString;
      CdsFolhaFreq2.FieldByName('NUM_DIAS_MES').asInteger := FU.TrazUltDiaMes(
        CmpRptCM.ParamByName('MesRef').asInteger, CmpRptCM.ParamByName('AnoRef').asInteger);

      Writeln(F, 'Insert' +dmCds.Cds.FieldByName('IDPESSOA').asString);
      if (CmpRptCM.ParamByName('FlgDoisCargos').asInteger = 1) and
         (not dmCds.Cds.FieldByName('IDFUNCAO').IsNull) and
         (CdsCargo.Locate('IDCARGO', dmCds.Cds.FieldByName('IDFUNCAO').Value, [])) then
        CdsFolhaFreq2.FieldByName('CARGO').asString := CdsCargo.FieldByName('TITULO').asString
      else
      begin
        CdsCargo.Locate('IDCARGO', dmCds.Cds.FieldByName('IDCARGO').Value, []);
        CdsFolhaFreq2.FieldByName('CARGO').asString := CdsCargo.FieldByName('TITULO').asString;
      end;

      Writeln(F, 'Locate');
      IdPessoa := dmCds.Cds.FieldByName('IDPESSOA').asFloat;

      // Calculo os Tipos de Dia no Período
      CdsFerias.First;
      for c:=0 to 30 do
      begin
        Writeln(F, 'Dia do Mês -> '+IntToStr(c));
        if (c <= iNumDiasMes) then
        begin
          // Verifico os dias extras do funcionário
          if (CdsDiasExtras.Locate('IDPESSOA;DIATRAB',
             VarArrayOf([IdPessoa, DateToStr(dtDataRef + c)]), [])) then
          begin
            CdsFolhaFreq2.FieldByName('DIA'+FU.PoeZero(c+1)).asString := '';
            continue;
          end;

          Writeln(F, 'Verifica Dias Extras -> '+IntToStr(c));
          // Vejo se o dia atual está no período de férias
          Achou := CdsFerias.Locate('IDPESSOA', IdPessoa, []);
          if (Achou) and
             ((dtDataRef + c) >= CdsFerias.FieldByName('INIGOZOFERIAS').asDateTime) and
             ((dtDataRef + c) <= CdsFerias.FieldByName('FIMGOZOFERIAS').asDateTime) then
            sValor := 'FÉRIAS'
          else
          begin
            Writeln(F, 'Ferias 1 -> '+IntToStr(c));
            // Vejo se o dia atual é uma folga (EXCETO SÁBADOS E DOMINGOS)
            Achou := dmCds.Cds.Locate('IDPESSOA;IDDIASEMANA',
              VarArrayOf([IdPessoa, DayOfWeek(dtDataRef + c)]), []);

            Writeln(F, 'Ferias 2 -> '+IntToStr(c));
            if not(Achou) and not(DayOfWeek(dtDataRef + c) in [1,7]) then
              sValor := 'FOLGA'
            else
            begin
              if (Achou) then
                sValor := ''
              else
              case DayOfWeek(dtDataRef + C) of
                1 : sValor := 'DOMINGO';
                7 : sValor := 'SÁBADO';
              end;
            end;
            Writeln(F, 'Ferias 3 -> '+IntToStr(c));
            // Vejo se o dia atual é um feriado
            if (sValor = '') and (CdsFeriado.Locate('DATAFERIADO',
               DateToStr(dtDataRef + c), [loCaseInsensitive])) then
            begin
              if (CdsFeriado.FieldByName('FLGTIPO').asString = 'E') then
                sValor := 'COMPENSADO'
              else
                sValor := 'FERIADO';
            end;
          end;
          Writeln(F, 'Ferias 4 -> '+IntToStr(c));
          CdsFolhaFreq2.FieldByName('DIA'+FU.PoeZero(c+1)).asString := sValor;
        end
        else
          CdsFolhaFreq2.FieldByName('DIA'+FU.PoeZero(c+1)).asString := 'FINAL';
        Writeln(F, 'Ferias 5 -> '+IntToStr(c));
      end;

      // Movo para o último registro do funcionário
      repeat
        dmCds.Cds.Next;
        Writeln(F, 'IdPessoa -> ' +dmCds.Cds.FieldByName('IDPESSOA').asString);
      until (dmCds.Cds.FieldByName('IDPESSOA').asFloat <> IdPessoa) or
            (dmCds.Cds.EOF);

      CdsFolhaFreq2.Post;
      Writeln(F, 'Final -> '+FU.IFF(dmCds.Cds.EOF, 'True', 'False'));
    until (dmCds.Cds.EOF);
    Writeln(F, 'Final');
  end
  else
  begin
    CdsFolhaFreq2.Insert;
    CdsFolhaFreq2.Post;
  end;

  Writeln(F, 'Índice');
  case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
    0 : CdsFolhaFreq2.AddIndex('Index1', 'EMPREGADO;C_CUSTO', []);
    1 : CdsFolhaFreq2.AddIndex('Index1', 'MATRICULA;C_CUSTO', []);
    2 : CdsFolhaFreq2.AddIndex('Index1', 'C_CUSTO;EMPREGADO', []);
    3 : CdsFolhaFreq2.AddIndex('Index1', 'C_CUSTO;MATRICULA', []);
  end;
  CdsFolhaFreq2.IndexName := 'Index1';
  CdsFolhaFreq2.First;

  Writeln(F, 'Fecha');
  CloseFile(F);
end;

end.
