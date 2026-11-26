Program BeneficioPrev;

uses
  Forms,
  UModulo in 'UModulo.pas',
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FCadMestreDet in '..\..\Cm\Forms\Source\FCadMestreDet.pas' {frmCadMestreDetalhe},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FCadMulti in '..\..\Cm\Forms\Source\FCadMulti.pas' {frmCadastroMulti},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  Fpessoa in '..\..\Cm\Forms\Source\fPessoa.pas' {frmPessoa},
  FConsultar in '..\..\Cm\Forms\Source\FConsultar.pas' {frmConsultar},
  USistema in '..\..\Cm\Forms\Source\USistema.pas',
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports: TDataModule},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {frmCadastroGridCS},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  FDesdobramentoBenef in 'FDesdobramentoBenef.pas' {frmDesdobramentoBenef},
  FLiberaBeneficioProvisorio in 'FLiberaBeneficioProvisorio.pas' {frmLiberaBeneficioProvisorio},
  FReaberturaBeneficio in 'FReaberturaBeneficio.pas' {frmReaberturaBeneficio},
  FAlteraBeneficio in 'FAlteraBeneficio.pas' {frmAlteraBeneficio},
  FIndicadorRecebedor in 'FIndicadorRecebedor.pas' {frmIndicadorRecebedor},
  FCadContribParticipante in 'FCadContribParticipante.pas' {frmCadContribParticipante},
  fCompoeValoresRI_TelaA in 'fCompoeValoresRI_TelaA.pas' {frmCompoeValoresRI_TelaA},
  FIdentificaINSS in 'FIdentificaINSS.pas' {frmIdentificaINSS},
  fCadEntrManualINSS in 'fCadEntrManualINSS.pas' {frmCadEntrManualINSS},
  FConsPartINSS in 'FConsPartINSS.pas' {FrmConsPartINSS},
  fCompoeValoresRI in 'fCompoeValoresRI.pas' {frmCompoeValoresRI},
  FConciliacao in 'FConciliacao.pas' {FrmConciliacao},
  fConsPartTratados in 'fConsPartTratados.pas' {frmConsPartTratados},
  FExtratoINSS in 'FExtratoINSS.pas' {frmExtratoINSS},
  FResultConciliacao in 'FResultConciliacao.pas' {frmResultConciliacao},
  FCancIdentificaINSS in 'FCancIdentificaINSS.pas' {frmCancIdentificaINSS},
  FCadInicioBenefExigencia in 'FCadInicioBenefExigencia.pas' {frmCadInicioBenefExigencia},
  FDesfazConcessaoBenefNOVO in 'FDesfazConcessaoBenefNOVO.pas' {frmDesfazConcessaoBeneficioNOVO},
  FCtrlInterface in '..\Relatorios\FCtrlInterface.pas' {frmCtrlinterface},
  FConsHistMovReserva in '..\Relatorios\FConsHistMovReserva.pas' {frmConsHistMovReserva},
  FConsEventosPrev in '..\Relatorios\FConsEventosPrev.pas' {frmConsEventosPrev},
  FConsProcessoBenef in '..\Relatorios\FConsProcessoBenef.pas' {frmConsProcessoBenef},
  FConsLogTotalPREV in '..\Relatorios\FConsLogTotalPREV.pas' {frmConsLogTotalPREV},
  FPRelHisFuncionalMT in '..\Relatorios\FPRelHisFuncionalMT.pas' {frmPRelHisFuncionalMT},
  FCfgEtiqueta in '..\Relatorios\FCfgEtiqueta.pas',
  FConsMemoriaCalculo in '..\Relatorios\FConsMemoriaCalculo.pas' {frmConsMemoriaCalculo},
  FConsRubricas in '..\Relatorios\FConsRubricas.pas' {frmConsRubricas},
  fEmisEtiq in '..\Relatorios\fEmisEtiq.pas' {FrmEmisEtiq},
  FParamRelDemonsSRB in '..\Relatorios\FParamRelDemonsSRB.pas' {frmParamRelDemonsSRB},
  fParamRelGerencial02 in '..\Relatorios\fParamRelGerencial02.pas' {frmParamRelGerencial02},
  fParamRelGerencial03 in '..\Relatorios\fParamRelGerencial03.pas' {frmParamRelGerencial03},
  fParamRelGerencial04 in '..\Relatorios\fParamRelGerencial04.pas' {frmParamRelGerencial04},
  FParamRelGerencial in '..\Relatorios\fParamRelGerencial.pas' {frmParamRelGerencial},
  fPRelConsolidaMovRes in '..\Relatorios\fPRelConsolidaMovRes.pas' {frmPRelConsolidaMovRes},
  FPRelExtPoup in '..\Relatorios\FPRelExtPoup.pas' {frmPRelExtPoup},
  DRelatGerencial in '..\Relatorios\dRelatGerencial.pas' {dtmRelatorioGerencial},
  dRelRetroRegional in '..\Relatorios\dRelRetroRegional.pas' {dtmRelRetroRegional},
  DRelSRB in '..\Relatorios\DRelSRB.pas' {dtmRelSRB},
  DRelatBeneficios in 'DRelatBeneficios.pas' {dtmRelatBeneficios},
  FMostraAux in '..\..\Cm\CMADMPREV\Fontes\FMostraAux.pas' {frmMostraAux},
  FEncerraConciliacao in 'FEncerraConciliacao.pas' {FrmEncerraConciliacao},
  FPedeInfAux in '..\..\Cm\CMAdmPrev\Fontes\FPedeInfAux.pas' {frmPedeInfAux},
  DAPrev in '..\..\Cm\CMAdmPrev\Fontes\DAPrev.pas' {dtmAPrev: TDataModule},
  DIntegraCAPCAR in '..\..\Cm\CMAdmPrev\Fontes\DIntegraCAPCAR.pas' {dtmIntegraCAPCAR: TDataModule},
  DAPrevIntegraBack in '..\..\Cm\CMAdmPrev\Fontes\DAPrevIntegraBack.pas' {dtmAPrevIntegraBack: TDataModule},
  dRetroativoLote in '..\..\Cm\CMAdmPrev\Fontes\dRetroativoLote.pas' {dmRetroativoLote: TDataModule},
  FSimulaBeneficio in 'FSimulaBeneficio.pas' {frmSimulaBeneficio},
  FAssocRubINSS in 'FAssocRubINSS.pas' {FrmAssocRubINSS},
  FWizardMT in '..\..\Cm\Forms\SourceMT\FWizardMT.pas' {frmWizardMT},
  FProgresso in '..\..\Cm\Forms\Source\FProgresso.pas' {frmProgresso},
  FReconstruirINSS in 'FReconstruirINSS.pas' {FrmReconstruirINSS},
  dReembolsoINSS in 'dReembolsoINSS.pas' {dtmReembolsoINSS: TDataModule},
  fTipoLiberacao in 'fTipoLiberacao.pas' {frmTipoLiberacao},
  FComparaReembDesemb in 'FComparaReembDesemb.pas' {FrmComparaReembDesemb},
  FCadMantenedora in '..\..\Cm\CMAdmPrev\Fontes\FCadMantenedora.pas' {frmCadMantenedora},
  FCadUFINSS in '..\..\Cm\CMAdmPrev\Fontes\FCadUFINSS.pas' {frmCadUFINSS},
  FConsHistPagBeneficio in '..\Relatorios\FConsHistPagBeneficio.pas' {frmConsHistPagBeneficio},
  DRelatorioHistPagBenef in '..\Relatorios\DRelatorioHistPagBenef.pas' {dtmRelatorioHistPagBenef},
  FCadProcHabINSS in 'FCadProcHabINSS.pas' {frmCadProcHabINSS},
  FConsCargoFuncao in '..\..\Cm\CMAdmPrev\Relatorios\FConsCargoFuncao.pas' {frmConsCargoFuncao},
  FReajuesteBenef in 'FReajuesteBenef.pas' {frmReajusteBenef},
  fFrameLista in 'fFrameLista.pas' {frmFrameListaBenef: TFrame},
  FParamDividaBenef in 'FParamDividaBenef.pas' {FrmParamDividaBenef},
  FEventoAposentaBenef in 'FEventoAposentaBenef.pas' {frmEventoAposentaBenef},
  FEventoAssistidoBenef in 'FEventoAssistidoBenef.pas' {frmEventoAssistidoBenef},
  FEventoAssistidoINSS in 'FEventoAssistidoINSS.pas' {frmEventoAssistidoINSS},
  FEventoMorte in 'fEventoMorte.pas' {frmEventoMorte},
  FReaberturaData in 'FReaberturaData.pas' {frmReaberturaData},
  FAlteraBeneficioLote in 'FAlteraBeneficioLote.pas' {frmAlteraBeneficioLote},
  fCadHstPercGrupo in 'fCadHstPercGrupo.pas' {frmCadHstPercGrupo};

