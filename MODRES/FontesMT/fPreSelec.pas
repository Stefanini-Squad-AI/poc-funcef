unit fPreSelec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, DBTables, Wwdatsrc, TEdNum, wwdblook, TB97,
  IvDictio, IvMulti, IvEMulti, TB97Tlbr, TB97Ctls, MontaSelect, DBClient, uCMClientDataSet,
  uCtrlCurso, uCtrlExper, uCtrlTipAval, uCtrlGrupFunc;

type
  TfrmPreSelec = class(TfrmSairAjuda)
    MontaSelectReq: TMontaSelect;
    CdsCurso: TCMClientDataSet;
    CdsExper: TCMClientDataSet;
    CdsTipAval: TCMClientDataSet;
    CdsGrupoFunc: TCMClientDataSet;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    rgSelTudo: TRadioGroup;
    cmbTrein: TComboBox;
    rgSelTud2: TRadioGroup;
    cmbExper: TComboBox;
    rgAprovacao: TRadioGroup;
    gbxCurso: TGroupBox;
    dblckCurso: TwwDBLookupCombo;
    lstbxCurso: TListBox;
    gbxNotas: TGroupBox;
    lblTeor: TLabel;
    lblPrat: TLabel;
    ednTeor: TEditNum;
    ednPrat: TEditNum;
    lstbxTeorica: TListBox;
    lstbxPratica: TListBox;
    lstbxSinalTrein: TListBox;
    gbxExper: TGroupBox;
    Label3: TLabel;
    dblckExper: TwwDBLookupCombo;
    lstbxExper: TListBox;
    ednMesesMin: TEditNum;
    lstbxMesesMin: TListBox;
    lstbxSinalExper: TListBox;
    rgSelTud3: TRadioGroup;
    cmbAval: TComboBox;
    gbxAval: TGroupBox;
    Label4: TLabel;
    Label1: TLabel;
    dblckTipAval: TwwDBLookupCombo;
    lstbxAval: TListBox;
    lstbxAvalMin: TListBox;
    ednAvalMin: TEditNum;
    lstbxSinalAval: TListBox;
    rgSimula: TRadioGroup;
    gbxSimula: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dblckGrupo: TwwDBLookupCombo;
    ednDesempMin: TEditNum;
    cmbDesemp: TComboBox;
    gbxRequi: TGroupBox;
    sbtnProcurarRequis: TToolbarButton97;
    rgRequi: TRadioGroup;
    gbxNumReq: TGroupBox;
    edNumReq: TEdit;
    rgCandAssoc: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure dblckCursoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstbxCursoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dblckExperCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblckTipAvalCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstbxExperKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lstbxAvalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgSelTudoClick(Sender: TObject);
    procedure rgSelTud2Click(Sender: TObject);
    procedure rgSelTud3Click(Sender: TObject);
    procedure rgAprovacaoClick(Sender: TObject);
    procedure rgSimulaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgRequiClick(Sender: TObject);
    procedure sbtnProcurarRequisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlCurso: TCtrlCurso;
    CtrlExper: TCtrlExper;
    CtrlTipAval: TCtrlTipAval;
    CtrlGrupFunc: TCtrlGrupFunc;

    ListaIdCursoSel, ListIdExperSel, ListaIdTipAvalSel: TStringList;

    SvItem: integer;
  end;

var
  frmPreSelec: TfrmPreSelec;

implementation

uses uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fSelPess;

{$R *.DFM}

procedure TfrmPreSelec.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  CtrlExper := TCtrlExper.Create;
  CtrlExper.InitializeAs(Padroes);

  CtrlTipAval := TCtrlTipAval.Create;
  CtrlTipAval.InitializeAs(Padroes);

  CtrlGrupFunc := TCtrlGrupFunc.Create;
  CtrlGrupFunc.InitializeAs(Padroes);

  ListaIdCursoSel := TStringList.Create;
  ListIdExperSel := TStringList.Create;
  ListaIdTipAvalSel := TStringList.Create;

  CdsCurso.Data := CtrlCurso.ListGeral;
  CdsExper.Data := CtrlExper.ListTabExper;
  CdsTipAval.Data := CtrlTipAval.ListTipoAval;
  CdsGrupoFunc.Data := CtrlGrupFunc.ListGrupoFunc;

  cmbTrein.ItemIndex := 2;
  cmbExper.ItemIndex := 2;
  cmbAval.ItemIndex := 2;
  cmbDesemp.ItemIndex := 2;
