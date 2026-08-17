unit FOpcRescisao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, FileCtrl, fcLabel, CheckLst,
  Wwdatsrc, TB97Tlwn;

type
  TfrmOpcRescisao = class(TfrmOkCancelar)
    rgProcesso: TRadioGroup;
    rgMotivo: TRadioGroup;
    gbxPeriodo: TGroupBox;
    dtedIni: TCMDateTimePicker;
    dtedFim: TCMDateTimePicker;
    qryMotivo: TwwQuery;
    gbxFolhaResc: TGroupBox;
    dblcMotivo: TwwDBLookupCombo;
    rgNormalCompl: TRadioGroup;
    gbxFolhaRescCompl: TGroupBox;
    dblcMotivoCompl: TwwDBLookupCombo;
    rgMotivoCompl: TRadioGroup;
    rgOpcaoPrevia: TRadioGroup;
    GroupBox4: TGroupBox;
    dblcTipoDoc: TwwDBLookupCombo;
    qryTipoDoc: TwwQuery;
    pnlDiretorio: TPanel;
    fcLabel2: TfcLabel;
    Bevel2: TBevel;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    btnOkDir: TBitBtn;
    btnSairDiretorio: TBitBtn;
    qryPortadorForma: TwwQuery;
    qryTipoDes: TwwQuery;
    pnlCAP: TPanel;
    Label11: TLabel;
    Bevel1: TBevel;
    pnlPortForma: TPanel;
    Label9: TLabel;
    dblkPortadorForma: TwwDBLookupCombo;
    pnlNomeArq: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    bvLblDiretorio: TBevel;
    lblDiretorio: TLabel;
    btnEscolheDir: TBitBtn;
    chkPagEletronico: TCheckBox;
    dtPagamento: TCMDateTimePicker;
    pnlIndiv: TPanel;
    lblIndiv1: TLabel;
    lblIndiv2: TLabel;
    chkCriaIndividual: TCheckBox;
    chkRateioCC: TCheckBox;
    btnOKCap: TBitBtn;
    btnCancelarCAP: TBitBtn;
    chkTipoDes: TCheckListBox;
    bbtnSelTipo: TBitBtn;
    bbtnInvTipo: TBitBtn;
    qryParamRH: TwwQuery;
    rgSelTudo: TRadioGroup;
    rgSelRubricas: TRadioGroup;
    townSelRub: TToolWindow97;
    Bevel3: TBevel;
    btnOkSelRub: TBitBtn;
    btnCancelarSelRub: TBitBtn;
    chklstRubrica: TCheckListBox;
    bbtnSelTudo: TBitBtn;
    bbtnInverte: TBitBtn;
    dsRubrica: TwwDataSource;
    qryRubrica: TwwQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure rgSelTudoClick(Sender: TObject);
    procedure rgMotivoClick(Sender: TObject);
    procedure rgNormalComplClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgProcessoClick(Sender: TObject);
    procedure dblcTipoDocCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure chkPagEletronicoClick(Sender: TObject);
    procedure btnOKCapClick(Sender: TObject);
    procedure btnCancelarCAPClick(Sender: TObject);
    procedure btnEscolheDirClick(Sender: TObject);
    procedure btnOkDirClick(Sender: TObject);
    procedure btnSairDiretorioClick(Sender: TObject);
    procedure bbtnSelTipoClick(Sender: TObject);
    procedure bbtnInvTipoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelTudoClick(Sender: TObject);
    procedure bbtnInverteClick(Sender: TObject);
    procedure btnOkSelRubClick(Sender: TObject);
    procedure rgSelRubricasClick(Sender: TObject);
    procedure btnCancelarSelRubClick(Sender: TObject);
    procedure chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstRubricaClickCheck(Sender: TObject);
  end;

var
  frmOpcRescisao: TfrmOpcRescisao;

implementation

uses fResciContr, uMensErro, uFuncoesUteisRH, uSistema;

