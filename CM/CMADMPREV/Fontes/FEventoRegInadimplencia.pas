// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{-------------------------------------------------------------------------------
DFM         : qryAbreDet
Pendência   : SIG 58182
Responsável : Andre Imakawa
Data        : 20/11/2017
Descrição   : Aplicar filtro de Contribuições na funcionalidade
-------------------------------------------------------------------------------
Alteração  : (dfm) rgOpcao, rdSitPart, rgrpFaixa
Nº SOL.....: 253577-17744
KTN / PPM  : 1063636
Data       : 20/01/2016
Responsável: Edilaine/Helio
DFM        : Inclusão do componente ExtReport
Descrição..: Ajustes para Equacionamento do Deficit - inadimplencia
-------------------------------------------------------------------------------}
// Autor(a)    : William Moreira da Silva
// Data        : 30/08/2012
// Pendência   : SOL 173800 - KTN 1609874
// Alteração   : Permitir escolher o plano no momento do cancelamento
//------------------------------------------------------------------------------
// Autor(a)    : Edilaine Ferraresi
// Data        : 02/02/2012
// Pendência   : SOL 169731 - KTN 1563222
// Rotina      : VerificaeGravaSituacoes
// Alteração   : atualização do campo FlgDesativado na PartPrevPlan quando do
//               cancelamento
//------------------------------------------------------------------------------
// Autor(a)    : Fanuel Junior
// Data        : 06/07/2011
// Pendência   : SOL 159982 Kintana 1345685
// Alteração   : Corrigido a atualização da situação do participante
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 26.08.2004
// Pendencia   : -----
// Rotina      : Verifica e Grava Situacoes
// Descrição   : A rotina passou a ser chamada dentro de um loop, mas tambem
//               estava fazendo um loop
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 26.08.2004
// Pendencia   : -----
// Rotina      : FormShow
// Descrição   : Acerto na exibicao dos criterios de inadimplencia
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 01/04/2004
// Alteração   : Geral
// Descrição   : alterações gerais para acertar a suspensão de contribuições
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 17/02/2004
// Pendência   : 16118
// Alteração   : bbtnDetalheClick
// Descrição   : Inclusão do campo "TOTALDIVIDA" na qryDetalhe
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 16/01/2004
// Alteração   : MontaSQlRegra
// Descrição   : Inclusão do campo PP.FLGDEVEPREVIDENC na query para regra
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 07.01.2003
// Alteração   : MontaSQlRegra
// Pendência   : 15845
// Descrição   : Inclusão dos campos dataevento e datainicio na query para regra
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 10/10/2003
// Alteração   : bbtnConfirmarClick
// Pendência   : 14938
// Descrição   : Inclusão da rotina de impressão da carta do evento
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 29.09.2003
// Alteração   : Permitir que uma pessoa seja registrada/cancelada como inadimplente
//               mesmo que náo tenha contribuiçoes em aberto.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 17.09.2003
// Alteração   : Acerto do erro 'list index out of bounds' e do preenchimento da
//               lista que não funcionava
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : leo
// Data        : 05/07/2002
// Alteração   : troquei as cláusulas where VALORRECEBIDO IS NULL por NVL(VALORRECEBIDO,0) = 0
//------------------------------------------------------------------------------
// Rotina      : MontaSqlRegra
// Autor(a)    : Leo
// Data        : 05/07/2002
// Alteração   : acrescentei o campo INSCRICAODATA
//------------------------------------------------------------------------------
// Rotina      : bbtnDetalheClick
// Autor(a)    : Carlos Guedes
// Data        : 04/07/2002
// Alteração   : Mundando fieldbyname da qrydetalhe.
//------------------------------------------------------------------------------

unit FEventoRegInadimplencia;
                                                                              
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, Spin, ComCtrls, checklst, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti,ppPrvDlg,ppForms, Menus, wwdbdatetimepicker,
  CMDateTimePicker, TXComp, TXRB, QExport3Dialog, ComObj;

type
  TfrmEventoRegInadimplencia = class(TfrmOkCancelar)
    qryAux: TwwQuery;
    Panel1: TPanel;
    grpTempo: TGroupBox;
    Label1: TLabel;
    spedMeses: TSpinEdit;
    Panel2: TPanel;
    bbtnEmitirCarta: TBitBtn;
    bbtnCancelarPart: TBitBtn;
    pnldetalhe: TPanel;
    Label6: TLabel;
    lstvresultado : TListView;
    lblValores: TLabel;
    qryDetalhe: TwwQuery;
    bbtnDetalhe: TBitBtn;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    pnlLista: TPanel;
    Label2: TLabel;
    chklstPatro: TCheckListBox;
    Label7: TLabel;
    chklstPlano: TCheckListBox;
    qryParticip: TwwQuery;
    bbtnVoltarDetalhe: TBitBtn;
    qryGrava: TwwQuery;
    gbContribuicaoInad: TGroupBox;
    spNContrib: TSpinEdit;
    pnlResultado: TPanel;
    Label4: TLabel;
    memResult: TMemo;
    lbPatro: TListBox;
    lbPlano: TListBox;
    lbParticip: TListBox;
    lbRegraOk: TListBox;
    dsAbreDet: TwwDataSource;
    qryAbreDet: TwwQuery;
    pnExibeDetalhe: TPanel;
    lblNome: TLabel;
    lblPlano: TLabel;
    lblPatro: TLabel;
    grdDetalhe: TwwDBGrid;
    Panel3: TPanel;
    btnSaiDet: TBitBtn;
    qryAbreDetIDPESSOA: TFloatField;
    qryAbreDetIDPESSJUR: TFloatField;
    qryAbreDetIDPLANOPREV: TFloatField;
    qryAbreDetMESREFERENCIA: TStringField;
    qryAbreDetDATAPREVISAORECE: TDateTimeField;
    qryAbreDetSITRECEBIMENTO: TStringField;
    qryAbreDetSEQPROPOSTA: TFloatField;
    qryAbreDetVALORESPERADO: TFloatField;
    qryAbreDetNOME: TStringField;
    rdSitPart: TRadioGroup;
    GroupBox1: TGroupBox;
    bbtnProcurar: TBitBtn;
    MontaSelectPart: TMontaSelect;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblSitPatro: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lblParticipante: TLabel;
    lblPatrocinadora: TLabel;
    lblSitFunc: TLabel;
    lblMatricula: TLabel;
    lblPlanoPrev: TLabel;
    lblSitPart: TLabel;
    lblInscricao: TLabel;
    lblSitPlano: TLabel;
    bbtnLimparPart: TBitBtn;
    rgrpDataCancelamento: TGroupBox;
    dtCancelamento: TCMDateTimePicker;
    bbtnMalaDireta: TBitBtn;
    SaveDlg: TSaveDialog;
    memMalaDireta: TMemo;
    pmenuLayOutMalaDireta: TPopupMenu;
    pmnuMostrarLayOut: TMenuItem;
    chklstContrib: TCheckListBox;
    Label13: TLabel;
    rgrpFaixa: TGroupBox;
    dtFaixaIni: TCMDateTimePicker;
    dtFaixaFim: TCMDateTimePicker;
    Label14: TLabel;
    RgOpcao: TGroupBox;
    rbQtdContrib: TRadioButton;
    rbTempoInad: TRadioButton;
    rbNenhum: TRadioButton;
    qryContrib: TwwQuery;
    spdTodos: TSpeedButton;
    spdInverter: TSpeedButton;
    qryPatroIDPESSOA: TFloatField;
    qryPatroNOME: TStringField;
    bbtnGerarAquivo: TBitBtn;
    ExtReport: TExtraOptions;
    qe3dPadrao: TQExport3Dialog;
    chkAtivos: TCheckBox;
    chkMantidosInt: TCheckBox;
    chkMantidosParc: TCheckBox;
    chkAssistidos: TCheckBox;
    chkBPD: TCheckBox;
    chkContribAtrsConsec: TCheckBox;
    lbParticipIdPessoa: TListBox;
    CheckListBox1: TCheckListBox;
    procedure bbtnCancelarPartClick(Sender: TObject);
    procedure bbtnEmitirCartaClick(Sender: TObject);
    procedure bbtnVoltarDetalheClick(Sender: TObject);
    procedure bbtnDetalheClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    //procedure chklstPatroClickCheck(Sender: TObject); //Helio - SOL Nº 253577/17744 PPM Nº 1063636
    procedure FiltraParticipantesSelecionados;
    procedure FormCreate(Sender: TObject);
    procedure lstvresultadoColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure btnSaiDetClick(Sender: TObject);
    procedure lstvresultadoDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnLimparPartClick(Sender: TObject);
    procedure bbtnMalaDiretaClick(Sender: TObject);
    procedure pmnuMostrarLayOutClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure lstvresultadoClick(Sender: TObject);
    procedure rbNenhumClick(Sender: TObject);
    procedure rbQtdContribClick(Sender: TObject);
    procedure rbTempoInadClick(Sender: TObject);
    procedure bbtnGerarAquivoClick(Sender: TObject);
    procedure spdTodosClick(Sender: TObject);
    procedure spdInverterClick(Sender: TObject);
  private
    { Private declarations }
    iIdEventoPrev: integer;
    iIdPessoa,
    iIdPlanoPrev,
    iIdPessJur   : Integer;
    sIdPessoa, sIdPlanoPrev, sIdPessJur, sSeqProposta : string;
    strPatro, strPlano, strParticip : string;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: string;
    sFlgEfetivado, sDataEfetivado: string;
    sGrava: string;
    bPerguntouEmissao,
    bEmiteCartaTodosSele : boolean;

    StrContrib : string; //Helio - SOL Nº 253577/17744 PPM Nº 1063636

    procedure VerificaeGravaSituacoes;
    procedure VerificaEstadoEvento;
    procedure GravaEVENTOSPREV;
    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
    procedure SuspendeContribuicoes;
    procedure MontaSqlRegra(var sSQL : string; pStrContrib, sIdSitPart : string);

    procedure AjustaTela;
    procedure SplitString(sDelimitador, sTexto: string;
      var lstLista: TStringList);
    function ConstruiSQLDemonstrativo: String;
    function TrocaCaracter(aStr, aOld, aNew: String): string; // edilaine - SOL 253577-17744 / PPM 1063636
    function VerificaPreenchimentoDetalhar: boolean;

    //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
    procedure AbreQryDetalheCriInadNenhum;
    procedure AbreQryDetalheCriInadQtdContrib;
    procedure AbreQryDetalheCriInadTempoInad;
    function ObtemCriterioInadSel : Integer;
    function ObtemContribsSelPorVirg: String;
    function ObtemPatrosSelPorVirg: String;
    function ObtemPlanosSelPorVirg: String;
    function ObtemSituacoesSelPorVirg: String;
    procedure AbreQryDetalheCriInadQtdContribConsecutiva;
    procedure AbreQryDetalheCriInadQtdContribNaoConsecutiva;
    procedure CarregaLstvresultado;
    procedure MostraPlnDetalhe;
    procedure GeraAquivosExcel;
    procedure GeraArquivoExcel(pathArquivo, sql : String);
    function ObtemIdPessoaSepVirgual: String;
    function ConstroiSQLDadosFixos(idPessoaSepVirg: String): String;
    function ConstroiSQLDadosVariaveis(idPessoaSepVirg: String): String;
    procedure GeraArquivoExcelDadosFixos(pathArquivo : string);
    procedure GeraArquivoExcelDadosVariaveis(pathArquivo: string);
    //function Tem3ContribEmAtraso(idPessoaSep : String) : Boolean;
    //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

  public
     iValidaChecks, aux: Integer;//William Moreira da Silva SOL 173800 KTN 1609874
    { Public declarations }
  end;

var
  frmEventoRegInadimplencia: TfrmEventoRegInadimplencia;

implementation

uses
  UMensErro, DBaseDados, FTelaAut, UAdmPrev, UDataBase, 
  FLerSituacaoPlano, UEventos, fAguarde, UDotacao, DRelatAdmPrev,
  DAPrev, UFuncoesUteis, FMostraAux, Usistema,
  uVerificaPreenchimento, FileCtrl; //Helio - SOL Nº 253577/17744 PPM Nº 1063636

//Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
const
      CRITERIO_INAD_QTD_CONTRIB = 0;
      CRITERIO_INAD_TEMPO_INAD = 1;
      CRITERIO_INAD_NENHUM = 2;
//Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

{$R *.DFM}

procedure TfrmEventoRegInadimplencia.FormActivate(Sender: TObject);
begin
  inherited;
  qryPatro.Close; qryPatro.Open;
  qryPlano.Close; qryPlano.Open;

  

 {Preencher chkList da Patrocinadora}
  qryPatro.Close; qryPatro.Open;
  CriaLista(chkLstPatro, qryPatro);

 {Preenche ChkList dos Planos}
  qryPlano.Close; qryPlano.Open;
   CriaLista(chklstPlano, qryPlano);

  // edilaine - SOL 253577-17744 / PPM 1063636 - inicio
  {RNG014 - deverá apresentar todas as contribuições cadastradas por ordem alfabética }
  qryContrib.Close;
  qryContrib.Open;
   CriaLista(chklstContrib, qryContrib);
  // edilaine - SOL 253577-17744 / PPM 1063636 - fim
end;

procedure TfrmEventoRegInadimplencia.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
begin
  chkListX.Items.Clear;
  with qryLista do
  begin
     while not eof do
     begin
        chkListX.Items.Add(FieldByName('Nome').AsString);
        Next;
     end;
  end;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
//procedure TfrmEventoRegInadimplencia.chklstPatroClickCheck(Sender: TObject);
//var
//  i : integer;
//begin
// {Preenche ChkList dos Planos da Patrocinadora Selecionada}
//  qryPlano.Close;
//  qryPlano.SQL.Clear;
//  strPatro := ' ';
//
//  for i := 0 to chklstPatro.Items.Count - 1 do
//     if chklstPatro.checked[i] then
//       begin
//           if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive, loPartialKey]) then
//              strPatro := strPatro + qryPatro.FieldByName('IDPESSOA').AsString+ ', ';
//       end;
//
//  if Trim(strPatro) <> '' then
//     begin
//          strPatro := Copy(strPatro, 1, Length(strPatro) - 2);
//          qryPlano.SQL.Add(' SELECT DISTINCT PP.IDPLANOPREV, PP.NOME '+
//                           ' FROM PLANPREV PP, PLANPREVPATRO PPP '+
//                           ' WHERE PP.IDPLANOPREV = PPP.IDPLANOPREV AND ' +
//                           '       PPP.IDPESSJUR  IN ( '+strPatro+') '+
//                           ' ORDER BY PP.NOME')
//     end
//  else
//     qryPlano.SQL.Add(' SELECT * FROM PLANPREV ORDER BY NOME ');
//
//  qryPlano.Open;
//  CriaLista(chklstPlano,qryPlano);
//end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.bbtnDetalheClick(Sender: TObject);
var
     criterioInadSel : Integer;
begin
      criterioInadSel := ObtemCriterioInadSel;

      if VerificaPreenchimentoDetalhar then
      begin
             frmAguarde.Mostra('Avaliando Inadimplências. ');

             try
               case criterioInadSel of
                     CRITERIO_INAD_QTD_CONTRIB : AbreQryDetalheCriInadQtdContrib;
                     CRITERIO_INAD_TEMPO_INAD  : AbreQryDetalheCriInadTempoInad;
                     CRITERIO_INAD_NENHUM      : AbreQryDetalheCriInadNenhum;
               end;

               CarregaLstvresultado;
               MostraPlnDetalhe;
             finally
               frmAguarde.Apaga;
             end;
      end;
end;

//Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636 - COMENTA
//procedure TfrmEventoRegInadimplencia.bbtnDetalheClick(Sender: TObject);
//var
//  sSQL, sMesReferencia,
//  StrNomeContrib, sRegraOk : string;
//  sNomeParticip,    sMatricula,
//  sInscricaoNumero, sPlano,
//  sPatrocinadora,   sSituacao, sSitFundacao : string;
//  iLista  : TListItem;
//  i, iCont,
//  iIdContribuicao : Integer;
//  bErro           : Boolean;
//
//  //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
//  sSQLDependente : String;
//  chkSituacaoSelecionado : Boolean;
//  jaTeveTextoChkSit : Boolean;
//  //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636
//
//begin
//  inherited;
//  bPerguntouEmissao := False;
//
//  lstvResultado.Items.Clear;
//
//  pnlDetalhe.Visible        := True;
//  pnlDetalhe.BringToFront;
//  bbtnDetalhe.Visible       := False;
//  bbtnVoltarDetalhe.Visible := True;
//
//  //bbtnEmitirCarta.Visible  := True;  //Helio - SOL Nº 253577/17744 PPM Nº 1063636
//  //bbtnMalaDireta.Visible   := True; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
//  bbtnGerarAquivo.Visible  := True; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
//
//  iValidaChecks := 0;
//
//  // Preencher string com Id's das patrocinadoras selecionadas
//  strPatro := '';
//  for i := 0 to chklstPatro.Items.Count - 1 do
//      if chklstPatro.checked[i] then
//         begin
//            if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive, loPartialKey]) then
//               strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
//         end;
//
//  if Trim(strPatro) <> '' then
//     strPatro := Copy(strPatro, 1, Length(strPatro) - 2);
// {Fim - Preencher string com Id's das patrocinadoras selecionadas}
//
//
// {Preencher string com Id's dos planos selecionados}
//  strPlano := '';
//  for i := 0 to chklstPlano.Items.Count - 1 do
//      if chklstPlano.checked[i] then
//         begin
//             if qryPlano.Locate('Nome',chklstPlano.Items[i],[loCaseInsensitive, loPartialKey]) then
//                strPlano := strPlano + qryPlano.FieldByName('IdPlanoPrev').AsString+ ', ';
//         end;
//
//  if Trim(strPlano) <> '' then
//     strPlano := Copy(strPlano, 1, Length(strPlano) - 2);
// {Fim - Preencher string com Id's dos planos selecionados}
//
//  //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
//  //Preenche string com Id's das contribuicoes selecionadas
//  strContrib := '';
//  for i := 0 to chklstContrib.Items.Count - 1 do
//      if chklstContrib.checked[i] then
//         begin
//             if qryContrib.Locate('Nome',chklstContrib.Items[i],[loCaseInsensitive, loPartialKey]) then
//                strContrib := strContrib + qryContrib.FieldByName('IDCONTRIBUICAO').AsString+ ', ';
//         end;
//
//  if Trim(strContrib) <> '' then
//     strContrib := Copy(strContrib, 1, Length(strContrib) - 2);
//  //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636
//
//
//  // edilaine - SOL 253577-17744 / PPM 1063636 - inicio
//  if (sIdPessoa = '') or (sIdPessoa = '-1') then
//  begin
//    {RNG01 - A seleção da patrocinadora será sempre obrigatória para processamento para mais de um participante}
//    if Trim(strPatro) = '' then
//    begin
//      MsgDlg('É necessário selecionar pelo menos uma patrocinadora.','Erro',mtError,[mbOk,mbHelp],0);
//      exit;
//    end;
//
//    {RNG02 - A seleção do plano será sempre obrigatória para processamento para mais de um participante}
//    if Trim(strPlano) = '' then
//    begin
//      MsgDlg('É necessário selecionar pelo menos um plano previdenciário.','Erro',mtError,[mbOk,mbHelp],0);
//      exit;
//    end;
//
//    {RNG15 - A data inicial e data final são obrigatórias}
//    if (dtFaixaIni.text = '') then
//    begin
//      MsgDlg('A data inicial deverá ser informada.','Erro',mtError,[mbOk,mbHelp],0);
//      dtFaixaIni.setFocus;
//      exit;
//    end;
//
//    if (dtFaixaFim.text = '') then
//    begin
//      MsgDlg('A data final deverá ser informada.','Erro',mtError,[mbOk,mbHelp],0);
//      dtFaixaFim.setFocus;
//      exit;
//    end;
//
//    if (dtFaixaIni.date > dtFaixaFim.date) then
//    begin
//      MsgDlg('A data inicial deverá ser menor ou igual a data final.','Erro',mtError,[mbOk,mbHelp],0);
//      dtFaixaIni.setFocus;
//      exit;
//    end;
//
//  end;
//  // edilaine - SOL 253577-17744 / PPM 1063636 - fim
//
//
//  frmAguarde.Mostra('Avaliando Inadimplências. ');
//
//  if cmbMes.ItemIndex = -1 then
//    cmbMes.ItemIndex := 0;
//
//  sMesReferencia := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) +
//                    Copy(FormatDateTime('dd/mm/yyyy', Date),3,3);
//
//  //William Moreira da Silva SOL 173800 KTN 1609874
//  for i:= 0 to chklstPatro.Items.Count-1 do
//      if chklstPatro.Checked[i] then
//         inc(iValidaChecks);
//
//  if iValidaChecks = 0 then
//  begin
//       for i := 0 to chklstPlano.Items.Count-1 do
//           if chklstPlano.Checked[i] then
//              inc(iValidaChecks);
//  end;
//  //William Moreira da Silva SOL 173800 KTN 1609874
//
//  // Se o usuario indicar um participante especifico e optar por nenhum criterio de inadimplencia
//  // não exigir que haja HSTCONTRIB
//  //if (RgOpcao.ItemIndex = 2) and (sIdPessoa <> '') and (sIdPessoa <> '-1')      // edilaine - SOL 253577-17744 / PPM 1063636 - comentado
//  if (rbNenhum.checked) and (sIdPessoa <> '') and (sIdPessoa <> '-1')             // edilaine - SOL 253577-17744 / PPM 1063636
//  then begin
//     sSQL := ' SELECT                                                                             '+
//             '        DISTINCT HST.MESREFERENCIA, ST.FLGINTERNO, PES.NOME AS PARTICIPANTE,        '+
//             '        PES.NOME, PATRO.NOME AS PATROCINADORA,                                      '+
//             '        PL.NOME AS PLANO,    EL.MATRICULA,       PES.IDPESSOA,                      '+
//             '        EL.IDPESSJUR,  PL.IDPLANOPREV,                                              '+
//             '        ST.IDSITPART,        ST.FLGINTERNO,                                         '+
//             '        PAR.INSCRICAONUMERO, SP.DESCRICAO AS SITUACAOPLANO,                         '+
//             '        ST.DESCRICAO AS SITUACAOFUND,                                               '+
//             '        SUM(DECODE(HST.FLGDEVOLUCAO,1,-HST.VALORESPERADO,HST.VALORESPERADO)) AS TOTALDIVIDA '+
//             ' FROM   PARTPREVPLAN PAR,                                                           '+
//             '        HSTCONTRIBPREV HST, CONTRIBPREVPARTP CPP, PLANPREV PL,                      '+
//             '        PESSOA PES,      ELEGPATRO EL,     PESSOA PATRO,                            '+
//             '        SITPART  ST,        SITPLANOPREV SP                                         '+
//             '        , DEPENTIT DE '+ //Helio - SOL Nº 253577/17744 PPM Nº 1063636
//             ' WHERE (PAR.IDPESSOA          = '+sIdPessoa    +')';
//
//             //William Moreira da Silva SOL 173800 KTN 1609874
//             if iValidaChecks > 0 then
//             begin
//                  sSQL := sSQL  + ' AND (PAR.IDPESSJUR           = '+sIdPessJur   +')'+
//                                  ' AND   (PAR.IDPLANOPREV       = '+sIdPlanoPrev +')';
//             end
//
//             else
//             begin
//                  sSQL := sSQL + ' AND   (PAR.SEQPROPOSTA       = '+sSeqProposta +')';
//             end;
//             //William Moreira da Silva SOL 173800 KTN 1609874
//
//             sSQL := sSQL + ' AND   (PATRO.IDPESSOA        = PAR.IDPESSJUR)                     '+
//             ' AND   (PES.IDPESSOA          = PAR.IDPESSOA)                      '+
//             ' AND   (CPP.IDPESSJUR         = PAR.IDPESSJUR)                     '+
//             ' AND   (CPP.IDPLANOPREV       = PAR.IDPLANOPREV)                   '+
//             ' AND   (CPP.IDPESSOA          = PAR.IDPESSOA)                      '+
//             ' AND   (CPP.SEQPROPOSTA       = PAR.SEQPROPOSTA)                   ';
//
//             //William Moreira da Silva SOL 173800 KTN 1609874
//             if iValidaChecks > 0
//             then sSQL := sSQL + ' AND   (HST.IDPESSJUR(+)      = '+sIdPessJur   +')';
//             //William Moreira da Silva SOL 173800 KTN 1609874
//
//             sSQL := sSQL + ' AND   (HST.IDPLANOPREV(+)    = '+sIdPlanoPrev +')'+
//             ' AND   (HST.IDPESSJUR(+)      = CPP.IDPESSJUR)                     '+
//             ' AND   (HST.IDPLANOPREV(+)    = CPP.IDPLANOPREV)                   '+
//             ' AND   (HST.IDPESSOA(+)       = CPP.IDPESSOA)                      '+
//             ' AND   (HST.SEQPROPOSTA(+)    = CPP.SEQPROPOSTA)                   '+
//             ' AND   (HST.IDCONTRIBUICAO(+) = CPP.IDCONTRIBUICAO)                '+
//             ' AND   (EL.IDPESSJUR          = PAR.IDPESSJUR)                     '+
//
//             //Helio - SOL Nº 253577/17744 PPM Nº 1063636
//             //' AND   (EL.IDPESSOA           = PAR.IDPESSOA)                      '+
//             ' AND   (DE.IDPESSOA           = HST.IDPESSOA)                      '+
//             ' AND   (EL.IDPESSOA           = DE.IDTITULAR)                      '+
//             //Helio - SOL Nº 253577/17744 PPM Nº 1063636
//
//             ' AND   (PL.IDPLANOPREV        = CPP.IDPLANOPREV)                   '+
//             ' AND   (PL.IDPLANOPREV        = PAR.IDPLANOPREV)                   '+
//             ' AND   (PAR.IDSITPART         = ST.IDSITPART)                      '+
//             ' AND   (PAR.IDSITPLANOPREV   = SP.IDSITPLANOPREV)                  '+
//             ' AND   (SP.DESCRICAO <> ''CANCELADO'')                             ';
//
//
//       if sFlgInterno = 'RI'
//       then sSQL := sSQL + ' AND (SP.FLGINTERNO NOT IN (''IN'', ''CI'') ) '
//       else sSQL := sSQL + ' AND (SP.FLGINTERNO NOT IN (''CI'') ) ';
//       sSQL := sSQL +
//             ' GROUP BY HST.MESREFERENCIA, ST.FLGINTERNO, PES.NOME, PES.NOME, PATRO.NOME,   '+
//             '          PL.NOME, EL.MATRICULA, PES.IDPESSOA, EL.IDPESSJUR,  PL.IDPLANOPREV, '+
//             '          ST.IDSITPART, ST.FLGINTERNO, PAR.INSCRICAONUMERO, SP.DESCRICAO,     '+
//             '          ST.DESCRICAO                                                        '+
//             ' ORDER BY EL.MATRICULA , HST.MESREFERENCIA ';
//  end
//  else begin
//     sSQL := ' SELECT      '+
//             '        DISTINCT HST.MESREFERENCIA, ST.FLGINTERNO, PES.NOME AS PARTICIPANTE, PES.NOME, PATRO.NOME AS PATROCINADORA, '+
//             '        PL.NOME AS PLANO,    EL.MATRICULA,       PES.IDPESSOA,       EL.IDPESSJUR,  PL.IDPLANOPREV,       '+
//             '        ST.IDSITPART,        ST.FLGINTERNO,                                           '+
//             '        PAR.INSCRICAONUMERO, SP.DESCRICAO AS SITUACAOPLANO,  ST.DESCRICAO AS SITUACAOFUND, '+
//             '        SUM(DECODE(HST.FLGDEVOLUCAO,1,-HST.VALORESPERADO,HST.VALORESPERADO)) AS TOTALDIVIDA '+
//             'FROM   PARTPREVPLAN PAR,                                         '+
//             '       HSTCONTRIBPREV HST, CONTRIBPREVPARTP CPP, PLANPREV PL,    '+
//             '       PESSOA PES,      ELEGPATRO EL,     PESSOA PATRO,          '+
//             '       SITPART  ST,        SITPLANOPREV SP      '+
//             '        , DEPENTIT DE '+ //Helio - SOL Nº 253577/17744 PPM Nº 1063636
//             'WHERE  (HST.MESCOBRANCA <= ''' + Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' + Copy(FormatDateTime('dd/mm/yyyy', Date),4,2) + ''')';
//
//     if (sIdPessoa <> '') and (sIdPessoa <> '-1')
//     then begin
//        if iValidaChecks > 0
//           then sSQL := sSQL + ' AND (HST.IDPESSJUR   = '+sIdPessJur   +')';//William Moreira da Silva SOL 173800 KTN 1609874
//        sSQL := sSQL + ' AND (HST.IDPLANOPREV = '+sIdPlanoPrev +')';
//     end
//     else begin
//         if Trim(strPatro) <> ''
//         then sSQL := sSQL + ' AND (CPP.IDPESSJUR   IN (' + strPatro + ')) ';
//
//         if Trim(strPlano) <> ''
//         then sSQL := sSQL + ' AND (CPP.IDPLANOPREV IN (' + strPlano + ')) ';
//
//         //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
//         if Trim(strContrib) <> ''
//         then sSQL := sSQL + ' AND (CPP.IDCONTRIBUICAO IN (' + strContrib + ')) ';
//         //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636
//
//     end;
//
//     if (sIdPessoa = '') or (sIdPessoa = '-1')
//     then sSQL := sSQL + 'AND    ((HST.VALORRECEBIDO IS NULL) OR (HST.VALORRECEBIDO = 0)) '+
//                         'AND    (HST.FLGDEVOLUCAO     = 0)                               ';
//
//
//
//     sSQL := sSQL + 'AND    (PATRO.IDPESSOA     = HST.IDPESSJUR)                     '+
//                    'AND    (PES.IDPESSOA       = HST.IDPESSOA)                      '+
//                    'AND    (CPP.IDPESSJUR      = HST.IDPESSJUR)                     '+
//                    'AND    (CPP.IDPLANOPREV    = HST.IDPLANOPREV)                   '+
//                    'AND    (CPP.IDPESSOA       = HST.IDPESSOA)                      '+
//                    'AND    (CPP.SEQPROPOSTA    = HST.SEQPROPOSTA)                   '+
//                    'AND    (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)                '+
//                    'AND    (PAR.IDPESSJUR      = HST.IDPESSJUR)                     '+
//                    'AND    (PAR.IDPLANOPREV    = HST.IDPLANOPREV)                   '+
//                    'AND    (PAR.IDPESSOA       = HST.IDPESSOA)                      '+
//                    'AND    (PAR.SEQPROPOSTA    = HST.SEQPROPOSTA)                   '+
//                    'AND    (EL.IDPESSJUR       = PAR.IDPESSJUR)                     '+
//
//                    //Helio - SOL Nº 253577/17744 PPM Nº 1063636
//                    //' AND   (EL.IDPESSOA           = PAR.IDPESSOA)                      '+
//                    ' AND   (DE.IDPESSOA           = HST.IDPESSOA)                      '+
//                    ' AND   (EL.IDPESSOA           = DE.IDTITULAR)                      '+
//                    //Helio - SOL Nº 253577/17744 PPM Nº 1063636
//
//                    'AND    (PL.IDPLANOPREV     = CPP.IDPLANOPREV)                   '+
//                    'AND    (PL.IDPLANOPREV     = PAR.IDPLANOPREV)                   '+
//                    'AND    (PAR.IDSITPART      = ST.IDSITPART)                      '+
//                    'AND    (PAR.IDSITPLANOPREV = SP.IDSITPLANOPREV)                 ';
//
//     if (sIdPessoa <> '') and (sIdPessoa <> '-1')
//     then begin
//        if iValidaChecks > 0
//           then sSQL := sSQL + ' AND (HST.IDPESSJUR   = '+sIdPessJur   +')';//William Moreira da Silva SOL 17800 KTN 1609874
//       sSQL := sSQL + ' AND (HST.IDPLANOPREV = '+sIdPlanoPrev +')';
//       sSQL := sSQL + ' AND (HST.IDPESSOA    = '+sIdPessoa    +')';
//       sSQL := sSQL + ' AND (HST.SEQPROPOSTA = '+sSeqProposta +')';
//     end
//     else begin
//        //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
//        //if rdSitPart.ItemIndex = 0
//        //then sSQL    := sSQL + ' AND (ST.FLGINTERNO = ''AT'' ) '
//        //else if rdSitPart.ItemIndex = 1
//        //     then sSQL    := sSQL + ' AND (ST.FLGINTERNO = ''MA'' ) '
//        //else if rdSitPart.ItemIndex = 2        // edilaine - SOL 253577-17744 / PPM 1063636 - inicio
//        //     then sSQL    := sSQL + ' AND (ST.FLGINTERNO = ''MP'' ) '
//        //else if rdSitPart.ItemIndex = 3
//        //     then sSQL    := sSQL + ' AND (ST.FLGINTERNO = ''AS'' ) '
//        //     else sSQL    := sSQL + ' AND (ST.FLGINTERNO = ''MS'' ) ';
//
//
//        jaTeveTextoChkSit := false;
//        if (chkAtivos.Checked) or
//           (chkMantidosInt.Checked) or
//           (chkMantidosParc.Checked) or
//           (chkAssistidos.Checked) or
//           (chkBPD.Checked) then
//              chkSituacaoSelecionado := True
//        else
//              chkSituacaoSelecionado := false; 
//
//
//        if chkSituacaoSelecionado then
//               sSQL    := sSQL + ' AND (';
//
//        if chkAtivos.Checked then
//        begin
//             sSQL    := sSQL + ' (ST.FLGINTERNO = ''AT'' ) ';
//             jaTeveTextoChkSit := True;
//        end;
//
//        if chkMantidosInt.Checked then
//        begin
//             if jaTeveTextoChkSit then sSQL := sSQL + ' or';
//             sSQL    := sSQL + ' (ST.FLGINTERNO = ''MA'' ) ';
//             jaTeveTextoChkSit := True;
//        end;
//
//        if chkMantidosParc.Checked then // edilaine - SOL 253577-17744 / PPM 1063636 - inicio
//        begin
//             if jaTeveTextoChkSit then sSQL := sSQL + ' or';
//             sSQL    := sSQL + ' (ST.FLGINTERNO = ''MP'' ) ';
//             jaTeveTextoChkSit := True;
//        end;
//
//        if chkAssistidos.Checked then
//        begin
//             if jaTeveTextoChkSit then sSQL := sSQL + ' or';
//             sSQL    := sSQL + ' (ST.FLGINTERNO = ''AS'' ) ';
//             jaTeveTextoChkSit := True;
//        end;
//
//        if chkBPD.Checked then
//        begin
//             if jaTeveTextoChkSit then sSQL := sSQL + ' or';
//             sSQL    := sSQL + ' (ST.FLGINTERNO = ''MS'' ) ';
//             jaTeveTextoChkSit := True;
//        end;
//
//        if chkSituacaoSelecionado then
//        begin
//               sSQL    := sSQL + ')';
//               jaTeveTextoChkSit := True;
//        end;
//        //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636
//        // edilaine - SOL 253577-17744 / PPM 1063636 - inicio
//
//     end;
//
//     if sFlgInterno = 'RI'
//     then sSQL := sSQL + ' AND (SP.FLGINTERNO NOT IN (''IN'', ''CI'') ) '
//     else sSQL := sSQL + ' AND (SP.FLGINTERNO NOT IN (''CI'') ) ';
//
//     if {(RgOpcao.ItemIndex = 1)} rbTempoInad.checked    // edilaine - SOL 253577-17744 / PPM 1063636
//     then begin
//        // Quantidade de meses
//        sSQL := sSQL + ' AND TRUNC(MONTHS_BETWEEN(SYSDATE,HST.DATAPREVISAORECE),0) ' + cmbmes.Text + ' ' + IntToStr(spedMeses.Value);
//        sSQL := sSQL +
//             ' GROUP BY HST.MESREFERENCIA, ST.FLGINTERNO, PES.NOME, PES.NOME, PATRO.NOME, '+
//             '        PL.NOME, EL.MATRICULA, PES.IDPESSOA, EL.IDPESSJUR, PL.IDPLANOPREV, ST.IDSITPART,   '+
//             '        ST.FLGINTERNO, PAR.INSCRICAONUMERO, SP.DESCRICAO, ST.DESCRICAO, PL.NOME '+//William Moreira da Silva SOL 173800 KTN 1609874
//             ' ORDER BY EL.MATRICULA  ';
//     end
//     else sSQL    := sSQL +
//             ' GROUP BY HST.MESREFERENCIA, ST.FLGINTERNO, PES.NOME, PES.NOME, PATRO.NOME, '+
//             '        PL.NOME, EL.MATRICULA, PES.IDPESSOA, EL.IDPESSJUR, PL.IDPLANOPREV, ST.IDSITPART,   '+
//             '        ST.FLGINTERNO, PAR.INSCRICAONUMERO, SP.DESCRICAO, ST.DESCRICAO, PL.NOME '+//William Moreira da Silva SOL 173800 KTN 1609874
//             ' ORDER BY EL.MATRICULA , HST.MESREFERENCIA ';
//
//   end;
//
//   qryDetalhe.Close;
//   qryDetalhe.SQL.Clear;
//   qryDetalhe.SQL.Add(sSQL);
//
//   try
//      qryDetalhe.open;
//   except
//      on E:EDBEngineError do
//      begin
//        MostrarErro(E);
//        frmAguarde.Apaga;
//        Exit;
//      end;
//   end;
//
//   if qryDetalhe.IsEmpty
//   then begin
//      MsgDlg('Não existem Participantes inadimplentes com as opções indicadas.','Erro',mtError,[mbOk,mbHelp],0);
//      pnlDetalhe. Visible       := False;
//      bbtnDetalhe.Visible       := True;
//      bbtnVoltarDetalhe.Visible := False;
//      bbtnEmitirCarta.Visible   := False;
//      bbtnMalaDireta.Visible    := False;
//      bbtnCancelarPart.Visible  := False;
//
//      bbtnGerarAquivo.Visible := False;//Helio - SOL Nº 253577/17744 PPM Nº 1063636
//
//      TiraSql(qryAux);
//      frmAguarde.Apaga;
//      Exit;
//   end;
//
//  if sFlgInterno <> 'RI' then bbtnCancelarPart.Visible := True;
//
//  memResult.Clear;
//  memResult.Lines.Add('-----------------------------------------------------------------------------------------------------------------------------------------------------------');
//  memResult.Lines.Add('Participantes não Aprovados na Regra de Cancelamento Por Inadimplência');
//  memResult.Lines.Add('-----------------------------------------------------------------------------------------------------------------------------------------------------------');
//  memResult.Lines.Add('');
//
//  lbParticip.Clear;
//  lbPlano.Clear;
//  lbPatro.Clear;
//
//  qryDetalhe.First;
//  if {(RgOpcao.ItemIndex = 1)} rbTempoInad.checked    // TEMPO DE INADIMPLENCIA    // edilaine - SOL 253577-17744 / PPM 1063636
//  then begin
//     {lstvresultado.Columns[0].Caption := 'Participante';
//     lstvresultado.Columns[1].Caption := 'Cancelado Regra';
//     lstvresultado.Columns[2].Caption := 'Matrícula';
//     lstvresultado.Columns[3].Caption := 'Inscrição';
//     lstvresultado.Columns[4].Caption := 'Mês Referência';
//     lstvresultado.Columns[5].Caption := 'Valor Esperado(+)';
//     lstvresultado.Columns[6].Caption := 'Plano';
//     lstvresultado.Columns[7].Caption := 'Patrocinadora';
//     lstvresultado.Columns[8].Caption := 'Situação no Plano';
//     lstvresultado.Columns[9].Caption := 'Situação na Fundação';}
//
//     //William Moreira da Silva SOL 173800 KTN 1609874
//     lstvresultado.Columns[0].Caption := 'Participante';
//     lstvresultado.Columns[1].Caption := 'Plano';
//     lstvresultado.Columns[2].Caption := 'Cancelado Regra';
//     lstvresultado.Columns[3].Caption := 'Matrícula';
//     lstvresultado.Columns[4].Caption := 'Inscrição';
//     lstvresultado.Columns[5].Caption := 'Mês Referência';
//     lstvresultado.Columns[6].Caption := 'Valor Esperado(+)';
//     lstvresultado.Columns[7].Caption := 'Patrocinadora';
//     lstvresultado.Columns[8].Caption := 'Situação no Plano';
//     lstvresultado.Columns[9].Caption := 'Situação na Fundação';
//     //William Moreira da Silva SOL 173800 KTN 1609874
//
//     while not qryDetalhe.EOF do
//     begin
//        sRegraOk := '[    ]';
//        MontaSqlRegra(sSQL, '', qryDetalhe.FieldbyName('IDSITPART').AsString);
//
//        if (qryAux.FieldByName('IDREGRACANCELAME').AsString <> '') and
//           (not qryAux.IsEmpty)
//        then begin
//           bErro := False;
//           try
//              if not RegraBooleana(qryAux.FieldByName('IDREGRACANCELAME').AsString,sSQL,bErro)
//              then memResult.Lines.Add(sNomeParticip+' não aprovado pela regra de cancelamento por inadimplência.')
//              else sRegraOk := '[ OK ]';
//
//              if bErro
//              then begin
//                 memResult.Lines.Add(sNomeParticip+' - erro na execução da regra de cancelamento por inadimplência.');
//                 qryDetalhe.Next;
//                 Continue;
//              end;
//           except
//              memResult.Lines.Add(sNomeParticip+' - erro na execução da regra de cancelamento por inadimplência.');
//              qryDetalhe.Next;
//              Continue;
//           end;
//        end;
//
//        iLista          := lstvResultado.items.add;
//        iLista.Caption  :=  qryDetalhe.FieldbyName('PARTICIPANTE').AsString;//William Moreira da Silva SOL 173800 KTN 1609874
//        iLista.SubItems.Add(sRegraOk);
//        iLista.SubItems.Add(qryDetalhe.FieldbyName('PLANO').AsString); //William Moreira da Silva SOL 173800 KTN 1609874
//        iLista.SubItems.Add(qryDetalhe.FieldbyName('MATRICULA').AsString);
//        iLista.SubItems.Add(qryDetalhe.FieldbyName('INSCRICAONUMERO').AsString);
//        iLista.SubItems.Add(qryDetalhe.FieldbyName('MESREFERENCIA').AsString);
//        iLista.SubItems.Add(qryDetalhe.FieldbyName('TOTALDIVIDA').AsString);
//        iLista.SubItems.Add(qryDetalhe.FieldbyName('PARTICIPANTE').AsString);
//        iLista.SubItems.Add(qryDetalhe.FieldbyName('PATROCINADORA').AsString);
//        iLista.SubItems.Add(qryDetalhe.FieldbyName('SITUACAOPLANO').AsString);
//
//        lbParticip.Items.Add(qryDetalhe.FieldByName('IDPESSOA').AsString);
//        lbPlano.Items.Add(qryDetalhe.FieldByName('IDPLANOPREV').AsString);
//        lbPatro.Items.Add(qryDetalhe.FieldByName('IDPESSJUR').AsString);
//        //William Moreira da Silva SOL 173800 KTN 1609874
//
//        qryDetalhe.Next;
//     end;
//  end
//  else begin // NUMERO DE CONTRIBUICOES
//     lstvresultado.Columns[0].Caption := 'Participante';//William Moreira da Silva SOL 173800 KTN 1609874
//     lstvresultado.Columns[1].Caption := 'Plano';
//     lstvresultado.Columns[2].Caption := 'Cancelado Regra';
//     lstvresultado.Columns[3].Caption := 'Matrícula';
//     lstvresultado.Columns[4].Caption := 'Inscrição';
//     lstvresultado.Columns[5].Caption := 'No. Contrib';
//     lstvresultado.Columns[6].Caption := 'Contribuições';//William Moreira da Silva SOL 173800 KTN 1609874
//     lstvresultado.Columns[7].Caption := 'Patrocinadora';
//     lstvresultado.Columns[8].Caption := 'Situação no Plano';
//     lstvresultado.Columns[9].Caption := 'Situação na Fundação';
//     //qryDetalhe.SQL.SaveToFile('C:\qryDetalhe.txt');//William Moreira da Silva SOL 173800 KTN 1609874
//
//     while not qryDetalhe.EOF do
//     begin
//        iIdPessJur      := qryDetalhe.FieldByName('IDPESSJUR').AsInteger;
//        iIdPlanoPrev    := qryDetalhe.FieldByName('IDPLANOPREV').AsInteger;
//        iIdPessoa       := qryDetalhe.FieldByName('IDPESSOA').AsInteger;
//
//        //Inicio - SOL Nº 253577/17744 PPM Nº 1063636
//        //StrContrib      := '';
//        //StrNomeContrib  := '';
//        //Fim - SOL Nº 253577/17744 PPM Nº 1063636
//
//        iCont           := 0;
//
//
//        while (not qryDetalhe.EOF) and
//              (iIdPessJur      = qryDetalhe.FieldByName('IDPESSJUR').AsInteger)      and
//              (iIdPlanoPrev    = qryDetalhe.FieldByName('IDPLANOPREV').AsInteger)    and
//              (iIdPessoa       = qryDetalhe.FieldByName('IDPESSOA').AsInteger)
//        do begin
//           Inc(iCont);
//
//           //if (qryDetalhe.FieldByName('SITUACAOPLANO').asString <> 'CANCELADO') then//William Moreira da Silva SOL 173800 KTN 1609874
//           //begin
//           sNomeParticip    := qryDetalhe.FieldbyName('PARTICIPANTE').AsString;
//           sMatricula       := qryDetalhe.FieldbyName('MATRICULA').AsString;
//           sInscricaoNumero := qryDetalhe.FieldbyName('INSCRICAONUMERO').AsString;
//           sPlano           := qryDetalhe.FieldbyName('PLANO').AsString;
//           sPatrocinadora   := qryDetalhe.FieldbyName('PATROCINADORA').AsString;
//           sSituacao        := qryDetalhe.FieldbyName('SITUACAOPLANO').AsString;
//           sSitFundacao     := qryDetalhe.FieldbyName('SITUACAOFUND').AsString;
//           //end;
//
//           qryDetalhe.Next;
//        end;
//
//        if iCont >= spNContrib.Value // Se contrib. >= ao informado Filtrar
//        then begin
//           // Rodar a Regra de Cancelamento por inadimplancia para cada participante
//           sRegraOk := '[    ]';
//           MontaSqlRegra(sSQL, '', qryDetalhe.FieldbyName('IDSITPART').AsString);
//
//           if (qryAux.FieldByName('IDREGRACANCELAME').AsString <> '') and
//              (not qryAux.IsEmpty)
//           then begin
//              bErro := False;
//              try
//                 if not RegraBooleana(qryAux.FieldByName('IDREGRACANCELAME').AsString,sSQL,bErro)
//                 then memResult.Lines.Add(sNomeParticip+' não aprovado pela regra de cancelamento por inadimplência.')
//                 else sRegraOk := '[ OK ]';
//
//                 if bErro
//                 then begin
//                    memResult.Lines.Add(sNomeParticip+' - erro na execução da regra de cancelamento por inadimplência.');
//                    qryDetalhe.Next;
//                    Continue;
//                 end;
//              except
//                 memResult.Lines.Add(sNomeParticip+' - erro na execução da regra de cancelamento por inadimplência.');
//                 qryDetalhe.Next;
//                 Continue;
//              end;
//           end;
//
//           iLista          := lstvResultado.items.add;
//           iLista.Caption  :=  sNomeParticip;//William Moreira da Silva SOL 173800 KTN 1609874
//           //iLista.Caption  :=  sPlano ;
//           iLista.SubItems.Add(sPlano);
//           iLista.SubItems.Add(sRegraOk);
//           iLista.SubItems.Add(sMatricula);
//           iLista.SubItems.Add(sInscricaoNumero);
//           iLista.SubItems.Add(IntToStr(iCont));
//           iLista.SubItems.Add('Cobrança do Mês');
//           iLista.SubItems.Add(sPatrocinadora);
//           iLista.SubItems.Add(sSituacao);
//           iLista.SubItems.Add(sSitFundacao);
//
//           lbParticip.Items.Add(IntToStr(iIdPessoa));
//           lbPlano.Items.Add(IntToStr(iIdPlanoPrev));
//           lbPatro.Items.Add(IntToStr(iIdPessJur));
//
//           lbRegraOk.Items.Add(sRegraOk);
//        end;
//     end;
//  end;
//
//  if lbRegraOk.Items.Count < lstvResultado.Items.Count
//  then begin
//     for i := 0 to lbRegraOk.Items.Count - 1 do
//         if (lbRegraOk.Items[i] = '[ OK ]') then lstvResultado.items.Item[i].Checked := True;
//  end
//  else begin
//     for i := 0 to lstvResultado.items.Count -1 do
//         if (lbRegraOk.Items[i] = '[ OK ]') then lstvResultado.items.Item[i].Checked := True;
//  end;
//
//  frmAguarde.Apaga;
//end;
//Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636 - FIM COMENTA

procedure TfrmEventoRegInadimplencia.bbtnVoltarDetalheClick(Sender: TObject);
begin
  inherited;
  pnlDetalhe.Visible := False;
  Panel1.BringToFront;
  bbtnDetalhe.Visible       := True;

  bbtnVoltarDetalhe.Visible := False;
  bbtnEmitirCarta.Visible   := False;
  bbtnMalaDireta.Visible    := False;
  bbtnCancelarPart.Visible  := False;

  bbtnGerarAquivo.Visible := False; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
end;

procedure TfrmEventoRegInadimplencia.FiltraParticipantesSelecionados;
var
  i    : integer;
  sSQL : string;
