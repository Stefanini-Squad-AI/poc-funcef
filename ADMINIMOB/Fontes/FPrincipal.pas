unit FPrincipal;

{--------------------------------------------------------------------------------
Nº SIG......: 26054
Data........: 26/12/2016
Responsável.: Michelle Suellyn Mota
Descrição...: Criação da tela Gestão de Investimento - Imóvel.
--------------------------------------------------------------------------------------------------
 Rotinas   : FormCloseQuery
 Data      : 25/08/2016
 Autor     : FHBS
 SIG       : 22316
 Descrição : - Validação versão produção
-------------------------------------------------------------------------------
Nº SOL......: 107772/5704
Nº KINTANA..: 1360314
Data........: 25/05/2012
Responsável.: André Oliveira
Descrição...: Trazer apenas alteradores de desconto concedido, passar para 4 casas decimais
os campos de divergencias
-------------------------------------------------------------------------------
Data...............: 19/10/2011
SOL................: 136331
Kintana............: 814994
Autor..............: Ricardo de Freitas Araújo
Descrição..........: Adicionado opção Consultas -> Controle de Atos de Gestão
-------------------------------------------------------------------------------}

//	-------------------------------------------------------------------------------------------------
//
//	Principal (frmMDIMain)
//
//	Modificações   :  28/01/1999  1) Procedure AposLogin
//                      ...
//                   04/08/1999  2) Verificação do uso de Centro de Responsabilidade e Unidade de Negócio
//                                  no Global e uso dos valores defaults
//                   05/08/1999  3) Desabilitação do item de menu Bens por Imóvel quando não houver
//                                  integração com o Ativo Fixo
//                   16/08/1999  4) Alterações (ligeiras) na atribuição das variáveis de integração
//                   05/10/1999  5) Busca das máscaras dos Tipos de Recebimento / Desembolso
//                   07/10/1999  6) Retirada de bUsaSCImovel e bUsaSCLocatario
//                   20/12/1999  7) Verificação da Moeda corrente e gravação em um variável global
//                                  (Modulo.iMoedaCorrente)
//                   17/01/2000  8) Verificação do valor da 1ª Cota (carteira de investimentos) e
//                                  gravacao em um variável global (Modulo.fPrimeiraCota)
//                   05/05/2000  9) Alterações no Menu
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, uModuloAdminImob, TB97Tlwn, TB97Tlbr,
  TB97Ctls, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti, CorreioCM,
  fcLabel, AppEvnts, StdActns, ActnList, ImgList, fcStatusBar, dBaseDados,
  CMApplicationEvents, CMwwQuery, dReports, SConnect, MConnect, DBClient,
  uCtrlRptAdminImob, cRelExtrato, cRelParamContab, cRelPrevImob, cRelPerdas, cRelPerdasDiarias,
  cRelSeguros, cRelMovFinan, uComunsImobiliario, uModuloImobiliario, uCtrlModuloImobiliario,
  uCtrlParamIntegra, cRelLancForaComp, uResource, CMNetUsers,FControle_Atos_Gestao,
  wwstorep;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    Lancamentos1: TMenuItem;
    N4: TMenuItem;
    Proprietarios: TMenuItem;
    Locatarios: TMenuItem;
    Administradoras: TMenuItem;
    TiposCustosReceitas: TMenuItem;
    qryIntegraContab: TwwQuery;
    Indicadores: TMenuItem;
    N6: TMenuItem;
    MarcasFranquias: TMenuItem;
    Fiadores: TMenuItem;
    qryIntegraContabMASCARA: TStringField;
    qryIntegraContabPLANO: TFloatField;
    qryIntegraContabPACESTORNA: TStringField;
    TESTE1: TMenuItem;
    TESTE2: TMenuItem;
    qryTipoInvest: TwwQuery;
    qryTipoInvestIDTIPOINVEST: TFloatField;
    qryTipoInvestDESCTIPOINVEST: TStringField;
    updTipoInvest: TUpdateSQL;
    qryContaInvest: TwwQuery;
    mnuContratoRenegociacao: TMenuItem;
    mnuContratoRescisao: TMenuItem;
    Movimentacoes: TMenuItem;
    Contratos1: TMenuItem;
    CadastroContrato: TMenuItem;
    CadastroImovel: TMenuItem;
    qryParamGlobal: TwwQuery;
    qryParamGlobalUSACRESPON: TStringField;
    qryParamGlobalUSAABC: TStringField;
    TiposdeImovel1: TMenuItem;
    CadastrodeCidades1: TMenuItem;
    TestedeDatas1: TMenuItem;
    Recadastramento1: TMenuItem;
    deLocao1: TMenuItem;
    qryParamGlobalCODCENTRORESPON: TStringField;
    qryParamGlobalUNIDNEGOC: TFloatField;
    Recebimento1: TMenuItem;
    Suspenso1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    mnuContratoRenovacao: TMenuItem;
    qryParamCAP: TwwQuery;
    qryParamCAPMASCARADESEMB: TStringField;
    mnuAvisoCobranca: TMenuItem;
    mnuAvisoCobrancaDesenho: TMenuItem;
    mnuAvisoCobrancaEmissao: TMenuItem;
    mnuRecibo: TMenuItem;
    mnuReciboDesenho: TMenuItem;
    mnuReciboEmissao: TMenuItem;
    qryParamGlobalMOEDACORRENTE: TFloatField;
    mnuRecalculoCarteira: TMenuItem;
    MensagensparaBoletos1: TMenuItem;
    Cobrana1: TMenuItem;
    N24: TMenuItem;
    ImveisDadosprincipais1: TMenuItem;
    mnuEventoImovel: TMenuItem;
    AjusteAgrupaDocumentos1: TMenuItem;
    TiposdeDadosComplementares1: TMenuItem;
    mnuUnidadesAutonomas: TMenuItem;
    Responsveis1: TMenuItem;
    Cartrios1: TMenuItem;
    GruposparaRateio1: TMenuItem;
    mnuRespDespImobContrato: TMenuItem;
    Atividades1: TMenuItem;
    N33: TMenuItem;
    mnuRecalculoCobranca: TMenuItem;
    Seguros1: TMenuItem;
    DesfazerFolhadeAluguis1: TMenuItem;
    FolhadeAluguisnova1: TMenuItem;
    N37: TMenuItem;
    IntegraodeLanamentos1: TMenuItem;
    mnuCartaReajuste: TMenuItem;
    mnuCartaReajusteDesenho: TMenuItem;
    mnuCartaReajusteEmissao: TMenuItem;
    mnuLancRateadoDespesa: TMenuItem;
    N35: TMenuItem;
    N28: TMenuItem;
    TiposdeIndicador1: TMenuItem;
    IndicadoresporTipodeImvel1: TMenuItem;
    IndicadoresporImvel1: TMenuItem;
    N41: TMenuItem;
    TiposdeDadosComplementares2: TMenuItem;
    TiposdeDadosComplementaresXTipodeImvel1: TMenuItem;
    N40: TMenuItem;
    DadosComplementaresporImvel1: TMenuItem;
    DadosComplementaresporUnidadeAutnoma1: TMenuItem;
    mnuTipoRecDesImob: TMenuItem;
    AlteradoresporTipodeImvel1: TMenuItem;
    DadosComplementaresApuradosporProposta1: TMenuItem;
    N47: TMenuItem;
    CriarAtualizarGruposdeRateio1: TMenuItem;
    N46: TMenuItem;
    AcrscimoseDescontos2: TMenuItem;
    Consulta1: TMenuItem;
    EstornoMltiplodeLanamentos2: TMenuItem;
    N48: TMenuItem;
    EstornoExcluso1: TMenuItem;
    N34: TMenuItem;
    N32: TMenuItem;
    qryParamGlobalIDPATRO: TFloatField;
    qryParamGlobalIDPLANOPREV: TFloatField;
    mnuLancMultiplo: TMenuItem;
    mnuLancMultiploDespesa: TMenuItem;
    mnuLancMultiploReceita: TMenuItem;
    mnuEtiqueta: TMenuItem;
    mnuContratoProrogacao: TMenuItem;
    PlanodeContas1: TMenuItem;
    N17: TMenuItem;
    mnuDescontoContrato: TMenuItem;
    mnuEventoContrato: TMenuItem;
    mnuRecomposicao: TMenuItem;
    N22: TMenuItem;
    mnuRecalculoCAF: TMenuItem;
    mnuRecomposicaoCarteiraCAF: TMenuItem;
    N38: TMenuItem;
    mnuRecomposicaoCarteiraRecDes: TMenuItem;
    qryParamGlobalMOESIGLA: TStringField;
    N8: TMenuItem;
    mnuMovImovel: TMenuItem;
    mnuMovImovelTransf: TMenuItem;
    N9: TMenuItem;
    PropostasdeNovosNegcios1: TMenuItem;
    DadosPrincipais2: TMenuItem;
    N10: TMenuItem;
    Histrico1: TMenuItem;
    N16: TMenuItem;
    mnuParamDespesa: TMenuItem;
    mnuParametrosDespesa: TMenuItem;
    mnuParametrosReceita: TMenuItem;
    mnuConciliaLanc: TMenuItem;
    mnuAnaliseLanc: TMenuItem;
    Seguradoras1: TMenuItem;
    Image2: TImage;
    mnuUtilVerificaMenu: TMenuItem;
    wwQuery1: TwwQuery;
    mnuAlteraLanc: TMenuItem;
    N3: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    mnuIndicadorXImovel: TMenuItem;
    mnuIndicadorXUnidaut: TMenuItem;
    mnuSituacaoContratual: TMenuItem;
    mnuDiario: TMenuItem;
    mnuCalculaPrevisao: TMenuItem;
    mnuEditaPrevisao: TMenuItem;
    qryParamGlobalPLANPREV: TStringField;
    qryParamGlobalPATRO: TStringField;
    N5: TMenuItem;
    mnuAjustaPrevisao: TMenuItem;
    mnuEncerraDiario: TMenuItem;
    mnuDesfazEncerramento: TMenuItem;
    Toolbar971: TToolbar97;
    btnCadContrato: TToolbarButton97;
    btnLancaDespesas: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    btnCadImovel: TToolbarButton97;
    btnLancaReceitas: TToolbarButton97;
    mnuQuadroAviso: TMenuItem;
    mnuParametrosOperacoes: TMenuItem;
    mnuSuspenderReativar: TMenuItem;
    ComposioSocietria1: TMenuItem;
    mnuAvisoImob: TMenuItem;
    mnuInadimplencias: TMenuItem;
    Indicadores1: TMenuItem;
    mnuApuracaoIndicadores: TMenuItem;
    mnuConfissaoDivida: TMenuItem;
    mnuFormaCalculo: TMenuItem;
    mnuItemXFormaCalc: TMenuItem;
    Button1: TButton;
    miTipoComplContrato: TMenuItem;
    miTipoComplUnidade: TMenuItem;
    TipodeDadoComplementar1: TMenuItem;
    N7: TMenuItem;
    mnuGeraContratoConfissao: TMenuItem;
    mnuParametrosItensCalculo: TMenuItem;
    mnuExecIntegraContabilItem: TMenuItem;
    mnuDadosContratoConfissao: TMenuItem;
    N14: TMenuItem;
    mnuDesfazIntegracaoContabil: TMenuItem;
    mnuDesfazConfissaoDivida: TMenuItem;
    N15: TMenuItem;
    mnuTipoContrImob: TMenuItem;
    mnuUnidade: TMenuItem;
    mnuItemProc: TMenuItem;
    N18: TMenuItem;
    mnuBloqueioJudicial: TMenuItem;
    N19: TMenuItem;
    mnuLancGeraRecLote: TMenuItem;
    mnuTipoEvento: TMenuItem;
    mnuCorrecaoLancImovel: TMenuItem;
    N20: TMenuItem;
    mnuCadVigencia: TMenuItem;
    mnuInvercaoDoc: TMenuItem;
    mnDesfazVigencia: TMenuItem;
    BaixaContraAlterador1: TMenuItem;
    N29: TMenuItem;
    ConfissodeDvidas1: TMenuItem;
    DesfazerConfissodeDvidas1: TMenuItem;	
    mnuControleAtosdeGesto: TMenuItem;
    N21: TMenuItem;
    mnuConsDiverg: TMenuItem;
    mnuGestInvest: TMenuItem;
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure IndicadoresDeImovelClick(Sender: TObject);
    procedure MarcasFranquiasClick(Sender: TObject);
    procedure TESTE2Click(Sender: TObject);
    procedure mnuContratoRenegociacaoClick(Sender: TObject);
    procedure TiposdeImovel1Click(Sender: TObject);
    procedure deLocao1Click(Sender: TObject);
    procedure mnuContratoRescisaoClick(Sender: TObject);
    procedure mnuAvisoCobrancaDesenhoClick(Sender: TObject);
    procedure mnuAvisoCobrancaEmissaoClick(Sender: TObject);
    procedure MensagensparaBoletos1Click(Sender: TObject);
    procedure ImveisDadosprincipais1Click(Sender: TObject);
    procedure AjusteAgrupaDocumentos1Click(Sender: TObject);
    procedure AdministradorasClick(Sender: TObject);
    procedure Cartrios1Click(Sender: TObject);
    procedure ProprietariosClick(Sender: TObject);
    procedure FiadoresClick(Sender: TObject);
    procedure LocatariosClick(Sender: TObject);
    procedure Responsveis1Click(Sender: TObject);
    procedure mnuEventoImovelClick(Sender: TObject);
    procedure GruposparaRateio1Click(Sender: TObject);
    procedure mnuRespDespImobContratoClick(Sender: TObject);
    procedure Atividades(Sender: TObject);
    procedure mnuRecalculoCobrancaClick(Sender: TObject);
    procedure Seguros1Click(Sender: TObject);
    procedure IntegraodeLanamentos1Click(Sender: TObject);
    procedure FolhadeAluguisnova1Click(Sender: TObject);
    procedure DesfazerFolhadeAluguis1Click(Sender: TObject);
    procedure mnuCartaReajusteDesenhoClick(Sender: TObject);
    procedure mnuCartaReajusteEmissaoClick(Sender: TObject);
    procedure TiposdeIndicador1Click(Sender: TObject);
    procedure TiposdeDadosComplementares2Click(Sender: TObject);
    procedure mnuTipoRecDesImobClick(Sender: TObject);
    procedure DadosComplementaresporImvel1Click(Sender: TObject);
    procedure DadosComplementaresporUnidadeAutnoma1Click(Sender: TObject);
    procedure mnuIndicadorXImovelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure IndicadoresporTipodeImvel1Click(Sender: TObject);
    procedure TiposdeDadosComplementaresXTipodeImvel1Click(Sender: TObject);
    procedure AlteradoresporTipodeImvel1Click(Sender: TObject);
    procedure ContasOramentriasporTipodeReceitaouDespesa1Click(Sender: TObject);
    procedure CriarAtualizarGruposdeRateio1Click(Sender: TObject);
    procedure Consulta1Click(Sender: TObject);
    procedure AcrscimoseDescontos2Click(Sender: TObject);
    procedure EstornoMltiplodeLanamentos2Click(Sender: TObject);
    procedure mnuLancMultiploDespesaClick(Sender: TObject);
    procedure mnuLancMultiploReceitaClick(Sender: TObject);
    procedure mnuContratoProrogacaoClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure fcLabel2DblClick(Sender: TObject);
    procedure mnuDescontoContratoClick(Sender: TObject);
    procedure mnuEventoContratoClick(Sender: TObject);
    procedure mnuMovImovelTransfClick(Sender: TObject);
    procedure mnuParametrosDespesaClick(
      Sender: TObject);
    procedure mnuParametrosReceitaClick(Sender: TObject);
    procedure mnuConciliaLancClick(Sender: TObject);
    procedure Histrico1Click(Sender: TObject);
    procedure Seguradoras1Click(Sender: TObject);
    procedure PlanodeContas1Click(Sender: TObject);
    procedure mnuAnaliseLancClick(Sender: TObject);
    procedure mnuUtilVerificaMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuAlteraLancClick(Sender: TObject);
    procedure mnuEtiquetaClick(Sender: TObject);
    procedure mnuLancRateadoDespesaClick(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure DadosComplementaresApuradosporProposta1Click(
      Sender: TObject);
    procedure mnuUnidadesAutonomasClick(Sender: TObject);
    procedure mnuIndicadorXUnidautClick(Sender: TObject);
    procedure mnuSituacaoContratualClick(Sender: TObject);
    procedure mnuCalculaPrevisaoClick(Sender: TObject);
    procedure mnuEditaPrevisaoClick(Sender: TObject);
    procedure mnuAjustaPrevisaoClick(Sender: TObject);
    procedure mnuEncerraDiarioClick(Sender: TObject);
    procedure mnuDesfazEncerramentoClick(Sender: TObject);
    procedure mnuQuadroAvisoClick(Sender: TObject);
    procedure mnuParametrosOperacoesClick(Sender: TObject);
    procedure mnuSuspenderReativarClick(Sender: TObject);
    procedure ComposioSocietria1Click(Sender: TObject);
    procedure mnuAvisoImobClick(Sender: TObject);
    procedure mnuInadimplenciasClick(Sender: TObject);
    procedure mnuApuracaoIndicadoresClick(Sender: TObject);
    procedure mnuFormaCalculoClick(Sender: TObject);
    procedure mnuItemXFormaCalcClick(Sender: TObject);
    procedure miTipoComplContratoClick(Sender: TObject);
    procedure miTipoComplUnidadeClick(Sender: TObject);
    procedure mnuGeraContratoConfissaoClick(Sender: TObject);
    procedure mnuParametrosItensCalculoClick(Sender: TObject);
    procedure mnuExecIntegraContabilItemClick(Sender: TObject);
    procedure mnuDadosContratoConfissaoClick(Sender: TObject);
    procedure mnuDesfazIntegracaoContabilClick(Sender: TObject);
    procedure mnuDesfazConfissaoDividaClick(Sender: TObject);
    procedure mnuTipoContrImobClick(Sender: TObject);
    procedure mnuUnidadeClick(Sender: TObject);
    procedure mnuItemProcClick(Sender: TObject);
    procedure mnuBloqueioJudicialClick(Sender: TObject);
    procedure mnuLancGeraRecLoteClick(Sender: TObject);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure mnuTipoEventoClick(Sender: TObject);
    procedure mnuCorrecaoLancImovelClick(Sender: TObject);
    procedure mnuCadVigenciaClick(Sender: TObject);
    procedure mnuInvercaoDocClick(Sender: TObject);
    procedure DesfazerCadastrodePercentuais1Click(Sender: TObject);
	procedure BaixaContraAlterador1Click(Sender: TObject);
    procedure ConfissodeDvidas1Click(Sender: TObject);
    procedure DesfazerConfissodeDvidas1Click(Sender: TObject);
    procedure mnuControleAtosdeGestoClick(Sender: TObject);
    procedure mnuConsDivergClick(Sender: TObject);
    procedure mnuGestInvestClick(Sender: TObject);

  private
    vFiltro : Array[1..12] of String;
    bFiltroSalvo : Boolean;

    procedure AcertaClausulaSQL(dtmReport: TdtmReports); { Private declarations }
    procedure AcertaFiltroEmpresa(const sTipo:String);

  public { Public declarations }
    sTipoCompl : String;
  end;


var
  frmPrincipal: TfrmPrincipal;



implementation
{$R *.DFM}
{$R MensagemRes.Res}

uses
  UMensErro, UDataBase, uIntegraBack, uFuncoesImob, dImobiliario, dLookImobiliario,

  FParamAdminImob,
  RIndicador,
  FTesteGeral,
  CRelAvisoCobranca,
  uDiasInUteis,
  FExecRenegociacao,
  dRelAdminImob,
  FExecFolhaAluguelNova,
  FEstornaFolhaAluguel, FDRelAvisoCobranca,
  FDRelCartaReajuste, CRelCartaReajuste,
  dRelHistoricoContratual, cRelHistoricoContratual, // Marcio Motta - 01/08/2004 - 16873
  cRelEventos,
  cRelEvolInadimp,
  FExecLancRateio,
  FCadUnidadeAutonoma,
  FExecGeracaoGrupos,
  RLancImovelNovo, FExecLancAlteradorNovo, FEstornaLancamentoNovo,
  CRelEtiquetaLocatario, fExecProrrogacao,
  fCadContaOrcamenXTipRecDes,
  fQuadroAviso,
  dRelAdminImobCC,
  FExecLancMultRec,
  FExecIntegraLancNovo, dMS,
  FExecRecalculoDocumento, FCadDescontoContrato, FCadEventoImovelMT,
  FCadEventoContratoMT, FConcilia,
  FExecTranfTipoImovel, FCadRespDespesa,
  FCadHistProp, BPlanoConta, FExecAnaliseLancto, FVerificaMenuSAD,
  fExecAgrupaDocumentoNovo,

  FExecLancamentosBloqueados,

  // forms convertidos 3 camadas

  fExecCalculaPrevisaoDiariaMT, fCadPrevisaoDiariaMT,
  fExecAjustePrevisaoDiariaMT, fExecFechaDiarioMT, fExecDesfazDiarioMT,

  fCadOutroDadoMT,         fCadOutroDadoXTipoImovelMT,
  FCadOutroDadoXImovelMT,  FCadOutroDadoXUnidAutMT,     FCadOutroDadoXPropMT,

  fCadIndicadorMT,         FCadIndicadorXTipoImovelMT,
  FCadIndicadorXImovelMT,  FCadIndicadorXUnidAutMT,

  FCadTipoImovelMT,        FCadAlteradorXTipoImovelMT,

  fCadTipoCustoRecMT,     fCadParamReceitaMT,    fCadParamDespesaMT,

  // Processos
  fExecRescisaoContratoMT,

  // diversos cadastrais
  fCadAtividadeMT,        fCadSitContImobMT,     fCadSeguroImovelMT,
  fCadMarcasMT,           fCadImovelMT,          fCadContratoImovelMT,
  fPessoaAvalistaMT,      fPessoaLocatarioMT,    fPessoaProprietarioMT,
  fPessoaAdministradorMT, fPessoaCartorioMT,     fPessoaResponsavelMT,
  fPessoaSeguradoraMT,    fCadGrupoRateioMT,     fCadMsgBoletoMT,
  fCadParamOperacaoMT,    FExecLancMultDespMT,   FExecLancMultDespAltMT,
  fExecSuspenderReativar, fCadImovelXEmpreendedorMT, fCadAvisoImob,
  fConsultaInadimplencia, fApuracaoIndicadores, dRelEvolInadimp, FExecAgrupaDocumentosMT,
  FCadFormaCalcImob, FCadItensXFormaCalculo, fCadDadosComplMT, fExecConfissaoDivida,
  fCadParamItemCalculoMT, FExecIntegracaoContabil, FDesfazIntegracaoContabil, dAtivoFixo,
  dLancImovel, dEventoImovel, dCalcDocumento, dCaf, dRelPerdasDiario,
  FCadContratoConfissao, FDesfazConfissaoDivida, fConciliaMT, fCadTipoContratoMT,
  fCadUnidadeMT, fCadItemProcessoMT, cRelFolhaRecEmpreendimento,
  dRelFolhaRecEmpreendimento, dRelFolhaRecVencimento, cRelFolhaRecVencimento,
  cRelFolhaRecEmpreendimentoSintetico, dRelFolhaRecEmpreendimentoSintetico, fExecGeraRecLoteMT,
  FCadTipoEventoImovelMT,// Gustavo Mendes - 26794
  fAcertaLanctoImovel,
  fExecCadVigencia,
  //SOL Nº 123786 KTN Nº 621941
  fExecInversaoDoc,                              
  //sol 144463
  fDelPorcentSegreg,fCadBaixaContraAlteradorMT, FMovContratoConfissao,
  fMovDesfazerConfissao,
  // Alterado por FHBS - SOL: 107772 KTN: 485678 
  fConsSaldoDivergContratos, fCadGestInvestImovelMestreMT; // Michelle Mota - SIG26054

//==================================================================================================
//==================================================================================================
//==================================================================================================



//==================================================================================================
//==================================================================================================
//==================================================================================================



procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
   inherited;

   try

      if Sistema.FezLogin then begin

         Screen.Cursor := crHourGlass;

         ModuloImobiliario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                      ComunsImobiliario.MensErroMT);

         ModuloImobiliario.AdminImob.GetParam( Sistema.idEmpresa );
         ModuloImobiliario.Global.GetParam( Sistema.idEmpresa );

         ParamIntegra.InitializeAs( ModuloImobiliario );
         ParamIntegra.GetParams( Sistema.IdEmpresa,0,'','',tiSistema );

         mnuDiario.Visible := ModuloImobiliario.AdminImob.bFlgDiario;

         { PARA RESOLVER PROBLEMAS DE PERFORMANCE NA ENTRADA DO SISTEMA FOI COLOCADO EM TODAS AS QUERYS
           DOS RELATÓRIOS A CLÁUSULA "1=2 AND" RETIRAR EXPRESSÕES.
           TEMPO APÓS LOGIN ANTES DA MUDANÇA 2'43"  ==  APÓS MUDANÇA 16"
         }
         AcertaClausulaSQL(dtmRelAdminImob);
         AcertaClausulaSQL(dtmRelAdminImobCC);


         //--------------------------------------------------------------------------------------------
         //    Gestão de Investimentos
         //--------------------------------------------------------------------------------------------

         // verifica se a tabela TipoInvest está preenchida; se não estiver, a preenche
         with qryContaInvest do begin
            Close;
            Open;
            if Fields[0].asInteger = 0 then begin

               with qryTipoInvest do begin
                  Open;
                  Insert;
                  qryTipoInvestIDTIPOINVEST.asInteger  := 1;
                  qryTipoInvestDESCTIPOINVEST.asString := 'Renda Fixa';
                  Post;
                  Insert;
                  qryTipoInvestIDTIPOINVEST.asInteger  := 2;
                  qryTipoInvestDESCTIPOINVEST.asString := 'Renda Variável';
                  Post;
                  Insert;
                  qryTipoInvestIDTIPOINVEST.asInteger  := 3;
                  qryTipoInvestDESCTIPOINVEST.asString := 'Investimentos Imobiliários';
                  Post;
                  Insert;
                  qryTipoInvestIDTIPOINVEST.asInteger  := 4;
                  qryTipoInvestDESCTIPOINVEST.asString := 'Empréstimos';
                  Post;

                  AplicaAlteracoes([qryTipoInvest]);
                  Close;
               end;
            end;
            Close;
         end;
         //-----------------------------------------------------------------------------------------
         //    Administração Imobiliária
         //-----------------------------------------------------------------------------------------

         with qryParamGlobal do begin
            LimpaParametros(qryParamGlobal);
            ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
            Open;

            if not(qryParamGlobal.isEmpty) then begin
               Modulo.bUsaCentRespon   := qryParamGlobalUSACRESPON.asString = 'S';
               Modulo.bUsaUnidNegoc    := qryParamGlobalUSAABC.asString = 'S';
               Modulo.iMoedaCorrente   := qryParamGlobalMOEDACORRENTE.asInteger;
               Modulo.sMoedaCorrente   := qryParamGlobalMOESIGLA.AsString;

               Modulo.iPlanoPrevGlobal := qryParamGlobalIDPLANOPREV.asInteger;
               Modulo.iPatroGlobal     := qryParamGlobalIDPATRO.asInteger;
               Modulo.sPlanoPrevGlobal := qryParamGlobalPLANPREV.AsString;
               Modulo.sPatroGlobal     := qryParamGlobalPATRO.AsString; 

            end;

            if not(Modulo.bUsaCentRespon) then Modulo.sCentroRespon  := qryParamGlobalCODCENTRORESPON.asString;
            if not(Modulo.bUsaUnidNegoc) then Modulo.iUnidNegoc      := qryParamGlobalUNIDNEGOC.asInteger;

            Close;
         end;

         // não permite integração, por default
         Modulo.bIntegraCAPCAR      := False;
         Modulo.bIntegraContab      := False;
         Modulo.bIntegraGestao      := False;
         Modulo.bIntegraAtivo       := False;
         Modulo.bIntegraOrcamento   := False;

         // caso os parâmetros não estejam definidos ainda...
         if not ParametrosSistema then begin
            MsgDlg('Não se esqueça de preencher os Parâmetros do Sistema.', 'Aviso', mtWarning, [mbOk], 0);
            Repaint;
         end else begin

            // tudo certo, armazena os dados nas variáveis do Módulo
            Modulo.bIntegraCAPCAR   := dtmImobiliario.qryParamImobFLGINTEGRACAPCAR.asInteger = 1;
            Modulo.bIntegraGestao   := dtmImobiliario.qryParamImobFLGINTEGRAGESTAO.asInteger = 1;
            Modulo.bIntegraAtivo    := dtmImobiliario.qryParamImobFLGINTEGRAATIVO.asInteger = 1;
            Modulo.bIntegraContab   := dtmImobiliario.qryParamImobFLGINTEGRACONTAB.asInteger = 1;

            Modulo.iPrograma        := dtmImobiliario.qryParamImobIDPROGRAMA.asInteger;
            Modulo.sCentroCusto     := dtmImobiliario.qryParamImobCODCENTROCUSTO.AsString;

            //-----------------------------------------------------------------------------------------
            //    CaP / CaR
            //-----------------------------------------------------------------------------------------
            if Modulo.bIntegraCAPCAR then begin

               // máscara do Tipo de Recebimento
               with qryParamCAP do begin
                  LimpaParametros(qryParamCAP);
                  ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
                  ParamByName('RECPAG').asString         := 'R';
                  Open;

                  Modulo.sMascaraReceb := trim(qryParamCAPMASCARADESEMB.asString);
               end;

               // máscara do Tipo de Desembolso
               with qryParamCAP do begin
                  LimpaParametros(qryParamCAP);
                  ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
                  ParamByName('RECPAG').asString         := 'P';
                  Open;

                  Modulo.sMascaraDesemb := trim(qryParamCAPMASCARADESEMB.asString);
               end;

               qryParamCAP.Close;
            end;


            //-----------------------------------------------------------------------------------------
            //    Contabilidade
            //-----------------------------------------------------------------------------------------
            if Modulo.bIntegraContab then begin

                // abre a query que traz os dados de integração
               with qryIntegraContab do begin
                  LimpaParametros(qryIntegraContab);
                  Params[0].asInteger := Sistema.idEmpresa;
                  Open;
               end;

               // se não existirem os dados necessários para a integração...
               if not(qryIntegraContab.isEmpty) then begin

                  IntegraBack.Plano          := qryIntegraContab.FieldbyName('PLANO').asInteger;
                  IntegraBack.MascaraPlano   := trim(qryIntegraContab.FieldbyName('MASCARA').asString);

                  // seta a variável sIntegraContab, necessária p/ UFuncaoGeral
                  IntegraBack.Contabilidade  := 'S';

               end else begin
                  Modulo.bIntegraContab      := False;
                  IntegraBack.Contabilidade  := 'N';

               end;
            end;
         end;

