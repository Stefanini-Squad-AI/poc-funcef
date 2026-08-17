unit fPrincipal;

//******************************************************************************
//Rotina...........: (.dfm > mnu), mnuCadastroParamETLClick
//Nº WO............: 11538
//Data da Alteração: 27/06/2024
//Responsável......: Leandro
//Descrição........: Inclusão funcionalidade Cadastro > Parametros ETL
//******************************************************************************
//Rotina...........: AppPadraoShowParamReportPadrao
//Nº WO ...........: 11539
//Data da Alteração: 14/06/2013
//Responsável......: Helen V Bianchi
//Descrição........: Add Relatório Email pessoal, corporativo e demais dados
//******************************************************************************
//Roina...........: (.dfm > mnu), mnuRegAvisoPrev
//Nº SIG...........: 38475/84907
//Data da Alteração: 16/04/2019
//Responsável......: Everson Cunha
//Descrição........: Visible := False. Incorporar essa funcionalidade
//                   no Registro de Rescisão de Contrato
//******************************************************************************
//Roina...........: (.dfm > mnu), mnuRegistrodeMrito1Click
//Nº SIG...........: 39701
//Data da Alteração: 01/06/2014
//Responsável......: Edilaine
//Descrição........: Inclusão funcionalidade Transações > Registro de Mérito
//******************************************************************************
//Nº SIG...........: 20695
//Data da Alteração: 14/06/2013
//Responsável......: William Santana
//Descrição........: relatório de Ficha de anotações e atualizações da CTPS - modelo2
//***************************************************************************************
//Nº SOL............: 189675.17571
//Nº PPM............: 989707
//Data da Alteração.: 27/07/2015
//Alteração Form....: alteração DFM
//Responsável.......: William Santana
//Descrição.........: Desenvolvimento do cálculo e gravação das contribuições FUNCEF patronal.
//***************************************************************************************
//Nº SOL...........: 250385/17479
//Nº PPM...........: 960979
//Data da Alteração: 22/07/2015
//Responsável......: Higor Nayde Ferreira
//Descrição........: Inclusão da Funcionalidade Transações -> Remuneração - Outro Empregador.
//***************************************************************************************
//Nº SOL...........: 229881/16649
//Nº PPM...........: 566000
//Data da Alteração: 26/02/2015
//Responsável......: Felipe A. Santos
//Descrição........: Inclusão da Funcionalidade Transações -> Registro de Aviso Prévio.
//***************************************************************************************
//Nº SOL............: 229881.16650
//Nº PPM............: 566001
//Data da Alteração.: 03/03/2015
//Responsável.......: William Santana
//Descrição.........: Desenvolvimento do produto referente ao SOL 229881 -
//                    Registro de Estabilidade Funcional.
//***************************************************************************************
//Nº SOL...........: 204121
//Nº KINTANA.......: 2014292
//Data da Alteração: 20/06/2014
//Responsável......: Higor Nayde Ferreira
//Descrição........: Inclusão do menu de beneficio por periodo
//***************************************************************************************
//Nº SOL...........: 195376
//Nº KINTANA.......: 1866485
//Data da Alteração: 13/09/2013
//Responsável......: Felipe A. Santos
//Descrição........: reaplicação do cadastro de centro de custo do modulo globalCm para
//                   o modfol no menu Cadastros/ Centro de Custo
//**************************************************************************************
//Rotina...........: AppPadraoShowParamReportPadrao
//Nº SOL...........: 193131-13143
//Nº KINTANA.......: 1886157
//Data da Alteração: 20/06/2014
//Responsável......: Edilaine Ferraresi
//Descrição........: Inclusão de novo relatório.
//***************************************************************************************
//Nº SOL...........: 192084
//Nº KINTANA.......: 1945985 
//Data da Alteração: 13/06/2013
//Responsável......: Felipe A. Santos
//Descrição........: Criação da funcionalidade Consulta/Relatórios Especiais/Cálculo
//                   da Margem Consignável - 30%
//**************************************************************************************
//Nº SOL...........: 184912
//Nº KINTANA.......: 1738688
//Data da Alteração: 14/02/2013
//Responsável......: Mose Cornetta
//Descrição........: Criada tela 
//**************************************************************************************
//Rotina...........: mnuIntegraContribPrev
//Nº SOL...........: 152930
//Nº KINTANA.......: 1146562
//Data da Alteração: 11/06/2012
//Responsável......: Edilaine Ferraresi
//Descrição........: integração com a contribuição previdenciária 
//***************************************************************************************
// Autor(a)   : Thiago Melo
// Data       : 09/10/2012
// Pendência  : SOL 186698 Kintana 1764805
// Descricao  : Em cumprimento as Portarias MTE 1621/10 e 1057/12, Foram adicionados dois
//              Layouts para o termo de rescisão de contrato de trabalho
//***************************************************************************************
// Autor(a)   : Marcio Sanches Spinosa
// Data       : 17/08/2012
// Pendência  : SOL 155203 Kintana 1200659
// Descricao  : Criação da função de chamada da tela frmCadAdvertenciaSuspensao
//***************************************************************************************
// Autor(a)   : Eraldo Silva
// Data       : 29/02/2012
// Pendência  : SOL 175120 Kintana 15940219
// Descricao  : CONSULTA GERAL PESSOA Ao consultar alguma matricula no Consulta Geral de
//              Pessoa o sistema fecha a tela automaticamente.
//***************************************************************************************
//Rotina...........: MnuConsPart_Padrao
//Nº SOL...........: 158378
//Nº KINTANA.......: 1280507
//Data da Alteração: 20/05/2010
//Responsável......: Helen V. Bianchi
//Descrição........: Implementação da Consulta Geral de Pessoa
//***************************************************************************************
//Rotina...........: mnuAtualizacaoDeFotosClick
//Nº SOL...........: 153900
//Nº KINTANA.......: 1170535
//Data da Alteração: 18/03/2010
//Responsável......: Andre Rocha
//Descrição........: Implementação da atualização de fotos por lote.
//***************************************************************************************
//Rotina...........: AppPadraoShowParamReportPadrao
//Nº SOL...........: 127031
//Nº KINTANA.......: 670099
//Data da Alteração: 10/03/2010
//Responsável......: Bruno Bastos
//Descrição........: Criação de tela de parâmetro de novo relatório.
//***************************************************************************************
//Rotina:
//Nº SOL:            127621
//Nº KINTANA         678085
//Data da Alteração: 26/02/2010
//Responsável:       Ricardo A.
//Descrição:         Criação do Relatório "Relação de Dependentes Analítico"
//**************************************************************************************


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCMPrincipal,
  Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, TB97, Db, Wwdatsrc, wwdbedit, DBTables, wwdblook,
  StdCtrls, Mask, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic, IvMulti,
  IvEMulti, CorreioCM, fcLabel, AppEvnts, CMApplicationEvents, StdActns, ActnList, ImgList,
  fcStatusBar, SConnect, MConnect, DBClient, uCtrlListTerceirosRH,
  CMNetUsers, uResource, UConsPart, FConsEnderGeral,FCadBenefPeriodo,FRemuneracaoOutroEmpregado,
  wwstorep;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuTransacoes: TMenuItem;
    mnuLancaRubricasSalariais: TMenuItem;
    mnuRubricasporEmpresa: TMenuItem;
    mnuFolha: TMenuItem;
    mnuReajuste: TMenuItem;
    mnuHistorico: TMenuItem;
    mnuFavorecido: TMenuItem;
    mnuIntegracaoContab: TMenuItem;
    mnuMotivo: TMenuItem;
    mnuRubricasSalariais: TMenuItem;
    mnuPessoal: TMenuItem;
    mnuDependentes: TMenuItem;
    mnuLine4: TMenuItem;
    mnuSituacaoFuncional: TMenuItem;
    mnuCargos: TMenuItem;
    mnuProfissoes: TMenuItem;
    mnuGrausdeInstrucao: TMenuItem;
    mnuLine5: TMenuItem;
    mnuEstabelecimentos: TMenuItem;
    mnuSindicatos: TMenuItem;
    mnuLine6: TMenuItem;
    mnuRegistroAlteracaoFuncional: TMenuItem;
    mnuEvolucaoFuncional: TMenuItem;
    mnuEstatisticasdoQuadro: TMenuItem;
    mnuFerias: TMenuItem;
    mnuRescisao: TMenuItem;
    mnuLine7: TMenuItem;
    mnuHorariosdeTrabalho: TMenuItem;
    mnuTabelaHorarios: TMenuItem;
    mnuTurnosporDia: TMenuItem;
    mnuAssociaHorarios: TMenuItem;
    mnuLine8: TMenuItem;
    mnuLine9: TMenuItem;
    mnuBrowsePessoal: TMenuItem;
    mnuTabelasAuxiliares: TMenuItem;
    mnuNaturezaEmpresarial: TMenuItem;
    mnuClassNacionalAtividadesEconomicasCNAE: TMenuItem;
    mnuTabelasDARF: TMenuItem;
    mnuTabelasFPAS: TMenuItem;
    mnuSegurodeAcidentesdoTrabalho: TMenuItem;
    mnuTabelasFGTS: TMenuItem;
    mnuDepositosGRE: TMenuItem;
    mnuCategoriadeEmpregado: TMenuItem;
    mnuCargoseAfins: TMenuItem;
    mnuCBO: TMenuItem;
    mnuTipodeTrabalhador: TMenuItem;
    mnuCartaseComunicados: TMenuItem;
    mnuTabelasRAIS: TMenuItem;
    mnuVinculoEmpregaticio: TMenuItem;
    mnuSitAfastRAIS: TMenuItem;
    mnuMovimentoContratualCAGED: TMenuItem;
    mnuFormasdeRescisao: TMenuItem;
    mnuDocumentosOficiais: TMenuItem;
    mnuValeTransporte2: TMenuItem;
    mnuLinhasdeTransporte: TMenuItem;
    mnuLinhasporPessoa: TMenuItem;
    mnuRubricasPadraoCLT: TMenuItem;
    mnuEmpresasdeTranporte: TMenuItem;
    HorasExtraseAtrasos: TMenuItem;
    mnuSituacoesdeRisco: TMenuItem;
    mnuHistoricodaSituacaoFuncional: TMenuItem;
    mnuProgramacaoAntec13: TMenuItem;
    mnuMMagnetico: TMenuItem;
    mnuLancaHistRubrica: TMenuItem;
    mnuLayoutdeArquivosTXT: TMenuItem;
    mnuImportacaodeArquivosTXT: TMenuItem;
    mnuLancaRubPorPessoa: TMenuItem;
    mnuLancaRubPorRubrica: TMenuItem;
    mnuRelatoriosEspeciais: TMenuItem;
    mnuDemonstrativodePagamentoEspecial: TMenuItem;
    mnuDiasExtrasporPessoa: TMenuItem;
    PortadorFormaporBanco1: TMenuItem;
    mnuAcertodaQuantidadedeDependentes: TMenuItem;
    mnuEliminaLancamentosProcessados: TMenuItem;
    mnuCAGED: TMenuItem;
    mnuSeguroDesemprego1: TMenuItem;
    mnuContabilizacaodaFolha: TMenuItem;
    mnuTicket1: TMenuItem;
    UsuarioRH: TPanel;
    mnuEvolucaodaFolha: TMenuItem;
    mnuArquivodePagamento: TMenuItem;
    mnuLine12: TMenuItem;
    mnuRAISMag: TMenuItem;
    mnuValeTranspMag: TMenuItem;
    mnuLine1: TMenuItem;
    mnuLine2: TMenuItem;
    GrficosEspeciais1: TMenuItem;
    mnuLine11: TMenuItem;
    mnuLine10: TMenuItem;
    Toolbar971: TToolbar97;
    tbarbtCadPessoal: TToolbarButton97;
    TabelasREGRA1: TMenuItem;
    mnuCadTabGenerica: TMenuItem;
    mnuCadTabLonga: TMenuItem;
    Toolbar972: TToolbar97;
    tbarbtLancRubPorPessoa: TToolbarButton97;
    Toolbar973: TToolbar97;
    tbarbtGeracao: TToolbarButton97;
    tbarbtRescisao: TToolbarButton97;
    tbarbtCadRubrica: TToolbarButton97;
    tbarbtLancRubPorRubrica: TToolbarButton97;
    mnuImportacaodeDados: TMenuItem;
    mnuRegistrodeAlteraoSituacaoFuncional: TMenuItem;
    mnuVerifDadosRelatoriosMeiosMag: TMenuItem;
    mnuLine3: TMenuItem;
    mnuFichaReg: TMenuItem;
    Toolbar974: TToolbar97;
    tbarbtConsHistRub: TToolbarButton97;
    mnuCadFormaCalc: TMenuItem;
    mnuCadDicDados: TMenuItem;
    mnuCadTipRegraFormCalc: TMenuItem;
    mnuManutDoc: TMenuItem;
    tbarbtCadFormaCalc: TToolbarButton97;
    mnuCadFaixasSalariais: TMenuItem;
    mnuLine13: TMenuItem;
    mnuRelatSubstEvent1: TMenuItem;
    mnuCadHstAltCad: TMenuItem;
    N1: TMenuItem;
    mnuHorasTrabOutroCC: TMenuItem;
    N2: TMenuItem;
    tbarbtCadTabGener: TToolbarButton97;
    mnuGRRF: TMenuItem;
    N3: TMenuItem;
    mnuListaRecebedores: TMenuItem;
    mnuTransfSub: TMenuItem;       
    mnuAtualizacaoDeFotos: TMenuItem;   
    GeraldeEndereos1: TMenuItem;
    mnuAdvertnciaouSuspenso1: TMenuItem;
    mnuIntegraContribPrev: TMenuItem;
    mnuRubriPlanSaudeOdonto: TMenuItem;
    mnuCalcMargemConsig: TMenuItem;
    mnuCentroCusto: TMenuItem;
    mnuBeneficioPeriodo: TMenuItem;
    mnuRegistrodeEstabilidadeFuncional: TMenuItem;
    mnuRegAvisoPrev: TMenuItem;
    RemuneraoOutroEmpregador1: TMenuItem;
    mnuRegistrodeMrito1: TMenuItem;
    mnuCadastroParamETL: TMenuItem;
    procedure mnuRubricasSalariaisClick(Sender: TObject);
    procedure mnuMotivoClick(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnuRubricasporEmpresaClick(Sender: TObject);
    procedure mnuFavorecidoClick(Sender: TObject);
    procedure mnuIntegracaoContabClick(Sender: TObject);
    procedure mnuPessoalClick(Sender: TObject);
    procedure mnuSituacaoFuncionalClick(Sender: TObject);
    procedure mnuCargosClick(Sender: TObject);
    procedure mnuProfissoesClick(Sender: TObject);
    procedure mnuGrausdeInstrucaoClick(Sender: TObject);
    procedure mnuEstabelecimentosClick(Sender: TObject);
    procedure mnuSindicatosClick(Sender: TObject);
    procedure mnuReajusteClick(Sender: TObject);
    procedure mnuHistoricoClick(Sender: TObject);
    procedure mnuRegistroAlteracaoFuncionalClick(Sender: TObject);
    procedure mnuEvolucaoFuncionalClick(Sender: TObject);
    procedure mnuEstatisticasdoQuadroClick(Sender: TObject);
    procedure mnuTabelaHorariosClick(Sender: TObject);
    procedure mnuTurnosporDiaClick(Sender: TObject);
    procedure mnuAssociaHorariosClick(Sender: TObject);
    procedure mnuBrowsePessoalClick(Sender: TObject);
    procedure mnuRescisaoClick(Sender: TObject);
    procedure mnuNaturezaEmpresarialClick(Sender: TObject);
    procedure mnuCBOClick(Sender: TObject);
    procedure mnuTipodeTrabalhadorClick(Sender: TObject);
    procedure mnuClassNacionalAtividadesEconomicasCNAEClick(Sender: TObject);
    procedure mnuTabelasDARFClick(Sender: TObject);
    procedure mnuTabelasFPASClick(Sender: TObject);
    procedure mnuSegurodeAcidentesdoTrabalhoClick(Sender: TObject);
    procedure mnuDepositosGREClick(Sender: TObject);
    procedure mnuCategoriadeEmpregadoClick(Sender: TObject);
    procedure mnuCartaseComunicadosClick(Sender: TObject);
    procedure mnuVinculoEmpregaticioClick(Sender: TObject);
    procedure mnuSitAfastRAISClick(Sender: TObject);
    procedure mnuMovimentoContratualCAGEDClick(Sender: TObject);
    procedure mnuFormasdeRescisaoClick(Sender: TObject);
    procedure mnuDependentesClick(Sender: TObject);
    procedure mnuFeriasClick(Sender: TObject);
    procedure mnuDocumentosOficiaisClick(Sender: TObject);
    procedure mnuLinhasdeTransporteClick(Sender: TObject);
    procedure mnuLinhasporPessoaClick(Sender: TObject);
    procedure mnuRubricasPadraoCLTClick(Sender: TObject);
    procedure mnuEmpresasdeTranporteClick(Sender: TObject);
    procedure HorasExtraseAtrasosClick(Sender: TObject);
    procedure mnuSituacoesdeRiscoClick(Sender: TObject);
    procedure mnuHistoricodaSituacaoFuncionalClick(Sender: TObject);
    procedure mnuProgramacaoAntec13Click(Sender: TObject);
    procedure mnuFolhaClick(Sender: TObject);
    procedure mnuLancaHistRubricaClick(Sender: TObject);
    procedure mnuLayoutdeArquivosTXTClick(Sender: TObject);
    procedure mnuImportacaodeArquivosTXTClick(Sender: TObject);
    procedure mnuLancaRubPorPessoaClick(Sender: TObject);
    procedure mnuLancaRubPorRubricaClick(Sender: TObject);
    procedure mnuDemonstrativodePagamentoEspecialClick(Sender: TObject);
    procedure mnuGFIPClick(Sender: TObject);
    procedure mnuValeTranspMagClick(Sender: TObject);
    procedure mnuDiasExtrasporPessoaClick(Sender: TObject);
    procedure PortadorFormaporBanco1Click(Sender: TObject);
    procedure mnuAcertodaQuantidadedeDependentesClick(Sender: TObject);
    procedure mnuEliminaLancamentosProcessadosClick(Sender: TObject);
    procedure mnuCAGEDClick(Sender: TObject);
    procedure mnuRAISMagClick(Sender: TObject);
    procedure mnuSeguroDesemprego1Click(Sender: TObject);
    procedure mnuContabilizacaodaFolhaClick(Sender: TObject);
    procedure mnuTicket1Click(Sender: TObject);
    procedure mnuEvolucaodaFolhaClick(Sender: TObject);
    procedure mnuArquivodePagamentoClick(Sender: TObject);
    procedure mnuCadTabGenericaClick(Sender: TObject);
    procedure mnuCadTabLongaClick(Sender: TObject);
    procedure mnuImportacaodeDadosClick(Sender: TObject);
    procedure mnuRegistrodeAlteraoSituacaoFuncionalClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuFichaRegClick(Sender: TObject);
    procedure mnuCadFormaCalcClick(Sender: TObject);
    procedure mnuCadDicDadosClick(Sender: TObject);
    procedure mnuCadTipRegraFormCalcClick(Sender: TObject);
    procedure mnuManutDocClick(Sender: TObject);
    procedure BarradeAtalhos1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuCadFaixasSalariaisClick(Sender: TObject);
    procedure mnuRelatSubstEvent1Click(Sender: TObject);
    procedure mnuCadHstAltCadClick(Sender: TObject);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure mnuHorasTrabOutroCCClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuGRRFClick(Sender: TObject);
    procedure mnuListaRecebedoresClick(Sender: TObject);
    procedure mnuTransfSubClick(Sender: TObject);
    procedure mnuAtualizacaoDeFotosClick(Sender: TObject);
    procedure MnuConsPart_PadraoClick(Sender: TObject);
    procedure GeraldeEndereos1Click(Sender: TObject);
    procedure mnuAdvertnciaouSuspenso1Click(Sender: TObject);
    procedure mnuIntegraContribPrevClick(Sender: TObject);
    procedure mnuRubriPlanSaudeOdontoClick(Sender: TObject);
    procedure mnuCalcMargemConsigClick(Sender: TObject);
    procedure mnuCentroCustoClick(Sender: TObject);
    procedure mnuBeneficioPeriodoClick(Sender: TObject);
    procedure mnuRegistrodeEstabilidadeFuncionalClick(Sender: TObject);
    procedure mnuRegAvisoPrevClick(Sender: TObject);
    procedure RemuneraoOutroEmpregador1Click(Sender: TObject);     // Felipe A. Santos - SOL 229881/16649 PPM 566000
    procedure mnuRegistrodeMrito1Click(Sender: TObject);
    procedure mnuCadastroParamETLClick(Sender: TObject);
  private
    procedure HabilitarMenu_TicketMag;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uModulo, uSistema, uMensErro, uCtrlParamIntegra, uCMTypes, uCtrlPadroes,

  uCmCtrlRptModFol, uCtrlUsoGeralRH, uCtrlFuncoesRH, dCds,

  fCadParam, fCadMotivo, fCadFunc, fCadCargo, fCadGrauInstr, fCadProfi, fCadFilial,
  fCadSindi, fCadRegEvol, fCadRegSitFunc, fCadHoraTrab, fCadTurnoDia, fCadCarta,
  fCadTipoTrab, fCadFerias, fCadProvDesc, fCadCNAE, fCadDARF, fCadFPAS, fCadSegAcid,
  fCadDeposGRE, fCadForne, fCadCBO, fCadSit, fCadNatEmpr, fCadCtFolha, fCadSitRisco,
  fCadCatEmprGRE, fCadVincEmpr, fCadRubCLT, fCadAfastRAIS, fCadMovCAGED,
  fCadFormFGTS, fCadDependente, fCadEntid, fCadLinha, fCadBancoPortador, fCadDocOfic,
  fCadLayoutDesconto, fCadAntec13, fCadDiaExtra, fCadRubricaManual, fCadTabGener,
  fCadTabLonga, fCadFormula, fCadFaixa, fCadHstAlterCad, fCadTipoRegra, fCadRegTrabOutroCC,

  fDicionarioDados, fRegHoras, fGeraCalc, fAssocProvEmpre, fLancaRub,
  fConsHistRubSal, fSelSimul, fHstEvol, fSelEstat, fAssociaHorario, fBrwPess,
  fResciContr, fHstSitFunc, fRegLinha, fImportaTxt, fTelaAut, fLancaRubPorRub,
  fAcertaDepend, fElimLanca, fEstRubricas, fImportacaoDireta, fLancDocCAPCAR,

  fParamRelTxtCCheque, fParamGFIPmagnetico, fParamVTMagnetico, fParamCAGEDMagnetico,
  fParamTICKETMagnetico, fParamRAISMagnetico, fParamSegDes, fParamContabFolha,
  fParamArqPagto, fParamFichaReg, fParamRelatSubstEvent,

  fParamCadDependente, fParamDCT, fParamFichaSalFam, fParamRubIntegrContab, fParamEtiquetas,
  fParamCadPessoal, fParamAvisoFerias, fParamFeriasProgram, fParamFichaFinanc,
  fParamFolhaEmprRub, fParamFolhaFreq, fParamFolhaFreq2, fParamFolhaFreqEscala,
  fParamFolhaNormal, fParamGPS, fParamGRCS, fParamGRFC, fParamLancRubIndiv,
  fParamReciboAvisoFerias, fParamAlfabMensal, fParamAcompEscalaFerias, fParamEscalaFerias,
  fParamSalarioEduc, fParamTRCT, fParamReciboPagamento, fParamRelRecContribSind,
  fParamPrevisaoFerias, fParamProvisaoFerias, fParamResFol, fParamResFolComp,
  fParamRelTransporte, fParamVariavelMensal, fParamCracha, fParamCompSaldo,
  fParamReciboTerceiros, fParamBBancario, fParamRelSalContribINSS, fParamGerencial,
  fParamAlterFuncional, fParamFichaFunc, fParamCadRubSal, fParamDemPagEspecial,
  fParamRelatAfast, fParamCadFormaCalc, fParamGRRFMagnetico, fCadListaRecebedor,
  fParamRubSalDadosPrinc, fTransfSub, //Bruno Bastos - Sol: 127031 - Kintana: 670099
  fAtualizacaoDeFotos, fCadAdvertenciaSuspensao, //Andre Rocha - Sol: 153900 - Kintana: 1170535
  fCadRegEstabilidade,  //William Santana - SOL 229881.16650 PPM 566001
  FCadRubricaSaudeOdonto, // Mose Corneta SOL184912
  fIntegraContribPrev, // Edilaine - SOL 152930 / KTN 1146562
  fParamAdverteSuspensao,  // Edilaine - SOL 193131-13143 / KTN 1886157
  fParamAACTPS,  //William Santana - SIG 20695
  FCalcMargemConsig, // Felipe A. Santos SOL 192084 KTN 1945985
  FCadCCustoMT, // Felipe A. Santos SOL 195376 KTN 1866485
  dGlobal,  // Felipe A. Santos SOL 195376 KTN 1866485
  // Felipe A. Santos - SOL 229881/16649 PPM 566000 {fRegAvisoPrev}
  FCadRegMerito,    //edilaine - SIG39701
  FCadParamETL,     //leandro - WO11538
  fRegAvisoPrev ,
  FParamEmail; //Helen - WO11539

{$R *.DFM}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Modulo := TModulo.Create;
  Modulo.InitializeAs(Padroes);

  CtrlUsoGeralRH := TCtrlUsoGeralRH.Create;
  CtrlUsoGeralRH.InitializeAs(Padroes);

  FU := TCtrlFuncoesRH.Create;
  FU.InitializeAs(Padroes);

  dmCds := TdmCds.Create(Application);

  FU.RegistrarCFX(false);

  ThousandSeparator := '.';
  DecimalSeparator := ',';
  ShortDateFormat := 'DD/MM/YYYY';

  dtmGlobal := TdtmGlobal.Create(Self); // Felipe A. Santos SOL 195376 KTN 1866485
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FU.Free;
  CtrlUsoGeralRH.Free;
  Modulo.Free;
  dmCds.Free;
  dtmGlobal.Free; // Felipe A. Santos SOL 195376 KTN 1866485
  inherited;
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
var
  c: integer;
  CtrlListTerceirosRH: TCtrlListTerceirosRH;
begin
  inherited;
  if (Sistema.FezLogin) then
  begin
    CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
    CtrlListTerceirosRH.InitializeAs(Padroes);

    Modulo.IdContraCheque := CtrlListTerceirosRH.GetIdContraCheque;
    CtrlListTerceirosRH.Free;

    HabilitarMenu_TicketMag;
    if (Sistema.MudouUsuario) then
    begin
      CtrlUsoGeralRH.GetParametros(UsuarioRH.Enabled, Sistema.IdEmpresa, Sistema.IdUsuario);
      ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);
    end;
  end;
{  Só para burlar as autorizações (no caso de estarem com problemas decorrentes do banco)
  for c:=0 to Self.ComponentCount-1 do
    if (Self.Components[c] is TMenuItem) then
      (Self.Components[c] as TMenuItem).Enabled := true;}
    Modulo.BuscaParamCap(Sistema.IdEmpresa);
