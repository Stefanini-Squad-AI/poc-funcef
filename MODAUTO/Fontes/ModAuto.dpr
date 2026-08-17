Program ModAuto;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\CM\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\CM\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\cm\forms\Source\fAguarde.pas' {frmAguarde},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastroPai in '..\..\Cm\Forms\Source\FCadastroPai.pas' {frmCadastroPai},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadastroDetCS in '..\..\Cm\Forms\Source\FCadastroDetCS.pas' {frmCadastroDetCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  fCadFerias in 'FCadFerias.pas' {frmCadFerias},
  fParamVariavelMensal in '..\..\Shared\ModComp\Reports\Source\fParamVariavelMensal.pas' {frmParamVariavelMensal},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  dRelatoriosModAuto in 'dRelatoriosModAuto.pas' {dtmRelatoriosModAuto},
  uImprimeRelatorio in '..\..\Shared\ModComp\Fontes\uImprimeRelatorio.pas',
  fCadOSMan in 'fCadOSMan.pas' {frmCadOSMan},
  UGeraCapCar in 'UGeraCapCar.pas',
  FRParamRelGrupo in 'FRParamRelGrupo.pas' {FrmRParamRelGrupo},
  FRParamRelAnoGrupo in 'FRParamRelAnoGrupo.pas' {FrmRParamRelAnoGrupo},
  FRParamOrcxRealConta in 'FRParamOrcxRealConta.pas' {FrmRParamOrcxRealConta},
  FParamAtivGestor2 in 'FParamAtivGestor2.pas' {frmParamAtivGestor2},
  FLancaDestac in '..\FontesMT\FLancaDestac.pas' {frmLancaDestac},
  fParamAvisoFerias in 'fParamAvisoFerias.pas' {frmParamAvisoFerias},
  FCadReq in 'FCadReq.pas' {FrmCadReq},
  UConversaoMed in 'UConversaoMed.pas',
  DMoviment in 'DMoviment.pas' {DtmMoviment: TDataModule},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FResciContr in 'FResciContr.pas' {frmResciContr},
  fParamCartaComun in '..\..\Shared\ModComp\Fontes\fParamCartaComun.pas' {frmParamCartaComun},
  dRelatorioCartaComun in '..\..\Shared\ModComp\Fontes\dRelatorioCartaComun.pas' {dtmRelatorioCartaComun: TDataModule},
  FSolicSaude in 'FSolicSaude.pas' {frmSolicSaude},
  Fpessoa in '..\..\Cm\Forms\Source\fPessoa.pas' {frmPessoa},
  FSelPessoal in '..\..\Shared\ModComp\Fontes\FSelPessoal.pas' {frmSelPessoal},
  FSolicTicket in 'FSolicTicket.pas' {frmSolicTicket},
  FSolicBenef in 'FSolicBenef.pas' {frmSolicBenef},
  FCadContrato in 'FCadContrato.pas' {frmCadContrato},
  FSelEstCusto in 'FSelEstCusto.pas' {FRMSelEstCusto},
  FEstCusto in 'FEstCusto.pas' {frmEstCusto},
  fAgendaTrein in '..\..\Shared\ModComp\FontesMT\fAgendaTrein.pas' {frmAgendaTrein},
  FConsHst in 'FConsHst.pas' {frmConsHst},
  fParamLancRubReemb in 'fParamLancRubReemb.pas' {frmParamLancRubReemb},
  fParamDestacamento in 'fParamDestacamento.pas' {frmParamDestacamento},
  fParamCadDependente in 'fParamCadDependente.pas' {frmParamCadDependente},
  fParamLancRubIndiv in 'fParamLancRubIndiv.pas' {frmParamLancRubIndiv},
  fParamAlterFuncional in '..\..\Shared\ModComp\Reports\Source\fParamAlterFuncional.pas' {frmParamAlterFuncional},
  RAlterFuncional in '..\..\Shared\ModComp\Reports\Source\RAlterFuncional.pas' {RptAlterFuncional},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fRegLinha in '..\..\Shared\ModComp\FontesMT\fRegLinha.pas' {frmRegLinha},
  REtiquetaFerias in '..\..\Shared\ModComp\Fontes\REtiquetaFerias.pas' {rptEtiquetaFerias},
  DRelatoriosContrato in 'DRelatoriosContrato.pas' {dtmRelatoriosContrato},
  FRelatPgto in 'FRelatPgto.pas' {frmRelatPgto},
  FRelatContratos in 'FRelatContratos.pas' {frmRelatContratos},
  FRelatAditamentos in 'FRelatAditamentos.pas' {frmRelatAditamentos},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  RCadPessoal in '..\..\Shared\ModComp\Reports\Source\RCadPessoal.pas' {RptCadPessoal},
  fParamCadPessoal in '..\..\Shared\ModComp\Reports\Source\fParamCadPessoal.pas',
  REtiquetas in '..\..\Shared\ModComp\Reports\Source\REtiquetas.pas' {RptEtiquetas},
  fSelPessoalMT in '..\..\Shared\ModComp\FontesMT\fSelPessoalMT.pas' {frmSelPessoalMT},
  fParamEtiquetas in '..\..\Shared\ModComp\Reports\Source\fParamEtiquetas.pas',
  RResFolComp in '..\..\Shared\ModComp\Reports\Source\RResFolComp.pas' {RptResFolComp},
  fParamResFolComp in '..\..\Shared\ModComp\Reports\Source\fParamResFolComp.pas' {frmParamResFolComp},
  uCmCtrlRptModAuto in '..\CtrlObjetos\uCmCtrlRptModAuto.pas',
  dRelatorioEtiqAltCTPS in '..\..\Shared\ModComp\Fontes\dRelatorioEtiqAltCTPS.pas' {dtmRelatorioEtiqAltCTPS},
  fLancaRubPorRub in '..\..\Shared\ModComp\FontesMT\fLancaRubPorRub.pas' {frmLancaRubPorRub},
  RCartaConvoc in '..\..\Shared\ModComp\Reports\Source\RCartaConvoc.pas' {rptCartaConvoc},
  RVariavelMensal in '..\..\Shared\ModComp\Reports\Source\RVariavelMensal.pas' {RptVariavelMensal},
  fCadRequi in '..\..\Shared\ModComp\FontesMT\fCadRequi.pas' {frmCadRequi},
  RReqPessoal in '..\..\Shared\ModComp\Reports\Source\RReqPessoal.pas' {RptReqPessoal},
  fCadCand in '..\..\Shared\ModComp\FontesMT\fCadCand.pas' {frmCadCand},
  fCadRegTrein in '..\..\Shared\ModComp\FontesMT\fCadRegTrein.pas' {frmCadRegTrein},
  RAvalCurso in '..\..\Shared\ModComp\Reports\Source\RAvalCurso.pas' {RptAvalCurso},
  fRegTreinColetivo in '..\..\Shared\ModComp\FontesMT\fRegTreinColetivo.pas' {frmRegTreinColetivo},
  fSelTreinColetivo in '..\..\Shared\ModComp\FontesMT\fSelTreinColetivo.pas' {frmSelTreinColetivo},
  fListaPessoas in '..\..\Shared\ModComp\FontesMT\fListaPessoas.pas' {frmListaPessoas},
  fCadFunc in '..\..\Shared\ModComp\FontesMT\fCadFunc.pas' {frmCadFunc},
  fRegistraOcorr in '..\..\Shared\ModComp\FontesMT\fRegistraOcorr.pas' {frmRegistraOcorr},
  fProcuraPessoaDoc in '..\..\Shared\ModComp\FontesMT\fProcuraPessoaDoc.pas' {frmProcuraPessoaDoc},
  uModulo in 'uModulo.pas',
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  FSolicServico in 'FSolicServico.pas' {frmSolicServico},
  fCadServicoManut in '..\FontesMT\fCadServicoManut.pas' {frmCadServicoManut},
  RFichaFunc in '..\..\Shared\ModComp\Reports\Source\RFichaFunc.pas' {RptFichaFunc},
  fParamFichaFunc in '..\..\Shared\ModComp\Reports\Source\fParamFichaFunc.pas' {frmParamFichaFunc},
  uComumRelats in 'uComumRelats.pas',
  RRelEvento in '..\..\Shared\ModComp\Reports\Source\RRelEvento.pas' {RptRelEvento},
  fAnalSolic in '..\..\Shared\ModComp\FontesMT\fAnalSolic.pas' {frmAnalSolic},
  fBaseComp in '..\..\Shared\ModComp\FontesMT\fBaseComp.pas' {frmBaseComp},
  fCadRegSolic in '..\..\Shared\ModComp\FontesMT\fCadRegSolic.pas' {frmCadRegSolic},
  RCartaComunicado in '..\..\Shared\ModComp\Reports\Source\RCartaComunicado.pas' {RptCartaComunicado},
  fParamCartaComunicadoAux in '..\..\Shared\ModComp\Reports\Source\fParamCartaComunicadoAux.pas' {frmParamCartaComunicadoAux},
  fParamCartaComunicado in '..\..\Shared\ModComp\Reports\Source\fParamCartaComunicado.pas' {frmParamCartaComunicado},
  fSelSolic in '..\..\Shared\ModComp\FontesMT\fSelSolic.pas' {frmSelSolic},
  RReciboPagamento in '..\..\Shared\ModComp\Reports\Source\RReciboPagamento.pas' {RptReciboPagamento},
  fParamFolhaFreq in '..\..\Shared\ModComp\Reports\Source\fParamFolhaFreq.pas' {frmParamFolhaFreq},
  RFolhaFreq in '..\..\Shared\ModComp\Reports\Source\RFolhaFreq.pas' {RptFolhaFreq},
  fParamRelTxtCCheque in '..\..\Shared\ModComp\FontesMT\fParamRelTxtCCheque.pas' {frmParamRelTxtCCheque},
  RReciboPagamentoFuncef in '..\..\Shared\ModComp\Reports\Source\RReciboPagamentoFuncef.pas' {RptReciboPagamentoFuncef},
  RCertificado in '..\..\Shared\ModComp\Reports\Source\RCertificado.pas' {RptCertificado},
  fAlteraColetivoLanca in '..\..\Shared\ModComp\FontesMT\fAlteraColetivoLanca.pas' {frmAlteraColetivoLanca},
  fCadParam in '..\FontesMT\fCadParam.pas' {frmCadParam},
  rDestacamento in '..\Reports\Source\rDestacamento.pas' {RptDestacamento},
  fCadHotel in '..\FontesMT\fCadHotel.pas' {frmCadHotel},
  fSelTarifa in '..\FontesMT\fSelTarifa.pas' {frmSelTarifa},
  RReciboAutonomo in '..\..\Shared\ModComp\Reports\Source\RReciboAutonomo.pas' {RptReciboAutonomo},
  RReciboCedidos in '..\..\Shared\ModComp\Reports\Source\RReciboCedidos.pas' {RptReciboCedidos},
  RDebitoConta in '..\..\Shared\ModComp\Reports\Source\RDebitoConta.pas' {RptDebitoConta},
  RDBCExcesso in '..\..\Shared\ModComp\Reports\Source\RDBCExcesso.pas' {RptDBCExcesso},
  DBaseDados in '..\..\CM\Forms\Source\dBaseDados.pas' {dtmBaseDados: TDataModule},
  fCadDstAeroporto in 'fCadDstAeroporto.pas' {frmDstCadAeroporto},
  fCadDestacamento in 'fCadDestacamento.pas' {frmCadDestacamento},
  FDestacamentoPendente in '..\FontesMT\FDestacamentoPendente.pas' {frmDestacamentoPendente},
  fCadDstParam in 'fCadDstParam.pas' {frmCadDstParam},
  fCadItemDespesa in 'fCadItemDespesa.pas' {frmCadItemDespesa},
  fCadTarifasLocacaoVeiculos in 'fCadTarifasLocacaoVeiculos.pas' {frmCadTarifasLocacaoVeiculos},
  fCadTarifasHospedagem in 'fCadTarifasHospedagem.pas' {frmCadTarifasHospedagem},
  fCadTarifasTaxi in 'fCadTarifasTaxi.pas' {frmCadTarifasTaxi},
  fCadTarifasDiarias in 'fCadTarifasDiarias.pas' {frmCadTarifasDiarias},
  FSelAssinatura in '..\..\ModTrn\FontesMT\FSelAssinatura.pas' {frmSelecaoAssinatura},
  uCtrlAssinatura in '..\..\ModTrn\CtrlObjetos\uCtrlAssinatura.pas',
  uDbAssinatura in '..\..\ModTrn\DBobjects\uDbAssinatura.pas',
  RReciboPagamentoFerias in '..\..\Shared\ModComp\Reports\Source\RReciboPagamentoFerias.pas' {RptReciboPagamentoFerias},
  fRegTreinMetaAtuarial in '..\..\SHARED\ModComp\FontesMT\fRegTreinMetaAtuarial.pas' {frmRegTreinMetaAtuarial},
  FObservacaoCTemp in '..\..\SHARED\ModComp\FontesMT\FObservacaoCTemp.pas' {frmObservacaoCTemp},
  FCadBloqUsuario in '..\FontesMT\FCadBloqUsuario.pas' {frmCadBloqUsuario},
  rAutPagCofin in '..\..\CMCAPCARUTILOBJ50\Reports\Source\rAutPagCOFIN.pas' {RptAutPagCofin};

