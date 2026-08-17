unit fParamProcTrab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcesso,
  Db, DBTables, Wwquery, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, wwdblook, TEdNum, Spin, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls,
  ComCtrls, Grids, DBGrids, TREdit, CheckLst;

type
  TfrmParamProcTrab = class(TfrmSelProcesso)
    tbshRelatorio: TTabSheet;
    qryObj: TwwQuery;
    gbxTituloRelat: TGroupBox;
    edTituloRelat: TEdit;
    rgTipoRel: TRadioGroup;
    gbxEncargos: TGroupBox;
    redEncargos: TRealEdit;
    rgImprimeRateio: TRadioGroup;
    rgImprimeLitis: TRadioGroup;
    rgImprimeCargo: TRadioGroup;
    rgImprimeResumo: TRadioGroup;
    rgImprimeCabRod: TRadioGroup;
    rgImprimeEtapa: TRadioGroup;
    rgImprimeObservEtapa: TRadioGroup;
    rgExibeRelatRisco: TRadioGroup;
    rgImprimeObj: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    rgNumProc: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgImprimeEtapaClick(Sender: TObject);
    procedure rgTipoRelClick(Sender: TObject);
  private
    bImprimeEtapaSel, bImprimeObjSel: boolean;

    UnidadeProc: array of record
      ID, Nome: string;
    end;

    procedure GerarUnidadeProc;
    procedure GerarValoresResumoProcTrab;
    procedure GerarValoresProcTrab;
    procedure GerarRateio;
    procedure GravarDadosQuery;
  end;

var
  frmParamProcTrab: TfrmParamProcTrab;

implementation

uses Printers, ppTypes, uSistema, uMensErro, fAguarde, dBaseDados,
  uFuncoesUteisRH, uValorAtual, dRelatoriosModCon;

const
  arrSit: array[0..1] of string[3] = ('Abr','Enc');

{$R *.DFM}