end;

procedure TfrmPrincipal.mnuRubricasSalariaisClick(Sender: TObject);
begin
  AbrirForm(frmCadProvDesc, TfrmCadProvDesc, false);
end;

procedure TfrmPrincipal.mnuMotivoClick(Sender: TObject);
begin
  AbrirForm(frmCadMotivo, TfrmCadMotivo, false);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  AbrirForm(frmCadParam, TfrmCadParam, false);
end;

procedure TfrmPrincipal.mnuRubricasporEmpresaClick(Sender: TObject);
begin
  AbrirForm(frmAssocProvEmpre, TfrmAssocProvEmpre, false);
end;

procedure TfrmPrincipal.mnuFavorecidoClick(Sender: TObject);
begin
  AbrirForm(frmCadForne, TfrmCadForne, false);
  frmCadForne.Caption := 'Cadastro de Favorecidos';
  frmCadForne.HelpContext := 210010;
  frmCadForne.bbtnAjuda.HelpContext := 210010;
end;

procedure TfrmPrincipal.mnuIntegracaoContabClick(Sender: TObject);
begin
  AbrirForm(frmCadCtFolha, TfrmCadCtFolha, false);
end;

procedure TfrmPrincipal.mnuPessoalClick(Sender: TObject);
begin
  AbrirForm(frmCadFunc, TfrmCadFunc, false);
