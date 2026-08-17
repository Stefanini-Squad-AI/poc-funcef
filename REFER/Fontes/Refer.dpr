program Refer;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  UModulo in 'UModulo.pas',
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FRecebimentoAssistencial in 'FRecebimentoAssistencial.pas' {FrmRecebimentoAssistencial},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  uFuncoesUteis in 'uFuncoesUteis.pas',
  fcontrachequetrimestral in 'fcontrachequetrimestral.pas' {frmcontrachequetrimestral},
  FGeraArquivoSipcCap in 'FGeraArquivoSipcCap.pas' {FrmGeraArquivoSipcCap},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal};

{$R *.RES}
{$R REFER_RES.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo REFER
================================================================================
CM$VER      3.01.01     23/07/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.17
================================================================================
CM$VER      3.01.00     18/05/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.16
================================================================================
CM$VER      3.00.10     23/03/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.15
================================================================================
CM$VER      3.00.09     19/01/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.14
================================================================================
CM$VER      3.00.07     14/09/2006
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.12
================================================================================
CM$VER      3.00.06     28/07/2006
--------------------------------------------------------------------------------
Liberação de versão no Padrão 11
================================================================================
CM$VER      3.00.05     06/07/2006
--------------------------------------------------------------------------------
Liberação de versão no Padrão 10
================================================================================
CM$VER      3.00.04     29/06/2006
--------------------------------------------------------------------------------
Liberação de versão no Padrão 5.10.09.
================================================================================
CM$VER      3.00.03     15/12/2005
--------------------------------------------------------------------------------
Liberação de versão no Padrão 5.10.08.
================================================================================
CM$VER      3.00.02     21/07/2005
--------------------------------------------------------------------------------
Liberação de versão no Padrão 5.10.07.
================================================================================
CM$VER      3.00.01     03/06/2005
--------------------------------------------------------------------------------
Liberação de versão no Padrão 5.10.06
================================================================================
CM$VER      3.00.00a    21/03/2005
--------------------------------------------------------------------------------
Pendência: Implementação
Tela     : Processamentos\Gera arquivo SIPC-CAP Refer
Descrição: Criada uma nova tela para a geração do arquivo SIPC-CAP
================================================================================
CM$VER      3.00.00     01/02/2005
--------------------------------------------------------------------------------
Pendência: 18487 
Tela: Contra Cheque Trimestral
Descrição: Utilizar o flgespecial e flgdesconto da HistRubSal;
           passar o Contra Cheque Trimestral para o módulo da fundação;
           verificar a utilização do flgespecial = 2 para a composição do total de desconto.
================================================================================
CM$ALT}