{$R *.RES}
{$R MODAUTO_RES.RES}

Begin
   frmCMEntrada := TfrmCMEntrada.Create(Application);
   frmCMEntrada.PnlButtons.Visible := False;
   frmCMEntrada.Show;
   frmCMEntrada.Update;

   Application.Initialize;
   Application.Title := 'RH - Auto Atendimento';
   Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
   frmCMEntrada.Free;
   Application.Run;

End.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo RH - Auto Atendimento
================================================================================
CM$VER      
--------------------------------------------------------------------------------
Pendencia : 177768
Descrição : Reformuação da rotina de treinamentos.
================================================================================
CM$VER      3.09.09     07/05/2008
--------------------------------------------------------------------------------
(Pendência 27816)
- Transações / Manut. / Integração de Destacamento (Destacamentos Pendentes no Financeiro):
  * Foi tirada a palavra "RAD" do cabeçalho de exibição dos destacamentos ou acertos pendentes;
  * Foi acrescntada a coluna "Destacam. Número";
  * Foi feita alteração para desvincular da existência de Processo RAD.
================================================================================
CM$VER      3.09.08     14/03/2008
--------------------------------------------------------------------------------
Pendencia : 27569.
Inserindo Help nas telas.
================================================================================
CM$VER      3.09.07     07/03/2008
--------------------------------------------------------------------------------
Reorganizando estrutura de diretórios.
(Pendência 27509)
- Manutenção de Documentos (AP/GR):
  * Foi implementada a possibilidade de "Estornar" um documento que esteja "em aberto".
