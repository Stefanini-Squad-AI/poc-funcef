{-------------------------------------------------------------------------------
--------------------- ALTERAÇÕES / IMPLEMENTAÇÕES ------------------------------
--------------------------------------------------------------------------------
N. SIG..........: WO7622
Data............: 08/02/2024
Responsável.....: Helen V Bianchi
Descrição.......: Inclusão dos fontes  FCadContrXUsuMT e uCtrlContrXUsuario.
--------------------------------------------------------------------------------
N. SIG..........: 103333
Data............: 15/02/2022
Responsável.....: Everson Cunha
Descrição.......: Inclusão do fonte   uDbNegociacao.
--------------------------------------------------------------------------------
N. SIG..........: 46231
Data............: 30/08/2019
Responsável.....: Everson Cunha
Descrição.......: Inclusão do fonte   uDbContratoAreaGestora.
--------------------------------------------------------------------------------
N. Sol..........: 242313/17289
N. PPM..........: 828977
Data............: 19/06/2015
Responsável.....: Felipe A. Santos
Descrição.......: inclusão dos fontes uDbContratoANS, uCtrlContratoANS.
--------------------------------------------------------------------------------
N. Sol..........: 253082/17369
N. PPM..........: 844934
Data............: 29/06/2015
Responsável.....: Felipe A. Santos
Descrição.......: inclusão do form frmParamANS.
--------------------------------------------------------------------------------}