end;

procedure TfrmPrincipal.mnuCadHstAltCadClick(Sender: TObject);
begin
  AbrirForm(frmCadHstAlterCad, TfrmCadHstAlterCad, false);
end;

procedure TfrmPrincipal.mnuSituacaoFuncionalClick(Sender: TObject);
begin
  AbrirForm(frmCadSit, TfrmCadSit, false);
end;

procedure TfrmPrincipal.mnuCargosClick(Sender: TObject);
begin
  AbrirForm(frmCadCargo, TfrmCadCargo, false);

end;

procedure TfrmPrincipal.mnuProfissoesClick(Sender: TObject);
begin
  AbrirForm(frmCadProfi, TfrmCadProfi, false);
end;

procedure TfrmPrincipal.mnuGrausdeInstrucaoClick(Sender: TObject);
begin
  AbrirForm(frmCadGrauInstr, TfrmCadGrauInstr, false);
end;

procedure TfrmPrincipal.mnuEstabelecimentosClick(Sender: TObject);
begin
  AbrirForm(frmCadFilial, TfrmCadFilial, false);
end;

procedure TfrmPrincipal.mnuSindicatosClick(Sender: TObject);
begin
  AbrirForm(frmCadSindi, TfrmCadSindi, false);
end;

procedure TfrmPrincipal.mnuReajusteClick(Sender: TObject);
begin
  AbrirForm(frmSelSimul, TfrmSelSimul, false);
