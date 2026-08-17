unit FIDCPU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, FCadastroCS;

type
  TfrmCpuAtend = class(TfrmCadastroCS)
    Edit_ID_CPU: TEdit;
    Edit_Nome_CPU: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCpuAtend: TfrmCpuAtend;

implementation

{$R *.DFM}

procedure TfrmCpuAtend.BitBtn1Click(Sender: TObject);
begin
  frmCpuAtend.close;
end;

end.