// Daniel - 24085 - Início -----------------------------------------------------
         // Habilita/Desabilita Menu de Unidade
         if (ModuloImobiliario.AdminImob.bFlgUsaUnidade=True) then
           mnuUnidade.Visible := True
         else
           mnuUnidade.Visible := False;
// Daniel - 24085 - Fim --------------------------------------------------------

      end;
   finally
      // Restaura o filtro original e Altera o filtro para a empresa selecionada
      if not bFiltroSalvo then begin
         AcertaFiltroEmpresa('S');
         bFiltroSalvo := True;
      end;
      AcertaFiltroEmpresa('R');
      AcertaFiltroEmpresa('A');


      mnuUtilVerificaMenu.Visible := False;
      mnuUtilVerificaMenu.Enabled := False;

      // Define sepadador de Decimais padrão
      DecimalSeparator := ',';


      Screen.Cursor := crDefault;

      if Sistema.FezLogin then
      begin
         // Abre Quadro de Avisos
         if (ModuloImobiliario.AdminImob.bFlgAviso) and (mnuQuadroAviso.Enabled) then begin
            AbrirForm(frmQuadroAviso, TfrmQuadroAviso, False);
         end;
      end;

   end;
end;



//==================================================================================================



procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TdtmRelAdminImob,dtmRelAdminImob);
   Application.CreateForm(TdtmRelAdminImobCC,dtmRelAdminImobCC);
   Application.CreateForm(TdtmRelPerdasDiario, dtmRelPerdasDiario);
   Application.CreateForm(TdtmRelHistoricoContratual, dtmRelHistoricoContratual);

   Application.CreateForm(TdtmRelFolhaRecEmpreendimento,dtmRelFolhaRecEmpreendimento);
   Application.CreateForm(TdtmRelFolhaRecVencimento,dtmRelFolhaRecVencimento);
   Application.CreateForm(TdtmRelFolhaRecEmpreendimentoSintetico,dtmRelFolhaRecEmpreendimentoSintetico);

