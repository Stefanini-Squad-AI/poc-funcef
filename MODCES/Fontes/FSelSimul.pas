unit fSelSimul;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TEdNum, TB97, TB97Tlbr, IvDictio, IvMulti, TREdit,
  IvEMulti, FSairAjuda;

type
  TfrmSelSimul = class(TfrmSairAjuda)
    rgTipoSimul: TRadioGroup;
    rgTipoArre: TRadioGroup;
    gbxUnico: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    gbxValores: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    rednPercUn: TRealEdit;
    rednParcUn: TRealEdit;
    rednPisoUn: TRealEdit;
    rednMax1: TRealEdit;
    rednPer1: TRealEdit;
    rednParc1: TRealEdit;
    rednPiso1: TRealEdit;
    rednMax2: TRealEdit;
    rednPer2: TRealEdit;
    rednParc2: TRealEdit;
    rednPiso2: TRealEdit;
    rednMax3: TRealEdit;
    rednPer3: TRealEdit;
    rednParc3: TRealEdit;
    rednPiso3: TRealEdit;
    rednMax4: TRealEdit;
    rednPer4: TRealEdit;
    rednParc4: TRealEdit;
    rednPiso4: TRealEdit;
    rednMax5: TRealEdit;
    rednPer5: TRealEdit;
    rednParc5: TRealEdit;
    rednPiso5: TRealEdit;
    rednMax6: TRealEdit;
    rednPer6: TRealEdit;
    rednParc6: TRealEdit;
    rednPiso6: TRealEdit;
    rednMax7: TRealEdit;
    rednPer7: TRealEdit;
    rednParc7: TRealEdit;
    rednPiso7: TRealEdit;
    rednMax8: TRealEdit;
    rednPer8: TRealEdit;
    rednParc8: TRealEdit;
    rednPiso8: TRealEdit;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure ednPer1Change(Sender: TObject);
    procedure rgTipoSimulClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rednPercUnChange(Sender: TObject);
    procedure rednMax1Change(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  public
    NumVez: integer;
  end;

var
  frmSelSimul: TfrmSelSimul;

implementation

uses uFuncoesUteis, fTelaAut, uSistema, fSimul;

{$R *.DFM}

procedure TfrmSelSimul.FormCreate(Sender: TObject);
begin
  inherited;
  NumVez := 0;

  case (Sistema.IdModulo) of
    MODCES : HelpContext := 740018;
    MODFOL : HelpContext := 210064;
  end;
end;

procedure TfrmSelSimul.FormShow(Sender: TObject);
begin
  inherited;
  rednPercUn.SetFocus;
end;

procedure TfrmSelSimul.ednPer1Change(Sender: TObject);
begin
  bbtnConfirmar.Enabled := (rednMax1.Text <> '') and (rednPer1.Text <> '');
end;

procedure TfrmSelSimul.rgTipoSimulClick(Sender: TObject);
begin
  gbxValores.Visible := (rgTipoSimul.ItemIndex = 1);
  gbxUnico.Visible   := (rgTipoSimul.ItemIndex = 0);

  case (rgTipoSimul.ItemIndex) of
    0 : rednPercUnChange(Sender);
    1 : rednMax1Change(Sender);
  end;

  if (rgTipoSimul.ItemIndex = 0) then
    rednPercUn.SetFocus
  else
    rednMax1.SetFocus;
end;

procedure TfrmSelSimul.rednPercUnChange(Sender: TObject);
begin
  bbtnConfirmar.Enabled := (StringToFloat(Trim(rednPercUn.Text)) <> 0) or
                           (StringToFloat(Trim(rednParcUn.Text)) <> 0) or
                           (StringToFloat(Trim(rednPisoUn.Text)) <> 0);
end;

procedure TfrmSelSimul.rednMax1Change(Sender: TObject);
begin
  bbtnConfirmar.Enabled :=
    ((StringToFloat(Trim(rednMax1.Text))   <> 0) and
     ((StringToFloat(Trim(rednPer1.Text))  <> 0)  or
      (StringToFloat(Trim(rednParc1.Text)) <> 0)  or
      (StringToFloat(Trim(rednPiso1.Text)) <> 0))) or

    ((StringToFloat(Trim(rednMax2.Text))   <> 0) and
     ((StringToFloat(Trim(rednPer2.Text))  <> 0)  or
      (StringToFloat(Trim(rednParc2.Text)) <> 0)  or
      (StringToFloat(Trim(rednPiso2.Text)) <> 0))) or

    ((StringToFloat(Trim(rednMax3.Text))   <> 0) and
     ((StringToFloat(Trim(rednPer3.Text))  <> 0)  or
      (StringToFloat(Trim(rednParc3.Text)) <> 0)  or
      (StringToFloat(Trim(rednPiso3.Text)) <> 0))) or

    ((StringToFloat(Trim(rednMax4.Text))   <> 0) and
     ((StringToFloat(Trim(rednPer4.Text))  <> 0)  or
      (StringToFloat(Trim(rednParc4.Text)) <> 0)  or
      (StringToFloat(Trim(rednPiso4.Text)) <> 0))) or

    ((StringToFloat(Trim(rednMax5.Text))   <> 0) and
     ((StringToFloat(Trim(rednPer5.Text))  <> 0)  or
      (StringToFloat(Trim(rednParc5.Text)) <> 0)  or
      (StringToFloat(Trim(rednPiso5.Text)) <> 0))) or

    ((StringToFloat(Trim(rednMax6.Text))   <> 0) and
     ((StringToFloat(Trim(rednPer6.Text))  <> 0)  or
      (StringToFloat(Trim(rednParc6.Text)) <> 0)  or
      (StringToFloat(Trim(rednPiso6.Text)) <> 0))) or

    ((StringToFloat(Trim(rednMax7.Text))   <> 0) and
     ((StringToFloat(Trim(rednPer7.Text))  <> 0)  or
      (StringToFloat(Trim(rednParc7.Text)) <> 0)  or
      (StringToFloat(Trim(rednPiso7.Text)) <> 0))) or

    ((StringToFloat(Trim(rednMax8.Text))   <> 0) and
     ((StringToFloat(Trim(rednPer8.Text))  <> 0)  or
      (StringToFloat(Trim(rednParc8.Text)) <> 0)  or
      (StringToFloat(Trim(rednPiso8.Text)) <> 0)));
end;

procedure TfrmSelSimul.bbtnConfirmarClick(Sender: TObject);
begin
  AbrirForm(frmSimul, TfrmSimul, false);
end;

end.
