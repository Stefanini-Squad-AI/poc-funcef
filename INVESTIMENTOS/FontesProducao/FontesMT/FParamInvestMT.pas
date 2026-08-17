//******************************************************************************
// Data      : 03/10/2007
// Código    : AL_13
// Desc      : Passado o campo VLRDIVERG para a aba de Renda Variável pois é
//             utilizado na alteração de taxas de Renda Variavel
//******************************************************************************
// Data      : 27/06/2007
// Código    : AL_12
// Pendencia : 25703
// Motivo    : Retirada a autorização de alteração das datas de último fechamento para todos os módulos do Sistema.
//******************************************************************************
// Data      : 16/03/2007
// Código    : AL_11
// Pendencia : 24774
// SOL       : 55877
// Desc      : Ajuste na navegação
//******************************************************************************
// Data      : 16/03/2007
// Código    : AL_10
// Pendencia : 24774
// SOL       : 55877
// Desc      : Implementação de Bloqueio Contabil e Financeiro por Módulo
//******************************************************************************
// Data      : 16/02/2007
// Código    : AL_9
// Pendencia : 22779
// SOL       : 43633
// Desc      : Implementação de mais de um TRC entre Planos
//******************************************************************************
// Data      : 02/02/2007
// Código    : AL_8
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação do paramentro IDMOTBLOQPENFDO, IDCARTEIRARF para Bloqueio de
//             Fundos e Penhora com o Jurídico
//******************************************************************************
// Data      : 06/11/2006
// Código    : AL_7
// Pendencia : 22492
// Desc      : Implementação de Contabilização em dias úteis para ativos de
//             Renda Fixa que geram registros em dias não uteis
//             Contabiliza FLGCONTABDIAUTIL
//*****************************************************************************
//Data	    : 02/10/2006
//Código    : Al_6
//Pendencia : 22967
//Motivo(S) : Alteração na chamada do método para preebcher o CDS de Planos
//*****************************************************************************
//Data	    : 12/05/2006
//Código    : Al_5
//Pendencia :
//Motivo(S) : Alteração no layout.
//*****************************************************************************
//Data	    : 21/02/2006
//Código    : Al_4
//Motivo(S) : Ajustes nos controles de sistema em fechamento, se desmarcar já
//               exclui o nome do usuário
//******************************************************************************
// Data     : 23/02/2006
// Código   : AL_3
// Motivo   : Criação da pasta de CPMF e dos campos PZORECCPMF na PARAMINVEST
//            para identificar o dia para recolhimento do CPMF
//******************************************************************************
// Data     : 03/02/2006
// Código   : AL_2
// Motivo   : Criação do campo MASCSCLASSIFANBID na PARAMINVEST para tratar a máscara
//            do código da Classificacao ANBID
//******************************************************************************
// Data     : 06/12/2005
// Código   : AL_1
// Pendencia: 20901
// Sol      : 38821
// Motivo   : Criação do campo IDTIPOOPERDIRDSA, IDTIPOOPERDIRDSR,
//            DTAREGIMECXCOMP, FLGREGIMECXCOMP na PARAMINVEST
//******************************************************************************

unit FParamInvestMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  TREdit, wwdblook, wwdbdatetimepicker, CMDateTimePicker, ComCtrls, Mask, wwdbedit,
  Provider, uCtrlPadroes, uCtrlBMeF, uCtrlParamInvest, uCtrlInvestimento, uCtrlRendaVariavel,
  uCtrlRendaFixa, uCtrlFundos, Wwdotdot, Wwdbcomb, uCmSqlParams, uInvestimento,
  fcLabel;

