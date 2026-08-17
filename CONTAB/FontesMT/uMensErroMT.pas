unit uMensErroMT;

interface

uses uMensErro, Dialogs;

type
  TMensErroMT  = class
  procedure MensErroMT (sMessageInfo: string);
end;

var MensErroMT: TMensErroMT;

implementation

{ TMensErroMT }

procedure TMensErroMT.MensErroMT(sMessageInfo: string);
begin
  MsgDlg(sMessageInfo, 'Aviso', mtWarning, [mbOk], 0);
end;

end.
