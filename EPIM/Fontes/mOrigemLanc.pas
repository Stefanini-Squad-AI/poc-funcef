unit mOrigemLanc;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TmolOrigemLanc = class(TFrame)
    cboOrigemLanc: TwwDBComboBox;
    Label1: TLabel;

    procedure cboOrigemLancKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);


  private { Private declarations }

  public { Public declarations }

  end;



implementation
{$R *.DFM}



procedure TmolOrigemLanc.cboOrigemLancKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if key = vk_delete then cboOrigemLanc.Clear;
end;

end.
