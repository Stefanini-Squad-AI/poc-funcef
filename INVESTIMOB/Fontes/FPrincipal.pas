unit FPrincipal;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Rotinas   : FormCloseQuery
//Data      : 25/08/2016
//Autor     : FHBS
//SIG       : 22316
//Descrição : - Validação versão produção
//------------------------------------------------------------------------------
//Rotina......: Add no Menu
//Nº SOL......: 212226
//Nº KINTANA..: 2037651
//Data........: 08/04/2014
//Responsável.: Helio Lima Custódio
//Descrição...: Menu -> Consultas -> Histórico Vida Útil
//------------------------------------------------------------------------------
//Rotina......: Add no Menu
//Nº SOL......: 127213
//Nº KINTANA..: 672023
//Data........: 03/01/2011
//Responsável.: Helen V. Bianchi
//Descrição...: Menu -> Movimentações -> Imóveis -> Aquisição Parcelada
//------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
//
// Modificações   :  08/06/2001  1) Form aplicado ao novo módulo: Investimentos Imobiliários
//
// -----------------------------------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, uModuloInvestImob, TB97Tlwn, TB97Tlbr,
  TB97Ctls, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti, CorreioCM,
  fcLabel, AppEvnts, StdActns, ActnList, ImgList, fcStatusBar, uCtrlModuloImobiliario,
  CMApplicationEvents, CMwwQuery, SConnect, MConnect, DBClient, uResource,
  uCtrlParamCAF, uCtrlIniciaMultiTaxa, uCtrlParamIntegra, uCMClientDataSet,
  uCmSqlParams, uCtrlPadroes, CMNetUsers, FExecLancAlteradorNovo,

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  RHistoricoVidaUtil, wwstorep;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    Ofertas: TMenuItem;
    N4: TMenuItem;
    mnuProponenteProprietario: TMenuItem;
    mnuCompradorLocatario: TMenuItem;
    mnuAdministradora: TMenuItem;
    qryIntegraContab: TwwQuery;
    Indicadores: TMenuItem;
    N6: TMenuItem;
    mnuFiador: TMenuItem;
    qryIntegraContabMASCARA: TStringField;
    qryIntegraContabPLANO: TFloatField;
    qryIntegraContabPACESTORNA: TStringField;
    qryTipoInvest: TwwQuery;
    qryTipoInvestIDTIPOINVEST: TFloatField;
    qryTipoInvestDESCTIPOINVEST: TStringField;
    updTipoInvest: TUpdateSQL;
    qryContaInvest: TwwQuery;
    mnuReavaliacao: TMenuItem;
    Movimentacoes: TMenuItem;
    Imoveis1: TMenuItem;
    CadastroImovel: TMenuItem;
    qryParamGlobal: TwwQuery;
    qryParamGlobalUSACRESPON: TStringField;
    qryParamGlobalUSAABC: TStringField;
    N8: TMenuItem;
    Investimentos1: TMenuItem;
    mnuTipoRubricaInvest: TMenuItem;
    mnuTipoOperInvest: TMenuItem;
    mnuTipoRubricaXTipoOper: TMenuItem;
    N9: TMenuItem;
    mnuPadrLancInvest: TMenuItem;
    mnuTipoImovel: TMenuItem;
    mnuLancaObras: TMenuItem;
    Obras1: TMenuItem;
    qryParamGlobalCODCENTRORESPON: TStringField;
    qryParamGlobalUNIDNEGOC: TFloatField;
    Obras2: TMenuItem;
    N14: TMenuItem;
    mnuEncerraObra: TMenuItem;
    mnuAquisicaoVista: TMenuItem;
    mnuAlienacaoVista: TMenuItem;
    mnuTransferenciaGrupo: TMenuItem;
    Rentabilidade1: TMenuItem;
    qryParamCAP: TwwQuery;
    qryParamCAPMASCARADESEMB: TStringField;
    mnuCarteiraInvest: TMenuItem;
    mnuConsultaCCImovel: TMenuItem;
    mnuAcrescimoValor: TMenuItem;
    mnuDepreciacao: TMenuItem;
    mnuDesfazDepreciacao: TMenuItem;
    N7: TMenuItem;
    N16: TMenuItem;
    qryParamGlobalMOEDACORRENTE: TFloatField;
    N21: TMenuItem;
    mnuDesfazReavaliacao: TMenuItem;
    mnuBemXimovel: TMenuItem;
    N23: TMenuItem;
    mnuRecalculoCarteira: TMenuItem;
    mnuGestorCarteira: TMenuItem;
    N25: TMenuItem;
    mnuImovel: TMenuItem;
    mnuImovelXEvento: TMenuItem;
    TiposdeDadosComplementares1: TMenuItem;
    N30: TMenuItem;
    mnuProposta: TMenuItem;
    mnuHistProp: TMenuItem;
    mnuResponsavel: TMenuItem;
    mnuCartorio: TMenuItem;
    N31: TMenuItem;
    mnuGrupoImovel: TMenuItem;
    mnuMapaRC: TMenuItem;
    mnuAnaliseMapaRI: TMenuItem;
    mnuMapaRM: TMenuItem;
    mnuSeguroImovel: TMenuItem;
    mnuAnaliseIndice: TMenuItem;
    Ferramentas1: TMenuItem;
    mnuMapaTaxa: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    mnuTipoIndicador: TMenuItem;
    mnuTipoIndicadorXTipoImovel: TMenuItem;
    IndicadoresporImvel1: TMenuItem;
    N41: TMenuItem;
    mnuIndicadorXImovel: TMenuItem;
    mnuIndicadorXUnidAut: TMenuItem;
    mnuTipoDado: TMenuItem;
    mnuTipoDadoXTipoImovel: TMenuItem;
    N40: TMenuItem;
    mnuDadoXImovel: TMenuItem;
    mnuDadoXUnidAut: TMenuItem;
    N45: TMenuItem;
    mnuDadoXProposta: TMenuItem;
    N47: TMenuItem;
    mnuCriaGrupoRateio: TMenuItem;
    qryParamGlobalIDPATRO: TFloatField;
    qryParamGlobalIDPLANOPREV: TFloatField;
    mnuConsultaCCBem: TMenuItem;
    mnuConsultaHistMovCAF: TMenuItem;
    Contbeis1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    mnuConsultaPlanoConta: TMenuItem;
    N19: TMenuItem;
    mnuDesmembramento: TMenuItem;
    mnuDesfazDesmembramento: TMenuItem;
    mnuDesfazEncerraObra: TMenuItem;
    mnuRemembramento: TMenuItem;
    mnuDesfazRemembramento: TMenuItem;
    mnuRecomposicao: TMenuItem;
    N22: TMenuItem;
    mnuRecalculoCAF: TMenuItem;
    mnuRecomposicaoCarteiraCAF: TMenuItem;
    N38: TMenuItem;
    mnuRecomposicaoCarteiraRecDes: TMenuItem;
    mnuDesfazOperacoes: TMenuItem;
    mnuUtilVerificaMenu: TMenuItem;
    N5: TMenuItem;
    mnuIntegra: TMenuItem;
    ReceitaseDespesas1: TMenuItem;
    mnuTiposRecDesp: TMenuItem;
    mnuParametrosIntegracao: TMenuItem;
    mnuEtapaObra: TMenuItem;
    mnuDadosObra: TMenuItem;
    mnuCustoFinanceiro: TMenuItem;
    N1: TMenuItem;
    N10: TMenuItem;
    miAjuste: TMenuItem;
    miAjusteImplanta: TMenuItem;
    N11: TMenuItem;
    mnuDesmembraObra: TMenuItem;
    mnuDesfazDesmembraObra: TMenuItem;
    mnuLancObraReceita: TMenuItem;
    mnuMapaSeg: TMenuItem;
    N12: TMenuItem;
    mnuBens: TMenuItem;
    mnuConjuntoBens: TMenuItem;
    mnuClasseBens: TMenuItem;
    mnuGruposContabeis: TMenuItem;
    mnuLocalizacoes: TMenuItem;
    mnuParamContabil: TMenuItem;
    mnuParamCAF: TMenuItem;
    P1: TMenuItem;
    mnuTIR: TMenuItem;
    d1: TMenuItem;
    mnuPorProjeto: TMenuItem;
    N13: TMenuItem;
    sqlVerificaBEM: TCMSqlParams;
    cdsVerificaBEM: TCMClientDataSet;
    cdsCAFMoedas: TCMClientDataSet;
    sqlCAFMoedas: TCMSqlParams;
    mnuDesfazTransferencia: TMenuItem;
    c1: TMenuItem;
    mnuMapaCota: TMenuItem;
    mnuInicioDepreciacao: TMenuItem;
    mnuAcrescimoDesconto: TMenuItem;
    Button1: TButton;
    mnuAlteraAP: TMenuItem;
    N15: TMenuItem;
    BaixaIndividualdeBem1: TMenuItem;
    mnuTipoEventoImovel: TMenuItem;
    mnuRetificacaodeReavaliaocao: TMenuItem;
    mnuDesfazerRetificacao: TMenuItem;
    mnuDecrescimoValor: TMenuItem;
    N17: TMenuItem;
    mnuCorrecaoLancImovel: TMenuItem;
    mnuAquisicaoParcelada: TMenuItem;

    procedure TESTE2Click(Sender: TObject);
    procedure mnuTipoImovelClick(Sender: TObject);
    procedure mnuReavaliacaoClick(Sender: TObject);
    procedure mnuAquisicaoVistaClick(Sender: TObject);
    procedure mnuTransferenciaGrupoClick(Sender: TObject);
    procedure mnuConsultaCCImovelClick(Sender: TObject);
    procedure mnuAcrescimoValorClick(Sender: TObject);
    procedure mnuDepreciacaoClick(Sender: TObject);
    procedure mnuDesfazDepreciacaoClick(Sender: TObject);
    procedure mnuDesfazReavaliacaoClick(Sender: TObject);
    procedure mnuBemXimovelClick(Sender: TObject);
    procedure mnuImovelClick(Sender: TObject);
    procedure mnuHistPropClick(Sender: TObject);
    procedure mnuAdministradoraClick(Sender: TObject);
    procedure mnuCartorioClick(Sender: TObject);
    procedure mnuProponenteProprietarioClick(Sender: TObject);
    procedure mnuFiadorClick(Sender: TObject);
    procedure mnuCompradorLocatarioClick(Sender: TObject);
    procedure mnuResponsavelClick(Sender: TObject);
    procedure mnuImovelXEventoClick(Sender: TObject);
    procedure mnuGrupoImovelClick(Sender: TObject);
    procedure mnuMapaRCClick(Sender: TObject);
    procedure mnuAnaliseMapaRIClick(Sender: TObject);
    procedure mnuMapaRMClick(Sender: TObject);
    procedure mnuTipoDadoClick(Sender: TObject);
    procedure mnuDadoXImovelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnuTipoDadoXTipoImovelClick(Sender: TObject);
    procedure mnuDadoXPropostaClick(Sender: TObject);
    procedure mnuCriaGrupoRateioClick(Sender: TObject);
    procedure mnuConsultaCCBemClick(Sender: TObject);
    procedure mnuConsultaHistMovCAFClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure mnuDesmembramentoClick(Sender: TObject);
    procedure fcLabel2DblClick(Sender: TObject);
    procedure mnuDesfazDesmembramentoClick(Sender: TObject);
    procedure mnuRecalculoCAFClick(Sender: TObject);
    procedure mnuUtilVerificaMenuClick(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnuIntegraClick(Sender: TObject);
    procedure mnuDesfazOperacoesClick(Sender: TObject);
    procedure mnuAlienacaoVistaClick(Sender: TObject);
    procedure mnuTiposRecDespClick(Sender: TObject);
    procedure mnuParametrosIntegracaoClick(Sender: TObject);
    procedure mnuEtapaObraClick(Sender: TObject);
    procedure mnuDadosObraClick(Sender: TObject);
    procedure mnuLancaObrasClick(Sender: TObject);
    procedure mnuEncerraObraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuDesfazEncerraObraClick(Sender: TObject);
    procedure mnuCustoFinanceiroClick(Sender: TObject);
    procedure mnuConsultaPlanoContaClick(Sender: TObject);
    procedure mnuDadoXUnidAutClick(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
    procedure mnuMapaTaxaClick(Sender: TObject);
    procedure miAjusteClick(Sender: TObject);
    procedure miAjusteImplantaClick(Sender: TObject);
    procedure mnuDesmembraObraClick(Sender: TObject);
    procedure mnuDesfazDesmembraObraClick(Sender: TObject);
    procedure mnuLancObraReceitaClick(Sender: TObject);
    procedure mnuTipoIndicadorClick(Sender: TObject);
    procedure mnuTipoIndicadorXTipoImovelClick(Sender: TObject);
    procedure mnuMapaSegClick(Sender: TObject);
    procedure mnuBensClick(Sender: TObject);
    procedure mnuConjuntoBensClick(Sender: TObject);
    procedure mnuClasseBensClick(Sender: TObject);
    procedure mnuGruposContabeisClick(Sender: TObject);
    procedure mnuLocalizacoesClick(Sender: TObject);
    procedure mnuParamContabilClick(Sender: TObject);
    procedure mnuParamCAFClick(Sender: TObject);
    procedure mnuTIRClick(Sender: TObject);
    procedure mnuPorProjetoClick(Sender: TObject);
    procedure mnuRemembramentoClick(Sender: TObject);
    procedure mnuDesfazRemembramentoClick(Sender: TObject);
    procedure mnuDesfazTransferenciaClick(Sender: TObject);
    procedure mnuMapaCotaClick(Sender: TObject);
    procedure mnuInicioDepreciacaoClick(Sender: TObject);
    procedure mnuAcrescimoDescontoClick(Sender: TObject);
    procedure mnuAlteraAPClick(Sender: TObject);
    procedure BaixaIndividualdeBem1Click(Sender: TObject);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure mnuTipoEventoImovelClick(Sender: TObject);
    procedure mnuRetificacaodeReavaliaocaoClick(Sender: TObject);
    procedure Relatorios1Click(Sender: TObject);
    procedure mnuDesfazerRetificacaoClick(Sender: TObject);
    procedure mnuDecrescimoValorClick(Sender: TObject);
    procedure mnuCorrecaoLancImovelClick(Sender: TObject);
    procedure mnuAquisicaoParceladaClick(Sender: TObject);
    procedure mnuHistoricoVidaUtilClick(Sender: TObject);


  private { Private declarations }
    vFiltro : Array[1..12] of String;
    bFiltroSalvo : Boolean;

    procedure AcertaFiltroEmpresa(const sTipo:String);
    procedure EfetuaMigracaoCAF;
    Procedure Progresso(vParam : Array of Variant);

  public { Public declarations }

  end;


var
  frmPrincipal: TfrmPrincipal;



implementation
{$R *.DFM}
{$R MensagemRes.Res}

uses
  UMensErro, UDataBase, uIntegraBack, uFuncoesImob, dImobiliario, dLookImobiliario,
  uCtrlRptInvestimob, uModuloImobiliario, dBaseDados, uComunsImobiliario,

  FTesteGeral,

  RCustoContabil,
  fMTEstornaFechamento, uDiasInUteis,
  FCadImovelXBem,

  FCadHistProp,

  CRelMapaRI,
  CRelMapaRC, dAtivoFixo,
  CRelMapaRM,
  CRelMapaTAXA,
  FExecGeracaoGrupos,
  fConsultMovimCAF, fMTConsultSaldoContabBemCAF,
  dRelAdminImobRentab,
  dRelAdminImobContab,
  FExecDesmembramento, DMS, dRelInvestImob,
  fMTReconstroiSaldoCAF, FExecAquisicaoVista,
  FExecTranfTipoImovel, FExecAcrescimoNovo, FExecDecrescimoNovo,

  FParamInvestImob,    FExecIntegraLancNovo,
  FExecExcluiLanc,  FExecAlienacaoVista, FCadParamRecDes,
  fMTFechamento,  FExecReavaliacao,

  // MENUS OBRAS
  FCadObraTipoEtapa,   FExecEncerraObra,    FCadObrasCAF,
  FCadObraLancDespesa, fCadObraLancReceita, fExecDesmembraObra,
  FEstornaDesmembraObra,

  dRelCustoFinanceiro, FEstornaEncerraObra, FEstornaReavaliacao,
  RCustoFinanceiro,    BPlanoConta,

  // forms em 3 camadas
  fCadOutroDadoMT,         fCadOutroDadoXTipoImovelMT, FCadImovelMT,
  fCadOutroDadoXImovelMT,  fCadOutroDadoXUnidautMT,    fCadOutroDadoXPropMT,
  fCadIndicadorMT,         fCadIndicadorXTipoImovelMT, fCadTipoImovelMT,

  FCadTipoCustoRecMT, cRelSaldoImovel, cRelReavalia, cRelObra,

  FCadEventoImovelMT, FCadTipoEventoImovelMT,// Gustavo Mendes - 26794
  fPessoaAdministradorMT, fPessoaCartorioMT, fPessoaProprietarioMT, fPessoaLocatarioMT,
  fPessoaResponsavelMT, fPessoaAvalistaMT, fCadGrupoRateioMT, fAjustaImoRefer2,
  fMTUtilAjustaImplantaImob, CRelMapaSeg, fMTCadGrupoContabCAF, fCadParamCaf,

  fExecIniDep, // Daniel Simões - 22290


  cRelInvestPPatroPart, // Marcio Motta - 30/06/2004 - 17089

  CRelMapaTIR,  cRelTIRPorProjeto,

  dRelInvestPPatroPart, // Marcio Motta - 30/06/2004 - 17089

// Marcio Motta - 25/01/2005
  fMTCadBem,   fMTCadClassedeBem, fMTCadLocalizacao, fMTCadConjunto, fMTCadParamCAFxContab,
  FExecRemembramento, FEstornaRemembramentoMT, fAguarde,
  FEstornaTransferencia, CRelMapaCota, FVerificaMenuSAD,

  dEventoImovel,
  dCalcDocumento,
  dCAF,
  dLancImovel, FExecAltAp, FExecBaixaBem,
  fCadDadosComplMT, FexecRetificaReaval, FExecDesfazRetificacao,
  fAcertaLanctoImovel, FExecAquisicaoParc, FEstornaDesmembramento; // Daniel - 26639


//==================================================================================================



procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
var
   iAnoIni,iMesIni,iDiaIni,
   iAnoFim,iMesFim,iDiaFim  : Word;
   dDataIni, dDataFim : TDateTime;
begin
   inherited;
   try

      if Sistema.FezLogin then begin

         Screen.Cursor := crHourGlass;

         EfetuaMigracaoCAF;

         ModuloImobiliario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                      ComunsImobiliario.MensErroMT);

         ModuloImobiliario.InvestImob.GetParam(sistema.idEmpresa);
         ModuloImobiliario.AdminImob.GetParam(sistema.idEmpresa);
         ModuloImobiliario.Global.GetParam(sistema.idEmpresa);         

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

               Modulo.iPlanoPrevGlobal := qryParamGlobalIDPLANOPREV.asInteger;
               Modulo.iPatroGlobal     := qryParamGlobalIDPATRO.asInteger;
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
            Modulo.bIntegraCAPCAR   := ModuloImobiliario.InvestImob.bFlgIntegraCapCar;
            Modulo.bIntegraAtivo    := ModuloImobiliario.InvestImob.bFlgIntegraAtivo;
            Modulo.bIntegraContab   := ModuloImobiliario.InvestImob.bFlgIntegraContab;
            Modulo.bIntegraGestao   := dtmImobiliario.qryParamImobFLGINTEGRAGESTAO.asInteger = 1;

            Modulo.iPrograma        := ModuloImobiliario.InvestImob.iIdPrograma;
            Modulo.sCentroCusto     := ModuloImobiliario.InvestImob.sCodCentroCusto;

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
                  LimpaParametros(qryParamCAP);
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

         // Exibe a tela de parametros do CAF apenas se este não existir no cliente
         mnuParamCAF.Visible := not ModuloImobiliario.InvestImob.bUsaCAF;

         //----------------------------------------------------------------------------------
         // Ativa o menu com utilitários de Implantação
         //----------------------------------------------------------------------------------
         DecodeDate(strtodate('01/07/2005'),iAnoIni,iMesIni,iDiaIni);
         DecodeDate(strtodate('31/03/2006'),iAnoFim,iMesFim,iDiaFim);
         dDataIni := EncodeDate(iAnoIni,iMesIni,iDiaIni);
         dDataFim := EncodeDate(iAnoFim,iMesFim,iDiaFim);
         if (date >= dDataIni) and (date <= dDataFim) then begin
           miAjuste.Visible := False;
           miAjuste.Enabled := False;
           miAjusteImplanta.Visible  := True;
           miAjusteImplanta.Enabled  := True;
         end else begin
           miAjuste.Visible := False;
           miAjuste.Enabled := False;
           miAjusteImplanta.Visible  := False;
           miAjusteImplanta.Enabled  := False;
         end;

         DecimalSeparator := ',';
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

      Screen.Cursor := crDefault;
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



procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TdtmRelInvestImob, dtmRelInvestImob);
   Application.CreateForm(TdtmRelAdminImobRentab, dtmRelAdminImobRentab);
   Application.CreateForm(TdtmRelAdminImobContab, dtmRelAdminImobContab);