{$R *.RES}
{$R BENEFICIOPREV_RES.RES}
begin                       

  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Concessão e Manut de Benefícios Previdenciários';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TfrmPedeInfAux, frmPedeInfAux);
  Application.CreateForm(TdtmAPrev, dtmAPrev);
  Application.CreateForm(TdtmIntegraCAPCAR, dtmIntegraCAPCAR);
  Application.CreateForm(TdtmAPrevIntegraBack, dtmAPrevIntegraBack);
  Application.CreateForm(TdmRetroativoLote, dmRetroativoLote);
  Application.CreateForm(TdtmRelatorioGerencial, dtmRelatorioGerencial);
  Application.CreateForm(TdtmRelRetroRegional, dtmRelRetroRegional);
  Application.CreateForm(TdtmRelSRB, dtmRelSRB);
  Application.CreateForm(TdtmRelatBeneficios, dtmRelatBeneficios);
  Application.CreateForm(TfrmMostraAux, frmMostraAux);
  Application.CreateForm(TfrmPedeInfAux, frmPedeInfAux);
  Application.CreateForm(TdtmAPrev, dtmAPrev);
  Application.CreateForm(TdtmIntegraCAPCAR, dtmIntegraCAPCAR);
  Application.CreateForm(TdtmAPrevIntegraBack, dtmAPrevIntegraBack);
  Application.CreateForm(TdmRetroativoLote, dmRetroativoLote);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TdtmReembolsoINSS, dtmReembolsoINSS);
  Application.CreateForm(TfrmTipoLiberacao, frmTipoLiberacao);
  Application.CreateForm(TdtmRelatorioHistPagBenef, dtmRelatorioHistPagBenef);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Benefícios Previdenciários
