unit fSelEstat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda, TB97,
  TB97Tlbr, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TEdNum, IvDictio, IvMulti, IvEMulti, TREdit;

type
  TfrmSelEstat = class(TfrmSairAjuda)
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
    ednMin1: TRealEdit;
    ednMax1: TRealEdit;
    ednMax2: TRealEdit;
    ednMin2: TRealEdit;
    ednMax3: TRealEdit;
    ednMin3: TRealEdit;
    ednMax4: TRealEdit;
    ednMin4: TRealEdit;
    ednMax5: TRealEdit;
    ednMin5: TRealEdit;
    ednMax6: TRealEdit;
    ednMin6: TRealEdit;
    ednMax7: TRealEdit;
    ednMin7: TRealEdit;
    ednMax8: TRealEdit;
    ednMin8: TRealEdit;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure rgTipoEstatClick(Sender: TObject);
    procedure ednMax1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmSelEstat: TfrmSelEstat;

implementation

uses uSistema, uCtrlFuncoesRH, fEstatCad;

{$R *.DFM}

procedure TfrmSelEstat.FormCreate(Sender: TObject);
begin
  inherited;
  rgTipoEstat.Left := Round((Width - 134) / 2);
  gbxValores.Visible := false;
  bbtnConfirmar.Enabled := true;

  case (Sistema.IdModulo) of
    MODBAS : HelpContext := 690020;
    MODFOL : HelpContext := 210079;
  end;                            
end;

procedure TfrmSelEstat.rgTipoEstatClick(Sender: TObject);
var
  c: byte;
begin
  if (rgTipoEstat.ItemIndex > 2) and (rgTipoEstat.ItemIndex < 7) then
  begin
    for c:=1 to 8 do
    begin
      TRealEdit(frmSelEstat.FindComponent('ednMin'+IntToStr(c))).Value := 0;
      TRealEdit(frmSelEstat.FindComponent('ednMax'+IntToStr(c))).Value := 0;
    end;
    rgTipoEstat.Left := 21;
    gbxValores.Visible := true;
    bbtnConfirmar.Enabled := false;
  end
  else
  begin
    rgTipoEstat.Left := Round((Width - 134) / 2);
    gbxValores.Visible := false;
    bbtnConfirmar.Enabled := true;
  end;
end;

procedure TfrmSelEstat.ednMax1Change(Sender: TObject);
begin
  bbtnConfirmar.Enabled := (ednMax1.Text <> '');
end;

procedure TfrmSelEstat.bbtnConfirmarClick(Sender: TObject);
var
  c: byte;
begin
  with TfrmEstatCad.Create(Application) do
  begin
    TipoEstat := rgTipoEstat.ItemIndex;
    TituloGrafico := Trim(frmSelEstat.rgTipoEstat.Items[TipoEstat]);
    for c:=1 to 8 do
    begin
      ValMinFaixa[c] := TRealEdit(frmSelEstat.FindComponent('ednMin'+IntToStr(c))).Value;
      ValMaxFaixa[c] := TRealEdit(frmSelEstat.FindComponent('ednMax'+IntToStr(c))).Value;
    end;
    ShowModal;
    Free;
  end;
end;

end.