end;

procedure TfrmPrincipal.mnuHistoricoClick(Sender: TObject);
begin
  AbrirForm(frmConsHistRubSal, TfrmConsHistRubSal, false);
end;

procedure TfrmPrincipal.mnuRegistroAlteracaoFuncionalClick(Sender: TObject);
begin
  AbrirForm(frmCadRegEvol, TfrmCadRegEvol, false);
end;

procedure TfrmPrincipal.mnuRegistrodeAlteraoSituacaoFuncionalClick(Sender: TObject);
begin
  AbrirForm(frmCadRegSitFunc, TfrmCadRegSitFunc, false);
end;

procedure TfrmPrincipal.mnuEvolucaoFuncionalClick(Sender: TObject);
begin
  AbrirForm(frmHstEvol, TfrmHstEvol, false);
end;

procedure TfrmPrincipal.mnuEstatisticasdoQuadroClick(Sender: TObject);
begin
  AbrirForm(frmSelEstat, TfrmSelEstat, false);
end;

procedure TfrmPrincipal.mnuTabelaHorariosClick(Sender: TObject);
begin
  AbrirForm(frmCadHoraTrab, TfrmCadHoraTrab, false);
end;

procedure TfrmPrincipal.mnuTurnosporDiaClick(Sender: TObject);
begin
  AbrirForm(frmCadTurnoDia, TfrmCadTurnoDia, false);