end;


procedure TfrmPrincipal.AcertaClausulaSQL (dtmReport: TdtmReports);
var
   iFor, iPos: integer;
   sSql: string;
begin
   iFor := 0;
   while iFor <= dtmReport.ComponentCount - 1 do begin
      if TObject(dtmReport.Components[iFor]).ClassType = TwwQuery then begin
         sSql := TwwQuery(dtmReport.FindComponent(dtmReport.Components[iFor].Name)).SQL.Text;
         iPos := pos('1=2 AND', sSql);
         // achada a expressão "1=2 AND" = EXCLUI-LA
         if iPos > 1 then begin
            Delete(sSql, iPos, 7);
            TwwQuery(dtmReport.FindComponent(dtmReport.Components[iFor].Name)).SQL.Text := sSql;
         end;
      end;
      inc(iFor);
   end;
end;

//==================================================================================================



procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   inherited;

   if not Sistema.FezLogin then Exit; // FHBS - SIG22316

   with dtmImobiliario.qrySaidaSistema do begin
      LimpaParametros(dtmImobiliario.qrySaidaSistema);
      ParamByName('PIDPESSOA').AsInteger     := Sistema.idEmpresa;
      ParamByName('PFLGINTEGRADO').AsInteger := 0;
      ParamByName('PIDMODULO').AsInteger     := Sistema.IdModulo;
      Open;
   end;

   // verifica se há lançamentos pendentes de integração
   if dtmImobiliario.qrySaidaSistemaCONTAGEM.asInteger > 0 then begin
      CanClose := MsgDlg('Existem Lançamentos com integração pendente. Deseja realmente sair do Sistema?', 'Confirmação', mtConfirmation, [mbNo, mbYes], 0) = mrYes;
      Repaint;
   end;

   dtmImobiliario.qrySaidaSistema.Close;
