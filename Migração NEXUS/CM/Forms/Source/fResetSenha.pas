unit fResetSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TfrmResetSenha = class(TfrmOkCancelar)
    rgrpSenha: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResetSenha: TfrmResetSenha;

implementation

{$R *.DFM}

end.
