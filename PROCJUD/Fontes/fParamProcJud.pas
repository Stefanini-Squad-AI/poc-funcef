unit fParamProcJud;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcesso,
  Db, DBTables, Wwquery, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, wwdblook, TEdNum, Spin, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls,
  ComCtrls, Grids, DBGrids;

type
  TfrmParamProcJud = class(TfrmSelProcesso)
    tbshRelatorio: TTabSheet;
    gbxTituloRelat: TGroupBox;
    edTituloRelat: TEdit;
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
    rgNumProc: TRadioGroup;
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

    procedure GeraEstadoProc;
    procedure GeraValoresResumoProcJud;
    procedure GeraValoresProcJud;
    procedure GravaDadosQuery;
  end;

var
  frmParamProcJud: TfrmParamProcJud;

implementation

uses Printers, ppTypes, uSistema, uMensErro, fAguarde, dCds,
  uFuncoesUteisRH, uValorAtual, dRelatoriosProcJud;

const
  arrSit: array[0..1] of string[3] = ('Abr','Enc');
  arrAtiva: array[0..1] of string[7] = ('Passiva','Ativa');  

{$R *.DFM}

procedure TfrmParamProcJud.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
//  bSalvaOpcoes := true;
  inherited;
  cmbTipoPapel.Items.Assign (dtmRelatoriosProcJud.rpProcJud.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;
end;

procedure TfrmParamProcJud.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmCds.qry.Close;
  qryObj.Close;
  inherited;
{  dtmRelatoriosProcJud.qryProcJud1.UnPrepare;
  dtmRelatoriosProcJud.qryProcJud2.UnPrepare;
  dtmRelatoriosProcJud.qryProcJud3.UnPrepare;}
end;

procedure TfrmParamProcJud.rgImprimeEtapaClick(Sender: TObject);
begin
  rgImprimeObservEtapa.Enabled := (rgImprimeEtapa.ItemIndex <> 1);
end;

procedure TfrmParamProcJud.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  sAux: string;  
begin
  inherited;
  qryProcesso.SQL.SaveToFile('c:\Processo.txt');
  GeraEstadoProc;

  // Monta Query Principal
  with (dtmRelatoriosProcJud) do
  begin
    bExibeRelatRiscoMax := (rgExibeRelatRisco.ItemIndex = 0);

    rpProcJudLbl11.Caption        := IFF(bExibeRelatRiscoMax,'Máximo',      'Original');
    rpProcJudSubRep4Lbl7.Caption  := IFF(bExibeRelatRiscoMax,'Risco Máximo','Risco Original');
    rpProcJudSubRep4Lbl10.Caption := IFF(bExibeRelatRiscoMax,'Sobre Máximo','Sobre Original');

    frmAguarde.Mostra ('Relatório de Processos');
    frmAguarde.Pos := 0;

    if not(qryProcJud.IsEmpty) then
      qryProcJud.CancelUpdates;
    qryProcJud.Close;
    qryProcJud.Open;

    // Habilito a impressão do Resumo
    rpProcJudSubRep4.Visible := (rgImprimeResumo.ItemIndex = 0);
    if (rpProcJudSubRep4.Visible) then
    begin
      if not(qryProcJud4.IsEmpty) then
        qryProcJud4.CancelUpdates;
      qryProcJud4.Close;
      qryProcJud4.Open;
      rpProcJudSubRep4.DataPipeline := ppProcJud4;
    end
    else
      rpProcJudSubRep4.DataPipeline := nil;

    // Processa dados para a geração da query
    //if (rgImprimeObj.ItemIndex <> 1) then
      qryObj.Open;

    GravaDadosQuery;
    qryProcJud.First;

    // Habilito a impressão dos Litisconsortes
    bImprimeLitis := (rgImprimeLitis.ItemIndex < 2);
    rpProcJudSubRep1.Visible := bImprimeLitis;
    dsProcJud1.DataSet := qryProcJud1;
    if (bImprimeLitis) then
    begin
      rpProcJudSubRep1Lbl2.Visible   := (rgImprimeLitis.ItemIndex = 0);
      rpProcJudSubRep1DBTxt2.Visible := (rgImprimeLitis.ItemIndex = 0);
      dtmRelatoriosProcJud.qryProcJud1.SQL[7] := '';
    end
    else
      dtmRelatoriosProcJud.qryProcJud1.SQL[7] := '  (1 = 2) AND'; // Não deve ser mostrado

    // Habilito a impressão das Etapas ou Andamentos
    bImprimeEtapa    := (rgImprimeEtapa.ItemIndex <> 1);
    bImprimeEtapaSel := (rgImprimeEtapa.ItemIndex  = 2);
    bImprimeObsEtapa := (rgImprimeEtapa.ItemIndex <> 1) and (rgImprimeObservEtapa.ItemIndex = 0);
    rpProcJudSubRep2.Visible := (bImprimeEtapa);
    if (bImprimeEtapa) then
    begin
      dtmRelatoriosProcJud.qryProcJud2.SQL[9] := '';
      rpProcJudSubRep2.DataPipeline := ppProcJud2;
    end
    else
      rpProcJudSubRep2.DataPipeline := nil;

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
          dtmRelatoriosProcJud.qryProcJud2.SQL[9] := '  (E.CODTIPORECURSO IN ('+sAux+')) AND'
        else
          dtmRelatoriosProcJud.qryProcJud2.SQL[9] := '  (E.CODTIPORECURSO = '+sAux+') AND';
    end;

    if not(bImprimeEtapa) or ((bImprimeEtapaSel) and (Trim(sAux) = '')) then
      dtmRelatoriosProcJud.qryProcJud2.SQL[9] := '  (1 = 2) AND'; // Não deve ser mostrado

    // Habilito a impressão dos Objetos
    bImprimeObj    := (rgImprimeObj.ItemIndex <> 1);
    bImprimeObjSel := (rgImprimeObj.ItemIndex  = 2);
    bImprimeOpcao  := (rgImprimeOpcao.ItemIndex  = 0);
    rpProcJudSubRep3.Visible := (bImprimeObj);
    if (bImprimeObj) then
    begin
      dtmRelatoriosProcJud.qryProcJud3.SQL[8] := '';
      rpProcJudSubRep3.DataPipeline := ppProcJud3;
    end
    else
      rpProcJudSubRep3.DataPipeline := nil;

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
          dtmRelatoriosProcJud.qryProcJud3.SQL[8] := '  (O.CODTIPOOBJETO IN ('+sAux+')) AND'
        else
          dtmRelatoriosProcJud.qryProcJud3.SQL[8] := '  (O.CODTIPOOBJETO = '+sAux+') AND';
    end;

    if not(bImprimeObj) or ((bImprimeObjSel) and (Trim(sAux) = '')) then
      dtmRelatoriosProcJud.qryProcJud3.SQL[8] := '  (1 = 2) AND'; // Não deve ser mostrado

    dtmRelatoriosProcJud.qryProcJud1.UnPrepare;
    dtmRelatoriosProcJud.qryProcJud2.UnPrepare;
    dtmRelatoriosProcJud.qryProcJud3.UnPrepare;
    dtmRelatoriosProcJud.qryProcJud1.Prepare;
    dtmRelatoriosProcJud.qryProcJud2.Prepare;
    dtmRelatoriosProcJud.qryProcJud3.Prepare;

    // Especifico as demais configurações do Relatório
    rpProcJudLbl1.Caption := edTituloRelat.Text;

    if (rgImprimeLitis.ItemIndex < 2) then
      rpProcJudLbl6.Caption := 'Contraparte e Litisconsortes'
    else
      rpProcJudLbl6.Caption := 'Contraparte';

    rpProcJudHdrBnd.Visible      := (rgImprimeCabRod.ItemIndex = 0);
    rpProcJudGrpFootBnd0.Visible := rpProcJudHdrBnd.Visible;
    rpProcJudShape1.Visible      := (rgImprimeLitis.ItemIndex < 2) or
      (rgImprimeEtapa.ItemIndex <> 1) or (rgImprimeObj.ItemIndex <> 1);

    rpProcJudLbl10.Visible := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudLbl12.Visible := rpProcJudLbl10.Visible;
    rpProcJudLbl13.Visible := rpProcJudLbl10.Visible;
    rpProcJudLbl14.Visible := rpProcJudLbl10.Visible;
    rpProcJudLbl15.Visible := rpProcJudLbl10.Visible;
    rpProcJudLbl17.Visible := rpProcJudLbl10.Visible;
    rpProcJudLbl18.Visible := rpProcJudLbl10.Visible;
    rpProcJudLbl20.Visible := rpProcJudLbl10.Visible;
    rpProcJudDBTxtRiscoMax.Visible  := rpProcJudLbl10.Visible;
    rpProcJudDBTxtNomeVara.Visible  := not(rpProcJudLbl10.Visible);
    rpProcJudDBTxt9.Visible         := rpProcJudLbl10.Visible;
    rpProcJudDBTxt10.Visible        := rpProcJudLbl10.Visible;
    rpProcJudDBTxtEconomia1.Visible := rpProcJudLbl10.Visible;
    rpProcJudDBTxtNumVara.Visible   := not(rpProcJudLbl10.Visible);
    rpProcJudDBTxt11.Visible        := rpProcJudLbl10.Visible;
    rpProcJudDBCalc2.Visible := rpProcJudLbl10.Visible;
    rpProcJudDBCalc3.Visible := rpProcJudLbl10.Visible;
    rpProcJudDBCalc4.Visible := rpProcJudLbl10.Visible;
    rpProcJudDBCalc5.Visible := rpProcJudLbl10.Visible;
    rpProcJudDBCalc6.Visible := rpProcJudLbl10.Visible;

    rpProcJudDBTxt1.Width := rpProcJud.PrinterSetup.PaperWidth -
      (rpProcJud.PrinterSetup.MarginLeft * 2) - (rpProcJudDBTxt1.Left * 2);
    rpProcJudLbl1.Width := rpProcJudDBTxt1.Width;
    if (rgImprimeOpcao.ItemIndex > 0) then
    begin
      rpProcJudLbl11.Caption := 'Órgão Jurisdicional (Vara de Justiça)';
      rpProcJudLbl11.TextAlignment := taLeftJustified;
      rpProcJudLbl11.Width := rpProcJudDBTxtNomeVara.Width;
      rpProcJudLbl16.Left  := rpProcJudDBTxtNumVara.Left;
      rpProcJudLbl16.Width := rpProcJudDBTxtNumVara.Width;
      rpProcJudLbl16.Caption := 'Nº';
      rpProcJudLbl16.TextAlignment := taCentered;
    end
    else
    begin
      rpProcJudLbl11.Caption := IFF(bExibeRelatRiscoMax,'Máximo','Original');
      rpProcJudLbl11.TextAlignment := taCentered;
      rpProcJudLbl11.Width := rpProcJudDBTxtRiscoMax.Width;
      rpProcJudLbl16.Left  := 242.623;
      rpProcJudLbl16.Width := 16.404;
      rpProcJudLbl16.Caption := IFF(bExibeRelatRiscoMax,'s/Máximo','s/Original');
      rpProcJudLbl16.TextAlignment := taCentered;
    end;

    rpProcJud.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
    rpProcJudShape1.Width := rpProcJud.PrinterSetup.PaperWidth -
      (rpProcJud.PrinterSetup.MarginLeft * 2) - (rpProcJudShape1.Left * 2);

    // Habilitações no Resumo por UF
    rpProcJudSubRep4Lbl6.Visible    := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4Lbl7.Visible    := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4Lbl8.Visible    := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4Lbl9.Visible    := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4Lbl10.Visible   := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4Lbl11.Visible   := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4DBTxt4.Visible  := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4DBTxt5.Visible  := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4DBTxt6.Visible  := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4DBTxt7.Visible  := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4DBTxt8.Visible  := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4DBCalc2.Visible := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4DBCalc3.Visible := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4DBCalc4.Visible := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4DBCalc5.Visible := (rgImprimeOpcao.ItemIndex = 0);
    rpProcJudSubRep4DBCalc6.Visible := (rgImprimeOpcao.ItemIndex = 0);
  end;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamProcJud.GeraEstadoProc;
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

procedure TfrmParamProcJud.GeraValoresProcJud;
var
  rRiscoMax, rRiscoProv, rValReal, rValorReclamado: real;
begin
  with (dtmRelatoriosProcJud.qryProcJud) do
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

      if (dtmRelatoriosProcJud.bExibeRelatRiscoMax) then
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

procedure TfrmParamProcJud.GeraValoresResumoProcJud;
var
  c: integer;
begin
  with (dtmRelatoriosProcJud.qryProcJud4) do
  begin
    if not(Locate('IDESTADO',qryProcesso.FieldByName('IDESTADO').asInteger,[])) then
    begin
      Insert;
      FieldByName('IDESTADO').asInteger := qryProcesso.FieldByName('IDESTADO').asInteger;
      FieldByName('EMPRESA').asString   := dtmRelatoriosProcJud.qryProcJud.FieldByName('EMPRESA').asString;

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
      dtmRelatoriosProcJud.qryProcJud.FieldByName('RISCOMAXIMO').asFloat;
    FieldByName('VALESTIMADO').asFloat   := FieldByName('VALESTIMADO').asFloat +
      dtmRelatoriosProcJud.qryProcJud.FieldByName('RISCOPROVAVEL').asFloat;
    FieldByName('VALREAL').asFloat       := FieldByName('VALREAL').asFloat +
      dtmRelatoriosProcJud.qryProcJud.FieldByName('VALORREAL').asFloat;
    FieldByName('ECONRECLAMADO').asFloat := FieldByName('ECONRECLAMADO').asFloat +
      dtmRelatoriosProcJud.qryProcJud.FieldByName('ECONOMIA1').asFloat;
    FieldByName('ECONESTIMADO').asFloat  := FieldByName('ECONESTIMADO').asFloat +
      dtmRelatoriosProcJud.qryProcJud.FieldByName('ECONOMIA2').asFloat;
  end;
end;

procedure TfrmParamProcJud.GravaDadosQuery;
var
  c: integer;
begin
  with (dtmRelatoriosProcJud.qryProcJud) do
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
        if (rgNumProc.ItemIndex = 1) then
          FieldByName('ProcJCJNum').asString     := qryProcesso.FieldByName('ProcJCJNum').asString
        else
          FieldByName('ProcJCJNum').asString     := qryProcesso.FieldByName('NumProcTrab').asString;
        FieldByName('NUMPROCTRAB').asString    := qryProcesso.FieldByName('NUMPROCTRAB').asString;
        FieldByName('NUMPROC').asString        := qryProcesso.FieldByName('NUMPROCTRAB').asString;
        FieldByName('MOEDAPROCTRAB').asString  := qryProcesso.FieldByName('MOEDAPROCTRAB').asString;
        FieldByName('IDREGRA').asString        := qryProcesso.FieldByName('IDREGRA').asString;
        FieldByName('INDTAXACONV').asString    := qryProcesso.FieldByName('INDTAXACONV').asString;
        FieldByName('DATAEFETENC').asString    := qryProcesso.FieldByName('DATAEFETENC').asString;
        FieldByName('FLGSITPROC').asString     := qryProcesso.FieldByName('FLGSITPROC').asString;

        if (High(EstadoProc)+1 > 0) then
          for c:=0 to High(EstadoProc) do
            if (qryProcesso.FieldByName('IDESTADO').asString = EstadoProc[c].ID) then
            begin
              FieldByName('UF').asString := EstadoProc[c].UF;
              break;
            end;

        if (qryProcesso.Fields.FindField('NOMEVARA') <> nil) then
          FieldByName('NOMEVARA').asString := qryProcesso.FieldByName('NOMEVARA').asString;

        FieldByName('SITUACAO').asString := arrSit[qryProcesso.FieldByName('FLGSITPROC').asInteger];
        FieldByName('PARTE').asString    := arrAtiva[qryProcesso.FieldByName('FLGPARTEATIVA').asInteger];

        if (rgImprimeOpcao.ItemIndex = 0) then
          GeraValoresProcJud;
        if (rgImprimeResumo.ItemIndex = 0) then
          GeraValoresResumoProcJud;

        Post;
        qryProcesso.Next;
      until (qryProcesso.EOF);

      if (rgImprimeResumo.ItemIndex = 0) then
        dtmRelatoriosProcJud.qryProcJud4.Post;
    end
    else
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    end;
  end;
end;

procedure TfrmParamProcJud.rgImprimeOpcaoClick(Sender: TObject);
begin
  inherited;
  rgExibeRelatRisco.Visible := rgImprimeOpcao.ItemIndex = 0;
end;

end.
