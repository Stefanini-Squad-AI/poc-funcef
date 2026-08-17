unit RAnalSintProc;

interface
                    
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, TXComp, 
  uCmRptManager, CmParamReport, uCtrlCustomProcTrab, IvDictio, IvMulti;

type
  TRptAnalSintProc = class(TFrmCmReport)
    rpAnalSintProc: TppReport;
    rpAnalSintProcHdrBnd: TppHeaderBand;
    rpAnalSintProcLbl1: TppLabel;
    rpAnalSintProcLbl2: TppLabel;
    rpAnalSintProcLbl3: TppLabel;
    rpAnalSintProcLbl4: TppLabel;
    rpAnalSintProcLine1: TppLine;
    rpAnalSintProcDBTxt1: TppDBText;
    rpAnalSintProcSysVar1: TppSystemVariable;
    rpAnalSintProcSysVar2: TppSystemVariable;
    rpAnalSintProcDtlBnd: TppDetailBand;
    rpAnalSintProcDBTxt14: TppDBText;
    rpAnalSintProcSmryBnd: TppSummaryBand;
    ppAnalSintProc: TppBDEPipeline;
    dsAnalSintProc: TwwDataSource;
    sqlAnalSintProc: TCMSqlParams;
    CdsAnalSintProc: TCMClientDataSet;
    rpAnalSintProcLbl5: TppLabel;
    rpAnalSintProcLbl6: TppLabel;
    rpAnalSintProcLbl7: TppLabel;
    rpAnalSintProcLbl8: TppLabel;
    rpAnalSintProcLbl9: TppLabel;
    rpAnalSintProcLbl10: TppLabel;
    rpAnalSintProcLbl11: TppLabel;
    rpAnalSintProcLbl12: TppLabel;
    rpAnalSintProcLbl13: TppLabel;
    rpAnalSintProcLbl14: TppLabel;
    rpAnalSintProcLbl15: TppLabel;
    rpAnalSintProcLbl16: TppLabel;
    rpAnalSintProcLbl17: TppLabel;
    rpAnalSintProcLbl18: TppLabel;
    rpAnalSintProcLbl19: TppLabel;
    rpAnalSintProcLbl20: TppLabel;
    rpAnalSintProcLbl21: TppLabel;
    rpAnalSintProcLbl23: TppLabel;
    rpAnalSintProcDBTxt15: TppDBText;
    rpAnalSintProcDBTxt16: TppDBText;
    rpAnalSintProcDBTxt17: TppDBText;
    rpAnalSintProcDBTxt18: TppDBText;
    rpAnalSintProcDBTxt19: TppDBText;
    rpAnalSintProcDBTxt20: TppDBText;
    rpAnalSintProcDBTxt21: TppDBText;
    rpAnalSintProcDBTxt22: TppDBText;
    rpAnalSintProcDBTxt23: TppDBText;
    rpAnalSintProcDBTxt24: TppDBText;
    rpAnalSintProcDBTxt25: TppDBText;
    rpAnalSintProcDBTxt2: TppDBText;
    rpAnalSintProcDBTxt3: TppDBText;
    rpAnalSintProcDBTxt4: TppDBText;
    rpAnalSintProcDBTxt5: TppDBText;
    rpAnalSintProcDBTxt6: TppDBText;
    rpAnalSintProcDBTxt7: TppDBText;
    rpAnalSintProcDBTxt8: TppDBText;
    rpAnalSintProcDBTxt9: TppDBText;
    rpAnalSintProcDBTxt10: TppDBText;
    rpAnalSintProcDBTxt11: TppDBText;
    rpAnalSintProcDBTxt12: TppDBText;
    rpAnalSintProcDBTxt13: TppDBText;
    rpAnalSintProcDBTxt26: TppDBText;
    rpAnalSintProcDBTxt27: TppDBText;
    rpAnalSintProcDBTxt28: TppDBText;
    rpAnalSintProcDBTxt29: TppDBText;
    rpAnalSintProcDBTxt30: TppDBText;
    rpAnalSintProcDBTxt31: TppDBText;
    rpAnalSintProcDBTxt32: TppDBText;
    rpAnalSintProcDBTxt33: TppDBText;
    rpAnalSintProcDBTxt34: TppDBText;
    rpAnalSintProcDBTxt35: TppDBText;
    rpAnalSintProcDBTxt36: TppDBText;
    rpAnalSintProcDBTxt37: TppDBText;
    rpAnalSintProcDBTxt38: TppDBText;
    rpAnalSintProcDBTxt39: TppDBText;
    rpAnalSintProcDBTxt40: TppDBText;
    rpAnalSintProcDBTxt41: TppDBText;
    rpAnalSintProcDBTxt42: TppDBText;
    rpAnalSintProcDBTxt43: TppDBText;
    rpAnalSintProcDBTxt44: TppDBText;
    rpAnalSintProcDBTxt45: TppDBText;
    rpAnalSintProcDBTxt46: TppDBText;
    rpAnalSintProcDBTxt47: TppDBText;
    rpAnalSintProcDBTxt48: TppDBText;
    rpAnalSintProcDBTxt49: TppDBText;
    rpAnalSintProcDBTxt50: TppDBText;
    rpAnalSintProcDBTxt51: TppDBText;
    rpAnalSintProcDBTxt52: TppDBText;
    rpAnalSintProcDBTxt53: TppDBText;
    rpAnalSintProcDBTxt54: TppDBText;
    rpAnalSintProcDBTxt55: TppDBText;
    rpAnalSintProcDBTxt56: TppDBText;
    rpAnalSintProcDBTxt57: TppDBText;
    rpAnalSintProcDBTxt58: TppDBText;
    rpAnalSintProcDBTxt62: TppDBText;
    rpAnalSintProcDBTxt63: TppDBText;
    rpAnalSintProcDBTxt64: TppDBText;
    rpAnalSintProcDBTxt65: TppDBText;
    rpAnalSintProcDBTxt66: TppDBText;
    rpAnalSintProcDBTxt67: TppDBText;
    rpAnalSintProcDBTxt68: TppDBText;
    rpAnalSintProcDBTxt69: TppDBText;
    rpAnalSintProcDBTxt70: TppDBText;
    rpAnalSintProcDBTxt74: TppDBText;
    rpAnalSintProcDBTxt75: TppDBText;
    rpAnalSintProcDBTxt76: TppDBText;
    rpAnalSintProcDBTxt77: TppDBText;
    rpAnalSintProcDBTxt78: TppDBText;
    rpAnalSintProcDBTxt79: TppDBText;
    rpAnalSintProcDBTxt80: TppDBText;
    rpAnalSintProcDBTxt81: TppDBText;
    rpAnalSintProcDBTxt82: TppDBText;
    rpAnalSintProcDBTxt59: TppDBText;
    rpAnalSintProcDBTxt71: TppDBText;
    rpAnalSintProcDBTxt83: TppDBText;
    rpAnalSintProcDBTxt60: TppDBText;
    rpAnalSintProcDBTxt72: TppDBText;
    rpAnalSintProcDBTxt84: TppDBText;
    rpAnalSintProcDBTxt61: TppDBText;
    rpAnalSintProcDBTxt73: TppDBText;
    rpAnalSintProcDBTxt85: TppDBText;
    rpAnalSintProcDBTxt86: TppDBText;
    rpAnalSintProcDBTxt87: TppDBText;
    rpAnalSintProcDBTxt88: TppDBText;
    rpAnalSintProcDBTxt89: TppDBText;
    rpAnalSintProcDBTxt90: TppDBText;
    rpAnalSintProcDBTxt91: TppDBText;
    rpAnalSintProcDBTxt92: TppDBText;
    rpAnalSintProcDBTxt93: TppDBText;
    rpAnalSintProcDBTxt94: TppDBText;
    rpAnalSintProcDBTxt98: TppDBText;
    rpAnalSintProcDBTxt99: TppDBText;
    rpAnalSintProcDBTxt100: TppDBText;
    rpAnalSintProcDBTxt101: TppDBText;
    rpAnalSintProcDBTxt102: TppDBText;
    rpAnalSintProcDBTxt103: TppDBText;
    rpAnalSintProcDBTxt104: TppDBText;
    rpAnalSintProcDBTxt105: TppDBText;
    rpAnalSintProcDBTxt106: TppDBText;
    rpAnalSintProcDBTxt110: TppDBText;
    rpAnalSintProcDBTxt111: TppDBText;
    rpAnalSintProcDBTxt112: TppDBText;
    rpAnalSintProcDBTxt113: TppDBText;
    rpAnalSintProcDBTxt114: TppDBText;
    rpAnalSintProcDBTxt115: TppDBText;
    rpAnalSintProcDBTxt116: TppDBText;
    rpAnalSintProcDBTxt117: TppDBText;
    rpAnalSintProcDBTxt118: TppDBText;
    rpAnalSintProcDBTxt95: TppDBText;
    rpAnalSintProcDBTxt107: TppDBText;
    rpAnalSintProcDBTxt119: TppDBText;
    rpAnalSintProcDBTxt96: TppDBText;
    rpAnalSintProcDBTxt108: TppDBText;
    rpAnalSintProcDBTxt120: TppDBText;
    rpAnalSintProcDBTxt97: TppDBText;
    rpAnalSintProcDBTxt109: TppDBText;
    rpAnalSintProcDBTxt121: TppDBText;
    rpAnalSintProcDBTxt122: TppDBText;
    rpAnalSintProcDBTxt123: TppDBText;
    rpAnalSintProcDBTxt124: TppDBText;
    rpAnalSintProcDBTxt125: TppDBText;
    rpAnalSintProcDBTxt126: TppDBText;
    rpAnalSintProcDBTxt127: TppDBText;
    rpAnalSintProcDBTxt128: TppDBText;
    rpAnalSintProcDBTxt129: TppDBText;
    rpAnalSintProcDBTxt130: TppDBText;
    rpAnalSintProcDBTxt134: TppDBText;
    rpAnalSintProcDBTxt135: TppDBText;
    rpAnalSintProcDBTxt136: TppDBText;
    rpAnalSintProcDBTxt137: TppDBText;
    rpAnalSintProcDBTxt138: TppDBText;
    rpAnalSintProcDBTxt139: TppDBText;
    rpAnalSintProcDBTxt140: TppDBText;
    rpAnalSintProcDBTxt141: TppDBText;
    rpAnalSintProcDBTxt142: TppDBText;
    rpAnalSintProcDBTxt131: TppDBText;
    rpAnalSintProcDBTxt143: TppDBText;
    rpAnalSintProcDBTxt132: TppDBText;
    rpAnalSintProcDBTxt144: TppDBText;
    rpAnalSintProcDBTxt133: TppDBText;
    rpAnalSintProcDBTxt145: TppDBText;
    rpAnalSintProcDBTxt146: TppDBText;
    rpAnalSintProcDBTxt147: TppDBText;
    rpAnalSintProcDBTxt148: TppDBText;
    rpAnalSintProcDBTxt149: TppDBText;
    rpAnalSintProcDBTxt150: TppDBText;
    rpAnalSintProcDBTxt151: TppDBText;
    rpAnalSintProcDBTxt152: TppDBText;
    rpAnalSintProcDBTxt153: TppDBText;
    rpAnalSintProcDBTxt154: TppDBText;
    rpAnalSintProcDBTxt158: TppDBText;
    rpAnalSintProcDBTxt159: TppDBText;
    rpAnalSintProcDBTxt160: TppDBText;
    rpAnalSintProcDBTxt161: TppDBText;
    rpAnalSintProcDBTxt162: TppDBText;
    rpAnalSintProcDBTxt163: TppDBText;
    rpAnalSintProcDBTxt164: TppDBText;
    rpAnalSintProcDBTxt165: TppDBText;
    rpAnalSintProcDBTxt166: TppDBText;
    rpAnalSintProcDBTxt155: TppDBText;
    rpAnalSintProcDBTxt167: TppDBText;
    rpAnalSintProcDBTxt156: TppDBText;
    rpAnalSintProcDBTxt168: TppDBText;
    rpAnalSintProcDBTxt157: TppDBText;
    rpAnalSintProcDBTxt169: TppDBText;
    rpAnalSintProcDBTxt170: TppDBText;
    rpAnalSintProcDBTxt171: TppDBText;
    rpAnalSintProcDBTxt172: TppDBText;
    rpAnalSintProcDBTxt173: TppDBText;
    rpAnalSintProcDBTxt174: TppDBText;
    rpAnalSintProcDBTxt175: TppDBText;
    rpAnalSintProcDBTxt176: TppDBText;
    rpAnalSintProcDBTxt177: TppDBText;
    rpAnalSintProcDBTxt178: TppDBText;
    rpAnalSintProcDBTxt182: TppDBText;
    rpAnalSintProcDBTxt183: TppDBText;
    rpAnalSintProcDBTxt184: TppDBText;
    rpAnalSintProcDBTxt185: TppDBText;
    rpAnalSintProcDBTxt186: TppDBText;
    rpAnalSintProcDBTxt187: TppDBText;
    rpAnalSintProcDBTxt188: TppDBText;
    rpAnalSintProcDBTxt189: TppDBText;
    rpAnalSintProcDBTxt190: TppDBText;
    rpAnalSintProcDBTxt179: TppDBText;
    rpAnalSintProcDBTxt191: TppDBText;
    rpAnalSintProcDBTxt180: TppDBText;
    rpAnalSintProcDBTxt192: TppDBText;
    rpAnalSintProcDBTxt181: TppDBText;
    rpAnalSintProcDBTxt193: TppDBText;
    rpAnalSintProcDBTxt194: TppDBText;
    rpAnalSintProcDBTxt195: TppDBText;
    rpAnalSintProcDBTxt196: TppDBText;
    rpAnalSintProcDBTxt197: TppDBText;
    rpAnalSintProcDBTxt198: TppDBText;
    rpAnalSintProcDBTxt199: TppDBText;
    rpAnalSintProcDBTxt200: TppDBText;
    rpAnalSintProcDBTxt201: TppDBText;
    rpAnalSintProcDBTxt202: TppDBText;
    rpAnalSintProcDBTxt206: TppDBText;
    rpAnalSintProcDBTxt207: TppDBText;
    rpAnalSintProcDBTxt208: TppDBText;
    rpAnalSintProcDBTxt209: TppDBText;
    rpAnalSintProcDBTxt210: TppDBText;
    rpAnalSintProcDBTxt211: TppDBText;
    rpAnalSintProcDBTxt212: TppDBText;
    rpAnalSintProcDBTxt213: TppDBText;
    rpAnalSintProcDBTxt214: TppDBText;
    rpAnalSintProcDBTxt218: TppDBText;
    rpAnalSintProcDBTxt219: TppDBText;
    rpAnalSintProcDBTxt220: TppDBText;
    rpAnalSintProcDBTxt221: TppDBText;
    rpAnalSintProcDBTxt222: TppDBText;
    rpAnalSintProcDBTxt223: TppDBText;
    rpAnalSintProcDBTxt224: TppDBText;
    rpAnalSintProcDBTxt225: TppDBText;
    rpAnalSintProcDBTxt226: TppDBText;
    rpAnalSintProcDBTxt203: TppDBText;
    rpAnalSintProcDBTxt215: TppDBText;
    rpAnalSintProcDBTxt227: TppDBText;
    rpAnalSintProcDBTxt204: TppDBText;
    rpAnalSintProcDBTxt216: TppDBText;
    rpAnalSintProcDBTxt228: TppDBText;
    rpAnalSintProcDBTxt205: TppDBText;
    rpAnalSintProcDBTxt217: TppDBText;
    rpAnalSintProcDBTxt229: TppDBText;
    rpAnalSintProcDBTxtSOMA_01: TppDBText;
    rpAnalSintProcDBTxtSOMA_02: TppDBText;
    rpAnalSintProcDBTxtSOMA_03: TppDBText;
    rpAnalSintProcDBTxtSOMA_04: TppDBText;
    rpAnalSintProcDBTxtSOMA_05: TppDBText;
    rpAnalSintProcDBTxtSOMA_06: TppDBText;
    rpAnalSintProcDBTxtSOMA_07: TppDBText;
    rpAnalSintProcDBTxtSOMA_08: TppDBText;
    rpAnalSintProcDBTxtSOMA_09: TppDBText;
    rpAnalSintProcDBTxtSOMA_10: TppDBText;
    rpAnalSintProcDBTxtSOMA_11: TppDBText;
    rpAnalSintProcDBTxtSOMA_12: TppDBText;
    rpAnalSintProcDBTxtSOMA_13: TppDBText;
    rpAnalSintProcDBTxtSOMA_14: TppDBText;
    rpAnalSintProcDBTxtSOMA_15: TppDBText;
    ppLabel1: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpAnalSintProcSmryBndAfterPrint(Sender: TObject);
  private
    CtrlCustomProcTrab: TCtrlCustomProcTrab;

    procedure GerarDadosRelat;
    procedure GerarValoresAnaliticos;
  end;

