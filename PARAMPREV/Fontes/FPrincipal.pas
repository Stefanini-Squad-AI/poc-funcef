// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

// Autor(a)   : Edilaine Ferraresi
// Data       : 29/12/2016
// SIG        : 36752
// Descricao  : Equacionamento - inclusao do item mnuTipoContribuicao e
//              mnuFaixasePercentuais
//------------------------------------------------------------------------------
// Autor(a)   : Helio Lima Custodio
// Data       : 13/04/2016
// Pendência  : SOL 253577/18234 PPM 1368001
// Descricao  : Inclusão de mnuContainerContribuicao e mnuAssBenefContrib,
//              mover mnuCadContribuicao para dentro de mnuContainerContribuicao
//------------------------------------------------------------------------------
// Autor(a)   : Helio Lima Custodio
// Data       : 09/11/2015
// Pendência  : SOL 253577/17819 PPM 1104948
// Descricao  : Inclusão de mnuSepAuxEndOrg e mnuFaixaProvPCon
//------------------------------------------------------------------------------
// Autor(a)   : Felipe Azevedo dos Santos
// Data       : 06/03/2013
// Pendência  : SOL 185758 KTN 1743062
// Descricao  : Criação da funcionalidade Auxiliares/Entidade Origem
//------------------------------------------------------------------------------
// Autor(a)   : Eraldo Silva
// Data       : 29/02/2012
// Pendência  : SOL 175120 Kintana 15940219
// Descricao  : CONSULTA GERAL PESSOA Ao consultar alguma matricula no Consulta Geral de
//              Pessoa o sistema fecha a tela automaticamente.
//------------------------------------------------------------------------------
//Autor(a)  : Claudio Faria
//Data      : 28/04/2008
//Pendência : 27602
//Rotina    : mnu
//Descricao : Remoção dos itens de menu que nâo mais utilizados pelo módulo
//------------------------------------------------------------------------------
//Autor(a)  : Augusto
//Data      : 23/01/2008
//Pendência : 27278
//Descricao : Inclusão da incialização do ParamIntegra
//------------------------------------------------------------------------------
//Autor(a)  : Claudio Faria
//Data      : 03/10/2007
//Pendência : 26453
//Rotina    : ---
//Descricao : Correção do erro que ocorria caso não fosse escolhido nenhum Plano qdo solicitado
//------------------------------------------------------------------------------
//Autor(a)  : Claudio Faria
//Data      : 09/05/2007
//Pendência : 25264
//Rotina    : ---
//Descricao : Retirar o botão de Atalho para Cadastros de Pessoa
//------------------------------------------------------------------------------

unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  StdCtrls, TB97, Db, DBTables, Wwquery, Wwdatsrc, wwdblook, Mask, wwdbedit,
  DBCtrls, MontaSelect, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio,
  IvAMulti, IvBinDic, IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts,
  CMApplicationEvents, StdActns, ActnList, ImgList, fcStatusBar,
  SConnect, MConnect, DBClient, UConsPart, uResource, JclFileUtils,
  CMNetUsers, UMensErro, wwstorep;

const
   indNivelParticip = 1;
   indNivelEvento   = 0;

   indNivelEventoIP = 0;
   indNivelEventoRM = 1;
   indNivelEventoMP = 2;
   
   indNivelEventoAF = 4;
   indNivelEventoAR = 5;
   
   indNivelEventoDO = 7;
   indNivelEventoAC = 8;
   indNivelEventoRC = 9;
   indNivelEventoOE = 10;
   
   indNivelEventoDP = 12;
   indNivelEventoDC = 13;
   indNivelEventoDM = 14;
   indNivelEventoDS = 15;
   indNivelEventoPD = 16;
   indNivelEventoRA = 17;
   
   indNivelEventoDA = 19;
   indNivelEventoTS = 20;
   indNivelEventoID = 21;
   indNivelEventoIN = 22;

   
   indNivelEventoAI = 24;
   indNivelEventoBI = 25;

   
   indNivelEventoRI = 27;
   indNivelEventoCI = 28;
   indNivelEventoCP = 29;
   indNivelEventoCD = 30;

   indNivelTransf       = 31;
   indNivelEventoTR     = 0;
   indNivelEventoTP     = 1;
   indNivelEventoTE     = 2;
   

   indNivelEventoFL = 33;