================================================================================
CM$VER      3.09.06     26/02/2008
--------------------------------------------------------------------------------
(Pendência 27486)
- Transções / Férias:
  * Alteração do valor padrão de Parcelas de Devolução.
================================================================================
CM$VER      3.09.05     20/02/2008
--------------------------------------------------------------------------------
(Pendência 27436)
- Transações / Manut. / Manutenção de AP's e GR's:
  * Foi implemenatda a possibilidade de excluir um documento já gerado
    e associado a um destacamento. O sistema dá um aviso, para que o
    usuário confirme a ação.
  * Ao tentar excluir um documento baixado, de imediato aparece agora
    a mensagem negando a ação.
================================================================================
CM$VER      3.09.04     12/02/2008
--------------------------------------------------------------------------------
Recomplilando os fontes.
================================================================================
CM$VER      3.09.03     14/12/2007
--------------------------------------------------------------------------------
Pendência 27087
- Transações / Manut. / Solic. de Destacamento / aba Trechos da Viagem:
  * Foi inserida crítica para impedir a informação do trecho sem a cidade de destino.
================================================================================
CM$VER      3.09.02     28/11/2007
--------------------------------------------------------------------------------
Chamado:348652
Retirado o upper dos selects com order by no campo RP.DESCRPROVDESC.
================================================================================
CM$VER      3.09.01     06/11/2007
--------------------------------------------------------------------------------
(Pendência 26767)
- Consultas / Relatórios / RH - Auto Atendimento / Operacionais / Relatório de Destacamentos (Viagens a Trabalho):
  * Foi incluída a opção para indicar se o período selecionado se refere à viagem ou ao
    acerto de contas (a data deste é obtida pela data de emissão do documento AP ou GR).
================================================================================
CM$VER      3.09.00     01/11/2007
--------------------------------------------------------------------------------
- Sistema / Config. / Parâmetros:
  * Na caixa "Geração do Calendário", foi acrescentada a opção "Pelo Total de Horas da Viagem".
  * Acertos nas informações relativas a Contas a Pagar e a Receber.
- Cadastros / Manut. / Destacamento / Tarifas:
  * Opção de vincular a uma cidade;
  * O tipo de tarifa “Deslocamento” foi alterado para “Deslocamento/Abatimento”.
  * Permite agora informar uma Diária Negativa no Cadastro de Tarifas, adequado para se
    criar uma tarifa do tipo "Abatimento";
  * Foi excluída a caixa "Preferencial", que estava sem função;
  * Introdução da opção "Dias da Semana" no Cadastro de Tarifas  (campo INDDIASEMANA na
    tabela DSTTARIFA), com consequente reflexo na geração das diárias;
  * Foi criado um novo Tipo de Tarifa para quilometragem.
- Cadastros / Manut. / Destacamento / Hotéis:
  * Inclusão da tela, para cadastramento de hotéis a serem referidos nos trechos de viagens.
- Cadastros / Manut. / Destacamento / Tipos de Despesa:
  * Inclusão da tela, para cadastramento de despesas que podem ser referidas nas prestações
    de contas das viagens.
- Transações / Manut. / Solic. de Destacamento:
  * Inclusão da hora da viagem e da data de inclusão;
  * Permite agora escolher a diária a cada dia do calendário (quando encontrar mais de uma
    aplicável).
  * Inclusão da aba para registrar as "Despesas da Viagem" de forma itemizada, com Data/Hora,
    Tipo de Despesa, Valor e Observação;
  * Geração das diárias segundo a opção "Pelo Total de Horas da Viagem".
  * Vinculação das diárias à cidade especificada no Cadastro de Tarifas.
    Obs.: caso o trecho final seja o retorno à base, o usuário deve colocar o horário neste
    trecho posterior ao horário previsto de término do período da viagem, para que a diária
    se vincule à cidade visitada e não à sua base.
  * As datas efetivas  foram incluídas na subtela de acerto de contas;
  * Opção de prestação de contas automático das diárias. Para que fique funcional, deve ser
    assinalada a opção "Despesa Corresponde a Acerto Automático de Diárias ?" (Sim) no
    Cadastro de Tipos de Despesa, para a despesa que for utilizada para este fim (campo
    FLGDIARIA na tabela DSTTIPODESPESA).
  * Inclusão, na aba Trechos da Viagem, da opção para informar o Hotel Preferido / Reservado.
- Transações / Manut. / Integração de Destacamento (Destacamentos Pendentes no Financeiro):
  * Foi tirada a palavra “Pendente” e acrescentado o número do RAD;
  * Ajustes diversos nas integrações com CAP/CAR;
  * Opção para Contabilização e parametrização do Tipo de Operação;
  * Opção para Integração para a Folha de Pagamento e respectiva parametrização.
- Transações / Manut. / Manutenção de AP's e GR's:
  * Acertos diversos na alternância de AP's para GR's e vice-versa.
- Consultas / Relatórios / RH - Auto Atendimento / Operacionais / Relatório de Destacamentos (Viagens a Trabalho)
  * Acerto na exibição dos valores de diária;
  * Foram incluídas as despesas detalhadas;
  * Foram incluídas as observações dos trechos;
  * Foram incluídas as datas efetivas.
================================================================================
CM$VER      3.08.03     19/09/2007
--------------------------------------------------------------------------------
(Pendência 26335)
- Consultas / Relatórios / RH - Auto Atendimento / Operacionais / Relatório de Destacamentos (Viagens a Trabalho)
  * Acerto na exibição dos valores de diária.
