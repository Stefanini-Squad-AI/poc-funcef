program CAF;

uses
  Forms,
  FPai in '..\..\CM\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\CM\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FCMEntrada in '..\..\CM\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FSairAjuda in '..\..\CM\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\CM\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FCadastroMT in '..\..\CM\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroGridMT in '..\..\CM\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  FCadastroMestreDetMT in '..\..\CM\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FpessoaMT in '..\..\CM\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  FAguarde in '..\..\CM\Forms\Source\fAguarde.pas' {frmAguarde},
  FCmReport in '..\..\CM\Forms\Source\FCmReport.pas' {FrmCmReport},
  FParamReports_Padrao in '..\..\CM\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  fMTCadMoedas in 'fMTCadMoedas.pas' {frmMTCadMoedas},
  fMTCadPaises in 'fMTCadPaises.pas' {frmMTCadPaises},
  fMTUtilExpPlacas in 'fMTUtilExpPlacas.pas' {frmMTUtilExpPlacas},
  fMTUtilExpContab in 'fMTUtilExpContab.pas' {frmMTUtilExpContab},
  fMTUtilExpCadBensSRF in 'fMTUtilExpCadBensSRF.pas' {frmMTUtilExpCadBensSRF},
  fMTUtilExpDadosparaReaval in 'fMTUtilExpDadosparaReaval.pas' {frmMTUtilExpDadosparaReaval},
  fMTUtilAjustaLancImplantacao in 'fMTUtilAjustaLancImplantacao.pas' {frmMTUtilAjustaLancImplantacao},
  fMTUtilReconDeprecBem in 'fMTUtilReconDeprecBem.pas' {frmMTUtilReconDeprecBem},
  fMTUtilExpSISPROxOFA in 'fMTUtilExpSISPROxOFA.pas' {frmMTUtilExpSISPROxOFA},
  fMTCadBemPendente in 'fMTCadBemPendente.pas' {frmMTCadBemPendente},
  fMTCadBemCotacao in 'fMTCadBemCotacao.pas' {frmMTCadBemCotacao},
  fMTCadDestinatBaixa in 'fMTCadDestinatBaixa.pas' {frmMTCadDestinatBaixa},
  fMTCadMotivoBaixa in 'fMTCadMotivoBaixa.pas' {frmMTCadMotivoBaixa},
  fMTCadObraTipoEtapa in 'fMTCadObraTipoEtapa.pas' {frmMTCadObraTipoEtapa},
  fMTCadParamCAF in 'fMTCadParamCAF.pas' {frmMTCadParamCAF},
  fMTCadParamCAFxContab in 'fMTCadParamCAFxContab.pas' {frmMTCadParamCAFxContab},
  fMTCadTipoDespAV in 'fMTCadTipoDespAV.pas' {frmMTCadTipoDespAV},
  fMTCadTipoSaidaTemp in 'fMTCadTipoSaidaTemp.pas' {frmMTCadTipoSaidaTemp},
  fMTConsCadBens in 'fMTConsCadBens.pas' {frmMTConsCadBens},
  fMTConsCafObra in 'fMTConsCafObra.pas' {frmMTConsCafObra},
  fMTConsHistMovBem in 'fMTConsHistMovBem.pas' {frmMTConsHistMovBem},
  fMTConsInventBens in 'fMTConsInventBens.pas' {frmMTConsInventBens},
  fMTConsParamContab in 'fMTConsParamContab.pas' {frmMTConsParamContab},
  fMTConsSaldoContabBem in 'fMTConsSaldoContabBem.pas' {frmMTConsSaldoContabBem},
  fMTConsSaldoContabGrupo in 'fMTConsSaldoContabGrupo.pas' {frmMTConsSaldoContabGrupo},
  fMTEstornaFechamento in 'fMTEstornaFechamento.pas' {frmMTEstornaFechamento},
  fMTEstornaMovimentacoes in 'fMTEstornaMovimentacoes.pas' {frmMTEstornaMovimentacoes},
  fMTFechamento in 'fMTFechamento.pas' {frmMTFechamento},
  fMTInvColPDT3100 in 'fMTInvColPDT3100.pas' {frmMTInvColPDT3100},
  fMTInvColScwLucas7000 in 'fMTInvColScwLucas7000.pas' {frmMTInvColScwLucas7000},
  fMTInvGeracao in 'fMTInvGeracao.pas' {frmMTInvGeracao},
  fMTInvRegNaoEncontrados in 'fMTInvRegNaoEncontrados.pas' {frmMTInvRegNaoEncontrados},
  fMTInvRegResultado in 'fMTInvRegResultado.pas' {frmMTInvRegResultado},
  fMTInvProcessar in 'fMTInvProcessar.pas' {frmMTInvProcessar},
  fMTInvProcSelTermo in 'fMTInvProcSelTermo.pas' {frmMTInvProcSelTermo},
  fMTMovAcrescimoValor in 'fMTMovAcrescimoValor.pas' {frmMTMovAcrescimoValor},
  fMTMovBaixa in 'fMTMovBaixa.pas' {frmMTMovBaixa},
  fMTMovBensPendentes in 'fMTMovBensPendentes.pas' {frmMTMovBensPendentes},
  fMTMovControleTotal in 'fMTMovControleTotal.pas' {frmMTMovControleTotal},
  fMTMovDesmembramento in 'fMTMovDesmembramento.pas' {frmMTMovDesmembramento},
  fMTMovReavaliacao in 'fMTMovReavaliacao.pas' {frmMTMovReavaliacao},
  fMTMovRemembramento in 'fMTMovRemembramento.pas' {frmMTMovRemembramento},
  fMTMovSelBaixa in 'fMTMovSelBaixa.pas' {frmMTMovSelBaixa},
  fMTMovSelTransf in 'fMTMovSelTransf.pas' {frmMTMovSelTransf},
  fMTMovSaidaTempCad in 'fMTMovSaidaTempCad.pas' {frmMTMovSaidaTempCad},
  fMTMovSaidaTempExe in 'fMTMovSaidaTempExe.pas' {frmMTMovSaidaTempExe},
  fMTMovSaidaTempRet in 'fMTMovSaidaTempRet.pas' {frmMTMovSaidaTempRet},
  fMTMovTransfBem in 'fMTMovTransfBem.pas' {frmMTMovTransfBem},
  fMTMovTransfPlaca in 'fMTMovTransfPlaca.pas' {frmMTMovTransfPlaca},
  fMTObraCad in 'fMTObraCad.pas' {frmMTObraCad},
  fMTObraLanc in 'fMTObraLanc.pas' {frmMTObraLanc},
  fMTObraLancAltera in 'fMTObraLancAltera.pas' {frmMTObraLancAltera},
  fMTObraLancEstorna in 'fMTObraLancEstorna.pas' {frmMTObraLancEstorna},
  fMTObraDesmemb in 'fMTObraDesmemb.pas' {frmMTObraDesmemb},
  fMTObraDesmembEstorna in 'fMTObraDesmembEstorna.pas' {frmMTObraDesmembEstorna},
  fMTObraEncerrar in 'fMTObraEncerrar.pas' {frmMTObraEncerrar},
  fMTReconstroiSaldo in 'fMTReconstroiSaldo.pas' {frmMTReconstroiSaldo},
  fMTSelMultiBem in 'fMTSelMultiBem.pas' {frmMTSelMultiBem},
  uCtrlRptCAF in 'uCtrlRptCAF.pas',
  rCAFBalPatBem in '..\Reports\rCAFBalPatBem.pas' {RptCAFBalPatBem},
  rCAFBalPatBemBx in '..\Reports\rCAFBalPatBemBx.pas' {rptCAFBalPatBemBx},
  rCAFBalPatCC in '..\Reports\rCAFBalPatCC.pas' {RptCAFBalPatCC},
  rCAFBalPatClas in '..\Reports\rCAFBalPatClas.pas' {RptCAFBalPatClas},
  rCAFBalPatGrp in '..\Reports\rCAFBalPatGrp.pas' {RptCAFBalPatGrp},
  rCAFBalPatGrpA in '..\Reports\rCAFBalPatGrpA.pas' {RptCAFBalPatGrpA},
  rCAFBalPatGrpBx in '..\Reports\rCAFBalPatGrpBx.pas' {rptCAFBalPatGrpBx},
  rCAFBalPatGrpxClas in '..\Reports\rCAFBalPatGrpxClas.pas' {RptCAFBalPatGrpxClas},
  rCAFSldCtbCCustoA in '..\Reports\rCAFSldCtbCCustoA.pas' {RptCAFSldCtbCCustoA},
  rCAFSldCtbCCustoS in '..\Reports\rCAFSldCtbCCustoS.pas' {RptCAFSldCtbCCustoS},
  rCAFSldCtbGrupoA in '..\Reports\rCAFSldCtbGrupoA.pas' {RptCAFSldCtbGrupoA},
  rCAFCadBem in '..\Reports\rCAFCadBem.pas' {RptCAFCadBem},
  rCAFCadBemCustom in '..\Reports\rCAFCadBemCustom.pas' {RptCAFCadBemCustom},
  rCAFCadBemCustomFrm in '..\Reports\rCAFCadBemCustomFrm.pas' {RptCAFCadBemCustomFrm},
  rCAFCadClasse in '..\Reports\rCAFCadClasse.pas' {RptCAFCadClasse},
  rCAFCadConjxRatCC in '..\Reports\rCAFCadConjxRatCC.pas' {RptCAFCadConjxRatCC},
  rCAFCadConjxBens in '..\Reports\rCAFCadConjxBens.pas' {RptCAFCadConjxBens},
  rCAFCadGrupo in '..\Reports\rCAFCadGrupo.pas' {RptCAFCadGrupo},
  rCAFCadLocal in '..\Reports\rCAFCadLocal.pas' {RptCAFCadLocal},
  rCAFCadTipoArea in '..\Reports\rCAFCadTipoArea.pas' {RptCAFCadTipoArea},
  rCAFCadTipoMov in '..\Reports\rCAFCadTipoMov.pas' {RptCAFCadTipoMov},
  rCAFCadParamContab in '..\Reports\rCAFCadParamContab.pas' {RptCAFCadParamContab},
  rCAFInvGuiaTransfBem in '..\Reports\rCAFInvGuiaTransfBem.pas' {RptCAFInvGuiaTransfBem},
  rCAFInvPat in '..\Reports\rCAFInvPat.pas' {RptCAFInvPat},
  rCAFInvResLev in '..\Reports\rCAFInvResLev.pas' {RptCAFInvResLev},
  rCAFInvBensNaoEncont in '..\Reports\rCAFInvBensNaoEncont.pas' {RptCAFInvBensNaoEncont},
  rCAFAcrescValorBem in '..\Reports\rCAFAcrescValorBem.pas' {RptCAFAcrescValorBem},
  rCAFAutSaidaBens in '..\Reports\rCAFAutSaidaBens.pas' {RptCAFAutSaidaBens},
  rCAFConcCafContab in '..\Reports\rCAFConcCafContab.pas' {RptCAFConcCafContab},
  rCAFConsCAFContab2 in '..\Reports\rCAFConsCAFContab2.pas' {RptCAFConsCAFContab2},
  rCAFConsDeprec in '..\Reports\rCAFConsDeprec.pas' {RptCAFConsDeprec},
  rCAFMovAnaPer in '..\Reports\rCAFMovAnaPer.pas' {RptCAFMovAnaPer},
  rCAFMovAnaPer2 in '..\Reports\rCAFMovAnaPer2.pas' {RptCAFMovAnaPer2},
  rCAFMovPatBem in '..\Reports\rCAFMovPatBem.pas' {RptCAFMovPatBem},
  rCAFMovPatGrp in '..\Reports\rCAFMovPatGrp.pas' {rptCAFMovPatGrp},
  rCAFMovPatGrpA in '..\Reports\rCAFMovPatGrpA.pas' {RptCAFMovPatGrpA},
  rCAFMovPatGrpAxMov in '..\Reports\rCAFMovPatGrpAxMov.pas' {RptCAFMovPatGrpAxMov},
  rCAFObras in '..\Reports\rCAFObras.pas' {RptCAFObras},
  rCAFLancObras in '..\Reports\rCAFLancObras.pas' {rptCAFLancObras},
  rCAFParamContab in '..\Reports\rCAFParamContab.pas' {RptCAFParamContab},
  rCAFSelBxBens in '..\Reports\rCAFSelBxBens.pas' {RptCAFSelBxBens},
  rCAFTermoResp in '..\Reports\rCAFTermoResp.pas' {RptCAFTermoResp},
  rCAFTransfPatGrp in '..\Reports\rCAFTransfPatGrp.pas' {RptCAFTransfPatGrp},
  rCAFTransfPatGrpA in '..\Reports\rCAFTransfPatGrpA.pas' {RptCAFTransfPatGrpA},
  rCAFResumoSaldosGrp in '..\Reports\rCAFResumoSaldosGrp.pas' {RptCAFResumoSaldosGrp},
  rCAFFichaAnalitica in '..\Reports\rCAFFichaAnalitica.pas' {RptCAFFichaAnalitica},
  rCAFRelAquisPer in '..\Reports\rCAFRelAquisPer.pas' {RptCAFRelAquisPer},
  rCAFRazaoPatAux in '..\Reports\rCAFRazaoPatAux.pas' {RptCAFRazaoPatAux},
  rCAFProjSldCtbBem in '..\Reports\rCAFProjSldCtbBem.pas' {rptCAFProjSldCtbBem},
  rCAFProjSldCtbBemFrm in '..\Reports\rCAFProjSldCtbBemFrm.pas' {rptCAFProjSldCtbBemFrm},
  rCAFProjSldCtbGrpAnual in '..\Reports\rCAFProjSldCtbGrpAnual.pas' {rptCAFProjSldCtbGrpAnual},
  fMTUtilCorrGrupoBem in 'fMTUtilCorrGrupoBem.pas' {frmMTUtilCorrGrupoBem},
  fMTInvRegResLocBem in 'fMTInvRegResLocBem.pas' {frmMTInvRegResLocBem},
  DAutorizacao in '..\..\Cm\Forms\Source\DAutorizacao.pas' {DtmAutorizacao: TDataModule},
  fMTMovSelReaval in 'fMTMovSelReaval.pas' {frmMTMovSelReaval},
  rCAFReavalBem in '..\Reports\rCAFReavalBem.pas' {RptCAFReavalBem},
  fMTUtilTransfIlegal in 'fMTUtilTransfIlegal.pas' {frmMTUtilTransfIlegal},
  rCAFBensPenhorados in '..\Reports\rCAFBensPenhorados.pas' {RptCAFBensPenhorados},
  fMTInvColCMNet in 'fMTInvColCMNet.pas' {frmMTInvColCMNet},
  fCAFTermoResp in 'fCAFTermoResp.pas' {frmCAFTermoResp},
  fMTCadDepreVida in 'fMTCadDepreVida.pas' {FrmMTCadDepreVida},
  uFrmImportAcreDecreValor in 'uFrmImportAcreDecreValor.pas' {FrmImportAcreDecreValor};