program Contrato;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCadastroGrid in '..\..\Cm\Forms\Source\FCadastroGrid.pas' {frmCadastroGrid},
  FCadMestreDet in '..\..\Cm\Forms\Source\FCadMestreDet.pas' {frmCadMestreDetalhe},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FEntrada in 'FEntrada.pas' {frmEntrada},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  Global in 'Global.pas',
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCadContratoOrig in 'FCadContratoOrig.pas' {frmCadContratoOrig},
  Fpessoa in '..\..\Cm\Forms\Source\fPessoa.pas' {frmPessoa},
  FImpressaoNotas in 'FImpressaoNotas.pas' {frmImpressaoNotas},
  uConfigNF in 'uConfigNF.pas',
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FCadCorrecoesContratuaisMT in '..\FontesMT\FCadCorrecoesContratuaisMT.pas' {frmCadCorrecoesContratuaisMT},
  uCtrlCorrecoesContratuais in '..\CtrlObjects\uCtrlCorrecoesContratuais.pas',
  uCtrlContratos in '..\CtrlObjects\uCtrlContratos.pas',
  uDbCorrecaoContr in '..\DbObjects\uDbCorrecaoContr.pas',
  FOrdenaCorrecoesMT in '..\FontesMT\FOrdenaCorrecoesMT.pas' {frmOrdenaCorrecoesMT},
  uDbAditamento in '..\DbObjects\uDbAditamento.pas',
  uCtrlAditamento in '..\CtrlObjects\uCtrlAditamento.pas',
  uCtrlServProdxItemContr in '..\CtrlObjects\uCtrlServProdxItemContr.pas',
  FIncluiAditamentosMT in '..\FontesMT\FIncluiAditamentosMT.pas' {frmIncluiditamentosMT},
  uDbObjetosxItemContr in '..\DbObjects\uDbObjetosxItemContr.pas',
  uDbVlrRefContr in '..\DbObjects\uDbVlrRefContr.pas',
  uDbReferenciaContr in '..\DbObjects\uDbReferenciaContr.pas',
  uCtrlReferenciaContr in '..\CtrlObjects\uCtrlReferenciaContr.pas',
  FCadReferenciaContrMT in '..\FontesMT\FCadReferenciaContrMT.pas' {frmCadReferenciaContrMT},
  FCadVlrReferenciaMT in '..\FontesMT\FCadVlrReferenciaMT.pas' {frmCadVlrReferenciaMT},
  uCtrlVlrRefContr in '..\CtrlObjects\uCtrlVlrRefContr.pas',
  uGeralContratos in '..\CtrlObjects\uGeralContratos.pas',
  FAvisoContratosCorrecaoMT in '..\FontesMT\FAvisoContratosCorrecaoMT.pas' {frmAvisoContratosCorrecaoMT},
  FConsultaAltTabMT in '..\FontesMT\FConsultaAltTabMT.pas' {frmConsultaAltTabMT},
  FCadServProdMT in '..\FontesMT\FCadServProdMT.pas' {frmCadServProdMT},
  uCtrlServProd in '..\CtrlObjects\uCtrlServProd.pas',
  uDbObjetoContratual in '..\DbObjects\uDbObjetoContratual.pas',
  uCtrlListTercContratos in '..\CtrlObjects\uCtrlListTercContratos.pas',
  FCadItemContratualMT in '..\FontesMT\FCadItemContratualMT.pas' {frmCadItemContratualMT},
  uCtrlItemContratual in '..\CtrlObjects\uCtrlItemContratual.pas',
  uDbItemContratual in '..\DbObjects\uDbItemContratual.pas',
  uCtrlParamContrato in '..\CtrlObjects\uCtrlParamContrato.pas',
  uDbParamContrato in '..\DbObjects\uDbParamContrato.pas',
  uCtrlServProdXItem in '..\CtrlObjects\uCtrlServProdXItem.pas',
  uDbObjetoXItem in '..\DbObjects\uDbObjetoXItem.pas',
  FCadUsuXContrMT in '..\FontesMT\FCadUsuXContrMT.pas' {frmCadUsuXContrMT},
  uCtrlUsuXContrato in '..\CtrlObjects\uCtrlUsuXContrato.pas',
  uDbContratoUsuario in '..\DbObjects\uDbContratoUsuario.pas',
  uCtrlImagemContr in '..\CtrlObjects\uCtrlImagemContr.pas',
  uDbImagensContrato in '..\DbObjects\uDbImagensContrato.pas',
  FCadServProdXItemContrMT in '..\FontesMT\FCadServProdXItemContrMT.pas' {frmCadServProdXItemContrMT},
  uDbRateioCentroCusto in '..\DbObjects\uDbRateioCentroCusto.pas',
  FCadAditamentoMT in '..\FontesMT\FCadAditamentoMT.pas' {frmCadAditamentoMT},
  FCadContratoMT in '..\FontesMT\FCadContratoMT.pas' {frmCadContratoMT},
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  FCadResponsavelMT in '..\FontesMT\FCadResponsavelMT.pas' {frmCadResponsavelMT},
  uCtrlResponsavel in '..\CtrlObjects\uCtrlResponsavel.pas',
  uDbResponsavel in '..\DbObjects\uDbResponsavel.pas',
  uDbContratoContr in '..\DbObjects\uDbContratoContr.pas',
  uDbContratoOrig in '..\DbObjects\uDbContratoOrig.pas',
  FCancelaNFMT in '..\FontesMT\FCancelaNFMT.pas' {frmCancelaNFMT},
  uCtrlCancelaNF in '..\CtrlObjects\uCtrlCancelaNF.pas',
  FEncrerraContratoMT in '..\FontesMT\FEncrerraContratoMT.pas' {frmEncrerraContratoMT},
  FMedicaoContratosMT in '..\FontesMT\FMedicaoContratosMT.pas' {frmMedicaoContratosMT},
  uCtrlMedicao in '..\CtrlObjects\uCtrlMedicao.pas',
  uDbMedicao in '..\DbObjects\uDbMedicao.pas',
  uObjHASAR in '..\CtrlObjects\uObjHASAR.pas',
  uDbParcelaMedicao in '..\DbObjects\uDbParcelaMedicao.pas',
  uDbParcelaRealContr in '..\DbObjects\uDbParcelaRealContr.pas',
  uGeralContrato in '..\CtrlObjects\uGeralContrato.pas',
  FRateioMT in '..\FontesMT\FRateioMT.pas' {frmRateioMT},
  FGeracaoContratoMT in '..\FontesMT\FGeracaoContratoMT.pas' {frmGeracaoContratoMT},
  uCtrlGeracaoContrato in '..\CtrlObjects\uCtrlGeracaoContrato.pas',
  FCadParamContratoMT in '..\FontesMT\FCadParamContratoMT.pas' {frmCadParamContratoMT},
  uDbImpostoImpNF in '..\DbObjects\uDbImpostoImpNF.pas',
  FAvisoVencContrMT in '..\FontesMT\FAvisoVencContrMT.pas' {frmAvisoVencMT},
  uCtrlAvisoVencContr in '..\CtrlObjects\uCtrlAvisoVencContr.pas',
  uCtrlRptContrato in '..\Reports\Source\uCtrlRptContrato.pas',
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  RAditamentos in '..\Reports\Source\RAditamentos.pas' {RptAditamentos},
  RContratos in '..\Reports\Source\RContratos.pas' {RptContratos},
  RPgtosRecbs in '..\Reports\Source\RPgtosRecbs.pas' {RptPagtosRecbs},
  FConsultaContrOrigMT in '..\FontesMT\FConsultaContrOrigMT.pas' {frmConsultaContrOrigMT},
  FConsultaContratosMT in '..\FontesMT\FConsultaContratosMT.pas' {frmConsultaContratosMT},
  FCadModeloNFMT in '..\FontesMT\FCadModeloNFMT.pas' {frmCadModeloNF},
  uCtrlNotaFiscal in '..\CtrlObjects\uCtrlNotaFiscal.pas',
  uDbModNotaFiscal in '..\DbObjects\uDbModNotaFiscal.pas',
  uDbCompNotaFiscal in '..\DbObjects\uDbCompNotaFiscal.pas',
  FImpNFMT in '..\FontesMT\FImpNFMT.pas' {frmImpNFMT},
  uDbLogAditamento in '..\DbObjects\uDbLogAditamento.pas',
  uDbParamAditamento in '..\DbObjects\uDbParamAditamento.pas',
  uCtrlParamAditamento in '..\CtrlObjects\uCtrlParamAditamento.pas',
  fCadParamAditamentoMT in '..\FontesMT\fCadParamAditamentoMT.pas' {frmCadParamAditamentoMT},
  DRelatoriosContrato in 'DRelatoriosContrato.pas' {dtmRelatoriosContrato},
  FRelatAlteraContrato in 'FRelatAlteraContrato.pas' {frmRelatAlteraContrato},
  dMS in '..\FontesMT\dMS.pas' {dtmMS: TDataModule},
  uDbObjxItOrig in '..\DbObjects\uDbObjxItOrig.pas',
  uDbRateioCCOrig in '..\DbObjects\uDbRateioCCOrig.pas',
  RExtrato in '..\Reports\Source\RExtrato.pas' {RptExtrato},
  mContrato in 'mContrato.pas' {molContrato: TFrame},
  fExcluiParcelaMT in '..\FontesMT\fExcluiParcelaMT.pas' {frmExcluiParcelaMT},
  mObjeto in 'mObjeto.pas' {molObjeto: TFrame},
  mItem in 'mItem.pas' {molItem: TFrame},
  FCadServProdXItemMT in '..\FontesMT\FCadServProdXItemMT.pas' {frmCadServProdxItemMT},
  FProgresso in '..\..\Cm\Forms\Source\FProgresso.pas' {frmProgresso},
  uDbMedicaoxRateio in '..\DbObjects\uDbMedicaoxRateio.pas',
  mOrcamento in 'mOrcamento.pas' {molOrcamento: TFrame},
  FRetINSSOutros in '..\FontesMT\FRetINSSOutros.pas' {frmRetINSSOutros},
  FCadImgagensXcontrato in 'FCadImgagensXcontrato.pas' {FrmCadImgagensXcontrato},
  FAditamentosNaoAprovadosMT in '..\FontesMT\FAditamentosNaoAprovadosMT.pas' {frmAditamentosNaoAprovados},
  uCtrlMultiplasContas in '..\CtrlObjects\uCtrlMultiplasContas.pas',
  uDbContrRateioOrc in '..\DbObjects\uDbContrRateioOrc.pas',
  FExecLancaOrcamento in '..\FontesMT\FExecLancaOrcamento.pas' {frmExecLancaOrcamento},
  uCtrlContrRateioOrc in '..\CtrlObjects\uCtrlContrRateioOrc.pas',
  FWizardMT in '..\..\Cm\Forms\SourceMT\FWizardMT.pas' {frmWizardMT},
  FExecApuracaoOrc in '..\FontesMT\FExecApuracaoOrc.pas' {frmExecApuracaoOrc},
  FAltAditamentoMT in '..\FontesMT\FAltAditamentoMT.pas' {frmAltAditamentoMT},
  FCadEncerramento in '..\FontesMT\FCadEncerramento.pas' {frmCadEncerramento},
  FRelatContratosAnalitico in 'FRelatContratosAnalitico.pas' {frmRelatContratosAnalitico},
  DRelatContatoAnalitico in 'DRelatContatoAnalitico.pas' {dmtRelatContatoAnalitico},
  uCtrlAlcadas in '..\CtrlObjects\uCtrlAlcadas.pas',
  FCadAlcadasMT in '..\FontesMT\FCadAlcadasMT.pas' {FrmCadAlcadasMT},
  uDbAlcadas in '..\DbObjects\uDbAlcadas.pas',
  Db in '..\..\..\Program Files\Borland\Delphi5\Source\Vcl\db.pas',
  FExibeItensContrato in 'FExibeItensContrato.pas' {frmExibeItensContrato},
  uDbJustificacontrato in '..\DbObjects\uDbJustificacontrato.pas',
  FAlteraVencAP in 'FAlteraVencAP.pas' {frmAlteraVencAP},
  uDbHstRenovacao in '..\DbObjects\uDbHstRenovacao.pas',
  fParamReports_Padrao in '..\..\CM\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  uFuncoesUteis in '..\FontesMT\uFuncoesUteis.pas',
  FParamRelAditamentos in '..\Reports\Source\FParamRelAditamentos.pas' {FrmParamRelAditamentos},
  uCtrlCtrlParcelaMedicao in '..\CtrlObjects\uCtrlCtrlParcelaMedicao.pas',
  uDbCtrlParcelaMedicao in '..\DbObjects\uDbCtrlParcelaMedicao.pas',
  FAlertaMedicaoMT in '..\FontesMT\FAlertaMedicaoMT.pas' {frmAlertaMedicaoMT},
  uDbContratoANS in '..\DbObjects\uDbContratoANS.pas',
  uCtrlContratoANS in '..\CtrlObjects\uCtrlContratoANS.pas',
  FParamANS in '..\Reports\Source\FParamANS.pas' {frmParamANS},
  uDbContratoAreaGestora in '..\DbObjects\uDbContratoAreaGestora.pas',
  FCadAditamentoMTDel in '..\FontesMT\FCadAditamentoMTDel.pas' {frmCadAditamentoMTDel},
  uDbNegociacao in '..\DbObjects\uDbNegociacao.pas',
  uDbContratoAreaTecnica in '..\DbObjects\uDbContratoAreaTecnica.pas',
  FCadContrXUsuMT in '..\FontesMT\FCadContrXUsuMT.pas' {frmCadContrXUsuMT},
  uCtrlContrXUsuario in '..\CtrlObjects\uCtrlContrXUsuario.pas';