end;



//==================================================================================================
//==================================================================================================
//==================================================================================================


//==================================================================================================
//==================================================================================================
//==================================================================================================



procedure TfrmPrincipal.TESTE2Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmTesteGeral, TfrmTesteGeral, False);
end;



procedure TfrmPrincipal.mnuTipoImovelClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadTipoImovelMT, TfrmCadTipoImovelMT, False);
end;



procedure TfrmPrincipal.mnuReavaliacaoClick(Sender: TObject);
begin
   inherited;
  	AbrirForm(frmExecReavaliacao, TfrmExecReavaliacao, False);
end;



procedure TfrmPrincipal.mnuAquisicaoVistaClick(Sender: TObject);
begin
   inherited;

   AbrirForm(frmExecAquisicaoVista, TfrmExecAquisicaoVista, False);
end;
                                      


procedure TfrmPrincipal.mnuTransferenciaGrupoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecTranfTipoImovel, TfrmExecTranfTipoImovel, False);
end;



procedure TfrmPrincipal.mnuConsultaCCImovelClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmRelCustoContabil, TfrmRelCustoContabil, False);
end;



procedure TfrmPrincipal.mnuAcrescimoValorClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecAcrescimoNovo, TfrmExecAcrescimoNovo, False);
end;



procedure TfrmPrincipal.mnuDepreciacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTFechamento, TfrmMTFechamento, False);
end;