end;



//==================================================================================================



// backdoor de habilitação de todos os menus
procedure TfrmPrincipal.fcLabel2DblClick(Sender: TObject);
begin
   inherited;
   TiposdeDadosComplementares2.Enabled := True;
   miTipoComplUnidade.Enabled := True;
   miTipoComplContrato.Enabled := True;   
end;



//==================================================================================================
//==================================================================================================
//==================================================================================================



procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmParamAdminImob, TfrmParamAdminImob, False);
end;

procedure TfrmPrincipal.IndicadoresDeImovelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmRelIndicadores, TfrmRelIndicadores, False);
end;

procedure TfrmPrincipal.MarcasFranquiasClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadMarcasMT, TfrmCadMarcasMT, False);
end;

procedure TfrmPrincipal.TESTE2Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmTesteGeral, TfrmTesteGeral, False);
end;

procedure TfrmPrincipal.mnuContratoRenegociacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecRenegociacao, TfrmExecRenegociacao, False);
end;

procedure TfrmPrincipal.TiposdeImovel1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTipoImovelMT, TfrmCadTipoImovelMT, False);
end;

procedure TfrmPrincipal.deLocao1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadContratoImovelMT, TfrmCadContratoImovelMT, False);
end;

procedure TfrmPrincipal.mnuContratoRescisaoClick(Sender: TObject);
begin
  inherited;                                                      
  AbrirForm(frmExecRescisaoContratoMT, TfrmExecRescisaoContratoMT, False);
