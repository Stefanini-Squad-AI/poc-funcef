// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Nº SOL.....: 271518
//KTN / PPM  : 1368136
//Data       : 08/04/2016
//Responsável: William Moreira da Silva
//Descrição..: Alteração no evento de cancelamento por inadimplência, fonte usado somente para o modulo de Cadastro
//------------------------------------------------------------------------------
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

unit FEventoRegInadimplencia_Cadastro;
                                                                              
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, Spin, ComCtrls, checklst, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti,ppPrvDlg,ppForms, Menus, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmEventoRegInadimplencia_Cadastro = class(TfrmOkCancelar)
    qryAux: TwwQuery;
    Panel1: TPanel;
    grpTempo: TGroupBox;
    Label1: TLabel;
    spedMeses: TSpinEdit;
    cmbMes: TComboBox;
    Panel2: TPanel;
    bbtnEmitirCarta: TBitBtn;
    bbtnCancelarPart: TBitBtn;
    pnldetalhe: TPanel;
    Label6: TLabel;
    lstvresultado: TListView;
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
    RgOpcao: TRadioGroup;
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
    cmbSinal: TComboBox;
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
    procedure bbtnCancelarPartClick(Sender: TObject);
    procedure bbtnEmitirCartaClick(Sender: TObject);
    procedure bbtnVoltarDetalheClick(Sender: TObject);
    procedure bbtnDetalheClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chklstPatroClickCheck(Sender: TObject);
    procedure FiltraParticipantesSelecionados;
    procedure FormCreate(Sender: TObject);
    procedure RgOpcaoClick(Sender: TObject);
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

    procedure VerificaeGravaSituacoes;
    procedure VerificaEstadoEvento;
    procedure GravaEVENTOSPREV;
    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
    procedure SuspendeContribuicoes;
    procedure MontaSqlRegra(var sSQL : string; pStrContrib, sIdSitPart : string);

  public
     iValidaChecks, aux: Integer;//William Moreira da Silva SOL 173800 KTN 1609874
    { Public declarations }
  end;

var
  frmEventoRegInadimplencia_Cadastro: TfrmEventoRegInadimplencia_Cadastro;

implementation

uses
  UMensErro, DBaseDados, FTelaAut, UAdmPrev, UDataBase, 
  FLerSituacaoPlano, UEventos, fAguarde, UDotacao, DRelatAdmPrev,
  DAPrev, UFuncoesUteis, FMostraAux, Usistema;

{$R *.DFM}

procedure TfrmEventoRegInadimplencia_Cadastro.FormActivate(Sender: TObject);
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
end;

procedure TfrmEventoRegInadimplencia_Cadastro.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
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

procedure TfrmEventoRegInadimplencia_Cadastro.chklstPatroClickCheck(Sender: TObject);
var
  i : integer;
begin
 {Preenche ChkList dos Planos da Patrocinadora Selecionada}
  qryPlano.Close;
  qryPlano.SQL.Clear;
  strPatro := ' ';

  for i := 0 to chklstPatro.Items.Count - 1 do
     if chklstPatro.checked[i] then
       begin
           if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive, loPartialKey]) then
              strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
       end;

  if Trim(strPatro) <> '' then
     begin
          strPatro := Copy(strPatro, 1, Length(strPatro) - 2);
          qryPlano.SQL.Add(' SELECT DISTINCT PP.IDPLANOPREV, PP.NOME '+
                           ' FROM PLANPREV PP, PLANPREVPATRO PPP '+
                           ' WHERE PP.IDPLANOPREV = PPP.IDPLANOPREV AND ' +
                           '       PPP.IDPESSJUR  IN ( '+strPatro+') '+
                           ' ORDER BY PP.NOME')
     end
  else
     qryPlano.SQL.Add(' SELECT * FROM PLANPREV ORDER BY NOME ');

  qryPlano.Open;
  CriaLista(chklstPlano,qryPlano);
end;

procedure TfrmEventoRegInadimplencia_Cadastro.bbtnDetalheClick(Sender: TObject);
var
  sSQL, sMesReferencia,
  StrContrib, StrNomeContrib, sRegraOk : string;
  sNomeParticip,    sMatricula,
  sInscricaoNumero, sPlano,
  sPatrocinadora,   sSituacao, sSitFundacao : string;
  iLista  : TListItem;
  i, iCont,
  iIdContribuicao : Integer;
  bErro           : Boolean;