procedure TfrmPrincipal.mnuDesfazDepreciacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTEstornaFechamento, TfrmMTEstornaFechamento, False);
end;



procedure TfrmPrincipal.mnuDesfazReavaliacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmEstornaReavaliacao, TfrmEstornaReavaliacao, False);
end;



procedure TfrmPrincipal.mnuBemXimovelClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadImovelxBem, TfrmCadImovelxBem, False);
end;

procedure TfrmPrincipal.mnuImovelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadImovelMT, TfrmCadImovelMT, False);
end;

procedure TfrmPrincipal.mnuHistPropClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadHistProp, TfrmCadHistProp, False);
end;

procedure TfrmPrincipal.mnuAdministradoraClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaAdministradorMT, TfrmPessoaAdministradorMT, False);
end;

procedure TfrmPrincipal.mnuCartorioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaCartorioMT, TfrmPessoaCartorioMT, False);
end;

procedure TfrmPrincipal.mnuProponenteProprietarioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaProprietarioMT, TfrmPessoaProprietarioMT, False);
end;

procedure TfrmPrincipal.mnuFiadorClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaAvalistaMT, TfrmPessoaAvalistaMT, False);
end;

procedure TfrmPrincipal.mnuCompradorLocatarioClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaLocatarioMT, TfrmPessoaLocatarioMT, False);
end;

