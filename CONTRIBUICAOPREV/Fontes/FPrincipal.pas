unit FPrincipal;

// Alterações:
//------------------------------------------------------------------------------
// Alteração  : Criação de novo Form
// Autor(a)   : Edilaine
// Data       : 11/01/2022
// SIG        : 114262
// Descricao  : Criação do Cadastro de Contribuiçao em Lote
//------------------------------------------------------------------------------
// Alteração  : Criação de novo Form
// Autor(a)   : Ewerton Beltramini
// Data       : 19/08/2021
// SIG        : 101465
// Descricao  : Criação de novo Form:  FrmHistoricoDeContribuicaoEmAtraso
//------------------------------------------------------------------------------
// Alteração  : Criação de novo Form
// Autor(a)   : Ewerton Beltramini
// Data       : 20/08/2021
// SIG        : 101465
// Descricao  : Criação de novo Form: FrmAssociarContribuicoesParticipantes
//------------------------------------------------------------------------------
// Alteração  : Criação de novo Form
// Autor(a)   : Rafael Vasconcelos
// Data       : 27/05/2020
// SIG        : 99932
// Descricao  : Criação de novo Form: FrmAlteraHistMovReserva
//------------------------------------------------------------------------------
// Alteração  : Criação de novo Form
// Autor(a)   : Rafael Vasconcelos
// Data       : 15/05/2020
// SIG        : 99874
// Descricao  : Criação de novo Form: FrmAlteraSalPart
//------------------------------------------------------------------------------
// Alteração  : Criação de novo Form
// Autor(a)   : Ewerton Beltramini
// Data       : 16/03/2020
// SIG        : 99102
// Descricao  : Criação de novo Form: FrmAlteracaoHistoricoContrib
//------------------------------------------------------------------------------
// Alteração  : (dfm) ContribuiesporPlanoAnaltico (remover), Alimentacaodereservasportadas1 (caption)
// Autor(a)   : Edilaine Ferraresi
// Data       : 15/12/2017
// SIG        : 59881
// Descricao  : ajuste nas permissoes
//------------------------------------------------------------------------------
// Alteração  : mnuContribuicoesParticipClick
// Autor(a)   : Edilaine Ferraresi
// Data       : 30/01/2017
// SIG        : 36752
// Descricao  : Equacionamento - ação judicial / importação arquivo
//------------------------------------------------------------------------------
//Alteração  : funcionalidade renomeada
//Nº SIG.....: 33372
//Data.......: 29/11/2016
//Responsável: Edilaine Ferraresi
//Descrição..: Ajustes para Equacionamento - Recebimento Contrib via Folha através de procedure
//------------------------------------------------------------------------------
//Pendência   : SOL 253577/17989  PPM 1198155
//Responsável : Darivaldo Alencar
//Data        : 08/04/2016
//Descrição   : Incluir item de Menu
//                 - Provisoes a Construir;
//------------------------------------------------------------------------------
//Pendência   : SOL 253577/17819 PPM 1104948
//Responsável : Helio Lima Custódio
//Data        : 28/12/2015
//Descrição   : Inclusão dos menus: N16, mnuProvisoparaPerdas,
//              mnuProvisoparaPerdasIndividual, mnuProvisoparaPerdasemLote
//              e mnuRelatriodeProvisoparaPerdas
//------------------------------------------------------------------------------
//Pendência   : SOL 253577/17462 PPM 956898
//Responsável : Robson José Pereira de Andrade
//Data        : 20/07/2015
//Descrição   : Incluir item de Menu
//                 - Contribuições por Núcleo Familiar;
//                 - Entrada Manual de Contribuições por Núcleo Familiar
//Rotina      : Menu
//------------------------------------------------------------------------------
//--------------------------------------------------------------------------------
//Pendência   : SOL 145044 Kintana 966308
//Responsável : Tadeu Passos/ Douglas Siqueira / Higor Nayde / William Santana
//Data        : 12/05/2014
//Descrição   : Benefício Saldado e FAB
//--------------------------------------------------------------------------------
//Pendência   : SOL 213777/16134	 KINTANA 404512
//Responsável : Higor Nayde
//Data        : 04/10/2013
//Descrição   : Criação do Menu de alimentação
//--------------------------------------------------------------------------------
//Pendência   : SOL 1675221	 KINTANA 180693
//Responsável : Douglas.Siqueira
//Data        : 04/10/2013
//Descrição   : Funcionalidade: Resgate Complementar em Lote
//--------------------------------------------------------------------------------
//--------------------------------------------------------------------------------
//Pendência   : SOL 205322 KINTANA 180693
//Responsável : Douglas.Siqueira
//Data        : 17/06/2013
//Descrição   : Criar funcionalidade para atendimento da IN 1343.
//--------------------------------------------------------------------------------
// --------------------------------------------------------------------------------
// Pendência   : SOL 132490 KINTANA
// Responsável : BRUNO AZEVEDO
// Data        : 23/04/2012
// Descrição   : Criação da Funcionalidade "Transferência de Saldo de Cota".
//--------------------------------------------------------------------------------
// Autor(a)   : Eraldo Silva
// Data       : 29/02/2012
// Pendência  : SOL 175120 Kintana 15940219
// Descricao  : CONSULTA GERAL PESSOA Ao consultar alguma matricula no Consulta Geral de
//              Pessoa o sistema fecha a tela automaticamente.
// --------------------------------------------------------------------------------
// Pendência   : SOL 107221/5802 KINTANA 1365701
// Responsável : BRUNO AZEVEDO
// Data        : 07/12/2011
// Descrição   : Criação da Funcionalidade "Recebimento de Contribuições via Empréstimo".
//--------------------------------------------------------------------------------
// Autor(a)    : Thiago Passos
// Data        : 30/10/2009
// SOL         : 115179
// Kintana     :
// Descricao   : Criando o menu - Alimentação de Reservas Portadas
// ------------------------------------------------------------------------------
// Autor(a)    : Hugo Luna
// Data        : 17/10/2007
// Pendência   : 26572
// Rotina      : ---
// Descricao   : Habilitando tela de Entrada Manual de Rubricas no ContribuiçãoPrev
// ------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 17/05/2007
// Pendência   : 20368
// Rotina      : ---
// Descricao   : Retirar o form "Movimentação de Reserva"
// ------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 09/05/2007
// Pendência   : 25264
// Rotina      : ---
// Descricao   : Retirar o botão de Atalho para Cadastros de Pessoa
// --------------------------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 28/09/2006
// Pendência   : 23419
// Rotina      : mnuBenefRequerimentoClick
// Descricao   : Passar a DataRequerimento nula para a rotina AbreRequerParticip.
//------------------------------------------------------------------------------
// Autor       : Gleyber
// Data        : 31/05/2006
// Pendencia   : 22491
// Rotina      : CriaDataModule e todas as chamadas de menu
// Alteração   : Criação de uma rotina especial para que crie os datamodules a
//               partir de um clique no menu.
//------------------------------------------------------------------------------
// Autor       : Paulo Ramos
// Data        : 30/05/2006
// Pendencia   : 22491
// Rotina      : AppPadraoCreateFormReports
// Alteração   : Retirada do create do data module dtmRelSRB, que foi transferido para a tela que o utiliza.
//------------------------------------------------------------------------------
// Autor       : Paulo Ramos
// Data        : 21/03/2006
// Rotina      : AppPadraoCreateFormReports
// Alteração   : Tratar exceção para cada datamodule criado
//------------------------------------------------------------------------------
// Autor       : Leo
// Data        : 23/11/2005
// Pendência   : 20785
// Alteração   : modificação da chamada e aparência da tela
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 19/09/2005
// Pendencia   : 19535
// Rotina      : MnuSimulaEnquadramento
// Alteração   : Inclusão do Item de menu
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 06/09/2005
// Pendencia   : 19946
// Rotina      : mnuConfExtDesligClick e mnuImpExtDesligClick
// Alteração   : Inclusão da rotina de impressão de extrato de desligamento. 
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 25/02/2005
// Rotina      : AppPadraoAfterLogin
// Alteração   : Inclusão do ParamIntegra 
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 16/02/2005
// Pendencia   : 18650
// Rotina      : AppPadraoAfterLogin
// Alteração   : Adequação do código para utilização da variável global Sistema.TipoCliente
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 04.11.2004
// Pendencia   : ----
// Alteração   : Preencher o prmNumTentativasSalario no after login
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 16/09/2004
// Pendencia   : 17690
// Alteração   : Acerto no controle dos submenus virtuais
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 20/07/2004
// Pendencia   : 17119
// Rotina      : AppPadraoAfterLogin
// Alteração   : Alterado o método de exclusão de itens filhos dos menus de eventos
//               de transferência.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 08/01/2004
// Alteração   : Chamada da tela de Movimentação de Reservas
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 07.11.2003
// Pendencia   : 15494
// Alteração   : Alteração na tela de integração com financeiro para otimizar
//               as descrições e operação da tela
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 23.10.2003
// Alteração   : Chamada da tela de Retroativo e Evoluçào Funcional como Modal
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 26.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  StdCtrls, TB97, Db, DBTables, Wwquery, Wwdatsrc, wwdblook, Mask, wwdbedit,
  DBCtrls, MontaSelect, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio,
  IvAMulti, IvBinDic, IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts,
  CMApplicationEvents, StdActns, ActnList, ImgList, fcStatusBar,
  SConnect, MConnect, DBClient, UConsPart, uResource, JclFileUtils,
  CMNetUsers, FConsEnderGeral, wwstorep, UFuncoesUteis;