begin
  // Verifica todos os Participantes selecionados
  strParticip := '';
  strPatro    := '';
  strPlano    := '';

  for I:=0 to lstvResultado.items.Count -1 do
  begin
     if (lstvresultado.Items.Item[i].Checked) //and //Helio - SOL Nº 253577/17744 PPM Nº 1063636
        //(  bEmiteCartaTodosSele or (lbRegraOk.Items[i] = '[ OK ]') ) //Helio - SOL Nº 253577/17744 PPM Nº 1063636
     then begin
        // Preencher string com Id's dos Participantes selecionados
        strParticip := strParticip + lbParticip.Items[i] + ', ';
        strPatro    := strPatro    + lbPatro.Items[i]    + ', ';
        strPlano    := strPlano    + lbPlano.Items[i]    + ', ';
     end; // if
  end; // for

  if Trim(strParticip) <> ''
  then strParticip:= Copy(strParticip, 1, Length(strParticip) - 2)
  else begin  // se não selecionou nenhum participante
     qryparticip.Close;
     Exit;
  end;

  if Trim(strPatro) <> ''
  then strPatro:= Copy(strPatro, 1, Length(strPatro) - 2);

  if Trim(strPlano) <> ''
  then strPlano:= Copy(strPlano, 1, Length(strPlano) - 2);

  // Filtra todos os participantes Selecionados
  sSQL := ' SELECT PARTPREVPLAN.IDPESSOA,       PARTPREVPLAN.IDPESSJUR,      PARTPREVPLAN.IDPLANOPREV,  '+
          '        PARTPREVPLAN.SEQPROPOSTA,    PESSOA.NOME AS PARTICIPANTE, PESSOA.NOME,               '+
          '        SITPLANOPREV.IDSITPLANOPREV, SITPART.IDSITPART,           SITFUNC.IDSITFUNC,         '+
          '        ELEGPATRO.MATRICULA,         PT.NOME AS NOMEPATRO,        PLANPREV.NOME AS NOMEPLANO,'+
          '        PARTPREVPLAN.INSCRICAONUMERO, '+
          '        SITPART.FLGINTERNO '+
          ' FROM   PESSOA, PESSOA PT, SITPLANOPREV, SITPART, SITFUNC , PLANPREV, ELEGPATRO, PARTPREVPLAN '+
          ' WHERE  (PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA) AND            '+
          '        (ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA) AND      '+
          '        (ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR) AND    '+
          '        (PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV) AND '+
          '        (PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV) AND '+
          '        (PARTPREVPLAN.IDSITPART = SITPART.IDSITPART) AND                '+
          '        (ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+)) AND                '+
          '        (ELEGPATRO.IDPESSJUR = PT.IDPESSOA) ';


  if Trim(strParticip) <> '' then
     sSQL := sSQL + ' AND (PARTPREVPLAN.IDPESSOA IN (' + strParticip + ')) ';

  if Trim(strPatro) <> '' then
     sSQL := sSQL + ' AND (PARTPREVPLAN.IDPESSJUR IN (' + strPatro + ')) ';

  if Trim(strPlano) <> '' then
     sSQL := sSQL + ' AND (PARTPREVPLAN.IDPLANOPREV IN (' + strPlano + ')) ';

  qryParticip.Close;
  qryParticip.SQL.Clear;
  qryParticip.SQL.Add(sSQL);

  try
     qryParticip.open;
  except
     on E:EDBEngineError do
     begin
       MostrarErro(E);
       Exit;
     end;
  end;
end;