procedure TfrmPrincipal.mnuResponsavelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmPessoaResponsavelMT, TfrmPessoaResponsavelMT, False);
end;

procedure TfrmPrincipal.mnuImovelXEventoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadEventoImovelMT, TfrmCadEventoImovelMT, False);
end;

procedure TfrmPrincipal.mnuGrupoImovelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadGrupoRateioMT, TfrmCadGrupoRateioMT, False);
end;

procedure TfrmPrincipal.mnuMapaRCClick(Sender: TObject);
begin
  inherited;
  AbrirForm(cfgRelMapaRC, TcfgRelMapaRC, False);
end;



procedure TfrmPrincipal.mnuAnaliseMapaRIClick(Sender: TObject);
begin
   inherited;
   AbrirForm(cfgRelMapaRI, TcfgRelMapaRI, False);
end;



procedure TfrmPrincipal.mnuMapaRMClick(Sender: TObject);
begin
   inherited;
   AbrirForm(cfgRelMapaRM, TcfgRelMapaRM, False);
end;

procedure TfrmPrincipal.mnuMapaSegClick(Sender: TObject);
begin
  inherited;
   AbrirForm(cfgRelMapaSeg, TcfgRelMapaSeg, False);
end;

procedure TfrmPrincipal.mnuTipoDadoClick(Sender: TObject);
begin
  inherited;