(*{$R *.TLB}*)

{$R *.RES}
{$R CONTRATO_RES.RES}

Begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;
  Application.Initialize;
  Application.Title := 'Contratos e Projetos';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TdtmMS, dtmMS);
  Application.CreateForm(TfrmParamANS, frmParamANS);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Contratos e Projetos
================================================================================
CM$VER      3.04.18b    28/04/2008
--------------------------------------------------------------------------------
Cadastro / Usuário X Contrato
  Pendência: 26186 - Correção do processo de associação de Usuários por Contrato.
Cadastro / Serviços/Produto X Item Contratual
  Pendência: 26187 - Não registrar o LOG de Aditamento quando o Contrato em 
                     fase de cadastro.
================================================================================
CM$VER      3.04.18a    13/03/2008
--------------------------------------------------------------------------------
- Pendência 27582: Ajuste dos Helps do Sistema.
================================================================================
CM$VER      3.04.18     15/01/2008
--------------------------------------------------------------------------------
Medição Contratual / Rateio
  Pendência: 26185 - Ajustes na Geração do Rateio de Documentos para gravar de
                     maneira correta os programas associados.
================================================================================
CM$VER      3.04.17     14/08/2007
--------------------------------------------------------------------------------
- Liberação do padrão 17
================================================================================
CM$VER      3.04.16a    23/08/2007
--------------------------------------------------------------------------------
Medição Contratual / Rateio
  Pendência: 26185 - Ajustes na Geração do Rateio de Documentos para gravar de
                     maneira correta os programas associados.
================================================================================
CM$VER      3.04.16     25/05/2007
--------------------------------------------------------------------------------
- Liberação do padrão 16
  Pendencia: 25140 - Ajuste nas telas para mostrar somente PORTADORFORMA ativo.
================================================================================
CM$VER      3.04.15     03/04/2007
--------------------------------------------------------------------------------
Relatório de Contratos
  Pendência: 24860 - Passa a exibir os Reajustes Contratuais no relatório.
================================================================================
CM$VER      3.04.14c    23/08/2007
--------------------------------------------------------------------------------
Medição Contratual / Rateio
  Pendência: 26185 - Ajustes na Geração do Rateio de Documentos para gravar de
                     maneira correta os programas associados.
================================================================================
CM$VER      3.04.14b    09/07/2007
--------------------------------------------------------------------------------
- Ajuste no processo de geração de previsão orçamentária
================================================================================
CM$VER      3.04.14a    03/04/2007
--------------------------------------------------------------------------------
Relatório de Contratos
  Pendência: 24860 - Passa a exibir os Reajustes Contratuais no relatório.
================================================================================
CM$VER      3.04.14     15/02/2007
--------------------------------------------------------------------------------
Pendência 24529 - Medição Contratual
        Correção do tipo de campo no Monta Select.
Pendência 22753 - Relatório de Contratos
        Disponibilização dos campos de Data de Renovação, Observação do Contrato e
        Tipo de Desembolso, para que sejam incluídos através da Configuração do Relatório
================================================================================
CM$VER      3.04.13b    06/03/2007
--------------------------------------------------------------------------------
Medição
  Pendência 24641: Correção de erro ao abrir a tela de medição. Devido a novo
                   componente de pesquisa.
================================================================================
CM$VER      3.04.13a    15/02/2007
--------------------------------------------------------------------------------
Pendência 24529 - Medição Contratual Correção do tipo de campo no Monta Select.
================================================================================
CM$VER      3.04.13     21/11/2006
--------------------------------------------------------------------------------
Liberação do padrão 13
================================================================================
CM$VER      3.04.12c    15/02/2007
--------------------------------------------------------------------------------
Pendência 24529 - Medição Contratual Correção do tipo de campo no Monta Select.
================================================================================
CM$VER      3.04.12b    10/11/2006
--------------------------------------------------------------------------------
Cadastro Serviço/Produto X Item Contratual
  - Aumento na performance da query do formulário.
================================================================================
CM$VER      3.04.12a    13/10/2006
--------------------------------------------------------------------------------
- Acerto no processo de apuração orçamentária
================================================================================
CM$VER      3.04.12     27/09/2006
--------------------------------------------------------------------------------
Geração de Contratos
   Pend.: 19333 -  Implementação de geração de parcelas por período permitindo
                          geração em lote de todas as parcelas do contrato.
                       - Validação da quantidade de parcelas permitidas no cadastro
                          impedindo a geração de parcelas após o término do contrato.
Medição
  Pend.: 23412 - Correção no processo de busca da conta bancária.
================================================================================
CM$VER      3.04.11k    09/11/2006
--------------------------------------------------------------------------------
Cadastro Serviço/Produto X Item Contratual
  - Aumento na performance da query do formulário.
================================================================================
CM$VER      3.04.11j    13/10/2006
--------------------------------------------------------------------------------
- Acerto na rotina de apuração de orçamento, para ajuste do período de reajuste
================================================================================
CM$VER      3.04.11i    27/09/2006
--------------------------------------------------------------------------------
Medição
  Pend.: 23412 - Correção no processo de busca da conta bancária.
================================================================================
CM$VER      3.04.11h    21/09/2006
--------------------------------------------------------------------------------
Operação / Medição
 - Correção na tela conforme pendência 23072 - ajustada conforme a rotina do botão
    inserir.
================================================================================
CM$VER      3.04.11g    18/09/2006
--------------------------------------------------------------------------------
- Acerto na rotina de apuração orçamentária
================================================================================
CM$VER      3.04.11f    13/09/2006
--------------------------------------------------------------------------------
Cadastro de Reajustes Contratuais / Procedimentos Cálculo
  Pend.: 23233 -   Correção do erro ao inserir o Reajuste / Procedimento de calculo
================================================================================
CM$VER      3.04.11e    04/09/2006
--------------------------------------------------------------------------------
Cadastro de Reajustes Contratuais / Procedimentos Cálculo
  Pend.: 23233 -   Correção do problema ao alterar o formulário
Apuração Orçamentária -  Acerto do processo de Apuração Orçamentária
================================================================================
CM$VER      3.04.11d    28/08/2006
--------------------------------------------------------------------------------
Geração e Medição  de Contrato
  Pend.: 23048 -  Consolidação dos lançamentos de rateio gerados para o módulo de contas a pagar