{$R *.DFM}

procedure TfrmOpcRescisao.FormCreate(Sender: TObject);
begin
  inherited;
  //Preenche ChkList das Rubricas
  chklstRubrica.Items.Clear;
  with (qryRubrica) do
  begin
    Close;
    ParamByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
    Open;
    while not(EOF) do
    begin
      chklstRubrica.Items.Add(FieldByName('Descricao').asString);
      ListaIdRubrica.Add(FieldByName('IdProvento').asString);
      Next;
    end;
    First;
  end;

end;

procedure TfrmOpcRescisao.FormShow(Sender: TObject);
begin
  inherited;
  if frmResciContr.tblParam.FieldByName('LimAdm').AsInteger < 5 then
     rgOpcaoPrevia.ItemIndex := frmResciContr.tblParam.FieldByName('LimAdm').AsInteger;

  qryMotivo.Open;
  qryTipoDoc.Open;
  qryPortadorForma.Open;
  rgProcesso.ItemIndex    := frmOpcRescisaorgProcesso;
  //rgOpcaoPrevia.ItemIndex := frmOpcRescisaorgOpcaoPrevia;
  rgSelTudo.ItemIndex     := frmOpcRescisaorgSelTudo;
  rgSelRubricas.ItemIndex := frmOpcRescisaorgSelRub;
  dtedIni.Date            := frmOpcRescisaodtedIni;
  dtedFim.Date            := frmOpcRescisaodtedFim;
  gbxPeriodo.Visible      := (rgSelTudo.ItemIndex = 1);
  dtPagamento.Date        := frmOpcRescisaodtPagamento;
  rgProcessoClick(Self);

  rgMotivo.ItemIndex := frmOpcRescisaorgMotivo;
  if not(qryParamRH.Active) then
    qryParamRH.Open;
  dblcMotivo.LookupValue := qryParamRH.FieldByName('IDMOTIVORESCISAO').asString;
  dblcMotivo.Update;
  rgMotivoClick(Self);

  rgNormalCompl.ItemIndex := frmOpcRescisaorgNormalCompl;

  if (frmOpcRescisaoCodMotivo <> 0) and
     (qryMotivo.Locate('IDMOTIVO',frmOpcRescisaoCodMotivo,[])) then
  begin
    dblcMotivo.LookUpValue := qryMotivo.FieldByName('IDMOTIVO').Value;
    dblcMotivo.UpDate;
  end;

  if (frmOpcRescisaoCodMotivoCompl <> 0) and
     (qryMotivo.Locate('IDMOTIVO',frmOpcRescisaoCodMotivoCompl,[])) then
  begin
    dblcMotivoCompl.LookUpValue := qryMotivo.FieldByName('IDMOTIVO').Value;
    dblcMotivoCompl.UpDate;
  end;
end;

procedure TfrmOpcRescisao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Salva Dados do Form Modal
  begin
    frmOpcRescisaorgProcesso     := rgProcesso.ItemIndex;
    frmOpcRescisaorgMotivo       := rgMotivo.ItemIndex;
    frmOpcRescisaorgSelTudo      := rgSelTudo.ItemIndex;
    frmOpcRescisaorgSelRub       := rgSelRubricas.ItemIndex;
    frmOpcRescisaodtedIni        := dtedIni.Date;
    frmOpcRescisaodtedFim        := dtedFim.Date;
    frmOpcRescisaodblcMotivoText := dblcMotivo.Value;
    frmOpcRescisaoCodMotivo      := StrInt(dblcMotivo.LookupValue);
    frmOpcRescisaorgNormalCompl  := rgNormalCompl.ItemIndex;
    frmOpcRescisaodblcMotivoComp := dblcMotivoCompl.Value;
    frmOpcRescisaoCodMotivoCompl := StrInt(dblcMotivoCompl.LookupValue);
    frmOpcRescisaorgOpcaoPrevia  := rgOpcaoPrevia.ItemIndex;
    frmOpcRescisaodblcTipoDocText:= dblcTipoDoc.Text;
    frmOpcRescisaoCodTipoDoc     := StrInt(dblcTipoDoc.LookupValue);
    frmOpcRescisaoPagEletronico  := chkPagEletronico.Checked;
    frmOpcRescisaodtPagamento    := dtPagamento.Date;
    frmOpcRescisaoCodPortForma   := StrInt(dblkPortadorForma.LookupValue);
    frmOpcRescisaolblDiretorio   := lblDiretorio.Caption;
    frmOpcRescisaochkRateioCC    := chkRateioCC.Checked;
    frmOpcRescisaoCriaIndividual := chkCriaIndividual.Checked;
  end;
  inherited;
