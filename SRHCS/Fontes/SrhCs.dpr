program SrhCs;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal};

{$R *.RES}
{$R SRHCS_RES.RES}
Begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Recursos Humanos';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Recursos Humanos
================================================================================
CM$VER      3.00.02     08/11/2007
--------------------------------------------------------------------------------
- Exclusão do menu principal.
================================================================================
CM$VER      3.00.01     15/09/2003
--------------------------------------------------------------------------------
- Correção do erro que era apresentado na abertura do sistema.
================================================================================
CM$VER      3.00.00     12/09/2003
--------------------------------------------------------------------------------
- Versão em Delphi 5.
================================================================================
CM$VER      2.01.00     20/07/1999
--------------------------------------------------------------------------------
- Alteração no campo de controle dos módulos instalados.
================================================================================
CM$VER      2.00.02     26/03/1999
--------------------------------------------------------------------------------
- Foi alterado o caminho dos botões que chamam os outros módulos.
================================================================================
CM$VER      2.00.01     25/03/1999
--------------------------------------------------------------------------------
- Foi retirado do projeto o FCMSobre e o FSobre, e todas as suas referências.
================================================================================
CM$ALT}






















