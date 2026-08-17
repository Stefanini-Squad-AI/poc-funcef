unit FAguardeDDic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls;

type
  TFrmAguardeDDic = class(TForm)
    Label1: TLabel;
    Animate1: TAnimate;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAguardeDDic: TFrmAguardeDDic;

implementation

{$R *.DFM}

procedure TFrmAguardeDDic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Animate1.Active := False;
end;

procedure TFrmAguardeDDic.FormShow(Sender: TObject);
begin
  Animate1.Active := True;
end;

end.
