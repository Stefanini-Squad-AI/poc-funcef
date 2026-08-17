// Atualizado em : 02/10/2003 - André Tavares - pendência 14998
unit FIntegraCAPCAR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, ComCtrls, Db,
  DBTables, Wwquery, Wwdatsrc, wwdblook, CMTree, Mask, MontaSelect,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, ImgList;

type
  TfrmIntegraCAPCAR = class(TfrmOkCancelar)
    pnlLeft: TPanel;
    trvGrupos: TTreeView;
    pnlRight: TPanel;
    lstAuxID: TListBox;
    lstAuxTipo: TListBox;
    pgctrlIntegracao: TPageControl;
    tbsContab: TTabSheet;
    tbsPagar: TTabSheet;
    tbsOutros: TTabSheet;
    pnlFundoOutros: TPanel;
    pnlFundoContab: TPanel;
    pnlFundoCAPCAR: TPanel;
    pnlDirTopo: TPanel;
    stxtTitulo: TStaticText;
    lblPatro: TLabel;
    lblPlano: TLabel;
    lblOpcao: TLabel;
    lblParticipante: TLabel;
    bbtnProcurar: TBitBtn;
    MontaSel: TMontaSelect;
    qryAux: TwwQuery;
    pnlGlobCAPCAR: TPanel;
    lbAtividade: TLabel;
    lkcmbDescAtividade: TwwDBLookupCombo;
    lblFormaRecPag: TLabel;
    dblkpcmbPortForma: TwwDBLookupCombo;
    StaticText1: TStaticText;
    imGrupos: TImageList;
    qryContaContabil: TwwQuery;
    qryContaContabilPLACONTA: TStringField;
    qryContaContabilPLANOME: TStringField;
    qryContaContabilPLATIPO: TStringField;
    dsContaContabil: TwwDataSource;
    dsTpReceb: TwwDataSource;
    qryTpReceb: TwwQuery;
    qryTpRecebCODTIPRECDES: TStringField;
    qryTpRecebDESCRICAO: TStringField;
    qryTpRecebANASINT: TStringField;
    tbsReceber: TTabSheet;
    pnlFundoCRecebe: TPanel;
    GroupBox8: TGroupBox;
    lblTpReceb: TLabel;
    spdTpReceb: TSpeedButton;
    edTpReceb: TEdit;
    grpAltJuros: TGroupBox;
    Label7: TLabel;
    dblkpcmbAltJurosCAR: TwwDBLookupCombo;
    dsTpPaga: TwwDataSource;
    qryTpPaga: TwwQuery;
    qryTpPagaCODTIPRECDES: TStringField;
    qryTpPagaDESCRICAO: TStringField;
    qryTpPagaANASINT: TStringField;
    MontaSelectIRRF: TMontaSelect;
    grpDebContab: TGroupBox;
    spdContaDebito1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    edContaDebito1: TMaskEdit;
    cmbCCusto: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    lbDescContaDebito1: TLabel;
    GroupBox3: TGroupBox;
    lbDescricaoCCusto: TLabel;
    grpCreContab: TGroupBox;
    spdContaCredito1: TSpeedButton;
    lbCcusto1: TLabel;
    lbConta1: TLabel;
    edContaCredito1: TMaskEdit;
    cmbCCusto1: TwwDBLookupCombo;
    grbGrConta1: TGroupBox;
    lbDescContaCredito1: TLabel;
    grbGrCcusto1: TGroupBox;
    lbDescricaoCCusto1: TLabel;
    cmbcentrespon: TwwDBLookupCombo;
    lblcentrespon: TLabel;
    dblkpcmbAltCorrecaoCAR: TwwDBLookupCombo;
    Label8: TLabel;
    treeContaContabil: TCMTreeView;
    anMudaGrupos: TAnimate;
    tbsDevol: TTabSheet;
    treeTpPaga: TCMTreeView;
    treeTpReceb: TCMTreeView;
    redPatro: TRichEdit;
    redGeral: TRichEdit;
    tbsTipoper: TTabSheet;
    pnlTipoper: TPanel;
    GroupBox1: TGroupBox;
    dblkTipoperenvio: TwwDBLookupCombo;
    lbGrupo: TLabel;
    Label1: TLabel;
    Label15: TLabel;
    dblkTipopercobranca: TwwDBLookupCombo;
    dblkTipoperdiverg: TwwDBLookupCombo;
    tbsTipoDoc: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox20: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    dblkTipDocCARRecbanco: TwwDBLookupCombo;
    dblkTipDocCARRecpatro: TwwDBLookupCombo;
    GroupBox17: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    dblkTipDocCAPenvbanco: TwwDBLookupCombo;
    dblkTipDocCAPenvPatro: TwwDBLookupCombo;
    grpDescontoCAR: TGroupBox;
    Label29: TLabel;
    edDesembCAR: TEdit;
    spdDesembCAR: TSpeedButton;
    qrySitPart: TwwQuery;
    tbsParamContab: TTabSheet;
    GroupBox21: TGroupBox;
    Label46: TLabel;
    spdContaAnulaRec: TSpeedButton;
    Label47: TLabel;
    edContaAnulaReceita: TMaskEdit;
    cmbCustoAnulaReceita: TwwDBLookupCombo;
    GroupBox29: TGroupBox;
    lblDescricaoContaAnulaReceita: TLabel;
    GroupBox30: TGroupBox;
    lbDescricaoCCustoAnulaReceita: TLabel;
    GroupBox28: TGroupBox;
    Label50: TLabel;
    spdContaAnulaDesp: TSpeedButton;
    Label51: TLabel;
    edContaAnulaDespesa: TMaskEdit;
    cmbCustoAnulaDespesa: TwwDBLookupCombo;
    GroupBox31: TGroupBox;
    lbDescricaoContaAnulaDespesa: TLabel;
    GroupBox32: TGroupBox;
    lbDescricaoCCustoAnulaDespesa: TLabel;
    StaticText2: TStaticText;
    Panel1: TPanel;
    Label43: TLabel;
    dblkSubconta: TwwDBLookupCombo;
    grpDevReceb: TGroupBox;
    spdDevReceb: TSpeedButton;
    edRecebimento: TEdit;
    grpDevDesemb: TGroupBox;
    spdDevDesemb: TSpeedButton;
    grpContaDevol: TGroupBox;
    spdContaDevol: TSpeedButton;
    Label41: TLabel;
    Label42: TLabel;
    edContaContabilDevol: TMaskEdit;
    dblkCCDevol: TwwDBLookupCombo;
    GroupBox24: TGroupBox;
    lbDescricaoContaDevol: TLabel;
    GroupBox25: TGroupBox;
    lbDescricaoCCustoDevol: TLabel;
    grpContaDevolPatro: TGroupBox;
    spdContaDevolpatro: TSpeedButton;
    Label44: TLabel;
    Label45: TLabel;
    edContaContabilDevolPatro: TMaskEdit;
    dblkCCDevolPatro: TwwDBLookupCombo;
    GroupBox26: TGroupBox;
    lbDescricaoContaDevolPatro: TLabel;
    GroupBox27: TGroupBox;
    lbDescricaoCCustoDevolPatro: TLabel;
    edDesembolso: TEdit;
    Button1: TButton;
    qryCContabil: TwwQuery;
    Label4: TLabel;
    edContaDebito2: TMaskEdit;
    GroupBox6: TGroupBox;
    lbDescContaDebito2: TLabel;
    spdContaDebito2: TSpeedButton;
    Label9: TLabel;
    dblkCCDevolCAP: TwwDBLookupCombo;
    Label10: TLabel;
    MskEdCCCAP: TMaskEdit;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    DblkCresposCAP: TwwDBLookupCombo;
    Label11: TLabel;
    edTpPaga: TEdit;
    spdTpPaga: TSpeedButton;
    lbTpPaga: TLabel;
    dblkAtivProjCAP: TwwDBLookupCombo;
    Label12: TLabel;
    Label13: TLabel;
    dblkProgramaCAP: TwwDBLookupCombo;
    qryPatroParamASS: TwwQuery;
    DblkFornecedor: TwwDBLookupCombo;
    Label5: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure trvGruposCollapsing(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
    procedure trvGruposExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
    procedure trvGruposExpanded(Sender: TObject; Node: TTreeNode);
    procedure trvGruposChange(Sender: TObject; Node: TTreeNode);
    procedure cmbCCustoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure edContaDebito1Exit(Sender: TObject);
    procedure spdContaDebito1Click(Sender: TObject);
    procedure treeContaContabilDblClick(Sender: TObject);
    procedure treeContaContabilExit(Sender: TObject);
    procedure cmbCCusto1CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure edContaCredito1Exit(Sender: TObject);
    procedure spdContaCredito1Click(Sender: TObject);
    procedure edTpPagaExit(Sender: TObject);
    procedure spdTpPagaClick(Sender: TObject);
    procedure treeTpPagaDblClick(Sender: TObject);
    procedure treeTpPagaExit(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure spdTpRecebClick(Sender: TObject);
    procedure edTpRecebExit(Sender: TObject);
    procedure treeTpRecebDblClick(Sender: TObject);
    procedure treeTpRecebExit(Sender: TObject);
    procedure spdDevRecebClick(Sender: TObject);
    procedure spdDevDesembClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure spdContaDevolClick(Sender: TObject);
    procedure spdContaDevolpatroClick(Sender: TObject);
    procedure spdContaAnulaRecClick(Sender: TObject);
    procedure spdContaAnulaDespClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure spdContaDebito2Click(Sender: TObject);
    procedure edContaDebito2Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dblkAtivProjCAPCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);

  private
    { Private declarations }

    iIdPatroSel,         // ident. da patrocinadora do participante selecionado no procurar
    iIdPlanoSel,         // ident. do plano participante selecionado no procurar
    iIdPartSel : integer;// ident. do participante selecionado no procurar

    iUltDadoParticip,    // indice do ultimo dado(reserva) inserido para o participante nas listas de id's, tipos, e na arvore
    iIndNoParticip,      // indice do item Participante  na arvore e nas listas de id's, tipos
    iIndNoContrib,       // indice do item Participante | Contribuicoes na arvore e nas listas de id's, tipos
    iIndNoDecTerc,       // indice do item Participante | Contribuicoes sobre 13o. na arvore e nas listas de id's, tipos
    iIndNoBenef,         // indice do item Participante | Beneficios na arvore e nas listas de id's, tipos
    iIndNoAbono,         // indice do item Participante | Abono na arvore e nas listas de id's, tipos
    iIndNoReserva,       // indice do item Participante | Reservas na arvore e nas listas de id's, tipos
    iSitPart : integer;

    bProcPart, bexisteParamaAssist: boolean;
    NomePatroUpper, NomePatro, sContaContabil : string;

    function  PlanoPai(cPlanoPatro : char; iItemArvore : integer) : integer;
    function  PatroPai(iItemArvore : integer) : integer;
    procedure PreencheDados(sTipo,sItem : string; iItemArvore,iIdItem : integer);
    procedure PreparaIntegracao;
    procedure PreencheDadosParticip;
    procedure LimpaDadosParticip;
    procedure LimpaTela;
    procedure DesabilitaTudo;
    function  MontaTree : boolean;
    procedure GravaIntegPORPLANO(sTipo : STRING; iItemArvore,iIdItem :  integer; sTpPart : STRING);
    procedure GravaIntegPORPATRO(sTipo : STRING; iItemArvore,iIdItem :  integer; sTpPart : STRING);
    procedure GravaIntegPORPART(sTipo  : STRING; iIdItem :  integer);
    procedure GravaIntegPORSITPART(sTipo : STRING; iItemArvore,iIdItem :  integer; sTpPart : STRING);
    procedure GravaGeral(sTipo  : STRING; iIdItem :  integer);
    procedure QryFormaPagaOpen(sRP : String);
    procedure Labels(bCondDeb,bCondCre,bCondCreAtu,bCondDebAtu,bCondCreProv,bCondDebProv : Boolean;
         sContaDeb,sContaCre,sContaDebAtu,sContaCreAtu,sContaDebProv,sContaCreProv : String);
    procedure edContaContabilPadraoExit(sConta:String; edConta:TMaskEdit;
                          lblConta,lblCCusto:TLabel ;cmbCCusto:TwwDBLookupCombo);
    procedure SetaParamTree(spdContaAtual,Top,Left,Height,Width : Integer);
    procedure Habilitacoes(bgrpAltJuros,btbsIRRF,bTbsOutros,btbsContab, btbsPagar,btbsReceber,
              btbsAtualizacao,btbsProvisao,btbsDevol,bgrpDevReceb,bgrpDesemb,btbsTipOper,
              btbsTipoDoc,btbsParamContab,bgrpdescCAP,bgrpdescCAR : Boolean);
    procedure CaptionsDirTopo(sTitulo,slblPlano,slblPatro,slblParticpante,
                              slblOpcao: String; btnProc : Boolean);
    procedure PreencheCampos(iTipDoc, iUnidNegoc, iCodAlteradorJuros,iCODALTERADORCORR,
                     iCodPortForma,iCodAlteraCorrCAP :Integer ; sTipRecDes,sTpPag,
                     sTipRecebDevol,sTipDesemDevol,sTipDesembCAR,sTipRecebCAP,
                     sPlacontC,sPlacontD,sPlaContDAutPatr,sCodCentroCustoC,sCodCentroCustoD,sCodCentroRespon,
                     sPlaContaAtuaD,sPlaContaAtuaC,sPlaContaJurD,sPlaContaJurC,
                     sPlaContaProvisD,sPlaContaProvisC,sPlaContaDevol,
                     sPlaContaDevolPatro,sCodCentroCustoDevol,sCodCentroCustoDevolPatro,
                     sCodSubConta :String);
    procedure PreencheParamAPrev;
    // Frederico - 20/06/2000 (Início)
    function  pesquisaContaContabil(planoConta: String): Boolean;
    function  validaContaContabil: Boolean;
    // Frederico - 20/06/2000 (Fim)
  public
    { Public declarations }
  end;

var
  frmIntegraCAPCAR   : TfrmIntegraCAPCAR;
  spdContabAtual     : Integer;
  sSpd               : String;
  edReceb, edRecebTp,edRecebCAPcod : String;
  edDesemb,edDesembTp,edDesembCARcod: String;

implementation

uses DIntegraCAPCAR, UAutorizacao, USistema, UMensErro, UModulo, UIntegraBack, uDataBase;

{$R *.DFM}

function  TfrmIntegraCAPCAR.PlanoPai(cPlanoPatro : char; iItemArvore : integer) : integer;
var i : integer;
    sPara : string;
begin
   Result := -1;
   { Se for a nivel de Plano , procurar o PL, senao -> procurar LP }
   if cPlanoPatro = 'L' // Plano
   then sPara := 'PL'
   else if cPlanoPatro = 'H' // Plano para situação de participante
        then sPara := 'PLST'
        else if cPlanoPatro = 'S' // Situação do Participante
             then  sPara := 'SP'
             else if cPlanoPatro = 'V' // Plano Previdenciário
                  then  sPara := 'PV'
                  else sPara := 'LP';

   for i := iItemArvore downto 0 do begin
     if lstAuxTipo.Items[i] = sPara  then begin
        Result := StrToIntDef(lstAuxId.Items[i],0);
        break;
     end;
   end;
end;//PlanoPAI

function  TfrmIntegraCAPCAR.PatroPai(iItemArvore : integer) : integer;
var i : integer;
begin
   Result := -1;
   for i := iItemArvore downto 0 do begin
      if lstAuxTipo.Items[i] = 'PP' then begin
         Result := StrToInt(lstAuxId.Items[i]);
         break;
      end;
   end;
end;//PatroPAI

procedure TfrmIntegraCAPCAR.LimpaTela;
begin
   sContaContabil := '';
   lkcmbDescAtividade.Text            := '';
   dblkpcmbPortForma.Text             := '';
   dblkpcmbAltJurosCAR.Text           := '';
   dblkpcmbAltCorrecaoCAR.Text        := '';
   dblkCCDevol.Text                   := '';
   dblkSubconta.Text                  := '';
   cmbCCusto.Text                     := '';
   cmbCCusto1.Text                    := '';
   cmbcentrespon.Text                 := '';
   edContaDebito1.Text                := '';
   edContaDebito2.Text                := '';
   edContaCredito1.Text               := '';
   edContaContabilDevol.Text          := '';
   edContaContabilDevolPatro.Text     := '';
   edTpReceb.Text                     := '';
   edDesembCAR.Text                   := '';
   edTpPaga.Text                      := '';
   edDesembolso.Text                  := '';
   edRecebimento.Text                 := '';
   edReceb                            := '';
   edRecebTp                          := '';
   edDesemb                           := '';
   edDesembTp                         := '';
   edDesembCARcod                     := '';
   lbDescContaDebito1.Caption         := '';
   lbDescContaDebito2.Caption         := '';
   lbDescricaoCCusto.Caption          := '';
   lbDescContaCredito1.Caption        := '';
   lbDescricaoCCusto1.Caption         := '';
   lbDescricaoContaDevol.Caption      := '';
   lbDescricaoCCustoDevol.Caption     := '';
   lbDescricaoContaDevolPatro.Caption := '';
end;

procedure TfrmIntegraCAPCAR.PreencheDados(sTipo,sItem : string; iItemArvore,iIdItem : integer);
begin
    // Independente de Patrocinadora - POR PLANO
   { Dados por Plano :
     PL - PLANO (PlanPrev)                   - CodTipDoc, CodTipRecDes e RecPag
     CL - CONTRIBUICAO POR PLANO(CONTPREV)   - CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                               PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                               IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                               CODALTERADORJUROS,CODALTERADORCORR,CODPORTFORMA
     DL - CONTRIBUICAO 13o. POR PLANO(CONTPREV)- CODTIPDOC13,CODTIPRECDES13,RECPAG13,UNIDNEGOC13,PLACONTAC13,CODCENTROCUSTOC13,
                                               PLACONTAD13, CODCENTROCUSTOD13,PLANO13,IDEMPRESA13,
                                               IDEMPRESAPROP13,CODSUBCONTA13,CODCENTRORESPON13,TIPCODIGO13,
                                               CODALTERAjUROS13,CODALTERACORR13,CODPORTFORMA13
     BL - BENEFICIO POR PLANO(BENEFPLANPREV) - CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                               PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                               IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                               CODALTERADORCORR,CODPORTFORMA
     RL - RESERVA   POR PLANO(RESERVAXPLANO) - CodTipDoc, CodTipRecDes e RecPag

     AL - ABONO POR PLANO(BENEFPLANPREV) - CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                               PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                               IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                               CODALTERADORCORR,CODPORTFORMA     }
{ Habilitacoes(False,False,False,False,False,False,False,False,
              False,False,False,False,False,False,False,False);}
 WITH DTMINTEGRACAPCAR DO BEGIN
    if sTipo = 'PM' Then Begin
       Habilitacoes(False,False,False,False,False,False,False,False,False,False,False,True,True,True,False,False);
       Labels(False,False,False,False,False,False,'','','','','','');
       PreencheParamAPrev;
    end;
    if sTipo = 'PL' then begin                // PLANO
       if not qryPlanoPuro.Locate('IdPlanAss',iIdItem,[loCaseInsensitive,loPartialKey])
       then Exit;
       QryFormaPagaOpen('R');
       PreencheCampos(qryPlanoPuro.FieldbyName('CodTipDoc').AsInteger,-1,-1,-1,-1,-1,
                      qryPlanoPuro.FieldByName('CodTipRecDes').AsString,'','', '',
                      qryPlanoPuro.FieldByName('CodTipDesembCAR').AsString,'','','','','','','',
                      '','','','','','','','','','','');
       Habilitacoes(False,False,False,False,False,True,False,False,False,False,False,False,False,False,False,False);
       Labels(False,True,False,False,
              False,False,'Conta de Despesa','Conta de Receita','Conta de Débito p/atualização das reservas',
              'Conta de Crédito para atualização das reservas','Conta de Débito p/Provisão',
              'Conta de Débito p/Provisão');
    end;

    if sTipo = 'CL'  then begin                        // CONTRIBUICAO POR PLANO
       //Preencher variant com IdPlanoPrev+IdContribuicao

       qryContribPlano.Close;
       qryContribPlano.ParamByName('IdPlanoPrev').AsInteger := PlanoPai('L',iItemArvore);
       qryContribPlano.Open;
       if not qryContribPlano.Locate('IdContribuicao',iIdItem,[loCaseInsensitive,loPartialKey])
       then Exit;
       QryFormaPagaOpen('R');
       PreencheCampos(-1,qryContribPlano.FieldbyName('UnidNegoc').AsInteger,
                      -1,-1,qryContribPlano.FieldByname('CodPortForma').AsInteger,-1,
                      qryContribPlano.FieldByName('CodTipRecDes').AsString,'','',
                      qryContribPlano.FieldByName('CodTipDesembDevol').AsString,
                      qryContribPlano.FieldByName('CodTipDesembCAR').AsString,'',
                      qryContribPlano.FieldByName('PlaContaC').AsString,
                      qryContribPlano.FieldByName('PlaContaD').AsString,
                      qryContribPlano.FieldByName('PlaContaDAutPatr').AsString,
                      qryContribPlano.FieldByName('CodCentroCustoC').AsString,
                      qryContribPlano.FieldByName('CodCentroCustoD').AsString,
                      qryContribPlano.FieldByName('CodCentroRespon').AsString, '','','','','','',
                      qryContribPlano.FieldByName('PlaContaCDevBanco').AsString,
                      qryContribPlano.FieldByName('PlaContaCDevPat').AsString,
                      qryContribPlano.FieldByName('CodCCustoCDevBan').AsString,
                      qryContribPlano.FieldByName('CodCCustoCDevPat').AsString,
                      qryContribPlano.FieldByName('CodSubConta').AsString);

       Habilitacoes(False,False,True,True,False,True,False,False,True,False,True,False,False,False,False,True);
       Labels(True,True,False,False,
              False,False,'Conta de Débito','Conta de Crédito','Conta de Débito p/atualização das reservas',
              'Conta de Crédito para atualização das reservas','Conta de Débito p/Provisão',
              'Conta de Débito p/Provisão');
    end;


    // Dependente   de Patrocinadora
   {  Dados por Patrocinadora :
    LP - Plano (PLANPREVPATRO)        - CodAlteradorJuros, CODALTERADORCORR
    CP - Contribuicao (CONTPLANPATRO) - CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                        PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                        IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                        CODALTERADORJUROS,CODALTERADORCORR,CODPORTFORMA
    DP - CONTRIBUICAO 13o.(CONTPLANPATRO)- CODTIPDOC13,CODTIPRECDES13,RECPAG13,UNIDNEGOC13,PLACONTAC13,CODCENTROCUSTOC13,
                                           PLACONTAD13, CODCENTROCUSTOD13,PLANO13,IDEMPRESA13,
                                           IDEMPRESAPROP13,CODSUBCONTA13,CODCENTRORESPON13,TIPCODIGO13,
                                           CODALTERAjUROS13,CODALTERACORR13,CODPORTFORMA13
    BP - Beneficio (BENEFPLANPATRO)  -  CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                        PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                        IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                        CODALTERADORCORR,CODPORTFORMA
    AP - ABONO (BENEFPLANPATRO)  -  CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                        PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                        IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                        CODALTERADORCORR,CODPORTFORMA }


    if sTipo = 'PP' then begin                                 // PATROCINADORA
//*** início tavares - pendência 14998
//       Habilitacoes(False,False,False,False,False,False,False,False,False,False,False,False,False,False,False,False);
       Habilitacoes(False,False,False,False,true,False,False,False,False,False,False,False,False,False,False,False);
       dtmIntegraCAPCAR.qryCCusto.Close;
       dtmIntegraCAPCAR.qryCCusto.paramByName('IDEMPRESA').asInteger := sistema.idEmpresa;
       dtmIntegraCAPCAR.qryCCusto.Open;

       dtmIntegraCAPCAR.qryAtividade.Close;
       dtmIntegraCAPCAR.qryAtividade.paramByName('IDEMPRESA').asInteger := sistema.idEmpresa;
       dtmIntegraCAPCAR.qryAtividade.Open;

       dtmIntegraCAPCAR.qryPrograma.Close;
       dtmIntegraCAPCAR.qryPrograma.Open;

       dtmIntegraCAPCAR.qryEmpresaprop.Close;
       dtmIntegraCAPCAR.qryEmpresaprop.open;

       qryPatroParamASS.Close;
       qryPatroParamASS.ParamByName('IDPESSOA').asInteger  := PatroPai(iItemArvore);
       qryPatroParamASS.ParamByName('IDFUNDACAO').asInteger := sistema.IdEmpresa;
       qryPatroParamASS.Open;

       //carrega o tipo de desembolso

       edTpPaga.Text := '';
       edDesembTp  := '';
       if qryTpPaga.Locate('CodTipRecDes',qryPatroParamASS.FieldByName('TIPODESEMBASS').asString,
                           [loCaseInsensitive,loPartialKey]) then
       begin
         edTpPaga.text := qryTpPaga.fieldbyname('Descricao').AsString;
         edDesembTp    := qryTpPaga.fieldbyname('CodTipRecDes').AsString;
       end;


       //carrega a conta contábil para crédito
       sContaContabil  := '';
       MskEdCCCAP.Text := '';
//       MskEdCCCAP.Text := qryPatroParamASS.FieldByName('CCCREDITOASS').asString;
       if qryContaContabil.Locate('PLACONTA',qryPatroParamASS.FieldByName('CCCREDITOASS').asString,
                           [loCaseInsensitive,loPartialKey]) then
       begin
         MskEdCCCAP.Text := qryPatroParamASS.FieldByName('CCCREDITOASS').asString;
         sContaContabil  := qryPatroParamASS.FieldByName('CCCREDITOASS').asString;
       end;

       // carrega o campo Centro de custo
       dblkCCDevolCAP.Text := '';
       dblkCCDevolCAP.LookupValue := '';
       if dtmIntegraCAPCAR.qryCCusto.Locate('CODCENTROCUSTO',
                                         qryPatroParamASS.fieldByName('CCUSTOASS').asString,
                                         [loCaseInsensitive,loPartialKey]) then
       begin
         dblkCCDevolCAP.Text := dtmIntegraCAPCAR.qryCCusto.FieldByName('NOME').asString;
         dblkCCDevolCAP.LookupValue := qryPatroParamASS.fieldByName('CCUSTOASS').asString;
       end;

       // carrega o campo Centro de Responsabilidade
       DblkCresposCAP.Text := '';
       DblkCresposCAP.LookupValue := '';
       if dtmIntegraCAPCAR.qryCentRespon.Locate('CODCENTRORESPON',
                                                qryPatroParamASS.fieldByName('CDCRESPONASS').asString,
                                                [loCaseInsensitive,loPartialKey]) then
       begin
         DblkCresposCAP.Text := dtmIntegraCAPCAR.qryCentRespon.FieldByName('NOME').asString;
         DblkCresposCAP.LookupValue := qryPatroParamASS.fieldByName('CDCRESPONASS').asString;
       end;

       // carrega o campo Atividade/Projeto
       dblkAtivProjCAP.Text := '';
       dblkAtivProjCAP.LookupValue := '';
       if dtmIntegraCAPCAR.qryAtividade.Locate('UNIDNEGOC',
                                                qryPatroParamASS.fieldByName('ATIVPROJETOASS').asInteger,
                                                [loCaseInsensitive,loPartialKey]) then
       begin
         dblkAtivProjCAP.Text := dtmIntegraCAPCAR.qryAtividade.FieldByName('NOME').asString;
         dblkAtivProjCAP.LookupValue := qryPatroParamASS.fieldByName('ATIVPROJETOASS').asString
       end;

       // carrega o campo Programa
       dblkProgramaCAP.Text := '';
       dblkProgramaCAP.LookupValue := '';
       if dtmIntegraCAPCAR.qryPrograma.Locate('CODPROGRAMA',
                                                qryPatroParamASS.fieldByName('CODPROGRAMAASS').asString,
                                                [loCaseInsensitive,loPartialKey]) then
       begin
         dblkProgramaCAP.Text := dtmIntegraCAPCAR.qryPrograma.FieldByName('DESCPROGRAMA').asString;
         dblkProgramaCAP.LookupValue := qryPatroParamASS.fieldByName('CODPROGRAMAASS').asString
       end;

//  CARREGA O FORNECEDOR

       DblkFornecedor.Text := '';
       DblkFornecedor.LookupValue := '';
       if dtmIntegraCAPCAR.qryEmpresaprop.Locate('IDFORCLI',
                                                qryPatroParamASS.fieldByName('IDFORCLIASS').asInteger,
                                                [loCaseInsensitive,loPartialKey]) then
       begin
         DblkFornecedor.Text := dtmIntegraCAPCAR.qryEmpresaprop.fieldByName('NOME').asString;
         DblkFornecedor.LookupValue := dtmIntegraCAPCAR.qryEmpresaprop.fieldByName('IDFORCLI').asString
       end;



//*** fim tavares - pendência 14998
    end;
{       QryFormaPagaOpen('R');
       //Preencher variant com IdPatrocinadora+IdPlanoPrev
       qryPatroDados.Close;
       qryPatroDados.ParambyName('IdPessoa').AsInteger := PatroPai(iItemArvore);
       qryPatroDados.Open;

       PreencheCampos(-1,qryPatroDados.FieldbyName('UnidNegoc').AsInteger,
                      qryPatroDados.FieldByname('CodPortForma').AsInteger,-1,-1,-1,'','','','',
                      '','', qryPatroDados.FieldByName('CodCentroRespon').AsString,
                      '','','','','','','','','','');

       Habilitacoes(True,False,True,True,False,False,False,False,False,False,False,False,False,False,False);
       Labels(False,True,False,False,False,False,'Conta de Despesa','Conta de Líquido da Folha de Benefício',
         'Conta de Débito p/atualização das reservas','Conta de Crédito para atualização das reservas',
         'Conta de Débito p/Provisão','Conta de Débito p/Provisão');
    end;}

    if sTipo = 'LP' then begin                      // PLANO DA PATROCINADORA
       Habilitacoes(False,False,False,False,False,False,False,False,False,False,False,False,False,False,False,False);
    end;
       //Preencher variant com IdPatrocinadora+IdPlanoPrev
{       qryPlano.Close;
       qryPlano.ParambyName('IdPessoa').AsInteger := PatroPai(iItemArvore);
       qryPlano.Open;
       if not qryPlano.Locate('IdPlanoPrev',iIdItem,[loCaseInsensitive,loPartialKey])
       then Exit;
       QryFormaPagaOpen('R');
       PreencheCampos(-1,-1,-1,-1,-1,-1,'','','','','','','','','','','','','','','','','');

       Habilitacoes(True,False,False,True,False,False,False,False,False,False,False,False,False,False,False);
       Labels(False,True,False,False,False,False,'Conta de Despesa','Conta de Líquido da Folha de Benefício',
         'Conta de Débito p/atualização das reservas','Conta de Crédito para atualização das reservas',
         'Conta de Débito p/Provisão','Conta de Débito p/Provisão');
    end;}

    if sTipo = 'CP' then begin                   // Contrib POR PATROCINADORA
       //Preencher variant com IdPatrocinadora+IdPlanoPrev+IdContrib
       qryContrib.Close;
       qryContrib.ParamByName('IdPessJur').AsInteger   := PatroPai(iItemArvore);
       qryContrib.ParamByName('IdPlanoPrev').AsInteger := PlanoPai('V',iItemArvore);
       qryContrib.ParamByName('IdPlanAss').AsInteger   := PlanoPai('P',iItemArvore);;
       qryContrib.Open;

       if not qryContrib.Locate('IdContribuicao',iIdItem,[loCaseInsensitive,loPartialKey])
       then Exit;
       QryFormaPagaOpen('R');
       PreencheCampos(-1,qryContrib.FieldbyName('UnidNegoc').AsInteger,
                      -1,-1,qryContrib.FieldByname('CodPortForma').AsInteger,-1,
                      qryContrib.FieldByName('CodTipRecDes').AsString,'','',
                      qryContrib.FieldByName('CodTipDesembDevol').AsString,
                      qryContrib.FieldByName('CodTipDesembCAR').AsString,'',
                      qryContrib.FieldByName('PlaContaC').AsString,
                      qryContrib.FieldByName('PlaContaD').AsString,
                      qryContrib.FieldByName('PlaContaDAutPatr').AsString,
                      qryContrib.FieldByName('CodCentroCustoC').AsString,
                      qryContrib.FieldByName('CodCentroCustoD').AsString,
                      qryContrib.FieldByName('CodCentroRespon').AsString, '','','','','','',
                      qryContrib.FieldByName('PlaContaCDevBanco').AsString,
                      qryContrib.FieldByName('PlaContaCDevPat').AsString,
                      qryContrib.FieldByName('CodCCustoCDevBan').AsString,
                      qryContrib.FieldByName('CodCCustoCDevPat').AsString,
                      qryContrib.FieldByName('CodSubConta').AsString);
       Habilitacoes(False,False,True,True,False,True,False,False,True,False,True,False,False,False,False,True);
       Labels(True,True,False,False,False,False,'Conta de Débito',
          'Conta de Crédito','Conta de Débito p/atualização das reservas',
          'Conta de Crédito para atualização das reservas','Conta de Débito p/Provisão',
          'Conta de Débito p/Provisão');
    end;


    // Especifica de cada participante
{  PT - Participante (PARTPREVPLAN) - < nada >
   CT - Contribuicao (CONTRIBPREVPARTP) - CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                             PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                             IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                             CODALTERADORJUROS,CODALTERADORCORR,CODPORTFORMA
   BT - Beneficio    (BENEFPLANOPART)      - CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                             PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                             IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                             CODALTERADORCORR,CODPORTFORMA
   RT - Reserva      (RESERVAPART)         - Plano, PlaContaC, PlaContaD, CodCentroCustoC,
                                             CodCentroCustoD, UnidNegocio, CodPortForma,
                                             IdEmpresa, IdEmpresaProp, SubConta, CentroRespons,
                                             TipCodigo
   AT - ABONO       (BENEFPLANOPART)      -  CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                             PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                             IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                             CODALTERADORCORR,CODPORTFORMA
}

    if sTipo = 'PT' then begin                   // PARTICIPANTE
      LimpaTela;
    end;

    if sTipo = 'CE' then begin
       if not qryContribPart.Locate('IdContribuicao',iIdItem,[loCaseInsensitive,loPartialKey])
       then Exit;

       lblOpcao.Caption := 'CONTRIBUIÇÃO : '+sItem;
       QryFormaPagaOpen('R');
       PreencheCampos(-1,qryContribPart.FieldbyName('UnidNegoc').AsInteger,
                      -1,-1,qryContribPart.FieldByname('CodPortForma').AsInteger,-1,
                      qryContribPart.FieldByName('CodTipRecDes').AsString,'','',
                      qryContribPart.FieldByName('CodTipDesembDevol').AsString,
                      qryContribPart.FieldByName('CodTipDesembCAR').AsString,'',
                      qryContribPart.FieldByName('PlaContaC').AsString,
                      qryContribPart.FieldByName('PlaContaD').AsString,
                      qryContribPart.FieldByName('PlaContaDAutPatr').AsString,
                      qryContribPart.FieldByName('CodCentroCustoC').AsString,
                      qryContribPart.FieldByName('CodCentroCustoD').AsString,
                      qryContribPart.FieldByName('CodCentroRespon').AsString, '','','','','','',
                      qryContribPart.FieldByName('PlaContaCDevBanco').AsString,
                      qryContribPart.FieldByName('PlaContaCDevPat').AsString,
                      qryContribPart.FieldByName('CodCCustoCDevBan').AsString,
                      qryContribPart.FieldByName('CodCCustoCDevPat').AsString,
                      qryContribPart.FieldByName('CodSubConta').AsString);

       Habilitacoes(True,False,True,True,False,True,False,False,True,False,True,False,False,False,False,True);
       Labels(False,True,False,False,False,False,'Conta de Despesa','Conta de Receita',
          'Conta de Débito p/atualização das reservas','Conta de Crédito para atualização das reservas',
          'Conta de Débito p/Provisão','Conta de Débito p/Provisão');
    end;

    if sTipo = 'CS' then begin                   // Contrib POR Situação do Particip.
       //Preencher variant com IdPatrocinadora+IdPlanoPrev+IdContrib
       qryContribSitPart.Close;
       qryContribSitPart.ParamByName('IdPlanoPrev').AsInteger := PlanoPai('H',iItemArvore);
       qryContribSitPart.ParamByName('IdContAss').AsInteger := iIdItem;
       qryContribSitPart.ParamByName('IdSitPart').AsInteger := PlanoPai('S',iItemArvore);

       qryContribSitPart.Open;

{       if qryContribSitPart.RecodrCount = 0 then
          Exit;}
       QryFormaPagaOpen('R');
       PreencheCampos(-1,qryContribSitPart.FieldbyName('UnidNegoc').AsInteger,
                      -1,-1,qryContribSitPart.FieldByname('CodPortForma').AsInteger,-1,
                      qryContribSitPart.FieldByName('CodTipRecDes').AsString,'','',
                      qryContribSitPart.FieldByName('CodTipDesembDevol').AsString,
                      qryContribSitPart.FieldByName('CodTipDesembCAR').AsString,'',
                      qryContribSitPart.FieldByName('PlaContaC').AsString,
                      qryContribSitPart.FieldByName('PlaContaD').AsString,
                      qryContribSitPart.FieldByName('PlaContaDAutPatr').AsString,
                      {qryContribSitPart.FieldByName('CodCentroCustoC').AsString}'',
                      {qryContribSitPart.FieldByName('CodCentroCustoD').AsString}'',
                      qryContribSitPart.FieldByName('CodCentroRespon').AsString, '','','','','','',
                      qryContribSitPart.FieldByName('PlaContaCDevBanco').AsString,
                      qryContribSitPart.FieldByName('PlaContaCDevPat').AsString,
                      qryContribSitPart.FieldByName('CodCCustoCDevBan').AsString,
                      qryContribSitPart.FieldByName('CodCCustoCDevPat').AsString,
                      qryContribSitPart.FieldByName('CodSubConta').AsString);
       Habilitacoes(False,False,True,True,False,True,False,False,True,False,True,False,False,False,False,True);
       Labels(True,True,False,False,False,False,'Conta de Débito',
          'Conta de Crédito','Conta de Débito p/atualização das reservas',
          'Conta de Crédito para atualização das reservas','Conta de Débito p/Provisão',
          'Conta de Débito p/Provisão');
    end;


 END;//WITH DTMINTEGRACAPCAR
end;  // PreencheDados

procedure TfrmIntegraCAPCAR.PreparaIntegracao;
begin
   WITH DTMINTEGRACAPCAR DO BEGIN
      qryTipoDocCAR.Close;    qryTipoDocCAR.Open;
      qryTipoDocCAP.Close;    qryTipoDocCAP.Open;
      qryFormaPag.Close;      qryFormaPag.Open;
      try
         qryContaContabil.Close;
         qryContaContabil.SQL.Clear;
         qryContaContabil.SQL.Add(' SELECT PLACONTA, PLANOME, PLATIPO, PLACCUST'+
             ' FROM   PLANOCONTA WHERE  PLANO = '+IntToStr(IntegraBack.Plano));
         qryContaContabil.Open;
         treeContaContabil.Mascara       := IntegraBack.MascaraPlano;
         edContaDebito1.EditMask         := IntegraBack.MascaraPlano + ';0; ';
         edContaDebito2.EditMask         := IntegraBack.MascaraPlano + ';0; ';
         edContaAnulaReceita.EditMask    := IntegraBack.MascaraPlano + ';0; ';
         edContaAnulaDespesa.EditMask    := IntegraBack.MascaraPlano + ';0; ';
         edContaContabilDevol.EditMask   := IntegraBack.MascaraPlano + ';0; ';
         edContaContabilDevolPatro.EditMask   := IntegraBack.MascaraPlano + ';0; ';
//*** início - Tavares - pendência 14998
         MskEdCCCAP.EditMask    := IntegraBack.MascaraPlano + ';0; ';
//*** fim - Tavares - pendência 14998

         treeContaContabil.MontaArvore;
         edContaCredito1.EditMask       := IntegraBack.MascaraPlano + ';0; ';
      except Raise;
      end;

      //Verifica se a empresa utiliza o sistema ABC( Custo Baseado na Atividade)
     if not (IntegraBack.ObrigaABC = 'S')
     then lkcmbDescAtividade.Enabled := False
     else begin
        lkcmbDescAtividade.Enabled := True;
        qryAtividade.Close;
        qryAtividade.ParamByName('IDEMPRESA').AsString := IntToStr(Sistema.idEmpresa);
        qryAtividade.Open;
     end;

      try
         qrytpreceb.close;
         qryTpReceb.ParamByName('IDEMPRESA').AsString := inttostr(Sistema.idEmpresa);
         qryTpReceb.Open;

         if qryTpReceb.IsEmpty then Begin
             spdTpReceb.Enabled  := False;
             spdDevReceb.Enabled := False;
         end
         else begin
           spdTpReceb.Enabled  := True;
           spdDevReceb.Enabled := True;
           treeTpReceb.Mascara := IntegraBack.MascaraDesemb;
           treeTpReceb.MontaArvore;
         end;
      except Raise;
      end;

      try
         qrytpPaga.close;
         qryTpPaga.ParamByName('IDEMPRESA').AsString := IntToStr(Sistema.idEmpresa);
         qryTpPaga.Open;

         if qryTpPaga.eof then Begin
           spdTpPaga.Enabled := false;
           spdDevDesemb.Enabled := false;
         end
         else begin
           spdTpPaga.Enabled := true;
           spdDevDesemb.Enabled := true;
           treeTpPaga.Mascara := IntegraBack.MascaraDesemb;
           treeTpPaga.MontaArvore;
         end;

      except Raise;
      end;

      qryCentRespon.Close;
      qryCentRespon.ParamByName('IDEMPRESA').AsString := IntToStr(Sistema.idEmpresa);
      qryCentRespon.Open;

      qryTipoOper.Close;
      qryTipoOper.Open;

   END;//WITH DTMINTEGRACAPCAR

   LimpaTela;          // Limpar campos da tela
end;

function TfrmIntegraCAPCAR.MontaTree : boolean;
var
    tUltFundacao, tUltPatro, tUltPlano, tUltPlanoPrev,
    tUltItem, tUltSubItem  : TTreeNode;
begin
   trvGrupos.Items.Clear;
   lstAuxId.Clear; // Lista de Id's das querys
   lstAuxTipo.Clear;
   { Lista de Tipos :
      PM - Parâmetros gerais de integração Financeira
      // Independente de Patrocinadora - POR PLANO
      FD - FUNDACAO
      PL - PLANO
      CL - CONTRIBUICAO POR PLANO
      DL - CONTRIBUICAO SOBRE DECIMO TERCEIRO POR PLANO
      BL - BENEFICIO POR PLANO
      AL - ABONO POR PLANO

      // Dependente   de Patrocinadora
      ZP - Grupo específico para Patrocinadora
      PP - PATROCINADORA
      LP - PLANO DA PATROCINADORA
      CP - Contrib POR PATROCINADORA
      DP - CONTRIBUICAO SOBRE DECIMO TERCEIRO POR PATROCINADORA
      AP - Abono POR PATROCINADORA

      // Especifica de cada participante
      PT - PARTICIPANTE
      CT - CONTRIBUICAO DO PARTICIPANTE
      DT - CONTRIBUICAO SOBRE DECIMO TERCEIRO POR PARTICIPANTE
      BT - BENEFICIO DO PARTICIPANTE
    }

WITH DTMINTEGRACAPCAR DO BEGIN
   //****************************************************
   // Preencher DADOS DAS FUNDACOES
   //****************************************************

   tUltFundacao := trvGrupos.Items.Add(nil,'Informações gerais do Sistema');
   lstAuxId.Items.Add('-1');
   lstAuxTipo.Items.Add('PM');
   tUltItem:=  trvGrupos.Items.AddChild(tUltFundacao,'Integração Contábil');
   lstAuxId.Items.Add(qryFundacao.FieldbyName('IdPessoa').AsString);
   lstAuxTipo.Items.Add('PM');

   tUltItem.ImageIndex := 2;
   tUltItem.StateIndex := 2;

   //****************************************************
   // Preencher PLANOS INDEPENDENTES DE PATROCINADORAS
   //******************************************************
   tUltPatro := trvGrupos.Items.Add(nil,'Informações específicas dos Planos');
   lstAuxId.Items.Add('-1');
   lstAuxTipo.Items.Add('PL');
   qryPlanoPuro.First;
   // Preencher planos da patrocinadora
   while not qryPlanoPuro.Eof do begin
      tUltPlano:=  trvGrupos.Items.AddChild(tUltPatro,qryPlanoPuro.FieldByName('Nome').AsString);
      lstAuxId.Items.Add(qryPlanoPuro.FieldbyName('IdPlanAss').AsString);
      lstAuxTipo.Items.Add('PL');
      // Preencher CONTRIBUICOES do Plano
      qryContribPlano.Close;
      qryContribPlano.ParamByName('IdPlanoPrev').AsInteger := qryPlanoPuro.FieldByName('IdPlanAss').AsInteger;
      qryContribPlano.Open;

      tUltItem := trvGrupos.Items.AddChild(tUltPlano,'Contribuições Normais');
      lstAuxId.Items.Add('-1');
      lstAuxTipo.Items.Add('CL');
      qryContribPlano.First;
      while not qryContribPlano.Eof do begin
         tUltSubItem := trvGrupos.Items.AddChild(tUltItem,qryContribPlano.FieldByName('Nome').AsString);
         lstAuxId.Items.Add(qryContribPlano.FieldByName('IdContribuicao').AsString);
         lstAuxTipo.Items.Add('CL');
         tUltSubItem.ImageIndex := 2;
         tUltSubItem.StateIndex := 2;
         qryContribPlano.Next;
      end;//while not qryContribPlano.Eof

      // Ir para proximo plano
      qryPlanoPuro.Next;
   end;//while not qryPlanoPuro.Eof

   //****************************************************
   // Preencher dados especificos do PARTICIPANTE
   //******************************************************
   tUltItem:= trvGrupos.Items.Add(nil,'Informações específicas dos Participante');
   lstAuxId.Items.Add('-1');
   lstAuxTipo.Items.Add('PT');

   // Contribuicoes especificas do participante
   tUltSubItem :=  trvGrupos.Items.AddChild(tUltItem,'Contribuições Normais');
   lstAuxId.Items.Add('-1');
   lstAuxTipo.Items.Add('CT');

   // **************************************************
   // Preencher estrutura DEPENDENTE DA PATROCINADORA
   //***************************************************

   tUltFundacao := trvGrupos.Items.Add(nil,'Informações específicas das Patrocinadoras');
   lstAuxId.Items.Add('-1');
   lstAuxTipo.Items.Add('PZ');    // ítem criado apenas para fazer o grupo Patrocinadora

   qryPatro.First;
   // Preencher patrocinadoras
   while not qryPatro.Eof do  begin
       tUltPatro := trvGrupos.Items.AddChild(tUltFundacao,qryPatro.FieldByName('Nome').AsString);
       lstAuxId.Items.Add(qryPatro.FieldByName('IdPessoa').AsString);
       lstAuxTipo.Items.Add('PP');

       qryPlanoPrev.Close;
       qryPlanoPrev.ParamByName('IdPessoa').AsInteger    := qryPatro.FieldByName('IdPessoa').AsInteger;
       qryPlanoPrev.Open;
       qryPlanoPrev.First;
       // Preencher planos previdenciais da patrocinadora
       while not qryPlanoPrev.Eof do begin
          tUltPlanoPrev:=  trvGrupos.Items.AddChild(tUltPatro,qryPlanoPrev.FieldByName('Nome').AsString);
          lstAuxId.Items.Add(qryPlanoPrev.FieldbyName('IdPlanoPrev').AsString);
          lstAuxTipo.Items.Add('PV');

          qryPlano.Close;
          qryPlano.ParamByName('IdPessoa').AsInteger    := qryPatro.FieldByName('IdPessoa').AsInteger;
          qryPlano.ParamByName('IdPlanoPrev').AsInteger := qryPlanoPrev.FieldByName('IdPlanoPrev').AsInteger;
          qryPlano.Open;
          qryPlano.First;
          // Preencher planos da patrocinadora
          while not qryPlano.Eof do begin
             tUltPlano:=  trvGrupos.Items.AddChild(tUltPlanoPrev,qryPlano.FieldByName('Nome').AsString);
             lstAuxId.Items.Add(qryPlano.FieldbyName('IdPlanAss').AsString);
             lstAuxTipo.Items.Add('LP');

             // Preencher CONTRIBUICOES do Plano da Patrocinadora
             tUltItem := trvGrupos.Items.AddChild(tUltPlano,'Contribuições Normais');
             lstAuxId.Items.Add('-1');
             lstAuxTipo.Items.Add('CP');

             qryContrib.Close;
             qryContrib.ParamByName('IdPessJur').AsInteger   := qryPatro.FieldByName('IdPessoa').AsInteger;
             qryContrib.ParamByName('IdPlanoPrev').AsInteger := qryPlano.FieldByName('IdPlanoPrev').AsInteger;
             qryContrib.ParamByName('IdPlanAss').AsInteger   := qryPlano.FieldByName('IdPlanAss').AsInteger;
             qryContrib.Open;

             qryContrib.First;
             while not qryContrib.Eof do begin
                tUltSubItem := trvGrupos.Items.AddChild(tUltItem,qryContrib.FieldByName('Nome').AsString);
                lstAuxId.Items.Add(qryContrib.FieldByName('IdContAss').AsString);
                lstAuxTipo.Items.Add('CP');
                tUltSubItem.ImageIndex := 2;
                tUltSubItem.StateIndex := 2;
                qryContrib.Next;
             end;//while not qryContrib.Eof

             // Ir para proximo plano
             qryPlano.Next;
          end;//while not qryPlano.Eof
          qryPlanoPrev.next;
       end; // while no qryPlanoPrev.eof
       // Ir para proxima patrocinadora
       qryPatro.Next;
   end; //while not qryPatro.Eof

   // **********************************************************
   // Preencher estrutura DEPENDENTE DA SITUAÇÃO DO PARTICPANTE
   //***********************************************************

   tUltFundacao := trvGrupos.Items.Add(nil,'Informações por Situação de Participante');
   lstAuxId.Items.Add('-1');
   lstAuxTipo.Items.Add('SA');    // ítem criado apenas para fazer o grupo situação

   qrySitPart.First;
   // Preencher Situações
   while not qrySitPart.Eof do  begin
       tUltPatro := trvGrupos.Items.AddChild(tUltFundacao,qrySitPart.FieldByName('Descricao').AsString);
       lstAuxId.Items.Add(qrySitPart.FieldByName('IDSITPART').AsString);
       lstAuxTipo.Items.Add('SP');

       qryPlanoPuro.First;
       // Preencher planos da patrocinadora
       while not qryPlanoPuro.Eof do begin
          tUltPlano:=  trvGrupos.Items.AddChild(tUltPatro,qryPlanoPuro.FieldByName('Nome').AsString);
          lstAuxId.Items.Add(qryPlanoPuro.FieldbyName('IdPlanAss').AsString);
          lstAuxTipo.Items.Add('PLST');
          // Preencher CONTRIBUICOES do Plano
          qryContribPlano.Close;
          qryContribPlano.ParamByName('IdPlanoPrev').AsInteger := qryPlanoPuro.FieldByName('IdPlanAss').AsInteger;
          qryContribPlano.Open;

          tUltItem := trvGrupos.Items.AddChild(tUltPlano,'Contribuições Normais');
          lstAuxId.Items.Add('-1');
          lstAuxTipo.Items.Add('CS');
          qryContribPlano.First;
          while not qryContribPlano.Eof do begin
             tUltSubItem := trvGrupos.Items.AddChild(tUltItem,qryContribPlano.FieldByName('Nome').AsString);
             lstAuxId.Items.Add(qryContribPlano.FieldByName('IdContribuicao').AsString);
             lstAuxTipo.Items.Add('CS');
             tUltSubItem.ImageIndex := 2;
             tUltSubItem.StateIndex := 2;
             qryContribPlano.Next;
          end;//while not qryContribPlano.Eof

          // Ir para proximo plano
          qryPlanoPuro.Next;
       end;//while not qryPlanoPuro.Eof
       // Ir para proxima situação de participante
       qrySitPart.Next;
   end; //while not qrySitPart.eof

END;//With dtmIntegraCAPCAR

   Result := True;
end;

procedure TfrmIntegraCAPCAR.PreencheDadosParticip;
var
     iCont, i                : integer;
     tUltItem,  tUltSubItem  : TTreeNode;
begin
  with dtmIntegraCAPCAR do begin
    if (not qryParticipante.Active) or (qryParticipante.IsEmpty)
    then Exit;

{
   // Especifica de cada participante
   PT - PARTICIPANTE - Raiz
   CT - CONTRIBUICAO DO PARTICIPANTE - Raiz
   CE - Contribuicao Especifica do Participante - Folha
   DT - CONTRIBUICAO SOBRE 13o. DO PARTICIPANTE - Raix
   DE - CONTRIBUICAO SOBRE 13o. DO PARTICIPANTE - Folha
   BT - BENEFICIO DO PARTICIPANTE    - Raiz
   BE - Beneficio Especifico do Participante - Folha
   RT - RESERVA DO PARTICIPANTE      - Raiz
   RE - Reserva Especifica do Participante - Folha

}
    // Procurar indice absoluto do participante e da contribuicao
    iIndNoParticip := -1;
    iIndNoContrib  := -1;
    for i := 0 to lstAuxTipo.Items.Count - 1 do  begin
       if lstAuxTipo.Items[i] = 'PT' then iIndNoParticip := i
       else if lstAuxTipo.Items[i] = 'CT' then iIndNoContrib := i;
       if (iIndNoParticip <> -1) and (iIndNoContrib <> -1)
       then break; // todos os id's já estao preenchidos
    end;

    // Preencher contribuicoes do participante
    iUltDadoParticip := iIndNoParticip;
    iCont := 1;
    qryContribPart.First;
    while not qryContribPart.EOF do begin
        tUltItem := trvGrupos.Items[iIndNoContrib];
        tUltSubItem := trvGrupos.Items.AddChild(tUltItem,qryContribPart.FieldByName('Nome').AsString);
        lstAuxId.Items.Insert(iIndNoContrib+iCont,qryContribPart.FieldByName('IdContribuicao').AsString);
        lstAuxTipo.Items.Insert(iIndNoContrib+iCont,'CE');
        inc(iCont);
        inc(iUltDadoParticip);
        tUltSubItem.ImageIndex := 2;
        tUltSubItem.StateIndex := 2;
        qryContribPart.Next;
    end;//while not qryContribPart.Eof


  end; //with
end;//PreencheDadosParticip

procedure TfrmIntegraCAPCAR.LimpaDadosParticip;
var
   i : integer;
begin
   // Limpar ABONO  do participante
   trvGrupos.Items.Item[iIndNoAbono].DeleteChildren;

   // Limpar reservas do participante
   trvGrupos.Items.Item[iIndNoReserva].DeleteChildren;

   // Limpar beneficios do participante
   trvGrupos.Items.Item[iIndNoBenef].DeleteChildren;

   // Limpar contribuicoes sobre 13o. do participante
   trvGrupos.Items.Item[iIndNoDecTerc].DeleteChildren;

   // Limpar contribuicoes do participante
   trvGrupos.Items.Item[iIndNoContrib].DeleteChildren;

   // Apagar listas de id's e tipos
   // Obs. O '+3' é porque os items Contribuicao, beneficio e Reserva
   // também estão na lista
   for i := iUltDadoParticip + 3 downto iIndNoParticip  do begin
      if  ((lstAuxTipo.Items[i] = 'CE') or (lstAuxTipo.Items[i] = 'DE') or
           (lstAuxTipo.Items[i] = 'BE') or (lstAuxTipo.Items[i] = 'AE'))
      then begin
        lstAuxId.Items.Delete(i);
        lstAuxTipo.Items.Delete(i);
      end;
   end;
end;//LimpaDadosParticip

procedure TfrmIntegraCAPCAR.FormActivate(Sender: TObject);
// var // CAMILLE - REFER - 16.03.1999
//  sTipo : string;
begin
  inherited;
  qrySitPart.Close;    qrySitPart.Open;
  with dtmIntegraCAPCAR do Begin
    qryFundacao.Close;
    qryFundacao.Open;
    //sTipoPrevidencia := qryFundacao.FieldByName('FLGTIPOPREVIDENC').AsString;
    //if sTipoPrevidencia = '' Then
    //   sTipoPrevidencia := 'F';
  end;
  {if sTipoPrevidencia = 'F' then begin}
     NomePatro        := 'Patrocinadora';
     NomePatroUpper   := 'PATROCINADORA : ';
     lblPatro.Caption := 'Patrocinadora';
  {end
  else
  begin
     NomePatro        := 'Instituidora';
     lblPatro.Caption := 'Instituidora';
     NomePatroUpper   := 'INSTITUIDORA : ';
     dtmIntegraCAPCAR.qryPlano.Sql.Clear;
     dtmIntegraCAPCAR.qryPlanoPuro.Sql.Clear;
     //dtmIntegraCAPCAR.qryPlano.Sql.Add(' SELECT  FROM   PLANPREV PL, PLANPREVPATRO PP, '+
     //    ' PESSOA PAT ');
     //dtmIntegraCAPCAR.qryPlanoPuro.Sql.Add(' SELECT  FROM   PLANPREV PL WHERE  PL.TPPLANOPREV IN ('''+'C'',''I'+''') '+
     //    ' ORDER  BY NOME');
  end;}

  with dtmIntegraCAPCAR do begin
    qryPatro.Close;        qryPatro.Open;
    qryPlano.Close;        qryPlano.Open;
    qryPlanoPuro.Close;    qryPlanoPuro.Open;
    qryAlterador.Close;    qryAlterador.Open;
    qryAltPagar.Close;     qryAltPagar.Open;
    qrySubConta.Close;
    qrySubConta.ParamByName('IdEmpresa').AsInteger := Sistema.IdEmpresa;
    qrySubConta.Open; 
//  Prepara componentes de Integracao
    PreparaIntegracao;
  end;   //with

  if not MontaTree then Exit;
  pgctrlIntegracao.ActivePage := tbsOutros;
  pnlFundoOutros.Enabled      := False;
  pnlFundoContab.Enabled      := False;
  pnlFundoCAPCAR.Enabled      := False;
  bProcPart                   := False;
  bbtnConfirmar.Enabled       := True;
end;

procedure TfrmIntegraCAPCAR.trvGruposCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  inherited;
  Node.ImageIndex := 0;
  Node.SelectedIndex := 0;
end;

procedure TfrmIntegraCAPCAR.trvGruposExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  Node.ImageIndex := 1;
  Node.SelectedIndex := 1;
  if lstAuxTipo.Items[Node.AbsoluteIndex] = 'SP' Then
     iSitPart := StrToInt(lstAuxId.Items[Node.AbsoluteIndex]);

end;

procedure TfrmIntegraCAPCAR.trvGruposExpanded(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  Node.ImageIndex := 1;
  Node.SelectedIndex := 1;
end;

procedure TfrmIntegraCAPCAR.trvGruposChange(Sender: TObject;
  Node: TTreeNode);
var
    iIdItem,            //id do item na tabela correspondente
    iItem : integer;    //id do item na arvore
    sRecPag,
    sItem,
    sTipo : string;
begin
  inherited;
  pgctrlIntegracao.Enabled    := True;
  pgctrlIntegracao.Visible    := True;
  pnlFundoOutros.Visible      := True;
  pnlFundoOutros.Enabled      := True;
  pgctrlIntegracao.ActivePage := TbsOutros;
  anMudaGrupos.Visible        := True;
  anMudaGrupos.BringtoFront;
  anMudaGrupos.Open           := True;
  anMudaGrupos.Active         := True;
  sRecPag                     := 'R';
  iItem                       := trvGrupos.Selected.AbsoluteIndex;
  iIdItem                     := StrToInt(lstAuxId.Items[iItem]);
  sTipo                       := lstAuxTipo.Items[iItem];
  sItem                       := trvGrupos.Items.Item[iItem].Text;
  if sTipo = 'SP' Then iSitPart := iIdItem;
  LimpaTela;
  if trvGrupos.Selected.HasChildren and ((sTipo <> 'PP') and (sTipo <> 'LP')) Then
     DesabilitaTudo
  else Begin
      if (bProcPart) then begin
         if (sTipo <> 'PT') and (sTipo <> 'CT') and (sTipo <> 'BT') and (sTipo <> 'RT') and
            (sTipo <> 'DT') and (sTipo <> 'DE') and (sTipo <> 'CE') and (sTipo <> 'BE') and
            (sTipo <> 'RE') and (sTipo <> 'AT') and (sTipo <> 'AE')
         then begin
           if MsgDlg('Todas as informações do participante selecionado ainda não gravadas serão perdidas. Deseja continuar ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
           then Begin
              anMudaGrupos.Open    := False;
              anMudaGrupos.Active  := False;
              anMudaGrupos.Visible := False;
              Exit;
           end;
           // Se o usuario optou por perder os dados do participante
           // Limpar dados do participante anterior
           LimpaDadosParticip;
           bProcPart := False;
           sRecPag := 'N';
         end
         else begin
           //Configurar dados do participante
           // Especifica de cada participante
           //   PT - PARTICIPANTE
           //   CT - CONTRIBUICAO DO PARTICIPANTE
           //   DT - CONTRIBUICAO SOBRE 13o. DO PARTICIPANTE
           //   BT - BENEFICIO DO PARTICIPANTE
           //   RT - RESERVA DO PARTICIPANTE

           sRecPag := 'N'; // colocar nem R nem P no RecPag para nao
                           // mostrar os tabsheets Pagar e Receber
           if (pgctrlIntegracao.ActivePage = tbsPAGAR) or (pgctrlIntegracao.ActivePage = tbsRECEBER)
           then pgctrlIntegracao.ActivePage := tbsContab;
           PreencheDados(sTipo,sItem,iItem,iIdItem);
         end;
         // Habilitar paineis caso tenha sido escolhida uma opcao que permita
         pnlFundoOutros.Enabled := (lstAuxId.Items[iItem] <> '-1');
         pnlFundoContab.Enabled := (lstAuxId.Items[iItem] <> '-1');
         pnlFundoCAPCAR.Enabled := (lstAuxId.Items[iItem] <> '-1');
         anMudaGrupos.Open := False;
         anMudaGrupos.Active := False;
         anMudaGrupos.Visible := False;
         Exit;
      end;

      // Verificar qual o item selecionado e configurar tela
      // de acordo com o item
      if sTipo = 'PM' Then Begin
         Habilitacoes(False,False,False,False,False,False,False,False,False,False,False,True,True,True,False,False);
         Labels(False,True,False,False,
                False,False,'Conta de Despesa','Conta de Receita','Conta de Débito p/atualização das reservas',
                'Conta de Crédito para atualização das reservas','Conta de Débito p/Provisão',
                'Conta de Débito p/Provisão');
         bbtnProcurar.Visible := False;
      end;
      if  (sTipo = 'PL') or (sTipo = 'CL') or (sTipo = 'BL') or
          (sTipo = 'IL') or (sTipo = 'AL') or (sTipo = 'DL')
      then begin // item é do tipo dependente do PLANO
         CaptionsDirTopo('Integração de Plano Assistencial ','','','','',False);
         if sTipo = 'PL' then begin
            sRecPag := 'R';
            if lstAuxId.Items[iItem] = '-1' then begin
               CaptionsDirTopo('-1','','-1','','Selecionar plano ... ',False)
            end
            else CaptionsDirTopo('-1','','-1','','PLANO : '+sItem,False);
         end
         else begin
            if lstAuxTipo.Items[iItem] = 'CL' then begin
               sRecPag := 'R';
               //Preencher variant com IdPlanoPrev+IdContribuicao
               dtmIntegraCAPCAR.qryContribPlano.Close;
               dtmIntegraCAPCAR.qryContribPlano.ParamByName('IdPlanoPrev').AsInteger := PlanoPai('L',iItem);
               dtmIntegraCAPCAR.qryContribPlano.Open;

               if dtmIntegraCAPCAR.qryContribPlano.Locate('IdContribuicao',iIdItem,[loCaseInsensitive,loPartialKey])
               then CaptionsDirTopo('-1','','-1','', 'PLANO : '+dtmIntegraCapCar.qryContribPlano.FieldByName('Plano').AsString,False)
               else CaptionsDirTopo('-1','','-1','', 'PLANO : '+trvGrupos.Selected.Parent.Text,False);

               if lstAuxId.Items[iItem] = '-1'
               then lblOpcao.Caption := 'Selecionar contribuição ... '
               else lblOpcao.Caption := 'CONTRIBUIÇÃO : '+sItem;
            end;
            if lstAuxTipo.Items[iItem] = 'DL' then begin
               sRecPag := 'R';
               //Preencher variant com IdPlanoPrev+IdContribuicao
               dtmIntegraCAPCAR.qryDecTercPlano.Close;
               dtmIntegraCAPCAR.qryDecTercPlano.ParamByName('IdPlanoPrev').AsInteger := PlanoPai('L',iItem);
               dtmIntegraCAPCAR.qryDecTercPlano.Open;

               if dtmIntegraCAPCAR.qryDecTercPlano.Locate('IdContribuicao',iIdItem,[loCaseInsensitive,loPartialKey])
               then lblPlano.Caption := 'PLANO : '+dtmIntegraCapCar.qryDecTercPlano.FieldByName('Plano').AsString
               else lblPlano.Caption := 'PLANO : '+trvGrupos.Selected.Parent.Text;

               if lstAuxId.Items[iItem] = '-1'
               then lblOpcao.Caption := 'Selecionar contribuição ... '
               else lblOpcao.Caption := 'CONTRIBUIÇÃO : '+sItem;
            end;
         end;
      end // item é do tipo independente de Patrocinadora
      else begin
         if (sTipo = 'PP') or (sTipo = 'LP') or (sTipo = 'CP') or
            (sTipo = 'BP') or (sTipo = 'AP') or (sTipo = 'DP')
         then begin // item depende da patrocinadora
            lblPatro.Visible          := True;
            lblParticipante.Visible   := False;
            lblPlano.Visible          := True;
            bbtnProcurar.Visible      := False;
            stxtTitulo.Caption := 'Integração de '+ NomePatro;

            if sTipo = 'PP'  then begin  // item selecionado é a patrocindora
               if lstAuxId.Items[iItem] = '-1'
               then lblOpcao.Caption := 'Selecionar '+ NomePatroUpper +' ... '
               else lblPatro.Caption := NomePatroUpper + sItem;
               lblPlano.Visible := False;
               sRecPag := 'N';
            end
            else begin
               if sTipo = 'LP' then begin   // Item selecionado é o plano da patrocinadora
                  sRecPag := 'R';
                  //Preencher variant com IdPatrocinadora+IdPlanoPrev
                  dtmIntegraCapCar.qryPlano.Close;
                  dtmIntegraCapCar.qryPlano.ParamByName('IdPessoa').AsInteger := PatroPai(iItem);
                  dtmIntegraCapCar.qryPlano.Open;
                  if dtmIntegraCapCar.qryPlano.Locate('IdPlanoPrev',iIdItem,[loCaseInsensitive,loPartialKey])
                  then lblPatro.Caption := NomePatroUpper + dtmIntegraCapCar.qryPlano.FieldByName('Patrocinadora').AsString
                  else lblPatro.Caption := NomePatroUpper + trvGrupos.Selected.Parent.Text;

                  if lstAuxId.Items[iItem] = '-1' then begin
                     lblOpcao.Caption := 'Selecinar plano ... ';
                     lblPlano.Visible := False;
                  end
                  else lblPlano.Caption := 'PLANO : '+sItem;
               end;
               if sTipo = 'CP' then begin     // Contribuicao da Patrocinadora x Plano
                  sRecPag := 'R';
                  if lstAuxId.Items[iItem] = '-1' then begin // o item 'Contribuicoes' está selecionado
                     lblPatro.Caption := NomePatroUpper + trvGrupos.Selected.Parent.Parent.Text;
                     lblPlano.Caption := 'PLANO : '+trvGrupos.Selected.Parent.Text;
                     lblOpcao.Caption := 'Selecionar contribuição ... ';
                  end
                  else begin // alguma contribuicao está selecionada
                     lblPatro.Caption := '';
                     lblPlano.Caption := '';
                     //Preencher variant com IdPatrocinadora+IdPlanoPrev+IdContrib
                     dtmIntegraCapCar.qryContrib.Close;
                     dtmIntegraCapCar.qryContrib.ParamByName('IdPessJur').AsInteger := PatroPai(iItem);
                     dtmIntegraCapCar.qryContrib.ParamByName('IdPlanass').AsInteger := PlanoPai('P',iItem);
                     dtmIntegraCapCar.qryContrib.ParamByName('IdPlanoPrev').AsInteger := PlanoPai('V',iItem);
                     dtmIntegraCapCar.qryContrib.Open;
                     if dtmIntegraCapCar.qryContrib.Locate('IdContribuicao',iIdItem,[loCaseInsensitive,loPartialKey])
                     then begin
                        lblPatro.Caption := NomePatroUpper + dtmIntegraCapCar.qryContrib.FieldByName('Patrocinadora').AsString;
                        lblPlano.Caption := 'PLANO : '+dtmIntegraCapCar.qryContrib.FieldByName('Plano').AsString;
                        lblOpcao.Caption := 'CONTRIBUIÇÃO : '+sItem;
                     end;
                     Habilitacoes(False,False,True,True,False,True,False,False,True,False,True,False,False,False,False,True);
                  end;
               end; // if Contribuicao da Patrocinadora x Plano
            end;
         end // item depende da patrocinadora
         else begin
            if (lstAuxTipo.Items[iItem] = 'FD') or
               (lstAuxTipo.Items[iItem] = 'IF')      // item da Fundacao
            then begin
                sRecPag                   := 'P';
                stxtTitulo.Caption        := 'Integração Específica da Fundação ';

                if sTipo = 'FD'  then begin
                   if lstAuxId.Items[iItem] = '-1'  then begin
                      CaptionsDirTopo('-1','','','','Selecionar Fundação ... ',False);
                   end
                   else begin
                      CaptionsDirTopo('-1','','FUNDAÇÃO : '+sItem,'','',False);
                   end;
                end
                else begin
                   if sTipo = 'IF'  then begin
                      lblParticipante.Caption   := 'IRRF';
                      lblParticipante.Visible   := True;
                      lblOpcao.Visible          := False;
                   end;
                end;
            end
            else begin // item do participante
                CaptionsDirTopo('Integração Específica de Participante ','','','',
                                'Selecionar participante ... ',False);
            end;
         end; // item do participante
      end;//else

      tbsPagar.TabVisible   := (sRecPag = 'P');
      tbsReceber.TabVisible := (sRecPag = 'R');
      if (sRecPag = 'P') or (sRecPag = 'R') Then Begin
         tbsDevol.TabVisible       := True;
         if (sRecPag = 'P') Then Begin
            grpDevReceb.Enabled       := True;
            grpDevDesemb.Enabled      := False;
         end
         else Begin
            grpDevDesemb.Enabled      := True;
            grpDevReceb.Enabled       := False;
         end;
      end
      else
         tbsDevol.TabVisible       := False;

     // Preencher dados
     if lstAuxId.Items[iItem] <> '-1' then
        PreencheDados(sTipo,sItem,iItem,iIdItem);

     if tbsRECEBER.TabVisible then Begin
         pgctrlIntegracao.ActivePage := tbsRECEBER;
         pnlFundoCRecebe.Enabled     := True;
         pnlFundoCRecebe.Visible     := True;
     end;
     if tbsPagar.TabVisible then Begin
         pgctrlIntegracao.ActivePage := tbsPAGAR;
         pnlFundoCAPCAR.Enabled      := True;
         pnlFundoCAPCAR.Visible      := True;
     end;
     if tbsContab.TabVisible then Begin
         pgctrlIntegracao.ActivePage := tbsContab;
         pnlFundoContab.Enabled      := True;
         pnlFundoContab.Visible      := True;
     end;
     if tbsOutros.TabVisible then Begin
         pgctrlIntegracao.ActivePage := tbsOutros;
         pnlFundoOutros.Enabled      := True;
         pnlFundoOutros.Visible      := True;
     end;
     if tbsTipoDoc.TabVisible Then
         pgctrlIntegracao.ActivePage := tbsTipoDoc;
     if tbsTipoper.TabVisible Then
         pgctrlIntegracao.ActivePage := tbsTipoper;

  end;
  anMudaGrupos.Open := False;
  anMudaGrupos.Active := False;
  anMudaGrupos.Visible := False;
  anMudaGrupos.SendtoBack;
end;

procedure TfrmIntegraCAPCAR.GravaIntegPORPLANO(sTipo : STRING; iItemArvore,iIdItem :  integer; sTpPart : STRING);
var  sWhere, sSQL : string;
    // idPLANASSTIPOPART : Integer;
begin
   { Dados por Plano :
     PL - PLANO (PlanPrev)  - CodTipDoc, CodTipRecDes e RecPag
     CL - CONTRIBUICAO POR PLANO(CONTPREV)   - CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                               PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                               IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                               CODALTERADORJUROS,CODALTERADORCORR,CODPORTFORMA
     DL - CONTRIBUICAO 13o. POR PLANO(CONTPREV)- CODTIPDOC13,CODTIPRECDES13,RECPAG13,UNIDNEGOC13,PLACONTAC13,CODCENTROCUSTOC13,
                                               PLACONTAD13, CODCENTROCUSTOD13,PLANO13,IDEMPRESA13,
                                               IDEMPRESAPROP13,CODSUBCONTA13,CODCENTRORESPON13,TIPCODIGO13,
                                               CodAlteraJuros13,CODALTERADORCORR13,CODPORTFORMA13
     BL - BENEFICIO POR PLANO(BENEFPLANPREV) - CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                               PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                               IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                               CODALTERADORCORR,CODPORTFORMA
     RL - RESERVA   POR PLANO (RESERVAXPLANO) - CodTipDoc, CodTipRecDes e RecPag
    }

   with dtmIntegraCAPCAR do begin
      if sTipo = 'CL' then begin
          // Verificar campos obrigatorios
          sSQL := ',';

          if Trim(edTpReceb.text) <> '' then Begin
            sSQL := sSQL + ' CODTIPRECDES  = '''+ edRecebTp +''',';
            sSQL := sSQL + ' RECPAG = ''R'' ' + ',';
          end
          else Begin
            sSQL := sSQL + ' CODTIPRECDES  = NULL,';
            sSQL := sSQL + ' RECPAG = NULL,';
          end;

          if Trim(edDesembCAR.text) <> '' then
             sSQL := sSQL + ' CODTIPDESEMBCAR  = '''+ edDesembCARcod +''','
          else
            sSQL := sSQL + ' CODTIPDESEMBCAR  = NULL,';

          if Trim(edDesembolso.text) <> '' then
            sSQL := sSQL + ' CODTIPDESEMBDEVOL  = '''+ edDesemb +''','
          else
            sSQL := sSQL + ' CODTIPDESEMBDEVOL  = NULL ,';
          if (Trim(edDesembolso.text) = '') AND (Trim(edDesembCAR.text) = '') then
            sSQL := sSQL + ' RECPAGDEVOL = NULL,'
          else
            sSQL := sSQL + ' RECPAGDEVOL = ''P''' + ',';

          if Trim(lkcmbDescAtividade.text) <> ''
          then sSQL := sSQL +' UNIDNEGOC ='+qryAtividade.fieldbyname('unidnegoc').AsString+',';

          if Trim(edContaCredito1.text) <> ''
          then sSQL := sSQL + ' PLACONTAC ='''+Trim(edContaCredito1.text)+''','
          else sSQL := sSQL + ' PLACONTAC = NULL ,';


          if Trim(cmbCCusto1.Text) <> ''
          then sSQL := sSQL + ' CODCENTROCUSTOC ='''+qryCCusto1.fieldbyname('codcentrocusto').AsString+''',';

          if Trim(edContaDebito1.text) <> ''
          then sSQL := sSQL + ' PLACONTAD ='''+Trim(edContaDebito1.text)+''','
          else sSQL := sSQL + ' PLACONTAD = NULL,';

          if Trim(edContaDebito2.text) <> ''
          then sSQL := sSQL + ' PLACONTADAUTPATR ='''+Trim(edContaDebito2.text)+''','
          else sSQL := sSQL + ' PLACONTADAUTPATR = NULL,';

          if (Trim(edContaCredito1.text) <> '') or (Trim(edContaDebito1.text) <> '')or
             (Trim(edContaDebito2.text) <> '') then
            sSQL := sSQL + ' PLANO = '+IntToStr(IntegraBack.Plano)+',';

          if Trim(cmbCCusto.text) <>  ''
          then sSQL := sSQL + ' CODCENTROCUSTOD ='''+qryCCusto.fieldbyname('codcentrocusto').AsString+''',';

          if (Trim(cmbCCusto1.Text) <> '') or (Trim(cmbCCusto.Text) <> '') or
             (Trim(edContaDebito1.text) <> '') or (Trim(edContaDebito2.text) <> '') or
             (Trim(edContaContabilDevol.text) <> '') then
            sSQL := sSQL + ' IDEMPRESA ='+IntToStr(Sistema.IdEmpresa)+',';
//
          if Trim(edContaContabilDevol.text) <> ''
          then sSQL := sSQL + ' PLACONTACDEVBANCO ='''+Trim(edContaContabilDevol.text)+''','
          else sSQL := sSQL + ' PLACONTACDEVBANCO = NULL ,';

          if Trim(edContaContabilDevolPatro.text) <> ''
          then sSQL := sSQL + ' PLACONTACDEVPAT ='''+Trim(edContaContabilDevolPatro.text)+''','
          else sSQL := sSQL + ' PLACONTACDEVPAT = NULL ,';

          if Trim(dblkCCDevol.Text) <> ''
          then sSQL := sSQL + ' CODCCUSTOCDEVBAN =''' + dblkCCDevol.LookupValue + ''',';

          if Trim(dblkCCDevolPatro.Text) <> ''
          then sSQL := sSQL + ' CODCCUSTOCDEVPAT =''' + dblkCCDevolPatro.LookupValue + ''',';
//
          if Trim(cmbcentrespon.text) <> ''
          then sSQL := sSQL + ' CODCENTRORESPON = '''+qrycentrespon.fieldbyname('codcentrorespon').AsString+''',';

{          if Trim(dblkpcmbAltJurosCAR.Text) <> ''  then begin
             qryAlterador.Locate('DESCRICAO',dblkpcmbAltJurosCAR.Text,[loCaseInsensitive,loPartialKey]);
             sSQL := sSQL + ' CODALTERADORJUROS = '+qryAlterador.fieldbyname('CodAlterador').AsString+',';
          end;
}
{          if Trim(dblkpcmbAltCorrecaoCAR.Text) <> '' then begin
             qryAlterador.Locate('DESCRICAO',dblkpcmbAltCorrecaoCAR.Text,[loCaseInsensitive,loPartialKey]);
             sSQL := sSQL + ' CODALTERADORCORR = '+qryAlterador.fieldbyname('CodAlterador').AsString+',';
          end;
}
          if Trim(dblkSubConta.text) <> ''
          then sSQL := sSQL + ' CODSUBCONTA = '+ dblkSubConta.LookupValue +','
          else sSQL := sSQL + ' CODSUBCONTA = NULL ,';

          if Trim(dblkpcmbPortForma.text) <> ''
          then sSQL := sSQL + ' CODPORTFORMA = '+qryformapag.fieldbyname('codportforma').AsString+',';

          if (Trim(edTpReceb.Text) <> '') or (Trim(lkcmbDescAtividade.Text) <> '') or
             (Trim(cmbCCusto1.Text) <> '') or (Trim(cmbCCusto.Text) <> '') or
             (Trim(cmbcentrespon.Text) <> '') then
              sSQL := sSQL + ' IDEMPRESAPROP = ' + IntToStr(Sistema.IdEmpresa) + ',';

          // Se nao tem SQL, -> sair
          if Trim(sSQL) = ',' then begin
              MsgDlg('Não existem dados para atualizar.','Informação',mtInformation,[mbOK],0);
              Exit;
          end;
          // Tirar primeira e ultima virgula
          sSQL := Copy(sSQL, 2, Length(sSQL) - 2);
          sWhere := '';
          sWhere := ' IDPLANASS = '+IntToStr(PlanoPai('L',iItemArvore)) +' AND '+
                    ' IDCONTASS = '+IntToStr(iIdItem);
          // Gravar campos
          with qryAux do begin
             Close;
             SQL.Clear;
             SQL.Add('UPDATE CONTRIBASS SET '+sSQL +' WHERE '+sWhere);
             try
                ExecSQL;
             except
                on E:EDBEngineError do
                   MostrarErro(E);
             end;//try
          end;//with
      end;

      // Reabrir querys
      qryPlanoPuro.Close;    qryPlanoPuro.Open;
      qryContribPlano.Close; qryContribPlano.Open;
   end;//with dtmIntegraCAPCAR

end;//GravaIntegPORPLANO

procedure TfrmIntegraCAPCAR.GravaIntegPORSITPART(sTipo : STRING; iItemArvore,iIdItem :  integer; sTpPart : STRING);
var  sWhere, sSQL : string;
     idPLANASSTIPOPART : Integer;
begin
      if sTipo = 'CS' then begin
         with dtmIntegraCAPCAR do begin
          qryAux.Sql.Text := 'SELECT IDPLANASSTIPOPART FROM PLANASSTIPOPART '+
                             'WHERE IDPLANASS = '+IntToStr(PlanoPai('H',iItemArvore)) +' AND '+
                             'IDCONTASS = '+IntToStr(iIdItem) + ' AND '+
                             'IDSITPART = ' + InttoStr(PlanoPai('S',iItemArvore));
                             //
          qryAux.Open;
          if qryAux.RecordCount = 0 Then Begin
             // não existe registro na PLANASSTIPOPART
             qryAux.Close;
             qryAux.SQL.Clear;
             idPLANASSTIPOPART := LeUltRegistro (NIL, 'PLANASSTIPOPART');
             qryAux.SQL.Add('INSERT INTO PLANASSTIPOPART (IDPLANASSTIPOPART, IDPLANASS, '+
                            'IDCONTASS, IDSITPART) VALUES (' + inttostr(idPLANASSTIPOPART) + ', '+
                            IntToStr(PlanoPai('H',iItemArvore))+ ' ,' + IntToStr(iIdItem) + ', '+
                            InttoStr(PlanoPai('S',iItemArvore)) + '  )');
                            //
             qryAux.ExecSQL;
          end;
          qryAux.Close;
          qryAux.SQL.Clear;

          // Verificar campos obrigatorios
          sSQL := '';

          if Trim(edTpReceb.text) <> '' then Begin
            sSQL := sSQL + ' CODTIPRECDES  = '''+ edRecebTp +''',';
            sSQL := sSQL + ' RECPAG = ''R'' ' + ',';
          end
          else Begin
            sSQL := sSQL + ' CODTIPRECDES  = NULL,';
            sSQL := sSQL + ' RECPAG = NULL,';
          end;

          if Trim(edDesembCAR.text) <> '' then
             sSQL := sSQL + ' CODTIPDESEMBCAR  = '''+ edDesembCARcod +''','
          else
            sSQL := sSQL + ' CODTIPDESEMBCAR  = NULL,';

          if Trim(edDesembolso.text) <> '' then
            sSQL := sSQL + ' CODTIPDESEMBDEVOL  = '''+ edDesemb +''','
          else
            sSQL := sSQL + ' CODTIPDESEMBDEVOL  = NULL ,';
          if (Trim(edDesembolso.text) = '') AND (Trim(edDesembCAR.text) = '') then
            sSQL := sSQL + ' RECPAGDEVOL = NULL,'
          else
            sSQL := sSQL + ' RECPAGDEVOL = ''P''' + ',';

          if Trim(lkcmbDescAtividade.text) <> ''
          then sSQL := sSQL +' UNIDNEGOC ='+qryAtividade.fieldbyname('unidnegoc').AsString+',';

          if Trim(edContaCredito1.text) <> ''
          then sSQL := sSQL + ' PLACONTAC ='''+Trim(edContaCredito1.text)+''','
          else sSQL := sSQL + ' PLACONTAC = NULL ,';


          if Trim(cmbCCusto1.Text) <> ''
          then sSQL := sSQL + ' CODCENTROCUSTOC ='''+qryCCusto1.fieldbyname('codcentrocusto').AsString+''',';

          if Trim(edContaDebito1.text) <> ''
          then sSQL := sSQL + ' PLACONTAD ='''+Trim(edContaDebito1.text)+''','
          else sSQL := sSQL + ' PLACONTAD = NULL,';

          if Trim(edContaDebito2.text) <> ''
          then sSQL := sSQL + ' PLACONTADAUTPATR ='''+Trim(edContaDebito2.text)+''','
          else sSQL := sSQL + ' PLACONTADAUTPATR = NULL,';

          if (Trim(edContaCredito1.text) <> '') or (Trim(edContaDebito1.text) <> '') or
             (Trim(edContaDebito2.text) <> '') then
            sSQL := sSQL + ' PLANO = '+IntToStr(IntegraBack.Plano)+',';

          if Trim(cmbCCusto.text) <>  ''
          then sSQL := sSQL + ' CODCENTROCUSTOD ='''+qryCCusto.fieldbyname('codcentrocusto').AsString+''',';

          if (Trim(cmbCCusto1.Text) <> '') or (Trim(cmbCCusto.Text) <> '') or
             (Trim(dblkCCDevol.Text) <>'') or (Trim(dblkCCDevolPatro.Text) <> '')

          then sSQL := sSQL + ' IDEMPRESA ='+IntToStr(Sistema.IdEmpresa)+',';

          if Trim(edContaContabilDevol.text) <> ''
          then sSQL := sSQL + ' PLACONTACDEVBANCO ='''+Trim(edContaContabilDevol.text)+''','
          else sSQL := sSQL + ' PLACONTACDEVBANCO = NULL ,';

          if Trim(edContaContabilDevolPatro.text) <> ''
          then sSQL := sSQL + ' PLACONTACDEVPAT ='''+Trim(edContaContabilDevolPatro.text)+''','
          else sSQL := sSQL + ' PLACONTACDEVPAT = NULL ,';

          if Trim(dblkCCDevol.Text) <> ''
          then sSQL := sSQL + ' CODCCUSTOCDEVBAN =''' + dblkCCDevol.LookupValue + ''',';

          if Trim(dblkCCDevolPatro.Text) <> ''
          then sSQL := sSQL + ' CODCCUSTOCDEVPAT =''' + dblkCCDevolPatro.LookupValue + ''',';

          if Trim(dblkSubConta.text) <> ''
          then sSQL := sSQL + ' CODSUBCONTA = '+dblkSubConta.LookupValue +','
          else sSQL := sSQL + ' CODSUBCONTA = NULL ,';

          if Trim(cmbcentrespon.text) <> ''
          then sSQL := sSQL + ' CODCENTRORESPON = '''+qrycentrespon.fieldbyname('codcentrorespon').AsString+''',';
          if Trim(dblkpcmbPortForma.text) <> ''
          then sSQL := sSQL + ' CODPORTFORMA = '+qryformapag.fieldbyname('codportforma').AsString+',';

          if (Trim(edTpReceb.Text) <> '') or (Trim(lkcmbDescAtividade.Text) <> '') or
             (Trim(cmbCCusto1.Text) <> '') or (Trim(cmbCCusto.Text) <> '') or
             (Trim(cmbcentrespon.Text) <> '') then
              sSQL := sSQL + ' IDEMPRESAPROP = ' + IntToStr(Sistema.IdEmpresa) + ',' ;

          // Se nao tem SQL, -> sair
          if Trim(sSQL) = ',' then begin
              MsgDlg('Não existem dados para atualizar.','Informação',mtInformation,[mbOK],0);
              Exit;
          end;
          // Tirar primeira e ultima virgula
          sSQL := Copy(sSQL, 2, Length(sSQL) - 2);
          sWhere := '';
          sWhere := ' IDPLANASS = '+IntToStr(PlanoPai('H',iItemArvore))   +' AND '+
                    ' IDCONTASS = '+IntToStr(iIdItem) +' AND '+
                    ' IDSITPART = ' + InttoStr(PlanoPai('S',iItemArvore));

          // Gravar campos
          with qryAux do begin
             Close;
             SQL.Clear;
             SQL.Add('UPDATE PLANASSTIPOPART SET '+sSQL +' WHERE '+sWhere);
             try
                ExecSQL;
             except
                on E:EDBEngineError do
                   MostrarErro(E);
             end;//try
          end;//with 'CS'
         end;
      end;    //if sTipo = 'CL'
end;


procedure TfrmIntegraCAPCAR.GravaIntegPORPATRO(sTipo : STRING; iItemArvore,iIdItem :  integer; sTpPart : STRING);
var  sWhere,
     sSQL : string;
begin
 {  Dados por Patrocinadora :
    LP - Plano (PLANPREVPATRO)        - CodAlteradorJuros, CODALTERADORCORR
    CP - Contribuicao (CONTPLANPATRO) - CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                        PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                        IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                        CODALTERADORJUROS,CODALTERADORCORR,CODPORTFORMA
    DP-Contribuicao 13o.(CONTPLANPATRO)-CODTIPDOC13,CODTIPRECDES13,RECPAG13,UNIDNEGOC13,PLACONTAC13,CODCENTROCUSTOC13,
                                        PLACONTAD13, CODCENTROCUSTOD13,PLANO13,IDEMPRESA13,
                                        IDEMPRESAPROP13,CODSUBCONTA13,CODCENTRORESPON13,TIPCODIGO13,
                                        CodAlteraJuros13,CODALTERADORCORR13,CODPORTFORMA13

    BP - Beneficio (BENEFPLANPATRO)  -  CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                        PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                        IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                        CODALTERADORCORR,CODPORTFORMA
    PP - Patrocinadora (PATRO)       -  Conta para Líquido da Folha
    }
   with dtmIntegraCAPCAR do begin
      if sTipo = 'CP' then begin
          // Verificar campos obrigatorios
          sSQL := ',';

          if Trim(edTpReceb.text) <> '' then Begin
            sSQL := sSQL + ' CODTIPRECDES  = '''+ edRecebTp +''',';
            sSQL := sSQL + ' RECPAG = ''R''' + ',';
          end
          else Begin
            sSQL := sSQL + ' CODTIPRECDES  = NULL,';
            sSQL := sSQL + ' RECPAG = NULL,';
          end;

          if Trim(edDesembCAR.text) <> ''then
             sSQL := sSQL + ' CODTIPDESEMBCAR  = '''+ edDesembCARcod +''','
          else
            sSQL := sSQL + ' CODTIPDESEMBCAR  = NULL,';

          if Trim(edDesembolso.text) <> '' then
            sSQL := sSQL + ' CODTIPDESEMBDEVOL  = '''+ edDesemb +''','
          else
            sSQL := sSQL + ' CODTIPDESEMBDEVOL = NULL,';

          if (Trim(edDesembolso.text) = '') AND (Trim(edDesembCAR.text) = '') then
            sSQL := sSQL + ' RECPAGDEVOL = NULL,'
          else
            sSQL := sSQL + ' RECPAGDEVOL = ''P''' + ',';

          if Trim(lkcmbDescAtividade.text) <> ''
          then sSQL := sSQL +' UNIDNEGOC ='+qryAtividade.fieldbyname('unidnegoc').AsString+',';

          if Trim(edContaCredito1.text) <> ''
          then sSQL := sSQL + ' PLACONTAC ='''+Trim(edContaCredito1.text)+''','
          else sSQL := sSQL + ' PLACONTAC = NULL,';

          if Trim(cmbCCusto1.Text) <> ''
          then sSQL := sSQL + ' CODCENTROCUSTOC ='''+qryCCusto1.fieldbyname('codcentrocusto').AsString+''',';

          if Trim(edContaDebito1.text) <> ''
          then sSQL := sSQL + ' PLACONTAD ='''+Trim(edContaDebito1.text)+''','
          else sSQL := sSQL + ' PLACONTAD = NULL,';

          if Trim(edContaDebito2.text) <> ''
          then sSQL := sSQL + ' PLACONTADAUTPATR ='''+Trim(edContaDebito2.text)+''','
          else sSQL := sSQL + ' PLACONTADAUTPATR = NULL,';

          if Trim(cmbCCusto.text) <>  ''
          then sSQL := sSQL + ' CODCENTROCUSTOD ='''+qryCCusto.fieldbyname('codcentrocusto').AsString+''',';

          if (Trim(edContaCredito1.text) <> '') or (Trim(edContaDebito1.text) <> '') or
             (Trim(edContaDebito2.text) <> '') then
            sSQL := sSQL + ' PLANO = '+IntToStr(IntegraBack.Plano)+',';

          if (Trim(cmbCCusto1.Text) <> '') or (Trim(cmbCCusto.Text) <> '') or
             (Trim(dblkCCDevolPatro.Text) <> '')  or (Trim(dblkCCDevol.Text) <> '')
          then sSQL := sSQL + ' IDEMPRESA ='+IntToStr(Sistema.IdEmpresa)+',';

          if Trim(edContaContabilDevol.text) <> ''
          then sSQL := sSQL + ' PLACONTACDEVBANCO ='''+Trim(edContaContabilDevol.text)+''','
          else sSQL := sSQL + ' PLACONTACDEVBANCO = NULL ,';

          if Trim(edContaContabilDevolPatro.text) <> ''
          then sSQL := sSQL + ' PLACONTACDEVPAT ='''+Trim(edContaContabilDevolPatro.text)+''','
          else sSQL := sSQL + ' PLACONTACDEVPAT = NULL ,';

          if Trim(dblkCCDevol.Text) <> ''
          then sSQL := sSQL + ' CODCCUSTOCDEVBAN =''' + dblkCCDevol.LookupValue + ''',';

          if Trim(dblkCCDevolPatro.Text) <> ''
          then sSQL := sSQL + ' CODCCUSTOCDEVPAT =''' + dblkCCDevolPatro.LookupValue + ''',';


          if Trim(cmbcentrespon.text) <> ''
          then sSQL := sSQL + ' CODCENTRORESPON = '''+qrycentrespon.fieldbyname('codcentrorespon').AsString+''',';

{          if Trim(dblkpcmbAltJurosCAR.Text) <> '' then begin
             qryAlterador.Locate('DESCRICAO',dblkpcmbAltJurosCAR.Text,[loCaseInsensitive,loPartialKey]);
             sSQL := sSQL + ' CODALTERADORJUROS = '+qryAlterador.fieldbyname('CodAlterador').AsString+',';
          end;
}
{          if Trim(dblkpcmbAltCorrecaoCAR.Text) <> '' then begin
             qryAlterador.Locate('DESCRICAO',dblkpcmbAltCorrecaoCAR.Text,[loCaseInsensitive,loPartialKey]);
             sSQL := sSQL + ' CODALTERADORCORR = '+qryAlterador.fieldbyname('CodAlterador').AsString+',';
          end;
}
          if Trim(dblkSubConta.text) <> ''
          then sSQL := sSQL + ' CODSUBCONTA = '+dblkSubConta.LookupValue+','
          else sSQL := sSQL + ' CODSUBCONTA = NULL ,';

          if Trim(dblkpcmbPortForma.text) <> ''
          then sSQL := sSQL + ' CODPORTFORMA = '+qryformapag.fieldbyname('codportforma').AsString+',';

          if (Trim(edTpReceb.Text) <> '') or (Trim(lkcmbDescAtividade.Text) <> '') or
             (Trim(cmbCCusto1.Text) <> '') or (Trim(cmbCCusto.Text) <> '') or
             (Trim(cmbcentrespon.Text) <> '') then
              sSQL := sSQL + ' IDEMPRESAPROP = ' + IntToStr(Sistema.IdEmpresa) + ',';

          // Se nao tem SQL, -> sair
          if Trim(sSQL) = ',' then begin
              MsgDlg('Não existem dados para atualizar.','Informação',mtInformation,[mbOK],0);
              Exit;
          end;

          // Tirar primeira e ultima virgula
          sSQL := Copy(sSQL, 2, Length(sSQL) - 2);

          sWhere := '';
          sWhere := ' IDPESSJUR   = '+IntToStr(PatroPai(iItemArvore))+' AND '+
                    ' IDPLANASS   = '+IntToStr(PlanoPai('P',iItemArvore))+' AND '+
                    ' IDCONTASS   = '+IntToStr(iIdItem) + ' AND '+
                    ' IDPLANOPREV = '+ IntToStr(PlanoPai('V',iItemArvore));

          // Gravar campos
          with qryAux do begin
             Close;
             SQL.Clear;
             SQL.Add('UPDATE CONTRIBPLANPREVA SET ' + sSQL + ' WHERE '+sWhere);
             try
                ExecSQL;
             except
                on E:EDBEngineError do
                   MostrarErro(E);
             end;//try
          end;//with
      end //if sTipo = 'CP'
//*** inicio - tavares - pendência 14998
      else if sTipo = 'PP' then
      begin
        // Atualizar a tabela Patro
         sSql := '';
         // tipo de desembolso
         if edTpPaga.Text <> '' then
           sSql := sSql + ' TIPODESEMBASS = '+ edDesembTp + ','
         else
           sSql := sSql + ' TIPODESEMBASS = NULL,';

          // conta contábil de crédito (fornecedor)
         if MskEdCCCAP.Text <> '' then
           sSql := sSql + ' CCCREDITOASS = '+ sContaContabil + ','
           //(treeContaContabil.CampoChave).AsString + ','
         else
           sSql := sSql + ' CCCREDITOASS = NULL,';

          //código do centro de custo
          if Trim(dblkCCDevolCAP.Text) <> '' then
            sSQL := sSQL + ' CCUSTOASS = ' + dblkCCDevolCAP.LookupValue + ','
          else
            sSQL := sSQL + ' CCUSTOASS  = NULL,';

          //código do centro de Responsabilidade
          if Trim(DblkCresposCAP.Text) <> '' then
            sSQL := sSQL + ' CDCRESPONASS = ' + DblkCresposCAP.LookupValue + ','
          else
            sSQL := sSQL + ' CDCRESPONASS  = NULL,';

          //código da atividade/projeto
          if Trim(dblkAtivProjCAP.Text) <> '' then
            sSQL := sSQL + ' ATIVPROJETOASS = ' + dblkAtivProjCAP.LookupValue + ','
          else
            sSQL := sSQL + ' ATIVPROJETOASS  = NULL,';

          //código dO PROGRAMA CONTÁBIL
          if Trim(dblkProgramaCAP.Text) <> '' then
            sSQL := sSQL + ' CODPROGRAMAASS = ' + dblkProgramaCAP.LookupValue + ','
          else
            sSQL := sSQL + ' CODPROGRAMAASS  = NULL,';

          //idpessoa do fornecedor
          if Trim(DblkFornecedor.Text) <> '' then
            sSQL := sSQL + ' IDFORCLIASS = ' + DblkFornecedor.LookupValue + ','
          else
            sSQL := sSQL + ' IDFORCLIASS  = NULL,';

         // Tirar primeira e ultima virgula
         sSQL := Copy(sSQL, 2, Length(sSQL) - 2);
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE PATRO SET ' + sSQL  );
         qryAux.SQL.Add(' WHERE IDPESSOA   = '+IntToStr(PatroPai(iItemArvore)) + ' AND ');
         qryAux.SQL.Add('       IDFUNDACAO = '+IntToStr(Sistema.IdEmpresa));
         try
           qryAux.ExecSQL;
         except
            on E:EDBEngineError do
               MostrarErro(E);
         end;//try

      end; //pp
//*** fim - tavares - pendência 14998


      // Reabrir querys
      qryPlano.Close;   qryPlano.Open;
      qryContrib.Close; qryContrib.Open;
   end;//with dtmIntegraCAPCAR
end;//GravaIntegPORPATRO

procedure TfrmIntegraCAPCAR.GravaIntegPORPART(sTipo : STRING; iIdItem :  integer);
var  sWhere,
     sSQL : string;
begin
{  // Especifica de cada participante
   PT - Participante (PARTPREVPLAN) - < nada >
   CT - Contribuicao (CONTRIBPREVPARTP) - CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                             PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                             IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                             CODALTERADORJUROS,CODALTERADORCORR,CODPORTFORMA
   DT - Contribuicao (CONTRIBPREVPARTP) - CODTIPDOC13,CODTIPRECDES13,RECPAG13,UNIDNEGOC13,PLACONTAC13,CODCENTROCUSTOC13,
                                             PLACONTAD13, CODCENTROCUSTOD13,PLANO13,IDEMPRESA13,
                                             IDEMPRESAPROP13,CODSUBCONTA13,CODCENTRORESPON13,TIPCODIGO13,
                                             CodAlteraJuros13,CODALTERADORCORR13,CODPORTFORMA13
   BT - Beneficio    (BENEFPLANOPART)      - CODTIPDOC,CODTIPRECDES,RECPAG,UNIDNEGOC,PLACONTAC,CODCENTROCUSTOC,
                                             PLACONTAD, CODCENTROCUSTOD,PLANO,IDEMPRESA,
                                             IDEMPRESAPROP,CODSUBCONTA,CODCENTRORESPON,TIPCODIGO,
                                             CODALTERADORCORR,CODPORTFORMA
   RT - Reserva      (RESERVAPART)         - Plano, PlaContaC, PlaContaD, CodCentroCustoC,
                                             CodCentroCustoD, UnidNegocio, CodPortForma,
                                             IdEmpresa, IdEmpresaProp, SubConta, CentroRespons,
                                             TipCodigo
}
   with dtmIntegraCAPCAR do begin
      if sTipo = 'CE' then begin
          // Verificar campos obrigatorios
          sSQL := ',';

          if Trim(edTpReceb.text) <> '' then Begin
            sSQL := sSQL + ' CODTIPRECDES  = '''+ edRecebTp +''',';
            sSQL := sSQL + ' RECPAG = ''R''' + ',';
          end
          else Begin
            sSQL := sSQL + ' CODTIPRECDES  = NULL,';
            sSQL := sSQL + ' RECPAG = NULL,';
          end;

          if Trim(edDesembCAR.text) <> ''then 
             sSQL := sSQL + ' CODTIPDESEMBCAR  = '''+ edDesembCARcod +''','
          else
            sSQL := sSQL + ' CODTIPDESEMBCAR  = NULL,';

          if Trim(edDesembolso.text) <> '' then
            sSQL := sSQL + ' CODTIPDESEMBDEVOL  = '''+ edDesemb +''','
          else
            sSQL := sSQL + ' CODTIPDESEMBDEVOL  = NULL,';

          if (Trim(edDesembolso.text) = '') AND (Trim(edDesembCAR.text) = '') then
            sSQL := sSQL + ' RECPAGDEVOL = NULL,'
          else
            sSQL := sSQL + ' RECPAGDEVOL = ''P''' + ',';

          if Trim(lkcmbDescAtividade.text) <> ''
          then sSQL := sSQL +' UNIDNEGOC ='+qryAtividade.fieldbyname('unidnegoc').AsString+',';

          if Trim(edContaCredito1.text) <> ''
          then sSQL := sSQL + ' PLACONTAC ='''+Trim(edContaCredito1.text)+''','
          else sSQL := sSQL + ' PLACONTAC = NULL,';

          if Trim(cmbCCusto1.Text) <> ''
          then sSQL := sSQL + ' CODCENTROCUSTOC ='''+qryCCusto1.fieldbyname('codcentrocusto').AsString+''',';

          if Trim(edContaDebito1.text) <> ''
          then sSQL := sSQL + ' PLACONTAD ='''+Trim(edContaDebito1.text)+''','
          else sSQL := sSQL + ' PLACONTAD = NULL,';

          if Trim(edContaDebito2.text) <> ''
          then sSQL := sSQL + ' PLACONTADAUTPATR ='''+Trim(edContaDebito2.text)+''','
          else sSQL := sSQL + ' PLACONTADAUTPATR = NULL,';

          if Trim(cmbCCusto.text) <>  ''
          then sSQL := sSQL + ' CODCENTROCUSTOD ='''+qryCCusto.fieldbyname('codcentrocusto').AsString+''',';

          if (Trim(edContaCredito1.text) <> '') or (Trim(edContaDebito1.text) <> '') or
             (Trim(edContaDebito2.text) <> '') then
            sSQL := sSQL + ' PLANO = '+IntToStr(IntegraBack.Plano)+',';

          if (Trim(cmbCCusto1.Text) <> '') or (Trim(cmbCCusto.Text) <> '')
          then sSQL := sSQL + ' IDEMPRESA ='+IntToStr(Sistema.IdEmpresa)+',';

          if Trim(cmbcentrespon.text) <> ''
          then sSQL := sSQL + ' CODCENTRORESPON = '''+qrycentrespon.fieldbyname('codcentrorespon').AsString+''',';

{          if Trim(dblkpcmbAltJurosCAR.Text) <> '' then begin
             qryAlterador.Locate('DESCRICAO',dblkpcmbAltJurosCAR.Text,[loCaseInsensitive,loPartialKey]);
             sSQL := sSQL + ' CODALTERADORJUROS = '+qryAlterador.fieldbyname('CodAlterador').AsString+',';
          end;
}
{          if Trim(dblkpcmbAltCorrecaoCAR.Text) <> '' then begin
             qryAlterador.Locate('DESCRICAO',dblkpcmbAltCorrecaoCAR.Text,[loCaseInsensitive,loPartialKey]);
             sSQL := sSQL + ' CODALTERADORCORR = '+qryAlterador.fieldbyname('CodAlterador').AsString+',';
          end;
}
          if Trim(dblkSubConta.text) <> ''
          then sSQL := sSQL + ' CODSUBCONTA = '+dblkSubConta.LookupValue+','
          else sSQL := sSQL + ' CODSUBCONTA = NULL ,';

          if Trim(dblkpcmbPortForma.text) <> ''
          then sSQL := sSQL + ' CODPORTFORMA = '+qryformapag.fieldbyname('codportforma').AsString+',';

          if (Trim(edTpReceb.Text) <> '') or (Trim(lkcmbDescAtividade.Text) <> '') or
             (Trim(cmbCCusto1.Text) <> '') or (Trim(cmbCCusto.Text) <> '') or
             (Trim(cmbcentrespon.Text) <> '') then
              sSQL := sSQL + ' IDEMPRESAPROP = ' + IntToStr(Sistema.IdEmpresa) + ',';

          // Se nao tem SQL, -> sair
          if Trim(sSQL) = ',' then begin
              MsgDlg('Não existem dados para atualizar.','Informação',mtInformation,[mbOK],0);
              Exit;
          end;

          // Tirar primeira e ultima virgula
          sSQL := Copy(sSQL, 2, Length(sSQL) - 2);

          if not qryContribPart.Locate('IDCONTRIBUICAO',iIdItem,[loCaseInsensitive,loPartialKey])
          then begin
              MsgDlg('Contribuição não encontrada no cadastro.','Erro',mtError,[mbOK],0);
              Exit;
          end;

          sWhere := '';
          sWhere := ' IDPESSOA    = '+qryParticipante.FieldByName('IdPessoa').AsString +' AND '+
                    ' IDPLANASS = '+qryParticipante.FieldByName('IdPlanAss').AsString +' AND '+
                    ' IDPESSJUR   = '+qryParticipante.FieldByName('IdPessJur').AsString+' AND '+
                    ' IDCONTASS = '+qryContribPart.FieldByName('IdContAss').AsString;
          // Gravar campos
          with qryAux do begin
             Close;
             SQL.Clear;
             SQL.Add('UPDATE CONTASS SET '+sSQL +' WHERE '+sWhere);
             try
                ExecSQL;
             except
                on E:EDBEngineError do
                   MostrarErro(E);
             end;//try
          end;//with
      end;  //if sTipo = 'CE'

      // Reabrir querys
      qryContribPart.Close; qryContribPart.Open;
   end;//with dtmIntegraCAPCAR
end;//GravaIntegPORPART

procedure TfrmIntegraCAPCAR.bbtnProcurarClick(Sender: TObject);
//var sIdPatro : string;// CAMILLE - REFER - 16.03.1999
begin
  inherited;
  if (bProcPart)
  then begin
    if MsgDlg('Todos os dados do participante selecionado serão perdidos. Deseja continuar ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
    then Exit;
    // Se o usuario optou por perder os dados do participante
    // Limpar dados do participante anterior
    LimpaDadosParticip;
    bProcPart := False;
  end;

  bProcPart := False;

  lblPatro.Caption        := '';
  lblPlano.Caption        := '';
  lblOpcao.Caption        := '';
  lblParticipante.Caption := '';

  {if sTipoPrevidencia = 'F' then}
     MontaSel.Filtro[4] := 'PLANPREV.TPPLANOPREV =  ' + '''F''';
  {else
     MontaSel.Filtro[4] := 'PLANPREV.TPPLANOPREV <> ' + '''F''';}

  Montasel.Executar;

  if Montasel.RetornouValor then
  begin
    if (montaSel.ValoresChave.Count <= 0 ) or (Trim(MontaSel.ValoresChave[0]) = '') then
      iIdPatroSel := -1
    else
      iIdPatroSel := StrToIntDef(Montasel.ValoresChave[0],0);

    if (montaSel.ValoresChave.Count <= 0) or (Trim(MontaSel.ValoresChave[1]) = '') then
      iIdPartSel := -1
    else
      iIdPartSel  := StrToIntDef(Montasel.ValoresChave[1],0);

    if (montaSel.ValoresChave.Count <= 0) or (Trim(MontaSel.ValoresChave[4]) = '') then
      iIdPlanoSel := -1
    else
      iIdPlanoSel := StrToIntDef(MontaSel.ValoresChave[4],0);

    with dtmIntegraCAPCAR do
    begin
       qryParticipante.Close;
       qryParticipante.ParamByName('IdPessoa').AsInteger := iIdPartSel;
       qryParticipante.ParamByName('IdPlanoPrev').AsInteger := iIdPlanoSel;
       qryParticipante.ParamByName('IdPessJur').AsInteger := iIdPatroSel;
       qryParticipante.Open;

       if qryParticipante.IsEmpty then
         exit;
       lblPatro.Caption := NomePatroUpper + qryParticipante.FieldByName('Patrocinadora').AsString;
       lblPlano.Caption := 'PLANO : '+qryParticipante.FieldByName('Plano').AsString;
       lblOpcao.Caption := 'Selecionar Opção';
       lblParticipante.Caption := 'PARTICIPANTE : '+qryParticipante.FieldByName('Nome').AsString;
       lblPatro.Visible := True;
       lblPlano.Visible := True;
       lblParticipante.Visible := True;
       tbsContab.TabVisible := True;
       tbsOutros.TabVisible := True;
       if (pgctrlIntegracao.ActivePage <> tbsContab)
          and (pgctrlIntegracao.ActivePage <> tbsOutros) then
         pgctrlIntegracao.ActivePage := tbsContab;
    end; //with
    bProcPart := True;
    PreencheDadosParticip;
  end;
end;

// ***************** EVENTOS DE INTEGRACAO COM CAP & CAR ************* /
procedure TfrmIntegraCAPCAR.cmbCCustoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // FERNANDO - P.15233 - INICIO
  //lbDescricaoCCusto.Caption := LookupTable.FieldByName('Nome').AsString;
  If LookupTable.fieldbyname('STATUSGRUPOCDC').asstring = 'S' then
  begin
     MsgDlg(' O Centro de Custo não pode ser sintético ','Erro',mtError,[mbOK],0);
     lbDescricaoCCusto.Caption := '';
     dblkCCDevolCAP.Value := '';
  end else
      lbDescricaoCCusto.Caption := LookupTable.FieldByName('Nome').AsString;
  // FERNANDO - P.15233 - FIM
end;

procedure TfrmIntegraCAPCAR.treeContaContabilDblClick(Sender: TObject);
begin
  inherited;
  WITH DTMINTEGRACAPCAR DO
  BEGIN
   if (qryContaContabil.FieldByName('PLATIPO').asString = 'A')
   then treeContaContabilExit(treeContaContabil)
   else Exit;
  END;
end;

procedure TfrmIntegraCAPCAR.treeContaContabilExit(Sender: TObject);
begin
  inherited;
  WITH DTMINTEGRACAPCAR DO BEGIN
    treeContaContabil.Visible := false;
    if (qryContaContabil.FieldByName('PLATIPO').asString = 'A') then begin
       case spdContabAtual of
          1 : Begin
               edContaDebito1.Text := '';
               edContaDebito1.Text := treeContaContabil.ValorChave;
               lbDescContaDebito1.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
          2 : Begin
               edContaDebito2.Text := '';
               edContaDebito2.Text := treeContaContabil.ValorChave;
               lbDescContaDebito2.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
          3 : Begin
               edContaCredito1.Text := '';
               edContaCredito1.Text := treeContaContabil.ValorChave;
               lbDescContaCredito1.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
{          4 : Begin
               edContaContabilJurosD.Text := '';
               edContaContabilJurosD.Text := treeContaContabil.ValorChave;
               lbDescricaoContaJurosD.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;}
{          5 : Begin
               edContaContabilAtuaC.Text := '';
               edContaContabilAtuaC.Text := treeContaContabil.ValorChave;
               lbDescricaoContaAtuaC.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end; }
{          6 : Begin
               edContaContabilJurosC.Text := '';
               edContaContabilJurosC.Text := treeContaContabil.ValorChave;
               lbDescricaoContaJurosC.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;}
{          7 : Begin
               edContaContabilProvisD.Text := '';
               edContaContabilProvisD.Text := treeContaContabil.ValorChave;
               lbDescricaoContaProvisD.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;}
{          8 : Begin
               edContaContabilProvisC.Text := '';
               edContaContabilProvisC.Text := treeContaContabil.ValorChave;
               lbDescricaoContaProvisC.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;}
          9 : Begin
               edContaContabilDevol.Text := '';
               edContaContabilDevol.Text := treeContaContabil.ValorChave;
               lbDescricaoContaDevol.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         10 : Begin
               edContaContabilDevolPatro.Text := '';
               edContaContabilDevolPatro.Text := treeContaContabil.ValorChave;
               lbDescricaoContaDevolPatro.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         11 : Begin
               edContaAnulaReceita.Text := '';
               edContaAnulaReceita.Text := treeContaContabil.ValorChave;
               lblDescricaoContaAnulaReceita.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         12 : Begin
               edContaAnulaDespesa.Text := '';
               edContaAnulaDespesa.Text := treeContaContabil.ValorChave;
               lbDescricaoContaAnulaDespesa.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         //*** início tavares - pendência 14998
         13 : Begin
               MskEdCCCAP.Text := '';
               MskEdCCCAP.Text := treeContaContabil.ValorChave;
               sContaContabil  := treeContaContabil.ValorChave;
               lbDescricaoContaAnulaDespesa.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
              end;
         //*** fim tavares - pendência 14998

       end;
    end;
  END;
end;

procedure TfrmIntegraCAPCAR.cmbCCusto1CloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   lbDescricaoCCusto1.Caption := LookupTable.FieldByName('Nome').AsString;
end;

procedure TfrmIntegraCAPCAR.edTpPagaExit(Sender: TObject);
var sConta : string;
begin
   WITH DTMINTEGRACAPCAR DO BEGIN
   try
      if (not treeTpPaga.visible) then begin
          sConta := edTpPaga.Text;
          if sConta <> '' // Posicionar a Query PlanoConta na conta certa
          then if qryTpPaga.Active
          then if qryTpPaga.LOCATE('DESCRICAO',sConta,[loCaseInsensitive,loPartialKey])
          then if (qryTpPaga.FieldByName('ANASINT').asString <> 'A') then begin
             MsgDlg('Pagamento deve ser analítico.','Erro',mtError,[mbOK],0);
             edTpPaga.Text := '' ;
             edTpPaga.SetFocus;
          end;
      end;
   except Raise;
   end;
   END;

   WITH DTMINTEGRACAPCAR DO BEGIN
     try
        if (not treeTpPaga.visible) then begin
           //sConta := (Sender as TMaskEdit).text;
           sConta := edTpPaga.Text;
           if sConta <> '' // Posicionar a Query PlanoConta na conta certa
           then if qryTpPaga.Active
           then if qryTpPaga.LOCATE('DESCRICAO',sConta,[loCaseInsensitive,loPartialKey]) then begin
             if qryTpPaga.FieldByName('ANASINT').asString = 'A'  then begin
                MsgDlg('Pagamento deve ser analítico.','Erro',mtError,[mbOK],0);
                edTpPaga.Text := '';
                edTpPaga.SetFocus;
             end;
           end
           else begin
              MsgDlg('Pagamento não cadastrado!','Erro',mtError,[mbOK],0);
              edTpPaga.Text := '';
              edTpPaga.SetFocus;
           end
        end;
     except Raise;
     end;
   END;
end;

procedure TfrmIntegraCAPCAR.spdTpPagaClick(Sender: TObject);
begin
  inherited;
  treeTpPaga.Left    := 17; //P.RAMOS-24.09.2004-PEND.17780
  treeTpPaga.Height  := 153;
  treeTpPaga.Visible := not treeTpPaga.Visible;
  if treeTpPaga.Visible then
  begin
    treeTpPaga.bringtofront; //P.RAMOS-24.09.2004-PEND.17780
    treeTpPaga.SetFocus;
  end;
  sSpd := (Sender as TSpeedButton).Name;
  if sSpd = 'spdDevDesemb' Then Begin
    treeTpPaga.Top  := 220;
  end
  else if sSpd = 'spdTpPaga' then
  begin
    treeTpPaga.Left    := 24;
    treeTpPaga.top     := 172;
  end
  else if sSpd = 'spdDesembCAR' Then
          treeTpPaga.Top := 271
       else
          treeTpPaga.Top := 199;
end;

procedure TfrmIntegraCAPCAR.spdTpRecebClick(Sender: TObject);
begin
  inherited;
  treeTpReceb.Left    := 17;
  treeTpReceb.Height  := 220;
  treeTpReceb.Visible := not treeTpReceb.Visible;
  if treeTpReceb.Visible Then
  begin
    treeTpReceb.bringtofront; //P.RAMOS-24.09.2004-PEND.17780
    treeTpReceb.SetFocus;
  end;
  sSpd := (Sender as TSpeedButton).Name;
  if sSpd = 'spdedRecebCAP' Then
     treeTpReceb.Top     := 279
  else
     treeTpReceb.Top     := 189;
end;

procedure TfrmIntegraCAPCAR.treeTpPagaDblClick(Sender: TObject);
begin
  inherited;
  WITH DTMINTEGRACAPCAR DO BEGIN
     if (qryTpPaga.FieldByName('ANASINT').AsString = 'A') then
        treeTpPagaExit(treeTpPaga)
     else Exit;
  END;
end;

procedure TfrmIntegraCAPCAR.treeTpPagaExit(Sender: TObject);
begin
  inherited;
  WITH DTMINTEGRACAPCAR DO BEGIN
    treeTpPaga.Visible := false;
    if (qryTpPaga.FieldByName('ANASINT').asString = 'A') then begin
       if sSpd =  'spdTpPaga' Then Begin
          edTpPaga.Text := '';
          edTpPaga.Text := treeTpPaga.Selected.Text;
          edDesembTp    := (treeTpPaga.CampoChave).AsString;
       end
       else if sSpd = 'spdDevDesemb' Then Begin
          edDesembolso.Text := '';
          edDesembolso.Text := treeTpPaga.Selected.Text;
          edDesemb          := (treeTpPaga.CampoChave).AsString;
       end
       else if sSpd = 'spdDesembCAR' Then Begin
          edDesembCAR.Text := treeTpPaga.Selected.Text;
          edDesembCARcod   :=  (treeTpPaga.CampoChave).AsString
       end;
    end;
  END;
end;

procedure TfrmIntegraCAPCAR.edTpRecebExit(Sender: TObject);
var sConta : string;
begin
   WITH DTMINTEGRACAPCAR DO BEGIN
     try
        if (not treeTpReceb.visible)
        then begin
            sConta := edTpReceb.Text;
            if sConta <> '' // Posicionar a Query PlanoConta na conta certa
            then if qryTpReceb.Active
            then if qryTpReceb.LOCATE('DESCRICAO',sConta,[loCaseInsensitive,loPartialKey])
            then if (qryTpReceb.FieldByName('ANASINT').asString <> 'A')
            then begin
               MsgDlg('Recebimento deve ser analítico.','Erro',mtError,[mbOK],0);
               edTpReceb.Text := '' ;
               edTpReceb.SetFocus;
            end;
        end;
     except
        Raise;
     end;
   END;
   WITH DTMINTEGRACAPCAR DO BEGIN
     try
       if (not treeTpReceb.visible)
       then begin
          //sConta := (Sender as TMaskEdit).text;
          sConta := edTpReceb.Text;
          if sConta <> '' // Posicionar a Query PlanoConta na conta certa
          then if qryTpReceb.Active
          then if qryTpReceb.LOCATE('DESCRICAO',sConta,[loCaseInsensitive,loPartialKey])
          then begin
             if qryTpReceb.FieldByName('ANASINT').asString = 'A'
             then begin
                MsgDlg('Recebimento deve ser analítico.','Erro',mtError,[mbOK],0);
                edTpReceb.Text := '';
                edTpReceb.SetFocus;
             end;
          end
          else begin
             MsgDlg('Recebimento não cadastrado!','Erro',mtError,[mbOK],0);
             edTpReceb.Text := '';
             edTpReceb.SetFocus;
          end
       end;
     except
       Raise;
     end;
   END;
end;

procedure TfrmIntegraCAPCAR.treeTpRecebDblClick(Sender: TObject);
begin
  inherited;
  WITH DTMINTEGRACAPCAR DO BEGIN
    if (qryTpReceb.FieldByName('ANASINT').AsString = 'A') then
         treeTpRecebExit(treeTpReceb)
    else Exit;
  END;
end;

procedure TfrmIntegraCAPCAR.treeTpRecebExit(Sender: TObject);
begin
  inherited;
  WITH DTMINTEGRACAPCAR DO BEGIN
    treeTpReceb.Visible := false;
    if (qryTpReceb.FieldByName('ANASINT').asString = 'A') then begin
       if sSpd = 'spdTpReceb' Then Begin
         edTpReceb.Text := '';
         edTpReceb.Text := treeTpReceb.Selected.Text;
         edRecebTp      := (treeTpReceb.CampoChave).asString;
       end
       else if sSpd = 'spdDevReceb' Then Begin
         edRecebimento.Text := '';
         edRecebimento.Text := treeTpReceb.Selected.Text;
         edReceb            := (treeTpReceb.CampoChave).asString;
       end
    end;
  END;
end;

// ************** FIM DOS  EVENTOS DE INTEGRACAO COM CAP & CAR ***********/
procedure TfrmIntegraCAPCAR.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmIntegraCAPCAR.bbtnConfirmarClick(Sender: TObject);
var
    iIdItem, iItem : integer;
    sItem,   sTipo , sTpPart: string;
begin
  inherited;

  if not validaContaContabil then Exit;  //Frederico - 20/06/2000.
  
  // De acordo com o item em questão, aplicar dados
  iItem   := trvGrupos.Selected.AbsoluteIndex;
  iIdItem := StrToInt(lstAuxId.Items[iItem]);
  sTipo   := lstAuxTipo.Items[iItem];
  sItem   := trvGrupos.Items.Item[iItem].Text;
  sTpPart := lstAuxId.Items[iItem];
  { Lista de Tipos :
    // POR FUNDACAO
    IF - IRRF POR FUNDACAO
    // Independente de Patrocinadora - POR PLANO
    PL - PLANO                            CL - CONTRIBUICAO POR PLANO
    DL - CONTRIBUICAO 13o. POR PLANO
    BL - BENEFICIO POR PLANO              RL - RESERVA   POR PLANO
    IL - IRRF POR PLANO
    // Dependente   de Patrocinadora
    PP - PATROCINADORA
    LP - PLANO DA PATROCINADORA           CP - Contrib POR PATROCINADORA
    DP - CONTRIBUICAO 13o. POR PATROCINADORA
    BP - Beneficio POR PATROCINADORA
    // Especifica de cada participante
    PT - PARTICIPANTE                 CT - CONTRIBUICAO DO PARTICIPANTE
    DT - CONTRIBUICAO 13o. DO PARTICIPANTE
    BT - BENEFICIO DO PARTICIPANTE    RT - RESERVA DO PARTICIPANTE    }
  if  (sTipo = 'PL') or (sTipo = 'CL') or (sTipo = 'DL') or
      (sTipo = 'BL') or (sTipo = 'RL') or (sTipo = 'AL')
  then begin
     // item é do tipo independente de Patrocinadora
     GravaIntegPORPLANO(sTipo,iItem,iIdItem,sTpPart);
  end
  else begin
     if (sTipo = 'PP') or (sTipo = 'LP') or (sTipo = 'CP') or
        (sTipo = 'DP') or (sTipo = 'BP') or (sTipo = 'AP') then // item depende da patrocinadora
        GravaIntegPORPATRO(sTipo,iItem,iIdItem, sTpPart)
      else if (sTipo = 'FD')
            then GravaIntegPORPART(sTipo,iIdItem) // item é do participante
            else if (sTipo = 'PM') Then
                    GravaGeral(sTipo,iIdItem)  // informações gerais (grava em Paramaprev)
                 else if (sTipo = 'CS') Then
                      GravaIntegPORSITPART(sTipo,iItem,iIdItem,sTpPart);
  end;
end;// OKClick

procedure TfrmIntegraCAPCAR.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

procedure TfrmIntegraCAPCAR.edContaDebito1Exit(Sender: TObject);
begin
edContaContabilPadraoExit(edContaDebito1.Text,edContaDebito1,
                          lbDescContaDebito1,lbDescricaoCCusto,cmbCCusto);
end;

procedure TfrmIntegraCAPCAR.edContaCredito1Exit(Sender: TObject);
begin
edContaContabilPadraoExit(edContaCredito1.Text,edContaCredito1,
                          lbDescContaCredito1,lbDescricaoCCusto1,cmbCCusto1);
end;

procedure TfrmIntegraCAPCAR.spdContaDebito1Click(Sender: TObject);
begin
  inherited;
  //P.RAMOS-24.09.2004-PEND.17780
//  SetaParamTree(1,180,18,241,445);
  SetaParamTree(1,180,18,167,445);
  //P.RAMOS-24.09.2004-PEND.17780-até aqui
end;

procedure TfrmIntegraCAPCAR.spdContaCredito1Click(Sender: TObject);
begin
  inherited;
  //P.RAMOS-24.09.2004-PEND.17780
//  SetaParamTree(3,357,18,66,445);
  SetaParamTree(3,166,18,167,445);
  //P.RAMOS-24.09.2004-PEND.17780-até aqui
end;

procedure TfrmIntegraCAPCAR.QryFormaPagaOpen(sRP : String);
Begin
  dblkpcmbPortForma.Enabled := true;;
  if SRP <> 'N' Then Begin
    dtmIntegraCAPCAR.qryformapag.Close;
    dtmIntegraCAPCAR.qryformapag.SQL.Text := 'SELECT CODPORTFORMA,PLANO,IDTEMPLCHEQUE,IDPESSOA,IDEMPRESA,'+
      'PLACONTA,CODCENTROCUSTO, CODBLOQCHE,CODPORTADOR,CODFORMA,RECPAG,'+
      'LANCAFINANC,DMAIS,IDUSUARIOINCLUSAO, DESCRICAO,NUMEMPRESABANCO,'+
      'NOSSONUMERO,JUROSPORDIA,PRAZOPROTESTO,CONTROLEREMESSA,'+
      'DATACONTRREMESSA,CODARQUIVOREMESSA,PATHARQUIVOREM,PATHARQUIVORET,'+
      'CODTIPOPAGTO, CODFORMAPAGTO,FLGEMITEAVISO FROM   PORTADORFORMA '+
      'WHERE RECPAG = ''' + sRP + '''';
    dtmIntegraCAPCAR.qryformapag.Open;
  end;
  if sRP = 'R' Then Begin
       lblFormaRecPag.Caption    := 'Contas/Caixas x Forma de Recebimento';
       StaticText1.Caption       := 'Contas a Receber';
     end
  else if sRP = 'P' Then Begin
       lblFormaRecPag.Caption    := 'Contas/Caixas x Forma de Pagamento';
       StaticText1.Caption       := 'Contas a Pagar';
     end
  else Begin
       dblkpcmbPortForma.Enabled := False;
       StaticText1.Caption       := 'Contas a Pagar / Receber';
  end;
end;

procedure TfrmIntegraCAPCAR.Labels(bCondDeb,bCondCre,bCondCreAtu,bCondDebAtu,
                    bCondCreProv,bCondDebProv : Boolean;
                    sContaDeb,sContaCre,sContaDebAtu,sContaCreAtu,sContaDebProv,sContaCreProv : String);
Begin
   //   Orelha Contabilidade
   // descricao das contas
   grpDebContab.Caption      := sContaDeb;
   grpCreContab.Caption      := sContaCre;
   // habilitação dos grupos e spd
   grpCreContab.Enabled      := bCondCre;
   spdContaCredito1.Enabled := bCondCre;
   grpDebContab.Enabled      := bCondDeb;
   spdContaDebito1.Enabled  := bCondDeb;

end;
procedure TfrmIntegraCAPCAR.spdDevRecebClick(Sender: TObject);
begin
  treeTpReceb.Left    := 14;
  treeTpReceb.Height  := 200;
  treeTpReceb.Top     := 175;
  treeTpReceb.Visible := not treeTpReceb.Visible;
  if treeTpReceb.Visible  then
  begin
    treeTpReceb.bringtofront; //P.RAMOS-24.09.2004-PEND.17780
    treeTpReceb.SetFocus;
  end;
  sSpd := (Sender as TSpeedButton).Name;
end;

procedure TfrmIntegraCAPCAR.spdDevDesembClick(Sender: TObject);
begin
  treeTpPaga.Visible := not treeTpPaga.Visible;
  if treeTpPaga.Visible
  then treeTpPaga.SetFocus;
end;

procedure TfrmIntegraCAPCAR.DesabilitaTudo;
Begin
     TbsOutros.Visible        := False;
     TbsContab.Visible        := False;
     TbsDevol.Visible         := False;
     TbsPagar.Visible         := False;
     TbsReceber.Visible       := False;
     pgctrlIntegracao.Enabled := False;
     pgctrlIntegracao.Visible := False;
End;
                                   
procedure TfrmIntegraCAPCAR.edContaContabilPadraoExit(sConta:String; edConta:TMaskEdit;
                          lblConta,lblCCusto:TLabel ;cmbCCusto:TwwDBLookupCombo);

 // F.Dias
begin
  WITH DTMINTEGRACAPCAR DO BEGIN
    try
      lblConta.Caption  := '';
      lblCCusto.Caption := '';
      cmbCCusto.Text    := '';
      cmbCCusto.Enabled := false;
      if sConta <> '' // Posicionar a Query PlanoConta na conta certa
         then if qryContaContabil.Active
         then if qryContaContabil.LOCATE('PLACONTA',sConta,[loCaseInsensitive,loPartialKey]) then Begin
            if (qryContaContabil.FieldByName('PLATIPO').asString = 'A') then begin
                lblConta.Caption := qryContaContabil.FieldByName('PLANOME').AsString;
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.Sql.Add(' SELECT CODCENTROCUSTO,NOME FROM   CENTCUST '+
                                  ' WHERE  CODCENTROCUSTO IN '  +
                                  '   (SELECT CODCENTROCUSTO FROM   CONTASxCC '+
                                  '   WHERE  IDEMPRESA = '+ InttoStr(Sistema.idEmpresa) +
                                  '   AND    PLANO = ' + InttoStr(IntegraBack.Plano) +
                                  '   AND PLACONTA = '''+ sConta + ''')');
                qryAux.Open;
                qryAux.First;
                if (not qryAux.EOF) then
                   cmbCCusto.Enabled := True
                else begin
                   cmbCCusto.Enabled := False;
                   lblCCusto.Caption := '';
                end
            end
            else Begin
                MsgDlg('Conta contábil tem que ser analítica','Erro',mtError,[mbOK],0);
                edConta.Text := '';
                edConta.SetFocus;
            end
         end
         else Begin
            MsgDlg('Conta contábil não cadastrada','Erro',mtError,[mbOK],0);
            edConta.Text := '';
            edConta.SetFocus;
         end;
    except
      Raise;
    end;
  END;
end;

procedure TfrmIntegraCAPCAR.SetaParamTree(spdContaAtual,Top,Left,Height,Width : Integer);
Begin
  spdContabAtual            := spdContaAtual;
  treeContaContabil.Top     := Top;
  treeContaContabil.Left    := Left;
  treeContaContabil.Height  := Height;
  treeContaContabil.Width   := Width;
  treeContaContabil.Visible := not treeContaContabil.Visible;
  if treeContaContabil.Visible then
     treeContaContabil.SetFocus;
end;

procedure TfrmIntegraCAPCAR.Habilitacoes(bgrpAltJuros,btbsIRRF,bTbsOutros,btbsContab,
                            btbsPagar,btbsReceber,btbsAtualizacao,btbsProvisao,
                            btbsDevol,bgrpDevReceb,bgrpDesemb,btbsTipOper,btbsTipoDoc,btbsParamContab,
                            bgrpdescCAP,bgrpdescCAR : Boolean);
Begin
       tbsOutros.TabVisible      := btbsOutros;
       tbsContab.TabVisible      := btbsContab;
       tbsPagar.TabVisible       := btbsPagar;
       tbsReceber.TabVisible     := btbsReceber;
       tbsDevol.TabVisible       := btbsDevol;
       tbsTipoper.TabVisible     := btbsTipoper;
       tbsTipoDoc.TabVisible     := btbsTipoDoc;
       tbsParamContab.TabVisible := btbsParamContab;
       grpDevReceb.Enabled       := bgrpDevReceb;
       grpDevDesemb.Enabled      := bgrpDesemb;
       grpAltJuros.Visible       := bgrpAltJuros;
       grpDescontoCAR.Enabled    := bgrpdescCAR;
end;
procedure TfrmIntegraCAPCAR.Button1Click(Sender: TObject);
begin
  inherited;
  if trvGrupos.Visible = False Then Begin
     trvGrupos.Visible := True;
     trvGrupos.BringtoFront;
  end
  else Begin
     trvGrupos.Visible := False;
     trvGrupos.SendtoBack;
     if lstAuxTipo.Items[trvGrupos.Selected.AbsoluteIndex] = 'PP' Then Begin
       redPatro.Visible  := True;
       redPatro.BringtoFront;
     end
     else Begin
       redGeral.Visible := True;
       redGeral.BringToFront;
     end;
  end;
end;

procedure TfrmIntegraCAPCAR.CaptionsDirTopo(sTitulo,slblPlano,slblPatro,slblParticpante,
                                            slblOpcao: String; btnProc : Boolean);
Begin
   if sTitulo <> '-1' Then
      stxtTitulo.Caption      := sTitulo;
   if slblPlano <> '-1' Then
      lblPlano.Caption       := slblPlano;
   if slblPatro <> '-1' Then
      lblPatro.Caption       := slblPatro;
   if slblParticpante <> '-1' Then
      lblParticipante.Caption := slblParticpante;
   if slblOpcao <> '-1' Then
      lblOpcao.Caption       := slblOpcao;
   bbtnProcurar.Visible   := btnProc;
end;

procedure TfrmIntegraCAPCAR.PreencheCampos(iTipDoc, iUnidNegoc, iCodAlteradorJuros,
                            iCODALTERADORCORR,iCodPortForma,iCodAlteraCorrCAP :Integer ;
                            sTipRecDes,sTpPag,sTipRecebDevol,sTipDesemDevol,sTipDesembCAR,
                            sTipRecebCAP,sPlacontC,sPlacontD,sPlaContDAutPatr,sCodCentroCustoC,sCodCentroCustoD,
                            sCodCentroRespon,sPlaContaAtuaD,sPlaContaAtuaC,sPlaContaJurD,
                            sPlaContaJurC,sPlaContaProvisD, sPlaContaProvisC,sPlaContaDevol,
                            sPlaContaDevolPatro,sCodCentroCustoDevol,sCodCentroCustoDevolPatro,
                            sCodSubConta :String);
Var
  iSubConta : Integer;
Begin

   if (sTipRecDes <> '') and (qryTpReceb.Locate('CodTipRecDes',sTipRecDes,[loCaseInsensitive,loPartialKey])) then Begin
     edTpReceb.text         := qryTpReceb.fieldbyname('Descricao').AsString;
     edRecebTp              := qryTpReceb.fieldbyname('CodTipRecDes').AsString;
   end
   else Begin
     edTpReceb.text         := '';
     edRecebTp              := '';
   end;


   if (sTipDesembCAR <> '') and (qryTpPaga.Locate('CodTipRecDes',sTipDesembCAR,[loCaseInsensitive,loPartialKey])) then Begin
     edDesembCAR.text   := qryTpPaga.fieldbyname('Descricao').AsString;
     edDesembCARcod     := qryTpPaga.fieldbyname('CodTipRecDes').AsString;
   end
   else Begin
     edDesembCAR.text   := '';
     edDesembCARcod     := '';
   end;

   if (sTipDesemDevol <> '') and (qryTpPaga.Locate('CodTipRecDes',sTipDesemDevol,[loCaseInsensitive,loPartialKey])) then Begin
     edDesembolso.text   := qryTpPaga.fieldbyname('Descricao').AsString;
     edDesemb            := qryTpPaga.fieldbyname('CodTipRecDes').AsString;
   end
   else Begin
     edDesembolso.text   := '';
     edDesemb            := '';
   end;

   if (sTipRecebDevol <> '') and (qryTpReceb.Locate('CodTipRecDes',sTipRecebDevol,[loCaseInsensitive,loPartialKey])) then Begin
     edRecebimento.text  := qryTpReceb.fieldbyname('Descricao').AsString;
     edReceb            := qryTpReceb.fieldbyname('CodTipRecDes').AsString;
   end
   else Begin
     edRecebimento.text  := '';
     edReceb            := '';
   end;

   if (sTpPag <> '') and (qryTpPaga.Locate('CodTipRecDes',sTpPag,[loCaseInsensitive,loPartialKey])) then Begin
     edTpPaga.text       := qryTpPaga.fieldbyname('Descricao').AsString;
     edDesembTp          := qryTpPaga.fieldbyname('CodTipRecDes').AsString;
   end
   else Begin
     edTpPaga.text       := '';
     edDesembTp          := '';
   end;

   if (IntegraBack.ObrigaABC = 'S') and (iUnidNegoc <> -1) and (DTMINTEGRACAPCAR.qryAtividade.Locate('UNIDNEGOC', iUnidNegoc,[loCaseInsensitive,loPartialKey]))
   then lkcmbDescAtividade.Text := DTMINTEGRACAPCAR.qryAtividade.FieldbyName('Nome').AsString
   else lkcmbDescAtividade.Text := '';

   if (sPlaContC <> '') and (qryContaContabil.Locate('PlaConta',sPlaContC,[loCaseInsensitive,loPartialKey])) then begin
      edContaCredito1.Text     := qryContaContabil.FieldbyName('PlaConta').AsString;
      lbDescContaCredito1.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
   end
   else Begin
      edContaCredito1.Text     := '';
      lbDescContaCredito1.Caption := '';
   end;

   if (sPlaContD <> '') and (qryContaContabil.Locate('PlaConta',sPlaContD,[loCaseInsensitive,loPartialKey])) then begin
      edContaDebito1.Text     := qryContaContabil.FieldbyName('PlaConta').AsString;
      lbDescContaDebito1.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
   end
   else Begin
      edContaDebito1.Text     := '';
      lbDescContaDebito1.Caption := '';
   end;
           
   if (sPlaContDAutPatr <> '') and (qryContaContabil.Locate('PlaConta',sPlaContDAutPatr,[loCaseInsensitive,loPartialKey])) then begin
      edContaDebito2.Text     := qryContaContabil.FieldbyName('PlaConta').AsString;
      lbDescContaDebito2.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
   end
   else Begin
      edContaDebito2.Text     := '';
      lbDescContaDebito2.Caption := '';
   end;


   if (DTMINTEGRACAPCAR.qryCCusto1.Active) and (sCodCentroCustoC <> '') and (DTMINTEGRACAPCAR.qryCCusto1.Locate('CodCentroCusto',sCodCentroCustoC,[loCaseInsensitive,loPartialKey])) then begin
      cmbCCusto1.Text            := DTMINTEGRACAPCAR.qryCCusto1.FieldByName('CodCentroCusto').AsString;
      lbDescricaoCCusto1.Caption := DTMINTEGRACAPCAR.qryCCusto1.FieldByName('Nome').AsString;
   end
   else Begin
      cmbCCusto1.Text            := '';
      lbDescricaoCCusto1.Caption := '';
   end;

   if (DTMINTEGRACAPCAR.qryCCusto.Active) and (sCodCentroCustoD <> '') and (DTMINTEGRACAPCAR.qryCCusto.Locate('CodCentroCusto',sCodCentroCustoD,[loCaseInsensitive,loPartialKey])) then begin
      cmbCCusto.Text            := DTMINTEGRACAPCAR.qryCCusto.FieldByName('CodCentroCusto').AsString;
      lbDescricaoCCusto.Caption := DTMINTEGRACAPCAR.qryCCusto.FieldByName('Nome').AsString;
   end
   else Begin
      cmbCCusto.Text            := '';
      lbDescricaoCCusto.Caption := '';
   end;

   if (sCodCentroRespon <> '') and (DTMINTEGRACAPCAR.qryCentRespon.Locate('CodCentroRespon',sCodCentroRespon,[loCaseInsensitive,loPartialKey]))
   then cmbCentRespon.Text := DTMINTEGRACAPCAR.qryCentRespon.FieldbyName('Nome').AsString
   else cmbCentRespon.Text := '';

   if (iCodAlteradorJuros <> -1) and (DTMINTEGRACAPCAR.qryAlterador.Locate('CodAlterador',iCodAlteradorJuros,[loCaseInsensitive,loPartialKey]))
   then dblkpcmbAltJurosCAR.Text := DTMINTEGRACAPCAR.qryAlterador.FieldByName('Descricao').AsString
   else dblkpcmbAltJurosCAR.Text := '';

   if (iCodAlteradorCorr <> -1) and (DTMINTEGRACAPCAR.qryAlterador.Locate('CodAlterador',iCodAlteradorCorr,[loCaseInsensitive,loPartialKey]))
   then dblkpcmbAltCorrecaoCAR.Text := DTMINTEGRACAPCAR.qryAlterador.FieldByName('Descricao').AsString
   else dblkpcmbAltCorrecaoCAR.Text := '';

   if (iCodPortForma <> -1) and (DTMINTEGRACAPCAR.qryFormaPag.Locate('CodPortForma',iCodPortForma,[loCaseInsensitive,loPartialKey]))   then Begin
      dblkpcmbPortForma.Text        := DTMINTEGRACAPCAR.qryformapag.fieldbyname('Descricao').AsString;
      dblkpcmbPortForma.LookupValue := InttoStr(DTMINTEGRACAPCAR.qryformapag.fieldbyname('CodPortForma').AsInteger);
   end
   else Begin
      dblkpcmbPortForma.Text        := '';
      dblkpcmbPortForma.LookupValue := '';
   end;

   if (sPlaContaDevol <> '') and (qryContaContabil.Locate('PlaConta',sPlaContaDevol,[loCaseInsensitive,loPartialKey])) then begin
      edContaContabilDevol.Text     := qryContaContabil.FieldbyName('PlaConta').AsString;
      lbDescricaoContaDevol.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
   end
   else Begin
      edContaContabilDevol.Text     := '';
      lbDescricaoContaDevol.Caption := '';
   end;

   if (sPlaContaDevolPatro <> '') and (qryContaContabil.Locate('PlaConta',sPlaContaDevolPatro,[loCaseInsensitive,loPartialKey])) then begin
      edContaContabilDevolPatro.Text     := qryContaContabil.FieldbyName('PlaConta').AsString;
      lbDescricaoContaDevolPatro.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
   end
   else Begin
      edContaContabilDevolPatro.Text     := '';
      lbDescricaoContaDevolPatro.Caption := '';
   end;

   if (DTMINTEGRACAPCAR.qryCCusto1.Active) and (sCodCentroCustoDevol <> '') and (DTMINTEGRACAPCAR.qryCCusto1.Locate('CodCentroCusto',sCodCentroCustoDevol,[loCaseInsensitive,loPartialKey])) then begin
      dblkCCDevol.Text               := DTMINTEGRACAPCAR.qryCCusto1.FieldByName('CodCentroCusto').AsString;
      lbDescricaoCCustoDevol.Caption := DTMINTEGRACAPCAR.qryCCusto1.FieldByName('Nome').AsString;
   end
   else Begin
      dblkCCDevol.Text               := '';
      lbDescricaoCCustoDevol.Caption := '';
   end;

   if (DTMINTEGRACAPCAR.qryCCusto1.Active) and (sCodCentroCustoDevolPatro <> '') and (DTMINTEGRACAPCAR.qryCCusto1.Locate('CodCentroCusto',sCodCentroCustoDevolPatro,[loCaseInsensitive,loPartialKey])) then begin
      dblkCCDevolPatro.Text               := DTMINTEGRACAPCAR.qryCCusto1.FieldByName('CodCentroCusto').AsString;
      lbDescricaoCCustoDevolPatro.Caption := DTMINTEGRACAPCAR.qryCCusto1.FieldByName('Nome').AsString;
   end
   else Begin
      dblkCCDevolPatro.Text               := '';
      lbDescricaoCCustoDevolPatro.Caption := '';
   end;
   if sCodSubConta <> '' Then
      iSubConta := strtoint(sCodSubConta)
   else
      iSubConta := 0;

   if (DTMINTEGRACAPCAR.qrySubConta.Locate('CODSUBCONTA',iSubConta ,[loCaseInsensitive,loPartialKey])) then Begin
      dblkSubConta.Text := DTMINTEGRACAPCAR.qrySubconta.FieldbyName('NOMESUBCONTA').AsString;
      dblkSubConta.LookupValue := InttoStr(iSubConta);
   end
   else Begin
      dblkSubConta.Text := '';
      dblkSubConta.LookupValue := '';
   end;
end;

procedure TfrmIntegraCAPCAR.GravaGeral(sTipo : STRING; iIdItem :  integer);
var sSQL : string;
begin
{  PM - Geral}
   with dtmIntegraCAPCAR do begin
//++
      if sTipo = 'PM' then begin
          sSQL := '';
          if Trim(dblkTipoperenvio.text) <> ''
          then sSQL := sSQL +' TIPOPERENVIO ='''+ dblkTipoperenvio.LookupValue + ''''
          else sSQL := sSQL +' TIPOPERENVIO = NULL';

          if Trim(dblkTipopercobranca.text) <> ''
          then sSQL := sSQL +', TIPOPERCOBRANCA ='''+ dblkTipopercobranca.LookupValue + ''''
          else sSQL := sSQL +', TIPOPERCOBRANCA = NULL';

          if Trim(dblkTipoperdiverg.text) <> ''
          then sSQL := sSQL +', TIPOPERDIVERG ='''+ dblkTipoperdiverg.LookupValue + ''''
          else sSQL := sSQL +', TIPOPERDIVERG = NULL';

          if Trim(dblkTipDocCAPenvbanco.text) <> ''
          then sSQL := sSQL +', TPDOCPENVIOBANCO ='''+ dblkTipDocCAPenvbanco.LookupValue + ''''
          else sSQL := sSQL +', TPDOCPENVIOBANCO = NULL';

          if Trim(dblkTipDocCAPenvPatro.text) <> ''
          then sSQL := sSQL +', TPDOCPENVIOPATRO ='''+ dblkTipDocCAPenvPatro.LookupValue + ''''
          else sSQL := sSQL +', TPDOCPENVIOPATRO = NULL';

          if Trim(dblkTipDocCARRecbanco.text) <> ''
          then sSQL := sSQL +', TPDOCRRECBANCO ='''+ dblkTipDocCARRecbanco.LookupValue + ''''
          else sSQL := sSQL +', TPDOCRRECBANCO = NULL';

          if Trim(dblkTipDocCARRecpatro.text) <> ''
          then sSQL := sSQL +', TPDOCRRECPATRO ='''+ dblkTipDocCARRecpatro.LookupValue + ''''
          else sSQL := sSQL +', TPDOCRRECPATRO = NULL';

          if Trim(edContaAnulaReceita.text) <> ''
          then sSQL := sSQL + ', PLARECUPRECEXANT ='''+Trim(edContaAnulaReceita.text)+''''
          else sSQL := sSQL + ', PLARECUPRECEXANT = NULL';

          if Trim(edContaAnulaDespesa.text) <> ''
          then sSQL := sSQL + ', PLARECUPDESPEXANT ='''+Trim(edContaAnulaDespesa.text)+''''
          else sSQL := sSQL + ', PLARECUPDESPEXANT = NULL';

          if (Trim(edContaAnulaReceita.text) <> '') or (Trim(edContaAnulaDespesa.text) <> '')
          then sSQL := sSQL + ', PLANO = '+IntToStr(IntegraBack.Plano);
//++

          // Se nao tem SQL, -> sair
          if Trim(sSQL) = '' then begin
              MsgDlg('Não existem dados para atualizar.','Informação',mtInformation,[mbOK],0);
              Exit;
          end;

          // Gravar campos
          with qryAux do begin
             Close;                     
             SQL.Clear;
             try
                if NOT bexisteParamaAssist Then Begin
                   // não existe registro na PARAMASSIST
                   SQL.Add('INSERT INTO PARAMASSIST (TIPOPERENVIO) VALUES (NULL)');
                   ExecSQL;
                   Close;
                   SQL.Clear;
                end;
                SQL.Add('UPDATE PARAMASSIST SET '+sSQL );
                ExecSQL;
             except
                on E:EDBEngineError do
                   MostrarErro(E);
             end;//try
          end;//with
      end;//if sTipo = 'PM'
   end;//with dtmIntegraCAPCAR
end;//GravaGeral

procedure TfrmIntegraCAPCAR.PreencheParamAPrev;
Begin
   with qryAux do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT TIPOPERENVIO,TIPOPERCOBRANCA,TIPOPERDIVERG, ');
      SQL.Add(' TPDOCPENVIOBANCO,TPDOCPENVIOPATRO,TPDOCRRECBANCO,TPDOCRRECPATRO, ');
      SQL.Add(' PLARECUPRECEXANT, PLARECUPDESPEXANT FROM PARAMASSIST');
      try
         Open;
      except
         on E:EDBEngineError do
            MostrarErro(E);
      end;//try
   end;//with
   if qryAux.RecordCount > 0 Then
      bexisteParamaAssist := true
   else
      bexisteParamaAssist := false;
   if (dtmIntegraCAPCAR.qryTipoOper.Locate('TIPCODIGO',qryAux.FieldByName('TIPOPERENVIO').AsString,[loCaseInsensitive,loPartialKey])) Then Begin
      dblkTipoperenvio.LookupValue := qryAux.FieldByName('TIPOPERENVIO').AsString;
      dblkTipoperenvio.Text        := dtmIntegraCAPCAR.qryTipoOper.FieldByName('TIPDESCRICAO').AsString;
   end
   else Begin
      dblkTipoperenvio.LookupValue := '';
      dblkTipoperenvio.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoOper.Locate('TIPCODIGO',qryAux.FieldByName('TIPOPERCOBRANCA').AsString,[loCaseInsensitive,loPartialKey])) Then Begin
      dblkTipopercobranca.LookupValue := qryAux.FieldByName('TIPOPERCOBRANCA').AsString;
      dblkTipopercobranca.Text        := dtmIntegraCAPCAR.qryTipoOper.FieldByName('TIPDESCRICAO').AsString;
   end
   else Begin
      dblkTipopercobranca.LookupValue := '';
      dblkTipopercobranca.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoOper.Locate('TIPCODIGO',qryAux.FieldByName('TIPOPERDIVERG').AsString,[loCaseInsensitive,loPartialKey])) Then Begin
      dblkTipoperdiverg.LookupValue := qryAux.FieldByName('TIPOPERDIVERG').AsString;
      dblkTipoperdiverg.Text        := dtmIntegraCAPCAR.qryTipoOper.FieldByName('TIPDESCRICAO').AsString;
   end
   else Begin
      dblkTipoperdiverg.LookupValue := '';
      dblkTipoperdiverg.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoDocCAP.Locate('CodTipDoc',qryAux.FieldbyName('TPDOCPENVIOBANCO').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipDocCAPenvbanco.LookupValue := InttoStr(qryAux.FieldByName('TPDOCPENVIOBANCO').AsInteger);
      dblkTipDocCAPenvbanco.text        := dtmIntegraCAPCAR.qryTipoDocCAP.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipDocCAPenvbanco.LookupValue := '';
      dblkTipDocCAPenvbanco.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoDocCAP.Locate('CodTipDoc',qryAux.FieldbyName('TPDOCPENVIOPATRO').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipDocCAPenvPatro.LookupValue := InttoStr(qryAux.FieldByName('TPDOCPENVIOPATRO').AsInteger);
      dblkTipDocCAPenvPatro.text        := dtmIntegraCAPCAR.qryTipoDocCAP.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipDocCAPenvPatro.LookupValue := '';
      dblkTipDocCAPenvPatro.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoDocCAR.Locate('CodTipDoc',qryAux.FieldbyName('TPDOCRRECBANCO').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipDocCARRecbanco.LookupValue := InttoStr(qryAux.FieldByName('TPDOCRRECBANCO').AsInteger);
      dblkTipDocCARRecbanco.text        := dtmIntegraCAPCAR.qryTipoDocCAR.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipDocCARRecbanco.LookupValue := '';
      dblkTipDocCARRecbanco.Text        := '';
   end;

   if (dtmIntegraCAPCAR.qryTipoDocCAR.Locate('CodTipDoc',qryAux.FieldbyName('TPDOCRRECPATRO').AsInteger,[loCaseInsensitive,loPartialKey])) then Begin
      dblkTipDocCARRecpatro.LookupValue := InttoStr(qryAux.FieldByName('TPDOCRRECPATRO').AsInteger);
      dblkTipDocCARRecpatro.text        := dtmIntegraCAPCAR.qryTipoDocCAR.Fieldbyname('Descricao').AsString;
   end
   else Begin
      dblkTipDocCARRecpatro.LookupValue := '';
      dblkTipDocCARRecpatro.Text        := '';
   end;

   if (qryAux.FieldbyName('PLARECUPRECEXANT').AsString <> '') and (qryContaContabil.Locate('PlaConta',qryAux.FieldbyName('PLARECUPRECEXANT').AsString,[loCaseInsensitive,loPartialKey]))
   then begin
      edContaAnulaReceita.Text := qryAux.FieldbyName('PLARECUPRECEXANT').AsString;
      lblDescricaoContaAnulaReceita.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
   end
   else Begin
      edContaAnulaReceita.Text              := '';
      lblDescricaoContaAnulaReceita.Caption := '';
   end;

   if (qryAux.FieldbyName('PLARECUPDESPEXANT').AsString <> '') and (qryContaContabil.Locate('PlaConta',qryAux.FieldbyName('PLARECUPDESPEXANT').AsString,[loCaseInsensitive,loPartialKey]))
   then begin
      edContaAnulaDespesa.Text := qryAux.FieldbyName('PLARECUPDESPEXANT').AsString;
      lbDescricaoContaAnulaDespesa.Caption := qryContaContabil.FieldByName('PlaNome').AsString;
   end
   else Begin
      edContaAnulaDespesa.Text              := '';
      lbDescricaoContaAnulaDespesa.Caption := '';
   end;
   qryAux.close;

end;
procedure TfrmIntegraCAPCAR.spdContaDevolClick(Sender: TObject);
begin
  inherited;
  //P.RAMOS-24.09.2004-PEND.17780
//  SetaParamTree(9,39,12,241,445);
  SetaParamTree(9,70,12,167,445);
  //P.RAMOS-24.09.2004-PEND.17780-até aqui
end;

procedure TfrmIntegraCAPCAR.spdContaDevolpatroClick(Sender: TObject);
begin
  inherited;
  //P.RAMOS-24.09.2004-PEND.17780
//  SetaParamTree(10,138,12,241,445);
  SetaParamTree(10,168,12,167,445);
  //P.RAMOS-24.09.2004-PEND.17780-até aqui
end;

procedure TfrmIntegraCAPCAR.spdContaAnulaRecClick(Sender: TObject);
begin
  inherited;
  //P.RAMOS-24.09.2004-PEND.17780
//  SetaParamTree(11,187,28,241,445);
  SetaParamTree(11,176,28,167,445);
  //P.RAMOS-24.09.2004-PEND.17780-até aqui
end;

procedure TfrmIntegraCAPCAR.spdContaAnulaDespClick(Sender: TObject);
begin
  inherited;
  //P.RAMOS-24.09.2004-PEND.17780
//  SetaParamTree(12,148,28,241,445);
  SetaParamTree(12,128,28,167,445);
  //P.RAMOS-24.09.2004-PEND.17780-até aqui
end;

procedure TfrmIntegraCAPCAR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryAux.free;
end;

{
   Monta e executa uma query de pesquisa de conta contabil e
   retorna se achou ou não.
}
function TfrmIntegraCAPCAR.pesquisaContaContabil(planoconta: String): Boolean;
begin
     Result := false;

     qryCContabil.Close;
     qryCContabil.SQL.Clear;
     qryCContabil.SQL.Add('SELECT PLACONTA, PLANOME, PLATIPO, PLACCUST, PLASUBCONTA '+
                          'FROM   PLANOCONTA '+
                          'WHERE  (PLANO = '+IntToStr(IntegraBack.Plano)+') AND '+
                          '       (PLACONTA = '+Chr(39)+planoconta+Chr(39)+')');
     qryCContabil.Open;


     if not qryCContabil.IsEmpty then
        Result := true;
end;

function TfrmIntegraCAPCAR.validaContaContabil: Boolean;
var
   sPlacCust: String;
begin
     { Verifica qual a TabSheet visível. }
     if tbsContab.TabVisible then { <-- Contabilidade. }
     begin
          { Conta para Débito. }
          { Conta Participante Ativo }
          if Length(Trim(edContaDebito1.Text)) > 0 then
          begin
               { Verifica se achou a conta contábil. }
               if pesquisaContaContabil(edContaDebito1.Text) then
               begin
                    sPlacCust := qryCContabil.FieldByName('PLACCUST').AsString;
                    { Verifica se é necessário o centro de custo e se ele está preenchido. }
                    if ( sPlacCust = 'S') and
                       (Length(Trim(cmbCCusto.Text)) = 0) then
                    begin
                         MsgDlg('O campo Centro de Custo está em branco.', 'Erro', mtError, [mbOk], 0);
                         cmbCCusto.SetFocus;
                         Result := false;
                         Exit;
                    end;
               end;
          end;

          { Conta Participante Auto Patrocínio }
          if Length(Trim(edContaDebito2.Text)) > 0 then
          begin
               { Verifica se achou a conta contábil. }
               if pesquisaContaContabil(edContaDebito2.Text) then
               begin
                    sPlacCust := qryCContabil.FieldByName('PLACCUST').AsString;
                    { Verifica se é necessário o centro de custo e se ele está preenchido. }
                    if ( sPlacCust = 'S') and
                       (Length(Trim(cmbCCusto.Text)) = 0) then
                    begin
                         MsgDlg('O campo Centro de Custo está em branco.', 'Erro', mtError, [mbOk], 0);
                         cmbCCusto.SetFocus;
                         Result := false;
                         Exit;
                    end;
               end;
          end;

          { Conta para crédito. }
          if Length(Trim(edContaCredito1.Text)) > 0 then
          begin
               { Verifica se achou a conta contábil. }
               if pesquisaContaContabil(edContaCredito1.Text) then
               begin
                    sPlacCust := qryCContabil.FieldByName('PLACCUST').AsString;
                    { Verifica se é necessário o centro de custo e se ele está preenchido. }
                    if ( sPlacCust = 'S') and
                       (Length(Trim(cmbCCusto1.Text)) = 0) then
                    begin
                         MsgDlg('O campo Centro de Custo está em branco.', 'Erro', mtError, [mbOk], 0);
                         cmbCCusto1.SetFocus;
                         Result := false;
                         Exit;
                    end;
               end;
          end;
     end
     else if tbsDevol.TabVisible then { <-- Devolução. }
     begin
          { Conta a crédito p/ devolução via banco. }
          if Length(Trim(edContaContabilDevol.Text)) > 0 then
          begin
               { Verifica se achou a conta contábil. }
               if pesquisaContaContabil(edContaContabilDevol.Text) then
               begin
                    sPlacCust := qryCContabil.FieldByName('PLACCUST').AsString;
                    { Verifica se é necessário o centro de custo e se ele está preenchido. }
                    if ( sPlacCust = 'S') and
                       (Length(Trim(dblkCCDevol.Text)) = 0) then
                    begin
                         MsgDlg('O campo Centro de Custo está em branco.', 'Erro', mtError, [mbOk], 0);
                         dblkCCDevol.SetFocus;
                         Result := false;
                         Exit;
                    end;
               end;
          end;

          { Conta a crédito p/ devolução via interface com as patrocinadoras. }
          if Length(Trim(edContaContabilDevolPatro.Text)) > 0 then
          begin
               { Verifica se achou a conta contábil. }
               if pesquisaContaContabil(edContaContabilDevolPatro.Text) then
               begin
                    sPlacCust := qryCContabil.FieldByName('PLACCUST').AsString;
                    { Verifica se é necessário o centro de custo e se ele está preenchido. }
                    if ( sPlacCust = 'S') and
                       (Length(Trim(dblkCCDevolPatro.Text)) = 0) then
                    begin
                         MsgDlg('O campo Centro de Custo está em branco.', 'Erro', mtError, [mbOk], 0);
                         dblkCCDevolPatro.SetFocus;
                         Result := false;
                         Exit;
                    end;
               end;
          end;
     end
     else if tbsParamContab.TabVisible then { <-- Parâmetros Contábeis. }
     begin
          { Conta a débito para anulação de receita de exercício anterior. }
          if Length(Trim(edContaAnulaReceita.Text)) > 0 then
          begin
               { Verifica se achou a conta contábil. }
               if pesquisaContaContabil(edContaAnulaReceita.Text) then
               begin
                    sPlacCust := qryCContabil.FieldByName('PLACCUST').AsString;
                    { Verifica se é necessário o centro de custo e se ele está preenchido. }
                    if ( sPlacCust = 'S') and
                       (Length(Trim(cmbCustoAnulaReceita.Text)) = 0) then
                    begin
                         MsgDlg('O campo Centro de Custo está em branco.', 'Erro', mtError, [mbOk], 0);
                         cmbCustoAnulaReceita.SetFocus;
                         Result := false;
                         Exit;
                    end;
               end;
          end;

          { Conta a crédito para anulação de despesas. }
          if Length(Trim(edContaAnulaDespesa.Text)) > 0 then
          begin
               { Verifica se achou a conta contábil. }
               if pesquisaContaContabil(edContaAnulaDespesa.Text) then
               begin
                    sPlacCust := qryCContabil.FieldByName('PLACCUST').AsString;
                    { Verifica se é necessário o centro de custo e se ele está preenchido. }
                    if ( sPlacCust = 'S') and
                     (Length(Trim(cmbCustoAnulaDespesa.Text)) = 0) then
                    begin
                         MsgDlg('O campo Centro de Custo está em branco.', 'Erro', mtError, [mbOk], 0);
                         cmbCustoAnulaDespesa.SetFocus;
                         Result := false;
                         Exit;
                    end;
               end;
          end;
     end;

     Result := true;
end;


procedure TfrmIntegraCAPCAR.FormCreate(Sender: TObject);
begin
  inherited;
  //P.RAMOS-24.09.2004-PEND.17780
  //TreeContaContabil.Visible:=True;
  //TreeTpReceb.Visible:=True;
  //TreeTpPaga.Visible:=True;
  //P.RAMOS-24.09.2004-PEND.17780-ATÉ AQUI
//  LstAuxTipo.Visible:=True;
//  LstAuxId.Visible:=True;
  TreeContaContabil.Left:=800;
  TreeTpReceb.Left:=800;
  TreeTpPaga.Left:=800;
  LstAuxTipo.Left:=800;
  LstAuxId.Left:=800;
end;

procedure TfrmIntegraCAPCAR.spdContaDebito2Click(Sender: TObject);
begin
  inherited;
  SetaParamTree(2,228,18,195,445);
end;

procedure TfrmIntegraCAPCAR.edContaDebito2Exit(Sender: TObject);
begin
  inherited;
  edContaContabilPadraoExit(edContaDebito2.Text,edContaDebito2,
                          lbDescContaDebito2,lbDescricaoCCusto,cmbCCusto);
end;

procedure TfrmIntegraCAPCAR.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  //P.RAMOS-24.09.2004-PEND.17780
//  SetaParamTree(13,211,23,241,445);
  SetaParamTree(13,211,23,241,445);
  //P.RAMOS-24.09.2004-PEND.17780-até aqui
end;

procedure TfrmIntegraCAPCAR.dblkAtivProjCAPCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // FERNANDO - P.15233 - INICIO
  If LookupTable.fieldbyname('UNETIPO').asstring = 'S' then
  begin
     MsgDlg('Atividade/Projeto não pode ser sintético ','Erro',mtError,[mbOK],0);
     dblkAtivProjCAP.Value := '';
  end; 
  // FERNANDO - P.15233 - FIM
end;

// FERNANDO - P.15070 - INICIO
// Alterei os sql's das queries qryTPPaga e qryTPReceb
// FERNANDO - P.15070 - FIM

end.