end;

procedure TfrmPrincipal.mnuAssociaHorariosClick(Sender: TObject);
begin
  AbrirForm(frmAssociaHorario, TfrmAssociaHorario, false);
end;

procedure TfrmPrincipal.mnuBrowsePessoalClick(Sender: TObject);
begin
  AbrirForm(frmBrwPess, TfrmBrwPess, false);
end;

procedure TfrmPrincipal.mnuRescisaoClick(Sender: TObject);
begin
  AbrirForm(frmResciContr, TfrmResciContr, false);
end;

procedure TfrmPrincipal.mnuNaturezaEmpresarialClick(Sender: TObject);
begin
  AbrirForm(frmCadNatEmpr, TfrmCadNatEmpr, false);
end;

procedure TfrmPrincipal.mnuCBOClick(Sender: TObject);
begin
  AbrirForm(frmCadCBO, TfrmCadCBO, false);
end;

procedure TfrmPrincipal.mnuTipodeTrabalhadorClick(Sender: TObject);
begin
  AbrirForm(frmCadTipoTrab, TfrmCadTipoTrab, false);
end;

procedure TfrmPrincipal.mnuCadFaixasSalariaisClick(Sender: TObject);
begin
  AbrirForm(frmCadFaixa, TfrmCadFaixa, false);
end;

procedure TfrmPrincipal.mnuClassNacionalAtividadesEconomicasCNAEClick(Sender: TObject);
begin
  AbrirForm(frmCadCNAE, TfrmCadCNAE, false);
end;

procedure TfrmPrincipal.mnuTabelasDARFClick(Sender: TObject);
begin
  AbrirForm(frmCadDARF, TfrmCadDARF, false);
end;

procedure TfrmPrincipal.mnuTabelasFPASClick(Sender: TObject);
begin
  AbrirForm(frmCadFPAS, TfrmCadFPAS, false);
end;

procedure TfrmPrincipal.mnuSegurodeAcidentesdoTrabalhoClick(Sender: TObject);
begin
  AbrirForm(frmCadSegAcid, TfrmCadSegAcid, false);
end;

procedure TfrmPrincipal.mnuDepositosGREClick(Sender: TObject);
begin
  AbrirForm(frmCadDeposGRE, TfrmCadDeposGRE, false);
end;

procedure TfrmPrincipal.mnuCategoriadeEmpregadoClick(Sender: TObject);
begin
  AbrirForm(frmCadCatEmprGRE, TfrmCadCatEmprGRE, false);
end;

procedure TfrmPrincipal.mnuCartaseComunicadosClick(Sender: TObject);
begin
  AbrirForm(frmCadCarta, TfrmCadCarta, false);
