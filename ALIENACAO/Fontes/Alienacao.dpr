program Alienacao;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  fAnalProp in 'fAnalProp.pas' {frmAnalProp},
  FGeraContrato in 'FGeraContrato.pas' {frmGeraContrato},
  FCadPropFinanc in 'FCadPropFinanc.pas' {frmCadPropFinanc},
  DRelFinanc in 'DRelFinanc.pas' {dtmRelFinanc},
  FCadAmortizacao in 'FCadAmortizacao.pas' {frmCadAmortizacao},
  FCadMsgBoleto in 'FCadMsgBoleto.pas' {frmCadMsgBoleto},
  fExecIntegra in 'fExecIntegra.pas' {frmExecIntegra},
  fExecParcelas in 'fExecParcelas.pas' {frmExecParcelas},
  fExecEstorno in 'fExecEstorno.pas' {frmExecEstorno},
  CRelContrato in 'CRelContrato.pas' {RelContrato},
  fExecConcilia in 'fExecConcilia.pas' {frmExecConcilia},
  FCadDiverge in 'FCadDiverge.pas' {frmCadDiverge},
  CRelExtrato in 'CRelExtrato.pas' {RelExtrato},
  CRelInadSin in 'CRelInadSin.pas' {RelInadSin},
  CRelInadAna in 'CRelInadAna.pas' {RelInadAna},
  CRelImovAli in 'CRelImovAli.pas' {RelImovAli},
  FCadBaixaManual in 'FCadBaixaManual.pas' {frmCadBaixaManual},
  fExecRecalculo in 'fExecRecalculo.pas' {frmExecRecalculo},
  fExecAntecipa in 'fExecAntecipa.pas' {frmExecAntecipa},
  UFuncAlienacao in 'UFuncAlienacao.pas',
  FCadAlterador in 'FCadAlterador.pas' {frmCadAlterador},
  fExecDesfazRepactuacao in 'fExecDesfazRepactuacao.pas' {frmExecDesfazRepactuacao},
  fExecDesfazAntecipa in 'fExecDesfazAntecipa.pas' {frmExecDesfazAntecipa},
  fExecDesfazContrato in 'fExecDesfazContrato.pas' {frmExecDesfazContrato},
  CRelListaContratos in 'CRelListaContratos.pas' {RelListaContratos},
  fExecRepactuacao in 'fExecRepactuacao.pas' {frmExecRepactuacao},
  fCadParamMT in '..\FontesMT\fCadParamMT.pas' {frmCadParamMT},
  uCtrlRptAlienacao in '..\CtrlObjects\uCtrlRptAlienacao.pas',
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  fExecResiduo in 'fExecResiduo.pas' {frmExecResiduo},
  DFinanciamento in 'DFinanciamento.pas' {dtmFinanciamento: TDataModule},
  dRelFolhaAlienacao in '..\FontesMT\dRelFolhaAlienacao.pas' {dtmRelFolhaAlienacao},
  cRelFolhaAlienacao in '..\FontesMT\cRelFolhaAlienacao.pas' {cfgRelFolhaAlienacao},
  uCtrlRelAlienacao in '..\CtrlObjects\uCtrlRelAlienacao.pas',
  fExecImportaBaixa in 'fExecImportaBaixa.pas' {frmExecImportaBaixa},
  FProgresso in '..\..\Cm\Forms\Source\FProgresso.pas' {frmProgresso},
  FDRelCartaReajuste in 'FDRelCartaReajuste.pas' {frmDesenhoRelCartaReajuste},
  CRelCartaReajuste in 'CRelCartaReajuste.pas' {cfgRelCartaReajuste},
  fExecAssociaDoc in 'fExecAssociaDoc.pas' {frmExecAssociaDoc},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  cRelEstoqueFinanceiro in '..\FontesMT\cRelEstoqueFinanceiro.pas' {cfgRelEstoqueFinanceiro},
  dRelEstoqueFinanceiro in '..\FontesMT\dRelEstoqueFinanceiro.pas' {dtmRelEstoqueFinanceiro},
  FConsultaParcela in '..\FontesMT\FConsultaParcela.pas' {frmConsultaParcela},
  fExecEncerraContratoMT in '..\FontesMT\fExecEncerraContratoMT.pas' {frmExecEncerraContratoMT},
  FEspera in 'FEspera.pas' {frmEspera},
  dRelAbonos in '..\FontesMT\dRelAbonos.pas' {dtmRelAbonos},
  CRelAbonos in '..\FontesMT\CRelAbonos.pas' {cfgRelAbonos},
  dRelMovimContabil in '..\FontesMT\dRelMovimContabil.pas' {dtmRelMovimContabil},
  cRelMovimContabil in '..\FontesMT\cRelMovimContabil.pas' {cfgRelMovimContabil},
  CRelInadimplContrAnaliticoAlie in 'CRelInadimplContrAnaliticoAlie.pas' {RelInadimplContrAnalitico},
  FCadDevolucaoSinal in '..\FontesMT\FCadDevolucaoSinal.pas' {FrmCadDevolucaoSinal},
  CRelExtratoNovo in 'CRelExtratoNovo.pas' {RelExtratoNovo},
  FDistratoContratual in '..\FontesMT\FDistratoContratual.pas';