const
   indNivelEvento   = 2;

   indNivelEventoRI = 0;
   indNivelEventoMP = 1;
   indNivelTransf   = 3;
   indNivelEventoTR = 0;


type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuParticipantes: TMenuItem;
    mnuContribuicoes: TMenuItem;
    N11: TMenuItem;
    mnuContribRecebimento: TMenuItem;
    mnuContribRetroOld: TMenuItem;
    mnuContribEstimativa: TMenuItem;
    mnuContribAjuteDif: TMenuItem;
    mnuEnviodeContribuicoes: TMenuItem;
    mnuContribCalcReserva: TMenuItem;
    mnuContribuicoesParticip: TMenuItem;
    mnuCalcReservaPart: TMenuItem;
    mnuContribControle: TMenuItem;
    mnuConsReservaPart: TMenuItem;
    mnuConsReservaColetiva: TMenuItem;
    mnuEstatisticas: TMenuItem;
    mnuTratamentodeDivergencias: TMenuItem;
    mnuAlimentacaodeReservasParticipante: TMenuItem;
    mnuEventos: TMenuItem;
    mnuEventoManutParcial: TMenuItem;
    mnuEventoRegInadimpl: TMenuItem;
    mnuReajustedeSalariodeManutencao: TMenuItem;
    qryAux: TwwQuery;
    HistricodeMovimentaodeReservas1: TMenuItem;
    N28: TMenuItem;
    RegistrodeEventos1: TMenuItem;
    AlimentaoManualdeReservasColetiva: TMenuItem;
    MontaSelectPart: TMontaSelect;
    MontaSelectPatro: TMontaSelect;
    N32: TMenuItem;
    N35: TMenuItem;
    CancelarEventoRegistrado1: TMenuItem;
    AlteraodePDV1: TMenuItem;
    mnuControleIndividualContrib: TMenuItem;
    CancelamentodeCobranasVencidas1: TMenuItem;
    EntradaManualdeContribuies1: TMenuItem;
    mnuAtualizarSaldosaReceber: TMenuItem;
    TratamentodeContribuiesnoIdentificadas1: TMenuItem;
    N10: TMenuItem;
    N45: TMenuItem;
    Gerararquivoparaemisso1: TMenuItem;
    Individual1: TMenuItem;
    Analise1: TMenuItem;
    Execuo1: TMenuItem;
    ParcelamentodeDvida1: TMenuItem;
    RegistrodeOperaes1: TMenuItem;
    ConsultadeDocumentosdoCAR1: TMenuItem;
    mnuContribBaixaContribIncentivo: TMenuItem;
    mnuContribCompraCarencia: TMenuItem;
    N1: TMenuItem;
    mnuContribRetro: TMenuItem;
    mnuRubricas1: TMenuItem;
    AcertodoHistricodeReservas1: TMenuItem;
    N40: TMenuItem;
    mnuAtualizaReservaPorIndice: TMenuItem;
    N50: TMenuItem;
    mnuMovReservas: TMenuItem;
    mnuEventoTransfReserva: TMenuItem;
    mnuEventoTransferencias: TMenuItem;
    mnuContribRegularizaInadimpl: TMenuItem;
    Button1: TButton;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N12: TMenuItem;
    N14: TMenuItem;
    EntradaManualdeRubricas1: TMenuItem;
    Alimentacaodereservasportadas1: TMenuItem;
    mnucalculoIrrf: TMenuItem;
    N8: TMenuItem;
    mnuBaixaContribEmptmo: TMenuItem;
    N13: TMenuItem;
    mnuTransferenciadeSaldodeCota1: TMenuItem;
	ConsultaGeraldeEndereos1: TMenuItem;
    mnuClculodoSaldodeContribuiesBitributao: TMenuItem;//DOUGLAS.SIQUEIRA SOL 205322 Kintana 1996527
    mnuRequerimentodeResgateComplementaremLote: TMenuItem;//DOUGLAS.SIQUEIRA SOL 1675221 Kintana 180693
    mnuConcessodeResgateComplementaremLote: TMenuItem;
    AlimentaodereservasREPLAN1: TMenuItem;
    N15: TMenuItem;//DOUGLAS.SIQUEIRA SOL 1675221 Kintana 180693
    //Inicio -  Tadeu Passos SOL 145044 Kintana 966308
    BenefcioSaldado1: TMenuItem;
    mnuCargadeArquivo: TMenuItem;
    mnuInformacoesParticipante: TMenuItem;
    Contribuiesp1: TMenuItem;
    EntradaManualdeContribuiesporNcleoFamiliar1: TMenuItem;
    N16: TMenuItem;
    mnuProvisoparaPerdas: TMenuItem;
    mnuProvisoparaPerdasIndividual: TMenuItem;
    mnuProvisoparaPerdasemLote: TMenuItem;
    mnuRelatriodeProvisoparaPerdas: TMenuItem;
    //Fim - Tadeu Passos SOL 145044 Kintana 966308
    ProvisoesAConstituir: TMenuItem;              //Darivaldo Alencar - SOL 253577/17989  PPM 1198155
    ContribuiesporPlanoAnaltico: TMenuItem;
    mnuImportaesemLote1: TMenuItem;
    mnuAlteraodehistricodecontribuio: TMenuItem;
    mniAlterarSalriodeManutenoeParticipao1: TMenuItem;
    mnuCadastrodeContribuiesemLote1: TMenuItem;
    mniAlteraodeHistoricodeContribuicaoEmAtraso1: TMenuItem;
    mniAssociarContribuicoesParticipantes: TMenuItem;
    procedure mnuContribRecebimentoClick(Sender: TObject);
    procedure mnuEnviodeContribuicoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuContribuicoesParticipClick(Sender: TObject);
    procedure mnuCalcReservaPartClick(Sender: TObject);
    procedure mnuContribControleClick(Sender: TObject);
    procedure mnuConsReservaPartClick(Sender: TObject);
    procedure mnuConsReservaColetivaClick(Sender: TObject);
    procedure mnuEstatisticasClick(Sender: TObject);
    procedure mnuAlimentacaodeReservasParticipanteClick(Sender: TObject);
    procedure mnuTratamentodeDivergenciasClick(Sender: TObject);
    procedure mnuReajustedeSalariodeManutencaoClick(Sender: TObject);
    procedure HistricodeMovimentaodeReservas1Click(Sender: TObject);
    procedure RegistrodeEventos1Click(Sender: TObject);
    procedure AlimentaoManualdeReservasColetivaClick(Sender: TObject);
    procedure mnuContribEstimativaClick(Sender: TObject);
    procedure CancelarEventoRegistrado1Click(Sender: TObject);
    procedure mnuControleIndividualContribClick(Sender: TObject);
    procedure CancelamentodeCobranasVencidas1Click(Sender: TObject);
    procedure EmissodoCertificadodeInscrio1Click(Sender: TObject);
    procedure EntradaManualdeContribuies1Click(Sender: TObject);
    procedure mnuAtualizarSaldosaReceberClick(Sender: TObject);
    procedure TratamentodeContribuiesnoIdentificadas1Click(Sender: TObject);
    procedure Gerararquivoparaemisso1Click(Sender: TObject);
    procedure Analise1Click(Sender: TObject);
    procedure mnuBenefRetroAnaliseClick(Sender: TObject);
    procedure ParcelamentodeDvida1Click(Sender: TObject);
    procedure RegistrodeOperaes1Click(Sender: TObject);
    procedure ConsultadeDocumentosdoCAR1Click(Sender: TObject);
    procedure VerificaodeInconsistncias1Click(Sender: TObject);
    procedure mnuContribBaixaContribIncentivoClick(Sender: TObject);
    procedure mnuContribCompraCarenciaClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure MnuConsPart_PadraoClick(Sender: TObject);
    procedure mnuContribRetroClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mnuRubricas1Click(Sender: TObject);
    procedure AcertodoHistricodeReservas1Click(Sender: TObject);
    procedure mnuAtualizaReservaPorIndiceClick(Sender: TObject);
    procedure AppPadraoShowParamReportPadrao(sender: TObject; IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure mnuBenefEntradaManualContribClick(Sender: TObject);
    procedure mnuContribRegularizaInadimplClick(Sender: TObject);
    procedure ActLoginExecute(Sender: TObject);
    procedure mnuConfExtDesligClick(Sender: TObject);
    procedure mnuImpExtDesligClick(Sender: TObject);
    procedure Relatorios1Click(Sender: TObject);
    procedure ContribuiesporNcleoFamiliar1Click(Sender: TObject);
    procedure AlteraodePDV1Click(Sender: TObject);
    procedure EntradaManualdeRubricas1Click(Sender: TObject);
    procedure Alimentacaodereservasportadas1Click(Sender: TObject);
    procedure mnucalculoIrrfClick(Sender: TObject);
    procedure mnuBaixaContribEmptmoClick(Sender: TObject);
    procedure mnuTransferenciadeSaldodeCota1Click(Sender: TObject);
    procedure ConsultaGeraldeEndereos1Click(Sender: TObject);
    procedure mnuClculodoSaldodeContribuiesBitributaoClick(Sender: TObject);//DOUGLAS.SIQUEIRA SOL 205322 Kintana 1996527
    procedure mnuRequerimentodeResgateComplementaremLoteClick(
      Sender: TObject);
    procedure mnuConcessodeResgateComplementaremLoteClick(Sender: TObject);
    procedure AlimentaodereservasREPLAN1Click(Sender: TObject);
    // Tadeu Passos SOL 145044 Kintana 966308
    procedure mnuCargadeArquivoClick(Sender: TObject);
    procedure mnuInformacoesParticipanteClick(Sender: TObject);
    procedure Contribuiesp1Click(Sender: TObject);
    procedure EntradaManualdeContribuiesporNcleoFamiliar1Click(
      Sender: TObject);
    procedure mnuProvisoparaPerdasIndividualClick(Sender: TObject);
    procedure mnuProvisoparaPerdasemLoteClick(Sender: TObject);
    procedure mnuRelatriodeProvisoparaPerdasClick(Sender: TObject);
    procedure ProvisoesAConstituirClick(Sender: TObject);
    procedure mnuAlteraodehistricodecontribuioClick(Sender: TObject);
    procedure mniAlterarSalriodeManutenoeParticipao1Click(Sender: TObject);
    procedure mniAlteraodeHistricodeReserva1Click(Sender: TObject);
    procedure mnuCadastrodeContribuiesemLote1Click(Sender: TObject);             //Darivaldo Alencar - SOL 253577/17989  PPM 1198155
    procedure mniAlteraodeHistoricodeContribuicaoEmAtraso1Click(Sender: TObject);
    procedure mniAssociarContribuicoesParticipantesClick(Sender: TObject);             
    //procedure ContribuiesporPlanoAnalticoClick(Sender: TObject);    //edilaine - SIG59881 
    // Tadeu Passos SOL 145044 Kintana 966308

  private // Private declarations

    procedure AbreFormEventoDM(Sender: TObject);
    procedure AbreFormEventoDS(Sender: TObject);
    procedure AbreFormEventoMP(Sender: TObject);
    procedure AbreFormEventoCI(Sender: TObject);
    procedure AbreFormEventoRI(Sender: TObject);
    procedure AbreFormEventoTR(Sender: TObject);
    procedure AbreFormDesfazerEvento(Sender: TObject);
    procedure AbreFormProrrogarEvento(Sender: TObject);
    procedure MontaMenu;
    procedure verifica_situacao_empresa;
    procedure CriaDataModule;


  public  // Public declarations

    liIdPessJurPCS   : longInt;
    sNomePatroPCS    : String;
    liIdPessJurGrupo : longInt;
    sNomePatroGrupo  : String;
    liIdPessJurNivel : longInt;
    sNomePatroNivel  : String;

    liIdPessJurEvolFunc : longInt;
    sNomePatroEvolFuncs  : String;

    procedure MudaCaptionFundacao(Sender: TObject);


  end;



var
  frmPrincipal: TfrmPrincipal;



implementation
{$R *.DFM}
uses
  fParamContribPlano,
  UAutorizacao, FTelaAut, USistema, UModulo, DBaseDados, UMascaras, UMensErro, UDataBase,
  uIntegraBack, UAdmPrev, DAPrev, UEtiquetaCM, fEmisEtiq, fCfgEtiqueta, uCtrlParamIntegra,
  uCmCtrlRpt, fParamAPrevCS, fAlimReservasReplan,

  fSolicitaPatro, fParcelamento, uEventos,

  fRecebeContribuicaoNovo,  // edilaine - SIG33372

  fPreparaEnvia, fCadContribParticipante, fCalculaReservaPart, fCtrlInterface,
  fAlimentaReserva, fConsReservaPart, fConsEstatDivergContrib, fEventoDemissaoManutContrib,
  fReajustaSalarioMantido, fDivergContrib, fEventoDemissaoManutSaldo, fEventoManutParcial,
  fEventoRegInadimplencia, fEventoTransfReserva, fDesfazerEvento, fEventoProrrogacao, fSimulaContrib,
  fCancelaEvento, fControleIndivContrib, fCancelaBoleta, fCadHstContribuicao, fBaixaContribCAR,
  fGeraContnId, fAnaliseRetroLote, fVerificacaoInconsistencia, fBaixaContribPIDPIA, fRetroativoPrev,
  fAcertaHistMovreserva, fAtualizaPorIndice, fCadHstContribuicaoBeneficiario,
  fRegularizaInadimplencia, fCadContribNucleoFamiliar,
  fConsRubricas, fPRelHisFuncionalMT,
  fConfSimulaDeslig, fParamRelExtratoDeslig, dRelExtratoDeslig, dRelatorios,
  dRelatAdmPrev, dRelRetroRegional, dRelatGerencial, dRelatAdmPrev2, dRelTempoServicoMT,
  dRelatEspecificos, dRelTransfPlano, fPRelResumoCobr, fConsHistMovReserva, fConsEventosPrev,
  fPRelExtPoup, fConsLogTotalPREV, fConsDOCAlimReserva, FCadRubricaManualCS,
  fParamRelCertificadoPre, FCadAlteraPdv, FCadContribuicaoPortada, fCalculoIRRF, FRecebeContribEmptmo,
  fTransferenciaSaldoCota, FCalcSalContr,FCadRequerResgCompLote,FCadConcederResgCompLote,
  fCargaArquivo, FBeneficioSaldadoFAB,
  //Inicio - Helio - SOL Nº 253577/17819 PPM Nº 1104948
  FProvPerdasIndiv, FProvPerdasLote, FFRelProvPerdas,
  //Fim - Helio - SOL Nº 253577/17819 PPM Nº 1104948
  FRelProvConst, FAlteracaoHistoricoContrib, FAlteraSalPart,
  FCadContribuicaoLote,//Darivaldo Alencar - SOL 253577/17989  PPM 1198155
  FAssociarContribuicoesDosParticipantesEmLote, FAlteraHistMovReserva,
  FHistoricoDeContribuicaoEmAtraso;

procedure TfrmPrincipal.MudaCaptionFundacao(Sender: TObject);
var
  i, iPos, iTam, iTamFrase : word;
  Temp    : TComponent;
begin
  if Screen.ActiveForm = nil then Exit;

  if prmFLGTIPOPREVIDENC = 'I' then
  begin
    iPos      := Pos   ('FUNDA', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('FUNDAÇÃO');
    iTamFrase := Length(Screen.ActiveForm.Caption);

    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Instituto'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

    iPos      := Pos   ('PATROCINADORAS', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PATROCINADORAS');
    iTamFrase := Length(Screen.ActiveForm.Caption);

    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Entidades'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

    iPos      := Pos   ('PATROCINADORA', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PATROCINADORA');
    iTamFrase := Length(Screen.ActiveForm.Caption);

    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Entidade'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

    iPos      := Pos   ('PLANOS', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PLANOS');
    iTamFrase := Length(Screen.ActiveForm.Caption);

    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Regimes'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

    iPos      := Pos   ('PLANO', UPPERCASE(Screen.ActiveForm.Caption));
    iTam      := Length('PLANO');
    iTamFrase := Length(Screen.ActiveForm.Caption);

    if iPos > 0 then
      Screen.ActiveForm.Caption := Copy(Screen.ActiveForm.Caption, 1, iPos - 1)+'Regime'+Copy(Screen.ActiveForm.Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

    for i := 0 to Screen.ActiveForm.ComponentCount - 1 do
    begin
      Temp := Screen.ActiveForm.Components[i];
      if (Temp is TLabel) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TLabel(Temp).Caption);

        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TLabel(Temp).Caption);

        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TLabel(Temp).Caption);

        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANOS', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TLabel(Temp).Caption);

        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANO', UPPERCASE(TLabel(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TLabel(Temp).Caption);
        if iPos > 0 then
          TLabel(Temp).Caption := Copy(TLabel(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TLabel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

      end;

      if (Temp is TMenuItem) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TMenuItem(Temp).Caption);

        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TMenuItem(Temp).Caption);

        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TMenuItem(Temp).Caption);

        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANOS', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TMenuItem(Temp).Caption);

        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANO', UPPERCASE(TMenuItem(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TMenuItem(Temp).Caption);

        if iPos > 0 then
          TMenuItem(Temp).Caption := Copy(TMenuItem(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TMenuItem(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

      end;

      if (Temp is TGroupBox) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TGroupBox(Temp).Caption);

        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TGroupBox(Temp).Caption);

        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TGroupBox(Temp).Caption);

        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANOS', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TGroupBox(Temp).Caption);

        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANO', UPPERCASE(TGroupBox(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TGroupBox(Temp).Caption);

        if iPos > 0 then
          TGroupBox(Temp).Caption := Copy(TGroupBox(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TGroupBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

      end;

      if (Temp is TCheckBox) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TCheckBox(Temp).Caption);

        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TCheckBox(Temp).Caption);

        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TCheckBox(Temp).Caption);

        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANOS', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TCheckBox(Temp).Caption);

        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANO', UPPERCASE(TCheckBox(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TCheckBox(Temp).Caption);

        if iPos > 0 then
          TCheckBox(Temp).Caption := Copy(TCheckBox(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TCheckBox(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

      end;

      if (Temp is TPanel) then
      begin
        iPos      := Pos   ('FUNDA', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('FUNDAÇÃO');
        iTamFrase := Length(TPanel(Temp).Caption);

        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Instituto'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORAS', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PATROCINADORAS');
        iTamFrase := Length(TPanel(Temp).Caption);

        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Entidades'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PATROCINADORA', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PATROCINADORA');
        iTamFrase := Length(TPanel(Temp).Caption);

        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Entidade'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANOS', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PLANOS');
        iTamFrase := Length(TPanel(Temp).Caption);

        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Regimes'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

        iPos      := Pos   ('PLANO', UPPERCASE(TPanel(Temp).Caption));
        iTam      := Length('PLANO');
        iTamFrase := Length(TPanel(Temp).Caption);

        if iPos > 0 then
          TPanel(Temp).Caption := Copy(TPanel(Temp).Caption, 1, iPos - 1)+'Regime'+Copy(TPanel(Temp).Caption, iPos + iTam, iTamFrase - ( iPos + iTam - 1) );

      end;
    end;
  end;
end;



procedure TfrmPrincipal.Verifica_Situacao_Empresa;
var
  qryIntegraBack : TQuery;
begin
  // Verificar se Previdenciario com Contabilidade
  qryIntegraBack              := TQuery.Create(Application);
  qryIntegraBack.DataBaseName := 'Basedados';

  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add('SELECT FLGINTCONTAB, FLGINTCPAGARPREV, FLGINTCRECEBERPR FROM PARAMAPREV');

  qryIntegraBack.Open;
  if not(qryIntegraBack.IsEmpty) then
  begin
     if qryIntegraBack.FieldbyName('FLGINTCONTAB').AsInteger = 1
     then IntegraBack.Contabilidade := 'S'
     else IntegraBack.Contabilidade := 'N';

     if (qryIntegraBack.FieldbyName('FLGINTCPAGARPREV').AsInteger = 1) or
        (qryIntegraBack.FieldbyName('FLGINTCRECEBERPR').AsInteger = 1)
     then IntegraBack.Financeiro    := 'S'
     else IntegraBack.Financeiro    := 'N';
  end
  else
  begin
     IntegraBack.Contabilidade      := 'N';
     IntegraBack.Financeiro         := 'N';
  end;


  if Sistema.IdEmpresa <= 0 then
  begin
     qryIntegraBack.Free;
     Exit;
  end;

  // Preencher parametros da contabilidade
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT PL.MASCARA, PC.PLANO       '+
                         ' FROM   PLANO PL,   PARAMCONTAB PC '+
                         ' WHERE  (PC.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')'+
                         ' AND    (PL.PLANO = PC.PLANO) ');

  qryIntegraBack.Open;
  if not(qryIntegraBack.IsEmpty) then
  begin
    IntegraBack.Plano         := qryIntegraBack.FieldbyName('PLANO').AsInteger;
    IntegraBack.MascaraPlano  := qryIntegraBack.FieldbyName('MASCARA').AsString;
  end
  else
  begin
    IntegraBack.Plano         := 0;
    IntegraBack.MascaraPlano  := '';
  end; // else - if not PARAMCONTAB.IsEmpty

  if (IntegraBack.Contabilidade = 'S') and ((IntegraBack.Plano <= 0) or (IntegraBack.MascaraPlano = '')) then
  begin
    MsgDlg(' O Sistema de Administração Previdenciária está integrado com o Sistema de Contabilidade. '+
           ' Porém existem dados da contabilidade indispensáveis à integração que não estão cadastrados. '+
           ' Favor entrar em contato com o setor responsável. ', 'Informação', mtInformation, [mbOK], 0);
     Repaint;
  end;

  // Preencher parametros de integracao com CAP/CAR
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT PREC.MASCARADESEMB AS MASCARAREC , PPAG.MASCARADESEMB AS MASCARAPAG  '+
                      ' FROM   PARAMCAP PREC, PARAMCAP PPAG'+
                      ' WHERE  (PREC.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')'+
                      ' AND    (PPAG.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
                      ' AND    (PREC.RECPAG = ''R'')'+
                      ' AND    (PPAG.RECPAG = ''P'')');

  qryIntegraBack.Open;
  if not(qryIntegraBack.IsEmpty) then
  begin
    IntegraBack.MascaraReceb  := qryIntegraBack.FieldbyName('MASCARAREC').AsString;
    IntegraBack.MascaraDesemb := qryIntegraBack.FieldbyName('MASCARAPAG').AsString;
  end
  else
  begin
    IntegraBack.MascaraReceb  := '';
    IntegraBack.MascaraDesemb := '';
  end;

  if (IntegraBack.Financeiro = 'S') and (trim(IntegraBack.MascaraDesemb) = '') then
  begin
     MsgDlg(' O Sistema de Administração Previdenciária está integrado com o Sistema de Contas a Receber. '+
            ' Porém existem dados do Contas a Receber indispensáveis à integração que não estão cadastrados. '+
            ' Favor entrar em contato com o setor responsável. ','Informação',mtInformation,[mbOK],0);
     Repaint;
  end;

  //Verifica se a empresa utiliza o sistema ABC( Custo Baseado na Atividade)
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT USAABC, USACRESPON, UNIDNEGOC, CODCENTRORESPON '+
                         ' FROM   PARAMGLOBAL '+
                         ' WHERE  IDPESSOA = '+IntToStr(Sistema.idEmpresa));

  qryIntegraBack.Open;
  if qryIntegraBack.IsEmpty then
  begin
    IntegraBack.ObrigaABC           := 'S';
    IntegraBack.ObrigaCRespon       := 'S';
    prmUnidNegoc                    := -1;
    prmCodCentroRespon              := '';
  end
  else
  begin
    if qryIntegraBack.FieldByName('USAABC').AsString = 'N'
    then IntegraBack.ObrigaABC      := 'N'
    else IntegraBack.ObrigaABC      := 'S';

    if qryIntegraBack.FieldByName('USACRESPON').AsString = 'N'
    then IntegraBack.ObrigaCRespon  := 'N'
    else IntegraBack.ObrigaCRespon  := 'S';

    if trim(qryIntegraBack.FieldByName('UnidNegoc').AsString) <> ''
    then prmUnidNegoc               := qryIntegraBack.FieldByName('UnidNegoc').AsInteger
    else prmUnidNegoc               := -1;

    if trim(qryIntegraBack.FieldByName('CODCENTRORESPON').AsString) <> ''
    then prmCodCentroRespon         := qryIntegraBack.FieldByName('CODCENTRORESPON').AsString
    else prmCodCentroRespon         := '-1';
  end;

  qryIntegraBack.Free; 