type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuCadMotivo: TMenuItem;
    mnuCadSitPart: TMenuItem;
    mnuPlanPrev: TMenuItem;
    mnuContainerContribuicao: TMenuItem;
    mnuCadPlanPatro: TMenuItem;
    mnuCadPatrocinadora: TMenuItem;
    mnuCadBeneficio: TMenuItem;
    mnuCadSitFunc: TMenuItem;
    N4: TMenuItem;
    mnuCadAuxiliares: TMenuItem;
    mnuCadTpPagtoBenef: TMenuItem;
    mnuCadEventoGerador: TMenuItem;
    mnuCadPeriodicidade: TMenuItem;
    N15: TMenuItem;
    mnuReservaporContribuicao: TMenuItem;
    N18: TMenuItem;
    mnuCadFundacao: TMenuItem;
    mnuCadReservaxPlano: TMenuItem;
    mnuCadSitPartplano: TMenuItem;
    mnuIntegracaocomFinanceiro: TMenuItem;
    mnuReservaporBeneficio: TMenuItem;
    mnuCadPlanPrev: TMenuItem;
    mnuFilial: TMenuItem;
    mnuCadSitDependente: TMenuItem;
    qryAux: TwwQuery;
    mnuContribEventoGerador: TMenuItem;
    Reserva1: TMenuItem;
    N7: TMenuItem;
    PadrodeMovimentao1: TMenuItem;
    Cadastro1: TMenuItem;
    N29: TMenuItem;
    ContribuiodaPatrocinadora1: TMenuItem;
    N30: TMenuItem;
    MontaSelectPart: TMontaSelect;
    MontaSelectPatro: TMontaSelect;
    mnuCadTipodePericulosidadeInsalubridade: TMenuItem;
    mnuCadTipodeBonusTrabalhista: TMenuItem;
    mnuCargosemEmpresasExternas: TMenuItem;
    Alteradores1: TMenuItem;
    N5: TMenuItem;
    mnuDatasCalend: TMenuItem;
    CadastroGeral1: TMenuItem;
    N34: TMenuItem;
    AlteradoresporBenefcio1: TMenuItem;
    ConsPart1: TConsPart;
    SituaesporEventoGerador1: TMenuItem;
    N25: TMenuItem;
    TiposdePDV1: TMenuItem;
    N39: TMenuItem;
    AnodoCalendrio1: TMenuItem;
    ALOR: TMenuItem;
    N31: TMenuItem;
    DotaoInicial1: TMenuItem;
    GerapdeDotaoInicial1: TMenuItem;
    Orgo1: TMenuItem;
    N10: TMenuItem;
    Etiquetas1: TMenuItem;
    mnuEtiqConfigura: TMenuItem;
    mnuEtiqImprime: TMenuItem;
    GruposdeBenefcio1: TMenuItem;
    EvoluoFuncional1: TMenuItem;
    Carreira1: TMenuItem;
    GrupoFuncional1: TMenuItem;
    Nivel1: TMenuItem;
    N20: TMenuItem;
    TipodeFuno1: TMenuItem;
    CadastramentoPCS1: TMenuItem;
    mnuConsCargoFuncao: TMenuItem;
    N36: TMenuItem;
    N1: TMenuItem;
    ParmetrosdeSalriode131: TMenuItem;
    N14: TMenuItem;
    rubricaporeventogerador: TMenuItem;
    Situaes1: TMenuItem;
    N3: TMenuItem;
    mnuCadastroOpcoesTransfPlano: TMenuItem;
    mnuCadOpcoesTransfPlanoCadastro: TMenuItem;
    mnuCadOpcoesTransfPlanoConfiguracao: TMenuItem;
    mnuCadDEPARABeneficios: TMenuItem;
    GeraodeDotaoInicial1: TMenuItem;
    N2: TMenuItem;
    mnuReajustes: TMenuItem;
    RegrasdeReajustedoBenefcio1: TMenuItem;
    RegrasdeReajustedoINSS1: TMenuItem;
    N6: TMenuItem;
    ReajusteSalarial1: TMenuItem;
    N8: TMenuItem;
    mnuCadPCSFuncaoSemGrupo: TMenuItem;
    PCS1: TMenuItem;
    N9: TMenuItem;
    mnuCadPCSReajusteCargos: TMenuItem;
    mnuCadIntegFinancParamCobrancaBanco: TMenuItem;
    N11: TMenuItem;
    mnuCadFinancContabReserva: TMenuItem;
    VinculaoFuncional1: TMenuItem;
    N12: TMenuItem;
    mnuGrauInstruc: TMenuItem;
    TipodeRecebedor1: TMenuItem;
    N16: TMenuItem;
    mnuParamPessoa: TMenuItem;
    N17: TMenuItem;
    RegistrodeOperaes1: TMenuItem;
	mnuMotivoRE: TMenuItem;
    mnuSituaodeHabilitaodeBenefciosdoINSS: TMenuItem;
    N13: TMenuItem;
    mnuEntidadeOrigem: TMenuItem;
    mnuSepAuxEndOrg: TMenuItem;
    mnuFaixaProvPCon: TMenuItem;
    mnuCadContribuicao: TMenuItem;
    mnuAssBenefContrib: TMenuItem;
    mnuTipoContribuicao: TMenuItem;
    mnuFaixasePercentuais: TMenuItem;
    N19: TMenuItem;
    mnuPerfildeInvestimento: TMenuItem;
	
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuCadFundacaoClick(Sender: TObject);
    procedure mnuCadContribuicaoClick(Sender: TObject);
    procedure mnuCadBeneficioClick(Sender: TObject);
    procedure GruposdeBenefcio1Click(Sender: TObject);
    procedure mnuCadPlanPrevClick(Sender: TObject);
    procedure mnuContribEventoGeradorClick(Sender: TObject);
    procedure TiposdePDV1Click(Sender: TObject);
    procedure mnuCadReservaxPlanoClick(Sender: TObject);
    procedure mnuReservaporContribuicaoClick(Sender: TObject);
    procedure mnuReservaporBeneficioClick(Sender: TObject);
    procedure PadrodeMovimentao1Click(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure mnuFilialClick(Sender: TObject);
    procedure mnuCadPlanPatroClick(Sender: TObject);
    procedure Orgo1Click(Sender: TObject);
    procedure ALORClick(Sender: TObject);
    procedure ContribuiodaPatrocinadora1Click(Sender: TObject);
    procedure ParmetrosdeSalriode131Click(Sender: TObject);
    procedure CadastramentoPCS1Click(Sender: TObject);
    procedure GrupoFuncional1Click(Sender: TObject);
    procedure Nivel1Click(Sender: TObject);
    procedure Carreira1Click(Sender: TObject);
    procedure TipodeFuno1Click(Sender: TObject);
    procedure mnuCargosemEmpresasExternasClick(Sender: TObject);
    procedure CadastroGeral1Click(Sender: TObject);
    procedure Alteradores1Click(Sender: TObject);
    procedure AlteradoresporBenefcio1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure AnodoCalendrio1Click(Sender: TObject);
    procedure mnuDatasCalendClick(Sender: TObject);
    procedure mnuCadMotivoClick(Sender: TObject);
    procedure mnuCadPeriodicidadeClick(Sender: TObject);
    procedure mnuCadEventoGeradorClick(Sender: TObject);
    procedure mnuCadTpPagtoBenefClick(Sender: TObject);
    procedure mnuCadSitFuncClick(Sender: TObject);
    procedure mnuCadSitPartClick(Sender: TObject);
    procedure mnuCadSitPartplanoClick(Sender: TObject);
    procedure mnuCadSitDependenteClick(Sender: TObject);
    procedure SituaesporEventoGerador1Click(Sender: TObject);
    procedure mnuCadTipodePericulosidadeInsalubridadeClick(
      Sender: TObject);
    procedure mnuCadTipodeBonusTrabalhistaClick(Sender: TObject);
    procedure rubricaporeventogeradorClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnuCadOpcoesTransfPlanoCadastroClick(Sender: TObject);
    procedure mnuCadOpcoesTransfPlanoConfiguracaoClick(Sender: TObject);
    procedure mnuCadDEPARABeneficiosClick(Sender: TObject);
    procedure ReajusteSalarial1Click(Sender: TObject);
    procedure RegrasdeReajustedoBenefcio1Click(Sender: TObject);
    procedure RegrasdeReajustedoINSS1Click(Sender: TObject);
    procedure GeraodeDotaoInicial1Click(Sender: TObject);
    procedure mnuCadPCSFuncaoSemGrupoClick(Sender: TObject);
    procedure PCS1Click(Sender: TObject);
    procedure mnuCadPCSReajusteCargosClick(Sender: TObject);
    procedure mnuCadIntegFinancParamCobrancaBancoClick(Sender: TObject);
    procedure mnuCadFinancContabReservaClick(Sender: TObject);
    procedure VinculaoFuncional1Click(Sender: TObject);
    procedure mnuGrauInstrucClick(Sender: TObject);
    procedure TipodeRecebedor1Click(Sender: TObject);
    procedure mnuParamPessoaClick(Sender: TObject);
    procedure RegistrodeOperaes1Click(Sender: TObject);
    procedure MnuConsPart_PadraoClick(Sender: TObject);
    procedure mnuConsCargoFuncaoClick(Sender: TObject);
	procedure mnuMotivoREClick(Sender: TObject);
    procedure mnuSituaodeHabilitaodeBenefciosdoINSSClick(Sender: TObject);
    procedure mnuEntidadeOrigemClick(Sender: TObject);
    procedure mnuFaixaProvPConClick(Sender: TObject);
    procedure mnuAssBenefContribClick(Sender: TObject);
    procedure mnuTipoContribuicaoClick(Sender: TObject);
    procedure mnuFaixasePercentuaisClick(Sender: TObject);
    procedure mnuPerfildeInvestimentoClick(Sender: TObject);

  private
    { Private declarations }
    procedure verifica_situacao_empresa;
    procedure CriaDataModule;

  public
    { Public declarations }
    liIdPessJurPCS   : longInt;
    sNomePatroPCS    : String;  
    liIdPessJurGrupo : longInt; 
    sNomePatroGrupo  : String;
    liIdPessJurNivel : longInt;
    sNomePatroNivel  : String;

    liIdPessJurEvolFunc : longInt;
    sNomePatroEvolFunc  : String;

    procedure MudaCaptionFundacao(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uAutorizacao, FTelaAut, USistema, UModulo, UIntegraBack, UAdmPrev,
     FCadFundacao, FCadContribuicaoCS, FCadBenefEventoCS,
     FCadGrupoBenef, FCadPlanPrevCS, FAssocContribEventoF, FCadTipoPDV,
     FSolicitaPlano, FCadReservaXPlano, FAssocContribReserva,
     FAssocBenefReserva, FCadMovReservaTree, FCadPatro, FCadFilial,
     FAssocPlanPatro, FCadOrgaosESetores, FCadParamDotacao,
     FMigraDotacaoInicial, FCadParamSal13, FCadPCS,
     FCadGrupoFuncional, FCadNivel, FCadCarreira, FCadTipoFunc,
     FCadCargoExtPCS, FCadIntegracaoPREV, FCadAlteradorContribCS,
     FCadAlteradorBenefCS, FCadCalendPrev, FCalendGeraAno, FCalendDatas,
     fcadmotivo, FCadTpPeriodicidade, FCadEventoGerCS, FCadTipoPagamento,
     FCadSitFunc, FCadSitPart, FCadSitPlano, FCadSitDependente,
     FCadEeventoxSit, FCadTpInsalubridadeCS, FCadTpBonusTrabCS,
     FSolicitaPatro, DRelatorios, DRelatAdmPrev, dRelRetroRegional,
  DRelatGerencial, DRelatAdmPREV2, dRelTempoServicoMT, DRelatEspecificos,
  DRelTransfPlano, FAssocRubricaIndivEvento,
  FParamAPrevCS, FCadParamTransfPlano, FCadConfigTransfPlano,
  FCadConfigBenefTransfPlano, fCadReajBeneficio, FCadReajINSS,
  FCadReajSalPatroCS, FCadFuncaoSemGrupo, FCadItemCalcPCS,
  FReajustaCargosPatro, FCadParamContribBanco, FCadParamReserva,
  FCadVinculacaoFuncional, FCadGrauInstr, FCadTipoRecebedor,
  FCadParamPessoa, FConsLogTotalPREV, FConsCargoFuncao,
     FCadContribPatrocinadoraMT, uCtrlParamIntegra, FCadMotivoRE,
  FHabilitacaoBenefINSS, FCadEntidadeOrigem,
  FCadFaixaPerdContrib, //Helio - SOL Nº 253577/17819 PPM Nº 1104948
  FAssociaBenefContrib, FCadTipoContrib, FCadFaixasPercentuais,
  FPerfilInvestimento; //Helio - SOL Nº 253577/18234 PPM Nº 1368001

{$R *.DFM}


procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  inherited;
  sTipoTelaBenef    := '';
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Sistema.IdModulo := 487;
  Screen.OnActiveFormChange := MudaCaptionFundacao;
end;

procedure TfrmPrincipal.MudaCaptionFundacao(Sender: TObject);
var i, iPos, iTam, iTamFrase : word;
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

procedure TfrmPrincipal.CriaDataModule;
begin
  inherited;
  If DtmRelatorios = nil
   Then Begin
     Screen.Cursor := crSQLWait;
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatorios, DtmRelatorios);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatorios".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;
   End;

  If DtmRelatAdmPrev = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatAdmPrev, DtmRelatAdmPrev);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatAdmPrev".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelRetroRegional = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelRetroRegional, DtmRelRetroRegional);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelRetroRegional".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelatorioGerencial = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatorioGerencial, DtmRelatorioGerencial);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatorioGerencial".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelatAdmPrev2 = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatAdmPrev2, DtmRelatAdmPrev2);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatAdmPrev2".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If dtmRelTempoServicoMT = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TdtmRelTempoServicoMT, dtmRelTempoServicoMT);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TdtmRelTempoServicoMT".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If dtmRelatEspecificos = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TdtmRelatEspecificos, dtmRelatEspecificos);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TdtmRelatEspecificos".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelTransfPlano = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelTransfPlano, DtmRelTransfPlano);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelTransfPlano".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If Screen.Cursor = crSqlWait
   Then Screen.Cursor := crDefault;
