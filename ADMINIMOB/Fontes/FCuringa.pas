unit FCuringa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPai, IvDictio, IvMulti, IvEMulti, StdCtrls;

type
  TfrmCuringa = class(TfrmPai)
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    frmCuringa: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private { Private declarations }

  public { Public declarations }

  end;



var
  frmCuringa: TfrmCuringa;



implementation
{$R *.DFM}



procedure TfrmCuringa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ModalResult := mrOk;
end;



end.
