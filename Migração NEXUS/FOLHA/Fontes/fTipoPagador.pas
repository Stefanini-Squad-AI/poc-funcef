unit fTipoPagador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97;

type
  TfrmTipoPagador = class(TfrmSairAjuda)
    rgTipoPagador: TRadioGroup;
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoPagador: TfrmTipoPagador;

implementation

uses FEstornaFolha;

{$R *.DFM}

end.