end;

procedure TfrmPrincipal.mnuAvisoCobrancaDesenhoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmDesenhoRelAvisoCobranca, TfrmDesenhoRelAvisoCobranca, False);
end;

procedure TfrmPrincipal.mnuAvisoCobrancaEmissaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(cfgRelAvisoCobranca, TcfgRelAvisoCobranca, False);
end;

procedure TfrmPrincipal.MensagensparaBoletos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadMsgBoletoMT, TfrmCadMsgBoletoMT, False);
end;

procedure TfrmPrincipal.ImveisDadosprincipais1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadImovelMT, TfrmCadImovelMT, False);
end;

procedure TfrmPrincipal.AjusteAgrupaDocumentos1Click(Sender: TObject);
begin
   inherited;
   if Sistema.TipoCliente = 19991 then // FUNCEF
      AbrirForm(frmExecAgrupaDocumentoNovo, TfrmExecAgrupaDocumentoNovo, False)
   else
      AbrirForm(frmAgrupaDocumentosMT, TfrmAgrupaDocumentosMT, False);
end;



procedure TfrmPrincipal.AdministradorasClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaAdministradorMT, TfrmPessoaAdministradorMT, False);
end;

procedure TfrmPrincipal.Cartrios1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaCartorioMT, TfrmPessoaCartorioMT, False);
end;

