program ModAtn;

uses
  Forms,
  fPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  fTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fCadMestreDet in '..\..\Cm\Forms\Source\FCadMestreDet.pas' {frmCadMestreDetalhe},
  fCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  fCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  fCMPrincipal in '..\..\Cm\Forms\Source\FCMPrincipal.pas' {frmCMPrincipal},
  fPrincipal in 'FPrincipal.pas' {frmPrincipal},
  fCadMulti in '..\..\Cm\Forms\Source\FCadMulti.pas' {frmCadastroMulti},
  fSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  fOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  fCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  fCadastroGrid in '..\..\Cm\Forms\Source\FCadastroGrid.pas' {frmCadastroGrid},
  fCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  fCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  fCMParamRel in '..\..\CM\Relats\Source\FCMParamRel.pas' {CMParamRel},
  fSelPessoal in '..\..\ModBas\Fontes\FSelPessoal.pas' {frmSelPessoal},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  fCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports: TDataModule},
  rHeadFoot in '..\..\CM\Relats\Source\RHeadFoot.pas' {RHeadFoot},
  rPai in '..\..\CM\Relats\Source\RPai.pas' {relPai},
  rMestreDet in '..\..\CM\Relats\Source\RMestreDet.pas' {relMestreDet},
  fCMPreview in '..\..\CM\Relats\Source\FCMPreview.pas' {frmCMPreview},
  fSelSimul in '..\..\ModCes\FontesMT\FSelSimul.pas' {frmSelSimul},
  fEfetivaSimul in '..\..\ModCes\FontesMT\fEfetivaSimul.pas' {fEfetivaSimul},
  fLancaRubPorRub in '..\..\ModFol\FontesMT\fLancaRubPorRub.pas' {frmLancaRubPorRub},
  uImprimeRelatorio in '..\..\ModBas\Fontes\uImprimeRelatorio.pas',
  fParamReciboPagamento in '..\..\ModFol\Reports\Source\fParamReciboPagamento.pas' {frmParamReciboPagamento},
  fParamReciboAvisoFerias in '..\..\ModFol\Reports\Source\fParamReciboAvisoFerias.pas' {frmParamReciboAvisoFerias},
  fParamAlfabMensal in '..\..\ModFol\Reports\Source\fParamAlfabMensal.pas' {frmParamAlfabMensal},
  fParamFolhaNormal in '..\..\ModFol\Reports\Source\fParamFolhaNormal.pas' {frmFolhaNormal},
  fParamLancRubIndiv in '..\..\ModFol\Reports\Source\fParamLancRubIndiv.pas' {frmParamLancRubIndiv},
  fParamTabCursos in '..\..\ModTrn\Reports\Source\fParamTabCursos.pas' {frmParamTabCursos},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  fCadDiaExtra in '..\..\ModFol\FontesMT\fCadDiaExtra.pas' {frmCadDiaExtra},
  rSimples in '..\..\Cm\Relats\Source\RSimples.pas' {relSimples},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fRegLinha in '..\..\ModFol\FontesMT\fRegLinha.pas' {frmRegLinha},
  fHstOcorr in '..\..\ModAsm\FontesMT\fHstOcorr.pas' {frmHstOcorr},
  fCadFerias in '..\..\ModFol\FontesMT\fCadFerias.pas' {frmCadFerias},
  fCadAntec13 in '..\..\ModFol\FontesMT\fCadAntec13.pas' {frmCadAntec13},
  fHstEvol in '..\..\ModCes\FontesMT\fHstEvol.pas' {frmHstEvol},
  fHstAval in '..\..\ModAva\FontesMT\fHstAval.pas' {frmHstAval},
  fHstSitFunc in '..\..\ModFol\FontesMT\fHstSitFunc.pas' {frmHstSitFunc},
  fConsHistRubSal in '..\..\ModFol\FontesMT\fConsHistRubSal.pas' {frmConsHistRubSal},
  fCadRegAval in '..\..\ModAva\FontesMT\fCadRegAval.pas' {frmCadRegAval},
  fHstTrein in '..\..\ModTrn\FontesMT\fHstTrein.pas' {frmHstTrein},
  fBrwPess in '..\..\ModBas\FontesMT\fBrwPess.pas' {frmBrwPess},
  fSelPessoalMT in '..\..\ModBas\FontesMT\fSelPessoalMT.pas' {frmSelPessoalMT},
  fRegHoras in '..\..\ModFol\FontesMT\fRegHoras.pas' {frmRegHoras},
  fLancaHoras in '..\..\ModFol\FontesMT\fLancaHoras.pas' {frmLancaHoras},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  RCadPessoal in '..\..\ModBas\Reports\Source\RCadPessoal.pas' {RptCadPessoal},
  fParamCadPessoal in '..\..\ModBas\Reports\Source\fParamCadPessoal.pas' {frmParamCadPessoal},
  REtiquetas in '..\..\ModBas\Reports\Source\REtiquetas.pas' {RptEtiquetas},
  fParamEtiquetas in '..\..\ModBas\Reports\Source\fParamEtiquetas.pas' {frmParamEtiquetas},
  fEstRubricas in '..\..\ModFol\FontesMT\fEstRubricas.pas' {frmEstRubricas},
  fSelEstat in '..\..\ModBas\FontesMT\fSelEstat.pas' {frmSelEstat},
  fEstatCad in '..\..\ModBas\FontesMT\fEstatCad.pas' {frmEstatCad},
  RDCT in '..\..\ModFol\Reports\Source\RDCT.pas' {RptDCT},
  RCadDependente in '..\..\ModFol\Reports\Source\RCadDependente.pas' {RptCadDependente},
  fParamCadDependente in '..\..\ModFol\Reports\Source\fParamCadDependente.pas' {frmParamCadDependente},
  uCmCtrlRptModAtn in '..\CtrlObjetos\uCmCtrlRptModAtn.pas',
  RAvisoFerias in '..\..\ModFol\Reports\Source\RAvisoFerias.pas' {RptAvisoFerias},
  fParamAvisoFerias in '..\..\ModFol\Reports\Source\fParamAvisoFerias.pas' {frmParamAvisoFerias},
  RFeriasProgram in '..\..\ModFol\Reports\Source\RFeriasProgram.pas' {RptFeriasProgram},
  fParamFeriasProgram in '..\..\ModFol\Reports\Source\fParamFeriasProgram.pas' {frmParamFeriasProgram},
  RFichaFinanc in '..\..\ModFol\Reports\Source\RFichaFinanc.pas' {RptFichaFinanc},
  fParamFichaFinanc in '..\..\ModFol\Reports\Source\fParamFichaFinanc.pas' {frmParamFichaFinanc},
  RFolhaEmprRub in '..\..\ModFol\Reports\Source\RFolhaEmprRub.pas' {RptFolhaEmprRub},
  fParamFolhaEmprRub in '..\..\ModFol\Reports\Source\fParamFolhaEmprRub.pas' {frmParamFolhaEmprRub},
  RReciboPagamento in '..\..\ModFol\Reports\Source\RReciboPagamento.pas' {RptReciboPagamento},
  RReciboAvisoFerias in '..\..\ModFol\Reports\Source\RReciboAvisoFerias.pas' {RptReciboAvisoFerias},
  RFolhaNormal in '..\..\ModFol\Reports\Source\RFolhaNormal.pas' {RptFolhaNormal},
  RAlfabMensal in '..\..\ModFol\Reports\Source\RAlfabMensal.pas' {RptAlfabMensal},
  RLancRubIndiv in '..\..\ModFol\Reports\Source\RLancRubIndiv.pas' {RptLancRubIndiv},
  RRelRecContribSind in '..\..\ModFol\Reports\Source\RRelRecContribSind.pas' {RptRelRecContribSind},
  fParamPCMSO in '..\..\ModAsm\Reports\Source\fParamPCMSO.pas' {frmParamPCMSO},
  RPCMSO in '..\..\ModAsm\Reports\Source\RPCMSO.pas' {rptPCMSO},
  fCadRegEvol in '..\..\ModCes\FontesMT\fCadRegEvol.pas' {frmCadRegEvol},
  REtiquetaAlteracaoCTPS in '..\..\ModCes\Reports\Source\REtiquetaAlteracaoCTPS.pas' {RptEtiquetaAlteracaoCTPS},
  fCadRegBen in '..\..\ModBen\FontesMT\fCadRegBen.pas' {frmCadRegBen},
  fIncRubrica in '..\..\ModFol\FontesMT\fIncRubrica.pas' {frmIncRubrica},
  fHstBenef in '..\..\ModBen\FontesMT\fHstBenef.pas' {frmHstBenef},
  dRelatorioEtiqAltCTPS in '..\..\ModBas\Fontes\dRelatorioEtiqAltCTPS.pas' {dtmRelatorioEtiqAltCTPS},
  fParamRelAvalPre in '..\..\ModAva\Reports\Source\fParamRelAvalPre.pas' {frmParamRelAvalPre},
  RAvalPre in '..\..\ModAva\Reports\Source\RAvalPre.pas' {rptAvalPre},
  RAval3C in '..\..\ModAva\Reports\Source\RAval3C.pas' {RptAval3C},
  fParamRelAval in '..\..\ModAva\Reports\Source\fParamRelAval.pas' {frmParamRelAval},
  RProgAval in '..\..\ModAva\Reports\Source\RProgAval.pas' {RptProgAval},
  fParamProgAval in '..\..\ModAva\Reports\Source\fParamProgAval.pas' {frmParamProgAval},
  RAtivPess in '..\..\ModTrn\Reports\Source\RAtivPess.pas' {RptAtivPess},
  fParamAtivTrein in '..\..\ModTrn\Reports\Source\fParamAtivTrein.pas' {frmParamAtivTrein},
  RNecesPess in '..\..\ModTrn\Reports\Source\RNecesPess.pas' {RptNecesPess},
  fParamNecesPess in '..\..\ModTrn\Reports\Source\fParamNecesPess.pas' {frmParamNecesPess},
  RMapaTrein in '..\..\ModTrn\Reports\Source\RMapaTrein.pas' {RptMapaTrein},
  fParamMapaTrein in '..\..\ModTrn\Reports\Source\fParamMapaTrein.pas' {frmParamMapaTrein},
  fSelEstBenef in '..\..\ModBen\FontesMT\fSelEstBenef.pas' {frmSelEstBenef},
  RResFolComp in '..\..\ModFol\Reports\Source\RResFolComp.pas' {RptResFolComp},
  fParamResFolComp in '..\..\ModFol\Reports\Source\fParamResFolComp.pas' {frmParamResFolComp},
  RProvisaoFerias in '..\..\ModFol\Reports\Source\RProvisaoFerias.pas' {RptProvisaoFerias},
  RProvisao13 in '..\..\ModFol\Reports\Source\RProvisao13.pas' {RptProvisao13},
  fParamProvisaoFerias in '..\..\ModFol\Reports\Source\fParamProvisaoFerias.pas' {frmParamProvisaoFerias},
  RBenefPorTipo in '..\..\ModBen\Reports\Source\RBenefPorTipo.pas' {RptBenefPorTipo},
  fParamBenefPorTipo in '..\..\ModBen\Reports\Source\fParamBenefPorTipo.pas' {frmParamBenefPorTipo},
  RBenefPorPessoa in '..\..\ModBen\Reports\Source\RBenefPorPessoa.pas' {RptBenefPorPessoa},
  fParamBenefPorPessoa in '..\..\ModBen\Reports\Source\fParamBenefPorPessoa.pas' {frmParamBenefPorPessoa},
  ROcorrTipo in '..\..\ModAsm\Reports\Source\ROcorrTipo.pas' {RptOcorrTipo},
  ROcorrPess in '..\..\ModAsm\Reports\Source\ROcorrPess.pas' {RptOcorrPess},
  fParamOcorrPess in '..\..\ModAsm\Reports\Source\fParamOcorrPess.pas' {frmParamOcorrPess},
  fCadCarta in '..\..\ModBas\FontesMT\fCadCarta.pas' {frmCadCarta},
  RCartaComunicado in '..\..\ModBas\Reports\Source\RCartaComunicado.pas' {RptCartaComunicado},
  fParamCartaComunicadoAux in '..\..\ModBas\Reports\Source\fParamCartaComunicadoAux.pas' {frmParamCartaComunicadoAux},
  fParamCartaComunicado in '..\..\ModBas\Reports\Source\fParamCartaComunicado.pas' {frmParamCartaComunicado},
  fPotencAval in '..\..\ModAva\FontesMT\fPotencAval.pas' {frmPotencAval},
  fCadRegExp in '..\..\ModRes\FontesMT\fCadRegExp.pas' {frmCadRegExp},
  fCadRegTreinCand in '..\..\ModRes\FontesMT\fCadRegTreinCand.pas' {frmCadRegTreinCand},
  fElimReq in '..\..\ModRes\FontesMT\fElimReq.pas' {frmElimReq},
  fCadRegDesemp in '..\..\ModAva\FontesMT\fCadRegDesemp.pas' {frmCadRegDesemp},
  fSelEstOcorr in '..\..\ModAsm\FontesMT\fSelEstOcorr.pas' {frmSelEstOcorr},
  fSelEstAval in '..\..\ModAva\FontesMT\fSelEstAval.pas' {frmSelEstAval},
  RCartaConvoc in '..\..\ModTrn\Reports\Source\RCartaConvoc.pas' {rptCartaConvoc},
  fSelEstTrein in '..\..\ModTrn\FontesMT\fSelEstTrein.pas' {frmSelEstTrein},
  fSelEstDem in '..\..\ModRes\FontesMT\fSelEstDem.pas' {frmSelEstDem},
  fSelEstRecr in '..\..\ModRes\FontesMT\fSelEstRecr.pas' {frmSelEstRecr},
  fSelOrcam in '..\..\ModCes\FontesMT\fSelOrcam.pas' {frmSelOrcam},
  fLancaOrcam in '..\..\ModCes\FontesMT\fLancaOrcam.pas' {frmLancaOrcam},
  fChartOrca in '..\..\ModCes\FontesMT\fChartOrca.pas' {frmChartOrca},
  fLancaRub in '..\..\ModFol\FontesMT\fLancaRub.pas' {frmLancaRub},
  RCAT in '..\..\ModAsm\Reports\Source\RCAT.pas' {RptCAT},
  fParamRelCAT in '..\..\ModAsm\Reports\Source\fParamRelCAT.pas' {frmParamRelCAT},
  fCadCand in '..\..\ModRes\FontesMT\fCadCand.pas' {frmCadCand},
  fCadRequi in '..\..\ModRes\FontesMT\fCadRequi.pas' {frmCadRequi},
  RReqPessoal in '..\..\ModRes\Reports\Source\RReqPessoal.pas' {RptReqPessoal},
  fRegTreinColetivo in '..\..\ModTrn\FontesMT\fRegTreinColetivo.pas' {frmRegTreinColetivo},
  fSelTreinColetivo in '..\..\ModTrn\FontesMT\fSelTreinColetivo.pas' {frmSelTreinColetivo},
  RAvalCurso in '..\..\ModTrn\Reports\Source\RAvalCurso.pas' {RptAvalCurso},
  fCadRegTrein in '..\..\ModTrn\FontesMT\fCadRegTrein.pas' {frmCadRegTrein},
  fListaPessoas in '..\..\ModTrn\FontesMT\fListaPessoas.pas' {frmListaPessoas},
  fCadRegOcorr in '..\..\ModAsm\FontesMT\fCadRegOcorr.pas' {frmCadRegOcorr},
  fLancaFalta in '..\..\ModAsm\FontesMT\fLancaFalta.pas' {frmLancaFalta},
  fCadFunc in '..\..\ModFol\FontesMT\fCadFunc.pas' {frmCadFunc},
  fRegistraOcorr in '..\..\ModFol\FontesMT\fRegistraOcorr.pas' {frmRegistraOcorr},
  fProcuraPessoaDoc in '..\..\ModBas\FontesMT\fProcuraPessoaDoc.pas' {frmProcuraPessoaDoc},
  RGerencial in '..\..\ModFol\Reports\Source\RGerencial.pas' {RptGerencial},
  fParamGerencial in '..\..\ModFol\Reports\Source\fParamGerencial.pas' {frmParamGerencial},
  RDossieCand in '..\..\ModRes\Reports\Source\RDossieCand.pas' {RptDossieCand},
  fParamDossieCand in '..\..\ModRes\Reports\Source\fParamDossieCand.pas' {frmParamDossieCand},
  RRequi in '..\..\ModRes\Reports\Source\RRequi.pas' {RptRequi},
  fParamRequi in '..\..\ModRes\Reports\Source\fParamRequi.pas' {frmParamRequi},
  RRotat in '..\..\ModRes\Reports\Source\RRotat.pas' {RptRotat},
  fParamRotat in '..\..\ModRes\Reports\Source\fParamRotat.pas' {frmParamRotat},
  RFichaFunc in '..\..\ModBas\Reports\Source\RFichaFunc.pas' {RptFichaFunc},
  fParamFichaFunc in '..\..\ModBas\Reports\Source\fParamFichaFunc.pas' {frmParamFichaFunc},
  fSelPess in '..\..\ModRes\FontesMT\fSelPess.pas' {frmSelPess},
  fPreSelec in '..\..\ModRes\FontesMT\fPreSelec.pas' {frmPreSelec},
  RPotencCandReq in '..\..\ModRes\Reports\Source\RPotencCandReq.pas' {RptPotencCandReq},
  RCadRubSal in '..\..\ModFol\Reports\Source\RCadRubSal.pas' {RptCadRubSal},
  fParamCadRubSal in '..\..\ModFol\Reports\Source\fParamCadRubSal.pas' {frmParamCadRubSal},
  RPesqSal in '..\..\ModCes\Reports\Source\RPesqSal.pas' {RptPesqSal},
  fParamPesqSal in '..\..\ModCes\Reports\Source\fParamPesqSal.pas' {frmParamPesqSal},
  RInconsistSal in '..\..\ModCes\Reports\Source\RInconsistSal.pas' {RptInconsistSal},
  fParamInconsistSal in '..\..\ModCes\Reports\Source\fParamInconsistSal.pas' {frmParamInconsistSal},
  RRelEvento in '..\..\ModTrn\Reports\Source\RRelEvento.pas' {RptRelEvento},
  fAnalSolic in '..\..\ModCes\FontesMT\fAnalSolic.pas' {frmAnalSolic},
  fBaseComp in '..\..\ModCes\FontesMT\fBaseComp.pas' {frmBaseComp},
  fSelSolic in '..\..\ModCes\FontesMT\fSelSolic.pas' {frmSelSolic},
  fCadRegSolic in '..\..\ModCes\FontesMT\fCadRegSolic.pas' {frmCadRegSolic},
  RHistPess in '..\..\ModTrn\Reports\Source\RHistPess.pas' {RptHistPess},
  fParamHistPess in '..\..\ModTrn\Reports\Source\fParamHistPess.pas' {frmParamHistPess},
  uModulo in '..\..\ModBas\Fontes\uModulo.pas',
  RCertificado in '..\..\ModTrn\Reports\Source\RCertificado.pas' {RptCertificado};