procedure TfrmParamProcTrab.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
//  bSalvaOpcoes := true;
  inherited;
  cmbTipoPapel.Items.Assign (dtmRelatoriosModCon.rpProcTrab.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;
end;

procedure TfrmParamProcTrab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmBaseDados.qry.Close;
  qryObj.Close;
  inherited;
  SetLength(UnidadeProc,0);
end;

procedure TfrmParamProcTrab.rgImprimeEtapaClick(Sender: TObject);
begin
  rgImprimeObservEtapa.Enabled := (rgImprimeEtapa.ItemIndex <> 1);
end;

procedure TfrmParamProcTrab.rgTipoRelClick(Sender: TObject);
begin
  gbxEncargos.Visible := (rgTipoRel.ItemIndex = 1);
  redEncargos.Value   := 28.8;
  if (rgTipoRel.ItemIndex = 1) then
  begin
    rgSitProc.ItemIndex := 1;
    rgSitProc.Enabled   := false;
    dtmRelatoriosModCon.rPercEnc := redEncargos.Value;
  end;
end;

procedure TfrmParamProcTrab.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  sAux: string;
begin
  inherited;
  GerarUnidadeProc;

  // Monta Query Principal
  with (dtmRelatoriosModCon) do
  begin
    frmAguarde.Mostra ('Relatório de Processos');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query principal
    qryAnalSintProc.UpdateObject := updSQL;

    if not(qryProcTrab.IsEmpty) then
      qryProcTrab.CancelUpdates;
    qryProcTrab.Close;
    qryProcTrab.Open;

    // Habilito a impressão de Rateios
    bApuraRateio := (rgImprimeRateio.ItemIndex = 0);
    rpProcTrabSubRepRateio.Visible := (bApuraRateio);
    if not(dtmRelatoriosModCon.qryProcTrab5.IsEmpty) then
      dtmRelatoriosModCon.qryProcTrab5.CancelUpdates;
    dtmRelatoriosModCon.qryProcTrab5.Close;
    dtmRelatoriosModCon.qryProcTrab5.Open;

    if (bApuraRateio) then
    begin
      rpProcTrabSubRepRateio.DataPipeline := ppProcTrab5;
      dtmBaseDados.qry.Close;
      dtmBaseDados.qry.SQL.Clear;
      with (dtmBaseDados.qry.SQL) do
      begin
        Add('SELECT');
        Add('  R.IdFilialPessoa, R.IdPessoa, R.DataBase, R.TipoRateio, R.Periodo,');
        Add('  R.Percent1, R.ValorBase1, R.Percent2, R.ValorBase2, R.Percent3,');
        Add('  R.ValorBase3, R.Percent4, R.ValorBase4, R.Percent5, R.ValorBase5,');
        Add('  P.Nome');
        Add('FROM');
        Add('  Pessoa P, RateioProcTrab R');
        Add('WHERE');
        Add('  (R.IdPessoa = P.IdPessoa)');
        Add('ORDER BY');
        Add('  R.IdPessoa');
      end;
      dtmBaseDados.qry.Open;

      while not(dtmBaseDados.qry.EOF) do
      begin
        dtmRelatoriosModCon.qryProcTrab5.Insert;
        dtmRelatoriosModCon.qryProcTrab5.FieldByName('IdFilialPessoa').asString :=
          dtmBaseDados.qry.FieldByName('IdPessoa').asString;
        dtmRelatoriosModCon.qryProcTrab5.FieldByName('Empresa').asString :=
          dtmBaseDados.qry.FieldByName('Nome').asString;
        dtmRelatoriosModCon.qryProcTrab5.FieldByName('RiscoMaximo').asFloat := 0;
        dtmRelatoriosModCon.qryProcTrab5.FieldByName('RiscoProvavel').asFloat := 0;
        dtmRelatoriosModCon.qryProcTrab5.FieldByName('ValorReal').asFloat := 0;
        dtmRelatoriosModCon.qryProcTrab5.Post;
        dtmBaseDados.qry.Next;
      end;
      dtmBaseDados.qry.First;
    end
    else
      rpProcTrabSubRepRateio.DataPipeline := nil;

    // Habilito a impressão do Resumo
    rpProcTrabSubRep4.Visible := (rgImprimeResumo.ItemIndex = 0);
    if (rpProcTrabSubRep4.Visible) then
    begin
      if not(qryProcTrab4.IsEmpty) then
        qryProcTrab4.CancelUpdates;
      qryProcTrab4.Close;
      qryProcTrab4.Open;
      rpProcTrabSubRep4.DataPipeline := ppProcTrab4;
    end
    else
      rpProcTrabSubRep4.DataPipeline := nil;

    // Processa dados para a geração da query
    bExibeRelatRiscoMax := (rgExibeRelatRisco.ItemIndex = 0);
    GravarDadosQuery;
    qryProcTrab.First;

    // Habilito a impressão dos Litisconsortes
    bImprimeLitis := (rgImprimeLitis.ItemIndex < 2);
    rpProcTrabSubRep1.Visible := (bImprimeLitis);
    dsProcTrab1.DataSet := qryProcTrab1;
    if (bImprimeLitis) then
    begin
      rpProcTrabSubRep1Lbl2.Visible   := (rgImprimeLitis.ItemIndex = 0);
      rpProcTrabSubRep1DBTxt2.Visible := (rgImprimeLitis.ItemIndex = 0);
      dtmRelatoriosModCon.qryProcTrab1.SQL[9] := '';
    end
    else
      dtmRelatoriosModCon.qryProcTrab1.SQL[9] := '  (1 = 2) AND'; // Não deve ser mostrado

    // Habilito a impressão das Etapas ou Andamentos
    bImprimeEtapa    := (rgImprimeEtapa.ItemIndex <> 1);
    bImprimeEtapaSel := (rgImprimeEtapa.ItemIndex  = 2);
    bImprimeObsEtapa := (rgImprimeEtapa.ItemIndex <> 1) and (rgImprimeObservEtapa.ItemIndex = 0);
    rpProcTrabSubRep2.Visible := (bImprimeEtapa);
    if (bImprimeEtapa) then
    begin
      dtmRelatoriosModCon.qryProcTrab2.SQL[9] := '';
      rpProcTrabSubRep2.DataPipeline := ppProcTrab2;
    end
    else
      rpProcTrabSubRep2.DataPipeline := nil;

    sAux := '';
    if (bImprimeEtapaSel) then
    begin
      if (lstCodEtapa.Items.Count > 0) then
        for c:=0 to lstCodEtapa.Items.Count-1 do
          if (Pos(',',sAux) > 0) then
            sAux := sAux +','+ lstCodEtapa.Items[c]
          else
            sAux := sAux + lstCodEtapa.Items[c];

      if (Trim(sAux) <> '') then
        if (Pos(',',sAux) > 0) then
          dtmRelatoriosModCon.qryProcTrab2.SQL[9] := '  (E.CODTIPORECURSO IN ('+sAux+')) AND'
        else
          dtmRelatoriosModCon.qryProcTrab2.SQL[9] := '  (E.CODTIPORECURSO = '+sAux+') AND';
    end;

    if not(bImprimeEtapa) or ((bImprimeEtapaSel) and (Trim(sAux) = '')) then
      dtmRelatoriosModCon.qryProcTrab2.SQL[9] := '  (1 = 2) AND'; // Não deve ser mostrado

    // Habilito a impressão dos Objetos
    bImprimeObj    := (rgImprimeObj.ItemIndex <> 1);
    bImprimeObjSel := (rgImprimeObj.ItemIndex  = 2);
    rpProcTrabSubRep3.Visible := (bImprimeObj);
    if (bImprimeObj) then
    begin
      dtmRelatoriosModCon.qryProcTrab3.SQL[8] := '';
      rpProcTrabSubRep3.DataPipeline := ppProcTrab3;
    end
    else
      rpProcTrabSubRep3.DataPipeline := nil;

    sAux := '';
    if (bImprimeObjSel) then
    begin
      if (lstCodObjeto.Items.Count > 0) then
        for c:=0 to lstCodObjeto.Items.Count-1 do
          if (Pos(',',sAux) > 0) then
            sAux := sAux +','+ lstCodObjeto.Items[c]
          else
            sAux := sAux + lstCodObjeto.Items[c];

      if (Trim(sAux) <> '') then
        if (Pos(',',sAux) > 0) then
          dtmRelatoriosModCon.qryProcTrab3.SQL[8] := '  (O.CODTIPOOBJETO IN ('+sAux+')) AND'
        else
          dtmRelatoriosModCon.qryProcTrab3.SQL[8] := '  (O.CODTIPOOBJETO = '+sAux+') AND';
    end;

    if not(bImprimeObj) or ((bImprimeObjSel) and (Trim(sAux) = '')) then
      dtmRelatoriosModCon.qryProcTrab3.SQL[8] := '  (1 = 2) AND'; // Não deve ser mostrado

    // Especifico as demais configurações do Relatório
    rpProcTrabLbl1.Caption := edTituloRelat.Text;

    rpProcTrabHdrBnd.Visible      := (rgImprimeCabRod.ItemIndex = 0);
    rpProcTrabGrpHdrBnd2.Visible  := (bApuraRateio);
    rpProcTrabGrpFootBnd0.Visible := rpProcTrabHdrBnd.Visible;
    rpProcTrabShape1.Visible      := (rgImprimeLitis.ItemIndex < 2) or
      (rgImprimeEtapa.ItemIndex <> 1) or (rgImprimeObj.ItemIndex <> 1);
    rpProcTrabLbl17.Visible := (rgSitProc.ItemIndex > 0);
    rpProcTrabLbl18.Visible := rpProcTrabLbl17.Visible;
    rpProcTrabLbl19.Visible := rpProcTrabLbl17.Visible;
    rpProcTrabLbl20.Visible := rpProcTrabLbl17.Visible;
    rpProcTrabLbl21.Visible := rpProcTrabLbl17.Visible;

    rpProcTrabDBTxt1.Width  := rpProcTrab.PrinterSetup.PaperWidth -
      (rpProcTrab.PrinterSetup.MarginLeft * 2) - (rpProcTrabDBTxt1.Left * 2);
    rpProcTrabLbl1.Width    := rpProcTrabDBTxt1.Width;

    rpProcTrabLbl14.Caption        := IFF(bExibeRelatRiscoMax,'Máximo',      'Original');
    rpProcTrabSubRep4Lbl6.Caption  := IFF(bExibeRelatRiscoMax,'Risco Máximo','Risco Original');
    rpProcTrabSubRep4Lbl10.Caption := IFF(bExibeRelatRiscoMax,'Sobre Máximo','Sobre Original');

    bImprimeCargo := (rgImprimeCargo.ItemIndex = 0);
    rpProcTrab.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
    rpProcTrabShape1.Width := rpProcTrab.PrinterSetup.PaperWidth -
      (rpProcTrab.PrinterSetup.MarginLeft * 2) - (rpProcTrabShape1.Left * 2);
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamProcTrab.GerarUnidadeProc;
var
  k: integer;
  sListaUnidade: string;
begin
  k := 0;
  sListaUnidade := '';
  while not(qryProcesso.EOF) do
  begin
    if (k = 0) then
    begin
      sListaUnidade := qryProcesso.FieldByName('IdEstab').asString;
      Inc(k);
    end
    else
    if (VerificaCodigoEm (sListaUnidade,qryProcesso.FieldByName('IdEstab').asString,',') = 0) then
      sListaUnidade := sListaUnidade +','+ qryProcesso.FieldByName('IdEstab').asString;

    qryProcesso.Next;
  end;

  if (sListaUnidade <> '') then
  begin
    dtmBaseDados.qry.Close;
    with (dtmBaseDados.qry.SQL) do
    begin
      Clear;
      Add('SELECT IdPessoa, Nome');
      Add('FROM   Pessoa');
      Add('WHERE');
      if (Pos(',',sListaUnidade) > 0) then
        Add('  (IdPessoa IN (' +sListaUnidade+ '))')
      else
        Add('  (IdPessoa = ' +sListaUnidade+ ')');
      SaveToFile('c:\qry.txt');
    end;
    dtmBaseDados.qry.Open;
    dtmBaseDados.qry.Last;
    SetLength(UnidadeProc,dtmBaseDados.qry.RecordCount);
    dtmBaseDados.qry.First;
    k := 0;
    while not(dtmBaseDados.qry.EOF) do
    begin
      UnidadeProc[k].ID   := dtmBaseDados.qry.FieldByName('IdPessoa').asString;
      UnidadeProc[k].Nome := dtmBaseDados.qry.FieldByName('Nome').asString;
      Inc(k);
      dtmBaseDados.qry.Next;
    end;
  end
  else
    SetLength(UnidadeProc,0);
end;

procedure TfrmParamProcTrab.GerarValoresProcTrab;
var
  rRiscoMax, rRiscoProv, rValReal, rValorReclamado: real;
begin
  with (dtmRelatoriosModCon.qryProcTrab) do
  begin
    rRiscoMax  := 0;
    rRiscoProv := 0;
    rValReal   := 0;
    qryObj.Close;
    qryObj.ParamByName('NumProcTrab').asString := qryProcesso.FieldByName('NumProcTrab').asString;
    qryObj.Open;
    while not(qryObj.EOF) do
    begin
      rValorReclamado := ValorAtual(
        qryObj.FieldByName('ValorRecl').asFloat,
        IFF(qryProcesso.FieldByName('DataDesligamento').asString='',
            qryProcesso.FieldByName('DataNotif').asString,
            qryProcesso.FieldByName('DataDesligamento').asString),
        qryProcesso.FieldByName('MoedaProcTrab').asString,
        qryProcesso.FieldByName('IdRegra').asString,
        qryProcesso.FieldByName('NumProcTrab').asString,
        qryProcesso.FieldByName('IndTaxaConv').asInteger);

      rRiscoProv := rRiscoProv + rValorReclamado -
        ((100 - qryObj.FieldByName('PercProb').asFloat) * rValorReclamado / 100);

      if (dtmRelatoriosModCon.bExibeRelatRiscoMax) then
        rRiscoMax := rRiscoMax + rValorReclamado
      else
        rRiscoMax := rRiscoMax + rValorReclamado -
          ((100 - qryObj.FieldByName('PercOrig').asFloat) * rValorReclamado / 100);

      rValReal := rValReal + ValorAtual(
        qryObj.FieldByName('ValorSentenca').asFloat,
        qryProcesso.FieldByName('DataEfetEnc').asString,
        qryProcesso.FieldByName('MoedaProcTrab').asString,
        qryProcesso.FieldByName('IdRegra').asString,
        qryProcesso.FieldByName('NumProcTrab').asString,
        qryProcesso.FieldByName('IndTaxaConv').asInteger);
      qryObj.Next;
    end;
    qryObj.First;

    FieldByName('RiscoMaximo').asFloat   := rRiscoMax;
    FieldByName('RiscoProvavel').asFloat := rRiscoProv;

    if (qryProcesso.FieldByName('FlgSitProc').asInteger = 1) then
    begin
      FieldByName('ValorReal').asFloat := rValReal;
      FieldByName('Economia1').asFloat := rRiscoMax  - rValReal;
      FieldByName('Economia2').asFloat := rRiscoProv - rValReal;
    end
    else
    begin
      FieldByName('ValorReal').asFloat := 0;
      FieldByName('Economia1').asFloat := 0;
      FieldByName('Economia2').asFloat := 0;
    end;

    if (rgTipoRel.ItemIndex = 1) then
    begin
      if (qryProcesso.FieldByName('TipoEncer').asString = 'A') then
        FieldByName('TipoEncer').asString := 'Arquivamento'
      else
      if (qryProcesso.FieldByName('TipoEncer').asString = 'C') then
        FieldByName('TipoEncer').asString := 'Acordo'
      else
      if (qryProcesso.FieldByName('TipoEncer').asString = 'D') then
        FieldByName('TipoEncer').asString := 'Desistência'
      else
      if (qryProcesso.FieldByName('TipoEncer').asString = 'S') then
        FieldByName('TipoEncer').asString := 'Sentença'
      else
        FieldByName('TipoEncer').asString := 'Não Identificado';
    end;
  end;
end;

procedure TfrmParamProcTrab.GerarValoresResumoProcTrab;
var
  c: integer;
begin
  with (dtmRelatoriosModCon.qryProcTrab4) do
  begin
    if not(Locate('IdEstab',qryProcesso.FieldByName('IdEstab').asInteger,[])) then
    begin
      Insert;
      FieldByName('IdEstab').asInteger := qryProcesso.FieldByName('IdEstab').asInteger;
      FieldByName('Empresa').asString  := dtmRelatoriosModCon.qryProcTrab.FieldByName('Empresa').asString;

      if (High(UnidadeProc)+1 > 0) then
        for c:=0 to High(UnidadeProc) do
          if (qryProcesso.FieldByName('IdEstab').asString = UnidadeProc[c].ID) then
          begin
            FieldByName('Unidade').asString := UnidadeProc[c].Nome;
            break;
          end;
    end
    else
      Edit;

    FieldByName('QtdProc').asInteger     := FieldByName('QtdProc').asInteger + 1;
    FieldByName('ValReclamado').asFloat  := FieldByName('ValReclamado').asFloat +
      dtmRelatoriosModCon.qryProcTrab.FieldByName('RiscoMaximo').asFloat;
    FieldByName('ValEstimado').asFloat   := FieldByName('ValEstimado').asFloat +
      dtmRelatoriosModCon.qryProcTrab.FieldByName('RiscoProvavel').asFloat;
    FieldByName('ValReal').asFloat       := FieldByName('ValReal').asFloat +
      dtmRelatoriosModCon.qryProcTrab.FieldByName('ValorReal').asFloat;
    FieldByName('EconReclamado').asFloat := FieldByName('EconReclamado').asFloat +
      dtmRelatoriosModCon.qryProcTrab.FieldByName('Economia1').asFloat;
    FieldByName('EconEstimado').asFloat  := FieldByName('EconEstimado').asFloat +
      dtmRelatoriosModCon.qryProcTrab.FieldByName('Economia2').asFloat;
  end;
end;

procedure TfrmParamProcTrab.GerarRateio;
const
  arrCampoTot: array [1..5] of string = (
    'RiscoMaximo', 'RiscoProvavel', 'ValorReal','Economia1','Economia2');
  arrCampo: array [1..3] of string = (
    'RiscoMaximo_Rateio','RiscoProvavel_Rateio','ValorReal_Rateio');
var
  c: byte;
  dPercRateio: double;
  bGerouRateio: boolean;
  dtDataAdm, dtDataDem: TDate;
begin
  bGerouRateio := false;
  if (dtmBaseDados.qry.Locate('IdFilialPessoa',
      qryProcesso.FieldByName('IdEstab').asString,[])) and
     (dtmRelatoriosModCon.qryProcTrab5.Locate('IdFilialPessoa',
      dtmBaseDados.qry.FieldByName('IdPessoa').asString,[])) then
  begin
    for c:=1 to 3 do
      dtmRelatoriosModCon.qryProcTrab.FieldByName(arrCampo[c]).asFloat := 0;

    if not(qryProcesso.FieldByName('DataAdmissao').IsNull) then
      dtDataAdm := qryProcesso.FieldByName('DataAdmissao').asDateTime
    else
      dtDataAdm := Date - (365 * 20);

    if (qryProcesso.FieldByName('TipoSit').asString = 'D') and
       not(qryProcesso.FieldByName('DataDesligamento').IsNull) then
      dtDataDem := qryProcesso.FieldByName('DataDesligamento').asDateTime
    else
      dtDataDem := Date;

    if (dtmBaseDados.qry.FieldByName('TipoRateio').asInteger = 1) then // Processo Encerrado
    begin
      dPercRateio := RateioCusto(
        0,
        dtDataAdm,
        dtDataDem,
        qryProcesso.FieldByName('DataNotif').asDateTime,
        dtmBaseDados.qry.FieldByName('IdFilialPessoa').asInteger,
        dtmBaseDados.qry.FieldByName('IdPessoa').asInteger,
        dtmBaseDados.qry.FieldByName('DataBase').asDateTime,
        dtmBaseDados.qry.FieldByName('TipoRateio').asInteger,
        dtmBaseDados.qry.FieldByName('Periodo').asInteger,
        dtmBaseDados.qry.FieldByName('Percent1').asFloat,
        dtmBaseDados.qry.FieldByName('ValorBase1').asFloat,
        dtmBaseDados.qry.FieldByName('Percent2').asFloat,
        dtmBaseDados.qry.FieldByName('ValorBase2').asFloat,
        dtmBaseDados.qry.FieldByName('Percent3').asFloat,
        dtmBaseDados.qry.FieldByName('ValorBase3').asFloat,
        dtmBaseDados.qry.FieldByName('Percent4').asFloat,
        dtmBaseDados.qry.FieldByName('ValorBase4').asFloat,
        dtmBaseDados.qry.FieldByName('Percent5').asFloat,
        dtmBaseDados.qry.FieldByName('ValorBase5').asFloat);

      if (dPercRateio > 0) then
      begin
        dtmRelatoriosModCon.qryProcTrab5.Edit;
        dtmRelatoriosModCon.qryProcTrab5.FieldByName('RiscoMaximo').asFloat :=
          dtmRelatoriosModCon.qryProcTrab.FieldByName('RiscoMaximo').asFloat *
          dPercRateio / 100;
        dtmRelatoriosModCon.qryProcTrab5.FieldByName('RiscoProvavel').asFloat :=
          dtmRelatoriosModCon.qryProcTrab.FieldByName('RiscoProvavel').asFloat *
          dPercRateio / 100;
        dtmRelatoriosModCon.qryProcTrab5.FieldByName('ValorReal').asFloat :=
          dtmRelatoriosModCon.qryProcTrab5.FieldByName('ValorReal').asFloat *
          dPercRateio / 100;
        dtmRelatoriosModCon.qryProcTrab5.Post;
        bGerouRateio := true;
      end;
    end
    else // Processo Aberto
    for c:=1 to 3 do
    begin
      dPercRateio := RateioCusto(
        dtmRelatoriosModCon.qryProcTrab.FieldByName(arrCampoTot[c]).asFloat,
        dtDataAdm,
        dtDataDem,
        qryProcesso.FieldByName('DataNotif').asDateTime,
        dtmBaseDados.qry.FieldByName('IdFilialPessoa').asInteger,
        dtmBaseDados.qry.FieldByName('IdPessoa').asInteger,
        dtmBaseDados.qry.FieldByName('DataBase').asDateTime,
        dtmBaseDados.qry.FieldByName('TipoRateio').asInteger,
        dtmBaseDados.qry.FieldByName('Periodo').asInteger,
        dtmBaseDados.qry.FieldByName('Percent1').asFloat,
        dtmBaseDados.qry.FieldByName('ValorBase1').asFloat,
        dtmBaseDados.qry.FieldByName('Percent2').asFloat,
        dtmBaseDados.qry.FieldByName('ValorBase2').asFloat,
        dtmBaseDados.qry.FieldByName('Percent3').asFloat,
        dtmBaseDados.qry.FieldByName('ValorBase3').asFloat,
        dtmBaseDados.qry.FieldByName('Percent4').asFloat,
        dtmBaseDados.qry.FieldByName('ValorBase4').asFloat,
        dtmBaseDados.qry.FieldByName('Percent5').asFloat,
        dtmBaseDados.qry.FieldByName('ValorBase5').asFloat);

      if (dPercRateio > 0) then
      begin
        dtmRelatoriosModCon.qryProcTrab5.Edit;
        dtmRelatoriosModCon.qryProcTrab5.FieldByName(arrCampoTot[c]).asFloat :=
          dtmRelatoriosModCon.qryProcTrab5.FieldByName(arrCampoTot[c]).asFloat + dPercRateio;
        dtmRelatoriosModCon.qryProcTrab5.Post;
        bGerouRateio := true;
      end;
    end;

    if (bGerouRateio) then
    begin
      // Atribuo valores ao processo atual
      dtmRelatoriosModCon.qryProcTrab.FieldByName('Empresa_Rateio').asString :=
        dtmBaseDados.qry.FieldByName('Nome').asString;
      dtmRelatoriosModCon.qryProcTrab.FieldByName('RiscoMaximo_Rateio').asFloat :=
        dtmRelatoriosModCon.qryProcTrab5.FieldByName('RiscoMaximo').asFloat;
      dtmRelatoriosModCon.qryProcTrab.FieldByName('RiscoProvavel_Rateio').asFloat :=
        dtmRelatoriosModCon.qryProcTrab5.FieldByName('RiscoProvavel').asFloat;
      dtmRelatoriosModCon.qryProcTrab.FieldByName('ValorReal_Rateio').asFloat :=
        dtmRelatoriosModCon.qryProcTrab5.FieldByName('ValorReal').asFloat;
    end;
  end;
end;

procedure TfrmParamProcTrab.GravarDadosQuery;
var
  c: integer;
begin
  with (dtmRelatoriosModCon.qryProcTrab) do
  begin
    if not(qryProcesso.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := qryProcesso.RecordCount;

      qryProcesso.First;
      repeat
        Insert;
        FieldByName('Empresa').asString        := Sistema.NomeEmpresa;
        FieldByName('JCJ').asString            := qryProcesso.FieldByName('JCJ').asString;
        FieldByName('NumProcTrab').asString    := qryProcesso.FieldByName('NumProcTrab').asString;
        FieldByName('NumProc').asString        := qryProcesso.FieldByName('NumProcTrab').asString;
        if (rgNumProc.ItemIndex = 1) then
          FieldByName('ProcJCJNum').asString     := qryProcesso.FieldByName('ProcJCJNum').asString
        else
          FieldByName('ProcJCJNum').asString     := qryProcesso.FieldByName('NumProcTrab').asString;
        FieldByName('Reclamante').asString     := qryProcesso.FieldByName('Nome').asString;
        FieldByName('DataNotif').asString      := qryProcesso.FieldByName('DataNotif').asString;
        FieldByName('MoedaProcTrab').asString  := qryProcesso.FieldByName('MoedaProcTrab').asString;
        FieldByName('IdRegra').asString        := qryProcesso.FieldByName('IdRegra').asString;
        FieldByName('IndTaxaConv').asString    := qryProcesso.FieldByName('IndTaxaConv').asString;
        FieldByName('DataEfetEnc').asString    := qryProcesso.FieldByName('DataEfetEnc').asString;
        FieldByName('FlgSitProc').asString     := qryProcesso.FieldByName('FlgSitProc').asString;

        if (High(UnidadeProc)+1 > 0) then
          for c:=0 to High(UnidadeProc) do
            if (qryProcesso.FieldByName('IdEstab').asString = UnidadeProc[c].ID) then
            begin
              FieldByName('Unidade').asString := UnidadeProc[c].Nome;
              break;
            end;

        if (qryProcesso.Fields.FindField('DataAdmissao') <> nil) then
          FieldByName('DataAdmissao').asString := qryProcesso.FieldByName('DataAdmissao').asString;
        if (qryProcesso.Fields.FindField('DataDesligamento') <> nil) then
          FieldByName('DataDesligamento').asString := qryProcesso.FieldByName('DataDesligamento').asString;
        if (qryProcesso.Fields.FindField('Titulo') <> nil) then
          FieldByName('Cargo').asString := qryProcesso.FieldByName('Titulo').asString;

        FieldByName('Situacao').asString := arrSit[qryProcesso.FieldByName('FlgSitProc').asInteger];

        GerarValoresProcTrab;
        if (rgImprimeResumo.ItemIndex = 0) then
          GerarValoresResumoProcTrab;
        if (dtmRelatoriosModCon.bApuraRateio) then
          GerarRateio;

        Post;
        qryProcesso.Next;
      until (qryProcesso.EOF);

      if (rgImprimeResumo.ItemIndex = 0) then
        dtmRelatoriosModCon.qryProcTrab4.Post;
    end
    else
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    end;
  end;
end;

end.
