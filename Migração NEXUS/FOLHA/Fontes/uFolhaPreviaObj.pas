// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Pendência   : WO21031
//Data        : 29/04/2025
//Responsável : Edilaine
//Alteração   : Erro ao processar a Folha Extra
//------------------------------------------------------------------------------
//Pendência   : SIG101624
//Data        : 14/09/2020
//Responsável : Andre Imakawa
//Alteração   : Selecionar perfil de Investimento na funcionalidade de Folha Extra.
//------------------------------------------------------------------------------
//Pendência   : SIG97305
//Data        : 06/02/2020
//Responsável : Andre Imakawa
//Alteração   : Preencher corretamente o campo CODPROVDESC.
//------------------------------------------------------------------------------
//Pendência   : SIG94637
//Data        : 26/11/2019
//Responsável : Ewerton Beltramini - SIG94637
//Alteração   : Carregando um campo obrigatório.
//------------------------------------------------------------------------------
//Pendência   : SIG65767
//Data        : 28/03/2018
//Responsável : Andre Imakawa
//Alteração   : Correção para exibição da mensagem correta de erro.
//------------------------------------------------------------------------------
// Alteração  :
// Data       : 23/04/2018
// SIG        : 67136
// Autor      : Andre Imakawa
// Descrição  : Recuperar o IdplanoPrev corretamente.
//------------------------------------------------------------------------------
//Pendência   : SIG56702
//Data        : 30/01/2018
//Responsável : Edilaine
//Alteração   : Alterações para tratar perfil de investimento.
//------------------------------------------------------------------------------
//Pendência   : SIG49444
//Data        : 29/06/2017
//Responsável : Fábio Sampaio
//Alteração   : Disponibilização do fonte SOL 207789/16579.
//------------------------------------------------------------------------------
//Pendência   : SOL 207789/16579 PPM 543916
//Data        : 05/07/2015
//Responsável : Fernando Xavier
//Alteração   : Criação de Nova Funcionalidade para Batimento de Retorno das
//              Informações da Fita de Crédito
//------------------------------------------------------------------------------
//Pendência   : SOL 140042 Kintana 900220
//Responsável : Fernando Xavier
//Descrição   : Reembolso INSS .
// -----------------------------------------------------------------------------
// Autor(a)    :  Renato Visoni
// Pendência   :  SOL 143380 Kintana 943521
// Descrição   :  Se eu efetivar duas versões de adto Extra folha, e estornar
// uma o sistema não considera a versão que foi considerado o estorno e apagas
// todas as rubricas individuais da tabela RubricaIndiv.
// Ficando assim sem a cobrança devida na próxima folha normal.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 06/05/2007
// Rotina      : bbtnProcessarClick
// Pendência   : 28031
// Descricao   : Ajuste no Plano Contabil da folha extra
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 06/05/2007
// Rotina      : CriaQryRubricaGrava
// Pendência   : 27962
// Descricao   : Correção da geração da folha extra para dependentes.
//------------------------------------------------------------------------------

// Autor(a)    : Claudio Faria
// Data        : 06/05/2007
// Rotina      : CriaQryRubricaGrava
// Pendência   : 27839
// Descricao   : Correção da geração da folha extra.
//------------------------------------------------------------------------------

unit uFolhaPreviaObj;

interface

uses dbGrids, Sysutils, DB, Mask,
     dContabil, uCtrlBancoPortForma, uPrevia, uCtrlPadroes,
     uFuncoesFolha, uAdmPrevFB, uObjFolha,
     wwClient, wwQuery; {dFolhaPrevia} //SOL 207789/16579 PPM 543916   //edilaine WO21031

type
  TFolhaPreviaObj = class
  private
    fIDLote                 : Int64;
    fIDTitular              : Int64;
    fIDRecebedor            : Int64;
    fIDRubrica              : Int64;
    fIDFundacao             : Int64;
    fIDPessJur              : Int64;
    fIDPlanoPrev            : Int64;
    fIDPlanoPrevContabil    : Int64;
    fIDPlanoPrevContabilAux : Int64;  // Andre Imakawa - SIG 101624
    fIDPlanoPrevPrev        : Int64;  // Andre Imakawa - SIG 67136 // Andre Imakawa - SIG65767
    fIDPerfil               : Int64;  // Andre Imakawa - SIG 101624
    fMatricula              : String;
    fValor                  : Double;
    fCodPortForma           : Int64;
    fCodPortFormaAux        : Int64;  // Andre Imakawa - SIG 101624
    fIDCalculo              : Integer;
    fDescPortForma          : String;
    fNumBanco               : String;
    fNumAgencia             : String;
    fNomeAgencia            : String;
    fNumConta               : String;
    fTipoConta              : String;
    fIDCBancaria            : String;
    fCodFontePagadora       : String;
    fMesCobranca            : String;
    fMesReferencia          : String;
    fDataPagamento          : TDateTime;
    fbPagtoElet             : Boolean;
    fbDuplContaPref         : Boolean;
    fIDFavoRec              : Integer;
    fSeqDoc                 : Integer;

    fVlrMaxLimiteFolhaExtra : Real;

    fCtrlBCP                : TCtrlBancoPortForma;
    fObjPortador            : TObjPortadorForma;
    fobjRecebedor           : TObjRecebedorSimples;
    fRefCF                  : TRegContFinan;

    fIDFloatPgto            : Int64;

    fArqPath                : String;

    fCDSPessoa              : TwwClientDataSet;
    fCDSRubrica             : TwwClientDataSet;
    fqryAux                 : TwwQuery;
    fqryRubricaGrava        : TwwQuery;

    fMessageInfo            : String;

    Procedure CriaCDSs;
    Procedure CriaQryRubricaGrava;

    Function  LocalizaPessoa:Boolean;
    Function LocalizaRubrica:Boolean;
    Procedure LocalizaPlanoContabil;
    Procedure LocalizaPortForma(Var psDescPortForma:String);

    Function VerificaContaBancaria:Boolean;

    function ValidaPlanoContabil(pPlanoContabil, pIdTitular: Integer): Boolean; // Andre Imakawa - SIG 101624
    function ValidaPortador(pCodPortForma: Integer; var psDescPortForma: String): Boolean; // Andre Imakawa - SIG 101624

    function ValidaPerfil(pPerfil: Integer): Boolean; // Andre Imakawa - SIG 101624

    Function RetornaPortadorForma(Var psDescPortForma:String):Integer;

    Function CalculaLiquido(piIDRecebedor: Integer): Double;

    Function ValidaAnoMes(sSt:String;bNum:Byte): Boolean;

    Procedure LeLinha(psLinha : String);

  public
    property MessageInfo     : String read fMessageInfo;

    property ArqPath          : String           read fArqPath;
    property CDSPessoa        : TwwClientDataSet read fCDSPessoa;
    property CDSRubrica       : TwwClientDataSet read fCDSRubrica;

    property IDLote                 : Int64     read fIDLote                 write fIDLote;
    property VlrMaxLimiteFolhaExtra : Real      read fVlrMaxLimiteFolhaExtra write fVlrMaxLimiteFolhaExtra;
    property MesCobranca            : String    read fMesCobranca            write fMesCobranca;
    property MesReferencia          : String    read fMesReferencia          write fMesReferencia;
    property DataPagamento          : TDateTime read fDataPagamento          write fDataPagamento;
    property CodFontePagadora       : String    read fCodFontePagadora       write fCodFontePagadora;
    property IDCalculo              : Integer   read fIDCalculo              write fIDCalculo;
    property IDFundacao             : Int64     read fIDFundacao             write fIDFundacao;
    property IDPessJur              : Int64     read fIDPessJur              write fIDPessJur;
    property IDTitular              : Int64     read fIDTitular              write fIDTitular;
    property IDRecebedor            : Int64     read fIDRecebedor            write fIDRecebedor;
    property IDPlanoPrevContabil    : Int64     read fIDPlanoPrevContabil    write fIDPlanoPrevContabil;
    property IDPlanoPrevContabilAux : Int64     read fIDPlanoPrevContabilAux    write fIDPlanoPrevContabilAux;
    property IDPlanoPrevPrev        : Int64     read fIDPlanoPrevPrev    write fIDPlanoPrevPrev; // Andre Imakawa - SIG67136 // Andre Imakawa - SIG65767
    property IDPerfil               : Int64     read fIDPerfil           write fIDPerfil; // Andre Imakawa - SIG 101624
    property CodPortForma           : Int64     read fCodPortForma           write fCodPortForma;
    property CodPortFormaAux           : Int64     read fCodPortFormaAux           write fCodPortFormaAux; // Andre Imakawa - SIG 101624
    property IDRubrica              : Int64     read fIDRubrica              write fIDRubrica;
    property Matricula              : String    read fMatricula              write fMatricula;
    property Valor                  : Double    read fValor                  write fValor;

    constructor Create(psArqPath: String);
    destructor  Destroy;

    Procedure ApagaRegPrevia(piIDRecebedor:Integer);
    Procedure GravaLinha;
    Procedure AjustaDBGrid(pDBGridPessoa, pDBGridRubrica: TDBGrid);
    Procedure FazImportacao;
    Procedure IncluirPrevia;


  End;