// Daniel - 26639 - Início -----------------------------------------------------
  Application.CreateForm(TfrmCadDadosComplMT,frmCadDadosComplMT);
  frmCadDadosComplMT.FlgOrigem := 'I';
  frmCadDadosComplMT.MontaSelect.Filtro.Add('OUTRODADO.FLGORIGEM = ''I'' ');
  frmCadDadosComplMT.FormStyle := fsMDIChild;
  frmCadDadosComplMT.Show;
// Daniel - 26639 - Fim --------------------------------------------------------

end;



procedure TfrmPrincipal.mnuDadoXImovelClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadOutroDadoXImovelMT, TfrmCadOutroDadoXImovelMT, False);
end;



procedure TfrmPrincipal.mnuTipoDadoXTipoImovelClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadOutroDadoXTipoImovelMT, TfrmCadOutroDadoXTipoImovelMT, False);
end;



procedure TfrmPrincipal.mnuDadoXPropostaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadOutroDadoXPropMT, TfrmCadOutroDadoXPropMT, False);
end;



procedure TfrmPrincipal.mnuCriaGrupoRateioClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecGeracaoGrupos, TfrmExecGeracaoGrupos, False);
end;



procedure TfrmPrincipal.mnuConsultaCCBemClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTConsultSaldoContabBemCAF, TfrmMTConsultSaldoContabBemCAF, False);
end;



procedure TfrmPrincipal.mnuConsultaHistMovCAFClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmConsultMovimCAF, TfrmConsultMovimCAF, False);
end;



procedure TfrmPrincipal.mnuDesmembramentoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecDesmembramento, TfrmExecDesmembramento, False);
end;



