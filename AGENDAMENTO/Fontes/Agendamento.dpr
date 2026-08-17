program Agendamento;

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
  FCadastroCS in '..\..\CM\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  UModuloAgendamento in 'UModuloAgendamento.pas',
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {frmCadastroMT},
  FCadastroPai in '..\..\Cm\Forms\Source\FCadastroPai.pas' {frmCadastroPai},
  fCadAtendeAgenda in 'fCadAtendeAgenda.pas' {frmCadAtendeAgenda},
  fCadAssuntoAgenda in 'fCadAssuntoAgenda.pas' {frmCadAssuntoAgenda},
  fCadGrupoAtende in 'fCadGrupoAtende.pas' {frmCadGrupoAtende},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fCadPeriodoAgenda in 'fCadPeriodoAgenda.pas' {frmCadPeriodoAgenda},
  fReplicarPeriodo in 'fReplicarPeriodo.pas' {frmReplicarPeriodo},
  fCadAusenciaAtende in 'fCadAusenciaAtende.pas' {frmCadAusenciaAtende},
  fReplicarAusencia in 'fReplicarAusencia.pas' {frmReplicarAusencia},
  fCadAgendamento in 'fCadAgendamento.pas' {frmCadAgendamento},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  dRptAgendamento in 'dRptAgendamento.pas' {dtmRptAgendamento},
  FCMParam in '..\..\Cm\Forms\Source\FCMParam.pas',
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  fRptAgendamento in 'fRptAgendamento.pas' {frmRptAgendamento},
  uCmCtrlRptAgendamento in 'uCmCtrlRptAgendamento.pas',
  fAgendamentosNoPeriodo in 'fAgendamentosNoPeriodo.pas' {frmAgendamentosNoPeriodo};

{$R *.RES}
{$R AGENDAMENTO_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Agendamento de Atendimentos';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end. 
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Agendamento de Atendimentos
================================================================================
CM$VER      3.01.18     03/11/2007
--------------------------------------------------------------------------------
Liberação do padrão 18
================================================================================
CM$VER      3.01.17     14/08/2007
--------------------------------------------------------------------------------
- Associação  dos Help's do Sistema
- Liberação do padrão 17
================================================================================
CM$VER      3.01.16     25/05/2007
--------------------------------------------------------------------------------
- Liberação do padrão 16
================================================================================
CM$VER      3.01.15     23/03/2007
--------------------------------------------------------------------------------
Liberação do padrão 15.
================================================================================
CM$VER      3.01.13     
--------------------------------------------------------------------------------
Liberação do padrão 13
================================================================================
CM$VER      3.01.12     15/09/2006
--------------------------------------------------------------------------------
Liberação do padrão 12
================================================================================
CM$VER      3.00.03     07/02/2006
--------------------------------------------------------------------------------
Pendência 21481 - Relatórios de Agendamentos
- Incluir filtragem por período.
Pendência 21482 - Relatórios de Agendamentos
- Disponibilizar campo "Observação" para uso nos relatórios.
================================================================================
CM$VER      3.00.01     06/02/2006
--------------------------------------------------------------------------------
Pendência 21211 - Agendamento
- Não permitir agendar um atendimento para data passadas.
Pendência 21212 - Agendamento
- Disponibilizar filtro de consulta de agendamento pela inscrição/matrícula.
Pendência 21213 - Cadastro de Ausência de Atendente
- Durante registro de ausência, verificar se existe(m) agendamento(s) marcado(s) para o período de ausência e, caso existam, exibir uma mensagem listando-os e perguntando se confirma o registro de ausência ou não.
================================================================================
CM$VER      3.00.00     29/11/2005
--------------------------------------------------------------------------------
Liberação da primeira versão do sistema de Agendamento.
================================================================================
CM$ALT}
