implementation

{ TFolhaPreviaObj }

procedure TFolhaPreviaObj.AjustaDBGrid(pDBGridPessoa, pDBGridRubrica: TDBGrid);
Var N:Integer;
begin
  //Grid de Pessoa
  N := 0;
  pDBGridPessoa.Columns[N].Visible        := False;             Inc(N); // IDFUNDACAO
  pDBGridPessoa.Columns[N].Visible        := False;             Inc(N); // IDPESSJUR
  pDBGridPessoa.Columns[N].Visible        := False;             Inc(N); // IDTITULAR
  pDBGridPessoa.Columns[N].Visible        := False;             Inc(N); // IDRECEBEDOR
  pDBGridPessoa.Columns[N].Title.Caption  := 'Participante';            // PARTICIPANTE
  pDBGridPessoa.Columns[N].Width          := 320;               Inc(N);
  pDBGridPessoa.Columns[N].Title.Caption  := 'RECEBEDOR';               // RECEBEDOR
  pDBGridPessoa.Columns[N].Width          := 320;               Inc(N);
  pDBGridPessoa.Columns[N].Title.Caption  := 'Matricula';               // MATRICULA
  pDBGridPessoa.Columns[N].Width          := 100;               Inc(N);
  pDBGridPessoa.Columns[N].Title.Caption  := 'Nº de Inscrição';         // INSCRICAONUMERO
  pDBGridPessoa.Columns[N].Width          := 100;               Inc(N);
  pDBGridPessoa.Columns[N].Title.Caption  := 'Data Nascimento';         // DATANASC
  pDBGridPessoa.Columns[N].Width          := 110;               Inc(N);
  pDBGridPessoa.Columns[N].Visible        := False;             Inc(N); // FLGISENTOIRRF
  pDBGridPessoa.Columns[N].Title.Caption  := 'Num. Dep. IRRF';          // NUMDEPIRRF
  pDBGridPessoa.Columns[N].Width          := 110;               Inc(N);
  pDBGridPessoa.Columns[N].Visible        := False;             Inc(N); // IDPLANOPREV

  //Grid de Rubrica
  N := 0;
  pDBGridRubrica.Columns[N].Visible       := False;             Inc(N); // IDFUNDACAO
  pDBGridRubrica.Columns[N].Visible       := False;             Inc(N); // IDPESSJUR
  pDBGridRubrica.Columns[N].Visible       := False;             Inc(N); // IDTITULAR
  pDBGridRubrica.Columns[N].Visible       := False;             Inc(N); // IDRECEBEDOR
  pDBGridRubrica.Columns[N].Visible       := False;             Inc(N); // IDPLANOPREV
  pDBGridRubrica.Columns[N].Visible       := False;             Inc(N); // CODPORTFORMA
  pDBGridRubrica.Columns[N].Title.Caption := 'Portador Forma';          // DESCRICAO PORTFORMA
  pDBGridRubrica.Columns[N].Width         := 300;               Inc(N);
  pDBGridRubrica.Columns[N].Visible       := False;             Inc(N); // IDRUBRICA
  pDBGridRubrica.Columns[N].Title.Caption := 'Rubrica';                 // DESCRICAO RUBRICA
  pDBGridRubrica.Columns[N].Width         := 400;               Inc(N);
  pDBGridRubrica.Columns[N].Visible       := False;             Inc(N); // FLGDESCONTO
  pDBGridRubrica.Columns[N].Visible       := False;             Inc(N); // CODIRRFDARF
  pDBGridRubrica.Columns[N].Visible       := False;             Inc(N); // IDPLANOORIGEM
  pDBGridRubrica.Columns[N].Visible       := False;             Inc(N); // IDPLANOCONTABIL
  pDBGridRubrica.Columns[N].Title.Caption := 'Plano Contabil';          // DESCRICAO PLANO CONTABIL
  pDBGridRubrica.Columns[N].Width         := 300;               Inc(N);
  pDBGridRubrica.Columns[N].Title.Caption := 'Mês Referencia';          // MESREFERENCIA
  pDBGridRubrica.Columns[N].Width         := 100;               Inc(N);
  pDBGridRubrica.Columns[N].Title.Caption := 'Valor';                   // VALOR
  pDBGridRubrica.Columns[N].Width         := 100;
end;

procedure TFolhaPreviaObj.ApagaRegPrevia(piIDRecebedor: Integer);
Var sSQL : String;
begin
  sSQL := ' DELETE FROM PREVIA '                                     + #13 +
          ' WHERE (MESCOBRANCA  = ' + QuotedStr(fMesCobranca) + ')'  + #13 +
          '   AND (IDLOTE       = ' + IntToStr(fIDLote)       + ')'  + #13 +
          '   AND (IDPESSOA     = ' + IntToStr(piIDRecebedor)  + ')' + #13 +
          '   AND (FLGTIPODESC IN (''T'',''I'',''K''))';

  Try
    fqryAux.Close;
    fqryAux.SQL.Text := sSQL;

    fqryAux.ExecSql;
  Except
    fMessageInfo := 'Não Foi possivel apagar a Previa';
    Abort;
  End;
end;

function TFolhaPreviaObj.CalculaLiquido(piIDRecebedor: Integer): Double;
var dTotalLiq : Double;
    bmGuarda  : TBookmark;
begin
  dTotalLiq := 0;
  bmGuarda  := fCDSRubrica.GetBookmark;

  fCDSRubrica.DisableControls;

  fCDSRubrica.First;

  While Not fCDSRubrica.Eof Do
  begin
    If fCDSRubrica.FieldByName('IDRECEBEDOR').AsInteger = piIDRecebedor then
    Begin
      If fCDSRubrica.FieldByName('FLGDESCONTO').AsInteger = 0 then
        dTotalLiq := dTotalLiq + fCDSRubrica.FieldByName('VALOR').AsFloat
      Else
        dTotalLiq := dTotalLiq - fCDSRubrica.FieldByName('VALOR').AsFloat;
    End;

    fCDSRubrica.Next;
  End;

  fCDSRubrica.GotoBookmark(bmGuarda);
  fCDSRubrica.EnableControls;
end;

constructor TFolhaPreviaObj.Create(psArqPath: String);
begin
  fArqPath     := psArqPath;

  fIDFloatPgto := 0;

  fCDSPessoa   := TwwClientDataSet.Create(Nil);
  fCDSRubrica  := TwwClientDataSet.Create(Nil);
  fqryAux      := TwwQuery.Create(Nil);

  CriaCDSs;

  fCDSPessoa.CreateDataSet;
  fCDSRubrica.CreateDataSet;

  fqryAux.DatabaseName := 'BaseDados';

  CriaQryRubricaGrava; //CPrev - 27839

  fObjPortador         := TObjPortadorForma.Create;
end;

procedure TFolhaPreviaObj.CriaCDSs;
begin
  //Criando Pessoa
  fCDSPessoa.FieldDefs.Add('IDFUNDACAO'         , ftFloat,     0, False);
  fCDSPessoa.FieldDefs.Add('IDPESSJUR'          , ftFloat,     0, False);
  fCDSPessoa.FieldDefs.Add('IDTITULAR'          , ftFloat,     0, False);
  fCDSPessoa.FieldDefs.Add('IDRECEBEDOR'        , ftFloat,     0, False);
  fCDSPessoa.FieldDefs.Add('PARTICIPANTE'       , ftString,   60, False);
  fCDSPessoa.FieldDefs.Add('RECEBEDOR'          , ftString,   60, False);
  fCDSPessoa.FieldDefs.Add('MATRICULA'          , ftString,   10, False);
  fCDSPessoa.FieldDefs.Add('INSCRICAONUMERO'    , ftFloat,     0, False);
  fCDSPessoa.FieldDefs.Add('DATANASC'           , ftDate ,     0, False);
  fCDSPessoa.FieldDefs.Add('FLGISENTOIRRF'      , ftFloat,     0, False);
  fCDSPessoa.FieldDefs.Add('NUMDEPIRRF'         , ftFloat,     0, False);
  fCDSPessoa.FieldDefs.Add('IDPLANOPREV'        , ftFloat,     0, False);


  //Criando Rubricas
  fCDSRubrica.FieldDefs.Add('IDFUNDACAO'        , ftFloat,     0, False);
  fCDSRubrica.FieldDefs.Add('IDPESSJUR'         , ftFloat,     0, False);
  fCDSRubrica.FieldDefs.Add('IDTITULAR'         , ftFloat,     0, False);
  fCDSRubrica.FieldDefs.Add('IDRECEBEDOR'       , ftFloat,     0, False);
  fCDSRubrica.FieldDefs.Add('IDPLANOPREV'       , ftFloat,     0, False);
  fCDSRubrica.FieldDefs.Add('CODPORTFORMA'      , ftFloat,     0, False);
  fCDSRubrica.FieldDefs.Add('DESCPORTFORMA'     , ftString,  130, False);
  fCDSRubrica.FieldDefs.Add('IDRUBRICA'         , ftFloat,     0, False);
  fCDSRubrica.FieldDefs.Add('DESCRICAO'         , ftString,  130, False);
  fCDSRubrica.FieldDefs.Add('FLGDESCONTO'       , ftFloat,     0, False);
  fCDSRubrica.FieldDefs.Add('CODIRRFDARF'       , ftString,    4, False);
  fCDSRubrica.FieldDefs.Add('IDPLANOORIGEM'     , ftFloat,     0, False);
  fCDSRubrica.FieldDefs.Add('IDPLANOCONTABIL'   , ftFloat,     0, False);
  fCDSRubrica.FieldDefs.Add('DESCPLANOCONTABIL' , ftString,  130, False);
  fCDSRubrica.FieldDefs.Add('MESREFERENCIA'     , ftString,    7, False);
  fCDSRubrica.FieldDefs.Add('VALOR'             , ftFloat,     0, False);
  fCDSRubrica.FieldDefs.Add('IDPERFILINVEST'     , ftFloat,     0, False); // Andre Imakawa - SIG 101624