================================================================================
CM$VER      3.04.11c    24/08/2006
--------------------------------------------------------------------------------
- Acerto no processo de apuração orçamentária
================================================================================
CM$VER      3.04.11b    21/08/2006
--------------------------------------------------------------------------------
Cadastro de Serviços/Produtos X Item Contratual
   Pend. 23089  - Correção do problema ao fechar o formulário
================================================================================
CM$VER      3.04.11a    15/08/2006
--------------------------------------------------------------------------------
Cadastro de Medição de Rateio
  Pend.: 23072 - Correção na hora de trazer a quantidade do Serviço/Produto.
================================================================================
CM$VER      3.04.10     12/07/2006
--------------------------------------------------------------------------------
Serviços/Produtos por Item Contratual
   Pend. 19646 - Passa a listar todos os contratos com exceção dos encerrados.
   Pend. 19344 - Passa a deixar gravar o campo medida em branco.
   Pend. 18064 - Implementação da visualização das datas de última geração e último vencimento das parcelas.
Item Contratual
   Pend. 17345 - Retirados os campos "ligado a atividade".
Medição
   Pend. 21248 - Alteração de duas casas decimais para quatro casas decimais.
   Pend. 17044 - Habilita ou desabilita os edits de Quantidade ou Valor dos Itens de um contrato.
   Pend. 17592 - Passa a exibir apenas os planos previdenciários ativos na tela de rateio.
Parâmetros do Sistema
   Pend. 17390 - Retirada da opção "Imprime fatura em impressora fiscal".
   Pend. 16973 - Implementação da opção "Integração com Orçamento".
Relatórios/Contratos - CBS
   Pend. 20892 - Adição do campo DATAINICIO na query do relatório.
================================================================================
CM$VER      3.04.09a    04/07/2006
--------------------------------------------------------------------------------
Pendencia 21643: Geração de Previsão Orçamentária 
    - Criação do processo de geração automática de previsão orçamentária com base
      nos contratos e lançamentos existentes no exercício anterior.
      O processo utiliza o conceito de fórmulas e forma de cálculo implementado no módulo
      de Planejamento e Orçamento. Essas fórmulas devem ser parametrizadas no cadastro
      de Serviços/Produtos X Item Contratual. O Rateio desses itens deve possuir a conta 
      orçamentária para que seja feita a integração com o orçamento.
      Na tela de correção contratual, deve ser informada a moeda projetada quando o reajuste
      for por Moeda.
================================================================================
CM$VER      3.04.09     11/04/2006
--------------------------------------------------------------------------------
Pendência 21245 - Medição
- Ao alterar uma medição que tenha alterador inserido pelo Contas a Pagar, o sistema estava duplicando os alteradores, a partir do segundo alterador lançado.
Pendência 22039 - Cadastro
- Correção de bloqueio do tamanho do campo de observação do contrato.
Pendência 21973 - Medição/Rateio Diferenciado
- Adicionado o Plano de Centro de Custo como parâmetro ao acessar a tabela do Centro de Custo.
================================================================================
CM$VER      3.04.08     19/01/2006
--------------------------------------------------------------------------------
- Liberação de versão no padrão 8
================================================================================
CM$VER      3.04.07d    05/12/2005
--------------------------------------------------------------------------------
- Pendencia 20869: Acerto na busca da conta contábil de baixa quando efetua a medição que possui mais de um item
- Pendencia 20730: Acerto na gravação do rateio quando efetua medição sem integração com a contabilidade
================================================================================
CM$VER      3.04.07c    17/11/2005
--------------------------------------------------------------------------------
- Pendencia 20730: Ao realizar uma medição, com plano operações comuns, 
                             não integrado com o contabil, o rateio não estava sendo segregado 
                             na origem.
================================================================================
CM$VER      3.04.07b    04/11/2005
--------------------------------------------------------------------------------
- Pendencia 20650: Correção de erro na tela de reajuste de contratos
================================================================================
CM$VER      3.04.07a    09/09/2005
--------------------------------------------------------------------------------
- Pendencia 19426: Criação do campo de conta orçamentária no rateio do item na tela
                             Serviço/Produto X Item Contratual 
- Pendencia 19427: Criação de tela para lançamento dos valores orçados para as contas
                             orçamentárias no menu de Operação/Lançamento Orçamentário
- Pendencia 19428: Implementado o processo de integração dos valores lançados na tela
                             de Lançamento Orçamentário com o módulo de Planejamento e Orçamento.
                             Essa rotina se encontra na tela de Lançamento Orçamentário.
================================================================================
CM$VER      3.04.07     01/09/2005
--------------------------------------------------------------------------------
Liberação do padrão 5.10.07
================================================================================
CM$VER      3.04.02b    12/07/2005
--------------------------------------------------------------------------------
- Pendencia 19672: Acerto no processo de estorno de medição.
================================================================================
CM$VER      3.04.02a    06/07/2005
--------------------------------------------------------------------------------
- Pendencia 19477: Alteração nas informações para histórico de lançamento contábil:
  Inclusao da informação da data de vencimento, histórico do lançamento e do numero do contrato
================================================================================
CM$VER      3.04.02     20/05/2005
--------------------------------------------------------------------------------
Liberação do Padrão 5.10.06
================================================================================
CM$VER      3.04.01     13/05/2005
--------------------------------------------------------------------------------
Pendencia 18749 
Tela: Operações\Medição
Descrição do Erro: Não está permitindo fazer a medição, está dando erro de conta crédito.
Pendência 18508
Tela:Consultas\Relatórios\Emissões diversas\Recolhimento de Encargos (cap)
Descrição do erro: Os impostos dos documentos estornados do módulo Contratos não estão vindo no relatório com os valores zerados.
Pendência: 17968
Tela: Consultas\ Relatórios\Operacionais\Extrato de Contratos
Descrição: Disponibilizar para o relatório os campos Encargos, Renovação e Observação.
Pendência: 15735
Tela: Cadastros\Serviço/Produto x Item Contratual
Descrição: fazer a crítica de dados no relacionamento Planprevcontabil x Patro.
================================================================================
CM$VER      3.04.00c    16/02/2005
--------------------------------------------------------------------------------
- Pendência: 18606
  Descrição: Nessa  tela ocorre erro quando o campo  medida está preenchido, o erro : "UN is not a valid interger value."
================================================================================
CM$VER      3.04.00b    25/01/2005
--------------------------------------------------------------------------------
- Pendência: 17689
  Descrição: Fazer verificação da data de disponibilidade financeira sobre a
             data de vencimento da medição.
- Pendência: 17406
  Descrição: Não permitir que seja inserido um rateio do mesmo item e mesmo objeto
================================================================================
CM$VER      3.04.00a    21/01/2005
--------------------------------------------------------------------------------
- Pendência: 18449
  Descrição: Correção na tela Medição/Geração de contratos, pois ao fazer a
             geração/medição sem contabilizar, estava dando erro de 'ACCESS VIOLATION'.
================================================================================
CM$VER      3.04.00     12/01/2005
--------------------------------------------------------------------------------
- Pendencia 16347 - Criação de processo RAD na medição de contratos
- Pendencia 16455 - Criação de processo RAD no aditamento de contrato
- Pendência 17963 - Ordenar a busca das contas contábeis.
- Pendência 15867 - Desenvolver a segregação virtual e múltiplas contas de baixa.
- Pendência 17868 - Carrega a conta bancaria do contrato ao se inserir uma nova medição.
- Pendência 17867 - Ao clicar no botão estornar, aparece um dialog box que pede a data de estorno
                    do documento gerado pelo contrato.