end;



procedure TfrmPrincipal.mnuContribRecebimentoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmRecebeContribuicaoNovo,TfrmRecebeContribuicaoNovo, False );    // edilaine - SIG33372
end;



procedure TfrmPrincipal.mnuEnviodeContribuicoesClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirFormModal(frmPreparaEnvia, TfrmPreparaEnvia);
end;



procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Screen.OnActiveFormChange := MudaCaptionFundacao;
end;



procedure TfrmPrincipal.mnuContribuicoesParticipClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  // edilaine - SIG36752 - inicio
  {AbrirFormModal(frmCadContribParticipante,TfrmCadContribParticipante);}

  frmCadContribParticipante := TfrmCadContribParticipante.Create(Application);
  try
     if TfrmCadContribParticipante(frmCadContribParticipante).FormStyle <> fsNormal then
     begin
       TfrmCadContribParticipante(frmCadContribParticipante).FormStyle := fsNormal;
       TfrmCadContribParticipante(frmCadContribParticipante).Visible := false;
     end;

     with frmCadContribParticipante do
     begin
       bAcessoViaMenu := true;
     end;
     frmCadContribParticipante.ShowModal;
  finally
     frmCadContribParticipante.Free;
  end;
  // edilaine - SIG36752 - fim

end;



procedure TfrmPrincipal.mnuCalcReservaPartClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm( frmCalculaReservaPart,TfrmCalculaReservaPart, False);
end;