================================================================================
CM$VER      3.08.02     06/09/2007
--------------------------------------------------------------------------------
(Pendência 26265)
- Consultas / Relatórios / RH - Auto Atendimento / Operacionais /
  Relatório de Destacamentos (Viagens a Trabalho)
  * No filtro do relatório acima, na aba "Centro de Custo", o botão "Seleciona Todos"
     não estava funcionando corretamente.
================================================================================
CM$VER      3.08.01     18/07/2007
--------------------------------------------------------------------------------
(Pendencia 25878)
- Integração de Destacamento
  * Ajuste da data de vencimento do documento para o primeiro dia útil anterior a data da viagem.
================================================================================
CM$VER      3.08.00     25/06/2007
--------------------------------------------------------------------------------
(Pendência 25251)
- Parâmetros de Sistema
  * Inclusão de parâmetros referente ao numero de dias para integração de destacamentos
     com o módulo financeiro.
(Pendência 25041, 25350, 25362)
- Parâmetros de Sistema
  * Inclusão de parâmetros de destacamento referênte a valores padrão para:
     Tipo de documento a pagar e receber, forma de pagamento e recebimento, tipo de recebimento
     e desembolso, plano e patrocinadora.
(Pendência 24852)
- Cadastro de Tarifas
  * Reestruturação da tela no formato 3 Camadas. Permitindo a relação da nova
    estrutura DSTTARIFAxCARGO. Não permitir que um cargo esteja relacionado a
    mais de uma tarifa do mesmo tipo.
(Pendência 24789)
- Destacamento
  * Criação de parâmetro de sistema para identificar se no destacamento serão
    consideradas as diárias referente aos dias efetivos ou início no dia
    anterior e término no dia posterior.
(Pendência 24791)
- Destacamento
  * Criação do tipo de tarifa para "Deslocamento", com o mesmo tratamento de diária,
    esta tarifa também será exibida na guia de Calendário das Diária,
    assim como o valor das diárias.
  * Permitir selecionar o percentual da Diária ou Deslocamento (0%, 50%, 100%).
  * Registrar no Destacamento, os valores praticados bem como o percentual
    aplicado.
(Pendência 24794)
- Destacamento
  * Implementação de tratamento aos documentos gerados no Cap/Car, passando a gravar o
    CODDOCUMENTO no destacamento, verificando o processo de exclusão de forma
    individualizada: Destacamento, Exclusão de documento do destacamento e do
    Acerto de Contas.
(Pendência 27790)
- Destacamento
  * Implementação de relatório com o resumo do Destacamento/Acerto de Contas após a
    gravação, para que seja assinado e entregue junto com as notas. Permitir
    também que este relatório seja impresso posteriormente.
(Pendência 24798)
- Destacamento - RAD
  * Revisão da geração de aprovação para o novo RAD+, gerando RAD individual para o
    Destacamento e para o Acerto de Contas.
(Pendência 24802)
- Destacamento - RAD
  * Criação de tela de consulta ao RAD do Adiantamento de Viagens incorporado ao
    processo de aprovação do RAD.
(Pendência 25351)
- Parâmetro so Sistema - Envio de Documento
  * Implementação de parâmetro referente ao nr. de dias para o pagamento do documento no
    Contas a Pagar a partir do envio. Onde a data do vencimento: Último dia útil anterior
    a viagem ou (data + diasEnvio) o que for maior.
    Retirada a função de reprogramação automática.
(Pendência 25358)
- Cadastro de Tarifas
  * Permitir o cadastramento de mais de um evento de tarifa por cargo.
    Exemplo: Deslocamento por taxi e Deslocamento por Aluguel de Carro,
             identificando a tarifa preferencial (permitir apenas uma
             preferencial por evento de tarifa no mesmo cargo).
    No Destacamento, buscar a tarifa preferencial.
(Pendência 25360)
- Parâmetro so Sistema - Envio de Documento
  * Implemenção de parâmetros default para Patrocinadora e Plano previdenciário
    Verificar a existência do relacionamento em PLANPREVCONTABPATRO.
    Na integração com o CapCar, passar a utilizar estes parâmetros no lançamento
    do Rateio do Documento.
(Pendência 25362)
- Parâmetro so Sistema - Envio de Documento
  * Implementar parâmetros default para Portador / Forma de Pagamento e de
    Recebimento (PARAMRH.CODPORTFORMAREC, PARAMRH.CODPORTFORMAPAG)
    Filtrar nos Lookups o campo RECPAG.
    Na integração com o CapCar, passar a utilizar estes parâmetros no lançamento
    do Documento.
(Pendência 25363)
- Destacamento
  * Registro do usuário que efetuou o lançamento do Destacamento e do Acerto de
    Contas.
    Criada guia para exibir no Destacamento: Usuário do destacamento e acerto,
    nr. do Documento e processo RAD de destacamento e acerto.
    Bloqueio de edição do destacamento ou acerto quando já tiver sido gerado o
    documento do acerto de contas.
(Pendência 25364)
- Destacamento
  * Solicitar e registrar o Centro de Custos e Centro de Responsabilidade para o
    Destacamento.
    O Centro de Custos default é o definido no cadastro do funcionário.
    Permitir e obrigar a seleção dos centros de custos relacionados pelo Módulo Básico em
    Usuários por Centro de Custos.
    O Centro de responsabilidades disponíveis são os relacionados no módulo GlobalCM em
    Centro de Responsabilidade por Usuário.
    Utilizar estes valores para aprovação do RAD e integração com CapCar.
(Pendência 25367)
- Cadastro de Substitutos para Envio
  * Somente estarão disponíveis nas telas de destacamento, cadastro de funcionários e
    envio de destacamento pendentes, os lançamentos referentes a centro de custos que o usuário
    do sistema tiver acesso ( cadastro em Modulo Básico - Usuário por centro de custos ).
================================================================================
CM$VER      3.07.01     06/03/2007
--------------------------------------------------------------------------------
- Sistema / Configuração / Parâmetros:
  * Correção do erro que era mostrado quando apenas o primeiro parâmetro
    era alterado
================================================================================
CM$VER      3.07.00     01/03/2007
--------------------------------------------------------------------------------
(Pendência 21801)
- Sistema / Configuração / Parâmetros do Sistema:
  * Introdução desta tela, onde são parametrizadas a quantidade de dias para a prestação
    de contas após o retorno de uma viagem e algumas informações relativas ao envio de
    mensagens cobrando do empregado essa ação.
(Pendência 21803)
- Abertura do Sistema (após o login do usuário):
  * O sistema verifica se há destacamentos sem o acerto de contas após o prazo definido e,
    conforme as opções feitas nos Parâmetros, envia mensagem ao viajante e registra esse
    envio na própria tela do destacamento em questão.