{$R *.RES}
{$R MODATN_RES.RES}
Begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;
  Application.Initialize;
  Application.Title := 'Módulo de Atendimento';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TRptCertificado, RptCertificado);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo RH - Módulo de Atendimento
================================================================================
CM$VER      3.01.19     19/09/2006
--------------------------------------------------------------------------------
- Transações / Registro de Alteração Funcional:
  * Foi criada a funcionalidade para transferir o histórico
    financeiro, com opção para transferir os lançamentos também,
    quando se transfere o empregado de uma empresa para outra
    (aplicável a clientes multi-empresa).
- Relatórios / Cadastrais / Etiquetas para Ponto:
  * Opção para colocar o mês de referência ou a CTPS.
================================================================================
CM$VER      3.01.18     16/09/2003
--------------------------------------------------------------------------------
- Ficha Funcional:
  * A caixa de seleção relaciona todas as pessoas e não somente as Ativas e Afastadas
  como era feito até então.
================================================================================
CM$VER      3.01.17     12/09/2003
--------------------------------------------------------------------------------
- Listas de Nomes/Descrições com marcação do ítem selecionado:
  * Ao buscar um item da lista digitando-se letras no teclado,
  ele responde a uma sequência de caracteres, e não apenas ao
  primeiro, como era feito até então. Isto acontece desde que
  o usuário tecle-os com intervalo máximo de 0,45 segundos.