end;

procedure TfrmPrincipal.mnuVinculoEmpregaticioClick(Sender: TObject);
begin
  AbrirForm(frmCadVincEmpr, TfrmCadVincEmpr, false);
end;

procedure TfrmPrincipal.mnuSitAfastRAISClick(Sender: TObject);
begin
  AbrirForm(frmCadAfastRAIS, TfrmCadAfastRAIS, false);
end;

procedure TfrmPrincipal.mnuMovimentoContratualCAGEDClick(Sender: TObject);
begin
  AbrirForm(frmCadMovCAGED, TfrmCadMovCAGED, false);
end;

procedure TfrmPrincipal.mnuFormasdeRescisaoClick(Sender: TObject);
begin
  AbrirForm(frmCadFormFGTS, TfrmCadFormFGTS, false);
end;

procedure TfrmPrincipal.mnuDependentesClick(Sender: TObject);
begin
  AbrirForm(frmCadDependente, TfrmCadDependente, false);
end;

procedure TfrmPrincipal.mnuFeriasClick(Sender: TObject);
begin
  AbrirForm(frmCadFerias, TfrmCadFerias, false);
end;

procedure TfrmPrincipal.mnuDocumentosOficiaisClick(Sender: TObject);
begin
  AbrirForm(frmCadDocOfic, TfrmCadDocOfic, false);
end;

procedure TfrmPrincipal.mnuLinhasdeTransporteClick(Sender: TObject);
begin
  AbrirForm(frmCadLinha, TfrmCadLinha, false);
end;

procedure TfrmPrincipal.mnuLinhasporPessoaClick(Sender: TObject);
begin
  AbrirForm(frmRegLinha, TfrmRegLinha, false);
end;

procedure TfrmPrincipal.mnuRubricasPadraoCLTClick(Sender: TObject);
begin
  AbrirForm(frmCadRubCLT, TfrmCadRubCLT, false);
end;

procedure TfrmPrincipal.mnuEmpresasdeTranporteClick(Sender: TObject);
begin
  AbrirForm(frmCadEntid, TfrmCadEntid, false);
end;

procedure TfrmPrincipal.HorasExtraseAtrasosClick(Sender: TObject);
begin
  AbrirForm(frmRegHoras, TfrmRegHoras, false);
end;

procedure TfrmPrincipal.mnuHorasTrabOutroCCClick(Sender: TObject);
begin
  AbrirForm(frmCadRegTrabOutroCC, TfrmCadRegTrabOutroCC, false);
end;

procedure TfrmPrincipal.mnuSituacoesdeRiscoClick(Sender: TObject);
begin
  AbrirForm(frmCadSitRisco, TfrmCadSitRisco, false);
end;

procedure TfrmPrincipal.mnuHistoricodaSituacaoFuncionalClick(Sender: TObject);
begin
  AbrirForm(frmHstSitFunc, TfrmHstSitFunc, false);
end;

procedure TfrmPrincipal.mnuProgramacaoAntec13Click(Sender: TObject);
begin
  AbrirForm(frmCadAntec13, TfrmCadAntec13, false);
end;

procedure TfrmPrincipal.mnuFolhaClick(Sender: TObject);
begin
  AbrirForm(frmGeraCalc, TfrmGeraCalc, false);
end;

procedure TfrmPrincipal.mnuLancaHistRubricaClick(Sender: TObject);
begin
  AbrirForm(frmCadRubricaManual, TfrmCadRubricaManual, false);
end;

procedure TfrmPrincipal.mnuLayoutdeArquivosTXTClick(Sender: TObject);
begin
  AbrirForm(frmCadLayoutDesconto, TfrmCadLayoutDesconto, false);
end;

procedure TfrmPrincipal.mnuImportacaodeArquivosTXTClick(Sender: TObject);
begin
  AbrirForm(frmImportaTxt, TfrmImportaTxt, false);
end;

procedure TfrmPrincipal.mnuLancaRubPorPessoaClick(Sender: TObject);
begin
  AbrirForm(frmLancaRub, TfrmLancaRub, false);
end;

procedure TfrmPrincipal.mnuLancaRubPorRubricaClick(Sender: TObject);
begin
  AbrirForm(frmLancaRubPorRub, TfrmLancaRubPorRub, false);
end;

procedure TfrmPrincipal.mnuDemonstrativodePagamentoEspecialClick(Sender: TObject);
begin
  AbrirFormModal(frmParamRelTxtCCheque, TfrmParamRelTxtCCheque);
end;

procedure TfrmPrincipal.mnuFichaRegClick(Sender: TObject);
begin
  AbrirFormModal(frmParamFichaReg, TfrmParamFichaReg);
end;

procedure TfrmPrincipal.mnuGFIPClick(Sender: TObject);
begin
  AbrirFormModal(frmParamGFIPMagnetico, TfrmParamGFIPMagnetico);
end;

procedure TfrmPrincipal.mnuGRRFClick(Sender: TObject);
begin
  inherited;
  AbrirFormModal(frmParamGRRFMagnetico, TfrmParamGRRFMagnetico);
end;

procedure TfrmPrincipal.mnuValeTranspMagClick(Sender: TObject);
begin
  AbrirFormModal(frmParamVTMagnetico, TfrmParamVTMagnetico);
end;

procedure TfrmPrincipal.mnuCAGEDClick(Sender: TObject);
begin
  AbrirFormModal(frmParamCAGEDMagnetico, TfrmParamCAGEDMagnetico);
end;

procedure TfrmPrincipal.mnuDiasExtrasporPessoaClick(Sender: TObject);
begin
  AbrirForm(frmCadDiaExtra, TfrmCadDiaExtra, false);
end;

procedure TfrmPrincipal.PortadorFormaporBanco1Click(Sender: TObject);
begin
  AbrirForm(frmCadBancoPortador, TfrmCadBancoPortador, false);
end;

procedure TfrmPrincipal.mnuAcertodaQuantidadedeDependentesClick(Sender: TObject);
begin
  AbrirForm(frmAcertaDepend, TfrmAcertaDepend, false);
end;

procedure TfrmPrincipal.mnuEliminaLancamentosProcessadosClick(Sender: TObject);
begin
  AbrirForm(frmElimLanca, TfrmElimLanca, false);
end;

procedure TfrmPrincipal.mnuSeguroDesemprego1Click(Sender: TObject);
begin
  AbrirFormModal(frmParamSegDes, TfrmParamSegDes);
end;

procedure TfrmPrincipal.mnuContabilizacaodaFolhaClick(Sender: TObject);
begin
  AbrirForm(frmParamContabFolha, TfrmParamContabFolha, false);
end;

procedure TfrmPrincipal.mnuTicket1Click(Sender: TObject);
begin
  AbrirFormModal(frmParamTICKETMagnetico, TfrmParamTICKETMagnetico);
end;

