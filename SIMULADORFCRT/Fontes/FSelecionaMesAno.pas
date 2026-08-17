unit FSelecionaMesAno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Mask, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmSelecionaMes = class(TfrmOkCancelar)
    Label1: TLabel;
    edMesAno: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionaMes: TfrmSelecionaMes;

implementation

{$R *.DFM}

end.