procedure TfrmPrincipal.mnuContribControleClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCtrlInterface,TfrmCtrlInterface, False);
end;



procedure TfrmPrincipal.AlimentaoManualdeReservasColetivaClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AlimentaReserva('COLETIVA', False);
end;



procedure TfrmPrincipal.mnuAlimentacaodeReservasParticipanteClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AlimentaReserva('PARTICIPANTE', False);
end;



procedure TfrmPrincipal.mnuConsReservaColetivaClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  MontaSelectPatro.Executar;

  if (MontaSelectPatro.ValoresChave.Count > 0) and (MontaSelectPatro.ValoresChave[0] <> '') then
  begin
     ConsultaReserva( MontaSelectPatro.ValoresChave[1],
                      '1',
                      MontaSelectPatro.ValoresChave[1],
                      MontaSelectPatro.ValoresChave[3],
                      '',
                      MontaSelectPatro.ValoresChave[0],
                      MontaSelectPatro.ValoresChave[2],
                      'COLETIVA');
  end;
end;



procedure TfrmPrincipal.mnuConsReservaPartClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AlimentaReserva('PARTICIPANTE',True);
end;



procedure TfrmPrincipal.mnuEstatisticasClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmConsEstatDivergContrib,TfrmConsEstatDivergContrib, False);
end;