type
  TFrmParamInvestMT = class(TFrmCadastroMT)

    CdsCustodiante           : TCMClientDataSet;
    CdsContraParte           : TCMClientDataSet;
    CdsItemRenFix            : TCMClientDataSet;
    CdsClasseRenFix          : TCMClientDataSet;
    CdsMoeda                 : TCMClientDataSet;
    CdsUsuario               : TCMClientDataSet;
    CdsPatroPlanPrevContab   : TCMClientDataSet;
    CdsAutorizadorDeOperacao : TCMClientDataSet;
    CdsCarteiraRenVar        : TCMClientDataSet;
    CdsBolsaValores          : TCMClientDataSet;
    CdsTipoOperRenVar        : TCMClientDataSet;
    CdsMotivoBloqueio        : TCMClientDataSet;
    CdsGrupoRegra            : TCMClientDataSet;
    CdsTipoRegra             : TCMClientDataSet;
    CdsTipoInvestidor        : TCMClientDataSet;
    CdsMercado               : TCMClientDataSet;
    CdsTipoFundo             : TCMClientDataSet;
    CdsRegra                 : TCMClientDataSet;
    CdsTipoPeriodicidade     : TCMClientDataSet;
    CdsParamEmissor          : TCMClientDataSet;
    CdsTipoContrInvest       : TCMClientDataSet;
    CdsTipoCliente           : TCMClientDataSet;
    CdsRamoFornecedor        : TCMClientDataSet;
    CdsPrograma              : TCMClientDataSet;

    pgcParametros: TPageControl;
    tbsRendaFixa: TTabSheet;
    tbsSistema: TTabSheet;
    tbsRendaVariavel: TTabSheet;
    tbsOpcoes: TTabSheet;
    tbsRegra: TTabSheet;
    tbsBMF: TTabSheet;
    tbsFundos: TTabSheet;
    tbsEmprestimos: TTabSheet;
    CdsAux: TCMClientDataSet;
    CMSqlParamsAux: TCMSqlParams;
    pnlSistema: TPanel;
    pgcSistema: TPageControl;
    tbsImpostos: TTabSheet;
    pnlImpostos: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Label18: TLabel;
    Label77: TLabel;
    dblIndexadorIR: TwwDBLookupCombo;
    dtpDataUltRet: TCMDateTimePicker;
    dbckStaRET: TDBCheckBox;
    ckbProvRV: TDBCheckBox;
    ckbProvRF: TDBCheckBox;
    tbsCpmf: TTabSheet;
    pnlCmpf: TPanel;
    Panel9: TPanel;
    Panel29: TPanel;
    Label84: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label51: TLabel;
    Label50: TLabel;
    dbdDtaIniRecCPMF: TCMDateTimePicker;
    dbcPzoCPMF: TwwDBComboBox;
    dbeDiasUteisCPMF: TwwDBEdit;
    dbcDiaSemCPMF: TwwDBComboBox;
    tbsIntContFin: TTabSheet;
    pnlIntContFin: TPanel;
    pnlIntContFinGeral: TPanel;
    gpbCliente: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    dblCorretora: TwwDBLookupCombo;
    dblEmissor: TwwDBLookupCombo;
    dblCustodiate: TwwDBLookupCombo;
    gpbFornecedor: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    dblRamoForCor: TwwDBLookupCombo;
    dblRamoForEmi: TwwDBLookupCombo;
    dblRamoForCus: TwwDBLookupCombo;
    tbsGeral: TTabSheet;
    pnlGeral: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    Label64: TLabel;
    Label57: TLabel;
    lblPrzVencCFianca: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label76: TLabel;
    DbLkcBuscaMoeda: TwwDBLookupCombo;
    dblkPlanPrevCtbPatro: TwwDBLookupCombo;
    dblAutorizaOrdem: TwwDBLookupCombo;
    dbrePrzVencCFianca: TDBRealEdit;
    DBEdMascara: TwwDBEdit;
    DbMascClassif: TDBEdit;
    DblIndiceEQM: TwwDBLookupCombo;
    Panel10: TPanel;
    dbckCartGerenc: TDBCheckBox;
    dbchRegCxComp: TDBCheckBox;
    dtRegCxComp: TCMDateTimePicker;
    dbdDtaMudaCpmf: TCMDateTimePicker;
    Label17: TLabel;
    pnlRendaFixa: TPanel;
    pnlRFixa1: TPanel;
    lblUltAbertura: TLabel;
    lblCustodianteRFixa: TLabel;
    lblContraParteRFixa: TLabel;
    lblItemIncJurRFixa: TLabel;
    lblItemPagtoJurRFixa: TLabel;
    lblAmortRFixa: TLabel;
    lblClassePoupanca: TLabel;
    dbdDtaFechRf: TCMDateTimePicker;
    dblCustodianteRenFix: TwwDBLookupCombo;
    dblkContraParte: TwwDBLookupCombo;
    dblkOperIncJuros: TwwDBLookupCombo;
    dblkOperPagtoJuros: TwwDBLookupCombo;
    dblkOperAmortPrinc: TwwDBLookupCombo;
    dblkClassePoupanca: TwwDBLookupCombo;
    pnlRFixa2: TPanel;
    lblClassePoupancaBloq: TLabel;
    lblIndicePoupanca: TLabel;
    lblTaxaJurosPoupanca: TLabel;
    dblCassePoupBloq: TwwDBLookupCombo;
    dblkMoedaPoupanca: TwwDBLookupCombo;
    dbreTaxaJurosPoupanca: TDBRealEdit;
    chkRFEmAbertura: TDBCheckBox;
    dblUsuarioProcRF: TwwDBLookupCombo;
    dbckFlgPoupApropDia: TDBCheckBox;
    pnlOpcoes: TPanel;
    Panel21: TPanel;
    grpOpcoesAcoes: TGroupBox;
    lblCartOpcoes: TLabel;
    lblTPOperCpOpc: TLabel;
    lblTPOperVdOpc: TLabel;
    dblkCartOpcoes: TwwDBLookupCombo;
    dblkTPOperCpOpc: TwwDBLookupCombo;
    dblkTPOperVdOpc: TwwDBLookupCombo;
    grpOpcoesIndices: TGroupBox;
    Label79: TLabel;
    lblCarOpcoesInd: TLabel;
    lblMotBloqOpc: TLabel;
    dbrLimDifCestaOpcInd: TDBRealEdit;
    dblkCartOpcInd: TwwDBLookupCombo;
    dblkMotBloqOpc: TwwDBLookupCombo;
    Panel22: TPanel;
    pnlRegra: TPanel;
    Panel20: TPanel;
    lblGrupoRegra: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label54: TLabel;
    Label53: TLabel;
    Label55: TLabel;
    lblTpRegraEmpAcoes: TLabel;
    dblkGrupoRegra: TwwDBLookupCombo;
    dblTipoRegraRent: TwwDBLookupCombo;
    dblTipoRegraAtuarial: TwwDBLookupCombo;
    dblTipoRegraRV: TwwDBLookupCombo;
    dblTipoRegraRF: TwwDBLookupCombo;
    dblTipoRegraBMF: TwwDBLookupCombo;
    dblkTpRegraEmpAcoes: TwwDBLookupCombo;
    Panel19: TPanel;
    lblTpRegraOpcAc: TLabel;
    lblTpRegraOpcInd: TLabel;
    dblkTpRegraOpcAc: TwwDBLookupCombo;
    dblkTpRegraOpcInd: TwwDBLookupCombo;
    pnlBmf: TPanel;
    Panel11: TPanel;
    Label68: TLabel;
    Label37: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label49: TLabel;
    lblPrzVencBMF: TLabel;
    dbdDtaFechBMF: TCMDateTimePicker;
    dblBMF: TwwDBLookupCombo;
    dblTipoInvestidorBMF: TwwDBLookupCombo;
    dblMercadoBMF: TwwDBLookupCombo;
    dbrPercDevBMF: TDBRealEdit;
    dbrePrzVencBMF: TDBRealEdit;
    Panel12: TPanel;
    pnlFundoInvest: TPanel;
    Panel13: TPanel;
    Label45: TLabel;
    lblDifResgate: TLabel;
    lblTipoFundo: TLabel;
    lblMaskANBID: TLabel;
    dbdDtaFechFdo: TCMDateTimePicker;
    dbrDifResgate: TDBRealEdit;
    dblTipoFundo: TwwDBLookupCombo;
    chkFundosEmAbertura: TDBCheckBox;
    dblUsuarioProcFundos: TwwDBLookupCombo;
    dbeMaskANBID: TDBEdit;
    Panel14: TPanel;
    pnlEmprestimo: TPanel;
    Panel5: TPanel;
    Label60: TLabel;
    Label61: TLabel;
    Label59: TLabel;
    Label74: TLabel;
    dbcFlgEmpAcoes: TDBCheckBox;
    dblkRegraEmpAcoes: TwwDBLookupCombo;
    dblkMotivoBloqueio: TwwDBLookupCombo;
    dblkCartEmpAcoes: TwwDBLookupCombo;
    dtpUltFechEmp: TCMDateTimePicker;
    Panel6: TPanel;
    pnlRendaVariavel: TPanel;
    pgcRendaVariavel: TPageControl;
    tbsRVGeral: TTabSheet;
    pnlRVGeral: TPanel;
    Panel2: TPanel;
    Label6: TLabel;
    Label44: TLabel;
    lblCartAVista: TLabel;
    Label34: TLabel;
    Label38: TLabel;
    Label48: TLabel;
    dbdDtaFechRv: TCMDateTimePicker;
    dtpDataUltImpCot: TCMDateTimePicker;
    dblkCartAVista: TwwDBLookupCombo;
    dblBovespa: TwwDBLookupCombo;
    dblTipoOperLiqPend: TwwDBLookupCombo;
    dbrPercDevRV: TDBRealEdit;
    dbckFlgCompVarRV: TDBCheckBox;
    Panel3: TPanel;
    dbckFLGRECPAGRV: TDBCheckBox;
    chkRVEmAbertura: TDBCheckBox;
    dblUsuarioProcRV: TwwDBLookupCombo;
    tbsDireitos: TTabSheet;
    pnlDireitos: TPanel;
    Panel7: TPanel;
    Label21: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Label46: TLabel;
    Label73: TLabel;
    dblDividendos: TwwDBLookupCombo;
    dblJurosCapital: TwwDBLookupCombo;
    dblBonificacao: TwwDBLookupCombo;
    dblSubscricao: TwwDBLookupCombo;
    dblCisao: TwwDBLookupCombo;
    dbRestituicaoCapital: TwwDBLookupCombo;
    dbReestruturacaoSoc: TwwDBLookupCombo;
    Panel8: TPanel;
    Label28: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label29: TLabel;
    Label43: TLabel;
    Label63: TLabel;
    Label75: TLabel;
    dblIncorporacao: TwwDBLookupCombo;
    dblGrupamento: TwwDBLookupCombo;
    dblDesdobramento: TwwDBLookupCombo;
    dblPermuta: TwwDBLookupCombo;
    dblAlteracaoTipo: TwwDBLookupCombo;
    dblkOperMultaAtrazo: TwwDBLookupCombo;
    dblResgFdoAnuncioProv: TwwDBLookupCombo;
    Panel26: TPanel;
    Label78: TLabel;
    lblRecFracionado: TLabel;
    dblDireitoSubscricao: TwwDBLookupCombo;
    dblkRecFracionado: TwwDBLookupCombo;
    CdsTipoDespInv: TCMClientDataSet;
    Label85: TLabel;
    dblkBloqPenFdo: TwwDBLookupCombo;
    //AL_8
    CdsMotivoBloqFdo: TCMClientDataSet;
    lblCarteiraRF: TLabel;
    dblkCarteiraRF: TwwDBLookupCombo;
    CdsCarteiraRF: TCMClientDataSet;
    Panel25: TPanel;
    pgcContFin: TPageControl;
    tbsContFinGeral: TTabSheet;
    Panel15: TPanel;
    Label33: TLabel;
    dbckContabDiaUtil: TDBCheckBox;
    dbckIntFinLiq: TDBCheckBox;
    dbchPlanPrevPatro: TDBCheckBox;
    dbckUsaSubConta: TDBCheckBox;
    dblPrograma: TwwDBLookupCombo;
    tbsContFinModulos: TTabSheet;
    Panel31: TPanel;
    pnlMensagemContabFinan: TPanel;
    fcLabel1: TfcLabel;
    pnlBloqRF: TPanel;
    pnlMensBloqRF: TPanel;
    Panel33: TPanel;
    chkFlgIntContabRF: TDBCheckBox;
    pnlBloqRV: TPanel;
    pnlMensBloqRV: TPanel;
    Panel36: TPanel;
    chkFlgIntContabRV: TDBCheckBox;
    pnlBloqBMF: TPanel;
    pnlMensBloqBMF: TPanel;
    Panel35: TPanel;
    chkFlgIntContabBMF: TDBCheckBox;
    pnlBloqFRF: TPanel;
    pnlMensBloqFRF: TPanel;
    Panel37: TPanel;
    chkFlgIntContabFRF: TDBCheckBox;
    pnlBloqFRV: TPanel;
    pnlMensBloqFRV: TPanel;
    Panel38: TPanel;
    chkFlgIntContabFRV: TDBCheckBox;
    pnlBloqFIM: TPanel;
    pnlMensBloqFIM: TPanel;
    Panel39: TPanel;
    chkFlgIntContabFIM: TDBCheckBox;
    pnlBloqFDC: TPanel;
    pnlMensBloqFDC: TPanel;
    Panel40: TPanel;
    chkFlgIntContabFDC: TDBCheckBox;
    pnlBloqFIP: TPanel;
    pnlMensBloqFIP: TPanel;
    Panel41: TPanel;
    chkFlgIntContabFIP: TDBCheckBox;
    Label4: TLabel;
    dbrLimiteVlrDiverg: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBEdMascaraKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure DbMascClassifKeyPress(Sender: TObject; var Key: Char);
    procedure dbdDtaFechRfEnter(Sender: TObject);
    procedure dblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoFundoChange(Sender: TObject);
    procedure dbchRegCxCompExit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure dbeMaskANBIDKeyPress(Sender: TObject; var Key: Char);
    procedure chkRVEmAberturaClick(Sender: TObject);
    procedure chkRFEmAberturaClick(Sender: TObject);

    //AL_11
    procedure VerBloqClick(Sender: TObject);
    procedure cdsAfterOpen(DataSet: TDataSet);

  private
    { Private declarations }
    CtrlParamInvest   : TCtrlParamInvest;
    CtrlInvestimento  : TCtrlInvestimento;
    CtrlRendaFixa     : TCtrlRendaFixa;
    CtrlRendaVariavel : TCtrlRendaVariavel;
    CtrlBMeF          : TCtrlBMeF;
    CtrlFundos        : TCtrlFundos;
    dDataFechRF : TDateTime;
    sSql : String;

    procedure HabilitaTabSheets;
    procedure DesabilitaTabSheets;
    procedure Seleciona(iIdParam : Integer = -1);
    //AL_11
    procedure VerModuloBloqueado(iModulo: Word; bIntegra: Boolean);
  public
    { Public declarations }
  end;