var
  RptAnalSintProc: TRptAnalSintProc;

implementation

uses uSistema, fAguarde, uCtrlPadroes, uCtrlFuncoesRH, dCds, uModulo;

{$R *.DFM}

procedure TRptAnalSintProc.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  rpAnalSintProcLbl5.Caption := 'Valores '+FU.IFF(Modulo.IdContraCheque=REFER,'da Causa','Reclamados');
  rpAnalSintProcLbl8.Caption := 'Valores '+FU.IFF(Modulo.IdContraCheque=REFER,'da Causa','Reclamados');
  rpAnalSintProcLbl11.Caption := 'Valores '+FU.IFF(Modulo.IdContraCheque=REFER,'da Causa','Reclamados');
  rpAnalSintProcLbl20.Caption := '% Sobre Valores '+FU.IFF(Modulo.IdContraCheque=REFER,'da Causa','Reclamados');

  CtrlCustomProcTrab := TCtrlCustomProcTrab.Create(Sistema.IdEmpresa, Sistema.TipoEmpresa);
  CtrlCustomProcTrab.InitializeAs(Padroes);

  frmAguarde.Update;
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PT.NUMPROCTRAB, PT.DATANOTIF AS DATADESLIGAMENTO, PT.DATANOTIF, PT.DATAEFETENC,');
    Add('  PT.IDREGRA, PT.MOEDAPROCTRAB, PT.INDTAXACONV, PT.TIPOENCER,');
    Add('  OBJ.VALORRECL, OBJ.VALORSENTENCA, OBJ.PERCPROB');
    Add('FROM');
    Add('  OBJPROCTRAB OBJ, PROCESSOTRAB PT');
    Add('WHERE');
    Add(FU.QuebrarListaFiltro(2,'(PT.NUMPROCTRAB ', CmpRptCM.ParamByName('ListaNumProcesso').asString, 500)+ ' AND');
    Add('  (PT.NUMPROCTRAB  = OBJ.NUMPROCTRAB(+))');
    Add('ORDER BY');
    Add('  NUMPROCTRAB');
    SaveToFile('c:\qry.txt');
  end;
  dmCds.sql.Open;
  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  frmAguarde.Max := dmCds.Cds.RecordCount;
  frmAguarde.Update;

  rpAnalSintProcLbl1.Caption := CmpRptCM.ParamByName('TituloRelatorio').asString;

  GerarDadosRelat;

  FreeAndNil(CtrlCustomProcTrab);