================================================================================
CM$VER      3.01.16     03/09/2003
--------------------------------------------------------------------------------
- Cartas ou Comunicados:
  * Ajuste nas margens de impressão.
================================================================================
CM$VER      3.01.15     20/08/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH ... / Operacionais / Requisições de Pessoal:
  * Impressão do Nome Fantasia do Estabelecimento ao invés da Razão Social.
================================================================================
CM$VER      3.01.14     31/07/2003
--------------------------------------------------------------------------------
- Transações / Lançamentos de Rubricas por Rubrica:
  * A ordenação dos lançamentos pode agora ser alterada, pelo usuário, por:
    1. Ano/Mês descendente; Nome (como já era)
    2. Nome, Ano/Mês descendente
   Para tanto, deve-se clicar no título da coluna correspondente;
  * Foi acrescentado um botão com pequena lâmpada, que, quando clicado, exibe a 
     explicação para alterar a ordenação.
================================================================================
CM$VER      3.01.13     21/07/2003
--------------------------------------------------------------------------------
- Relatórios / Cadastrais / Ficha Funcional
  * Inclusão da opção para Avaliação Hay, disponível para as empresas que utilizam
     a Metodologia Hay em sua administração de Cargos e Salários.
================================================================================
CM$VER      3.01.12     08/07/2003
--------------------------------------------------------------------------------
- Geral
  * Compatibilização com as implementações nos outros módulos do RH.