end;

procedure TFolhaPreviaObj.CriaQryRubricaGrava;
Var sSQL:String;
begin
  sSQL := 'INSERT INTO PREVIA '                                                           + #13 +
          '  ( NUMEROPROCESSO,    IDPESSJUR,          IDPATRO,           IDPLANOPREV, '   + #13 +
          '   IDTITULAR,         IDPESSOA,           IDRESPONSAVEL,     IDFAVORECIDO, '   + #13 +
          '   MES,               MESCOBRANCA,        IDBENEFICIO,       IDRUBRICA, '      + #13 +
          '   IDLOTE,            FLGTIPODESC,        FLGDESCONTO, '                       + #13 +
          '   IDMOTIVO,          SEQPROPOSTA,        SEQRUBRICA,        REFERENCIA, '     + #13 +
          '   VALORPROVENTO,     VALORCOTAS,         VALORINFO,         VALORRECEBIDO, '  + #13 +
          '   CODMOEDA,          IDREGRACALCULO,     CODIRRFDARF,       CODALTERADOR, '   + #13 +
          '   DATAPAGAMENTO,     FONTEPAGADORA,      FLGIRRF,           IDMODULO, '       + #13 +
          '   FLGSRB,            FLGOK,              FLGCONCESSAO,      FLGINDIVIDUAL, '  + #13 +
          '   FLGCOMPOESALPART,  FLGCOMPOESALBENEF,  ORDEM,             FLGPAGA, '        + #13 +
          '   IDEMPRESA,         RECPAG,             CODTIPRECDES,      CODCENTROCUSTO, ' + #13 +
          '   CODCENTRORESPON,   UNIDNEGOC,          PLANO,             PLACONTA, '       + #13 +
          '   CODPORTFORMA,      DFLOATPAGTO,        NUMPROCINSS,       FLGSALFAM, '      + #13 +
          '   FLGPROVISORIO,     IDVERSAOESTORNO,    IDRECEBEPGTO, '                      + #13 +
          '   IDPLANOORIGEM,     IDPLANOCONTABIL,    IDFAVDOC,          SEQDOCUMENTO'     + #13 +
          '   ,IDSEQINTERNOFB, MESCOMPREEM '         + #13 + //Renato Visoni SOL 143380 Kintana 943521  // SOL 140042 Kintana 900220
          '   ,IDPERFILINVEST '                      + #13 + //edilaine - SIG56702
          '   ,CODPROVDESC )'                        + #13 + //Ewerton Beltramini - SIG94637

          'VALUES '                                                                       + #13 +
          '  (:NUMEROPROCESSO,   :IDPESSJUR,         :IDPATRO,          :IDPLANOPREV, '   + #13 +
          '   :IDTITULAR,        :IDPESSOA,          :IDRESPONSAVEL,    :IDFAVORECIDO, '  + #13 +
          '   :MES,              :MESCOBRANCA,       :IDBENEFICIO,      :IDRUBRICA, '     + #13 +
          '   :IDLOTE,           :FLGTIPODESC,       :FLGDESCONTO, '                      + #13 +
          '   :IDMOTIVO,         :SEQPROPOSTA,       :SEQRUBRICA,       :REFERENCIA, '    + #13 +
          '   :VALORPROVENTO,    :VALORCOTAS,        :VALORINFO,        :VALORRECEBIDO, ' + #13 +
          '   :CODMOEDA,         :IDREGRACALCULO,    :CODIRRFDARF,      :CODALTERADOR, '  + #13 +
          '   :DATAPAGAMENTO,    :FONTEPAGADORA,     :FLGIRRF,          :IDMODULO, '      + #13 +
          '   :FLGSRB,           :FLGOK,             :FLGCONCESSAO,     :FLGINDIVIDUAL, ' + #13 +
          '   :FLGCOMPOESALPART, :FLGCOMPOESALBENEF, :ORDEM,            :FLGPAGA, '       + #13 +
          '   :IDEMPRESA,        :RECPAG,            :CODTIPRECDES,     :CODCENTROCUSTO, '+ #13 +
          '   :CODCENTRORESPON,  :UNIDNEGOC,         :PLANO,            :PLACONTA, '      + #13 +
          '   :CODPORTFORMA,     :DFLOATPAGTO,       :NUMPROCINSS,      :FLGSALFAM, '     + #13 +
          '   :FLGPROVISORIO,    :IDVERSAOPAGTO,     :IDRECEBEPGTO, '                     + #13 +
          '   :IDPLANOORIGEM,    :IDPLANOCONTABIL,   :IDFAVDOC,         :SEQDOCUMENTO '   + #13 +
          '   ,:IDSEQINTERNOFB, :MESCOMPREEM  '    + #13 + //Renato Visoni SOL 143380 Kintana 943521 // SOL 140042 Kintana 900220
          '   ,:IDPERFILINVEST  '                 + #13 +  //edilaine - SIG56702
          '   ,:CODPROVDESC)    '                 + #13;  //Ewerton Beltramini - SIG94637

  //CPrev - 27839 - Inicio
  fqryRubricaGrava := TwwQuery.Create(Nil);
  fqryRubricaGrava.DatabaseName := 'BaseDados';
  fqryRubricaGrava.SQL.Text := sSQL;
 
  fqryRubricaGrava.Params.Clear;
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'NUMEROPROCESSO'     , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDPESSJUR'          , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDPATRO'            , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDPLANOPREV'        , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDTITULAR'          , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDPESSOA'           , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDRESPONSAVEL'      , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDFAVORECIDO'       , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftString,   'MES'                , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftString,   'MESCOBRANCA'        , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDBENEFICIO'        , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDRUBRICA'          , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDLOTE'             , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftString,   'FLGTIPODESC'        , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'FLGDESCONTO'        , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDMOTIVO'           , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'SEQPROPOSTA'        , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'SEQRUBRICA'         , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftString,   'REFERENCIA'         , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftFloat,    'VALORPROVENTO'      , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftFloat,    'VALORCOTAS'         , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftFloat,    'VALORINFO'          , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftFloat,    'VALORRECEBIDO'      , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'CODMOEDA'           , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDREGRACALCULO'     , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftString,   'CODIRRFDARF'        , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'CODALTERADOR'       , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftDateTime, 'DATAPAGAMENTO'      , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'FONTEPAGADORA'      , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'FLGIRRF'            , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDMODULO'           , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'FLGSRB'             , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'FLGOK'              , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'FLGCONCESSAO'       , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'FLGINDIVIDUAL'      , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'FLGCOMPOESALPART'   , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'FLGCOMPOESALBENEF'  , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'ORDEM'              , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'FLGPAGA'            , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDEMPRESA',           ptInput);
  fqryRubricaGrava.Params.CreateParam( ftString,   'RECPAG',              ptInput);
  fqryRubricaGrava.Params.CreateParam( ftString,   'CODTIPRECDES',        ptInput);
  fqryRubricaGrava.Params.CreateParam( ftString,   'CODCENTROCUSTO',      ptInput);
  fqryRubricaGrava.Params.CreateParam( ftString,   'CODCENTRORESPON',     ptInput);
  fqryRubricaGrava.Params.CreateParam( ftString,   'UNIDNEGOC',           ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'PLANO',               ptInput);
  fqryRubricaGrava.Params.CreateParam( ftString,   'PLACONTA',            ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'CODPORTFORMA',        ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'DFLOATPAGTO',         ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'NUMPROCINSS'        , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'FLGSALFAM'          , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'FLGPROVISORIO'      , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDVERSAOPAGTO',       ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDRECEBEPGTO'       , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDPLANOORIGEM'      , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDPLANOCONTABIL'    , ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDFAVDOC',            ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'SEQDOCUMENTO',        ptInput);
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDSEQINTERNOFB',      ptInput); //Renato Visoni SOL 143380 Kintana 943521
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'MESCOMPREEM',         ptInput); //Fernando Xavier SOL 140042 Kintana 900220
  fqryRubricaGrava.Params.CreateParam( ftInteger,  'IDPERFILINVEST',      ptInput); //edilaine - SIG56702
  fqryRubricaGrava.Params.CreateParam( ftString,   'CODPROVDESC',         ptInput); //Ewerton Beltramini - SIG94637 //Andre Imakawa - SIG 97305    
  //CPrev - 27839 - Fim