procedure TfrmPrincipal.fcLabel2DblClick(Sender: TObject);
var i : integer;
begin
   inherited;
   for i := 0 to ComponentCount -1 do begin
      if Components[i] is TMenuItem then (Components[i] as TMenuItem).Enabled := True;
   end;
end;



procedure TfrmPrincipal.mnuDesfazDesmembramentoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmEstornaDesmembramento, TfrmEstornaDesmembramento, False);
end;



procedure TfrmPrincipal.mnuRecalculoCAFClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMTReconstroiSaldoCAF, TfrmMTReconstroiSaldoCAF, False);
end;



procedure TfrmPrincipal.mnuUtilVerificaMenuClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmVerificaMenuSAD, TfrmVerificaMenuSAD, False);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmParamInvestImob, TfrmParamInvestImob, False);
end;

procedure TfrmPrincipal.mnuIntegraClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecIntegraLancNovo, TfrmExecIntegraLancNovo, False);
end;

procedure TfrmPrincipal.mnuDesfazOperacoesClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecExcluiLanc, TfrmExecExcluiLanc, False);
end;

procedure TfrmPrincipal.mnuAlienacaoVistaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecAlienacaoVista, TfrmExecAlienacaoVista, False);
end;

procedure TfrmPrincipal.mnuTiposRecDespClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadTipoCustoRecMT, TfrmCadTipoCustoRecMT, False);
end;

procedure TfrmPrincipal.mnuParametrosIntegracaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadParamRecDes, TfrmCadParamRecDes, False);
end;

procedure TfrmPrincipal.mnuEtapaObraClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadObraTipoEtapa, TfrmCadObraTipoEtapa, False);
end;

procedure TfrmPrincipal.mnuDadosObraClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadObraCAF, TfrmCadObraCAF, False);
end;

procedure TfrmPrincipal.mnuLancaObrasClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadObraLancDespesa, TfrmCadObraLancDespesa, False);
end;

procedure TfrmPrincipal.mnuLancObraReceitaClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadObraLancReceita, TfrmCadObraLancReceita, False);
end;

procedure TfrmPrincipal.mnuEncerraObraClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecEncerraObra, TfrmExecEncerraObra, False);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   inherited;
   stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;
   Application.CreateForm(TdtmAtivoFixo, dtmAtivoFixo);
   Application.CreateForm(TdtmImobiliario, dtmImobiliario);
   Application.CreateForm(TdtmEventoImovel, dtmEventoImovel);
   Application.CreateForm(TdtmCalcDocumento, dtmCalcDocumento);
   Application.CreateForm(TdtmLookImobiliario, dtmLookImobiliario);
   Application.CreateForm(TdtmCAF, dtmCAF);
   Application.CreateForm(TdtmLancImovel, dtmLancImovel);
   Application.CreateForm(TdtmMS, dtmMS);

end;

procedure TfrmPrincipal.mnuDesfazEncerraObraClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmEstornaEncerraObra, TfrmEstornaEncerraObra, False);
end;

procedure TfrmPrincipal.mnuCustoFinanceiroClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmRelCustoFinanceiro, TfrmRelCustoFinanceiro, False);
end;

procedure TfrmPrincipal.mnuConsultaPlanoContaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(busPlanoconta, TbusPlanoconta, False);
end;

procedure TfrmPrincipal.mnuDadoXUnidAutClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadOutroDadoXUnidautMT, TfrmCadOutroDadoXUnidautMT, False);
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
var CtrlRptInvestimob :TCtrlRptInvestimob;
Begin
  inherited;
  CtrlRptInvestimob := TCtrlRptInvestimob.Create;
  try
    Printed := ShowReport(IdReports, CtrlRptInvestimob);
    CtrlRptInvestimob.Free;
  except
    CtrlRptInvestimob.Free;
    raise;
  end;
end;

procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case IdReports of
     3598: FrmPreviewReports := TcfgRelSaldoImovel.Create(Self);
     3967: FrmPreviewReports := TcfgRelReavalia.Create(Self);
    20030: FrmPreviewReports := TcfgRelObra.Create(Self);
    20114: FrmPreviewReports := TcfgRelInvestPPatroPart.Create(Self); // Marcio Motta - 30/06/2004 - 17089
  else
    FrmPreviewReports := nil;
  end;
  inherited;
end;

procedure TfrmPrincipal.mnuMapaTaxaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(cfgRelMapaTAXA, TcfgRelMapaTAXA, False);
end;

procedure TfrmPrincipal.miAjusteClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAjustaImoRefer2, TfrmAjustaImoRefer2, False);
end;

procedure TfrmPrincipal.miAjusteImplantaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTUtilAjustaImplantaImob, TfrmMTUtilAjustaImplantaImob, False);
end;

procedure TfrmPrincipal.mnuDesmembraObraClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecDesmembraObra, TfrmExecDesmembraObra, False);
end;

procedure TfrmPrincipal.mnuDesfazDesmembraObraClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmEstornaDesmembraObra, TfrmEstornaDesmembraObra, False);
end;


procedure TfrmPrincipal.mnuTipoIndicadorClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadIndicadorMT, TfrmCadIndicadorMT, False);
end;

procedure TfrmPrincipal.mnuTipoIndicadorXTipoImovelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadIndicadorXTipoImovelMT, TfrmCadIndicadorXTipoImovelMT, False);
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


procedure TfrmPrincipal.mnuBensClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTCadBem,TfrmMTCadBem,False);
end;