end;

procedure TfrmPrincipal.mnuCadFundacaoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadFundacao,TfrmCadFundacao,False );
end;

procedure TfrmPrincipal.mnuCadContribuicaoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadContribuicaoCS,TfrmCadContribuicaoCS,False);
end;

procedure TfrmPrincipal.mnuCadBeneficioClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadBenefEventoCS,TfrmCadBenefEventoCS,False)
end;

procedure TfrmPrincipal.GruposdeBenefcio1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadGrupoBenef, TfrmCadGrupoBenef, False);
end;

procedure TfrmPrincipal.mnuCadPlanPrevClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadPlanPrevCS,TfrmCadPlanPrevCS,False);
end;

procedure TfrmPrincipal.mnuContribEventoGeradorClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmAssocContribEventoF,TfrmAssocContribEventoF,False)
end;

procedure TfrmPrincipal.TiposdePDV1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadTipoPDV, TfrmCadTipoPDV, False);
end;

// entra rubricas para compor salário

procedure TfrmPrincipal.mnuCadReservaxPlanoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  Application.CreateForm(TfrmSolicitaPlano, frmSolicitaPlano);
  frmSolicitaPlano.ShowModal;
  frmSolicitaPlano.Free;

  If (sIdPlano = '') Or (sNomePlano = '') Then Exit; 

  AbrirForm(frmCadReservaXPlano,TfrmCadReservaXPlano,False);
