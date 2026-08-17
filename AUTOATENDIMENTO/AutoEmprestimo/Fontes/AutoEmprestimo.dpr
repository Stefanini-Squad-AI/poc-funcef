//CGI
program AutoEmprestimo;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  DPrincipal in 'DPrincipal.pas' {wmdlAutoAtendimento: TWebModule},
  uCtrlAutoEmprestimo in 'uCtrlAutoEmprestimo.pas';

{$R *.RES}
{$R AUTOEMPRESTIMO_RES.RES}

begin
  Application.Initialize;
  Application.Title := 'Auto-Emprestimo';
  Application.CreateForm(TwmdlAutoAtendimento, wmdlAutoAtendimento);
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Auto-Empréstimo
================================================================================
CM$VER      3.11.00     06/03/2008
--------------------------------------------------------------------------------
Liberação do padrão 5.11.00
================================================================================
CM$ALT}












































































































































