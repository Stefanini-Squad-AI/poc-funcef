// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Hugo Luna
// Data        : 08/11/2007
// Pendência   : 26637
// Rotina      : MontaFiltro
// Descricao   : Colocando filtro sitrecebimento = 1 para não pagas, e 3 para as
//               outras opções.
//------------------------------------------------------------------------------
// Autor(a)    : Hugo Luna
// Data        : 07/11/2007
// Pendência   : 26637
// Rotina      : TerminaTransacao
// Descricao   : - Colocando Commit no final de mensagem de Efetuado com Sucesso
//               - NVL(PARTASS.FLGINSCRICAOCANC,0) = 0 no MontaSelect
//------------------------------------------------------------------------------
unit FDivergContribAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  ComCtrls, Spin, wwdblook, Db, DBTables, Wwquery, MontaSelect, Grids,
  Wwdbigrd, Wwdbgrid, Wwdatsrc, Menus, TB97Ctls, TB97Tlwn, TREdit, DBCtrls,
  Mask, wwdbedit, URegra, Gauges, UConsPart, IvDictio, IvMulti, IvEMulti,
  ImgList;

const
   vetOperador: array[0..5] of string[2] = ('= ','> ','>=','< ','<=','<>');

type
  opMenu = (opCobraProx, opCobraImediato, opDevolveProx, OpDevolveImediato, opIgnora);

  TfrmDivergContribAss = class(TfrmOkCancelar)
    imModos: TImageList;
    pnlDireita: TPanel;
    pnlEsquerda: TPanel;
    trvModos: TTreeView;
    pnlDirTopo: TPanel;
    lblModo: TLabel;
    Label2: TLabel;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    pgctrlDivergencias: TPageControl;
    tbsFiltro: TTabSheet;
    tbsDivergencias: TTabSheet;
    pnlTabSheetFiltro: TPanel;
    pnlFiltroEsq: TPanel;
    pnlFiltro1: TPanel;
    pnlFiltro2: TPanel;
    pnlFiltro3: TPanel;
    pnlFiltro4: TPanel;
    pnlFiltro5: TPanel;
    chkPatro: TCheckBox;
    chkPlano: TCheckBox;
    chkContrib: TCheckBox;
    chkTempo: TCheckBox;
    chkParticipante: TCheckBox;
    Panel1: TPanel;
    chkValor: TCheckBox;
    pnlFiltroDir: TPanel;
    pnlFiltroDir1: TPanel;
    pnlFiltroDir2: TPanel;
    pnlFiltroDir3: TPanel;
    pnlFiltroDir4: TPanel;
    pnlFiltroDir5: TPanel;
    pnlFiltroDir6: TPanel;
    dblkpcmbPatro: TwwDBLookupCombo;
    edParticipante: TEdit;
    cmbFiltraTempo: TComboBox;
    cmbFiltraValor: TComboBox;
    dblkpcmbPlano: TwwDBLookupCombo;
    dblkpcmbContrib: TwwDBLookupCombo;
    spbtnProcParticip: TSpeedButton;
    pnlDivergencia: TPanel;
    edTempo: TEdit;
    edValor: TEdit;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    qryContrib: TwwQuery;
    MontaSelectPart: TMontaSelect;
    qryDivergSintet: TwwQuery;
    dbgrdDivergSintet: TwwDBGrid;
    dsDivergSintet: TwwDataSource;
    dbgrdDivergAnalit: TwwDBGrid;
    qryDivergAnalit: TwwQuery;
    dsDivergAnalit: TwwDataSource;
    pmnu: TPopupMenu;
    pnlFiltroBottom: TPanel;
    pmnuCobraProx: TMenuItem;
    pmnuCobraImed: TMenuItem;
    pmnuDevolveProx: TMenuItem;
    pmnuDevolveImed: TMenuItem;
    pmnuDevolveIgnora: TMenuItem;
    Splitter1: TSplitter;
    pnlResult: TPanel;
    SaveDlg: TSaveDialog;
    Dock97Top: TDock97;
    tb97Atalho: TToolbar97;
    sbtndiverganalit: TToolbarButton97;
    spbtnDivergSintet: TToolbarButton97;
    sbtnFluxOper: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    bbtnVerResultado: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    ToolbarSep975: TToolbarSep97;
    ToolbarSep976: TToolbarSep97;
    tb97Param: TToolWindow97;
    pnlTextoFluxOper: TPanel;
    Bevel1: TBevel;
    pnlparam: TPanel;
    grpbxvlraceite: TGroupBox;
    Label1: TLabel;
    SpeedButton20: TSpeedButton;
    qryparam: TwwQuery;
    dsparam: TwwDataSource;
    RealEdit1: TRealEdit;
    N1: TMenuItem;
    ParmetrosPadro1: TMenuItem;
    BitBtn1: TBitBtn;
    SpeedButton3: TSpeedButton;
    qryaux: TwwQuery;
    qrybusca: TwwQuery;
    RegCalculo: TRegra;
    qryexecuta: TwwQuery;
    qryatraso: TwwQuery;
    qryalterador: TwwQuery;
    pnlProgresso: TPanel;
    lblMsg2: TLabel;
    gagProgresso: TGauge;
    imVerifica: TImage;
    lblMsg1: TLabel;
    btncancelaprogress: TBitBtn;
    qryDivergSintetAux: TwwQuery;
    qryalteradorxcontrib: TwwQuery;
    dsalteradorxcontrib: TwwDataSource;
    ConsPart1: TConsPart;
    DadosdoParticipante1: TMenuItem;
    qryaltaux: TwwQuery;
    RichEdAdaptacao: TRichEdit;
    Panel2: TPanel;
    bbtnVoltar: TBitBtn;
    bbtnSalvar: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    memResult: TMemo;
    Splitter2: TSplitter;
    qrycontribaux: TwwQuery;
    Panel4: TPanel;
    ckplanass: TCheckBox;
    Panel5: TPanel;
    cmbplanass: TwwDBLookupCombo;
    qryplanass: TwwQuery;
    GroupBox2: TGroupBox;
    wwDBGrid2: TwwDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    qry2: TwwQuery;
    qryDivergAnalitVALORESPERADO: TFloatField;
    qryDivergAnalitVALORRECEBIDO: TFloatField;
    qryDivergAnalitNOMECONTRIB: TStringField;
    qryDivergAnalitNOMEPARTICIP: TStringField;
    qryDivergAnalitMATRICULA: TStringField;
    qryDivergAnalitIDCONTRIBUICAO: TFloatField;
    qryDivergAnalitIDPLANASS: TFloatField;
    qryDivergAnalitMES: TStringField;
    qryDivergAnalitMESCOBRANCA: TStringField;
    qryDivergAnalitIDPESSJUR: TFloatField;
    qryDivergAnalitIDPESSOA: TFloatField;
    qryDivergAnalitIDPLANASS_1: TFloatField;
    qryDivergAnalitCODDOCUMENTOPREV: TFloatField;
    qryDivergAnalitIDSITPART: TFloatField;
    qryDivergAnalitFLGSITPART: TStringField;
    qryDivergAnalitPLANPREV: TStringField;
    qryDivergAnalitPESSJUR: TStringField;
    qryDivergAnalitIDMOTIVO: TFloatField;
    qryDivergAnalitSITPLANOASS: TStringField;
    qryDivergAnalitPLANASS: TStringField;
    qryDivergAnalitFLGSITPLANOASS: TStringField;
    qryDivergAnalitSEQPROPOSTA: TFloatField;
    qryDivergAnalitDATA: TDateTimeField;
    qryDivergAnalitIDRUBRICAATRASO: TFloatField;
    qryDivergAnalitIDRUBRICADEVOLUC: TFloatField;
    qryDivergAnalitIDREGRACALCULO: TFloatField;
    qryDivergAnalitCODDOCUMENTOPREV_1: TFloatField;
    qryDivergAnalitPLNCODIGOPREV: TFloatField;
    qryDivergAnalitIDTITULAR: TFloatField;
    qryDivergAnalitIDDEPENDENTE: TFloatField;
    qryDivergAnalitIDCONTASS: TFloatField;
    qryDivergAnalitFLGCOBCARNE: TFloatField;
    qryDivergAnalitIDPLANOPREV: TFloatField;
    qryDivergAnalitNOMEDEP: TStringField;
    N3: TMenuItem;
    Marcardesmarcardiverdncia1: TMenuItem;
    Titulo1: TMenuItem;
    mnuprinc: TMainMenu;
    GerarContribuies1: TMenuItem;
    ParmetrosPadro2: TMenuItem;
    DadosdoParticipante2: TMenuItem;
    N2: TMenuItem;
    CobrarDiferenanoProximoMs1: TMenuItem;
    CobrarDiferenaImediatamente1: TMenuItem;
    DevolverDiferenanoPrximoMs1: TMenuItem;
    DevolverDiferenaImediatamente1: TMenuItem;
    IgnorarDiferena1: TMenuItem;
    chkCobNaoDiverg: TCheckBox;
    procedure trvModosCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure trvModosExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure trvModosChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure dblkpcmbPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbContribCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edTempoExit(Sender: TObject);
    procedure edValorExit(Sender: TObject);
    procedure spbtnProcParticipClick(Sender: TObject);
    procedure dblkpcmbPatroExit(Sender: TObject);
    procedure dblkpcmbPlanoExit(Sender: TObject);
    procedure dblkpcmbContribExit(Sender: TObject);
    procedure chkPatroClick(Sender: TObject);
    procedure chkPlanoClick(Sender: TObject);
    procedure chkContribClick(Sender: TObject);
    procedure chkTempoClick(Sender: TObject);
    procedure chkValorClick(Sender: TObject);
    procedure chkParticipanteClick(Sender: TObject);
    procedure spbtnDivergAnalitClick(Sender: TObject);
    procedure spbtnDivergSintetClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure ParmetrosPadro1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure sbtnFluxOperClick(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure qryparamBeforeOpen(DataSet: TDataSet);
    procedure qryparamAfterOpen(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgrdDivergSintetMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgrdDivergAnalitMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cmbMesRefChange(Sender: TObject);
    procedure spedAnoRefChange(Sender: TObject);
    procedure dblkpcmbPatroChange(Sender: TObject);
    procedure dblkpcmbPlanoChange(Sender: TObject);
    procedure dblkpcmbContribChange(Sender: TObject);
    procedure cmbFiltraTempoChange(Sender: TObject);
    procedure cmbFiltraValorChange(Sender: TObject);
    procedure pmnuCobraProxClick(Sender: TObject);
    procedure btncancelaprogressClick(Sender: TObject);
    procedure pmnuCobraImedClick(Sender: TObject);
    procedure pmnuDevolveProxClick(Sender: TObject);
    procedure pmnuDevolveImedClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure pmnuDevolveIgnoraClick(Sender: TObject);
    procedure DadosdoParticipante1Click(Sender: TObject);
    procedure ConsPart1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cmbplanassCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmbplanassChange(Sender: TObject);
    procedure cmbplanassExit(Sender: TObject);
    procedure tb97ParamVisibleChanged(Sender: TObject);
    procedure Marcardesmarcardiverdncia1Click(Sender: TObject);
    procedure pmnuPopup(Sender: TObject);
  private
    { Private declarations }
    { Modos de Tratamento :
         0: TODAS as Contribuicoes Divergentes
         1: Contribuicoes Nao Pagas
         2: Contribuicoes pagas a menor
         3: contribuicoes pagas a maior
         4: contribuicoes pagas em atraso
         5: TODOS os Inadimplentes
         6: Inadimplentes Registrados
         7: Inadimplentes Cancelados  }
    function  TrataFiltro: boolean;
    procedure MontaFiltro(var sSQL: string);
    function  ItemSelecionado: integer;
    procedure ExibeDivergSintet;
    procedure ExibeDivergAnalit;
    function  EnviaProxMes(var qryleitura: Twwquery; bindividual: Boolean;
              sMesNovaCobranca, sDataRef, sCodPortForma, referencia: String;
              flgtipodesc,flgdescfolha,crecpag: char): Boolean;
    function  PreparaQryJurosAtraso(idpatro,idplano, idplanass: integer; sMesRef,
              sMesCob, sMesNovaCob, sDataNovaCob: string; idParticipante, idDependente,
              idcontribuicao: integer): Boolean;
    {function  InsereDivergTmpdesc(qrydados: Twwquery; sidpessoa, siddependente,
              sidpessjur, sidplanoprev, sidplanass, mesref, smescobranca, idlote,
              ordem, sValor, flgatrasodevol, codalterador, dataref, desc, referencia
             : String; crecpag: char; sflgdescfolha, sflgtipodesc: String): Boolean;}
    function  TestaValorRegraCalculo(var Regra: TRegra): Boolean;
    {procedure RetornaDatas(sidpessjur, sidplanoprev,sidplanass,sidsitfundacao: String;
              var sDataRef, sMesCob: String; flgtipodesc: char; sMesCobContr: String);}
    procedure BaixaPendencias(var qry: twwquery);
    procedure PreparaTransacao(sTransacao: String);
    {Procedure AtualizaControleInterface(idlote, sMesRef, sValor, idpessjur, Contador,
              desc: String);}
    procedure TerminaTransacao(sTransacao: String; berro: Boolean);
    function  AtualizaSitRecebimento(qryleitura: twwquery): boolean;
    function  CalcGravaAlteradores(qryaux, qryleitura: twwquery; sidplanoprev,
              sidplanass, sidcontribuicao, sMesNovaCobranca, sdataref, referencia
             : String; flgatrasodevol, flgtipodesc, flgdescfolha: char; var dValor
             : Extended; var idlote, ordem: Integer; crecpag: char): Boolean;
    procedure PreparaQrySintetica;
    function  InsereHistorico(var qryleitura: twwquery; sMesCob, sCodportforma,
              sDataRef, sIdRegra: String; dValorAlter, dValorEsperado, dValorRecebido
             : Extended; cRecPag: char;  sIdContrib: String): Boolean;
    function  InsereHistoricoAtraso(var qryleitura: twwquery; sMesCob, sCodAlterador,
              sValor: String; sTipo: char): Boolean;
    procedure MostraTelaDataFormaPg(sCob: String);
    procedure AtualizaVlHistorico(var qryleitura: twwquery);
    function  Ignora(qryleitura: twwquery; bindividual: boolean):  Boolean;
    function  TrataIgnora(var qryleitura: twwquery): Boolean;
    //function  GravaSituacao(qryleitura: twwquery; sidsitplanoprevdiverg: String): Boolean;
    function  TestaOpcoes(sidsitplanoprev,snome,smatricula,splano,spatro: String;
              iModo: opMenu; dValorEsperado,dValorRecebido: Extended): boolean;
    {function  TestaPodeCCP(qrybusca: twwquery; snome,smatricula,splano,spatro: String;
              iModo: opMenu): boolean;}
  public
    { Public declarations }
  end;

var
  frmDivergContribAss: TfrmDivergContribAss;
  sIdMotivoDiverg,strSituacaoDiverg,StrPatroDiverg: String;

  iModo: opMenu;
  bCancelaEnvio, ExisteMensagem: Boolean;
  dValorParcial: extended;

implementation

uses UAdmAss, FAguarde, UMensErro, FTelaAut, UDataBase, DBaseDados, FVlrDtDiverg,
     ULancContab, USincronismo, USistema, UContribuicaoPrev;

{$R *.DFM}

function  TfrmDivergContribAss.ItemSelecionado: integer;
var i: integer;
begin
   Result := -1;
   for i := 0 to trvModos.Items.Count - 1 do
      if trvModos.Items.Item[i].Selected then
      begin
         Result := i;
         Break;
      end;
end;

function  TfrmDivergContribAss.TrataFiltro;
begin
   Result := False;
   if (chkPatro.Checked) and (Trim(dblkpcmbPatro.Text) = '') then
   begin
      MsgDlg('A Patrocinadora deve ser informada para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      dblkpcmbPatro.SetFocus;
      Exit;
   end;

   if (chkPlano.Checked) and (Trim(dblkpcmbPlano.Text) = '' ) then
   begin
      MsgDlg('O Plano Previdenciário deve ser informado para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      dblkpcmbPlano.SetFocus;
      Exit;
   end;

   if (ckPlanass.Checked) and (Trim(cmbPlanass.Text) = '' ) then
   begin
      MsgDlg('O Plano Assistencial deve ser informado para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      cmbplanass.SetFocus;
      Exit;
   end;

   if (chkContrib.Checked) and (Trim(dblkpcmbContrib.Text) = '') then
   begin
      MsgDlg('O Tipo de Cobrança deve ser informada para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      dblkpcmbContrib.SetFocus;
      Exit;
   end;

   if (chkTempo.Checked) and (Trim(cmbFiltraTempo.Text) = '') then
   begin
      MsgDlg('A Faixa de Tempo de Divergência deve ser informada para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      cmbFiltraTempo.SetFocus;
      Exit;
   end;

   if (chkTempo.Checked) and (Trim(edTempo.Text) = '') then
   begin
      MsgDlg('O Tempo de Divergência deve ser informado para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      edTempo.SetFocus;
      Exit;
   end;

   if (chkValor.Checked) and (Trim(cmbFiltraValor.Text) = '') then
   begin
      MsgDlg('A Faixa de Valor de Divergência deve ser informada para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      cmbFiltraValor.SetFocus;
      Exit;
   end;

   if (chkValor.Checked) and (Trim(edValor.Text) = '') then
   begin
      MsgDlg('O Valor de Divergência deve ser informado para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      edTempo.SetFocus;
      Exit;
   end;

   if (chkParticipante.Checked) and (Trim(edParticipante.Text) = '') then
   begin
      MsgDlg('O Participante deve ser informado para o filtro desejado. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlDivergencias.ActivePage := tbsFiltro;
      edTempo.SetFocus;
      Exit;
   end;

   Result := True;
end;

procedure TfrmDivergContribAss.MontaFiltro(var sSQL: string);
var sAno,
    sMesReferencia,
    sAnoMesReferencia,
    sOperador: string;
begin
    // Preencher variaveis de Mes de Referencia
    // O mes de cobranca será calculado de acordo com o plano
    sAno := Trim(spedAnoRef.Text);
    if cmbMesRef.ItemIndex <= 8 then
      sMesReferencia := '0'+IntToStr(cmbMesRef.ItemIndex+1)
    else
      sMesReferencia := IntToStr(cmbMesRef.ItemIndex+1);
    sAnoMesReferencia := sAno+'/'+sMesReferencia;

    sSQL := sSQL+    ' (H.MES = '''+sAnoMesReferencia+''')';

    //CPrev - 26637 - Inicio
    if chkCobNaoDiverg.Checked then
      begin
        sSQL := sSQL+ ' AND ((H.SITRECEBIMENTO = 1) OR (H.SITRECEBIMENTO = 3))';
      end
    else
      sSQL := sSQL+ ' AND (H.SITRECEBIMENTO = 3)';
    //CPrev - 26637 - Fim

      sSQL := sSQL+ ' AND (CT.PAGADOR = ''C'')'; //somente contrib. do participante

    if chkParticipante.Checked then
      sSQL := sSQL+' AND (H.IDTITULAR = '+MontaSelectPart.ValoresChave[0]+')';

    if chkPatro.Checked then
      sSQL := sSQL + ' AND (H.IDPESSJUR = '+qryPatro.FieldByName('IdPessoa').AsString+')';

    if chkPlano.Checked then
      sSQL := sSQL + ' AND (H.IDPLANOPREV = '+qryPlano.FieldByName('IdPlanoPrev').AsString+')';

    if chkContrib.Checked then
      sSQL := sSQL + ' AND (H.IDCONTASS = '+qryContrib.FieldbyName('IdContribuicao').AsString+')';

    if ckplanass.Checked then
      sSQL := sSQL + ' AND (H.IDPLANASS = '+qryPlanass.FieldbyName('IdPlanass').AsString+')';

    if chkTempo.Checked then
    begin
      sOperador := vetOperador[cmbFiltraTempo.ItemIndex];
      sSQL := sSQL + ' AND (TRUNC(MONTHS_BETWEEN(SYSDATE,H.DATA),0)'+sOperador+Trim(edTempo.Text)+')';
    end;

    if chkValor.Checked then
    begin
      sOperador := vetOperador[cmbFiltraValor.ItemIndex];
      sSQL := sSQL + ' AND ((H.VALORRECEBIDO - H.VALORESPERADO)'+sOperador+OraNumero(trim(edValor.Text))+')';
    end;

    case ItemSelecionado() of
         0: begin // TODAS as Contribuicoes Divergentes
                sSQL := sSQL+' AND (H.VALORESPERADO <> H.VALORRECEBIDO)';
             end;
         1: begin // Contribuicoes Nao Pagas
                sSQL := sSQL+' AND (H.VALORESPERADO <> H.VALORRECEBIDO)'+
                             ' AND ((H.VALORRECEBIDO <= 0)'+
                                ' OR ( (H.VALORRECEBIDO IS NULL)))';
//                                 ' AND (CI.TIPO = ''A'')'+
//                                 ' AND (CI.FLGVOLTATMP = 1)))';
             end;
         2: begin // Contribuicoes pagas a menor
                sSQL := sSQL+' AND (H.VALORRECEBIDO < H.VALORESPERADO)'+
                             ' AND (H.VALORRECEBIDO > 0) ';
             end;
         3: begin // contribuicoes pagas a maior
                sSQL := sSQL+' AND (H.VALORRECEBIDO > H.VALORESPERADO) ';
             end;
         4: begin // contribuicoes pagas em atraso
                sSQL := sSQL+' AND (H.VALORESPERADO = H.VALORRECEBIDO)'+
                             ' AND (H.DATAPREVISAO < H.DATA ) ';
             end;
         5: begin // TODOS os Inadimplentes
                sSQL := sSQL+' AND (H.VALORESPERADO <> H.VALORRECEBIDO)'+
                             ' AND (SP.FLGINTERNO IN (''IN'', ''CI''))';
             end;
    end;
end;

procedure TfrmDivergContribAss.ExibeDivergSintet;
var sSQL: string;
    iModoSelecionado: integer;
begin
    if not TrataFiltro() then
         //===========
      Exit;

    iModoSelecionado := ItemSelecionado();
                      //===============
    if iModoSelecionado = -1 then
    begin
      MsgDlg('Selecione um Modo de Divergência na Lista de Modos. ','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
    end;

    frmAguarde.Mostra('Atualizando Divergências ... ');

    sSQL := 'SELECT SUM(H.VALORESPERADO) VALORESPERADO,'+
                   'SUM(H.VALORRECEBIDO) VALORRECEBIDO,'+
                   'C.NOME NOMECONTRIB, C.IDCONTRIBUICAO, PL.IDPLANOPREV, PL.NOME PLANPREV,'+
                   'PLA.IDPLANASS, PLA.NOME PLANASS, H.IDCONTASS,'+
                   'PESSJUR.NOME PESSJUR, PESSJUR.IDPESSOA IDPESSJUR, H.NUMRECEBIMENTO '+
             ' FROM CONTRIBUICAO C, PLANPREV PL, PLANASS PLA, SITPLANOASS SP,'+
                  ' CONTRIBASS CT, PARTASS PP, PESSOA PESSJUR, HSTCONTRIBASS H '+ {, CTRLINTERFACE CI'+}
            ' WHERE ';
    MontaFiltro(sSQL);

    sSQL := sSQL + // ' AND (H.IDLOTE = CI.IDLOTE)'+
                   ' AND (H.IDTITULAR   = PP.IDPESSOA)'+
                   ' AND (H.SEQPROPOSTA = PP.SEQPROPOSTA)'+
                   ' AND (H.IDPESSJUR   = PP.IDPESSJUR)'+
                   ' AND (H.IDPLANOPREV = PP.IDPLANOPREV)'+
                   ' AND (H.IDPLANASS   = PP.IDPLANASS)'+
                   ' AND (PP.IDSITPART = SP.IDSITPLANOASS)'+
                   ' AND (H.IDPESSJUR = PESSJUR.IDPESSOA)'+
                   ' AND (H.IDPLANASS = PLA.IDPLANASS)'+
                   ' AND (H.IDPLANOPREV = PL.IDPLANOPREV)'+
                   ' AND (H.IDCONTASS = CT.IDCONTASS)'+
                   ' AND (H.IDPLANASS = CT.IDPLANASS)'+
                   ' AND (H.IDCONTASS = C.IDCONTRIBUICAO)'+
              ' GROUP BY C.NOME, C.IDCONTRIBUICAO, PL.IDPLANOPREV, PL.NOME,'+
                        'PLA.IDPLANASS, PLA.NOME,'+
                        'PESSJUR.NOME, PESSJUR.IDPESSOA, H.IDCONTASS, H.NUMRECEBIMENTO';
    qryDivergSintet.Close;
    qryDivergSintet.SQL.Clear;
    qryDivergSintet.SQl.Add(sSQL);
    try
       qryDivergSintet.Open;
    except
       raise;
    end;

    if not tbsDivergencias.TabVisible then
       tbsDivergencias.TabVisible := True;
    dbgrdDivergSintet.Visible := True;
    dbgrdDivergAnalit.Visible := False;
    pgctrlDivergencias.ActivePage := tbsDivergencias;

    if qryDivergSintet.isempty then
       dbgrdDivergSintet.PopupMenu := nil
    else
       dbgrdDivergSintet.PopupMenu := pmnu;

    frmAguarde.Apaga;
end;

procedure TfrmDivergContribAss.ExibeDivergAnalit;
var sSQL: string;
begin
    if not TrataFiltro() then
         //===========
      Exit;

    if ItemSelecionado() = -1 then
    begin
      MsgDlg('Selecione um Modo de Divergência na Lista de Modos. ','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
    end;

    frmAguarde.Mostra('Atualizando Divergências ... ');

    sSQL := 'SELECT H.VALORESPERADO,'+
                   'H.VALORRECEBIDO,'+
                   'C.NOME AS NOMECONTRIB, P.NOME AS NOMEPARTICIP, EL.MATRICULA,'+
                   'PD.NOME AS NOMEDEP,'+
                   'C.IDCONTRIBUICAO, CT.IDPLANASS,H.MES, H.MESCOBRANCA, PP.IDPESSJUR,'+
                   'PP.IDPESSOA, PP.IDPLANASS, H.CODDOCPREV CODDOCUMENTOPREV, PPV.IDSITPART,'+
                   'SIT.FLGINTERNO FLGSITPART,PL.NOME PLANPREV, PESSJUR.NOME PESSJUR,'+
                   'H.IDMOTIVO, SP.DESCRICAO SITPLANOASS, PLA.NOME PLANASS,'+
                   'SP.FLGINTERNO FLGSITPLANOASS, PP.SEQPROPOSTA, H.DATA,'+
                   'CT.IDPROVENTOATRASO IDRUBRICAATRASO, CT.IDPROVENTODEVOL IDRUBRICADEVOLUC, '+
                   'H.IDREGRA IDREGRACALCULO, H.CODDOCPREV CODDOCUMENTOPREV, H.PLNCODPREV PLNCODIGOPREV, '+
                   'H.IDTITULAR, H.IDDEPENDENTE, H.IDCONTASS, H.FLGCOBCARNE, H.IDPLANOPREV, H.NUMRECEBIMENTO '+
             ' FROM SITPART SIT, SITPLANOASS SP,PLANPREV PL, PLANASS PLA,CONTRIBUICAO C,'+
                   'CONTRIBASS CT, PARTASS PP, PARTPREVPLAN PPV, ELEGPATRO EL,'+
                   'PESSOA P, PESSOA PESSJUR, HSTCONTRIBASS H, PESSOA PD WHERE ';{, CTRLINTERFACE CI'}
    MontaFiltro(sSQL);
    sSQL := sSQL + //' AND (H.IDLOTE = CI.IDLOTE)'+
                   ' AND (H.IDTITULAR   = PP.IDPESSOA)'+
                   ' AND (H.SEQPROPOSTA = PP.SEQPROPOSTA)'+
                   ' AND (H.IDPESSJUR   = PP.IDPESSJUR)'+
                   ' AND (H.IDPLANOPREV = PP.IDPLANOPREV)'+
                   ' AND (H.IDPLANASS   = PP.IDPLANASS)'+
                   ' AND (PP.IDSITPART = SP.IDSITPLANOASS)'+
                   ' AND (H.IDTITULAR   = PPV.IDPESSOA)'+
                   ' AND (H.SEQPROPOSTA = PPV.SEQPROPOSTA)'+
                   ' AND (H.IDPESSJUR   = PPV.IDPESSJUR)'+
                   ' AND (H.IDPLANOPREV = PPV.IDPLANOPREV)'+
                   ' AND (PPV.IDSITPART = SIT.IDSITPART)'+
                   ' AND (H.IDTITULAR = EL.IDPESSOA)'+
                   ' AND (H.IDPESSJUR = EL.IDPESSJUR)'+
                   ' AND (H.IDPLANASS = PLA.IDPLANASS)'+
                   ' AND (H.IDPESSJUR = PESSJUR.IDPESSOA)'+
                   ' AND (H.IDPLANOPREV = PL.IDPLANOPREV)'+
                   ' AND (H.IDTITULAR = P.IDPESSOA)'+
                   ' AND (H.IDDEPENDENTE = PD.IDPESSOA)'+
                   ' AND (H.IDCONTASS = C.IDCONTRIBUICAO)'+
                   ' AND (H.IDCONTASS = CT.IDCONTASS)'+
                   ' AND (H.IDPLANASS = CT.IDPLANASS)'+
              ' ORDER BY P.NOME, C.NOME';
    qryDivergAnalit.Close;
    qryDivergAnalit.SQL.Clear;
    qryDivergAnalit.SQl.Add(sSQL);
    try
       qryDivergAnalit.Open;
    except
    end;

    if not tbsDivergencias.TabVisible then
      tbsDivergencias.TabVisible := True;
    dbgrdDivergSintet.Visible := false;
    dbgrdDivergAnalit.Visible := true;
    pgctrlDivergencias.ActivePage := tbsDivergencias;

    if qryDivergAnalit.isempty then
      dbgrdDivergAnalit.PopupMenu := nil
    else
      dbgrdDivergAnalit.PopupMenu := pmnu;

    frmAguarde.Apaga;
end;

procedure TfrmDivergContribAss.trvModosCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  inherited;
  Node.ImageIndex := 1;
  Node.SelectedIndex := 1;
end;

procedure TfrmDivergContribAss.trvModosExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  Node.ImageIndex := 2;
  Node.SelectedIndex := 2;
end;

procedure TfrmDivergContribAss.trvModosChange(Sender: TObject;
  Node: TTreeNode);
var iModoSelecionado: integer;
begin
  inherited;
  lblModo.Caption  := Node.Text;
  iModoSelecionado := ItemSelecionado();
                    //===============
  { Modos de Tratamento :
         0: TODAS as Contribuicoes Divergentes
         1: Contribuicoes Nao Pagas
         2: Contribuicoes pagas a menor
         3: contribuicoes pagas a maior
         4: contribuicoes pagas em atraso
         5: TODOS os Inadimplentes   }

  N1.visible := not (iModoSelecionado in  [0,5]);
  pmnuCobraProx.Visible     := (iModoSelecionado in [1,2,4]);
  pmnuCobraImed.Visible     := (iModoSelecionado in [1,2,4]);
  pmnuDevolveProx.Visible   := (iModoSelecionado in [3]);
  pmnuDevolveImed.Visible   := (iModoSelecionado in [3]);
  pmnuDevolveIgnora.Visible := (iModoSelecionado in [1,2,3,4]);

  if tb97Param.Visible then
    tb97Param.Visible := false;

  if (dbgrdDivergAnalit.Visible) and (qryDivergAnalit.active) then
  begin
     spbtnDivergAnalitClick(self);
  end
  else
    if (dbgrdDivergSintet.Visible) and (qryDivergSintet.active) then
    begin
       spbtnDivergSintetClick(self);
    end;

  ParmetrosPadro2.enabled := ((not qryDivergSintet.isempty) or (not qryDivergAnalit.isempty));
  DadosdoParticipante2.enabled := ((not qryDivergAnalit.isempty) and (dbgrdDivergAnalit.visible));
  CobrarDiferenanoProximoMs1.enabled := (iModoSelecionado in [1,2,4]) and  ((not qryDivergSintet.isempty) or (not qryDivergAnalit.isempty));
  CobrarDiferenaImediatamente1.enabled := (iModoSelecionado in [1,2,4]) and ((not qryDivergSintet.isempty) or (not qryDivergAnalit.isempty));
  DevolverDiferenanoPrximoMs1.enabled := (iModoSelecionado in [3]) and  ((not qryDivergSintet.isempty) or (not qryDivergAnalit.isempty));
  DevolverDiferenaImediatamente1.enabled := (iModoSelecionado in [3]) and ((not qryDivergSintet.isempty) or (not qryDivergAnalit.isempty));
  IgnorarDiferena1.enabled := (iModoSelecionado in [1,2,3,4]) and ((not qryDivergSintet.isempty) or (not qryDivergAnalit.isempty));;

  if   iModoSelecionado  in [1,2,3,4] then
  begin
     Node.ImageIndex := 0;
     Node.SelectedIndex := 0;
  end;

  if   iModoSelecionado  in [6,7] then
  begin
     Node.ImageIndex := 4;
     Node.SelectedIndex := 4;
  end;
end;

procedure TfrmDivergContribAss.FormCreate(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;
  // Preencher Mes e Ano de Referencia com o Mes e Ano Corrente
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12) then
  begin
     cmbMesRef.ItemIndex := AMonth - 1;
     cmbMesRef.Text := cmbMesRef.Items[cmbMesRef.ItemIndex];
  end;
  spedAnoRef.Text := IntToStr(AYear);
  // Exibir os Itens Principais da Arvore expandidos
  trvModos.Items[0].Expanded := True; // Contribuicoes Divergentes

  lblModo.Caption := trvModos.Items[0].Text;

  // Preparar form
  //WindowState := wsMaximized;
  bbtnConfirmar.Visible := False;
  bbtnCancelar.Visible  := False;
  pgctrlDivergencias.ActivePage := tbsFiltro;
  tbsDivergencias.TabVisible    := False;
  //tbParam.tabvisible := false;

  // Abrir querys
  qryPatro.Close; qryPatro.Open;
  qryPlano.Close; qryPlano.Open;
  qryplanass.close; qryplanass.open;
  qryContrib.Close; qryContrib.Open;

end;

procedure TfrmDivergContribAss.dblkpcmbPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if Trim(dblkpcmbPatro.Text) <> '' then
    chkPatro.checked := True;
end;

procedure TfrmDivergContribAss.dblkpcmbPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if Trim(dblkpcmbPlano.Text) <> '' then
     chkPlano.Checked := True;
end;

procedure TfrmDivergContribAss.dblkpcmbContribCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if Trim(dblkpcmbContrib.Text) <> '' then
     chkContrib.Checked := True;
end;

procedure TfrmDivergContribAss.edTempoExit(Sender: TObject);
begin
  inherited;
  if Trim(edTempo.Text) <> '' then
     chkTempo.Checked := true;
end;

procedure TfrmDivergContribAss.edValorExit(Sender: TObject);
begin
  inherited;
  if Trim(edValor.Text) <> '' then
     chkValor.Checked := true;
end;

procedure TfrmDivergContribAss.spbtnProcParticipClick(Sender: TObject);
var sAux: string;
begin
  inherited;

//  sAux := MontaSelectPart.Colunas[0];
//  MontaSelectPart.Colunas[0] := ' distinct ' + sAux;
  MontaSelectPart.Executar;

  if (MontaSelectPart.RetornouValor) then
  begin
     edParticipante.Text  := MontaSelectPart.ValoresChave[1];
  end
  else
  begin
     edParticipante.Text := '';
  end;
  if Trim(edParticipante.Text) <> '' then
     chkParticipante.checked := True;

  if tb97Param.Visible then
     tb97Param.Visible := false;
  MontaSelectPart.Colunas[0] :=  sAux;
end;

procedure TfrmDivergContribAss.dblkpcmbPatroExit(Sender: TObject);
begin
  inherited;
  if Trim(dblkpcmbPatro.Text) <> '' then
     chkPatro.checked := True;
end;

procedure TfrmDivergContribAss.dblkpcmbPlanoExit(Sender: TObject);
begin
  inherited;
  if Trim(dblkpcmbPlano.Text) <> '' then
     chkPlano.checked := True;
end;

procedure TfrmDivergContribAss.dblkpcmbContribExit(Sender: TObject);
begin
  inherited;
  if Trim(dblkpcmbContrib.Text) <> '' then
     chkContrib.checked := True;
end;

procedure TfrmDivergContribAss.chkPatroClick(Sender: TObject);
begin
  inherited;
  if not chkPatro.checked then
     dblkpcmbPatro.Text := '';
end;

procedure TfrmDivergContribAss.chkPlanoClick(Sender: TObject);
begin
  inherited;
  if not chkPlano.checked then
     dblkpcmbPlano.Text := '';
end;

procedure TfrmDivergContribAss.chkContribClick(Sender: TObject);
begin
  inherited;
  if not chkContrib.checked then
     dblkpcmbContrib.Text := '';
end;

procedure TfrmDivergContribAss.chkTempoClick(Sender: TObject);
begin
  inherited;
  if not chkTempo.checked then
     edTempo.Text := '';
end;

procedure TfrmDivergContribAss.chkValorClick(Sender: TObject);
begin
  inherited;
  if not chkValor.checked then
     edValor.Text := '';
end;

procedure TfrmDivergContribAss.chkParticipanteClick(Sender: TObject);
begin
  inherited;
  if not chkParticipante.checked then
     edParticipante.Text := '';
end;

procedure TfrmDivergContribAss.spbtnDivergSintetClick(Sender: TObject);
begin
  inherited;
  ExibeDivergSintet;
//=================
  if tb97Param.Visible then
    tb97Param.Visible := false;
end;

procedure TfrmDivergContribAss.spbtnDivergAnalitClick(Sender: TObject);
begin
  inherited;
  ExibeDivergAnalit;
//=================
  if tb97Param.Visible then
    tb97Param.Visible := false;
end;

function TfrmDivergContribAss.InsereHistoricoAtraso(var qryleitura: twwquery;
         sMesCob, sCodAlterador, sValor: String; sTipo: char): Boolean;
var sSql: String;
begin
   //se for a receber -> atraso
   //se for a pagar -> devolução
   if uppercase(sTipo) = 'R' then
      sTipo := 'A'
   else
      sTipo := 'D';


   sSql := 'INSERT INTO HSTATRASOCONTASS(MES,MESCOBRANCA,'+
                      ' IDTITULAR,IDDEPENDENTE,IDCONTASS,IDPESSJUR,'+
                      ' IDPLANOPREV, IDPLANASS, SEQPROPOSTA, '+
                      ' IDMOTIVO,CODALTERADOR,VLRALTERADOR,FLGTIPO,FLGRETROATIVO) '+
           'VALUES('''+qryleitura.fieldbyname('MES').AsString+''','''+
                      qryleitura.fieldbyname('MESCOBRANCA').AsString+''','''+
                       qryleitura.fieldbyname('IDTITULAR').AsString+''','''+
                       qryleitura.fieldbyname('IDDEPENDENTE').AsString+''','''+
                       qryleitura.fieldbyname('IDCONTASS').AsString+''','''+
                       qryleitura.fieldbyname('IDPESSJUR').AsString+''','''+
                       qryleitura.fieldbyname('IDPLANOPREV').AsString+''','''+
                       qryleitura.fieldbyname('IDPLANASS').AsString+''','''+
                       qryleitura.fieldbyname('SEQPROPOSTA').AsString+''','''+
                       qryleitura.fieldbyname('IDMOTIVO').AsString+''','''+
                       sCodAlterador+''','+oranumero(sValor)+','''+sTipo+''',0 )';
   qryaux.Close;
   qryaux.SQL.Clear;
   qryaux.SQL.Add(sSQL);
   try
     qryaux.Execsql;
   except
     raise;
     Exit;
   end;
   result := true;
end;

function TfrmDivergContribAss.InsereHistorico(var qryleitura: twwquery; sMesCob,
         sCodportforma, sDataRef, sIdRegra: String; dValorAlter, dValorEsperado,
         dValorRecebido: Extended; cRecPag: char; sIdContrib: String): Boolean;
var sSql, sValor{, sNumRec}, sTipo: String;
    cAux: char;
begin
   result := false;

   pnlProgresso.Update;
   Application.ProcessMessages;
   frmDivergContribAss.update;
   if bCancelaenvio then
   begin
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('');
      ExisteMensagem := True;
      exit;
   end;

   if uppercase(crecpag) = 'R' then
   begin
      sTipo := 'A';
      cAux := DecimalSeparator;
      DecimalSeparator := '.';
      sValor := floattostr(dValorAlter+(dValorEsperado-dValorRecebido) );
      DecimalSeparator := cAux;
   end
   else if uppercase(crecpag) = 'D' then // pagamento a maior Tavares 09/05/2003
   begin
      sTipo := 'D';
      cAux := DecimalSeparator;
      DecimalSeparator := '.';
      sValor := floattostr(dValorAlter+(dValorRecebido-dValorEsperado));
      DecimalSeparator := cAux;
   end
   else
   begin
      sTipo := 'A';
      cAux := DecimalSeparator;
      DecimalSeparator := '.';
      sValor := floattostr(dValorAlter+(dValorRecebido-dValorEsperado) );
      DecimalSeparator := cAux;
   end;

   sSql := 'INSERT INTO HSTCONTRIBASS(NUMRECEBIMENTO, MES, MESCOBRANCA, IDMOTIVO, IDTIPO, '+
                       'IDREGRA, CODPORTFORMA, DATAPREVISAO, VALORESPERADO,'+
                       'IDTITULAR, IDDEPENDENTE, IDPESSJUR, IDPLANOPREV,'+
                       'IDPLANASS, IDCONTASS, SITRECEBIMENTO, FLGCOBCARNE) '+
           'VALUES( SEQHSTCONTRIBASS.NEXTVAL, '+
                   ' '''+qryleitura.fieldbyname('MES').AsString+''','+
                   ' '''+sMesCob+''','+
                   ' '''+sIdMotivoDiverg+''', '+
                   ' '''+sTipo+''', '+
                   ' '''+sIdRegra+''',';
   if Trim(scodportforma) <> '' then
      sSQL := sSQL + scodportforma+','
   else
      sSQL := sSQL + ' NULL,';
   if Trim(sDataRef) <> '' then
      sSQL := sSQL + ' TO_DATE('''+sDataRef+''',''dd/mm/yyyy''),'
   else
      sSQL := sSQL + ' NULL,';

   sSQL := sSQL +OraNumero(sValor)+',';

   sSQL := sSQL +qryleitura.fieldbyname('IDTITULAR').AsString+', ';
   sSQL := sSQL +qryleitura.fieldbyname('IDDEPENDENTE').AsString+', ';
   sSQL := sSQL +qryleitura.fieldbyname('IDPESSJUR').AsString+', ';
   sSQL := sSQL +qryleitura.fieldbyname('IDPLANOPREV').AsString+', ';
   sSQL := sSQL +qryleitura.fieldbyname('IDPLANASS').AsString+', ';
   sSQL := sSQL +qryleitura.fieldbyname('IDCONTASS').AsString+', ';

   sSQL := sSQL+ ' ''0'', ';

   if Trim(scodportforma) <> '' then
      sSQL := sSQL + '1)'
   else
      sSQL := sSQL + '0)';

   qryaux.Close;
   qryaux.SQL.Clear;
   qryaux.SQL.Add(sSQL);
   try
     qryaux.Execsql;
   except
     // tavares --- colocar uma msg de erro e um roollback
     Exit;
   end;
   result := true;
end;

procedure TfrmDivergContribAss.BaixaPendencias(var qry: twwquery);
var sSql: String;
   // cAux: char;
begin
   pnlProgresso.Update;
   Application.ProcessMessages;
   frmDivergContribAss.update;
   if bCancelaenvio then
   begin
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('');
      ExisteMensagem := True;
      exit;
   end;
   //baixa eventuais pendências (SITRECEBIMENTO = 4)
   sSql := 'UPDATE HSTCONTRIBASS'+
             ' SET VALORRECEBIDO = VALORESPERADO,'+
                 ' SITRECEBIMENTO = ''2'','+
                 ' CODREFERENCIA = SUBSTR(CODREFERENCIA || ''OK.DIV:'' || TO_CHAR(VALORRECEBIDO),1,20)'+
           ' WHERE (SITRECEBIMENTO  = 4)'+
             ' AND (IDTITULAR  = '''+qry.fieldbyname('IDTITULAR').AsString+''')'+
             ' AND (IDDEPENDENTE = '''+qry.fieldbyname('IDDEPENDENTE').AsString+''')'+
             ' AND (SEQPROPOSTA = '''+qry.fieldbyname('SEQPROPOSTA').AsString+''')'+
             ' AND (IDPESSJUR = '''+qry.fieldbyname('IDPESSJUR').AsString+''')'+
             ' AND (IDPLANOPREV = '''+qry.fieldbyname('IDPLANOPREV').AsString+''')'+
             ' AND (IDPLANASS = '''+qry.fieldbyname('IDPLANASS').AsString+''')'+
             ' AND (IDCONTASS = '''+qry.fieldbyname('IDCONTASS').AsString+''')'+
             ' AND (MES = '''+qry.fieldbyname('MES').AsString+''')';
   qryaux.Close;
   qryaux.SQL.Clear;
   qryaux.SQL.Add(sSQL);
   try
     qryaux.Execsql;
   except
     Exit;
   end;
end;

procedure TfrmDivergContribAss.AtualizaVlHistorico(var qryleitura: twwquery);
var sSql: String;
   // cAux: char;
begin
   pnlProgresso.Update;
   Application.ProcessMessages;
   frmDivergContribAss.update;
   if bCancelaenvio then
   begin
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('');
      ExisteMensagem := True;
      exit;
   end;

   sSql := 'UPDATE HSTCONTRIBASS'+
             ' SET VALORRECEBIDO = VALORESPERADO,'+
                 ' SITRECEBIMENTO = ''2'','+
                 ' CODREFERENCIA = SUBSTR(CODREFERENCIA || ''OK.DIV:'' || TO_CHAR(VALORRECEBIDO),1,20)'+
           ' WHERE (IDTITULAR  = '''+qryleitura.fieldbyname('IDTITULAR').AsString+''')'+
             ' AND (IDDEPENDENTE = '''+qryleitura.fieldbyname('IDDEPENDENTE').AsString+''')'+
             ' AND (SEQPROPOSTA = '''+qryleitura.fieldbyname('SEQPROPOSTA').AsString+''')'+
             ' AND (IDPESSJUR = '''+qryleitura.fieldbyname('IDPESSJUR').AsString+''')'+
             ' AND (IDPLANOPREV = '''+qryleitura.fieldbyname('IDPLANOPREV').AsString+''')'+
             ' AND (IDPLANASS = '''+qryleitura.fieldbyname('IDPLANASS').AsString+''')'+
             ' AND (IDCONTASS = '''+qryleitura.fieldbyname('IDCONTASS').AsString+''')'+
             ' AND (MES = '''+qryleitura.fieldbyname('MES').AsString+''')'+
             ' AND (IDMOTIVO = '''+qryleitura.fieldbyname('IDMOTIVO').AsString+''')'+
             ' AND (MESCOBRANCA = '''+qryleitura.fieldbyname('MESCOBRANCA').AsString+''')';

   qryaux.Close;
   qryaux.SQL.Clear;
   qryaux.SQL.Add(sSQL);
   try
     qryaux.Execsql;
   except
     Exit;
   end;
end;

//-----------Atualiza situação no histórico de contribuições previdenciárias -----//
function  TfrmDivergContribAss.AtualizaSitRecebimento(qryleitura: twwquery): boolean;
var sSQL: string;
begin
   Result := False;
   sSQL := 'UPDATE HSTCONTRIBASS'+
             ' SET SITRECEBIMENTO = ''4'''+
           ' WHERE (IDTITULAR  = '''+qryleitura.fieldbyname('IDTITULAR').AsString+''')'+
             ' AND (IDDEPENDENTE = '''+qryleitura.fieldbyname('IDDEPENDENTE').AsString+''')'+
             ' AND (SEQPROPOSTA = '''+qryleitura.fieldbyname('SEQPROPOSTA').AsString+''')'+
             ' AND (IDPESSJUR = '''+qryleitura.fieldbyname('IDPESSJUR').AsString+''')'+
             ' AND (IDPLANOPREV = '''+qryleitura.fieldbyname('IDPLANOPREV').AsString+''')'+
             ' AND (IDPLANASS = '''+qryleitura.fieldbyname('IDPLANASS').AsString+''')'+
             ' AND (IDCONTASS = '''+qryleitura.fieldbyname('IDCONTASS').AsString+''')'+
             ' AND (MES = '''+qryleitura.fieldbyname('MES').AsString+''')'+
             ' AND (IDMOTIVO = '''+qryleitura.fieldbyname('IDMOTIVO').AsString+''')'+
             ' AND (MESCOBRANCA = '''+qryleitura.fieldbyname('MESCOBRANCA').AsString+''')';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   try
     qryAux.ExecSQL;
   except
      memResult.Lines.Add(''+qryleitura.fieldbyname('NOMEPARTICIP').AsString+' - '+
                          ''+qryleitura.fieldbyname('NOMECONTRIB').AsString+' - '+
                          ''+qryleitura.fieldbyname('MES').AsString+' - Erro na atualização da situação no histórico.');
      memResult.Lines.Add('');
      ExisteMensagem := True;
      Exit;
   end;
   Result := True;
end;

//*** Calcula valores dos alteradores da contribuição
function TfrmDivergContribAss.CalcGravaAlteradores (qryaux, qryleitura: twwquery;
         sidplanoprev, sidplanass, sidcontribuicao, sMesNovaCobranca, sdataref,
         referencia: String; flgatrasodevol, flgtipodesc, flgdescfolha: char;
         var dValor: Extended; var idlote, ordem: Integer; crecpag: char): Boolean;
var berro: boolean;
    cAux: char;
    sDesc: String;
begin
   berro := false;
   result := false;
   dValorParcial := 0;

   pnlProgresso.Update;
   //gagProgresso.Progress := 0;
   lblMsg2.Caption := 'Calculando Alteradores...';

   qryaltaux.close;
   qryaltaux.sql.clear;
   qryaltaux.sql.add
     ('SELECT A.CODALTERADOR, IDREGRACALCULO,'+
            ' T.DESCRICAO NOMEALTERADOR '+
       ' FROM ALTERXCONTRIBASS A, TIPOALTERADOR T'+
      ' WHERE (T.CODALTERADOR = A.CODALTERADOR)'+
        ' AND (A.IDPLANASS = '''+sidplanass+''')'+
        ' AND (A.IDCONTRIBUICAO = '''+sidcontribuicao+''')'+
        ' AND (A.FLGCOBRA = 1)');
   if uppercase(flgatrasodevol) = 'A' then
     qryaltaux.sql.add(' AND (FLGATRASO = 1)')
   else
     qryaltaux.sql.add(' AND (FLGDEVOL = 1)');
   qryaltaux.Open;

   if qryaltaux.isempty then
   begin
      if gagProgresso.Progress = gagProgresso.MaxValue then
        gagProgresso.Progress := gagProgresso.MaxValue
      else
        gagProgresso.Progress :=  gagProgresso.Progress + 1;
      exit;
   end;

   qryaltaux.first;

   pnlProgresso.Update;
   Application.ProcessMessages;
   frmDivergContribAss.update;
   if bCancelaenvio then
   begin
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('');
      ExisteMensagem := true;
      exit;
   end;

   //query passada para a regra de negócio
   if not PreparaQryJurosAtraso(qryleitura.FieldByName('idpessjur').AsInteger,
        //=====================
                                qryleitura.fieldbyname('idplanoprev').AsInteger,
                                qryleitura.fieldbyname('idplanass').AsInteger,
                                qryleitura.fieldbyname('mes').AsString,
                                qryleitura.fieldbyname('mescobranca').AsString,
                                sMesNovaCobranca,
                                sDataRef,
                                qryleitura.fieldbyname('idtitular').AsInteger,
                                qryleitura.fieldbyname('iddependente').AsInteger,
                                qryleitura.FieldbyName('IdContass').AsInteger) then
   begin
      memResult.Lines.Add
        (''+qryleitura.fieldbyname('NOMEPARTICIP').AsString+' - '+
         ''+qryleitura.fieldbyname('NOMECONTRIB').AsString+' - '+
         ''+qryleitura.fieldbyname('mes').AsString+
         ' - Erro na preparação da Regra de cálculo do Atraso.');
      memResult.Lines.Add('');
      ExisteMensagem := true;
      berro := true;
      qryaltaux.next;
      if gagProgresso.Progress = gagProgresso.MaxValue then
        gagProgresso.Progress := gagProgresso.MaxValue
      else
        gagProgresso.Progress :=  gagProgresso.Progress + 1;
      exit;
   end;

   while not qryaltaux.eof do
   begin
      pnlProgresso.Update;
      Application.ProcessMessages;
      frmDivergContribAss.update;
      if bCancelaenvio then
      begin
         memResult.Lines.Add('Processo interrompido pelo usuário.');
         memResult.Lines.Add('');
         ExisteMensagem := true;
         exit;
      end;

      if qryaltaux.Fieldbyname('IDREGRACALCULO').AsString <> '' then
      begin
         regCalculo.queryin := qryAtraso;
         regCalculo.RuleName := qryaltaux.Fieldbyname('IDREGRACALCULO').AsString;
         try
            regCalculo.Execute;
         except
            memResult.Lines.Add
              (''+qryleitura.fieldbyname('NOMEPARTICIP').AsString+' - '+
               ''+qryleitura.fieldbyname('NOMECONTRIB').AsString+' - '+
               ''+qryleitura.fieldbyname('mes').AsString+
               ' - Erro na execução da Regra de cálculo do Atraso.');
            memResult.Lines.Add('');
            ExisteMensagem := true;
            berro := true;
            qryaltaux.next;
            if gagProgresso.Progress = gagProgresso.MaxValue then
              gagProgresso.Progress := gagProgresso.MaxValue
            else
              gagProgresso.Progress :=  gagProgresso.Progress + 1;
            continue;
         end;
      end
      else
      begin
         memResult.Lines.Add
           (''+qryleitura.fieldbyname('NOMEPARTICIP').AsString+' - '+
            ''+qryleitura.fieldbyname('NOMECONTRIB').AsString+' - '+
            ''+qryleitura.fieldbyname('mes').AsString+
            ' - Regra de cálculo do Atraso não cadastrada.');
         memResult.Lines.Add('');
         ExisteMensagem := true;
         berro := true;
         qryaltaux.next;
         if gagProgresso.Progress = gagProgresso.MaxValue then
           gagProgresso.Progress := gagProgresso.MaxValue
         else
           gagProgresso.Progress :=  gagProgresso.Progress + 1;
         continue;
      end;

      if not TestaValorRegraCalculo(regcalculo) then
           //======================
      begin //erro no valor da regra
         memResult.Lines.Add(''+qryleitura.fieldbyname('NOMEPARTICIP').AsString+' - '+
                             ''+qryleitura.fieldbyname('NOMECONTRIB').AsString+' - '+
                             ''+qryleitura.fieldbyname('mes').AsString+' - Erro no Resultado ->['+regcalculo.result+'] da Regra de cálculo do Atraso.');
         memResult.Lines.Add('');
         ExisteMensagem := true;
         berro := true;
         qryaltaux.next;
         if gagProgresso.Progress = gagProgresso.MaxValue then
           gagProgresso.Progress := gagProgresso.MaxValue
         else
           gagProgresso.Progress :=  gagProgresso.Progress + 1;
         continue;
      end;

      //se a referência não foi passada quer dizer que é um envio para a
      //folha de benefícios e, no caso, é mandado o nome do alterador
      if trim(referencia) = '' then
        referencia := qryaltaux.fieldbyname('NOMEALTERADOR').AsString;

      pnlProgresso.Update;
      Application.ProcessMessages;
      frmDivergContribAss.update;
      if bCancelaenvio then
      begin
         memResult.Lines.Add('Processo interrompido pelo usuário.');
         memResult.Lines.Add('');
         ExisteMensagem := true;
         exit;
      end;

      if uppercase(cRecPag) = 'R' then
        sDesc := 'Alterador de Atraso'
      else
        sDesc := 'Alterador de Devolução';

      //Totaliza valores dos alteradores
      cAux := DecimalSeparator;
      DecimalSeparator := '.';
      dValor := dValor + strtofloat(oranumero(trim(regcalculo.result)));
      dValorParcial := dValorParcial + strtofloat(oranumero(trim(regcalculo.result)));
      DecimalSeparator := cAux;

      pnlProgresso.Update;
      Application.ProcessMessages;
      frmDivergContribAss.update;
      if bCancelaenvio then
      begin
         memResult.Lines.Add('Processo interrompido pelo usuário.');
         memResult.Lines.Add('');
         ExisteMensagem := true;
         exit;
      end;

      //Insere no histórico de atrasos e devoluções
      if not InsereHistoricoAtraso(qryleitura, sMesNovaCobranca,
           //=====================
                                   qryaltaux.fieldbyname('codalterador').AsString,
                                   oranumero(trim(regcalculo.result)),
                                   crecpag) then
      begin
{***         memResult.Lines.Add
           (''+qryleitura.fieldbyname('NOMEPARTICIP').AsString+' - '+
            ''+qryleitura.fieldbyname('NOMECONTRIB').AsString+' - '+
            ''+qryleitura.fieldbyname('mes').AsString+
            ' - Erro na gravação do Histórico de Atrasos/Devoluções.');
}
         memResult.Lines.Add('');
         ExisteMensagem := true;
         berro := true;
         qryaltaux.next;
         if gagProgresso.Progress = gagProgresso.MaxValue then
           gagProgresso.Progress := gagProgresso.MaxValue
         else
           gagProgresso.Progress :=  gagProgresso.Progress + 1;
         continue;
      end;

      if gagProgresso.Progress = gagProgresso.MaxValue then
        gagProgresso.Progress := gagProgresso.MaxValue
      else
        gagProgresso.Progress :=  gagProgresso.Progress + 1;
      inc(ordem);
      qryaltaux.next;
   end;

   if not berro then
     result := true;
end;

function FormaAnoMesTela(pCmbMes: TComboBox; pSpAno: TSpinEdit): string;
var sAno, sMes, sAnoMes: string;
begin
    result := '';
    sAno := Trim(pSpAno.Text);
    if pCmbMes.ItemIndex <= 8 then
      sMes := '0'+IntToStr(pCmbMes.ItemIndex+1)
    else
      sMes := IntToStr(pCmbMes.ItemIndex+1);
    sAnoMes := sAno+'/'+sMes;
    result := sAnoMes;
end;

function TfrmDivergContribAss.EnviaProxMes (var qryleitura: TwwQuery;
         bindividual: boolean; sMesNovaCobranca, sDataRef, sCodPortForma,
         referencia: string; flgtipodesc, flgdescfolha, crecpag: char): boolean;
var berro, bErroAlterador: boolean;
    i, idlote, ordem: integer;
    dValor: extended;
    cAux, sFlgAtrasoDevol: char;
    sAnoMesCobrancaTela: string;

   //---------------------------------
   procedure Calcula_Envia (var qry: Twwquery);
   begin
      //DEFINIR DATA DE VENCIMENTO: sDataRef
      if Trim(sDataRef) = '' then
      begin
        sAnoMesCobrancaTela := FormaAnoMesTela(cmbMesRef, spedAnoRef);

        sMesNovaCobranca := ProximoAnoMes(StrToInt(Copy(sAnoMesCobrancaTela,6,2)),
                                          StrToInt(Copy(sAnoMesCobrancaTela,1,4)));

        if flgDescFolha = 'B' then
          sMesNovaCobranca := ProximoMesAberto(sMesNovaCobranca,
                                               qry.FieldByName('IdPessJur').AsInteger,
                                               cteIdModuloFolhaBen,
                                               'E')
        else
        begin
          if qry.FieldByName('IdPessJur').AsInteger = iIdFundacao then
            sMesNovaCobranca := ProximoMesAberto(sMesNovaCobranca,
                                                 qry.FieldByName('IdPessJur').AsInteger,
                                                 cteIdModuloFolhaCM,
                                                 'E')
          else
            sMesNovaCobranca := ProximoMesAberto(sMesNovaCobranca,
                                                 qry.FieldByName('IdPessJur').AsInteger,
                                                 cteIdModuloCCP,
                                                 'E');
        end;

        if qry.fieldbyname('flgsitpart').AsString = 'AS' then
          sDataRef := CriticaDataCobrancaSit(qry2,
                                             IntToStr(iIdFundacao),
                                             qry.fieldbyname('idplanoprev').AsString,
                                             'AS',
                                             'N',
                                             Copy(sMesNovaCobranca,6,2),
                                             Copy(sMesNovaCobranca,1,4))
        else
          sDataRef := CriticaDataCobrancaSit(qry2,
                                             qry.fieldbyname('idpessjur').AsString,
                                             qry.fieldbyname('idplanoprev').AsString,
                                             qry.fieldbyname('flgsitpart').AsString,
                                             'N',
                                             Copy(sMesNovaCobranca,6,2),
                                             Copy(sMesNovaCobranca,1,4));
      end;

      //CÁLCULO E GRAVAÇÃO DOS ALTERADORES
      bErroAlterador := false;

      if uppercase(cRecPag) = 'R' then
        sFlgAtrasoDevol := 'A'
      else
        sFlgAtrasoDevol := 'D';

      if not CalcGravaAlteradores(qryaux, qry,
           //====================
                                  qry.fieldbyname('idplanoprev').AsString,
                                  qry.fieldbyname('idplanass').AsString,
                                  qry.fieldbyname('idcontass').AsString,
                                  sMesNovaCobranca, sdataref, referencia,
                                  sFlgAtrasoDevol, flgtipodesc, flgdescfolha, dValor,
                                  idlote, ordem, crecpag) then
      begin
// tavares 02/05/2003 comentei as 2 linhas abaixo
//         berro := true;
//         bErroAlterador := true;
      end;

   end;
   //--------------------------------------------------------
   procedure TrataDivergenciaAnalitica;
   begin
            if TestaOpcoes(qryleitura.fieldbyname('FLGSITPART').AsString,
             //===========
                           qryleitura.fieldbyname('NOMEPARTICIP').AsString,
                           qryleitura.fieldbyname('MATRICULA').AsString,
                           qryleitura.fieldbyname('PLANPREV').AsString,
                           qryleitura.fieldbyname('PESSJUR').AsString,
                           imodo,
                           qryleitura.fieldbyname('VALORESPERADO').AsFloat,
                           qryleitura.fieldbyname('VALORRECEBIDO').AsFloat) then
            begin
               Calcula_Envia (qryleitura); //<<<<<<<<<<<<<<< CALCULO PRINCIPAL
             //=============
               if not bErroAlterador then//se houve um erro no cálculo do alterador, não continuar
               begin
                  cAux := DecimalSeparator;
                  DecimalSeparator := '.';
                  if not InsereHistorico(qryleitura, sMesNovaCobranca, sCodPortForma,//++
                       //===============
                                         sdataref, '', dValorParcial,
                                         qryleitura.fieldbyname('valoresperado').AsFloat,
                                         qryleitura.fieldbyname('valorrecebido').AsFloat,
                                         crecpag,'') then
                  begin
{                     memResult.Lines.Add
                       (''+qryleitura.fieldbyname('NOMEPARTICIP').AsString+' - '+
                        ''+qryleitura.fieldbyname('NOMECONTRIB').AsString+' - '+
                        ''+qryleitura.fieldbyname('mes').AsString+
                        ' - Erro na gravação do histórico de Cobranças.');}
                     memResult.Lines.Add('');
                     ExisteMensagem := true;
                     berro := true;
                  end;

                  if not AtualizaSitRecebimento(qryleitura) then
                       //======================
                    berro := true;

                  DecimalSeparator := cAux;
               end
               else
               begin
                  memResult.Lines.Add
                    (''+qryleitura.fieldbyname('NOMEPARTICIP').AsString+' - '+
                     ''+qryleitura.fieldbyname('NOMECONTRIB').AsString+' - '+
                     ''+qryleitura.fieldbyname('mes').AsString+
                     ' - Erro no cálculo dos alteradores, Valor igual a zero (Verifique cadastro).');
                  memResult.Lines.Add('');
                  ExisteMensagem := true;
               end; //if balterador
            end;//if TestaOpcoes
   end;
   //--------------------------------------------------------
   procedure TrataDivergenciaSintetica;
   begin
            PreparaQrySintetica;
          //===================
            if not qryDivergSintetAux.isempty then
            begin
               while not qryDivergSintetAux.eof do
               begin
                 if TestaOpcoes(qryDivergSintetAux.fieldbyname('FLGSITPART').AsString,
                  //===========
                                qryDivergSintetAux.fieldbyname('NOMEPARTICIP').AsString,
                                qryDivergSintetAux.fieldbyname('MATRICULA').AsString,
                                qryDivergSintetAux.fieldbyname('PLANPREV').AsString,
                                qryDivergSintetAux.fieldbyname('PESSJUR').AsString,
                                imodo,
                                qryDivergSintetAux.fieldbyname('VALORESPERADO').AsFloat,
                                qryDivergSintetAux.fieldbyname('VALORRECEBIDO').AsFloat) then
                 begin
                    Calcula_Envia (qryDivergSintetAux); //<<<<< CALCULO PRINCIPAL
                  //=============
                    if not bErroAlterador then//se houve um erro no cálculo do alterador, não continuar
                    begin
                       cAux := DecimalSeparator;
                       DecimalSeparator := '.';
                       if not InsereHistorico(qryDivergSintetAux, sMesNovaCobranca, sCodPortForma,
                            //===============
                                              sdataref, '', dValorParcial,
                                              qryDivergSintetAux.fieldbyname('valoresperado').AsFloat,
                                              qryDivergSintetAux.fieldbyname('valorrecebido').AsFloat,
                                              crecpag,'') then
                       begin
{                          memResult.Lines.Add
                            (''+qryDivergSintetAux.fieldbyname('NOMEPARTICIP').AsString+' - '+
                             ''+qryDivergSintetAux.fieldbyname('NOMECONTRIB').AsString+' - '+
                             ''+qryDivergSintetAux.fieldbyname('mes').AsString+
                             ' - Erro na gravação do histórico de Cobranças.');}
                          memResult.Lines.Add('');
                          ExisteMensagem := true;
                          berro := true;
                       end;

                       if not AtualizaSitRecebimento(qryDivergSintetAux) then
                            //======================
                         berro := true;
                       DecimalSeparator := cAux;
                    end
                    else
                    begin
                       memResult.Lines.Add
                         (''+qryDivergSintetAux.fieldbyname('NOMEPARTICIP').AsString+' - '+
                          ''+qryDivergSintetAux.fieldbyname('NOMECONTRIB').AsString+' - '+
                          ''+qryDivergSintetAux.fieldbyname('mes').AsString+
                          ' - Erro no cálculo dos alteradores, Valor igual a zero (Verifique cadastro).');
                       memResult.Lines.Add('');
                       ExisteMensagem := true;
                    end;//if alterador
                 end;//if TestaOpcoes

                if gagProgresso.Progress = gagProgresso.MaxValue then
                  gagProgresso.Progress := gagProgresso.MaxValue
                else
                  gagProgresso.Progress :=  gagProgresso.Progress + 1;
                qryDivergSintetAux.next;
              end;//if balterador
            end;//if
   end;
   //--------------------------------------------------------
begin //INCIO ENVIAPROXMES
   result := false;
   berro := false;

   IdLote := LeUltRegistro(qryaux, 'CTRLINTERFACE');
   ordem := 1;
   dValor := 0;


   if Uppercase(cRecPag) = 'D' then
     sIdMotivoDiverg := inttostr(prmIdMotivoDevolAs)
   else
     sIdMotivoDiverg := inttostr(prmIdMotivoAtrasoAs);

   //ANALITICO
   if bIndividual then
   begin
      if dbgrdDivergAnalit.SelectedList.Count > 0 then
      //SELEÇÃO ANALITICO
      begin
         for i:=0 to dbgrdDivergAnalit.SelectedList.Count-1 do
         begin
            dbgrdDivergAnalit.datasource.dataset.GotoBookmark
                                         (dbgrdDivergAnalit.SelectedList.items[i]);
            TrataDivergenciaAnalitica;
          //=========================
         end;//for
      end
      else

      //TODAS
      begin
         qryleitura.first;
         while not qryleitura.eof do
         begin
            TrataDivergenciaAnalitica;
          //=========================
            qryleitura.next;
         end;//eof
      end;//else
   end//bindividual
   else

   //SINTETICO
   begin
      if dbgrdDivergSintet.SelectedList.Count > 0 then
      begin
         for i:=0 to dbgrdDivergSintet.SelectedList.Count-1 do
         begin
            dbgrdDivergSintet.datasource.dataset.GotoBookmark
                                         (dbgrdDivergSintet.SelectedList.items[i]);
            TrataDivergenciaSintetica;
          //=========================
         end;//for
      end
      else

      //TODOS
      begin
         qryleitura.first;
         while not qryleitura.eof do
         begin
            TrataDivergenciaSintetica;
          //=========================
            qryleitura.next;
         end;//eof
      end;//else
   end;//bindividual

   (*===================================================================
     ESTE TRECHO PRECISA SE REVISTO !!!! (Mauricio 28/2/2000)
     ===================================================================
   if dValor = 0 then
   begin
      memResult.Lines.Add(' Erro no envio dos alteradores para Controle de Interface,'+
                          ' Valor igual a zero (Verifique cadastro).');
      memResult.Lines.Add('');
      ExisteMensagem := true;
      berro := true;
   end
   else
   begin
      cAux := DecimalSeparator;
      DecimalSeparator := '.';
      AtualizaControleInterface(inttostr(idlote),
    //=========================
                                qryleitura.fieldbyname('mes').AsString,
                                floattostr(dvalor),
                                qryleitura.fieldbyname('idpessjur').AsString,
                                inttostr(ordem - 1),
                                'Envio de alteradores para divergências do mês de referência - '
                                 +qryleitura.fieldbyname('mes').AsString+' ');
      DecimalSeparator := cAux;
   end;
     ===================================================================*)

   if not berro then
     result := true;
end;

procedure TfrmDivergContribAss.PreparaQrySintetica;
var sSql: String;
begin
    if not TrataFiltro() then
         //===========
       Exit;

    if ItemSelecionado() = -1 then
    begin
      MsgDlg('Selecione um Modo de Divergência na Lista de Modos. ','Erro',mtError,
             [mbOk,mbHelp],0);
      Exit;
    end;

    //frmAguarde.Mostra('Atualizando Divergências ... ');

    sSQL := 'SELECT DISTINCT H.VALORESPERADO, '+
                   'H.VALORRECEBIDO, '+
                   'C.NOME AS NOMECONTRIB, P.NOME AS NOMEPARTICIP, EL.MATRICULA, '+
                   'C.IDCONTRIBUICAO,CT.IDPLANASS, H.MES, H.MESCOBRANCA, PP.IDPESSJUR,'+
                   'PP.IDPESSOA,H.CODDOCPREV CODDOCUMENTOPREV,PPV.IDSITPART,'+
                   'SIT.FLGINTERNO FLGSITPART,H.IDMOTIVO, SP.DESCRICAO SITPLANOPREV,'+
                   'SP.FLGINTERNO FLGSITPLANOPREV, PP.SEQPROPOSTA, H.DATA,'+
                   'CT.IDPROVENTOATRASO IDRUBRICAATRASO, CT.IDPROVENTODEVOL IDRUBRICADEVOLUC,'+
                   'PL.NOME PLANPREV, PESSJUR.NOME PESSJUR, H.IDREGRA IDREGRACALCULO,'+
                   'H.CODDOCPREV CODDOCUMENTOPREV, H.PLNCODPREV PLNCODIGOPREV,'+
                   'H.IDTITULAR, H.IDDEPENDENTE, H.IDCONTASS, H.FLGCOBCARNE, H.IDPLANOPREV '+
             ' FROM SITPLANOPREV SP,SITPART SIT, PLANPREV PL,PLANASS PLA,CONTRIBUICAO C,'+
                   'CONTRIBASS CT,PARTASS PP,PARTPREVPLAN PPV, ELEGPATRO EL, '+
                   'PESSOA P, PESSOA PESSJUR, HSTCONTRIBASS H '+{, CTRLINTERFACE CI'}
            ' WHERE ';
    MontaFiltro(sSQL);
    sSQL := sSQL + //' AND (H.IDLOTE = CI.IDLOTE)'+
                   ' AND (H.IDTITULAR   = PP.IDPESSOA)'+
                   ' AND (H.SEQPROPOSTA = PP.SEQPROPOSTA)'+
                   ' AND (H.IDPESSJUR   = PP.IDPESSJUR)'+
                   ' AND (H.IDPLANOPREV = PP.IDPLANOPREV)'+
                   ' AND (H.IDPLANASS   = PP.IDPLANASS)'+
                   ' AND (H.IDTITULAR   = PPV.IDPESSOA)'+
                   ' AND (H.SEQPROPOSTA = PPV.SEQPROPOSTA)'+
                   ' AND (H.IDPESSJUR   = PPV.IDPESSJUR)'+
                   ' AND (H.IDPLANOPREV = PPV.IDPLANOPREV)'+
                   ' AND (PP.IDSITPART  = SP.IDSITPLANOPREV)'+
                   ' AND (EL.IDPESSOA  = PP.IDPESSOA)'+
                   ' AND (EL.IDPESSJUR = PP.IDPESSJUR)'+
                   ' AND (C.IDCONTRIBUICAO = CT.IDCONTASS)'+
                   ' AND (C.IDCONTRIBUICAO = H.IDCONTASS)'+
                   ' AND (PP.IDPLANASS = CT.IDPLANASS)'+
                   ' AND (P.IDPESSOA = PP.IDPESSOA)'+
                   ' AND (H.IDPESSJUR = PESSJUR.IDPESSOA)'+
                   ' AND (H.IDPLANOPREV = PL.IDPLANOPREV)'+
                   ' AND (H.IDPLANASS = PLA.IDPLANASS)'+
                   ' AND (PPV.IDSITPART = SIT.IDSITPART)'+
                   ' AND (SP.FLGINTERNO NOT IN (''MS'', ''CA''))';

    sSQL := sSQL + ' ORDER BY P.NOME, C.NOME';

    qryDivergSintetAux.Close;
    qryDivergSintetAux.SQL.Clear;
    qryDivergSintetAux.SQl.Add(sSQL);
    try
       qryDivergSintetAux.Open;
    except
    end;
    //frmAguarde.Apaga;
end;

(*function TfrmDivergContribAss.InsereDivergTmpdesc(qrydados: Twwquery;
         sidpessoa, siddependente, sidpessjur, sidplanoprev, sidplanass, mesref,
         smescobranca, idlote, ordem, sValor, flgatrasodevol, codalterador, dataref,
         desc, referencia: String; crecpag: char; sflgdescfolha, sflgtipodesc: String)
        : Boolean;
var berro: boolean;
    sFlgDesconto: String;
begin
   berro := false;
   result := false;

   if uppercase(cRecPag) = 'R' then
     sFlgDesconto := '1'
   else
     sFlgDesconto := '0';

   if trim(sflgdescfolha) = '' then
      sflgdescfolha := qrybusca.fieldbyname('flgdescfolha').AsString;
   if trim(sflgtipodesc) = ''  then
      sflgtipodesc := qrybusca.fieldbyname('flgtipodesc').AsString;

   qryalterador.close;
   qryalterador.parambyname('codalterador').AsString := codalterador;
   qryalterador.open;

   qryexecuta.close;
   qryexecuta.sql.clear;
   qryexecuta.sql.add
     ('INSERT INTO TMPDESC(idtitular,idpessjur,idprovento,mesreferencia, '+
                 'flgtipodesc,valor,idplanass,'+
                 'iddesconto,'+
                 'idmotivo,mescobranca,idpessoa,'+
                 'idplanoprev,matricula,'+
                 'inscricaonumero,numprioridade,ordem,numdependseguro,'+
                 'flgdesconto,flgdescfolha,idfundacao,'+
                 'datareferencia,sistorigem,PLANO,'+
                 'PLACONTAD, PLACONTAC, IDEMPRESA,'+
                 'UNIDNEGOC, CODCENTRORESPON, IDEMPRESAPROP, CODSUBCONTA, '+
                 'CODCENTROCUSTOD, CODCENTROCUSTOC,'+
                 'CODTIPDOC, RECPAG,CODTIPRECDES,EXERCICIO,PERIODO,NODOCUMENTO,'+
                 'CODDOCUMENTOPREV,PLNCODIGOPREV,'+
                 'COMPLDOCUMENTO,IDLOTE,DATACOBRANCA,TIPCODIGO,SITENVIO,'+
                 'SEQPROPOSTA,FLGATRASODEVOL,'+
                 'CODALTERADOR,CODPORTFORMA,DESCRICAO,REFERENCIA,'+
                 'FLGEXISTEHST)'+
         ' VALUES('+sidpessoa+','+sidpessjur+',:PROVENTO,'''+mesref+''','+
                 ' '''+sflgtipodesc+''','+svalor+','''+sidplanass+''','+
                   qrydados.fieldbyname('idcontribuicao').AsString+','+
                 ' '''+sIdMotivoDiverg+''','''+smescobranca+''','+siddependente+
                 ','+sidplanoprev+','''+qrydados.fieldbyname('matricula').AsString+
                 ''',:inscricao,''0'','+ordem+',0,'''+
                   sFlgDesconto+''','''+sflgdescfolha+''','''+IntToStr(iIdFundacao)+
                   ''',:DATAREF,'''+intToStr(Sistema.IdModulo)+''',:PLANO,'+
                 ' :PLACONTAD,:PLACONTAC,:IDEMPRESA,'+
                 ' :UNIDNEGOC,:CODCENTRORESPON,:IDEMPRESAPROP,:CODSUBCONTA, '+
                 ' :CODCENTROCUSTOD,:CODCENTROCUSTOC,'+
                 ' :CODTIPDOC, :RECPAG, :CODTIPRECDES,:EXERCICIO,:PERIODO,:NODOCUMENTO,'+
                 ' :CODDOCUMENTOPREV, :PLNCODIGOPREV,'+
                 ' :COMPLDOCUMENTO,'+idlote+',:DATACOBRANCA,:TIPCODIGO,''0'','''+
                   qrydados.fieldbyname('seqproposta').AsString+''','''+flgatrasodevol+
                 ''','+codalterador+',:CODPORTFORMA,'''+desc+''','''+copy(referencia,1,10)+
                 ''',1)');
   try
       qryexecuta.parambyname('INSCRICAO').AsString := '';

       //escolhe rubrica de atraso ou devolução
       if uppercase(cRecPag) = 'P' then
         qryexecuta.parambyname('PROVENTO').AsString := qrydados.fieldbyname('IDRUBRICADEVOLUC').AsString
       else
         qryexecuta.parambyname('PROVENTO').AsString := qrydados.fieldbyname('IDRUBRICAATRASO').AsString;

       qryexecuta.parambyname('EXERCICIO').AsString := '';
       qryexecuta.parambyname('PERIODO').AsString := '';
       qryexecuta.parambyname('NODOCUMENTO').AsString := '';
       qryexecuta.parambyname('COMPLDOCUMENTO').AsString := '';
       qryexecuta.parambyname('CODDOCUMENTOPREV').AsString :=
         qrydados.fieldbyname('CODDOCUMENTOPREV').AsString;
       qryexecuta.parambyname('PLNCODIGOPREV').AsString :=
         qrydados.fieldbyname('PLNCODIGOPREV').AsString;
       qryexecuta.parambyname('RECPAG').AsString := crecpag;
       qryexecuta.parambyname('DATAREF').AsDate := strtodate(dataref);
       qryexecuta.parambyname('DATACOBRANCA').AsDate := strtodate(dataref);
       qryexecuta.parambyname('UNIDNEGOC').AsString := '';
       qryexecuta.parambyname('CODCENTRORESPON').AsString := '';
       qryexecuta.parambyname('CODSUBCONTA').AsString := '';
       qryexecuta.parambyname('CODTIPDOC').AsString := '';
       qryexecuta.parambyname('CODTIPRECDES').AsString := '';
       qryexecuta.parambyname('TIPCODIGO').AsString := '';
       qryexecuta.parambyname('CODPORTFORMA').AsString := '';

       //alterador
       qryexecuta.parambyname('PLANO').AsString := qryalterador.fieldbyname('plano').AsString;
       qryexecuta.parambyname('PLACONTAD').AsString := qryalterador.fieldbyname('placonta').AsString;
       qryexecuta.parambyname('PLACONTAC').AsString := qryalterador.fieldbyname('placonta').AsString;
       qryexecuta.parambyname('CODCENTROCUSTOD').AsString := qryalterador.fieldbyname('codcentrocusto').AsString;
       qryexecuta.parambyname('CODCENTROCUSTOC').AsString := qryalterador.fieldbyname('codcentrocusto').AsString;
       qryexecuta.parambyname('IDEMPRESA').AsString := qryalterador.fieldbyname('idpessoa').AsString;
       qryexecuta.parambyname('IDEMPRESAPROP').AsString := qryalterador.fieldbyname('idempresa').AsString;

       qryexecuta.ExecSql;
   except
      raise;
      exit;
   end;
   result := true;
end;*)

function TfrmDivergContribAss.PreparaQryJurosAtraso(idpatro, idplano,
         idplanass: integer; sMesRef, sMesCob, sMesNovaCob, sDataNovaCob: string;
         idParticipante, idDependente, idcontribuicao: integer): boolean;
var sSQL: string;
begin
   result := false;
   sSQL := 'SELECT H.MES, '''+sMesNovaCob+''' as MESCOBRANCA, '+
                  'TO_DATE('''+sDataNovaCob+''', ''dd/mm/yyyy'') as DATACOBRANCA, '+
                  'H.IDMOTIVO, H.DATAPREVISAO,H.VALORESPERADO,H.VALORRECEBIDO, '+
                  'H.DATA, H.IDTITULAR, H.IDDEPENDENTE '+
            ' FROM CONTRIBASS,CONTASS,HSTCONTRIBASS H  '+
           ' WHERE (H.IDPESSJUR   = '+IntToStr(idPatro)+') AND'+
                 ' (H.IDPLANOPREV = '+IntToStr(idPlano)+') AND'+
                 ' (H.IDPLANASS   = '+IntToStr(idPlanass)+') AND'+
                 ' (H.IDCONTASS = '+IntToStr(idContribuicao)+') AND'+
                 ' (CONTRIBASS.IDPLANASS = CONTASS.IDPLANASS) AND'+
                 ' (CONTRIBASS.IDCONTASS = CONTASS.IDCONTASS) AND'+
                 ' (CONTRIBASS.PAGADOR = ''C'') AND'+
                 ' (H.MES = '''+sMesRef+ ''') AND'+
                 ' (H.MESCOBRANCA  = '''+sMesCob+''') AND'+
                 ' (H.IDTITULAR = CONTASS.IDTITULAR) AND'+
                 ' (H.IDPLANOPREV = CONTASS.IDPLANOPREV) AND'+
                 ' (H.IDPLANASS = CONTASS.IDPLANASS) AND'+
                 ' (H.IDCONTASS = CONTASS.IDCONTASS) AND'+
                 ' (H.IDDEPENDENTE = CONTASS.IDDEPENDENTE) AND'+
                 ' (H.IDPESSJUR = CONTASS.IDPESSJUR)';
   if idParticipante > 0 then
     sSQL := sSQL +' AND (H.IDTITULAR = '+IntToStr(idParticipante)+')';

   if idDependente > 0 then
     sSQL := sSQL +' AND (H.IDDEPENDENTE = '+IntToStr(idDependente)+')';

   qryAtraso.Close;
   qryAtraso.SQL.Clear;
   qryAtraso.SQL.Add(sSQL);
   try
      qryAtraso.Open;
   except
      exit;
   end;
   result := true;
end;

(* procedure TfrmDivergContribAss.RetornaDatas(sidpessjur, sidplanoprev, sidplanass,
          sidsitfundacao: String; var sDataRef, sMesCob: String; flgtipodesc: char;
          sMesCobContr: String);
var sSQLDatas, sAno, sMes, sDia: String;
begin
   sSQLDatas :=
     'SELECT D.IDPESSJUR, D.SITFUNDACAO, D.DIACOBNORMAL, D.IDPLANOPREV,'+
            'D.FLGUTILNORMAL, D.FLGANTERIORNORMAL, D.DIACOBATRASO,'+
            'D.FLGUTILATRASO, D.FLGANTERIORATRASO, D.DIACOBDEVOLUCAO,'+
            'D.FLGUTILDEVOLUCAO,D.FLGANTERIORDEVOL, D.FLGMESCOBNORMAL,'+
            'D.FLGMESCOBATRASO, D.FLGMESCOBDEVOLUC, PL.NOME AS PLANO,'+
            'P.NOME AS PATROCINADORA, PT.DIAFOLHA, PT.FLGUTILFOLHA,'+
            'PT.FLGMESFOLHA, PT.FLGANTERIORFOLHA, F.DIAFOLHA DIAFBENEF, '+
            'F.FLGUTILFOLHA AS FLGUTILFBENEF, F.FLGMESFOLHA FLGMESFBENEF, '+
            'F.FLGANTERIORFOLHA AS FLGANTERIORFBENEF, PLA.IDPLANASS, PLA.NOME PLANASS'+
      ' FROM PLANPREV PL,PLANASS PLA,PATRO PT,FUNDACAO F,DATASPATROPLANASS D,PESSOA P '+
     ' WHERE (D.IDPESSJUR   = P.IDPESSOA)'+
       ' AND (D.IDPESSJUR = '''+sidpessjur+''')'+
       ' AND (D.IDPLANOPREV = '''+sidplanoprev+''')'+
       ' AND (D.SITFUNDACAO = '''+sidsitfundacao+''')'+
       ' AND (D.IDPLANASS = '''+sidplanass+''')'+
       ' AND (D.IDPLANOPREV = PL.IDPLANOPREV)'+
       ' AND (D.IDPLANASS = PLA.IDPLANASS)'+
       ' AND (D.IDPESSJUR   = PT.IDPESSOA)'+
       ' AND (PT.IDFUNDACAO = F.IDPESSOA)';

   // Abrir query de SituacoesxPatroxPlano
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQLDatas);
   qryAux.Open;
   qryAux.First;

   if qryaux.isempty then
   begin
      memResult.Lines.Add('Datas não cadastradas devidamente.');
      memResult.Lines.Add('');
      sDataRef := '';
      sMesCob := '';
      ExisteMensagem := true;
      exit;
   end;

   //sAno := Trim(spedAnoRef.Text);
   //if cmbMesRef.ItemIndex <= 8
   //then sMes := '0'+IntToStr(cmbMesRef.ItemIndex+1)
   //else sMes := IntToStr(cmbMesRef.ItemIndex+1);

   //sAno := copy(sMesCobContr,1,4);
   //sMesCobContr := copy(sMesCobContr,6,2);

   //por como mês de referencia o mês corrente
   sAno := copy(datetostr(date),7,4);
   sMesCobContr := copy(datetostr(date),4,2);

   //datas
   if sidsitfundacao <> 'AS' then
   begin
       //RetornaDataCobranca: função em "UAdmAss.pas"
   {->}sDataRef := RetornaDataCobranca(qryAux.FieldByName('DiaCobAtraso').AsInteger,
                 //===================
                                       qryAux.FieldByName('FLGUTILATRASO').AsString,
                                       qryAux.FieldByName('FLGANTERIORATRASO').AsString,
                                       qryAux.FieldByName('FLGMESCOBATRASO').AsString,
                                       sMesCobContr,sAno);
       sMesCob  := Copy(sDataref,7,4)+'/'+Copy(sDataRef,4,2);
   end
   else
   begin // assistido
   {->}sDataRef  := RetornaDataCobranca(qryAux.FieldByName('DiaFBenef').AsInteger,
                  //===================
                                        qryAux.FieldByName('flgUtilFBenef').AsString,
                                        qryAux.FieldByName('flgAnteriorFBenef').AsString,
                                        qryaux.FieldByName('flgMesFBenef').AsString,
                                        sMesCobContr,sAno);
       sMesCob := Copy(sDataRef,7,4)+'/'+Copy(sDataref,4,2);
   end;
   //fim datas

   //testa se datas estão menores que a atual
   //no caso do mês de cobrança ser o mesmo e a data
   //de cobrança já ter passado
   //joga para o próximo mês
   if date >= strtodate(sDataRef) then
   begin
      sDia := copy(sdataref,1,2);
      sDataRef := sDia+'/'+ProximoMesAno(strtoint(copy(sdataref,4,2)),strtoint(copy(sdataref,7,4)));
      sMesCob := Copy(sDataRef,7,4)+'/'+Copy(sDataref,4,2);
   end;

   if (sDataRef = '') or (sMesCob = '') then
   begin
      memResult.Lines.Add('Erro no cálculo da Data/Mês de cobrança.');
      memResult.Lines.Add('');
      ExisteMensagem := True;
   end;
end; *)

procedure TfrmDivergContribAss.bbtnVoltarClick(Sender: TObject);
begin
  inherited;
  pgctrlDivergencias.visible := true;
  pnlResult.visible := false;
end;

procedure TfrmDivergContribAss.bbtnVerResultadoClick(Sender: TObject);
begin
  inherited;
  pgctrlDivergencias.visible := false;
  pnlResult.visible := true;
end;

procedure TfrmDivergContribAss.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then
     memResult.Lines.SaveToFile(savedlg.filename);
end;

procedure TfrmDivergContribAss.ParmetrosPadro1Click(Sender: TObject);
begin
  inherited;
  qryparam.close;
  qryparam.open;
  tb97Param.visible := true;
  tb97Param.Top := 56;
  tb97Param.Left := 120;
  //atualizar valor
end;

procedure TfrmDivergContribAss.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  RealEdit1.Text := qryparam.fieldbyname('VLRACEITADIVERG').AsString;
end;

procedure TfrmDivergContribAss.sbtnFluxOperClick(Sender: TObject);
begin
  inherited;
  dblkpcmbPatro.Text   := ''; chkPatro.Checked   := false;
  dblkpcmbPlano.Text   := ''; chkPlano.Checked   := false;
  cmbplanass.text      := ''; ckplanass.checked  := false;
  dblkpcmbContrib.Text := ''; chkContrib.Checked := false;
  cmbFiltraTempo.Text  := ''; edTempo.Text := '';  chkTempo.Checked := false;
  cmbFiltraValor.Text  := ''; edValor.Text := '';  chkValor.Checked := false;
  edParticipante.Text  := ''; chkParticipante.Checked := false;
end;

procedure TfrmDivergContribAss.SpeedButton20Click(Sender: TObject);
begin
  inherited;
   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add
     (' UPDATE CONTRIBASS '+
      ' SET VLRACEITADIVERG = '+OraNumero(trim(RealEdit1.text))+
      ' WHERE (IDPLANASS = '''+qryparam.fieldbyname('IDPLANASS').AsString+''')'+
      ' AND (IDCONTASS = '''+qryparam.fieldbyname('IDCONTASS').AsString+''')');
   try
      //qryaux.parambyname('VALOR').AsString := OraNumero(RealEdit1.text);
      qryaux.execsql;
   except
      raise
   end;
   qryparam.close;
   qryparam.open;
end;

procedure TfrmDivergContribAss.qryparamBeforeOpen(DataSet: TDataSet);
var sIdCont, sIdPlano: string;
begin
  inherited;
  if (dbgrdDivergSintet.visible) and ( not qryDivergSintet.isempty)  then
  begin
     sIdCont := qryDivergSintet.fieldbyname('IDCONTASS').AsString;
     sIdPlano := qryDivergSintet.fieldbyname('IDPLANASS').AsString;
  end
  else
    if (dbgrdDivergAnalit.visible) and ( not qryDivergAnalit.isempty)  then
    begin
       sIdCont := qryDivergAnalit.fieldbyname('IDCONTASS').AsString;
       sIdPlano := qryDivergAnalit.fieldbyname('IDPLANASS').AsString;
    end;
  qryparam.parambyname('IDCONT').AsString := sIdCont;
  qryparam.parambyname('IDPLANO').AsString := sIdPlano;
end;

procedure TfrmDivergContribAss.qryparamAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RealEdit1.Text := qryparam.fieldbyname('VLRACEITADIVERG').AsString;
  qryalteradorxcontrib.close;
  qryalteradorxcontrib.open;
end;

procedure TfrmDivergContribAss.BitBtn1Click(Sender: TObject);
begin
  //inherited;
  tb97Param.visible := false;
end;

procedure TfrmDivergContribAss.dbgrdDivergSintetMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var iModoSelecionado: integer;
begin
  inherited;
  if tb97Param.Visible then
    tb97Param.Visible := false;

  iModoSelecionado := ItemSelecionado();
                    //===============
  if (qryDivergSintet.isempty) or (iModoSelecionado in [0,5])
     or (iModoSelecionado < 0) then
  begin
     dbgrdDivergSintet.PopupMenu := nil;
     dbgrdDivergSintet.ShowHint := false;
  end
  else
  begin
     ConsPart1.sIdPessoa := '';
     ConsPart1.sSeqProposta := '';
     ConsPart1.sIdPlanoprev := '';
     ConsPart1.DataBaseName := 'BaseDados';
     ConsPart1.sIdPessjur := '';
     DadosdoParticipante1.visible := false;
     DadosdoParticipante2.enabled := false;
     dbgrdDivergSintet.PopupMenu := pmnu;
  end;
end;

function TfrmDivergContribAss.TestaOpcoes(sidsitplanoprev, snome, smatricula, splano,
         spatro: String; iModo: opMenu; dValorEsperado, dValorRecebido: Extended): boolean;
var sCaso: String;
//verifica se opção selecionada pode ser aplicada
begin
  result := false;
  case imodo of
     opCobraProx:       sCaso := 'Cobrar diferença no próximo mês';
     opCobraImediato:   sCaso := 'Cobrar Diferença Imediatamente';
     opDevolveProx:     sCaso := 'Devolver Diferença no Próximo Mês';
     opDevolveImediato: sCaso := 'Devolver Diferença Imediatamente';
     opIgnora:          sCaso := 'Ignorar Diferença';
  end;

  //testa situação
  if uppercase(sidsitplanoprev) = 'MA' then //mantido
  begin
     if imodo in [opCobraProx, opDevolveProx] then
     begin
        memResult.Lines.Add(''+snome+' - '+
                            ''+smatricula+' - '+splano+' - '+spatro+' '+
                            '- Não foi possível '+sCaso+' -> Situação na Fundação: Mantido.');
        memResult.Lines.Add('');
        ExisteMensagem := true;
        exit;
     end;
  end
  else
    if uppercase(sidsitplanoprev) = 'AS' then //assistido
    begin
       if imodo in [opCobraProx, opCobraImediato, opDevolveProx, opDevolveImediato] then
       begin
          memResult.Lines.Add(''+snome+' - '+
                              ''+smatricula+' - '+splano+' - '+spatro+' '+
                              '- Não foi possível '+sCaso+' -> Situação na Fundação: Assistido.');
          memResult.Lines.Add('');
          ExisteMensagem := true;
          exit;
       end;
    end;
  //testa valores (principalmente no caso de um tratamento batch por contribuições
  //onde mesmo sabendo qual a diferença predominante, não se sabe previamente
  //se há outro tipo de divergência)
  if  dValorEsperado > dValorRecebido then
  begin
     if imodo in [opDevolveProx, opDevolveImediato] then
     begin
        memResult.Lines.Add(''+snome+' - '+
                            ''+smatricula+' - '+splano+' - '+spatro+' '+
                            '- Não foi possível '+sCaso+' -> Valor Recebido maior que valor Esperado.');
        memResult.Lines.Add('');
        ExisteMensagem := true;
        exit;
     end;
  end
  else
    if dValorRecebido < dValorEsperado then
    begin
       if imodo in [opCobraprox, opCobraImediato] then
       begin
          memResult.Lines.Add(''+snome+' - '+
                              ''+smatricula+' - '+splano+' - '+spatro+' '+
                              '- Não foi possível '+sCaso+' -> Valor Esperado maior que valor Recebido.');
          memResult.Lines.Add('');
          ExisteMensagem := true;
          exit;
       end;
    end;
  result := true;
end;

(* function TfrmDivergContribAss.TestaPodeCCP (qrybusca: twwquery; snome, smatricula,
         splano,spatro: String; iModo: opMenu): boolean;
var sCaso: String;
begin
  result := false;
  case imodo of
     opCobraProx:       sCaso := 'Cobrar diferença no próximo mês';
     opCobraImediato:   sCaso := 'Cobrar Diferença Imediatamente';
     opDevolveProx:     sCaso := 'Devolver Diferença no Próximo Mês';
     opDevolveImediato: sCaso := 'Devolver Diferença Imediatamente';
     opIgnora:          sCaso := 'Ignorar Diferença';
  end;
  //testa se for banco ou folha de benefícios
  //deve ter anteriormente o documento a ser alterado
  //no CAP/CAR
  //se não tiver não deixa
  if (qrybusca.fieldbyname('CODDOCUMENTOPREV').AsString = '') or
     (qrybusca.fieldbyname('PLNCODIGOPREV').AsString = '') then
  begin
     if imodo in [opCobraImediato, opDevolveImediato] then
     begin
        memResult.Lines.Add
          (''+snome+' - '+
           ''+smatricula+' - '+splano+' - '+spatro+' '+
           '- Não foi possível '+sCaso+' -> Esta contribuição foi descontada em folha '+
           ' de pagamento, não existindo documentos a serem alterados no CAP/CAR.');
        memResult.Lines.Add('');
        ExisteMensagem := True;
        exit;
     end;
  end;
  result := true;
end; *)

procedure TfrmDivergContribAss.dbgrdDivergAnalitMouseDown (Sender: TObject;
          Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var iModoSelecionado: integer;
begin
  inherited;
  if tb97Param.Visible then
    tb97Param.Visible := false;

  iModoSelecionado := ItemSelecionado();
                    //===============
  if (qryDivergAnalit.isempty)
     or (iModoSelecionado in [0,5])
     or (iModoSelecionado < 0) then
  begin
     dbgrdDivergAnalit.PopupMenu := nil;
     dbgrdDivergAnalit.ShowHint := false;
  end
  else
  begin
     dbgrdDivergAnalit.PopupMenu := pmnu;
     ConsPart1.sIdPessoa := qryDivergAnalit.fieldbyname('IDTITULAR').AsString;
     ConsPart1.sSeqProposta := qryDivergAnalit.fieldbyname('SEQPROPOSTA').AsString;
     ConsPart1.sIdPlanoprev := qryDivergAnalit.fieldbyname('IDPLANOPREV').AsString;
     ConsPart1.DataBaseName := 'BaseDados';
     ConsPart1.sIdPessjur := qryDivergAnalit.fieldbyname('IDPESSJUR').AsString;
     DadosdoParticipante1.visible := true;
     DadosdoParticipante2.enabled := true;
  end;
end;

procedure TfrmDivergContribAss.cmbMesRefChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
    tb97Param.Visible := false;
end;

procedure TfrmDivergContribAss.spedAnoRefChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
    tb97Param.Visible := false;
end;

procedure TfrmDivergContribAss.dblkpcmbPatroChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
    tb97Param.Visible := false;
end;

procedure TfrmDivergContribAss.dblkpcmbPlanoChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
    tb97Param.Visible := false;
end;

procedure TfrmDivergContribAss.dblkpcmbContribChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
    tb97Param.Visible := false;
end;

procedure TfrmDivergContribAss.cmbFiltraTempoChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
    tb97Param.Visible := false;
end;

procedure TfrmDivergContribAss.cmbFiltraValorChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
    tb97Param.Visible := false;
end;

function TfrmDivergContribAss.TestaValorRegraCalculo(var Regra: TRegra): Boolean;
var dValor: Double;
    cAux: Char;
    i : integer;
begin
   result := false;

   if regra.result = '' then
      exit;

   cAux := DecimalSeparator;

   i := pos(',', regra.result);
   if i = 0 then
   begin
      DecimalSeparator := '.';
      i:= pos('.',Regra.result);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   try
      dValor := strfloat(regra.result,1);
   except
      exit;
   end;

   if dValor = 0 then
     exit;

   DecimalSeparator := cAux;
   result := true;
end;

procedure TfrmDivergContribAss.pmnuCobraProxClick(Sender: TObject);
var berro: Boolean;
begin
  inherited;
  imodo := opCobraProx;

  if prmIdMotivoAtrasoAs <= 0 then
  begin
     MsgDlg('O Motivo[default] para Cobrança de Atraso/Pagamentos a menor de Mensalidades'
           +' Assistenciais deverá ser preenchido. Utilize a tela de Parâmetros do Sistema.',
            'Informação',mtInformation,[mbOk],0);
     Exit;
  end;

  berro := false;
  PreparaTransacao('Cobra Divergência no Próximo Mês...');
//================

  if dbgrdDivergAnalit.visible then
  begin  // tavares 08/05/2003   -- OK
     if not EnviaProxMes (qryDivergAnalit, true,'','','','***','P','X','R') then //CPrev - 26637
       berro := true;
  end
  else
  begin
     if not EnviaProxMes (qryDivergSintet, false,'','','','***','P','X','R') then //CPrev - 26637
       berro := true;
  end;

  TerminaTransacao('Cobrança da Diferença no Próximo Mês',berro);
//================
end;

procedure TfrmDivergContribAss.PreparaTransacao(sTransacao: String);
begin
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  bCancelaenvio := false;

  memresult.lines.clear;
  ExisteMensagem := false;
  bbtnVerResultado.enabled := false;

  pnlProgresso.Visible := true;
  pnlFundo.enabled := false;
  pnlProgresso.Left := 194;
  pnlProgresso.Top :=  140;
  lblMsg2.Caption := 'Tratando Divergências ...';

  memResult.Lines.Add(''+sTransacao+' - Data:'+datetostr(date)+'');
  memResult.Lines.Add('_______________________________________________');
  memResult.Lines.Add('');

  pnlProgresso.Update;
  Application.ProcessMessages;
  frmDivergContribAss.update;
  if bCancelaenvio then
  begin
     memResult.Lines.Add('Processo interrompido pelo usuário.');
     memResult.Lines.Add('');
     ExisteMensagem := true;
     exit;
  end;

  pnlProgresso.BringToFront;
  gagProgresso.Progress := 0;
  btncancelaprogress.enabled := true;
  btncancelaprogress.setfocus;
end;

procedure TfrmDivergContribAss.btncancelaprogressClick(Sender: TObject);
begin
  bcancelaenvio := true;
  pnlProgresso.Visible := false;
  pnlFundo.enabled := true;

  dtmBaseDados.dbBaseDados.RollBack;
  with qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT 1 FROM DUAL');
    Open;
    Close;
  end;

  Application.ProcessMessages;
  frmDivergContribAss.update;
  inherited;
end;

procedure TfrmDivergContribAss.TerminaTransacao(sTransacao: String; berro: Boolean);
begin
  gagProgresso.Progress := gagProgresso.MaxValue;
  pnlProgresso.Update;
  pnlProgresso.Visible := false;
  pnlFundo.enabled := true;

  if ExisteMensagem then
  begin
    bbtnVerResultado.enabled := true;
    pgctrlDivergencias.visible := false;
    pnlResult.visible := true;
  end;

  if not bcancelaenvio then
  begin
     if not(bErro) then
     begin
       qrybusca.Close;
       qryatraso.close;
       qryalterador.close;
       qryAux.Close;
       MsgDlg(''+sTransacao+' Efetuado com Sucesso.','Informação',
              mtInformation,[mbOk],0);

       dtmBaseDados.dbBaseDados.Commit;  //CPrev - 26637
     end
     else
     begin
       qrybusca.Close;
       qryatraso.close;
       qryalterador.close;
       qryAux.Close;

       if MsgDlg(''+sTransacao+' Efetuado com erros. Deseja efetivar envio ?',
                 'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then

         dtmBaseDados.dbBaseDados.RollBack
       else
         dtmBaseDados.dbBaseDados.Commit;

     end;
  end;

  if dbgrdDivergAnalit.visible then
  begin
     qryDivergAnalit.close;
     qryDivergAnalit.open;
  end
  else
  begin
     qryDivergSintet.close;
     qryDivergSintet.open;
  end;

  with qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT 1 FROM DUAL');
    Open;
    Close;
  end;
end;

(* Procedure TfrmDivergContribAss.AtualizaControleInterface(idlote, sMesRef, sValor,
          idpessjur, Contador, desc: String);
begin
   lblMsg1.Caption := '';
   lblMsg2.Caption := 'Atualizando Controle de Interface...';
   pnlProgresso.Update;

   Application.ProcessMessages;
   frmDivergContribAss.update;
   if bCancelaenvio then
   begin
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('');
      ExisteMensagem := True;
      exit;
   end;

   //gagProgresso.Progress := 0;

   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add
     ('INSERT INTO CTRLINTERFACE'+
                 ' (MESREFERENCIA,TIPO,FLGIDATMP,IDPESSOA,DATAIDATMP,IDLOTE,'+
                   ' NUMREG,VLRTOTAL,DESCRICAO,FLGATRASODEVOL)'+
           ' VALUES('''+sMesRef+''',''P'',1,'+idpessjur+',SYSDATE,'+idlote+','+
                    contador+', :valor, '''+desc+''',''A'')');
   try
     qryaux.parambyname('valor').AsString := sValor;
     //qryaux.parambyname('codportform').AsString := codportform;
     qryaux.ExecSql;
   except
      memResult.Lines.Add('Erro Específico da Patrocinadora - [GRAVAÇÃO DO CONTROLE DE INTERFACE]');
      memResult.Lines.Add('');
      ExisteMensagem := True;
   end;

   gagProgresso.Progress :=   gagProgresso.MaxValue;
end; *)

procedure TfrmDivergContribAss.MostraTelaDataFormaPg(sCob: String);
begin
   sCobTela := sCob;
   AbrirFormModal (frmVlrDtDiverg, TfrmVlrDtDiverg);
   frmVlrDtDiverg.Free;
end;

procedure TfrmDivergContribAss.pmnuCobraImedClick(Sender: TObject);
var berro: Boolean;
begin
  inherited;
  imodo := opCobraImediato;

  if prmIdMotivoAtrasoAs <= 0 then
  begin
     MsgDlg('O Motivo[default] para Cobrança de Atraso/Pagamentos a menor de'
           +' Mensalidades Assistenciais deverá ser preenchido. Utilize a tela'
           +' de Parâmetros do Sistema.', 'Informação', mtInformation, [mbOk], 0);
     exit;
  end;

  berro := false;
  PreparaTransacao('Cobra Divergência Imediatamente...');
//================

  MostraTelaDataFormaPg('Cobrança');
//=====================
  if not bsaiu then
  begin
     if dbgrdDivergAnalit.visible then
     begin
        if not EnviaProxMes (qryDivergAnalit,true,sMesCob,sData,sCodPort,'***','P','O','A') then
             //============
          berro := true;
        //qryDivergAnalit.close;
        //qryDivergAnalit.open;
     end
     else
     begin
        if not EnviaProxMes (qryDivergSintetAux,false,sMesCob,sData,sCodPort,'***','P','O','A') then
             //============
          berro := true;
        //qryDivergSintetAux.close;
        //qryDivergSintetAux.open;
     end;
  end;

  TerminaTransacao('Cobrança da Diferença Imediatamente',berro);
//================
end;

procedure TfrmDivergContribAss.pmnuDevolveProxClick(Sender: TObject);
var berro: boolean;
begin
  inherited;
  imodo := opDevolveProx;

  if prmIdMotivoDevolAs <= 0 then
  begin
      MsgDlg('O Motivo[default] para Devolução deverá ser preenchido. Utilize a tela de Parâmetros do Sistema.','Informação',mtInformation,[mbOk],0);
      Exit;
  end;

  berro := false;
  PreparaTransacao('Devolve Divergência no próximo mês...');
//================
  if dbgrdDivergAnalit.visible then
  begin
     if not EnviaProxMes (qryDivergAnalit,true,'','','','***','P','X','D') then
          //============
        berro := true;
     //qryDivergAnalit.close;
     //qryDivergAnalit.open;
  end
  else
  begin
     if not EnviaProxMes (qryDivergSintet,false,'','','','***','P','X','D') then
          //============
        berro := true;
     //qryDivergSintetAux.close;
     //qryDivergSintetAux.open;
  end;

  TerminaTransacao('Devolve Divergência no próximo mês',berro);
//================
end;

procedure TfrmDivergContribAss.pmnuDevolveImedClick(Sender: TObject);
var berro: boolean;
begin
  inherited;
  imodo := opDevolveImediato;
  if prmIdMotivoDevolAs <= 0 then
  begin
     MsgDlg('O Motivo[default] para Devolução deverá ser preenchido. Utilize a tela de Parâmetros do Sistema.','Informação',mtInformation,[mbOk],0);
     Exit;
  end;

  berro := false;
  PreparaTransacao('Devolve Divergência Imediatamente...');
//================

  MostraTelaDataFormaPg('Devolução');
//=====================
  if not bsaiu then
  begin
     if dbgrdDivergAnalit.visible then
     begin
        if not EnviaProxMes(qryDivergAnalit,true,sMesCob,sData,sCodPort,'***','P','O','P') then
             //============
           berro := true;
        //qryDivergAnalit.close;
        //qryDivergAnalit.open;
     end
     else
     begin
        if not EnviaProxMes(qryDivergSintetAux,false,sMesCob,sData,sCodPort,'***','P','O','P') then
             //============
           berro := true;
        //qryDivergSintetAux.close;
        //qryDivergSintetAux.open;
     end;
  end;

  TerminaTransacao('Devolução da Diferença Imediatamente',berro);
//================
end;

procedure TfrmDivergContribAss.bbtnSairClick(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction then
     exit;
end;

procedure TfrmDivergContribAss.pmnuDevolveIgnoraClick(Sender: TObject);
var berro: boolean;
begin
  inherited;
  imodo := opIgnora;

  berro := false;
  PreparaTransacao('Ignorar diferença ...');
//================
  if dbgrdDivergAnalit.visible then
  begin
     if not Ignora(qryDivergAnalit, true) then
          //======
        berro := true;
     //qryDivergAnalit.close;
     //qryDivergAnalit.open;
  end
  else
  begin
     if not Ignora(qryDivergSintet, False) then
          //======
        berro := true;
     //qryDivergSintetAux.close;
     //qryDivergSintetAux.open;
  end;

  TerminaTransacao('Ignorar diferença',berro);
//================
end;

function TfrmDivergContribAss.Ignora(qryleitura: TwwQuery; bindividual: boolean)
        : boolean;
var berro, bAlgumAltEnv: boolean;
    i, ordem: integer;
    dValorTotal: extended;
    //cAux: char;

   //envia alterador para dar baixa no documento
   //--------------------------------------------------------
   function EnviaAlteradorIgnora (qry: TwwQuery): boolean;
   var crecpag: char;
       dValor: extended;
       //flgatrasodevol: char;
   begin
      result := false;
      dValor := 0;
      crecpag:=#0;

      //CASO CONTRÁRIO, POIS ESTÁ ENVIANDO UM ALTERADOR DE BAIXA
      if qry.FieldByName('VALORRECEBIDO').AsFloat >
         qry.FieldByName('VALORESPERADO').AsFloat then
      begin
         crecpag := 'R';
         dValor := qry.FieldByName('VALORRECEBIDO').AsFloat -
                   qry.FieldByName('VALORESPERADO').AsFloat;
      end
      else
        if qry.FieldByName('VALORRECEBIDO').AsFloat <
           qry.FieldByName('VALORESPERADO').AsFloat then
        begin
           crecpag := 'P';
           dValor := qry.FieldByName('VALORESPERADO').AsFloat -
                     qry.FieldByName('VALORRECEBIDO').AsFloat;
        end;

      qryaltaux.close;
      qryaltaux.sql.clear;
      qryaltaux.sql.add
        ('SELECT TIPOALTERADOR.CODALTERADOR, IDREGRACALCULO, DESCRICAO NOMEALTERADOR '+
          ' FROM ALTERXCONTRIBASS, TIPOALTERADOR '+
         ' WHERE (TIPOALTERADOR.CODALTERADOR = ALTERXCONTRIBASS.CODALTERADOR)'+
           ' AND (IDPLANASS = '''+qry.FieldByName('idplanass').AsString+''')'+
           ' AND (IDCONTASS = '''+qry.FieldByName('idcontass').AsString+''')'+
           ' AND (FLGCOBRA = 1)');

      if uppercase(crecpag) = 'R' then
        qryaltaux.sql.add(' AND FLGATRASO = 1 ')
      else
        qryaltaux.sql.add(' AND FLGDEVOL = 1 ');
      qryaltaux.Open;

      if qryaltaux.fieldbyname('codalterador').AsString = '' then
      begin
         memResult.Lines.Add(''+qry.fieldbyname('PLANASS').AsString+' - '+
                             ''+qry.fieldbyname('NOMECONTRIB').AsString+' - '+
                             'Alterador para baixa do documento não cadastrado.');
         memResult.Lines.Add('');
         ExisteMensagem := true;
         exit;
      end;

      if dValor = 0 then
      begin
         memResult.Lines.Add
           (''+qry.fieldbyname('NOMEPARTICIP').AsString+' - '+
            ''+qry.fieldbyname('NOMECONTRIB').AsString+' - '+
            ''+qry.fieldbyname('mes').AsString+
            ' - Erro no lançamento de baixa do documento, valor igual a zero.');
         memResult.Lines.Add('');
         ExisteMensagem := true;
         exit;
      end;

      dValorTotal := dValorTotal + dValor;
      result := true;
   end;
   //--------------------------------------------------------
   procedure TrataDivergenciaAnalitica;
   begin
           if TestaOpcoes(qryleitura.fieldbyname('FLGSITPART').AsString,
            //===========
                          qryleitura.fieldbyname('NOMEPARTICIP').AsString,
                          qryleitura.fieldbyname('MATRICULA').AsString,
                          qryleitura.fieldbyname('PLANPREV').AsString,
                          qryleitura.fieldbyname('PESSJUR').AsString,
                          imodo,
                          qryleitura.fieldbyname('VALORESPERADO').AsFloat,
                          qryleitura.fieldbyname('VALORRECEBIDO').AsFloat) then
           begin
             if not TrataIgnora(qryleitura) then
                  //===========
               berro := true
             else
             begin
                //se não possui documento no cap/car, não envia alteradores
                if (qryleitura.fieldbyname('CODDOCUMENTOPREV').AsString <> '') or
                   (qryleitura.fieldbyname('PLNCODIGOPREV').AsString <> '') then
                begin
                   if not EnviaAlteradorIgnora(qryleitura) then
                        //====================
                     berro := true;
                   bAlgumAltEnv := true;
                end;
             end;
           end;
           if gagProgresso.Progress = gagProgresso.MaxValue then
             gagProgresso.Progress := gagProgresso.MaxValue
           else
             gagProgresso.Progress :=  gagProgresso.Progress + 1;
           inc(ordem);
   end;
   //--------------------------------------------------------
   procedure TrataDivergenciaSintetica;
   begin
            PreparaQrySintetica;
          //===================
            if not qryDivergSintetAux.isempty then
            begin
               while not qryDivergSintetAux.eof do
               begin
                 if TestaOpcoes(qryDivergSintetAux.fieldbyname('FLGSITPART').AsString,
                  //===========
                            qryDivergSintetAux.fieldbyname('NOMEPARTICIP').AsString,
                            qryDivergSintetAux.fieldbyname('MATRICULA').AsString,
                            qryDivergSintetAux.fieldbyname('PLANPREV').AsString,
                            qryDivergSintetAux.fieldbyname('PESSJUR').AsString,
                            imodo,
                            qryDivergSintetAux.fieldbyname('VALORESPERADO').AsFloat,
                            qryDivergSintetAux.fieldbyname('VALORRECEBIDO').AsFloat) then
                 begin
                   if not TrataIgnora(qryDivergSintetAux) then
                        //===========
                     berro := true
                   else
                   begin
                      //se não possui documento no cap /car, não envia alteradores
                      if (qryDivergSintetAux.fieldbyname('CODDOCUMENTOPREV').AsString <> '') or
                         (qryDivergSintetAux.fieldbyname('PLNCODIGOPREV').AsString <> '') then
                      begin
                         if not EnviaAlteradorIgnora(qryDivergSintetAux) then
                              //====================
                           berro := true;
                         bAlgumAltEnv := true;
                      end;
                   end;
                 end;
                 if gagProgresso.Progress = gagProgresso.MaxValue then
                   gagProgresso.Progress := gagProgresso.MaxValue
                 else
                   gagProgresso.Progress :=  gagProgresso.Progress + 1;
                 inc(ordem);
                 qryDivergSintetAux.next;
               end;
            end;//if
   end;
   //--------------------------------------------------------
begin
   berro := false;
   result := false;
   bAlgumAltEnv := false;

   pnlProgresso.Update;
   //gagProgresso.Progress := 0;

   ordem := 1;
   dValorTotal := 0;

   //ANALITICO
   if bIndividual then
   begin
      //somente divergências selecinados
      if dbgrdDivergAnalit.SelectedList.Count > 0 then
      begin
         for i:=0 to dbgrdDivergAnalit.SelectedList.Count-1 do
         begin
            dbgrdDivergAnalit.datasource.dataset.GotoBookmark
                                        (dbgrdDivergAnalit.SelectedList.items[i]);
            TrataDivergenciaAnalitica;
          //=========================
         end;
      end
      else

      //TODAS
      begin
         qryleitura.first;
         while not qryleitura.eof do
         begin
            TrataDivergenciaAnalitica;
          //=========================
            qryleitura.next;
         end;
      end;
   end//bindividual

   //SINTETICO
   else
   begin
      if dbgrdDivergSintet.SelectedList.Count > 0 then
      begin
         for i:=0 to dbgrdDivergSintet.SelectedList.Count-1 do
         begin
            dbgrdDivergSintet.datasource.dataset.GotoBookmark
                                         (dbgrdDivergSintet.SelectedList.items[i]);
            TrataDivergenciaSintetica;
          //=========================
         end;//for
      end
      else

      //TODAS
      begin
         qryleitura.first;
         while not qryleitura.eof do
         begin
            TrataDivergenciaSintetica;
          //=========================
            qryleitura.next;
         end;
      end;
   end;//bindividual

   (*===================================================================
     ESTE TRECHO PRECISA SE REVISTO !!!! (Mauricio 28/2/2000)
     ===================================================================
   if dValorTotal = 0 then
   begin
      //se foi enviado algum alterador
      //para algum registro e ainda assim o valor enviado estiver
      //= a zero, houve um erro
      if  bAlgumAltEnv then
      begin
         memResult.Lines.Add(' Erro no envio dos alteradores para baixa no Controle de Interface, Valor igual a zero.');
         memResult.Lines.Add('');
         ExisteMensagem := true;
         berro := true;
     end;
   end
   else
   begin
      cAux := DecimalSeparator;
      DecimalSeparator := '.';
      AtualizaControleInterface(inttostr(idlote),qryleitura.fieldbyname('mes').AsString,
    //=========================
                                floattostr(dvalortotal),qryleitura.fieldbyname('idpessjur').AsString,inttostr(ordem - 1),
                               'Envio de alteradores para baixa de documentos com divergências ignoradas - '+qryleitura.fieldbyname('mes').AsString+' ');
      DecimalSeparator := cAux;
   end;
     ===================================================================*)

   if not berro then
     result := true;
end;

function TfrmDivergContribAss.TrataIgnora(var qryleitura: TwwQuery): boolean;
var dValor: extended;
    berro: boolean;
begin
   result := false;
   berro := false;

   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add('SELECT VLRACEITADIVERG'+
                   ' FROM CONTRIBASS'+
                  ' WHERE (IDPLANASS = '''+qryleitura.fieldbyname('IDPLANASS').AsString+''')'+
                    ' AND (IDCONTASS = '''+qryleitura.fieldbyname('IDCONTASS').AsString+''')');
   qryaux.open;

   dValor := qryaux.fieldbyname('VLRACEITADIVERG').AsFloat;

   if dValor = 0 then
   begin
     MsgDlg('Valor permitido para divergência não registrado ou = zero..', 'Erro',
            mtError,[mbOk,mbHelp],0);
     berro := true;
   end
   else
   begin
     if qryleitura.fieldbyname('VALORESPERADO').AsFloat <
        qryleitura.fieldbyname('VALORRECEBIDO').AsFloat then //devolução
     begin
        if (qryleitura.fieldbyname('VALORRECEBIDO').AsFloat -
            qryleitura.fieldbyname('VALORESPERADO').AsFloat) <= dValor then
        begin
          AtualizaVlHistorico(qryleitura);
        //===================
          BaixaPendencias(qryleitura);
        //===============
        end
        else
        begin
           memResult.Lines.Add(''+qryleitura.fieldbyname('NOMEPARTICIP').AsString+' - '+
                               ''+qryleitura.fieldbyname('NOMECONTRIB').AsString+' - '+
                               ''+qryleitura.fieldbyname('mes').AsString+' - '+
                               'Valor a ser ignorado['+floattostr(qryleitura.fieldbyname('VALORRECEBIDO').AsFloat -
                               qryleitura.fieldbyname('VALORESPERADO').AsFloat)+'] '+
                               'maior que o permitido['+floattostr(dValor)+'].');
           memResult.Lines.Add('');
           ExisteMensagem := true;
           berro := true;
        end;
     end
     else
     begin
        if (qryleitura.fieldbyname('VALORESPERADO').AsFloat -
            qryleitura.fieldbyname('VALORRECEBIDO').AsFloat) <= dValor then
        begin
          AtualizaVlHistorico(qryleitura);
        //===================
          BaixaPendencias(qryleitura);
        //===============
        end
        else
        begin
           memResult.Lines.Add(''+qryleitura.fieldbyname('NOMEPARTICIP').AsString+' - '+
                               ''+qryleitura.fieldbyname('NOMECONTRIB').AsString+' - '+
                               ''+qryleitura.fieldbyname('mes').AsString+' - '+
                               'Valor a ser ignorado['+floattostr(qryleitura.fieldbyname('VALORESPERADO').AsFloat -
                               qryleitura.fieldbyname('VALORRECEBIDO').AsFloat)+'] '+
                               'maior que o permitido['+floattostr(dValor)+'].');
           memResult.Lines.Add('');
           ExisteMensagem := true;
           berro := true;
        end;
     end;
   end;
   if not berro then
     result := true;
end;

(*
function TfrmDivergContribAss.GravaSituacao(qryleitura: twwquery; sidsitplanoprevdiverg: String): Boolean;
begin
   result := false;

   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.add(' UPDATE PARTASS SET IDSITPART = '''+sidsitplanoprevdiverg+''' '+
                  ' WHERE IDPESSOA = '''+qryleitura.fieldbyname('IDTITULAR').AsString+''' '+
                  ' AND IDPESSJUR = '''+qryleitura.fieldbyname('IDPESSJUR').AsString+''' '+
                  ' AND IDPLANOPREV = '''+qryleitura.fieldbyname('IDPLANOPREV').AsString+''' '+
                  ' AND IDPLANASS = '''+qryleitura.fieldbyname('IDPLANASS').AsString+''' '+
                  ' AND SEQPROPOSTA = '''+qryleitura.fieldbyname('SEQPROPOSTA').AsString+''' ');
   try
      qryaux.execsql;
   except
      memResult.Lines.Add(''+qryleitura.fieldbyname('NOMEPARTICIP').AsString+' - '+
                          ''+qryleitura.fieldbyname('PLANASS').AsString+' - '+
                          'Erro na atualização da situação do Participante no Plano.');
      memResult.Lines.Add('');
      exit;
   end;

   result := true;
end;
*)

procedure TfrmDivergContribAss.DadosdoParticipante1Click(Sender: TObject);
begin
  inherited;
  ConsPart1.MostraConsulta;
end;

procedure TfrmDivergContribAss.ConsPart1Click(Sender: TObject);
begin
  inherited;
  //
  //código do componente
  //
end;

procedure TfrmDivergContribAss.BitBtn2Click(Sender: TObject);
begin
  inherited;
  RichEdAdaptacao.Lines.Text := memresult.Lines.Text;
  RichEdAdaptacao.Print('');
end;

procedure TfrmDivergContribAss.cmbplanassCloseUp(Sender: TObject;
          LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if Trim(cmbplanass.Text) <> '' then
    ckPlanass.Checked := true;
end;

procedure TfrmDivergContribAss.cmbplanassChange(Sender: TObject);
begin
  inherited;
  if tb97Param.Visible then
    tb97Param.Visible := false;
end;

procedure TfrmDivergContribAss.cmbplanassExit(Sender: TObject);
begin
  inherited;
  if Trim(cmbplanass.Text) <> '' then
    ckPlanass.Checked := true;
end;

procedure TfrmDivergContribAss.tb97ParamVisibleChanged(Sender: TObject);
begin
  inherited;
  if (dbgrdDivergAnalit.Visible) and (qryDivergAnalit.active) then
  begin
     Label3.Caption := qryDivergAnalit.fieldbyname('PLANASS').asString;
     Label6.Caption := qryDivergAnalit.fieldbyname('NOMECONTRIB').asString;
  end
  else
    if (dbgrdDivergSintet.Visible) and (qryDivergSintet.active) then
    begin
      Label3.Caption := qryDivergSintet.fieldbyname('PLANASS').asString;
      Label6.Caption := qryDivergSintet.fieldbyname('NOMECONTRIB').asString;
    end;
end;

procedure TfrmDivergContribAss.Marcardesmarcardiverdncia1Click(
  Sender: TObject);
begin
  inherited;
  if dbgrdDivergAnalit.visible then
  begin
    with dbgrdDivergAnalit do
    begin
      if IsSelected then
        UnselectRecord
      else
        SelectRecord;
    end;
  end
  else
  begin
    with dbgrdDivergSintet do
    begin
      if IsSelected then
        UnselectRecord
      else
        SelectRecord;
    end;
  end;
end;

procedure TfrmDivergContribAss.pmnuPopup(Sender: TObject);
var sCaption1, sCaption2: string;
begin
  inherited;
  if dbgrdDivergAnalit.visible then
  begin
    with dbgrdDivergAnalit do
    begin
      if IsSelected then
        sCaption1 := 'Desmarcar divergência'
      else
        sCaption1 := 'Marcar divergência';
      case SelectedList.Count of
        0: sCaption2 := 'TODAS divergências';
        1: sCaption2 := 'Somente a divergência selecionada';
        else sCaption2 := 'Somente as '+IntToStr(SelectedList.Count)
                          +' divergências selecionadas';
      end;
    end;
  end
  else
  begin
    with dbgrdDivergSintet do
    begin
      if IsSelected then
        sCaption1 := 'Desmarcar divergência'
      else
        sCaption1 := 'Marcar divergência';
      case SelectedList.Count of
        0: sCaption2 := 'TODAS divergências';
        1: sCaption2 := 'Somente a divergência selecionada';
        else sCaption2 := 'Somente as '+IntToStr(SelectedList.Count)
                          +' divergências selecionadas';
      end;
    end;
  end;
  Marcardesmarcardiverdncia1.Caption := sCaption1;
  Titulo1.Caption := '[ '+sCaption2+' ]';
end;

end.

