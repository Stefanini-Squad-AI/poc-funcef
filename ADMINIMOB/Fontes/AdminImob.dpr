{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG......: 26054 
Data........: 26/12/2016 
Responsável.: Michelle Suellyn Mota
Descrição...: Criação da tela Gestão de Investimento - Imóvel.
--------------------------------------------------------------------------------}

program AdminImob;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {frmCadastroGridCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports: TDataModule},
  CRelAlugueisEventos in 'CRelAlugueisEventos.pas' {cfgRelAlugueisEventos},
  CRelAvisoCobranca in 'CRelAvisoCobranca.pas' {cfgRelAvisoCobranca},
  CRelCartaReajuste in 'CRelCartaReajuste.pas' {cfgRelCartaReajuste},
  CRelCC in 'CRelCC.pas' {cfgRelCC},
  CRelCCContrato in 'CRelCCContrato.pas' {cfgRelCCContrato},
  CRelCCImovel in 'CRelCCImovel.pas' {cfgRelCCImovel},
  CRelCCLocatario in 'CRelCCLocatario.pas' {cfgRelCCLocatario},
  CRelCCMestre in 'CRelCCMestre.pas' {cfgRelCCMestre},
  CRelContratosAdminAnal in 'CRelContratosAdminAnal.pas' {cfgRelContratosAdminAnal},
  CRelContratosAdminSint in 'CRelContratosAdminSint.pas' {cfgRelContratosAdminSint},
  CRelContratosMestre in 'CRelContratosMestre.pas' {cfgRelContratosMestre},
  CRelDivergenciaLanc in 'CRelDivergenciaLanc.pas' {cfgRelDivergenciaLanc},
  CRelEtiquetaLocatario in 'CRelEtiquetaLocatario.pas' {cfgRelEtiquetaLocatario},
  CRelFolhaAluguel in 'CRelFolhaAluguel.pas' {cfgRelFolhaAluguel},
  CRelInadimplenciaContrato in 'CRelInadimplenciaContrato.pas' {cfgRelInadimplenciaContrato},
  CRelInadimplenciaImovel in 'CRelInadimplenciaImovel.pas' {cfgRelInadimplenciaImovel},
  CRelInadimplenciaLocatario in 'CRelInadimplenciaLocatario.pas' {cfgRelInadimplenciaLocatario},
  CRelInadimplenciaMestre in 'CRelInadimplenciaMestre.pas' {cfgRelInadimplenciaMestre},
  CRelListagemContrato in 'CRelListagemContrato.pas' {cfgRelListagemContrato},
  CRelListagemImovel in 'CRelListagemImovel.pas' {cfgRelListagemImovel},
  CRelQuadroImoveis in 'CRelQuadroImoveis.pas' {cfgRelQuadroImoveis},
  dRelAdminImobCC in 'dRelAdminImobCC.pas' {dtmRelAdminImobCC},
  FCadContaOrcamenXTipRecDes in 'FCadContaOrcamenXTipRecDes.pas' {frmCadContaOrcamenXTipRecDes},
  FCadDescontoContrato in 'FCadDescontoContrato.pas' {frmCadDescontoContrato},
  FCadHistProp in 'FCadHistProp.pas' {frmCadHistProp},
  FCuringa in 'FCuringa.pas' {frmCuringa},
  FCadUnidadeAutonoma in 'FCadUnidadeAutonoma.pas' {frmCadUnidadeAutonoma},
  FDRelCartaReajuste in 'FDRelCartaReajuste.pas' {frmDesenhoRelCartaReajuste},
  FDRelAvisoCobranca in 'FDRelAvisoCobranca.pas' {frmDesenhoRelAvisoCobranca},
  dRelAdminImob in 'dRelAdminImob.pas' {dtmRelAdminImob},
  FExecRecalculoDocumento in 'FExecRecalculoDocumento.pas' {frmExecRecalculoDocumento},
  RLancImovelNovo in 'RLancImovelNovo.pas' {frmRelLancImovelNovo},
  FEstornaLancamentoNovo in 'FEstornaLancamentoNovo.pas' {frmEstornaLancNovo},
  FExecLancMultRec in 'FExecLancMultRec.pas' {frmExecLancMultRec},
  FParamAdminImob in 'FParamAdminImob.pas' {frmParamAdminImob},
  fConcilia in 'fConcilia.pas' {frmConcilia},
  FEstornaFolhaAluguel in 'FEstornaFolhaAluguel.pas' {frmEstornaFolhaAluguel},
  FCadRespDespesa in 'FCadRespDespesa.pas' {frmCadRespDespesa},
  fEditMsgLanc in 'fEditMsgLanc.pas' {frmEditMsgLanc},
  FExecAnaliseLancto in 'FExecAnaliseLancto.pas' {frmExecAnaliseLancto},
  CRelLiberaLanc in 'CRelLiberaLanc.pas' {cfgRelLiberaLanc},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  cRelFolhaComparativa in 'cRelFolhaComparativa.pas' {cfgRelFolhaComparativa},
  fExecAgrupaDocumentoNovo in 'fExecAgrupaDocumentoNovo.pas' {frmExecAgrupaDocumentoNovo},
  cRelListagemProposta in 'cRelListagemProposta.pas' {cfgRelListagemProposta},
  fExecCobraDiverge in 'fExecCobraDiverge.pas' {frmExecCobraDiverge},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  uCtrlRptAdminImob in '..\CtrlObjects\uCtrlRptAdminImob.pas',
  dRelExtrato in '..\FontesMT\dRelExtrato.pas' {dtmRelExtrato},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fCadParamDespesaMT in '..\FontesMT\fCadParamDespesaMT.pas' {frmCadParamDespesaMT},
  fCadContratoImovelMT in '..\FontesMT\fCadContratoImovelMT.pas' {frmCadContratoImovelMT},
  uCtrlRelAdminImob in '..\CtrlObjects\uCtrlRelAdminImob.pas',
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  fCadMsgBoletoMT in '..\FontesMT\fCadMsgBoletoMT.pas' {frmCadMsgBoletoMT},
  uDbSeguroImovel in '..\DBObjects\uDbSeguroImovel.pas',
  uCtrlSeguroImovel in '..\CtrlObjects\uCtrlSeguroImovel.pas',
  cRelExtrato in '..\FontesMT\cRelExtrato.pas' {cfgRelExtrato},
  dRelSeguros in '..\FontesMT\dRelSeguros.pas' {dtmRelSeguros},
  cRelSeguros in '..\FontesMT\cRelSeguros.pas' {cfgRelSeguros},
  fQuadroAviso in '..\FontesMT\fQuadroAviso.pas' {frmQuadroAviso},
  fCadSeguroImovelMT in '..\FontesMT\fCadSeguroImovelMT.pas' {frmCadSeguroImovelMT},
  fExecRescisaoContratoMT in '..\FontesMT\fExecRescisaoContratoMT.pas' {frmExecRescisaoContratoMT},
  dRelMovFinan in '..\FontesMT\dRelMovFinan.pas' {dtmRelMovFinan},
  cRelMovFinan in '..\FontesMT\cRelMovFinan.pas' {cfgRelMovFinan},
  FExecLancMultDespMT in '..\FontesMT\FExecLancMultDespMT.pas' {frmExecLancMultDespMT},
  FProgresso in '..\..\Cm\Forms\Source\FProgresso.pas' {frmProgresso},
  FProgressoDuplo in '..\..\Cm\Forms\Source\FProgressoDuplo.pas' {frmProgressoDuplo},
  FExecLancMultDespAltMT in '..\FontesMT\FExecLancMultDespAltMT.pas' {frmExecLancMultDespAltMT},
  cRelLancForaComp in '..\FontesMT\cRelLancForaComp.pas' {cfgRelLancForaComp},
  dRelLancForaComp in '..\FontesMT\dRelLancForaComp.pas' {dtmRelLancForaComp},
  fExecSuspenderReativar in '..\FontesMT\fExecSuspenderReativar.pas' {frmExecSuspenderReativar},
  uDbSeguroImoXCob in '..\DBObjects\uDbSeguroImoXCob.pas',
  dRelHistoricoContratual in '..\FontesMT\dRelHistoricoContratual.pas' {dtmRelHistoricoContratual},
  cRelHistoricoContratual in '..\FontesMT\cRelHistoricoContratual.pas' {cfgRelHistoricoContratual},
  CRelCCPlanoPatro in 'CRelCCPlanoPatro.pas' {cfgRelCCPlanoPatro},
  CRelReceitaM2 in 'CRelReceitaM2.pas' {cfgRelReceitaM2},
  cRelEventos in '..\FontesMT\cRelEventos.pas' {cfgRelEventos},
  dRelEventos in '..\FontesMT\dRelEventos.pas' {dtmRelEventos},
  fCadAvisoImob in '..\FontesMT\fCadAvisoImob.pas' {frmCadAvisoImob},
  fApuracaoIndicadores in '..\FontesMT\fApuracaoIndicadores.pas' {frmApuracaoIndicadores},
  cRelEvolInadimp in '..\FontesMT\cRelEvolInadimp.pas' {cfgRelEvolInadimp},
  dRelEvolInadimp in '..\FontesMT\dRelEvolInadimp.pas' {dtmRelEvolInadimp},
  CRelInadimplContrAnalitico in 'CRelInadimplContrAnalitico.pas' {cfgRelInadimplContrAnalitico},
  CRelListagemImovelSegmento in 'CRelListagemImovelSegmento.pas' {cfgrellistagemimovelseg},
  CRelCCConsolidado in 'CRelCCConsolidado.pas' {cfgRelCCConsolidado},
  FVerificaMenuSAD in 'FVerificaMenuSAD.pas' {frmVerificaMenuSAD},
  fExibeEvento in '..\FontesMT\fExibeEvento.pas' {frmExibeEvento},
  FExecFolhaAluguelNova in 'FExecFolhaAluguelNova.pas' {frmExecFolhaAluguelNova},
  fConsultaInadimplencia in '..\FontesMT\fConsultaInadimplencia.pas' {frmConsultaInadimplencia},
  FEspera in 'FEspera.pas' {frmEspera},
  FCadContratoConfissao in '..\FontesMT\FCadContratoConfissao.pas' {frmCadContratoConfissao},
  fConciliaMT in '..\FontesMT\fConciliaMT.pas' {frmConciliaMT},
  fCadTipoContratoMT in '..\FontesMT\fCadTipoContratoMT.pas' {frmCadTipoContratoMT},
  uCtrlTipoContrato in '..\CtrlObjects\uCtrlTipoContrato.pas',
  uDbTipoContrImob in '..\DBObjects\uDbTipoContrImob.pas',
  FExecLancRateio in 'FExecLancRateio.pas' {frmExecLancRateio},
  cRelFolhaRecEmpreendimento in '..\FontesMT\cRelFolhaRecEmpreendimento.pas' {cfgRelFolhaRecEmpreendimento},
  dRelFolhaRecEmpreendimento in '..\FontesMT\dRelFolhaRecEmpreendimento.pas' {dtmRelFolhaRecEmpreendimento},
  dRelFolhaRecVencimento in '..\FontesMT\dRelFolhaRecVencimento.pas' {dtmRelFolhaRecVencimento},
  cRelFolhaRecVencimento in '..\FontesMT\cRelFolhaRecVencimento.pas' {cfgRelFolhaRecVencimento},
  cRelFolhaRecEmpreendimentoSintetico in '..\FontesMT\cRelFolhaRecEmpreendimentoSintetico.pas' {cfgRelFolhaRecEmpreendimentoSintetico},
  dRelFolhaRecEmpreendimentoSintetico in '..\FontesMT\dRelFolhaRecEmpreendimentoSintetico.pas' {dtmRelFolhaRecEmpreendimentoSintetico},
  fExecGeraRecLoteMT in '..\FontesMT\fExecGeraRecLoteMT.pas' {frmExecGeraRecLoteMT},
  fCadImovelXEmpreendedorMT in 'fCadImovelXEmpreendedorMT.pas' {FrmCadImovelXEmpreendedorMT},
  fCadBaixaContraAlteradorMT in '..\..\CMIMOBILIARIOOBJ50\FontesMT\fCadBaixaContraAlteradorMT.pas' {frmCadBaixaContraAlteradorMT},
  fMovDesfazerConfissao in '..\FontesMT\fMovDesfazerConfissao.pas' {frmMovDesfazerConfissao},
  FControle_Atos_Gestao in '..\FontesMT\FControle_Atos_Gestao.pas' {frmControle_Atos_Gestao},
  uCtrlControle_Atos_Gestao in '..\CtrlObjects\uCtrlControle_Atos_Gestao.pas',
  FPreview in '..\..\Cm\componentescm\source\FPreview.pas' {FrmPreview},
  ppViewr in '..\..\Cm\ComponentesXT\RBuilder\Source\ppViewr.pas',
  FMovContratoConfissao in '..\FontesMT\FMovContratoConfissao.pas' {frmMovContratoConfissao},
  fCadGestInvestImovelMestreMT in '..\FontesMT\fCadGestInvestImovelMestreMT.pas' {frmCadGestInvestImovelMestreMT},
  FSelAltTributacao in '..\..\CMCAPCARUTILOBJ50\Source\FSelAltTributacao.pas' {frmSelAltTributacao},
  uCtrlListaServicos in '..\..\CMCAPCARUTILOBJ50\CtrlObjects\uCtrlListaServicos.pas',
  uDbListaServicos in '..\..\CMCAPCARUTILOBJ50\DbObjects\uDbListaServicos.pas',
  uDbTributacaoListaServico in '..\..\CMCAPCARUTILOBJ50\DbObjects\uDbTributacaoListaServico.pas';