procedure TfrmPrincipal.mnuTratamentodeDivergenciasClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirFormModal(frmDivergContrib, TfrmDivergContrib);
end;



procedure TfrmPrincipal.mnuReajustedeSalariodeManutencaoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmReajustaSalarioMantido,TfrmReajustaSalarioMantido, False);
end;



procedure TfrmPrincipal.AbreFormEventoDM;
begin
  CriaDataModule; 

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) ); 
  qryAux.Open;

  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  Application.CreateForm(TfrmEventoDemissaoManutContrib, frmEventoDemissaoManutContrib);

  frmEventoDemissaoManutContrib.Caption := qryAux.FieldByName('NOME').AsString;

  if sFlgInterno = 'PD' then
    frmEventoDemissaoManutContrib.HelpContext := 160018
  else
    frmEventoDemissaoManutContrib.HelpContext := 160016;

  frmEventoDemissaoManutContrib.ShowModal;
end;



procedure TfrmPrincipal.AbreFormEventoDS;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) ); 

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  Application.CreateForm(TfrmEventoDemissaoManutSaldo, frmEventoDemissaoManutSaldo);
  frmEventoDemissaoManutSaldo.Caption     := qryAux.FieldByName('NOME').AsString;
  frmEventoDemissaoManutSaldo.HelpContext := 160017; 
  frmEventoDemissaoManutSaldo.ShowModal;
end;



procedure TfrmPrincipal.AbreFormEventoMP;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  Application.CreateForm(TfrmEventoManutParcial, frmEventoManutParcial);
  frmEventoManutParcial.Caption     := qryAux.FieldByName('NOME').AsString;
  frmEventoManutParcial.HelpContext := 160007;
  frmEventoManutParcial.ShowModal;
end;



procedure TfrmPrincipal.AbreFormEventoCI;
begin
  CriaDataModule;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) );

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  Application.CreateForm(TfrmEventoRegInadimplencia, frmEventoRegInadimplencia);
  frmEventoRegInadimplencia.Caption     := qryAux.FieldByName('NOME').AsString;
  frmEventoRegInadimplencia.HelpContext := 160027;
  frmEventoRegInadimplencia.Show;
end;



procedure TfrmPrincipal.AbreFormEventoRI;
begin
  CriaDataModule;

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) ); 

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  Application.CreateForm(TfrmEventoRegInadimplencia, frmEventoRegInadimplencia);
  frmEventoRegInadimplencia.Caption     := qryAux.FieldByName('NOME').AsString;
  frmEventoRegInadimplencia.HelpContext := 160026; 
  frmEventoRegInadimplencia.Show;