end;

procedure TfrmOpcRescisao.rgSelTudoClick(Sender: TObject);
begin
  inherited;
  gbxPeriodo.Visible := (rgSelTudo.ItemIndex = 1);
end;

procedure TfrmOpcRescisao.rgMotivoClick(Sender: TObject);
begin
  inherited;
  gbxFolhaResc.Visible := (rgMotivo.ItemIndex = 2);
end;

procedure TfrmOpcRescisao.rgNormalComplClick(Sender: TObject);
begin
  inherited;
  rgMotivoCompl.Visible     := rgNormalCompl.ItemIndex = 1;
  gbxFolhaRescCompl.Visible := rgNormalCompl.ItemIndex = 1;
end;

procedure TfrmOpcRescisao.bbtnConfirmarClick(Sender: TObject);
var
  Ind : Integer;
begin
  ModalResult := mrOK;
  if (rgNormalCompl.ItemIndex = 1) and (dblcMotivoCompl.Text = '') then
  begin
    ModalResult := mrNone;
    MsgDlg('Informe o Tipo de Folha de Rescisão Complementar','Aviso', mtInformation,[mbOk,mbHelp],0);
    exit;
  end;

  if (dblcTipoDoc.Text <> '') then
  begin
     ListaTipoCod.Clear;
     for Ind:=0 to chkTipoDes.Items.Count-1 do
         if (chkTipoDes.Checked[Ind]) then
            ListaTipoCod.Add(ListaTipo[Ind]);
  end;

  // Rubricas selecionadas
  if (rgSelRubricas.ItemIndex = 0) then
    CriaListaOpcoes(chklstRubrica, ListaIdRubrica,
      ListaIdRubricaSel, ',', false)
  else
    ListaIdRubricaSel := '';    



  inherited;

end;

procedure TfrmOpcRescisao.rgProcessoClick(Sender: TObject);
begin
  inherited;
  rgOpcaoPrevia.Visible := (rgProcesso.ItemIndex = 0);
end;

procedure TfrmOpcRescisao.dblcTipoDocCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
var
  I : Integer;
begin
  inherited;
  if (dblcTipoDoc.Text <> '') then
  begin
    if  not qryTipoDes.Active then
    begin
      qryTipoDes.Open;
      ListaTipo.Clear;
      chkTipoDes.Items.Clear;
      I := 0;
      while not(qryTipoDes.EOF) do
      begin
        chkTipoDes.Items.Add(qryTipoDes.FieldByName('DESCRICAO').asString);
        chkTipoDes.Checked[I] := true;
        Inc(I);
        ListaTipo.Add(qryTipoDes.FieldByName('CODTIPRECDES').asString);
        qryTipoDes.Next;
      end;
    end;
    pnlCAP.BringToFront;
    pnlCAP.Top     := 10;
    pnlCAP.Left    := 165;
    pnlCAP.Visible := true;

    if (dtPagamento.Text = '') then
      dtPagamento.Date := Date;
  end;
end;