var
  FrmParamInvestMT: TFrmParamInvestMT;

implementation


{$R *.DFM}

uses uSistema, dBaseDados, uMensErro, UOperacaoInvest, FAutorizaParametros,
     URendaFixa, UBibliotecaInvest, FTelaAut, UFundoComum;

procedure TFrmParamInvestMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlParamInvest   := TCtrlParamInvest.Create;
   CtrlRendaFixa     := TCtrlRendaFixa.Create;
   CtrlInvestimento  := TCtrlInvestimento.Create;
   CtrlRendaVariavel := TCtrlRendaVariavel.Create;
   CtrlBMeF          := TCtrlBMeF.Create;
   CtrlFundos        := TCtrlFundos.Create;

   CtrlParamInvest.InitializeAs(Padroes);
   CtrlInvestimento.InitializeAs(Padroes);
   CtrlRendaFixa.InitializeAs(Padroes);
   CtrlRendaVariavel.InitializeAs(Padroes);
   CtrlBMeF.InitializeAs(Padroes);
   CtrlFundos.InitializeAs(Padroes);

   CtrlParamInvest.CdsParamInvest := Cds;
   Cds.Data := CtrlParamInvest.ListParamInvest(Investimentos.IDEmpresa);

   CdsContraParte.Data           := CtrlInvestimento.ListContraParte;
   CdsMoeda.Data                 := CtrlInvestimento.ListMoeda;
   //AL_6
   CdsPatroPlanPrevContab.Data   := CtrlInvestimento.ListPlanoPatro;
   CdsAutorizadorDeOperacao.Data := CtrlInvestimento.ListAutorizadorDeOperacao;
   CdsCustodiante.Data           := CtrlInvestimento.ListCustodiante;
   CdsMotivoBloqueio.Data        := CtrlInvestimento.ListMotivoBloqueio;
   CdsGrupoRegra.Data            := CtrlInvestimento.ListGrupoRegra;
   CdsTipoRegra.Data             := CtrlInvestimento.ListTipoRegra;
   CdsMercado.Data               := CtrlInvestimento.ListMercado;
   CdsRegra.Data                 := CtrlInvestimento.ListRegra;
   CdsTipoPeriodicidade.Data     := CtrlInvestimento.ListTipoPeriodicidade;
   CdsParamEmissor.Data          := CtrlInvestimento.ListParamEmissor;
   CdsTipoContrInvest.Data       := CtrlInvestimento.ListTipoContratoInvest;
   CdsTipoCliente.Data           := CtrlInvestimento.ListTipoCliente;
   CdsRamoFornecedor.Data        := CtrlInvestimento.ListRamoFornecedor;
   CdsPrograma.Data              := CtrlInvestimento.ListPrograma;

   CdsItemRenFix.Data            := CtrlRendaFixa.ListItemRenFix;
   CdsUsuario.Data               := CtrlRendaFixa.ListUsuarioRenFix;
   CdsClasseRenFix.Data          := CtrlRendaFixa.ListClasseRenFix;

   CdsCarteiraRenVar.Data        := CtrlRendaVariavel.ListCarteiraRenVar;
   CdsBolsaValores.Data          := CtrlRendaVariavel.ListBolsaValores;
   CdsTipoOperRenVar.Data        := CtrlRendaVariavel.ListTipoOperRenVar;

   CdsTipoInvestidor.Data        := CtrlBMeF.ListTipoInvestidor;

   CdsTipoFundo.Data             := CtrlFundos.ListTipoFundoInvest;

   pgcParametros.ActivePage      := tbsGeral;
   //AL_8
   CdsMotivoBloqFdo.Data         := CtrlInvestimento.ListMotivoBloqueio;
   CdsCarteiraRF.Data            := CtrlRendaFixa.ListCarteiraRixa;