end;

procedure TfrmPrincipal.mnuReservaporContribuicaoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  Application.CreateForm(TfrmSolicitaPlano, frmSolicitaPlano);
  frmSolicitaPlano.ShowModal;
  frmSolicitaPlano.Free;

  If (sIdPlano = '') Or (sNomePlano = '') Then Exit;

  AbrirFormModal( frmAssocContribReserva,TfrmAssocContribReserva);
end;

procedure TfrmPrincipal.mnuReservaporBeneficioClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  Application.CreateForm(TfrmSolicitaPlano, frmSolicitaPlano);
  frmSolicitaPlano.ShowModal;
  frmSolicitaPlano.Free;

  If (sIdPlano = '') Or (sNomePlano = '') Then Exit; 

  if sIdPlano <> '' then
     AbrirFormModal( frmAssocBenefReserva,TfrmAssocBenefReserva);
end;

procedure TfrmPrincipal.RegrasdeReajustedoBenefcio1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;

  Application.CreateForm(TfrmSolicitaPlano, frmSolicitaPlano);
  frmSolicitaPlano.ShowModal;
  frmSolicitaPlano.Free;

  If (sIdPlano = '') Or (sNomePlano = '') Then Exit;

  if sIdPlano <> '' then
     AbrirForm(frmCadReajBeneficio,TfrmCadReajBeneficio,False);