{$R *.RES}
{$R ADMINIMOB_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Administração Imobiliária';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TfrmEspera, frmEspera);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TfrmProgressoDuplo, frmProgressoDuplo);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Administração Imobiliária
================================================================================
CM$VER      3.02.18g    16/04/2008
--------------------------------------------------------------------------------
- Pendência 27739: Folha de Aluguéis
  Correção da aplicação de descontos programados por valor fixo informado no contrato.
================================================================================
CM$VER      3.02.18f    10/04/2008
--------------------------------------------------------------------------------
- Pendência 26601: Conciliação
  Ajuste na Conciliação para trazer corretamente os valores de Juros, Multas e Correção.
================================================================================
CM$VER      3.02.18e    09/04/2008
--------------------------------------------------------------------------------
- Pendencia 27724: Recálculo de Documentos em Aberto
  Ajuste na chamada dos cálculos sobre a inadimplencia quando o contrato possuir juros
  diários
================================================================================
CM$VER      3.02.18d    26/02/2008
--------------------------------------------------------------------------------
- Pendencia 27468: Aviso de Cobrança
  Acerto no aviso de cobrança para considerar valores pagos
- Pendencia 27479: Quadro de Avisos
  Acerto para mostrar dados dos eventos relativos a contratos
================================================================================
CM$VER      3.02.18c    22/02/2008
--------------------------------------------------------------------------------
Relatório Folha de Receitas por Empreendimento - Analítico
  Pendência: 27389 - Ajuste na consulta do relatório para trazer valores segregados
                     quando haver contratos com unidades em mais de um empreendimento.
================================================================================
CM$VER      3.02.18b    20/02/2008
--------------------------------------------------------------------------------
- Pendencia 27443: Recálculo de Documentos
  Ajuste no processo de Recálculo de Documentos para fazer a separação correta dos 
  valores entre os períodos de data de pagamento e data de recálculo
================================================================================
CM$VER      3.02.18a    14/02/2008
--------------------------------------------------------------------------------
Pendência: 27394 - Acerto e atualização dos helps do sistema...
================================================================================
CM$VER      3.02.18     29/01/2008
--------------------------------------------------------------------------------
Folha de Aluguéis
  Pendência: 27318 - Ajuste para exibir os campos relacionados aos contratos
                     reajustados.
Aviso de Cobrança / Emissão
  Pendência: 27228 - Ajuste para exibir corretamente os valores de "Juros", "Multa" e
                     "Correção" no relatório.
Relatórios / Listagem / Imóveis
  Pendência: 27031 - Adicionado os campos de Área dos Imóveis ( Comum, Gerencial
                     e Total ) para que o usuário possa ter a opção de
                     incluí-los no relatório...
Aviso de Cobrança / Emissão
  Pendência: 26812 - Correção da duplicidade nas linhas dos valores.
Cadastro de Tipo de Evento
  Pendência: 26794 - Implementação do cadastro de Tipo de Evento.
Cadastro de Imóveis
  Pendência: 26634 - Implementação na guia de Indicadores permitindo o filtro
                     apenas para indicadores previstos ou realizados.
Listagem de Contratos
  Pendência: 26245 - Implementação de filtro por mês e ano de vencimento do
                     contrato.
Cobrança / Mensagem de Boleto
  Pendência: 25166 - Implementação de curingas para relacionar a descrição dos
                     imóveis do contrato.
Relatórios / Gerenciais / Receita de locação por m²
  Pendência: 25051 - Inclusão de filtros por locatário e segmento de imóveis
Bloqueio Judicial
  Pendência: 22289 - Implementação de possiblidade de lançamento de valores
                     recebidos, porém bloqueados judicialmente.
Cadastro de Tipo de Movimentação
  Pendência: 22289 - Criação de identificação de bloqueio judicial para tipo de
                     movimentação de Receitas
Criação do Processo: Movimentação / Contratos / Bloqueio Judicial
  Pendência: 22289 - Permitindo efetuar o lançamento, bloqueio e liberação de
                     depósitos, bem como impressão de extrato.
Folha de Aluguéis
  Pendência: 21163 - Ajuste do cálculo pro-rata para descontos programados no
                     contrato quando do reajuste do aluguel, buscando o valor
                     pro-rata pelo valor antigo e novo valor reajustado.
================================================================================
CM$VER      3.02.17c    30/10/2007
--------------------------------------------------------------------------------
- Pendencia 26691: Geração da Folha de Aluguéis
  Passa a considerar os dados informados para a cobrança, conforme o que
  está parametrizado na página de cobrança do contrato
================================================================================
CM$VER      3.02.17b    19/10/2007
--------------------------------------------------------------------------------
Consulta Inadimplência
  Pendência: 26597 - Ajustes na Consulta Inadimplência para uso com a nova estrutura de
                     Cálculo de Juros e Multas no Cadastro de Contratos de Locação.
Agrupa Mensagens do Boleto
  Pendência: 26527 - Passa a agrupar ou não pela Mensagem de Boleto Padrão do
                     Contrato.
================================================================================
CM$VER      3.02.17a    10/10/2007
--------------------------------------------------------------------------------
- Pendencia 26476: Relatório de Folha de Aluguel
  Implementado a opção de ordenação pela data de vencimento
================================================================================
CM$VER      3.02.17     16/08/2007
--------------------------------------------------------------------------------
- Liberação do padrão 17
- Pendência: 26104 - Ajustes no calculo da Data Limite no processo de integração para
                     uso com a nova estrutura de Cálculo de Juros e Multas no Cadastro de
                     Contratos de Locação.
                     ps.: Complemento da pendência 22687
- Sistema / Configurações
     Pendencia 25622
        Criação do cadastro de itens por processo
- Cadastros
     Pendencia 24867
        Cadastro de Imóveis - Adicionado filtro por Ocupação (Ocupado / Desocupado)
- Relatórios
     Pendencia 24881
        Criação do Relatório de Resumo de Folha de Aluguel por Imóvel Mestre e Tipo de Imóvel
     Pendencia 24880
        Criação do Relatório de Resumo de Conta Corrente por Tipo de Imóvel e Imóvel Mestre
     Pendencia 24878
        Relatório de Inadimplência passou a ter filtros e quebra de grupo por tipo de contrato -
       locação, confissão de dívida e cobrança jurídica
    Pendencia 24879
        Criação do Relatório de Resumo de Conta Corrente por Dia de Vencimento
================================================================================
CM$VER      3.02.16h    30/10/2007
--------------------------------------------------------------------------------
- Pendencia 26691: Geração da Folha de Aluguéis
  Passa a considerar os dados informados para a cobrança, conforme o que
  está parametrizado na página de cobrança do contrato
================================================================================
CM$VER      3.02.16g    24/10/2007
--------------------------------------------------------------------------------
Relatório Inadimplência por Contrato Analítico
  Pendência: 26622 - Ajuste na quebra por Segmento.
================================================================================
CM$VER      3.02.16f    23/10/2007
--------------------------------------------------------------------------------
Consulta Inadimplência
  Pendência: 26597 - Ajustes na Consulta Inadimplência para uso com a nova estrutura de
                     Cálculo de Juros e Multas no Cadastro de Contratos de Locação.
================================================================================
CM$VER      3.02.16e    09/10/2007
--------------------------------------------------------------------------------
Pendencias 26271 e 26276
- Desfazer folha de aluguel: Colocado parâmetro para desfazer somente integração
  Financeira / Contábil. Quando selecionado esse parâmetro, o sistema passa a armazenar
  o NOSSONUMERO do documento a ser apagado.
- Integração de Lançamentos: Quando o NOSSONUMERO estiver armazenado, o
  mesmo é gravado no novo documento gerado
================================================================================
CM$VER      3.02.16d    30/08/2007
--------------------------------------------------------------------------------
Estorno de Folha de Aluguéis
  Pendência: 26248 - Correção no filtro de Busca por Contrato.
Configuração de Relatórios
  Pendência: 26239 - Disponibilização de relatórios em 3 camadas para parametrização
                     de layout pelo usuário.
================================================================================
CM$VER      3.02.16c    16/08/2007
--------------------------------------------------------------------------------
  Pendência: 26104 - Ajustes no calculo da Data Limite no processo de integração para
                     uso com a nova estrutura de Cálculo de Juros e Multas no Cadastro de
                     Contratos de Locação.
                     ps.: Complemento da pendência 22687
================================================================================
CM$VER      3.02.16b    01/08/2007
--------------------------------------------------------------------------------
Cobrança / Recálculo de Cobranças em aberto
   Pendencia 26007
     Quando a fundação trabalha com atualização diária,  o processo permite recálculo 
     somente com data superior ao último fechamento
================================================================================
CM$VER      3.02.16a    30/07/2007
--------------------------------------------------------------------------------
Cadastros / Contratos / Locação
   Pendencia 25137: Não permite gravar Forma de Cobrança desativada
Cobrança / Recálculo de Cobranças em aberto
   Pendencia 25986: Incluída nova verificação para evitar que não sejam informados
                    alteradores de Juros, Multa e/ou Correção Monetária que não
                    estejam parametrizados pelo tipo de imovel.
================================================================================
CM$VER      3.02.16     28/05/2007
--------------------------------------------------------------------------------
Consulta Lançamentos
  Pendência: 25304 - Ajuste da consulta para buscar sempre a Data de baixa do Documento
                     no Contas a Receber ao invés da Conciliação Financeira.
Cadastros e Lançamentos
  Pendência: 25137 - Implementação de filtro para exibir apenas as formas de pagamento
                     ativas.
Relatório de Inadimplência por Contrato Analítico
  Pendência: 24412 - Implementação de Quebra por segmento no relatório.
Relatório de Folha de Aluguel
  Pendência: 24411 - Implementação do resumo por segmento no Relatório de Folha de Aluguéis.
Transferência de Tipo de Imóveis
  Pendência: 24345 - Implementação de crítica para Transferência de Imóveis,
                     permitindo que esta seja feita apenas para Imóveis desocupados e
                     sem registro de movimentação futura.
Cadastro de Unidades
  Pendência: 24085 - Implementação da tela de Cadastro de Unidades.
Registro de Eventos
  Pendência: 24083 - Implementação de Inclusão de número do processo em todos os
                     registros de eventos manuais.
================================================================================
CM$VER      3.02.15a    21/05/2007
--------------------------------------------------------------------------------
Pendência: 24085 - Ajustes nas telas de Lançamento para carregar Imóveis ou Unidades
                             pertencentes ao contrato.
================================================================================
CM$VER      3.02.15     10/04/2007
--------------------------------------------------------------------------------
- Liberação do padrão 15
- Pendencia 24323: Consulta de inadimplencias: Exibe apenas contratos inadimplentes
- Pendencia 24081: Cadastro de contratos: Criação da estrutura para classificação do tipo
  de contrato
- Pendencia 22687: Cadastro de locação: Permitir parametros diferenciados de correcao de
 inadimplencia por tipo de receita e vigencia diferenciada
- Pendencia 19622: Cadastro de Locatários
  Permite selecionar mais de um tipo de cliente por locatário
Relatório Consulta Inadimplência por Locatário
  Pendência: 25182 - Ajuste no filtro no Relatório de Inadimplencia por Locatario.
Lançamentos Múltiplos de Despesa
  Pendência: 22688 - Passa a não deixar lançar documentos se a data de lançamento
                     for posterior a data de vencimento.
================================================================================
CM$VER      3.02.14h    27/04/2007
--------------------------------------------------------------------------------
Relatório Consulta Inadimplência por Locatário
  Pendência: 25182 - Ajuste no filtro no Relatório de Inadimplencia por Locatario.
================================================================================
CM$VER      3.02.14g    16/04/2007
--------------------------------------------------------------------------------
Recálculo de Documentos
  Pendência: 25074 - Correção no cálculo dos alteradores na tela de recálculo.
================================================================================
CM$VER      3.02.14f    13/04/2007
--------------------------------------------------------------------------------
Confissão de Dívidas
   - Ajustes no processo de geração do contrato
================================================================================
CM$VER      3.02.14e    11/04/2007
--------------------------------------------------------------------------------
- Pendencia 24986: Provisões Diárias / Ajusta Provisão:
  Acerto na marcação e habilitação das opções Calcula Provisão de Receitas e
  Integra Provisão de Receitas respeitando a informação definida no parâmetro do
  sistema
================================================================================
CM$VER      3.02.14d    28/03/2007
--------------------------------------------------------------------------------
Lançamento de Receitas e Despesas
  Pendência: 24909 - Correção do processo de busca do contrato vigente para
                               vinculação ao lançamento.
================================================================================
CM$VER      3.02.14c    23/03/2007
--------------------------------------------------------------------------------
Lançamento Rateado
  Pendência: 24781 - Passa a gravar o TIPO DE IMÓVEL quando é efetuado pelo
                               Lançamento Rateado.
================================================================================
CM$VER      3.02.14b    12/03/2007
--------------------------------------------------------------------------------
Folha de Alguéis
  Pendência: 24703 - Correção para informar a data de lançamento corretamente
                     caso haja período de competência na geração da folha de
                     aluguél.
Recálculo de Documentos
  Pendência: 24688 - Passa considerar os alteradores de descontos para recálculo
                     do documento.
================================================================================
CM$VER      3.02.14a    05/03/2007
--------------------------------------------------------------------------------
Lançamento de Receitas e Despesas
Pend. 24577 - Correção da busca dos imóveis por contrato, quando o período contratual
                      for inferior a 30 dias.
================================================================================
CM$VER      3.02.14     22/02/2007
--------------------------------------------------------------------------------
- Pend 24000: Reestruturação interna dos módulos do Imobiliário
- Pend 24354: Transferência de Grupo
                      Implementação de critica impedindo a transferência quando o imóvel estiver locado
                      ou possuir movimentação futura.
- Pend 23560: Relat. Folha de Aluguéis
                      Implementação de filtro por Contrato e Locatário.
- Pend 23544: Relat. de Inadimplência analitico e sintético
                     Ajuste do filtro por imóvel
- Pend 23828: Ajuste no processo de exclusão de lançamentos 
                      no que diz respeito à exclusão contábil quando não 
                      existir lançamento no financeiro
- Pend 23516: Cadastro - Dados complementares
                      Alteração do processo, permitindo:
                          - Tipo de Dado complementar: Imovel / Contrato
                          - Codificação hierárquica com definição "Analitica / Sintética"
                          - Definir tipo de dado: caracter, numerico, data, opções, checkbox
- Pend 23517: Cadastro de imóveis - Guia de dados complementares com visualização em 
                     estrutura de árvore
- Pend 23518: Cadastro de contratos - Inserida a guia de dados complementares
- Pend 23642: Relatório de conta corrente anual - desconsidera lançamentos estornados
- Pend 23272: Cadastro de contratos - Atualização automática da data de vigência dos imóveis
                      quando alterada a vigência do contrato
- Pend 22993: Lançamento de despesas - Inclusão do campo Histórico Complementar para a 
                      integração com o Contas a Pagar
- Pend 21414: Conciliação de Lançamentos: Utilização das rotinas em 3 camadas
                      igualando assim ao processo de Inadimplências
Confissão de Dívidas
- Pend 21162: Criação dos cadastros de itens e parametrização dos itens
- Pend 23742: Geração do contrato de confissão de dívidas
- Pend 23743: No processo de geração da folha de alugueis, gerar as 
                      parcelas de confissão de dívidas.
                      No processo de desfazer geração da folha, incluida a 
                      opção de desfazer folha de confissão de dívidas.
- Pend 23745: Criação do processo de contabilização dos itens de cálculo.
                      Criação da tela de parametrização contábil de itens
                      Criação do processo de integração contábil
                      Criação do processo de desfazer integração contábil
- Pend 23744: Criação da tela de Consulta e Manutenção dos dados do contrato
                      de confissão de dívidas
- Pend 24353: Criação da tela para Desfazer Contrato de Confissão de Dívidas
================================================================================
CM$VER      3.02.13f    27/04/2007
--------------------------------------------------------------------------------
- Pendencia 25182: acerto no filtro por relatorio de inadimplencia por locatario
================================================================================
CM$VER      3.02.13e    28/03/2007
--------------------------------------------------------------------------------
Lançamento de Receitas e Despesas
   Pend. 24909 - Correção do processo de busca do contrato vigente para vinculação ao
                         lançamento.
================================================================================
CM$VER      3.02.13d    05/03/2007
--------------------------------------------------------------------------------
Lançamento de Receitas e Despesas
   Pend. 24577 - Correção da busca dos imóveis por contrato, quando o período contratual
   for inferior a 30 dias. 
================================================================================
CM$VER      3.02.13c    31/01/2007
--------------------------------------------------------------------------------
Reestruturação interna de bibliotecas para o padrão 5.10.14
================================================================================
CM$VER      3.02.13b    16/01/2007
--------------------------------------------------------------------------------
Cadastro de Contratos de Locação
  Pendência: 24159 - Implementação de crítica ao alterar/excluir imóvel caso exista
lançamentos feito para o mesmo.
================================================================================
CM$VER      3.02.13a    21/12/2006
--------------------------------------------------------------------------------
Consulta Inadimplência, Cadastro de Imóvel, Cadastro de Eventos de Imóvel
Cadastro de Eventos de Contrato, Cadastro de Contratos de Locação
  - Ajuste relacionado a pendência 21967
================================================================================
CM$VER      3.02.13     06/12/2006
--------------------------------------------------------------------------------
- Pendencias 22738 / 23421: Inclusão do tipo de contrato SUSPENSO no filtro dos relatórios
contratos sintético e contrato por imóvel mestre sintético.
================================================================================
CM$VER      3.02.12l    29/01/2007
--------------------------------------------------------------------------------
Pendencia 24159: Ajuste na implementação da pendencia
================================================================================
CM$VER      3.02.12k    16/01/2007
--------------------------------------------------------------------------------
Cadastro de Contratos de Locação
  Pend: 24159 - Implementação de crítica ao alterar/excluir imóvel caso exista
                       lançamentos feito para o mesmo.
================================================================================
CM$VER      3.02.12j    20/12/2006
--------------------------------------------------------------------------------
Cadastro de Contratos de Locação
  - Ajuste relacionado a pendência 21967
================================================================================
CM$VER      3.02.12i    15/12/2006
--------------------------------------------------------------------------------
- Correção do processo de alteração/exclusão de eventos: Pendência 21967
================================================================================
CM$VER      3.02.12h    14/12/2006
--------------------------------------------------------------------------------
- Pendencia 23438: Recálculo de Documentos - Passagem dos parâmetros de Juros,
                             Multa e Correção informados na tela para o processo de cálculo
================================================================================
CM$VER      3.02.12g    05/12/2006
--------------------------------------------------------------------------------
- Pendencias 22738 / 23421: Inclusão do tipo de contrato SUSPENSO no filtro dos
                    relatórios contratos sintético e contrato por imóvel mestre sintético.
================================================================================
CM$VER      3.02.12f    23/11/2006
--------------------------------------------------------------------------------
- Recompilação contemplar alterações da BPL
================================================================================
CM$VER      3.02.12e    21/11/2006
--------------------------------------------------------------------------------
- Pendencia 23793: Acerto no cadastro de parametrização contábil / financeira para
                             Receitas / Despesas / Operações, para contemplar visualização
                             correta dos centros de custo
================================================================================
CM$VER      3.02.12d    10/11/2006
--------------------------------------------------------------------------------
Exclusão de Lançamentos
   - Liberação do botão de estorno, mediante cadastro de autorização por usuário
Relatório de Inadimplencia por Contrato Analítico, Sintético, Imóvel e Imóvel Mestre e
Processo de Conciliação e Rescisão.
   - Exclusão de lançamentos estornados ou abonados com data anterior a data limite
      do relatório.
================================================================================
CM$VER      3.02.12c    31/10/2006
--------------------------------------------------------------------------------
Lançamento de Receitas
  Pend.: 23652 - Correção do modo de exibição do grupo de rateio exibindo imóveis sem
                        contrato.
================================================================================
CM$VER      3.02.12b    27/10/2006
--------------------------------------------------------------------------------
Lançamento de Receitas
  Pend.: 23591 - Alteração para uso do Grupo de Rateio, permitindo a geração de receita
                        que esteja associada a um cliente não locatário. Nesta situação, nenhum
                        contrato será associado ao lançamento, exceto se o cliente for o único
                        locatário de todos os imóveis do grupo.
================================================================================
CM$VER      3.02.12a    23/10/2006
--------------------------------------------------------------------------------
Relatório:  Operacionais / Filha de Aluguéis por Contrato
  Pend.: 23559 - Inclusão do filtro de documentos (Importados) no 
                         radiogroup "Origem de Lançamentos"
================================================================================
CM$VER      3.02.12     28/09/2006
--------------------------------------------------------------------------------
Liberação do padrão 12.
================================================================================
CM$VER      3.02.11f    21/11/2006
--------------------------------------------------------------------------------
- Pendencia 23793: Acerto no cadastro de parametrização contábil / financeira para 
                             Receitas / Despesas / Operações, para contemplar visualização
                             correta dos centros de custo
================================================================================
CM$VER      3.02.11e    08/11/2006
--------------------------------------------------------------------------------
Exclusão de Lançamentos
   - Liberação do botão de estorno, mediante cadastro de autorização por usuário
Relatório de Inadimplencia por Contrato Analítico, Sintético, Imóvel e Imóvel Mestre e
Processo de Conciliação e Rescisão.
   - Exclusão de lançamentos estornados ou abonados com data anterior a data limite
      do relatório.
================================================================================
CM$VER      3.02.11d    31/10/2006
--------------------------------------------------------------------------------
Lançamento de Receitas
  Pend.: 23652 - Correção do modo de exibição do grupo de rateio exibindo imóveis sem
                        contrato.
================================================================================
CM$VER      3.02.11c    24/10/2006
--------------------------------------------------------------------------------
Lançamento de Receitas
   - Alteração para uso do Grupo de Rateio, permitindo a geração de receita que esteja
     associada a um cliente não locatário. Nesta situação, nenhum contrato será associado
     ao lançamento, exceto se o cliente for o único locatário de todos os imóveis do grupo.
================================================================================
CM$VER      3.02.11b    31/08/2006
--------------------------------------------------------------------------------
Lançamentos Múltiplos de Despesa / Receita
  Pend.: 23208 - Correção do erro nas telas de lançamento de Receita e Despesa. Passa
                         a exibir o conteúdo do campo IMOCODIGO, que não estava
                         aparecendo.
================================================================================
CM$VER      3.02.11a    22/08/2006
--------------------------------------------------------------------------------
Folha de Aluguéis
  Pend.: 23113 - Impressão da folha de aluguel por período de competência.
================================================================================
CM$VER      3.02.11     28/07/2006
--------------------------------------------------------------------------------
Lançamentos Múltiplos de Receita
   Pend.: 22919 - Passa a "limpar" os contratos de receitas referentes a clientes sem
                         contrato.
Parâmetros do sistema
   Pend.: 22693 - Criar parâmetro de sistema na guia "Cobrança / Inadimplência" para
                          indicar se no processo de atualização de inadimplência será utilizado
                          apenas o indice do ultimo mês anterior, ou de todos os meses do
                          período.
================================================================================
CM$VER      3.02.10d    31/08/2006
--------------------------------------------------------------------------------
Lançamentos Múltiplos de Despesa / Receita
  Pend.: 23208 - Correção do erro nas telas de lançamento de Receita e Despesa. Passa
                         a exibir o conteúdo do campo IMOCODIGO, que não estava
                         aparecendo.
================================================================================
CM$VER      3.02.10c    24/08/2006
--------------------------------------------------------------------------------
Folha de Aluguéis
  Pend.: 23113 - Impressão da folha de aluguel por período de competência.
================================================================================
CM$VER      3.02.10b    17/08/2006
--------------------------------------------------------------------------------
Lançamentos Múltiplos de Receita
   Pend.: 22919 - Passa a "limpar" os contratos de receitas referentes a clientes sem
                         contrato.
Parâmetros do sistema
   Pend.: 22693 - Criar parâmetro de sistema na guia "Cobrança / Inadimplência" para
                          indicar se no processo de atualização de inadimplência será utilizado
                          apenas o indice do ultimo mês anterior, ou de todos os meses do
                          período.
================================================================================
CM$VER      3.02.10a    25/07/2006
--------------------------------------------------------------------------------
Lançamentos Múltiplos de Receitas
   Pend.: 22879 - Permitir trazer os imóveis de um determinado grupo de rateio mesmo
                         se forem imóveis sem contrato.
================================================================================
CM$VER      3.02.10     13/07/2006
--------------------------------------------------------------------------------
Folha de Aluguéis
   Pend. 21164 - Implementação da geração da folha de aluguel por período de competência.
Desfazer Folha de Aluguel
   Pend. 22516 - Dar a opção de excluir a folha de aluguel por período de competência selecionado.
Lançamentos Múltiplos de Receita
   Pend. 22524 - Não deixa lançamentos de imóveis com contratos diferentes.
                         Passa a verificar se o número do documento a ser lançado já não foi lançado antes.
Relatório por Contrato Analítico
   Pend. 21822 - Adicionado o Código do Imóvel no relatório Imóveis por Contratos Analíticos.
================================================================================
CM$VER      3.02.09u    16/08/2006
--------------------------------------------------------------------------------
Lançamento Múltiplo de Receitas
  - Correção na query "qryInsertLancImovel".
================================================================================
CM$VER      3.02.09t    14/08/2006
--------------------------------------------------------------------------------
Folha de Aluguéis
  - Ajuste da geração da folha de aluguel pela data de vigência dos imóveis.
================================================================================
CM$VER      3.02.09s    11/08/2006
--------------------------------------------------------------------------------
- Pendencia 22814 - Permite lançar alterador com valor negativo
================================================================================
CM$VER      3.02.09r    09/08/2006
--------------------------------------------------------------------------------
Cadastro de Contratos de Locação
  Pend.: 23011 - Correção da crítica ao alterar a data final da vigência do contrato.
                        Implementação de uma crítica na iclusão de um imóvel novo. Não deixa
                        incluir se a data inicial da vigência do contrato não tiver sido preenchida.
================================================================================
CM$VER      3.02.09q    02/08/2006
--------------------------------------------------------------------------------
- Acerto na tela de lançamento múltiplo de receitas para corrigir o erro quando se informava dados no campo observação
================================================================================
CM$VER      3.02.09p    01/08/2006
--------------------------------------------------------------------------------
- Pendencia 22952: Acerto na contabilização do alterador quando existe segregação
================================================================================
CM$VER      3.02.09o    01/08/2006
--------------------------------------------------------------------------------
Lançamentos Múltiplos de Receitas
   Pend.: 22919 - Não relaciona o contrato quando o cliente informado difere do
                         locatário do contrato vigente.
================================================================================
CM$VER      3.02.09n    25/07/2006
--------------------------------------------------------------------------------
Cadastro de Parametrização de Receitas
  Pend 22911 - Tela de Cadastro de Contratos
      Correção da descrição de coluna da guia de imóveis
================================================================================
CM$VER      3.02.09m    21/07/2006
--------------------------------------------------------------------------------
Lançamentos Múltiplos de Receitas
   Pend.: 22879 - Permitir trazer os imóveis de um determinado grupo de rateio mesmo
                         se forem imóveis sem contrato.
================================================================================
CM$VER      3.02.09l    05/07/2006
--------------------------------------------------------------------------------
- Pendencia 22768: Acerto no calculo da data limite levando em consideração 
                             o numero de dias de tolerancia
================================================================================
CM$VER      3.02.09k    28/06/2006
--------------------------------------------------------------------------------
Rlatórios de Inadimplêcia
   Pend.: 22531 - Passa a utilizar a data de limite de inadimplência na busca dos  valores
                         de movimentação do documento e validação da data limite para
                         pagamento.
================================================================================
CM$VER      3.02.09j    21/06/2006
--------------------------------------------------------------------------------
Folha de Aluguel
   - Pend 22648 - Correção do processo de busca de imóveis para geração da folha,  
                          com base na vigencia do imóvel no contrato.
================================================================================
CM$VER      3.02.09i    16/06/2006
--------------------------------------------------------------------------------
- Acerto na query de atualização de alteradores
================================================================================
CM$VER      3.02.09h    14/06/2006
--------------------------------------------------------------------------------
Lançamentos Múltiplos de Receita
   Pend. 22524 - Não deixa lançamentos de imóveis com contratos diferentes.
                         Passa a verificar se o número do documento a ser lançado já não foi lançado antes.
================================================================================
CM$VER      3.02.09g    09/06/2006
--------------------------------------------------------------------------------
- Acerto no processo de atualização diária
================================================================================
CM$VER      3.02.09f    07/06/2006
--------------------------------------------------------------------------------
Relatórios de Inadimplêcia
   Pend.: 22531 - Passa a utilizar a data de limite de inadimplência na busca dos  valores
                  de movimentação do documento e validação da data limite para
                  pagamento.
================================================================================
CM$VER      3.02.09e    30/05/2006
--------------------------------------------------------------------------------
Recálculo de Documentos
   - Pend. 22481: Validação do usuário de lançamento ao excluir o alterador já existente.
================================================================================
CM$VER      3.02.09d    29/05/2006
--------------------------------------------------------------------------------
Lançamento de Receitas
  Pend. 22461 - Inclusão do campo Histórico Complementar para integração com o Contas a Receber
================================================================================
CM$VER      3.02.09c    26/05/2006
--------------------------------------------------------------------------------
   - Correção na geração da folha de aluguéis pelos imóveis.
================================================================================
CM$VER      3.02.09b    19/05/2006
--------------------------------------------------------------------------------
Rescisão
  Pendência 21437 - Correção do processo de verificação de inadimplência.
================================================================================
CM$VER      3.02.09a    18/05/2006
--------------------------------------------------------------------------------
- Pendencia 19142: Ajustar a busca da data de baixa do documento a receber não 
                             identificados pela data efetiva do recebimento, conforme a view 
                             VWLANCAMENTO
================================================================================
CM$VER      3.02.09     16/05/2006
--------------------------------------------------------------------------------
Liberação do Padrão 5.10.09
Cadastro de Parametrização de Receitas
  Pend 20315 - Inclusão do campo para indicação da Conta Contábil para antecipação de receita
Integração Contábil
  Pend 20315 - Alteração do processo de integração, passando a informar a conta para 
                       antecipação de Receitas
Relatórios - Inadimplência por Contrato -Sintético
   Pend 21494 - Inclusão de filtro por Responsável  
   Pend 21502 - Correção do filtro por Competência. Inclusão da data da última atualização
Relatórios - Inadimplência por Contrato -Analítico
   Pend 21495 - Inclusão de filtro por Responsável  
   Pend 21502 - Correção do filtro por Competência. Inclusão da data da última atualização
Cadastro de Contratos
   Pend 19901 - Inclusão de data de vigência para os imóveis do contrato
Lançamento de Despesas
   Pend 21710 - Permitir selecionar o contrato relacionado a despesa ou area vaga no caso
                        de imóvel locado parcialmente
Cadastro de Imóveis
   Pend 19593 - Validação do País pelo cadastro existente na tabela de Estados
Consulta Inadimplências
   Pend 21165 - Não exibir o contrato caso não tenha documentos inadimplentes.
Recálculos de Documentos
   Pend 18826 - Permitir selecionar documentos já liquidados.
Folha de Aluguéis
   Pend 22113 - Passa a Permitir reajuste com fator acumulado negativo ( Cliente 20041 ).
================================================================================
CM$VER      3.02.08k    18/05/2006
--------------------------------------------------------------------------------
- Pendencia 22378: Permitir reajuste com fator negativo, reduzindo o valor do contrato
================================================================================
CM$VER      3.02.08j    15/05/2006
--------------------------------------------------------------------------------
Consulta Inadimplência por Imóvel
Pendência - 21503
   - Correção da query no relatório "Inadimplência por Imóvel", retirado o filtro por Imóvel
     Mestre.
Consulta Inadimplência por Imóvel Mestre
Pendência - 21815
   - Correção da query no relatório "Inadimplência por Imóvel Mestre".
Consulta Inadimplência por Locatário
Pendência - 21816
   - Correção da query no relatório "Inadimplência por Locatário".
================================================================================
CM$VER      3.02.08i    03/04/2006
--------------------------------------------------------------------------------
- Pendencias 21739 e 21417:
  Acerto no processo de abono de parcelas com baixa manual na BPL.
  Apenas recompilado devido a mudança na BPL do Imobiliario
================================================================================
CM$VER      3.02.08h    23/03/2006
--------------------------------------------------------------------------------
Acréscimos e Descontos
   Pend 21819 - Bloqueio do tamanho da observação do alterador para 60 caracteres
================================================================================
CM$VER      3.02.08g    15/03/2006
--------------------------------------------------------------------------------
Folha de Aluguel
   - Verificação do Flag para Permitir lançamento de receitas fora da competencia gerencial
================================================================================
CM$VER      3.02.08f    09/03/2006
--------------------------------------------------------------------------------
Pend 20488 - Relat. Operacionais - Lançamentos 
    Correção da exibição na tela
Pend 21711 - Cadastro de Contratos
    Correção de erro ao alterar dados do fiador
================================================================================
CM$VER      3.02.08e    08/03/2006
--------------------------------------------------------------------------------
habilitação do menu de Consulta Variação de Índices.
================================================================================
CM$VER      3.02.08d    06/03/2006
--------------------------------------------------------------------------------
Exclusão da folha de aluguel
  - Utilização da rotina de exclusão em 3 camadas
- Compatibilização de executável com BPL
================================================================================
CM$VER      3.02.08a    07/02/2006
--------------------------------------------------------------------------------
Relat. Folha de Aluguel
   - Inclusão do tipo de lançamento por Importação ( IMP )
================================================================================
CM$VER      3.02.08     23/01/2006
--------------------------------------------------------------------------------
- Liberação de versão no padrão 8
Lançamento Múltiplo de Receitas
  - Correção do processo quando do lançamento utilizando o grupo de rateio.
================================================================================
CM$VER      3.02.07h    23/12/2005
--------------------------------------------------------------------------------
- Pendencia 21101: Acerto na tela de Imoveis para alteração/exclusão de complementos
================================================================================
CM$VER      3.02.07g    19/12/2005
--------------------------------------------------------------------------------
- Ajuste na tela de recálculo de documentos
================================================================================
CM$VER      3.02.07f    06/12/2005
--------------------------------------------------------------------------------
- Pendencia 20713: Agrupamento de Documentos ->
                             Discriminar no histórico (boleta) os valores separados quando os
                             documentos estiverem agrupados. Débitos anteriores, serão consolidados
                             em um unico item de Debitos Anteriores.
================================================================================
CM$VER      3.02.07e    05/12/2005
--------------------------------------------------------------------------------
- Pendencia 19914: Criação de parâmetros para identificar o tipo de operação de abono de JCM
                             Ajuste na tela de Conciliação para respeitar esses parâmetros quando indicados
- Pendencia 18828: Na tela de conciliação passou a usar a mesma função de calculo utilizado na tela de consulta de inadimplencias
================================================================================
CM$VER      3.02.07d    22/11/2005
--------------------------------------------------------------------------------
- Pendencia 18724: Acerto  na tela de rescisão contratual com relação aos debitos em relacao ao relatorio de inadimplencias
- Pendencia 20079: Acerto no cadastro de imoveis em relação a inclusao de complementos
================================================================================
CM$VER      3.02.07c    21/11/2005
--------------------------------------------------------------------------------
- Atualização Diária - Correção do processo passando a verificar a data de float para estorno de valor indevido.
================================================================================
CM$VER      3.02.07b    03/11/2005
--------------------------------------------------------------------------------
- Pendencia 19878: Verificação e aviso quando existirem contratos sem geração de documentos de cobrança
- Pendência 19903: Alteração do nome do bem e conjunto quando efetuar a alteração do nome do imóvel
- Pendência 19977: Acerto na tela de contrato de locação para não trazer o valor preenchido
- Pendência 19522: Habilitar o flag de integração com orçamento
- Pendência 20477: Criação de parâmetro para identificar se a data programada do documento será pela data limite ou pela data de vencimento.
                   No processo de integração respeitar esse parâmetro
- Pendência 20479: Preenchimento do campo Tipo de Cobrança no CaR
- Pendência 20481: Acerto no relatório de Consulta de lançamentos
- Pendência 19885: Acerto na rotina de agrupamento de documentos
- Pendência 19871: Acerto na rotina de exclusão no cadastro de imóvel
================================================================================
CM$VER      3.02.07a    11/10/2005
--------------------------------------------------------------------------------
- Integração Contábil / Financeira
  Correção da busca de parametrização por empreendimento ( mestre )
================================================================================
CM$VER      3.02.07     06/09/2005
--------------------------------------------------------------------------------
- Pendência 19875:
  Lançamento de Receitas - bloqueio de lançamento de receita de aluguel para
  imóveis locados, regulado por parâmetro do sistema;
- Pendência 19981
  Relatório - Folha de Aluguel - Implementação de filtro por tipo de receita e lançamento
  manual ou por folha.
- Pendência 18958
  Implementação de Relatório de Listagem de Imóveis por Segmento gerencial ou SPC
- Pendência 19262 / 19526 / 19528
  Tela de Consulta Lançamentos 
   - Inclusão do valor do Saldo do Documento e Nr. do Compromisso Orçamentário
   - Inclusão do nome do usuário e data de lançamento da baixa do documento
   - Inclusão do segmento de imóvel registrado no lançamento
- Atualização Diária
  Correção do processo de atualização quando da múltipla baixa parcial de documentos.
================================================================================
CM$VER      3.02.06a    18/07/2005
--------------------------------------------------------------------------------
- Pendencia 19719:
  Acerto nos cadastros de parametrização de Receitas/Despesas/Operações 
  para que também possa ser informado o Imovel Mestre.
  Acerto nas rotinas de busca dessa parametrização para integração
- Pendência 19283: lançamento múltiplo (para CaP) passa a utilizar no rateio do
   documento o Centro de Custo gravado nos Padrões de Lançamento, se preenchido.
================================================================================
CM$VER      3.02.06     07/06/2005
--------------------------------------------------------------------------------
Liberação do Padrão 5.10.06
Consulta Inadimplência
  - Inclusão do parâmetro para visualizar apenas divergências a maior
================================================================================
CM$VER      3.02.05c    03/05/200
--------------------------------------------------------------------------------
Cadastro de Seguros
  - Inclusão do campo indicador da Situação do contrato: Vigente e Encerrado
Quadro de Avisos
  - Exclusão dos lançamentos de seguros já marcados como encerrados
Consulta de Inadimplências
  - Ajuste do processo de calculo de inadimplências de Alienação conforme a
    regra de calculo definida.
================================================================================
CM$VER      3.02.05b    18/04/200
--------------------------------------------------------------------------------
Relatório de Inadimplencia Analítico
  - Correção na exibição de imóveis em construção
================================================================================
CM$VER      3.02.05a    13/04/200
--------------------------------------------------------------------------------
Parâmetros do Quadro de Avisos
  - Ajuste do campo de dias permitindo registrar avisos com mais de 100 dias
Relatório - Extrato Anual de Contratos
  - Implementação de conversão de valores pelos planos Itamar e FHC
Aviso de Cobrança
  - Disponibilização do campo de Data Programada de Cobrança
Relatório de Inadimplência por contrato - Analítico
  - Implementação de filtro por segmento de imóvel
================================================================================
CM$VER      3.02.05     04/04/2005
--------------------------------------------------------------------------------
Recálculo de Documentos em Aberto
  - Implementação do uso de Regra de Negócios para o Cálculo da Multa por 
    inadimplência
Parâmetros do Sistema
  - Implementação da referência a regra de calculo para multa por inadimplência
Consulta Inadimplências
  - Ajuste na tela para atualizar a data limite de pagamento e não buscar docum.
    com vencimento futuro.
================================================================================
CM$VER      3.02.04n    18/03/2005
--------------------------------------------------------------------------------
Calculo do Fator Acumulado
  - Alterado para não utilizar o método pelo Fator Absoluto.
Histórico de alterações efetuadas no módulo Administração Imobiliária
================================================================================
CM$VER      3.02.04m    10/03/2005
--------------------------------------------------------------------------------
Recálculo de Documentos e Correção de Inadimplência
  - Corrigida a forma de correção para ao informar a utilização do indice do
    mes anterior, considerar esta informação apenas para a correção do último
    mês do ciclo, quando este não estiver cadastrado no GlobalCM.
================================================================================
CM$VER      3.02.04l    08/03/2005
--------------------------------------------------------------------------------
Lançamento de Receitas
  - Implementada a opção de informar a data de emissão para o documento
Recálculo de Documentos
  - Implementada a opção de alterar a data programada do documento
================================================================================
CM$VER      3.02.04j    01/03/2005
--------------------------------------------------------------------------------
Recálculo de Documentos
  - Correção do processo de calculo quando ocorrer baixa parcial do documento.
    O processo irá verificar o tipo de calculo definido no parâmetro do sistema.
================================================================================
CM$VER      3.02.04i    28/02/2005
--------------------------------------------------------------------------------
Cadastro de Contratos
  - Correção da definição de responsável pelo contrato.
================================================================================
CM$VER      3.02.04h    23/02/2005
--------------------------------------------------------------------------------
Lançamento de Receitas
  - Alteração das datas de emissão e lançamento do documento, considerando a data 
    vencimento do documento, quando esta for inferior a data da integração.
================================================================================
CM$VER      3.02.04g    21/02/2005
--------------------------------------------------------------------------------
Cadastro de Contratos
  - Correção da numeração automática do contrato, gravando o nr. apenas ao
    confirmar o cadastramento.
Relatório - Provisão de Perdas
  - Inclusão da possibilidade de Agrupar por segmento e percentual ou percentual
    e segmento.
================================================================================
CM$VER      3.02.04f    15/02/2005
--------------------------------------------------------------------------------
Integração Financeira / Contábil
  - Alteração das datas de Emissão e Lançamento do documento, considerando a data
    da integração e não mais a data contábil, pois o locatário poderá pagar
    antecipado.
================================================================================
CM$VER      3.02.04e    29/03/2005
--------------------------------------------------------------------------------
Recálculo de Documentos
  - Correção da forma de calculo por proporção quando da baixa parcial
  - Correção da busca do fator de correção. Quando não existir nenhuma cotação
    para o período informado e for selecionada a opção de utilizar o índice do 
    mês anterior ( período anterior ), será considerada a última cotação cadas-
    trada.
================================================================================
CM$VER      3.02.04d    14/03/2005
--------------------------------------------------------------------------------
Recálculo de Documentos
  - Melhoria da mensagem de erro ao tentar excluir os alteradores já existentes
    no documento
  - Possibilidade de selecionar um documento liquidado no Contas a Receber pelo
    valor total mas em atraso.
================================================================================
CM$VER      3.02.04c    10/03/2005
--------------------------------------------------------------------------------
Recálculo de Documentos
  - Implementação na etapa de confirmação do recálculo, a opção de alteração da
    data programada para o recebimento (data de vencimento impressa no boleto)
    conforme a data do recálculo.
================================================================================
CM$VER      3.02.04b    25/01/2005
--------------------------------------------------------------------------------
Consulta Lançamentos - Impressão
  - Correção da impressão dos alteradores no relatório
Recálculo de Documentos
  - Atualização do valor total após o recalculo, quando houver alteração manual
    do valor calculado.
  - Correção da forma de calculo da Correção Monetária por indices diários (TIR)
    Considerando o valor da última cotação para os dias restantes, quando for
    especificado para utilizar o indice do mês anterior.
================================================================================
CM$VER      3.02.04a    24/01/2005
--------------------------------------------------------------------------------
Recálculo de Documentos
  - Alteração do processo de cálculo conforme parâmetro definido ( Por diferença
    ou Proporção )
  - Inclusão das informações de cálculo anterior e posterior ao pagamento 
    divergente.
================================================================================
CM$VER      3.02.04     17/01/2005
--------------------------------------------------------------------------------
Utilitários - Agrupa Boleto
  - Inclusão de filtro ignorando a competência
Parâmetros do Sistema
  - Inclusão do parâmetro de forma de calculo de inadimplência:
    Pela diferença ou Pela Proporção, influenciando diretamente na tela de 
    consulta - Inadimplências e Recálculo de Documentos
================================================================================
CM$VER      3.02.03b    07/01/2005
--------------------------------------------------------------------------------
Movimentação
  - Ajuste do calculo pro-rata para reajustes de locação
================================================================================
CM$VER      3.02.03a    19/12/2004
--------------------------------------------------------------------------------
Movimentação
  - Implementação do processo de Apuração de Indicadores de Inadimplência
Relatórios
  - Implementação do relatório de evolução de inadimplências
Cadastro de Indicadores
  - Criação do campo informativo para indicador de inadimplência
Consulta Inadimplências
  - Inclusão de atalho para consulta do cadastro de contratos, locatário e
    documento
Carta de Cobrança - Emissão
  - Registro automático de evento relacionado ao documento
  - Busca automática da próxima carta a ser emitida com base nos parâmetros
    do sistema
Parâmetros do Sistema
  - Exclusão da Guia Quadro de Avisos devido a parametrização deste por usuário
  - Inclusão da Guia Carta Cobranca para parametrização da sequência de cartas
    a serem emitidas
================================================================================
CM$VER      3.02.03     15/12/2004
--------------------------------------------------------------------------------
Relatórios
  - Conta Corrente por Imóvel - Inclusão do filtro por situação do imóvel e 
    imóveis vagos.
  - Implementação de relatório de Receitas de Locação Por M2, tendo como base
    as receitas efetivamente apropriadas com os devidos alteradores.
  - Implementação de relatório de Histórico de Eventos por Contrato
  - Folha de Aluguéis - Inclusão do Nr. do Documento, Nosso Número e Desconto
    programado
Cadastro de Imóveis
  - Inclusão das situações de imóveis: não comercializável e Ação Judicial
  - Inclusão na guia de Valores dos campos de Rentabilidade Prevista
Cadastro de Contratos
  - Inclusão da guia de Descontos Programados para calculo na Folha de Aluguéis
Cadastro de Tipo de Imóvel ( Segmentos )
  - Inclusão do tipo interno de imóvel utilizado pela CM
Recalculo de Documentos
  - Inclusão da possibilidade de alteração do Portador / Forma de Recebimento
  - Geração automática de evento relacionado ao documento
Consulta - Inadimplência
  - Implementação de tela para consulta dos contratos inadimplentes
Cadastro de Eventos
  - Implementação de Eventos para Documentos
  - Implementação de Eventos com avisos Programados
Parâmetro do Quadro de Avisos
  - Implementação de Parametrização dos quadro de avisos por usuário do sistema
Quadro de Avisos
  - Implementação de avisos relacionados a documentos  
================================================================================
CM$VER      3.02.02     14/10/2004
--------------------------------------------------------------------------------
Relatórios
  - Correções no relatório de Histórico Anual de Contratos
  - Correção do relatório de cadastro de seguros
Cadastro de Tipo de Receitas e Despesas
  - Inclusão do campo informando se a receita / despesa influencia no calculo
    da rentabilidade gerencial da carteira.
Exclusão de Lançamentos
  - Bloqueio da exclusão caso a contabilização já tenha sido exportada
Acréscimos e Descontos
  - Inclusão da informação de Observações
================================================================================
CM$VER      3.02.01     17/08/2004
--------------------------------------------------------------------------------
Parâmetros do Sistema
  - Inclusão do parâmetro na guia Padrão - imprime logotipo nos relatórios
Cadastro de Composição Societária
  - Implementação do cadastro para relacionar os empreendedores dos imóveis mestres
Cadastro de Seguros
  - Implementação do valor detalhado por ramo de cobertura
Relatórios
  - Listagem de Imóveis: Inclusão da Composição Societária, Nr. de Vagas,
    Fração Ideal e valor da última reavaliação
  - Listagem de Seguros: Inclusão do detalhe por ramo de cobertura
  - Implementação de Relatório de Histórico Anual de Contratos
  - Implementação de Relatório de Inadimplência Analítico por documento
  - Inclusão da impressão do Logotipo da Fundação em todos os relatórios
================================================================================
CM$VER      3.02.00     22/06/2004
--------------------------------------------------------------------------------
Cadastro de Imóveis
  - Implementação da segregação por quantidade de cotas
Relatórios
  - Listagem de Contratos: Inclusão das informações de tipo de fiança e observação da fiança
  - Implementação de Conta Corrente por Plano e Patrocinadora
================================================================================
CM$VER      3.01.17a    27/05/2004
--------------------------------------------------------------------------------
Cadastro de Contratos
  - Permitir o um novo contrato para o imóvel no mesmo dia da rescisão do
    contrato anterior
  - Correção de erro na busca de contrato por imóvel
================================================================================
CM$VER      3.01.17     14/05/2004
--------------------------------------------------------------------------------
Quadro de Avisos
  - Bloqueio do Duplo-Clique para usuários não autorizados
Cadastro de Imóveis
  - Inclusão do guia para cadastramento de imagens dos imóveis
  - Fusão das guias de Observações e Desmembramentos
Movimentação
  - Criação do processo de Suspensão Contratual
================================================================================
CM$VER      3.01.16     14/04/2004
--------------------------------------------------------------------------------
Quadro de Avisos
  - Ajuste do processo de verificação, considerando as datas de carência do contrato
  - Inclusão do nome do Responsável pelo contrato
Lançamento Multiplo de Despesas
  - Possibilidade de informar imóveis de segmentos diferentes no mesmo documento
  - Possibilidade de informar valores de alteradores diferentes por segmento de imóvel
  - Possibilidade de informar a data de lançamento contábil fora da competência gerencial
    obrigando a liberação. ( definido em Parametros do Sistema )
  - Integração automática do documento ao término do lançamento
Alteração de Lançamento de Despesas
  - Integração automática do documento ao término do lançamento
Lançamento Múltipo de Receitas
  - Possibilidade de informar a data de lançamento contábil fora da competência gerencial
    obrigando a liberação. ( definido em Parametros do Sistema )
Parâmetros do Sistema
  - Inclusão na guia Lançamentos, de Parâmetro para permitir o registro contábil fora da 
    competência gerencial.  
  - Inclusão da guia Operações Contábeis para parametrização das operações de Atualização
    de documentos, provisionamento de perdas e provisão de contratos de locação
Cadastro de Receitas e Despesas
  - Inclusão do tipo "Operação" para classificação
  - Inclusão do registro para o 2º lançamento contábil para Receita
Cadastro de Parâmetros de Operações
  - Implementação da tela para parametrização das operações contábeis
Ajuste de Provisão Diária
  - Inclusão das opções de contabilização diária das operações de atualização de documentos,
    provisionamento de perdas e provisão de contratos de locação.
Relatórios
  - Criação do relatório para listar os lançamentos contábeis feitos fora da competência
    gerencial.
Cadastro de Imóveis
  - Inclusão do campo para registro de classificação do Segmento de imóveis para o SPC
================================================================================
CM$VER      3.01.14     01/12/2003
--------------------------------------------------------------------------------
Relatórios
  - Implementação de relatório gerencial - Movimentação Financeira
Quadro de Avisos 
  - Implementação de aviso por ausência de receita de aluguel
Integração financeira
  - Ajuste do processo, permitindo inclusão de documentos com o mesmo número
Cadastro de Contratos
  - Inclusão dos campos de Percentual e Quantidade para multa rescisória
  - Inclusão de botão para visualização da descrição da regra para multa rescisória
================================================================================
CM$VER      3.01.13a    19/08/2003
--------------------------------------------------------------------------------
Mensagens de Boleto
  - Inclusão do Curinga para a Competência do Lançamento
================================================================================
CM$VER      3.01.13     01/08/2003
--------------------------------------------------------------------------------
Utilização da bpl: CMImobiliarioObj50.bpl
Parametros do Sistema
  - Inclusão da informação de Grupo de Regras utilizadas pelo módulo
Cadastro de Contratos
  - Inclusão da seleção da regra para calculo da multa rescisória
  - Inclusão de processo para verificação do valor da multa rescisória
Rescisão Contratual
  - Implementação em 3 camadas
  - Inclusão da verificação de débitos do contrato
  - Calculo e cobrança de multa rescisória. 
================================================================================
CM$VER      3.01.12e    29/07/2003
--------------------------------------------------------------------------------
Conciliação de Documentos
  - Ajuste da exibição do relatório
================================================================================
CM$VER      3.01.12b    27/06/2003
--------------------------------------------------------------------------------
Cadastro de Grupos
  - Implementação da funcionalidade de Multipla Seleção de Imóveis para inclusão
Etiquetas de Cobrança
  - Incorporação da Pessoa de Contato na configuração da etiqueta
Quadro de Avisos
  - Implementação da Funcionalidade
Parâmetros do Sistema
  - Inclusão da guia de parâmetros para o Quadro de Avisos
Implementação em 3 camadas:
  - Cadastro de Seguros - Criação de guias individuais para Cobertura e Observações
Cadastro de Contratos
  - Fusão das guias de Vencimento com Cobrança / Reajuste
  - Inclusão da guia de Valor Futuro, permitindo informar variação de valores específicos
    por ano por imóvel do contrato
Folha de Aluguéis
  - Alteração do calculo de reajuste, verificando Valor Futuro de Imóveis
================================================================================
CM$VER      3.01.10d    04/06/2003
--------------------------------------------------------------------------------
Lançamento Multiplo de Despesas
  - Inclusão do Nr. do Compromisso Orçamentário que será efetivado ( exibido apenas 
    com parâmetro de integração orçamentária ligado )
Relatórios de Inadimplência
  - Ajuste dos valores devidos, descontando as baixas parciais de documentos
Recalculo de Documentos
  - Ajuste do processo, efetuando o recalculo com base no Saldo do Documento em aberto
================================================================================
CM$VER      3.01.10c    30/05/2003
--------------------------------------------------------------------------------
Alteração de Lançamentos de Despesa
  - Alterado para permitir a alteração de documento com AP já impressa, mantendo a mesma numeração
================================================================================
CM$VER      3.01.10b    28/05/2003
--------------------------------------------------------------------------------
Folha de Aluguéis
  - Ajuste no calculo da data de vencimento quando informado no contrato a opção de Dias Úteis
Relatórios
  - Implementação de relatório de listagem de Seguros
Recalculo de Documentos
  - Ajustes no calculo de Correção Monetária utilizando o indice do mes anterior ao lançamento
================================================================================
CM$VER      3.01.10a    12/05/2003
--------------------------------------------------------------------------------
Contabilização Diária
  - Rateio do valor contábil pelos Nr. de dias efetivos do lançamento no mês
  - Rateio de despesas anuais com em período variado
Lançamento Múltiplo de Receitas e Despesas
  - Inclusão do período de rateio para Contabilização diária do lançamento
Relatórios
  - Implementação de relatório de Provisão Diária de Perdas
================================================================================
CM$VER      3.01.09r    17/04/2003
--------------------------------------------------------------------------------
Cadastro de Imóveis e Contratos
  - Inclusão de botão de atalho para os cadastros de pessoa ( locatario, responsável, cartório, administradora )
  - Habilitação da data de início de Carência do contrato
================================================================================
CM$VER      3.01.09o    02/04/2003
--------------------------------------------------------------------------------
Integração Contábil / Financeira
  - Ajustes na verificação de despesa sobre responsabilidade do locatário
================================================================================
CM$VER      3.01.09m    27/03/2003
--------------------------------------------------------------------------------
Cadastro de Parâmetros
  - Inclusão de valor pardrão para Receitas em Contratos de Locação
  - Inclusão de indicador permitindo o lançamento de despesas para imóveis inativos, obrigando liberação
Lançamento Múltiplo de Despesas
  - Possibilidade de efetuar um lançamento em imóveis inativos, quando o mesmo estiver habilitado nos parâmetros do sistema.
Cadastro de Imóveis
  - Ajuste do aviso de imóvel ocupado / desocupado
  - Otimização da função para atualizar a ocupação dos imóveis
Cadastro de Contratos
  - Inclusão do processo para atualização da ocupação dos imóveis relacionados
    ao contrato alterado
Principal
  - Inclusão de teclas de atalho para as funções de:
    Cadastro de Imóveis e Contratos
    Lançamentos Múltiplos de Receitas e Despesas
================================================================================
CM$VER      3.01.09l    17/03/2003
--------------------------------------------------------------------------------
Cadastro de Imoveis
  - Ajuste na classificação de Status do Imovel de Acordo com a Situação do mesmo
================================================================================
CM$VER      3.01.09k    06/03/2003
--------------------------------------------------------------------------------
Cadastro de Imóveis
  - Ajustes para excluir as informações RichText dos campos de observações quando os mesmos 
    estiverem em branco
Cadastro de Contratos
  - Ajustes para excluir as informações RichText dos campos de observações quando os mesmos 
    estiverem em branco
Lançamentos de Receitas
  - Possibilidade de inclusão de receita em imóvel nunca locado, obrigando liberação
Integração de Lançamentos
  - Contabilização por Partida Dobrada, mediante especificação em parâmetros da Contabilidade.
Parâmetros
  - Inclusão de indicador de quantidade de meses a ser liberado após o fechamento da 
    contabilização diária
Relatórios
  - Aluguel por M2 - ajuste do filtro por imovel mestre
================================================================================
CM$VER      3.01.09h    23/12/2002
--------------------------------------------------------------------------------
- Correção do bloqueio para inclusão de lançamentos quando não foi efetuado
  o Fechamento da Contabilização Diária.
================================================================================
CM$VER      3.01.09b    07/11/2002
--------------------------------------------------------------------------------
- Correção do processo de Integração Fianceira / Contábil
================================================================================
CM$VER      3.01.09     04/11/2002
--------------------------------------------------------------------------------
Folha de Aluguéis
  - Incorporação de filtro por Indice de Reajuste
Exclusão da Folha de Aluguéis
  - Incorporação de filtro por Indice de Reajuste
Implementação em 3 camadas:
  - Cadastro de Imóveis
      Principais alterações: Layout
                             Manutenção de eventos e dados complementares na própria tela
                             Formatação de descrição e observações pelo menu PopUp
                             Auto-Detecção de URL na descrição e observação
                             Registro automático de evento na alteração de Valor de Mercado
                             Associação da cidade cadastrada no Módulo Global
                             Bloqueio de alteração da situação do imóvel, valor de compra e
                             última reavaliação, quando utilizar o Investimob ( definido no
                             parâmetro do módulo ).
  - Cadastro de Contratos de Imóveis
      Principais alterações: Layout
                             Manutenção de eventos na própria tela
                             Formatação de observações pelo menu PopUp
                             Auto-Detecção de URL nas observações
                             Registro automático de evento na alteração da situação contratual
  - Cadastro de Mensagens de Boleto
================================================================================
CM$VER      3.01.08g    03/10/2002
--------------------------------------------------------------------------------
Implementação em 3 camadas:
  - Cadastro de Administradoras
  - Cadastro de Cartórios
  - Cadastro de Compradores / Locatários
  - Cadastro de Fiadores
  - Cadastro de Proponentes / Proprietários
  - Cadastro de Responsáveis
  - Cadastro de Seguradoras
  - Cadastro de Grupo de Imóveis
Relatórios
  - Contabilização Diária ( Novo )
================================================================================
CM$VER      3.01.08f    16/09/2002
--------------------------------------------------------------------------------
Previsões Diária ( Novos Processos )
  - Calcula Previsão
  - Edita Previsão
  - Ajusta Previsão
  - Encerramento do Mês
  - Desfaz Encerramento
Parâmetros do Sistema
  - Inclusão dos parâmetros para contabilização diária
Consulta de Lançamentos
  - Inclusão da visualização das baixas do documento em Alteradores / Baixas
Cadastro de Tipos de Receitas e Despesas
  - Correção da seleção do tipo de documento por tipo de lançamento
  - Inclusão da periodicidade para contabilização diária
Cadastro de Parâmetros para integração financeira / contábil
  - Inclusão do tipo de parametrização para contabilização diária
Implementação em 3 camadas:
  - Cadastro de Eventos por Imóvel     ( não será possível editar eventos do sistema )
  - Cadastro de Eventos por Contrato   ( não será possível editar eventos do sistema )
Relatórios
  - Comparativo de folha de Aluguel
      Inclusão das datas de vigência do contrato
  - Conta Corrente por imóvel mestre
      Inclusão do totalizador geral do relatório
  - Conta Corrente por Locatário
      Inclusão do Nr. do contrato no relatório e a possibilidade de ordenação pelo mesmo
  - Novo relatório cadastral
      Parametrização Contábil 
================================================================================
CM$VER      3.01.08e    19/08/2002
--------------------------------------------------------------------------------
Criadas novas restrições para datas de lançamento:
Se Data Lançamento ( 01/08/2002 )  for dentro da Competência ( 08/2002 ) - Lançamento OK
Se Data Lançamento ( 01/09/2002 ) for maior que a Competência ( 08/2002 ) - Lançamento rejeitado
Se Data Lançamento ( 01/07/2002 ) for menor que a Competência  ( 08/2002 ) - O usuário é informado e precisa confirmar a mesma
TELAS AFETADAS:
-Lançamento Múltiplo de Despesas
-Lançamento Múltiplo de Receitas
-Lançamento Rateado de Despesas
-Alteração de Lançamentos
-Folha de Aluguéis
--Conversão dos seguintes cadastros para 3 camadas:
Cadastros - Receitas e Despesas - Parâmetros para Integação Financeira / Contábil - Despesas (Documentação)
Cadastros - Receitas e Despesas - Parâmetros para Integação Financeira / Contábil - Receitas (Documentação)
================================================================================
CM$VER      3.01.08d    12/08/2002
--------------------------------------------------------------------------------
Cadastro de Contratos
  - Verificação de Consistência do Percentual de Rateio de Imóveis entre os contratos
    ativos no mesmo período
Lançamento Múltiplo de Despesas
  - Vinculação do contrato ao lançamento quando o imóvel estiver locado
================================================================================
CM$VER      3.01.08b    20/06/2002
--------------------------------------------------------------------------------
--Correção do frmProgresso
--Inclusão do default de Atividade/Projeto no cadastro de parâmetros de receitas e despesas
================================================================================
CM$VER      3.01.08a    18/06/2002
--------------------------------------------------------------------------------
--Incluído tela para cadastro de situações contratuais em: Cadastros - Contratos - Situação Contratual
--Na tela de Cadastros de contratos de locação: inclusão da seleção de Situação Contratual e na guia de Imóveis inclusão do código do imóvel
--Inclusão do filtro Situação Contratual no relatório de extrato contratual
--Conversão dos seguintes cadastros para 3 camadas:
Alteradores por Tipo de Imóvel
Atividades / Segmentos
Marcas e Franquias
Dados Complementares - Tipos de Dados Complementares
Dados Complementares - Tipos de Dados por Tipo de Imóvel
Dados Complementares - Dados Complementares de Imóveis
Dados Complementares - Dados Complementares de Unidades Autônomas
Dados Complementares - Dados Complementares de Propostas
Indicadores - Tipos de Indicador
Indicadores - Tipos de Indicador por Tipo de Imóvel
Indicadores - Indicadores apurados por Imóvel
Indicadores - Indicadores apurados por Unidade Autônoma
Receitas e Despesas - Tipos de Receitas e Despesas
================================================================================
CM$VER      3.01.08     15/05/2002
--------------------------------------------------------------------------------
-Criação do relatório de Extrato Contratual, calculando para valores futuros a inadimplência do Contrato de Locação
-Acertos na tela de Alteração de Lançamentos, nas inclusões dos alteradores.
-Inclusão no relatório de lançamentos dos alteradores do lançamento.
-Liberado Help do Sistema.
================================================================================
CM$VER      3.01.07b    03/05/2002
--------------------------------------------------------------------------------
Acertos internos no sistema para compilação com padrão 5.06.00
================================================================================
CM$VER      3.01.07a    16/04/2002
--------------------------------------------------------------------------------
Otimizações na tela de exclusão da folha de aluguéis. Agora a mesma é informada por contrato.
================================================================================
CM$VER      3.01.07     05/04/2002
--------------------------------------------------------------------------------
Mudanças na VWLANCAMENTO a fim de se obter ganhos de performance.
================================================================================
CM$VER      3.01.06c    02/04/2002
--------------------------------------------------------------------------------
-- Cadastro de Grupo de Imóveis, inserido no momento da inclusão de um imóvel novo ao grupo a informação do código do mesmo no SAF 
-- Alteração de Lançamentos, acertos no botão procurar e continuar da tela inicial. 
-- Lançamento Múltiplo de Receitas, acerto da query de rateio para imóveis que participam em dois grupos 
-- Integração de Lançamentos, inserido um campo para visualização dos detalhes dos lançamentos, que por padrão vem desmarcado, visando ganho e performance. E inclusão do erro do banco, quando o mesmo ocorrer na última tela.
-- Conciliação de Lançamentos, gerando boleto complementar com divergências apuradas 
-- Contratos de Locação, inclusão de botão para apagar responsável 
-- Folha de Aluguéis, inclusão do responsável por contrato logado.
================================================================================
CM$VER      3.01.06b    18/03/2002
--------------------------------------------------------------------------------
- Na tela de conciliação de lançamentos, gerando lançamento para cobrança de divergências
- Na tela de consulta de lançamentos inserida a informação do total dos alteradores
- Nas telas de recálculo de cobranças em aberto e conciliação de lançamentos, utilizando índice de correção monetária para contratos em aberto ao invéz do índice de correção do aluguel.
================================================================================
CM$VER      3.01.06a    12/03/2002
--------------------------------------------------------------------------------
-Correção na tela de alteração de lançamentos, em alguns casos de imóveis que possuiam contratos rescindidos estava trazendo o mesmo duas vezes.
-Reestruturação dos menus do sistema - Menu Sistema Ferramentas - passa para Sistema Configuraçao
================================================================================
CM$VER      3.01.06     11/03/2002
--------------------------------------------------------------------------------
- Implantação da tela de alteração de lançamentos não integrados.
- Impressão dos lançamentos não integrados nas telas de lançamentos múltiplos de despesa, alteração de lançamentos e consulta de lançamentos.
- Alteração da tela de consulta de Indices, informação da periodicidade e tipo de moeda.
- Reestruturação dos ítens de menu principal. Some o menu análise, suas funcionalidades são incorporadas em consultas e lançamentos.
================================================================================
CM$VER      3.01.05e    21/02/2002
--------------------------------------------------------------------------------
- Inclusão no cadastro de imóveis da informação dos desmembramentos anteriores
- Correção da tela de recálculo de cobrança. Acerto da mensagem do boleto.
================================================================================
CM$VER      3.01.05d    19/02/2002
--------------------------------------------------------------------------------
Correções na tela de lançamento múltiplo de receitas:
- Uso correto do parâmetro do sistema (Permitir contratos encerrados em lançamentos a receber)
- Acerto na tela de consulta (MontaSelect) de imóveis  para contratos vigentes
- Acerto na tela de consulta (MontaSelect) de imóveis  para contratos encerrados/rescindidos
================================================================================
CM$VER      3.01.05c    06/02/2002
--------------------------------------------------------------------------------
Verificação de erro na FUNCEF no lançamento múltiplo de despesas, não estava gravando o idmodulo. 
Foi verificado que o procedimento estava correto, apenas liberação de versão.
================================================================================
CM$VER      3.01.05b    04/02/2002
--------------------------------------------------------------------------------
Possibilidade de se apurar Eventos para o Imóvel Mestre
================================================================================
CM$VER      3.01.05a    18/01/2002
--------------------------------------------------------------------------------
SOLICITAÇÃO USUÁRIO: AUMENTAR O CAMPO DE DIGITAÇÃO DA OBSERVAÇÃO DA AP
-Criado o FLGHISTCONTDIFAP em parâmetros sistema, na aba Parâmetros de Integração:
Histórico Contábil (concatenado) diferente da observação da AP
- Ateradas as telas de Lançamentos Múltiplos de Receitas e de Despeas e Lançamento Rateado, permitindo de acordo com o parâmetro do sistema acima, a digitação da OBS da AP com 1000 caracteres.
- Alterada a rotina de integração contábil para aceitar o parâmetro acima, forma de concatenação do histórico contábil:
   ex: DOC: 001, a receber, ref: Aluguel - comp: Janeiro/2002 - vencimento 05/02/2002 - forma: Folha de Aluguéis
================================================================================
CM$VER      3.01.04     10/12/2001
--------------------------------------------------------------------------------
Customizações na parametrização financeira/contábil:
- Se a fundação não preencher a conta de Ativo / Passivo, o sistema pegara a mesma do cadastro de Cliente / Fornecedor. (REFER)
- Se a conta de Ativo / Passivo obrigar sub-conta, a mesma será a do cadastro de Cliente / Fornecedor. (FCRT)
- Se a conta de Resultado obrigar sub-conta, a mesma será a do Imóvel ou do Imóvel Mestre, na ordem. (FCRT - FUNCEF)
================================================================================
CM$VER      2.08.10     28/08/2000
--------------------------------------------------------------------------------
- Lançamentos e Contabilização levando em conta Plano/Patrocinadora;
- Relatório de conferência da Folha de Aluguéis;
- Desfazer Folha de Aluguéis;
================================================================================
CM$VER      2.08.05     25/05/2000
--------------------------------------------------------------------------------
01)	Contratos de Locação
Novo "tipo" de Fiança: "Outros";
Novo campo: observações da Fiança;
Acerto do nº de casas decimais dos valores/percentuais contratuais;
02)	Custo Contábil
Tratamento de atualização monetária no custo contábil dos imóveis (adequação ao novos tipos de movimentação do Ativo Fixo);
03)	Barras de rolagem vertical nos campos de observação
04)	Responsáveis pelo pagamento de despesas:
Novo formulário de Responsáveis pelo Pagamento por Imóvel;
Novo formulário de Responsáveis pelo Pagamento por Contrato;
05)	Novos Relatórios:
Inadimplência por Imóvel;
Inadimplência por Imóvel Mestre;
Inadimplência por Contrato;
Inadimplência por Locatário;
Listagem de Propostas de Novos Negócios;
06)	Cadastro de Atividades (e campo de Atividade no Contrato)
07)	Novos parâmetros do Sistema:
Prorrogação / rescisão contratual quando do término da vigência;
Antecedência de avisos de Eventos Contratuais;
Sugerir próximo Número do Contrato;
Concatenar o ano corrente com o número sugerido;
              Obriga seleção de Atividade nos Contratos;