================================================================================
CM$VER      3.00.07b    05/06/2008
--------------------------------------------------------------------------------
- Pendência : 200950
  Solicitamos transferência de todas as funcionalidades do
  menu "Eventos" do módulo do Benefícioprev para o Cadastroprev
================================================================================
CM$VER      3.00.07b    05/06/2008
--------------------------------------------------------------------------------
- Pendência : 28044
  Tela\Opção: Manutenção | Liberação de Benefício em Exigência ou Retido
  Descrição : Acerto na atualização da DATAFINAL do beneficio
================================================================================
CM$VER      3.00.07a    08/05/2008
--------------------------------------------------------------------------------
- Pendência : 26861
  Tela\Opção: Manutenção | Liberação de Benefício em Exigência ou Retido
  Descrição : Acerto na atualização da DATAFINAL do beneficio
- Pendência : 27140
  Tela\Opção: Manutenção | Liberação de Benefício em Exigência ou Retido
  Descrição : Ajuste na pesquisa de beneficios migrados para planos em que o Titular não participou
================================================================================
CM$VER      3.00.07     14/12/2007
--------------------------------------------------------------------------------
* Liberação Padrão 5.10.18
- Pendência : 27012
  Tela\Opção: Manutenção | Liberação de Benefício em Exigência ou Retido
  Descrição : Permitir que retorne na busca pessoas que tenham beneficios retidos em planos desativados
- Pendência : 26976
  Tela/Opção: Reembolso do INSS | Extrato Individual
              Reembolso do INSS | Identificação
  Descrição : Alterações para considerar e tratar pensionistas, além de aposentados
- Resolução da Pendência nº 20881
  Tela/Opção no Sistema: -
  Descrição: Criado controle de acesso ao campo FlgFitEspecial nas telas onde o mesmo pode ser alterado.
- Resolução da Pendência nº 25871
  Tela/Opção no Sistema: Principal
  Descrição: Retirar menus sobre extrato de desligamento, que estão inoperantes. Estas funcionalidades estão disponibilizadas apenas no módulo CadastroPREV.
- Pendência : 26226
  Tela/Opção: - (Liberação de beneficios)
  Descrição : Voltar a DATAFINAL gravada na MOVBENEF pela Retenção no caso de beneficios de Pensão