end;

procedure TfrmPrincipal.PadrodeMovimentao1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadMovReservaTree,TfrmCadMovReservaTree,False);
end;

// Entra Associação de Reservas (Participantes)

procedure TfrmPrincipal.Cadastro1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm( frmCadPatro, TfrmCadPatro, False );
end;

procedure TfrmPrincipal.mnuFilialClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadFilial,TfrmCadFilial,False);
end;

procedure TfrmPrincipal.mnuCadPlanPatroClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmAssocPlanPatro,TfrmAssocPlanPatro,False);
end;     

procedure TfrmPrincipal.Orgo1Click(Sender: TObject);
begin
  inherited;

  CriaDataModule; 
  Application.CreateForm(TfrmSolicitaPatro, frmSolicitaPatro);
  frmSolicitaPatro.ShowModal;

  liIdPessJurNivel:=frmSolicitaPatro.iIdPatroSolicit;
  sNomePatroNivel:=frmSolicitaPatro.sNomePatroSolicit;
  
  frmSolicitaPatro.Free;

  if liIdPessjurNivel > 0 then
     AbrirForm( frmCadOrgaosESetores, TfrmCadOrgaosESetores,False); 
end;

procedure TfrmPrincipal.ALORClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadParamDotacao, TfrmCadParamDotacao, False);
end;

procedure TfrmPrincipal.ContribuiodaPatrocinadora1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirFormModal(frmCadContribPatrocinadoraMT, TfrmCadContribPatrocinadoraMT);
end;

procedure TfrmPrincipal.ParmetrosdeSalriode131Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(FrmCadParamSal13, TFrmCadParamSal13, False);
end;

procedure TfrmPrincipal.CadastramentoPCS1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  Application.CreateForm(TfrmSolicitaPatro, frmSolicitaPatro);
  frmSolicitaPatro.ShowModal;

  liIdPessJurPCS:=frmSolicitaPatro.iIdPatroSolicit;
  sNomePatroPCS:=frmSolicitaPatro.sNomePatroSolicit;

  frmSolicitaPatro.Free;

  if liIdPessjurPCS > 0 then
     AbrirForm( frmCadPCS, TfrmCadPCS, False);
end;

procedure TfrmPrincipal.GrupoFuncional1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  Application.CreateForm(TfrmSolicitaPatro, frmSolicitaPatro);
  frmSolicitaPatro.ShowModal;

  liIdPessJurGrupo:=frmSolicitaPatro.iIdPatroSolicit;
  sNomePatroGrupo:=frmSolicitaPatro.sNomePatroSolicit;

  frmSolicitaPatro.Free;

  if liIdPessjurGrupo > 0 then
     AbrirForm( frmCadGrupoFuncional, TfrmCadGrupoFuncional, False);
end;

procedure TfrmPrincipal.Nivel1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  Application.CreateForm(TfrmSolicitaPatro, frmSolicitaPatro);
  frmSolicitaPatro.ShowModal;

  liIdPessJurNivel:=frmSolicitaPatro.iIdPatroSolicit;
  sNomePatroNivel:=frmSolicitaPatro.sNomePatroSolicit;

  frmSolicitaPatro.Free;

  if liIdPessjurNivel > 0 then
     AbrirForm( frmCadNivel, TfrmCadNivel,False);
end;

procedure TfrmPrincipal.Carreira1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmCadCarreira, TfrmCadCarreira, False);
end;

procedure TfrmPrincipal.TipodeFuno1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm( frmCadTipoFunc, TfrmCadTipoFunc, False);

end;