- Resolução da Pendência Nº 977
  > Tela\Opçao No Sistema: Indicadores por Imóvel
  Replicar em tela independente o cadastro de indicadores por imóvel (para facilitar cadastro)
- Resolução da Pendência Nº 980
  > Tela\Opçao No Sistema: Geração de Lançamentos
  Mensagens CNAB
- Resolução da Pendência Nº 1054
  > Tela\Opçao No Sistema: (?)
  Criação da uma tabela para arquivo de mensagens, com formato parecido com MensagensCNAB, porém de caráter estático
- Resolução da Pendência Nº 1699
  > Tela\Opçao No Sistema: Várias
  - Trocar a ordem Imóvel Mestre / Imóvel em todos os MontaSelect que busquem Imóvel;
- Resolução da Pendência Nº 1765
  > Tela\Opçao No Sistema: --- Relatórios ---
  Verificar em quais consultas / relatórios a DATALANCTO (LanctoDocum) é usada e trocá-la pela DATAVENCIMENTO (Documento) quando a operação for do tipo '2'
- Resolução da Pendência Nº 1810
  > Tela\Opçao No Sistema: --- Várias ---
  Exibir sempre o Nº do Contrato ao lado do Nome do Contrato, em todos os pontos de relevância
- Resolução da Pendência Nº 1829
  > Tela\Opçao No Sistema: Tipos de Imóvel
  Incluir na tela de cadastro de Tipo de Imóvel os alteradores ligados a cada caso: Descontos/Abatimento, Juros, Multa, Correção Monetária