end;

destructor TFolhaPreviaObj.Destroy;
begin
  fCDSPessoa.Close;
  fCDSRubrica.Close;
  fqryAux.Close;

  FreeAndNil(fCDSPessoa);
  FreeAndNil(fCDSRubrica);
  FreeAndNil(fqryAux);

  FreeAndNil(fObjPortador);
end;

procedure TFolhaPreviaObj.FazImportacao;
Var sLinha   : String;
    FArquivo : TextFile;
begin
  inherited;

  //Criticas
  If fVlrMaxLimiteFolhaExtra > 0 Then
  begin
    If fVlrMaxLimiteFolhaExtra < fValor Then
    Begin
      fMessageInfo := 'O valor líquido das rubricas lançadas excedeu o limite de pagamento estipulado.';
      Abort;
    End;

  End;
  //Fim das Criticas

  If fArqPath <> '' Then
  Begin
    AssignFile(FArquivo, fArqPath);
    Reset(FArquivo);

    While Not EOF(FArquivo) do
    Begin
      Readln(FArquivo, sLinha);
      LeLinha(sLinha);
    End;

    CloseFile(FArquivo);
  End;
end;

procedure TFolhaPreviaObj.GravaLinha;
Var sRecebedor : String;
begin
  If Not fCDSPessoa.Active Then Exit;
  If Not fCDSRubrica.Active Then Exit;

  fCtrlBCP := TCtrlBancoPortForma.create;
  fCtrlBCP.InitializeAs(Padroes);
  fCtrlBCP.Inicializa(fIDFundacao);

  //Grava Pessoa
  If LocalizaPessoa Then
  Begin
    fIDPessJur := Trunc(fqryAux.FieldByName('IDPESSJUR').AsFloat);
    fIDTitular := Trunc(fqryAux.FieldByName('IDTITULAR').AsFloat);

    If Not fCDSPessoa.Locate('IDFUNDACAO; IDPESSJUR; IDTITULAR; IDRECEBEDOR',
                             VarArrayOf([IntToStr(fIDFundacao),
                                         IntToStr(fIDPessJur),
                                         IntToStr(fIDTitular),
                                         IntToStr(fIDRecebedor)]), []) Then
    Begin
      fCDSPessoa.Append;

      fCDSPessoa.FieldByName('IDFUNDACAO').AsFloat        := fIDFundacao;
      fCDSPessoa.FieldByName('IDPESSJUR').AsFloat         := fIDPessJur;

      If fIDRecebedor > 0 Then
        fCDSPessoa.FieldByName('IDRECEBEDOR').AsFloat       := fIDRecebedor
      Else
        fCDSPessoa.FieldByName('IDRECEBEDOR').AsFloat       := fIDTitular;

      fCDSPessoa.FieldByName('IDTITULAR').AsFloat         := fIDTitular;

      fCDSPessoa.FieldByName('PARTICIPANTE').AsString     := fQryAux.FieldByName('PARTICIPANTE').AsString;
      fCDSPessoa.FieldByName('RECEBEDOR').AsString        := fQryAux.FieldByName('RECEBEDOR').AsString;

      If fMatricula = '' Then
        fCDSPessoa.FieldByName('MATRICULA').AsString      := fQryAux.FieldByName('MATRICULA').AsString
      Else
        fCDSPessoa.FieldByName('MATRICULA').AsString      := fMatricula;

      fCDSPessoa.FieldByName('INSCRICAONUMERO').AsFloat   := fQryAux.FieldByName('INSCRICAONUMERO').AsFloat;
      fCDSPessoa.FieldByName('DATANASC').AsDateTime       := fQryAux.FieldByName('DATANASC').AsDateTime;
      fCDSPessoa.FieldByName('FLGISENTOIRRF').AsFloat     := fQryAux.FieldByName('FLGISENTOIRRF').AsFloat;
      fCDSPessoa.FieldByName('NUMDEPIRRF').AsFloat        := fQryAux.FieldByName('NUMDEPIRRF').AsFloat;
      // Andre Imakawa - SIG 67136 e 65767 - Incio
      //fCDSPessoa.FieldByName('IDPLANOPREV').AsFloat       := fQryAux.FieldByName('IDPLANOPREV').AsFloat;
      if fIDPlanoPrevPrev  > 0 then
        fCDSPessoa.FieldByName('IDPLANOPREV').AsFloat       := fIDPlanoPrevPrev
      else
        fCDSPessoa.FieldByName('IDPLANOPREV').AsFloat       := fQryAux.FieldByName('IDPLANOPREV').AsFloat;
      // Andre Imakawa - SIG 67136 e 65767 - Fim





      fCDSPessoa.Post;

      sRecebedor := fQryAux.FieldByName('RECEBEDOR').AsString;
    End;

    // Andre Imakawa - SIG 101624 - Inicio
    if fIDPlanoPrevContabilAux > 0 then
    begin
      if not(ValidaPlanoContabil(fIDPlanoPrevContabilAux, fIDTitular )) then
      begin
        fMessageInfo := fMessageInfo + ' Matricula: ' + fMatricula + ' com plano contábil inválido.' +#13 ;

        Exit;
      end
      else
      begin
        fIDPlanoPrevContabil := fIDPlanoPrevContabilAux;
      end;
    end
    else
    begin
      //Grava Rubrica
      LocalizaPlanoContabil;

      If Trunc(fqryAux.FieldByName('IDPLANOCONTABIL').AsFloat) <> 0 Then
      fIDPlanoPrevContabil := Trunc(fqryAux.FieldByName('IDPLANOCONTABIL').AsFloat);

    end;
    // Andre Imakawa - SIG 101624 - Fim


    fIDPlanoPrev         := Trunc(fCDSPessoa.FieldByName('IDPLANOPREV').AsFloat);

    //Verifica se a rubrica já foi cadastrada
    If fCDSRubrica.Locate('IDFUNDACAO; IDPESSJUR; IDTITULAR; IDRECEBEDOR; ' +
                          'IDRUBRICA; MESREFERENCIA; IDPLANOPREV; IDPLANOCONTABIL',
                           VarArrayOf([IntToStr(fIDFundacao),
                                       IntToStr(fIDPessJur),
                                       IntToStr(fIDTitular),
                                       IntToStr(fIDRecebedor),
                                       IntToStr(fIDRubrica),
                                       fMesReferencia,
                                       IntToStr(fIDPlanoPrev),
                                       IntToStr(fIDPlanoPrevContabil)]), []) Then
    Begin
      LocalizaRubrica;
      fMessageInfo := fMessageInfo + ' A Rubrica: ' + fqryAux.FieldByName('DESCRICAO').AsString     +
                                     ' já foi cadastrada com mesmo Plano Contábil e Mês Referência' +
                                     ' para a Matricula ' + fMatricula + '.' + #13;

      Exit;
    End;

    If Not VerificaContaBancaria Then
    Begin
      If sRecebedor <> '' Then
      Begin
        fMessageInfo := fMessageInfo + ' O Recebedor ' + sRecebedor + ' não possui Conta Bancária cadastrada. ' +
                                       ' Cadastre pelo menos uma conta para conceder o benefício.' + #13;
      End;                                 

      Exit;
    End;

    If Not ValidaAnoMes(fMesReferencia, 1) Then
    Begin
      If sRecebedor <> '' Then
      Begin
        fMessageInfo := fMessageInfo + ' O Recebedor ' + sRecebedor + ' não possui ou está incorreta o mês referência.' + #13;
        Exit;
      End;  
    End;   

    fCDSRubrica.Append;

    fCDSRubrica.FieldByName('IDFUNDACAO').AsFloat         := fIDFundacao;
    fCDSRubrica.FieldByName('IDPESSJUR').AsFloat          := fIDPessJur;
    fCDSRubrica.FieldByName('IDTITULAR').AsFloat          := fIDTitular;
    fCDSRubrica.FieldByName('IDRECEBEDOR').AsFloat        := fIDRecebedor;
    fCDSRubrica.FieldByName('IDPLANOPREV').AsFloat        := fIDPlanoPrev;

    // Andre Imakawa - SIG 101624 - Inicio
    if fCodPortFormaAux > 0 then
    begin
      if not(ValidaPortador(fCodPortFormaAux, fDescPortForma)) then
      begin
        fMessageInfo := fMessageInfo +  ' Matricula: ' + fMatricula + ' com Portador Forma inválido.' +#13 ;

        Exit;
      end
      else
      begin
        fCDSRubrica.FieldByName('CODPORTFORMA').AsFloat       := fCodPortFormaAux;
        fCDSRubrica.FieldByName('DESCPORTFORMA').AsString     := fDescPortForma;
      end;
    end
    else
    begin
      fCDSRubrica.FieldByName('CODPORTFORMA').AsFloat       := RetornaPortadorForma(fDescPortForma);
      fCDSRubrica.FieldByName('DESCPORTFORMA').AsString     := fDescPortForma;
    end;

    if not(LocalizaRubrica) then
    begin
      fMessageInfo := fMessageInfo +  ' Matricula: ' + fMatricula + ' com rubrica inválida.' +#13 ;
      Exit;
    end;
    // Andre Imakawa - SIG 101624 - Fim

    fCDSRubrica.FieldByName('IDRUBRICA').AsFloat          := fIDRubrica;
    fCDSRubrica.FieldByName('DESCRICAO').AsString         := fqryAux.FieldByName('DESCRICAO').AsString;
    fCDSRubrica.FieldByName('FLGDESCONTO').AsFloat        := fqryAux.FieldByName('FLGDESCONTO').AsFloat;
    fCDSRubrica.FieldByName('CODIRRFDARF').AsString       := fqryAux.FieldByName('CODIRRFDARF').AsString;

    LocalizaPlanoContabil;
    fCDSRubrica.FieldByName('IDPLANOORIGEM').AsFloat      := fqryAux.FieldByName('IDPLANOORIGEM').AsFloat;
    fCDSRubrica.FieldByName('IDPLANOCONTABIL').AsFloat    := fqryAux.FieldByName('IDPLANOCONTABIL').AsFloat;
    fCDSRubrica.FieldByName('DESCPLANOCONTABIL').AsString := fqryAux.FieldByName('DESCPLANOCONTABIL').AsString;

    fCDSRubrica.FieldByName('MESREFERENCIA').AsSTring     := fMesReferencia;
    fCDSRubrica.FieldByName('VALOR').AsFloat              := fValor;

    // Andre Imakawa - SIG 101624 - Inicio
    if fIDPerfil > 0 then
      fCDSRubrica.FieldByName('IDPERFILINVEST').AsFloat    := fIDPerfil;
    // Andre Imakawa - SIG 101624 - Fim
    fCDSRubrica.Post;

  End
  Else
  Begin
    fMessageInfo := fMessageInfo + ' - O Participante de Matricula: ' + fMatricula + ' e recebedor com o IdPessoa : ' + IntToStr(fIDRecebedor) + ' não foi encontrado ' + #13;
  End;
  
  FreeAndNil(fCtrlBCP);
