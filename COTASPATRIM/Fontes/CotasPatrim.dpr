program CotasPatrim;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\CM\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\CM\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\CM\Forms\Source\fAguarde.pas' {frmAguarde},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\CM\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\CM\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastroPai in '..\..\Cm\Forms\Source\FCadastroPai.pas' {frmCadastroPai},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fCadAtivo in 'fCadAtivo.pas' {frmCadAtivo},
  fCadContasFundos in 'fCadContasFundos.pas' {frmCadContasFundos},
  fCadTipoMovim in 'fCadTipoMovim.pas' {frmCadTipoMovim},
  fCadDesvioPadrao in 'fCadDesvioPadrao.pas' {frmCadDesvioPadrao},
  fCadRoteiros in 'fCadRoteiros.pas' {frmCadRoteiros},
  fApurRoteiroManual in 'fApurRoteiroManual.pas' {frmApurRoteiroManual},
  fApurHstMov in 'fApurHstMov.pas' {frmApurHstMov},
  fCadTipoEntrada in 'fCadTipoEntrada.pas' {frmCadTipoEntrada},
  uCtrlContasFundos in '..\CtrlObjects\uCtrlContasFundos.pas',
  uCtrlAtivo in '..\CtrlObjects\uCtrlAtivo.pas',
  uDbCpativo in '..\DbObjects\uDbCpativo.pas',
  uDbCpconta in '..\DbObjects\uDbCpconta.pas',
  uDbCptpentrada in '..\DbObjects\uDbCptpentrada.pas',
  uCtrlCadTipoEntrada in '..\CtrlObjects\uCtrlCadTipoEntrada.pas',
  uCtrlCadTipoMovim in '..\CtrlObjects\uCtrlCadTipoMovim.pas',
  uDbCptipomovim in '..\DBObjects\uDbCptipomovim.pas',
  uDbCproteiro in '..\DBObjects\uDbCproteiro.pas',
  uCtrlRoteiros in '..\CtrlObjects\uCtrlRoteiros.pas',
  uDbCprtpmovim in '..\DBObjects\uDbCprtpmovim.pas',
  uDbCprtpentrada in '..\DBObjects\uDbCprtpentrada.pas',
  uDbCpdesvio in '..\DBObjects\uDbCpdesvio.pas',
  uCtrlCadDesvioPadrao in '..\CtrlObjects\uCtrlCadDesvioPadrao.pas',
  fGerStatusCota in 'fGerStatusCota.pas' {frmGerStatusCota},
  fParamCotasPatrim in 'fParamCotasPatrim.pas' {frmParamCotasPatrim},
  uDbParamcotapatrim in '..\DBObjects\uDbParamcotapatrim.pas',
  uCtrlParamCotasPatrim in '..\CtrlObjects\uCtrlParamCotasPatrim.pas',
  fAberturaAtivo in 'fAberturaAtivo.pas' {frmAberturaAtivo},
  fExecucaoRoteiros in 'fExecucaoRoteiros.pas' {frmExecutarRoteiros},
  uCtrlCpRotApurado in '..\CtrlObjects\uCtrlCpRotApurado.pas',
  uDbCpRotAprEnt in '..\DbObjects\uDbCpRotAprEnt.pas',
  uDbCpRotApurado in '..\DbObjects\uDbCpRotApurado.pas',
  fApuracaoManual in 'fApuracaoManual.pas' {frmApuracaoManual},
  uCtrlCpExecRot in '..\CtrlObjects\uCtrlCpExecRot.pas',
  fResultExecucao in 'fResultExecucao.pas' {frmResultExecucao},
  uDbCpExecRot in '..\DbObjects\uDbCpExecRot.pas',
  uDbCpRotAprMov in '..\DbObjects\uDbCpRotAprMov.pas',
  fConsRoteiros in 'fConsRoteiros.pas' {frmConsRoteiros},
  uDbCpValorCota in '..\DbObjects\uDbCpValorCota.pas',
  uCtrlCpValorCota in '..\CtrlObjects\uCtrlCpValorCota.pas',
  fCalculoCota in 'fCalculoCota.pas' {frmCalculoCota},
  fRoteirosExecutados in 'fRoteirosExecutados.pas' {frmRoteirosExecutados},
  fCotasCalculadas in 'fCotasCalculadas.pas' {frmCotasCalculadas},
  uDbCpSaldoConta in '..\DbObjects\uDbCpSaldoConta.pas',
  uDbCpRotEntRD in '..\DbObjects\uDbCpRotEntRD.pas';

//  UModuloCotasPatrim in 'UModuloCotasPatrim.pas';

{$R *.RES}
{$R COTASPATRIM_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Controle de Cotas Patrimoniais';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Acompanhamento de Cotas e Fundos Patrimoniais
================================================================================
CM$VER      3.00.03     12/12/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.18
Pendência 26647 - Consulta Documento
- Implementação de consulta a documentos.
================================================================================
CM$VER      3.00.02     16/10/2007
--------------------------------------------------------------------------------
Implementação de alterações solicitadas pelos usuários em apresentações do sistema.
================================================================================
CM$VER      3.00.01     27/09/2007
--------------------------------------------------------------------------------
Primeira liberação para testes do usuário.
================================================================================
CM$VER      3.00.00     07/12/2006
--------------------------------------------------------------------------------
Liberação padrão 5.10.13
Pendência: 23098
Tela: Cadastros\Contas por fundo
Descrição do usuário: Implementação de cadastro de contas por fundo
Pendência: 23104
Tela: Cadastros\Tipo Movimentação
Descrição do usuário: Implementação de cadastro de  Tipo Movimentação
Pendência: 23004
Tela: Cadastros\Ativos
Descrição do usuário: Implementação de Cadastro de Ativos
Pendência: 23223
Tela: Sistema\Configuração\Parametro do Sistema
Descrição do usuário: Implementação da tela de parametro do sistema
Pendência: 23106
Tela: Cadastro\Roteiros
Descrição do usuário: Implementação da tela de cadastro de roteiros.
Pendência: 23004
Tela: Cadastro\Ativos
Descrição do usuário: Implementação da tela de cadastro de ativos.
================================================================================
CM$ALT}


