================================================================================
CM$VER      3.03.25a    10/09/2004
--------------------------------------------------------------------------------
Pendência: 17294
Tela Consulta\Relatórios\Pagamentos x Recebimentos
Descrição: Colocar os filtros Num Documento e Valor
Pendência: 17295
Tela Consulta\Relatórios\Extratos de pagamentos
Descrição: Colocar os filtros Num Documento, Valor e Data de Vencimento.
================================================================================
CM$VER      3.03.25     30/08/2004
--------------------------------------------------------------------------------
Pendência 16832 - Lançamento de documento
- Limitar retenção de INSS ao teto.
================================================================================
CM$VER      3.03.24a    13/07/2004
--------------------------------------------------------------------------------
- Pendencia 16957 - Criar as rotinas de Estorno de documentos no CaP/CaR nas telas de Medição e Exclusão de Parcelas sem medição
================================================================================
CM$VER      3.03.24     25/06/2004
--------------------------------------------------------------------------------
Medição de Contratos
  - Inclusão de campos de pesquisas: Nr. do documento, data programada, valor e data de Lançamento
================================================================================
CM$VER      3.03.23b    03/06/2004
--------------------------------------------------------------------------------
Cadastro de Imagens do Contrato
  - Implementação de zoom da imagem
  - Implementação de Duplo-Clique na imagem, abrindo a imagem no editor
Consulta de Contratos
  - Inclusão da guia para visualização das imagens do contrato, com zoom e
    duplo-clique na imagem para abrir o editor
Geração de contratos
  - Inclusão do campo para informação da Conta Bancária
  - Inclusão do campo para informação do compromisso orçamentário
Medição
  - Inclusão do campo para informação do compromisso orçamentário
================================================================================
CM$VER      3.03.23a    26/04/2004
--------------------------------------------------------------------------------
Geração de Contratos sem Medição
  - Alterado o processo de geração, agrupando itens do mesmo contrato no mesmo
documento, desde que sejam iguais os seguintes parâmetros:
    Contrato, Moeda, Tipo de Documento, Tipo de Desembolso, Fornecedor,
    Portador Forma, Vencimento, Processo e Centro de Responsabilidade 
================================================================================
CM$VER      3.03.23     07/04/2004
--------------------------------------------------------------------------------
Pendência 16446 - Operação / Medição
  Corrigido problema durante a alteração ao incluir novo item na medição
Cadastro de Imagens de Contratos
  - Possibilidade de maximização da tela de visualização da imagem
Exclusão de documentos
  - Criação dos botões para selecionar e desmarcar todos os lançamentos
Medição e Geração de Contratos
  - Inclusão de campos para informar o Código de Barras e Linha Digitável da ficha de compensação
================================================================================
CM$VER      3.03.22a    29/03/2004
--------------------------------------------------------------------------------
Pendência: 16367 - \Operação \Medição
Corrigido rateio da medição, com rateios diferenciados.
================================================================================
CM$VER      3.03.22     18/03/2004
--------------------------------------------------------------------------------
Cadastro de Contratos
  - Ajuste na busca no Nr. de Reserva Orçamentária
Cadastro de Serviços x Item x Contrato
  - Ajuste na exibição da guia de rateio
  - Inversão dos campos para seleção do Serviço e Item
  - Transferência dos campos de Atividade/Projeto, Plano e Patrocinadora para a Guia de Rateios
Medição
  - Permissão para inclusão, exclusão e alteração do Rateio Diferenciado
  - Registro no módulo de contratos, do rateio diferenciado efetuado, evitando a redefinição
    deste rateio no caso de alteração da medição.
  - Inclusão da opção para não contabilizar o lançamento
Geração de Contratos
  - Inclusão da opção para não contabilizar o lançamento
================================================================================
CM$VER      3.03.21     11/12/2003
--------------------------------------------------------------------------------
Padronização da Barra de Progresso dos processos
================================================================================
CM$VER      3.03.20     01/12/2003
--------------------------------------------------------------------------------
Cadastro de Contratos
  - Implementação do processo RAD ao encerrar o cadastro do contrato
Medição
  - Bloqueio de medições para contratos não aprovados no RAD
Cadastro de Serviços x Item Contratual
  - Exibição do nr. do processo na seleção do contrato
================================================================================
CM$VER      3.03.19b    10/11/2003
--------------------------------------------------------------------------------
Cadastro de Serviçios x Item Contratual
  - Ajuste do cadastro, permitindo a alteração da chave da tabela
================================================================================
CM$VER      3.03.19a    30/10/2003
--------------------------------------------------------------------------------
Cadastro de Contratos
  - Inclusão da data de início da prestação do serviço
  - Inclusão de filtros de procura por Nr. do processo, data de encerramento
    e descrição do contrato
  - Filtro de seleção de responsável, exibindo apenas os associados para contratos
Cadastro de Serviçios x Item Contratual
  - Inclusão do responsável pelo serviço x item
Medição
  - Correção de erro ao selecionar o item do contrato
================================================================================
CM$VER      3.03.19     13/10/2003
--------------------------------------------------------------------------------
Reajustes Contratuais
  - Possibilidade de selecionar os contratos que serão reajustados
  - Inclusão de Item no Menu para Reajustes Contratuais
  - Registro de histórico dos reajustes efetuados
Relatório de Aditamento
  - Implementação da seleção por Aditamento ou Correções
Medições e Geração de Contratos
  - Bloqueio para tipo de desembolso inativo
================================================================================
CM$VER      3.03.18k    08/09/2003
--------------------------------------------------------------------------------
Cadastro de Serviço X Item 
  - Ajuste no processo de verificação da conta contábil na abertura da tela.
================================================================================
CM$VER      3.03.18j    05/09/2003
--------------------------------------------------------------------------------
Cadastro de Serviço X Item Contratual
  - Ajuste no processo de verificação da soma do percentual de rateio.
================================================================================
CM$VER      3.03.18i    05/09/2003
--------------------------------------------------------------------------------
Exclusão de Parcelas
  - Inclusão da visualização do campo de descrição do Objeto e Item
================================================================================
CM$VER      3.03.18g    12/08/2003
--------------------------------------------------------------------------------
Exclusão de Parcelas
  - Inclusão da visualização do campo de Nr. do Documento
Medição
  - Inclusão da data de Lançamento separada da data da medição
Serviços/Produto X Item
  - Reformulação da tela no formato Mestre - Detalhe
================================================================================
CM$VER      3.03.18e    01/08/2003
--------------------------------------------------------------------------------
Medição
  - Ajuste do processo de alteração, quando existir alteradores lançados para o 
    o documento gerado.
Contratos
  - Aviso no momento de encerramento do cadastro, da ausência de relacionamento
    de usuários.
================================================================================
CM$VER      3.03.18d    29/07/2003
--------------------------------------------------------------------------------
Geração de Contratos
  - Possibilidade de seleção do contrato a ser gerado
  - Quando selecionado o contrato específico, possibilita a informação de Obs da AP,
    histórico complementar, forma de pagamento e Nr. do documento para o CapCar.
  
Medição
  - Possibilidade de informar o Histórico Complementar para o documento no CapCar.
