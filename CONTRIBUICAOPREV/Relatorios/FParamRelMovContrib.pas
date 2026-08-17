// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Darivaldo Alencar
// SOL.253577/18061 ppm.1238748
// Data        : 15.02.2016
// Alteração   : Desenvolvimento deste Form
// -----------------------------------------------------------------------------
unit FParamRelMovContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, MontaSelect,
  TB97Tlbr, TB97, ExtCtrls, ImgList, Mask, CheckLst, wwQuery, FAguarde,ComObj,
  uMensErro, Db, DBClient, BfDialogs, BrowseFolder, uProcuraDir,USistema,
  uCmSqlParams, Spin, wwdbdatetimepicker, CMDateTimePicker,fMostraRelat;

type
   TTipoDados           = ( tdPatro   , tdPlanosContabeis, tdSituacoesDosParticipantes, tdContribuicoes );
   TTipoSol             = ( tsNone    , tsDaMatricula );
   TComponentEspecifico = ( teNil     , teEspecifico );
   TTipoFiltro          = ( tpPrefixo , tpData );
   TTipoValidacao       = ( tvCobranca, tvReferencia );
   TData                = ( dInicio, dFim);
   TIndexMes            = (Janeiro, Fevereiro, Marco,    Abril,   Maio,     Junho,
                           Julho,   Agosto,    Setembro, Outubro, Novembro, Dezembro);
   TMsg                 = ( tmWarning, tmError, tmInformation, tmConfirmation, tmCustom );
   TTipoAgrupamento     = ( taPlano  , taParticipante );


   TParamRelMovContrib = class(TfrmOkCancelar)

    LabMatricula: TLabel;
    EdtMatricula: TEdit;
    LabNome: TLabel;
    EdtNome: TEdit;
    btPesquisa: TBitBtn;
    btClear: TBitBtn;
    GBCobranca1: TGroupBox;
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
    CbMesInicio: TComboBox;
    seAnoInicio: TSpinEdit;
    GroupBox1: TGroupBox;
    CbMesFim: TComboBox;
    seAnoFim: TSpinEdit;
    GroupBox2: TGroupBox;
    cmdtDataBase: TCMDateTimePicker;
    rgApresentacao: TRadioGroup;
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
    procedure rgApresentacaoClick(Sender: TObject);
    procedure cmdtDataBaseExit(Sender: TObject);
    procedure btClearClick(Sender: TObject);
  private
    bPodeAbrir                      : Boolean;
    FIdPessoaSel                    : Integer;
    Fselecao                        : Integer;
    FDataBase                       : TDate;
    FTipoSolicitacao                : TTipoSol;
    FIdSituacoesSelecionadas        : TStringList;
    FListaPatroSelecionados         : TStringList;
    FListaPlanosSelecionados        : TStringList;
    FListaPlanosPrevPrevSelecionados: TStringList; 
    FListaSituacoesSelecionadas     : TStringList;
    FListaContribuicoesSelecionadas : TStringList;



    Function GetIn(slIn: TStringList): String;
    Function GetQueryCheckListBox(tdTipoDado : TTipoDados):TwwQuery;
    Function iif(bCondicao: Boolean; SeVerdadeiro,SeFalso: Variant): Variant;
    Function ValidaParametrosdePesquisa(dtDataInicial,dtDataFinal: TDate):Boolean;
    Function LerStrings(strStringRead: String; intPosicao: Integer): String;
    Function GravaStrings(S : String; Posicao : integer; NovaString : String):String;
    Function FormatarTexto(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
    Function IsBissexto(iAno : Integer): Boolean;


    Function GetData(comboMes : TComboBox; intAno : Integer; tipoData: TData ): TDate;
    Function GetIndMes(indMes: TIndexMes): Integer;



    procedure CarregaMeses(ComboMes: TComboBox; indMes: TIndexMes = Janeiro);
    procedure EmiteMensagem(sMensagem: string; tmTipoMensagem : TMsg = tmCustom );
    procedure PreparaMensagemDeMarcacao(oCheckDaMensagem: TCheckListBox; aListaDaMensagem: TStringList; var sMensagemCheck: String);
    Procedure SetTipoDaSolicitacao(Const Value : TTipoSol; intIdPessoa : Integer = 0);
    Procedure CarregaCheckList(tdTipoDado : TTipoDados; tipoDaSolicitacao: TTipoSol = tsNone);
    Procedure SelecaoItemCheckListBox(Sender: TObject);
    procedure DesenhaTexto(Canvas : TCanvas; PosicaoX, PosicaoY : Integer; Texto : String; Alinhamento: String = 'E'; Limite : integer = 0);

    Procedure SetFListaPatroSelecionados         ( Const Value : String );
    procedure SetFListaPlanosSelecionados        ( Const Value : String );
    procedure SetFListaPlanosPrevPrevSelecionados(const Value  : String );
    procedure SetFListaSituacoesSelecionadas     ( Const Value : String );
    procedure SetFListaContribuicoesSelecionadas ( Const Value : String );
    procedure SetFIdSituacoesSelecionadas        ( Const Value : String );


    Procedure RemoveDaLista  ( Const Value : String; Sender: TObject; aLista: TStringList; intIdLista : Integer = 0 );
    Procedure RemoveItem     ( aLista: TStringList; oItem: String; bHaRepetidos: Boolean = False);

    { Private declarations }
  public
    Function GetPeriodos(ComboMes: TComboBox;intAno: Integer): String;
    Function GetSQLImpressao(iIndiceApreentacao: Integer): String;
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
    property Selecao                        : Integer     Read Fselecao;
    property DataBase                       : TDate       Read FDataBase; 



  end;

var
  ParamRelMovContrib: TParamRelMovContrib;
  Meses : Array [0..11] of string = ('Janeiro','Fevereiro','Março'   ,'Abril'  ,'Maio'    ,'Junho',
                                     'Julho'  ,'Agosto'   ,'Setembro','Outubro','Novembro','Dezembro');
  DiaMes: Array [0..11] of Integer = (  31,       28,        31,         30,      31,         30,
                                        31,       31,        30,         31,      30,         31     );


implementation

{$R *.DFM}

Function TParamRelMovContrib.FormatarTexto(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
var
   QuantidadeAcrescentar,
   TamanhoTexto,
   PosicaoInicial,
   i : integer;

begin
   case CaracterAcrescentar of
      '0'..'9','a'..'z','A'..'Z' : ;{Não faz nada}
      else
         CaracterAcrescentar := ' ';
   end;

   Texto := Trim(AnsiUpperCase(Texto));
   TamanhoTexto := Length(Texto);
{$WARNINGS OFF}
   for i := 1 to (TamanhoTexto) do
   begin
      if Pos(Texto[i],' 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~''"!@#$%^&*()_-+=|/\{}[]:;,.<>') = 0 then
      begin
         case Texto[i] of
            'Á','À','Â','Ä','Ã' : Texto[i] := 'A';
            'É','È','Ê','Ë' : Texto[i] := 'E';
            'Í','Ì','Î','Ï' : Texto[i] := 'I';
            'Ó','Ò','Ô','Ö','Õ' : Texto[i] := 'O';
            'Ú','Ù','Û','Ü' : Texto[i] := 'U';
            'Ç' : Texto[i] := 'C';
            'Ñ' : Texto[i] := 'N';
            else Texto[i] := ' ';
         end;
      end;
   end;
   QuantidadeAcrescentar := TamanhoDesejado - TamanhoTexto;
   if QuantidadeAcrescentar < 0 then
      QuantidadeAcrescentar := 0;
   if CaracterAcrescentar = '' then
      CaracterAcrescentar := ' ';
   if TamanhoTexto >= TamanhoDesejado then
      PosicaoInicial := TamanhoTexto - TamanhoDesejado + 1
   else
      PosicaoInicial := 1;

   if AcrescentarADireita then
      Texto := Copy(Texto,1,TamanhoDesejado) + StringOfChar(CaracterAcrescentar,QuantidadeAcrescentar)
   else
      Texto := StringOfChar(CaracterAcrescentar,QuantidadeAcrescentar) + Copy(Texto,PosicaoInicial,TamanhoDesejado);

   Result := AnsiUpperCase(Texto);
end;

{Objetivo: Desenha o texto sobre o Rect do Component, utilizado no onDrawnItem dos CheckListBox,
           para funcionar necessário ativar o Drawn do componente  }
procedure TParamRelMovContrib.DesenhaTexto(Canvas : TCanvas; PosicaoX, PosicaoY : Integer; Texto : String; Alinhamento: String = 'E'; Limite : integer = 0);
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
function TParamRelMovContrib.GravaStrings(S : String; Posicao : integer; NovaString : String):String;
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


function TParamRelMovContrib.iif(bCondicao: Boolean; SeVerdadeiro,
  SeFalso: Variant): Variant;
begin
  if bCondicao then
    Result := SeVerdadeiro
  else
    Result := SeFalso;
end;


{Objetivo: Ler o item da String }
function TParamRelMovContrib.LerStrings(strStringRead: String; intPosicao: Integer): String;
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
procedure TParamRelMovContrib.CarregaCheckList(tdTipoDado : TTipoDados; tipoDaSolicitacao: TTipoSol = tsNone);
var
   qryCheckList : TwwQuery;
   sLinha     : string;
begin
  Try
     qryCheckList := TwwQuery.Create(nil);
     Case Integer(tdTipoDado) of
       0:begin
           sLinha := '"",""';
                     { 0, 1}
           { Patrocinadora }
           chkListPatro.Clear;
           qryCheckList := GetQueryCheckListBox(tdPatro);
           qryCheckList.Open;
           if not qryCheckList.IsEmpty then
             While not qryCheckList.Eof do
               begin
                 sLinha := GravaStrings(sLinha,00,IntToStr(qryCheckList.FieldByName('IDPESSOA').AsInteger));  { 00 -  id da Patrocinadora   }
                 sLinha := GravaStrings(sLinha,01,qryCheckList.FieldByName('NOME').AsString);                    { 01 -  Nome da Patro }
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
           qryCheckList := GetQueryCheckListBox(tdPlanosContabeis);
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
           qryCheckList := GetQueryCheckListBox(tdSituacoesDosParticipantes);
           qryCheckList.Open;
           if not qryCheckList.IsEmpty then
             While not qryCheckList.Eof do
               begin
                 sLinha := GravaStrings(sLinha,00,IntToStr(qryCheckList.FieldByName('IDSITPART').AsInteger));   { 00 -  IDSITPART  }
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
           qryCheckList := GetQueryCheckListBox(tdContribuicoes);
           if bPodeAbrir then
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
  finally
    if Assigned(qryCheckList) then
      FreeAndNil(qryCheckList);
   end;


end;

{ Objetivo : Retornar a qry para Impressão }
function TParamRelMovContrib.GetSQLImpressao(iIndiceApreentacao: Integer): String;
var
   qry              : TwwQuery;
   sSQL             : String;
   sSqlMatricula    : string;
   sSqlIdPessSel    : string;
   sSqlIdPlanPrev   : string;
   sIdPessJur       : string;
   sIdPlanos        : string;
   sIdPlanoPrevPrev : string; 
   sIdSituacoes     : string;
   sIdContribuicoes : string;
   sRefInicial      : string;
   sRefFinal        : string;
   sOrderBy         : string;
   sGrupo           : string;
   sGrupo1          : string;
   sql1,sql2        : string;
begin
  qry              := TwwQuery.Create(Self);
  qry.DatabaseName := 'BaseDados';

  { Mes/Ano inclusão inicial e Final }
  sRefInicial      := DateToStr(GetData(CbMesInicio,seAnoInicio.Value,dInicio));
  sRefFinal        := DateToStr(GetData(CbMesFim,seAnoFim.Value,dFim));

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

  {Somente se tiver idPessoa }
  sSqlMatricula    := iif(FIdPessoaSel > 0,'AND ( EL.MATRICULA = ' + QuotedStr(EdtMatricula.Text) + ')', '');

  if Length(Trim((sSqlMatricula))) = 0 then
     sSqlIdPlanPrev := '   AND (HST.IDPLANOPREV(+) = CPP.IDPLANOPREV) '
  else
     sSqlIdPlanPrev := '   AND (HST.IDPLANOPREV = CPP.IDPLANOPREV) ';

//
  case iIndiceApreentacao of
     0:begin
         sOrderBy := '14,4,7,8';//'IDPLANPREVCONTAB,EL.MATRICULA,HST.MESREFERENCIA,HST.MESCOBRANCA ';
         sGrupo   := 'NVL(CPP.IDPLANPREVCONTAB,HST.IDPLANOPREV) AS GRUPO, EL.MATRICULA AS PRIMEIRO, ';
         sGrupo1  := 'TO_NUMBER('''') GRUPO, '''' PRIMEIRO, ';
       end;
     1:begin
         sOrderBy :='4,7,8'; //'EL.MATRICULA,HST.MESREFERENCIA,HST.MESCOBRANCA ';
         sGrupo   := 'EL.MATRICULA AS GRUPO,PPC.NOME AS PRIMEIRO, ';
         sGrupo1  := ''''' GRUPO, '''' PRIMEIRO, ';
       end;
  end;

     sql1:= 'SELECT ' + sGrupo1                                                   +
            ' '''' SITRECEBIMENTO, '                                                                 +
            ' '''' MATRICULA, '                                                                      +
            'HIST.DOCUMENTO AS NODOCUMENTO, '                                                        +
            'DECODE(LO.DEBCRE,'+ QuotedStr('D') +', ' + QuotedStr('CONTRIBUIÇÃO A RECEBER')+',' + QuotedStr('CONTRIBUIÇÃO A DEVOLVER')+') CONTRIBUICAO, ' +
            ' '''' MESREFERENCIA, '                                                                  +
            'HIST.MESCOB AS MESCOBRANCA, '                                                           +
            'TO_DATE('''') DATAPREVISAORECE, '                                                       +
            'DATALANCTO AS DATARECEBIMENTO, '                                                        +
            'HIST.NOME, '                                                                            +
            'DECODE(LO.DEBCRE,' + QuotedStr('D') +',NVL(LO.VALOR, 0),NVL(-LO.VALOR, 0)) AS VALORRECEBIDO, ' +
            'HIST.FLGDEVOLUCAO, '                                                                    +
            'HIST.IDPLANPREVCONTAB, '                                                                +
            'TO_NUMBER('''') IDPLANOPREV, '                                                          +
            'TO_NUMBER('''') VALORESPERADO, '                                                        +
            'TO_DATE('''') TRGDTINCLUSAO, '                                                          +
            'TO_NUMBER('''') NUMRECEBIMENTO, '                                                       +
            'TO_NUMBER('''') NUMRECEBIMENTOPAI, '                                                    +
            'TO_DATE('''') TRGDTALTERACAO, '                                                         +
            'TO_DATE('''') DTCOBRANCA, '                                                             +
            'TO_DATE('''') DATAEMISSCOB, '                                                           +
            'TO_NUMBER('''') SOMAALTERADORES, '                                                      +
            'DECODE(LO.DEBCRE,' + QuotedStr('D')+',NVL(LO.VALOR, 0),NVL(-LO.VALOR, 0)) AS TOTALRECEBIDO, ' +
            ' '''' FORMARECEBIMENTO '                                                                  +
            'FROM LANCTODOCUM LO, '                                                                  +
              '('                                                                                    +
               'SELECT DISTINCT D.NODOCUMENTO AS DOCUMENTO, '                                        +
                'HST.MESCOBRANCA AS MESCOB, '                                                        +
                'CPP.IDPLANPREVCONTAB AS IDPLANPREVCONTAB, '                                         +
                'PPC.NOME, '                                                                         +
                'HST.FLGDEVOLUCAO AS FLGDEVOLUCAO '                                                  +
                'FROM HSTCONTRIBPREV HST, '                                                          +
                '          ELEGPATRO EL,  '                                                          +
                '  PLANPREVCONTABIL PPC,  '                                                          +
                '  DOCUMENTO          D,  '                                                          +
                '  PARTPREVPLAN      PP,  '                                                          +
                '  CONTRIBUICAO       C,  '                                                          +
                '  CONTPREV          CP,  '                                                          +
                '  PATRO             PT,  '                                                          +
                '  SITPART           SP,  '                                                          +
                '  CONTRIBPREVPARTP CPP   '                                                          +
                'WHERE HST.IDPESSOA = EL.IDPESSOA '                                                  +
                'AND NVL(HST.IDPLANPREVCONTAB, HST.IDPLANOPREV) = PPC.IDPLANOPREV '                  +
                'AND HST.CODDOCUMENTOPREV = D.CODDOCUMENTO(+) '                                      +
                'AND (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '                                       +
                'AND (CPP.IDPESSJUR = HST.IDPESSJUR) '                                               +
                'AND (PPC.IDPLANOPREV = NVL(CPP.IDPLANPREVCONTAB, HST.IDPLANOPREV)) '                +
                'AND (CPP.IDPESSOA = HST.IDPESSOA) '                                                 +
                'AND (CPP.SEQPROPOSTA = HST.SEQPROPOSTA) '                                           +
                'AND (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO) '                                     +
                'AND (PP.IDPESSJUR = CPP.IDPESSJUR) '                                                +
                'AND (PP.IDPLANOPREV = CPP.IDPLANOPREV) '                                            +
                'AND (PP.IDPESSOA = CPP.IDPESSOA) '                                                  +
                'AND (PP.SEQPROPOSTA = CPP.SEQPROPOSTA) '                                            +
                'AND (PT.IDPESSOA = PP.IDPESSJUR) '                                                  +
                'AND (EL.IDPESSOA = PP.IDPESSOA) '                                                   +
                'AND (EL.IDPESSJUR = PP.IDPESSJUR) '                                                 +
                'AND (CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO) '                                      +
                'AND (CP.IDPLANOPREV = CPP.IDPLANOPREV) '                                            +
                'AND (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '                                        +
                'AND (PP.IDSITPART = SP.IDSITPART) '                                                 +
                'AND (NVL(HST.IDPLANPREVCONTAB, HST.IDPLANOPREV) = CPP.IDPLANOPREV) '                +
                'AND (HST.IDPLANOPREV IS NOT NULL) '                                                 +
                sSqlMatricula                                                                        +
                'AND (EL.MATRICULA IS NOT NULL) '                                                    +
                'AND (HST.TRGDTINCLUSAO BETWEEN TO_DATE(' +  QuotedStr(sRefInicial) + ') '           +
                                               'AND TO_DATE(' + QuotedStr(sRefFinal) + ')) '         +
                'AND (HST.IDPESSJUR      IN (' + sIdPessJur + '))'                                   +
                'AND (HST.IDPLANOPREV    IN (' + sIdPlanoPrevPrev  + ')) '                           + 
                'AND (HST.IDCONTRIBUICAO IN (' + sIdContribuicoes + '))'                             +
                'AND (SP.IDSITPART       IN (' + sIdSituacoes + ')) '                                +
                'AND (CPP.IDPLANPREVCONTAB    IN (' + sIdPlanos  + ')) '                             +
                'GROUP BY  D.NODOCUMENTO, HST.MESREFERENCIA,HST.MESCOBRANCA,CPP.IDPLANPREVCONTAB, '  +
                          'PPC.NOME,HST.FLGDEVOLUCAO'                                                +
             ') HIST '                                                                               +
           'WHERE LO.CODDOCUMENTO = HIST.DOCUMENTO '                                                 +
           'AND LO.OPERACAO = 4 '                                                                    +
           'AND NOT EXISTS (SELECT * FROM ALTERADORXCONTRIB AC WHERE LO.CODALTERADOR = AC.CODALTERADOR) ' +
        'UNION ALL ';

   sql2:= 'SELECT ' + sGrupo                                                                         +
          'HST.SITRECEBIMENTO, '                                                                     +
          'EL.MATRICULA, '                                                                           +
          'D.NODOCUMENTO, '                                                                          +
          'C.NOME AS CONTRIBUICAO, '                                                                 +
          'HST.MESREFERENCIA, '                                                                      +
          'HST.MESCOBRANCA, '                                                                        +
          'HST.DATAPREVISAORECE, '                                                                   +
          'HST.DATARECEBIMENTO, '                                                                    +
          'PPC.NOME, '                                                                               +
          'HST.VALORRECEBIDO, '                                                                      +
          'HST.FLGDEVOLUCAO, '                                                                       +
          'NVL(CPP.IDPLANPREVCONTAB, HST.IDPLANOPREV) AS IDPLANPREVCONTAB, '                         +
          'HST.IDPLANOPREV, '                                                                        +
          'DECODE(HST.FLGDEVOLUCAO, 0, HST.VALORESPERADO, 1, -HST.VALORESPERADO) AS VALORESPERADO, ' +
          'HST.TRGDTINCLUSAO, '                                                                      +
          'HST.NUMRECEBIMENTO, '                                                                     +
          'HST.NUMRECEBIMENTOPAI, '                                                                  +
          'HST.TRGDTALTERACAO, '                                                                     +
          'HST.DTCOBRANCA, '                                                                         +
          'HST.DATAEMISSCOB, '                                                                       +
          'SUM(DECODE(HST.FLGDEVOLUCAO,0,NVL(HA.VALOR, 0),1,NVL(-HA.VALOR, 0),0)) AS SOMAALTERADORES,' +
          'DECODE(HST.FLGDEVOLUCAO,0,DECODE(HST.FLGDEVOLUCAO,0,NVL(HST.VALORRECEBIDO, 0),NVL(-HST.VALORRECEBIDO, 0)) + ' +
          'SUM(DECODE(HST.FLGDEVOLUCAO,0,NVL(HA.VALORRECEBIDO, 0),1,NVL(-HA.VALORRECEBIDO, 0),0)),1,- ' +
          '(DECODE(HST.FLGDEVOLUCAO,0,ABS(NVL(HST.VALORRECEBIDO, 0)),ABS(NVL(HST.VALORRECEBIDO, 0))) + ' +
          'SUM(DECODE(HST.FLGDEVOLUCAO,0,ABS(NVL(HA.VALORRECEBIDO, 0)),1,ABS(NVL(HA.VALORRECEBIDO, 0)),0)))) AS TOTALRECEBIDO, ' +
          'DECODE(HST.SITRECEBIMENTO, '                                                               +
                   '0,' + QuotedStr('Não enviada para cobrança') + ', '                               +
                   '1,' + QuotedStr('Enviada e não recebida')    + ', '                               +
                   '2,' + QuotedStr('Recebida corretamente')     + ', '                               +
                   '3,' + QuotedStr('Recebida com divergência')  + ', '                               +
                   '4,' + QuotedStr('Atrasada e já tratada')     + ', '                               +
                   '7,' + QuotedStr('Financiada ou Renegociada') + ', '                               +
                   '8,' + QuotedStr('Cancelada')                 + ', '                               +
                   '9,' + QuotedStr('Paga na Folha de Benefício')+') FormaRecebimento '               +
         'FROM CONTRIBUICAO       C, '                                                                +
              'CONTPREV          CP, '                                                                +
              'PATRO             PT, '                                                                +
              'SITPART           SP, '                                                                +
              'ELEGPATRO         EL, '                                                                +
              'PARTPREVPLAN      PP, '                                                                +
              'PLANPREVCONTABIL PPC, '                                                                +
              'CONTRIBPREVPARTP CPP, '                                                                +
              'HSTCONTRIBPREV   HST, '                                                                +
              'DOCUMENTO          D, '                                                                +
              'HSTATRASOCONTRIB  HA, '                                                                +
              'TIPOALTERADOR     TA  '                                                                +


              'WHERE  (HST.IDCONTRIBUICAO IN (' + sIdContribuicoes + ')) '                            +
              'AND    (HST.IDPESSJUR      IN (' + sIdPessJur + ')) '                                  +
              'AND    (HST.IDPLANOPREV    IN (' + sIdPlanoPrevPrev  + ')) '                           +
              'AND    (HST.TRGDTINCLUSAO BETWEEN TO_DATE(' +  QuotedStr(sRefInicial) + ') '           +
                                           ' AND TO_DATE(' +  QuotedStr(sRefFinal)   + ') '           +
                      ')'                                                                             +
               sSqlMatricula                                                                          +
             'AND    (EL.MATRICULA IS NOT NULL) '                                                     +
             'AND    (SP.IDSITPART IN (' + sIdSituacoes + ')) '                                       +
             'AND (CPP.IDPLANPREVCONTAB    IN (' + sIdPlanos  + ')) '                                 +
             'AND (HST.CODDOCUMENTOPREV = D.CODDOCUMENTO(+))  '                                       +
             'AND (HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '                                           +
             'AND (CPP.IDPESSJUR = HST.IDPESSJUR) '                                                   +
             'AND (PPC.IDPLANOPREV = NVL(CPP.IDPLANPREVCONTAB, HST.IDPLANOPREV)) '                    +
             'AND (CPP.IDPESSOA = HST.IDPESSOA) '                                                     +
             'AND (CPP.SEQPROPOSTA = HST.SEQPROPOSTA) '                                               +
             'AND (CPP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO) '                                         +
             'AND (PP.IDPESSJUR = CPP.IDPESSJUR) '                                                    +
             'AND (PP.IDPLANOPREV = CPP.IDPLANOPREV) '                                                +
             'AND (PP.IDPESSOA = CPP.IDPESSOA) '                                                      +
             'AND (PP.SEQPROPOSTA = CPP.SEQPROPOSTA) '                                                +
             'AND (PT.IDPESSOA = PP.IDPESSJUR) '                                                      +
             'AND (EL.IDPESSOA = PP.IDPESSOA) '                                                       +
             'AND (EL.IDPESSJUR = PP.IDPESSJUR) '                                                     +
             'AND (CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO) '                                          +
             'AND (CP.IDPLANOPREV = CPP.IDPLANOPREV) '                                                +
             'AND (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '                                            +
             'AND (PP.IDSITPART = SP.IDSITPART) '                                                     +
             'AND (HST.IDPLANOPREV = CPP.IDPLANOPREV) '                                               +
             'AND (HST.IDPLANOPREV IS NOT NULL) '                                                     +
             'AND (HA.NUMRECEBIMENTO(+) = HST.NUMRECEBIMENTO) '                                       +
             'AND (HA.MESCOBRANCA(+) = HST.MESCOBRANCA) '                                             +
             'AND (HA.MESREFERENCIA(+) = HST.MESREFERENCIA) '                                         +
             'AND (HA.IDMOTIVO(+) = HST.IDMOTIVO) '                                                   +
             'AND (HA.CODALTERADOR = TA.CODALTERADOR(+)) '                                            +
             'GROUP BY HST.SITRECEBIMENTO, EL.MATRICULA, D.NODOCUMENTO, C.NOME, HST.MESREFERENCIA, '  +
                      'HST.MESCOBRANCA, HST.DATAPREVISAORECE,HST.DATARECEBIMENTO,HST.VALORESPERADO, ' +
                      'HST.DATAEMISSCOB,HST.VALORRECEBIDO, PPC.NOME, CPP.IDPLANPREVCONTAB, '          +
                      'HST.IDPLANOPREV,HST.FLGDEVOLUCAO,HST.TRGDTINCLUSAO,HST.NUMRECEBIMENTO, '       +
                      'HST.NUMRECEBIMENTOPAI,HST.TRGDTALTERACAO,HST.DTCOBRANCA,'                      +
                      'HST.NUMRECEBIMENTO '                                                           +
             'ORDER BY ' + sOrderBy;

         if(EdtMatricula.Text='')and(EdtNome.Text='') then
             Result:= sql1+sql2
         else
             Result:= sql2;
end;



{ Objetivo : Retornar a query com a consulta para o CheckListBox de acordo com o tdTipoDado}
function TParamRelMovContrib.GetQueryCheckListBox(tdTipoDado: TTipoDados):TwwQuery;
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
    0: sSql := 'SELECT P.NOME,P.IDPESSOA  FROM PATRO PT, PESSOA P WHERE PT.IDPESSOA = P.IDPESSOA AND EXISTS '+
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
function TParamRelMovContrib.GetIn(slIn: TStringList): String;
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

procedure TParamRelMovContrib.btPesquisaClick(Sender: TObject);
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
   CbMesInicio.SetFocus;
end;


procedure TParamRelMovContrib.FormCreate(Sender: TObject);
var
   wdia,
   wMes,
   wAno : Word;
   iMes : Integer;
begin
  //inherited;
  SetTipoDaSolicitacao(tsNone);
  { Retirar depois }
  Self.Caption := 'Contribuições Previdenciárias v'+Sistema.Versao;
  { Cria os atribuitos do Tipo StringList }
  FIdSituacoesSelecionadas        := TStringList.Create;
  FListaPatroSelecionados         := TStringList.Create;
  FListaPlanosSelecionados        := TStringList.Create;
  FListaPlanosPrevPrevSelecionados:= TStringList.Create; 
  FListaSituacoesSelecionadas     := TStringList.Create;
  FListaContribuicoesSelecionadas := TStringList.Create;

  { Carrega os checkLists com os dados }
  CarregaCheckList(tdPatro);
  CarregaCheckList(tdPlanosContabeis);
  CarregaCheckList(tdSituacoesDosParticipantes);

  //Decodifica a data para pegar o mes atual
  DecodeDate(Date,wAno,wMes,wdia);
  //Carrega o mes na variável inteira, para passar como parâmetro para o enum
  iMes  := wMes;
  //Carrega o mês inicial com o mês corrente
  CarregaMeses(CbMesInicio,TIndexMes(iMes - 1));
  //Carrega o mês Final com o mês corrente
  CarregaMeses(CbMesFim,TIndexMes(iMes - 1));

  //Carrega o ano inicial e final com o ano corrente
  seAnoInicio.Value := Integer(wAno);
  seAnoFim.Value    := Integer(wAno);

  {Pega o último dia do mês/Ano inclusão Final }
  cmdtDataBase.Date := GetData(CbMesFim,seAnoFim.Value,dFim);

  application.ProcessMessages;

end;

{ Objetivo : Alterar o tipo da Solicitação e idPessoaSel }
procedure TParamRelMovContrib.SetTipoDaSolicitacao(const Value: TTipoSol;
          intIdPessoa : Integer = 0);
begin
  FTipoSolicitacao := Value;
  if intIdPessoa = 0 then
    FIdPessoaSel := -1
  else
    FIdPessoaSel := intIdPessoa;
end;


{ Objetivo: Filtrar o Texto passado no parâmetro }
function TParamRelMovContrib.FiltraTexto(sTexto: String; tipoFiltro: TTipoFiltro):String;
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

procedure TParamRelMovContrib.chkListPlanosDrawItem(Control: TWinControl;
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

procedure TParamRelMovContrib.chkListSituacoesDrawItem(Control: TWinControl;
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

procedure TParamRelMovContrib.chkListPatroDrawItem(Control: TWinControl;
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
procedure TParamRelMovContrib.SelecaoItemCheckListBox(Sender: TObject);
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

procedure TParamRelMovContrib.PreparaMensagemDeMarcacao(oCheckDaMensagem: TCheckListBox; aListaDaMensagem: TStringList; var sMensagemCheck: String);
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

procedure TParamRelMovContrib.btSelTudoPatroClick(Sender: TObject);
begin
  inherited;
  SelecaoItemCheckListBox(Sender);
end;

{ Objetivo :  Retornar se o ano é bissexto }
function TParamRelMovContrib.IsBissexto(iAno : Integer): Boolean;
begin
  Result := (iAno Mod 4 = 0) and ((iAno mod 100 <> 0) or (iAno mod 400 = 0));
end;


{ Objetivo :  Retornar a lista de meses no combo indicado no parâmetro comboMes, se não informar o mês, o mês selecionado será "Janeiro"}
procedure TParamRelMovContrib.CarregaMeses(ComboMes: TComboBox; indMes: TIndexMes = Janeiro);
var
   iCount : Integer;
begin
  //Apaga os itens do combo
  ComboMes.Items.Clear;
  //Carrega os meses
  for iCount := 0 to Length(Meses) -1 do
    ComboMes.Items.Add(Meses[iCount]);
  //Seta o Mês selecionado, se não houver passado mês inicial como parâmetro será selecionado o mÊs de janeiro (ilJaneiro Default ), caso
  //conrário o mês informado
  ComboMes.ItemIndex := GetIndMes(indMes);
end;

{ Objetivo :  Retornar o mes selecionado }
function TParamRelMovContrib.GetPeriodos(ComboMes: TComboBox;
  intAno: Integer): String;
var
  iMes : Integer;
  sMes : string;
begin
  iMes := ComboMes.ItemIndex;
  Inc(iMes);
  sMes := FormatarTexto(IntToStr(iMes),2,false,'0');
  Result := IntToStr(intAno) + '/'+ sMes;
end;

{ Objetivo :  Retornar o inteiro do mes selecionado }
Function TParamRelMovContrib.GetIndMes(indMes: TIndexMes): Integer;
begin
  Case indMes of
      Janeiro   : Result := 0;
      Fevereiro : Result := 1;
      Marco     : Result := 2;
      Abril     : Result := 3;
      Maio      : Result := 4;
      Junho     : Result := 5;
      Julho     : Result := 6;
      Agosto    : Result := 7;
      Setembro  : Result := 8;
      Outubro   : Result := 9;
      Novembro  : Result := 10;
      Dezembro  : Result := 11;
  end;
end;

 { Objetivo :  Retornar o dia do mês selecionado, de acordo com o parâmetro tipoData ( Inicio ou Fim )}
function TParamRelMovContrib.GetData(comboMes : TComboBox; intAno : Integer; tipoData: TData ): TDate;
var
   sPeriodo : string;
   sUltDia  : string;
begin
  sPeriodo := GetPeriodos(comboMes,intAno);
  Case tipoData of
    dInicio : Result := StrToDate('01/'+ Copy(sPeriodo,Pos('/',sPeriodo) + 1,2) +'/'+ Copy(sPeriodo,1,4));
    dFim    :
       begin
          Case comboMes.ItemIndex of
             1: sUltDia := iif(IsBissexto(intAno),29,28)//Fevereiro é 1, pois o índice começa com "0"
            else
                sUltDia := IntToStr(DiaMes[comboMes.ItemIndex]);//Default
          end;
          Result := strToDate(sUltDia + '/' + Copy(sPeriodo,Pos('/',sPeriodo) + 1,2) +'/'+ Copy(sPeriodo,1,4));
       end;
  end;
end;

{ Objetivo: Emitir mensagem utilizando o MsgDlg, mas passando somente 1, ou no máximo 2 parâmteros }
procedure TParamRelMovContrib.EmiteMensagem(sMensagem: string; tmTipoMensagem : TMsg = tmCustom );
var
   sTituloJanela: string;
begin
  Case Integer(tmTipoMensagem) of
    0: sTituloJanela   := 'Atenção';
    1: sTituloJanela   := 'Erro';
    2,4: sTituloJanela := 'Informação';
    3: sTituloJanela   := 'Confirmação';
  end;
  MsgDlg( sMensagem, sTituloJanela, TMsgDlgType(tmTipoMensagem), [mbOk], 0);
end;


{ Objetivo: Validar os períodos de data ( Cobrança ou Referencia ) }
function TParamRelMovContrib.ValidaParametrosDePesquisa(dtDataInicial,dtDataFinal: TDate):Boolean;
var
  bValidou   : Boolean;
  { Objetivo: Fazer a validação do mesAnoInclusao }
  Function ValidouMesAnoInclusao(dtDataIni,dtDataFim: TDate): Boolean;
  begin
     bValidou := True;
     if (dtDataFim < dtDataIni ) then
       begin
         bValidou     := False;
         EmiteMensagem('O Mês/Ano de Inclusão Inicial deverá ser menor ou igual ao Mês/Ano de Inclusão Final.',tmInformation);
       end;
     Result := bValidou;
  end;
  Function validouDataBase(sDataBase: String; DataInicial,DataFinal : TDate): Boolean;
  var
     dtDataBase : TDate;
  begin
    bValidou := True;
    if Length(Trim(sDataBase)) = 0 then
      begin
        bValidou := False;
        EmiteMensagem('O preenchimento da Data Base é obrigatório!',tmInformation);
      end else
      dtDataBase := StrToDate(sDataBase);
    if (bValidou) and ((dtDataBase < DataInicial) or (dtDataBase > DataFinal)) then
      begin
        bValidou := False;
        EmiteMensagem('A Data Base deverá ser maior ou igual ao primeiro dia do Mês/Ano Inclusão Inicial e menor ou igual ao último dia do Mês/Ano Inclusão Final!', tmWarning );
      end;

    Result := bValidou;
  end;

begin
  Result := (ValidouMesAnoInclusao(dtDataInicial,dtDataFinal)) and (validouDataBase(cmdtDataBase.Text, dtDataInicial,dtDataFinal));
end;

procedure TParamRelMovContrib.bbtnConfirmarClick(Sender: TObject);
var
  bVerificaAnoMesReferencia : Boolean;
  sMensagemCheck            : string;
begin
  inherited;
  sMensagemCheck := '';

  { Verifica Períodos para pesquisa }
  if ValidaParametrosdePesquisa(GetData(CbMesInicio,seAnoInicio.Value,dInicio),GetData(CbMesFim,seAnoFim.Value,dFim)) then
    begin

      {  Prepara mensagem caso não tenha selecionado algum checkbox }
      PreparaMensagemDeMarcacao(chkListPatro        , ListaPatroSelecionados        , sMensagemCheck);
      PreparaMensagemDeMarcacao(chkListPlanos       , ListaPlanosSelecionados       , sMensagemCheck);
      PreparaMensagemDeMarcacao(chkListSituacoes    , ListaSituacoesSelecionadas    , sMensagemCheck);
      PreparaMensagemDeMarcacao(chkListContribuicoes, ListaContribuicoesSelecionadas, sMensagemCheck);

      if Length(Trim(sMensagemCheck)) > 0 then
        begin
           EmiteMensagem( sMensagemCheck , tmWarning);
           Exit;
        end;

       Self.ModalResult := mrOk;
       { aqui prossegue com a impressão }
    end;
end;

procedure TParamRelMovContrib.SetFListaPlanosSelecionados(const Value: String);
begin
  if Length(Trim(Value)) > 0 then
    Self.FListaPlanosSelecionados.Add(Value);
end;

procedure TParamRelMovContrib.SetFListaPlanosPrevPrevSelecionados(const Value: String);
begin
  if Length(Trim(Value)) > 0 then
    Self.FListaPlanosPrevPrevSelecionados.Add(Value);
end;

procedure TParamRelMovContrib.SetFListaContribuicoesSelecionadas(
  const Value: String);
begin
  if Length(Trim(Value)) > 0 then
    Self.FListaContribuicoesSelecionadas.Add(Value);
end;

procedure TParamRelMovContrib.SetFIdSituacoesSelecionadas(const Value: String);
begin
  if Length(Trim(Value)) > 0 then
    Self.FIdSituacoesSelecionadas.Add(Value);
end;


procedure TParamRelMovContrib.SetFListaPatroSelecionados(const Value: String);
begin
  if Length(Trim(Value)) > 0 then
    Self.FListaPatroSelecionados.Add(Value);
end;

procedure TParamRelMovContrib.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FListaPatroSelecionados);
  FreeAndNil(FListaPlanosSelecionados);
  FreeAndNil(FListaPlanosPrevPrevSelecionados); 
  FreeAndNil(FListaSituacoesSelecionadas);
  FreeAndNil(FListaContribuicoesSelecionadas);
  FreeAndNil(FIdSituacoesSelecionadas);
end;

procedure TParamRelMovContrib.chkListPatroClickCheck(Sender: TObject);
begin
  inherited;
  if chkListPatro.Items.Count > 0 then
    if chkListPatro.Checked[chkListPatro.ItemIndex] then
        SetFListaPatroSelecionados(LerStrings(chkListPatro.Items[chkListPatro.itemIndex],0))
    else
        RemoveDaLista(LerStrings(chkListPatro.Items[chkListPatro.itemIndex],0),Sender,ListaPatroSelecionados);
end;


{ Objetivo : Procurar e Remover o item da lista }
procedure TParamRelMovContrib.RemoveDaLista(Const Value : String; Sender: TObject; aLista: TStringList; intIdLista : Integer = 0 );
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
procedure TParamRelMovContrib.RemoveItem(aLista: TStringList; oItem: String; bHaRepetidos: Boolean = False);
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



procedure TParamRelMovContrib.chkListPlanosClickCheck(Sender: TObject);
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

procedure TParamRelMovContrib.SetFListaSituacoesSelecionadas(
  const Value: String);
begin
  Self.FListaSituacoesSelecionadas.Add(Value);
end;

procedure TParamRelMovContrib.chkListSituacoesClickCheck(Sender: TObject);
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



procedure TParamRelMovContrib.chkListContribuicoesClickCheck(Sender: TObject);
begin
  inherited;
  if chkListContribuicoes.Items.Count > 0 then
    if chkListContribuicoes.Checked[chkListContribuicoes.ItemIndex] then
      SetFListaContribuicoesSelecionadas(LerStrings(chkListContribuicoes.Items[chkListContribuicoes.itemIndex],0))
    else
      RemoveDaLista(LerStrings(chkListContribuicoes.Items[chkListContribuicoes.itemIndex],0),Sender,ListaContribuicoesSelecionadas);
end;

procedure TParamRelMovContrib.chkListContribuicoesDrawItem(
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



procedure TParamRelMovContrib.FormShow(Sender: TObject);
begin
  inherited;
  rgApresentacao.OnClick(Self);
  { proposital... }
  cmdtDataBase.SetFocus;
  CbMesInicio.SetFocus;
end;

procedure TParamRelMovContrib.rgApresentacaoClick(Sender: TObject);
begin
  inherited;
  FSelecao := iif(rgApresentacao.ItemIndex = 0,0,1);
end;

procedure TParamRelMovContrib.cmdtDataBaseExit(Sender: TObject);
begin
  inherited;
  FDataBase := cmdtDataBase.Date;
end;

procedure TParamRelMovContrib.btClearClick(Sender: TObject);
begin
  inherited;
  EdtMatricula.clear;
  edtNome.clear;
end;

end.
