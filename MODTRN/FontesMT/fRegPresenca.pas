unit fRegPresenca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, TREdit,
  wwdblook, Db, DBTables, checklst, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker,
  CMDateTimePicker, DBClient, uCMClientDataSet, ComCtrls, uCtrlRegTrein, uCtrlListTerceirosRH,
  uCtrlCurso, Mask, wwdbedit, ColorCheckListBox;

type
  TfrmRegPresenca = class(TfrmSairAjuda)
    dsHstTrn: TwwDataSource;
    CdsCurso: TCMClientDataSet;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    bbtnMarcaPresentes: TBitBtn;
    bbtnMarcaAusentes: TBitBtn;
    tbntbDados: TNotebook;
    sbtnAdicionar: TSpeedButton;
    sbtnRemover: TSpeedButton;
    sbtnImprimirLista: TSpeedButton;
    chklstPessoasAusentes: TColorCheckListBox;
    chklstPessoasPresentes: TColorCheckListBox;
    pnlPessoasAusentes: TPanel;
    spbNome: TSpeedButton;
    spbTipo: TSpeedButton;
    pnlPessoasPresentes: TPanel;
    dbgdHistoricoTreinamento: TwwDBGrid;
    bbtnApanha: TBitBtn;
    CdsInstrutor: TCMClientDataSet;
    CdsEntid: TCMClientDataSet;
    CdsHstTrn: TCMClientDataSet;
    CdsPrincipal: TCMClientDataSet;
    Label4: TLabel;
    dtedRealizacao: TCMDateTimePicker;
    PageControl1: TPageControl;
    tbshDadosBasicos: TTabSheet;
    gbxCurso: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    dblckCurso: TwwDBLookupCombo;
    dblckEntid: TwwDBLookupCombo;
    dblckInstrutor: TwwDBLookupCombo;
    rgControle: TRadioGroup;
    rgAvalCurs: TRadioGroup;
    gbxDatas: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dtedIniPlan: TCMDateTimePicker;
    dtedFimPlan: TCMDateTimePicker;
    dtedIniReal: TCMDateTimePicker;
    dtedFimReal: TCMDateTimePicker;
    gbxCarga: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    redTeoria: TRealEdit;
    redPratica: TRealEdit;
    redTotal: TRealEdit;
    gbxDespesas: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    redValCurso: TRealEdit;
    redValViagem: TRealEdit;
    redValHosp: TRealEdit;
    redValOutras: TRealEdit;
    tbshDadosComplementares: TTabSheet;
    Label2: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    edLocalCurso: TEdit;
    edDataHora: TwwDBEdit;
    edInstrutores: TwwDBEdit;
    cbxSemAula: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure dblckCursoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure bbtnApanhaClick(Sender: TObject);
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure bbtnMarcaAusentesClick(Sender: TObject);
    procedure bbtnMarcaPresentesClick(Sender: TObject);
    procedure sbtnImprimirListaClick(Sender: TObject);
    procedure dblckEntidEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbNomeClick(Sender: TObject);
    procedure dtedRealizacaoChange(Sender: TObject);
  private
    CtrlRegTrein: TCtrlRegTrein;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlCurso: TCtrlCurso;

    OrdemPorNome: boolean;
    sListaCodPessoas, sListaNumSeq: string;
    ListaCodPessoasAusentes, ListaCodPessoasPresentes,
    ListaNumSeqPessoasAusentes, ListaNumSeqPessoasPresentes: TStringList;

    procedure SelPessoas;
    procedure SelPessoasAusentes(Ordem: TOrdemPessoas);
    procedure SelPessoasPresentes;
    procedure LimparDadosTela;
    procedure PreencherDadosTela;
    procedure InformarPresenca;
    procedure RetirarPresenca;
  end;

var
  frmRegPresenca: TfrmRegPresenca;

implementation

uses uCMTypes, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, uSistema, dCds, fAguarde,
  uCtrlUsoGeralRH, fParamListaPresenca, RListaPresenca2;

{$R *.DFM}