procedure TfrmPrincipal.ProprietariosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaProprietarioMT, TfrmPessoaProprietarioMT, False);
end;

procedure TfrmPrincipal.FiadoresClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaAvalistaMT, TfrmPessoaAvalistaMT, False);
end;

procedure TfrmPrincipal.LocatariosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaLocatarioMT, TfrmPessoaLocatarioMT, False);
end;

procedure TfrmPrincipal.Responsveis1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaResponsavelMT, TfrmPessoaResponsavelMT, False);
end;

procedure TfrmPrincipal.mnuEventoImovelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadEventoImovelMT, TfrmCadEventoImovelMT, False);
end;

procedure TfrmPrincipal.GruposparaRateio1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadGrupoRateioMT, TfrmCadGrupoRateioMT, False);
end;

procedure TfrmPrincipal.mnuRespDespImobContratoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadRespDespesa, TfrmCadRespDespesa, False);
end;

procedure TfrmPrincipal.Atividades(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadAtividadeMT, TfrmCadAtividadeMT, False);
end;

procedure TfrmPrincipal.mnuRecalculoCobrancaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecRecalculoDocumento, TfrmExecRecalculoDocumento, False);
end;

procedure TfrmPrincipal.Seguros1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadSeguroImovelMT, TfrmCadSeguroImovelMT, False);
end;

procedure TfrmPrincipal.IntegraodeLanamentos1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecIntegraLancNovo, TfrmExecIntegraLancNovo, False);
end;



procedure TfrmPrincipal.FolhadeAluguisnova1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecFolhaAluguelNova, TfrmExecFolhaAluguelNova, False);
end;



procedure TfrmPrincipal.DesfazerFolhadeAluguis1Click(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TfrmEstornaFolhaAluguel, frmEstornaFolhaAluguel);
   frmEstornaFolhaAluguel.ShowModal;
end;



procedure TfrmPrincipal.mnuCartaReajusteDesenhoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmDesenhoRelCartaReajuste, TfrmDesenhoRelCartaReajuste, False);
end;



procedure TfrmPrincipal.mnuCartaReajusteEmissaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(cfgRelCartaReajuste, TcfgRelCartaReajuste, False);
end;



procedure TfrmPrincipal.TiposdeIndicador1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadIndicadorMT, TfrmCadIndicadorMT, False);
end;


procedure TfrmPrincipal.mnuTipoRecDesImobClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTipoCustoRecMT, TfrmCadTipoCustoRecMT, False);
end;

procedure TfrmPrincipal.DadosComplementaresporImvel1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadOutroDadoXImovelMT, TfrmCadOutroDadoXImovelMT, False);
end;

procedure TfrmPrincipal.DadosComplementaresporUnidadeAutnoma1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadOutroDadoXUnidAutMT, TfrmCadOutroDadoXUnidAutMT, False);
end;

procedure TfrmPrincipal.mnuIndicadorXImovelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadIndicadorXImovelMT, TfrmCadIndicadorXImovelMT, False);
end;

procedure TfrmPrincipal.IndicadoresporTipodeImvel1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadIndicadorXTipoImovelMT, TfrmCadIndicadorXTipoImovelMT, False);
end;

procedure TfrmPrincipal.TiposdeDadosComplementaresXTipodeImvel1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadOutroDadoXTipoImovelMT, TfrmCadOutroDadoXTipoImovelMT, False);
end;

procedure TfrmPrincipal.AlteradoresporTipodeImvel1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadAlteradorXTipoImovelMT, TfrmCadAlteradorXTipoImovelMT, False);
end;

procedure TfrmPrincipal.ContasOramentriasporTipodeReceitaouDespesa1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadContaOrcamenXTipRecDes, TfrmCadContaOrcamenXTipRecDes, False);
end;

procedure TfrmPrincipal.CriarAtualizarGruposdeRateio1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecGeracaoGrupos, TfrmExecGeracaoGrupos, False);
end;

procedure TfrmPrincipal.Consulta1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmRelLancImovelNovo, TfrmRelLancImovelNovo, True);
end;

procedure TfrmPrincipal.AcrscimoseDescontos2Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecLancAlteradorNovo, TfrmExecLancAlteradorNovo, False);
end;

procedure TfrmPrincipal.EstornoMltiplodeLanamentos2Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmEstornaLancNovo, TfrmEstornaLancNovo, False);
end;

procedure TfrmPrincipal.mnuLancMultiploDespesaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecLancMultDespMT, TfrmExecLancMultDespMT, False);
end;

procedure TfrmPrincipal.mnuLancMultiploReceitaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecLancMultRec, TfrmExecLancMultRec, False);
end;

procedure TfrmPrincipal.mnuContratoProrogacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecProrrogacao, TfrmExecProrrogacao, False);
end;

procedure TfrmPrincipal.mnuDescontoContratoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadDescontoContrato, TfrmCadDescontoContrato, False);
end;

procedure TfrmPrincipal.mnuEventoContratoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadEventoContratoMT, TfrmCadEventoContratoMT, False);
end;

procedure TfrmPrincipal.mnuMovImovelTransfClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecTranfTipoImovel, TfrmExecTranfTipoImovel, False);
end;

procedure TfrmPrincipal.mnuParametrosDespesaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadParamDespesaMT, TfrmCadParamDespesaMT, False);
end;

procedure TfrmPrincipal.mnuParametrosReceitaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadParamReceitaMT, TfrmCadParamReceitaMT, False);
end;

procedure TfrmPrincipal.mnuParametrosOperacoesClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadParamOperacaoMT, TfrmCadParamOperacaoMT, False);
end;

procedure TfrmPrincipal.mnuConciliaLancClick(Sender: TObject);
begin
   inherited;

   AbrirForm(frmConciliaMT, TfrmConciliaMT, False);
end;

procedure TfrmPrincipal.Histrico1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadHistProp, TfrmCadHistProp, False);
end;

procedure TfrmPrincipal.Seguradoras1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaSeguradoraMT, TfrmPessoaSeguradoraMT, False);
end;

procedure TfrmPrincipal.PlanodeContas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(busPlanoconta, TbusPlanoconta, False);
end;

procedure TfrmPrincipal.mnuAnaliseLancClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecAnaliseLancto, TfrmExecAnaliseLancto, False);
end;

procedure TfrmPrincipal.mnuUtilVerificaMenuClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmVerificaMenuSAD, TfrmVerificaMenuSAD, False);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

   Application.CreateForm(TdtmAtivoFixo, dtmAtivoFixo);
   Application.CreateForm(TdtmImobiliario, dtmImobiliario);
   Application.CreateForm(TdtmLancImovel, dtmLancImovel);
   Application.CreateForm(TdtmEventoImovel, dtmEventoImovel);
   Application.CreateForm(TdtmLookImobiliario, dtmLookImobiliario);
   Application.CreateForm(TdtmCalcDocumento, dtmCalcDocumento);
   Application.CreateForm(TdtmCAF, dtmCAF);
   Application.CreateForm(TdtmMS, dtmMS);
end;


procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   inherited;
   // BACA PARA CORRIGIR O PROBLEMA DA TELA ACIMA DA BARRA DE TAREFAS
   if MHeight <= 0 then begin
      MHeight := Self.ClientHeight + 112;
      MWidth  := Self.ClientWidth - 32;
   end;

   bFiltroSalvo := False;

end;

procedure TfrmPrincipal.mnuAlteraLancClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecLancMultDespAltMT, TfrmExecLancMultDespAltMT, False);
end;

procedure TfrmPrincipal.mnuEtiquetaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(cfgRelEtiquetaLocatario, TcfgRelEtiquetaLocatario, False);
end;

procedure TfrmPrincipal.mnuLancRateadoDespesaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecLancRateio, TfrmExecLancRateio, False);
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
var RptAdminImob :TCtrlRptAdminImob;
Begin
  inherited;
  RptAdminImob := TCtrlRptAdminImob.Create;
  Try
     Printed := ShowReport(IdReports, RptAdminImob);
     RptAdminImob.Free;
  Except
     RptAdminImob.Free;
     Raise;
  End;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  Case IdReports of
    3334 : FrmPreviewReports := TcfgRelExtrato.Create(Self);
    2222 : FrmPreviewReports := TcfgRelParamContab.Create(Self);
    3667 : FrmPreviewReports := TcfgRelPrevImob.Create(Self);
    3951 : FrmPreviewReports := TcfgRelPerdas.Create(Self);
    3961 : FrmPreviewReports := TcfgRelSeguros.Create(Self);
    20040: FrmPreviewReports := TcfgRelMovFinan.Create(Self);
    20106: FrmPreviewReports := TcfgRelLancForaComp.Create(Self);
    20107: FrmPreviewReports := TcfgRelPerdasDiarias.Create(Self);
    20118: FrmPreviewReports := TcfgRelHistoricoContratual.Create(Self);
    20133: FrmPreviewReports := TcfgRelEventos.Create(Self);
    20153: FrmPreviewReports := TcfgRelEvolInadimp.Create(Self);
    20340: FrmPreviewReports := TcfgRelFolhaRecEmpreendimento.Create(Self);
    20341: FrmPreviewReports := TcfgRelFolhaRecVencimento.Create(Self);
    20342: FrmPreviewReports := TcfgRelFolhaRecEmpreendimentoSintetico.Create(Self);
  Else
    FrmPreviewReports := nil;
  End;
  inherited;
end;

procedure TfrmPrincipal.DadosComplementaresApuradosporProposta1Click(
  Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadOutroDadoXPropMT, TfrmCadOutroDadoXPropMT, False);
end;

procedure TfrmPrincipal.mnuUnidadesAutonomasClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadUnidadeAutonoma, TfrmCadUnidadeAutonoma, False);
end;

procedure TfrmPrincipal.mnuIndicadorXUnidautClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadIndicadorXUnidAutMT, TfrmCadIndicadorXUnidAutMT, False);
end;

procedure TfrmPrincipal.mnuSituacaoContratualClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadSitContImobMT, TfrmCadSitContImobMT, False);
end;

procedure TfrmPrincipal.mnuCalculaPrevisaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecCalculaPrevisaoDiariaMT, TfrmExecCalculaPrevisaoDiariaMT, False);
end;

procedure TfrmPrincipal.mnuEditaPrevisaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadPrevisaoDiariaMT, TfrmCadPrevisaoDiariaMT, False);
end;

procedure TfrmPrincipal.mnuAjustaPrevisaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecAjustePrevisaoDiariaMT, TfrmExecAjustePrevisaoDiariaMT, False);
end;

procedure TfrmPrincipal.mnuEncerraDiarioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecFechaDiarioMT, TfrmExecFechaDiarioMT, False);
end;

procedure TfrmPrincipal.mnuDesfazEncerramentoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecDesfazDiarioMT, TfrmExecDesfazDiarioMT, False);
end;

procedure TfrmPrincipal.mnuQuadroAvisoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmQuadroAviso, TfrmQuadroAviso, False);
end;


procedure TfrmPrincipal.AcertaFiltroEmpresa(const sTipo: String);
begin
   if sTipo = 'S' then begin    // Salva o filtro original
      vFiltro[1]  := dtmMS.MS_Bem.Filtro.Text;
      vFiltro[2]  := dtmMS.MS_Imovel.Filtro.Text;
      vFiltro[3]  := dtmMS.MS_ImovelAtivo.Filtro.Text;
      vFiltro[4]  := dtmMS.MS_ImovelContrato.Filtro.Text;
      vFiltro[5]  := dtmMS.MS_ImovelContratoV.Filtro.Text;
      vFiltro[6]  := dtmMS.MS_ImovelouMestre.Filtro.Text;
      vFiltro[7]  := dtmMS.MS_ImovelMestre.Filtro.Text;
      vFiltro[8]  := dtmMS.MS_Contrato.Filtro.Text;
      vFiltro[9]  := dtmMS.MS_UnidAut.Filtro.Text;
      vFiltro[10] := dtmMS.MS_Lancamento.Filtro.Text;
      vFiltro[11] := dtmMS.MS_Proposta.Filtro.Text;
      vFiltro[12] := dtmMS.MS_Forn.Filtro.Text;
   end;

   if sTipo = 'R' then begin    // Restaura o filtro anterior
      dtmMS.MS_Bem.Filtro.Text             := vFiltro[1];
      dtmMS.MS_Imovel.Filtro.Text          := vFiltro[2];
      dtmMS.MS_ImovelAtivo.Filtro.Text     := vFiltro[3];
      dtmMS.MS_ImovelContrato.Filtro.Text  := vFiltro[4];
      dtmMS.MS_ImovelContratoV.Filtro.Text := vFiltro[5];
      dtmMS.MS_ImovelouMestre.Filtro.Text  := vFiltro[6];
      dtmMS.MS_ImovelMestre.Filtro.Text    := vFiltro[7];
      dtmMS.MS_Contrato.Filtro.Text        := vFiltro[8];
      dtmMS.MS_UnidAut.Filtro.Text         := vFiltro[9];
      dtmMS.MS_Lancamento.Filtro.Text      := vFiltro[10];
      dtmMS.MS_Proposta.Filtro.Text        := vFiltro[11];
      dtmMS.MS_Forn.Filtro.Text            := vFiltro[12];
   end;

   if sTipo = 'A' then begin    // Ajusta o filtro por empresa
      dtmMS.MS_Bem.Filtro.Add('B.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
      dtmMS.MS_Imovel.Filtro.Add('I.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
      dtmMS.MS_ImovelAtivo.Filtro.Add('I.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
      dtmMS.MS_ImovelContrato.Filtro.Add('I.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
      dtmMS.MS_ImovelContratoV.Filtro.Add('I.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
      dtmMS.MS_ImovelouMestre.Filtro.Add('I.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
      dtmMS.MS_ImovelMestre.Filtro.Add('IM.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
      dtmMS.MS_Contrato.Filtro.Add('C.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
      dtmMS.MS_UnidAut.Filtro.Add('I.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
      dtmMS.MS_Lancamento.Filtro.Add('IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
      dtmMS.MS_Lancamento.Filtro.Add('IDMODULO = ' + IntToStr(Sistema.IdModulo));
      dtmMS.MS_Proposta.Filtro.Add('P.IDEMPRESAPROP = ' + IntToStr(Sistema.IdEmpresa));
      dtmMS.MS_Forn.Filtro.Add('E.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
   end;
end;

procedure TfrmPrincipal.mnuSuspenderReativarClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecSuspenderReativar, TfrmExecSuspenderReativar, False);
end;

procedure TfrmPrincipal.ComposioSocietria1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadImovelXEmpreendedorMT, TFrmCadImovelXEmpreendedorMT, False);
end;

procedure TfrmPrincipal.mnuAvisoImobClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadAvisoImob, TFrmCadAvisoImob, False);
end;

procedure TfrmPrincipal.mnuInadimplenciasClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmConsultaInadimplencia, TFrmConsultaInadimplencia, False);
end;

procedure TfrmPrincipal.mnuApuracaoIndicadoresClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmApuracaoIndicadores, TfrmApuracaoIndicadores, False);
end;


procedure TfrmPrincipal.mnuFormaCalculoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadastroFormaCalcImob, TfrmCadastroFormaCalcImob, False);
end;


procedure TfrmPrincipal.mnuItemXFormaCalcClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadItensXFormaCalculo, TfrmCadItensXFormaCalculo, False);
end;

procedure TfrmPrincipal.TiposdeDadosComplementares2Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadDadosComplMT,frmCadDadosComplMT);
  frmCadDadosComplMT.FlgOrigem := 'I';
  frmCadDadosComplMT.MontaSelect.Filtro.Add('OUTRODADO.FLGORIGEM = ''I'' ');
  frmCadDadosComplMT.FormStyle := fsMDIChild;
  frmCadDadosComplMT.Show;
end;

procedure TfrmPrincipal.miTipoComplContratoClick(
  Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadDadosComplMT,frmCadDadosComplMT);
  frmCadDadosComplMT.FlgOrigem := 'C';
  frmCadDadosComplMT.MontaSelect.Filtro.Add('OUTRODADO.FLGORIGEM = ''C'' ');
  frmCadDadosComplMT.FormStyle := fsMDIChild;
  frmCadDadosComplMT.Show;

end;

procedure TfrmPrincipal.miTipoComplUnidadeClick(
  Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadDadosComplMT,frmCadDadosComplMT);
  frmCadDadosComplMT.FlgOrigem := 'U';
  frmCadDadosComplMT.MontaSelect.Filtro.Add('OUTRODADO.FLGORIGEM = ''U'' ');
  frmCadDadosComplMT.FormStyle := fsMDIChild;
  frmCadDadosComplMT.Show;

end;

procedure TfrmPrincipal.mnuGeraContratoConfissaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecConfissaoDivida, TfrmExecConfissaoDivida, False);
end;



procedure TfrmPrincipal.mnuParametrosItensCalculoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadParamItemCalculoMT, TfrmCadParamItemCalculoMT, False);
end;



procedure TfrmPrincipal.mnuExecIntegraContabilItemClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecIntegracaoContabil, TfrmExecIntegracaoContabil, False);
end;

