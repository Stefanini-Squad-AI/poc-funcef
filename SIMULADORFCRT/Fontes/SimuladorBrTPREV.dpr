program SimuladorBrTPREV;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\CM\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\CM\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\CM\Forms\Source\fAguarde.pas' {frmAguarde},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\CM\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\CM\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  uModulo in 'uModulo.pas',
  FImportaSimulador in 'FImportaSimulador.pas' {frmImportaSimulador},
  FVerificaContribuicoes in 'FVerificaContribuicoes.pas' {frmVerificaContribuicoes},
  FCadastroPai in '..\..\Cm\Forms\Source\FCadastroPai.pas' {frmCadastroPai},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  fCadHistFuncPartCS in 'fcadhistfuncpartcs.pas' {frmCadHistFuncPartCS},
  FEventoTransfPlanoFCRT in 'FEventoTransfPlanoFCRT.pas' {frmEventoTransfPlanoFCRT},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  DRelTransfPlanoFCRT in 'DRelTransfPlanoFCRT.pas' {dtmRelTransfPlanoFCRT},
  DAPrev in 'DAPrev.pas' {dtmAPrev: TDataModule},
  FAcertoManualSimulacao in 'FAcertoManualSimulacao.pas' {frmAcertoManualSimulacao},
  FMigraPlanoFCRT in 'FMigraPlanoFCRT.pas' {frmMigraPlanoFCRT},
  FApagaPreviaMigraPlano in 'FApagaPreviaMigraPlano.pas' {frmApagaPreviaMigraPlano},
  FAcertaPeculio in 'FAcertaPeculio.pas' {frmAcertaPeculio},
  UMascaras in '..\..\AdmPrev\Fontes\UMascaras.pas',
  USimuladorBrTPREV in 'USimuladorBrTPREV.pas',
  UFuncoesUteis in 'UFuncoesUteis.pas',
  UPCS in 'UPCS.pas',
  FExportaSimuladorNOVO in 'FExportaSimuladorNOVO.pas' {frmExportaSimuladorNOVO},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  fAcertaReservaMigracao in 'fAcertaReservaMigracao.pas' {frmAcertaReservaMigracao},
  fFrameLista in 'fFrameLista.pas' {frmFrameListaBenef: TFrame},
  FParamRelDemonsSRB in 'FParamRelDemonsSRB.pas' {frmParamRelDemonsSRB},
  DRelSRB in 'DRelSRB.pas' {dtmRelSRB};

