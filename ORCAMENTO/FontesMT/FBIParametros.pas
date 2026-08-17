Unit
  FBIParametros;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

Type
  TfrmBIParametros = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    chkGrupoOrcamen: TCheckBox;
    chkCentroDeCusto: TCheckBox;
    chkMeioComunicacao: TCheckBox;
    chkPatrocinadora: TCheckBox;
    chkEstado: TCheckBox;
    chkCidade: TCheckBox;
    chkTipoUh: TCheckBox;
    chkPlanoPrev: TCheckBox;
    chkUnidNegocio: TCheckBox;
    chkVeiculo: TCheckBox;
    chkTarifa: TCheckBox;
    chkPromotor: TCheckBox;
    chkGrupoDc: TCheckBox;
    chkPacote: TCheckBox;
    Label2: TLabel;
    edDataIni: TCMDateTimePicker;
    Label1: TLabel;
    edDataFim: TCMDateTimePicker;
    chkConsolidado: TCheckBox;
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure bbtnSairClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure chkGrupoDcClick(Sender: TObject);
    Procedure pSelecionarCampo(Sender: TObject);
    Procedure MudancaDimensao(Sender: TObject);
  Private
    { Private declarations }
    iQtdeCampos : Integer;
  Public
    { Public declarations }
    bConfirma : Boolean;
  End;

Var
  frmBIParametros: TfrmBIParametros;

Implementation

Uses
  uMensErro;

{$R *.DFM}
//*************************************************
Procedure TfrmBIParametros.FormCreate(Sender: TObject);
Begin
  Inherited;
  edDataIni.text := DateTimeToStr(Date);
  edDataFim.text := DateTimeToStr(Date);
  iQtdeCampos := 1;
End;
//*************************************************
Procedure TfrmBIParametros.bbtnConfirmarClick(Sender: TObject);
Begin
  inherited;
  If edDataIni.Date > edDataFim.Date Then Begin
    MsgDlg('Data inicial não pode ser menor que a final!!','Erro',mtError,[mbOk],0);
    exit;
  End;
  bConfirma := True;
  Close;
End;
//*************************************************
Procedure TfrmBIParametros.bbtnSairClick(Sender: TObject);
Begin
  bConfirma := False;
  Inherited;
End;
//*************************************************
Procedure TfrmBIParametros.chkGrupoDcClick(Sender: TObject);
Begin
  Inherited;
  MudancaDimensao(Sender as Tobject);
End;
//*************************************************
Procedure TfrmBIParametros.MudancaDimensao(Sender: TObject);
Begin
  If (iQtdeCampos < 6) Then
    pSelecionarCampo(Sender As TCheckBox)
  Else
    If ((Sender As TCheckBox).Font.Color = clBlue) Then Begin
      (Sender As TCheckBox).Checked := false;
      (Sender As TCheckBox).Font.Color := clBlack;
      If ((Sender As TCheckBox).Tag = 0) Then iQtdeCampos := iQtdeCampos - 1;
    End Else
      (Sender As TCheckBox).Checked := False;
End;
//*************************************************
Procedure TfrmBIParametros.pSelecionarCampo(Sender: TObject);
Begin
  If (Sender As TCheckBox).Checked Then Begin
    (Sender As TCheckBox).Font.Color := clBlue;
    If (Sender As TCheckBox).tag = 0 Then iQtdeCampos := iQtdeCampos + 1;
   End Else Begin
     (Sender as TCheckBox).Font.Color := clBlack;
     If (Sender As TCheckBox).tag = 0 Then iQtdeCampos := iQtdeCampos - 1;
   End;
End;
//*************************************************
End.
