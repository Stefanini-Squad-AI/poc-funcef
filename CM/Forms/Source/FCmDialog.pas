unit FCmDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97, CmDock, ExtCtrls, FTelaAut, IvDictio, IvMulti, IvEMulti;

type
  TFrmCmDialog = class(TfrmTelaAutorizacao)
    PnlFundo: TPanel;
    CMOkCancelar: TCMOkCancelar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCmDialog: TFrmCmDialog;

implementation

{$R *.DFM}

end.