- Resolução da Pendência Nº 1835
  > Tela\Opçao No Sistema: --- Nova ---
  Criar uma função para recalcular TODOS os saldos da(s) carteira(s) de investimento onde constem Imóveis.
- Resolução da Pendência Nº 1836
  > Tela\Opçao No Sistema: --- Relatórios ---
  Criar novo relatório que compare o saldo do investimento na carteira com o custo contábil do imóvel
- Resolução da Pendência Nº 1837
  > Tela\Opçao No Sistema: Folha de Aluguéis e Folha de Remunerações
  Verificar como é feita a passagem de texto / observações para o boleto bancário
================================================================================
CM$VER      2.08.04     12/05/2000
--------------------------------------------------------------------------------
1)	Reajuste contratual:
correção do registro da data de aplicação;
registro do percentual de reajuste;
2)	Contrato de Locação:
exibição do percentual de reajuste no histórico;
exibição do valor original do contrato com 2 casas decimais;
abertura de mais 2 casas decimais no percentual dos juros de mora;
3)	Relatórios de Conta-Corrente (por Imóvel, Imóvel Mestre, Contrato e Locatário)
opções variadas de ordenação;
novo filtro: valor previsto / valor efetivo;
4)	Listagem de Contratos / Listagem de Imóveis
ajuste na impressão do título dos relatórios;
opções variadas de ordenação;
5)	Imóveis
novo campo: código (hierárquico) do imóvel;
6)	Estorno de Lançamentos
inclusão do Nº do Contrato no MontaSelect;
================================================================================
CM$VER      2.08.03a    08/05/2000
--------------------------------------------------------------------------------
Relatório de Aluguéis / m2
     - Novo filtro: Aluguel > 0;
     - Novo filtro: Área útil > 0;