procedure TfrmRegPresenca.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRegTrein := TCtrlRegTrein.Create(false, Sistema.UsaRAD, false, false, Sistema.IdEmpresa,
    Sistema.IdUsuario, Sistema.NomeUsuario, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRegTrein.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  ListaCodPessoasAusentes := TStringList.Create;
  ListaCodPessoasPresentes := TStringList.Create;
  ListaNumSeqPessoasAusentes := TStringList.Create;
  ListaNumSeqPessoasPresentes := TStringList.Create;

  CdsCurso.Data := CtrlCurso.ListGeral;
  CdsEntid.Data := CtrlRegTrein.ListEntid;
  CdsInstrutor.Data := CtrlListTerceirosRH.ListPessoaTerceiro('F');
  CdsHstTrn.Data := CtrlRegTrein.ListHistoricoTreinamentoPorCurso(-1);

  tbntbDados.PageIndex := 0;
  OrdemPorNome := true;
end;

procedure TfrmRegPresenca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlRegTrein);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlCurso);
  FreeAndNil(ListaCodPessoasAusentes);
  FreeAndNil(ListaCodPessoasPresentes);
  FreeAndNil(ListaNumSeqPessoasAusentes);
  FreeAndNil(ListaNumSeqPessoasPresentes);
  inherited;
end;

procedure TfrmRegPresenca.dblckCursoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if (modified) then
  begin
    tbntbDados.PageIndex := 0;
    LimparDadosTela;

    if not(CdsCurso.FieldByName('IDENTIDINSTR').IsNull) then
    begin
      CdsEntid.Locate('IDPESSOA', CdsCurso.FieldByName('IDENTIDINSTR').asFloat,[]);
      dblckEntid.LookupValue := CdsEntid.FieldByName('IDPESSOA').asString;
      dblckEntid.Update;
    end;

    CdsHstTrn.Data := CtrlRegTrein.ListHistoricoTreinamentoPorCurso(
      CdsCurso.FieldByName('IDCURSO').asFloat);
    bbtnApanha.Enabled := not(CdsHstTrn.IsEmpty);
  end;
end;

procedure TfrmRegPresenca.dblckEntidEnter(Sender: TObject);
begin
  if (dblckCurso.Text <> '') then
    CdsEntid.Data := CtrlRegTrein.ListEntid(CdsCurso.FieldByName('IDCURSO').asFloat);
end;

procedure TfrmRegPresenca.dtedRealizacaoChange(Sender: TObject);
begin
  try
    StrToDate(dtedRealizacao.Text);

    if ((dtedIniReal.Text <> '') and (dtedRealizacao.Date < dtedIniReal.Date)) or
       ((dtedIniReal.Text =  '') and (dtedRealizacao.Date < dtedIniPlan.Date)) then
    begin
      MsgDlg('Data da Lista de Presença não pode ser anterior à de início do curso.',
             'Aviso', mtInformation, [mbOk,mbHelp], 0);
      if (dtedIniReal.Text <> '') then
        dtedRealizacao.Date := dtedIniReal.Date
      else
        dtedRealizacao.Date := dtedIniPlan.Date;
      dtedRealizacao.SetFocus;
      exit;
    end;

    if (dtedFimReal.Text <> '') and (dtedRealizacao.Date > dtedFimReal.Date) then
    begin
      MsgDlg('Data da Lista de Presença não pode ser posterior à de final do curso.',
             'Aviso', mtInformation, [mbOk,mbHelp], 0);
      dtedRealizacao.Date := dtedFimReal.Date;
      dtedRealizacao.SetFocus;
      exit;
    end;

    if (dtedFimPlan.Text <> '') and (dtedFimReal.Text = '') and
       (dtedRealizacao.Date > dtedFimPlan.Date) then
    begin
      MsgDlg('Data da Lista de Presença não pode ser posterior à de final do curso.',
             'Aviso', mtInformation, [mbOk,mbHelp], 0);
      dtedRealizacao.Date := dtedFimPlan.Date;
      dtedRealizacao.SetFocus;
      exit;
    end;

    SelPessoas;
  except
  end;
end;