================================================================================
CM$VER      3.01.11     16/06/2003
--------------------------------------------------------------------------------
- As seguintes telas somente irão mostrar as Pessoas da Empresa
  Proprietária logada:
  * Cadastro das Linhas de Transporte por Pessoa;
  * Cadastro de Dias Extra de Trabalho por Pessoa;
  * Cadastro de Pessoal;
  * Registro e Histórico de Antecipações do Décimo Terceiro Salário;
  * Registro e Histórico de Férias;
  * Registro de Outras Avaliações e Entrevistas;
  * Registro de Benefícios Sociais;
  * Registro de Avaliação de Desempenho;
  * Registro de Alteração Funcional;
  * Registro e Histórico de Experiências;
  * Registro de Ocorrências, Testes e Exames;
  * Registro Individual de Treinamento;
  * Registro de Horas Extras e Atrasos;
  * Requisições de Pessoal;
  * Lançamento de Rubricas Salariais (Proventos e Descontos);
  * Consulta Histórico de Rubricas Salariais;
  * Histórico de Avaliações;
  * Histórico de Benefícios Sociais;
  * Histórico da Evolução Funcional;
  * Histórico de Ocorrências Médicas;
  * Histórico da Situação Funcional (Alterações Ocorridas na Situação
  do Empregado);
  * Histórico de Treinamento.
