unit fLancaOrcam;

interface
                                                
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda, 
  MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Mask, wwdbedit, Db, DBTables, TREdit, wwdblook,
  Spin, TB97Tlbr, IvDictio, IvMulti, CMProcura, MontaSelect, uCtrlLancaOrcam,
  IvEMulti;

type
  TfrmLancaOrcam = class(TfrmSairAjuda)
    MontaSelect1: TMontaSelect;
    MontaSelect2: TMontaSelect;
    MontaSelect3: TMontaSelect;
    MontaSelect4: TMontaSelect;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lblBenef: TLabel;
    edContaOrcam1: TEdit;
    spbtContaOrcam1: TSpeedButton;
    edContaOrcam2: TEdit;
    spbtContaOrcam2: TSpeedButton;
    edContaOrcam3: TEdit;
    spbtContaOrcam3: TSpeedButton;
    edContaOrcam4: TEdit;
    spbtContaOrcam4: TSpeedButton;
    cbxIntegraRH: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure spbtContaOrcam1Click(Sender: TObject);
    procedure cbxIntegraRHClick(Sender: TObject);
  private
    procedure DoProgresso;
  public
    CtrlLancaOrcam: TCtrlLancaOrcam;

    NumMeses: integer;
    IdPlanoOrcamentario: double;
    SelecionaBeneficios: boolean;
    NumContaOrcamento: array [1..4] of string;
    sEstab, sCargo, sCentroCusto: string;

    procedure IdPlanoMontaSelect;
  end;

var
  frmLancaOrcam: TfrmLancaOrcam;

implementation

uses uSistema, uMensErro, uCtrlFuncoesRH, uCtrlPadroes, fAguarde;

{$R *.DFM}

procedure TfrmLancaOrcam.FormCreate(Sender: TObject);
var
  wDia, wMes, wAno: word;
begin
  inherited;
  CtrlLancaOrcam := TCtrlLancaOrcam.Create;
  CtrlLancaOrcam.InitializeAs(Padroes);

  MontaSelect1.Filtro.Clear;
  MontaSelect2.Filtro.Clear;
  MontaSelect3.Filtro.Clear;
  MontaSelect4.Filtro.Clear;

  DecodeDate(Date, wAno, wMes, wDia);
  if (wMes+NumMeses-1 > 12) then
  begin
    wMes := 1;
    Inc(wAno);
  end;

  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value := wAno;
end;

procedure TfrmLancaOrcam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlLancaOrcam);
  inherited;
end;

procedure TfrmLancaOrcam.FormShow(Sender: TObject);
begin
  inherited;
  lblBenef.Visible := SelecionaBeneficios;
  edContaOrcam4.Visible := SelecionaBeneficios;
  spbtContaOrcam4.Visible := SelecionaBeneficios;
end;

procedure TfrmLancaOrcam.spbtContaOrcam1Click(Sender: TObject);
var
  iNumCampo: integer;
  _MS: TMontaSelect;
  _Ed: TEdit;
begin
  iNumCampo := TSpeedButton(Sender).Tag;
  _MS := TMontaSelect(Self.FindComponent('MontaSelect'+ IntToStr(iNumCampo)));
  _Ed := TEdit(Self.FindComponent('edContaOrcam'+ IntToStr(iNumCampo)));

  _MS.Executar;
  if (_MS.RetornouValor) then
  begin
    _Ed.Text := _MS.ValoresChave[1];
    NumContaOrcamento[iNumCampo] := _MS.ValoresChave[0];
  end;
end;

procedure TfrmLancaOrcam.bbtnConfirmarClick(Sender: TObject);
var
  bOk: boolean;
  sNumero, sSalario, sEncargo, sBenef: string;
begin
  if cbxIntegraRH.Checked then
  begin
    if pos(',', sEstab) > 0 then
    begin
      MsgDlg('Estabelecimento deve ser um só ou todos', 'Aviso',
        mtWarning, [mbOk, mbHelp], 0);
      exit;
    end;
    if pos(',', sCargo) > 0 then
    begin
      MsgDlg('Cargo deve ser um só ou todos', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
      exit;
    end;
    if sCentroCusto = '**********' then
      sCentroCusto := '';
    if pos('*', sCentroCusto) > 0 then
    begin
      MsgDlg('Centro de Custo deve ser um só ou todos', 'Aviso',
        mtWarning, [mbOk, mbHelp], 0);
      exit;
    end;
  end;

  frmAguarde.Pos := 0;
  frmAguarde.Min := 0;
  frmAguarde.Max := NumMeses;
  frmAguarde.Mostra('Implementando Integração com o Orçamento...');
  frmAguarde.Update;

  if (Trim(edContaOrcam1.Text) <> '') and (not cbxIntegraRH.Checked) then
    sNumero := NumContaOrcamento[1]
  else
    sNumero := '';

  if (Trim(edContaOrcam2.Text) <> '') then
    sSalario := NumContaOrcamento[2]
  else
    sSalario := '';

  if (Trim(edContaOrcam3.Text) <> '') then
    sEncargo := NumContaOrcamento[3]
  else
    sEncargo := '';

  if (SelecionaBeneficios) and (Trim(edContaOrcam4.Text) <> '') then
    sBenef := NumContaOrcamento[4]
  else
    sBenef := '';

  CtrlLancaOrcam.CreateThreadProgresso;
  bOk := CtrlLancaOrcam.LancarOrcamento(cmbMes.ItemIndex + 1, spnedAno.Value,
    Sistema.IdEmpresa, IdPlanoOrcamentario, sNumero, sSalario, sEncargo, sBenef, NumMeses,
    sEstab, sCargo, sCentroCusto, cbxIntegraRH.Checked);
  CtrlLancaOrcam.FreeThreadProgresso;
  frmAguarde.Apaga;

  if (bOk) then
    MsgDlg(CtrlLancaOrcam.MessageInfo, 'Aviso', mtWarning, [mbOk, mbHelp], 0)
  else
    raise Exception.Create(CtrlLancaOrcam.MessageInfo);
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmLancaOrcam.DoProgresso;
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TfrmLancaOrcam.IdPlanoMontaSelect;
begin
  MontaSelect1.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' +FloatToStr(IdPlanoOrcamentario));
  MontaSelect2.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' +FloatToStr(IdPlanoOrcamentario));
  MontaSelect3.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' +FloatToStr(IdPlanoOrcamentario));
  MontaSelect4.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' +FloatToStr(IdPlanoOrcamentario));
end;

procedure TfrmLancaOrcam.cbxIntegraRHClick(Sender: TObject);
begin
  inherited;
  edContaOrcam1.Visible := not cbxIntegraRH.Checked;
  spbtContaOrcam1.Visible := not cbxIntegraRH.Checked;
end;

end.