procedure TfrmRegPresenca.bbtnApanhaClick(Sender: TObject);
begin
  PreencherDadosTela;
  SelPessoas;
  tbntbDados.PageIndex := 1;
  if (dtedIniReal.Text = '') then
    dtedRealizacao.Date := dtedIniPlan.Date
  else
    dtedRealizacao.Date := dtedIniReal.Date;
end;

procedure TfrmRegPresenca.spbNomeClick(Sender: TObject);
begin
  if (TComponent(Sender).Name = 'spbNome') then
    SelPessoasAusentes(opNome)
  else
    SelPessoasAusentes(opTipoNome);
end;

procedure TfrmRegPresenca.sbtnImprimirListaClick(Sender: TObject);
begin
  if (dtedRealizacao.Text = '') then
  begin
    MsgDlg('Lista de Presença não pode ser emitida sem data de referência.',
             'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  frmParamListaPresenca := TfrmParamListaPresenca.Create(Application);
  with (frmParamListaPresenca) do
  begin
    RptListaPresenca.sCurso := dblckCurso.Text;
    RptListaPresenca.sEntid := dblckEntid.Text;
    RptListaPresenca.sInstrutor := dblckInstrutor.Text;
    RptListaPresenca.sIdCurso := CdsCurso.FieldByName('IDCURSO').asString;
    RptListaPresenca.sIdEntid := CdsEntid.FieldByName('IDPESSOA').asString;
    RptListaPresenca.sIdInstrutor := CdsInstrutor.FieldByName('IDPESSOA').asString;
    RptListaPresenca.sIniPlan := dtedIniPlan.Text;
    RptListaPresenca.sFimPlan := dtedFimPlan.Text;
    RptListaPresenca.sIniReal := dtedIniReal.Text;
    RptListaPresenca.sFimReal := dtedFimReal.Text;
    RptListaPresenca.sDataIni := dtedRealizacao.Text;
    RptListaPresenca.sDataFim := DateToStr(dtedRealizacao.Date+9);
    RptListaPresenca.sLocal   := edLocalCurso.Text;
    RptListaPresenca.sCarga   := redTotal.Text;
    RptListaPresenca.sInstrutores := edInstrutores.Text;
    RptListaPresenca.sDataHora := edDataHora.Text;

    if (dtedFimReal.Text <> '') and ((dtedRealizacao.Date+9) > dtedFimReal.Date) then
      RptListaPresenca.sDataFim := DateToStr(dtedFimReal.Date);

    if (dtedFimPlan.Text <> '') and (dtedFimReal.Text = '') and
       ((dtedRealizacao.Date+9) > dtedFimPlan.Date) then
      RptListaPresenca.sDataFim := DateToStr(dtedFimPlan.Date);


    RptListaPresenca2.sCurso := dblckCurso.Text;
    RptListaPresenca2.sEntid := dblckEntid.Text;
    RptListaPresenca2.sInstrutor := dblckInstrutor.Text;
    RptListaPresenca2.sIdCurso := CdsCurso.FieldByName('IDCURSO').asString;
    RptListaPresenca2.sIdEntid := CdsEntid.FieldByName('IDPESSOA').asString;
    RptListaPresenca2.sIdInstrutor := CdsInstrutor.FieldByName('IDPESSOA').asString;
    RptListaPresenca2.sIniPlan := dtedIniPlan.Text;
    RptListaPresenca2.sFimPlan := dtedFimPlan.Text;
    RptListaPresenca2.sIniReal := dtedIniReal.Text;
    RptListaPresenca2.sFimReal := dtedFimReal.Text;
    RptListaPresenca2.sDataIni := dtedRealizacao.Text;
    RptListaPresenca2.sDataFim := FU.iff(dtedFimReal.Text<>'',dtedFimReal.Text,dtedFimPlan.Text);
    RptListaPresenca2.sLocal   := edLocalCurso.Text;
    RptListaPresenca2.sCarga   := redTotal.Text;
    RptListaPresenca2.sInstrutores := edInstrutores.Text;
    RptListaPresenca2.sDataHora := edDataHora.Text;

    ShowModal;
  end;
  FreeAndNil(frmParamListaPresenca);
end;

procedure TfrmRegPresenca.sbtnAdicionarClick(Sender: TObject);
begin
  if (MsgDlg('Confirma '+FU.IFF(cbxSemAula.Checked,'Sem Aula para Todos ?',
             'a Presença da(s) Pessoa(s) Selecionada(s)?'),
             'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 0) <> mrYes) then
    exit;

  if cbxSemAula.Checked then // Marca todos se for "Sem Aula"
  begin
    if chklstPessoasPresentes.Items.Count > 0 then
    begin
      bbtnMarcaPresentesClick(Self); // Marca Todos os Presentes, se houver
      RetirarPresenca; // Retira todos os presentes
    end;
    bbtnMarcaAusentesClick(Self);
  end;
  
  InformarPresenca;
end;

procedure TfrmRegPresenca.sbtnRemoverClick(Sender: TObject);
begin
  if (MsgDlg('Confirma a Exclusão da(s) Pessoa(s) Selecionada(s) da Lista de Presença?',
             'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes) then
    RetirarPresenca;
end;

procedure TfrmRegPresenca.bbtnMarcaAusentesClick(Sender: TObject);
var
  c: Integer;
begin
  for c:=0 to chklstPessoasAusentes.Items.Count-1 do
    chklstPessoasAusentes.Checked[c] := true;
  chklstPessoasAusentes.Invalidate;
end;

procedure TfrmRegPresenca.bbtnMarcaPresentesClick(Sender: TObject);
var
  c: Integer;
begin
  for c:=0 to chklstPessoasPresentes.Items.Count-1 do
    chklstPessoasPresentes.Checked[c] := true;
  chklstPessoasPresentes.Invalidate;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmRegPresenca.SelPessoas;
begin
  // Pessoas Ausentes
  if (OrdemPorNome) then
    SelPessoasAusentes(opNome)
  else
    SelPessoasAusentes(opTipoNome);

  // Pessoas Presentes
  SelPessoasPresentes;

  {CtrlRegTrein.AtualizarWherePessoas(true, CdsCurso.FieldByName('IDCURSO').asFloat,
    FU.IFF(Trim(dblckInstrutor.Text)<>'', CdsInstrutor.FieldByName('IDPESSOA').asFloat, 0),
    FU.IFF(Trim(dblckEntid.Text)<>'', CdsEntid.FieldByName('IDPESSOA').asFloat, 0),
    dtedIniPlan.Date, dtedFimPlan.Date, dtedIniReal.Date, dtedFimReal.Date);}

  bbtnMarcaPresentes.Enabled := (chklstPessoasPresentes.Items.Count > 0);
  bbtnMarcaAusentes.Enabled := (chklstPessoasAusentes.Items.Count > 0);
end;

procedure TfrmRegPresenca.SelPessoasAusentes(Ordem: TOrdemPessoas);
begin
  dmCds.Cds.Data := CtrlRegTrein.ListPessoasAusentes(
    CdsCurso.FieldByName('IDCURSO').asFloat,
    FU.IFF(Trim(dblckInstrutor.Text)<>'', CdsInstrutor.FieldByName('IDPESSOA').asFloat, 0),
    FU.IFF(Trim(dblckEntid.Text)<>'', CdsEntid.FieldByName('IDPESSOA').asFloat, 0),
    dtedIniPlan.Date, dtedFimPlan.Date, dtedIniReal.Date, dtedFimReal.Date,
    dtedRealizacao.Date, Ordem, edLocalCurso.Text,
    CdsHstTrn.FieldByName('DATAHORA').asString);

  chklstPessoasAusentes.Items.BeginUpdate;
  ListaCodPessoasAusentes.Clear;
  ListaNumSeqPessoasAusentes.Clear;
  chklstPessoasAusentes.Items.Clear;
  chklstPessoasAusentes.Items.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    if (chklstPessoasAusentes.Items.Count = 0) or
       ((chklstPessoasAusentes.Items.Count > 0) and
        (ListaCodPessoasAusentes[chklstPessoasAusentes.Items.Count - 1] <>
         dmCds.Cds.FieldByName('IDPESSOA').asString)) then
    begin
      chklstPessoasAusentes.Items.Add(Copy(dmCds.Cds.FieldByName('NOME').asString +
        FU.Replicate(' ',37),1,32) +' '+ dmCds.Cds.FieldByName('TIPOCONTRATO').asString);
      ListaCodPessoasAusentes.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      ListaNumSeqPessoasAusentes.Add(dmCds.Cds.FieldByName('NUMSEQ').asString);
    end;
    dmCds.Cds.Next;
  end;
  chklstPessoasAusentes.Items.EndUpdate;
  OrdemPorNome := (Ordem = opNome);
end;

procedure TfrmRegPresenca.SelPessoasPresentes;
begin
  dmCds.Cds.Data := CtrlRegTrein.ListPessoasPresentes(
    CdsCurso.FieldByName('IDCURSO').asFloat,
    FU.IFF(Trim(dblckInstrutor.Text)<>'', CdsInstrutor.FieldByName('IDPESSOA').asFloat, 0),
    FU.IFF(Trim(dblckEntid.Text)<>'', CdsEntid.FieldByName('IDPESSOA').asFloat, 0),
    dtedIniPlan.Date, dtedFimPlan.Date, dtedIniReal.Date, dtedFimReal.Date, dtedRealizacao.Date,
    edLocalCurso.Text, CdsHstTrn.FieldByName('DATAHORA').asString);

  chklstPessoasPresentes.Items.BeginUpdate;
  ListaCodPessoasPresentes.Clear;
  ListaNumSeqPessoasPresentes.Clear;
  chklstPessoasPresentes.Items.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    if (chklstPessoasPresentes.Items.Count = 0) or
       ((chklstPessoasPresentes.Items.Count > 0) and
        (ListaCodPessoasPresentes[chklstPessoasPresentes.Items.Count - 1] <>
         dmCds.Cds.FieldByName('IDPESSOA').asString)) then
    begin
      if dmCds.Cds.FieldByName('FLGSEMAULA').asInteger = 0 then
        chklstPessoasPresentes.Font.Color := clBlack
      else
        chklstPessoasPresentes.Font.Color := clRed;

      cbxSemAula.Checked := dmCds.Cds.FieldByName('FLGSEMAULA').asInteger = 1;
      chklstPessoasPresentes.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      ListaCodPessoasPresentes.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      ListaNumSeqPessoasPresentes.Add(dmCds.Cds.FieldByName('NUMSEQ').asString);
    end;
    dmCds.Cds.Next;
  end;
  chklstPessoasPresentes.Items.EndUpdate;
  sbtnImprimirLista.Enabled := not cbxSemAula.Checked;
end;

procedure TfrmRegPresenca.LimparDadosTela;
begin
  dblckEntid.Text := '';
  edLocalCurso.Text := '';
  rgControle.ItemIndex := 0;
  dtedIniPlan.Text := '';
  dtedFimPlan.Text := '';
  dtedIniReal.Text := '';
  dtedFimReal.Text := '';
  redTeoria.Value := 0;
  redPratica.Value := 0;
  redTotal.Value := 0;
  redValCurso.Value := 0;
  redValViagem.Value := 0;
  redValHosp.Value := 0;
  redValOutras.Value := 0;
  bbtnMarcaAusentes.Enabled := false;
  bbtnMarcaPresentes.Enabled := false;
end;

procedure TfrmRegPresenca.PreencherDadosTela;
begin
  LimparDadosTela;
  dblckEntid.Text := CdsHstTrn.FieldByName('NOME').asString;
  CdsEntid.Locate('IDPESSOA', CdsHstTrn.FieldByName('IDENTIDINSTR').asInteger,[]);
  dblckInstrutor.Text := CdsHstTrn.FieldByName('INSTRUTOR').asString;
  CdsInstrutor.Locate('IDPESSOA',CdsHstTrn.FieldByName('IDINSTRUTOR').asInteger,[]);

  edLocalCurso.Text := CdsHstTrn.FieldByName('LOCALCURSO').asString;
  rgAvalCurs.ItemIndex := 1 - CdsHstTrn.FieldByName('FLGAVALCURS').asInteger;
  rgControle.ItemIndex := 1 - CdsHstTrn.FieldByName('FLGCONTROLE').asInteger;

  if not(CdsHstTrn.FieldByName('DATPLINI').IsNull) then
    dtedIniPlan.Date := CdsHstTrn.FieldByName('DATPLINI').asDateTime;

  if not(CdsHstTrn.FieldByName('DATPLFIM').IsNull) then
    dtedFimPlan.Date := CdsHstTrn.FieldByName('DATPLFIM').asDateTime;

  if not(CdsHstTrn.FieldByName('DATREINI').IsNull) then
    dtedIniReal.Date := CdsHstTrn.FieldByName('DATREINI').asDateTime;

  if not(CdsHstTrn.FieldByName('DATREFIM').IsNull) then
    dtedFimReal.Date := CdsHstTrn.FieldByName('DATREFIM').asDateTime;

  redTeoria.Value := CdsCurso.FieldByName('DUR_TEOR').asFloat;
  redPratica.Value := CdsCurso.FieldByName('DUR_PRAT').asFloat;
  redTotal.Value := redTeoria.Value + redPratica.Value;
  redValCurso.Value := CdsCurso.FieldByName('VALOR').asFloat;
end;

procedure TfrmRegPresenca.InformarPresenca;
var
  c: integer;
  bOk: boolean;
begin
  sListaCodPessoas := '';
  sListaNumSeq := '';
  for c:=0 to chklstPessoasAusentes.Items.Count-1 do
  begin
    if (chklstPessoasAusentes.Checked[c]) then
    begin
      if (sListaCodPessoas = '') then
      begin
        sListaCodPessoas := ListaCodPessoasAusentes[c];
        sListaNumSeq := ListaNumSeqPessoasAusentes[c];
      end
      else
      begin
        sListaCodPessoas := sListaCodPessoas +','+ ListaCodPessoasAusentes[c];
        sListaNumSeq := sListaNumSeq +','+ ListaNumSeqPessoasAusentes[c];
      end;
    end;
  end;

  if (sListaCodPessoas = '') then
    exit
  else
  begin
    frmAguarde.Mostra('Informando Presença...');
    bOk := (CtrlRegTrein.InformarPresenca(sListaCodPessoas, sListaNumSeq,
      CdsCurso.FieldByName('IDCURSO').asFloat,
      FU.IFF(cbxSemAula.Checked, 1, 0),
      dtedRealizacao.Date));
    frmAguarde.Apaga;
  end;

  if (bOk) then
  begin
    SelPessoas;
    tbntbDados.PageIndex := 1;
  end
  else
    raise Exception.Create(CtrlRegTrein.MessageInfo);
end;

procedure TfrmRegPresenca.RetirarPresenca;
var
  c: integer;
  bOk: boolean;
begin
  sListaCodPessoas := '';
  sListaNumSeq := '';
  for c:=0 to chklstPessoasPresentes.Items.Count-1 do
  begin
    if (chklstPessoasPresentes.Checked[c]) then
    begin
      if (sListaCodPessoas = '') then
      begin
        sListaCodPessoas := ListaCodPessoasPresentes[c];
        sListaNumSeq := ListaNumSeqPessoasPresentes[c];
      end
      else
      begin
        sListaCodPessoas := sListaCodPessoas +','+ ListaCodPessoasPresentes[c];
        sListaNumSeq := sListaNumSeq +','+ ListaNumSeqPessoasPresentes[c];
      end;
    end;
  end;

  if (sListaCodPessoas = '') then
    exit
  else
  begin
    frmAguarde.Mostra('Retirando Presença...');
    bOk := (CtrlRegTrein.RetirarPresenca(sListaCodPessoas, sListaNumSeq,
      CdsCurso.FieldByName('IDCURSO').asFloat, dtedRealizacao.Date));
    frmAguarde.Apaga;
  end;
    
  if (bOk) then
  begin
    SelPessoas;
    tbntbDados.PageIndex := 1;
  end
  else
    raise Exception.Create(CtrlRegTrein.MessageInfo);
end;

end.
