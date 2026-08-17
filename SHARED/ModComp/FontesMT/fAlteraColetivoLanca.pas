unit fAlteraColetivoLanca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda, Db,
  DBTables, StdCtrls, IvDictio, IvMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Spin, ExtCtrls,
  checklst, DBClient, uCMClientDataSet, TREdit, ColorCheckListBox,
  uCtrlGlobalRH, uCtrlProvDesc, uCtrlRubricaIndiv, uCtrlFuncoesRH, IvEMulti;

type
  TOnDepoisExecucao = procedure(const ListaIdRubricaSel: string) of object;

  TfrmAlteraColetivoLanca = class(TfrmSairAjuda)
    bbtnExecutar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    CdsRubrica: TCMClientDataSet;
    rgPermanentes: TRadioGroup;
    rgTipo: TRadioGroup;
    gbxValor: TGroupBox;
    redValor: TRealEdit;
    grpMesRef: TGroupBox;
    gbxRubrica: TGroupBox;
    Label2: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    chklstRubrica: TColorCheckListBox;
    bbtnSelTodasRub: TBitBtn;
    bbtnInverteSelRub: TBitBtn;
    cbxMesAno: TCheckBox;
    cmbComparador: TComboBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    gbxArredondar: TGroupBox;
    spedArredondar: TSpinEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure bbtnExecutarClick(Sender: TObject);
    procedure cbxMesAnoClick(Sender: TObject);
    procedure bbtnSelTodasRubClick(Sender: TObject);
    procedure bbtnInverteSelRubClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
  private
    CtrlRubricaIndiv: TCtrlRubricaIndiv;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlProvDesc: TCtrlProvDesc;

    lstCodRubrica: TStringList;
    lstIdRubrica: TStringList;

    sCodRubricasSel: string;
    sListaIdRubricaSel: string;
    FOnDepoisExecucao: TOnDepoisExecucao;

    function VerificaOpcoesOk: boolean;
  public
    property OnDepoisExecucao: TOnDepoisExecucao read FOnDepoisExecucao write FOnDepoisExecucao;
  end;

var
  frmAlteraColetivoLanca: TfrmAlteraColetivoLanca;

implementation

uses uMensErro, uSistema, uCtrlPadroes, fAguarde;

{$R *.DFM}

procedure TfrmAlteraColetivoLanca.FormCreate(Sender: TObject);
var
  wDia, wMes, wAno: word;
begin
  inherited;
  lstCodRubrica := TStringList.Create;
  lstIdRubrica := TStringList.Create;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlRubricaIndiv := TCtrlRubricaIndiv.Create('','','');
  CtrlRubricaIndiv.InitializeAs(Padroes);

  // Montar lista das Rubricas
  CdsRubrica.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  chklstRubrica.Items.Clear;
  while not(CdsRubrica.EOF) do
  begin
    lstCodRubrica.Add(CdsRubrica.FieldByName('CODPROVDESC').asString);
    lstIdRubrica.Add(CdsRubrica.FieldByName('IDRUBRICA').asString);
    chklstRubrica.Items.Add(CdsRubrica.FieldByName('DESCRPROVDESC').asString);
    CdsRubrica.Next;
  end;

  DecodeDate(CtrlGlobalRH.GetNormalIni, wAno, wMes, wDia);
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value := wAno;
  cmbComparador.ItemIndex := 0;

  rgTipoClick(nil);
end;

procedure TfrmAlteraColetivoLanca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlRubricaIndiv);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(lstIdRubrica);
  FreeAndNil(lstCodRubrica);
  inherited;
end;

procedure TfrmAlteraColetivoLanca.chklstRubricaClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(chklstRubrica, lstCodRubrica, sCodRubricasSel, ',', false);
  edCodRubricas.Text := sCodRubricasSel;
end;

procedure TfrmAlteraColetivoLanca.rgTipoClick(Sender: TObject);
begin
  if (rgTipo.ItemIndex = 0) then
    gbxValor.Caption := 'Percentual'
  else
    gbxValor.Caption := 'Valor';

  gbxArredondar.Visible := (rgTipo.ItemIndex = 0);
end;

procedure TfrmAlteraColetivoLanca.cbxMesAnoClick(Sender: TObject);
begin
  cmbMes.Visible := not(cbxMesAno.Checked);
  spnedAno.Visible := not(cbxMesAno.Checked);
  cmbComparador.Visible := not(cbxMesAno.Checked);
end;

procedure TfrmAlteraColetivoLanca.bbtnSelTodasRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;

  FU.CriaListaOpcoes(chklstRubrica, lstCodRubrica, sCodRubricasSel, ',', false);
  edCodRubricas.Text := sCodRubricasSel;
  chklstRubrica.Repaint;
end;

procedure TfrmAlteraColetivoLanca.bbtnInverteSelRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);

  FU.CriaListaOpcoes(chklstRubrica, lstCodRubrica, sCodRubricasSel, ',', false);
  edCodRubricas.Text := sCodRubricasSel;
  chklstRubrica.Repaint;
end;

procedure TfrmAlteraColetivoLanca.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubrica, lstCodRubrica, edCodRubricas.Text, ',');
  chklstRubrica.Repaint;
end;

procedure TfrmAlteraColetivoLanca.bbtnExecutarClick(Sender: TObject);
const
  bOk: boolean = false;
begin
  if not(VerificaOpcoesOk) then
    exit;

  if (MsgDlg('Confirma a Alteração dos Lançamentos?',
      'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
  begin
    frmAguarde.Mostra('Alterando Lançamentos...');
    bOk := CtrlRubricaIndiv.AlteracaoColetivaLancamentos(
      Trim(spnedAno.Text) +'/'+ FU.PoeZero(cmbMes.ItemIndex+1), sListaIdRubricaSel,
      cbxMesAno.Checked, cmbComparador.Text, rgPermanentes.ItemIndex,
      Sistema.IdEmpresa, rgTipo.ItemIndex=1, redValor.Value, spedArredondar.Value);

    frmAguarde.Apaga;
    if (bOk) then
      MsgDlg('Alteração de Lançamentos Executada com Sucesso.',
        'Aviso', mtInformation, [mbOk,mbHelp], 0)
    else
      MsgDlg('Não Foi Possível Alterar os Lançamentos.' +CR_LF+
        'Processo Abortado.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
  end;

  if (bOk) and Assigned(FOnDepoisExecucao) then
    FOnDepoisExecucao(sListaIdRubricaSel);
end;

function TfrmAlteraColetivoLanca.VerificaOpcoesOk: boolean;
begin
  Result := false;
  if (redValor.Value = 0) then
  begin
    MsgDlg(
      FU.IFF(rgTipo.ItemIndex=0,
        'Falta informar o Percentual a alterar',
        'Falta informar o Valor a alterar'),
      'Aviso', mtInformation, [mbOk,mbHelp], 0);
    redValor.SetFocus;
    exit;
  end;

  FU.CriaListaOpcoes(chklstRubrica, lstIdRubrica, sListaIdRubricaSel, ',', false);
  if (sListaIdRubricaSel = '') then
  begin
    MsgDlg('Falta informar a(s) Rubrica(s) a alterar',
      'Aviso', mtInformation, [mbOk,mbHelp], 0);
    chklstRubrica.SetFocus;
    exit;
  end;

  if not(cbxMesAno.Checked) and (Trim(spnedAno.Text) = '') then
  begin
    MsgDlg('Falta informar o Ano',
      'Aviso', mtInformation, [mbOk,mbHelp], 0);
    spnedAno.SetFocus;
    exit;
  end;

  Result := true;
end;

end.
