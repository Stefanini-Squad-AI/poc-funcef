unit fMensValor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask;

type
  TfrmMensValor = class(TfrmOkCancelar)
    Memo1: TMemo;
    Label1: TLabel;
    mkedValor: TMaskEdit;
  end;

function MostrarMensValor(ACaption,AMsg,APadrao,AMasc: string): string;

implementation

{$R *.DFM}

function MostrarMensValor(ACaption,AMsg,APadrao,AMasc: string): string;
begin
  with TfrmMensValor.Create(Application) do
  begin
    Caption := ACaption;
    Memo1.Lines.Text := AMsg;
    mkedValor.Text := '';
    mkedValor.EditMask := AMasc;

    if (ShowModal = mrOk) then
      Result := mkedValor.Text
    else
      Result := '';

    Free;
  end;
end;

end.