{$R *.RES}
{$R SIMULADORBRTPREV_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'FCRT - Simulador BrTPREV';
  Application.CreateForm(TdtmAPrev, dtmAPrev);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Simulador BrTPREV
================================================================================
CM$VER      3.03.08a    27-11-2007
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 26927
  Tela\Opçao No Sistema: Simulador | Simulação de Transferencia de Planos
  Descrição: - Acerto de erro de entrada da tela
================================================================================
CM$VER      3.03.08     14/08/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.17
================================================================================
CM$VER      3.03.07a    14/08/2007
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 26094
  Tela\Opçao No Sistema: Principal
  Descrição: Inclusão da tela "Extrato de Reservas (Mensal, Trimestral, Consolidado)"
================================================================================
CM$VER      3.03.07     18/05/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.16
================================================================================
CM$VER      3.03.06     23/03/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.15
================================================================================
CM$VER      3.03.05     19/01/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.14
================================================================================
CM$VER      3.03.04b    12/12/2006
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 23945
  Tela\Opçao No Sistema: Migração
  Descrição: Liberar acesso para o usuário BT026317 aocampo de data base
================================================================================
CM$VER      3.03.04a    06/11/2006
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 23576
  Tela\Opçao No Sistema: Acerto de Reserva da Migração
  Descrição: Permitir definir a data final da simulação de atualização das reservas pelo INPC.
================================================================================
CM$VER      3.03.04     14/09/2006
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.12
================================================================================
CM$VER      3.03.03     28/07/2006
--------------------------------------------------------------------------------
- Liberação de versão no padrão 5.10.11.
- Liberação de versão no padrão 5.10.10.
================================================================================
CM$VER      3.03.02b    06/02/2006
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 21467
  Tela\Opçao No Sistema: Acerto de Reserva da Migração
  Descrição: Na opção de acerto individual, permitir efetuar o ajuste para pessoas com data de cancelamento, mas ainda ativas, ou seja não estão na situação de canceladas com o resgate da reserva.
================================================================================
CM$VER      3.03.02     15/12/2005
--------------------------------------------------------------------------------
Liberação de versão no Padrão 5.10.08.
================================================================================
CM$VER      3.03.01a    16/12/2005
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 21042
  Tela\Opçao No Sistema: Processo / Acerto Manual da Base de Simulação
  Descrição: Colocar o campo idade na aposentadoria (IDADEAPOS da tabela SIMULAMIGRACAO) no grid de dados para permitir a consulta e alteração de valores pelo usuário.
- Resolução da Pendência Nº 21047
  Tela\Opçao No Sistema: Simulação de Migração de Plano
  Descrição: Tratar campos em branco na execução das regras.
================================================================================
CM$VER      3.03.01     15/12/2005
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 20712
  Tela\Opçao No Sistema: Exportação de Dados para Simulador
  Descrição: Inclusão dos campos CPF e Matrícula no layout do arquivo.
================================================================================
CM$VER      3.03.00     10/10/2005
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 19921
  Tela\Opçao No Sistema: (nova) Sistema / Utilitários / Acerta Reserva Migração BrTPREV 
  Criação de uma nova tela para processar acerto nas reservas migradas para o BrTPREV
================================================================================
CM$VER      3.02.10     17/08/2005
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 19921
  Tela\Opçao No Sistema: Efetivação de Migração
  Grava a data da última atualização da reserva, pois como estava sendo gravada
  com nulo, gerava uma inconsistência na consulta da reservas no Admprev,
  gerando em tela uma atualização incorreta.
================================================================================
CM$VER      3.02.09     15/08/2005
--------------------------------------------------------------------------------
  Tela\Opçao No Sistema: Exportação de Assistidos e Pensionistas
  Alteração na regra para cálculo do valor do abono.
================================================================================
CM$VER      3.02.08     17/08/2005
--------------------------------------------------------------------------------
  Tela\Opçao No Sistema: Simulação | Simula Transferência de Plano
  Considerar como zero a reserva de retirada importada com valor nulo.
================================================================================
CM$VER      3.02.07     05/08/2005
--------------------------------------------------------------------------------
  Tela\Opçao No Sistema: Processos | Exporta arquivo
  Alteração na Regra 1369 para 19090
================================================================================
CM$VER      3.02.06     02/08/2005
--------------------------------------------------------------------------------
  Tela\Opçao No Sistema: Processos | Exporta arquivo
  Alteração na Regra 1369 para 19090
================================================================================
CM$VER      3.02.05     29/07/2005
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 19811
  Tela\Opçao No Sistema: Processos | Exporta arquivo
  Acerto para verificar primeira tela de filtro antes de filtrar por matriculas
================================================================================
CM$VER      3.02.04     21/07/2005
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 19811
  Tela\Opçao No Sistema: Processos | Exporta arquivo
  Acerto para verificar primeira tela de filtro antes de filtrar por matriculas 
================================================================================
CM$VER      3.02.02     21/07/2005
--------------------------------------------------------------------------------
Liberação de versão no padrão 5.10.07.
================================================================================
CM$VER      3.02.01     15/07/2005
--------------------------------------------------------------------------------
Ajustes na efetivação para gravar a contribuição extraordinária adicional.
Ajuste no relatório de simulação para explicar a definição de CEA = contribuição extraordinária adicional.
================================================================================
CM$VER      3.02.00     5/07/2005
--------------------------------------------------------------------------------
- Ajustes no processos de exportação, importação e simulação para contemplar o
  segundo período de migração do plano BrtPREV.
================================================================================
CM$VER      3.01.01a    19/07/2004
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 17037
  Tela\Opçao No Sistema: Processos | Efetivação
  Erro na efetivação de beneficios com DIB em 01.05.2004 por causa do reajuste do inss
================================================================================
CM$VER      3.01.01     22/04/2004
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 16529
  Tela\Opçao No Sistema: Simulações | Simulação de Transferência de Plano
  Na  migração dos participantes da patrocinadora celular, é  pago  o incentivo de 
  Resgate de 10% da RT, que será o valor  maior entre a RM e RR.
  Só que não hora de rodar a prévia para efetivação dos valore,s  está saindo  
  o valor da coluna RM para todos os casos
================================================================================
CM$VER      3.01.00     16/02/2004
--------------------------------------------------------------------------------
Alterações para contemplar Simulador CELULAR
================================================================================
CM$VER      3.00.06b    07/01/2004
--------------------------------------------------------------------------------
Atualização de Padrão
================================================================================
CM$VER      3.00.06a    04/12/2003
--------------------------------------------------------------------------------
Atualização de versão
================================================================================
CM$VER      3.00.04     28/07/2003
--------------------------------------------------------------------------------
Atualização de versão
================================================================================
CM$VER      3.00.03     03/07/2003
--------------------------------------------------------------------------------
Padrao
================================================================================
CM$VER      3.00.02     03/07/2003
--------------------------------------------------------------------------------
Acerto para compilação
================================================================================
CM$VER      3.00.01     02/07/2003
--------------------------------------------------------------------------------
Acerto na Compilação
================================================================================
CM$VER      3.00.00     27/06/2003
--------------------------------------------------------------------------------
Retirada da rubrica 25168 da geração de rubricas do INSS
================================================================================
CM$ALT}