end;

procedure TRptAnalSintProc.rpAnalSintProcSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptAnalSintProc.GerarDadosRelat;
begin
  sqlAnalSintProc.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    CdsAnalSintProc.Insert;
    CdsAnalSintProc.FieldByName('EMPRESA').asString := Sistema.NomeEmpresa;
    GerarValoresAnaliticos;
    CdsAnalSintProc.Post;
  end
  else
  begin
    CdsAnalSintProc.Insert;
    CdsAnalSintProc.Post;
  end;
end;

procedure TRptAnalSintProc.GerarValoresAnaliticos;
var
  DataHist1, DataHist2: TDateTime;
  iTotQtdEnt, iTotQtdSai, iTotQtdAcordo, iTotQtdDecJud, iTotQtdOutros,
  Ind, iMesAtual, iAnoAtual: integer;
  sMesAtual, sProxMes, sAnoAtual, sProxAno, sNumProcTrab: string;
  ValAtu, ValMax, ValReal, dTotQtdEntMax, dTotQtdEntPrv,
  dTotSaiMax, dTotSaiPrv, dTotValAcordo, dTotValDecJud, dTotValOutros, dTotValDispendidos,
  dValAtualizado, dTotValRecl, dTotValReal, dValorReclamado, dValorReal: double;
  TotQtdPrc, TotQtdEnt, TotQtdSai, TotQtdAco, TotQtdDec, TotQtdOut: array[1..12] of integer;
  TotValMax, TotQtdEntMax, TotSaiMax, TotValPrv, TotQtdEntPrv, TotSaiPrv,
  TotValRea, TotValAco, TotValDec, TotValOut: array[1..12] of double;