begin
  inherited;
  bPerguntouEmissao := False;

  lstvResultado.Items.Clear;

  pnlDetalhe.Visible        := True;
  pnlDetalhe.BringToFront;
  bbtnDetalhe.Visible       := False;
  bbtnVoltarDetalhe.Visible := True;

  bbtnEmitirCarta.Visible  := True;
  bbtnMalaDireta.Visible   := True;

  iValidaChecks := 0;

  // Preencher string com Id's das patrocinadoras selecionadas
  strPatro := '';
  for i := 0 to chklstPatro.Items.Count - 1 do
      if chklstPatro.checked[i] then
         begin
            if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive, loPartialKey]) then
               strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
         end;

  if Trim(strPatro) <> '' then
     strPatro := Copy(strPatro, 1, Length(strPatro) - 2);
 {Fim - Preencher string com Id's das patrocinadoras selecionadas}


 {Preencher string com Id's dos planos selecionados}
  strPlano := '';
  for i := 0 to chklstPlano.Items.Count - 1 do
      if chklstPlano.checked[i] then
         begin
             if qryPlano.Locate('Nome',chklstPlano.Items[i],[loCaseInsensitive, loPartialKey]) then
                strPlano := strPlano + qryPlano.FieldByName('IdPlanoPrev').AsString+ ', ';
         end;

  if Trim(strPlano) <> '' then
     strPlano := Copy(strPlano, 1, Length(strPlano) - 2);
 {Fim - Preencher string com Id's dos planos selecionados}

  frmAguarde.Mostra('Avaliando Inadimplências. ');

  if cmbMes.ItemIndex = -1 then
    cmbMes.ItemIndex := 0;

  sMesReferencia := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) +
                    Copy(FormatDateTime('dd/mm/yyyy', Date),3,3);

  //William Moreira da Silva SOL 173800 KTN 1609874
  for i:= 0 to chklstPatro.Items.Count-1 do
      if chklstPatro.Checked[i] then
         inc(iValidaChecks);

  if iValidaChecks = 0 then
  begin
       for i := 0 to chklstPlano.Items.Count-1 do
           if chklstPlano.Checked[i] then
              inc(iValidaChecks);
  end;
  //William Moreira da Silva SOL 173800 KTN 1609874

  // Se o usuario indicar um participante especifico e optar por nenhum criterio de inadimplencia
  // não exigir que haja HSTCONTRIB
  if (RgOpcao.ItemIndex = 2) and (sIdPessoa <> '') and (sIdPessoa <> '-1')
  then begin
     sSQL := ' SELECT                                                                             '+
             '        DISTINCT HST.MESREFERENCIA, ST.FLGINTERNO, PES.NOME AS PARTICIPANTE,        '+
             '        PES.NOME, PATRO.NOME AS PATROCINADORA,                                      '+
             '        PL.NOME AS PLANO,    EL.MATRICULA,       PES.IDPESSOA,                      '+
             '        EL.IDPESSJUR,  PL.IDPLANOPREV,                                              '+
             '        ST.IDSITPART,        ST.FLGINTERNO,                                         '+
             '        PAR.INSCRICAONUMERO, SP.DESCRICAO AS SITUACAOPLANO,                         '+
             '        ST.DESCRICAO AS SITUACAOFUND,                                               '+
             '        SUM(DECODE(HST.FLGDEVOLUCAO,1,-HST.VALORESPERADO,HST.VALORESPERADO)) AS TOTALDIVIDA '+
             ' FROM   PARTPREVPLAN PAR,                                                           '+
             '        HSTCONTRIBPREV HST, CONTRIBPREVPARTP CPP, PLANPREV PL,                      '+
             '        PESSOA PES,      ELEGPATRO EL,     PESSOA PATRO,                            '+
             '        SITPART  ST,        SITPLANOPREV SP                                         '+
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
             ' AND   (EL.IDPESSOA           = PAR.IDPESSOA)                      '+
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
             ' ORDER BY EL.MATRICULA , HST.MESREFERENCIA ';
  end
  else begin
     sSQL := ' SELECT      '+
             '        DISTINCT HST.MESREFERENCIA, ST.FLGINTERNO, PES.NOME AS PARTICIPANTE, PES.NOME, PATRO.NOME AS PATROCINADORA, '+
             '        PL.NOME AS PLANO,    EL.MATRICULA,       PES.IDPESSOA,       EL.IDPESSJUR,  PL.IDPLANOPREV,       '+
             '        ST.IDSITPART,        ST.FLGINTERNO,                                           '+
             '        PAR.INSCRICAONUMERO, SP.DESCRICAO AS SITUACAOPLANO,  ST.DESCRICAO AS SITUACAOFUND, '+
             '        SUM(DECODE(HST.FLGDEVOLUCAO,1,-HST.VALORESPERADO,HST.VALORESPERADO)) AS TOTALDIVIDA '+
             'FROM   PARTPREVPLAN PAR,                                         '+
             '       HSTCONTRIBPREV HST, CONTRIBPREVPARTP CPP, PLANPREV PL,    '+
             '       PESSOA PES,      ELEGPATRO EL,     PESSOA PATRO,          '+
             '       SITPART  ST,        SITPLANOPREV SP      '+
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
                    'AND    (EL.IDPESSOA        = PAR.IDPESSOA)                      '+
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
             else sSQL    := sSQL + ' AND (ST.FLGINTERNO = ''MP'' ) ';

     end;

     if sFlgInterno = 'RI'
     then sSQL := sSQL + ' AND (SP.FLGINTERNO NOT IN (''IN'', ''CI'') ) '
     else sSQL := sSQL + ' AND (SP.FLGINTERNO NOT IN (''CI'') ) ';

     if (RgOpcao.ItemIndex = 1)
     then begin
        // Quantidade de meses
        sSQL := sSQL + ' AND TRUNC(MONTHS_BETWEEN(SYSDATE,HST.DATAPREVISAORECE),0) ' + cmbmes.Text + ' ' + IntToStr(spedMeses.Value);
        sSQL := sSQL +
             ' GROUP BY HST.MESREFERENCIA, ST.FLGINTERNO, PES.NOME, PES.NOME, PATRO.NOME, '+
             '        PL.NOME, EL.MATRICULA, PES.IDPESSOA, EL.IDPESSJUR, PL.IDPLANOPREV, ST.IDSITPART,   '+
             '        ST.FLGINTERNO, PAR.INSCRICAONUMERO, SP.DESCRICAO, ST.DESCRICAO, PL.NOME '+//William Moreira da Silva SOL 173800 KTN 1609874
             ' ORDER BY EL.MATRICULA  ';
     end
     else sSQL    := sSQL +
             ' GROUP BY HST.MESREFERENCIA, ST.FLGINTERNO, PES.NOME, PES.NOME, PATRO.NOME, '+
             '        PL.NOME, EL.MATRICULA, PES.IDPESSOA, EL.IDPESSJUR, PL.IDPLANOPREV, ST.IDSITPART,   '+
             '        ST.FLGINTERNO, PAR.INSCRICAONUMERO, SP.DESCRICAO, ST.DESCRICAO, PL.NOME '+//William Moreira da Silva SOL 173800 KTN 1609874
             ' ORDER BY EL.MATRICULA , HST.MESREFERENCIA ';

   end;

   qryDetalhe.Close;
   qryDetalhe.SQL.Clear;
   qryDetalhe.SQL.Add(sSQL);

   try
      qryDetalhe.open;
   except
      on E:EDBEngineError do
      begin
        MostrarErro(E);
        frmAguarde.Apaga;
        Exit;
      end;
   end;

   if qryDetalhe.IsEmpty
   then begin
      MsgDlg('Não existem Participantes inadimplentes com as opções indicadas.','Erro',mtError,[mbOk,mbHelp],0);
      pnlDetalhe. Visible       := False;
      bbtnDetalhe.Visible       := True;
      bbtnVoltarDetalhe.Visible := False;
      bbtnEmitirCarta.Visible   := False;
      bbtnMalaDireta.Visible    := False;
      bbtnCancelarPart.Visible  := False;

      TiraSql(qryAux);
      frmAguarde.Apaga;
      Exit;
   end;

  if sFlgInterno <> 'RI' then bbtnCancelarPart.Visible := True;

  memResult.Clear;
  memResult.Lines.Add('-----------------------------------------------------------------------------------------------------------------------------------------------------------');
  memResult.Lines.Add('Participantes não Aprovados na Regra de Cancelamento Por Inadimplência');
  memResult.Lines.Add('-----------------------------------------------------------------------------------------------------------------------------------------------------------');
  memResult.Lines.Add('');

  lbParticip.Clear;
  lbPlano.Clear;
  lbPatro.Clear;

  qryDetalhe.First;
  if (RgOpcao.ItemIndex = 1) // TEMPO DE INADIMPLENCIA
  then begin
     {lstvresultado.Columns[0].Caption := 'Participante';
     lstvresultado.Columns[1].Caption := 'Cancelado Regra';
     lstvresultado.Columns[2].Caption := 'Matrícula';
     lstvresultado.Columns[3].Caption := 'Inscrição';
     lstvresultado.Columns[4].Caption := 'Mês Referência';
     lstvresultado.Columns[5].Caption := 'Valor Esperado(+)';
     lstvresultado.Columns[6].Caption := 'Plano';
     lstvresultado.Columns[7].Caption := 'Patrocinadora';
     lstvresultado.Columns[8].Caption := 'Situação no Plano';
     lstvresultado.Columns[9].Caption := 'Situação na Fundação';}

     //William Moreira da Silva SOL 173800 KTN 1609874
     lstvresultado.Columns[0].Caption := 'Participante';
     lstvresultado.Columns[1].Caption := 'Plano';
     lstvresultado.Columns[2].Caption := 'Cancelado Regra';
     lstvresultado.Columns[3].Caption := 'Matrícula';
     lstvresultado.Columns[4].Caption := 'Inscrição';
     lstvresultado.Columns[5].Caption := 'Mês Referência';
     lstvresultado.Columns[6].Caption := 'Valor Esperado(+)';
     lstvresultado.Columns[7].Caption := 'Patrocinadora';
     lstvresultado.Columns[8].Caption := 'Situação no Plano';
     lstvresultado.Columns[9].Caption := 'Situação na Fundação';
     //William Moreira da Silva SOL 173800 KTN 1609874

     while not qryDetalhe.EOF do
     begin
        sRegraOk := '[    ]';
        MontaSqlRegra(sSQL, '', qryDetalhe.FieldbyName('IDSITPART').AsString);

        if (qryAux.FieldByName('IDREGRACANCELAME').AsString <> '') and
           (not qryAux.IsEmpty)
        then begin
           bErro := False;
           try
              if not RegraBooleana(qryAux.FieldByName('IDREGRACANCELAME').AsString,sSQL,bErro)
              then memResult.Lines.Add(sNomeParticip+' não aprovado pela regra de cancelamento por inadimplência.')
              else sRegraOk := '[ OK ]';

              if bErro
              then begin
                 memResult.Lines.Add(sNomeParticip+' - erro na execução da regra de cancelamento por inadimplência.');
                 qryDetalhe.Next;
                 Continue;
              end;
           except
              memResult.Lines.Add(sNomeParticip+' - erro na execução da regra de cancelamento por inadimplência.');
              qryDetalhe.Next;
              Continue;
           end;
        end;

        iLista          := lstvResultado.items.add;
        iLista.Caption  :=  qryDetalhe.FieldbyName('PARTICIPANTE').AsString;//William Moreira da Silva SOL 173800 KTN 1609874
        iLista.SubItems.Add(sRegraOk);
        iLista.SubItems.Add(qryDetalhe.FieldbyName('PLANO').AsString); //William Moreira da Silva SOL 173800 KTN 1609874
        iLista.SubItems.Add(qryDetalhe.FieldbyName('MATRICULA').AsString);
        iLista.SubItems.Add(qryDetalhe.FieldbyName('INSCRICAONUMERO').AsString);
        iLista.SubItems.Add(qryDetalhe.FieldbyName('MESREFERENCIA').AsString);
        iLista.SubItems.Add(qryDetalhe.FieldbyName('TOTALDIVIDA').AsString);
        iLista.SubItems.Add(qryDetalhe.FieldbyName('PARTICIPANTE').AsString);
        iLista.SubItems.Add(qryDetalhe.FieldbyName('PATROCINADORA').AsString);
        iLista.SubItems.Add(qryDetalhe.FieldbyName('SITUACAOPLANO').AsString);

        lbParticip.Items.Add(qryDetalhe.FieldByName('IDPESSOA').AsString);
        lbPlano.Items.Add(qryDetalhe.FieldByName('IDPLANOPREV').AsString);
        lbPatro.Items.Add(qryDetalhe.FieldByName('IDPESSJUR').AsString);
        //William Moreira da Silva SOL 173800 KTN 1609874

        qryDetalhe.Next;
     end;
  end
  else begin // NUMERO DE CONTRIBUICOES
     lstvresultado.Columns[0].Caption := 'Participante';//William Moreira da Silva SOL 173800 KTN 1609874
     lstvresultado.Columns[1].Caption := 'Plano';
     lstvresultado.Columns[2].Caption := 'Cancelado Regra';
     lstvresultado.Columns[3].Caption := 'Matrícula';
     lstvresultado.Columns[4].Caption := 'Inscrição';
     lstvresultado.Columns[5].Caption := 'No. Contrib';
     lstvresultado.Columns[6].Caption := 'Contribuições';//William Moreira da Silva SOL 173800 KTN 1609874
     lstvresultado.Columns[7].Caption := 'Patrocinadora';
     lstvresultado.Columns[8].Caption := 'Situação no Plano';
     lstvresultado.Columns[9].Caption := 'Situação na Fundação';
     //qryDetalhe.SQL.SaveToFile('C:\qryDetalhe.txt');//William Moreira da Silva SOL 173800 KTN 1609874

     while not qryDetalhe.EOF do
     begin
        iIdPessJur      := qryDetalhe.FieldByName('IDPESSJUR').AsInteger;
        iIdPlanoPrev    := qryDetalhe.FieldByName('IDPLANOPREV').AsInteger;
        iIdPessoa       := qryDetalhe.FieldByName('IDPESSOA').AsInteger;
        StrContrib      := '';
        StrNomeContrib  := '';
        iCont           := 0;


        while (not qryDetalhe.EOF) and
              (iIdPessJur      = qryDetalhe.FieldByName('IDPESSJUR').AsInteger)      and
              (iIdPlanoPrev    = qryDetalhe.FieldByName('IDPLANOPREV').AsInteger)    and
              (iIdPessoa       = qryDetalhe.FieldByName('IDPESSOA').AsInteger)
        do begin
           Inc(iCont);

           //if (qryDetalhe.FieldByName('SITUACAOPLANO').asString <> 'CANCELADO') then//William Moreira da Silva SOL 173800 KTN 1609874
           //begin
           sNomeParticip    := qryDetalhe.FieldbyName('PARTICIPANTE').AsString;
           sMatricula       := qryDetalhe.FieldbyName('MATRICULA').AsString;
           sInscricaoNumero := qryDetalhe.FieldbyName('INSCRICAONUMERO').AsString;
           sPlano           := qryDetalhe.FieldbyName('PLANO').AsString;
           sPatrocinadora   := qryDetalhe.FieldbyName('PATROCINADORA').AsString;
           sSituacao        := qryDetalhe.FieldbyName('SITUACAOPLANO').AsString;
           sSitFundacao     := qryDetalhe.FieldbyName('SITUACAOFUND').AsString;
           //end;

           qryDetalhe.Next;
        end;

        if iCont >= spNContrib.Value // Se contrib. >= ao informado Filtrar
        then begin
           // Rodar a Regra de Cancelamento por inadimplancia para cada participante
           sRegraOk := '[    ]';
           MontaSqlRegra(sSQL, '', qryDetalhe.FieldbyName('IDSITPART').AsString);

           if (qryAux.FieldByName('IDREGRACANCELAME').AsString <> '') and
              (not qryAux.IsEmpty)
           then begin
              bErro := False;
              try
                 if not RegraBooleana(qryAux.FieldByName('IDREGRACANCELAME').AsString,sSQL,bErro)
                 then memResult.Lines.Add(sNomeParticip+' não aprovado pela regra de cancelamento por inadimplência.')
                 else sRegraOk := '[ OK ]';

                 if bErro
                 then begin
                    memResult.Lines.Add(sNomeParticip+' - erro na execução da regra de cancelamento por inadimplência.');
                    qryDetalhe.Next;
                    Continue;
                 end;
              except
                 memResult.Lines.Add(sNomeParticip+' - erro na execução da regra de cancelamento por inadimplência.');
                 qryDetalhe.Next;
                 Continue;
              end;
           end;

           iLista          := lstvResultado.items.add;
           iLista.Caption  :=  sNomeParticip;//William Moreira da Silva SOL 173800 KTN 1609874
           //iLista.Caption  :=  sPlano ;
           iLista.SubItems.Add(sPlano);
           iLista.SubItems.Add(sRegraOk);
           iLista.SubItems.Add(sMatricula);
           iLista.SubItems.Add(sInscricaoNumero);
           iLista.SubItems.Add(IntToStr(iCont));
           iLista.SubItems.Add('Cobrança do Mês');
           iLista.SubItems.Add(sPatrocinadora);
           iLista.SubItems.Add(sSituacao);
           iLista.SubItems.Add(sSitFundacao);

           lbParticip.Items.Add(IntToStr(iIdPessoa));
           lbPlano.Items.Add(IntToStr(iIdPlanoPrev));
           lbPatro.Items.Add(IntToStr(iIdPessJur));

           lbRegraOk.Items.Add(sRegraOk);
        end;
     end;
  end;

  if lbRegraOk.Items.Count < lstvResultado.Items.Count
  then begin
     for i := 0 to lbRegraOk.Items.Count - 1 do
         if (lbRegraOk.Items[i] = '[ OK ]') then lstvResultado.items.Item[i].Checked := True;
  end
  else begin
     for i := 0 to lstvResultado.items.Count -1 do
         if (lbRegraOk.Items[i] = '[ OK ]') then lstvResultado.items.Item[i].Checked := True;
  end;

  frmAguarde.Apaga;
end;

procedure TfrmEventoRegInadimplencia_Cadastro.bbtnVoltarDetalheClick(Sender: TObject);
begin
  inherited;
  pnlDetalhe.Visible := False;
  Panel1.BringToFront;
  bbtnDetalhe.Visible       := True;

  bbtnVoltarDetalhe.Visible := False;
  bbtnEmitirCarta.Visible   := False;
  bbtnMalaDireta.Visible    := False;
  bbtnCancelarPart.Visible  := False;
end;

procedure TfrmEventoRegInadimplencia_Cadastro.FiltraParticipantesSelecionados;
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
     if (lstvresultado.Items.Item[i].Checked) and
        (  bEmiteCartaTodosSele or (lbRegraOk.Items[i] = '[ OK ]') )
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

procedure TfrmEventoRegInadimplencia_Cadastro.bbtnEmitirCartaClick(Sender: TObject);
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
      // Abre tela pedindo a Nova Situacao do Plano
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
      end;


      qryParticip.First;
      while not qryParticip.EOF do
      begin

          VerificaeGravaSituacoes;
          VerificaEstadoEvento;
          SuspendeContribuicoes;

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
      // Abre tela pedindo a Nova Situacao do Plano
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
      end;

      frmAguarde.Mostra('Registrando Eventos ....');
      qryParticip.First;
      while not qryParticip.EOF do
      begin
          Application.ProcessMessages;
          VerificaeGravaSituacoes;
          VerificaEstadoEvento;
          qryParticip.Next;
      end;

      frmAguarde.Apaga;
      frmLerSituacaoPlano.Free;
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

procedure TfrmEventoRegInadimplencia_Cadastro.bbtnCancelarPartClick(Sender: TObject);
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

 {Abre tela pedindo a Nova Situacao do Plano}
  frmLerSituacaoPlano := TfrmLerSituacaoPlano.Create(Self);
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
  end;



  qryParticip.First;
  while not qryParticip.EOF do
  begin



      VerificaeGravaSituacoes;
      VerificaEstadoEvento;
      SuspendeContribuicoes;


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

procedure TfrmEventoRegInadimplencia_Cadastro.MontaSqlRegra(var sSQL : string; pStrContrib, sIdSitPart : string);
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

procedure TfrmEventoRegInadimplencia_Cadastro.SuspendeContribuicoes;
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

procedure TfrmEventoRegInadimplencia_Cadastro.VerificaeGravaSituacoes;
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

procedure TfrmEventoRegInadimplencia_Cadastro.VerificaEstadoEvento;
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

procedure TfrmEventoRegInadimplencia_Cadastro.GravaEVENTOSPREV;
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
                                 
     if frmLerSituacaoPlano.qrySitPart.FieldByName('IDSITPART').AsInteger > 0 
     then qryAux.SQL.Add(frmLerSituacaoPlano.qrySitPart.FieldByName('IDSITPART').AsString + ',' )
     else qryAux.SQL.Add(qryParticip.FieldByName('IDSITPART').AsString +', ');

     qryAux.SQL.Add( frmLerSituacaoPlano.qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString + ',' +
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
                         '                        IDSITPLANONOVO  = ' + frmLerSituacaoPlano.qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString +
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

procedure TfrmEventoRegInadimplencia_Cadastro.FormCreate(Sender: TObject);
begin
  inherited;
  ppRegisterForm(TppCustomPreviewer,TppPrintPreview);
  RgOpcao.ItemIndex          := 2;    
  gbContribuicaoInad.Visible := False;
  grpTempo.Visible           := False;

  pnExibeDetalhe.Visible    := False;

  cmbMes.ItemIndex          := 0;     
  bbtnVoltarDetalhe.Visible := False;
  bbtnEmitirCarta.Visible   := False;
  bbtnMalaDireta.Visible   := False;
  bbtnCancelarPart.Visible  := False;

  pnExibeDetalhe.Left := 12;
  pnExibeDetalhe.Top  := -3;
end;

procedure TfrmEventoRegInadimplencia_Cadastro.RgOpcaoClick(Sender: TObject);
begin
  inherited;
  gbContribuicaoInad.Visible := (RgOpcao.ItemIndex = 0);
  grpTempo.Visible           := (RgOpcao.ItemIndex = 1);
end;

procedure TfrmEventoRegInadimplencia_Cadastro.lstvresultadoColumnClick(Sender: TObject; Column: TListColumn);
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
     qryAbreDet.ParamByName('ipessoa').AsString := lbParticip.Items[i];
     qryAbreDet.ParamByName('iplano').AsString  := lbPlano.Items[i];
     qryAbreDet.ParamByName('ipatro').AsString  := lbPatro.Items[i];
     try
       qryAbreDet.Open;
     except
     end;
     pnExibeDetalhe.Visible := True;
     pnExibeDetalhe.BringToFront;
     grdDetalhe.ApplySelected;
  end;
end;

procedure TfrmEventoRegInadimplencia_Cadastro.btnSaiDetClick(Sender: TObject);
begin
  inherited;
  pnExibeDetalhe.Visible := False;
  pnExibeDetalhe.SendToBack;
end;

procedure TfrmEventoRegInadimplencia_Cadastro.lstvresultadoDblClick(
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
     qryAbreDet.ParamByName('ipessoa').AsString := lbParticip.Items[i];
     qryAbreDet.ParamByName('iplano').AsString  := lbPlano.Items[i];
     qryAbreDet.ParamByName('ipatro').AsString  := lbPatro.Items[i];
     try
        qryAbreDet.Open;
     except
     end;
     grdDetalhe.ApplySelected;
  end;
end;

procedure TfrmEventoRegInadimplencia_Cadastro.FormShow(Sender: TObject);
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

procedure TfrmEventoRegInadimplencia_Cadastro.bbtnProcurarClick(Sender: TObject);
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

procedure TfrmEventoRegInadimplencia_Cadastro.bbtnLimparPartClick(Sender: TObject);
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

procedure TfrmEventoRegInadimplencia_Cadastro.bbtnMalaDiretaClick(Sender: TObject);
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
       // Abre tela pedindo a Nova Situacao do Plano
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
       end;



       qryParticip.First;
       while not qryParticip.EOF do
       begin

           VerificaeGravaSituacoes;
           VerificaEstadoEvento;
           SuspendeContribuicoes;

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
      // Abre tela pedindo a Nova Situacao do Plano
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
      end;

      frmAguarde.Mostra('Registrando Eventos ....');
      qryParticip.First;
      while not qryParticip.EOF do
      begin
          Application.ProcessMessages;
          VerificaeGravaSituacoes;
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

      if (RgOpcao.ItemIndex = 1)
      then begin
         // Quantidade de meses
         sSQL := sSQL + ' AND (HST.MESREFERENCIA = ''' + Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' +
                                                         Copy(FormatDateTime('dd/mm/yyyy', Date),4,2) + ''')';

         sSQL := sSQL + ' AND TRUNC(MONTHS_BETWEEN(SYSDATE,HST.DATAPREVISAORECE),0) ' + cmbmes.Text + ' ' + IntToStr(spedMeses.Value);
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

procedure TfrmEventoRegInadimplencia_Cadastro.pmnuMostrarLayOutClick(
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

procedure TfrmEventoRegInadimplencia_Cadastro.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);

end;

//William Moreira da Silva SOL 173800 KTN 1609874
procedure TfrmEventoRegInadimplencia_Cadastro.lstvresultadoClick(Sender: TObject);
var
   i, count{, aux}: Integer;
begin
  inherited;

  count := 0;

  if iValidaChecks = 0 then
  begin
       for i := 0 to lstvresultado.Items.Count -1 do
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
      end;
  end;
end;
//William Moreira da Silva SOL 173800 KTN 1609874

end.

