unit FSelEstat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TEdNum, TB97,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmSelEstat = class(TfrmOkCancelar)
    rgTipoEstat: TRadioGroup;
    gbxValores: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ednMin1: TEditNum;
    ednMax1: TEditNum;
    ednMax2: TEditNum;
    ednMin2: TEditNum;
    ednMax3: TEditNum;
    ednMin3: TEditNum;
    ednMax4: TEditNum;
    ednMin4: TEditNum;
    ednMax5: TEditNum;
    ednMin5: TEditNum;
    ednMax6: TEditNum;
    ednMin6: TEditNum;
    ednMax7: TEditNum;
    ednMin7: TEditNum;
    ednMax8: TEditNum;
    ednMin8: TEditNum;
    procedure rgTipoEstatClick(Sender: TObject);
    procedure ednMax1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelEstat: TfrmSelEstat;

implementation

uses fEstatCad, fTelaAut;

{$R *.DFM}

procedure TfrmSelEstat.rgTipoEstatClick(Sender: TObject);
begin
  inherited;
  if (rgTipoEstat.ItemIndex > 2) and (rgTipoEstat.ItemIndex < 7) then
  begin
    ednMin1.Text := ''; ednMax1.Text := ''; ednMin2.Text := '';
    ednMax2.Text := ''; ednMin3.Text := ''; ednMax3.Text := '';
    ednMin4.Text := ''; ednMax4.Text := ''; ednMin5.Text := '';
    ednMax5.Text := ''; ednMin6.Text := ''; ednMax6.Text := '';
    ednMin7.Text := ''; ednMax7.Text := ''; ednMin8.Text := '';
    ednMax8.Text := ''; rgTipoEstat.Left := 21;
    gbxValores.Visible := True;
    bbtnConfirmar.Enabled := False;
  end
  else
  begin
    rgTipoEstat.Left      := Round((Width - 134) / 2);
    gbxValores.Visible    := false;
    bbtnConfirmar.Enabled := true;
  end;
end;

procedure TfrmSelEstat.ednMax1Change(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := (ednMax1.Text <> '');
end;

procedure TfrmSelEstat.FormCreate(Sender: TObject);
begin
  inherited;
  rgTipoEstat.Left      := Round((Width - 134) / 2);
  gbxValores.Visible    := false;
  bbtnConfirmar.Enabled := true;
end;

procedure TfrmSelEstat.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSelEstat.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmEstatCad, TfrmEstatCad, false);
end;

end.