end;

procedure TFolhaPreviaObj.IncluirPrevia;
Var rValorLiquido   : Double;
    sPLACONTA,
    sCODCENTROCUSTO,
    sCodDarfLancado : String;
    iCODSUBCONTA,
    iIdRubLancaIRRF : Integer;
    bErro : Boolean;
begin
  If Not fCDSPessoa.Active Then Exit;
  If Not fCDSRubrica.Active Then Exit;

  fCtrlBCP := TCtrlBancoPortForma.create;
  fCtrlBCP.InitializeAs(Padroes);
  fCtrlBCP.Inicializa(fIDFundacao);

  bErro := False;

  fCDSPessoa.First;
  While Not fCDSPessoa.EOF do
  Begin
    ApagaRegPrevia( Trunc(cdsPessoa.FieldByName('IDRECEBEDOR').AsFloat) );

    cdsRubrica.Filter := 'IDFUNDACAO  = ' + cdsPessoa.FieldByName('IDFUNDACAO').AsString + ' AND ' +
                         'IDPESSJUR   = ' + cdsPessoa.FieldByName('IDPESSJUR').AsString  + ' AND ' +
                         'IDTITULAR   = ' + cdsPessoa.FieldByName('IDTITULAR').AsString  + ' AND ' +
                         'IDRECEBEDOR = ' + cdsPessoa.FieldByName('IDRECEBEDOR').AsString;
    cdsRubrica.Filtered := True;

    If CriaRecebedor(0, fIDFundacao,
                     Trunc(cdsRubrica.FieldByName('IDPESSJUR').AsFloat),
                     Trunc(cdsPessoa.FieldByName('IDPLANOPREV').AsFloat),
                     Trunc(cdsRubrica.FieldByName('IDTITULAR').AsFloat),
                     Trunc(cdsRubrica.FieldByName('IDRECEBEDOR').AsFloat),
                     fIDLote,
                     Trunc(cdsPessoa.FieldByName('NUMDEPIRRF').AsFloat),
                     Trunc(cdsPessoa.FieldByName('FLGISENTOIRRF').AsFloat),
                     1, 0,
                     TRUNC(cdsRubrica.FieldByName('CODPORTFORMA').AsFloat),
                     fIDFloatPgto,
                     TRUNC(cdsRubrica.FieldByName('IDPLANOORIGEM').AsFloat),
                     TRUNC(cdsRubrica.FieldByName('IDPLANOCONTABIL').AsFloat),
                     cdsPessoa.FieldByName('DATANASC').AsDateTime,
                     fobjRecebedor) then
    Begin
      If Assigned(fobjRecebedor) then
      Begin
        rValorLiquido := CalculaLiquido( cdsRubrica.FieldByName('IDRECEBEDOR').AsInteger );

        cdsRubrica.First;

        fCtrlBCP.DefinePortadorForma(Trunc(cdsRubrica.FieldByName('IDTITULAR').AsFloat),
                                     Trunc(cdsRubrica.FieldByName('IDRECEBEDOR').AsFloat),
                                     Trunc(cdsRubrica.FieldByName('IDPESSJUR').AsFloat),
                                     2, 0, 0, fCodPortForma, 0,
                                     fNumBanco, fNumAgencia, fNomeAgencia, fNumConta,
                                     fTipoConta, fIDCBancaria,
                                     fbPagtoElet, fbDuplContaPref,
                                     fIDFavoRec,
                                     0,
                                     fSeqDoc, fObjPortador);

        fobjRecebedor.iFavDoc       := fIDFavoRec;
        fobjRecebedor.iSeqDocumento := fSeqDoc;

        While (Not cdsRubrica.Eof) And (Not bErro) do
        Begin
          If Not IsRubricaIRRF(Trunc(cdsRubrica.FieldByName('IDRUBRICA').AsFloat)) then
          Begin
            If dtmContabil.PegaParamCF(Trunc(cdsRubrica.FieldByName('IDPESSJUR').AsFloat),
                                       Trunc(cdsPessoa.FieldByName('IDPLANOPREV').AsFloat),
                                       Trunc(cdsRubrica.FieldByName('IDRUBRICA').AsFloat),
                                       Trunc(cdsRubrica.FieldByName('IDTITULAR').AsFloat),
                                       Trunc(cdsRubrica.FieldByName('IDRECEBEDOR').AsFloat),
                                       '2007/06',                                     //MesCobranca
                                       fRefCF) then
            Begin
              If Trunc(cdsRubrica.FieldByName('FLGDESCONTO').AsFloat) = 0 then
              Begin
                sPLACONTA       := fRefCF.PlaContaD;
                iCODSUBCONTA    := fRefCF.SubConta;
                sCODCENTROCUSTO := fRefCF.CentroCustoD;
              End
              Else
              Begin
                sPLACONTA       := fRefCF.PlaContaC;
                iCODSUBCONTA    := fRefCF.SubConta;
                sCODCENTROCUSTO := fRefCF.CentroCustoC;
              End;
            End;

            If Not fobjRecebedor.IdentificaInsereRubrica(Trunc(cdsRubrica.FieldByName('IDRECEBEDOR').AsFloat),
                                                         Trunc(cdsRubrica.FieldByName('IDRECEBEDOR').AsFloat), // Favorecido
                                                         0,                                                    // llidbeneficio
                                                         Trunc(cdsRubrica.FieldByName('IDRUBRICA').AsFloat),
                                                         prmidmotivofolhaben,                                  // IdMotivo
                                                         0, 0, 0,
                                                         StrToInt(fCodFontePagadora),                          // Fonte Pagadora
                                                         1, 0, 0,
                                                         Trunc(cdsRubrica.FieldByName('IDFUNDACAO').AsFloat),  // IDFundacao
                                                         'T',                                                  // T ou I
                                                         cdsRubrica.FieldByName('VALOR').AsFloat,              // Verificar
                                                         cdsRubrica.FieldByName('VALOR').AsFloat,
                                                         0,
                                                         IntToStr(fIDLote),                                    // Ver se  o numero da versao é o idlote da ctrlinterface
                                                         cdsRubrica.FieldByName('MESREFERENCIA').AsString,     // MesReferencia
                                                         cdsRubrica.FieldByName('CODIRRFDARF').AsString,       // CODIRRFDARF
                                                         'P',
                                                         fRefCF.CodTipRecDes,
                                                         sCODCENTROCUSTO,
                                                         fRefCF.CentroRespon,
                                                         IntToStr(fRefCF.UnidNegoc),
                                                         sPlaConta,
                                                         '', '', 0, 0,
                                                         fIDLote,
                                                         0,
                                                         cdsRubrica.FieldByName('IDPLANOCONTABIL').AsInteger,
                                                         cdsRubrica.FieldByName('IDPERFILINVEST').AsInteger  // Andre Imakawa - SIG 101624
                                                         ) Then
              bErro := True;
          End;

          cdsRubrica.Next;
        End;

        If (Not bErro) And (cdsRubrica.Eof) then
        begin
          If sCodDarfLancado = '3223' Then
            iIdRubLancaIRRF := prmIdRubIRRFResg;

          If sCodDarfLancado = '0561' Then
            If fCodFontePagadora = '1' Then
            Begin
              If Copy(fMesReferencia, 5, 4) = '12' Then
                iIdRubLancaIRRF := prmIDRUBIRRFABONO
              Else
                iIdRubLancaIRRF := prmIdRubricaIRRF;
            End
            Else
            Begin
              If Copy(fMesReferencia, 5, 4) = '12' Then
                iIdRubLancaIRRF := SistemaFolha.IdRubIRRFINSSAbono
              Else
                iIdRubLancaIRRF := prmIDRUBIRRFINSS;
            End;

          fobjrecebedor.DeterminaBasesIRRF;
          fobjrecebedor.CalculoIRRF(fMesCobranca, fDataPagamento, 0,
                                    iIdRubLancaIRRF, sCodDarfLancado);

          fobjrecebedor.VerificaMargemDesconto;
          // Andre Imakawa - SIG 65767 - Inicio
          try
            fobjrecebedor.EfetivaRubricas( fqryRubricaGrava,
                                        fMesCobranca, fDataPagamento);
          Except
            on E : Exception do
            begin
              bErro := True;
              fMessageInfo := E.Message;
            end;
          end;
          // Andre Imakawa - SIG 65767 - Fim
        End
        Else
          bErro:=True;

        If Assigned(fobjRecebedor) then
        Begin
          fobjRecebedor.free;
          fobjRecebedor := nil;
        End;

      End
      Else
        bErro := True;
    End
    Else
      bErro := True;
      
    CDSPessoa.Next;
  End;

  If bErro Then
  Begin
    if fMessageInfo = '' then // Andre Imakawa - SIG 65767
      fMessageInfo := 'Ocorreu um erro durante a geração da Prévia';
    Abort;
  End;

  FreeAndNil(fCtrlBCP);