procedure TfrmPrincipal.mnuConjuntoBensClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTCadConjunto,TfrmMTCadConjunto,False);
end;

procedure TfrmPrincipal.mnuClasseBensClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTCadClassedeBem, TfrmMTCadClassedeBem, False);
end;

procedure TfrmPrincipal.mnuGruposContabeisClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmMTCadGrupoContabCAF,TFrmMTCadGrupoContabCAF,False);
end;

procedure TfrmPrincipal.mnuLocalizacoesClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTCadLocalizacao,TfrmMTCadLocalizacao,False);
end;

procedure TfrmPrincipal.mnuParamContabilClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMTCadParamCAFxContab,TfrmMTCadParamCAFxContab,False);
end;

procedure TfrmPrincipal.mnuParamCAFClick(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadParamCAF,TFrmCadParamCAF,False);
end;

procedure TfrmPrincipal.mnuTIRClick(Sender: TObject);
begin
  inherited;
  AbrirForm( cfgRelMapaTIR, TcfgRelMapaTIR, False );
end;

procedure TfrmPrincipal.mnuPorProjetoClick(Sender: TObject);
begin
  inherited;
  AbrirForm( cfgRelTIRPorProjeto, TcfgRelTIRPorProjeto, False );
end;

procedure TfrmPrincipal.mnuMapaCotaClick(Sender: TObject);
begin
  inherited;
  AbrirForm( cfgRelMapaCota, TcfgRelMapaCota, False );
end;

procedure TfrmPrincipal.mnuRemembramentoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecRemembramento, TfrmExecRemembramento, False);
end;

procedure TfrmPrincipal.mnuDesfazRemembramentoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmEstornaRemembramentoMT, TfrmEstornaRemembramentoMT, False);
end;

procedure TfrmPrincipal.mnuDesfazTransferenciaClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmEstornaTransferencia, TfrmEstornaTransferencia, False);
end;


procedure TfrmPrincipal.EfetuaMigracaoCAF;
var ParamCAF        : TCtrlParamCAF;
    IniciaMultiTaxa : TCtrlIniciaMultiTaxa;
begin
   try
      IniciaMultiTaxa := TCtrlIniciaMultiTaxa.Create;
      IniciaMultiTaxa.InitializeAs(Padroes);
      IniciaMultiTaxa.Progresso := Progresso;
      //-------------------------------------------------------------------------------
      try
         ParamIntegra.GetParams(Sistema.IdEmpresa,0,'INTEGRACONTAB','PARAMETROSCAFMANUT',tiSistema) ;
         //----------------------------------------------------------------------------
         ParamCAF := TCtrlParamCAF.Create;
         ParamCAF.InitializeAs(Padroes);
         //----------------------------------------------------------------------------
         // Carga dos parâmetros do sistema
         //----------------------------------------------------------------------------
         if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
         begin
            AbrirForm(FrmCadParamCaf,TFrmCadParamCaf,False);
            ParamCAF.CarregaProp(Sistema.IdEmpresa);
         end;
         //----------------------------------------------------------------------------
         // Processa a mudança para a nova modelagem (MultiTaxa)
         //----------------------------------------------------------------------------
         if ParamCAF.DTAINICAFMT = '' then
         begin
            sqlVerificaBEM.Prepare;
            sqlVerificaBEM.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
            sqlVerificaBEM.Open;
            if cdsVerificaBEM.FieldByName('QTDBEM').AsInteger > 0 then
            begin
               if MsgDlg('Essa é a primeira vez que a versão 3.02.01 do Investimob será executada ' + #13 +
                         'nesta empresa. Será necessário migrar os dados para a nova ' + #13 +
                         'modelagem e essa migração é definitiva.' + #13 + #13 +
                         'Deseja prosseguir ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
               begin
                  frmAguarde.Min := 0;
                  frmAguarde.Max := 1;
                  frmAguarde.Pos := 0;
                  frmAguarde.Mostra('Migrando para Modelo Multi-Taxa ...');
                  Application.ProcessMessages;
                  //-------------------------------------------------------------------
                  IniciaMultiTaxa.CreateThreadProgresso;
                  if not IniciaMultiTaxa.Executar(Sistema.IdEmpresa,
                                                  ParamCAF.MOEDAOFICIAL,
                                                  ParamCAF.MOEDAFISCAL,
                                                  ParamCAF.MOEDAGERENCIAL,
                                                  IniciaMultiTaxa.ProgressFileName) then
                  begin
                     IniciaMultiTaxa.FreeThreadProgresso;
                     Raise Exception.Create(IniciaMultiTaxa.MessageInfo)
                  end else
                  begin
                     IniciaMultiTaxa.FreeThreadProgresso;
                     frmAguarde.Apaga;
                     //----------------------------------------------------------------
                     MsgDlg('Migração Realizada! ' + #13 + #13 +
                            'O sistema agora irá entrar na rotina RECONSTRUIR SALDO CONTÁBIL. Ela' + #13 +
                            'deverá ser executada totalmente, com a finalidade de compatibilizar os' + #13 +
                            'saldos contábeis com o registro de movimentação na nova modelagem.',
                            'Informação',mtInformation,[mbOk],0);
                     AbrirForm(FrmMTReconstroiSaldoCAF,TFrmMTReconstroiSaldoCAF,False);
                  end;
               end else
               begin
                  Raise Exception.Create('Migração Abortada pelo Usuário!');
               end;
            end else
            begin
               //----------------------------------------------------------------------
               // Entra na função somente para atualizar ParamCAF.DTAINICAFMT
               //----------------------------------------------------------------------
               if not IniciaMultiTaxa.Executar(Sistema.IdEmpresa,
                                               ParamCAF.MOEDAOFICIAL,
                                               ParamCAF.MOEDAFISCAL,
                                               ParamCAF.MOEDAGERENCIAL,
                                               IniciaMultiTaxa.ProgressFileName) then
                  Raise Exception.Create(IniciaMultiTaxa.MessageInfo);
            end;
            cdsVerificaBEM.Close;
         end;
         //----------------------------------------------------------------------------
         // Transferir os dados da versão MultiTaxa Beta para a versão Plena
         // Função contida na classe IniciaMultiTaxa
         //----------------------------------------------------------------------------
         sqlVerificaBEM.Prepare;
         sqlVerificaBEM.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
         sqlVerificaBEM.Open;
         if cdsVerificaBEM.FieldByName('QTDBEM').AsInteger > 0 then
         begin
            sqlCAFMoedas.Prepare;
            sqlCAFMoedas.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
            sqlCAFMoedas.Open;
            if cdsCAFMoedas.IsEmpty or (cdsCAFMoedas.FieldByName('QTD').AsInteger <= 0) then
            begin
               if not IniciaMultiTaxa.MultiTaxaBeta2Plena(Sistema.IdEmpresa) then
                  Raise Exception.Create(IniciaMultiTaxa.MessageInfo);
            end;
            cdsCAFMoedas.Close;
         end;
         cdsVerificaBEM.Close;
         //----------------------------------------------------------------------------
         // Ativa o Timer de Bens Pendentes
         //----------------------------------------------------------------------------
         Screen.Cursor := crSQLWait;
         Screen.Cursor := crDefault;
      except
         On E : Exception Do
         begin
            MsgDlg(E.Message + #13 + #13 + 'Processamento Encerrado!','Erro',mtError,[mbOk],0);
            sbtnSair.Click;
         end;
      end;
   finally
      frmAguarde.Apaga;
      IniciaMultiTaxa.Free;
      ParamCAF.Free;
   end;
end;

procedure TfrmPrincipal.Progresso(vParam: array of Variant);
begin
   inherited;
   frmAguarde.Max     := vParam[1];;
   frmAguarde.Pos     := vParam[2];;
   frmAguarde.Caption := vParam[3];;
   Application.ProcessMessages;
end;



procedure TfrmPrincipal.mnuInicioDepreciacaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecIniDep, TfrmExecIniDep, False);
end;

procedure TfrmPrincipal.mnuAcrescimoDescontoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecLancAlteradorNovo, TfrmExecLancAlteradorNovo, False);
end;