{$R *.RES}
{$R CAF_RES.RES}

begin
   frmCMEntrada:= TfrmCMEntrada.Create(Application);
   frmCMEntrada.Show;
   frmCMEntrada.Update;
   //-------------------------------------------------------------------------------------
   Application.Initialize;
   Application.Title := 'Ativo Fixo';
   Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TDtmAutorizacao, DtmAutorizacao);
  frmCMEntrada.Hide;
   frmCMEntrada.Free;
   //-------------------------------------------------------------------------------------
   Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Controle do Ativo Fixo
================================================================================
CM$VER      3.09.18c    20/06/2008
--------------------------------------------------------------------------------
- Pendência 28239: Relatórios Cadastro de Bens e Seleção de Bens Customizáveis
  Ajuste para exibir bens que não tiveram movimentação histórica de conjunto.
================================================================================
CM$VER      3.09.18b    25/01/2008
--------------------------------------------------------------------------------
Geração de Dados para Levantamento de Inventário
  Pendência: 27279 - Inclusão do modelo de Coletor de Dados CMNet.
  Pendência: 27238 - Ajuste na exportação dos bens para Coletor CMNet excluindo os
                     caracteres de áspas. Inclusão de filtro para exportar apenas bens
                     pertencentes ao Ativo Fixo.
================================================================================
CM$VER      3.09.18a    03/01/2008
--------------------------------------------------------------------------------
- Pendencia 22757: Ajuste de reavaliação
  Criadas rotinas para efetuar retificação de reavaliação e desfazer retificação de ravaliação