procedure TfrmOpcRescisao.chkPagEletronicoClick(Sender: TObject);
begin
  inherited;
  lblIndiv1.Enabled         := not(chkPagEletronico.Checked);
  lblIndiv2.Enabled         := not(chkPagEletronico.Checked);
  chkCriaIndividual.Enabled := not(chkPagEletronico.Checked);
  pnlPortForma.Visible      := not(chkPagEletronico.Checked);
  pnlNomeArq.Visible        := not(pnlPortForma.Visible);
  chkCriaIndividual.Checked := not(chkPagEletronico.Checked);
end;

procedure TfrmOpcRescisao.btnOKCapClick(Sender: TObject);
begin
  inherited;
  pnlCAP.Visible := false;
end;

procedure TfrmOpcRescisao.btnCancelarCAPClick(Sender: TObject);
begin
  inherited;
  pnlCAP.Visible   := false;
  dblcTipoDoc.Text := '';
  dblcTipoDoc.SetFocus;
end;

procedure TfrmOpcRescisao.btnEscolheDirClick(Sender: TObject);
begin
  inherited;
  pnlCAP.Visible    := false;
  pnlDiretorio.Left := 165;
  pnlDiretorio.Top  := 10;
  pnlDiretorio.BringToFront;
  pnlDiretorio.Visible := true;
end;

procedure TfrmOpcRescisao.btnOkDirClick(Sender: TObject);
begin
  inherited;
  lblDiretorio.Caption := DirectoryListBox1.Directory;
  pnlDiretorio.Visible := false;
  pnlCAP.Visible       := true;
//  GravaDiretorioCAP;
end;

procedure TfrmOpcRescisao.btnSairDiretorioClick(Sender: TObject);
begin
  inherited;
  pnlDiretorio.Visible := false;
  pnlCAP.Visible       := true;
end;

{
procedure TfrmOpcRescisao.GravaDiretorioCAP;
begin
  Registry.RootKey := HKEY_CURRENT_USER;
  if Registry.OpenKey('Software\CM\Folha de Pagamento\',true) then
    Registry.WriteString('Diretorio CAP', lblDiretorio.Caption);
  Registry.CloseKey;
end;
}

procedure TfrmOpcRescisao.bbtnSelTipoClick(Sender: TObject);
var
  c : Integer;
begin
  inherited;
  for c:=0 to chkTipoDes.Items.Count-1 do
    chkTipoDes.Checked[c] := true;

  chkTipoDes.Repaint;
end;

procedure TfrmOpcRescisao.bbtnInvTipoClick(Sender: TObject);
var
  c : Integer;
begin
  inherited;
  for c:=0 to chkTipoDes.Items.Count-1 do
    chkTipoDes.Checked[c] := not chkTipoDes.Checked[c];

  chkTipoDes.Repaint;
end;

procedure TfrmOpcRescisao.bbtnSelTudoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  chklstRubrica.Repaint;
end;

procedure TfrmOpcRescisao.bbtnInverteClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  chklstRubrica.Repaint;
end;

procedure TfrmOpcRescisao.btnOkSelRubClick(Sender: TObject);
begin
  inherited;
  townSelRub.Visible := false;
  Self.Enabled := true;
end;

procedure TfrmOpcRescisao.rgSelRubricasClick(Sender: TObject);
begin
  inherited;
  if (rgSelRubricas.ItemIndex = 0) then
  begin
    townSelRub.Top := Self.Top + 20;
    townSelRub.Left := Self.Left + 80;
    townSelRub.BringToFront;
    townSelRub.Visible := true;
    Self.Enabled := false;
  end
  else
  begin
    townSelRub.Visible := false;
    Self.Enabled := true;
  end;
end;

procedure TfrmOpcRescisao.btnCancelarSelRubClick(Sender: TObject);
begin
  inherited;
  townSelRub.Visible := false;
  Self.Enabled := true;
end;

procedure TfrmOpcRescisao.chklstRubricaDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;

end;

procedure TfrmOpcRescisao.chklstRubricaClickCheck(Sender: TObject);
begin
  inherited;
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

end.