- Pendência : 26612
  Tela\Opção: Reembolso do INSS | Extrato Individual
  Descrição : Correção da totalização do valor de Glosa, desprezando rubricas informativas
              Correção da totalização do valor de Glosa, quando marcada a opção "Apenas reembolso p/ mantenedora Funcef"
================================================================================
CM$VER      3.00.05b    26/10/2007
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 26178
  Tela\Opçao No Sistema: Manutenção | Liberação de Beneficio 
  Descrição: Acerto na atualização do valor do SRB
================================================================================
CM$VER      3.00.05a    11/09/2007
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 22541 (Reabertura)
  Tela\Opçao No Sistema: Conceção | Desfazer Operações de Benefícios
  Descrição: Acerto na query que atualiza a tabela de descontos temporários para
             desfazer apenas os registros da pessoa e não do lote inteiro.
================================================================================
CM$VER      3.00.05     23/07/2007
--------------------------------------------------------------------------------
* Liberação Padrão 5.10.17
- Resolução da Pendência nº 19532
  Tela/Opção no Sistema: Concessão | Reconstrução do histórico do INSS
  Descrição: : Nova funionalidade para reconstruir histórico do INSS caso não exista
================================================================================
CM$VER      3.00.02c    09/08/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25685
  Tela/Opção no Sistema: Desfazer Concessão
  Descrição: Acerto na pesquisa dos movimentos de beneficio
================================================================================
CM$VER      3.00.02b    08/08/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 24224
  Tela/Opção no Sistema: Concessão
  Descrição: Tratamento para manter o mesmo Identificador do calculo (IDCALCULO)
             durante todo o processo de concessão.
- Resolução da Pendência nº 26024
  Tela/Opção no Sistema: Liberação de beneficio
  Descrição: Ajustes no tratamento da DATAFINAL efetuvas dos beneficios.
================================================================================
CM$VER      3.00.02a    27/07/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25867
  Tela/Opção no Sistema: Menu principal
  Descrição: Criar arquivos de relátório ao clicar no menu Relatórios
================================================================================
CM$VER      3.00.02     13/07/2007
--------------------------------------------------------------------------------
* Liberação Padrão 5.10.16
- Resolução da Pendência nº 18187
  Tela/Opção no Sistema: Menu Principal
  Descrição: Retirar alguns itens
- Resolução da Pendência nº 23993
  Tela/Opção no Sistema: Beneficios | Encerramento
  Descrição: Devolver o valor adiantado do abono e pagar abono integral
- Pendência 22253: Reembolso INSS
  Tela/Opção no Sistema: Entrada manual e Acerto de Valores Divergentes
  Descrição: Trava para inserção/alteração/exclusão de registros em meses fechados (com algum dos documentos gerado)
- Resolução da Pendência nº 19061
  Tela/Opção no Sistema: Benefícos | Cancelamento de eventos
  Descrição: Excluir memória de calculo
- Resolução da Pendência nº 25290
  Tela/Opção no Sistema: Benefícos | Cancelamento de eventos
  Descrição: Permitir cancelamento de eventos em planos desativados
- Resolução da Pendência nº 25295
  Tela/Opção no Sistema: Benefícos | Requerimento de Beneficios
  Descrição: Retirar FLGDESATIVADO da consulta para a regra de calculo do VALORTOTAL
- Resolução da Pendência nº 22324
  Tela/Opção no Sistema: Reembolso INSS | Identificação de Processos 
  Descrição: : Restrição à associação de Plano Prev com Plano Prev Contabil, utilizando a tabela PlanPrevContabil
================================================================================
CM$VER      3.00.01d    04/06/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25497
  Tela/Opção no Sistema: Participantes | Eventos | Falecimento
  Descrição: Para casos em que os beneficiários do participante possuam outros
             planos alem dos do associado exibir os planos num combo.
================================================================================
CM$VER      3.00.01c    01/06/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25322
  Tela/Opção no Sistema: Reembolso | Acerto | Acerto sem INSS
  Descrição: Revisão na lógica da tela.
- Resolução da Pendência nº 25321
  Tela/Opção no Sistema: Reembolso | Associação de rubricas INSS
  Descrição: Devolver o valor adiantado do abono e pagar abono integral
- Resolução da Pendência nº 25318
  Tela/Opção no Sistema: Benefícos | Liberação de Beneficios
  Descrição: Incluir coluna FLGPAGAINSSBENEF na consulta dos beneficios
