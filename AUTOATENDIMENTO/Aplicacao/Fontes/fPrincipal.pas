unit FPrincipal;

interface

uses Windows, FCMPrincipal;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
  private
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

initialization
   Sistema.NomeModulo := 'Auto-Atendimento';
   Sistema.IdModulo := 460;
   Sistema.Versao := '3.01.18c';
   Sistema.NomeAplicativo := 'Auto-Atendimento';

end.