end;



procedure TfrmPrincipal.AbreFormEventoTR;
begin
  CriaDataModule;

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) ); 

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  Application.CreateForm(TfrmEventoTransfReserva, frmEventoTransfReserva);
  frmEventoTransfReserva.Caption      := qryAux.FieldByName('NOME').AsString;
  frmEventoTransfReserva.HelpContext  := 160031; 
  frmEventoTransfReserva.ShowModal;
end;



procedure TfrmPrincipal.AbreFormDesfazerEvento;
begin
  CriaDataModule;

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) ); 

  qryAux.Open;
  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  Application.CreateForm(TfrmDesfazerEvento, frmDesfazerEvento);
  frmDesfazerEvento.Caption := 'Retorno - ' + qryAux.FieldByName('NOME').AsString;

  if sFlgInterno = 'AF' then
    frmDesfazerEvento.HelpContext := 160008
  else
    if sFlgInterno = 'AR' then
      frmDesfazerEvento.HelpContext := 160009
    else
      if sFlgInterno = 'CI' then
        frmDesfazerEvento.HelpContext := 160027
      else
        frmDesfazerEvento.HelpContext := 160028;

  frmDesfazerEvento.ShowModal;
end;



procedure TfrmPrincipal.AbreFormProrrogarEvento;
begin
  CriaDataModule;

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME, FLGINTERNO FROM EVENTOGERADOR ' +
                 ' WHERE  IDEVENTOGERADOR = ' + copy(TMenuItem(Sender).Name, 2, Length(TMenuItem(Sender).Name))+
                 ' AND    IDFUNDACAO      = '+IntToStr(iIdFundacao) ); 
  qryAux.Open;

  sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
  sFlgInterno      := qryAux.FieldByName('FLGINTERNO').AsString;

  Application.CreateForm(TfrmEventoProrrogacao, frmEventoProrrogacao);
  frmEventoProrrogacao.Caption := 'Prorrogação do Evento - ' + qryAux.FieldByName('NOME').AsString;
  frmEventoProrrogacao.ShowModal;
end;




procedure TfrmPrincipal.MontaMenu;
var
  NovoItem, ItemAtual : TMenuItem;
  iCont               : integer;
  ComponentAtual      : TComponent;
begin
  // -----------------------------------------------------------------------------------------------
  // Monta Menu Manutenção Parcial - MP
  // -----------------------------------------------------------------------------------------------
  ComponentAtual := FindComponent(mnu.Items[indNivelEvento].Items[indNivelEventoMP].Name);

  if (ComponentAtual as TMenuItem).Enabled then
  begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                   ' WHERE FLGINTERNO = ''MP'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' ORDER BY NOME ');
    qryAux.Open;
    qryAux.First;
    iCont := 0;

    while not(qryAux.EOF) do
    begin
      NovoItem          := TMenuItem.Create(Self);
      NovoItem.Caption  := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name     := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick  := AbreFormEventoMP;

      mnu.Items[indNivelEvento].Items[indNivelEventoMP].Insert(iCont, NovoItem);
      Inc(iCont);
      qryAux.Next;
    end;
  end;
  // -----------------------------------------------------------------------------------------------
  // FIM - Monta Menu Manutenção Parcial - MP
  // -----------------------------------------------------------------------------------------------

  // -----------------------------------------------------------------------------------------------
  // Monta Menu Registro de Inadimplência - RI
  // -----------------------------------------------------------------------------------------------
  ComponentAtual := FindComponent(mnu.Items[indNivelEvento].Items[indNivelEventoRI].Name);

  if (ComponentAtual as TMenuItem).Enabled then
  begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                   ' WHERE FLGINTERNO = ''RI'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' ORDER BY NOME ');
    qryAux.Open;
    qryAux.First;
    iCont := 0;

    while not qryAux.EOF do
    begin
      NovoItem          := TMenuItem.Create(Self);
      NovoItem.Caption  := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name     := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick  := AbreFormEventoRI;

      mnu.Items[indNivelEvento].Items[indNivelEventoRI].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
    end;
  end;
  // -----------------------------------------------------------------------------------------------
  // Fim - Monta Menu Registro de Inadimplência - RI
  // -----------------------------------------------------------------------------------------------

  // -----------------------------------------------------------------------------------------------
  // Monta Menu Transferência de Reserva - TR
  // -----------------------------------------------------------------------------------------------
  ComponentAtual := FindComponent(mnu.Items[indNivelEvento].Items[indNivelTransf].Items[indNivelEventoTR].Name);

  if (ComponentAtual as TMenuItem).Enabled then
  begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' SELECT IDEVENTOGERADOR, NOME FROM EVENTOGERADOR ' +
                   ' WHERE FLGINTERNO = ''TR'' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' ORDER BY NOME ');
    qryAux.Open;
    qryAux.First;

    iCont := 0;
    while not qryAux.EOF do
    begin
      NovoItem          := TMenuItem.Create(Self);
      NovoItem.Caption  := qryAux.FieldByName('NOME').AsString;
      NovoItem.Name     := 'A' + qryAux.FieldByName('IDEVENTOGERADOR').AsString;
      NovoItem.OnClick  := AbreFormEventoTR;

      mnu.Items[indNivelEvento].Items[indNivelTransf].Items[indNivelEventoTR].Insert(iCont, NovoItem);

      Inc(iCont);
      qryAux.Next;
    end;
  end;
  // -----------------------------------------------------------------------------------------------
  // Fim - Monta Menu Transferência de Reserva - TR
  // -----------------------------------------------------------------------------------------------
end;



procedure TfrmPrincipal.HistricodeMovimentaodeReservas1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmConsHistMovReserva,TfrmConsHistMovReserva, False);
end;



procedure TfrmPrincipal.RegistrodeEventos1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmConsEventosPrev,TfrmConsEventosPrev, False);
end;



procedure TfrmPrincipal.mnuContribEstimativaClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmSimulaContrib, TfrmSimulaContrib, False);
end;



procedure TfrmPrincipal.CancelarEventoRegistrado1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCancelaEvento, TfrmCancelaEvento, False);
end;



procedure TfrmPrincipal.mnuControleIndividualContribClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmControleIndivContrib, TfrmControleIndivContrib, False);
end;



procedure TfrmPrincipal.CancelamentodeCobranasVencidas1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCancelaBoleta, TfrmCancelaBoleta, False);
end;


procedure TfrmPrincipal.EmissodoCertificadodeInscrio1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmParamRelCertificadoPre, TfrmParamRelCertificadoPre, False);
end;



procedure TfrmPrincipal.EntradaManualdeContribuies1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadHstContribuicao, TfrmCadHstContribuicao, False);
end;



procedure TfrmPrincipal.mnuAtualizarSaldosaReceberClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmBaixaContribCAR, TfrmBaixaContribCAR, False);
end;



procedure TfrmPrincipal.TratamentodeContribuiesnoIdentificadas1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmGeraContnId, TfrmGeraContnId, False);
end;



procedure TfrmPrincipal.Gerararquivoparaemisso1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmPRelExtPoup, TfrmPRelExtPoup, False);
end;



procedure TfrmPrincipal.Analise1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmAnaliseRetroLote,TfrmAnaliseRetroLote, False);
end;



procedure TfrmPrincipal.mnuBenefRetroAnaliseClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmAnaliseRetroLote,TfrmAnaliseRetroLote, False);
end;



procedure TfrmPrincipal.ParcelamentodeDvida1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;

  bCompraCarencia   := False;
  bParcelaCarencia  := False;

  AbrirForm(frmParcelamento, TfrmParcelamento, False);
  frmParcelamento.caption := 'Parcelamento de dívida de contribuição';
end;



procedure TfrmPrincipal.RegistrodeOperaes1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  FrmConsLogTotalPREV.ConsultaLogTotalPrev(sistema.idmodulo);
end;