Exclusão de Parcelas sem Medição
  - Implementação da funcionalidade, permitindo excluir uma parcela gerada, desde que
    a mesma não tenha sido baixada.
================================================================================
CM$VER      3.03.18     27/06/2003
--------------------------------------------------------------------------------
Medição
  - Exibe o Nr. do Processo junto com o nome do contrato no momento de seleção do mesmo
Consulta Contratos
  - Inclusão da guia referente aos pagamentos efetuados para o contrato
  - Possibilidade de visualizar o contrato atual ou o original
Relatórios
  - Implementação de Relatório de Extrato de Pagamentos Efetuados
================================================================================
CM$VER      3.03.17f    18/06/2003
--------------------------------------------------------------------------------
Medição
  - Preenchimento automático do campo Observações
================================================================================
CM$VER      3.03.17e    02/06/2003
--------------------------------------------------------------------------------
Parâmetros de Aditamento
  - Criação da tela, para indicar quais campos deverão ser registrados no processo de aditamento
    do contrato
Cadastro de Contratos, Itens e Correções do Contrato
  - Exibição da tela de aditamento apenas quando a informação alterada estiver definida para 
    registro na tela de Parâmetros de Aditamento
Cadastro de Itens do Contrato
  - Ajuste na verificação da soma dos percentuais de rateio dos centros de custo
  - Exibição apenas dos centros de custo ativos
Relatórios
  - Criação de relatório de Alterações Contratuais com o histórico dos aditamentos e suas 
    devidas alterações.
================================================================================
CM$VER      3.03.16     14/05/2003
--------------------------------------------------------------------------------
- Implementação da tela de cosnsulta aos contratos em 3 Camadas
================================================================================
CM$VER      3.03.15     12/05/2003
--------------------------------------------------------------------------------
- Implementação da tela de consulta ao contrato original em 3 camadas
================================================================================
CM$VER      3.03.14     08/05/2003
--------------------------------------------------------------------------------
- implementação dos relatórios em 3 camadas
================================================================================
CM$VER      3.03.13     05/05/2003
--------------------------------------------------------------------------------
- Nova tela de Configuração do Sistema em 3  Camadas
- Correção do problema de inclusão de contratos zerados
================================================================================
CM$VER      3.03.12     28/04/2003
--------------------------------------------------------------------------------
- Implementado procedimento de ordenação dos contratos através de clique no título
de cada coluna na tela de impressão de NF
================================================================================
CM$VER      3.03.11     11/04/2003
--------------------------------------------------------------------------------
- Correção de procedimento de exclusão de contratos na tela de Cadastro de Contratos
================================================================================
CM$VER      3.03.10     10/04/2003
--------------------------------------------------------------------------------
- Correção de erro de cálculo do rateio na tela de cadastro de Contratos X Item Contratual
================================================================================
CM$VER      3.03.09     02/04/2003
--------------------------------------------------------------------------------
- Implementação de procedimento de associação de impostos à impressão de FAT/NF
 na tela de parâmetros do sistema
================================================================================
CM$VER      3.03.08     31/03/2003
--------------------------------------------------------------------------------
- Correção da exclusão na tela de cadastro de contratos
================================================================================
CM$VER      3.03.07     26/03/2003
--------------------------------------------------------------------------------
- Correção de erro de filtragem por tipo de data de encerramento
================================================================================
CM$VER      3.03.06     18/03/2003
--------------------------------------------------------------------------------
- Correção de erro de impressão do identificador de imposto na NF
================================================================================
CM$VER      3.03.05     10/03/2003
--------------------------------------------------------------------------------
- Correção de erro de constraint quando alterando contrato no Cadastro de Contratos
================================================================================
CM$VER      3.03.04     07/03/2003
--------------------------------------------------------------------------------
- Implementação de marcador de incidência de imposto na impressão da NF
================================================================================
CM$VER      3.03.03     06/03/2003
--------------------------------------------------------------------------------
- Correção de erro que não associava automaticamente o contrato ao usuário que o 
 cadastrou, na tela de Cadastro de Contratos
================================================================================
CM$VER      3.03.02     06/03/2003
--------------------------------------------------------------------------------
- Correção de erro de geração do imposto na tela de medição
================================================================================
CM$VER      3.03.01     12/02/2003
--------------------------------------------------------------------------------
- Correção de erro de alinhamento do extenso na impressão de Nota Fiscal
================================================================================
CM$VER      3.03.00     10/02/2003
--------------------------------------------------------------------------------
- Implementação de novo procedimento de impressão de NF
- Correção de erro na query de dados da NF
- Correção de erro de filtragem por data na tela de Cancelamento de Emissão de NF
- Implementação de campo de Data de Emissão na tela de impressão de NF
- Implementação de Campo de Atividade/Projeto no cadastro de Serviço/Produto X Item
 Contratual
================================================================================
CM$VER      3.02.12     07/02/2003
--------------------------------------------------------------------------------
- Inclusão de campo para no. de Linhas da NF na tela de Conf. de NF
- Cadastro de Contratos em 3 Camadas
- Correção da query dos dados da NF (Cidade e UF) da Impressão de NF
- Inclusão de Novas Linhas na Config da NF
================================================================================
CM$VER      3.02.11     03/01/2003
--------------------------------------------------------------------------------
-Implementação do Cadastro de Responsáveis em 3 Camadas
================================================================================
CM$VER      3.02.10     03/01/2003
--------------------------------------------------------------------------------
- Correção de erro de exibição do Item no Cadastro de Serviço/Produto X Item
- Implementação do Cadastro de Serviço/Produto X Item Contratual em 3 Camadas
================================================================================
CM$VER      3.02.09     27/12/2002
--------------------------------------------------------------------------------
- Nova tela de Cadastro de Usuario x Contrato (3 Camadas)
- Nova tela de Cadastro de Imagend do Contrato (3 Camadas)
================================================================================
CM$VER      3.02.08     26/12/2002
--------------------------------------------------------------------------------
- Correção de erro de contagem do número de contratos no relatório de contratos
- Inclusão de filtro por data de previsão de encerramento no relatório de contratos
- Implementação do cadastro de Serviços/Produtos x Item
================================================================================
CM$VER      3.02.07     18/12/2002
--------------------------------------------------------------------------------
- Correção do relatório de Aditamento
- Correção do algorítimo de aplicação de correções em atraso
- Alteração de funcionalidade da tela de aviso de correção contratual
================================================================================
CM$VER      3.02.06     13/12/2002
--------------------------------------------------------------------------------
- Correção de erro da Correções contratuais em atraso
- Correção de erro de associação da atuação das correções contratuais
================================================================================
CM$VER      3.02.05     13/12/2002
--------------------------------------------------------------------------------
- Alteração do algorítimo de correção contratual
================================================================================
CM$VER      3.02.04     12/12/2002
--------------------------------------------------------------------------------
- Correção de erro de que fazia o procedimento de correção contratual ficar em Loop
================================================================================
CM$VER      3.02.03     11/12/2002
--------------------------------------------------------------------------------
- Alteração de lay-out da tela de Aviso de ocorrência de Correções contratuais
- Correção de erro de ordenação das correções contratuais
================================================================================
CM$VER      3.02.02     06/12/2002
--------------------------------------------------------------------------------
- Correções gerais no procedimento de correção contratual
================================================================================
CM$VER      3.02.01     27/11/2002
--------------------------------------------------------------------------------
- Implementação da Partida Dobrada da Contabilização
- Correção da Tela de Consulta ao Log de Tabelas
================================================================================
CM$VER      3.02.00     26/11/2002
--------------------------------------------------------------------------------
- Correção de erro que não atualizava o total do Produto/Serviço X Item Contratual 
quando ocorria uma correção contratual
================================================================================
CM$VER      3.01.20     13/11/2002
--------------------------------------------------------------------------------
- Correção de Flag que indica se o batimento pode gerar resultado negativo
================================================================================
CM$VER      3.01.19     31/10/2002
--------------------------------------------------------------------------------
- Implementação do Cadsatro de Correções/Procedimentos de Cálculo Contratuais
- Implementação de Valores de Referência para Correções/Procedimentos de Cálculo
- Implementação de Tela de Aviso de Correção de Contrato:
  Cadastrar no parâmetros do sistema o número de dias de atecedência do Aviso. 
  Obs: Se valor for deixado zerado não o usuário não será avisado sobre a correção.