procedure TfrmPrincipal.mnuRelatSubstEvent1Click(Sender: TObject);
begin
  AbrirFormModal(frmParamRelatSubstEvent, TfrmParamRelatSubstEvent);
end;

procedure TfrmPrincipal.mnuRAISMagClick(Sender: TObject);
begin
  AbrirFormModal(frmParamRAISMagnetico, TfrmParamRAISMagnetico);
end;

procedure TfrmPrincipal.mnuEvolucaodaFolhaClick(Sender: TObject);
begin
  AbrirForm(frmEstRubricas, TfrmEstRubricas, false);
end;

procedure TfrmPrincipal.mnuArquivodePagamentoClick(Sender: TObject);
begin
  AbrirFormModal(frmParamArqPagto, TfrmParamArqPagto);
end;

procedure TfrmPrincipal.mnuCadTabGenericaClick(Sender: TObject);
begin
  AbrirForm(frmCadTabGener, TfrmCadTabGener, false);
end;

procedure TfrmPrincipal.mnuCadTabLongaClick(Sender: TObject);
begin
  AbrirForm(frmCadTabLonga, TfrmCadTabLonga, false);
end;

procedure TfrmPrincipal.mnuImportacaodeDadosClick(Sender: TObject);
begin
  AbrirForm(frmImportacaoDireta, TfrmImportacaoDireta, false);
end;

procedure TfrmPrincipal.mnuCadFormaCalcClick(Sender: TObject);
begin
  AbrirForm(frmCadFormula, TfrmCadFormula, false);
end;

procedure TfrmPrincipal.mnuCadDicDadosClick(Sender: TObject);
begin
  AbrirForm(frmDicionarioDados, TfrmDicionarioDados, false);
end;

procedure TfrmPrincipal.mnuCadTipRegraFormCalcClick(Sender: TObject);
begin
  AbrirForm(frmCadTipoRegra, TfrmCadTipoRegra, false);
end;

procedure TfrmPrincipal.mnuManutDocClick(Sender: TObject);
begin
  TfrmLancDocCAPCAR.AbrirForm;
end;

procedure TfrmPrincipal.BarradeAtalhos1Click(Sender: TObject);
begin
  inherited;
  Toolbar971.Visible := not(Toolbar971.Visible);
  Toolbar972.Visible := not(Toolbar972.Visible);
  Toolbar973.Visible := not(Toolbar973.Visible);
  Toolbar974.Visible := not(Toolbar974.Visible);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: integer;
  DesReport: TObject; var Config: boolean);
var
  CmCtrlRptModFol: TCmCtrlRptModFol;
begin
  inherited;
  CmCtrlRptModFol := TCmCtrlRptModFol.Create;
  try
    Config := ConfigReport(liIdReports, liOrigemCm, CmCtrlRptModFol, DesReport);
    CmCtrlRptModFol.Free;
  except
    CmCtrlRptModFol.Free;
  raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject; IdReports: integer;
  sFileName: string; var Printed: boolean);
var
  RptModFol: TCmCtrlRptModFol;
begin
  inherited;
  RptModFol := TCmCtrlRptModFol.Create;
  try
    Printed := ShowReport(IdReports, RptModFol);
    RptModFol.Free;
  except
    RptModFol.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject; IdReports: integer;
  var sParams: string; var PrintReport: boolean);
begin
  case (IdReports) of
    3380 : frmPreviewReports := TfrmParamCadDependente.Create(Self, tprRelacao);
    3390 : frmPreviewReports := TfrmParamCadDependente.Create(Self, tprDeclaracao);
    3162 : frmPreviewReports := TfrmParamDCT.Create(Self);
    3458 : frmPreviewReports := TfrmParamFichaSalFam.Create(Self);
    3284 : frmPreviewReports := TfrmParamRubIntegrContab.Create(Self);
    578  : frmPreviewReports := TfrmParamEtiquetas.Create(Self);
    574  : frmPreviewReports := TfrmParamCadPessoal.Create(Self);
    446  : frmPreviewReports := TfrmParamAvisoFerias.Create(Self);
    448  : frmPreviewReports := TfrmParamFeriasProgram.Create(Self);
    2254 : frmPreviewReports := TfrmParamFichaFinanc.Create(Self);
    376  : frmPreviewReports := TfrmParamFolhaEmprRub.Create(Self);
    312  : frmPreviewReports := TfrmParamFolhaFreq.Create(Self);
    313  : frmPreviewReports := TfrmParamFolhaFreq2.Create(Self);
    2858 : frmPreviewReports := TfrmParamFolhaFreqEscala.Create(Self);
    1779 : frmPreviewReports := TfrmParamFolhaNormal.Create(Self);
    1871 : frmPreviewReports := TfrmParamGPS.Create(Self);
    302  : frmPreviewReports := TfrmParamGRCS.Create(Self);
    1155 : frmPreviewReports := TfrmParamGRFC.Create(Self);
    404  : frmPreviewReports := TfrmParamLancRubIndiv.Create(Self);
    272  : frmPreviewReports := TfrmParamReciboAvisoFerias.Create(Self);
    2684 : frmPreviewReports := TfrmParamAlfabMensal.Create(Self);
    334  : frmPreviewReports := TfrmParamAcompEscalaFerias.Create(Self);
    333  : frmPreviewReports := TfrmParamEscalaFerias.Create(Self);
    315  : frmPreviewReports := TfrmParamSalarioEduc.Create(Self);
    274  : frmPreviewReports := TfrmParamTRCT.Create(Self);
    1585 : frmPreviewReports := TfrmParamReciboPagamento.Create(Self);
    3037 : frmPreviewReports := TfrmParamRelRecContribSind.Create(Self);
    304  : frmPreviewReports := TfrmParamPrevisaoFerias.Create(Self);
    2161 : frmPreviewReports := TfrmParamProvisaoFerias.Create(Self, tprFerias);
    2386 : frmPreviewReports := TfrmParamProvisaoFerias.Create(Self, tprDecimoTerceiro);
    1776 : frmPreviewReports := TfrmParamResFol.Create(Self);
    416  : frmPreviewReports := TfrmParamResFolComp.Create(Self);
    1447 : frmPreviewReports := TfrmParamRelTransporte.Create(Self, 'COLUNA');
    2236 : frmPreviewReports := TfrmParamRelTransporte.Create(Self, 'LINHA');
    3840 : frmPreviewReports := TfrmParamVariavelMensal.Create(Self);
    3198 : frmPreviewReports := TfrmParamCracha.Create(Self);
    2246 : frmPreviewReports := TfrmParamCompSaldo.Create(Self);
    2154 : frmPreviewReports := TfrmParamReciboTerceiros.Create(Self);
    1281 : frmPreviewReports := TfrmParamBBancario.Create(Self);
    3036 : frmPreviewReports := TfrmParamRelSalContribINSS.Create(Self);
    2439 : frmPreviewReports := TfrmParamGerencial.Create(Self);
    3843 : frmPreviewReports := TfrmParamAlterFuncional.Create(Self);
    567  : frmPreviewReports := TfrmParamFichaFunc.Create(Self);
    565  : frmPreviewReports := TfrmParamCadRubSal.Create(Self);
    4013 : frmPreviewReports := TfrmParamDemPagEspecial.Create(Self);
    4059 : frmPreviewReports := TfrmParamRelatAfast.Create(Self);
    4131 : frmPreviewReports := TfrmParamCadFormaCalc.Create(Self);

    20531: frmPreviewReports := TfrmParamAdverteSuspensao.Create(Self);   // Edilaine - SOL 193131-13143 / KTN 1886157

    4231: frmPreviewReports := TfrmParamAACTPS.Create(Self);   // William Santana - SIG 20695

    // Thiago Melo SOL 186698 Kintana 1764805
    20528  : begin
               frmPreviewReports := TfrmParamTRCT.Create(Self);
               frmPreviewReports.Caption := 'Termo de Quitação de Rescisão do Contrato de Trabalho';
             end;
    20529  : begin
               frmPreviewReports := TfrmParamTRCT.Create(Self);
               frmPreviewReports.Caption := 'Termo de Homologação de Rescisão do Contrato de Trabalho';
             end;
    // FIM Thiago Melo SOL 186698 Kintana 1764805

    // Ricardo A. SOL 127621 KTN 678085
    5000 : frmPreviewReports := TfrmParamCadDependente.Create(Self, tprRelacao);
    // FIM Ricardo A. SOL 127621 KTN 678085

    5001 : frmPreviewReports := TfrmParamRubSalDadosPrinc.Create(Self); //Bruno Bastos - Sol: 127031 - Kintana: 670099
    4642:  frmPreviewReports := TfrmParamEmail.Create(Self); // WO11539 - Helen V Bianchi
    else   frmPreviewReports := nil;
  end;
  inherited;