- Pendencia 23809: Geração de Inventário
  Ajuste para considerar a movimentação histórica 
- Pendencia 20707: Relatórios de bens customizáveis
  Ajuste para evitar erro ao informar um número grande de bens
================================================================================
CM$VER      3.09.18     21/01/2008
--------------------------------------------------------------------------------
- Pendência 23854 - Cadastro de Conjuntos
  Permitir colocar o conjunto como inativo quando não houver nenhum bem ativo associado
  ao mesmo.
- Pendência 23856 - Relatórios - Cadastro de Conjuntos - Bens
  Implementação de filtro permitindo escolher somente os bens ativos ou todos.
- Pendência 26086 - Integração Contábil
  Ajuste do processo de integração quando informado no cadastro do bem o rateio por
  plano e patrocinadora.
- Pendência 24003 - Relatórios - Balancete patrimonial por bem
  Melhoria de Performance.
================================================================================
CM$VER      3.09.17     14/08/2007
--------------------------------------------------------------------------------
- Liberação do padrão 17
================================================================================
CM$VER      3.09.16a    20/09/2007
--------------------------------------------------------------------------------
- Pendencia 24003: Relatório de Balancete Patrimonial por Bem
  Ajuste na query para melhorar performance do relatório
================================================================================
CM$VER      3.09.16     24/05/2007
--------------------------------------------------------------------------------
Pend 24616 - Implementação de Relatório de Bens Penhorados
Pend 24940 - Implementação de filtro no Relatório de Bens para Inventário Patrimônio, excluindo os bens do Investimento Imobiliário.
================================================================================
CM$VER      3.09.15     07/05/2007
--------------------------------------------------------------------------------
Relatório - Seleção de Bens Customizável
  Pendência: 25279 - Inclusão do status de "Penhorado" na tela de seleção de bens.