Listagem de Imóveis
     - Novo filtro: Área útil > 0;
     - Novo filtro: Valor de Aquisição <> 0;
Cadastro de Imóveis
     - Retirada do campo "Percentual de Rateio" (será substituído pelos "Grupos de Rateio");
     - Novo campo: "Situação";
     - Habilitação do Cartório;
     - Retirada do cadastro de Indicadores (agora só exibe - o cadastro está em tela separada);
     - Exibição dos Dados Complementares;
Cadastro de Indicadores por Imóvel em tela separada;
Consulta de Custo Contábil por Imóvel: pequenas alterações e ajustes;
Mapa de Rentabilidade:
     - Novo filtro: Exibir apenas contratos vigentes atualmente;
     - Nova opção: Não corrigir o valor de aquisição;
Relatórios de Conta-Corrente (por Imóvel, Imóvel Mestre, Contrato e Locatário)
     - Novo filtro: "Lançamentos a pagar / a receber / ambos";
Relatório de Conta-Corrente por Contrato
     - Novo filtro: Administradora;
================================================================================
CM$VER      2.08.02i    20/04/2000
--------------------------------------------------------------------------------
Ajsutes nos Relatórios:
     - Mapa de Rentabilidade por Contrato;
     - Quadro de Aluguéis por m2;
     - Contratos por Administradora (Analítico).