procedure TfrmEventoRegInadimplencia.bbtnEmitirCartaClick(Sender: TObject);
var sMsgErro : string;
begin
  inherited;

  if (sFlgInterno <> 'RI') and (Trim(dtCancelamento.Text) = '')
  then begin
     MsgDlg('Informe a data do cancelamento.','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  if not bPerguntouEmissao
  then begin
     bEmiteCartaTodosSele := False;

     if MsgDlg('Deseja emitir carta mesmo para os participantes NÃO cancelados '+#13+'por regra ? ','Confirmação',
               mtConfirmation,[mbYes, mbNo, mbHelp],0) = mrYes
     then bEmiteCartaTodosSele := True;
     bPerguntouEmissao := True;
  end;


  FiltraParticipantesSelecionados;

 {Se a Tabela de Participantes Selecionados estiver vazia, ou não estiver ativa}
  if (qryParticip.State in [dsInactive]) or (qryParticip.IsEmpty) then
     begin
          MsgDlg('Nenhum Participante foi selecionado.','Erro',mtError,[mbOk,mbHelp],0);
          exit;
     end;

  if sFlgInterno <> 'RI' then
  begin
      //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
      {// Abre tela pedindo a Nova Situacao do Plano
      frmLerSituacaoPlano := TfrmLerSituacaoPlano.Create(Self);
      frmLerSituacaoPlano.Caption     := 'Situação do Participante no Plano para Cancelamento';
      frmLerSituacaoPlano.sflgInterno := 'CI'; 
      frmLerSituacaoPlano.sIdEvento   := sIdEventoGerador;
      frmLerSituacaoPlano.sMensagem   := 'A Nova Situação do Participante no Plano deve ser informada.';
      frmLerSituacaoPlano.sMensFund   := 'A Nova Situação do Participante na Fundação deve ser informada.';
      frmLerSituacaoPlano.ShowModal;

      if frmLerSituacaoPlano.bBotaoOk  = False
      then begin
         frmLerSituacaoPlano.Free;
         Exit;
      end;}
      //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636


      qryParticip.First;
      while not qryParticip.EOF do
      begin

          //VerificaeGravaSituacoes; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
          VerificaEstadoEvento;
          //SuspendeContribuicoes; //Helio - SOL Nº 253577/17744 PPM Nº 1063636

          AssociaNovasContribuicoes(qryParticip.FieldByName('IDPESSJUR').AsString, qryParticip.FieldByName('IDPLANOPREV').AsString,
                                    qryParticip.FieldByName('IDPESSOA').AsString, qryParticip.FieldByName('SEQPROPOSTA').AsString,
                                    sIdEventoGerador, '', '', qryParticip.FieldByName('MATRICULA').AsString,
                                    qryParticip.FieldByName('IDSITPART').AsString, '',False, True,
                                    False, 
                                    qryAux, qryGrava,
                                    sFlgInterno,iIdEventoPrev,'');

         if not ApagaDotacao (qryParticip.FieldByName('IDPESSJUR').AsInteger,
                              qryParticip.FieldByName('IDPLANOPREV').AsInteger,
                              qryParticip.FieldByName('IDPESSOA').AsInteger,
                              qryParticip.FieldByName('SEQPROPOSTA').AsInteger,
                              '',
                              sMsgErro)
         then begin
            MsgDlg('Erro : '+sMsgErro+'Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
            Exit;
         end;

         if not AbateSalario (qryParticip.FieldByName('IDPESSJUR').AsInteger,
                              qryParticip.FieldByName('IDPLANOPREV').AsInteger,
                              qryParticip.FieldByName('IDPESSOA').AsInteger,
                              qryParticip.FieldByName('SEQPROPOSTA').AsInteger,
                              '',
                              sMsgErro)
         then begin
            MsgDlg('Erro : '+sMsgErro+'Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
            Exit;
         end;
          qryParticip.Next;
      end;

      //frmLerSituacaoPlano.Free; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
  end
  else begin
      //Helio - SOL Nº 253577/17744 PPM Nº 1063636
      {// Abre tela pedindo a Nova Situacao do Plano
      frmLerSituacaoPlano := TfrmLerSituacaoPlano.Create(Self);
      frmLerSituacaoPlano.Caption     := 'Situação do Participante no Plano para Registro';
      frmLerSituacaoPlano.sflgInterno := 'RI'; 
      frmLerSituacaoPlano.sIdEvento   := sIdEventoGerador;
      frmLerSituacaoPlano.sMensagem   := 'A Nova Situação do Participante no Plano deve ser informada.';
      frmLerSituacaoPlano.sMensFund   := 'A Nova Situação do Participante na Fundação deve ser informada.';
      frmLerSituacaoPlano.ShowModal;

      if frmLerSituacaoPlano.bBotaoOk  = False
      then begin
         frmLerSituacaoPlano.Free; 
         Exit;
      end;}
      //Helio - SOL Nº 253577/17744 PPM Nº 1063636

      frmAguarde.Mostra('Registrando Eventos ....');
      qryParticip.First;
      while not qryParticip.EOF do
      begin
          Application.ProcessMessages;
          //VerificaeGravaSituacoes; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
          VerificaEstadoEvento;
          qryParticip.Next;
      end;

      frmAguarde.Apaga;
      //frmLerSituacaoPlano.Free; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
  end;

  // Chama parametro para imprimir carta
  with dtmRelatAdmPREV do
  begin
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     if sFlgInterno = 'RI'
     then begin
        qryCartaInadimpl.Close;
        qryCartaInadimpl.SQL.Clear;
        qryCartaInadimpl.SQL.Add(qryParticip.SQL.Text);
        qryCartaInadimpl.Open;
        rpCartaInadimpl.Print;
     end
     else begin
        qryCancelInadimpl.Close;
        qryCancelInadimpl.SQL.Clear;
        qryCancelInadimpl.SQL.Add(qryParticip.SQL.Text);
        qryCancelInadimpl.Open;
        rpCancelInadimpl.Print;
     end;
  end; // with
  bbtnVoltarDetalhe.Click();
end;

procedure TfrmEventoRegInadimplencia.bbtnCancelarPartClick(Sender: TObject);
var bErro : Boolean;
    sMsgErro,
    sSQL  : string;
begin
  inherited;

  //Fanuel Junior SOL 159982  Kintana 1345685
  if not(dtmBaseDados.dbBaseDados.InTransaction) then
     dtmBaseDados.dbBaseDados.StartTransaction;


  if (sFlgInterno <> 'RI') and (Trim(dtCancelamento.Text) = '')
  then begin
     MsgDlg('Informe a data do cancelamento.','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  if not bPerguntouEmissao
  then begin
     bEmiteCartaTodosSele := False;
    if iValidaChecks > 0 then
    begin
        if MsgDlg('Deseja cancelar mesmo os participantes NÃO cancelados por regra ? ','Confirmação',
                  mtConfirmation,[mbYes, mbNo, mbHelp],0) = mrYes
        then bEmiteCartaTodosSele := True;
    end
    else
    //William Moreira da Silva SOL 173800 KTN 1609874
    begin
        if MsgDlg('Deseja cancelar mesmo o plano NÃO cancelado por regra ? ','Confirmação',
            mtConfirmation,[mbYes, mbNo, mbHelp],0) = mrYes
        then bEmiteCartaTodosSele := True;
    end;
     bPerguntouEmissao := True;
  end;


  FiltraParticipantesSelecionados;

 {Se a Tabela de Participantes Selecionados estiver vazia, ou não estiver ativa}
  if (qryParticip.State in [dsInactive]) or (qryParticip.IsEmpty) then
     begin
          MsgDlg('Nenhum Participante foi selecionado.','Erro',mtError,[mbOk,mbHelp],0);
          Exit;
     end;

     if iValidaChecks > 0 then
     begin
          if MsgDlg('Confirma Cancelar todos os Participantes Selecionados ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo then
          begin
               TiraSql(qryAux);
               Exit;
          end;
     end
     else
     begin
          if MsgDlg('Confirma Cancelar o Plano Selecionado ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo then
          begin
              TiraSql(qryAux);
              Exit;
          end;
     end;

  //Helio - SOL Nº 253577/17744 PPM Nº 1063636
 {Abre tela pedindo a Nova Situacao do Plano}
  {frmLerSituacaoPlano := TfrmLerSituacaoPlano.Create(Self);
  frmLerSituacaoPlano.Caption     := 'Situação do Participante no Plano';
  frmLerSituacaoPlano.sflgInterno := 'CI';
  frmLerSituacaoPlano.sIdEvento   := sIdEventoGerador;
  frmLerSituacaoPlano.sMensagem   := 'A Nova Situação do Participante no Plano deve ser informada.';
  frmLerSituacaoPlano.sMensFund   := 'A Nova Situação do Participante na Fundação deve ser informada.';
  frmLerSituacaoPlano.ShowModal;

  if frmLerSituacaoPlano.bBotaoOk = False
  then begin
     frmLerSituacaoPlano.Free;
     Exit;
  end;}
  //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636



  qryParticip.First;
  while not qryParticip.EOF do
  begin



      //VerificaeGravaSituacoes; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
      VerificaEstadoEvento;
      //SuspendeContribuicoes; //Helio - SOL Nº 253577/17744 PPM Nº 1063636


      AssociaNovasContribuicoes(qryParticip.FieldByName('IDPESSJUR').AsString, qryParticip.FieldByName('IDPLANOPREV').AsString,
                                qryParticip.FieldByName('IDPESSOA').AsString, qryParticip.FieldByName('SEQPROPOSTA').AsString,
                                sIdEventoGerador, '', '', qryParticip.FieldByName('MATRICULA').AsString,
                                qryParticip.FieldByName('IDSITPART').AsString, '',False, True,
                                False,
                                qryAux, qryGrava,
                                sFlgInterno,iIdEventoPrev,'');

     if not ApagaDotacao (qryParticip.FieldByName('IDPESSJUR').AsInteger,
                          qryParticip.FieldByName('IDPLANOPREV').AsInteger,
                          qryParticip.FieldByName('IDPESSOA').AsInteger,
                          qryParticip.FieldByName('SEQPROPOSTA').AsInteger,
                          '',
                          sMsgErro)
     then begin
        MsgDlg('Erro : '+sMsgErro+'Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        Exit;
     end;

     if not AbateSalario (qryParticip.FieldByName('IDPESSJUR').AsInteger,
                          qryParticip.FieldByName('IDPLANOPREV').AsInteger,
                          qryParticip.FieldByName('IDPESSOA').AsInteger,
                          qryParticip.FieldByName('SEQPROPOSTA').AsInteger,
                          '',
                          sMsgErro)
     then begin
        MsgDlg('Erro : '+sMsgErro+'Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        Exit;
     end;
      qryParticip.Next;
  end;

  //frmLerSituacaoPlano.Free; //Helio - SOL Nº 253577/17744 PPM Nº 1063636

  bbtnVoltarDetalhe.Click();

  //William Moreira da Silva SOL 173800 KTN 1609874
  if iValidaChecks > 0 then
  begin
    MsgDlg('Participantes Cancelados com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);
  end
  else
  begin
    MsgDlg('Plano Cancelado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);
  end;
  //William Moreira da Silva SOL 173800 KTN 1609874

  //Fanuel Junior SOL 159982  Kintana 1345685
  if dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.Commit;

  TiraSql(qryAux);

  if memResult.Lines.Count <> 0 then
  begin
     pnlResultado.Visible       := True;
     pnlResultado.BringToFront;
     bbtnVoltarDetalhe.Visible  := True;
  end;
end;

procedure TfrmEventoRegInadimplencia.MontaSqlRegra(var sSQL : string; pStrContrib, sIdSitPart : string);
begin
   pStrContrib := Copy(pStrContrib,1, Length(pStrContrib)-1);
   sSQL := '';
   sSQl := 'SELECT DISTINCT  HST.IDPESSOA, HST.IDPESSJUR,  HST.IDPLANOPREV,    '+
           '       HST.DATAPREVISAORECE AS DATAREF,                            '+
           '       HST.MESREFERENCIA,  HST.DATAPREVISAORECE,                   '+
           '       '''+sIdSitPart +''' as IDSITPART,                           '+ 
           '       HST.SITRECEBIMENTO, HST.SEQPROPOSTA,   PL.IDREGRACANCELAME, '+
           '       PP.INSCRICAODATA,                                           '+
           ''''+dtCancelamento.Text+''' AS DATAEVENTO,                         '+ 
           ''''+dtCancelamento.Text+''' AS DTEVENTO,                           '+ 
           ''''+dtCancelamento.Text+''' AS DATAINICIO,                         '+ 
           '       PP.FLGDEVEPREVIDENC '+ 
           ' FROM  HSTCONTRIBPREV HST, PARTPREVPLAN PP, PLANPREV PL  '+
           ' WHERE (HST.IDPESSOA       =  '+ IntToStr(iIdPessoa)    + ') AND ' +
           '       (HST.IDPLANOPREV    =  '+ IntToStr(iIdPlanoPrev) + ') AND ' +
           '       (HST.IDPESSJUR      =  '+ IntToStr(iIdPessJur)   + ') AND ' +
           '       (PP.IDPESSOA       =  HST.IDPESSOA ) AND ' +
           '       (PP.IDPLANOPREV    =  HST.IDPLANOPREV ) AND ' +
           '       (PP.IDPESSJUR      =  HST.IDPESSJUR ) AND ' +
           '       (HST.IDPLANOPREV    =   PL.IDPLANOPREV) AND               ' +
           '       (NVL(HST.VALORRECEBIDO,0) = 0 ) ' +
           ' ORDER BY HST.IDPESSOA, HST.MESREFERENCIA, HST.DATAPREVISAORECE ';

   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(sSQL);
   qryAux.Open;
end;

procedure TfrmEventoRegInadimplencia.SuspendeContribuicoes;
begin
  qryParticip.First;
  while not qryParticip.EOF do
      begin
          {Suspende a Cobrança de todas as Contribuições Previdenciarias dos Participantes}
           qryAux.Close;
           qryAux.Sql.Clear;
           qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0 , DATAFINAL = TO_DATE('''+dtCancelamento.text+''',''DD/MM/YYYY'')  ' +  
                          ' WHERE IDPESSJUR   = ' + qryParticip.FieldByName('IDPESSJUR').AsString   + ' AND ' +
                          '       IDPLANOPREV = ' + qryParticip.FieldByName('IDPLANOPREV').AsString + ' AND ' +
                          '       IDPESSOA    = ' + qryParticip.FieldByName('IDPESSOA').AsString    + ' AND '+
                          '       SEQPROPOSTA = ' + qryParticip.FieldByName('SEQPROPOSTA').AsString );
           try
              qryAux.ExecSQL;
           except
              on E:EDBEngineError do
                 begin
                      MostrarErro(E);
                      frmLerSituacaoPlano.Free;
                      Exit;
                 end;
           end;

           qryParticip.Next;
      end;
end;

procedure TfrmEventoRegInadimplencia.VerificaeGravaSituacoes;
var sDataCancelamento : string;
begin
  // Se o Evento não requer Benefício, grava as situações de Imediato, e já grava o evento como efetivado
  sFlgEfetivado    := '1';
  sDataEfetivado   := ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')'; 

  if sFlgInterno = 'RI'
  then sDataCancelamento := ' NULL '
  else sDataCancelamento := ' TO_DATE('''+dtCancelamento.Text+''',''dd/mm/yyyy'') ';

  sFlgSitFuncImed  := '1';
  sFlgSitPartImed  := '1';
  sFlgSitPlanoImed := '1';

      // Grava nova Situação dos Participantes no Plano
      qryGrava.Close;
      qryGrava.Sql.Clear;
      qryGrava.Sql.Add(' UPDATE PARTPREVPLAN ' +
                       ' SET IDSITPLANOPREV = ' + frmLerSituacaoPlano.qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString + ', '+
                       '     DATACANCELAMENTO = '+sDataCancelamento);
      if frmLerSituacaoPlano.qrySitPart.FieldByName('IDSITPART').AsInteger > 0 then
         qryGrava.Sql.Add(', IDSITPART      = ' + frmLerSituacaoPlano.qrySitPart.FieldByName('IDSITPART').AsString);

      // Edilaine - SOL 169731 - KTN 1563222
      if sFlgInterno <> 'RI' then
         qryGrava.Sql.Add(', FLGDESATIVADO  = 1');
      // Edilaine - SOL 169731 - KTN 1563222 - fim

      qryGrava.Sql.Add(' WHERE IDPESSJUR    = ' + qryParticip.FieldByName('IDPESSJUR').AsString   + ' AND ' +
                       '       IDPLANOPREV  = ' + qryParticip.FieldByName('IDPLANOPREV').AsString + ' AND ' +
                       '       SEQPROPOSTA  = ' + qryParticip.FieldByName('SEQPROPOSTA').AsString + ' AND ' +
                       '       IDPESSOA     = ' + qryParticip.FieldByName('IDPESSOA').AsString);
      try
         qryGrava.ExecSQL;
      except
         on E:EDBEngineError do
            begin
                 MostrarErro(E);
                 frmLerSituacaoPlano.Free;
                 Exit;
            end;
      end;
end;

procedure TfrmEventoRegInadimplencia.VerificaEstadoEvento;
begin
         qryAux.Close;
           qryAux.Sql.Clear;
           qryAux.Sql.Add(' SELECT EP.FLGEFETIVADO, EG.IDEVENTOGERADOR ' +
                          ' FROM EVENTOGERADOR EG, EVENTOSPREV EP ' +
                          ' WHERE EG.FLGINTERNO = ' + '''' + sFlgInterno + '''' + ' AND ' +
                          '       EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR AND ' +
                          '       EP.SEQPROPOSTA = ' + qryParticip.FieldByName('SEQPROPOSTA').AsString + ' AND ' +
                          '       EP.IDPESSJUR   = ' + qryParticip.FieldByName('IDPESSJUR').AsString   + ' AND ' +
                          '       EP.IDPLANOPREV = ' + qryParticip.FieldByName('IDPLANOPREV').AsString + ' AND ' +
                          '       EP.IDPESSOA    = ' + qryParticip.FieldByName('IDPESSOA').AsString    + ' AND ' +
                          '       EP.DATAVOLTA IS NULL ');
           try
              qryAux.Open;
           except
              on E:EDBEngineError do
              begin
                 MostrarErro(E);
                 Exit;
              end;
           end;

           if qryAux.IsEmpty
           then sGrava := 'INCLUI'
           else if qryAux.FieldByName('FLGEFETIVADO').AsString = '0'
                then begin
                   sGrava := 'ALTERA';
                   sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
                end
                else sGrava := 'INCLUI'; 

           GravaEVENTOSPREV;

end;

procedure TfrmEventoRegInadimplencia.GravaEVENTOSPREV;
var sMesRef : string; 
    sDataEvento : string;
begin
  if sFlgInterno = 'RI' Then
    sDataEvento := 'TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''', ''dd/mm/yyyy'') ' 
  else
    sDataEvento := 'TO_DATE(''' + dtCancelamento.Text+ ''', ''dd/mm/yyyy'') ';

  if sGrava = 'INCLUI'
  then begin
     iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

     //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
     sFlgEfetivado    := '1';
     sDataEfetivado   := ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')';
     sFlgSitFuncImed  := '1';
     sFlgSitPartImed  := '1';
     sFlgSitPlanoImed := '1';
     //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                    '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                    '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                    '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                    '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                    '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO) ' +
                    ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + 
                                 sDataEvento+ ',' +
                                 qryParticip.FieldByName('IDPESSOA').AsString + ',' + qryParticip.FieldByName('IDPESSJUR').AsString + ',' +
                                 qryParticip.FieldByName('IDPLANOPREV').AsString + ',' + qryParticip.FieldByName('SEQPROPOSTA').AsString + ',' +
                                 qryParticip.FieldByName('IDSITFUNC').AsString + ',' + qryParticip.FieldByName('IDSITPART').AsString + ',' +
                                 qryParticip.FieldByName('IDSITPLANOPREV').AsString + ',' +
                                 qryParticip.FieldByName('IDSITFUNC').AsString + ',' );
                                 
     if assigned(frmLerSituacaoPlano) then//Helio - SOL Nº 253577/17744 PPM Nº 1063636 //helio aqui
     begin
       if frmLerSituacaoPlano.qrySitPart.FieldByName('IDSITPART').AsInteger > 0
       then qryAux.SQL.Add(frmLerSituacaoPlano.qrySitPart.FieldByName('IDSITPART').AsString + ',' )
       else qryAux.SQL.Add(qryParticip.FieldByName('IDSITPART').AsString +', ');
     end else
       qryAux.SQL.Add(qryParticip.FieldByName('IDSITPART').AsString +', ');

     qryAux.SQL.Add( qryParticip.FieldByName('IDSITPLANOPREV').AsString  + ',' +  //frmLerSituacaoPlano.qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString + ',' + //Helio - SOL Nº 253577/17744 PPM Nº 1063636
                                 sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                 sDataEfetivado + ',' + sFlgEfetivado+','+
                                 qryParticip.FieldByName('INSCRICAONUMERO').AsString + ')');
     try
        qryAux.ExecSQL;
     except
         on E:EDBEngineError do
            begin
                 MostrarErro(E);
                 Exit;
            end;
     end;

     if sFlgInterno <> 'RI'
     then begin
        sMesRef := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' +          
                   Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);                 

        GravaHSTCONTEVENTOSPRFechado(IntToStr(iIdEventoPrev), qryParticip.FieldByName('IDPLANOPREV').AsString, sIdEventoGerador, '',
                                     qryParticip.FieldByName('IDPESSOA').AsString, qryParticip.FieldByName('IDPESSJUR').AsString,
                                     qryParticip.FieldByName('SEQPROPOSTA').AsString, '0','',
                                     sDataEvento,
                                     True, qryAux, qryGrava,sIdPlanoPrev);
     end;
  end
  else if sGrava = 'ALTERA'
       then begin
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAALTERADO = To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + 
                         '                        DATAEVENTO   = '+sDataEvento+','+
                         '                        IDSITFUNCATUAL  = ' + qryParticip.FieldByName('IDSITFUNC').AsString + ',' +
                         '                        IDSITPARTATUAL  = ' + qryParticip.FieldByName('IDSITPART').AsString + ',' +
                         '                        IDSITPLANOATUAL = ' + qryParticip.FieldByName('IDSITPLANOPREV').AsString + ',' +
                         '                        IDSITFUNCNOVO   = ' + qryParticip.FieldByName('IDSITFUNC').AsString + ',' +
                         '                        IDSITPARTNOVO   = ' + qryParticip.FieldByName('IDSITPART').AsString + ',' +
                         '                        IDSITPLANONOVO  = ' + qryParticip.FieldByName('IDSITPLANOPREV').AsString +//frmLerSituacaoPlano.qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString + //Helio - SOL Nº 253577/17744 PPM Nº 1063636
                         ' WHERE SEQPROPOSTA     = ' + qryParticip.FieldByName('SEQPROPOSTA').AsString + ' AND ' +
                         '       IDPESSJUR       = ' + qryParticip.FieldByName('IDPESSJUR').AsString   + ' AND ' +
                         '       IDPLANOPREV     = ' + qryParticip.FieldByName('IDPLANOPREV').AsString + ' AND ' +
                         '       IDPESSOA        = ' + qryParticip.FieldByName('IDPESSOA').AsString    + ' AND ' +
                         '       IDEVENTOGERADOR = ' + sIdEventoGerador + ' AND ' +
                         '       DATAVOLTA IS NULL ');
          try
             qryAux.ExecSQL;
          except
             on E:EDBEngineError do
               begin
                    MostrarErro(E);
                    Exit;
               end;
          end;
     end;
end;

procedure TfrmEventoRegInadimplencia.FormCreate(Sender: TObject);
begin
  inherited;
  ppRegisterForm(TppCustomPreviewer,TppPrintPreview);
  // edilaine - SOL 253577-17744 / PPM 1063636 - inicio
  //RgOpcao.ItemIndex        := 2;
  rbNenhum.Checked           := true;
  rbTempoInad.checked       := false;
  rbQtdContrib.checked      := false;
  // edilaine - SOL 253577-17744 / PPM 1063636 - fim
  gbContribuicaoInad.Visible := False;
  grpTempo.Visible           := False;

  pnExibeDetalhe.Visible    := False;

  //cmbMes.ItemIndex          := 0; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
  bbtnVoltarDetalhe.Visible := False;
  bbtnEmitirCarta.Visible   := False;
  bbtnMalaDireta.Visible   := False;
  bbtnCancelarPart.Visible  := False;

  //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
  bbtnGerarAquivo.Visible  := False;
  bbtnGerarAquivo.Caption := '&Gerar' + #13+ 'Arquivos';
  //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

  pnExibeDetalhe.Left := 12;
  pnExibeDetalhe.Top  := -3;
end;

procedure TfrmEventoRegInadimplencia.lstvresultadoColumnClick(Sender: TObject; Column: TListColumn);
var i    : Integer;
    sSQL : string;
begin
 inherited;
 lstvresultado.SetFocus;


 if lstvresultado.Selected = nil then
 begin
    MsgDlg('Selecione Participantes para Detalhamento.','Atenção',mtWarning,[mbOk,mbHelp],0);
    Exit;
 end;

  if lstvResultado.SelCount > 1 then
  begin
       messagedlg('Mais de uma plano selecionado',mtInformation,mbOKCancel,0);
       exit;
  end;

  i := lstvresultado.Selected.Index;
  lblNome.Caption   := lstvresultado.Items[i].Caption;

  if i <= lbParticip.Items.Count then
  begin
     qryAbreDet.Close;
     // Andre Imakawa - SIG 58182 - Inicio
     qryAbreDet.sql.clear;
     qryAbreDet.sql.add(
     ' SELECT DISTINCT   HST.IDPESSOA,   HST.IDPESSJUR,  HST.IDPLANOPREV, ' + #13#10 +
     '                   HST.MESREFERENCIA,  HST.DATAPREVISAORECE, ' + #13#10 +
     '                   HST.SITRECEBIMENTO, HST.SEQPROPOSTA,  HST.VALORESPERADO, ' + #13#10 +
     '                   C.NOME ' + #13#10 +
     ' FROM  HSTCONTRIBPREV HST, CONTRIBUICAO C ' + #13#10 +
     ' WHERE HST.IDPESSOA       =  '+ lbParticipIdPessoa.Items[i] +'  AND ' + #13#10 +
     '       HST.IDPLANOPREV    =  '+ lbPlano.Items[i] +'     AND ' + #13#10 +
     '       HST.IDPESSJUR      =  '+ lbPatro.Items[i] +'     AND ' + #13#10 );

     if Trim(strContrib) <> '' then
       qryAbreDet.sql.add('      HST.IDCONTRIBUICAO IN ('+ strContrib +') AND ' + #13#10);

     qryAbreDet.sql.add(' HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND ' + #13#10 +
     ' HST.SITRECEBIMENTO IN (0,1)   AND ' + #13#10 +
     ' HST.VALORRECEBIDO IS NULL ' + #13#10 +
     ' ORDER BY HST.MESREFERENCIA,  C.NOME, HST.DATAPREVISAORECE ');
     // Andre Imakawa - SIG 58182 - Fim
     try
       qryAbreDet.Open;
     except
     end;
     pnExibeDetalhe.Visible := True;
     pnExibeDetalhe.BringToFront;
     grdDetalhe.ApplySelected;
  end;
end;

procedure TfrmEventoRegInadimplencia.btnSaiDetClick(Sender: TObject);
begin
  inherited;
  pnExibeDetalhe.Visible := False;
  pnExibeDetalhe.SendToBack;
end;

procedure TfrmEventoRegInadimplencia.lstvresultadoDblClick(
  Sender: TObject);
var i    : Integer;
    sSQL : string;
begin
  inherited;
  if not lstvresultado.Selected.Selected then
  begin
     MsgDlg('Selecione Participantes para Detalhamento.','Atenção',mtWarning,[mbOk,mbHelp],0);
     Exit;
  end;

  pnExibeDetalhe.Visible := True;
  pnExibeDetalhe.BringToFront;

  lblNome.Caption    := lstvresultado.Items[0].Caption;
  i := lstvresultado.Selected.Index;

  if i <= lbParticip.Items.Count then
  begin
     qryAbreDet.Close;
     // Andre Imakawa - SIG 58182 - Inicio
     qryAbreDet.sql.clear;
     qryAbreDet.sql.add(
     ' SELECT DISTINCT   HST.IDPESSOA,   HST.IDPESSJUR,  HST.IDPLANOPREV, ' + #13#10 +
     '                   HST.MESREFERENCIA,  HST.DATAPREVISAORECE, ' + #13#10 +
     '                   HST.SITRECEBIMENTO, HST.SEQPROPOSTA,  HST.VALORESPERADO, ' + #13#10 +
     '                   C.NOME ' + #13#10 +
     ' FROM  HSTCONTRIBPREV HST, CONTRIBUICAO C ' + #13#10 +
     ' WHERE HST.IDPESSOA       =  '+ lbParticipIdPessoa.Items[i] +'  AND ' + #13#10 +
     '       HST.IDPLANOPREV    =  '+ lbPlano.Items[i] +'     AND ' + #13#10 +
     '       HST.IDPESSJUR      =  '+ lbPatro.Items[i] +'     AND ' + #13#10 );

     if Trim(strContrib) <> '' then
       qryAbreDet.sql.add('      HST.IDCONTRIBUICAO IN ('+ strContrib +') AND ' + #13#10);

     qryAbreDet.sql.add(' HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND ' + #13#10 +
     ' HST.SITRECEBIMENTO IN (0,1)   AND ' + #13#10 +
     ' HST.VALORRECEBIDO IS NULL ' + #13#10 +
     ' ORDER BY HST.MESREFERENCIA,  C.NOME, HST.DATAPREVISAORECE ');
     // Andre Imakawa - SIG 58182 - Fim

     try
       qryAbreDet.Open;
     except
     end;
     grdDetalhe.ApplySelected;
  end;
end;

procedure TfrmEventoRegInadimplencia.FormShow(Sender: TObject);
begin
  inherited;
  lblParticipante.Caption    := '';
  lblPatrocinadora.Caption   := '';
  lblSitFunc.Caption         := '';
  lblMatricula.Caption       := '';
  lblPlanoPrev.Caption       := '';
  lblSitPart.Caption         := '';
  lblInscricao.Caption       := '';
  lblSitPlano.Caption        := '';
  sIdPessoa                   := '-1';
  sIdPessJur                  := '-1';
  sIdPlanoPrev                := '-1';
  sSeqProposta                := '-1';
  bPerguntouEmissao           := False;
  dtCancelamento.date         := date;

  if sFlgInterno = 'RI'
  then rgrpDataCancelamento.Visible := False
  else rgrpDataCancelamento.Visible := True;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
end;

procedure TfrmEventoRegInadimplencia.bbtnProcurarClick(Sender: TObject);
begin
  inherited;

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count <=  0) or  (MontaSelectPart.ValoresChave[0] = '')
  then  Exit;
  sIdPessoa                   := MontaSelectPart.ValoresChave[0];
  sIdPessJur                  := MontaSelectPart.ValoresChave[1];
  sIdPlanoPrev                := MontaSelectPart.ValoresChave[2];
  sSeqProposta                := MontaSelectPart.ValoresChave[18];
  lblParticipante.Caption     := MontaSelectPart.ValoresChave[3];
  lblPatrocinadora.Caption    := MontaSelectPart.ValoresChave[5];
  lblSitFunc.Caption          := MontaSelectPart.ValoresChave[7];
  lblMatricula.Caption        := MontaSelectPart.ValoresChave[4];
  lblPlanoPrev.Caption        := MontaSelectPart.ValoresChave[6];
  lblSitPart.Caption          := MontaSelectPart.ValoresChave[8];
  lblInscricao.Caption        := MontaSelectPart.ValoresChave[12];
  lblSitPlano.Caption         := MontaSelectPart.ValoresChave[9];
  rdSitPart.Visible           := False; 
end;

procedure TfrmEventoRegInadimplencia.bbtnLimparPartClick(Sender: TObject);
begin
  inherited;
  sIdPessoa                   := '-1';
  sIdPessJur                  := '-1';
  sIdPlanoPrev                := '-1';
  sSeqProposta                := '-1';
  lblParticipante.Caption     := '';
  lblPatrocinadora.Caption    := '';
  lblSitFunc.Caption          := '';
  lblMatricula.Caption        := '';
  lblPlanoPrev.Caption        := '';
  lblSitPart.Caption          := '';
  lblInscricao.Caption        := '';
  lblSitPlano.Caption         := '';
  rdSitPart.Visible           := True; 
end;

procedure TfrmEventoRegInadimplencia.bbtnMalaDiretaClick(Sender: TObject);
var sLinha,
    sSQL,
    sMsgErro,
    sNumOficioInicial : string;
    iNumOficioInicial,
    iNumOficioAtual   : longint;
    iQtdeMesesAberto  : integer;
    sMesAnoIniAberto,
    sMesAnoFimAberto  : string;
    sAnoMesAtual      : string;
    dTotalContribAberto : double;
begin
   inherited;
   if (sFlgInterno <> 'RI') and (Trim(dtCancelamento.Text) = '')
   then begin
      MsgDlg('Informe a data do cancelamento.','Erro',mtError,[mbOk, mbHelp],0);
      Exit;
   end;

   if not bPerguntouEmissao
   then begin
      bEmiteCartaTodosSele := False;

      if MsgDlg('Deseja incluir na mala direta mesmo para os participantes NÃO cancelados '+#13+'por regra ? ','Confirmação',
                mtConfirmation,[mbYes, mbNo, mbHelp],0) = mrYes
      then bEmiteCartaTodosSele := True;
      bPerguntouEmissao := True;
   end;

   memMalaDireta.Clear;

   FiltraParticipantesSelecionados;

   // Se a Tabela de Participantes Selecionados estiver vazia, ou não estiver ativa
   if (qryParticip.State in [dsInactive]) or (qryParticip.IsEmpty)
   then begin
      MsgDlg('Nenhum Participante foi selecionado.','Erro',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   if (sFlgInterno <> 'RI') and
      (MsgDlg('Deseja cancelar os participantes selecionados imediatamente ?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes)
   then begin
       //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
       {// Abre tela pedindo a Nova Situacao do Plano
       frmLerSituacaoPlano := TfrmLerSituacaoPlano.Create(Self);
       frmLerSituacaoPlano.Caption     := 'Situação do Participante no Plano';
       frmLerSituacaoPlano.sflgInterno := 'CI'; 
       frmLerSituacaoPlano.sIdEvento   := sIdEventoGerador;
       frmLerSituacaoPlano.sMensagem   := 'A Nova Situação do Participante no Plano deve ser informada.';
       frmLerSituacaoPlano.sMensFund   := 'A Nova Situação do Participante na Fundação deve ser informada.';
       frmLerSituacaoPlano.ShowModal;

       if frmLerSituacaoPlano.bBotaoOk  = False
       then begin
          frmLerSituacaoPlano.Free; 
          Exit;
       end;}
       //Fim Helio - SOL Nº 253577/17744 PPM Nº 1063636



       qryParticip.First;
       while not qryParticip.EOF do
       begin

           //VerificaeGravaSituacoes; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
           VerificaEstadoEvento;
           //SuspendeContribuicoes; //Helio - SOL Nº 253577/17744 PPM Nº 1063636

           AssociaNovasContribuicoes(qryParticip.FieldByName('IDPESSJUR').AsString, qryParticip.FieldByName('IDPLANOPREV').AsString,
                                     qryParticip.FieldByName('IDPESSOA').AsString, qryParticip.FieldByName('SEQPROPOSTA').AsString,
                                     sIdEventoGerador, '', '', qryParticip.FieldByName('MATRICULA').AsString,
                                     qryParticip.FieldByName('IDSITPART').AsString, '',False, True,
                                     False, 
                                     qryAux, qryGrava,
                                     sFlgInterno,iIdEventoPrev,''); 

          if not ApagaDotacao (qryParticip.FieldByName('IDPESSJUR').AsInteger,
                               qryParticip.FieldByName('IDPLANOPREV').AsInteger,
                               qryParticip.FieldByName('IDPESSOA').AsInteger,
                               qryParticip.FieldByName('SEQPROPOSTA').AsInteger,
                               '',
                               sMsgErro)
          then begin
             MsgDlg('Erro : '+sMsgErro+'Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
             Exit;
          end;

          if not AbateSalario (qryParticip.FieldByName('IDPESSJUR').AsInteger,
                               qryParticip.FieldByName('IDPLANOPREV').AsInteger,
                               qryParticip.FieldByName('IDPESSOA').AsInteger,
                               qryParticip.FieldByName('SEQPROPOSTA').AsInteger,
                               '',
                               sMsgErro)
          then begin
             MsgDlg('Erro : '+sMsgErro+'Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
             Exit;
          end;
           qryParticip.Next;
       end;
       frmLerSituacaoPlano.Free;
  end
  else begin
      //Helio - SOL Nº 253577/17744 PPM Nº 1063636
      {// Abre tela pedindo a Nova Situacao do Plano
      frmLerSituacaoPlano := TfrmLerSituacaoPlano.Create(Self);
      frmLerSituacaoPlano.Caption     := 'Situação do Participante no Plano para Registro';
      frmLerSituacaoPlano.sflgInterno := 'RI';
      frmLerSituacaoPlano.sIdEvento   := sIdEventoGerador;
      frmLerSituacaoPlano.sMensagem   := 'A Nova Situação do Participante no Plano deve ser informada.';
      frmLerSituacaoPlano.sMensFund   := 'A Nova Situação do Participante na Fundação deve ser informada.';
      frmLerSituacaoPlano.ShowModal;

      if frmLerSituacaoPlano.bBotaoOk  = False
      then begin
         frmLerSituacaoPlano.Free; 
         Exit;
      end;}
      //Helio - SOL Nº 253577/17744 PPM Nº 1063636

      frmAguarde.Mostra('Registrando Eventos ....');
      qryParticip.First;
      while not qryParticip.EOF do
      begin
          Application.ProcessMessages;
          //VerificaeGravaSituacoes; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
          VerificaEstadoEvento;
          qryParticip.Next;
      end;

      frmAguarde.Apaga;
      frmLerSituacaoPlano.Free;
  end;

   // Gerar mala direta
   // As colunas serão separadas por ponto e virgula, sem espaço.
   // Lay-Out :
   //         Campo
   //         Numero Inicial (numero do oficio )
   //         Matricula
   //         Nome
   //         Data de Cancelamento
   //         Sexo
   //         Logradouro
   //         Numero
   //         Complemento
   //         Bairro
   //         Cidade
   //         CodEstado
   //         CEP
   //         ContaCorrente
   //         NumAgencia
   //         NumBanco
   //         Meses em Aberto
   //         Total em Aberto
   //         Mes inicial em aberto
   //         Mes final em aberto

   PedeInfAux('Informe o número inicial para a carta (ex.: nº ofício, etc.)... ',
              'Número Inicial','', 1, sNumOficioInicial );

   try
      iNumOficioInicial := StrToInt(sNumOficioInicial);
   except
      MsgDlg('Erro no número inicial. Verifique.','Erro',mtError,[mbOk],0);
      Exit;
   end;

   // Inserir linha com os campos
   sLinha :=               'Numero Inicial (numero do oficio )';
   sLinha := sLinha + ';'+ 'Matricula';
   sLinha := sLinha + ';'+ 'Nome';
   sLinha := sLinha + ';'+ 'Data Canc.';
   sLinha := sLinha + ';'+ 'Sexo';
   sLinha := sLinha + ';'+ 'Logradouro';
   sLinha := sLinha + ';'+ 'Numero';
   sLinha := sLinha + ';'+ 'Complemento';
   sLinha := sLinha + ';'+ 'Bairro';
   sLinha := sLinha + ';'+ 'Cidade';
   sLinha := sLinha + ';'+ 'ES';
   sLinha := sLinha + ';'+ 'CEP';
   sLinha := sLinha + ';'+ 'ContaCorrente';
   sLinha := sLinha + ';'+ 'NumAgencia';
   sLinha := sLinha + ';'+ 'NumBanco';
   sLinha := sLinha + ';'+ 'Qtd';
   sLinha := sLinha + ';'+ 'Total em Aberto';
   sLinha := sLinha + ';'+ 'Mes Inicial';
   sLinha := sLinha + ';'+ 'Mes Final';

   memMalaDireta.Lines.Add(sLinha);
   iNumOficioAtual := iNumOficioInicial - 1;

   qryParticip.First;
   while not qryParticip.Eof do
   begin

      sLinha := '';
      inc(iNumOficioAtual);
      sLinha :=               IntToStr(iNumOficioAtual)                     ;
      sLinha := sLinha + ';'+ qryParticip.FieldByName('Matricula').AsString ;
      sLinha := sLinha + ';'+ qryParticip.FieldByName('Nome').AsString      ;
      if Trim(dtCancelamento.Text) <> ''
      then sLinha := sLinha + ';'+ Copy(dtCancelamento.Text,1,2)+' de '+ RetornaNomeMes(StrToInt(Copy(dtCancelamento.Text,4,2))) + ' de '+ Copy(dtCancelamento.Text,7,4)
      else sLinha := sLinha + ';'+ dtCancelamento.Text;

      // Buscar Endereco
      with dtmAPrev.qryAux do
      begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT PF.SEXO, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, C.NOME AS CIDADE, '+
                '        ES.CODESTADO, E.CEP                                      '+
                ' FROM   PESSOA P, PESSOAFISICA PF, ENDPESS E, CIDADES C, ESTADO ES                          '+
                ' WHERE  P.IDPESSOA   = '+qryParticip.FieldByName('IdPessoa').AsString+
                ' AND    PF.IDPESSOA  = P.IDPESSOA '+
                ' AND    E.IDPESSOA   = P.IDPESSOA '+
                ' AND    E.IDENDERECO = P.IDENDRESIDENCIAL '+
                ' AND    E.IDCIDADES  = C.IDCIDADES  '+
                ' AND    C.IDESTADO   = ES.IDESTADO  ');
        Open;
         sLinha := sLinha + ';'+ FieldByName('Sexo').AsString        ;
        sLinha := sLinha + ';'+ FieldByName('Logradouro').AsString  ;
        sLinha := sLinha + ';'+ FieldByName('Numero').AsString      ;
        sLinha := sLinha + ';'+ FieldByName('Complemento').AsString ;
        sLinha := sLinha + ';'+ FieldByName('Bairro').AsString      ;
        sLinha := sLinha + ';'+ FieldByName('Cidade').AsString      ;
        sLinha := sLinha + ';'+ FieldByName('CodEstado').AsString   ;
        if Trim(FieldByName('CEP').AsString) <> ''
        then sLinha := sLinha + ';'+ Copy(FieldByName('CEP').AsString,1,2)+'.'+Copy(FieldByName('CEP').AsString,3,3)+'-'+Copy(FieldByName('CEP').AsString,6,3)
        else sLinha := sLinha + ';'+ FieldByName('CEP').AsString         ;

        Close;
      end;

      // Buscar Conta Bancaria
      with dtmAPrev.qryAux do
      begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT C.CONTACORRENTE, A.NUMAGENCIA, B.NUMBANCO '+
                ' FROM   CONTABANCARIA C, AGENCIABANCARIA A, BANCO B '+
                ' WHERE  C.IDPESSOA     = '+qryParticip.FieldByName('IdPessoa').AsString+
                ' AND    C.FLGCONTAPREF = 1           '+
                ' AND    C.IDAGENCIA    = A.IDPESSOA  '+
                ' AND    A.IDBANCO      = B.IDPESSOA  ');
        Open;
        sLinha := sLinha + ';'+ FieldByName('ContaCorrente').AsString ;
        sLinha := sLinha + ';'+ FieldByName('NumAgencia').AsString    ;
        sLinha := sLinha + ';'+ FieldByName('NumBanco').AsString      ;
        Close;
      end;

      // Buscar contribuicoes em aberto
      sSQL := ' SELECT DISTINCT HST.MESREFERENCIA, HST.VALORESPERADO '+
              ' FROM    HSTCONTRIBPREV HST                            '+
              ' WHERE  (HST.MESCOBRANCA <= ''' + Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' +
                                                 Copy(FormatDateTime('dd/mm/yyyy', Date),4,2) + ''')'+
              ' AND    (HST.IDPESSJUR   = '+ qryParticip.FieldByName('IdPessJur').AsString+') '+
              ' AND    (HST.IDPLANOPREV = '+ qryParticip.FieldByName('IdPlanoPrev').AsString+') '+
              ' AND    (HST.IDPESSOA    = '+ qryParticip.FieldByName('IdPessoa').AsString+') '+
              ' AND    (HST.SEQPROPOSTA = '+ qryParticip.FieldByName('SeqProposta').AsString+') '+
              ' AND    (NVL(HST.VALORRECEBIDO,0) = 0 )     '+
              ' AND    (HST.FLGDEVOLUCAO     = 0)                ';

      if {(RgOpcao.ItemIndex = 1)}  rbTempoInad.checked      // edilaine - SOL 253577-17744 / PPM 1063636
      then begin
         // Quantidade de meses
         sSQL := sSQL + ' AND (HST.MESREFERENCIA = ''' + Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' +
                                                         Copy(FormatDateTime('dd/mm/yyyy', Date),4,2) + ''')';

         //sSQL := sSQL + ' AND TRUNC(MONTHS_BETWEEN(SYSDATE,HST.DATAPREVISAORECE),0) ' + cmbmes.Text + ' ' + IntToStr(spedMeses.Value); //Helio - SOL Nº 253577/17744 PPM Nº 1063636
      end;

      sSQL := sSQL + ' ORDER BY HST.MESREFERENCIA ';
      with dtmAPrev.qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(sSQL);
         Open;
         First;
         iQtdeMesesAberto    := 1;
         sMesAnoIniAberto    := FieldByName('MesReferencia').AsString;
         sMesAnoFimAberto    := FieldByName('MesReferencia').AsString;
         dTotalContribAberto := FieldByName('ValorEsperado').AsFloat;
         sAnoMesAtual        := FieldByName('MesReferencia').AsString;
         Next;
         while not Eof do
         begin
            if sAnoMesAtual <> FieldByName('MesReferencia').AsString
            then begin
               inc(iQtdeMesesAberto);
               sAnoMesAtual  := FieldByName('MesReferencia').AsString;
            end;
            dTotalContribAberto := dTotalContribAberto + FieldByName('ValorEsperado').AsFloat;
            sMesAnoFimAberto  := FieldByName('MesReferencia').AsString;
            Next;
         end;

         sLinha := sLinha + ';'+ IntToStr(iQtdeMesesAberto) ;
         sLinha := sLinha + ';'+ FormatFloat('#0.00', dTotalContribAberto);

         // Transformar variaveis de ano/mes para mes/ano
         if Copy(sMesAnoIniAberto,6,2) = '13'
         then sMesAnoIniAberto := '12/'+Copy(sMesAnoIniAberto,1,4)
         else sMesAnoIniAberto := Copy(sMesAnoIniAberto,6,2)+'/'+Copy(sMesAnoIniAberto,1,4);
         if Copy(sMesAnoFimAberto,6,2) = '13'
         then sMesAnoFimAberto := '12/'+Copy(sMesAnoFimAberto,1,4)
         else sMesAnoFimAberto := Copy(sMesAnoFimAberto,6,2)+'/'+Copy(sMesAnoFimAberto,1,4);

         // Transformar variaveis para extenso
         if sMesAnoIniAberto <> ''
         then sMesAnoIniAberto := RetornaNomeMes(StrToInt(Copy(sMesAnoIniAberto,1,2)))+'/'+Copy(sMesAnoIniAberto,4,4)
         else sMesAnoIniAberto := 'mês não encontrado';

         if sMesAnoFimAberto <> ''
         then sMesAnoFimAberto := RetornaNomeMes(StrToInt(Copy(sMesAnoFimAberto,1,2)))+'/'+Copy(sMesAnoFimAberto,4,4)
         else sMesAnoFimAberto := 'mês não encontrado';


         sLinha := sLinha + ';'+ sMesAnoIniAberto;
         sLinha := sLinha + ';'+ sMesAnoFimAberto;
      end;
      memMalaDireta.Lines.Add(sLinha);
      qryParticip.Next;
   end;

   if SaveDlg.Execute
   then memMalaDireta.Lines.SaveToFile(SaveDlg.filename);

    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;


   MsgDlg('Arquivo gerado com sucesso.','Informação',mtInformation,[mbOk],0);
end;

procedure TfrmEventoRegInadimplencia.pmnuMostrarLayOutClick(
  Sender: TObject);
begin
  inherited;
  with frmMostraAux do
  begin
     Caption := 'Lay-Out do Arquivo de Entrada para Mala Direta...';
     memResult.Lines.Clear;
     memResult.Lines.Add(' Campo                              ');
     memResult.Lines.Add(' Numero Inicial (numero do oficio ) ');
     memResult.Lines.Add(' Matricula                          ');
     memResult.Lines.Add(' Nome                               ');
     memResult.Lines.Add(' Data de Cancelamento               ');
     memResult.Lines.Add(' Sexo                                   ');
     memResult.Lines.Add(' Endereço do Participante - Logradouro  ');
     memResult.Lines.Add(' Endereço do Participante - Numero      ');
     memResult.Lines.Add(' Endereço do Participante - Complemento ');
     memResult.Lines.Add(' Endereço do Participante - Bairro      ');
     memResult.Lines.Add(' Endereço do Participante - Cidade      ');
     memResult.Lines.Add(' Endereço do Participante - CodEstado   ');
     memResult.Lines.Add(' Endereço do Participante - CEP         ');
     memResult.Lines.Add(' Conta Corrente - Número                ');
     memResult.Lines.Add(' Conta Corrente - Agencia               ');
     memResult.Lines.Add(' Conta Corrente - Banco                 ');
     memResult.Lines.Add(' Meses em Aberto                        ');
     memResult.Lines.Add(' Total em Aberto                        ');
     memResult.Lines.Add(' Mes inicial em aberto                  ');
     memResult.Lines.Add(' Mes final em aberto                    ');
     ShowModal;
  end;
end;

procedure TfrmEventoRegInadimplencia.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);

end;

//William Moreira da Silva SOL 173800 KTN 1609874
procedure TfrmEventoRegInadimplencia.lstvresultadoClick(Sender: TObject);
var
   i, count{, aux}: Integer;
begin
  inherited;

  count := 0;

  if iValidaChecks = 0 then
  begin
       //MessageDlg(sender.ClassName, mtWarning, [mbOK], 0);
       //lstvresultado.Selected.Checked :=
       //   Not lstvresultado.Selected.Checked;
       {for i := 0 to lstvresultado.Items.Count -1 do
         if lstvresultado.Items.Item[i].Checked then
            //lstvresultado.Items.item[aux].Checked := false;
            inc(count);
       if count > 1 then
          for i := 0 to lstvresultado.Items.Count -1 do
              if lstvresultado.Items.Item[i].Checked then
                 lstvresultado.Items.item[aux].Checked := false;

            begin
               count := 0;
               for i := 0 to lstvresultado.Items.Count - 1 do
               if lstvresultado.Items.Item[i].Checked then
               if count = 0 then
               begin
                 inc(count);
                 aux := i;
               end
               else
               begin
                  lstvresultado.Items.Item[aux].Checked := False;
               end;
      end; }
  end;
end;
//William Moreira da Silva SOL 173800 KTN 1609874


// edilaine - SOL 253577-17744 / PPM 1063636 - inicio
procedure TfrmEventoRegInadimplencia.rbNenhumClick(Sender: TObject);
begin
  inherited;
  rbQtdContrib.checked := false;
  rbTempoInad.checked  := false;
  rgrpFaixa.Visible := false;
  AjustaTela();
end;

procedure TfrmEventoRegInadimplencia.rbQtdContribClick(Sender: TObject);
begin
  inherited;
  rbNenhum.Checked := false;
  rgrpFaixa.Visible := true;
  AjustaTela();
end;  

procedure TfrmEventoRegInadimplencia.rbTempoInadClick(Sender: TObject);
begin
  inherited;
  rbNenhum.Checked  := false;
  rgrpFaixa.Visible := false;
  AjustaTela();
end;

procedure TfrmEventoRegInadimplencia.AjustaTela;
begin
  if (rbQtdContrib.checked) then
     gbContribuicaoInad.left := rgOpcao.left + rgOpcao.width + 6;

  if (rbTempoInad.checked) then
  begin
    if (not rbQtdContrib.checked) then
       grpTempo.left := rgOpcao.left + rgOpcao.width + 6
    else
       grpTempo.left := gbContribuicaoInad.Left + gbContribuicaoInad.width + 6;
  end;

  grpTempo.Visible  := rbTempoInad.checked;
  gbContribuicaoInad.Visible := rbQtdContrib.checked;

end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.bbtnGerarAquivoClick(Sender: TObject);
var
     sMsgErro : String;
     idPessoaSepVirgual : String;
begin
  inherited;

  //Inicio - Fim Helio - SOL Nº 253577/17744 PPM Nº 1063636
  GeraAquivosExcel;

   If Not gbContribuicaoInad.Visible then
      Exit;

   If Not chkContribAtrsConsec.Checked then
       Exit;

   If StrToInt(spNContrib.Text) < 3 then
       Exit;
  
   if MsgDlg('Deseja registrar o evento de inadimplência? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrYes
   then
        Exit;
  //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

  FiltraParticipantesSelecionados;

 {Se a Tabela de Participantes Selecionados estiver vazia, ou não estiver ativa}
  if (qryParticip.State in [dsInactive]) or (qryParticip.IsEmpty) then
     begin
          MsgDlg('Nenhum Participante foi selecionado.','Erro',mtError,[mbOk,mbHelp],0);
          exit;
     end;

  if sFlgInterno <> 'RI' then
  begin
      //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
      //Abre tela pedindo a Nova Situacao do Plano
      {frmLerSituacaoPlano := TfrmLerSituacaoPlano.Create(Self);
      frmLerSituacaoPlano.Caption     := 'Situação do Participante no Plano para Cancelamento';
      frmLerSituacaoPlano.sflgInterno := 'CI';
      frmLerSituacaoPlano.sIdEvento   := sIdEventoGerador;
      frmLerSituacaoPlano.sMensagem   := 'A Nova Situação do Participante no Plano deve ser informada.';
      frmLerSituacaoPlano.sMensFund   := 'A Nova Situação do Participante na Fundação deve ser informada.';
      frmLerSituacaoPlano.ShowModal;

      if frmLerSituacaoPlano.bBotaoOk  = False
      then begin
         frmLerSituacaoPlano.Free;
         Exit;
      end;}
      //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636


      qryParticip.First;
      while not qryParticip.EOF do
      begin

          //VerificaeGravaSituacoes; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
          VerificaEstadoEvento;
          //SuspendeContribuicoes; //Helio - SOL Nº 253577/17744 PPM Nº 1063636

          AssociaNovasContribuicoes(qryParticip.FieldByName('IDPESSJUR').AsString, qryParticip.FieldByName('IDPLANOPREV').AsString,
                                    qryParticip.FieldByName('IDPESSOA').AsString, qryParticip.FieldByName('SEQPROPOSTA').AsString,
                                    sIdEventoGerador, '', '', qryParticip.FieldByName('MATRICULA').AsString,
                                    qryParticip.FieldByName('IDSITPART').AsString, '',False, True,
                                    False, 
                                    qryAux, qryGrava,
                                    sFlgInterno,iIdEventoPrev,'');

         if not ApagaDotacao (qryParticip.FieldByName('IDPESSJUR').AsInteger,
                              qryParticip.FieldByName('IDPLANOPREV').AsInteger,
                              qryParticip.FieldByName('IDPESSOA').AsInteger,
                              qryParticip.FieldByName('SEQPROPOSTA').AsInteger,
                              '',
                              sMsgErro)
         then begin
            MsgDlg('Erro : '+sMsgErro+'Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
            Exit;
         end;

         if not AbateSalario (qryParticip.FieldByName('IDPESSJUR').AsInteger,
                              qryParticip.FieldByName('IDPLANOPREV').AsInteger,
                              qryParticip.FieldByName('IDPESSOA').AsInteger,
                              qryParticip.FieldByName('SEQPROPOSTA').AsInteger,
                              '',
                              sMsgErro)
         then begin
            MsgDlg('Erro : '+sMsgErro+'Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
            Exit;
         end;
          qryParticip.Next;
      end;

      frmLerSituacaoPlano.Free;

      //MontaArquivoExcel(); //Helio - SOL Nº 253577/17744 PPM Nº 1063636
  end
  else begin
      //Helio - SOL Nº 253577/17744 PPM Nº 1063636
      {// Abre tela pedindo a Nova Situacao do Plano
      frmLerSituacaoPlano := TfrmLerSituacaoPlano.Create(Self);
      frmLerSituacaoPlano.Caption     := 'Situação do Participante no Plano para Registro';
      frmLerSituacaoPlano.sflgInterno := 'RI'; 
      frmLerSituacaoPlano.sIdEvento   := sIdEventoGerador;
      frmLerSituacaoPlano.sMensagem   := 'A Nova Situação do Participante no Plano deve ser informada.';
      frmLerSituacaoPlano.sMensFund   := 'A Nova Situação do Participante na Fundação deve ser informada.';
      frmLerSituacaoPlano.ShowModal;

      if frmLerSituacaoPlano.bBotaoOk  = False
      then begin
         frmLerSituacaoPlano.Free;
         Exit;
      end;}
      //Helio - SOL Nº 253577/17744 PPM Nº 1063636

      frmAguarde.Mostra('Registrando Eventos ....');
      qryParticip.First;
      while not qryParticip.EOF do
      begin
          Application.ProcessMessages;
          //VerificaeGravaSituacoes; //Helio - SOL Nº 253577/17744 PPM Nº 1063636
          VerificaEstadoEvento;
          qryParticip.Next;
      end;

      frmAguarde.Apaga;
      frmLerSituacaoPlano.Free;

      //MontaArquivoExcel(); //Helio - SOL Nº 253577/17744 PPM Nº 1063636
  end;

  
end;

function TfrmEventoRegInadimplencia.TrocaCaracter(aStr, aOld, aNew : String) : string;
begin
  Result := StringReplace(aStr, aOld, aNew, [rfReplaceAll]);
end;

procedure TfrmEventoRegInadimplencia.SplitString(sDelimitador, sTexto : string; var lstLista : TStringList);
var
  i : byte;
begin
  if copy(sTexto, length(sTexto),1) <> sDelimitador then
     sTexto := sTexto + sDelimitador;
  while length(sTexto) > 0 do
  begin
    i := pos(sDelimitador, sTexto);
    if i = 0 then
       i := length(sTexto);

    lstLista.Add( copy(sTexto, 1, i-1) );

    sTexto := StringReplace(sTexto, lstLista.Strings[lstLista.count-1]+sDelimitador, '', []);
  end;
end;

//Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
//procedure TfrmEventoRegInadimplencia.MontaArquivoExcel();
//   procedure FormataColunas;
//   begin
//     //Sheet.Columns[1].NumberFormat := '@';      //  cpf
//     //Sheet.Columns[6].NumberFormat := '@';      // data
//     //Sheet.Columns[7].NumberFormat := '@';      // data
//     //Sheet.Columns[9].NumberFormat := '@';      // data
//  end;
//var
//  lstDados : TStringList;
//  lstLinha : TStringList;
//  lstCabec : TStringList;
//  ind, col : byte;
//  lin      : integer;
//  sLinha   : string;
//  sNomeArquivoTXT : string;
//  ExcelApp : Variant;
//  Sheet    : Variant;
//  qryTemp : TwwQuery;
//begin
//
//   sNomeArquivoTXT := '';
//   with SaveDlg do
//       if Execute then
//          sNomeArquivoTXT := FileName;
//
//   if sNomeArquivoTXT = '' then
//       Exit;
//
//
//   try
//
//      qryTemp := TwwQuery.Create(Application);
//      qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
//
//      qryTemp.SQL.Text := ConstruiSQLDemonstrativo;
//      qryTemp.Open;
//
//      lstCabec := TStringList.create;
//      lstLinha := TStringList.create;
//      lstDados := TStringList.create;
//
//      lstDados.Add('MATRICULA'+#59+'NOME'+#59+'E-MAIL'+#59+'ENDERECO/CEP'+#59+'TELEFONE'+#59+'DATA DO ENVIO'+#59+'MES REFERENCIA'+#59+'NOME CONTRIBUICAO'+#59+'VALOR CONTRIBUICAO'+#59+'JUROS/CORRECAO'+#59+'TOTAL'+#59+'MES INICIO'+#59+'MES FIM'+#59+'DATA VENCIMENTO');
//
//      ExcelApp:=CreateOleObject('Excel.Application');
//      ExcelApp.Visible:=false;
//      ExcelApp.WorkBooks.Add(-4167);
//      ExcelApp.WorkBooks[1].WorkSheets[1].Name:='Sheet1';
//      sheet:=ExcelApp.WorkBooks[1].WorkSheets['Sheet1'];
//
//     //Sheet := ExcelApp.ActiveWorkbook.WorkSheets['Plan1'];
//     Application.ProcessMessages;
//     FormataColunas();
//     {* insere titulo colunas *}
//     lstCabec.clear;
//     SplitString(';', lstDados.Strings[0], lstCabec);
//     for col := 0 to lstCabec.Count-1 do
//        Sheet.Cells[1, col+1] := lstCabec.Strings[col];
//     FormataColunas();
//     lin := 2;
//     qryTemp.first;
//     while not(qryTemp.Eof) do
//     begin
//        lstLinha.clear;
//        lstLinha.Add(qryTemp.FieldByName('MATRICULA').AsString);
//        lstLinha.Add(qryTemp.FieldByName('NOME').AsString);
//        lstLinha.Add(qryTemp.FieldByName('EMAIL').AsString);
//        lstLinha.Add(qryTemp.FieldByName('ENDERECO').AsString + '/' + qryTemp.FieldByName('CEP').AsString);
//        lstLinha.Add(qryTemp.FieldByName('TELEFONE').AsString);
//        lstLinha.Add(FormatDateTime('dd/mm/yyyy', Date)); //data do envio
//        lstLinha.Add(qryTemp.FieldByName('MESREFERENCIA').AsString);
//        lstLinha.Add(qryTemp.FieldByName('NOMECONTRIBUICAO').AsString);
//        lstLinha.Add(qryTemp.FieldByName('VALORESPERADO').AsString); 
//        lstLinha.Add(qryTemp.FieldByName('VALORJUROS').AsString);
//        lstLinha.Add(qryTemp.FieldByName('TOTALDIVIDA').AsString);
//        lstLinha.Add(qryTemp.FieldByName('MESINICIO').AsString);
//        lstLinha.Add(qryTemp.FieldByName('MESFIM').AsString);
//        lstLinha.Add(qryTemp.FieldByName('DATAVENCIMENTO').AsString);
//
//        for col := 0 to lstLinha.count-1 do
//        begin
//           slinha :=  TrocaCaracter(lstLinha.Strings[col], ';', '');
//           Sheet.Cells[lin, col+1] := sLinha;
//        end;
//        inc(lin);
//
//        qryTemp.next;
//     end;
//
//
//     (* Fecha o Arquivo Independente do resultado da Operação *)
//     ExcelApp.ActiveWorkbook.SaveAs( sNomeArquivoTXT );
//     ExcelApp.ActiveWorkbook.Close(False);
//     ExcelApp.Quit;
//
//     MessageDlg('Arquivo gerado com sucesso!', mtInformation, [mbOK], 0);
//   finally
//      qryTemp.Close;
//      FreeAndNil(qryTemp);
//      FreeAndNil(lstCabec);
//      FreeAndNil(lstLinha);
//      FreeAndNil(lstDados);
//
//   end;
//   
//end;
//Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.GeraArquivoExcel(pathArquivo, sql : String);
var
  lstDados : TStringList;
  lstLinha : TStringList;
  lstCabec : TStringList;
  ind, col : byte;
  lin      : integer;
  sLinha   : string;
  sNomeArquivoTXT : string;
  ExcelApp : Variant;
  Sheet    : Variant;
  qryTemp : TwwQuery;
  strDados : string;
  i : Integer;
begin

   try

      qryTemp := TwwQuery.Create(Application);
      qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

      qryTemp.SQL.Text := sql;
      qryTemp.Open;

      lstCabec := TStringList.create;
      lstLinha := TStringList.create;
      lstDados := TStringList.create;

      strDados := '';
      for i := 0 to qryTemp.FieldCount-1 do
      begin
             if strDados <> '' then strDados := strDados + #59;
             strDados := strDados + qryTemp.Fields[i].DisplayName;
      end;

      lstDados.Add(strDados);

      ExcelApp:=CreateOleObject('Excel.Application');
      ExcelApp.Visible:=false;
      ExcelApp.WorkBooks.Add(-4167);
      ExcelApp.WorkBooks[1].WorkSheets[1].Name:='Sheet1';
      sheet:=ExcelApp.WorkBooks[1].WorkSheets['Sheet1'];

     //Sheet := ExcelApp.ActiveWorkbook.WorkSheets['Plan1'];
     Application.ProcessMessages;
     //FormataColunas();
     {* insere titulo colunas *}
     lstCabec.clear;
     SplitString(';', lstDados.Strings[0], lstCabec);
     for col := 0 to lstCabec.Count-1 do
        Sheet.Cells[1, col+1] := lstCabec.Strings[col];
     //FormataColunas();
     lin := 2;
     qryTemp.first;
     while not(qryTemp.Eof) do
     begin
        lstLinha.clear;

        for i := 0 to qryTemp.FieldCount-1 do
        begin
               lstLinha.Add(qryTemp.Fields[i].AsString);
        end;

        for col := 0 to lstLinha.count-1 do
        begin
           slinha :=  TrocaCaracter(lstLinha.Strings[col], ';', '');
           Sheet.Cells[lin, col+1] := sLinha;
        end;
        inc(lin);

        qryTemp.next;
     end;


     (* Fecha o Arquivo Independente do resultado da Operação *)
     ExcelApp.ActiveWorkbook.SaveAs( pathArquivo );
     ExcelApp.ActiveWorkbook.Close(False);
     ExcelApp.Quit;

     //MessageDlg('Arquivo gerado com sucesso!', mtInformation, [mbOK], 0);
   finally
      qryTemp.Close;
      FreeAndNil(qryTemp);
      FreeAndNil(lstCabec);
      FreeAndNil(lstLinha);
      FreeAndNil(lstDados);

   end;
   
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.GeraArquivoExcelDadosFixos(pathArquivo : string);
var
  lstDados : TStringList;
  lstLinha : TStringList;
  lstCabec : TStringList;
  lstIdPessoas : TStringList;
  ind, col : byte;
  lin      : integer;
  sLinha   : string;
  sNomeArquivoTXT : string;
  ExcelApp : Variant;
  Sheet    : Variant;
  qryTemp : TwwQuery;
  strDados : string;
  i, c : Integer;
  idPessoaSepVirg : string;
begin

   try

      qryTemp := TwwQuery.Create(Application);
      qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;


      idPessoaSepVirg := ObtemIdPessoaSepVirgual;

      lstIdPessoas := TStringList.create;
      lstIdPessoas.Text := StringReplace(idPessoaSepVirg, ', ', #13#10,[rfReplaceAll]);

      qryTemp.SQL.Text := ConstroiSQLDadosFixos(lstIdPessoas[0]) + ' AND 1 = 2';
      qryTemp.Open;


      lstCabec := TStringList.create;
      lstLinha := TStringList.create;
      lstDados := TStringList.create;



      strDados := '';
      for i := 0 to qryTemp.FieldCount-1 do
      begin
             if strDados <> '' then strDados := strDados + #59;
             strDados := strDados + qryTemp.Fields[i].DisplayName;
      end;

      lstDados.Add(strDados);

      ExcelApp:=CreateOleObject('Excel.Application');
      ExcelApp.Visible:=false;
      ExcelApp.WorkBooks.Add(-4167);
      ExcelApp.WorkBooks[1].WorkSheets[1].Name:='Sheet1';
      sheet:=ExcelApp.WorkBooks[1].WorkSheets['Sheet1'];

     //Sheet := ExcelApp.ActiveWorkbook.WorkSheets['Plan1'];
     Application.ProcessMessages;
     //FormataColunas();
     {* insere titulo colunas *}
     lstCabec.clear;
     SplitString(';', lstDados.Strings[0], lstCabec);
     for col := 0 to lstCabec.Count-1 do
        Sheet.Cells[1, col+1] := lstCabec.Strings[col];
     //FormataColunas();
     lin := 2;

     for c := 0 to lstIdPessoas.Count-1 do
     begin
           qryTemp.Close;

           qryTemp.SQL.Clear;
           qryTemp.SQL.Text := ConstroiSQLDadosFixos(lstIdPessoas[c]);
           qryTemp.Open;

           qryTemp.first;
           while not(qryTemp.Eof) do
           begin
              lstLinha.clear;

              for i := 0 to qryTemp.FieldCount-1 do
              begin
                     lstLinha.Add(qryTemp.Fields[i].AsString);
              end;

              for col := 0 to lstLinha.count-1 do
              begin
                 slinha :=  TrocaCaracter(lstLinha.Strings[col], ';', '');
                 Sheet.Cells[lin, col+1] := sLinha;
              end;
              inc(lin);

              qryTemp.next;
           end;
     end;


     (* Fecha o Arquivo Independente do resultado da Operação *)
     ExcelApp.ActiveWorkbook.SaveAs( pathArquivo );
     ExcelApp.ActiveWorkbook.Close(False);
     ExcelApp.Quit;

     //MessageDlg('Arquivo gerado com sucesso!', mtInformation, [mbOK], 0);
   finally
      qryTemp.Close;
      FreeAndNil(qryTemp);
      FreeAndNil(lstCabec);
      FreeAndNil(lstLinha);
      FreeAndNil(lstDados);
      FreeAndNil(lstIdPessoas);

   end;
   
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.GeraArquivoExcelDadosVariaveis(pathArquivo : string);
var
  lstDados : TStringList;
  lstLinha : TStringList;
  lstCabec : TStringList;
  lstIdPessoas : TStringList;
  ind, col : byte;
  lin      : integer;
  sLinha   : string;
  sNomeArquivoTXT : string;
  ExcelApp : Variant;
  Sheet    : Variant;
  qryTemp : TwwQuery;
  strDados : string;
  i, c : Integer;
  idPessoaSepVirg : string;
begin

   try

      qryTemp := TwwQuery.Create(Application);
      qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;


      idPessoaSepVirg := ObtemIdPessoaSepVirgual;

      lstIdPessoas := TStringList.create;
      lstIdPessoas.Text := StringReplace(idPessoaSepVirg, ', ', #13#10,[rfReplaceAll]);

      qryTemp.SQL.Text := ConstroiSQLDadosVariaveis(lstIdPessoas[0]) + ' AND 1 = 2';
      qryTemp.Open;


      lstCabec := TStringList.create;
      lstLinha := TStringList.create;
      lstDados := TStringList.create;



      strDados := '';
      for i := 0 to qryTemp.FieldCount-1 do
      begin
             if strDados <> '' then strDados := strDados + #59;
             strDados := strDados + qryTemp.Fields[i].DisplayName;
      end;

      lstDados.Add(strDados);

      ExcelApp:=CreateOleObject('Excel.Application');
      ExcelApp.Visible:=false;
      ExcelApp.WorkBooks.Add(-4167);
      ExcelApp.WorkBooks[1].WorkSheets[1].Name:='Sheet1';
      sheet:=ExcelApp.WorkBooks[1].WorkSheets['Sheet1'];

     //Sheet := ExcelApp.ActiveWorkbook.WorkSheets['Plan1'];
     Application.ProcessMessages;
     //FormataColunas();
     {* insere titulo colunas *}
     lstCabec.clear;
     SplitString(';', lstDados.Strings[0], lstCabec);
     for col := 0 to lstCabec.Count-1 do
        Sheet.Cells[1, col+1] := lstCabec.Strings[col];
     //FormataColunas();
     lin := 2;

     for c := 0 to lstIdPessoas.Count-1 do
     begin
           qryTemp.Close;

           qryTemp.SQL.Clear;
           qryTemp.SQL.Text := ConstroiSQLDadosVariaveis(lstIdPessoas[c]);
           qryTemp.Open;

           qryTemp.first;
           while not(qryTemp.Eof) do
           begin
              lstLinha.clear;

              for i := 0 to qryTemp.FieldCount-1 do
              begin
                     lstLinha.Add(qryTemp.Fields[i].AsString);
              end;

              for col := 0 to lstLinha.count-1 do
              begin
                 slinha :=  TrocaCaracter(lstLinha.Strings[col], ';', '');
                 Sheet.Cells[lin, col+1] := sLinha;
              end;
              inc(lin);

              qryTemp.next;
           end;
     end;


     (* Fecha o Arquivo Independente do resultado da Operação *)
     ExcelApp.ActiveWorkbook.SaveAs( pathArquivo );
     ExcelApp.ActiveWorkbook.Close(False);
     ExcelApp.Quit;

     //MessageDlg('Arquivo gerado com sucesso!', mtInformation, [mbOK], 0);
   finally
      qryTemp.Close;
      FreeAndNil(qryTemp);
      FreeAndNil(lstCabec);
      FreeAndNil(lstLinha);
      FreeAndNil(lstDados);
      FreeAndNil(lstIdPessoas);

   end;
   
end;

function TfrmEventoRegInadimplencia.ConstruiSQLDemonstrativo : String;
var
    sSQL : string;
begin
      // Se o usuario indicar um participante especifico e optar por nenhum criterio de inadimplencia
  // não exigir que haja HSTCONTRIB
  //if (RgOpcao.ItemIndex = 2) and (sIdPessoa <> '') and (sIdPessoa <> '-1')      // edilaine - SOL 253577-17744 / PPM 1063636 - comentado
  if (rbNenhum.checked) and (sIdPessoa <> '') and (sIdPessoa <> '-1')             // edilaine - SOL 253577-17744 / PPM 1063636
  then begin
     sSQL := ' SELECT                                                                             '+
             '        DISTINCT HST.MESREFERENCIA, ST.FLGINTERNO, PES.NOME AS PARTICIPANTE,        '+
             '        PES.NOME, PATRO.NOME AS PATROCINADORA,                                      '+
             '        PL.NOME AS PLANO,    EL.MATRICULA,       PES.IDPESSOA,                      '+
             '        EL.IDPESSJUR,  PL.IDPLANOPREV,                                              '+
             '        ST.IDSITPART,        ST.FLGINTERNO,                                         '+
             '        PAR.INSCRICAONUMERO, SP.DESCRICAO AS SITUACAOPLANO,                         '+
             '        ST.DESCRICAO AS SITUACAOFUND,                                               '+
             '        SUM(DECODE(HST.FLGDEVOLUCAO,1,-HST.VALORESPERADO,HST.VALORESPERADO)) AS TOTALDIVIDA, '+

             //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
             'PES.EMAIL,' + #13#10 +
             'ENDP.LOGRADOURO||'', ''||ENDP.COMPLEMENTO||'', ''||ENDP.NUMERO AS ENDERECO,' + #13#10 +
             'ENDP.CEP,' + #13#10 +
             'CONTRIB.NOME AS NOMECONTRIBUICAO,' + #13#10 +
             'MIN(HST.MESCOBRANCA) AS MESINICIO,' + #13#10 +
             'MAX(HST.MESCOBRANCA) AS MESFIM,' + #13#10 +
             'CPP.DATAFINAL AS DATAVENCIMENTO,' + #13#10 +
             'ATRCONTRIB.VALOR AS VALORJUROS,' + #13#10 +
             'TEL.NUMERO AS TELEFONE,' + #13#10 +
             'HST.VALORESPERADO' + #13#10 +
             //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

             ' FROM   PARTPREVPLAN PAR,                                                           '+
             '        HSTCONTRIBPREV HST, CONTRIBPREVPARTP CPP, PLANPREV PL,                      '+
             '        PESSOA PES,      ELEGPATRO EL,     PESSOA PATRO,                            '+
             '        SITPART  ST,        SITPLANOPREV SP                                         '+

             //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
             '        , DEPENTIT DE '+
             ',ENDPESS ENDP' + #13#10 +
             ',CONTRIBUICAO CONTRIB' + #13#10 +
             ',HSTATRASOCONTRIB ATRCONTRIB'  + #13#10 +
             ',TELENDPESS TEL'  + #13#10 +
             //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

             ' WHERE (PAR.IDPESSOA          = '+sIdPessoa    +')';

             //William Moreira da Silva SOL 173800 KTN 1609874
             if iValidaChecks > 0 then
             begin
                  sSQL := sSQL  + ' AND (PAR.IDPESSJUR           = '+sIdPessJur   +')'+
                                  ' AND   (PAR.IDPLANOPREV       = '+sIdPlanoPrev +')';
             end

             else
             begin
                  sSQL := sSQL + ' AND   (PAR.SEQPROPOSTA       = '+sSeqProposta +')';
             end;
             //William Moreira da Silva SOL 173800 KTN 1609874

             sSQL := sSQL + ' AND   (PATRO.IDPESSOA        = PAR.IDPESSJUR)                     '+
             ' AND   (PES.IDPESSOA          = PAR.IDPESSOA)                      '+
             ' AND   (CPP.IDPESSJUR         = PAR.IDPESSJUR)                     '+
             ' AND   (CPP.IDPLANOPREV       = PAR.IDPLANOPREV)                   '+
             ' AND   (CPP.IDPESSOA          = PAR.IDPESSOA)                      '+
             ' AND   (CPP.SEQPROPOSTA       = PAR.SEQPROPOSTA)                   ';

             //William Moreira da Silva SOL 173800 KTN 1609874
             if iValidaChecks > 0
             then sSQL := sSQL + ' AND   (HST.IDPESSJUR(+)      = '+sIdPessJur   +')';
             //William Moreira da Silva SOL 173800 KTN 1609874

             sSQL := sSQL + ' AND   (HST.IDPLANOPREV(+)    = '+sIdPlanoPrev +')'+
             ' AND   (HST.IDPESSJUR(+)      = CPP.IDPESSJUR)                     '+
             ' AND   (HST.IDPLANOPREV(+)    = CPP.IDPLANOPREV)                   '+
             ' AND   (HST.IDPESSOA(+)       = CPP.IDPESSOA)                      '+
             ' AND   (HST.SEQPROPOSTA(+)    = CPP.SEQPROPOSTA)                   '+
             ' AND   (HST.IDCONTRIBUICAO(+) = CPP.IDCONTRIBUICAO)                '+
             ' AND   (EL.IDPESSJUR          = PAR.IDPESSJUR)                     '+

             //Helio - SOL Nº 253577/17744 PPM Nº 1063636
             //' AND   (EL.IDPESSOA           = PAR.IDPESSOA)                      '+
             ' AND   (DE.IDPESSOA           = HST.IDPESSOA)                      '+
             ' AND   (EL.IDPESSOA           = DE.IDTITULAR)                      '+
             'AND ENDP.IDPESSOA = PES.IDPESSOA' + #13#10 +
             'AND CONTRIB.IDCONTRIBUICAO = HST.IDCONTRIBUICAO' + #13#10 +
             'AND ATRCONTRIB.NUMRECEBIMENTO(+) = HST.NUMRECEBIMENTO' + #13#10 +
             'AND TEL.IDPESSOA(+) = PES.IDPESSOA' + #13#10 +
             'AND ENDP.IDENDERECO = TEL.IDENDERECO' + #13#10 +
             'AND (TRIM(TEL.TIPO) = ''R'' OR NOT EXISTS(SELECT 1 FROM TELENDPESS TELTEMP WHERE TRIM(TELTEMP.TIPO) = ''R'' AND TELTEMP.IDPESSOA = PES.IDPESSOA AND TELTEMP.IDENDERECO = ENDP.IDENDERECO))' + #13#10 +
             //Helio - SOL Nº 253577/17744 PPM Nº 1063636

             ' AND   (PL.IDPLANOPREV        = CPP.IDPLANOPREV)                   '+
             ' AND   (PL.IDPLANOPREV        = PAR.IDPLANOPREV)                   '+
             ' AND   (PAR.IDSITPART         = ST.IDSITPART)                      '+
             ' AND   (PAR.IDSITPLANOPREV   = SP.IDSITPLANOPREV)                  '+
             ' AND   (SP.DESCRICAO <> ''CANCELADO'')                             ';


       if sFlgInterno = 'RI'
       then sSQL := sSQL + ' AND (SP.FLGINTERNO NOT IN (''IN'', ''CI'') ) '
       else sSQL := sSQL + ' AND (SP.FLGINTERNO NOT IN (''CI'') ) ';
       sSQL := sSQL +
             ' GROUP BY HST.MESREFERENCIA, ST.FLGINTERNO, PES.NOME, PES.NOME, PATRO.NOME,   '+
             '          PL.NOME, EL.MATRICULA, PES.IDPESSOA, EL.IDPESSJUR,  PL.IDPLANOPREV, '+
             '          ST.IDSITPART, ST.FLGINTERNO, PAR.INSCRICAONUMERO, SP.DESCRICAO,     '+
             '          ST.DESCRICAO                                                        '+

             //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
             ',PES.EMAIL,' + #13#10 +
             'CONTRIB.NOME,' + #13#10 +
             'CPP.DATAFINAL,' + #13#10 +
             'hst.numrecebimento,' + #13#10 +
             'ENDP.LOGRADOURO,' + #13#10 +
             'ENDP.COMPLEMENTO,' + #13#10 +
             'ENDP.NUMERO,' + #13#10 +
             'ENDP.CEP,' + #13#10 +
             'ATRCONTRIB.VALOR,' + #13#10 +
             'TEL.NUMERO,' + #13#10 +
             'HST.VALORESPERADO' + #13#10 +
             //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

             ' ORDER BY EL.MATRICULA , HST.MESREFERENCIA ';
  end
  else begin
     sSQL := ' SELECT      '+
             '        DISTINCT HST.MESREFERENCIA, ST.FLGINTERNO, PES.NOME AS PARTICIPANTE, PES.NOME, PATRO.NOME AS PATROCINADORA, '+
             '        PL.NOME AS PLANO,    EL.MATRICULA,       PES.IDPESSOA,       EL.IDPESSJUR,  PL.IDPLANOPREV,       '+
             '        ST.IDSITPART,        ST.FLGINTERNO,                                           '+
             '        PAR.INSCRICAONUMERO, SP.DESCRICAO AS SITUACAOPLANO,  ST.DESCRICAO AS SITUACAOFUND, '+
             '        SUM(DECODE(HST.FLGDEVOLUCAO,1,-HST.VALORESPERADO,HST.VALORESPERADO)) AS TOTALDIVIDA, '+

             //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
             'PES.EMAIL,' + #13#10 +
             'ENDP.LOGRADOURO||'', ''||ENDP.COMPLEMENTO||'', ''||ENDP.NUMERO AS ENDERECO,' + #13#10 +
             'ENDP.CEP,' + #13#10 +
             'CONTRIB.NOME AS NOMECONTRIBUICAO,' + #13#10 +
             'MIN(HST.MESCOBRANCA) AS MESINICIO,' + #13#10 +
             'MAX(HST.MESCOBRANCA) AS MESFIM,' + #13#10 +
             'CPP.DATAFINAL AS DATAVENCIMENTO,' + #13#10 +
             'ATRCONTRIB.VALOR AS VALORJUROS' + #13#10 +
             'TEL.NUMERO AS TELEFONE,' + #13#10 +
             'HST.VALORESPERADO' + #13#10 +
             //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

             'FROM   PARTPREVPLAN PAR,                                         '+
             '       HSTCONTRIBPREV HST, CONTRIBPREVPARTP CPP, PLANPREV PL,    '+
             '       PESSOA PES,      ELEGPATRO EL,     PESSOA PATRO,          '+
             '       SITPART  ST,        SITPLANOPREV SP      '+

             //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
             '        , DEPENTIT DE '+
             ',ENDPESS ENDP' + #13#10 +
             ',CONTRIBUICAO CONTRIB' + #13#10 +
             ',HSTATRASOCONTRIB ATRCONTRIB'  + #13#10 +
             ',TELENDPESS TEL'  + #13#10 +
             //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

             'WHERE  (HST.MESCOBRANCA <= ''' + Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' + Copy(FormatDateTime('dd/mm/yyyy', Date),4,2) + ''')';

     if (sIdPessoa <> '') and (sIdPessoa <> '-1')
     then begin
        if iValidaChecks > 0
           then sSQL := sSQL + ' AND (HST.IDPESSJUR   = '+sIdPessJur   +')';//William Moreira da Silva SOL 173800 KTN 1609874
        sSQL := sSQL + ' AND (HST.IDPLANOPREV = '+sIdPlanoPrev +')';
     end
     else begin
         if Trim(strPatro) <> ''
         then sSQL := sSQL + ' AND (CPP.IDPESSJUR   IN (' + strPatro + ')) ';

         if Trim(strPlano) <> ''
         then sSQL := sSQL + ' AND (CPP.IDPLANOPREV IN (' + strPlano + ')) ';

         //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
         if Trim(strContrib) <> ''
         then sSQL := sSQL + ' AND (CPP.IDCONTRIBUICAO IN (' + strContrib + ')) ';
         //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

     end;

     if (sIdPessoa = '') or (sIdPessoa = '-1')
     then sSQL := sSQL + 'AND    ((HST.VALORRECEBIDO IS NULL) OR (HST.VALORRECEBIDO = 0)) '+
                         'AND    (HST.FLGDEVOLUCAO     = 0)                               ';



     sSQL := sSQL + 'AND    (PATRO.IDPESSOA     = HST.IDPESSJUR)                     '+
                    'AND    (PES.IDPESSOA       = HST.IDPESSOA)                      '+
                    'AND    (CPP.IDPESSJUR      = HST.IDPESSJUR)                     '+
                    'AND    (CPP.IDPLANOPREV    = HST.IDPLANOPREV)                   '+
                    'AND    (CPP.IDPESSOA       = HST.IDPESSOA)                      '+
                    'AND    (CPP.SEQPROPOSTA    = HST.SEQPROPOSTA)                   '+
                    'AND    (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO)                '+
                    'AND    (PAR.IDPESSJUR      = HST.IDPESSJUR)                     '+
                    'AND    (PAR.IDPLANOPREV    = HST.IDPLANOPREV)                   '+
                    'AND    (PAR.IDPESSOA       = HST.IDPESSOA)                      '+
                    'AND    (PAR.SEQPROPOSTA    = HST.SEQPROPOSTA)                   '+
                    'AND    (EL.IDPESSJUR       = PAR.IDPESSJUR)                     '+

                    //Helio - SOL Nº 253577/17744 PPM Nº 1063636
                    //' AND   (EL.IDPESSOA           = PAR.IDPESSOA)                      '+
                    ' AND   (DE.IDPESSOA           = HST.IDPESSOA)                      '+
                    ' AND   (EL.IDPESSOA           = DE.IDTITULAR)                      '+
                    'AND ENDP.IDPESSOA = PES.IDPESSOA' + #13#10 +
                    'AND CONTRIB.IDCONTRIBUICAO = HST.IDCONTRIBUICAO' + #13#10 +
                    'AND ATRCONTRIB.NUMRECEBIMENTO(+) = HST.NUMRECEBIMENTO' + #13#10 +
                    'AND TEL.IDPESSOA(+) = PES.IDPESSOA' + #13#10 +
                    'AND ENDP.IDENDERECO = TEL.IDENDERECO' + #13#10 +
                    'AND (TRIM(TEL.TIPO) = ''R'' OR NOT EXISTS(SELECT 1 FROM TELENDPESS TELTEMP WHERE TRIM(TELTEMP.TIPO) = ''R'' AND TELTEMP.IDPESSOA = PES.IDPESSOA AND TELTEMP.IDENDERECO = ENDP.IDENDERECO))' + #13#10 +
                    //Helio - SOL Nº 253577/17744 PPM Nº 1063636

                    'AND    (PL.IDPLANOPREV     = CPP.IDPLANOPREV)                   '+
                    'AND    (PL.IDPLANOPREV     = PAR.IDPLANOPREV)                   '+
                    'AND    (PAR.IDSITPART      = ST.IDSITPART)                      '+
                    'AND    (PAR.IDSITPLANOPREV = SP.IDSITPLANOPREV)                 ';

     if (sIdPessoa <> '') and (sIdPessoa <> '-1')
     then begin
        if iValidaChecks > 0
           then sSQL := sSQL + ' AND (HST.IDPESSJUR   = '+sIdPessJur   +')';//William Moreira da Silva SOL 17800 KTN 1609874
       sSQL := sSQL + ' AND (HST.IDPLANOPREV = '+sIdPlanoPrev +')';
       sSQL := sSQL + ' AND (HST.IDPESSOA    = '+sIdPessoa    +')';
       sSQL := sSQL + ' AND (HST.SEQPROPOSTA = '+sSeqProposta +')';
     end
     else begin
        if rdSitPart.ItemIndex = 0
        then sSQL    := sSQL + ' AND (ST.FLGINTERNO = ''AT'' ) '
        else if rdSitPart.ItemIndex = 1
             then sSQL    := sSQL + ' AND (ST.FLGINTERNO = ''MA'' ) '
        else if rdSitPart.ItemIndex = 2        // edilaine - SOL 253577-17744 / PPM 1063636 - inicio
             then sSQL    := sSQL + ' AND (ST.FLGINTERNO = ''MP'' ) '
        else if rdSitPart.ItemIndex = 3
             then sSQL    := sSQL + ' AND (ST.FLGINTERNO = ''AS'' ) '
             else sSQL    := sSQL + ' AND (ST.FLGINTERNO = ''MS'' ) ';
        // edilaine - SOL 253577-17744 / PPM 1063636 - inicio

     end;

     if sFlgInterno = 'RI'
     then sSQL := sSQL + ' AND (SP.FLGINTERNO NOT IN (''IN'', ''CI'') ) '
     else sSQL := sSQL + ' AND (SP.FLGINTERNO NOT IN (''CI'') ) ';

     if {(RgOpcao.ItemIndex = 1)} rbTempoInad.checked    // edilaine - SOL 253577-17744 / PPM 1063636
     then begin
        // Quantidade de meses
        //sSQL := sSQL + ' AND TRUNC(MONTHS_BETWEEN(SYSDATE,HST.DATAPREVISAORECE),0) ' + cmbmes.Text + ' ' + IntToStr(spedMeses.Value); //Helio - SOL Nº 253577/17744 PPM Nº 1063636
        sSQL := sSQL +
             ' GROUP BY HST.MESREFERENCIA, ST.FLGINTERNO, PES.NOME, PES.NOME, PATRO.NOME, '+
             '        PL.NOME, EL.MATRICULA, PES.IDPESSOA, EL.IDPESSJUR, PL.IDPLANOPREV, ST.IDSITPART,   '+
             '        ST.FLGINTERNO, PAR.INSCRICAONUMERO, SP.DESCRICAO, ST.DESCRICAO, PL.NOME '+//William Moreira da Silva SOL 173800 KTN 1609874

             //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
             ',PES.EMAIL,' + #13#10 +
             'CONTRIB.NOME,' + #13#10 +
             'CPP.DATAFINAL,' + #13#10 +
             'hst.numrecebimento,' + #13#10 +
             'ENDP.LOGRADOURO,' + #13#10 +
             'ENDP.COMPLEMENTO,' + #13#10 +
             'ENDP.NUMERO,' + #13#10 +
             'ENDP.CEP,' + #13#10 +
             'ATRCONTRIB.VALOR,' + #13#10 +
             'TEL.NUMERO,' + #13#10 +
             'HST.VALORESPERADO' + #13#10 +
             //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

             ' ORDER BY EL.MATRICULA  ';
     end
     else sSQL    := sSQL +
             ' GROUP BY HST.MESREFERENCIA, ST.FLGINTERNO, PES.NOME, PES.NOME, PATRO.NOME, '+
             '        PL.NOME, EL.MATRICULA, PES.IDPESSOA, EL.IDPESSJUR, PL.IDPLANOPREV, ST.IDSITPART,   '+
             '        ST.FLGINTERNO, PAR.INSCRICAONUMERO, SP.DESCRICAO, ST.DESCRICAO, PL.NOME '+//William Moreira da Silva SOL 173800 KTN 1609874
             
             //Inicio - Helio - SOL Nº 253577/17744 PPM Nº 1063636
             ',PES.EMAIL,' + #13#10 +
             'CONTRIB.NOME,' + #13#10 +
             'CPP.DATAFINAL,' + #13#10 +
             'hst.numrecebimento,' + #13#10 +
             'ENDP.LOGRADOURO,' + #13#10 +
             'ENDP.COMPLEMENTO,' + #13#10 +
             'ENDP.NUMERO,' + #13#10 +
             'ENDP.CEP,' + #13#10 +
             'ATRCONTRIB.VALOR,' + #13#10 +
             'TEL.NUMERO,' + #13#10 +
             'HST.VALORESPERADO' + #13#10 +
             //Fim - Helio - SOL Nº 253577/17744 PPM Nº 1063636

             ' ORDER BY EL.MATRICULA , HST.MESREFERENCIA ';

   end;

   Result := sSQL;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
function TfrmEventoRegInadimplencia.VerificaPreenchimentoDetalhar : boolean;
begin
   
//   if (sIdPessoa = '') or (sIdPessoa = '-1') then
//   begin
//         Result := True;
//         Exit;
//   end;

   Result := False;
   strPatro   := ObtemPatrosSelPorVirg;
   strPlano   := ObtemPlanosSelPorVirg;
   strContrib := ObtemContribsSelPorVirg;

   try
      if Trim(strPatro) = '' then
         raise EValidacao.CreateVal('É necessário selecionar pelo menos uma patrocinadora.', chklstPatro);
         
      if Trim(strPlano) = '' then
         raise EValidacao.CreateVal('É necessário selecionar pelo menos um plano previdenciário.', chklstPlano);

      if rgrpFaixa.Visible then
      if (dtFaixaIni.text = '') then
         raise EValidacao.CreateVal('A data inicial deverá ser informada.', dtFaixaIni);

      if rgrpFaixa.Visible then
      if (dtFaixaFim.text = '') then
         raise EValidacao.CreateVal('A data final deverá ser informada.', dtFaixaFim);

      if rgrpFaixa.Visible then
      if (dtFaixaIni.date > dtFaixaFim.date) then
         raise EValidacao.CreateVal('A data inicial deverá ser menor ou igual a data final.', dtFaixaIni);

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;

end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
function TfrmEventoRegInadimplencia.ObtemCriterioInadSel : Integer;
begin
      Result := -1;

      if rbQtdContrib.Checked then
           Result := CRITERIO_INAD_QTD_CONTRIB;

      if rbTempoInad.Checked then
           Result := CRITERIO_INAD_TEMPO_INAD;

       if rbNenhum.Checked then
           Result := CRITERIO_INAD_NENHUM;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.AbreQryDetalheCriInadQtdContrib;
begin
      if chkContribAtrsConsec.Checked then
          AbreQryDetalheCriInadQtdContribConsecutiva
      else
         AbreQryDetalheCriInadQtdContribNaoConsecutiva
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.AbreQryDetalheCriInadQtdContribConsecutiva;
var
     situacaoSelPorVig,
     espacoAndSQL,
     sqlAndIn : string;
begin
       qryDetalhe.Close;

       strPatro   := ObtemPatrosSelPorVirg;
       strPlano   := ObtemPlanosSelPorVirg;
       strContrib := ObtemContribsSelPorVirg;
       situacaoSelPorVig := ObtemSituacoesSelPorVirg;

       espacoAndSQL := '                         ';
       sqlAndIn := '';
       if Trim(situacaoSelPorVig) <> '' then sqlAndIn := espacoAndSQL + 'AND S.FLGINTERNO IN (' + situacaoSelPorVig + ')--SITUAÇÃO' + #13#10;
       if Trim(strPlano) <> ''          then sqlAndIn := sqlAndIn + espacoAndSQL + 'AND H.IDPLANOPREV IN (' + strPlano + ')--PLANO' + #13#10;
       if Trim(strPatro) <> ''          then sqlAndIn := sqlAndIn + espacoAndSQL + 'AND H.IDPESSJUR IN (' + strPatro + ')--PATRO' + #13#10;
       if Trim(strContrib) <> ''        then sqlAndIn := sqlAndIn + espacoAndSQL + 'AND H.IDCONTRIBUICAO IN (' + strContrib + ')--IDCONTRIBUICAO' + #13#10;
       if (sIdPessoa <> '-1') And (Trim(sIdPessoa) <> '') then sqlAndIn := sqlAndIn + '          AND H.IDPESSOA IN (' + sIdPessoa + ')--IDPESSOA' + #13#10;

       

       qryDetalhe.SQL.Clear;

       qryDetalhe.SQL.Text := 'SELECT DISTINCT' + #13#10 +
                              '      DE.MATRICULA,' + #13#10 +
                              '      P.NOME,' + #13#10 +
                              '      PL.NOME PLANO,' + #13#10 +
                              '      P1.NOME PATRO,' + #13#10 +
                              '      PL.IDPLANOPREV,' + #13#10 +
                              '      P1.IDPESSOA AS IDPATRO,' + #13#10 +
                              '      P1.NOME AS IDPATRO,' + #13#10 +
                              '      S.DESCRICAO,' + #13#10 +
                              '      DE.IDTITULAR,' + #13#10 +
                              '      DE.IDPESSOA' + #13#10 +
                              ' FROM' + #13#10 +
                              '(SELECT Z.IDPESSOA,' + #13#10 +
                              '       Z.MESREFERENCIA,' + #13#10 +
                              '       Z.QTD_NAOPAGA,' + #13#10 +
                              '       DECODE(Z.QTD_NAOPAGA, 0, ''Paga'', ''Aberta'') AS STATUS_MES_ATUAL,' + #13#10 +
                              '       DECODE(Z.QTD_NAOPAGA,' + #13#10 +
                              '              0,' + #13#10 +
                              '              NULL,' + #13#10 +
                              '              DENSE_RANK() OVER(PARTITION BY Z.GRUPO ORDER BY Z.IDPESSOA, Z.IDPLANOPREV, Z.IDPESSJUR, Z.MESREFERENCIA)) AS CONSECUTIVAS,' + #13#10 +
                              '        Z.IDPLANOPREV,' + #13#10 +
                              '        Z.IDPESSJUR' + #13#10 +
                              '  FROM (SELECT Y.*, MAX(Y.MUDOU) OVER(ORDER BY Y.IDPESSOA, Y.IDPLANOPREV, Y.IDPESSJUR, Y.MESREFERENCIA, Y.SEQ) AS GRUPO' + #13#10 +
                              '          FROM (SELECT X.*,' + #13#10 +
                              '                       CASE' + #13#10 +
                              '                         WHEN (X.IDPESSOA <> LAG(X.IDPESSOA) OVER(ORDER BY X.IDPESSOA, X.IDPLANOPREV, X.IDPESSJUR, X.MESREFERENCIA, X.SEQ)) THEN' + #13#10 +
                              '                                  SEQ' + #13#10 +
                              '                         WHEN (X.IDPLANOPREV <> LAG(X.IDPLANOPREV) OVER(ORDER BY X.IDPESSOA, X.IDPLANOPREV, X.IDPESSJUR, X.MESREFERENCIA, X.SEQ)) THEN' + #13#10 +
                              '                                  SEQ' + #13#10 +
                              '                         WHEN (X.IDPESSJUR <> LAG(X.IDPESSJUR) OVER(ORDER BY X.IDPESSOA, X.IDPLANOPREV, X.IDPESSJUR, X.MESREFERENCIA, X.SEQ)) THEN' + #13#10 +
                              '                                  SEQ' + #13#10 +
                              '                         WHEN'  + #13#10 +
                              '                           QTD_NAOPAGA = LAG(QTD_NAOPAGA) OVER(ORDER BY X.IDPESSOA, X.IDPLANOPREV, X.IDPESSJUR, X.MESREFERENCIA, X.SEQ) THEN' + #13#10 +
                              '                          NULL' + #13#10 +
                              '                         ELSE' + #13#10 +
                              //'                          TO_CHAR( TO_DATE(X.MESREFERENCIA, ''YYYY/MM''), ''YYYYMM'')||X.IDPESSOA||X.IDPLANOPREV||X.IDPESSJUR' + #13#10 +
                              '                          SEQ--X.IDPLANOPREV||X.MESREFERENCIA||X.IDPESSOA||X.IDPESSJUR' + #13#10 +
                              '                       END AS MUDOU' + #13#10 +
                              '                  FROM (SELECT H.IDPESSOA,' + #13#10 +
                              '                               H.MESREFERENCIA,' + #13#10 +
                              '                               DECODE(SUM(DECODE(H.SITRECEBIMENTO,' + #13#10 +
                              '                                                 0,' + #13#10 +
                              '                                                 1, -- /*''Nao Enviada''*/,' + #13#10 +
                              '                                                 1,' + #13#10 +
                              '                                                 1, -- ''Enviada e não recebida'',' + #13#10 +
                              '                                                 --3,' + #13#10 +
                              '                                                 --1, -- ''Recebida com divergência (NT)'',' + #13#10 +
                              '                                                 --4,' + #13#10 +
                              '                                                 --1, -- ''Atrasada e ja tratada'',' + #13#10 +
                              '                                                 --6,' + #13#10 +
                              '                                                 --1, -- ''Divergência enviada e não recebida'',' + #13#10 +
                              '                                                 --7,' + #13#10 +
                              '                                                 --1, -- ''Financiada ou Renegociada ''' + #13#10 +
                              '                                                 0)),' + #13#10 +
                              '                                      0,' + #13#10 +
                              '                                      0,' + #13#10 +
                              '                                      1) AS QTD_NAOPAGA,' + #13#10 +
                              '                               RANK() OVER(ORDER BY H.IDPESSOA, H.IDPLANOPREV, H.IDPESSJUR, H.MESREFERENCIA) AS SEQ,' + #13#10 +
                              '                               H.IDPLANOPREV,' + #13#10 +
                              '                               H.IDPESSJUR' + #13#10 +
                              '                          FROM' + #13#10 +
                              '                               HSTCONTRIBPREV H' + #13#10 +
                              '                               JOIN DEPENTIT DE' + #13#10 +
                              '                                 ON DE.IDPESSOA = H.IDPESSOA' + #13#10 +
                              '                               JOIN PARTPREVPLAN PP' + #13#10 +
                              '                                 ON PP.IDPESSOA = DE.IDTITULAR' + #13#10 +
                              '                                AND PP.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                              '                                AND PP.IDPESSJUR = H.IDPESSJUR' + #13#10 +
                              '                                JOIN SITPART S' + #13#10 +
                              '                                  ON S.IDSITPART = PP.IDSITPART' + #13#10 +
                              '                                 --AND S.FLGINTERNO NOT IN (''CA'')' + #13#10 +
                              '                         WHERE H.MESREFERENCIA BETWEEN  TO_CHAR(TO_DATE(''' + dtFaixaIni.Text + ''',''DD/MM/YYYY''),''YYYY/MM'') AND TO_CHAR(TO_DATE(''' + dtFaixaFim.Text + ''',''DD/MM/YYYY''),''YYYY/MM'')' + #13#10
                              +sqlAndIn+#13#10+
                              '                               AND H.FLGDEVOLUCAO = 0' + #13#10 +
                              '                               AND (S.IDSITPART = 10 OR S.FLGINTERNO NOT IN (''CA''))' + #13#10 +
                              '                               AND NOT EXISTS(SELECT 1 FROM EVENTOSPREV EVNT' + #13#10 +
                              '                                WHERE IDPESSJUR = H.IDPESSJUR' + #13#10 +
                              '                                      AND EVNT.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                              '                                      AND EVNT.IDPESSOA = H.IDPESSOA' + #13#10 +
                              '                                      AND EVNT.SEQPROPOSTA = H.SEQPROPOSTA' + #13#10 +
                              '                                      AND EVNT.DATAVOLTA IS NULL' + #13#10 +
                              '                                      AND EVNT.IDEVENTOGERADOR = 274)' + #13#10 +
                              '                         GROUP BY H.IDPESSOA, H.IDPLANOPREV, H.IDPESSJUR, H.MESREFERENCIA' + #13#10 +
                              '                         ORDER BY H.IDPESSOA, H.IDPLANOPREV, H.IDPESSJUR, H.MESREFERENCIA' + #13#10 +
                              '                         ) X) Y) Z) PARC' + #13#10 +
                              'INNER JOIN DEPENTIT DE' + #13#10 +
                              '   ON DE.IDPESSOA = PARC.IDPESSOA' + #13#10 +
                              'INNER JOIN PESSOA P' + #13#10 +
                              '  ON P.IDPESSOA = PARC.IDPESSOA' + #13#10 +
                              'INNER JOIN PLANPREV PL' + #13#10 +
                              '  ON PL.IDPLANOPREV = PARC.IDPLANOPREV' + #13#10 +
                              'INNER JOIN PESSOA P1' + #13#10 +
                              '  ON P1.IDPESSOA = PARC.IDPESSJUR' + #13#10 +
                              'INNER JOIN PARTPREVPLAN PP' + #13#10 +
                              '  ON PP.IDPESSOA = DE.IDTITULAR' + #13#10 +
                              ' AND PP.IDPLANOPREV = PARC.IDPLANOPREV' + #13#10 +
                              ' AND PP.IDPESSJUR = PARC.IDPESSJUR' + #13#10 +
                              'INNER JOIN SITPART S' + #13#10 +
                              '  ON S.IDSITPART = PP.IDSITPART' + #13#10 +
                              ' --AND S.FLGINTERNO NOT IN (''CA'')' + #13#10 +
                              '  WHERE PARC.CONSECUTIVAS >= ' + spNContrib.Text;


//       qryDetalhe.SQL.Text := 'SELECT DISTINCT' + #13#10 +
//                              '       DE.MATRICULA,' + #13#10 +
//                              '       P.NOME,' + #13#10 +
//                              '       PL.NOME PLANO,' + #13#10 +
//                              '       P1.NOME PATRO,' + #13#10 +
//                              '       PL.IDPLANOPREV,' + #13#10 +
//                              '       P1.IDPESSOA AS IDPATRO,' + #13#10 +
//                              '       S.DESCRICAO,' + #13#10 +
//                              '       DE.IDTITULAR,' + #13#10 +
//                              '       DE.IDPESSOA' + #13#10 +
//                              '  FROM HSTCONTRIBPREV H' + #13#10 +
//                              '  JOIN PESSOA P' + #13#10 +
//                              '    ON P.IDPESSOA = H.IDPESSOA' + #13#10 +
//                              '  JOIN PLANPREV PL' + #13#10 +
//                              '    ON PL.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
//                              '  JOIN PESSOA P1' + #13#10 +
//                              '    ON P1.IDPESSOA = H.IDPESSJUR' + #13#10 +
//                              '  JOIN DEPENTIT DE' + #13#10 +
//                              '    ON DE.IDPESSOA = H.IDPESSOA' + #13#10 +
//                              '  JOIN PARTPREVPLAN PP' + #13#10 +
//                              '    ON PP.IDPESSOA = DE.IDTITULAR' + #13#10 +
//                              '   AND PP.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
//                              '   AND PP.IDPESSJUR = H.IDPESSJUR' + #13#10 +
//                              '  JOIN SITPART S' + #13#10 +
//                              '    ON S.IDSITPART = PP.IDSITPART' + #13#10 +
//                              '   AND S.FLGINTERNO NOT IN (''CA'')' + #13#10 +
//                              '  JOIN CONTRIBUICAO C' + #13#10 +
//                              '    ON C.IDCONTRIBUICAO = H.IDCONTRIBUICAO' + #13#10 +
//                              '     WHERE H.MESREFERENCIA BETWEEN TO_CHAR(TO_DATE(''' + dtFaixaIni.Text + ''',''DD/MM/YYYY''),''YYYY/MM'') AND TO_CHAR(TO_DATE(''' + dtFaixaFim.Text + ''',''DD/MM/YYYY''),''YYYY/MM'')' + #13#10+
//                              '   AND H.SITRECEBIMENTO IN (1,0)' + #13#10
//                              +sqlAndIn+
//                                   '   AND EXISTS (SELECT 1' + #13#10 +
//                              '                 FROM (SELECT Z.IDPESSOA,' + #13#10 +
//                              '                             Z.MESREFERENCIA,' + #13#10 +
//                              '                             Z.QTD_NAOPAGA,' + #13#10 +
//                              '                             DECODE(Z.QTD_NAOPAGA, 0, ''Paga'', ''Aberta'') AS STATUS_MES_ATUAL,' + #13#10 +
//                              '                             DECODE(Z.QTD_NAOPAGA,0,NULL,DENSE_RANK()OVER(PARTITION BY Z.GRUPO ORDER BY Z.IDPESSOA,Z.MESREFERENCIA)) AS CONSECUTIVAS' + #13#10 +
//                              '                        FROM (SELECT Y.*,' + #13#10 +
//                              '                                     MAX(Y.MUDOU) OVER(ORDER BY Y.IDPESSOA, Y.MESREFERENCIA, Y.SEQ) AS GRUPO' + #13#10 +
//                              '                                FROM (SELECT X.*,' + #13#10 +
//                              '                                             CASE' + #13#10 +
//                              '                                               WHEN IDPESSOA = LAG(IDPESSOA)' + #13#10 +
//                              '                                                 OVER(ORDER BY X.IDPESSOA,X.MESREFERENCIA,X.SEQ)' + #13#10 +
//                              '                                               THEN' + #13#10 +
//                              '                                                 NULL' + #13#10 +
//                              '                                               ELSE' + #13#10 +
//                              '                                                 TO_DATE(X.MESREFERENCIA, ''YYYY/MM'')' + #13#10 +
//                              '                                             END AS MUDOU' + #13#10 +
//                              '                                        FROM (SELECT H.IDPESSOA,' + #13#10 +
//                              '                                                     H.MESREFERENCIA,' + #13#10 +
//                              '                                                     DECODE(SUM(DECODE(H.SITRECEBIMENTO,0,1,1,1,1,3,1,4,1,6,1,7,1,0)),0,0,1) AS QTD_NAOPAGA,' + #13#10 +
//                              '                                                     RANK() OVER(ORDER BY H.IDPESSOA, H.MESREFERENCIA, H.IDPLANOPREV) AS SEQ' + #13#10 +
//                              '                                                FROM HSTCONTRIBPREV H' + #13#10 +
//                              '                                                JOIN DEPENTIT DE' + #13#10 +
//                              '                                                  ON DE.IDPESSOA = H.IDPESSOA' + #13#10 +
//                              '                                                JOIN PARTPREVPLAN PP' + #13#10 +
//                              '                                                  ON PP.IDPESSOA = DE.IDTITULAR' + #13#10 +
//                              '                                                 AND PP.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
//                              '                                                 AND PP.IDPESSJUR = H.IDPESSJUR' + #13#10 +
//                              '                                                JOIN SITPART S' + #13#10 +
//                              '                                                  ON S.IDSITPART = PP.IDSITPART' + #13#10 +
//                              '                                                 AND S.FLGINTERNO NOT IN (''CA'')' + #13#10 +
//                              '                                                JOIN CONTRIBUICAO C' + #13#10 +
//                              '                                                  ON C.IDCONTRIBUICAO = H.IDCONTRIBUICAO' + #13#10 +
//                              '                                               WHERE H.MESREFERENCIA BETWEEN  TO_CHAR(TO_DATE(''' + dtFaixaIni.Text + ''',''DD/MM/YYYY''),''YYYY/MM'') AND TO_CHAR(TO_DATE(''' + dtFaixaFim.Text + ''',''DD/MM/YYYY''),''YYYY/MM'')' + #13#10 +
//                              '                                                 AND H.SITRECEBIMENTO IN (1,0)' + #13#10
//                              +sqlAndIn+
//                              '                                                 GROUP BY H.IDPESSOA, H.MESREFERENCIA, H.IDPLANOPREV' + #13#10 +
//                              '                                               ORDER BY H.IDPESSOA, H.MESREFERENCIA, H.IDPLANOPREV' + #13#10 +
//                              '                                             )X' + #13#10 +
//                              '                                      )Y' + #13#10 +
//                              '                             )Z' + #13#10 +
//                              '                      )PARC' + #13#10 +
//                              '         WHERE (PARC.IDPESSOA = H.IDPESSOA)' + #13#10 +
//                              '           AND PARC.CONSECUTIVAS >= ' + spNContrib.Text + ')';

       qryDetalhe.Open;

end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.AbreQryDetalheCriInadQtdContribNaoConsecutiva;
var
     situacaoSelPorVig : string;
begin
       qryDetalhe.Close;

       strPatro   := ObtemPatrosSelPorVirg;
       strPlano   := ObtemPlanosSelPorVirg;
       strContrib := ObtemContribsSelPorVirg;
       situacaoSelPorVig := ObtemSituacoesSelPorVirg;

       qryDetalhe.SQL.Clear;

       qryDetalhe.SQL.Text := 'SELECT * FROM (' + #13#10 +
                           'SELECT COUNT(*) QTDE,' + #13#10 +
                           '       MATRICULA,' + #13#10 +
                           '       NOME,' + #13#10 +
                           '       PLANO,' + #13#10 +
                           '       PATRO,' + #13#10 +
                           '       DESCRICAO,' + #13#10 +
                           '       IDTITULAR,' + #13#10 +
                           '       IDPLANOPREV,' + #13#10 +
                           '       IDPATRO,' + #13#10 +
                           '       IDPESSOA' + #13#10 +
                           'FROM(SELECT DISTINCT DE.MATRICULA,' + #13#10 +
                           '           P.NOME,' + #13#10 +
                           '           PL.NOME PLANO,' + #13#10 +
                           '           P1.NOME PATRO,' + #13#10 +
                           '           S.DESCRICAO,' + #13#10 +
                           '           DE.IDTITULAR,' + #13#10 +
                           '           DE.IDPESSOA,' + #13#10 +
                           '           H.MESREFERENCIA,' + #13#10 +
                           '           PL.IDPLANOPREV,' + #13#10 +
                           '           P1.IDPESSOA AS IDPATRO,' + #13#10 +
                           '           H.MESCOBRANCA,' + #13#10 +
                           '           H.VALORESPERADO' + #13#10 +
                           '      FROM HSTCONTRIBPREV H' + #13#10 +
                           '      JOIN PESSOA P' + #13#10 +
                           '        ON P.IDPESSOA = H.IDPESSOA' + #13#10 +
                           '      JOIN PLANPREV PL' + #13#10 +
                           '        ON PL.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                           '      JOIN PESSOA P1' + #13#10 +
                           '        ON P1.IDPESSOA = H.IDPESSJUR' + #13#10 +
                           '      JOIN DEPENTIT DE' + #13#10 +
                           '        ON DE.IDPESSOA = H.IDPESSOA' + #13#10 +
                           '      JOIN PARTPREVPLAN PP' + #13#10 +
                           '        ON PP.IDPESSOA = DE.IDTITULAR' + #13#10 +
                           '       AND PP.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                           '       AND PP.IDPESSJUR = H.IDPESSJUR' + #13#10 +
                           '      JOIN SITPART S' + #13#10 +
                           '        ON S.IDSITPART = PP.IDSITPART' + #13#10 +
                           '       --AND S.FLGINTERNO NOT IN (''CA'')' + #13#10 +
                           '      JOIN CONTRIBUICAO C' + #13#10 +
                           '        ON C.IDCONTRIBUICAO = H.IDCONTRIBUICAO' + #13#10 +
                           '     WHERE H.MESREFERENCIA BETWEEN TO_CHAR(TO_DATE(''' + dtFaixaIni.Text + ''',''DD/MM/YYYY''),''YYYY/MM'') AND TO_CHAR(TO_DATE(''' + dtFaixaFim.Text + ''',''DD/MM/YYYY''),''YYYY/MM'')' + #13#10+
                           '   AND H.SITRECEBIMENTO IN (1,0)' +#13#10+
                           '   AND DE.IDTITULAR = NVL(H.IDTITULAR, H.IDPESSOA)' +#13#10+
                           '   AND H.FLGDEVOLUCAO = 0' +#13#10+
                           '   AND (S.IDSITPART = 10 OR S.FLGINTERNO NOT IN (''CA''))';

       if Trim(situacaoSelPorVig) <> '' then
            qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND S.FLGINTERNO IN (' + situacaoSelPorVig + ')--SITUAÇÃO' + #13#10;

       if Trim(strPlano) <> '' then
            qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND H.IDPLANOPREV IN (' + strPlano + ')--PLANO' + #13#10;

       if Trim(strPatro) <> '' then
            qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND H.IDPESSJUR IN (' + strPatro + ')--PATRO' + #13#10;


       if Trim(strContrib) <> '' then
            qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND H.IDCONTRIBUICAO IN (' + strContrib + ')--IDCONTRIBUICAO' + #13#10;


       if (sIdPessoa <> '-1') And (Trim(sIdPessoa) <> '') then
        qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND H.IDPESSOA IN (' + sIdPessoa + ')--IDPESSOA' + #13#10;



        qryDetalhe.SQL.Text := qryDetalhe.SQL.Text + #13#10 +
                           'AND NOT EXISTS(SELECT 1 FROM EVENTOSPREV EVNT' + #13#10 +
                           '            WHERE IDPESSJUR = H.IDPESSJUR' + #13#10 +
                           '                  AND EVNT.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                           '                  AND EVNT.IDPESSOA = H.IDPESSOA' + #13#10 +
                           '                  AND EVNT.SEQPROPOSTA = H.SEQPROPOSTA' + #13#10 +
                           '                  AND EVNT.DATAVOLTA IS NULL' + #13#10 +
                           '                  AND EVNT.IDEVENTOGERADOR = ' + sIdEventoGerador + ')' +
                           '    )' + #13#10 +
                           '  GROUP BY MATRICULA,' + #13#10 +
                           '       NOME,' + #13#10 +
                           '       PLANO,' + #13#10 +
                           '       PATRO,' + #13#10 +
                           '       DESCRICAO,' + #13#10 +
                           '       IDTITULAR,' + #13#10 +
                           '       IDPLANOPREV,' + #13#10 +
                           '       IDPATRO,' + #13#10 +
                           '       IDPESSOA' +#13#10+
       '   ) WHERE QTDE >= ' + spNContrib.Text;

      qryDetalhe.Open;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.AbreQryDetalheCriInadTempoInad;
var
     situacaoSelPorVig : string;
     qtdMes : Integer;
     mes,
     mesAtual : String;
     data : TDate;
begin
       qryDetalhe.Close;

       strPatro   := ObtemPatrosSelPorVirg;
       strPlano   := ObtemPlanosSelPorVirg;
       strContrib := ObtemContribsSelPorVirg;
       situacaoSelPorVig := ObtemSituacoesSelPorVirg;
       qtdMes      := StrToInt(spedMeses.Text);
       data         := IncMonth(Date, (qtdMes * -1));
       mes := FormatDateTime('YYYY/MM', data); //reduz a quantidade de meses
       mesAtual := FormatDateTime('YYYY/MM', Date);

       qryDetalhe.SQL.Clear;

       qryDetalhe.SQL.Text := 'SELECT DISTINCT MATRICULA,' + #13#10 +
                              '       NOME,' + #13#10 +
                              '       PLANO,' + #13#10 +
                              '       PATRO,' + #13#10 +
                              '       IDPLANOPREV,' + #13#10 +
                              '       IDPATRO,' + #13#10 +
                              '       IDPESSOA,' + #13#10 +
                              '       DESCRICAO,' + #13#10 +
                              '       IDTITULAR' + #13#10 +
                              'FROM (SELECT DISTINCT' + #13#10 +
                              //'              TO_NUMBER(TRUNC(MONTHS_BETWEEN(SYSDATE,(''28/''||SUBSTR(H.MESREFERENCIA,6,2)||''/''||SUBSTR(H.MESREFERENCIA,1,4))))) NUMERO,' + #13#10 +
                              '              DE.MATRICULA,' + #13#10 +
                              '              P.NOME,' + #13#10 +
                              '              PL.NOME PLANO,' + #13#10 +
                              '              P1.NOME PATRO,' + #13#10 +
                              '              PL.IDPLANOPREV,' + #13#10 +
                              '              P1.IDPESSOA AS IDPATRO,' + #13#10 +
                              '              S.DESCRICAO,' + #13#10 +
                              '              DE.IDTITULAR,' + #13#10 +
                              '              DE.IDPESSOA' + #13#10 +
                              '         FROM HSTCONTRIBPREV H' + #13#10 +
                              '         JOIN PESSOA P' + #13#10 +
                              '           ON P.IDPESSOA = H.IDPESSOA' + #13#10 +
                              '         JOIN PLANPREV PL' + #13#10 +
                              '           ON PL.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                              '         JOIN PESSOA P1' + #13#10 +
                              '           ON P1.IDPESSOA = H.IDPESSJUR' + #13#10 +
                              '         JOIN DEPENTIT DE' + #13#10 +
                              '           ON DE.IDPESSOA = H.IDPESSOA' + #13#10 +
                              '         JOIN PARTPREVPLAN PP' + #13#10 +
                              '           ON PP.IDPESSOA = DE.IDTITULAR' + #13#10 +
                              '          AND PP.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                              '          AND PP.IDPESSJUR = H.IDPESSJUR' + #13#10 +
                              '         JOIN SITPART S' + #13#10 +
                              '           ON S.IDSITPART = PP.IDSITPART' + #13#10 +
                              '          --AND S.FLGINTERNO NOT IN (''CA'')' + #13#10 +
                              '         JOIN CONTRIBUICAO C' + #13#10 +
                              '           ON C.IDCONTRIBUICAO = H.IDCONTRIBUICAO' + #13#10 +
                              '        WHERE H.SITRECEBIMENTO IN (1,0)' + #13#10;

       if Trim(situacaoSelPorVig) <> '' then
            qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND S.FLGINTERNO IN (' + situacaoSelPorVig + ')--SITUAÇÃO' + #13#10;

       if Trim(strPlano) <> '' then
            qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND H.IDPLANOPREV IN (' + strPlano + ')--PLANO' + #13#10;

       if Trim(strPatro) <> '' then
            qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND H.IDPESSJUR IN (' + strPatro + ')--PATRO' + #13#10;


       if Trim(strContrib) <> '' then
            qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND H.IDCONTRIBUICAO IN (' + strContrib + ')--IDCONTRIBUICAO' + #13#10;


       if (sIdPessoa <> '-1') And (Trim(sIdPessoa) <> '') then
        qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND H.IDPESSOA IN (' + sIdPessoa + ')--IDPESSOA' + #13#10;



        qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND SUBSTR(H.MESREFERENCIA,6,2) <> ''13''' + #13#10 +
                                   '          AND DE.IDTITULAR = NVL(H.IDTITULAR, H.IDPESSOA)' + #13#10 +
                                   '    AND H.MESREFERENCIA BETWEEN ' + QuotedStr(mes) + ' AND ' + QuotedStr(mesAtual)  + #13#10 + 
                                   '          AND H.FLGDEVOLUCAO = 0' + #13#10 + 
                                   '          AND (S.IDSITPART = 10 OR S.FLGINTERNO NOT IN (''CA''))' + #13#10 +
                                   '    AND NOT EXISTS(SELECT 1 FROM EVENTOSPREV EVNT' + #13#10 +
                                   '            WHERE IDPESSJUR = H.IDPESSJUR' + #13#10 +
                                   '                  AND EVNT.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                                   '                  AND EVNT.IDPESSOA = H.IDPESSOA' + #13#10 +
                                   '                  AND EVNT.SEQPROPOSTA = H.SEQPROPOSTA' + #13#10 +
                                   '                  AND EVNT.DATAVOLTA IS NULL' + #13#10 +
                                   '                  AND EVNT.IDEVENTOGERADOR = ' + sIdEventoGerador + ')' + ') ';

      qryDetalhe.Open;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.AbreQryDetalheCriInadNenhum;
var
     situacaoSelPorVig : string;
begin
       qryDetalhe.Close;

       strPatro   := ObtemPatrosSelPorVirg;
       strPlano   := ObtemPlanosSelPorVirg;
       strContrib := ObtemContribsSelPorVirg;
       situacaoSelPorVig := ObtemSituacoesSelPorVirg;

       qryDetalhe.SQL.Clear;

       qryDetalhe.SQL.Text := 'SELECT DISTINCT' + #13#10 +
                              '       DE.MATRICULA,' + #13#10 +
                              '       P.NOME,' + #13#10 +
                              '       PL.NOME PLANO,' + #13#10 +
                              '       P1.NOME PATRO,' + #13#10 +
                              '       PL.IDPLANOPREV,' + #13#10 +
                              '       P1.IDPESSOA AS IDPATRO,' + #13#10 +
                              '       S.DESCRICAO,' + #13#10 +
                              '       DE.IDTITULAR,' + #13#10 +
                              '       DE.IDPESSOA' + #13#10 +
                              '  FROM HSTCONTRIBPREV H' + #13#10 +
                              '  JOIN PESSOA P' + #13#10 +
                              '    ON P.IDPESSOA = H.IDPESSOA' + #13#10 +
                              '  JOIN PLANPREV PL' + #13#10 +
                              '    ON PL.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                              '  JOIN PESSOA P1' + #13#10 +
                              '    ON P1.IDPESSOA = H.IDPESSJUR' + #13#10 +
                              '  JOIN DEPENTIT DE' + #13#10 +
                              '    ON DE.IDPESSOA = H.IDPESSOA' + #13#10 +
                              '  JOIN PARTPREVPLAN PP' + #13#10 +
                              '    ON PP.IDPESSOA = DE.IDTITULAR' + #13#10 +
                              '   AND PP.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                              '   AND PP.IDPESSJUR = H.IDPESSJUR' + #13#10 +
                              '  JOIN SITPART S' + #13#10 +
                              '    ON S.IDSITPART = PP.IDSITPART' + #13#10 +
                              '   --AND S.FLGINTERNO NOT IN (''CA'')' + #13#10 +
                              '  JOIN CONTRIBUICAO C' + #13#10 +
                              '    ON C.IDCONTRIBUICAO = H.IDCONTRIBUICAO' + #13#10 +
                              '  WHERE H.SITRECEBIMENTO IN (1,0)' +#13#10+
                              '   AND DE.IDTITULAR = NVL(H.IDTITULAR, H.IDPESSOA)'  + #13#10 + 
                              '   AND H.FLGDEVOLUCAO = 0'  + #13#10 +
                              '   AND (S.IDSITPART = 10 OR S.FLGINTERNO NOT IN (''CA''))'  + #13#10 +
                              '   AND NOT EXISTS(SELECT 1 FROM EVENTOSPREV EVNT' + #13#10 +
                              '            WHERE IDPESSJUR = H.IDPESSJUR' + #13#10 +
                              '                  AND EVNT.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                              '                  AND EVNT.IDPESSOA = H.IDPESSOA' + #13#10 +
                              '                  AND EVNT.SEQPROPOSTA = H.SEQPROPOSTA' + #13#10 +
                              '                  AND EVNT.DATAVOLTA IS NULL' + #13#10 +
                              '                  AND EVNT.IDEVENTOGERADOR = ' + sIdEventoGerador + ')';

       if Trim(situacaoSelPorVig) <> '' then
            qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND S.FLGINTERNO IN (' + situacaoSelPorVig + ')--SITUAÇÃO' + #13#10;

       if Trim(strPlano) <> '' then
            qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND H.IDPLANOPREV IN (' + strPlano + ')--PLANO' + #13#10;

       if Trim(strPatro) <> '' then
            qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND H.IDPESSJUR IN (' + strPatro + ')--PATRO' + #13#10;


       if Trim(strContrib) <> '' then
            qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND H.IDCONTRIBUICAO IN (' + strContrib + ')--IDCONTRIBUICAO' + #13#10;


       if (sIdPessoa <> '-1') And (Trim(sIdPessoa) <> '') then
        qryDetalhe.SQL.Text := qryDetalhe.SQL.Text +
                                   '          AND H.IDPESSOA IN (' + sIdPessoa + ')--IDPESSOA' + #13#10;


      qryDetalhe.Open;
end;


//Helio - SOL Nº 253577/17744 PPM Nº 1063636
function TfrmEventoRegInadimplencia.ObtemPatrosSelPorVirg : String;
var
    i : Integer;
    str : String;
begin
  inherited;
  // Preencher string com Id's das patrocinadoras selecionadas
  str := '';
  for i := 0 to chklstPatro.Items.Count - 1 do
      if chklstPatro.checked[i] then
         begin
            if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive, loPartialKey]) then
               str := str + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
         end;

  if Trim(str) <> '' then
     str := Copy(str, 1, Length(str) - 2);

  Result := str;
 {Fim - Preencher string com Id's das patrocinadoras selecionadas}
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
function TfrmEventoRegInadimplencia.ObtemPlanosSelPorVirg : String;
var
    i : Integer;
    str : String;
begin
  inherited;
 {Preencher string com Id's dos planos selecionados}
  str := '';
  for i := 0 to chklstPlano.Items.Count - 1 do
      if chklstPlano.checked[i] then
         begin
             if qryPlano.Locate('Nome',chklstPlano.Items[i],[loCaseInsensitive, loPartialKey]) then
                str := str + qryPlano.FieldByName('IdPlanoPrev').AsString+ ', ';
         end;

  if Trim(str) <> '' then
     str := Copy(str, 1, Length(str) - 2);

  Result := str;
 {Fim - Preencher string com Id's dos planos selecionados}
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
function TfrmEventoRegInadimplencia.ObtemContribsSelPorVirg : String;
var
    i : Integer;
    str : String;
begin
  inherited;
  str := '';
  for i := 0 to chklstContrib.Items.Count - 1 do
      if chklstContrib.checked[i] then
         begin
             if qryContrib.Locate('Nome',chklstContrib.Items[i],[loCaseInsensitive, loPartialKey]) then
                str := str + qryContrib.FieldByName('IDCONTRIBUICAO').AsString+ ', ';
         end;

  if Trim(str) <> '' then
     str := Copy(str, 1, Length(str) - 2);

  Result := str;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
function TfrmEventoRegInadimplencia.ObtemSituacoesSelPorVirg : String;
var
    str : String;
begin

       if not ((chkAtivos.Checked) or
           (chkMantidosInt.Checked) or
           (chkMantidosParc.Checked) or
           (chkAssistidos.Checked) or
           (chkBPD.Checked)) then
       begin
             Result := '';
             Exit;
       end;

        str := '';

        if chkAtivos.Checked then
             str := '''AT''';

        if chkMantidosInt.Checked then
        begin
             if str <> '' then str := str + ', ';
             str := str + '''MA''';
        end;

        if chkMantidosParc.Checked then
        begin
             if str <> '' then str := str + ', ';
             str := str + '''MP''';
        end;

        if chkAssistidos.Checked then
        begin
             if str <> '' then str := str + ', ';
             str := str + '''AS'', ''CA''';
        end;

        if chkBPD.Checked then
        begin
             if str <> '' then str := str + ', ';
             str := str + '''MS''';
        end;

       Result := str;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.CarregaLstvresultado;
var
    iLista  : TListItem;
begin
       lstvResultado.Items.Clear;
       lbParticip.Clear;
       lbParticipIdPessoa.Clear;
       lbPlano.Clear;
       lbPatro.Clear;


       lstvresultado.Columns[0].Caption := 'Matrícula';
       lstvresultado.Columns[1].Caption := 'Nome';
       lstvresultado.Columns[2].Caption := 'Plano';
       lstvresultado.Columns[3].Caption := 'Patro';
       lstvresultado.Columns[4].Caption := 'Situação';

       qryDetalhe.First;
       While Not qryDetalhe.Eof do
       begin
             iLista          := lstvResultado.items.add;
             iLista.Caption  := qryDetalhe.FieldbyName('MATRICULA').AsString;
             iLista.SubItems.Add(qryDetalhe.FieldbyName('NOME').AsString);
             iLista.SubItems.Add(qryDetalhe.FieldbyName('PLANO').AsString);
             iLista.SubItems.Add(qryDetalhe.FieldbyName('PATRO').AsString);
             iLista.SubItems.Add(qryDetalhe.FieldbyName('DESCRICAO').AsString);

             //lbParticip.Items.Add(qryDetalhe.FieldByName('IDPESSOA').AsString); //Helio - SOL Nº 253577/17744 PPM Nº 1063636
             lbParticipIdPessoa.Items.Add(qryDetalhe.FieldByName('IDPESSOA').AsString);//Helio - SOL Nº 253577/17744 PPM Nº 1063636
             lbParticip.Items.Add(qryDetalhe.FieldByName('IDTITULAR').AsString);
             lbPlano.Items.Add(qryDetalhe.FieldByName('IDPLANOPREV').AsString);
             lbPatro.Items.Add(qryDetalhe.FieldByName('IDPATRO').AsString);

             qryDetalhe.Next;
       end;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.MostraPlnDetalhe;
begin
       pnlDetalhe.Visible  := True;
       pnlDetalhe.BringToFront;
       bbtnDetalhe.Visible       := False;
       bbtnVoltarDetalhe.Visible := True;
       bbtnGerarAquivo.Visible  := True;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.spdTodosClick(Sender: TObject);
var
    i : Integer;
begin
  inherited;
  for i := 0 to lstvresultado.Items.Count-1 do
  begin
        lstvresultado.Items[i].Checked := true;
  end;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.spdInverterClick(Sender: TObject);
var
    i : Integer;
begin
  inherited;
  for i := 0 to lstvresultado.Items.Count-1 do
  begin
        lstvresultado.Items[i].Checked := false;
  end;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
procedure TfrmEventoRegInadimplencia.GeraAquivosExcel;
var
     pathArquivos,
     nomeArquivoDadosFixos,
     nomeArquivoDadosVariaveis,
     dataFormatoNomeArquivo,
     sqlArquivoDadosFixos,
     sqlArquivoDadosVariaveis,
     idPessoaSepVirg : String;
begin

   SelectDirectory('Diretório para gravar arquivos',
                   '',
                   pathArquivos);

   if pathArquivos = '' then
       Exit;

   dataFormatoNomeArquivo    := FormatDateTime('DD_MM_YYYY_HH_NN', Now);
   nomeArquivoDadosFixos     := 'Dados_Fixos_' + dataFormatoNomeArquivo + '.xls';
   nomeArquivoDadosVariaveis := 'Dados_Variaveis_' + dataFormatoNomeArquivo + '.xls';
   idPessoaSepVirg := ObtemIdPessoaSepVirgual;

   //sqlArquivoDadosFixos     := ConstroiSQLDadosFixos(idPessoaSepVirg);
   //sqlArquivoDadosVariaveis := ConstroiSQLDadosVariaveis(idPessoaSepVirg);

   if pathArquivos[Length(pathArquivos)] <> '\' then pathArquivos := pathArquivos + '\'; 

   GeraArquivoExcelDadosFixos(pathArquivos + nomeArquivoDadosFixos);

   GeraArquivoExcelDadosVariaveis(pathArquivos + nomeArquivoDadosVariaveis);

end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
function TfrmEventoRegInadimplencia.ObtemIdPessoaSepVirgual : String;
var
    i : Integer;
    sel : String;
begin
       sel := '';
       i := 0;
       qryDetalhe.First;
       While Not qryDetalhe.Eof do
       begin
              if i < lstvresultado.Items.Count then
              if lstvresultado.Items[i].Checked then
              begin
                     if sel <> '' then sel := sel + ', ';
                     sel := sel + qryDetalhe.FieldByName('IDPESSOA').AsString;
              end;

              Inc(i);
              qryDetalhe.Next;
       end;

       Result := sel;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
function TfrmEventoRegInadimplencia.ConstroiSQLDadosFixos(idPessoaSepVirg : String): String;
var
    sql : String;
begin
      sql := 'SELECT DISTINCT ' + #13#10 +
             '       regexp_replace(LPAD(P.NUMDOCUMENTO, 11, ''0''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'') AS NUMDOCUMENTO,' + #13#10 +
             '       ''''''''||DE.MATRICULA AS MATRICULA,' + #13#10 +
             '       P.NOME,' + #13#10 +
             '       NVL(PF.EMAILFUNCEF,P.EMAIL) EMAIL' + #13#10 +
             '  FROM PESSOA P' + #13#10 +
             '  JOIN DEPENTIT DE' + #13#10 +
             '    ON DE.IDPESSOA = P.IDPESSOA' + #13#10 +
             '  LEFT JOIN PESSOAFISICA PF' + #13#10 +
             '    ON PF.IDPESSOA = P.IDPESSOA' + #13#10 +
             'WHERE P.IDPESSOA IN (' + idPessoaSepVirg + ')' + #13#10 +
             '  AND ((DE.IDPESSOA = DE.IDTITULAR AND EXISTS(SELECT 1 FROM DEPENTIT DE2 WHERE DE2.IDTITULAR = DE.IDPESSOA)) --PARA TITULARES' + #13#10 +
             '  OR DE.IDPESSOA <> DE.IDTITULAR AND NOT EXISTS(SELECT 1 FROM DEPENTIT DE2 WHERE DE2.IDTITULAR = DE.IDPESSOA)) --PARA DEPENDENTES';

      Result := sql;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
function TfrmEventoRegInadimplencia.ConstroiSQLDadosVariaveis(idPessoaSepVirg : String) : String;
var
    sql : String;
begin
      sql := 'SELECT DISTINCT ''''''''||DE.MATRICULA AS MATRICULA,' + #13#10 +
             '       P.NOME,' + #13#10 +
             '       NVL(PF.EMAILFUNCEF,P.EMAIL) EMAIL,' + #13#10 +
             '       REPLACE((E.LOGRADOURO || '', '' || E.NUMERO || '', '' || E.COMPLEMENTO || '', '' || E.CIDADE || '', '' ||E.CODESTADO || ''/ CEP:'' || E.CEP),'' , '','' '') ENDEREÇO,' + #13#10 +
             '       NVL(VALOR.VALOR,0) VALOR,' + #13#10 +
             '       NVL(ALT.ALT,0) ALT,' + #13#10 +
             '       (NVL(VALOR.VALOR,0)+NVL(ALT.ALT,0)) TOTAL,' + #13#10 +
             '       MINREF.REF MINREF,' + #13#10 +
             '       MAXREF.REF MAXREF,' + #13#10 +
             '       ''''''''||MINREF.MINDATAPREV MINDATAPREVRECE,' + #13#10 +
             '       ''''''''||VALOR.DATAVENCTO MAXDATAPREVRECE' + #13#10 +
             '  FROM HSTCONTRIBPREV H' + #13#10 +
             '  LEFT JOIN HSTATRASOCONTRIB HA' + #13#10 +
             '    ON H.NUMRECEBIMENTO = HA.NUMRECEBIMENTO' + #13#10 +
             '   AND H.MESREFERENCIA = HA.MESREFERENCIA' + #13#10 +
             '   AND H.MESCOBRANCA = HA.MESCOBRANCA' + #13#10 +
             '   AND H.IDMOTIVO = HA.IDMOTIVO' + #13#10 +
             '  JOIN (SELECT MIN(MESREFERENCIA) REF,' + #13#10 +
             '               MIN(DATAPREVISAORECE) MINDATAPREV,' + #13#10 +
             '               IDPESSOA,' + #13#10 +
             '               IDPLANOPREV,' + #13#10 +
             '               IDPESSJUR' + #13#10 +
             '          FROM HSTCONTRIBPREV' + #13#10 +
             '         WHERE SITRECEBIMENTO IN (0, 1)' + #13#10 +
             '         GROUP BY IDPESSOA, IDPLANOPREV,IDPESSJUR) MINREF' + #13#10 +
             '    ON MINREF.IDPESSOA = H.IDPESSOA' + #13#10 +
             '   AND MINREF.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
             '   AND MINREF.IDPESSJUR = H.IDPESSJUR' + #13#10 +
             '  JOIN (SELECT MAX(MESREFERENCIA) REF,' + #13#10 +
             '               IDPESSOA,' + #13#10 +
             '               IDPLANOPREV,' + #13#10 +
             '               IDPESSJUR' + #13#10 +
             '          FROM HSTCONTRIBPREV' + #13#10 +
             '         WHERE SITRECEBIMENTO IN (0, 1)' + #13#10 +
             '         GROUP BY IDPESSOA, IDPLANOPREV,IDPESSJUR) MAXREF' + #13#10 +
             '    ON MAXREF.IDPESSOA = H.IDPESSOA' + #13#10 +
             '   AND MAXREF.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
             '   AND MAXREF.IDPESSJUR = H.IDPESSJUR' + #13#10 +
             '  JOIN (SELECT SUM(DECODE(FLGDEVOLUCAO,0,VALORESPERADO,-VALORESPERADO)) VALOR,' + #13#10 +
             '               MAX(DATAPREVISAORECE) DATAVENCTO,' + #13#10 +
             '               IDPESSOA,' + #13#10 +
             '               IDPLANOPREV,' + #13#10 +
             '               IDPESSJUR' + #13#10 +
             '          FROM HSTCONTRIBPREV' + #13#10 +
             // Andre Imakawa - SIG 58182 - Inicio
             '         WHERE SITRECEBIMENTO IN (0, 1)' + #13#10;
             if Trim(strContrib) <> '' then
               sql := sql + ' AND  IDCONTRIBUICAO IN (' + strContrib + ')--IDCONTRIBUICAO' + #13#10;

             sql := sql + '         GROUP BY IDPESSOA, IDPLANOPREV,IDPESSJUR) VALOR' + #13#10 +
             // Andre Imakawa - SIG 58182 - Fim
             '    ON VALOR.IDPESSOA = H.IDPESSOA' + #13#10 +
             '   AND VALOR.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
             '   AND VALOR.IDPESSJUR = H.IDPESSJUR' + #13#10 +
             '  LEFT JOIN (SELECT SUM(DECODE(HA.FLGTIPO,''D'',-HA.VALOR,HA.VALOR)) ALT,' + #13#10 +
             '               H.IDPESSOA,' + #13#10 +
             '               H.IDPLANOPREV,' + #13#10 +
             '               H.IDPESSJUR' + #13#10 +
             '          FROM HSTCONTRIBPREV H' + #13#10 +
             '          LEFT JOIN HSTATRASOCONTRIB HA' + #13#10 +
             '            ON H.NUMRECEBIMENTO = HA.NUMRECEBIMENTO' + #13#10 +
             '           AND H.MESREFERENCIA = HA.MESREFERENCIA' + #13#10 +
             '           AND H.MESCOBRANCA = HA.MESCOBRANCA' + #13#10 +
             // Andre Imakawa - SIG 58182 - Inicio
	     '           AND H.IDMOTIVO = HA.IDMOTIVO' + #13#10 ;
             if Trim(strContrib) <> '' then
               sql := sql + ' AND  H.IDCONTRIBUICAO IN (' + strContrib + ')--IDCONTRIBUICAO' + #13#10;

             sql := sql + '         WHERE H.SITRECEBIMENTO IN (0, 1)' + #13#10 +
             // Andre Imakawa - SIG 58182 - Fim
             '        GROUP BY H.IDPESSOA,' + #13#10 +
             '               H.IDPLANOPREV,' + #13#10 +
             '               H.IDPESSJUR) ALT' + #13#10 +
             '    ON ALT.IDPESSOA = H.IDPESSOA' + #13#10 +
             '   AND ALT.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
             '   AND ALT.IDPESSJUR = H.IDPESSJUR' + #13#10 +
             '  JOIN DEPENTIT DE' + #13#10 +
             '    ON DE.IDPESSOA = H.IDPESSOA' + #13#10 +
             '    AND DE.IDTITULAR = NVL(H.IDTITULAR, H.IDPESSOA)' + #13#10 +
             '  JOIN PESSOA P' + #13#10 +
             '    ON P.IDPESSOA = H.IDPESSOA' + #13#10 +
             '  LEFT JOIN PESSOAFISICA PF' + #13#10 +
             '   ON PF.IDPESSOA = P.IDPESSOA' + #13#10 +
             '  LEFT JOIN ENDPESS E' + #13#10 +
             '    ON E.IDPESSOA = P.IDPESSOA' + #13#10 +
             '   AND E.IDENDERECO = P.IDENDCORRESP' + #13#10 +
             'WHERE H.SITRECEBIMENTO IN (0, 1)' + #13#10 +
             '  AND H.IDPESSOA IN (' + idPessoaSepVirg + ')';

             if Trim(strPlano) <> '' then
               sql := sql + '  AND H.IDPLANOPREV IN (' + strPlano + ')' + #13#10;

             if Trim(strPatro) <> '' then
               sql := sql + '  AND H.IDPESSJUR IN (' + strPatro + ')';

             // Andre Imakawa - SIG 58182 - Inicio
             if Trim(strContrib) <> '' then
               sql := sql + '  AND H.IDCONTRIBUICAO IN (' + strContrib + ')--IDCONTRIBUICAO' + #13#10;
             // Andre Imakawa - SIG 58182 - Fim

      Result := sql;
end;

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
//function TfrmEventoRegInadimplencia.Tem3ContribEmAtraso(idPessoaSep : String) : Boolean;
//var
//    qryTemp : TwwQuery;
//begin
//        Result := False;
//        qryTemp := TwwQuery.Create(Application);
//
//        try
//            qryTemp.DatabaseName := dtmBaseDados.dbBaseDados.DataBaseName;
//
//            qryTemp.SQL.Text := 'SELECT 1' + #13#10 +
//                                '                FROM (SELECT Z.IDPESSOA,' + #13#10 +
//                                '                            Z.MESREFERENCIA,' + #13#10 +
//                                '                            Z.QTD_NAOPAGA,' + #13#10 +
//                                '                            DECODE(Z.QTD_NAOPAGA, 0, ''Paga'', ''Aberta'') AS STATUS_MES_ATUAL,' + #13#10 +
//                                '                            DECODE(Z.QTD_NAOPAGA,0,NULL,DENSE_RANK()OVER(PARTITION BY Z.GRUPO ORDER BY Z.IDPESSOA,Z.MESREFERENCIA)) AS CONSECUTIVAS' + #13#10 +
//                                '                       FROM (SELECT Y.*,' + #13#10 +
//                                '                                    MAX(Y.MUDOU) OVER(ORDER BY Y.IDPESSOA, Y.MESREFERENCIA, Y.SEQ) AS GRUPO' + #13#10 +
//                                '                               FROM (SELECT X.*,' + #13#10 +
//                                '                                            CASE' + #13#10 +
//                                '                                              WHEN IDPESSOA = LAG(IDPESSOA)' + #13#10 +
//                                '                                                OVER(ORDER BY X.IDPESSOA,X.MESREFERENCIA,X.SEQ)' + #13#10 +
//                                '                                              THEN' + #13#10 +
//                                '                                                NULL' + #13#10 +
//                                '                                              ELSE' + #13#10 +
//                                '                                                TO_DATE(X.MESREFERENCIA, ''YYYY/MM'')' + #13#10 +
//                                '                                            END AS MUDOU' + #13#10 +
//                                '                                       FROM (SELECT H.IDPESSOA,' + #13#10 +
//                                '                                                    H.MESREFERENCIA,' + #13#10 +
//                                '                                                    DECODE(SUM(DECODE(H.SITRECEBIMENTO,0,1,1,1,1,3,1,4,1,6,1,7,1,0)),0,0,1) AS QTD_NAOPAGA,' + #13#10 +
//                                '                                                    RANK() OVER(ORDER BY H.IDPESSOA, H.MESREFERENCIA, H.IDPLANOPREV) AS SEQ' + #13#10 +
//                                '                                               FROM HSTCONTRIBPREV H' + #13#10 +
//                                '                                               JOIN DEPENTIT DE' + #13#10 +
//                                '                                                 ON DE.IDPESSOA = H.IDPESSOA' + #13#10 +
//                                '                                               JOIN PARTPREVPLAN PP' + #13#10 +
//                                '                                                 ON PP.IDPESSOA = DE.IDTITULAR' + #13#10 +
//                                '                                                AND PP.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
//                                '                                                AND PP.IDPESSJUR = H.IDPESSJUR' + #13#10 +
//                                '                                               JOIN SITPART S' + #13#10 +
//                                '                                                 ON S.IDSITPART = PP.IDSITPART' + #13#10 +
//                                '                                                AND S.FLGINTERNO NOT IN (''CA'')' + #13#10 +
//                                '                                               JOIN CONTRIBUICAO C' + #13#10 +
//                                '                                                 ON C.IDCONTRIBUICAO = H.IDCONTRIBUICAO' + #13#10 +
//                                '                                              WHERE H.SITRECEBIMENTO IN (1,0)' + #13#10;
//
//                                if Trim(strPlano) <> '' then
//                                     qryTemp.SQL.Text := qryTemp.SQL.Text + '         AND H.IDPLANOPREV IN (' + strPlano + ')--PLANO' + #13#10;
//
//                                if Trim(strPatro) <> '' then
//                                     qryTemp.SQL.Text := qryTemp.SQL.Text + '         AND H.IDPESSJUR IN (' + strPatro + ')--PATRO' + #13#10;
//
//                                if Trim(strContrib) <> '' then
//                                     qryTemp.SQL.Text := qryTemp.SQL.Text + '         AND H.IDCONTRIBUICAO IN (' + strContrib + ')--IDCONTRIBUICAO' + #13#10;
//
//                                qryTemp.SQL.Text := qryTemp.SQL.Text + '         AND H.IDPESSOA IN (' + idPessoaSep + ')--IDPESSOA' + #13#10 +
//                                '                                                GROUP BY H.IDPESSOA, H.MESREFERENCIA, H.IDPLANOPREV' + #13#10 +
//                                '                                              ORDER BY H.IDPESSOA, H.MESREFERENCIA, H.IDPLANOPREV' + #13#10 +
//                                '                                            )X' + #13#10 +
//                                '                                     )Y' + #13#10 +
//                                '                            )Z' + #13#10 +
//                                '                     )PARC' + #13#10 +
//                                '        WHERE (PARC.IDPESSOA IN (' + idPessoaSep + '))' + #13#10 +
//                                '          AND PARC.CONSECUTIVAS >= 3';
//
//            qryTemp.Open;
//
//            if Not qryTemp.IsEmpty then
//                Result := True;
//
//        finally
//            qryTemp.Close;
//            qryTemp.Free;
//        end;
//end;

end.

