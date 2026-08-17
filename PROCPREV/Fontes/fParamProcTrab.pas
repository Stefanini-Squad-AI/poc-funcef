unit fParamProcTrab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcesso,
  Db, DBTables, Wwquery, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, wwdblook, TEdNum, Spin, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls,
  ComCtrls, Grids, DBGrids;

type
  TfrmParamProcTrab = class(TfrmSelProcesso)
    tbshRelatorio: TTabSheet;
    gbxTituloRelat: TGroupBox;
    edTituloRelat: TEdit;
    rgNumProc: TRadioGroup;
    rgImprimeCargo: TRadioGroup;
    rgImprimeLitis: TRadioGroup;
    rgImprimeOpcao: TRadioGroup;
    rgImprimeEtapa: TRadioGroup;
    rgImprimeObservEtapa: TRadioGroup;
    rgImprimeResumo: TRadioGroup;
    rgImprimeCabRod: TRadioGroup;
    rgImprimeObj: TRadioGroup;
    qryObj: TwwQuery;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    RadioGroup1: TRadioGroup;
    rgExibeRelatRisco: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgImprimeEtapaClick(Sender: TObject);
    procedure rgImprimeOpcaoClick(Sender: TObject);
  private
    bImprimeEtapaSel, bImprimeObjSel: boolean;

    EstadoProc: array of record
      ID, UF, Nome: string;
    end;
    
    PatrocProc: array of record
      ID, Nome: string;
    end;

    procedure GeraEstadoProc;
    procedure GeraPatrocProc;
    procedure GeraValoresResumoProcTrab;
    procedure GeraValoresProcTrab;
    procedure GravaDadosQuery;
  end;

var
  frmParamProcTrab: TfrmParamProcTrab;

implementation

uses Printers, ppTypes, uSistema, uMensErro, fAguarde, dCds,
  uFuncoesUteisRH, uValorAtual, dRelatoriosProcPrev;

const
  arrSit: array[0..1] of string[3] = ('Abr','Enc');

{$R *.DFM}