================================================================================
CM$VER      3.09.14     23/01/2007
--------------------------------------------------------------------------------
Liberação do padrão 14
================================================================================
CM$VER      3.09.13c    07/02/2007
--------------------------------------------------------------------------------
Coletor de Dados Seal - PDT 3100 - 32 Bits
  Pendência : 24381 - Ajuste no processo de Inclusão de checkbox que permita ao usuário
converter arquivos DAC para arquivo texto e carregá-los no Resultado do Inventário.
Obs.: Referente à pendência do Hotal de número 41167
================================================================================
CM$VER      3.09.13b    01/02/2007
--------------------------------------------------------------------------------
Coletor de Dados Seal - PDT 3100 - 32 Bits
  Pendência : 24381 - Inclusão de checkbox que permita ao usuário converter arquivos DAC
para arquivo texto e carregá-los no Resultado do Inventário.
Obs.: Referente à pendência do Hotal de número 41167
================================================================================
CM$VER      3.09.13a    19/01/2007
--------------------------------------------------------------------------------
Pend 22813 - Relat. de Termo de Responsabilidade - Inclusão de filtro por Bem
Pend 24037 - Cadastro de Localizações - Correção do número de centro de custos exibido
Pend 22104 - Relat. Cadastro de Bens - Inclusão de filtro por tipo de bem ( mobiliário, imobiliário )
Pend 21732 - Integração com módulo Jurídico para penhora de bens  
Pend 23919 - Integração Contábil - Busca do plano comum quando da inexistência do 
                     plano administrativo.
