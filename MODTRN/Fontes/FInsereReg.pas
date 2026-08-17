unit FInsereReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, ExtCtrls, MAHlpBtn, Buttons, TB97, IvDictio,
  IvMulti, IvEMulti, TB97Tlbr;

type
  TfrmInsereReg = class(TfrmSairAjuda)
    rgInsere: TRadioGroup;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmInsereReg: TfrmInsereReg;
  procedure InserirReg(sTitulo: String);

implementation

{$R *.DFM}
procedure InserirReg(sTitulo: String);

begin
  With frmInsereReg do
    begin
        Caption := sTitulo;
        ShowModal;
    end;
end;

procedure TfrmInsereReg.FormShow(Sender: TObject);
begin
  inherited;
  // rgInsere.ItemIndex := 0;
end;

end.