end;

procedure TFrmParamInvestMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(CtrlParamInvest);
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlRendaFixa);
   FreeAndNil(CtrlRendaVariavel);
   FreeAndNil(CtrlBMeF);
   FreeAndNil(CtrlFundos);
  inherited;
end;

procedure TFrmParamInvestMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
   if not(CtrlParamInvest.AplicaAtualParamInvest) then
      MsgDlg(CtrlParamInvest.MessageInfo,'Erro',mtError,[mbOK],0)
   else
      Cds.Data := CtrlParamInvest.ListParamInvest(Investimentos.IDEmpresa);

end;

procedure TFrmParamInvestMT.FormShow(Sender: TObject);
begin
  inherited;
   sbtnAlterar.Enabled := True;

   //AL_8
   pgcParametros.ActivePage := tbsSistema;

   DesabilitaTabSheets;

   dbckCartGerenc.Checked   := (cds.FieldByName('FLGCARTGERENC').AsString = 'S');
   dbchRegCxComp.Checked    := (cds.FieldByName('FLGREGIMECXCOMP').AsString = 'S');

   dbckStaRET.Checked       := (cds.FieldByName('STARET').AsString = 'S');

   ckbProvRV.Checked        := (cds.FieldByName('FLGPROVISIONAIRRV').AsString = 'S');
   ckbProvRF.Checked        := (cds.FieldByName('FLGPROVISIONAIRRF').AsString = 'S');

   dbckUsaSubConta.Checked  := (cds.FieldByName('FLGUSASUBCONTA').AsString = 'S');
   dbchPlanPrevPatro.Checked:= (cds.FieldByName('FLGPLANPREVCTBPAT').AsString = 'S');
   dbckIntFinLiq.Checked    := (cds.FieldByName('FLGINTFINLIQ').AsString = 'S');

   chkRFEmAbertura.Checked  := (cds.FieldByName('FLGRFEMABERTURA').AsString = 'S');
   dbckFlgPoupApropDia.Checked := (cds.FieldByName('FLGPOUPAPROPDIA').AsString = 'S');
   dbcFlgEmpAcoes.Checked   := (cds.FieldByName('FLGEMPACOES').AsString = 'S');
   //AL_7
   dbckContabDiaUtil.Checked := (cds.FieldByName('FLGCONTABDIAUTIL').AsString = 'S');

   //AL_10
   chkFlgIntContabRF.Checked  := (cds.FieldByName('FLGINTCONTABRF').AsString = 'S');
   chkFlgIntContabRV.Checked  := (cds.FieldByName('FLGINTCONTABRV').AsString = 'S');
   chkFlgIntContabBMF.Checked := (cds.FieldByName('FLGINTCONTABBMF').AsString = 'S');
   chkFlgIntContabFRF.Checked := (cds.FieldByName('FLGINTCONTABFRF').AsString = 'S');
   chkFlgIntContabFRV.Checked := (cds.FieldByName('FLGINTCONTABFRV').AsString = 'S');
   chkFlgIntContabFIM.Checked := (cds.FieldByName('FLGINTCONTABFIM').AsString = 'S');
   chkFlgIntContabFDC.Checked := (cds.FieldByName('FLGINTCONTABFDC').AsString = 'S');
   chkFlgIntContabFIP.Checked := (cds.FieldByName('FLGINTCONTABFIP').AsString = 'S');
   //AL_11
   pgcParametros.ActivePage := tbsSistema;
   pgcContFin.ActivePage := tbsContFinGeral;