procedure TfrmPrincipal.mnuDadosContratoConfissaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadContratoConfissao, TfrmCadContratoConfissao, False);
end;

procedure TfrmPrincipal.mnuDesfazIntegracaoContabilClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmDesfazIntegracaoContabil, TfrmDesfazIntegracaoContabil, False);
end;

procedure TfrmPrincipal.mnuDesfazConfissaoDividaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmDesfazConfissaoDivida, TfrmDesfazConfissaoDivida, False);
end;

procedure TfrmPrincipal.mnuTipoContrImobClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTipoContratoMT, TfrmCadTipoContratoMT, False);
end;

procedure TfrmPrincipal.mnuUnidadeClick(Sender: TObject);
begin
  inherited;

  AbrirForm(frmCadUnidadeMT, TfrmCadUnidadeMT, False);
end;

procedure TfrmPrincipal.mnuItemProcClick(Sender: TObject);
begin
  inherited;

  AbrirForm(frmCadItemProcessoMT, TfrmCadItemProcessoMT, False);
end;

procedure TfrmPrincipal.mnuBloqueioJudicialClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmLancamentosBloqueados, TfrmLancamentosBloqueados, False);
end;

procedure TfrmPrincipal.mnuLancGeraRecLoteClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecGeraRecLoteMT, TfrmExecGeraRecLoteMT, False);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,liOrigemCm:Integer;
                                                    DesReport:TObject; var Config:Boolean);
var RptAdminImob : TCtrlRptAdminImob;
begin
   inherited;

// Daniel - 26239 - Início -----------------------------------------------------
   RptAdminImob := TCtrlRptAdminImob.Create;

   try
      Config := ConfigReport(liIdReports,liOrigemCm,RptAdminImob,DesReport);
      RptAdminImob.Free;
   except
      on E: Exception do
      begin
         RptAdminImob.Free;
         if (UpperCase(E.message) <> 'OPERATION ABORTED') then raise;
      end;  // on E: Exception do
   end;  // try..except
// Daniel - 26239 - Fim --------------------------------------------------------

end;

procedure TfrmPrincipal.mnuTipoEventoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTipoEventoImovelMT, TfrmCadTipoEventoImovelMT, False);
end;

procedure TfrmPrincipal.mnuCorrecaoLancImovelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAcertaLanctoImovel, TfrmAcertaLanctoImovel, False);
end;

procedure TfrmPrincipal.mnuCadVigenciaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecCadVigencia, TfrmExecCadVigencia, False);
end;

procedure TfrmPrincipal.mnuInvercaoDocClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecInversaoDoc, TfrmExecInversaoDoc, False);
end;

procedure TfrmPrincipal.DesfazerCadastrodePercentuais1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmDelPorcentagemSegreg, TfrmDelPorcentagemSegreg, False);
end;
procedure TfrmPrincipal.BaixaContraAlterador1Click(Sender: TObject);
begin
  inherited;
  //Helen - SOL: 136341 Kintana : 815095
  AbrirForm(frmCadBaixaContraAlteradorMT, TfrmCadBaixaContraAlteradorMT, False);
end;

procedure TfrmPrincipal.ConfissodeDvidas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMovContratoConfissao, TfrmMovContratoConfissao, False);
end;

procedure TfrmPrincipal.mnuConsDivergClick(Sender: TObject);
begin
  inherited;
  // Alterado por FHBS - SOL: 107772 KTN: 485678
  AbrirForm(frmConsSaldoDivergContratos, TfrmConsSaldoDivergContratos, False);
end;

procedure TfrmPrincipal.DesfazerConfissodeDvidas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMovDesfazerConfissao, TfrmMovDesfazerConfissao, False);

end;

procedure TfrmPrincipal.mnuControleAtosdeGestoClick(Sender: TObject);
begin
  inherited;
  //Ricardo SOL: 136331 Kintana: 814994
  TRY
     FrmControle_Atos_Gestao := TFrmControle_Atos_Gestao.Create(Application);
     FrmControle_Atos_Gestao.ShowModal;
  FINALLY
     FreeAndNil(FrmControle_Atos_Gestao);
  END;
end;

procedure TfrmPrincipal.mnuGestInvestClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadGestInvestImovelMestreMT, TfrmCadGestInvestImovelMestreMT, False); // Michelle Mota - SIG26054
end;

initialization
// -------------------------------------------------------------------------------------------------

   IntegraBack := TIntegraBack.Create(True, True, True);

   Sistema.NomeModulo	  := 'Administração Imobiliária';  // Nome do Módulo
   Sistema.idModulo       := 64;                           // idModulo cadastrado no SAD
   Sistema.Versao := '3.02.18g';
   Sistema.NomeAplicativo := 'Administração Imobiliária';

   Modulo := TModulo.Create;
   ModuloImobiliario := TCtrlModuloImobiliario.Create;

finalization

   Modulo.Free;
   ModuloImobiliario.Free;
   IntegraBack.Free;
end.