- Resolução da Pendência nº 25269
  Tela/Opção no Sistema: Benefícos | Revisão e Beneficios
  Descrição: Atualizar o VALORTOTAL do beneficio quando DIGITADO E NÃO REAJUSTAR
- Resolução da Pendência nº -
  Tela/Opção no Sistema: Reembolso do INSS | Desfazer Identificação
  Descrição: Correção da chamada da tela
- Resolução da Pendência nº 25255
  Tela/Opção no Sistema: Benefícos | Reembolso do INSS | Conciliação mensal
  Descrição: Ajustes para permitir importação de até 9 rubricas por linha do arquivo (eram apenas 4)
- Resolução da Pendência nº 25155
  Tela/Opção no Sistema: Beneficios | Concessão
  Descrição: Verificar se no caso de pensão os acertos já foram pagos pelo
             beneficiário em outro beneficio
- Resolução da Pendência nº 24848
  Tela/Opção no Sistema: Beneficios | Simulação
  Descrição: Acerto na pesquisa do tempo de serviço
- Resolução da Pendência nº 24849
  Tela/Opção no Sistema: Beneficios | Simulação
  Descrição: Pesquisar planos desativados do participante
================================================================================
CM$VER      3.00.01b    09/05/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25264
  Tela/Opção no Sistema: Atalho para Cadastros de Pessoa
  Descrição: Retirar o botão de atalho para o Cadastros de Pessoa
================================================================================
CM$VER      3.00.01a    18/04/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25102
  Tela/Opção no Sistema: Beneficios | Revisão
  Descrição: Incluir beneficios encerrados na pesquisa do historico do INSS
- Resolução da Pendência nº 25170
  Tela/Opção no Sistema: Participantes | Contribuições
  Descrição: Acerto na pesquisa das contribuições pelo plano previdenciário
- Resolução da Pendência nº 25178
  Tela/Opção no Sistema: Beneficios | Concessão
  Descrição: Tratamento para gerar movimento de retenção no caso de INSS fora
             do convenio
- Resolução da Pendência nº 25102
  Tela/Opção no Sistema: Beneficios | Revisão
  Descrição: Incluir beneficios encerrados na pesquisa do historico do INSS
================================================================================
CM$VER      3.00.01     12/04/2007
--------------------------------------------------------------------------------
* Liberação Padrão 5.10.15
================================================================================
CM$VER      3.00.00b    02/06/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25524
  Tela/Opção no Sistema: Beneficios | Liberação
  Descrição: Retirado o FLGDESATIVADO da QryTitular
             Caso o beneficio não seja selecionado para liberar não processar.
- Resolução da Pendência nº 25697
  Tela/Opção no Sistema: Benefícos | Reembolso do INSS | Identificação
  Descrição: Acerto na pesquisa dos planos contabeis
- Resolução da Pendência nº 25415
  Tela/Opção no Sistema: Beneficios | Renova
  Descrição: Atualizar FLGCOBRA da contribuição independente do tipo de movimento
================================================================================
CM$VER      3.00.00a    12/04/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 24955
  Tela/Opção no Sistema: Beneficios | Liberação de Beneficios Retido
  Descrição: Acerto no demonstrativo. Historico de beneficios devolvidos estava
             com filtro indevido
- Resolução da Pendência nº 25045
  Tela/Opção no Sistema: Beneficios | Liberação de Beneficios
  Descrição: Inclusão do VALORTOTAL no demonstrativo
- Resolução da Pendência nº 25037
  Tela/Opção no Sistema: Beneficios | Renova de Beneficios
  Descrição: Inclusão de uniao por IDPESSJUR entre BFCIARIOTITPLAN e PARTPREVPLAN
- Resolução da Pendência nº 25017
  Tela/Opção no Sistema: Concessão de beneficios
  Descrição: Acerto no cotrole da data final do beneficio
- Resolução da Pendência nº 22786
  Tela/Opção no Sistema: Reembolso do INSS | Acerto de Valores | Desfazer Identificação de Processos
  Descrição: Criada nova tela para desfazer identificação de processos
- Resolução da Pendência nº 22787
  Tela/Opção no Sistema: Reembolso do INSS | Acerto de Valores | Entrada Manual de Rubricas
  Descrição: Permitir exclusão de registros incluídos manualmente
