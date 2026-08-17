unit FEncerProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook, Db,
  DBTables, Wwtable, Mask, wwdbedit, Wwdbspin, DBCtrls;

type
  TfrmEncerProc = class(TfrmOkCancelar)
    tblTipSent: TwwTable;
    gbxAcordo: TGroupBox;
    sbspeParc: TwwDBSpinEdit;
    gbxSent: TGroupBox;
    dblcTipSent: TwwDBLookupCombo;
    Label1: TLabel;
    rgTipEncer: TDBRadioGroup;
    procedure rgTipEncerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEncerProc: TfrmEncerProc;

implementation

uses FCadProcesso;

{$R *.DFM}



procedure TfrmEncerProc.rgTipEncerClick(Sender: TObject);
begin
  inherited;
  gbxAcordo.Visible := rgTipEncer.ItemIndex = 1;
  gbxSent.Visible := rgTipEncer.ItemIndex = 3;
end;

procedure TfrmEncerProc.FormCreate(Sender: TObject);
begin
  inherited;
  tblTipSent.Open;
  rgTipEncerClick(Application);
end;

end.