(Pendência 21803)
- Transações / Manutenção / Solicitação de Destacamento:
  * Ao inserir um novo destacamento, o sistema verifica se existe acerto de conta
    pendente e impede a inserção.
  * Foi incluída a exibição da data em que foi enviada mensagem cobrando do empregado
    o acerto de contas, na aba Acerto de Contas.
================================================================================
CM$VER      3.06.00     26/02/2007
--------------------------------------------------------------------------------
- Transações / Manutenção / Manutenção de APs e GRs:
  * Acertos diversos nas funcionalidades do botão "Procurar" desta tela.
(Pendência 21795)
- Transações / Manutenção / Solicitação de Destacamento:
  * Reformulação da tela, convertendo-a da tecnologia CS (cliente-servidor) para a MT
    (Multi-Tier ou 3 Camadas), visando permitir a implementação abaixo.
  * Implementação da opção de reprogramação da AP. Se o prazo de reprogramação não for
    atendido, um questionamento será feito para se criar uma reprogramação para uma nova
    data.
(Pendência 21797)
- Transações / Manutenção / Solicitação de Destacamento / aba Acerto de Contas:
  * O valor das despesas de viagem foi aberto em "Alimentação" e "Outras Despesas".
(Pendência 21800)
- Consultas / Relatórios / RH - Auto Atendimento / Operacionais / Relat. Destacamento:
  * Foram acrescentadas as informações relativas ao "Acerto de Contas".
================================================================================
CM$VER      3.05.07     16/10/2006
--------------------------------------------------------------------------------
- Transações / Manutenção / Solicitação de Destacamento / Gerar Arquivo Depósito:
  * Acerto e implementação da opção para gerar só o da tela ou todos de um período
    indicado.
================================================================================
CM$VER      3.05.06     19/09/2006
--------------------------------------------------------------------------------
Complementação da Pendência 20715
Tela :Consulta Históricos da Pessoa \ aba ContraCheque
Descrição : Implementação do CheckBox para imprimir ou não, quantidade de
dependentes para IR.
================================================================================
CM$VER      3.05.05     03/07/2006
--------------------------------------------------------------------------------
(Pendência 22476)
- Consultas / Históricos da Pessoa / aba Contracheque:
  * Correção da impressão do recibo.
================================================================================
CM$VER      3.05.04     07/03/2006
--------------------------------------------------------------------------------
- Transações / Manutenção / Solicitação de Destacamento / aba Acerto de Conta:
  * Ativação da função para gerar AP ou GR.
- Transações / Manutenção / Manutenção de APs e GRs:
  * Acertos diversos nas funcionalidades desta tela.
================================================================================
CM$VER      3.05.03     09/05/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH ... / Cadastrais / Ficha Funcional:
  * Foi alterado o critério de ordenação, de forma a exibir corretamente mais de uma
     alteração funcional com a mesma data de efetivação.
- Consultas / Relatórios / RH ... / Operacionais / Alterações Funcionais:
  * Foi alterado para não exibir mais uma mensagem de erro quando não há dados.
- Consultas / Relatórios Especiais / Demonstrativo de Pagamento:
  * Foi acresentado este relatório.
================================================================================
CM$VER      3.05.02     06/04/2005
--------------------------------------------------------------------------------
- Consultas / Históricos da Pessoa / Recibo de Pagamento:
  * Foi alterado o layout do relatório para o mesmo constante no módulo Folha de
    Pagamento/Consultas/Relatórios/Operacionais/Recibo de Pagamento.
- Consultas / Relatórios / RH ... / Operacionais:
  * Foi acrescentado o relatório "Folha de Freqüência I" constante no módulo Folha
    de Pagamento.
================================================================================
CM$VER      3.05.01     07/01/2005
--------------------------------------------------------------------------------
- Sincronização de funções liberadas pela Folha de Pagamento (Versão 4.11.05).
================================================================================
CM$VER      3.05.00     01/10/2004
--------------------------------------------------------------------------------
- Cadastros / Pessoal / aba Opção de Cargo:
  * Foram inseridos campos para seleção do salário do cargo alternativo.
- Consultas / Relatórios / Folha de Pagamento / Cadastrais / Pessoal:
  * Foi incluída a opção para exibir, ao invés do salário contratual, o salário
    alternativo de quem o tiver.
================================================================================
CM$VER      3.04.29     10/05/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / ... / Alterações Funcionais:
  * A escolha de um único estabelecimento foi substituída pela escolha de múltiplos
    estabelecimentos da empresa proprietária que está "logada". Mesmo que esta tenha
    apenas um estabelecimento, este já vem marcado na abertura da tela, facilitando
    a operação ao usuário.
================================================================================
CM$VER      3.04.28     26/04/2004
--------------------------------------------------------------------------------
- Correção na chamada de algumas telas e relatórios.
================================================================================
CM$VER      3.04.27     16/09/2003
--------------------------------------------------------------------------------
- Ficha Funcional:
  * A caixa de seleção relaciona todas as pessoas e não somente as Ativas e Afastadas
  como era feito até então.
================================================================================
CM$VER      3.04.26     12/09/2003
--------------------------------------------------------------------------------
- Listas de Nomes/Descrições com marcação do ítem selecionado:
  * Ao buscar um item da lista digitando-se letras no teclado,
  ele responde a uma sequência de caracteres, e não apenas ao
  primeiro, como era feito até então. Isto acontece desde que
  o usuário tecle-os com intervalo máximo de 0,45 segundos.
================================================================================
CM$VER      3.04.25     03/09/2003
--------------------------------------------------------------------------------
- Análise das Solicitações de Alteração Funcional e Solicitação de Alteração Funcional:
  * Ajuste nas margens de impressão de uma Carta ou Comunicado.
================================================================================
CM$VER      3.04.24     20/08/2003
--------------------------------------------------------------------------------
- Relatórios / Cadastrais / Pessoal
  * Inclusão da coluna "Sit" que exibe a situação funcional do empregado, de forma
     abreviada (Ativ, Afas ou Desl);
  * A coluna "Data Dem." passa agora a ser "Data Dem.ou Afast.", de modo a exibir
     a Data de Desligamento ou de Afastamento, conforme o caso.
================================================================================
CM$VER      3.04.23     07/08/2003
--------------------------------------------------------------------------------
- Acerto na sequência de ordenação de vários relatórios.
================================================================================
CM$VER      3.04.22     31/07/2003
--------------------------------------------------------------------------------
- Transações / Reembolsos para a Empresa:
  * A ordenação dos lançamentos pode agora ser alterada, pelo usuário, por:
    1. Ano/Mês descendente; Nome (como já era)
    2. Nome, Ano/Mês descendente
   Para tanto, deve-se clicar no título da coluna correspondente;
  * Foi acrescentado um botão com pequena lâmpada, que, quando clicado, exibe a
     explicação para alterar a ordenação.