{$R *.RES}
{$R ALIENACAO_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Alienação';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TfrmEspera, frmEspera);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;


end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Alienação
================================================================================
CM$VER      3.02.18g    18/06/2008
--------------------------------------------------------------------------------
- Pendencia 28201: Extrato Contratual
  Acerto na rotina de busca do saldo devedor no extrato contratual
- Pendencia 28049: Relatorios de Provisão de Perda, Inadimplencia Analitica e Sintetica
  Ajuste na query que busca os contratos para que os valores fiquem coerentes com o
  Extrato Contratual
================================================================================
CM$VER      3.02.18f    18/04/2008
--------------------------------------------------------------------------------
- Pendência 27765: Geração de Parcelas
  Correção do processo de busca da condição de pagamento para geração das
  parcelas. Mesmo selecionando o contrato, as parcelas não estavam sendo geradas.
- Extrato Contratual
  Correção da busca do saldo devedor para a fórmula de cálculo nº 18.
================================================================================
CM$VER      3.02.18e    17/03/2008
--------------------------------------------------------------------------------
- Pendência 27573: Ajuste dos Help Contexts do Sistema.
================================================================================
CM$VER      3.02.18d    13/03/2008
--------------------------------------------------------------------------------
- Pendência 27583: Defazer Repactuação
  Correção do processo de exclusão das condições anteriores quando repactuado para
  mais de uma condição de pagamento.
================================================================================
CM$VER      3.02.18c    05/03/2008
--------------------------------------------------------------------------------
- Pendencia 27460: Antecipação de Parcelas
  Implementada mensagens informativas quanto ao processo de antecipação de parcelas.
  Não é permitido antecipação de percelas quando as mesmas estiverem integradas.
================================================================================
CM$VER      3.02.18b    04/03/2008
--------------------------------------------------------------------------------
- Pendência 27508: Ajuste e atualização dos helps do sistema.
================================================================================
CM$VER      3.02.18a    25/02/2008
--------------------------------------------------------------------------------
Proposta de Alienação
  Pendência: 27463 - Ajuste na gravação da proposta ao registrar informações da
                     empresa proprietária.
================================================================================
CM$VER      3.02.18     15/01/2008
--------------------------------------------------------------------------------
Cadastro de Proposta de Contratos
  Pendência: 27172 - Passa a gravar a identificação da empresa proprietária.
Cadastros - Mensagem de Boleto
  Pendência: 25176 - Implementação de curingas para relacionar a descrição dos imóveis
                     do contrato.
================================================================================
CM$VER      3.02.17g    08/11/2007
--------------------------------------------------------------------------------
- Pendencia 26747: Repactuação Contratual
  Ajuste no processo de repactuação contratual para a forma de calculo 
  Correção mensal sobre saldo devedor, parcela calculada sobre saldo devedor por 
  parcelas restantes.
================================================================================
CM$VER      3.02.17f    06/11/2007
--------------------------------------------------------------------------------
- Pendencia 26747: Repactuação Contratual
  Ajuste no processo de repactuação contratual para a forma de calculo Correção mensal sobre saldo devedor, parcela calculada 
  sobre saldo devedor por parcelas restantes
================================================================================
CM$VER      3.02.17e    30/10/2007
--------------------------------------------------------------------------------
- Pendencia 26609: Calculo de Correção Monetária de Parcelas
  Para a forma de calculo Correção mensal sobre saldo devedor, parcela calculada 
  sobre saldo devedor por parcelas restantes, passa a considerar o numero de dias 
  do mes de competencia da cobranca ao invés de ser o mes de competencia do Indice
- Pendencia 26747: Repactuação Contratual
  Ajuste no processo de repactuação contratual para a forma de calculo Correção mensal sobre saldo devedor, parcela calculada 
  sobre saldo devedor por parcelas restantes
================================================================================
CM$VER      3.02.17d    26/10/2007
--------------------------------------------------------------------------------
- Ajuste no processo de amortização para a forma de cálculo Correção mensal sobre 
  saldo devedor, parcela calculada sobre saldo devedor por parcelas restantes.
================================================================================
CM$VER      3.02.17c    23/10/2007
--------------------------------------------------------------------------------
- Ajuste no processo de repactuação contratual
================================================================================
CM$VER      3.02.17b    10/10/2007
--------------------------------------------------------------------------------
Pendencia 26485: Repactuação
   Implementação de nova forma de cálculo: Correção mensal sobre saldo devedor,
   parcela calculada sobre saldo devedor por parcelas restantes
================================================================================
CM$VER      3.02.17a    04/10/2007
--------------------------------------------------------------------------------
Pendencia 26485: 
   Implementação de nova forma de cálculo: Correção mensal sobre saldo devedor,
   parcela calculada sobre saldo devedor por parcelas restantes
================================================================================
CM$VER      3.02.17     18/09/2007
--------------------------------------------------------------------------------
Liberação do padrão 17
Configuração de Relatórios
  Pendência: 26239 - Disponibilização de relatórios em 3 camadas para parametrização
                     de layout pelo usuário.
Relatórios
  Pendencia: 24142 - Relatório Espelho de Contratos. Ajuste na demonstração do campo
                     Correção / Resíduo para demonstrar valores como são apresentados no
                     relatório de Projeção de Parcelas.
Cobrança / Abono de Resíduos
  Pendencia: 23210 - Criação de dois novos parâmetros na tela de Parâmetros do Sistema
                     que indicam o tipo de operação para: Abono por adiantamento de resíduo e
                     Abono de resíduo normal. Esses dois tipos de operação deverão ser
                     parametrizados adequadamente para Integração contábil / Financeira.
                     Criação de dois novos parâmetros na tela de Parâmetros do Sistema:
                     Alterador de CPMF e Alterador de Adiantamento de Resíduo.
                     No processo de Abono de Resíduos, o sistema passa a fazer a geração dos
                     tipos de receita com seus respectivos valores correspondentes ao Alterador
                     de Adiantamento de resíduo.
================================================================================
CM$VER      3.02.16n    08/11/2007
--------------------------------------------------------------------------------
- Pendencia 26747: Repactuação Contratual
  Ajuste no processo de repactuação contratual para a forma de calculo 
  Correção mensal sobre saldo devedor, parcela calculada sobre saldo devedor por 
  parcelas restantes.
================================================================================
CM$VER      3.02.16m    06/11/2007
--------------------------------------------------------------------------------
- Pendencia 26747: Repactuação Contratual
  Ajuste no processo de repactuação contratual para a forma de calculo Correção mensal sobre saldo devedor, parcela calculada 
  sobre saldo devedor por parcelas restantes
================================================================================
CM$VER      3.02.16l    30/10/2007
--------------------------------------------------------------------------------
- Pendencia 26609: Calculo de Correção Monetária de Parcelas
  Para a forma de calculo Correção mensal sobre saldo devedor, parcela calculada 
  sobre saldo devedor por parcelas restantes, passa a considerar o numero de dias 
  do mes de competencia da cobranca ao invés de ser o mes de competencia do Indice
- Pendencia 26747: Repactuação Contratual
  Ajuste no processo de repactuação contratual para a forma de calculo Correção mensal sobre saldo devedor, parcela calculada 
  sobre saldo devedor por parcelas restantes
================================================================================
CM$VER      3.02.16k    26/10/2007
--------------------------------------------------------------------------------
- Ajuste no processo de amortização para a forma de cálculo Correção mensal sobre 
  saldo devedor, parcela calculada sobre saldo devedor por parcelas restantes.
================================================================================
CM$VER      3.02.16j    23/10/2007
--------------------------------------------------------------------------------
- Ajuste no processo de repactuação de contrato
================================================================================
CM$VER      3.02.16i    15/10/2007
--------------------------------------------------------------------------------
- Pendencia 26618
  Cobrança de Residuos: ajuste nos valores de cobrança de residuos
  Conciliação: Ajuste na data de baixa de pagamento
================================================================================
CM$VER      3.02.16h    10/10/2007
--------------------------------------------------------------------------------
Pendencia 26485: Repactuação
   Implementação de nova forma de cálculo: Correção mensal sobre saldo devedor,
   parcela calculada sobre saldo devedor por parcelas restantes.
================================================================================
CM$VER      3.02.16g    04/10/2007
--------------------------------------------------------------------------------
Pendencia 26485: 
   Implementação de nova forma de cálculo: Correção mensal sobre saldo devedor,
   parcela calculada sobre saldo devedor por parcelas restantes
================================================================================
CM$VER      3.02.16f    18/09/2007
--------------------------------------------------------------------------------
- Recompilção do módulo devido alteração sofrida na CMImobiliarioOBJ50.BPL
================================================================================
CM$VER      3.02.16e    30/08/2007
--------------------------------------------------------------------------------
Configuração de Relatórios
  Pendência: 26239 - Disponibilização de relatórios em 3 camadas para parametrização
                     de layout pelo usuário.
================================================================================
CM$VER      3.02.16d    06/08/2007
--------------------------------------------------------------------------------
- Lançamentos / Recálculo de Parcelas em Aberto
  Pendencia 25985: Reformulação estrutural do processo em função de compatibilidade
  com o processo de atualização diária e cálculo proporcional
================================================================================
CM$VER      3.02.16c    01/08/2007
--------------------------------------------------------------------------------
Lançamentos / Recálculo de Parcelas em Aberto
   Pendencia 26009
     Quando a fundação trabalha com atualização diária,  o processo permite recálculo 
     somente com data superior ao último fechamento
================================================================================
CM$VER      3.02.16b    30/07/2007
--------------------------------------------------------------------------------
Lançamentos / Repactuação Contratual
  Pendencia 25979: 
     Quando a condição de pagamento for repactuada para forma de cálculo 
     "FIXA - Sem juros e sem correção", desconsidera os valores de juros e correção 
     monetária para evitar cálculo equivocado da amortização da parcela
Cadastros / Propostas e Contratos de Alienação
  Pendencia 25139:
  Não permite gravar Forma de Cobrança desativada
================================================================================
CM$VER      3.02.16a    09/07/2007
--------------------------------------------------------------------------------
Cadastro de Proposta de Alienação
  Pendência: 25716 - Correção na busca de contratos por imóvel para não permitir alterar
                     contratos encerrados.
================================================================================
CM$VER      3.02.16     25/06/2007
--------------------------------------------------------------------------------
Extrato de Contrato
  Pendência: 25663 - Acerto na demonstração do valor atualizado quando documento
                     possui baixa.
Lançamentos / Repactuação contratual
  Pendencia: 25486 - Ajuste na tela para definir como padrão a data de inicio da nova
                     condição de pagamento a mesma data informada para a repactuação.
Lançamentos / Integração das Parcelas
  Pendencia: 25476 - Ajuste no processo de contabilização de juros para Antecipação de
                     Parcelas quando a forma de cálculo se refere a SAC.
Relatório de Imóveis Alienados
  Pendência: 25162 - Ajuste de espaçamento do relatório e inclusão de totalizadores.
Cadastros e Lançamentos
  Pendência: 25139 - Implementação de filtro para exibir apenas as formas de pagamento
                     ativas.
Conciliação / Abonos
  Pendência: 22462 - Alteração no processo de abonos permitindo abono parcial de
                     valores inadimplentes.
Previsões Diárias
  Pendência: 22056 - Melhoria de performance passando a registrar a data do último
                     fechamento na tabela de parâmentros do sistema.
================================================================================
CM$VER      3.02.15e    25/06/2007
--------------------------------------------------------------------------------
- Pendencia 25666: Relatórios de inadimplencia (analitico e sintetico)
  Passa a considerar para o valor da prestacao também os valores dos alteradores
  lançados nos documentos (Prestação = Valor Nominal + Alteradores)
================================================================================
CM$VER      3.02.15d    21/06/2007
--------------------------------------------------------------------------------
- Pendencia 25663: Extrato de Contrato
  Acerto na demonstração do valor atualizado quando documento possui baixa
================================================================================
CM$VER      3.02.15c    31/05/2007
--------------------------------------------------------------------------------
- Pendencia 25486: Lançamentos / Repactuação contratual
  Ajuste na tela para definir como padrão a data de inicio da nova condição de pagamento
  a mesma data informada para a repactuação.
================================================================================
CM$VER      3.02.15b    29/05/2007
--------------------------------------------------------------------------------
- Pendencia 25476: Lançamentos / Integração das Parcelas
  Ajuste no processo de contabilização de juros para Antecipação de Parcelas quando
  a forma de cálculo se refere a SAC.
================================================================================
CM$VER      3.02.15a    25/05/2007
--------------------------------------------------------------------------------
- Pendencia 25438:
  Ajuste no processo de gravação do valor nominal da parcela para a forma de cálculo
  SAC - Corrige Saldo Dev. anual, Calcula Juros sobre a Parcela, recalculo anual da Parcela
================================================================================
CM$VER      3.02.15     02/04/2007
--------------------------------------------------------------------------------
- Liberação do padrão 15
- Pendencia 21692: Cobrança de inadimplência: Gerar documento de cobrança com os
  valores de atualização de inadimplencia juntamente com a diferencoa entre o
  valor a receber e valor recebido
- Pendencia 21464: Criação do Relatório de Movimentação Contábil
- Pendencia 24964: Ajuste na Cobrança de resíduos para as formas de cálculo:
  PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção anual da Parcela
  SAC - Calcula Juros e Correção mensal sobre o Saldo Devedor
================================================================================
CM$VER      3.02.14d    25/05/2007
--------------------------------------------------------------------------------
- Pendencia 25438:
  Ajuste no processo de gravação do valor nominal da parcela para a forma de cálculo
  SAC - Corrige Saldo Dev. anual, Calcula Juros sobre a Parcela, recalculo anual da Parcela
================================================================================
CM$VER      3.02.14c    02/04/2007
--------------------------------------------------------------------------------
- Pendencia 24964: Ajuste na Cobrança de resíduos para as formas de cálculo:
  PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção anual da Parcela
  SAC - Calcula Juros e Correção mensal sobre o Saldo Devedor
================================================================================
CM$VER      3.02.14b    12/03/2007
--------------------------------------------------------------------------------
Extrato Contratual
 - Permitir a visualização de lançamento de Ajuste de Saldo Devedor.
================================================================================
CM$VER      3.02.14a    07/03/2007
--------------------------------------------------------------------------------
- Acerto no processo de geração de parcelas quando condicao de pagamento termina
   antes do ultimo dia do mes, ocasionando erro na geracao da ultima parcela.
- Inclusão da data de lancamento no processo de integracao de parcelas (requer autorizacao)
================================================================================
CM$VER      3.02.14     16/02/2007
--------------------------------------------------------------------------------
- Pendencia 24000: Reestruturação interna dos módulos do Imobiliário
- Pendencia 23040: Lançamento / Repactuação Contratual: permitir a edição do campo
                            de data inicial da condição de pagamento quando esta for diferente
                            da data da repactuação
- Pendencia 18795: Cobrança de caução
                  Implementação da possibilidade de efetuar cobrança de condições de pagamento
   do tipo caução no ato da proposta
================================================================================
CM$VER      3.02.13j    25/05/2007
--------------------------------------------------------------------------------
- Pendencia 25438:
  Ajuste no processo de gravação do valor nominal da parcela para a forma de cálculo
  SAC - Corrige Saldo Dev. anual, Calcula Juros sobre a Parcela, recalculo anual da Parcela
================================================================================
CM$VER      3.02.13i    02/04/2007
--------------------------------------------------------------------------------
- Pendencia 24964: Ajuste na Cobrança de resíduos para as formas de cálculo:
  PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção anual da Parcela
  SAC - Calcula Juros e Correção mensal sobre o Saldo Devedor
================================================================================
CM$VER      3.02.13h    06/03/2007
--------------------------------------------------------------------------------
- Acerto no processo de geração de parcelas quando condicao de pagamento termina
   antes do ultimo dia do mes, ocasionando erro na geracao da ultima parcela.
- Inclusão da data de lancamento no processo de integracao de parcelas (requer autorizacao)
================================================================================
CM$VER      3.02.13g    08/02/2007
--------------------------------------------------------------------------------
Pendência 24328 - Conciliação
    Ajuste do processo de atualização dos alteradores no Contas a Receber de
forma automática após a execução do abono de inadimplência.
================================================================================
CM$VER      3.02.13f    07/02/2007
--------------------------------------------------------------------------------
Pendência 24443 - Geração de Contratos
     - Correção na busca da Conta Contábil de baixa, quando não for utilizada a estrutura
 de contabilização da parcela em "Conta de Passagem"
Pendência 24444 - Geração de Parcelas
     - Correção da fórmula de Cálculo 17, referente ao valor de juros quando a parcela
anterior já estiver integrada
================================================================================
CM$VER      3.02.13e    06/02/2007
--------------------------------------------------------------------------------
Pendência 24328 - Conciliação
    Atualização dos alteradores no Contas a Receber de forma automática após a
execução do abono de inadimplência.
================================================================================
CM$VER      3.02.13d    31/01/2007
--------------------------------------------------------------------------------
Reestruturação interna de bibliotecas para o padrão 5.10.14
================================================================================
CM$VER      3.02.13c    16/01/2007
--------------------------------------------------------------------------------
- Pendência 24188 - Ajuste da tela de lançamento de Acréscimos e Descontos, permitindo
o lançamento de alterador negativo de Correção Monetária
================================================================================
CM$VER      3.02.13b    29/12/2006
--------------------------------------------------------------------------------
- Pendencia 21542: Acerto nso relatórios de Indaimplência e Provisão de Perdas 
      para retirar a diferença de centavos em relação ao extrato contratual
================================================================================
CM$VER      3.02.13a    19/12/2006
--------------------------------------------------------------------------------
- Pendencia 24019: Acerto no relatório de Extrato Contrato (Gerencial)
================================================================================
CM$VER      3.02.13     03/12/2006
--------------------------------------------------------------------------------
Cobrança / Abono de resíduos
  Pend.: 22597 - Mudança na exibição dos botões de "marcar todos" e "desmarcar
                 todos".
Cadastro de Propostas
  Pend.: 23906 - Implementação de nova formula de cálculo 17 - SAC - Calcula Juros
                        sobre a Parcela, com geração de resíduo
================================================================================
CM$VER      3.02.12g    07/02/2007
--------------------------------------------------------------------------------
Pendência 24443 - Geração de Contratos
     - Correção na busca da Conta Contábil de baixa, quando não for utilizada a estrutura
 de contabilização da parcela em "Conta de Passagem"
================================================================================
CM$VER      3.02.12f    15/01/2007
--------------------------------------------------------------------------------
- Pendência 24188 - Ajuste da tela de lançamento de Acréscimos e Descontos, permitindo
o lançamento de alterador negativo de Correção Monetária.
================================================================================
CM$VER      3.02.12e    29/12/2006
--------------------------------------------------------------------------------
- Pendencia 21542: Acerto nso relatórios de Indaimplência e Provisão de Perdas 
      para retirar a diferença de centavos em relação ao extrato contratual
================================================================================
CM$VER      3.02.12d    28/11/2006
--------------------------------------------------------------------------------
- Acerto no relatório de extrato, pois, em alguns casos,  estava tendo diferença de 
  valores com o Relatório de Inadimplência analítico / sintético
================================================================================
CM$VER      3.02.12c    24/11/2006
--------------------------------------------------------------------------------
- Pendencia 23820: Recálculo de Documento:
        Implementação de alteração da data programada do documento
================================================================================
CM$VER      3.02.12b    23/11/2006
--------------------------------------------------------------------------------
- Acerto na tela de Cobrança de Residuos
================================================================================
CM$VER      3.02.12a    30/10/2006
--------------------------------------------------------------------------------
- Pendencia 23592: Criação de parâmetros específicos para parcelas, juros e correção para
  contratos de Acordo
================================================================================
CM$VER      3.02.12     28/09/2006
--------------------------------------------------------------------------------
Liberação do padrão 12.
================================================================================
CM$VER      3.02.11i    23/11/2006
--------------------------------------------------------------------------------
- Acerto na tela de Cobrança de Residuos
================================================================================
CM$VER      3.02.11h    09/11/2006
--------------------------------------------------------------------------------
- Acerto no Calculo de Multa através de regra nos processos de Repactuação e
  Conciliação de Documentos
================================================================================
CM$VER      3.02.11g    27/10/2006
--------------------------------------------------------------------------------
- Pendencia 23592: Criação de parâmetros específicos para parcelas, juros e correção para
  contratos de Acordo e utilização nas telas que fazem integração
================================================================================
CM$VER      3.02.11f    26/09/2006
--------------------------------------------------------------------------------
- Pendencia 23373: Acerto no processo de atualização de resíduos
================================================================================
CM$VER      3.02.11e    26/09/2006
--------------------------------------------------------------------------------
- Pendencia 23393:
     Implementação da fórmula de cálculo
     SAC - Calcula Juros e Correção mensal sobre o Saldo Devedor
================================================================================
CM$VER      3.02.11d    14/09/2006
--------------------------------------------------------------------------------
- Acerto no montaselect que traz a proposta na geração de contrato
================================================================================
CM$VER      3.02.11c    11/09/2006
--------------------------------------------------------------------------------
Pendência 23281 - Alteração do periodo de reajuste do contrato, passando a considerar a
                            data do vencimento da primeira parcela como data base de calculo
                            para a fórmula PRICE - Corrige Saldo Dev. mensal, Sem Recalculo,
                            com Correção anual da Parcela.
================================================================================
CM$VER      3.02.11b    11/09/2006
--------------------------------------------------------------------------------
- Pendencia 23163: Acerto no processo de provisão de perdas - Alienação
- Pendencia 23164: Acerto no relatório de estoque financeiro
================================================================================
CM$VER      3.02.11a    01/09/2006
--------------------------------------------------------------------------------
Compilação para contemplar as pendencias abaixo liberadas no padrão 10
  - Pendencia 23162: Acerto no Extrato Contratual com referencia a repactuação (saldos)
  - Pendencia 23165: Acerto na rotina de Atualiação diária (Integra Atualizações Financeiro) 
                               para ajuste de alteradores lançados indevidamente
  - Pendencia 23166: Acerto nao rotina de atualização diária para acerto no processo de atualização 
                               de documentos
================================================================================
CM$VER      3.02.11     16/08/2006
--------------------------------------------------------------------------------
Parâmetros do sistema
   Pend.: 22698 - Criar parâmetro de sistema na guia "Cobrança / Inadimplência" para
                          indicar se no processo de atualização de inadimplência será utilizado
                          apenas o indice do ultimo mês anterior, ou de todos os meses do
                          período.
Encerramento Contratual
   Pend.: 9730 - Implementação do encerramento de contratos com saldo 0 (zero).
Consulta Parcela
   Pend.: 21095 - Implementação da tela de Consulta de Parcelas.
Geração de Contrato de Venda
   Pend.: 22605 -  Correção da busca do valor contábil quando a baixa efetuada
                          no mesmo dia da aquisição.
================================================================================
CM$VER      3.02.10f    13/09/2006
--------------------------------------------------------------------------------
- Acerto na tela de Abono de Resíduos para permitir selecionar condição de pagamento 
   repactuada do contrato 000173
================================================================================
CM$VER      3.02.10e    04/09/2006
--------------------------------------------------------------------------------
- Pendencia 23163: Acerto no processo de provisão de perdas - Alienação
- Pendencia 23164: Acerto no relatório de estoque financeiro
================================================================================
CM$VER      3.02.10d    01/09/2006
--------------------------------------------------------------------------------
- Pendencia 23162: Acerto no Extrato Contratual com referencia a repactuação (saldos)
- Pendencia 23165: Acerto na rotina de Atualiação diária (Integra Atualizações Financeiro) 
                             para ajuste de alteradores lançados indevidamente
- Pendencia 23166: Acerto nao rotina de atualização diária para acerto no processo de atualização 
                             de documentos
================================================================================
CM$VER      3.02.10c    28/08/2006
--------------------------------------------------------------------------------
Geração de Parcelas
  - Pend 23173 - Correção do processo de geração de parcelas para gravação do flag
    de resíduo incorporado a parcela para a formula  3.
================================================================================
CM$VER      3.02.10b    16/08/2006
--------------------------------------------------------------------------------
- Acerto na query que mostra os itens divergentes na tela de conciliação
================================================================================
CM$VER      3.02.10a    15/08/2006
--------------------------------------------------------------------------------
Atualização Diária
   Pend.: 22814 - Considerar atualização de alteradores com valor negativo ( correção monetária negativa )
Repactuação Contratual / Conciliação de Parcelas
   Pend.: 23039 - Ajuste do processo de abono, para baixas manuais, mantendo a diferença do principal
                  para abono pela repactuação
Parâmetros do sistema
   Pend.: 22698 - Criar parâmetro de sistema na guia "Cobrança / Inadimplência" para
                          indicar se no processo de atualização de inadimplência será utilizado
                          apenas o indice do ultimo mês anterior, ou de todos os meses do
                          período.
Geração de Contrato de Venda
   Pend.: 22605 -  Correção da busca do valor contábil quando a baixa efetuada
                          no mesmo dia da aquisição.
================================================================================
CM$VER      3.02.10     13/07/2006
--------------------------------------------------------------------------------
Geração de Contrato de Venda
   Pend.: 22605 -  Correção da busca do valor contábil quando a baixa efetuada
                          no mesmo dia da aquisição.
================================================================================
CM$VER      3.02.09v    14/08/2006
--------------------------------------------------------------------------------
Geração de Contratos
  - Correção do processo de busca do contrato.
================================================================================
CM$VER      3.02.09u    10/08/2006
--------------------------------------------------------------------------------
- Pendencia 22952: Acerto na contabilização do alterador quando existe segregação
================================================================================
CM$VER      3.02.09t    21/07/2006
--------------------------------------------------------------------------------
- Acerto na rotina de atualização de residuos para contemplar somente contratos vigentes
================================================================================
CM$VER      3.02.09s    18/07/2006
--------------------------------------------------------------------------------
- Acerto no processo de antecipação de parcelas para forma de cálculo
  "PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção anual da Parcela"
  para calcular os saldos de maneira correta. O acerto promovido foi para contemplar o
  calculo do valor da amortizacao que passa a ser:
  Prestacao Nominal - Juros - Correcao
================================================================================
CM$VER      3.02.09r    13/07/2006
--------------------------------------------------------------------------------
- Acerto no processo de antecipação de parcelas para forma de cálculo
  "PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção anual da Parcela"
  para calcular os saldos de maneira correta
================================================================================
CM$VER      3.02.09q    10/07/2006
--------------------------------------------------------------------------------
- Acerto no processo de antecipação de parcelas para forma de cálculo 
  "PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção anual da Parcela"
================================================================================
CM$VER      3.02.09p    06/07/2006
--------------------------------------------------------------------------------
- Acerto no processo de antecipação de parcelas para não calcular correção pro-rata
  entre a data de vencimento e o ultimo dia de cada mes quando a forma de calculo for
  PRICE-Corrige Saldo Dev. mensal, Sem Recálculo, com Correção anual da Parcela
================================================================================
CM$VER      3.02.09o    05/07/2006
--------------------------------------------------------------------------------
- Pendencia 22758: Acerto no relatório de Extrato para contemplar repactuação com data
                             superior a data informada para que o saldo devedor saia de forma correta
================================================================================
CM$VER      3.02.09n    27/06/2006
--------------------------------------------------------------------------------
- Ajustes no processo de anteciáção de Parcelas na Alienação
================================================================================
CM$VER      3.02.09m    20/06/2006
--------------------------------------------------------------------------------
Geração de Contrato
   Pend 22605 - Correção da busca do valor contábil quando a baixa efetuada no mesmo dia da aquisição
================================================================================
CM$VER      3.02.09l    16/06/2006
--------------------------------------------------------------------------------
- Acerto na query de atualização de alteradores
================================================================================
CM$VER      3.02.09k    09/06/2006
--------------------------------------------------------------------------------
- Acerto no processo de atualização diária
================================================================================
CM$VER      3.02.09j    08/06/2006
--------------------------------------------------------------------------------
- Ajuste na rotina de Atualização Diária de Alteradores quando os documentos 
  possuirem baixas e abonos
================================================================================
CM$VER      3.02.09i    06/06/2006
--------------------------------------------------------------------------------
- Ajuste na numeração da proposta/contrato quando se tratar de acordo de alienação
================================================================================
CM$VER      3.02.09h    29/05/2006
--------------------------------------------------------------------------------
Lançamento de Receitas
 - Inclusão de campo para informar o histórico complementar para o cancelamento do contas a receber.
================================================================================
CM$VER      3.02.09g    29/05/2006
--------------------------------------------------------------------------------
- Pendencia 22447: Rever o processo de antecipação para a formula 14,
                             onde o saldo deve ser corrigido pro-rata até a 
                             data da antecipação, e o juros cobrado na parcela 
                             aplicado pro-rata até a data da antecipação. 
                             Caso seja antecipada mais de uma parcela para o mesmo dia, 
                             o juros será aplicado apenas na primeira parcela. 
                             O valor da parcela deverá ser a amortização acrescida 
                             do juros calculado ( quando houver )
================================================================================
CM$VER      3.02.09f    26/05/2006
--------------------------------------------------------------------------------
- Ajuste na tela de Abono de Resíduos
================================================================================
CM$VER      3.02.09e    26/05/2006
--------------------------------------------------------------------------------
Compilação para contemplar atualizações da versao 3.02.08z
================================================================================
CM$VER      3.02.09d    23/05/2006
--------------------------------------------------------------------------------
- Recompilação para atualização
================================================================================
CM$VER      3.02.09c    22/05/2006
--------------------------------------------------------------------------------
Extrato Contratual
   - Correção do processo de busca de saldo devedor no mês após repactuação.
================================================================================
CM$VER      3.02.09b    19/05/2006
--------------------------------------------------------------------------------
- Acerto nos relatório de Extrato contratual e listagem de contratos, utilizando os filtros 
  dos contratos de alienação para contemplar contratos de acordo de alienação
================================================================================
CM$VER      3.02.09a    17/05/2006
--------------------------------------------------------------------------------
- Pendencia 21541: Acerto no relatório de Extrato Contratual para contemplar antecipação 
                             de pagamento
- Pendencia 21418: Acerto no relatório de extrato para contemplar os resíduos que estão
                             com o campo FLGRESIDUOINCORP nulos 
Abono de Residuo 
   - Pend 22356 - Não exibia resíduo para condição de pagamento pela formula 10.
Conciliação de Parcelas
   - Pend 22357 - Permissão de abono para baixa parcial com valor pago superior ao valor 
                         apropriado.
================================================================================
CM$VER      3.02.09     29/05/2006
--------------------------------------------------------------------------------
Liberação do Padrão 5.10.09
Conciliação de Parcelas / Cobrança de Resíduo
   Pend 21092 - Adicionar botão para selecionar e desmarcar todos os itens relacionados
Integração Contábil
   Pend 20315 - Alteração do processo de integração, passando a informar a conta para 
                       antecipação de Receitas
Geração de Contratos
   Pend 21642 - Possibilidade de geração de contratos de acordo de aluguel, sem efetuar
                        a baixa do imóvel. Inclusão de filtros nos relatórios do módulo.
   Pend 21441 - Correção da atualização do valor contábil do imóvel após a depreciação
                        pro-rata até o dia anterior a venda.
Conciliação de Parcelas
   Pend 21742 - Ajuste do busca dos valores inadimplentes conforme extrato contratual
Relat. de Inadimplencia Analitico
   Pend 21741 - Correção do relatório conforme o extrato
Relat. de Inadimplencia Sintético
   Pend 21740 - Correção do relatório conforme o extrato
Conciliação de Parcelas
   Pend 21742 - Correção da rotina de Divergência de pagamento.
Conciliação
   Pend 21738 - Correção das parcelas com baixa manual conforme Extrato Contratual.
Acréscimos e Descontos
   Pend 22149 - Ao selecionar o alterador, já traz marcado para não integrar com o contábil quando estiver ligada a parametrização de operação diária e o alterador selecionado for o mesmo para atualização de inadimplencia cadastrado para o tipo de imóvel
Repactuação Contratual
   Pend 22340 - Torna não obrigatório a seleção de alteradores quando não houver
                        parcelas pendetes.
Repactuação Contratual
                     - Correção da busca da parametrização contábil, passando a verificar
                       o tipo de imóvel relacionado ao contrato ao invés da parcela
                       inadimplente.
================================================================================
CM$VER      3.02.08z    05/06/2006
--------------------------------------------------------------------------------
- Pendencia 22445: Ajuste dos filtros para contemplar acordo de Alienação
                             nos relatorios Listagem de Contrato e Folha de Alienação
                             e nos processos de Geração e Integração de Parcelas
- Pendencia 22452: No processo de atualização de Alteradores, passar a verificar também
                             os abonos concedidos, de forma a manter o saldo do documento
                             conforme o valor existente no alienação
- Pendencia 22444: Geração de contratos: correção no processo de atualização do status
                             do imóvel quando do contrato com baixa parcial do imóvel
- Acerto no relatório de extrato contratual
- Ajuste na tela de Abono de Residuos
- Ajuste na numeração da proposta/contrato quando se tratar de acordo de alienação
================================================================================
CM$VER      3.02.08y    22/05/2006
--------------------------------------------------------------------------------
Extrato Contratual
   - Correção da busca do saldo devedor
================================================================================
CM$VER      3.02.08x    17/05/2006
--------------------------------------------------------------------------------
Abono de Residuo 
   - Pend 22356 - Não exibia resíduo para condição de pagamento pela formula 10.
Conciliação de Parcelas
   - Pend 22357 - Permissão de abono para baixa parcial com valor pago superior ao valor 
                         apropriado.
================================================================================
CM$VER      3.02.08v    16/05/2006
--------------------------------------------------------------------------------
Repactuação Contratual
  - Correção da busca da parametrização contábil, passando a verificar o tipo de imóvel
     relacionado ao contrato ao invés da parcela inadimplente.
================================================================================
CM$VER      3.02.08u    16/05/2006
--------------------------------------------------------------------------------
Repactuação Contratual
   - Pendência 22340: Não obrigar a seleção de alteradores quando não houver parcelas
     inadimplentes.
================================================================================
CM$VER      3.02.08t    10/05/2006
--------------------------------------------------------------------------------
- Acerto no processo de Abono: Corrigido o processo de integração contábil
================================================================================
CM$VER      3.02.08s    04/05/2006
--------------------------------------------------------------------------------
Repactuação Contratual
   - Ajuste do processo de incorporação de parcelas em atraso para liquidar através de 
alteradores e repactuar também parcelas a vencer no dia da repactuação.
================================================================================
CM$VER      3.02.08r    26/04/2006
--------------------------------------------------------------------------------
Repactuação Contratual
   - Correção do processo de busca por inadimplência igualando ao extrato contratual
   - Permitir gerar repactuação com data fora da competência informada
   - Registrar o evento da repactuação pela data informada ao invés do processamento
================================================================================
CM$VER      3.02.08q    25/04/2006
--------------------------------------------------------------------------------
- Pendencia 22149: Ao selecionar o alterador, já trazer marcado para nao integrar com o 
                             contábil quando estiver ligada a parametrização de operação diária 
                             e o alterador selecionado for o mesmo para atualização de 
                             inadimplencia cadastrado para o tipo de imóvel
- Ajuste no processo de cálculo de amortização extra para a CBS
================================================================================
CM$VER      3.02.08p    24/04/2006
--------------------------------------------------------------------------------
- Acerto no processo de Calculo de Parcelas e Saldo Devedor com Amortizacao Extra 
  para a CBS
================================================================================
CM$VER      3.02.08o    20/04/2006
--------------------------------------------------------------------------------
- Acerto no processo de Calculo de Parcelas e Saldo Devedor com Amortizacao Extra
  para a CBS
================================================================================
CM$VER      3.02.08n    20/04/2006
--------------------------------------------------------------------------------
- Acerto no processo de Calculo de Saldo Devedor
================================================================================
CM$VER      3.02.08m    19/04/2005
--------------------------------------------------------------------------------
- Acerto no processo de Calculo de Parcelas e Saldo Devedor com Amortizacao Extra 
  para a CBS
================================================================================
CM$VER      3.02.08l    17/04/2006
--------------------------------------------------------------------------------
- Acerto no processo de abono de encargos
================================================================================
CM$VER      3.02.08k    12/04/2006
--------------------------------------------------------------------------------
- Correção da data final de atualização dos documentos (CRelExtrato.pas).
================================================================================
CM$VER      3.02.08j    08/04/2006
--------------------------------------------------------------------------------
Extrato Contratual
   - Correção da consulta quando gerado no formato Gerencial
================================================================================
CM$VER      3.02.08i    07/04/2006
--------------------------------------------------------------------------------
- Acerto na geração de parcelas quando ocorre amortização extra para o cálculo 
  PRICE - Corrige Saldo devedor mensal, sem recálculo, com correção anual da parcela
================================================================================
CM$VER      3.02.08h    03/04/2006
--------------------------------------------------------------------------------
- Pendencias 21739 e 21417: Acerto no processo de abono de parcelas com baixa manual
================================================================================
CM$VER      3.02.08g    23/03/2006
--------------------------------------------------------------------------------
Relat. Extrato Contratual
   - Correção das parcelas exibidas quando ocorridos abonos parciais e totais na mesma parcela
Lançamento de Alteradores
   Pend. 21819 - Bloqueio do campo de observação para 60 caracteres
================================================================================
CM$VER      3.02.08f    15/03/2006
--------------------------------------------------------------------------------
Conciliação
   - Implementação do processo de simulação de atualização diária
   - Correção dos valores conforme extrato contratual
   - Inclusão da possibilidade de exibir também as parcelas que não foram pagas
================================================================================
CM$VER      3.02.08e    14/03/2006
--------------------------------------------------------------------------------
Amortização Extra
   Pend 21641 - Ajuste do processo de cálculo de amortização para Fórmula 14
================================================================================
CM$VER      3.02.08d    10/03/2006
--------------------------------------------------------------------------------
Desfazer Geração do Contrato
   - Correção de erro ao excluir o contrato devido a existência de registros de atualização
     diária das parcelas
================================================================================
CM$VER      3.02.08c    06/03/2006
--------------------------------------------------------------------------------
Integração Financeira / Contábil
  - Utilização dos métodos em 3 camadas com segregação de recursos.
================================================================================
CM$VER      3.02.08a    11/02/2006
--------------------------------------------------------------------------------
Pend 21540 - Relat. Provisão de Perdas
    Exclusão de contratos com saldo zero.
Pend 21425 - Extrato Contratual
    Exclusão de valores de resíduo já abonado.
================================================================================
CM$VER      3.02.08     23/01/2006
--------------------------------------------------------------------------------
- Liberação de versão no padrão 8
Geração de Parcelas
  - Correção da fórmula de calculo 14 buscando o indice de n meses anteriores.
  
================================================================================
CM$VER      3.02.07r    02/01/2006
--------------------------------------------------------------------------------
- Ajuste na performance da query do Extrato Contratual
================================================================================
CM$VER      3.02.07q    29/12/2005
--------------------------------------------------------------------------------
Geração de Parcela
   - Ajuste da formula de Calculo 14 para contabilização pro-rata da atualização do contrato
     no último dia do mês.
Geração de Contratos
   - Correção da busca do valor contábil depreciado pro-rata no dia anterior à venda do
     imóvel.
================================================================================
CM$VER      3.02.07p    23/12/2005
--------------------------------------------------------------------------------
- Ajuste no Extrato Contratual
================================================================================
CM$VER      3.02.07o    23/12/2005
--------------------------------------------------------------------------------
- Pendencia 21099: Acerto no extrato contratual
- Pendencia 21107: Gravaçào da Data Limite quando gera parcela na cobrança de residuo
- Pendencia 21106: Correção na busca do valor contábil
- Acerto na rotina de Conciliação de Parcelas para considerar alteradores
================================================================================
CM$VER      3.02.07n    21/12/2005
--------------------------------------------------------------------------------
Repactuação Contratual
  - Ajuste do processo de contabilização da baixa do documento incorporado ao saldo
    devedor.
================================================================================
CM$VER      3.02.07m    19/12/2005
--------------------------------------------------------------------------------
- Pendencia 19928: Implementação do relatório de Estoque Financeiro
================================================================================
CM$VER      3.02.07l    13/12/2005
--------------------------------------------------------------------------------
Cobrança / Abono de Resíduos
   - Ajuste do processo para considerar valores de resíduo negativos
Atualização Diária
   - Ajuste do processo de atualização de resíduo, passando a considerar residuo e atualização
     negativa.
================================================================================
CM$VER      3.02.07k    05/12/2005
--------------------------------------------------------------------------------
- Pendencia 19915: Criação de parâmetros para identificar o tipo de operação de abono de JCM
                             Ajuste na tela de Conciliação para respeitar esses parâmetros quando indicados
================================================================================
CM$VER      3.02.07h    22/11/2005
--------------------------------------------------------------------------------
- Pendencia 19685: Acerto nos relatorios de inadimplencia analitico e sintetico para fechar com os valores do extrato contratual
================================================================================
CM$VER      3.02.07g    21/11/2005
--------------------------------------------------------------------------------
- Conciliacao de parcelas - Busca de data de pagamento efetiva ao inves da data de lancamento contabil
- Pendencia 20628: Rel. de Imoveis alienados - Correcao do valor de alienacao parcial de imovel - Bem instalacao
- Atualizacao Diaria - Correcao do processo passando a verificar a data de float para estorno de valor indevido
================================================================================
CM$VER      3.02.07f    14/11/2005
--------------------------------------------------------------------------------
- Pendencia 20265: Ajuste no processo de Calculo
================================================================================
CM$VER      3.02.07d    04/11/2005
--------------------------------------------------------------------------------
- Correção do valor nominal contabilizado no processo de antecipação de parcelas
================================================================================
CM$VER      3.02.07c    03/11/2005
--------------------------------------------------------------------------------
- Correção do Extrato contratual, referente ao item de Prestações Vencidas no
  Mês e valor acumulado do resíduo.
================================================================================
CM$VER      3.02.07b    03/11/2005
--------------------------------------------------------------------------------
- Pendência 19877: Verificação e aviso quando as parcelas anteriores não tiverem sido integradas
- Pendência 19883: Implementação da forma de fiança e fiadores no contrato de locação
- Pendência 19876: Não permitir o cadastro de alienação para imóveis sem segmentos Patro e Construção
- Pendência 20265: Implementação de nova fórmula de cálculo: PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção anual da Parcela
- Pendência 20476: Implementação na rotina de associação de documentos para permitir associar documentos independentemente se forem ou não do AdminImob
- Pendência 20478: Criação de parâmetro para identificar se a data programada do documento será pela data limite ou pela data de vencimento.
                   No processo de integração respeitar esse parâmetro
================================================================================
CM$VER      3.02.07a    11/10/2005
--------------------------------------------------------------------------------
Geração de Parcelas
  - Implementação da fórmula 14 - PRICE - Corrige Saldo Dev. mensal, Sem Recalculo,
    com Correção anual da Parcela
================================================================================
CM$VER      3.02.07     05/09/2005
--------------------------------------------------------------------------------
Extrato de Contratos
  - Inclusão do campo com o código de cada documento
  - Compatibilização do formato gerencial com o operacional contábil
Atualização Diária
  - Alteração do processo, passando a atualizar também os valores baixados manualmente
    e valores pagos a maior.
Pendência 19634
   Cadastro de Contratos
   - Não permite a edição de contratos já encerrados.
Geração de Contratos
   - Correção do lançamento contábil de baixa do imóvel.
================================================================================
CM$VER      3.02.03b    16/08/2005
--------------------------------------------------------------------------------
Atualização Diária
   - Inclusão da atualização por período ao invés de uma data específica
   - Implementação da atualização diária de juros e correção da alienação
================================================================================
CM$VER      3.02.03a    05/08/2005
--------------------------------------------------------------------------------
- Pendencia 19719:
  Acerto nos cadastros de parametrização de Receitas/Despesas/Operações 
  para que também possa ser informado o Imovel Mestre.
  Acerto nas rotinas de busca dessa parametrização para integração
================================================================================
CM$VER      3.02.03     07/06/2005
--------------------------------------------------------------------------------
Liberação do Padrão 5.10.06
Recálculo de Documentos
  - Ajuste do recálculo do primeiro ciclo quando da baixa parcial, permitindo o
     recálculo no mesmo dia do vencimento
Extrato de Contratos
  - Ajuste do processo de correção de inadimplência, ignorando os alteradores lançados
     via processamento contábil diário.
================================================================================
CM$VER      3.02.02e    28/04/2005
--------------------------------------------------------------------------------
Relatório - Extrato de Contratos
  - Exclusão dos alteradores de Multa, Juros e Correção calculados pelo processo
    diário, evitando duplicidade de informação.            
================================================================================
CM$VER      3.02.02d    20/04/2005
--------------------------------------------------------------------------------
Relatório - Inadimplencia Analítico
  - Correção da quebra de grupo do relatório
================================================================================
CM$VER      3.02.02b    12/04/2005
--------------------------------------------------------------------------------
Repactuação Contratual
  - Implementada a data da repactuação diferenciada do início da repactuação
Associação de documentos do Adminimob
  - Exlcusão da possibilidade de associação de parcelas projetadas.
================================================================================
CM$VER      3.02.02a    06/04/2005
--------------------------------------------------------------------------------
Correção de Documentos
  - Ajuste de erro ao passar o CODDOCUMENTO para a função de calculo da multa
    por regra.
================================================================================
CM$VER      3.02.02     04/04/2005
--------------------------------------------------------------------------------
Recálculo de Documentos em Aberto
  - Implementação do uso de Regra de Negócios para o Cálculo da Multa por 
    inadimplência
Parâmetros do Sistema
  - Implementação da referência a regra de calculo para multa por inadimplência
================================================================================
CM$VER      3.02.01a    21/03/2005
--------------------------------------------------------------------------------
Cobrança de Resíduo
  - Implementada a opção de abono do residuo.
================================================================================
CM$VER      3.02.01     19/03/2005
--------------------------------------------------------------------------------
Repactuação Contratual
  - Implementada a possibilidade de lançamento de Operações contábeis para 
    redução ou aumento do Saldo Devedor do Contrato
Cadastro de Tipos de Receitas e Operações
  - Implementado o campo com a informação de Acréscimo ou Decréscimo para o   
    cadastro de Operações
Parâmetro do Sistema
  - Descontinuado o campo de Operação de Perda em Alienação
  - Implementado os campos de parametrização das Operações Diárias
Cadastro de Parâmetros Contábeis de Operações
  - Implementada a tela para parametrização das operações diária e de alteração
    do Saldo devedor na Repactuação
================================================================================
CM$VER      3.02.00i    18/03/2005
--------------------------------------------------------------------------------
Calculo do Fator Acumulado
  - Alterado para não utilizar o método pelo Fator Absoluto.
================================================================================
CM$VER      3.02.00h    15/03/2005
--------------------------------------------------------------------------------
Relatórios - Extrato Contratual
   - Ajuste do quadro de resumo considerando a separação das inadimplências com
     base na data limite informada na tela de parâmetros, e não da data do
     sistema.
================================================================================
CM$VER      3.02.00e    08/03/2005
--------------------------------------------------------------------------------
Utilitários - Associação de documentos do Adminimob
   - Implementação da associação pelos imóveis relacionados ao contrato
================================================================================
CM$VER      3.02.00d    07/03/2005
--------------------------------------------------------------------------------
Repactuação Contratual
   - Ajuste do processo, permitindo descontos antes do início da vigência da
     condição repactuada
================================================================================
CM$VER      3.02.00c    02/03/2005
--------------------------------------------------------------------------------
Utilitários - Associação de documentos do Adminimob
  - Implementação de tela para associação de documentos de Alienação lançados
    pelo Adminimob
================================================================================
CM$VER      3.02.00b    02/03/2005
--------------------------------------------------------------------------------
Cadastro de Contratos
  - Alteração da guia Multa/Juros, desobrigando a informação da correção
================================================================================
CM$VER      3.02.00     04/02/2005
--------------------------------------------------------------------------------
Cadastro de Contratos
  - Ajuste da busca do valor contábil conforme novo padrão do CAF
Geração de Contratos
  - Ajuste do processo de baixa do imóvel conforme novo padrão do CAF
================================================================================
CM$VER      3.01.08a    24/01/2005
--------------------------------------------------------------------------------
Geração de Parcelas
  - Ajuste no calculo da correção monetária para parcelas semestrais
================================================================================
CM$VER      3.01.08     15/12/2004
--------------------------------------------------------------------------------
Cadastros de Contratos
  - Aumento no Nr. de casas decimais da taxa de juros do financiamento
Acréscimos e Descontos
  - Inclusão da informação de Observações
Carta de Reajuste
  - Implementação do processo de desenho e emissão de cartas de reajuste
Relatórios
  - Inadimplência Analítico - Inclusão do filtro por Administradora,
    inclusão do detalhamento de multa, juros e correção por atraso.
  - Inadimplêmcoa Sintético - Inclusão do filtro por Administradora
  - Extrato de Contratos - Inclusão de resumo por condição de pagamento
================================================================================
CM$VER      3.01.07     17/08/2004
--------------------------------------------------------------------------------
Parâmetros do Sistema
  - Inclusão do Parâmetro indicador de impressão do logotipo em relatórios
Conciliação
  - Permissão de abonos de Multa, Juros ou Correção para baixas parciais
Relatórios
  - Listagem de contratos - Inclusão de campo e filtro pelo Status do contrato
================================================================================
CM$VER      3.01.06c    27/05/2004
--------------------------------------------------------------------------------
Extrato de Alienação
  - Correção do calculo do saldo devedor após antecipação de todas as parcelas restantes 
================================================================================
CM$VER      3.01.06a    14/05/2004
--------------------------------------------------------------------------------
Conciliação
  - Implementação da busca da data de baixa do documento a partir do controle
    financeiro, quando o documento foi classificado como Não Indentificado
================================================================================
CM$VER      3.01.06     14/04/2004
--------------------------------------------------------------------------------
Cadastro de Propostas e Contratos
  - Implementação de possibilidade de informar condições de correção por atraso
    diferentes por período
  - Bloqueio de alienação para imóveis inativos e Penhorados
  - Alteração da fórmula SAC com juros sobre a parcela, corrigindo o saldo Devedor
    anualmente
  - Implementação da fórmula SAC com juros sobre o Saldo Devedor, com correção anual
    do Saldo Devedor e Recalculo anual das parcelas.
Inclusão de Telas
  - Cadastro de Responsáveis
  - Cadastro de Imóveis
Conciliação de Parcelas
  - Calculo de Correções baseada nos novos parâmetros criados no cadastro de contratos
  - Inclusão do valor de juros por atraso sobre o valor divergente apurado e corrigido.
Baixa Manual
  - Calculo de Correções baseada nos novos parâmetros criados no cadastro de contratos
  - Bloqueio de exclusão de lançamento quando a divergencia da parcela tiver sido conciliada
    através de uma nova cobrança.
Recalculo de Parcelas
  - Calculo de Correções baseada nos novos parâmetros criados no cadastro de contratos
  - Correção do valor base de calculo para parcelas com baixa parcial, no calculo referente 
    ao primeiro período, ou seja, anterior a data da baixa. 
Antecipação de Parcelas
  - Bloqueio de antecipação quando existir parcelas integradas após a data informada
Repactuação de Contratos
  - Bloqueio de repactuação quando existir parcelas integradas após a data informada
Amortização Extra
  - Bloqueio de amortização quando existir parcelas integradas após a data informada
================================================================================
CM$VER      3.01.05     23/12/2003
--------------------------------------------------------------------------------
Padronização da Barra de Progresso dos processos
Recalculo de Documentos
  - Alteração do processo, exibindo os alteradores e baixas já efetuadas, e recalculando 
os valores de correção a partir da ultima baixa.
Fórmulas de Calculo
  - Ajuste no calculo SAC no caso de amortização extra no mês de término do ciclo.
Geração de Contratos
  - Ajuste do processo, evitando a baixa de imóveis sem bens ativos.
================================================================================
CM$VER      3.01.04e    01/12/2003
--------------------------------------------------------------------------------
Extrato de Alienação
  - Inclusão do CPMF descontado pela administradora
Cadastro de Contratos
  - Alteração na guia de Multa/Juros, do campo de Tolerância e Dias de Repasse, considerando
    a informação de Dias uteis ou não, para ambos os casos.
================================================================================
CM$VER      3.01.04d    24/11/2003
--------------------------------------------------------------------------------
Conciliação
  - Correção do processo, considerando os valores importados
Conciliação
  - Implementação de Fitros por Administradora
  - Bloqueio de Acesso aos itens de Recalculo e Exclusão de Abonos
Estorno de Parcelas
  - Implementação de Fitros por Administradora
================================================================================
CM$VER      3.01.04     28/10/2003
--------------------------------------------------------------------------------
Amortização Extra
  - Correção do valor amortizado para as parcelas após o processo. Formula SAC
Relatório - Extrato de Contratos
  - Inclusão do valor do Resíduo final corrigido
Relatório - Folha de Alienação
  - Inclusão do número do documento
================================================================================
CM$VER      3.01.03d    05/09/2003
--------------------------------------------------------------------------------
Conciliação
  - No processo de cobrança das divergências, o documento pago com baixa parcial será
    baixado e o saldo transferido para o novo documento
================================================================================
CM$VER      3.01.03b    14/08/2003
--------------------------------------------------------------------------------
Relatório - Folha de Alienação
  - Correção de registro sendo exibido em duplicidade
================================================================================
CM$VER      3.01.03a    13/08/2003
--------------------------------------------------------------------------------
Extrato de Alienação
  - Correção do valor de saldo devedor. 
================================================================================
CM$VER      3.01.03     01/08/2003
--------------------------------------------------------------------------------
Utilização da BPL: CMImobiliarioObj50.bpl
================================================================================
CM$VER      3.01.02f    29/07/2003
--------------------------------------------------------------------------------
Geração de Parcelas
  - Bloqueio de geração, quando o índice de correção não estiver cadastrado
Relatórios
  - Extrato: Correção do saldo devedor no resumo do relatório
================================================================================
CM$VER      3.01.02     27/06/2003
--------------------------------------------------------------------------------
Cadastro de Contratos
  - Inclusão da guia de Eventos
  - Possibilidade de efetuar a venda parcial de um imóvel
================================================================================
CM$VER      3.01.01b    02/06/2003
--------------------------------------------------------------------------------
Geração de Contratos
  - Correção dos lançamentos contábeis de baixa do imóvel
Relatórios
  - Implementação da Folha de Alienação
================================================================================
CM$VER      3.01.01a    28/05/2003
--------------------------------------------------------------------------------
Cadastro de Contratos
  - Inclusão do campo de Mês de Referência para uso do indice de correção 
    por atraso.
Recalculo de Documento
  - Ajuste no processo para selecionar o calculo utilizando o indice do
    mes corrente ou do mes anterior.
================================================================================
CM$VER      3.01.01     12/05/2003
--------------------------------------------------------------------------------
Versão liberada no padrão PREV
================================================================================
CM$VER      3.01.00d    17/04/2003
--------------------------------------------------------------------------------
Implementação da funcionalide de Cobrança de Resíduo não incorporado ao Saldo Devedor
================================================================================
CM$VER      3.01.00c    14/04/2003
--------------------------------------------------------------------------------
Antecipação de Parcelas
  - Ajustes no calculo de antecipação para contratos com juros cobrados na parcela
================================================================================
CM$VER      3.01.00b    27/03/2003
--------------------------------------------------------------------------------
Cadastro de Contratos
  - Exibe o valor total de venda fora das guias
  - Inclusão de botão de atalho no menu principal do sistema
Geração de Contratos
  - Baixa do imóvel da carteira para contas específicas conforme
    tipo de venda ( parcelada ou a vista )
Conciliação de Parcelas
  - Possibilidade de abono individual de Multa, Juros e Correção
  - Inclusão de opção de recalculo das divergências
  - Inclusão da opção de exclusão dos abonos efetuados
  - Inclusão de calculo de divergências sobre os valores baixados parcialmente
Relatórios
  - Extrato de Contratos - Exibição das baixas parciais
================================================================================
CM$VER      3.01.00a    17/03/2003
--------------------------------------------------------------------------------
Repactuação Contratual
  - Ajustes do cadastro da nova condição de pagamento conforme novas
    regras de calculo de alienação.
================================================================================
CM$VER      3.01.00     07/03/2003
--------------------------------------------------------------------------------
Liberação do HELP do Sistema
Cadastro de Propostas e Contratos
  - Filtro de busca por Administradora e Comprador
  - Inclusão de Seleção da Forma de Calculo na condição de Pagamento
  - Inclusão de Data de Carência da condição de pagamento
  - Inclusão de Taxa de Correção Projetada Fixa
  - Exibição da Data de Assinatura do contrato
  - Alterações de layout do Relatório de Simulação de Parcelas
  - Inclusão de informações de Saldo Atualizado e Juros da Parcela na guia de Parcelas
    e relatório
Geração de Parcelas
  - Inclusão de opção para salvar as parcelas a cada contrato, agilizando o processo
  - Inclusão para recalcular as condições de pagamento já encerradas
  - Verificação da data da proposta, ou data de assinatura, ou data de carencia para efeito
    de início do cíclo de reajuste das parcelas.
Relatórios
  - Filtro de busca por Administradora e Comprador   
  - Alteração de layout dos relatorios de Extrato e Espelho do contrato
================================================================================
CM$VER      3.00.06g    23/12/2002
--------------------------------------------------------------------------------
Cadastro de Contratos e Propostas
  - Inclusão do mês de referência do indice de correção
Repactuação Contratual
  - Inclusão do mês de referência do indice de correção
  - Inclusão do tipo de repactuação ( Comprador ou Fundação )
Implementação em 3 camadas:
  - Cadastro de Compradores
================================================================================
CM$VER      3.00.06a    10/10/2002
--------------------------------------------------------------------------------
- Baixa Manual de Parcelas
      Correção da Ordenação dos registros
================================================================================
CM$VER      3.00.06     10/10/2002
--------------------------------------------------------------------------------
Parametrização Contábil
  - Inclusão da opção de parametrização por contrato
  - Inclusão do indicador de parametrização diária
Parâmetros do Sistema
  - Inclusão de configuração dos tipos de parametrização contábil
  - Inclusão do indicador de contabilização Diária
Tipo de Receitas e Operação
  - Inclusão da forma de contabilização da Receita
Integração de Parcelas
  - Será exibido a Relação de Erros e parcelas não integradas
Conversão para 3 Camadas:
  - Parâmetros do Sistema
  - Tipo de Receita e Operação
  - Parametrização Contábil
================================================================================
CM$VER      3.00.05d    12/08/2002
--------------------------------------------------------------------------------
Calculos
  Alteração da atualização do valor divergente das parcelas pagas,
  cobrando apenas a correção monetária sobre o valor total da
  divergência até a data presente. 
Conciliação de Parcelas
  Incluido no relatório de Divergências a Correção Monetária
  calculada e o valor atualizado.
================================================================================
CM$VER      3.00.05c    18/07/2002
--------------------------------------------------------------------------------
Cadastro de Contratos
   Bloqueio de inclusão de condição de pagamento sem parcelas
Geração de Parcelas
   Correção da geração de registro de novo Saldo Inicial ao termino do período
================================================================================
CM$VER      3.00.05b    20/06/2002
--------------------------------------------------------------------------------
Implementação das funcionalidades:
  Antecipação de Parcelas
  Desfazer Antecipação de Parcelas
  Acréscimos e Descontos
  Alteradores por Tipo de Imóvel
Cadastro de Proposta
  Inclusão da Administradora do Contrato
  Inclusão de dias de repasse pela administradora
  Inclusão da opção de cobrança da Correção Monetária mensal
Parâmetros do Sistema
  Exclusão dos parâmetros CAP/CAR, que foram substituídos
  pelos Alteradores por Tipo de Imóvel
Geração de Parcelas
  Alteração do calculo da parcela incorporando a CM mensal conforme
  espeficicação no contrato ou repactuação
  Inclusão do valor da Prestação nominal e efetiva no Tab de parcelas
Relatórios
  Demonstração do valor Efetivo da prestação no Relatório de Extrato Contratual
  Demonstração do valor Efetivo e Nominal no relatório de Espelho do Contrato,
  bem como as especificações de cobrança mensal de juros e CM.
================================================================================
CM$VER      3.00.04c    17/04/2002
--------------------------------------------------------------------------------
Repactuação Contratual
  - Exclusão da tela do Menu Cadastro
  - Nova tela no Formato Wizard no menu Lançamentos
  - Incorporação das parcelas em atraso ao Saldo Devedor
  - Fusão e Desmembramento de Condições de Pagamento
  - Repactuação antes do início de cobrança das parcelas
  - Inclusão do campo de desconto para perdas na Alienação
  - Inclusão do Processo para Desfazer Repactuações
Conciliação de Parcelas
  - Liberação de abono e cobrança de Baixas Manuais
Geração de Parcelas
  - Retorno ao primeiro passo, após ter salvo as parcelas
Baixa Manual de Parcelas
  - Exclusão do Abono após uma alteração de lançamento
================================================================================
CM$VER      3.00.02     08/03/2002
--------------------------------------------------------------------------------
Alteração da forma de contabilização por Tipo de Imóvel
  - Implementação de tela de Tipo de Receita / Operações
  - Implementação de tela de Parâmetros de Receitas / Operações
Geração de Contratos
  - Registro do Nr. do Contrato no Evento do Imóvel 
  - Geração automática de todas as parcelas do contrato
  - Alteração da Geração de Contratos, integrando ao Ativo Fixo
Implementação do Processo para Desfazer a Geração do Contrato
Parâmetros do Sistema
  - Inclusão do Flag de Integração ao Ativo Fixo na tela de parâmetros do sistema.
  - Alteração do relacionamento de tipo de operação, para tipo de receita / Operação.
  - Inclusão do Tipo de Operação para Perdas na Alienação.
Cadastro de Propostas
  - Implementação da Busca de Contrato por Imóvel
  - Bloqueio para inclusão de Imóveis de Tipos Diferentes na mesma proposta
Cadastro de Repactuação
  - Implementação de consulta às parcelas em atraso e saldo devedor.
Relatórios
  - Implementação do Relatório de Listagem de Contratos
Consultas
  - Implementação de Consulta ao Plano de Contas
================================================================================
CM$VER      3.00.01b    27/12/2001
--------------------------------------------------------------------------------
Cálculo de Parcelas utilizando forma de Juros Simples
================================================================================
CM$VER      3.00.00     04/04/2001
--------------------------------------------------------------------------------
- Liberação da Versão em Delphi 5.0
================================================================================
CM$VER      2.00.00     22/09/2000
--------------------------------------------------------------------------------
- Primeira versão liberada.
end.
================================================================================
CM$ALT}













































