Lógica de agrupamento de documentos de cobrança (p/ emissão de boletos) refeita, com ganho de velocidade.
================================================================================
CM$VER      2.08.02e    15/04/2000
--------------------------------------------------------------------------------
Relatórios:
     - Novo relatório: Custo Contábil por Imóvel (Sintético);
     - Novo relatório: Custo Contábil por Imóvel Mestre (Sintético);
     - Relatório Custo Contábil por Imóvel renomeado para: Custo Contábil por Imóvel (Analítico);
     - Relatório Custo Contábil por Imóvel Mestre renomeado para: Custo Contábil por Imóvel Mestre (Analítico);
     - Mapa de Rentabilidade por Contrato: ajustes;
     - Quadro de Aluguéis por m2: ajustes;
     - Contratos por Administradora (Analítico): ajustes;
     - Listagem de Imóveis agora exibe Valor de Aquisição.
================================================================================
CM$VER      2.08.02c    10/04/2000
--------------------------------------------------------------------------------
- Ajustes no formulário de recálculo de cobranças em atraso;
- Mapa de Rentabilidade por Contrato;
================================================================================
CM$VER      2.08.02     06/04/2000
--------------------------------------------------------------------------------
Consolidação das alterações desde a versão 2.07.09, mais:
- Ajuste no formulário de parâmetros da Listagem de Imóveis;
- Novo campo no Contrato de Locação: Prazo de Repasse;
================================================================================
CM$VER      2.08.01n    05/04/2000
--------------------------------------------------------------------------------
- Pequenas alterações no menu principal do sistema, para maior clareza;
- Cadastro de Bens (novos): adequação do campos às novas definições do Ativo Fixo;
- Cadastro de Contratos de Remuneração: ajustes na definição dos campos;
- Cadastro de Imóveis: ajustes no cadastro das observações;
- Cadastro de Contratos de Locação: possibilidade de se incluir imóveis com aluguel zero;
================================================================================
CM$VER      2.08.01m    03/04/2000
--------------------------------------------------------------------------------
- Alterações no cadastro de Imóveis;
          - Eventos por Imóvel;
          - Observações de Imóvel;
