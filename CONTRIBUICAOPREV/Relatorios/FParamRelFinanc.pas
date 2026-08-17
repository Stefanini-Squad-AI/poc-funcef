// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Darivaldo Alencar
// SOL.253577/18061 ppm.1238748
// Data        : 15.02.2016
// Alteração   : Desenvolvimento deste Form
// -----------------------------------------------------------------------------
// Autor(a)    : Luis Ferrari
// SIG.126671
// Data        : 30/06/2022
// Alteração   : GetSQLImpressao
// Descrição : Retirada da tabela CONTRIBPREVPARTP CPP e habilitar função de exportar relatorio
// -----------------------------------------------------------------------------
unit FParamRelFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, MontaSelect,
  TB97Tlbr, TB97, ExtCtrls, ImgList, Mask, CheckLst, wwQuery, FAguarde,ComObj,
  uMensErro, Db, DBClient, BfDialogs, BrowseFolder, uProcuraDir,uSistema,
  uCmSqlParams;

type
   TTipoDados           = ( tdPatro   , tdPlanosContabeis, tdSituacoesDosParticipantes, tdContribuicoes );
   TTipoSol             = ( tsNone    , tsDaMatricula );
   TComponentEspecifico = ( teNil     , teEspecifico );
   TTipoFiltro          = ( tpPrefixo , tpData );
   TTipoValidacao       = ( tvCobranca, tvReferencia );

   TParamRelFinanc = class(TfrmOkCancelar)

    LabMatricula: TLabel;
    EdtMatricula: TEdit;
    LabNome: TLabel;
    EdtNome: TEdit;
    btPesquisa: TBitBtn;
    btClear: TBitBtn;
    GBCobranca1: TGroupBox;
    EdtCobranca1: TMaskEdit;
    GBCobranca2: TGroupBox;
    EdtCobranca2: TMaskEdit;
    GBReferencia1: TGroupBox;
    EdtReferencia1: TMaskEdit;
    GBReferencia2: TGroupBox;
    EdtReferencia2: TMaskEdit;
    pnListas: TPanel;
    pnPatrocinadora: TPanel;
    LabPatrocinadoras: TLabel;
    chkListPatro: TCheckListBox;
    btSelTudoPatro: TBitBtn;
    btDesSelTudoPatro: TBitBtn;
    pnPlanosContabeis: TPanel;
    LabPlanosContabeis: TLabel;
    chkListPlanos: TCheckListBox;
    btSelTudoPlanos: TBitBtn;
    btDesSelTudoPlanos: TBitBtn;
    pnSituacoesDosPagamentos: TPanel;
    LabSituacoesDosParticipantes: TLabel;
    chkListSituacoes: TCheckListBox;
    btSelTudoSituacoes: TBitBtn;
    btDesSelTudoSituacoes: TBitBtn;
    pnContribuicoes: TPanel;
    LabContribuicoes: TLabel;
    chkListContribuicoes: TCheckListBox;
    btSelTudoContribuicoes: TBitBtn;
    btDesSelTudoContribuicoes: TBitBtn;
    MontaSelect1: TMontaSelect;
    procedure btPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkListPlanosDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chkListSituacoesDrawItem(Control: TWinControl;
      Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure chkListPatroDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btSelTudoPatroClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure chkListPatroClickCheck(Sender: TObject);
    procedure chkListPlanosClickCheck(Sender: TObject);
    procedure chkListSituacoesClickCheck(Sender: TObject);
    procedure chkListContribuicoesClickCheck(Sender: TObject);
    procedure chkListContribuicoesDrawItem(Control: TWinControl;
      Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure FormShow(Sender: TObject);
    procedure btClearClick(Sender: TObject);
  private
    FIdPessoaSel                    : Integer;
    FTipoSolicitacao                : TTipoSol;
    FIdSituacoesSelecionadas        : TStringList;
    FListaPatroSelecionados         : TStringList;
    FListaPlanosSelecionados        : TStringList;
    FListaPlanosPrevPrevSelecionados: TStringList; 
    FListaSituacoesSelecionadas     : TStringList;
    FListaContribuicoesSelecionadas : TStringList;



    Function GetIn(slIn: TStringList): String;
    Function GetQueryCheckListBox(tdTipoDado : TTipoDados; var bPodeAbrir: Boolean):TwwQuery;
    Function iif(bCondicao: Boolean; SeVerdadeiro,SeFalso: Variant): Variant;
    Function ValidaParametrosdePesquisa(tipoDeValidacao: TTipoValidacao):Boolean;
    Function LerStrings(strStringRead: String; intPosicao: Integer): String;
    Function GravaStrings(S : String; Posicao : integer; NovaString : String):String;


    procedure PreparaMensagemDeMarcacao(oCheckDaMensagem: TCheckListBox; aListaDaMensagem: TStringList; var sMensagemCheck: String);
    Procedure SetTipoDaSolicitacao(Const Value : TTipoSol; intIdPessoa : Integer = 0);
    Procedure CarregaCheckList(tdTipoDado : TTipoDados; tipoDaSolicitacao: TTipoSol = tsNone);
    Procedure SelecaoItemCheckListBox(Sender: TObject);
    procedure DesenhaTexto(Canvas : TCanvas; PosicaoX, PosicaoY : Integer; Texto : String; Alinhamento: String = 'E'; Limite : integer = 0);

    Procedure SetFListaPatroSelecionados         ( Const Value : String );
    procedure SetFListaPlanosSelecionados        ( Const Value : String );
    procedure SetFListaPlanosPrevPrevSelecionados( const Value : String );
    procedure SetFListaSituacoesSelecionadas     ( Const Value : String );
    procedure SetFListaContribuicoesSelecionadas ( Const Value : String );
    procedure SetFIdSituacoesSelecionadas        ( Const Value : String );


    Procedure RemoveDaLista  ( Const Value : String; Sender: TObject; aLista: TStringList; intIdLista : Integer = 0 );
    Procedure RemoveItem     ( aLista: TStringList; oItem: String; bHaRepetidos: Boolean = False);

    { Private declarations }
  public

    Function GetSQLImpressao: String;
    Function FiltraTexto(sTexto: String; tipoFiltro: TTipoFiltro):String;
    { Public declarations }
  published
    Property TipoSolicitacao                : TTipoSol    Read FTipoSolicitacao;
    property idPessoaSel                    : Integer     Read FIdPessoaSel;
    property IdSituacoesSelecionadas        : TSTringList Read FIdSituacoesSelecionadas;
    Property ListaPatroSelecionados         : TStringList Read FListaPatroSelecionados ;
    property ListaPlanosSelecionados        : TStringList Read FListaPlanosSelecionados;
    property ListaPlanosPrevPrevSelecionados: TStringList Read FListaPlanosPrevPrevSelecionados;     
    property ListaSituacoesSelecionadas     : TStringList Read FListaSituacoesSelecionadas;
    property ListaContribuicoesSelecionadas : TStringList Read FListaContribuicoesSelecionadas;


  end;

var
  ParamRelFinanc: TParamRelFinanc;


implementation

{$R *.DFM}

{Objetivo: Desenha o texto sobre o Rect do Component, utilizado no onDrawnItem dos CheckListBox,
           para funcionar necessário ativar o Drawn do componente  }
procedure TParamRelFinanc.DesenhaTexto(Canvas : TCanvas; PosicaoX, PosicaoY : Integer; Texto : String; Alinhamento: String = 'E'; Limite : integer = 0);
var
  i, x : integer;
begin
  if (Limite> 0) and (Canvas.TextWidth(Texto)>limite) then
  begin
    While Canvas.TextWidth(Texto)+Canvas.TextWidth('...')>Limite do
    Texto := copy(Texto,1,length(Texto)-1);
    Texto := Texto+'...';
  end;
  if AnsiUpperCase(Alinhamento)='C' then x := PosicaoX - (Canvas.TextWidth(Texto) div 2) else
  if AnsiUpperCase(Alinhamento)='D' then x := PosicaoX - (Canvas.TextWidth(Texto)) else
  if AnsiUpperCase(Alinhamento)='E' then x := PosicaoX;

  Canvas.TextOut(X,PosicaoY,Texto);
end;

{ Objetivo: Gravar item em uma String }
function TParamRelFinanc.GravaStrings(S : String; Posicao : integer; NovaString : String):String;
var sl : TstringList;
    i : integer;
begin
  SL := TStringList.Create;
  SL.CommaText := s;
  Result := '';
  For i := 0 to sl.Count-1 do
  begin
    if I>0 then Result := Result+',';
      if i=Posicao then
      result := Result+'"'+NovaString+'"' else
      result := Result+'"'+Sl[i]+'"';
  end;
  FreeAndNil(SL);
end;


function TParamRelFinanc.iif(bCondicao: Boolean; SeVerdadeiro,
  SeFalso: Variant): Variant;
begin
  if bCondicao then
    Result := SeVerdadeiro
  else
    Result := SeFalso;
end;


{Objetivo: Ler o item da String }
function TParamRelFinanc.LerStrings(strStringRead: String; intPosicao: Integer): String;
var
  slLoadString: TStringList;
begin
  slLoadString := TStringList.Create;
  slLoadString.CommaText := strStringRead;

  if intPosicao > slLoadString.Count - 1 then
    Result := ''
  else
    Result := slLoadString[intPosicao];

  FreeAndNil(slLoadString);
end;


{ Objetivo: Carregar CheckListBox informado no tdTipoDado, tipoDaSolicitacao utilizado somente para carregar P
  atrocinadoras que são solicitadas pelo Nº da Matrícula, se informado }
procedure TParamRelFinanc.CarregaCheckList(tdTipoDado : TTipoDados; tipoDaSolicitacao: TTipoSol = tsNone);
var
   qryCheckList : TwwQuery;
   sLinha       : string;
   bAbreQry     : Boolean;
begin
   Try
     qryCheckList := TwwQuery.Create(nil);
     Case Integer(tdTipoDado) of
       0:begin
           sLinha := '"",""';
                     { 0, 1 }
           { Patrocinadora }
           chkListPatro.Clear;
           qryCheckList := GetQueryCheckListBox(tdPatro,bAbreQry);
           qryCheckList.Open;
           if not qryCheckList.IsEmpty then
             While not qryCheckList.Eof do
               begin
                 sLinha := GravaStrings(sLinha,00,IntToStr(qryCheckList.FieldByName('IDPESSOA').AsInteger));  { 00 -  id da Patrocinadora   }
                 sLinha := GravaStrings(sLinha,01,qryCheckList.FieldByName('NOME').AsString);                 { 01 -  Nome da Patro }
                 chkListPatro.Items.Add(sLinha);
                 qryCheckList.Next;
               end;
           qryCheckList.Close;
          // ControlaBotoesSelecao(chkListPatro);
         end;
       1:begin
           sLinha := '"","",""';
                     { 0, 1, 2 }
           { Planos Contábeis }
           chkListPlanos.Clear;
           qryCheckList := GetQueryCheckListBox(tdPlanosContabeis,bAbreQry);
           qryCheckList.Open;
           if not qryCheckList.IsEmpty then
             While not qryCheckList.Eof do
               begin
                 sLinha := GravaStrings(sLinha,00,IntToStr(qryCheckList.FieldByName('IDPLANOPREV').AsInteger));  { 00 -  id do Plano   }
                 sLinha := GravaStrings(sLinha,01,qryCheckList.FieldByName('NOME').AsString);                    { 01 -  Nome do Plano }
                 sLinha := GravaStrings(sLinha,02,qryCheckList.FieldByName('IDPLANOPREVPREV').AsString);         { 02 -  Nome do IDPLANOPREVPREV }  
                 chkListPlanos.Items.Add(sLinha);
                 qryCheckList.Next;
               end;
           qryCheckList.Close;
          // ControlaBotoesSelecao(chkListPlanos);
         end;
       2:begin
           sLinha := '"","",""';
                     {0 , 1, 2 }
           { Situações dos pagamentos }
           chkListSituacoes.Clear;
           qryCheckList := GetQueryCheckListBox(tdSituacoesDosParticipantes,bAbreQry);
           qryCheckList.Open;
           if not qryCheckList.IsEmpty then
             While not qryCheckList.Eof do
               begin
                 sLinha := GravaStrings(sLinha,00,IntToStr(qryCheckList.FieldByName('IDSITPART').AsInteger));    { 00 -  IDSITPART  }
                 sLinha := GravaStrings(sLinha,01,qryCheckList.FieldByName('DESCRICAO').AsString);              { 01 -  DESCRICAO  }
                 sLinha := GravaStrings(sLinha,02,qryCheckList.FieldByName('FLGINTERNO').AsString);             { 02 -  FLGINTERNO }
                 chkListSituacoes.Items.Add(sLinha);
                 qryCheckList.Next;
               end;
           qryCheckList.Close;
          // ControlaBotoesSelecao(chkListSituacoes);
         end;
       3:begin
           sLinha := '"",""';
                     {0 , 1 }
           { Contribuições }

           chkListContribuicoes.Clear;
           qryCheckList := GetQueryCheckListBox(tdContribuicoes,bAbreQry);
           if bAbreQry then
             begin
               qryCheckList.Open;
               if not qryCheckList.IsEmpty then
                 While not qryCheckList.Eof do
                   begin
                     sLinha := GravaStrings(sLinha,00,IntToStr(qryCheckList.FieldByName('IDCONTRIBUICAO').AsInteger));    { 00 - IDCONTRIBUICAO  }
                     sLinha := GravaStrings(sLinha,01, AnsiStrUpper(PChar(qryCheckList.FieldByName('NOME').AsString)));   { 01 -  NOME  }

                     chkListContribuicoes.Items.Add(sLinha);
                     qryCheckList.Next;
                   end;
               qryCheckList.Close;
             end;
          // ControlaBotoesSelecao(chkListContribuicoes);
         end;
     end;
  Finally
    if Assigned(qryCheckList) then
      FreeAndNil(qryCheckList);
  end;
end;

{ Objetivo : Retornar a qry para Impressão }
function TParamRelFinanc.GetSQLImpressao: String;
var
   qry              : TwwQuery;
   sSQL             : String;
   sSqlMatricula    : string;
   sSqlIdReferencia : string;
   sSqlIdPessoa     : String;
   sSqlIdPlanPrev   : string;
   sIdPessJur       : string;
   sIdPlanos        : string;
   sIdPlanoPrevPrev : string; 
   sIdSituacoes     : string;
   sIdContribuicoes : string;
   sql1             : String;
   sql2             : string;
begin
  qry              := TwwQuery.Create(Self);
  qry.DatabaseName := 'BaseDados';
  { idPessJur }
  sIdPessJur       := GetIn(ListaPatroSelecionados);
  { id Planos Contábeis }
  sIdPlanos        := GetIn(ListaPlanosSelecionados);
  { id Planos Prevprev } 
  sIdPlanoPrevPrev := GetIn(ListaPlanosPrevPrevSelecionados);
  { id das Situações dos participantes }
  sIdSituacoes     := GetIn(idSituacoesSelecionadas);
  { id das Contribuições selecionadas }
  sIdContribuicoes := GetIn(ListaContribuicoesSelecionadas);

  {Somente se tiver Matricula }
  sSqlMatricula    := iif(FIdPessoaSel > 0,'AND (EL.MATRICULA = ' + QuotedStr(EdtMatricula.Text) +') ', '');
  sSqlIdPessoa     := iif(FIdPessoaSel > 0,'AND (EL.MATRICULA = ' + QuotedStr(EdtMatricula.Text) +') ', '');

  if Length(Trim((sSqlMatricula))) = 0 then
     sSqlIdPlanPrev := '   AND (HST.IDPLANOPREV(+)  = CPP.IDPLANOPREV) '
  else
     sSqlIdPlanPrev := '   AND (HST.IDPLANOPREV  = CPP.IDPLANOPREV) ';


  sSqlIdReferencia := iif(Length(Trim(FiltraTexto(EdtReferencia1.Text,tpData))) > 0,' AND ( HST.MESREFERENCIA BETWEEN ' + QuotedStr(EdtReferencia1.Text) + ' AND ' + QuotedStr(EdtReferencia2.Text) + ' ) ','');
// Inicio SIG 126671
    sql1:='SELECT '''' SITRECEBIMENTO, '                                                                            +
            ''''' MATRICULA, '                                                                                      +
            'HIST.DOCUMENTO AS NODOCUMENTO, '                                                                       +
            'DECODE(LO.DEBCRE,'+QuotedStr('D')+', ' + QuotedStr('CONTRIBUIÇÃO A RECEBER')+', '+QuotedStr('CONTRIBUIÇÃO A DEVOLVER')+') CONTRIBUICAO, '        +
            ''''' MESREFERENCIA, '                                                                                  +
            'HIST.MESCOB AS MESCOBRANCA, '                                                                          +
            'TO_DATE('''') DATAPREVISAORECE, '                                                                      +
            'DATALANCTO AS DATARECEBIMENTO, '                                                                       +
            'DECODE(LO.DEBCRE,''D'',NVL(LO.VALOR, 0),NVL(-LO.VALOR, 0)) AS VALORRECEBIDO, '                         +
            'HIST.NOME, '                                                                                           +
            'HIST.IDPLANPREVCONTAB, '                                                                               +
            'TO_NUMBER('''') IDPLANOPREV, '                                                                         +
            'TO_NUMBER('''') VALORESPERADO, '                                                                       +
            'TO_NUMBER('''') SOMAALTERADORES, '                                                                     +
            'DECODE(LO.DEBCRE,''D'',NVL(LO.VALOR, 0),NVL(-LO.VALOR, 0)) AS TOTALRECEBIDO, '                         +
            ''''' FORMARECEBIMENTO '                                                                                +
            'FROM LANCTODOCUM LO, '                                                                                 +
             '('                                                                                                    +
               'SELECT DISTINCT D.NODOCUMENTO AS DOCUMENTO, '                                                       +
                       'HST.MESCOBRANCA AS MESCOB, '                                                                +
                 // SIG 126671 Ferrari      'CPP.IDPLANPREVCONTAB AS IDPLANPREVCONTAB,'
                       'PPC.IDPLANOPREV AS IDPLANPREVCONTAB,'                                                       +  // SIG 126671 Ferrari
                       'PPC.NOME '                                                                                  +
                 'FROM HSTCONTRIBPREV HST, '                                                                        +
                      'ELEGPATRO EL, '                                                                              +
                      'PLANPREVCONTABIL PPC, '                                                                      +
                      'DOCUMENTO D, '                                                                               +
                      'PARTPREVPLAN     PP, '                                                                       +
                      'CONTRIBUICAO      C, '                                                                       +
                      'CONTPREV         CP, '                                                                       +
                      'PATRO            PT, '                                                                       +
                      'SITPART          SP  '                                                                       +
                 // SIG 126671 Ferrari     'CONTRIBPREVPARTP CPP '                                                                       +
                 'WHERE HST.IDPESSOA = EL.IDPESSOA '                                                                +
                   'AND NVL(HST.IDPLANPREVCONTAB, HST.IDPLANOPREV) = PPC.IDPLANOPREV '                              +
                   'AND HST.CODDOCUMENTOPREV = D.CODDOCUMENTO(+) '                                                  +
                   'AND (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '                                                   +
                // SIG 126671 Ferrari   'AND (CPP.IDPESSJUR = HST.IDPESSJUR) '                                                           +
                // SIG 126671 Ferrari   'AND (PPC.IDPLANOPREV = NVL(CPP.IDPLANPREVCONTAB, HST.IDPLANOPREV)) '                            +
                   'AND (PPC.IDPLANOPREV = HST.IDPLANOPREV) '                                                       +  // SIG 126671 Ferrari
                // SIG 126671 Ferrari   'AND (CPP.IDPESSOA = HST.IDPESSOA) '                                                             +
                // SIG 126671 Ferrari   'AND (CPP.SEQPROPOSTA = HST.SEQPROPOSTA) '                                                       +
                // SIG 126671 Ferrari   'AND (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO) '                                                 +
                   'AND (PP.IDPESSJUR = HST.IDPESSJUR) '                                                            +
                   'AND (PP.IDPLANOPREV = HST.IDPLANOPREV) '                                                        +
                   'AND (PP.IDPESSOA = HST.IDPESSOA) '                                                              +
                   'AND (PP.SEQPROPOSTA = HST.SEQPROPOSTA) '                                                        +
                   'AND (PT.IDPESSOA = PP.IDPESSJUR) '                                                              +
                   'AND (EL.IDPESSOA = PP.IDPESSOA) '                                                               +
                   'AND (EL.IDPESSJUR = PP.IDPESSJUR) '                                                             +
                   'AND (CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO) '                                                  +
                   'AND (CP.IDPLANOPREV = HST.IDPLANOPREV) '                                                        +
                   'AND (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '                                                    +
                   'AND (PP.IDSITPART = SP.IDSITPART) '                                                             +
                // SIG 126671 Ferrari   'AND (NVL(HST.IDPLANPREVCONTAB, HST.IDPLANOPREV) = CPP.IDPLANOPREV) '                            +
                   'AND (HST.IDPLANOPREV IS NOT NULL) '                                                             +
                   sSqlMatricula                                                                                    +
                   'AND (EL.MATRICULA IS NOT NULL) '                                                                +
                   'AND (HST.MESCOBRANCA BETWEEN '+QuotedStr(EdtCobranca1.Text)+' AND '+QuotedStr(EdtCobranca2.Text)+') ' +
                   sSqlIdReferencia                                                                                 +
                   'AND (HST.IDPESSJUR      IN (' + sIdPessJur + ')) '                                              +
                   'AND (HST.IDPLANOPREV    IN (' + sIdPlanoPrevPrev  + ')) '                                       +
                   'AND (HST.IDCONTRIBUICAO IN (' + sIdContribuicoes + ')) '                                        +
                   'AND (HST.SITRECEBIMENTO IN (2, 3))                    '                                         +
                   'AND (SP.IDSITPART       IN (' + sIdSituacoes + ')) '                                            +
                   'AND (PPC.IDPLANOPREV    IN (' + sIdPlanos  + ')) '                                              +
                 'GROUP BY  D.NODOCUMENTO, '                                                                        +
                           'HST.MESREFERENCIA, '                                                                    +
                           'HST.MESCOBRANCA, '                                                                      +
                           'PPC.IDPLANOPREV, '                                                                 +
                           'PPC.NOME '                                                                              +
             ') HIST '                                                                                              +
            'WHERE LO.CODDOCUMENTO = HIST.DOCUMENTO '                                                               +
                  'AND LO.OPERACAO = 4 '                                                                            +
            'AND NOT EXISTS (SELECT * FROM ALTERADORXCONTRIB AC WHERE LO.CODALTERADOR = AC.CODALTERADOR)'           +
     'UNION ALL ';

     sql2:= 'SELECT HST.SITRECEBIMENTO, '                                                                          +
                  'EL.MATRICULA, '                                                                                  +
                  'D.NODOCUMENTO, '                                                                                 +
                  'C.NOME AS CONTRIBUICAO, '                                                                        +
                  'HST.MESREFERENCIA, '                                                                             +
                  'HST.MESCOBRANCA, '                                                                               +
                  'HST.DATAPREVISAORECE, '                                                                          +
                  'HST.DATARECEBIMENTO, '                                                                           +
                  'HST.VALORRECEBIDO, '                                                                             +
                  'PPC.NOME, '                                                                                      +
                  '(HST.IDPLANOPREV) AS IDPLANPREVCONTAB, '                                +
                  'HST.IDPLANOPREV, '                                                                               +
                  'DECODE(HST.FLGDEVOLUCAO, 0, HST.VALORESPERADO, 1, -HST.VALORESPERADO) AS VALORESPERADO, '        +
                  'SUM(DECODE(HST.FLGDEVOLUCAO,  0,NVL(HA.VALOR, 0),  1,NVL(-HA.VALOR, 0),0)) AS SOMAALTERADORES, ' +
                  'DECODE(HST.FLGDEVOLUCAO, '                                                                       +
                          '0, DECODE(HST.FLGDEVOLUCAO, '                                                            +
                                     '0,NVL(HST.VALORRECEBIDO, 0), '                                                +
                                       'NVL(-HST.VALORRECEBIDO, 0)) + SUM(DECODE(HST.FLGDEVOLUCAO, '                +
                                                                                '0,NVL(HA.VALORRECEBIDO, 0),  '     +
                                                                                '1,NVL(-HA.VALORRECEBIDO, 0), '     +
                                                                                '0'                                 +
                                                                               ')'                                  +
                                                                         '),'                                       +
                          '1,-(DECODE(HST.FLGDEVOLUCAO, '                                                           +
                                      '0,ABS(NVL(HST.VALORRECEBIDO, 0)), '                                          +
                                      'ABS(NVL(HST.VALORRECEBIDO, 0))) + SUM(DECODE(HST.FLGDEVOLUCAO, '             +
                                                                                   '0,ABS(NVL(HA.VALORRECEBIDO, 0)),'+
                                                                                   '1,ABS(NVL(HA.VALORRECEBIDO, 0)),'+
                                                                                   '0'                              +
                                                                                  ')'                               +
                                                                            ')'                                     +
                              ')'                                                                                   +
                         ') AS TOTALRECEBIDO, '                                                                     +
                  'DECODE(HST.SITRECEBIMENTO, '                                                                     +
                          '2,''Recebidos'', '                                                                       +
                          '3,''Recebidos com divergência'''                                                         +
                         ') FORMARECEBIMENTO '                                                                      +
           'FROM CONTRIBUICAO       C, '                                                                            +
                'CONTPREV          CP, '                                                                            +
                'PATRO             PT, '                                                                            +
                'SITPART           SP, '                                                                            +
                'ELEGPATRO         EL, '                                                                            +
                'PARTPREVPLAN      PP, '                                                                            +
                'PLANPREVCONTABIL PPC, '                                                                            +
             //   'CONTRIBPREVPARTP CPP, '                                                                            +
                'HSTCONTRIBPREV   HST, '                                                                            +
                'DOCUMENTO          D, '                                                                            +
                'HSTATRASOCONTRIB  HA, '                                                                            +
                'TIPOALTERADOR     TA  '                                                                            +
           'WHERE HST.IDCONTRIBUICAO IN (' + sIdContribuicoes + ') '                                                +
           'AND (HST.SITRECEBIMENTO IN (2, 3)) '                                                                    +
           'AND (HST.IDPESSJUR      IN (' + sIdPessJur + ')) '                                                      +
           'AND (HST.IDPLANOPREV    IN (' + sIdPlanoPrevPrev  + ')) '                                               +
           'AND (HST.MESCOBRANCA BETWEEN '+QuotedStr(EdtCobranca1.Text)+' AND '+QuotedStr(EdtCobranca2.Text)+') '   +
            sSqlMatricula                                                                                           +
           'AND (EL.MATRICULA IS NOT NULL) '                                                                        +
            sSqlIdReferencia                                                                                        +
           'AND (SP.IDSITPART IN (' + sIdSituacoes + ')) '                                                          +
           'AND (HST.IDPLANPREVCONTAB    IN (' + sIdPlanos  + ')) '                                                 +
           'AND (HST.CODDOCUMENTOPREV = D.CODDOCUMENTO(+)) '                                                        +
           'AND (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '                                                           +
          // 'AND (CPP.IDPESSJUR = HST.IDPESSJUR) '                                                                   +
           'AND (PPC.IDPLANOPREV = HST.IDPLANOPREV) '                                    +
          // 'AND (CPP.IDPESSOA = HST.IDPESSOA) '                                                                     +
         //  'AND (CPP.SEQPROPOSTA = HST.SEQPROPOSTA) '                                                               +
         //  'AND (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO) '                                                         +
           'AND (PP.IDPESSJUR = HST.IDPESSJUR) '                                                                    +
           'AND (PP.IDPLANOPREV = HST.IDPLANOPREV) '                                                                +
           'AND (PP.IDPESSOA = HST.IDPESSOA) '                                                                      +
           'AND (PP.SEQPROPOSTA = HST.SEQPROPOSTA) '                                                                +
           'AND (PT.IDPESSOA = PP.IDPESSJUR) '                                                                      +
           'AND (EL.IDPESSOA = PP.IDPESSOA) '                                                                       +
           'AND (EL.IDPESSJUR = PP.IDPESSJUR) '                                                                     +
           'AND (CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO) '                                                          +
           'AND (CP.IDPLANOPREV = HST.IDPLANOPREV) '                                                                +
           'AND (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '                                                            +
           'AND (PP.IDSITPART = SP.IDSITPART) '                                                                     +
         //  'AND (HST.IDPLANOPREV = CPP.IDPLANOPREV) '                                                               +
           'AND (HST.IDPLANOPREV IS NOT NULL) '                                                                     +
           'AND (HA.NUMRECEBIMENTO(+) = HST.NUMRECEBIMENTO) '                                                       +
           'AND (HA.MESCOBRANCA(+) = HST.MESCOBRANCA) '                                                             +
           'AND (HA.MESREFERENCIA(+) = HST.MESREFERENCIA) '                                                         +
           'AND (HA.IDMOTIVO(+) = HST.IDMOTIVO) '                                                                   +
           'AND (HA.CODALTERADOR = TA.CODALTERADOR(+)) '                                                            +
           'GROUP BY HST.SITRECEBIMENTO, '                                                                          +
                     'EL.MATRICULA, '                                                                               +
                     'D.NODOCUMENTO, '                                                                              +
                     'C.NOME, '                                                                                     +
                     'HST.MESREFERENCIA, '                                                                          +
                     'PPC.NOME, '                                                                                   +
                     'HST.MESCOBRANCA, '                                                                            +
                     'HST.DATAPREVISAORECE, '                                                                       +
                     'HST.DATARECEBIMENTO, '                                                                        +
                     'HST.VALORESPERADO, '                                                                          +
                     'HST.VALORRECEBIDO, '                                                                          +
                     'HST.IDPLANOPREV, '                                                                            +
                     'HST.FLGDEVOLUCAO, '                                                                           +
                     'HST.SITRECEBIMENTO, '                                                                         +
                     'HST.NUMRECEBIMENTO '                                                                          +
           'ORDER BY 11,'                                                                                           +// --IDPLANPREVCONTAB
                     '2,'                                                                                           +// --MATRICULA
                     '5,'                                                                                           +// --MESREFERENCIA
                     '6,'                                                                                           +// --MESCOBRANCA
                     '3';                                                                                            //--NODOCUMENTO
   if (EdtMatricula.Text='')and(EdtNome.Text='') then
         Result := sql1 + sql2
   else
         Result := sql2;
// FIM SIG 126671
end;

{ Objetivo : Retornar a query com a consulta para o CheckListBox de acordo com o tdTipoDado}
function TParamRelFinanc.GetQueryCheckListBox(tdTipoDado: TTipoDados; var bPodeAbrir: Boolean):TwwQuery;
var
   qry  : TwwQuery;
   sSql : string;
   sIn  : string;
begin
  bPodeAbrir       := True;
  qry              := TwwQuery.Create(Self);
  qry.DatabaseName := 'BaseDados';
  Case Integer(tdTipoDado) of
   { Patrocinadora }
    0: sSql := 'SELECT P.NOME,P.IDPESSOA FROM PATRO PT, PESSOA P WHERE PT.IDPESSOA = P.IDPESSOA AND EXISTS '+
               '(SELECT 1 FROM PLANPREVPATRO PPP WHERE PPP.IDPESSJUR = PT.IDPESSOA ) ORDER BY P.NOME';

   { Planos Contábeis }
    1: sSql := 'SELECT P.IDPLANOPREV, P.NOME, P.IDPLANOPREVPREV FROM PLANPREVCONTABIL P WHERE P.ATIVO      = ' + QuotedStr('S') +
                                                             ' AND P.FLGEXCLUSIVOCONTAB = ' + QuotedStr('N') +
                                              ' ORDER BY P.NOME';
   { Situações dos participantes }
    2: sSql := 'SELECT IDSITPART, DESCRICAO, FLGINTERNO FROM SITPART WHERE FLGINTERNO IN (' +
                                                                                           QuotedStr('AT') + ',' +
                                                                                           QuotedStr('AS') + ',' +
                                                                                           QuotedStr('MP') + ',' +
                                                                                           QuotedStr('MS') + ',' +
                                                                                           QuotedStr('CA') + ',' +
                                                                                           QuotedStr('MA') +
                                                                                          ') ORDER BY DESCRICAO';
   { Contribuições }
    3:begin
        sIn := GetIn(ListaSituacoesSelecionadas);
        if Length(Trim(sIn)) > 0 then
          sSql := 'SELECT DISTINCT(C.IDCONTRIBUICAO), C.NOME FROM CONTRIBUICAO C, CONTPREV CP WHERE C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO AND CP.FLGINTERNO IN (' +sIn+ ') ORDER BY C.NOME'
        else
          bPodeAbrir := False;
      end;
  end;
  qry.SQL.Add(sSql);
  Result := qry;
end;

{ Objetivo : Retornar o "in" da consulta }
function TParamRelFinanc.GetIn(slIn: TStringList): String;
var
  sResult  : string;
  iCount   : Integer;
  slInCopia: TStringList;
begin
  sResult := '';
  if Assigned(slIn) then
   begin
      Try
        slInCopia := TStringList.Create;
        { Retiro os itens repetidos (se houver, que é o caso das situações dos participantes )}
        For iCount := 0 to slIn.Count -1 do
          if slInCopia.IndexOf(slIn[iCount]) = -1 then
               slInCopia.Add(slIn[iCount]);


        { agora, o in será o que está no slInCopia }
        For iCount := 0 to slInCopia.Count -1 do
           if iCount = 0 then
             sResult := QuotedStr(LerStrings(slInCopia[iCount],0)) + ','
           else
             sResult := sResult + QuotedStr(LerStrings(slInCopia[iCount],0))+',';

        { Retira o último caractere, se este for uma vírgula }
        if Length(Trim(sResult)) > 0 then
          if Copy(sResult,Length(sResult),1) = ',' then
            sResult := Copy(sResult,1,Length(sResult) - 1);
      finally
         FreeAndNil(slInCopia);
      end;
   end;
  Result := sResult;
end;

procedure TParamRelFinanc.btPesquisaClick(Sender: TObject);
begin
   // inherited;
   MontaSelect1.Caption := 'Contribuições Previdenciárias v'+Sistema.Versao;
   if MontaSelect1.Executar = mrok then
      begin
        EdtMatricula.Text  := MontaSelect1.ValoresChave[0];
        EdtNome.Text       := MontaSelect1.ValoresChave[1];
        { Altera a solicitação pela matrícula e atribui FidPessoaSel ao valor da idPessoa retornada da consulta buscar }
        SetTipoDaSolicitacao(tsDaMatricula,StrToInt(MontaSelect1.ValoresChave[2]));
      end else
      begin
        SetTipoDaSolicitacao(tsNone);
        EdtMatricula.Clear;
        EdtNome.Clear;
      end;
   EdtCobranca1.SetFocus;
end;



procedure TParamRelFinanc.FormCreate(Sender: TObject);
begin
  //inherited;
  SetTipoDaSolicitacao(tsNone);
  Self.Caption := 'Contribuições Previdenciárias v'+Sistema.Versao;
  FIdSituacoesSelecionadas        := TStringList.Create;
  FListaPatroSelecionados         := TStringList.Create;
  FListaPlanosSelecionados        := TStringList.Create;
  FListaPlanosPrevPrevSelecionados:= TStringList.Create;
  FListaSituacoesSelecionadas     := TStringList.Create;
  FListaContribuicoesSelecionadas := TStringList.Create;


  CarregaCheckList(tdPatro);
  CarregaCheckList(tdPlanosContabeis);
  CarregaCheckList(tdSituacoesDosParticipantes);

  Self.FormStyle := fsNormal;
  application.ProcessMessages;

end;

{ Objetivo : Alterar o tipo da Solicitação e idPessoaSel }
procedure TParamRelFinanc.SetTipoDaSolicitacao(const Value: TTipoSol;
          intIdPessoa : Integer = 0);
begin
  FTipoSolicitacao := Value;
  if intIdPessoa = 0 then
    FIdPessoaSel := -1
  else
    FIdPessoaSel := intIdPessoa;
end;


{ Objetivo: Filtrar o Texto passado no parâmetro }
function TParamRelFinanc.FiltraTexto(sTexto: String; tipoFiltro: TTipoFiltro):String;
var
   iCount : Integer;
   sResult : string;
begin
  sResult := '';
  if Length(Trim(sTexto)) > 0 then
    For iCount := 1 to Length(sTexto) do
      begin
        Case Integer(tipoFiltro) of
          0:begin
              if sTexto[iCount] in ['0','1','2','3','4','5','6','7','8','9'] then
               Continue;
            end;
          1:begin
              if sTexto[iCount] in ['/','_'] then
               Continue;
            end;
        end;
        sResult := sResult + sTexto[iCount];
      end;
  Result := Trim(sResult);
end;

procedure TParamRelFinanc.chkListPlanosDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
  with TCheckListBox(Control).Canvas do
  begin
    Brush.Style := bsClear;
    Font.Color  := clBlack;

    FillRect(Rect);
    { pinta o rect com a mesma cor do CheckListBox, apagando a seleção azul }
    Brush.Color := TCheckListBox(Control).Color;

    DesenhaTexto(TCheckListBox(Control).Canvas, Rect.Left, Rect.Top,  LerStrings(TCheckListBox(Control).Items[Index],1),'E',Rect.Right - 10);


    if odFocused in State then
      DrawFocusRect(Rect);
  end;
end;

procedure TParamRelFinanc.chkListSituacoesDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
  with TCheckListBox(Control).Canvas do
  begin
    Brush.Style := bsClear;
    Font.Color  := clBlack;

    FillRect(Rect);
    { pinta o rect com a mesma cor do CheckListBox, apagando a seleção azul }
    Brush.Color := TCheckListBox(Control).Color;

    DesenhaTexto(TCheckListBox(Control).Canvas, Rect.Left, Rect.Top,  LerStrings(TCheckListBox(Control).Items[Index],1),'E',Rect.Right - 10);


    if odFocused in State then
      DrawFocusRect(Rect);
  end;
end;

procedure TParamRelFinanc.chkListPatroDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
  with TCheckListBox(Control).Canvas do
  begin
    Brush.Style := bsClear;
    Font.Color  := clBlack;

    FillRect(Rect);
    { pinta o rect com a mesma cor do CheckListBox, apagando a seleção azul }
    Brush.Color := TCheckListBox(Control).Color;

    DesenhaTexto(TCheckListBox(Control).Canvas, Rect.Left, Rect.Top,  LerStrings(TCheckListBox(Control).Items[Index],1),'E',Rect.Right - 10);


    if odFocused in State then
      DrawFocusRect(Rect);
  end;
end;

{ Objetivo: Marca e desmarca o CheckListBox de acordo com o nome do botão que desparou o evento }
procedure TParamRelFinanc.SelecaoItemCheckListBox(Sender: TObject);
var
   boolX       : Boolean;
   iCount      : Integer;
   oComponent  : TComponent;

begin
  if (Sender is TBitBtn) then
    begin
       if Pos('Sel',TBitBtn(Sender).Name) > 0 then
         begin
            { Se encontrar no Name btSelTudo é Selecionar, para tirar seleção é btDesSelTudo }
            boolX := iif(pos('btSelTudo',TBitBtn(Sender).Name) > 0, True, False );
            { No name do botão tem uma dica de qual checklist está relacionado
              nesta parte oComponent é o checkListBox }
                 if Pos('Patro',TBitBtn(Sender).Name) > 0 then
                    oComponent := Self.FindComponent('chkListPatro')
            else if Pos('Planos',TBitBtn(Sender).Name) > 0 then
                    oComponent := Self.FindComponent('chkListPlanos')
            else if Pos('Situacoes',TBitBtn(Sender).Name) > 0 then
                    oComponent := Self.FindComponent('chkListSituacoes')
                 else oComponent := Self.FindComponent('chkListContribuicoes');



           { varre o CheckList marcando ou desmarcando }
           if (Assigned(oComponent)) then
               begin
                 For iCount := 0 to TCheckListBox(oComponent).Items.Count -1 do
                   begin
                     { Carrega o índice da marcação ou desmarcação }
                     TCheckListBox(oComponent).ItemIndex := iCount;
                     { Marca ou Desmarca }
                     TCheckListBox(oComponent).Checked[iCount] := boolX;
                     { Clica no item }
                     TCheckListBox(oComponent).OnClickCheck(TCheckListBox(oComponent));
                   end;
               end;
         end;
    end;
end;

procedure TParamRelFinanc.PreparaMensagemDeMarcacao(oCheckDaMensagem: TCheckListBox; aListaDaMensagem: TStringList; var sMensagemCheck: String);
begin
    if (aListaDaMensagem.Count = 0) and (Length(Trim(sMensagemCheck)) = 0) then
      begin
             if oCheckDaMensagem.Name = 'chkListPatro' then
                sMensagemCheck :=  'Selecione ao menos uma Patrocinadora!'
         else if oCheckDaMensagem.Name = 'chkListPlanos' then
                sMensagemCheck := 'Selecione ao menos um Plano Contábil!'
         else if oCheckDaMensagem.Name = 'chkListSituacoes' then
                sMensagemCheck := 'Selecione ao menos uma situação!'
           else sMensagemCheck := 'Selecione ao menos uma contribuição!';
      end;
end;

procedure TParamRelFinanc.btSelTudoPatroClick(Sender: TObject);
begin
  inherited;
  SelecaoItemCheckListBox(Sender);
end;

{ Objetivo: Validar os períodos de data ( Cobrança ou Referencia ) }
function TParamRelFinanc.ValidaParametrosDePesquisa(tipoDeValidacao: TTipoValidacao):Boolean;

var
  iLengthInicial    : Integer;
  iLengthFinal      : Integer;
  bExibiuMensagem   : Boolean;
  EdtMaskData1      : TMaskEdit;
  EdtMaskData2      : TMaskEdit;
  arConfigmensagem  : Array of String;
  bResult           : Boolean;
  { Objetivo: Configuarar o array onde está os parâmetros de mensagem }
  procedure ConfiguraArrayMensagem;
  begin
    if Length(arConfigmensagem) = 0 then
      begin
        SetLength(arConfigmensagem,2);
        arConfigmensagem[1] := 'Atenção';
      end;
  end;
  { Objetivo: Fazer a validação do mês informado (1 a 13) }
  Function ValidaMes(intMes: Integer):Boolean;
  begin
    if intMes > 13 then
      begin
         MsgDlg('Os meses deverão seguir da seguinte forma : '  + chr(13) +
                                                                  chr(13) +
                '01: Janeiro'                                   + chr(13) +
                '02: Fevereiro'                                 + chr(13) +
                '03: Março'                                     + chr(13) +
                '04: Abril'                                     + chr(13) +
                '05: Maio'                                      + chr(13) +
                '06: Junho'                                     + chr(13) +
                '07: Julho'                                     + chr(13) +
                '08: Agosto'                                    + chr(13) +
                '09: Setembro'                                  + chr(13) +
                '10: Outubro'                                   + chr(13) +
                '11: Novembro'                                  + chr(13) +
                '12: Dezembro'                                  + chr(13) +
                '13: 13º Salario', 'Atenção', mtInformation, [mbOk], 0);
         Result := False;
      end else
      Result := True;
  end;

  { Objetivo: Fazer a comparação dos períodos, pode ser tvCobranca ou tvReferencia,
    que é do tipo TTipoValidacao }
  Procedure ComparaMeses(tipoValidacao: TTipoValidacao);
  var
     sPreenchimento : string;
  begin
    Case Integer(tipoValidacao) of
       { Ano/Mes Cobrança }
       0:begin
           EdtMaskData1   := EdtCobranca1;
           EdtMaskData2   := EdtCobranca2;
           sPreenchimento := 'Ano/Mês de Cobrança';
         end;
       { Ano/Mes Referência }
       1:begin
           EdtMaskData1   := EdtReferencia1;
           EdtMaskData2   := EdtReferencia2;
           sPreenchimento := 'Ano/Mês de Referência';
         end;
    end;

    iLengthInicial  := Length(FiltraTexto(EdtMaskData1.Text,tpData));
    iLengthFinal    := Length(FiltraTexto(EdtMaskData2.Text,tpData));
     if (iLengthInicial < 6) or (iLengthFinal < 6) then
       begin
         ConfiguraArrayMensagem;
         if (iLengthInicial < 6) and (Not bExibiuMensagem) then
           begin
             bExibiuMensagem     := True;
             arConfigmensagem[0] := 'O preenchimento do ' + sPreenchimento + ' Inicial é obrigatório!';
           end;
         if (iLengthFinal < 6) and (Not bExibiuMensagem) then
           begin
             bExibiuMensagem     := True;
             arConfigmensagem[0] := 'O preenchimento do ' + sPreenchimento + ' Final é obrigatório!';
           end;
       end;
    if (EdtMaskData1.Text > EdtMaskData2.Text) and ( Not bExibiuMensagem) then
      begin
        ConfiguraArrayMensagem;
        bExibiuMensagem     := True;
        arConfigmensagem[0] := 'O ' + sPreenchimento +' Inicial deverá ser menor ou igual ao Ano/Mês de Cobrança Final!';
      end;

  end;
begin
  bResult         := False;
  bExibiuMensagem := False;
  ComparaMeses(tipoDeValidacao);
  if bExibiuMensagem then
    begin
       MsgDlg( arConfigmensagem[0], arConfigmensagem[1], mtWarning, [mbOk], 0);
       Finalize(arConfigmensagem);
    end else
    begin
      if Not ((ValidaMes(StrToInt(Copy(EdtMaskData1.Text,6,2)))) and (ValidaMes(StrToInt(Copy(EdtMaskData2.Text,6,2)))))  then
         bResult := False
       else
         bResult := not bExibiuMensagem
    end;
   Result := bResult;
end;

procedure TParamRelFinanc.bbtnConfirmarClick(Sender: TObject);
var
  bVerificaAnoMesReferencia : Boolean;
  bSelecionouTodos          : Boolean;
  sMensagemCheck            : string;
begin
  inherited;
  sMensagemCheck := '';

  { Verifica Períodos para pesquisa }
  if ValidaParametrosdePesquisa(tvcobranca) then
    begin
       bVerificaAnoMesReferencia :=  ( (Length(FiltraTexto(EdtReferencia1.Text,tpData)) > 0 ) or  (Length(FiltraTexto(EdtReferencia2.Text,tpData)) > 0 ));
       if bVerificaAnoMesReferencia then
         begin
           if Not ValidaParametrosdePesquisa(tvReferencia) then
             Exit;
         end;

      {  Prepara mensagem caso não tenha selecionado algum checkbox }
      PreparaMensagemDeMarcacao(chkListPatro        , ListaPatroSelecionados        , sMensagemCheck);
      PreparaMensagemDeMarcacao(chkListPlanos       , ListaPlanosSelecionados       , sMensagemCheck);
      PreparaMensagemDeMarcacao(chkListSituacoes    , ListaSituacoesSelecionadas    , sMensagemCheck);
      PreparaMensagemDeMarcacao(chkListContribuicoes, ListaContribuicoesSelecionadas, sMensagemCheck);

      {Verifica se não foi Selecionado algum }
      bSelecionouTodos := (ListaPatroSelecionados.Count > 0) and (ListaPlanosSelecionados.Count > 0) and
                          (ListaSituacoesSelecionadas.Count > 0) and (ListaContribuicoesSelecionadas.Count > 0);
      if not bSelecionouTodos then
        begin
          MsgDlg( sMensagemCheck, 'Atenção', mtWarning, [mbOk], 0);
          Exit;
        end;

       Self.ModalResult := mrOk;
       { aqui prossegue com a impressão }
    end;
end;

procedure TParamRelFinanc.SetFListaPlanosSelecionados(const Value: String);
begin
  if Length(Trim(Value)) > 0 then
    Self.FListaPlanosSelecionados.Add(Value);
end;

procedure TParamRelFinanc.SetFListaPlanosPrevPrevSelecionados(const Value: String);
begin
  if Length(Trim(Value)) > 0 then
    Self.FListaPlanosPrevPrevSelecionados.Add(Value);
end;

procedure TParamRelFinanc.SetFListaContribuicoesSelecionadas(
  const Value: String);
begin
  if Length(Trim(Value)) > 0 then
    Self.FListaContribuicoesSelecionadas.Add(Value);
end;

procedure TParamRelFinanc.SetFIdSituacoesSelecionadas(const Value: String);
begin
  if Length(Trim(Value)) > 0 then
    Self.FIdSituacoesSelecionadas.Add(Value);
end;


procedure TParamRelFinanc.SetFListaPatroSelecionados(const Value: String);
begin
  if Length(Trim(Value)) > 0 then
    Self.FListaPatroSelecionados.Add(Value);
end;

procedure TParamRelFinanc.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FListaPatroSelecionados);
  FreeAndNil(FListaPlanosSelecionados);
  FreeAndNil(FListaPlanosPrevPrevSelecionados); 
  FreeAndNil(FListaSituacoesSelecionadas);
  FreeAndNil(FListaContribuicoesSelecionadas);
  FreeAndNil(FIdSituacoesSelecionadas);
end;

procedure TParamRelFinanc.chkListPatroClickCheck(Sender: TObject);
begin
  inherited;
  if chkListPatro.Items.Count > 0 then
    if chkListPatro.Checked[chkListPatro.ItemIndex] then
        SetFListaPatroSelecionados(LerStrings(chkListPatro.Items[chkListPatro.itemIndex],0))
    else
        RemoveDaLista(LerStrings(chkListPatro.Items[chkListPatro.itemIndex],0),Sender,ListaPatroSelecionados);
end;


{ Objetivo : Procurar e Remover o item da lista }
procedure TParamRelFinanc.RemoveDaLista(Const Value : String; Sender: TObject; aLista: TStringList; intIdLista : Integer = 0 );
var
  iCount      : Integer;
  sNomeCheck  : string;
  sItemRemove : string;
  oCheck      : String;
  bHaRepetidos: Boolean;
begin
  if (Sender is TCheckListBox) then
    begin
      if TCheckListBox(Sender).Items.Count > 0 then
        begin
          { No click, antes de executar ele já desmarcou, por isso tenho que pegar false }
           if not (TCheckListBox(Sender).Checked[TCheckListBox(Sender).ItemIndex]) then
             begin
               { o parâmetro intIdLista é a posição do item na lista que será removido, então pega o item a ser removido }
               sItemRemove := LerStrings(TCheckListBox(Sender).Items[TCheckListBox(Sender).ItemIndex],intIdLista);
               {Verifica se há pode haver repetidos na lista que deverá ser excluida}
               bHaRepetidos := iif(intIdLista = 2,True,False);
               { Remove o item da Lista }
               RemoveItem(aLista,sItemRemove,bHaRepetidos);
             end;
        end;

    end;
end;

{ Objetivo: Revmover o item da lista }
procedure TParamRelFinanc.RemoveItem(aLista: TStringList; oItem: String; bHaRepetidos: Boolean = False);
var
  iCount     : Integer;
  slCopia    : TStringList;
  iQtRepete  : Integer;
begin
  Try
     slCopia := TStringList.Create;

     if bHaRepetidos then
      begin
        iQtRepete := 0;
        { Verifica quantas ocorrencias há com o mesmo nome de oItem. }
        For iCount := 0 to aLista.Count -1 do
          begin
            if aLista[iCount] = oItem then
              inc(iQtRepete);
          end;
        { então, tenho que incluir a Qt de repetidos menos 1 }
        Dec(iQtRepete);
      end;


     For iCount := 0 to aLista.Count -1 do
      begin
        if not bHaRepetidos then
          begin
           { Nesse caso não tem repetidos, ele faz a busca pelo id que é passado em oItem, então ele copia desprezando o item passado }
            if aLista[iCount] <> oItem then
              slCopia.Add(aLista[iCount]);
          end else
          begin
            {Aqui ele tem repetidos, então se tiver 3 repetidos tenho que excluir um - já foi feito acima - e incluir os outros 2 repetidos e o restante que houver }
            if (iQtRepete > 0) and (aLista[iCount] = oItem) then
              begin
                { inclui o repetido e decrementa 1 }
                Dec(iQtRepete);
                slCopia.Add(aLista[iCount]);
              end else
              begin
                { inclui o não repetido, se houver }
                if aLista[iCount] <> oItem then
                   slCopia.Add(aLista[iCount]);
              end;
          end;
       end;

     { Apaga aLista }
     aLista.Clear;

     { Transfere os dados da Copia para a Lista }
     For iCount := 0 to slCopia.Count -1 do
      aLista.Add(slCopia[iCount]);
  Finally
     { Libera a Copia }
     FreeAndNil(slCopia);
  end;
end;



procedure TParamRelFinanc.chkListPlanosClickCheck(Sender: TObject);
begin
  inherited;
  if chkListPlanos.Items.Count > 0 then
    if chkListPLanos.Checked[chkListPlanos.ItemIndex] then
      begin
        SetFListaPlanosSelecionados(LerStrings(chkListPlanos.Items[chkListPlanos.itemIndex],0));
        SetFListaPlanosPrevPrevSelecionados(LerStrings(chkListPlanos.Items[chkListPlanos.itemIndex],2)); 
      end
    else
      begin
        RemoveDaLista(LerStrings(chkListPlanos.Items[chkListPlanos.itemIndex],0),Sender,ListaPlanosSelecionados);
        RemoveDaLista(LerStrings(chkListPlanos.Items[chkListPlanos.itemIndex],2),Sender,ListaPlanosSelecionados);
      end;
end;

procedure TParamRelFinanc.SetFListaSituacoesSelecionadas(
  const Value: String);
begin
  Self.FListaSituacoesSelecionadas.Add(Value);
end;

procedure TParamRelFinanc.chkListSituacoesClickCheck(Sender: TObject);
begin
  inherited;
  if chkListSituacoes.Items.Count > 0 then
    begin
       if chkListSituacoes.Checked[chkListSituacoes.ItemIndex] then
         begin
           SetFListaSituacoesSelecionadas(LerStrings(chkListSituacoes.Items[chkListSituacoes.itemIndex],2));
           SetFIdSituacoesSelecionadas(LerStrings(chkListSituacoes.Items[chkListSituacoes.itemIndex],0));
         end else
         begin
           RemoveDaLista(LerStrings(chkListSituacoes.Items[chkListSituacoes.itemIndex],2),chkListSituacoes,ListaSituacoesSelecionadas,2);
           RemoveDaLista(LerStrings(chkListSituacoes.Items[chkListSituacoes.itemIndex],0),chkListSituacoes,IdSituacoesSelecionadas);
         end;
      { marcando ou desmarcando tenho que atualizar o ChkListSituacoes }
      CarregaCheckList(tdContribuicoes);
    end;
end;



procedure TParamRelFinanc.chkListContribuicoesClickCheck(Sender: TObject);
begin
  inherited;
  if chkListContribuicoes.Items.Count > 0 then
    if chkListContribuicoes.Checked[chkListContribuicoes.ItemIndex] then
      SetFListaContribuicoesSelecionadas(LerStrings(chkListContribuicoes.Items[chkListContribuicoes.itemIndex],0))
    else
      RemoveDaLista(LerStrings(chkListContribuicoes.Items[chkListContribuicoes.itemIndex],0),Sender,ListaContribuicoesSelecionadas);
end;

procedure TParamRelFinanc.chkListContribuicoesDrawItem(
  Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
begin
  inherited;
with TCheckListBox(Control).Canvas do
  begin
    Brush.Style := bsClear;
    Font.Color  := clBlack;

    FillRect(Rect);
    { pinta o rect com a mesma cor do CheckListBox, apagando a seleção azul }
    Brush.Color := TCheckListBox(Control).Color;

    DesenhaTexto(TCheckListBox(Control).Canvas, Rect.Left, Rect.Top,  LerStrings(TCheckListBox(Control).Items[Index],1),'E',Rect.Right - 10);


    if odFocused in State then
      DrawFocusRect(Rect);
  end;
end;



procedure TParamRelFinanc.FormShow(Sender: TObject);
begin
  inherited;
  EdtCobranca1.SetFocus;
end;


procedure TParamRelFinanc.btClearClick(Sender: TObject);
begin
  inherited;
  EdtMatricula.clear;
  edtnome.clear;
end;

end.