begin
  // Zerar variáveis
  iTotQtdEnt:=0; dTotQtdEntMax:=0; dTotQtdEntPrv:=0;
  iTotQtdSai:=0; dTotSaiMax:=0; dTotSaiPrv:=0;
  dTotValDispendidos:=0;
  iTotQtdAcordo:=0; dTotValAcordo:=0;
  iTotQtdDecJud:=0; dTotValDecJud:=0;
  iTotQtdOutros:=0; dTotValOutros:=0;

  FillChar(TotQtdPrc, 12, 0);
  FillChar(TotQtdEnt, 12, 0);
  FillChar(TotQtdSai, 12, 0);
  FillChar(TotQtdAco, 12, 0);
  FillChar(TotQtdDec, 12, 0);
  FillChar(TotQtdOut, 12, 0);

  FillChar(TotValMax, 12, 0);
  FillChar(TotQtdEntMax, 12, 0);
  FillChar(TotSaiMax, 12, 0);
  FillChar(TotValPrv, 12, 0);
  FillChar(TotQtdEntPrv, 12, 0);
  FillChar(TotSaiPrv, 12, 0);
  FillChar(TotValRea, 12, 0);
  FillChar(TotValAco, 12, 0);
  FillChar(TotValDec, 12, 0);
  FillChar(TotValOut, 12, 0);
  dmCds.Cds.First;
  repeat
    sNumProcTrab := dmCds.Cds.FieldByName('NUMPROCTRAB').asString;
    dTotValRecl := 0;
    dValAtualizado := 0;
    dTotValReal := 0;
    repeat
      if (dmCds.Cds.FieldByName('DATADESLIGAMENTO').asString <> '') then
        DataHist1 := StrToDate(Copy(dmCds.Cds.FieldByName('DATADESLIGAMENTO').asString,1,Length(ShortDateFormat)))
      else
      if (dmCds.Cds.FieldByName('DATANOTIF').asString <> '') then
        DataHist1 := StrToDate(Copy(dmCds.Cds.FieldByName('DATANOTIF').asString,1,Length(ShortDateFormat)))
      else
        DataHist1 := 0;

      if (dmCds.Cds.FieldByName('DATAEFETENC').asString <> '') then
        DataHist2 := StrToDate(Copy(dmCds.Cds.FieldByName('DATAEFETENC').asString,1,Length(ShortDateFormat)))
      else
        DataHist2 := 0;

      dValorReclamado := CtrlCustomProcTrab.GetValorAtual(
        dmCds.Cds.FieldByName('VALORRECL').asFloat,
        DataHist1,
        dmCds.Cds.FieldByName('MOEDAPROCTRAB').asInteger,
        dmCds.Cds.FieldByName('IDREGRA').asFloat,
        dmCds.Cds.FieldByName('NUMPROCTRAB').asFloat,
        dmCds.Cds.FieldByName('INDTAXACONV').asInteger);

      dValorReal := CtrlCustomProcTrab.GetValorAtual(
        dmCds.Cds.FieldByName('VALORSENTENCA').asFloat,
        DataHist2,
        dmCds.Cds.FieldByName('MOEDAPROCTRAB').asInteger,
        dmCds.Cds.FieldByName('IDREGRA').asFloat,
        dmCds.Cds.FieldByName('NUMPROCTRAB').asFloat,
        dmCds.Cds.FieldByName('INDTAXACONV').asInteger);

      dValAtualizado := dValAtualizado + dValorReclamado -
        ((100 - dmCds.Cds.FieldByName('PERCPROB').asFloat) * dValorReclamado / 100);

      dTotValRecl := dTotValRecl + dValorReclamado;
      dTotValReal := dTotValReal + dValorReal;
      dmCds.Cds.Next;
    until (dmCds.Cds.EOF) or (sNumProcTrab <> dmCds.Cds.FieldByName('NUMPROCTRAB').asString);

    if not(dmCds.Cds.EOF) then
      dmCds.Cds.Prior;

    Ind := 1;
    iMesAtual := CmpRptCM.ParamByName('MesRef').asInteger + 1;
    iAnoAtual := CmpRptCM.ParamByName('AnoRef').asInteger - 1;
    if (iMesAtual = 13) then
    begin
      iMesAtual := 1;
      iAnoAtual := iAnoAtual + 1;
    end;

    repeat
      sMesAtual := FU.PoeZero(iMesAtual);
      sAnoAtual := IntToStr(iAnoAtual);

      if (iMesAtual+1 = 13) then
      begin
        sProxMes := '01';
        sProxAno := IntToStr(iAnoAtual + 1);
      end
      else
      begin
        sProxMes := FU.PoeZero(iMesAtual+1);
        sProxAno := IntToStr(iAnoAtual);
      end;

      // Total Geral de Processos
      if ((dmCds.Cds.FieldByName('DATANOTIF').IsNull) or
          (dmCds.Cds.FieldByName('DATANOTIF').asDateTime <
           StrToDate('01/' +sProxMes+ '/' +sProxAno))) and
         ((dmCds.Cds.FieldByName('DATAEFETENC').IsNull) or
          (dmCds.Cds.FieldByName('DATAEFETENC').asDateTime >=
           StrToDate('01/' +sProxMes+ '/' +sProxAno))) then
      begin
        TotQtdPrc[Ind] := TotQtdPrc[Ind] + 1; // Quantidade
        TotValMax[Ind] := TotValMax[Ind] + dTotValRecl; // Valores Reclamados
        TotValPrv[Ind] := TotValPrv[Ind] + dValAtualizado; // Valores Estimados
      end;

      // Processos que entraram
      if (not dmCds.Cds.FieldByName('DATANOTIF').IsNull) and
         (dmCds.Cds.FieldByName('DATANOTIF').asDateTime >=
          StrToDate('01/' + sMesAtual + '/' + sAnoAtual)) and
         (dmCds.Cds.FieldByName('DATANOTIF').asDateTime <
          StrToDate('01/' + sProxMes + '/' + sProxAno)) then
      begin
        Inc(iTotQtdEnt);
        dTotQtdEntMax := dTotQtdEntMax + dTotValRecl;
        dTotQtdEntPrv := dTotQtdEntPrv + dValAtualizado;

        TotQtdEnt[Ind] := TotQtdEnt[Ind] + 1; // Quantidade
        TotQtdEntMax[Ind] := TotQtdEntMax[Ind] + dTotValRecl; // Valores Reclamados
        TotQtdEntPrv[Ind] := TotQtdEntPrv[Ind] + dValAtualizado; // Valores Estimados
      end;

      // Processos que saíram
      if (not dmCds.Cds.FieldByName('DATAEFETENC').IsNull) and
         (dmCds.Cds.FieldByName('DATAEFETENC').asDateTime >=
          StrToDate('01/' +sMesAtual+ '/' +sAnoAtual)) and
         (dmCds.Cds.FieldByName('DATAEFETENC').asDateTime <
          StrToDate('01/' +sProxMes+ '/' +sProxAno)) then
      begin
        Inc(iTotQtdSai);
        dTotSaiMax := dTotSaiMax + dTotValRecl;
        dTotSaiPrv := dTotSaiPrv + dValAtualizado;
        dTotValDispendidos := dTotValDispendidos + dTotValReal;

        TotQtdSai[Ind] := TotQtdSai[Ind] + 1; // Quantidade
        TotSaiMax[Ind] := TotSaiMax[Ind] + dTotValRecl; // Valores Reclamados
        TotSaiPrv[Ind] := TotSaiPrv[Ind] + dValAtualizado; // Valores Estimados
        TotValRea[Ind] := TotValRea[Ind] + dTotValReal; // Total dos Valores Dispendidos

        if (dmCds.Cds.FieldByName('TIPOENCER').asString = 'C') then // Acordo
        begin
          Inc(iTotQtdAcordo);
          dTotValAcordo := dTotValAcordo + dTotValReal;
          TotQtdAco[Ind] := TotQtdAco[Ind] + 1;
          TotValAco[Ind] := TotValAco[Ind] + dTotValReal;
        end
        else
        if (dmCds.Cds.FieldByName('TIPOENCER').asString = 'S') then // Sentença
        begin
          Inc(iTotQtdDecJud);
          dTotValDecJud := dTotValDecJud + dTotValReal;
          TotQtdDec[Ind] := TotQtdDec[Ind] + 1;
          TotValDec[Ind] := TotValDec[Ind] + dTotValReal;
        end
        else
        begin // Outro
          Inc(iTotQtdOutros);
          dTotValOutros := dTotValOutros + dTotValReal;
          TotQtdOut[Ind] := TotQtdOut[Ind] + 1;
          TotValOut[Ind] := TotValOut[Ind] + dTotValReal;
        end;
      end;

      CdsAnalSintProc.FieldByName('MES' +FU.PoeZero(Ind)).asString := MesCurto[iMesAtual];
      Inc(Ind);
      Inc(iMesAtual);
      if (iMesAtual > 12) then
      begin
        iMesAtual := 1;
        Inc(iAnoAtual);
      end;
    until (Ind > 12);

    dmCds.Cds.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Update;
  until (dmCds.Cds.EOF);

  for Ind:=1 to 12 do
  begin
    // Total Geral de Processos
    CdsAnalSintProc.FieldByName('TOT_PROC_'+ FU.PoeZero(Ind)).asInteger := TotQtdPrc[Ind];
    // Valores Reclamados
    CdsAnalSintProc.FieldByName('VAL_RECL_TOT_PROC_'+ FU.PoeZero(Ind)).asFloat := TotValMax[Ind] / 1000;
    // Valores Estimados
    CdsAnalSintProc.FieldByName('VAL_EST_TOT_PROC_'+ FU.PoeZero(Ind)).asFloat := TotValPrv[Ind] / 1000;

    // Entrada de Processos
    CdsAnalSintProc.FieldByName('ENT_PROC_'+ FU.PoeZero(Ind)).asInteger := TotQtdEnt[Ind];
    // Valores Reclamados
    CdsAnalSintProc.FieldByName('VAL_RECL_ENT_PROC_'+ FU.PoeZero(Ind)).asFloat := TotQtdEntMax[Ind] / 1000;
    // Valores Estimados
    CdsAnalSintProc.FieldByName('VAL_EST_ENT_PROC_'+ FU.PoeZero(Ind)).asFloat := TotQtdEntPrv[Ind] / 1000;

    // Saída de Processos
    CdsAnalSintProc.FieldByName('SAI_PROC_'+ FU.PoeZero(Ind)).asInteger := TotQtdSai[Ind];
    // Valores Reclamados
    CdsAnalSintProc.FieldByName('VAL_RECL_SAI_PROC_'+ FU.PoeZero(Ind)).asFloat := TotSaiMax[Ind] / 1000;
    // Valores Estimados
    CdsAnalSintProc.FieldByName('VAL_EST_SAI_PROC_'+ FU.PoeZero(Ind)).asFloat := TotSaiPrv[Ind] / 1000;

    // Total dos Valores Dispendidos
    CdsAnalSintProc.FieldByName('VAL_TOT_'+ FU.PoeZero(Ind)).asFloat := TotValRea[Ind] / 1000;

    // Acordos (Qtde.)
    CdsAnalSintProc.FieldByName('QUANT_ACORD_'+ FU.PoeZero(Ind)).asInteger := TotQtdAco[Ind];
    // Valores Dispendidos
    CdsAnalSintProc.FieldByName('VAL_ACORD_'+ FU.PoeZero(Ind)).asFloat := TotValAco[Ind] / 1000;

    // Decisões Judiciais (Qtde.)
    CdsAnalSintProc.FieldByName('QUANT_DEC_JUD_'+ FU.PoeZero(Ind)).asInteger := TotQtdDec[Ind];
    // Valores Dispendidos
    CdsAnalSintProc.FieldByName('VAL_DEC_JUD_'+ FU.PoeZero(Ind)).asFloat := TotValDec[Ind] / 1000;

    // Outros - Arquiv/Desist (Qtde.)
    CdsAnalSintProc.FieldByName('QUANT_OUTROS_'+ FU.PoeZero(Ind)).asInteger := TotQtdOut[Ind];
    // Valores Dispendidos
    CdsAnalSintProc.FieldByName('VAL_OUTROS_'+ FU.PoeZero(Ind)).asFloat := TotValOut[Ind] / 1000;

    // % Sobre Valores Reclamados
    if (TotSaiMax[Ind] = 0) then
      CdsAnalSintProc.FieldByName('PERC_TOT_RECL_'+ FU.PoeZero(Ind)).asFloat := 0
    else
      CdsAnalSintProc.FieldByName('PERC_TOT_RECL_'+ FU.PoeZero(Ind)).asFloat :=
        TotValRea[Ind] * 100 / TotSaiMax[Ind];

    // % Sobre Valores Estimados
    if (TotSaiPrv[Ind] = 0) then
      CdsAnalSintProc.FieldByName('PERC_TOT_EST_'+ FU.PoeZero(Ind)).asFloat := 0
    else
      CdsAnalSintProc.FieldByName('PERC_TOT_EST_'+ FU.PoeZero(Ind)).asFloat :=
        TotValRea[Ind] * 100 / TotSaiPrv[Ind];
  end;

  // Totalizadores...
  // Entrada de Processos
  CdsAnalSintProc.FieldByName('SOMA_ENT_PROC').asInteger := iTotQtdEnt;
  CdsAnalSintProc.FieldByName('SOMA_VAL_RECL_ENT_PROC').asFloat := dTotQtdEntMax / 1000;
  CdsAnalSintProc.FieldByName('SOMA_VAL_EST_ENT_PROC').asFloat := dTotQtdEntPrv / 1000;

  // Saída de Processos
  CdsAnalSintProc.FieldByName('SOMA_SAI_PROC').asInteger := iTotQtdSai;
  CdsAnalSintProc.FieldByName('SOMA_VAL_RECL_SAI_PROC').asFloat := dTotSaiMax / 1000;
  CdsAnalSintProc.FieldByName('SOMA_VAL_EST_SAI_PROC').asFloat := dTotSaiPrv / 1000;

  // Acordos
  CdsAnalSintProc.FieldByName('SOMA_QUANT_ACORD').asInteger := iTotQtdAcordo;
  CdsAnalSintProc.FieldByName('SOMA_VAL_ACORD').asFloat := dTotValAcordo / 1000;

  // Decisões Judiciais
  CdsAnalSintProc.FieldByName('SOMA_QUANT_DEC_JUD').asInteger := iTotQtdDecJud;
  CdsAnalSintProc.FieldByName('SOMA_VAL_DEC_JUD').asFloat := dTotValDecJud / 1000;

  // Outros
  CdsAnalSintProc.FieldByName('SOMA_QUANT_OUTROS').asInteger := iTotQtdOutros;
  CdsAnalSintProc.FieldByName('SOMA_VAL_OUTROS').asFloat := dTotValOutros / 1000;

  // Total dos Valores Dispendidos
  CdsAnalSintProc.FieldByName('SOMA_VAL_TOT').asFloat := dTotValDispendidos / 1000;

  // % Sobre Valores Reclamados
  if (dTotSaiMax = 0) then
    CdsAnalSintProc.FieldByName('SOMA_PERC_TOT_RECL').asFloat := 0
  else
    CdsAnalSintProc.FieldByName('SOMA_PERC_TOT_RECL').asFloat :=
      dTotValDispendidos * 100 / dTotSaiMax;

  // % Sobre Valores Estimados
  if (dTotSaiMax = 0) then
    CdsAnalSintProc.FieldByName('SOMA_PERC_TOT_EST').asFloat := 0
  else
    CdsAnalSintProc.FieldByName('SOMA_PERC_TOT_EST').asFloat :=
      dTotValDispendidos * 100 / dTotSaiMax;
end;

end.