- Consultas / Relatórios/ RH... / Gerenciais /
  Relação de Rubricas Selecionadas por Empregado:
  * Inclusão da opção para inverter o sinal normal de uma rubrica (para detalhes, clique
     o botão com a pequena lâmpada).
  * As pessoas só serão listadas, agora, se tiveram valores em pelo menos uma das colunas
     especificadas.
================================================================================
CM$VER      3.04.21     21/07/2003
--------------------------------------------------------------------------------
- Relatórios / Cadastrais / Ficha Funcional
  * Inclusão da opção para Avaliação Hay, disponível para as empresas que utilizam
     a Metodologia Hay em sua administração de Cargos e Salários.
================================================================================
CM$VER      3.04.20     10/07/2003
--------------------------------------------------------------------------------
- Manutenção de Documentos (AP/GR)
  * Correção na função de alteração, que estava indevidamente exigindo uma Conta
     Contábil quando esta não existe.
================================================================================
CM$VER      3.04.19     08/07/2003
--------------------------------------------------------------------------------
- Geral
  * Compatibilização com as implementações nos outros módulos do RH e Folha.
  * Atualização da chamada do Help Online sensível ao contexto.
================================================================================
CM$VER      3.04.18     03/07/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH ... / Gerenciais / Folha: Relação de Rubricas ...
  * Caso sejam selecionados Descontos, o sistema faz agora a soma aritmética.
================================================================================
CM$VER      3.04.17     16/06/2003
--------------------------------------------------------------------------------
- As seguintes telas somente irão mostrar as Pessoas da Empresa
  Proprietária logada:
  * Cadastro de Pessoal;
  * Solicitação de Alteração Funcional;
  * Registro Individual de Treinamento;
  * Requisições de Pessoal;
  * Cadastro das Linhas de Transporte por Pessoa.
================================================================================
CM$VER      3.04.16     06/06/2003
--------------------------------------------------------------------------------
- Solicitação de Alteração Funcional:
  * Alteração no layout da tela.
- Análise das Solicitações de Alteração:
  * Alteração no layout da tela;
  * Exclusão dos botões de Alteração e Restauração do Layout da Carta/Comunicado.
- Os seguintes relatórios passam a trazer as informações de acordo
 com a lotação do empregado no mês/ano selecionado para sua emissão:
  * Aviso de Férias;
  * Rubricas Selecionadas por Empregado;
  * Resumo de Folha Comparativo.
================================================================================
CM$VER      3.04.15     02/06/2003
--------------------------------------------------------------------------------
- Criação de tela para cadastro de serviços / produtos de manutenção.
- Solicitação de Serviços de Manutenção:
  * Se não houver o Módulo de Manutenção, abre uma tela específica para esta finalidade.
- Transações / Manutenção / Solicitação de Destacamento / Gerar Lançamentos na Folha:
  * Permite mais de um lançamento.
- Rescisão:
  * Após o processamento final da folha de rescisão, os dados não podem mais ser
  alterados por qualquer pessoa.
- Expansão do campo de Observações nos processos RAD.
- Nome do módulo: Auto-Atendimento (RH e Serviços).
================================================================================
CM$VER      3.04.14     17/04/2003
--------------------------------------------------------------------------------
- Manutenção de Documentos (AP):
  * Mudança no Layout da Tela.
- Relatório Alterações Funcionais:
  * Retirado o campo de seleção dos Tipos de Papel.
- Inclusão do Cadastro Tipo de Serviço ou Produto de Manutenção.
================================================================================
CM$VER      3.04.13     13/03/2003
--------------------------------------------------------------------------------
- Telas de Seleção de Pessoal:
  * Acrescentado o filtro pela Empresa Proprietária.
================================================================================
CM$VER      3.04.12     25/02/2003
--------------------------------------------------------------------------------
- Cadastro de Empregados:
  * Implementação da gravação do histórico no momento da inserção de uma pessoa.
================================================================================
CM$VER      3.04.11     11/02/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRHObj50.bpl versão 4.01.15i
================================================================================
CM$VER      3.04.10     30/01/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRhObj50.bpl versão 4.01.12i.
================================================================================
CM$VER      3.04.09     21/01/2003
--------------------------------------------------------------------------------
* Registro de Treinamento Individual, Registro de Treinamento Coletivo:
   - Foram feitas algumas mudanças no Layout das Telas.
- Cadastro de Pessoal:
  * Possibilidade de alimentar uma ocorrência no módulo de Medicina do Trabalho
  quando ocorre um afastamento.
================================================================================
CM$VER      3.04.08     02/01/2003
--------------------------------------------------------------------------------
- Relatório Relação de Rubricas Selecionadas por Empregado:
  * Acertos nos totais.
================================================================================
CM$VER      3.04.07     14/11/2002
--------------------------------------------------------------------------------
- A partir desta versão, este sistema necessitará de uma atualização no Banco de Dados
que se encontra no SCRIPT 200209047 para que a integração com o Contas a Pagar
e/ou a Receber funcione corretamente.
================================================================================
CM$VER      3.04.06     13/09/2002
--------------------------------------------------------------------------------
- A partir desta versão o Sistema necessita do arquivo CMRHObj50.bpl para funcionar.
================================================================================
CM$VER      3.04.05     19/08/2002
--------------------------------------------------------------------------------
- Registro Individual de Treinamento (relativo a Avaliações de Cursos)
  * Alteração no layout do relatório da Avaliação do Curso, evitando truncar o nome do
     curso e/ou da empresa/entidade.
  * Opção para alterar a Avaliação Global do curso com a média aritmética das avaliações
    individuais dos fatores
================================================================================
CM$VER      3.04.04     22/07/2002
--------------------------------------------------------------------------------
- Incorporação do "Help On Line" sensível ao contexto
================================================================================
CM$VER      3.04.03     18/07/2002
--------------------------------------------------------------------------------
- Relatório Folha: Relação de Rubricas Selecionadas por Empregado (Custos de RH)
  * Foi implementada a opção "Comparativo", tanto Analítico (relaciona os empregados)
    como Sintético (totaliza por Centro de Custo).  Nesta opção, o relatório compara o
    Mês de Referência com outro estabelecido como Mês Base da comparação. Nesta
    opção, ainda, as rubricas especificadas para as 8 colunas são todas apresentadas em
    um só total para cada mês dos dois selecionados, mostrando também a variação
    ocorrida, em percentual e em valor.
================================================================================
CM$VER      3.04.02     16/07/2002
--------------------------------------------------------------------------------
- Registro Coletivo de Treinamento
  * Correção de erro no Banco de Dados ao inserir registros