- Resolução da Pendência nº 21460
  Tela/Opção no Sistema: Beneficios | Revisão
  Descrição: Tratamento para responder não para todos ao questão sobre refazer as revisões
- Resolução da Pendência nº 24726
  Tela/Opção no Sistema: Beneficios | Liberação
  Descrição: Ajustes para o caso de liberação parcial.
- Resolução da Pendência nº 24716
  Tela/Opção no Sistema: Beneficios | Concessão
  Descrição: Ajustes para o caso de incluir novos beneficiário no GRUPO que já esta com a divisão de contas desde o inicio.
- Resolução da Pendência nº 24760
  Tela/Opção no Sistema: Alimentação de reservas
  Descrição: Enviar para query de entrada da regra um indicador de que é a primeira vez que a pessoa esta sendo processada
================================================================================
CM$VER      3.00.00     08/02/2007
--------------------------------------------------------------------------------
* Liberação Padrão 5.10.14
- Resolução da Pendência nº 21460
  Tela/Opção no Sistema: Beneficios | Revisão
  Descrição: Tratamento para responder não para todos ao questão sobre refazer as revisões
- Resolução da Pendência nº 24726
  Tela/Opção no Sistema: Beneficios | Liberação
  Descrição: Ajustes para o caso de liberação parcial.
- Resolução da Pendência nº 24716
  Tela/Opção no Sistema: Beneficios | Concessão
  Descrição: Ajustes para o caso de incluir novos beneficiário no GRUPO que já esta com a divisão de contas desde o inicio.
- Resolução da Pendência nº 24728
  Tela/Opção no Sistema: Encerramento de benefícios
  Descrição: Acerto para não encerrar beneficio de participante e de beneficiário.
- Resolução da Pendência nº 24760
  Tela/Opção no Sistema: Alimentação de reservas
  Descrição: Enviar para query de entrada da regra um indicador de que é a primeira vez que a pessoa esta sendo processada
- Resolução da Pendência nº 24729
  Tela/Opção no Sistema: Beneficios | Renova
  Descrição: Ajustes para a volta das contribuições quando beneficio for encerrado pela folha
- Resolução da Pendência nº 24724
  Tela/Opção no Sistema: Beneficios | Reembolso do INSS | Fechamento de Reembolso
  Descrição: Ajustes na exibição do nome da Manternedora de acordo com definição passada.
- Resolução da Pendência nº 24660
  Tela/Opção no Sistema: Beneficios | Desfazer Operações
  Descrição: Acerto no desfazer da liberação de beneficios para gerar movimento de desfazer (MOVBEENF)
- Resolução da Pendência nº 24518
  Tela/Opção no Sistema: Beneficios | Encerramento
  Descrição: Acerto na atualização do VALORTOTAL do historico de beneficios quando for encerramento
- Resolução da Pendência nº 24653
  Tela/Opção no Sistema: Beneficios | Retroativo
  Descrição: Acertos na revisão de beneficios em lote usando arquivo de matriculas
- Resolução da Pendência nº 24638
  Tela/Opção no Sistema: Cadastros | Dependentes
  Descrição: Acerto no calculo do limite percentual do beneficios rateiado
- Resolução da Pendência nº 24639
  Tela/Opção no Sistema: Beneficios | Desdobramento
  Descrição: Ajustes para desdobramento de beneficios em mais de um plano
- Resolução da Pendência nº 24579
  Tela/Opção no Sistema: Eventos | Requerimento de pensão
  Descrição: Retirado o filtro de plano ativo na pesquisa dos dados do titular
- Resolução da Pendência nº 24569
  Tela/Opção no Sistema: Beneficios | Desdobramento
  Descrição: Passar para a regra de reajuste a data de inicio (DIP) do beneficio
             pois um beneficio que irá ser pago deve ser reajustado desde a data
             inicio original e não a data em que ele entrou no processo
- Resolução da Pendência nº 24350
  Tela/Opção no Sistema: beneficios | Retroativo de Benefícios
  Descrição: Retirada de filtro da consulta de pessoas a serem tratadas.
- Resolução da Pendência nº 24350
  Tela/Opção no Sistema: beneficios | Retroativo de Benefícios
  De	scrição: Acerto na consulta para buscar os participantes de forma correta.
================================================================================
CM$ALT}


