- Implementação da Correção/Procedimento Automático dos Contratos.
- Correção do Rateio Diferenciado na Medição que não respeitava a tabela Aranha
================================================================================
CM$VER      3.01.18     18/10/2002
--------------------------------------------------------------------------------
- Retirada da obrigação de cadastramento do valor total do contrato no cadastro de 
  contratos.
- Implementação de contador de número de contratos no relatório de contratos.
================================================================================
CM$VER      3.01.17     17/06/2002
--------------------------------------------------------------------------------
- Associação  dos Help's do Sistema
================================================================================
CM$VER      3.01.16     06/05/2002
--------------------------------------------------------------------------------
- Customizações para o padrão 3 Camadas
================================================================================
CM$VER      3.01.15     15/04/2002
--------------------------------------------------------------------------------
- Correção de erro que não gravava o Programa previdenciário nas APS geradas pelo 
 sistema.
================================================================================
CM$VER      3.01.14     03/04/2002
--------------------------------------------------------------------------------
- Correção de erro de impossibilidade de criação e edição dos dados da tela de parâme-
 tros.
- Correção de lay-out da tela de Medição.
- Correção de erros no encerramento de cadastramento na tela de cadastro de Contratos.
================================================================================
CM$VER      3.01.13     20/12/2001
--------------------------------------------------------------------------------
- Implementação de Cálculo de percentual restante a cada inclusão de novo rateio no 
  Cadastro de ObjetoxItem Contratual.
- Correção de problema de visualização das descrições dos programas no cadastro de
  ObjetoxItem Contratual.
- Correção de erro de exclusão no cadastro ObjetoxItem Contratual
================================================================================
CM$VER      3.01.12     27/11/2001
--------------------------------------------------------------------------------
-Correção de erro de tentativa de gravação de RECPAG=null no cadastro de 
 Fornecedores e Clientes
================================================================================
CM$VER      3.01.11     17/10/2001
--------------------------------------------------------------------------------
- Correção de erros na alteração das Medições
================================================================================
CM$VER      3.01.10     19/09/2001
--------------------------------------------------------------------------------
- Correção de Erro na seleção de Tipo de Recebimento Desembolso no cadastro de
  Serviços/Produtos x Item
================================================================================
CM$VER      3.01.09     21/06/2001
--------------------------------------------------------------------------------
-Correção de problema na visualização dos dados de apliacações importadas.
================================================================================
CM$VER      3.01.08     20/06/2001
--------------------------------------------------------------------------------
-Correção de problema na inclusão na tela de medição
================================================================================
CM$VER      3.01.07     13/06/2001
--------------------------------------------------------------------------------
- Mudança do Campo IDPrograma da divisão Serviço/Projeto para a divisão Rateio
   Obs.: Para esta implementação foi necessário a criação do campo IDPrograma na
            tabela de RateioCentroCusto. 
================================================================================
CM$VER      3.00.06     08/06/2001
--------------------------------------------------------------------------------
- Correção de erro na rotina de  encerramento de contrato
- Correção de erro na rotina de encerramento de cadastro de  contrato
- Correção de erro na lateração de contrato
================================================================================
CM$VER      3.00.05     22/05/2001
--------------------------------------------------------------------------------
-Correção de problema no encerramento do cadastramento de um contrato
================================================================================
CM$VER      3.00.04     07/05/2001
--------------------------------------------------------------------------------
-Correção de erros na Tela de Medição
================================================================================
CM$VER      3.00.03     04/05/2001
--------------------------------------------------------------------------------
-Correção de problema no rateio diferenciado na tela de medição
================================================================================
CM$VER      3.00.02     03/05/2001
--------------------------------------------------------------------------------
- Implementação de Inicialiazação e Acompanhamento de processo de Renovação de 
  Contratos na Tela de Vencimento de Contratos
================================================================================
CM$VER      3.00.01     25/04/2001
--------------------------------------------------------------------------------
- Alteração da descrição "Valor Base"para "Valor Total"no Cadastro de Contratos
- Inclusão de Campo DataAditamento na Query de Contratos de modo a permitir 
  sua inclusão no Realtório de Contratos
- Implementação de procedimento para fornecimento de Rateio Diferenciado na Tela
  de Medição
- Implementação de procedimento que impede que data de Venciamento seja menor que 
  a data de Medição 
================================================================================
CM$VER      3.00.00     05/04/2001
--------------------------------------------------------------------------------
1) Implementação de procedimento que impede a exclusão dos Alteradores e AP quando
    na alteração do registro corrente.
================================================================================
CM$VER      2.05.03     05/01/2001
--------------------------------------------------------------------------------
- Inclusão na tela de parâmetro do relatório de contratos, a escolha de data de
  vencimento ou assinatura.
- Alteração do relatório de contrato, quebras.
================================================================================
CM$VER      2.05.02     21/12/2000
--------------------------------------------------------------------------------
- Alteração na tela de Medição (qryDetAux - colocado outer join caso não tenha sido preenchida
  a forma de pagamento CODPORTFORMA).
================================================================================
CM$VER      2.05.00     20/12/2000
--------------------------------------------------------------------------------
- Novo Relatório implementado:
  o Relatório de Pagamentos/Recebimentos.
- Novas Telas implementadas :
  o Vencimentos Contratos.
  o Contrato Original.
- No encerramento do cadastramento do contrato (Tela de Cadastro de Contrato) é criado
  um original do contrato, seus objetoxitenscontratuais e respectivos rateios.
- Alteração na Tela de Medição. Permissão para alteração e exclusão.
  Inclusão do campo Conta Bancária.
================================================================================
CM$VER      2.04.01     20/11/2000
--------------------------------------------------------------------------------
- Alteração na exclusão/alteração de Rateio da tela de ObjetoxItemContratual.
- Alteração da tela de Cadastro de Aditamentos.
================================================================================
CM$VER      2.04.00     13/11/2000
--------------------------------------------------------------------------------
- Opção de exclusão e alteração no Cadastro de Medição.
- Na tela de medição checa se a data de vencimento cai em dia não útil, com opção de aceitar ou não.
- Quando fecha o cadastramento do Contrato cria arquivo de origem para Contrato, ObjetoxItemContratual
  e RateioCentroCusto.