Pend 17582 - Considerar apenas planos previdenciários ativos no cadastro de parâmetros
                     do Global.
================================================================================
CM$VER      3.09.13     21/11/2006
--------------------------------------------------------------------------------
- Liberação do padrão 13
================================================================================
CM$VER      3.09.12c    01/02/2007
--------------------------------------------------------------------------------
Coletor de Dados Seal - PDT 3100 - 32 Bits
  Pendência : 24381 - Inclusão de checkbox que permita ao usuário converter arquivos DAC
para arquivo texto e carregá-los no Resultado do Inventário.
Obs.: Referente à pendência do Hotal de número 41167
================================================================================
CM$VER      3.09.12b    26/01/2007
--------------------------------------------------------------------------------
- Pendencia 24331: Implementação para ignorar codigo de erro 29
================================================================================
CM$VER      3.09.12a    19/01/2007
--------------------------------------------------------------------------------
Pend 22813
        Relat. de Termo de Responsabilidade - Inclusão de filtro por Bem
Pend 24037
        Cadastro de Localizações - Correção do número de centro de custos exibido
Pend 22104
        Relat. Cadastro de Bens - Inclusão de filtro por tipo de bem ( mobiliário, imobiliário )
Pend 17582
        Considerar apenas os planos previdenciários ativos definidos no cadastro Global