================================================================================
CM$VER      3.04.01     15/07/2002
--------------------------------------------------------------------------------
- Incorporação dos relatórios de Contratos e Projetos:
  * Contratos
  * Aditamento do Contrato
  * Pagamentos/Recebimentos de Contratos
================================================================================
CM$VER      3.04.00     26/06/2002
--------------------------------------------------------------------------------
- Requisição de Pessoal
  * Pode-se agora associar Candidatos (externos) e Empregados (internos)
    como possíveis candidatos a atender uma requisição.
- Registro Individual de Treinamento
  * Ao criar um registro, o sistema assume, como padrão, que o curso é
    por conta da empresa para empregados, e não o é para candidatos.
  * Os botões para Configurar e Restaurar a impressão das Avaliações de
    Cursos só ficam visíveis para Usuários RH.
- Solicitação de Alteração Funcional
  * Se houver alteração de cargo, vai buscar o Nível 1 da Faixa
   automaticamente.
- Rescisão
  * Muda automaticamente a Situação para Desligado. O ideal, neste caso,
    será que exista apenas uma situação funcional que corresponda a
    Desligado.
= Agenda de Treinamento (no Login)
  * Foi acresentada a Data de Término do evento.
- Destacamento
  * Foi corrigido o acesso às tarifas.
  * Geração de AP: tem agora a opção de geração coletiva (por período).
  * Geração de Lançamentos para a Folha: tem agora a opção de geração
    coletiva (por período).
  * Arquivo para Depósito no Banco: foi implementada esta opção.
  * Foi alterado o calendário padrão para um dia antes e um dia depois
    do período do destacamento.
  * Existe agora a indicação de Viagem a Trabalho ou para Treinamento.
- Cadastro de Pessoal
  * Para Usuário Individual, a tela é automaticamente exibida (sem a
    necessidade de Procurar a própria pessoa) e as autorizações de
    inserção, alteração e exclusão seguem a parametrização do Uso
    Pessoal.
- Consulta de Históricos
  * Na consulta em tela do Contrachque, foram acrescentados: Salário
    Base, Salário de Contribuição INSS, Salário de Contribuição da
    Prev. Privada, Salário Base IRRF e Margem Consignável 30%.
  * No Prontuário, foram incluídos a Data de Retorno e os Dias de
    Licença.
  * Nas Férias, foram incluídos o Final do Período Aquisitivo e os Dias
    de Gozo e de Abono.
  * Foi acrescentada a informação referente a Contribuição Sindical.
    Para tanto, é preciso que a rubrica seja parametrizada como
    "Valor do imposto sindical" na caixa Rubrica Padrão CLT Corresp.
  * Opção para imprimir etiqueta para atualização da CTPS referente
    à evolução funcional.
- Registro de Férias
  * Opção para imprimir etiqueta para atualização da CTPS.
- Relatórios
  * Relação de Dependentes: opção para selecionar Sexo do titular.
  * Alterações Funcionais: mostra cargo, função e salário anterior,
    quando for o respectivo caso.
  * Destacamento: foi alterado o formato para paisagem.
  * Emissão de etiquetas: opção para atualização da CTPS (de férias e
    de alterações funcionais) de forma coletiva.
================================================================================
CM$VER      3.03.00     04/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.06.13.
================================================================================
CM$VER      3.02.02     03/06/2002
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH - Auto Atendimento
  Implementação dos Relatórios Operacionais:
  * Alterações Funcionais, podendo selecionar tipos, pessoas e período e ordenar por
     tipo, pessoa, centro de custo e data.
  * Lançamento de Rubricas Individuais, já existente na Folha, porém com o campo
    “Seq” substituído por “Saldo”.
================================================================================
CM$VER      3.02.01     31/05/2002
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH - Auto Atendimento
  Implementação dos Relatórios Cadastrais:
  * Ficha Funcional
  * Etiquetas
  * Pessoal
  * Relação de Dependentes
================================================================================
CM$VER      3.02.00     28/05/2002
--------------------------------------------------------------------------------
- Destacamento
  * O botão referente a geração de AP/GR para Acerto de Contas foi eliminado.
  * O título Observações passou a Natureza do Serviço / Justificativa.
  * Foi criado na tela um calendário indicando os dias em que a  hospedagem corre por
     conta da empresa (50%) ou do empregado (100%).
  * Se a data de ida ao primeiro destino ou retorno à base for diferente do período de
    destacamento, então esses dias “extras” são 50% do dia correspondente no
    destacamento (primeiro e último, respectivamente).
  * Na tabela de Tarifas de Diárias, foi acrescentada uma divisória para indicar os
      cargos associados a essa Tarifa.
  * Foi implementado o Relatório de Destacamentos, selecionando período e reportando
     gastos, motivo e destino(s).
- Desligamento
 * As mensagens solicitadas estão agora sendo emitidas.
    Para tanto, deve ser alimentado o campo OBSERVACAO existente no Cadastro
    de Motivos e Ações.
 * Foi acrescentado controle sobre a Data do Aviso Previo, como por exemplo:
   sistema não aceitará que o motivo seja Demissão sem justa causa Aviso Trabalhado,
   e as datas de Desligamento e do Aviso Prévio sejam as mesmas.
- Uso Pessoal
  * A Consulta de Históricos foi desmembrada e está no Auto Atendimento no item
    de menu “Consultas” e também em botão de atalho.
  * Nela, a divisória “Contracheque” passou a ser a primeira à esquerda.
  * Nela, a Consulta ao Histórico de Avaliações é filtrada para trazer somente as
    Avaliações de Desempenho.
  * A tela do Cadastro de Pessoal está no Auto Atendimento no item de menu
    “Cadastros" e também em botão de atalho.
  * Foi implementada a opção para imprimir o contracheque.
- Relatórios
  * Foi incluído um Relatório dos Reembolsos lançados, baseado no Relatório de
     Lançamentos da Folha, porém mais “limpo”, com local para assinatura do
     empregado e texto no cabeçalho autorizando o débito em folha.
================================================================================
CM$VER      3.01.00     03/05/2002
--------------------------------------------------------------------------------
- Fatores de Avaliação de Cursos
  * Foi implementada esta funcionalidade.
  * Os fatores serão inseridos no Módulo RH - Treinamento, em Cadastros / Fatores de
     Avaliação de Cursos.
  * No Registro Individual de Treinamento, pode-se fazer o registro dessas avaliações,
    para os cursos já concluídos e para os quais haja a indicação de que haverá uma
    avaliação pelo aluno. Pode-se, também, imprimir a avaliação
- Requisição de Pessoal
  * Foi criado um check-box para o usuário indicar o candidato aprovado.
- Solicitação de Alteração Funcional
  * Passou a criar um processo RAD;
  * Novas alternativas de mudança no salário.
================================================================================
CM$VER      3.00.04     25/04/2002
--------------------------------------------------------------------------------
- Cadastro de Candidatos
  * O registro de cursos para candidatos foi acrescentado nesta tela.