- Relatório de Contrato.
- Inclusão de Código de Aditamento na Tela de Aditamentos e no Relatório.
 
================================================================================
CM$VER      2.03.03     08/11/2000
--------------------------------------------------------------------------------
- Acerto na qryObjeto na Tela de cadastro de Serviço/Produto.
================================================================================
CM$VER      2.03.01     06/10/2000
--------------------------------------------------------------------------------
- Não permitir alterações em um serviço/produto x itemcontratual de um contrato já 
  encerrado.
- Desabilitar o botão de CANCELAR da tela de aditamento. 
================================================================================
CM$VER      2.03.00     04/10/2000
--------------------------------------------------------------------------------
- Relacionamento dos Contratos com seus Usuários responsáveis. Criação da tabela CONTRATOUSUARIO 
com este relacionamento.
- Alteração na tela de Medição.
- Alteraçào no Cadastro de Contratos.
- Resolução da Pendência Nº 2475
  > Tela\Opçao No Sistema: \CADASTRO\CONTRATOS
  Deletar a pastinha de empenho e colocar uma de orçamento pedindo reserva orçamentária e guardar em CONTRATOCONTR o campo IDRESERVAORCAMEN
- Resolução da Pendência Nº 2476
  > Tela\Opçao No Sistema: \CADASTRO\CONTRATOS
  Remover o botão de Gerar Aditamento e colocar automático, ou seja, assim que desejar alterar um contrato já encerrado.
================================================================================
CM$VER      2.01.08     25/07/2000
--------------------------------------------------------------------------------
- Adicionado Telefone de Contato na tela de Cadastro de Contratos.
- Acertado a soma de rateio (100%) e a deleção na tela de Cadastro de ObjetoxItemContratual.
- Acerto na opção de Operação\Medição. Medição estava lançando uma linha a mais na pasta rateio do Contas a Pagar, com valor zerado quando havia diferença de arredondamento. 
  
================================================================================
CM$VER      2.01.06     05/07/2000
--------------------------------------------------------------------------------
- Implementação da Nova tela de Medição.
================================================================================
CM$VER      2.01.05     30/05/2000
--------------------------------------------------------------------------------
* Acertado o erro da tela de abertura => NOME_ITEM not the expected type
================================================================================
CM$VER      2.01.04     25/04/2000
--------------------------------------------------------------------------------
* Disponibilizada opção de apenas mostrar itens contratuais que ainda não estejam
relacionados com objetos na tela de cadastro Objeto X Item. (desmarcando a 
opção são listados todos os itens contratuais).
================================================================================
CM$VER      2.01.03     07/04/2000
--------------------------------------------------------------------------------
* Campo Nome aumentado para 100 caracteres (Cadastro de Item Contratual)
* No Cadastro de Objeto X Item Contratual , após a mensagem "registro já existente "
 não estava sendo possível alterar.
* No cadastro do contrato, o endereço da contraparte não abre corretamente
 de acordo com o endereço cadastrado. 
* Retirados números que apareciam ao lado dos itens no cadastro de objeto x item contratual
* texto não aparecia por completo no item e no objeto na tela cadastro de objeto
x item contratual
* Aparece "value out of bounds" em base de cálculo ao digitar um número (cadastro de objeto
x item contratual ).
* Na tela de abertura a notificação de encerramento está colocando como encerrado contratos do ano 2000. 
* Agora todos os Itens relacionados com o objeto (não apenas os relacionados em objeto x item contratual)
aparecem em cinza enquanto que os relacionados aparecem normais.
* No relatório de aditamentos o nome do contrato não aparecia por completo
* Liberada opção na tela de parametros do sistema a opção de Englobar os 
documentos lançados (refere-se aos itens contratuais que foram cadastrados 
para efetuar lançamento no Contas a Pagar e a Receber)
* No cadastro de imagens após confirmação , não está habilitando botão para buscar
imagem e a imagem não está se ajustando para aparecer corretamente (algumas 
partes estavam saindo cortadas)
* Incluida rotina para ler imagens padrão jpeg e gif
* Incluida rotina para cadastrar várias imagens de um determinado diretório
na tela de cadastro de imagens. As imagens deverao estar padronizadas de 
acordo com o exemplo:
   nome do arquivo pagina.***
   nomedoarquivopagina.***
 (onde *** é a extensão de arquivo de imagem, que pode ser : jpeg,jpg,bmp,gif,wmf)
* Implementada rotina para ampliar visualização da imagem na tela de abertura 
e rotina para voltar a posição inicial.
================================================================================
CM$VER      2.01.02     28/02/2000
--------------------------------------------------------------------------------
* Implementado Relatório de Aditamento
================================================================================
CM$VER      2.01.01     25/02/2000
--------------------------------------------------------------------------------
* Na tela Cadastro de Contrato :
  * foi aumentado o campo Nome do Contrato para 60 caracteres;
  * Código do Contrato agora chama-se Número do Processo;
  * Corrigido endereço da contraparte;
  * Incluido campo de observação e campo para cláusula de renovação;
* Incluida tela de cadastro de clientes e de fornecedores.
* Na tela Cadastro de Objeto x Item Contratual:
   * a data base default do item é a data base cadastrada para o contrato;
   * Corrigida tela de procura onde não aparecia o nome do contrato e sim o número do mesmo;
* Contratos vencidos ou encerrados são avisados antecipadamente pela Tela de Abertura 
  com o prazo designado na tela de parâmetros do sistema.
* Na tela Cadastro de Imagem do Contrato agora é possível inserir diretamente um arquivo de 
imagem bitmap (além da opção de colar).
================================================================================
CM$VER      2.01.00     17/02/2000
--------------------------------------------------------------------------------
* Novas Telas implementadas :
  * Tela de Paramentros do Sistema
  * Tela de Abertura - visualiza informações mais importantes do contrato e visualiza a 
 imagem digitalizada disponível para o contrato;
  * Tela de Cadastro de Imagens - insere no sistema a imagem digitalizada do contrato e 
 vincula ao contrato;
================================================================================
CM$VER      2.00.07     11/02/2000
--------------------------------------------------------------------------------
* Na tela Cadastro de Objeto x Item Contratual o rateio ajusta valores para
 máximo de 100%.
================================================================================
CM$VER      2.00.06     24/01/2000
--------------------------------------------------------------------------------
* Contrato não encerrava cadastramento. Na tela de medição o valor unitário 
não aparecia corretamente. Ambos corrigidos.
================================================================================
CM$VER      2.00.05     24/01/2000
--------------------------------------------------------------------------------
* Correção menores.
================================================================================
CM$VER      2.00.04     17/12/1999
--------------------------------------------------------------------------------
*Corrigida Tela Cadastro de Projetos .
================================================================================
CM$VER      2.00.03     26/10/1999
--------------------------------------------------------------------------------
* Tela de Contrato atualizada com novas opções
================================================================================
CM$VER      2.00.02     25/10/1999
--------------------------------------------------------------------------------
- Feita a integração com o contas a receber/pagar e contabilidade
================================================================================
CM$VER      2.00.01     13/07/1999
--------------------------------------------------------------------------------
- Atualizada a versão para a nova dpl
================================================================================
CM$ALT}