end;

procedure TfrmPrincipal.HabilitarMenu_TicketMag;
begin
  mnuLine12.Visible := (Modulo.IdContraCheque = FUNCEF);
  mnuLine13.Visible := (Modulo.IdContraCheque = FUNCEF);
  mnuTicket1.Visible := (Modulo.IdContraCheque = FUNCEF);
  mnuTicket1.Enabled := (Modulo.IdContraCheque = FUNCEF);
  mnuRelatSubstEvent1.Visible := (Modulo.IdContraCheque = FUNCEF);
  mnuRelatSubstEvent1.Enabled := (Modulo.IdContraCheque = FUNCEF);
end;

procedure TfrmPrincipal.mnuListaRecebedoresClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadListaRecebedor, TfrmCadListaRecebedor, false);
end;

procedure TfrmPrincipal.mnuTransfSubClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmTransfSub, TfrmTransfSub, false); //Marilza
end;

procedure TfrmPrincipal.mnuAtualizacaoDeFotosClick(Sender: TObject);
begin
  inherited;
  //Andre Rocha - Sol: 153900 - Kintana: 1170535
  AbrirForm(frmAtualizacaoDeFotos, TfrmAtualizacaoDeFotos, False);
end;

procedure TfrmPrincipal.MnuConsPart_PadraoClick(Sender: TObject);
var
  ConsPart1: TConsPart;  //william santana - SIG 20695
begin
  inherited;
  //Helen - SOL : 158378 Kintana : 1280507
  Application.CreateForm(TconsPart, ConsPart1);
  Try
    ConsPart1.sIdPessoa := '0';
    ConsPart1.MostraConsulta;
  Finally
    // ELS SOL 175120 Kintana 1594021
    //FreeAndNil(ConsPart1);
  End;
end;

// jrm6 - SOL 164168 KTN 1560241
procedure TfrmPrincipal.GeraldeEndereos1Click(Sender: TObject);
var
  ConsEnder1: TfrmConsEnderGeral;

begin
  inherited;
  try
    Application.CreateForm(TfrmConsEnderGeral, ConsEnder1);
    ConsEnder1.show;
  finally
  end;

end;
// jrm6 - SOL 164168 KTN 1560241


procedure TfrmPrincipal.mnuAdvertnciaouSuspenso1Click(Sender: TObject);
begin
  inherited;
    AbrirForm(frmCadAdvertenciaSuspensao, TfrmCadAdvertenciaSuspensao, False);
end;

procedure TfrmPrincipal.mnuRubriPlanSaudeOdontoClick(Sender: TObject);
begin
  inherited;
     AbrirForm(frmCadrubricaSaudeOdonto, TfrmCadrubricaSaudeOdonto, False);
end;


procedure TfrmPrincipal.mnuIntegraContribPrevClick(Sender: TObject);
begin
  inherited;
  // Edilaine - SOL 152930 / KTN 1146562
  AbrirForm(FrmIntegraContribPrev, TFrmIntegraContribPrev, False);
end;

procedure TfrmPrincipal.mnuCalcMargemConsigClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 192084 KTN 1945985
  AbrirForm(frmCalcMargemConsig, TfrmCalcMargemConsig, False);
end;

procedure TfrmPrincipal.mnuCentroCustoClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 195376 KTN 1866485
  AbrirForm(frmCadCCusto, TfrmCadCCusto, False);
end;

procedure TfrmPrincipal.mnuBeneficioPeriodoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadBenefPeriodo, TfrmCadBenefPeriodo, false);
end;

//Início - William Santana - SOL 229881.16650 PPM 566001
procedure TfrmPrincipal.mnuRegistrodeEstabilidadeFuncionalClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadRegEstabilidade, TfrmCadRegEstabilidade, False);
end;
//Término - William Santana - SOL 229881.16650 PPM 566001

procedure TfrmPrincipal.mnuRegAvisoPrevClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmRegAvisoPrev, TfrmRegAvisoPrev, False); // Felipe A. Santos - SOL 229881/16649 PPM 566000  
end;

procedure TfrmPrincipal.RemuneraoOutroEmpregador1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmRemuneracaoOutroEmpregado,TFrmRemuneracaoOutroEmpregado,false);
  //Higor Nayde Ferreira SOL 250385/17479 PMM 960979
end;

//Inicio - Edilaine - SIG39701
procedure TfrmPrincipal.mnuRegistrodeMrito1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadRegMerito, TfrmCadRegMerito, False);
end;
//Termino - Edilaine - SIG39701


//Inicio - Leandro - WO11538
procedure TfrmPrincipal.mnuCadastroParamETLClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmCadParamETL, TFrmCadParamETL, false);
end;
//Termino - Leandro - WO11538

initialization
   Sistema.NomeModulo := 'Folha de Pagamento';
   Sistema.IdModulo := MODFOL;
   Sistema.Versao := '4.15.12a';
   Sistema.NomeAplicativo := 'Folha de Pagamento';
   Sistema.LoadOldReport := false;
   Application.HintPause := 0;
finalization
end.