- Cadastro de Propostas de Novos Negócios;
          - Histórico de Propostas;
          - Dados Complmentares;
- Cadastro de Unidades Autônomas;
- Cadastro de Cartórios;
- Cadastro de Responsáveis;
================================================================================
CM$VER      2.07.09b    11/02/2000
--------------------------------------------------------------------------------
- Versão contendo a uAtivoFixo com correção de contabilização.
================================================================================
CM$VER      2.07.08a    11/02/2000
--------------------------------------------------------------------------------
- Verificação de duplicidade de bens em Operações com Imóveis;
================================================================================
CM$VER      2.07.08     11/02/2000
--------------------------------------------------------------------------------
- Cadastro de Mensagens para boleto;
- Cadastro de Gestores de Carteiras;
- Ajustes diversos;
- Recálculo de Saldos de Carteira;
================================================================================
CM$VER      2.07.07     20/01/2000
--------------------------------------------------------------------------------
- Estorno de Acréscimo;
- Estorno de Reavaliação;
- Ajsutes no Recibo;
- Ajustes e novas funcionalidades no Aviso de Cobrança;
================================================================================
CM$VER      2.07.04     04/11/1999
--------------------------------------------------------------------------------
- Versão com todas as funcionalidades completas:
     - Nova Folha de Aluguéis (antiga Geração de Lançamentos);
     - Nova Folha de Remunerações;
     - Cadastro de Contratos de Remuneração agora baseado em Imóveis Mestre;
