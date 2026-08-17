unit FProgressCpmf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPai, IvDictio, IvMulti, IvEMulti, StdCtrls, ComCtrls, ExtCtrls;

type
  TFrmProgressCpmf = class(TfrmPai)
    LblLote: TLabel;
    LblDocumento: TLabel;
    LblImposto: TLabel;
    PbLote: TProgressBar;
    PbDocumento: TProgressBar;
    PbRateio: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProgressCpmf: TFrmProgressCpmf;

implementation

{$R *.DFM}

end.