end;

procedure TFrmParamInvestMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   sbtnAlterar.Enabled := True;

   // Reabilita Mascara
   DBEdMascara.Enabled     := True;
   DBEdMascara.Color       := ClWhite;
   DbMascClassif.Enabled   := True;
   DbMascClassif.Color     := ClWhite;
   pgcParametros.ActivePage:= tbsGeral;
   DesabilitaTabSheets;
end;

procedure TFrmParamInvestMT.DBEdMascaraKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if  (key = '.') and (Copy(dbedMascara.Text,Length(dbedMascara.Text),1) = '.') then
  begin
     MessageBeep(0);
     ShowMessage('Digitar 9 ou . ');
     key := #0;
     Exit;
  end;
  if (key <> '9') and (key <> '.') and (key <> #8) then
  begin
     MessageBeep(0);
     ShowMessage('Digitar 9 ou . ');
     key := #0;
     Exit;
  end;
  if (key <> '9') and (Length(dbedMascara.Text) = 0)  then
  begin
     MessageBeep(0);
     ShowMessage('Digitar 9 ou . ');
     key := #0;
  end;
end;

procedure TFrmParamInvestMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if dDataFechRF > dbdDtaFechRf.DateTime then
  begin
     if MsgDlg('A alteração da data do fechamento de Renda Fixa '+#13+
               'implicará na exclusão de todas as atualizações '+#13+
               'com data superior a ' + dbdDtaFechRf.Text,
               'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then
     begin
        if MsgDlg('Exclui Também as Operações Cadastradas ?', 'Confirmação',
                  mtConfirmation,[mbYes, mbNo],0) = mrYes then
        begin
           //AL_9
           if not RendaFixa.ExcluiHistRenFix(dbdDtaFechRf.DateTime,False,-1,-1,-1,-1,True) then
              Exit;
        end
        else
        begin
           //AL_9
           if not RendaFixa.ExcluiHistRenFix(dbdDtaFechRf.DateTime,False,-1,-1,-1,-1,False) then
              Exit;
        end;
     end;
  end;
  //AL_1 Ini
  if (dbchRegCxComp.checked) and (Trim(dtRegCxComp.Text) = '') then
  begin
      MsgDlg('Falta informar a Data Inicial de utilização de Regime de Caixa.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtRegCxComp.CanFocus then
         dtRegCxComp.SetFocus;
      Exit;
  end;
  //AL_1 Fim
  inherited;
  // Reabilita Mascara
  DBEdMascara.Enabled      := True;
  DBEdMascara.Color        := ClWhite;
  DbMascClassif.Enabled    := True;
  DbMascClassif.Color      := ClWhite;
  pgcParametros.ActivePage := tbsGeral;
  //AL_11
  pgcContFin.ActivePage := tbsContFinGeral;
  DesabilitaTabSheets;
  CtrlParamInvest.GetParamsInvest(Sistema.IdEmpresa);
end;

procedure TFrmParamInvestMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   if Cds.FieldByName('FLGDEMO').isNull then Cds.FieldByName('FLGDEMO').AsString := 'N';
   // Liberação dos menus exclusivos dos Analistas CM
   if (Pos('.CM',Sistema.NomeUsuario) <> 0) or
      (AbrirFormModal(frmAutorizaParametros,TfrmAutorizaParametros) = mrOk) then
   begin
      HabilitaTabSheets;

      //AL_12
      dbdDtaFechRv.Enabled     := (Pos('.CM',Sistema.NomeUsuario) <> 0);
      dtpDataUltImpCot.Enabled := (Pos('.CM',Sistema.NomeUsuario) <> 0);
      dbdDtaFechRf.Enabled     := (Pos('.CM',Sistema.NomeUsuario) <> 0);
      dbdDtaFechFdo.Enabled    := (Pos('.CM',Sistema.NomeUsuario) <> 0);
      dtpUltFechEmp.Enabled    := (Pos('.CM',Sistema.NomeUsuario) <> 0);
      dbdDtaFechBMF.Enabled    := (Pos('.CM',Sistema.NomeUsuario) <> 0);

      // Verifica se Existe Registro de Setor
      with CdsAux do
      begin
         Close;
         sSql := 'Select SE.CodSetorEmissor from SetorEmissor SE';
         CdsAux.Data := CtrlInvestimento.ListCdsAux(sSql);
         if not IsEmpty then
         begin
            DBEdMascara.Enabled := False;
            DBEdMascara.Color   := ClBtnFace;
         end
         else
         begin
            DBEdMascara.Enabled := True;
            DBEdMascara.Color   := ClWhite;
            Inherited;
         end;
         Close;
      end;
      // Verifica se Existe Registro Classificacao
      with CdsAux do
      begin
         Close;
         sSql := 'SELECT CODCLASSINVEST FROM CLASSIFINVEST ';
         CdsAux.Data := CtrlInvestimento.ListCdsAux(sSql);
         Open;
         if not IsEmpty then
         begin
            DbMascClassif.Enabled := False;
            DbMascClassif.Color   := ClBtnFace;
         end
         else
         begin
            DbMascClassif.Enabled := True;
            DbMascClassif.Color   := ClWhite;
            Inherited;
        end;
        Close;
      end;
   end;
end;

procedure TFrmParamInvestMT.DbMascClassifKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if (key <> '9') and (key <> '.') and (key <> #8) then
   begin
      MessageBeep(0);
      MsgDlg('Digitar 9 ou . ', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      key := #0;
      Exit;
   end;
end;

procedure TFrmParamInvestMT.HabilitaTabSheets;
var I: Integer;
begin
   pnlFundo.Enabled   := True;
   //Al_5
   pnlSistema.Enabled := True;
   pnlRendaVariavel.Enabled := True;

   pgcParametros.Enabled    := True;
   for I := 0 to pgcParametros.ControlCount -1 do
      if pgcParametros.Controls[I] is TTabSheet then
         TTabSheet(pgcParametros.Controls[I]).Enabled    := True;

   //Al_5
   pgcSistema.Enabled := True;
   for I := 0 to pgcSistema.ControlCount -1 do
      if pgcSistema.Controls[I] is TTabSheet then
         TTabSheet(pgcSistema.Controls[I]).Enabled       := True;

   //AL_11
   tbsIntContFin.Enabled := True;
   pnlIntContFinGeral.Enabled := True;
   pgcContFin.Enabled   := True;
   for I := 0 to pgcContFin.ControlCount -1 do
      if pgcContFin.Controls[I] is TTabSheet then
         TTabSheet(pgcContFin.Controls[I]).Enabled   := True;

   pgcRendaVariavel.Enabled := True;
   for I := 0 to pgcRendaVariavel.ControlCount -1 do
      if pgcRendaVariavel.Controls[I] is TTabSheet then
         TTabSheet(pgcRendaVariavel.Controls[I]).Enabled := True;

end;

procedure TFrmParamInvestMT.DesabilitaTabSheets;
var I: Integer;
begin
   pnlFundo.Enabled   := True;
   //Al_5
   pnlSistema.Enabled := True;
   pnlRendaVariavel.Enabled := True;

   //AL_15
   dbLTipoFundo.Text              := '';
   chkFundosEmAbertura.DataField  := '';
   dblUsuarioProcFundos.DataField := '';
   chkFundosEmAbertura.Enabled    := False;
   dblUsuarioProcFundos.Enabled   := False;

   pgcParametros.Enabled    := True;
   for I := 0 to pgcParametros.ControlCount -1 do
      if pgcParametros.Controls[I] is TTabSheet then
         TTabSheet(pgcParametros.Controls[I]).Enabled    := false;

   //Al_5
   tbsSistema.Enabled := True;
   pgcSistema.Enabled := True;
   for I := 0 to pgcSistema.ControlCount -1 do
      if pgcSistema.Controls[I] is TTabSheet then
         TTabSheet(pgcSistema.Controls[I]).Enabled       := false;

   //AL_11
   tbsIntContFin.Enabled := True;
   pnlIntContFinGeral.Enabled := False;
   pgcContFin.Enabled   := True;
   for I := 0 to pgcContFin.ControlCount -1 do
      if pgcContFin.Controls[I] is TTabSheet then
         TTabSheet(pgcContFin.Controls[I]).Enabled   := False;

   tbsRendaVariavel.Enabled := True;
   pgcRendaVariavel.Enabled := True;
   for I := 0 to pgcRendaVariavel.ControlCount -1 do
      if pgcRendaVariavel.Controls[I] is TTabSheet then
         TTabSheet(pgcRendaVariavel.Controls[I]).Enabled := false;

end;

procedure TFrmParamInvestMT.dbdDtaFechRfEnter(Sender: TObject);
begin
  inherited;
  dDataFechRF := dbdDtaFechRf.DateTime;
end;

procedure TFrmParamInvestMT.dblTipoFundoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var sCampoFundo: String;
begin
  inherited;
   //AL_15
   if Trim(dbLTipoFundo.Text) <> '' then
   begin
      sCampoFundo                    := UFundoComum.LocalizaCampoFundo(StrToInt(dblTipoFundo.LookupValue));
      chkFundosEmAbertura.DataField  := 'FLGEMABERTURA'+sCampoFundo;
      dblUsuarioProcFundos.DataField := 'IDUSREMABERTURA'+sCampoFundo;
      chkFundosEmAbertura.Enabled    := True;
      dblUsuarioProcFundos.Enabled   := True;
   end;
end;

procedure TFrmParamInvestMT.dblTipoFundoChange(Sender: TObject);
begin
  inherited;
   //AL_15
   if Trim(dbLTipoFundo.Text) = '' then
   begin
      chkFundosEmAbertura.DataField  := '';
      dblUsuarioProcFundos.DataField := '';
      chkFundosEmAbertura.Enabled    := False;
      dblUsuarioProcFundos.Enabled   := False;
   end;
end;

procedure TFrmParamInvestMT.dbchRegCxCompExit(Sender: TObject);
begin
  inherited;
   if not dbchRegCxComp.checked then
     Cds.FieldByName('DTAREGIMECXCOMP').Clear;
end;

procedure TFrmParamInvestMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   Accept := CtrlParamInvest.AplicaAtualParamInvest;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlParamInvest.MessageInfo,'Erro',mtError,[mbOk],0);
  inherited;
   Seleciona;
end;

procedure TFrmParamInvestMT.Seleciona(iIdParam: Integer = -1);
begin
  cds.Data :=  CtrlParamInvest.ListParamInvest;
end;

//AL_2
procedure TFrmParamInvestMT.dbeMaskANBIDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if (key <> '9') and (key <> '.') and (key <> #8) then
   begin
      MessageBeep(0);
      ShowMessage('Digitar 9 ou . ');
      key := #0;
      Exit;
   end;
end;

procedure TFrmParamInvestMT.chkRVEmAberturaClick(Sender: TObject);
begin
  inherited;
  // AL_4
  if not chkRVEmAbertura.Checked then
  begin
     if cds.State in [dsInsert, dsEdit] then
     begin
        cds.FieldByName('IDUSUARIOPROCRV').Clear;
        dblUsuarioProcRV.Enabled := False;
        dblUsuarioProcRV.Text := '';
        dblUsuarioProcRV.PerformSearch;
     end;
  end
  else
     dblUsuarioProcRV.Enabled := True;

end;

procedure TFrmParamInvestMT.chkRFEmAberturaClick(Sender: TObject);
begin
  inherited;
  // AL_4
  if not chkRFEmAbertura.Checked then
  begin
     if cds.State in [dsInsert, dsEdit] then
     begin
        cds.FieldByName('IDUSUARIOPROCRF').Clear;
        dblUsuarioProcRF.Enabled := False;
        dblUsuarioProcRF.Text := '';
        dblUsuarioProcRF.PerformSearch;
     end;
  end
  else
     dblUsuarioProcRF.Enabled := True;

end;

//AL_11
procedure TFrmParamInvestMT.cdsAfterOpen(DataSet: TDataSet);
begin
  VerModuloBloqueado( 1, cds.FieldByName('FLGINTCONTABRF').AsString  = 'S');
  VerModuloBloqueado( 2, cds.FieldByName('FLGINTCONTABRV').AsString  = 'S');
  VerModuloBloqueado( 5, cds.FieldByName('FLGINTCONTABFRF').AsString = 'S');
  VerModuloBloqueado( 6, cds.FieldByName('FLGINTCONTABFRV').AsString = 'S');
  VerModuloBloqueado( 7, cds.FieldByName('FLGINTCONTABFIM').AsString = 'S');
  VerModuloBloqueado( 8, cds.FieldByName('FLGINTCONTABBMF').AsString = 'S');
  VerModuloBloqueado( 9, cds.FieldByName('FLGINTCONTABFDC').AsString = 'S');
  VerModuloBloqueado(10, cds.FieldByName('FLGINTCONTABFIP').AsString = 'S');
end;

//AL_11
procedure TFrmParamInvestMT.VerBloqClick(Sender: TObject);
begin
  VerModuloBloqueado(TDBCheckBox(Sender).Tag, TDBCheckBox(Sender).Checked);
end;

procedure TFrmParamInvestMT.VerModuloBloqueado(iModulo: Word; bIntegra: Boolean);
begin
   case iModulo of
   1: begin
         if not bIntegra then
         begin
            pnlMensBloqRF.Color := $007575FF;
            pnlMensBloqRF.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqRF.Color := $0097E18A;
            pnlMensBloqRF.Caption := 'Integra';
         end;
      end;
   2: begin
         if not bIntegra then
         begin
            pnlMensBloqRV.Color := $007575FF;
            pnlMensBloqRV.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqRV.Color := $0097E18A;
            pnlMensBloqRV.Caption := 'Integra';
         end;
      end;
   5: begin
         if not bIntegra then
         begin
            pnlMensBloqFRF.Color := $007575FF;
            pnlMensBloqFRF.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqFRF.Color := $0097E18A;
            pnlMensBloqFRF.Caption := 'Integra';
         end;
      end;
   6: begin
         if not bIntegra then
         begin
            pnlMensBloqFRV.Color := $007575FF;
            pnlMensBloqFRV.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqFRV.Color := $0097E18A;
            pnlMensBloqFRV.Caption := 'Integra';
         end;
      end;
   7: begin
         if not bIntegra then
         begin
            pnlMensBloqFIM.Color := $007575FF;
            pnlMensBloqFIM.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqFIM.Color := $0097E18A;
            pnlMensBloqFIM.Caption := 'Integra';
         end;
      end;
   8: begin
         if not bIntegra then
         begin
            pnlMensBloqBMF.Color := $007575FF;
            pnlMensBloqBMF.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqBMF.Color := $0097E18A;
            pnlMensBloqBMF.Caption := 'Integra';
         end;
      end;
   9: begin
         if not bIntegra then
         begin
            pnlMensBloqFDC.Color := $007575FF;
            pnlMensBloqFDC.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqFDC.Color := $0097E18A;
            pnlMensBloqFDC.Caption := 'Integra';
         end;
      end;
   10:begin
         if not bIntegra then
         begin
            pnlMensBloqFIP.Color := $007575FF;
            pnlMensBloqFIP.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqFIP.Color := $0097E18A;
            pnlMensBloqFIP.Caption := 'Integra';
         end;
      end;
   end;
end;

end.