================================================================================
CM$VER      3.01.10     06/06/2003
--------------------------------------------------------------------------------
- Solicitação de Alteração Funcional:
  * Alteração no layout da tela.
- Análise das Solicitações de Alteração:
  * Alteração no layout da tela;
  * Exclusão dos botões de Alteração e Restauração do Layout da Carta/Comunicado.
================================================================================
CM$VER      3.01.09     02/06/2003
--------------------------------------------------------------------------------
- Telas de Seleção de Pessoal:
  * Acrescentado o filtro pela Empresa Proprietária.
================================================================================
CM$VER      3.01.08     25/02/2003
--------------------------------------------------------------------------------
- Cadastro de Empregados:
  * Implementação da gravação do histórico no momento da inserção de uma pessoa.
- Recibo de Pagamento:
  * Acrescentada uma opção para a impressão de um do dois Recibos por página.
================================================================================
CM$VER      3.01.07     11/02/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRhObj50.bpl versão 4.01.15i
================================================================================
CM$VER      3.01.06     30/01/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRhObj50.bpl versão 4.01.12i.
================================================================================
CM$VER      3.01.05     09/01/2003
--------------------------------------------------------------------------------
* Registro de Treinamento Individual, Registro de Treinamento Coletivo:
   - Foram feitas algumas mudanças no Layout das Telas.