end;

procedure TFolhaPreviaObj.LeLinha(psLinha: String);
begin
  if trim(psLinha) <> '' then
  begin
    fIDTitular     := -1;
    fMAtricula     := Copy(psLinha, 1, 10);
    fIDRecebedor   := StrToInt64(Copy(psLinha, 11, 10));
    fIDRubrica     := StrToInt64(Copy(psLinha, 21, 10));
    fValor         := StrToInt64(Copy(psLinha, 31, 10)) / 100;
    fMesReferencia := FormatMaskText('9999/99;0;', Copy(psLinha, 41, 6));
    // Andre Imakawa - SIG 101624 - Inicio
    fIDPlanoPrevContabilAux := StrToInt64(Copy(psLinha, 47, 3));
    fCodPortFormaAux        := StrToInt64(Copy(psLinha, 50, 3));
    fIDPerfil               := StrToInt64(Copy(psLinha, 53, 2));

    if fIDPerfil > 0 then
      if not(ValidaPerfil(fIDPerfil)) then
      begin
        fMessageInfo := fMessageInfo + ' Matricula: ' + fMatricula + ' com Perfil de Investimento inválido. ' + #13;
      end;
    // Andre Imakawa - SIG 101624 - Fim

    GravaLinha;
  end;

end;

function TFolhaPreviaObj.LocalizaPessoa: Boolean;
Var sSQL : String;
begin
  sSQL := ' SELECT DISTINCT '                                            + #13 +
          '   PP.INSCRICAONUMERO, '                                      + #13 +
          '   EL.IDPESSOA AS IDTITULAR, '                                + #13 +
          '   EL.MATRICULA, '                                            + #13 +
          '   P.IDPESSOA, '                                              + #13 +
          '   P.NOME AS PARTICIPANTE, '                                  + #13 +
          '   DP.IDPESSOA AS IDRECEBEDOR, '                              + #13 +
          '   DP.NOME AS RECEBEDOR, '                                    + #13 +
          '   PP.IDPLANOPREV, '                                          + #13 +
          '   PP.IDPESSJUR, '                                            + #13 +
          '   PF.FLGISENTOIRRF, '                                        + #13 +
          '   PF.NUMDEPIRRF, '                                           + #13 +
          '   PF.DATANASC '                                              + #13 +
          ' FROM '                                                       + #13 +
          '   ELEGPATRO EL, '                                            + #13 +
          '   PARTPREVPLAN PP, '                                         + #13 +
          '   PESSOA P, '                                                + #13 +
          '   PESSOAFISICA PF, '                                         + #13 +
          '   PATRO PAT, '                                               + #13 +
          '   DEPENTIT D, '                                              + #13 +
          '   PESSOA DP '                                                + #13 +
          ' WHERE ( D.IDTITULAR      = EL.IDPESSOA ) '                   + #13 +
          '   AND ( D.IDPESSOA       = DP.IDPESSOA ) '                   + #13 +
          '   AND ( PP.IDPESSOA      = EL.IDPESSOA ) '                   + #13 +
          '   AND ( PP.IDPESSJUR     = EL.IDPESSJUR ) '                  + #13 +
          '   AND ( P.IDPESSOA       = EL.IDPESSOA ) '                   + #13 +
          '   AND ( PF.IDPESSOA      = P.IDPESSOA ) '                    + #13 +
          '   AND ( PP.FLGDESATIVADO = 0 ) '                             + #13 +
          '   AND ( PAT.IDPESSOA     = EL.IDPESSJUR ) '                  + #13 +
          '   AND ( PAT.IDFUNDACAO   = ' + IntToStr(fIDFundacao) + ' ) ' + #13;

    //CPrev - 27839 - Inicio
    While True do
    Begin
      //If Copy(fMatricula,1,1) = '0' Then  //Andre Imakawa - SIG 101624
      If Copy(fMatricula,1,1) = ' ' Then    //Andre Imakawa - SIG 101624
        fMatricula := Copy(fMatricula, 2, Length(fMatricula))
      Else
        Break;
    End;
    //CPrev - 27839 - Fim

    If fMatricula <> '' Then
      sSQL := sSQL + '   AND ( EL.MATRICULA     = ' + QuotedStr(fMatricula) + ' ) ' + #13;

    If fIDTitular > 0 Then
      sSQL := sSQL + '   AND ( EL.IDPESSOA      = ' + IntToStr(fIDTitular)  + ' ) ' + #13;

      sSQL := sSQL + '   AND ( D.IDPESSOA       = ' + IntToStr(fIDRecebedor) + ' ) ' + #13;

  //CPrev - 27962 - Inicio
  sSQL := sSQL + ' UNION '                                                      + #13;

  sSQL := sSQL + ' SELECT DISTINCT '                                            + #13 +
                 '   PP.INSCRICAONUMERO, '                                      + #13 +
                 '   EL.IDPESSOA AS IDTITULAR, '                                + #13 +
                 '   EL.MATRICULA, '                                            + #13 +
                 '   P.IDPESSOA, '                                              + #13 +
                 '   P.NOME AS PARTICIPANTE, '                                  + #13 +
                 '   DP.IDPESSOA AS IDRECEBEDOR, '                              + #13 +
                 '   DP.NOME AS RECEBEDOR, '                                    + #13 +
                 '   PP.IDPLANOPREV, '                                          + #13 +
                 '   PP.IDPESSJUR, '                                            + #13 +
                 '   PF.FLGISENTOIRRF, '                                        + #13 +
                 '   PF.NUMDEPIRRF, '                                           + #13 +
                 '   PF.DATANASC '                                              + #13 +
                 ' FROM '                                                       + #13 +
                 '   ELEGPATRO EL, '                                            + #13 +
                 '   PARTPREVPLAN PP, '                                         + #13 +
                 '   PESSOA P, '                                                + #13 +
                 '   PESSOAFISICA PF, '                                         + #13 +
                 '   PATRO PAT, '                                               + #13 +
                 '   RUBRICAINDIV D, '                                          + #13 +
                 '   PESSOA DP '                                                + #13 +
                 ' WHERE ( D.IDTITULAR      = EL.IDPESSOA ) '                   + #13 +
                 '   AND ( D.IDPESSOA       = DP.IDPESSOA ) '                   + #13 +
                 '   AND ( PP.IDPESSOA      = EL.IDPESSOA ) '                   + #13 +
                 '   AND ( PP.IDPESSJUR     = EL.IDPESSJUR ) '                  + #13 +
                 '   AND ( P.IDPESSOA       = EL.IDPESSOA ) '                   + #13 +
                 '   AND ( PF.IDPESSOA      = P.IDPESSOA ) '                    + #13 +
                 '   AND ( PP.FLGDESATIVADO = 0 ) '                             + #13 +
                 '   AND ( PAT.IDPESSOA     = EL.IDPESSJUR ) '                  + #13 +
                 '   AND ( PAT.IDFUNDACAO   = ' + IntToStr(fIDFundacao) + ' ) ' + #13;

    //CPrev - 27839 - Inicio
    While True do
    Begin
      //If Copy(fMatricula,1,1) = '0' Then  //Andre Imakawa - SIG 101624
      If Copy(fMatricula,1,1) = ' ' Then    //Andre Imakawa - SIG 101624
        fMatricula := Copy(fMatricula, 2, Length(fMatricula))
      Else
        Break;
    End;
    //CPrev - 27839 - Fim

    If fMatricula <> '' Then
      sSQL := sSQL + '   AND ( EL.MATRICULA     = ' + QuotedStr(fMatricula) + ' ) ' + #13;

    If fIDTitular > 0 Then
      sSQL := sSQL + '   AND ( EL.IDPESSOA      = ' + IntToStr(fIDTitular)  + ' ) ' + #13;

      sSQL := sSQL + '   AND ( D.IDPESSOA       = ' + IntToStr(fIDRecebedor) + ' ) ';

  sSQL := sSQL + ' UNION '                                                      + #13;

  sSQL := sSQL + ' SELECT DISTINCT '                                            + #13 +
                 '   PP.INSCRICAONUMERO, '                                      + #13 +
                 '   EL.IDPESSOA AS IDTITULAR, '                                + #13 +
                 '   EL.MATRICULA, '                                            + #13 +
                 '   P.IDPESSOA, '                                              + #13 +
                 '   P.NOME AS PARTICIPANTE, '                                  + #13 +
                 '   DP.IDPESSOA AS IDRECEBEDOR, '                              + #13 +
                 '   DP.NOME AS RECEBEDOR, '                                    + #13 +
                 '   PP.IDPLANOPREV, '                                          + #13 +
                 '   PP.IDPESSJUR, '                                            + #13 +
                 '   PF.FLGISENTOIRRF, '                                        + #13 +
                 '   PF.NUMDEPIRRF, '                                           + #13 +
                 '   PF.DATANASC '                                              + #13 +
                 ' FROM '                                                       + #13 +
                 '   ELEGPATRO EL, '                                            + #13 +
                 '   PARTPREVPLAN PP, '                                         + #13 +
                 '   PESSOA P, '                                                + #13 +
                 '   PESSOAFISICA PF, '                                         + #13 +
                 '   PATRO PAT, '                                               + #13 +
                 '   RUBRICAINDIV D, '                                          + #13 +
                 '   PESSOA DP '                                                + #13 +
                 ' WHERE ( D.IDTITULAR      = EL.IDPESSOA ) '                   + #13 +
                 '   AND ( D.IDFAVORECIDO   = DP.IDPESSOA ) '                   + #13 +
                 '   AND ( PP.IDPESSOA      = EL.IDPESSOA ) '                   + #13 +
                 '   AND ( PP.IDPESSJUR     = EL.IDPESSJUR ) '                  + #13 +
                 '   AND ( P.IDPESSOA       = EL.IDPESSOA ) '                   + #13 +
                 '   AND ( PF.IDPESSOA      = P.IDPESSOA ) '                    + #13 +
                 '   AND ( PP.FLGDESATIVADO = 0 ) '                             + #13 +
                 '   AND ( PAT.IDPESSOA     = EL.IDPESSJUR ) '                  + #13 +
                 '   AND ( PAT.IDFUNDACAO   = ' + IntToStr(fIDFundacao) + ' ) ' + #13;

    //CPrev - 27839 - Inicio
    While True do
    Begin
      //If Copy(fMatricula,1,1) = '0' Then  //Andre Imakawa - SIG 101624
      If Copy(fMatricula,1,1) = ' ' Then    //Andre Imakawa - SIG 101624
        fMatricula := Copy(fMatricula, 2, Length(fMatricula))
      Else
        Break;
    End;
    //CPrev - 27839 - Fim

    If fMatricula <> '' Then
      sSQL := sSQL + '   AND ( EL.MATRICULA     = ' + QuotedStr(fMatricula) + ' ) ' + #13;

    If fIDTitular > 0 Then
      sSQL := sSQL + '   AND ( EL.IDPESSOA      = ' + IntToStr(fIDTitular)  + ' ) ' + #13;

    sSQL := sSQL + '   AND ( D.IDFAVORECIDO   = ' + IntToStr(fIDRecebedor) + ' ) ';

  //CPrev - 27962 - Fim

  Try
    fqryAux.Close;
    fqryAux.SQL.Text := sSQL;
    fqryAux.Open;

    Result := Not fqryAux.IsEmpty;
  Except
    Result := False;
  End;
