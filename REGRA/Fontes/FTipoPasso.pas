unit FTipoPasso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TB97, uglobal,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmTipoPasso = class(TfrmOkCancelar)
    lblRegra: TLabel;
    rgrpTipoPasso: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iTipoPasso : integer; { 0 - atribuir valor a variavel
                            1 - atribuir valor a Campo do BD
                            2 - comparar valores }

  end;

var
  frmTipoPasso: TfrmTipoPasso;


implementation


uses
    usistema, {fregra, }fCadRegra;


{$R *.DFM}

procedure TfrmTipoPasso.FormShow(Sender: TObject);
begin
  inherited;

  Case vTipoPasso of
       1 : rgrpTipoPasso.ItemIndex := 0;
       2 : rgrpTipoPasso.ItemIndex := 1;
      11 : rgrpTipoPasso.ItemIndex := 5;
       3 : rgrpTipoPasso.ItemIndex := 2;
       9 : rgrpTipoPasso.ItemIndex := 3;
      12 : rgrpTipoPasso.ItemIndex := 6;
      10 : rgrpTipoPasso.ItemIndex := 4;
      13 : rgrpTipoPasso.ItemIndex := 7;
      14 : rgrpTipoPasso.ItemIndex := 8;
      15 : rgrpTipoPasso.ItemIndex := 9;
      16 : rgrpTipoPasso.ItemIndex := 10;
      0  : rgrpTipoPasso.ItemIndex := 0;
  end;
end;

procedure TfrmTipoPasso.bbtnOkClick(Sender: TObject);
begin
  inherited;
  iTipoPasso := rgrpTipoPasso.ItemIndex;
end;

procedure TfrmTipoPasso.bbtnCancelaClick(Sender: TObject);
begin
  inherited;
  iTipoPasso := -1;
end;

procedure TfrmTipoPasso.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  iTipoPasso  := rgrpTipoPasso.ItemIndex;
  uiTipoPasso := rgrpTipoPasso.ItemIndex+1;
  ualgoritmo  := rgrpTipoPasso.items[rgrpTipoPasso.itemindex];

  Case uItipoPasso of
       4: uItipoPasso := 9;
       5: uItipoPasso := 10;
       6: uItipopasso  := 11;
       7: uItipopasso  := 12;
       8: uItipopasso  := 13;
       9: uItipopasso  := 14;
       10: uItipopasso  := 15;
       11: uItipopasso  := 16;
  end;
  close;
end;

procedure TfrmTipoPasso.bbtnCancelarClick(Sender: TObject);
begin
  ualgoritmo := '-1';
  uiTipoPasso := -1;
  rgrpTipoPasso.itemindex:=-1;
  inherited;
end;


procedure TfrmTipoPasso.bbtnSairClick(Sender: TObject);
begin
  bbtnCancelarClick(Sender);
  inherited;
end;

end.