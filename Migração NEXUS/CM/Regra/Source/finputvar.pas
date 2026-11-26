unit FInputVar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, TB97Tlbr, TB97;

type
  TfrmInputVar = class(TForm)
    pnlFundo: TPanel;
    lblValor: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edvalor: TEdit;
    Dock971: TDock97;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputVar: TfrmInputVar;

implementation

{$R *.DFM}

procedure TfrmInputVar.FormActivate(Sender: TObject);
begin
  edValor.SetFocus;
end;


procedure TfrmInputVar.BitBtn1Click(Sender: TObject);
begin
  Close
end;

procedure TfrmInputVar.BitBtn2Click(Sender: TObject);
begin
  edvalor.Text:='0';
  close;
end;

procedure TfrmInputVar.bbtnCancelarClick(Sender: TObject);
begin
  EdValor.Text:='0';
  Close;
end;

procedure TfrmInputVar.FormShow(Sender: TObject);
begin
   edvalor.Top := lblValor.Top + lblValor.Height + 5; 
end;

end.