end;

procedure TFolhaPreviaObj.LocalizaPlanoContabil;
Var sSQL             : String;
    sListaPlano,
    sIdSitPlanoPrev,
    sFlgMigrado      : String;
    iIdPlanoPrev,
    iIdPlanoOrigem,
    iIdPlanoContabil,
    iIDPlanoPadrao   : Integer;
    bErro            : Boolean;

begin
  sListaPlano := IntToStr(fIDPlanoPrevContabil) + ', '; //CPrev - 28031

  sSQL := ' SELECT DISTINCT '                                                           + #13 +
          '        B.IDPESSOA, NVL (B.IDPLANOORIGEM, B.IDPLANOPREV) AS IDPLANOORIGEM, ' + #13 +
          '        B.IDPLANOPREV, '                                                     + #13 +
          '        NVL (B.IDPLANPREVCONTAB, B.IDPLANOPREV) AS IDPLANPREVCONTAB '        + #13 +
          ' FROM TPPAGTOBENEFICIO T, BENEFBFCIARIO B '                                  + #13 +
          ' WHERE T.IDTPPAGTOBENEFIC =  B.IDTPPAGTOBENEFIC '                            + #13 +
          '   AND ( (B.DATAFINAL IS NULL) OR (B.DATAFINAL > SYSDATE) ) '                + #13 +
          '   AND ( B.IDSITBENEFICIO   IN (1, 2, 4) ) '                                 + #13 +
          '   AND ( T.FLGFREQUENCIA    <> ''U'' ) '                                     + #13 +
          '   AND ( B.IDTITULAR        = ' + IntToStr(fIDTitular) + ' ) '               + #13 +
          '   AND ( B.IDPESSOA         = ' + IntToStr(fIDRecebedor) + ' ) ' ;

  Try
    fqryAux.Close;
    fqryAux.SQL.Text := sSQL;
    fqryAux.Open;

    If Not fqryAux.IsEmpty  Then
    Begin
      iIdPlanoPrev     := fqryAux.FieldByName('IDPLANOPREV').AsInteger;
      iIdPlanoOrigem   := fqryAux.FieldByName('IDPLANOORIGEM').AsInteger;
      iIdPlanoContabil := fqryAux.FieldByName('IDPLANPREVCONTAB').AsInteger;
    End
    Else
    begin
      iIdPlanoOrigem   := fIDPlanoPrev;
      iIdPlanoContabil := fIDPlanoPrev;
    End;

    While not fqryAux.Eof do
    Begin
      sListaPlano := sListaPlano + fqryAux.FieldByName('IDPLANPREVCONTAB').asstring+',';
      fqryAux.Next;
    End;

    If prmIdRgPlanPrevCont > 0 then
    Begin
      sSQL := ' SELECT IDSITPLANOPREV '                                  + #13 +
              ' FROM PARTPREVPLAN '                                      + #13 +
              ' WHERE ( IDPESSOA    = ' + IntToStr(fIDTitular)   + ' ) ' + #13 +
              '   AND ( IDPLANOPREV = ' + IntToStr(fIDPlanoPrev) + ' ) ' ;

      fqryAux.Close;
      fqryAux.SQL.Text := sSQL;
      fqryAux.Open;

      If Not fqryAux.IsEmpty Then
        sIdSitPlanoPrev := fqryAux.FieldByName('IDSITPLANOPREV').AsString
      Else
        sIdSitPlanoPrev := '0';

     sSQL := ' SELECT IDPLANOPREV '                                       + #13 +
              ' FROM PARTPREVPLAN '                                       + #13 +
              ' WHERE ( IDPESSOA     = ' + IntToStr(fIDTitular)   + ' ) ' + #13 +
              '   AND ( IDPLANOPREV <> ' + IntToStr(fIDPlanoPrev) + ' ) ';

      If Not fqryAux.IsEmpty Then
        sFlgMigrado := '1'
      Else
        sFlgMigrado := '0';

      sSql := 'SELECT '+
              IntToStr(fIDRecebedor)    +  ' AS IDPESSOA, '       + #13 +
              IntToStr(fIDTitular)      +  ' AS IDTITULAR, '      + #13 +
              IntToStr(fIDPlanoPrev)    +  ' AS IDPLANOPREV, '    + #13 +
              '0'                       +  ' AS IDBENEFICIO, '    + #13 +
              '0'                       +  ' AS FLGFITESPECIAL, ' + #13 +
              sIdSitPlanoPrev           +  ' AS IDSITPLANOPREV, ' + #13 +
              sFlgMigrado               +  ' AS FLGMIGRADO '      + #13 +
              ', ''IDPLANPREVCONTAB'' AS CAMPO FROM DUAL';

      Try
        iIdPlanoContabil := StrToInt(RegraNumerica( IntToStr(prmIdRgPlanPrevCont),
                                                    sSQL,
                                                    bErro,
                                                    fIDCalculo ) );

        sListaPlano := sListaPlano + IntToStr(iIdPlanoContabil) + ',';

        iIDPlanoPadrao := iIdPlanoContabil;
      Except
        fMessageInfo := 'Regra retornou plano contábil inválido.' +#13+
                        'Favor verificar com o TI';

        Abort;
      End;
    End
    Else
      iIdPlanoContabil := iIdPlanoPrev;

    sSQL := ' SELECT IDPLANOPREV AS IDPLANOCONTABIL, '                    + #13 +
            '        ' + IntToStr(iIdPlanoOrigem) + ' AS IDPLANOORIGEM, ' + #13 +
            '        NOME        AS DESCPLANOCONTABIL '                   + #13 +
            ' FROM PLANPREVCONTABIL '                                     + #13;

    If sListaPlano <> '' Then
    Begin
      sListaPlano := Copy(sListaPlano, 1, Length(sListaPlano) - 1);

      sSQL := sSQL + ' WHERE ( IDPLANOPREV IN (' + sListaPlano + ') ) ' + #13;
    End;

    sSQL := sSQL + ' ORDER BY NOME ';

    fqryAux.Close;
    fqryAux.SQL.Text := sSQL;
    fqryAux.Open;

    If fIDPlanoPrevContabil <= 0 Then
      fqryAux.locate('IDPLANOCONTABIL', iIDPlanoPadrao, [])
    Else
      fqryAux.locate('IDPLANOCONTABIL', IntToStr(fIDPlanoPrevContabil), []);
  Except
    fMessageInfo := 'Ocorreu um erro durante a geração da prévia de folha extra';
    Abort;
  End;