- Requisição de Pessoal
  * Possibilita que o usuário chame o cadastro do(s) candidato(s) associado(s)
     à requisição que está na tela.
- Registro Individual de Treinamento
  * Alterada a forma de busca do curso, de modo a permitir a opção "possui o texto".
  * Alterada a expressão "É Parte dos Controles Internos" para "Por Conta da Empresa".
  * A opção para avaliação do curso assumirá "Sim" se for por conta da empresa.
- LogIn
  * Foi implementada a agenda de cursos iniciando nos próximos 7 dias.
  * Corrigidas as mensagens de alerta para as situações de férias:
    1) solicitação não aprovada ainda e início do gozo a 30 dias ou menos;
    2) vence o segundo período aquisitivo dentro de 40 dias ou menos; neste caso,
        além da mensagem, abre a tela para solicitar férias.
- Férias
  * Impede o pedido de adiantamento do 13º em qualquer mês diferente de janeiro.
- Solicitação de Plano Saúde
  * Ao usuário dar OK, o sistema exibe mensagem de orientação.
- Solicitação de Benefício APCEF
  * Ao usuário dar OK, o sistema exibe mensagens de orientação, que variam de
     acordo com a opção de benefício.
  * Alterado o título da tela e de suas chamadas.
- Reembolsos para a Empresa
  * Foi movido para o menu Serviços.
  * A tela ficou mais "limpa", exibindo apenas o nome da pessoa e o valor a ser lançado.
- Usuário RH
  * Esta autorização pode também ser feita a nível de Grupo de Usuários, o que até
     então não era permitido.
- Consulta / Relatórios / Auto Atendimento / Folha ( 1ª opção)
  * Estão disponíveis os campos TIPOCONTRATO, que contém esta informação
     por extenso (Efetivos, Efet.Especiais, etc.) e NATUREZA, que contém a mesma
     informação de forma abreviada (QPP, LEF, etc.), permitindo ao usuário
     acrescentar este dado no relatório, por alteração do mesmo em
     Sistema / Configuração / Relatórios.
================================================================================
CM$VER      3.00.03     01/04/2002
--------------------------------------------------------------------------------
- Cadastro de Candidatos
  * Foi criada uma divisória onde testes e entrevistas poderão ser inseridos e consultados
- Registro de Férias
  * Foi acrescentado o fim do período aquisitivo;
  * Se o usuário for do tipo "individual", não poderá cadastrar férias dentro do
     período aquisitivo;
  * Se o usuário for do tipo "individual", não poderá alterar o período aquisitivo;
  * Foi acertado o teste de 60 dias entre um gozo de férias e o próximo, quando estes
     são parcelados;
  * Foi acertado controle de não parcelamento das férias para empregados com idade
     igual ou superior  50 anos.
- Rescisão (Desligamento)
  * Foram restringidas as informações que aparecem na tela;

================================================================================
CM$VER      3.00.02     25/03/2002
--------------------------------------------------------------------------------
- Alteração das Integrações com o processo RAD, de forma a passar o Centro de Custo.
================================================================================
CM$VER      3.00.01     04/03/2002
--------------------------------------------------------------------------------
- Relatório de Custos de RH
  * Foi implementada a opção Analítico/Sintético, que é ativada quando a opção de
     sequência for por Centro de Custo (caso contrário, será sempre Analítico).
- Estatística de Custos de RH
  * Foi acrescentada ao sistema (menu Consultas)
================================================================================
CM$VER      3.00.00     25/02/2002
--------------------------------------------------------------------------------
Foram implementadas as seguintes funcionalidades:
- Requisição de Pessoal
- Acesso (seletivo) ao Cadastro de Candidatos
- Solicitação de Alteração Funcional
- Análise das Solicitações de Alteração Funcional
- Solicitação de Ticket
- Solicitação de Plano de Benefício APCEF
- Consulta de Contratos
- Lançamento de Reembolsos para a Empresa
================================================================================
CM$VER      2.00.01     31/01/2002
--------------------------------------------------------------------------------
- Relação de Rubricas Selecionadas por Empregado:
  * Quando a Ordem de Impressão for por Centro de Custo, faz uma quebra com
    sub-totais a cada Centro de Custo.
  * Permite selecionar Centro(s) de Custo a ser(em) incluído(s) no relatório.
================================================================================
CM$VER      2.00.00     29/01/2002
--------------------------------------------------------------------------------
- Foram implementadas as seguintes funções:
  * Solicitação de Plano de Saúde
  * Registro Individual de Treinamento
  * Registro Coletivo de Treinamento
================================================================================
CM$VER      1.05.00     16/01/2002
--------------------------------------------------------------------------------
- Foram implementadas as seguintes funções:
  * Solicitação de Vale Transporte
  * Desligamento
  * Requisição de Material
================================================================================
CM$VER      1.00.03     09/01/2002
--------------------------------------------------------------------------------
- Foi implementada a tela que permite fazer a Manutenção de Documentos (AP e GR)
  Ela está no menu Transações/Manutenção/Manutenção de APs e GRs
- Foi ativada a chamada de um dos relatórios de Acompanhamento do Orçamento pelo
  Botão de Atalho existente na tela Principal.
- Foi corrigido um problema que havia na Geração de GR, na tela do Destacamento,
  referente a Acerto de Contas (quando o destacado tinha que devolver algum valor).
 
================================================================================
CM$VER      1.00.02     03/01/2002
--------------------------------------------------------------------------------
- Solicitação de Férias
  * Foi acrescentada a verificação de que empregado que não tenha idade inferior a 50 anos
      não pode parcelar férias (30 dias corridos) .
  * Foi acrescentada a verificação de que, quando houver parcelamento das férias em dois
     períodos deve decorrer, entre os períodos, pelo menos, 60 dias de trabalho.
- Solicitação de Destacamento
   * Foram acrescentadas as filtragens necessárias à correta utilização por Gestores e Usuários
      Individuais.
   * Foi corrigido um problema que, por vezes, ocorria na inserção de trechos da viagem
================================================================================
CM$VER      1.00.01     02/01/2002
--------------------------------------------------------------------------------
- Solicitação de Férias
  * Caso o usuário não solicite até 40 dias antes do vencimento do novo período aquisitivo,
      o sistema emitirá mensagem, avisando da necessidade de solicitar as férias.
      Caso chegue a 20 dias sem solicitação, o sistema abre tela para cadastramento das férias
     e só libera a mesma após o empregado ter suas férias cadastradas.
  * Após o término do preenchimento, sistema automaticamente imprime o Aviso de Férias
     para assinatura do empregado
================================================================================
CM$VER      1.00.00     02/01/2002
--------------------------------------------------------------------------------
Liberação inicial do módulo, contendo os itens definidos como Prioridade 1.
================================================================================
CM$ALT}