end;

procedure TfrmPreSelec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaIdCursoSel);
  FreeAndNil(ListIdExperSel);
  FreeAndNil(ListaIdTipAvalSel);
  FreeAndNil(CtrlCurso);
  FreeAndNil(CtrlExper);
  FreeAndNil(CtrlTipAval);
  FreeAndNil(CtrlGrupFunc);
  inherited;
end;

procedure TfrmPreSelec.dblckCursoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (modified) then
  begin
    ListaIdCursoSel.Add(CdsCurso.FieldByName('IDCURSO').asString);
    lstbxCurso.Items.Add(CdsCurso.FieldByName('DESCRICAO').asString);
    lstbxTeorica.Items.Add(ednTeor.Text);
    lstbxPratica.Items.Add(ednPrat.Text);
    lstbxSinalTrein.Items.Add(cmbTrein.Text);
  end;
end;

procedure TfrmPreSelec.dblckExperCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (modified) then
  begin
    ListIdExperSel.Add(CdsExper.FieldByName('IDEXPER').asString);
    lstbxExper.Items.Add(CdsExper.FieldByName('DESCRICAO').asString);
    lstbxMesesMin.Items.Add(ednMesesMin.Text);
    lstbxSinalExper.Items.Add(cmbExper.Text);
  end;
end;

procedure TfrmPreSelec.dblckTipAvalCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (modified) then
  begin
    ListaIdTipAvalSel.Add(CdsTipAval.FieldByName('CODTIPOAVAL').AsString);
    lstbxAval.Items.Add(CdsTipAval.FieldByName('DESCRTIPOAVAL').Value);
    lstbxAvalMin.Items.Add(ednAvalMin.Text);
    lstbxSinalAval.Items.Add(cmbAval.Text);
  end;
end;

procedure TfrmPreSelec.lstbxCursoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (lstbxCurso.Items.Count > 0) then
  begin
    SvItem := lstbxCurso.ItemIndex;
    ListaIdCursoSel.Delete(SvItem);
    lstbxCurso.Items.Delete(SvItem);
    lstbxTeorica.Items.Delete(SvItem);
    lstbxPratica.Items.Delete(SvItem);
    lstbxSinalTrein.Items.Delete(SvItem);
  end;
end;

procedure TfrmPreSelec.lstbxExperKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (lstbxExper.Items.Count > 0) then
  begin
    SvItem := lstbxExper.ItemIndex;
    ListIdExperSel.Delete(SvItem);
    lstbxExper.Items.Delete(SvItem);
    lstbxMesesMin.Items.Delete(SvItem);
    lstbxSinalExper.Items.Delete(SvItem);
  end;
end;

procedure TfrmPreSelec.lstbxAvalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (lstbxAval.Items.Count > 0)  then
  begin
    SvItem := lstbxAval.ItemIndex;
    ListaIdTipAvalSel.Delete(SvItem);
    lstbxAval.Items.Delete(SvItem);
    lstbxAvalMin.Items.Delete(SvItem);
    lstbxSinalAval.Items.Delete(SvItem);
  end;
end;

procedure TfrmPreSelec.rgSelTudoClick(Sender: TObject);
begin
  gbxCurso.Visible := (rgSelTudo.ItemIndex = 2);
  rgAprovacao.Visible := (rgSelTudo.ItemIndex <> 1);
  gbxNotas.Visible := (rgSelTudo.ItemIndex <> 1) and (rgAprovacao.ItemIndex = 1);
  lstbxTeorica.Visible := (rgSelTudo.ItemIndex = 2);
  lstbxPratica.Visible := (rgSelTudo.ItemIndex = 2);
  lstbxSinalTrein.Visible := (rgSelTudo.ItemIndex = 2);
  cmbTrein.Visible := (rgSelTudo.ItemIndex <> 1);
end;