end;

procedure TFolhaPreviaObj.LocalizaPortForma(var psDescPortForma: String);
Var sSQL : String;
begin
  fDescPortForma := 'Contas Caixa x Forma de Pagamento, não encontrado';

  sSQL := ' SELECT CODPORTFORMA, DESCRICAO, CODPORTADOR ' + #13 +
          ' FROM PORTADORFORMA '                          + #13 +
          ' WHERE (RECPAG = ''P'' ) '                     + #13 +
          ' ORDER BY DESCRICAO ';

  Try
    fqryAux.Close;
    fqryAux.SQL.Text := sSQL;
    fqryAux.Open;

    If Not fqryAux.IsEmpty  Then
    Begin
      If fqryAux.locate('CODPORTFORMA', IntToStr(fCodPortForma), []) Then
        fDescPortForma := fqryAux.FieldByName('DESCRICAO').AsString;
    End;
  Except End;
end;

Function TFolhaPreviaObj.LocalizaRubrica:Boolean;
Var sSQL : String;
begin
  result := False;
  sSQL := ' SELECT IDPROVENTO, DESCRICAO, '                                                    + #13 +
          '        FLGDESCONTO, FLGIRRF, CODIRRFDARF, '                                        + #13 +
          '        DECODE(NVL(CODFONTEPAGADORA, 0), 0, 1, CODFONTEPAGADORA) CODFONTEPAGADORA ' + #13 +
          ' FROM PROVDESC '                                                                    + #13 +
          ' WHERE ( FLGESPECIAL = 0 ) '                                                        + #13 +
          '   AND ( IDPROVENTO  = ' + IntToStr(fIDRubrica) + ' ) ' ;

  Try
    fqryAux.Close;
    fqryAux.SQL.Text := sSQL;
    fqryAux.Open;
    if not(fqryAux.isempty) then
      result := True;
  Except
    result := False;
  End;
end;

function TFolhaPreviaObj.RetornaPortadorForma(var psDescPortForma: String): Integer;
Var sSQL : String;
begin
  If fCodPortForma = 0 Then
  Begin
    Result := fCtrlBCP.DefinePortadorForma(fIDTitular, fIDRecebedor,
                                           Trunc(fCDSPessoa.FieldByName('IDPESSJUR').AsFloat),
                                           2, 0, 0, fCodPortForma, 0,
                                           fNumBanco, fNumAgencia, fNomeAgencia, fNumConta,
                                           fTipoConta, fIDCBancaria,
                                           fbPagtoElet, fbDuplContaPref,
                                           fIDFavoRec,
                                           0,
                                           fSeqDoc, fObjPortador);
  End
  Else
    Result := fCodPortForma;

  sSQL := ' SELECT CODPORTFORMA, DESCRICAO, CODPORTADOR '       + #13 +
          ' FROM PORTADORFORMA '                                + #13 +
          ' WHERE ( RECPAG       = ''P'' ) '                    + #13 +
          '   AND ( CODPORTFORMA = ' + IntToStr(Result) + ' ) ' ;

  Try
    fqryAux.Close;
    fqryAux.SQL.Text := sSQL;
    fqryAux.Open;

    If Not fqryAux.IsEmpty  Then
    Begin
      fDescPortForma := fqryAux.FieldByName('DESCRICAO').AsString;
    End;
  Except End;
end;

function TFolhaPreviaObj.ValidaAnoMes(sSt: String; bNum: Byte): Boolean;
begin
  Result:=False;
  If StrToIntDef(Copy(sSt,1,4),0)>0 then
    If StrToIntDef(Copy(sSt,6,2),0) In [1..12+bNum] then
      Result:=True;
end;

function TFolhaPreviaObj.VerificaContaBancaria: Boolean;
Var sSQL : String;
begin
  Result := False;

  sSQL := 'SELECT CB.IDCBANCARIA, CB.CONTACORRENTE, CB.IDAGENCIA, CB.FLGCONTAPREF, ' + #13 +
          '       CB.IDPESSOA,    CB.TIPOCONTA, AGENCIA.NOME AS AGENCIA, '           + #13 +
          '       BANCO.NOME AS BANCO, AGENCIABANCARIA.NUMAGENCIA '                  + #13 +
          'FROM CONTABANCARIA  CB, PESSOA AGENCIA, '                                 + #13 +
          '     PESSOA BANCO, AGENCIABANCARIA AGENCIABANCARIA '                      + #13 +
          'WHERE ( CB.IDPESSOA             = ' + IntToStr(fIDRecebedor) + ' ) '      + #13 +
          '  AND ( CB.IDAGENCIA            = AGENCIA.IDPESSOA ) '                    + #13 +
          '  AND ( CB.IDAGENCIA            = AGENCIABANCARIA.IDPESSOA ) '            + #13 +
          '  AND ( AGENCIABANCARIA.IDBANCO =  BANCO.IDPESSOA ) '                     + #13 +
          '  AND ( CB.FLGCONTAPREF         = 1 )'                                    + #13;
  Try
    fqryAux.Close;
    fqryAux.SQL.Text := sSQL;
    fqryAux.Open;

    If fqryAux.RecordCount > 0 Then
      Result := True;
  Except End;
end;
//Andre Imakawa - SIG 101624 - Inicio
function TFolhaPreviaObj.ValidaPlanoContabil(pPlanoContabil, pIdTitular: Integer): Boolean;
Var sSQL : String;
    qryAux: twwquery;
begin
  Result := False;

  sSQL := ' SELECT COUNT(1) QTD FROM CM.PARTPREVPLAN PPP INNER JOIN CM.PLANPREVCONTABIL PPC ' + #13 +
          ' ON PPP.IDPLANOPREV = PPC.IDPLANOPREVPREV ' + #13 +
          ' WHERE PPC.IDPLANOPREV = ' + IntToStr(pPlanoContabil) + #13 +
          ' AND (PPP.IDPESSOA= '+ IntToStr(pIdTitular) +' )';

  Try
    qryAux := TwwQuery.Create(nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.close;
    qryAux.SQL.clear;
    qryAux.SQL.Add(sSQL);
    qryAux.Open;

    If qryAux.fieldbyname('QTD').asinteger > 0 Then
      Result := True;
  finally
    FreeAndNil(qryAux);
  end;
end;

function TFolhaPreviaObj.ValidaPortador(pCodPortForma: Integer; var psDescPortForma: String): Boolean;
Var sSQL : String;
    qryAux: twwquery;
begin
  Result := False;

  sSQL := ' SELECT CODPORTFORMA, DESCRICAO FROM CM.PORTADORFORMA PF WHERE PF.CODPORTFORMA = ' + IntToStr(pCodPortForma) + #13 +
          ' AND (PF.RECPAG = ''P'' )';
  Try
    qryAux := TwwQuery.Create(nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.close;
    qryAux.SQL.clear;
    qryAux.SQL.Add(sSQL);
    qryAux.Open;

    If Not qryAux.IsEmpty  Then
    begin
      psDescPortForma := qryAux.FieldByName('DESCRICAO').AsString;
      Result := True;
    end;

  finally
    FreeAndNil(qryAux);
  end;
end;

function TFolhaPreviaObj.ValidaPerfil(pPerfil: Integer): Boolean;
Var sSQL : String;
    qryAux: twwquery;
begin
  Result := False;

  sSQL := ' SELECT COUNT(1) QTD FROM CM.PERFILINVEST PI WHERE PI.IDPERFILINVEST = ' + IntToStr(pPerfil);
  Try
    qryAux := TwwQuery.Create(nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.close;
    qryAux.SQL.clear;
    qryAux.SQL.Add(sSQL);
    qryAux.Open;

    If qryAux.fieldbyname('QTD').asinteger > 0 Then
      Result := True;
  finally
    FreeAndNil(qryAux);
  end;
end;
//Andre Imakawa - SIG 101624 - Fim
end.