================================================================================
CM$VER      3.01.04     27/11/2002
--------------------------------------------------------------------------------
- Estatística de Demissões, Estatística por Fonte de Recrutamento e
  Estatística da Atividade de Treinamento:
  * Unificação das Telas (até então existia uma tela para o Usuário indicar as
  Opções do Gráfico e outra para a seleção das Pessoas).
================================================================================
CM$VER      3.01.03     29/10/2002
--------------------------------------------------------------------------------
- A partir desta versão o Sistema necessita do arquivo CMRHObj50.bpl para funcionar.
================================================================================
CM$VER      3.01.02     29/08/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.08.00.
================================================================================
CM$VER      3.01.01     19/08/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.07.00.
================================================================================
CM$VER      3.01.00     03/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.06.13.
================================================================================
CM$VER      3.00.02     23/05/2002
--------------------------------------------------------------------------------
- Usuário RH
  * Esta autorização pode também ser feita a nível de Grupo de Usuários,
    o que até então não era permitido.
================================================================================
CM$VER      3.00.01     25/02/2002
--------------------------------------------------------------------------------
- Acrescentado um filtro por Data de Admissão em algumas telas de Seleção de Pessoas.
================================================================================
CM$VER      3.00.00     28/08/2001
--------------------------------------------------------------------------------
- Versão para Delphi 5.
================================================================================
CM$ALT}









































































































































































































































