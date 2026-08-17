unit fCmPrincipalAppServer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPai, IvDictio, IvMulti, IvEMulti, ExtCtrls, TB97, jpeg, ComCtrls,
  StdCtrls, uSistema;

type
  TStatusConexao = (scIdle, scConnected, scDisconnected);

  TfrmCmPrincipalAppServer = class(TfrmPai)
    pnlFundo: TPanel;
    Image1: TImage;
    Mem: TMemo;
    LblAppServer: TLabel;
    Image2: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCmPrincipalAppServer: TfrmCmPrincipalAppServer;

implementation

{$R *.DFM}

{ TfrmCmPrincipalAppServer }

end.