Pend 21732
        Integração com módulo Jurídico para penhora de bens
================================================================================
CM$VER      3.09.12     15/09/2006
--------------------------------------------------------------------------------
- Liberação do Padrão 12
================================================================================
CM$VER      3.09.11a    21/08/2006
--------------------------------------------------------------------------------
- Pendencia 21139: 
   Criação de parâmetro para indicar se o histórico contábil deve ou não ser agrupado
   Implementação de agrupamento de histórico na integração contábil, conforme parametrização
================================================================================
CM$VER      3.09.11     28/07/2006
--------------------------------------------------------------------------------
Liberação do padrão 11.
================================================================================
CM$VER      3.09.10     12/07/2006
--------------------------------------------------------------------------------
Liberação do padrão 10.
================================================================================
CM$VER      3.09.09     22/03/2006
--------------------------------------------------------------------------------
Solução de problema de arrendondamento no rateio de movimentações.
================================================================================
CM$VER      3.09.08d    22/03/2006
--------------------------------------------------------------------------------
Utilitários - Lista bens\Grupos inconsistentes
    Liberação do processo para utilização até 30/04/2006
================================================================================
CM$VER      3.09.08c    24/02/2006
--------------------------------------------------------------------------------
Implementação de utilitário que permitirá identificar os bens que sofreram alteração manual do grupo contábil.
================================================================================
CM$VER      3.09.08b    14/02/2006
--------------------------------------------------------------------------------
Pendência 21557
- Erro ao abrir a tela de Movimentação/Seleção para transferência de bem.
================================================================================
CM$VER      3.09.08a    07/02/2006
--------------------------------------------------------------------------------
Liberação do padrão 8
================================================================================
CM$VER      3.09.08     14/02/2006
--------------------------------------------------------------------------------
Pendência 21557
- Erro ao abrir a tela de Movimentação/Seleção para transferência de bem.
================================================================================
CM$VER      3.09.07     26/09/2005
--------------------------------------------------------------------------------
Versão compatível com:
Versão 3.09.07 do Objeto Negocio CAF
Pendencia 30337
Alterar as Heranças implementadas no PadrãoCM 
5.10.06 do TotalPrev.
Pendencia 21618
Gerar a opção Seleção de Bens para Reavaliação, e nela 
foi colocada a opção de importação dos dados de um arquivo texto.
Pendencia 29807
Ao tentar desfazer a transferência em 01/02, apesar 
desta ter sido feita após o fechamento, a função está 
testando o período contábil no dia anterior (janeiro) em 
função da verificação de depreciação pro-rata em 31/01, 
mesmo que esta não tenha ocorrido. Com isto não 
conseguimos desfazer a transferência.
Passos :
1. Efetuamos o fechamento do período de 31/01/2005
2. Fizemos a transferência de grupo em 01/02/2005 
3. A Contabilidade fechou (bloqueou) o período de janeiro. 
(Ver email Vinicius/Funcef em 12/08)
Pendencia 29831
Tratar o arredondamento do Rateio por Centro de
Custo, jogando a diferença entre o valor original
e a soma dos rateios no centro de custo com o 
maior percentual. (email Vinícius 15/08)
(TotalPrev 19970)
Pendencia 28275
Desenvolver um estorno para a Correção de Grupos
Contábeis.
Pendencia 30388
Informar na tela, das consultas abaixo, quando o
bem estiver em Saída Temporária.
- Cadastro de bens
- Saldo Contábil por Bem
- Histórico de Movimentações.
Pendencia 29542
Verificar a discrepancia nos cálculos pró-rata do 
fechamento realizado após reavaliação no 
método 2. (email Vinícius)
Pendencia 27736
Alteração da descrição do check-box para: 
"Conta padrão para o Critério de Segregação".
e não permitir marcar mais de uma conta.
Pendencia 26782
Alterar o método que trata da segregação de 
recursos, passando a usar a conta á débito qdo
a contabilidade usar a segregação e o cliente 
não definir na parametrização contábil a conta 
que deverá ser usada.
Pendencia 27824
Registrar o valor da venda na tabela 
HISTORICOMOVIMENTACAO.
Pendencia 28647
Solicito implementação no relatório balancete 
patrimonial por bem no CAF os filtros para 
escolher Bens Patrimoniais, imobiliário e todos
Igual ao filtro do relatório Balancete Patrimonial
por Grupo Contábil - Analítico.
================================================================================
CM$VER      3.09.05     20/05/2005
--------------------------------------------------------------------------------
Liberação do Padrão 5.10.06
================================================================================
CM$VER      3.09.04c    09/05/2005
--------------------------------------------------------------------------------
Cadastro de Conjuntos
  - Possibilidade de alteração do Responsável