procedure TfrmPrincipal.mnuCargosemEmpresasExternasClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  Application.CreateForm(TfrmSolicitaPatro, frmSolicitaPatro);
  frmSolicitaPatro.ShowModal;

  liIdPessJurEvolFunc  := frmSolicitaPatro.iIdPatroSolicit;
  sNomePatroEvolFunc   := frmSolicitaPatro.sNomePatroSolicit;

  frmSolicitaPatro.Free;

  if liIdPessjurEvolFunc > 0 then
     AbrirForm( frmCadCargoExtPCS, TfrmCadCargoExtPCS, False);
end;

procedure TfrmPrincipal.CadastroGeral1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  if (IntegraBack.Contabilidade = 'N') And (IntegraBack.Financeiro = 'N') Then 
  Begin
     if MsgDlg(' O Sistema de Administração Previdenciária não está integrado com os sistemas de '+
               ' Contabilidade, Contas a Pagar e Contas a Receber. '+
               ' Deseja abrir a tela assim mesmo ? ','Confirmação ',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
     then Exit;
  end;

  AbrirFormModal(frmCadIntegracaoPREV,TfrmCadIntegracaoPREV);
end;

procedure TfrmPrincipal.Alteradores1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmCadAlteradorContribCS, TfrmCadAlteradorContribCS,False);
end;

procedure TfrmPrincipal.AlteradoresporBenefcio1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadAlteradorBenefCS, TfrmCadAlteradorBenefCS, False);
end;

procedure TfrmPrincipal.N5Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm( frmCadCalendPrev, TfrmCadCalendPrev,False);
end; 

procedure TfrmPrincipal.AnodoCalendrio1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCalendGeraAno, TfrmCalendGeraAno, False);
end;

procedure TfrmPrincipal.mnuDatasCalendClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm( frmCalendDatas, TfrmCalendDatas, False);
end;

procedure TfrmPrincipal.mnuCadMotivoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadMotivo,TfrmCadMotivo,False);
end;

procedure TfrmPrincipal.mnuCadPeriodicidadeClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadTpPeriodicidade,TfrmCadTpPeriodicidade,False);
end;

procedure TfrmPrincipal.mnuCadEventoGeradorClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(FrmCadEventoGerCS,TFrmCadEventoGerCS,False);
end;

procedure TfrmPrincipal.mnuCadTpPagtoBenefClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadTipoPagamento,TfrmCadTipoPagamento,False);
end;

procedure TfrmPrincipal.mnuCadSitFuncClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadSitFunc,TfrmCadSitFunc,False);
end;

procedure TfrmPrincipal.mnuCadSitPartClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadSitPart,TfrmCadSitPart,False);
end;

procedure TfrmPrincipal.mnuCadSitPartplanoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadSitPlano,TfrmCadSitPlano,False);
end;

procedure TfrmPrincipal.mnuCadSitDependenteClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadSitDependente,TfrmCadSitDependente,False);
end;

procedure TfrmPrincipal.SituaesporEventoGerador1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadEeventoxSit, TfrmCadEeventoxSit, False);
end;

procedure TfrmPrincipal.mnuCadTipodePericulosidadeInsalubridadeClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadTpInsalubridadeCS, TfrmCadTpInsalubridadeCS, False);
end;

procedure TfrmPrincipal.mnuCadTipodeBonusTrabalhistaClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadTpBonusTrabCS, TfrmCadTpBonusTrabCS, False);
end;

procedure TfrmPrincipal.rubricaporeventogeradorClick(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmAssocRubricaIndivEvento,TfrmAssocRubricaIndivEvento,False)
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
   inherited;

   if not Sistema.FezLogin then Exit;

   stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

   try
      iIdFundacao      := Sistema.IdEmpresa;
      iIdFundacaoAtual := Sistema.IdEmpresa;

      //CPrev - 27278 - Inicio
      if Sistema.MudouEmpresa then
      begin
        ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);
      end;
      //CPrev - 27278 - Fim

      Verifica_Situacao_Empresa;

      LeParam('BaseDados', True);

      MudaCaptionFundacao(Sender);

   finally
      MontaSelectPatro.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
      MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
   end;
end;

procedure TfrmPrincipal.verifica_situacao_empresa;
var
  qryIntegraBack : TQuery;
