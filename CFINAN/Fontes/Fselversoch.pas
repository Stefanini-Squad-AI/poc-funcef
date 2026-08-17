unit Fselversoch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TFrmselversoch = class(TfrmOkCancelar)
    chkdocto: TCheckBox;
    chkvalor: TCheckBox;
    chkforn: TCheckBox;
    chkdtprog: TCheckBox;
    chkdestinase: TCheckBox;
    chkhist: TCheckBox;
    chklocal: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmselversoch: TFrmselversoch;

implementation

{$R *.DFM}

end.