procedure TfrmPrincipal.ConsultadeDocumentosdoCAR1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmConsDOCAlimReserva, TfrmConsDOCAlimReserva, False);
end;



procedure TfrmPrincipal.VerificaodeInconsistncias1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmVerificacaoInconsistencia, TfrmVerificacaoInconsistencia, False);
end;



procedure TfrmPrincipal.mnuContribBaixaContribIncentivoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmBaixaContribPIDPIA, TfrmBaixaContribPIDPIA, False);
end;



procedure TfrmPrincipal.mnuContribCompraCarenciaClick(Sender: TObject);
begin
  inherited;

  CriaDataModule;

  bCompraCarencia  := True;
  bParcelaCarencia := True;

  AbrirForm(frmParcelamento, TfrmParcelamento, False);
  frmParcelamento.caption := 'Compra de Carência';
end;



procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
var
  X, Y, Z, NumItems, NumSubItens :Integer;
begin
  inherited;

  if not(Sistema.FezLogin) then Exit;

  stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

  try
    if Sistema.MudouEmpresa then
    begin
      ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);
    end;

    Verifica_Situacao_Empresa;

    iIdFundacao      := Sistema.IdEmpresa;
    iIdFundacaoAtual := Sistema.IdEmpresa;

    prmNumTentativasSalario    := 36;

    LeParam('BaseDados', True);

    MudaCaptionFundacao(Sender);

    for X:= 0 to mnuEventos.count - 1 do
    begin
      NumItems := mnuEventos.Items[x].Count - 1;
      for y:= NumItems downto 0 do
      begin
        if (mnuEventos.Items[x].Items[y].Name  <> 'mnuEventoTransfReserva') and
           (mnuEventos.Items[x].Items[y].Name  <> 'mnuEventoTransfPlano') and
           (mnuEventos.Items[x].Items[y].Name  <> 'mnuEventoTransfPatro')
        then mnuEventos.Items[x].Items[y].Free else
        begin
          NumSubItens := mnuEventos.Items[x].Items[y].Count-1;
          for z := NumSubItens downto 0 do
          begin
            mnuEventos.Items[x].Items[y].Items[z].Free;
          end;
        end;
      end;
    end;

  finally
    MontaMenu;
    MontaSelectPatro.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
    MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
  end;
end;

procedure TfrmPrincipal.MnuConsPart_PadraoClick(Sender: TObject);
var
  ConsPart1: TConsPart;
begin
   inherited;
   try
      Application.CreateForm(TconsPart, Conspart1);
      ConsPart1.sIdPessoa    := '0';
      ConsPart1.sIdPessjur   := '0';
      ConsPart1.sIdPlanoprev := '0';
      ConsPart1.sSeqProposta := '0';
      ConsPart1.DataBaseName := 'BaseDados';
      ConsPart1.MostraConsulta;
   finally
      // ELS SOL 175120 Kintana 1594021
      //FreeAndNil(Conspart1);
   end;
end;

procedure TfrmPrincipal.mnuContribRetroClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  prmMenuChamadorRetroativo := 'C';
  AbrirFormModal(frmRetroativoPrev, TfrmRetroativoPrev);
end;



procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  inherited;
  sTipoTelaBenef    := '';
end;

procedure TfrmPrincipal.mnuRubricas1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmConsRubricas, TfrmConsRubricas, False);
end;

procedure TfrmPrincipal.AcertodoHistricodeReservas1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmAcertaHistMovreserva,TfrmAcertaHistMovReserva, False);
end;

procedure TfrmPrincipal.mnuAtualizaReservaPorIndiceClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmAtualizaPorIndice,TfrmAtualizaPorIndice, False);
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case IdReports of
    3231:
      FrmPreviewReports := TfrmPRelHisFuncionalMT.Create(Self);
  else
    FrmPreviewReports := nil;
  end;
    inherited;
end;



procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject; IdReports: Integer; sFileName: String; var Printed: Boolean);
var
 CmCtrlRpt :TCmCtrlRpt;
begin
  inherited;
  CmCtrlRpt := TCmCtrlRpt.Create;
  try
    Printed := ShowReport(IdReports, CmCtrlRpt);
  finally
    CmCtrlRpt.Free;
  end;
end;

procedure TfrmPrincipal.mnuBenefEntradaManualContribClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadHstContribuicaoBeneficiario, TfrmCadHstContribuicaoBeneficiario, False);
end;



procedure TfrmPrincipal.mnuContribRegularizaInadimplClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmRegularizaInadimplencia,TfrmRegularizaInadimplencia, False);
end;



procedure TfrmPrincipal.ActLoginExecute(Sender: TObject);
var
  X, Y, Z, NumItems, NumSubItens : Integer;
begin
  for X := 0 to mnuEventos.count - 1 do
  begin
    NumItems := mnuEventos.Items[X].Count - 1;

    for y:= NumItems downto 0 do
    begin
      if (mnuEventos.Items[X].Items[Y].Name  <> 'mnuEventoTransfReserva') and
         (mnuEventos.Items[X].Items[Y].Name  <> 'mnuEventoTransfPlano') and
         (mnuEventos.Items[X].Items[Y].Name  <> 'mnuEventoTransfPatro') then
      begin
        mnuEventos.Items[X].Items[Y].Free
      end
      else
      begin
        NumSubItens := mnuEventos.Items[X].Items[Y].Count-1;
        for z := NumSubItens downto 0 do mnuEventos.Items[X].Items[Y].Items[Z].Free;
      end;
    end;
  end;

  inherited;
end;



procedure TfrmPrincipal.mnuConfExtDesligClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(FrmConfSimulaDeslig, TFrmConfSimulaDeslig, False);
end;



procedure TfrmPrincipal.mnuImpExtDesligClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(FrmParamRelExtratoDeslig, TFrmParamRelExtratoDeslig, False);
end;



procedure TfrmPrincipal.ContribuiesporNcleoFamiliar1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmCadContribNucleoFamiliar, TfrmCadContribNucleoFamiliar, False);
end;



procedure TfrmPrincipal.AlteraodePDV1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadAlteraPdv, TfrmCadAlteraPdv, False);
end;




procedure TfrmPrincipal.CriaDataModule;
begin
  inherited;

  // -----------------------------------------------------------------------------------------------
  if dtmRelatorios = nil then
  begin
    Screen.Cursor := crSQLWait;
    try
      Application.ProcessMessages;
      Application.CreateForm(TDtmRelatorios, DtmRelatorios);
      Application.ProcessMessages;
    except
      on E:Exception do
      begin
        MessageDlg('Erro ao criar datamodule "TDtmRelatorios".'+#13+#10+
                   'Mensagem de erro : '+E.Message+#13+#10+
                   'Favor contatar o suporte da CM.', mtError, [mbOK], 0
                  );
        Repaint;
        Application.ProcessMessages;
      end;
    end;
  end;
  // -----------------------------------------------------------------------------------------------

  // -----------------------------------------------------------------------------------------------


  if dtmRelatAdmPrev = nil
   then
     try
       Application.ProcessMessages;
       Application.CreateForm(TDtmRelatAdmPrev, DtmRelatAdmPrev);
       Application.ProcessMessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatAdmPrev".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;
  // -----------------------------------------------------------------------------------------------

  // -----------------------------------------------------------------------------------------------
  if DtmRelRetroRegional = nil
   then
     try
       Application.ProcessMessages;
       Application.CreateForm(TDtmRelRetroRegional, DtmRelRetroRegional);
       Application.ProcessMessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelRetroRegional".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;
  // -----------------------------------------------------------------------------------------------

  // -----------------------------------------------------------------------------------------------
  if DtmRelatorioGerencial = nil
   then
     try
       Application.ProcessMessages;
       Application.CreateForm(TDtmRelatorioGerencial, DtmRelatorioGerencial);
       Application.ProcessMessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatorioGerencial".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;
  // -----------------------------------------------------------------------------------------------

  // -----------------------------------------------------------------------------------------------
  if DtmRelatAdmPrev2 = nil
   then
     try
       Application.ProcessMessages;
       Application.CreateForm(TDtmRelatAdmPrev2, DtmRelatAdmPrev2);
       Application.ProcessMessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatAdmPrev2".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;
  // -----------------------------------------------------------------------------------------------

  // -----------------------------------------------------------------------------------------------
  if dtmRelTempoServicoMT = nil
   then
     try
       Application.ProcessMessages;
       Application.CreateForm(TdtmRelTempoServicoMT, dtmRelTempoServicoMT);
       Application.ProcessMessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TdtmRelTempoServicoMT".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;
  // -----------------------------------------------------------------------------------------------

  // -----------------------------------------------------------------------------------------------
  if dtmRelatEspecificos = nil
   then
     try
       Application.ProcessMessages;
       Application.CreateForm(TdtmRelatEspecificos, dtmRelatEspecificos);
       Application.ProcessMessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TdtmRelatEspecificos".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;
  // -----------------------------------------------------------------------------------------------

  if Screen.Cursor = crSqlWait then Screen.Cursor := crDefault;