begin
  // Verificar se Previdenciario com Contabilidade
  qryIntegraBack := TQuery.Create(Application);
  qryIntegraBack.DataBaseName := 'Basedados';
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT FLGINTCONTAB, FLGINTCPAGARPREV, FLGINTCRECEBERPR '+
                         ' FROM   PARAMAPREV ');
  qryIntegraBack.open;

  if not (qryIntegraBack.IsEmpty)
  then begin
     if qryIntegraBack.FieldbyName('FLGINTCONTAB').AsInteger = 1
     then IntegraBack.Contabilidade := 'S'
     else IntegraBack.Contabilidade := 'N';

     if (qryIntegraBack.FieldbyName('FLGINTCPAGARPREV').AsInteger = 1) or
        (qryIntegraBack.FieldbyName('FLGINTCRECEBERPR').AsInteger = 1)
     then IntegraBack.Financeiro  := 'S'
     else IntegraBack.Financeiro := 'N';
  end
  else begin
     IntegraBack.Contabilidade := 'N';
     IntegraBack.Financeiro := 'N';
  end;

  if Sistema.IdEmpresa <= 0
  then begin
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
  if not (qryIntegraBack.IsEmpty)
  then begin
      IntegraBack.Plano        := qryIntegraBack.FieldbyName('PLANO').AsInteger;
      IntegraBack.MascaraPlano := qryIntegraBack.FieldbyName('MASCARA').AsString;
  end
  else begin
     IntegraBack.Plano := 0;
     IntegraBack.MascaraPlano := '';
  end; 

  if (IntegraBack.Contabilidade = 'S') and
     ( (IntegraBack.Plano <= 0) or (IntegraBack.MascaraPlano = ''))
  then begin
     MsgDlg(' O Sistema de Administração Previdenciária está integrado com o Sistema de Contabilidade. '+
            ' Porém existem dados da contabilidade indispensáveis à integração que não estão cadastrados. '+
            ' Favor entrar em contato com o setor responsável. ','Informação',mtInformation,[mbOK],0);
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

  if (not qryIntegraBack.IsEmpty)
  then begin
     IntegraBack.MascaraReceb := qryIntegraBack.FieldbyName('MASCARAREC').AsString;
     IntegraBack.MascaraDesemb := qryIntegraBack.FieldbyName('MASCARAPAG').AsString;
  end
  else begin
     IntegraBack.MascaraReceb := '';
     IntegraBack.MascaraDesemb := '';
  end;

  if (IntegraBack.Financeiro = 'S') and (Trim(IntegraBack.MascaraDesemb) = '')
  then begin
     MsgDlg(' O Sistema de Administração Previdenciária está integrado com o Sistema de Contas a Receber. '+
            ' Porém existem dados do Contas a Receber indispensáveis à integração que não estão cadastrados. '+
            ' Favor entrar em contato com o setor responsável. ','Informação',mtInformation,[mbOK],0);
  end;
  //Verifica se a empresa utiliza o sistema ABC( Custo Baseado na Atividade)
  qryIntegraBack.Close;
  qryIntegraBack.SQL.Clear;
  qryIntegraBack.SQL.Add(' SELECT USAABC, USACRESPON, UNIDNEGOC, CODCENTRORESPON '+
                         ' FROM   PARAMGLOBAL '+
                         ' WHERE  IDPESSOA = '+IntToStr(Sistema.idEmpresa));
  qryIntegraBack.open;
  if qryIntegraBack.IsEmpty
  then begin
     IntegraBack.ObrigaABC := 'S';
     IntegraBack.ObrigaCRespon := 'S';
     prmUnidNegoc := -1;
     prmCodCentroRespon := '';
  end
  else begin
     if qryIntegraBack.FieldByName('USAABC').AsString = 'N'
     then IntegraBack.ObrigaABC := 'N'
     else IntegraBack.ObrigaABC := 'S';

     if qryIntegraBack.FieldByName('USACRESPON').AsString = 'N'
     then IntegraBack.ObrigaCRespon := 'N'
     else IntegraBack.ObrigaCRespon := 'S';

     if Trim(qryIntegraBack.FieldByName('UnidNegoc').AsString) <> ''
     then prmUnidNegoc := qryIntegraBack.FieldByName('UnidNegoc').AsInteger
     else prmUnidNegoc := -1;

     if Trim(qryIntegraBack.FieldByName('CODCENTRORESPON').AsString) <> ''
     then prmCodCentroRespon := qryIntegraBack.FieldByName('CODCENTRORESPON').AsString
     else prmCodCentroRespon := '-1';
  end;

  qryIntegraBack.Free;
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmParamAPrevCS,TfrmParamAPrevCS,False);
end;

procedure TfrmPrincipal.mnuCadOpcoesTransfPlanoCadastroClick(
  Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmCadParamTransfPlano,TfrmCadParamTransfPlano,False);
end;

procedure TfrmPrincipal.mnuCadOpcoesTransfPlanoConfiguracaoClick(
  Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm( frmCadConfigTransfPlano,TfrmCadConfigTransfPlano,False);
end;

procedure TfrmPrincipal.mnuCadDEPARABeneficiosClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadConfigBenefTransfPlano,TfrmCadConfigBenefTransfPlano,false);
end;

procedure TfrmPrincipal.RegrasdeReajustedoINSS1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadReajINSS, TfrmCadReajINSS, False);
end;

procedure TfrmPrincipal.ReajusteSalarial1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadReajSalPatroCS, TfrmCadReajSalPatroCS, False);
end;

procedure TfrmPrincipal.GeraodeDotaoInicial1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmMigraDotacaoInicial, TfrmMigraDotacaoInicial, False);
end;

procedure TfrmPrincipal.mnuCadPCSFuncaoSemGrupoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  Application.CreateForm(TfrmSolicitaPatro, frmSolicitaPatro);
  frmSolicitaPatro.ShowModal;

  liIdPessJurGrupo:=frmSolicitaPatro.iIdPatroSolicit;
  sNomePatroGrupo:=frmSolicitaPatro.sNomePatroSolicit;

  frmSolicitaPatro.Free;

  if liIdPessjurGrupo > 0 then
     AbrirForm( frmCadFuncaoSemGrupo, TfrmCadFuncaoSemGrupo, False);