procedure TfrmParamProcTrab.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  bSalvaOpcoes := true;
  inherited;
  cmbTipoPapel.Items.Assign (dtmRelatoriosProcPrev.rpProcTrab.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;
end;

procedure TfrmParamProcTrab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmCds.qry.Close;
  qryObj.Close;
  inherited;
  SetLength(EstadoProc,0);
  SetLength(PatrocProc,0);
end;

procedure TfrmParamProcTrab.rgImprimeEtapaClick(Sender: TObject);
begin
  rgImprimeObservEtapa.Enabled := (rgImprimeEtapa.ItemIndex <> 1);
end;

procedure TfrmParamProcTrab.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  sAux: string;
begin
  inherited;
  qryProcesso.SQL.SaveToFile('c:\Processo.txt');
  GeraEstadoProc;
  GeraPatrocProc;

  // Monta Query Principal
  with (dtmRelatoriosProcPrev) do
  begin
    bExibeRelatRiscoMax := (rgExibeRelatRisco.ItemIndex = 0);

    rpProcTrabLbl14.Caption        := IFF(bExibeRelatRiscoMax,'Máximo',      'Original');
    rpProcTrabLbl19.Caption        := IFF(bExibeRelatRiscoMax,'s/Máximo',    's/Original');
    rpProcTrabSubRep4Lbl6.Caption  := IFF(bExibeRelatRiscoMax,'Risco Máximo','Risco Original');
    rpProcTrabSubRep4Lbl10.Caption := IFF(bExibeRelatRiscoMax,'Sobre Máximo','Sobre Original');

    frmAguarde.Mostra ('Relatório de Processos');
    frmAguarde.Pos := 0;

    if not(qryProcTrab.IsEmpty) then
      qryProcTrab.CancelUpdates;
    qryProcTrab.Close;
    qryProcTrab.Open;

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
    //if (rgImprimeObj.ItemIndex <> 1) then
      qryObj.Open;

    GravaDadosQuery;
    qryProcTrab.First;

    // Habilito a impressão dos Litisconsortes
    bImprimeLitis := (rgImprimeLitis.ItemIndex < 2);
    rpProcTrabSubRep1.Visible := (bImprimeLitis);
    dsProcTrab1.DataSet := qryProcTrab1;    
    if (bImprimeLitis) then
    begin
      rpProcTrabSubRep1Lbl2.Visible   := (rgImprimeLitis.ItemIndex = 0);
      rpProcTrabSubRep1DBTxt2.Visible := (rgImprimeLitis.ItemIndex = 0);
      dtmRelatoriosProcPrev.qryProcTrab1.SQL[7] := '';
    end
    else
      dtmRelatoriosProcPrev.qryProcTrab1.SQL[7] := '  (1 = 2) AND'; // Não deve ser mostrado

    // Habilito a impressão das Etapas ou Andamentos
    bImprimeEtapa    := (rgImprimeEtapa.ItemIndex <> 1);
    bImprimeEtapaSel := (rgImprimeEtapa.ItemIndex  = 2);
    bImprimeObsEtapa := (rgImprimeEtapa.ItemIndex <> 1) and (rgImprimeObservEtapa.ItemIndex = 0);
    rpProcTrabSubRep2.Visible := (bImprimeEtapa);
    if (bImprimeEtapa) then
    begin
      dtmRelatoriosProcPrev.qryProcTrab2.SQL[9] := '';
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
          dtmRelatoriosProcPrev.qryProcTrab2.SQL[9] := '  (E.CODTIPORECURSO IN ('+sAux+')) AND'
        else
          dtmRelatoriosProcPrev.qryProcTrab2.SQL[9] := '  (E.CODTIPORECURSO = '+sAux+') AND';
    end;

    if not(bImprimeEtapa) or ((bImprimeEtapaSel) and (Trim(sAux) = '')) then
      dtmRelatoriosProcPrev.qryProcTrab2.SQL[9] := '  (1 = 2) AND'; // Não deve ser mostrado

    // Habilito a impressão dos Objetos
    bImprimeObj    := (rgImprimeObj.ItemIndex <> 1);
    bImprimeObjSel := (rgImprimeObj.ItemIndex  = 2);
    bImprimeOpcao  := (rgImprimeOpcao.ItemIndex  = 0);
    rpProcTrabSubRep3.Visible := (bImprimeObj);
    if (bImprimeObj) then
    begin
      dtmRelatoriosProcPrev.qryProcTrab3.SQL[8] := '';
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
          dtmRelatoriosProcPrev.qryProcTrab3.SQL[8] := '  (O.CODTIPOOBJETO IN ('+sAux+')) AND'
        else
          dtmRelatoriosProcPrev.qryProcTrab3.SQL[8] := '  (O.CODTIPOOBJETO = '+sAux+') AND';
    end;

    if not(bImprimeObj) or ((bImprimeObjSel) and (Trim(sAux) = '')) then
      dtmRelatoriosProcPrev.qryProcTrab3.SQL[8] := '  (1 = 2) AND'; // Não deve ser mostrado

    // Especifico as demais configurações do Relatório
    rpProcTrabLbl1.Caption := edTituloRelat.Text;

    if (rgImprimeOpcao.ItemIndex = 0) then
      rpProcTrab.PrinterSetup.Orientation := poLandscape
    else
      rpProcTrab.PrinterSetup.Orientation := poPortrait;

    if (rgNumProc.ItemIndex = 0) then
    begin
      rpProcTrabGrp1.BreakName   := 'NUMPROCTRAB';
      rpProcTrabDBTxt2.DataField := 'NUMPROCTRAB';
    end
    else
    begin
      rpProcTrabGrp1.BreakName   := 'PROCJCJNUM';
      rpProcTrabDBTxt2.DataField := 'PROCJCJNUM';
    end;

    if (rgImprimeLitis.ItemIndex < 2) then
      rpProcTrabLbl6.Caption := 'Contraparte e Litisconsortes'
    else
      rpProcTrabLbl6.Caption := 'Contraparte';

    rpProcTrabHdrBnd.Visible      := (rgImprimeCabRod.ItemIndex = 0);
    rpProcTrabGrpFootBnd0.Visible := rpProcTrabHdrBnd.Visible;
    rpProcTrabShape1.Visible      := (rgImprimeLitis.ItemIndex < 2) or
      (rgImprimeEtapa.ItemIndex <> 1) or (rgImprimeObj.ItemIndex <> 1);

    rpProcTrabLbl8.Visible  := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabLbl9.Visible  := rpProcTrabLbl8.Visible;
    rpProcTrabLbl10.Visible := not(rpProcTrabLbl8.Visible);
    rpProcTrabLbl13.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabLbl14.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabLbl15.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabLbl16.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabLbl17.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabLbl18.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabLbl19.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabLbl20.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabLbl21.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabLbl23.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabDBCalc2.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabDBCalc3.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabDBCalc4.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabDBCalc5.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabDBCalc6.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabDBTxt6.Visible  := rpProcTrabLbl8.Visible;
    rpProcTrabDBTxt7.Visible  := rpProcTrabLbl8.Visible;
    rpProcTrabDBTxt8.Visible  := not(rpProcTrabLbl8.Visible);
    rpProcTrabDBTxt11.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabDBTxt12.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabDBTxt13.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabDBTxt14.Visible := rpProcTrabLbl8.Visible;
    rpProcTrabDBTxt15.Visible := rpProcTrabLbl8.Visible;

    rpProcTrabDBTxt1.Width := rpProcTrab.PrinterSetup.PaperWidth -
      (rpProcTrab.PrinterSetup.MarginLeft * 2) - (rpProcTrabDBTxt1.Left * 2);
    rpProcTrabLbl1.Width := rpProcTrabDBTxt1.Width;
    if (rgImprimeOpcao.ItemIndex > 0) then
    begin
      rpProcTrabLbl7.Caption := 'Órgão Jurisdicional (Vara)';
      rpProcTrabLbl7.TextAlignment := taLeftJustified;
      rpProcTrabLbl7.Left := 105.881;
      rpProcTrabLbl7.Width := 48.575;
      rpProcTrabDBTxt5.Left := 105.881;
      rpProcTrabDBTxt5.Width := 48.575;
      rpProcTrabDBTxt5.DataField := 'NOMEVARA';
      rpProcTrabLbl2.Left := 140.636;
      rpProcTrabLbl3.Left := 140.636;
      rpProcTrabSysVar1.Left := 168.946;
      rpProcTrabSysVar2.Left := 168.946;
    end
    else
    begin
      rpProcTrabLbl7.Caption := 'Admissão';
      rpProcTrabLbl7.TextAlignment := taRightJustified;
      rpProcTrabLbl7.Left := 90.488;
      rpProcTrabLbl7.Width := 15.61;
      rpProcTrabDBTxt5.Left := 90.488;
      rpProcTrabDBTxt5.Width := 15.61;
      rpProcTrabDBTxt5.DataField := 'DATAADMISSAO';
      rpProcTrabLbl2.Left := 215.636;
      rpProcTrabLbl3.Left := 215.636;
      rpProcTrabSysVar1.Left := 243.946;
      rpProcTrabSysVar2.Left := 243.946;
    end;

    bImprimeCargo := (rgImprimeCargo.ItemIndex = 0);    
    rpProcTrab.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
    rpProcTrabShape1.Width := rpProcTrab.PrinterSetup.PaperWidth -
      (rpProcTrab.PrinterSetup.MarginLeft * 2) - (rpProcTrabShape1.Left * 2);

    // Habilitações no Resumo por UF
    rpProcTrabSubRep4Lbl6.Visible    := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4Lbl7.Visible    := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4Lbl8.Visible    := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4Lbl9.Visible    := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4Lbl10.Visible   := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4Lbl11.Visible   := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4DBTxt4.Visible  := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4DBTxt5.Visible  := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4DBTxt6.Visible  := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4DBTxt7.Visible  := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4DBTxt8.Visible  := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4DBCalc2.Visible := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4DBCalc3.Visible := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4DBCalc4.Visible := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4DBCalc5.Visible := (rgImprimeOpcao.ItemIndex = 0);
    rpProcTrabSubRep4DBCalc6.Visible := (rgImprimeOpcao.ItemIndex = 0);
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamProcTrab.GeraEstadoProc;
var
  k: integer;
  sListaEstado: string;
begin
  k := 0;
  sListaEstado := '';
  while not(qryProcesso.EOF) do
  begin
    if (k = 0) and (Trim(qryProcesso.FieldByName('IDESTADO').asString) <> '') then
    begin
      sListaEstado := qryProcesso.FieldByName('IDESTADO').asString;
      Inc(k);
    end
    else
    if (VerificaCodigoEm (sListaEstado,qryProcesso.FieldByName('IDESTADO').asString,',') = 0) then
      sListaEstado := sListaEstado +','+ qryProcesso.FieldByName('IDESTADO').asString;

    qryProcesso.Next;
  end;

  if (sListaEstado <> '') then
  begin
    dmCds.qry.Close;
    with (dmCds.qry.SQL) do
    begin
      Clear;
      Add('SELECT IDESTADO, RTRIM(CODESTADO) AS UF,');
      Add('       RTRIM(CODESTADO) ||'' - ''|| NOMEESTADO AS NOME');
      Add('FROM   ESTADO');
      Add('WHERE');
      if (sListaEstado <> '')  then
      begin
        if (Pos(',',sListaEstado) > 0) then
          Add('  (IDESTADO IN (' +sListaEstado+ '))')
        else
          Add('  (IDESTADO = ' +sListaEstado+ ')');
      end;
      Add('ORDER BY IDESTADO');
      SaveToFile('c:\qry.txt');
    end;
    dmCds.qry.Open;
    dmCds.qry.Last;
    SetLength(EstadoProc,dmCds.qry.RecordCount);
    dmCds.qry.First;
    k := 0;
    while not(dmCds.qry.EOF) do
    begin
      EstadoProc[k].ID   := dmCds.qry.FieldByName('IDESTADO').asString;
      EstadoProc[k].UF   := dmCds.qry.FieldByName('UF').asString;
      EstadoProc[k].Nome := dmCds.qry.FieldByName('NOME').asString;
      Inc(k);
      dmCds.qry.Next;
    end;
  end
  else
    SetLength(EstadoProc,0);
end;

procedure TfrmParamProcTrab.GeraPatrocProc;
var
  k: integer;
  sListaPatroc: string;
begin
  k := 0;
  sListaPatroc := '';
  while not(qryProcesso.EOF) do
  begin
    if (k = 0) and (Trim(qryProcesso.FieldByName('IDPESSJUR').asString) <> '') then
    begin
      sListaPatroc := qryProcesso.FieldByName('IDPESSJUR').asString;
      Inc(k);
    end
    else
    if (VerificaCodigoEm (sListaPatroc,qryProcesso.FieldByName('IDPESSJUR').asString,',') = 0) then
      sListaPatroc := sListaPatroc +','+ qryProcesso.FieldByName('IDPESSJUR').asString;

    qryProcesso.Next;
  end;

  if (sListaPatroc <> '') then
  begin
    dmCds.qry.Close;
    with (dmCds.qry.SQL) do
    begin
      Clear;
      Add('SELECT IDPESSOA, NOME');
      Add('FROM   PESSOA');
      Add('WHERE');
      if (sListaPatroc <> '')  then
      begin
        if (Pos(',',sListaPatroc) > 0) then
          Add('  (IDPESSOA IN (' +sListaPatroc+ '))')
        else
          Add('  (IDPESSOA = ' +sListaPatroc+ ')');
      end;
      Add('ORDER BY IDPESSOA');
      SaveToFile('c:\qry1.txt');
    end;
    dmCds.qry.Open;
    dmCds.qry.Last;
    SetLength(PatrocProc,dmCds.qry.RecordCount);
    dmCds.qry.First;
    k := 0;
    while not(dmCds.qry.EOF) do
    begin
      PatrocProc[k].ID   := dmCds.qry.FieldByName('IDPESSOA').asString;
      PatrocProc[k].Nome := dmCds.qry.FieldByName('NOME').asString;
      Inc(k);
      dmCds.qry.Next;
    end;
  end
  else
    SetLength(PatrocProc,0);
end;

procedure TfrmParamProcTrab.GeraValoresProcTrab;
var
  rRiscoMax, rRiscoProv, rValReal, rValorReclamado: real;
begin
  with (dtmRelatoriosProcPrev.qryProcTrab) do
  begin
    rRiscoMax  := 0;
    rRiscoProv := 0;
    rValReal   := 0;
    qryObj.First;
    while not(qryObj.EOF) do
    begin
      rValorReclamado := ValorAtual(qryObj.FieldByName('VALORRECL').asFloat,
        qryProcesso.FieldByName('DATANOTIF').asString,
        qryProcesso.FieldByName('MOEDAPROCTRAB').asString,
        qryProcesso.FieldByName('IDREGRA').asString,
        qryProcesso.FieldByName('NUMPROCTRAB').asString,
        qryProcesso.FieldByName('INDTAXACONV').asInteger);
      rRiscoProv := rRiscoProv + rValorReclamado -
        ((100 - qryObj.FieldByName('PERCPROB').asFloat) * rValorReclamado / 100);

      if (dtmRelatoriosProcPrev.bExibeRelatRiscoMax) then
        rRiscoMax := rRiscoMax + rValorReclamado
      else
        rRiscoMax := rRiscoMax + rValorReclamado -
          ((100 - qryObj.FieldByName('PercOrig').asFloat) * rValorReclamado / 100);

      rValReal := rValReal + ValorAtual(qryObj.FieldByName('VALORSENTENCA').asFloat,
        qryProcesso.FieldByName('DATAEFETENC').asString,
        qryProcesso.FieldByName('MOEDAPROCTRAB').asString,
        qryProcesso.FieldByName('IDREGRA').asString,
        qryProcesso.FieldByName('NUMPROCTRAB').asString,
        qryProcesso.FieldByName('INDTAXACONV').asInteger);
      qryObj.Next;
    end;
    qryObj.First;

    FieldByName('RISCOMAXIMO').asFloat   := rRiscoMax;
    FieldByName('RISCOPROVAVEL').asFloat := rRiscoProv;

    if (qryProcesso.FieldByName('FLGSITPROC').asInteger = 1) then
    begin
      FieldByName('VALORREAL').asFloat := rValReal;
      FieldByName('ECONOMIA1').asFloat := rRiscoMax  - rValReal;
      FieldByName('ECONOMIA2').asFloat := rRiscoProv - rValReal;
    end;
  end;
end;

procedure TfrmParamProcTrab.GeraValoresResumoProcTrab;
var
  c: integer;
begin
  with (dtmRelatoriosProcPrev.qryProcTrab4) do
  begin
    if not(Locate('IDESTADO',qryProcesso.FieldByName('IDESTADO').asInteger,[])) then
    begin
      Insert;
      FieldByName('IDESTADO').asInteger := qryProcesso.FieldByName('IDESTADO').asInteger;
      FieldByName('EMPRESA').asString   := dtmRelatoriosProcPrev.qryProcTrab.FieldByName('EMPRESA').asString;

      if (High(EstadoProc)+1 > 0) then
        for c:=0 to High(EstadoProc) do
          if (qryProcesso.FieldByName('IDESTADO').asString = EstadoProc[c].ID) then
          begin
            FieldByName('ESTADO').asString := EstadoProc[c].Nome;
            break;
          end;
    end
    else
      Edit;

    FieldByName('QTDPROC').asInteger     := FieldByName('QTDPROC').asInteger + 1;
    FieldByName('VALRECLAMADO').asFloat  := FieldByName('VALRECLAMADO').asFloat +
      dtmRelatoriosProcPrev.qryProcTrab.FieldByName('RISCOMAXIMO').asFloat;
    FieldByName('VALESTIMADO').asFloat   := FieldByName('VALESTIMADO').asFloat +
      dtmRelatoriosProcPrev.qryProcTrab.FieldByName('RISCOPROVAVEL').asFloat;
    FieldByName('VALREAL').asFloat       := FieldByName('VALREAL').asFloat +
      dtmRelatoriosProcPrev.qryProcTrab.FieldByName('VALORREAL').asFloat;
    FieldByName('ECONRECLAMADO').asFloat := FieldByName('ECONRECLAMADO').asFloat +
      dtmRelatoriosProcPrev.qryProcTrab.FieldByName('ECONOMIA1').asFloat;
    FieldByName('ECONESTIMADO').asFloat  := FieldByName('ECONESTIMADO').asFloat +
      dtmRelatoriosProcPrev.qryProcTrab.FieldByName('ECONOMIA2').asFloat;
  end;
end;

procedure TfrmParamProcTrab.GravaDadosQuery;
var
  c: integer;
begin
  with (dtmRelatoriosProcPrev.qryProcTrab) do
  begin
    if not(qryProcesso.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := qryProcesso.RecordCount;

      qryProcesso.First;
      repeat
        Insert;
        FieldByName('EMPRESA').asString        := Sistema.NomeEmpresa;
        FieldByName('CONTRAPARTE').asString    := qryProcesso.FieldByName('NOME').asString;
        FieldByName('NUMVARAJUSTICA').asString := qryProcesso.FieldByName('NUMVARAJUSTICA').asString;
        FieldByName('DATANOTIF').asString      := qryProcesso.FieldByName('DATANOTIF').asString;
        FieldByName('NUMPROCTRAB').asString    := qryProcesso.FieldByName('NUMPROCTRAB').asString;
        FieldByName('NUMPROC').asString        := qryProcesso.FieldByName('NUMPROCTRAB').asString;
        if (rgNumProc.ItemIndex = 1) then
          FieldByName('PROCJCJNUM').asString     := qryProcesso.FieldByName('PROCJCJNUM').asString
        else
          FieldByName('PROCJCJNUM').asString     := qryProcesso.FieldByName('NUMPROCTRAB').asString;
        FieldByName('DATANOTIF').asString      := qryProcesso.FieldByName('DATANOTIF').asString;
        FieldByName('MOEDAPROCTRAB').asString  := qryProcesso.FieldByName('MOEDAPROCTRAB').asString;
        FieldByName('IDREGRA').asString        := qryProcesso.FieldByName('IDREGRA').asString;
        FieldByName('INDTAXACONV').asString    := qryProcesso.FieldByName('INDTAXACONV').asString;
        FieldByName('DATAEFETENC').asString    := qryProcesso.FieldByName('DATAEFETENC').asString;
        FieldByName('FLGSITPROC').asString     := qryProcesso.FieldByName('FLGSITPROC').asString;

        if (High(PatrocProc)+1 > 0) then
          for c:=0 to High(PatrocProc) do
            if (qryProcesso.FieldByName('IDPESSOA').asString = PatrocProc[c].ID) then
            begin
              FieldByName('PATROCINADORA').asString := PatrocProc[c].Nome;
              break;
            end;

        if (High(EstadoProc)+1 > 0) then
          for c:=0 to High(EstadoProc) do
            if (qryProcesso.FieldByName('IDESTADO').asString = EstadoProc[c].ID) then
            begin
              FieldByName('UF').asString := EstadoProc[c].UF;
              break;
            end;

        if (qryProcesso.Fields.FindField('NOMEVARA') <> nil) then
          FieldByName('NOMEVARA').asString := qryProcesso.FieldByName('NOMEVARA').asString;
        if (qryProcesso.Fields.FindField('DATAADMISSAO') <> nil) then
          FieldByName('DATAADMISSAO').asString := qryProcesso.FieldByName('DATAADMISSAO').asString;
        if (qryProcesso.Fields.FindField('DATADEMISSAO') <> nil) then
          FieldByName('DATADEMISSAO').asString := qryProcesso.FieldByName('DATADEMISSAO').asString;
        if (qryProcesso.Fields.FindField('TITULO') <> nil) then
          FieldByName('CARGO').asString := qryProcesso.FieldByName('TITULO').asString;

        FieldByName('SITUACAO').asString := arrSit[qryProcesso.FieldByName('FLGSITPROC').asInteger];
        
        if (rgImprimeOpcao.ItemIndex = 0) then
          GeraValoresProcTrab;
        if (rgImprimeResumo.ItemIndex = 0) then
          GeraValoresResumoProcTrab;

        Post;
        qryProcesso.Next;
      until (qryProcesso.EOF);

      if (rgImprimeResumo.ItemIndex = 0) then
        dtmRelatoriosProcPrev.qryProcTrab4.Post;
    end
    else
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    end;
  end;
end;

procedure TfrmParamProcTrab.rgImprimeOpcaoClick(Sender: TObject);
begin
  inherited;
  rgExibeRelatRisco.Visible := rgImprimeOpcao.ItemIndex = 1;
end;

end.
