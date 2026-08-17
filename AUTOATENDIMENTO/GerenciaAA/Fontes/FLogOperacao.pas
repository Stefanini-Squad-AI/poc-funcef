unit FLogOperacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, TB97, TB97Tlbr, ExtCtrls;

type
  TfrmLogOperacao = class(TForm)
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    btnSair: TBitBtn;
    btnSalvar: TBitBtn;
    pnlFundo: TPanel;
    memLog: TMemo;
    SaveDialog: TSaveDialog;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogOperacao: TfrmLogOperacao;

implementation

{$R *.DFM}

procedure TfrmLogOperacao.btnSalvarClick(Sender: TObject);
begin
  if SaveDialog.Execute then memLog.Lines.SaveToFile( SaveDialog.FileName );
end;

end.