end;

procedure TfrmPrincipal.PCS1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  Application.CreateForm(TfrmSolicitaPatro, frmSolicitaPatro);
  frmSolicitaPatro.ShowModal;

  liIdPessJurPCS:=frmSolicitaPatro.iIdPatroSolicit;
  sNomePatroPCS:=frmSolicitaPatro.sNomePatroSolicit;

  frmSolicitaPatro.Free;

  if liIdPessjurPCS > 0 then
     AbrirForm( frmCadItemCalcPCS, TfrmCadItemCalcPCS,False);
end;

procedure TfrmPrincipal.mnuCadPCSReajusteCargosClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmReajustaCargosPatro,TfrmReajustaCargosPatro,false);
end;

procedure TfrmPrincipal.mnuCadIntegFinancParamCobrancaBancoClick(
  Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadParamContribBanco,TfrmCadParamContribBanco,False);
end;

procedure TfrmPrincipal.mnuCadFinancContabReservaClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadParamReserva, TfrmCadParamReserva,False);
end;

procedure TfrmPrincipal.VinculaoFuncional1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadVinculacaoFuncional, TfrmCadVinculacaoFuncional, False);
end;

procedure TfrmPrincipal.mnuGrauInstrucClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadGrauInstr, TfrmCadGrauInstr, False);
end;

procedure TfrmPrincipal.TipodeRecebedor1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule; 
  AbrirForm(frmCadTipoRecebedor, TfrmCadTipoRecebedor, False);
end;

procedure TfrmPrincipal.mnuParamPessoaClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadParamPessoa, TfrmCadParamPessoa, False);
end;

procedure TfrmPrincipal.RegistrodeOperaes1Click(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  FrmConsLogTotalPREV.ConsultaLogTotalPrev(sistema.idmodulo);
end;

procedure TfrmPrincipal.MnuConsPart_PadraoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TconsPart, ConsPart1);
  Try
    ConsPart1.sIdPessoa := '0';
    ConsPart1.MostraConsulta;
  Finally
    // ELS SOL 175120 Kintana 1594021
    //FreeAndNil(ConsPart1);
  End;
end;

procedure TfrmPrincipal.mnuConsCargoFuncaoClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  Application.CreateForm(TfrmSolicitaPatro, frmSolicitaPatro);
  frmSolicitaPatro.ShowModal;

  liIdPessJurPCS := frmSolicitaPatro.iIdPatroSolicit;
  sNomePatroPCS  := frmSolicitaPatro.sNomePatroSolicit;

  frmSolicitaPatro.Free;

  if liIdPessjurPCS > 0 then
     AbrirForm( frmConsCargoFuncao, TfrmConsCargoFuncao, False);
end;

procedure TfrmPrincipal.mnuMotivoREClick(Sender: TObject);
begin
  inherited;
  CriaDataModule;
  AbrirForm(frmCadmotivore,TfrmCadmotivore,False);
end;

procedure TfrmPrincipal.mnuSituaodeHabilitaodeBenefciosdoINSSClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmHabilitacaoBenefINSS, TFrmHabilitacaoBenefINSS, False);
end;

procedure TfrmPrincipal.mnuEntidadeOrigemClick(Sender: TObject);
begin
  inherited;
  // Felipe Santos SOL 185758 KTN 1743062
  AbrirForm(frmCadEntidadeOrigem, TfrmCadEntidadeOrigem, False);
end;

//Helio - SOL Nº 253577/17819 PPM Nº 1104948
procedure TfrmPrincipal.mnuFaixaProvPConClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadFaixaPerdContrib, TFrmCadFaixaPerdContrib, False);
end;

//Helio - SOL Nº 253577/18234 PPM Nº 1368001
procedure TfrmPrincipal.mnuAssBenefContribClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAssociaBenefContrib,TfrmAssociaBenefContrib,False);
end;

// edilaine - SIG36752 - inicio
procedure TfrmPrincipal.mnuTipoContribuicaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTipoContrib,TfrmCadTipoContrib,False);
end;

procedure TfrmPrincipal.mnuFaixasePercentuaisClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadFaixasPercentuais, TFrmCadFaixasPercentuais, False);
end;
// edilaine - SIG36752 - fim


// Rodrigo Ramos SIG55755
procedure TfrmPrincipal.mnuPerfildeInvestimentoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmPerfilInvestimento, TFrmPerfilInvestimento, False);
end;
//Rodrigo Ramos SIG55755
Initialization
   Sistema.NomeModulo     := 'ParamPrev';    // Nome do Módulo
   Sistema.IdModulo       := 487 ;            // IdModulo cadastrado no SAD
   Sistema.Versao := '3.00.06b';
   Sistema.NomeAplicativo := 'Parametrização Previdenciária';
   Modulo                 := TModulo.Create;
   IntegraBack            := TIntegraBack.Create(True,True,True);
finalization
   Modulo.Free;
end.