================================================================================
CM$VER      3.09.04a    19/04/2005
--------------------------------------------------------------------------------
Correção de Grupo Contábil
  - Ajuste do processo - Campo IdBem não encontrado.
Cadastro de Bens
  - Correção no cadastro de bens, onde a depreciação somente era carregada após
    selecionar novamente o Grupo Contábil.
================================================================================
CM$VER      3.09.04     07/04/2005
--------------------------------------------------------------------------------
Pendencia 26467
  - Verificar se integração contábil da movimentação Reavaliação está realizando
    a baixa da depreciação acumulada e lançando-a a crédito na conta de custo.
Pendencia 26462 / TotalPrev 18877
  - Levantamento de Inventário - O botão pesquisar item está removendo o item
    selecionado no grid no instante em que é acionado.
    Incluir tambem os campos Localização, Grupo e Conjunto.
Pendencia 26521
  - Implementar na uCtrlCafxContab a inclusão do código de imóvel gerado pelo
    InvestImob no histórico contábil.
Pendencia 26089
  - Implementação do retorno dos IDs dos bens criados na função ExecutaEncerramentoObra
    para que eu possa ser associados ao imóvel criado no Investimob.
Pendencia 26597
  - Correção do lançamento dos valores acumulados das depreciações de reavaliações
    negativas no bem resultante do Remembramento.
Pendencia 26375
  - Correção do acesso ao botão de Exportar/Importar dados de coletores de dados nas
    funções de geração e resultado de inventário.
Pendencia 25727
  - Verificar a causa das diferenças encontradas entre os lançamentos realizados no
    CAF com os lançamentos realizados na Contabilidade, conforme documentos em anexo.
Pendencia 25568
  - Verificar e contornar a incompatibilidade da função CdsToDbObject no Delphi 5,
    usado na alteração restrita do Cadastro de Bens
Pendencia 24608
  - Liberar para preenchimento os campos ATIVIDADE/PROJETO e SUBCONTA na tela de
    cadastro de bens do movimento ENTRADA DE BENS PENDENTES.
================================================================================
CM$VER      3.09.02     28/12/2004
--------------------------------------------------------------------------------
Versão compatível com:
Versão 3.09.02 do Objeto Negocio CAF
Pendencia 24274
Converter a função Correção de Grupo Contábil existente na versão do Totalprev para a 
versão MT do CAF. (D5 e D7)
================================================================================
CM$VER      3.09.01     06/12/2004
--------------------------------------------------------------------------------
Pendencia 23420
Implementação da Segregação de Recursos. As rotinas de integração contabil,
o cadastro de parametrização contábil e o relatório de parametrização contábil
foram modificados.
================================================================================
CM$VER      3.09.00     
--------------------------------------------------------------------------------
Versão compatível com:
Versão 3.09.00 do Objeto Negocio CAF
Pendencia 23446:
Conversão do sistema para funcionamento em três camadas, com o downgrade de
Delphi 7 para Delphi 5, unificando as versões do Hotal com o TotalPrev.
================================================================================
CM$ALT}
































































