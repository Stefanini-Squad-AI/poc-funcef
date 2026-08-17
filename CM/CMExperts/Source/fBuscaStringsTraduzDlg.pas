unit fBuscaStringsTraduzDlg;

interface

uses ivDictio,   
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TB97Ctls, StdCtrls;

type
  TFrmBuscaStringsTraduzDlg = class(TForm)
    Label1: TLabel;
    btnSim: TToolbarButton97;
    btnNao: TToolbarButton97;
    btnTodos: TToolbarButton97;
    btnParar: TToolbarButton97;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscaStringsTraduzDlg: TFrmBuscaStringsTraduzDlg;

implementation

{$R *.DFM}

end.
