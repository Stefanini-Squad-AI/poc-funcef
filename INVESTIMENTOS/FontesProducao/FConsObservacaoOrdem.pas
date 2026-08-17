unit FConsObservacaoOrdem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, wwriched;

type
  TFrmObservacaoOrdem = class(TForm)
    dbrObservacao: TwwDBRichEdit;
    bbtnSair: TBitBtn;
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmObservacaoOrdem: TFrmObservacaoOrdem;

implementation

{$R *.DFM}

procedure TFrmObservacaoOrdem.bbtnSairClick(Sender: TObject);
begin
   Close;       
end;

end.