procedure TfrmPrincipal.mnuAlteraAPClick(Sender: TObject);
begin
  inherited;

  AbrirForm(frmExecAltAp, TfrmExecAltAp, False);
end;

procedure TfrmPrincipal.BaixaIndividualdeBem1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecBaixaBem, TfrmExecBaixaBem, False);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,liOrigemCm:Integer;
                                                    DesReport:TObject; var Config:Boolean);
var RptInvestImob : TCtrlRptInvestImob;
begin
   inherited;

// Daniel - 26239 - Início -----------------------------------------------------
   RptInvestImob := TCtrlRptInvestImob.Create;

   try
      Config := ConfigReport(liIdReports,liOrigemCm,RptInvestImob,DesReport);
      RptInvestImob.Free;
   except
      on E: Exception do
      begin
         RptInvestImob.Free;
         if (UpperCase(E.message) <> 'OPERATION ABORTED') then raise;
      end;
   end;
// Daniel - 26239 - Fim --------------------------------------------------------

end;

procedure TfrmPrincipal.mnuTipoEventoImovelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadTipoEventoImovelMT, TfrmCadTipoEventoImovelMT, False);
end;

procedure TfrmPrincipal.mnuRetificacaodeReavaliaocaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecRetificaReaval, TfrmExecRetificaReaval, False);
end;

procedure TfrmPrincipal.Relatorios1Click(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmPrincipal.mnuDesfazerRetificacaoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecDesfazRetificacao, TfrmExecDesfazRetificacao, False);
end;

procedure TfrmPrincipal.mnuCorrecaoLancImovelClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAcertaLanctoImovel, TfrmAcertaLanctoImovel, False);
end;

procedure TfrmPrincipal.mnuDecrescimoValorClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExecDecrescimoNovo, TfrmExecDecrescimoNovo, False);
end;

procedure TfrmPrincipal.mnuAquisicaoParceladaClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmExecAquisicaoParc, TfrmExecAquisicaoParc, False);
end;
//Helio - SOL Nº 212226 KINTANA Nº 2037651
procedure TfrmPrincipal.mnuHistoricoVidaUtilClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmRelHistoricoVidaUtil, TfrmRelHistoricoVidaUtil, False);
end;
//Helio - SOL Nº 212226 KINTANA Nº 2037651

initialization
// -------------------------------------------------------------------------------------------------

   IntegraBack := TIntegraBack.Create(True, True, True);

   Sistema.NomeModulo	  := 'Investimentos Imobiliários';
   Sistema.idModulo    	  := 54;
   Sistema.Versao := '3.02.18f';
   Sistema.NomeAplicativo := 'Investimentos Imobiliários';

   Modulo := TModulo.Create;
   ModuloImobiliario := TCtrlModuloImobiliario.Create;



finalization
   Modulo.Free;
   IntegraBack.Free;
   ModuloImobiliario.Free;
end.