- Ainda aguardando implementação de Estornos (Investimento e Ativo Fixo);
================================================================================
CM$VER      2.07.03     14/10/1999
--------------------------------------------------------------------------------
- Versão inicial de produção, com :
     - Operações com Imóveis, compra e venda parcelada;
     - Integração com Ativo Fixo;
     - Reavaliação de Imóveis;
- Aguardando implementação de Estornos (Investimento e Ativo Fixo)
================================================================================
CM$VER      2.06.01     04/08/1999
--------------------------------------------------------------------------------
- Inclusão dos cadastros ligados a Investimento, necessários para integração com Gestão de Investimentos;
- Integração de Operações com Cotas com Contabilidade, Contas a Pagar/Receber, Ativo Fixo e Gestão de Investimentos;
================================================================================
CM$VER      2.05.03     10/06/1999
--------------------------------------------------------------------------------
- Cadastro de Contratos:
          - Novo campo: Mora proporcional;
- Cadastro de Tipos de Despesas;
- Cadastro de Tipos de Operações de Investimento;
================================================================================
CM$VER      2.05.02     07/06/1999
--------------------------------------------------------------------------------
- Cadastro de Contratos:
          - Novo campo: Mês de Referência do Índice de Reajuste;
================================================================================
CM$VER      2.05.01     31/05/1999
--------------------------------------------------------------------------------
- Pequenos ajustes em Cadastro de Contratos;
          - 4 novos campos: Dias de Tolerância e Tipo de Dia de Vencimento, Complemento e Tolerância;
- Pequenos ajustes em Cadastro de Imóveis;
================================================================================
CM$VER      2.04.02     27/05/1999
--------------------------------------------------------------------------------
- Ajustes em Cadastro de Contratos;
          - 2 novos campos: Data de Renegociação e Data de Aviso de Renegociação;
================================================================================
CM$VER      2.04.01     26/05/1999
--------------------------------------------------------------------------------
- Novos Parâmetros do Sistema;
- Nova parametrização contábil;
- Ajustes em Cadastro de Locatários;
- Ajustes em Cadastro de Contratos;
- Ajustes em UOperacaonvest;
- UOperacaonvest retirada do sistema;
================================================================================
CM$VER      2.03.02     06/05/1999
--------------------------------------------------------------------------------
- Cadastro de Contratos - novos campos;
- Tela de Operações com Cotas;
- Diversas funcionalidades desabilitadas (dependem de implementação em função de mudanças);
- UOperacaoInvest
================================================================================
CM$VER      2.03.01     03/05/1999
--------------------------------------------------------------------------------
- Cadastro de Contratos - novos campos:
          - Data de fim da Carência - ConDataCarencia (ContratoImovel)
          - Data de aviso da Denúncia - ConDataAvDenuncia (ContratoImovel)
          - Rateio - FlgRateio (ContratoXImovel)
          - Percentual do Rateio - CimPercentRateio (ContratoXImovel)
- Novo item de menu: Movimentações
================================================================================
CM$VER      2.02.03     03/05/1999
--------------------------------------------------------------------------------
- Cadastro de Locatários
          - Gravação dos dados referentes a Cliente e Favorecido
- Correção do campo ANALITICOSINTETICO do Centro de Responsabilidade
================================================================================
CM$VER      2.02.02     22/04/1999
--------------------------------------------------------------------------------
- Tipos de Custos e Receitas por Imóvel
          - Correção da associação entre custo/receita e pagar/receber no Tipo de Documento
- Imóveis
          - Correção do preenchimento do Estado quando do aproveitamento de um endereço já cadastrado
- Pessoas (todos)
          - Máscara para CEP
================================================================================
CM$VER      2.02.01     08/04/1999
--------------------------------------------------------------------------------
- Contrato
          - Cadastro de tipo de Fiança / Fiador;
          - Cadastro das datas de témino da Fiança e de aviso;
          - Exibição dos reajustes;
          - Alterações no ValorAjustado e DataProxReajuste;
          - Verificação do Imóvel antes da inclusão no Contrato;
- Alteração automática do status de ocupação dos Imóveis;
================================================================================
CM$VER      2.01.02     05/04/1999
--------------------------------------------------------------------------------
- Imóvel
          - Diminuição das dimensões da tela;
          - Pequenos ajustes no cadastro de Indicadores;
          - Máscara para o CEP;
          - Fim da obrigatoriedade da escolha de Administradora;
- Contrato
          - Diminuição das dimensões da tela;
          - Acerto da gravação da periodicidade da mora;
          - Acerto do valor default para prazo indeterminado; 
          - Acerto do valor default para cobrança do complemento no mês posterior;
- Custos e Receitas por imóvel
          - Diminuição das dimensões da tela;
- Lançamentos
          - Diminuição das dimensões da tela;
================================================================================
CM$VER      2.01.01     01/04/1999
--------------------------------------------------------------------------------
Versão inicial
================================================================================
CM$ALT}




















































































































































