end;

procedure TfrmPrincipal.Relatorios1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
end;



procedure TfrmPrincipal.EntradaManualdeRubricas1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadRubricaManualCS, TfrmCadRubricaManualCS,False);
end;      

procedure TfrmPrincipal.Alimentacaodereservasportadas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadContribuicaoPortada, TfrmCadContribuicaoPortada,False);
end;

procedure TfrmPrincipal.mnucalculoIrrfClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCalculoIRRF, TFrmCalculoIRRF,False);
end;

//BRUNO AZEVEDO SOL 107221/5802 KINTANA 1365701
procedure TfrmPrincipal.mnuBaixaContribEmptmoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmRecebeContribEmptmo, TfrmRecebeContribEmptmo,False);
end;
//BRUNO AZEVEDO SOL 107221/5802 KINTANA 1365701

procedure TfrmPrincipal.mnuTransferenciadeSaldodeCota1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmTransferenciaSaldoCota, TfrmTransferenciaSaldoCota,False);
end;

// jrm6 - SOL 164168 KTN 1560241
procedure TfrmPrincipal.ConsultaGeraldeEndereos1Click(Sender: TObject);
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

procedure TfrmPrincipal.mnuClculodoSaldodeContribuiesBitributaoClick(
  Sender: TObject);//DOUGLAS.SIQUEIRA SOL 205322 Kintana 1996527
var

  ConsEnder1: TFrmCalcSalContr;
begin
   inherited;
   try
      Application.CreateForm(TFrmCalcSalContr, ConsEnder1);
      ConsEnder1.show;
   finally
   end;

//  AbrirForm(FrmCalcSalContr, TFrmCalcSalContr,False);

end;


procedure TfrmPrincipal.mnuRequerimentodeResgateComplementaremLoteClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadRequerResgCompLote,TFrmCadRequerResgCompLote, False);//douglas siqueira 180693
end;

procedure TfrmPrincipal.mnuConcessodeResgateComplementaremLoteClick(
  Sender: TObject);
begin
  inherited;
   AbrirForm(FrmCadConcederResgCompLote,TFrmCadConcederResgCompLote, False);//douglas siqueira 180693
end;

// Tadeu Passos SOL 145044 Kintana 966308
procedure TfrmPrincipal.mnuCargadeArquivoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCargaArquivo, TfrmCargaArquivo, False);
end;

procedure TfrmPrincipal.mnuInformacoesParticipanteClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmBeneficioSaldadoFAB, TfrmBeneficioSaldadoFAB, False);
end;
// Tadeu Passos SOL 145044 Kintana 966308

procedure TfrmPrincipal.AlimentaodereservasREPLAN1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAlimReservasReplan, TfrmAlimReservasReplan,False );
end;

//Robson.Andrade SOL 253577-17462 / PPM 956898 Inicio
procedure TfrmPrincipal.Contribuiesp1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmCadContribNucleoFamiliar, TfrmCadContribNucleoFamiliar, False);
end;

procedure TfrmPrincipal.EntradaManualdeContribuiesporNcleoFamiliar1Click(
  Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadHstContribuicaoBeneficiario, TfrmCadHstContribuicaoBeneficiario, False);
end;
//Robson.Andrade SOL 253577-17462 / PPM 956898 Fim

//Helio - SOL Nº 253577/17819 PPM Nº 1104948
procedure TfrmPrincipal.mnuProvisoparaPerdasIndividualClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmProvPerdasIndiv, TFrmProvPerdasIndiv, False);
end;

//Helio - SOL Nº 253577/17819 PPM Nº 1104948
procedure TfrmPrincipal.mnuProvisoparaPerdasemLoteClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmProvPerdasLote, TFrmProvPerdasLote, False);
end;

//Helio - SOL Nº 253577/17819 PPM Nº 1104948
procedure TfrmPrincipal.mnuRelatriodeProvisoparaPerdasClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmFRelProvPerdas, TFrmFRelProvPerdas, False);
end;

//Darivaldo Alencar - SOL 253577/17989  PPM 1198155 - inicio
procedure TfrmPrincipal.ProvisoesAConstituirClick(Sender: TObject);
begin
  inherited;
  AbrirForm(RelProvConst,TRelProvConst,False);

end;
//Darivaldo Alencar - SOL 253577/17989  PPM 1198155 - fim


//edilaine - SIG59881 - inicio
{//Andre Imakawa - SIG 26803 - Inicio
procedure TfrmPrincipal.ContribuiesporPlanoAnalticoClick(Sender: TObject);
begin
  inherited;
  AbrirFormModal(frmParamContribPlano,TfrmParamContribPlano);
end;
//Andre Imakawa - SIG 26803 - Fim
}//edilaine - SIG59881 - inicio

procedure TfrmPrincipal.mnuAlteraodehistricodecontribuioClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmAlteracaoHistoricoContrib,TFrmAlteracaoHistoricoContrib,False);
end;


procedure TfrmPrincipal.mniAlterarSalriodeManutenoeParticipao1Click(
  Sender: TObject);
begin
  inherited;
   AbrirForm(FrmAlteraSalPart,TFrmAlteraSalPart,False);
end;

procedure TfrmPrincipal.mniAlteraodeHistricodeReserva1Click(
  Sender: TObject);
begin
  inherited;
    AbrirForm(FrmAlteraHistMovReserva,TFrmAlteraHistMovReserva,False);
end;


//edilaine SIG114262 : inicio
procedure TfrmPrincipal.mnuCadastrodeContribuiesemLote1Click(
  Sender: TObject);
begin
  inherited;
   AbrirForm(FrmCadContribuicaoLote,TFrmCadContribuicaoLote,False);
end;
//edilaine SIG114262 : fim

procedure TfrmPrincipal.mniAlteraodeHistoricodeContribuicaoEmAtraso1Click(
  Sender: TObject);
begin
  inherited;
    AbrirForm(FrmHistoricoDeContribuicaoEmAtraso,TFrmHistoricoDeContribuicaoEmAtraso,False);
end;

procedure TfrmPrincipal.mniAssociarContribuicoesParticipantesClick(
  Sender: TObject);
begin
  inherited;
    AbrirForm(FrmAssociarContribuicoesDosParticipantesEmLote,TFrmAssociarContribuicoesDosParticipantesEmLote,False);
end;

initialization
   Sistema.NomeModulo     := 'ContribuicaoPrev';  // Nome do Módulo
   Sistema.IdModulo       := 456;                 // IdModulo cadastrado no SAD
   Sistema.Versao := '3.00.06f';
   Sistema.NomeAplicativo := 'Contribuições Previdenciárias';
   IntegraBack            := TIntegraBack.Create(True,True,True);
   Modulo                 := TModulo.Create;


finalization

   Modulo.Free;
   IntegraBack.Free;


end.