procedure TfrmPreSelec.rgSelTud2Click(Sender: TObject);
begin
  gbxExper.Visible := (rgSelTud2.ItemIndex = 4);
  cmbExper.Visible := (rgSelTud2.ItemIndex <> 3);
end;

procedure TfrmPreSelec.rgSelTud3Click(Sender: TObject);
begin
  gbxAval.Visible := (rgSelTud3.ItemIndex = 2);
  cmbAval.Visible := (rgSelTud3.ItemIndex <> 1);
end;

procedure TfrmPreSelec.rgAprovacaoClick(Sender: TObject);
begin
  gbxNotas.Visible := (rgAprovacao.ItemIndex = 1);
end;

procedure TfrmPreSelec.rgSimulaClick(Sender: TObject);
begin
  gbxSimula.Visible := (rgSimula.ItemIndex = 0);
end;

procedure TfrmPreSelec.rgRequiClick(Sender: TObject);
begin
  sbtnProcurarRequis.Visible := (rgRequi.ItemIndex = 0);
  gbxNumReq.Visible := (rgRequi.ItemIndex = 0);
  rgCandAssoc.Visible := (rgRequi.ItemIndex = 0);
end;

procedure TfrmPreSelec.sbtnProcurarRequisClick(Sender: TObject);
begin
  MontaSelectReq.Executar;
  if (MontaSelectReq.RetornouValor) then
    if (MontaSelectReq.ValoresChave[6] = 'A') or
       (MsgDlg('Requisição Encerrada ou Cancelada.'+CR_LF+ 'Deseja prosseguir?',
               'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then
      edNumReq.Text := MontaSelectReq.ValoresChave[0]
    else
      edNumReq.Text := '';
  sbtnProcurarRequis.Down := false;
end;

procedure TfrmPreSelec.bbtnConfirmarClick(Sender: TObject);
begin
  if (rgRequi.ItemIndex = 0) and (edNumReq.Text = '') then
    MsgDlg('Informe a Requisição Vinculada a esta Seleção.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0)
  else
  begin
    with TfrmSelPess.Create(Application) do
    begin
      NumReq := FU.StrFloat(edNumReq.Text);
      AvalTeorica := FU.StrInt(ednTeor.Text);
      AvalPratica := FU.StrInt(ednPrat.Text);
      SelReqPessoal := (rgRequi.ItemIndex = 0);
      CandAssociados := (rgCandAssoc.ItemIndex = 0);
      TipoSelTreinRequerido := rgSelTudo.ItemIndex;
      SinalTipoSelTreinRequerido := cmbTrein.Text;
      AprovacaoPadrao := (rgAprovacao.ItemIndex = 0);
      TipoSelExperiencia := rgSelTud2.ItemIndex;
      SinalTipoExperiencia := cmbTrein.Text;

      ListaIdCurso.Text := ListaIdCursoSel.Text;
      ListaSinalTrein.Text := lstbxSinalTrein.Items.Text;
      ListaNotaTeorica.Text := lstbxTeorica.Items.Text;
      ListaNotaPratica.Text := lstbxPratica.Items.Text;

      ListIdExper.Text := ListIdExperSel.Text;
      ListaSinalExper.Text := lstbxSinalExper.Items.Text;
      ListaMesesMinExper.Text := lstbxMesesMin.Items.Text;

      TipoSelTipoAvaliacoes := rgSelTud3.ItemIndex;
      SinalTipoAvaliacoes := cmbAval.Text;

      ListaIdTipAval.Text := ListaIdTipAvalSel.Text;
      ListaSinalAval.Text := lstbxSinalAval.Items.Text;
      ListaIMinAval.Text := lstbxAvalMin.Items.Text;

      if (Trim(dblckGrupo.Text) <> '') then
        CodGrupo := ' '
      else
        CodGrupo := CdsGrupoFunc.FieldByName('CODGRPFUNC').asString;

      SimulaDesempenho := (rgSimula.ItemIndex = 0);
      SinalDesempenho := cmbDesemp.Text;
      DesempenhoMin := ednDesempMin.Text;

      ShowModal;
      Free;
    end;
  end;
end;

end.
