{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/03/2003                                 }
{                                                       }
{*******************************************************}
{
-----------------------------------------------------------------------------
Nº SOL......: 218272
Nº KINTANA..: 2049247
Data........: 29/08/2013
Responsável.: Felipe Azevedo
Descrição...: Correção na ordenação do CdsDocumentos, pois estava gerando APs
              documentos indevidos.
-----------------------------------------------------------------------------
Nº SOL......: 212951
Nº KINTANA..: 2044356
Data........: 03/09/2013
Responsável.: Marcio Sanches Spinosa
Descrição...: Alteração na validação para lançar o rateio conforme o programa
configurado no centro de custo.
-----------------------------------------------------------------------------
Nº SOL......: 188078
Nº KINTANA..: 1772223
Data........: 29/08/2013
Responsável.: Felipe Azevedo
Descrição...: Adicionado o VALOR no indexFieldNames do cdsdocumento
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
{ ------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 149419
Nº KINTANA..: 1069206
Data........: 17/12/2010
Responsável.: Helen V. Bianchi
Descrição...:
--------------------------------------------------------------------------------}

unit uCtrlIntegraRH;

interface

uses Classes, SysUtils, uSistema, Controls, Db, uCmDbObject, uCmControlObject,
  uCMClientDataSet, uCtrlCustomRH, uCtrlDocumento, uCtrlListTerceirosRH,
  uCtrlSegregacao, dBaseDados, DbCLient;


type
    TCtrlIntegraRH = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FCtrlSegregacao : TCtrlSegregacao;
    FCtrlDocumento: TCtrlDocumento;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;

    FCdsDocumentos: TCMClientDataSet;

    FObrigaAbc: boolean;
    FObrigaCRespon: boolean;
    FConsTipoDesemb: boolean;

    FIdEmpresa: integer;
    FIdModulo: integer;
    FIdEspAcesso: integer;
    FIdUsuario: integer;
    FCodTipDoc: integer;
    FCodForma: integer;
    FIdPrograma: integer;
    FCodAlterador: integer;
    FValorAlt: double;

    FNumDocGerados: string;
    FCodCentroCusto: string;
    FCodCentroRespon: string;
    FObservacao: string;

    function ValidaDadosDoc(var CodCentroRespon: string; TipRecDes: string;
      var UnidNegoc: integer): boolean;
    function GetIdBanco_PortFolha(CodPortForma: integer = 0): integer;
    function FinalDocumento(const PlaContaAnt, CentroRespon,
      TipRecDes: string; const UnidNegoc, IdForCli: integer): boolean;

  public
    OnPergunta: TEventoPergunta; //andre tavares - pendencia 21795 - eveto para fazer a pergunta da reprogramacao de ap

    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function AbrirQueryDocumentos: boolean;

    function SetDadosDocumento(CodDocumento, NumLancto, Plano, UnidNegoc, CodPortForma: integer;
      IdFavorecido: double; PlaConta, CodCentroRespon, CodTipRecDes, RecPag, DebCre: string;
      Valor: double; PortFormaParticip: integer; CodCentroCusto: string; IdPessoa: integer;
      ValorAlt: double = 0; CodAlterador: integer = 0; PatroTmp: integer = 0; PlanoTmp: integer = 0): boolean;

    function GravarDocumentos(CriarDocIndividual: boolean; PlnCodigo, CodPortForma: integer;
      DataEmissao, DataRecebimento: TDate; Rateio, UsaPlanoPatro: boolean;
      PlanoPrevGlobal, PatroGlobal, PlanoPadrao: integer; ContaPadrao: string): boolean;

    property CdsDocumentos: TCMClientDataSet read FCdsDocumentos write FCdsDocumentos;
    property ObrigaAbc: boolean read FObrigaAbc write FObrigaAbc;
    property ObrigaCRespon: boolean read FObrigaCRespon write FObrigaCRespon;
    property ConsTipoDesemb: boolean read FConsTipoDesemb write FConsTipoDesemb;
    property IdEmpresa: integer read FIdEmpresa write FIdEmpresa;
    property IdModulo: integer read FIdModulo write FIdModulo;
    property IdUsuario: integer read FIdUsuario write FIdUsuario;
    property IdEspAcesso: integer read FIdEspAcesso write FIdEspAcesso;
    property CodTipDoc: integer read FCodTipDoc write FCodTipDoc;
    property CodForma: integer read FCodForma write FCodForma;
    property IdPrograma: integer read FIdPrograma write FIdPrograma;

    property NumDocGerados: string read FNumDocGerados;
    property CodCentroCusto: string read FCodCentroCusto write FCodCentroCusto;
    property CodCentroRespon: string read FCodCentroRespon write FCodCentroRespon;
    property Observacao: string read FObservacao write FObservacao;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlIntegraRH }

constructor TCtrlIntegraRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  OnPergunta := nil; //andre tavares - pendencia 21795 - eveto para fazer a pergunta da reprogramacao de ap

  FCtrlSegregacao := TCtrlSegregacao.Create; //(FIdEmpresa);
  FCtrlDocumento := TCtrlDocumento.Create;

  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FConsTipoDesemb := false;  
end;

destructor TCtrlIntegraRH.Destroy;
begin
  FCtrlSegregacao.Free;
  FCtrlDocumento.Free;
  FCtrlListTerceirosRH.Free;
  inherited;
end;

procedure TCtrlIntegraRH.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlIntegraRH.AfterInitialize;
begin
  inherited;
  FCtrlSegregacao.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true);
  FCtrlSegregacao.GetParams(Sistema.IdEmpresa);  // instanciar as propriedades do objeto
  FCtrlDocumento.InitializeAs(Self);

  FCtrlListTerceirosRH.InitializeAs(Self);
end;

procedure TCtrlIntegraRH.DoChangeDataBase;
begin
  inherited;
  FCtrlDocumento.DataBase := DataBase;
  FCtrlListTerceirosRH.DataBase := DataBase;
end;

function TCtrlIntegraRH.ValidaDadosDoc(var CodCentroRespon: string; TipRecDes: string;
  var UnidNegoc: integer): boolean;
begin
  Result := true;

  MessageInfo := '';
  if (FObrigaAbc) and (UnidNegoc = 0) then
  begin
    MessageInfo := ' - Atividade / Projeto não cadastrada';
    Result := false;
  end;

  if (FObrigaCRespon) and (CodCentroRespon = '') then
  begin
    if (MessageInfo <> '') then
      MessageInfo := MessageInfo + CR_LF;
    MessageInfo := MessageInfo + ' - Centro de Responsabilidade não cadastrado';
    Result := false;
  end;

  if (TipRecDes = '') then
  begin
    if (MessageInfo <> '') then
      MessageInfo := MessageInfo + CR_LF;
    MessageInfo := MessageInfo + ' - Tipo de Recebimento/Desembolso não cadastrado';
    Result := false;
  end;
end;

function TCtrlIntegraRH.GetIdBanco_PortFolha(CodPortForma: integer): integer;
begin
  _Cds.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  PTB.IDBANCO' +CR_LF+
    'FROM' +CR_LF+
    '  BANCOPORTFOLHA BPF, PORTADORFORMA PFR, PORTADORCONTA PTB' +CR_LF+
    'WHERE' +CR_LF+
    IFF(CodPortForma>0,
      '  (BPF.CODPORTFORMA = ' +IntToStr(CodPortForma)+ ') AND',
      '  (BPF.IDBANCO     IS NULL) AND') +CR_LF+
    '  (BPF.CODPORTFORMA = PFR.CODPORTFORMA) AND' +CR_LF+
    '  (PTB.CODPORTADOR  = PFR.CODPORTADOR)');

  Result := _Cds.FieldByName('IDBANCO').asInteger;
end;

function TCtrlIntegraRH.AbrirQueryDocumentos: boolean;
var
  _SQL: TStringList;
begin
  _SQL := TStringList.Create;
  with (_SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  LPAD(''1'',18,''1'') AS PLACONTA,');
    Add('  0 AS UNIDNEGO,');
    Add('  LPAD(''1'',10,''1'') AS CODRESPO,');
    Add('  LPAD(''1'',15,''1'') AS CODTPREC,');
    Add('  0 AS IDFORCLI,');
    Add('  LPAD(''1'',10,''1'') AS CODCUSTO,');
    Add('  0 AS CODDOCUM,');
    Add('  0 AS PLANO,');
    Add('  0 AS CODPORTF,');
    Add('  0 AS PLNCODIG,');
    Add('  0 AS NUMLANCT,');
    Add('  ''1'' AS DEBCRE,');
    Add('  ''1'' AS RECPAG,');
    Add('  0 AS VALOR,');
    Add('  0 AS PORTFORM,');
    Add('  0 AS IDPATRO,');
    Add('  0 AS IDPLANO,');
    Add('  0 AS IDPESSOA');
    Add('FROM');
    Add('  DUAL');
    Add('WHERE');
    Add('  (1 = 2)');
  end;

  try
    FCdsDocumentos.IndexName := '';
    FCdsDocumentos.Data := GetDataPacket(_SQL.Text);
    FCdsDocumentos.AddIndex('OrdemDoc', 'PLACONTA;UNIDNEGO;CODRESPO;CODTPREC;IDFORCLI', []);
    //Helen - SOL Nº149419 KINTANA Nº 1069206
    FCdsDocumentos.AddIndex('OrdemFor', 'PLACONTA;UNIDNEGO;CODRESPO;IDFORCLI', []);
    FCdsDocumentos.IndexName := 'OrdemDoc';
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := 'Ocorreu algum erro ao tentar abrir a tabela temporária' +CR_LF+
        'para os dados dos Documentos.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;
  _SQL.Free;
end;

function TCtrlIntegraRH.SetDadosDocumento(CodDocumento, NumLancto, Plano,
  UnidNegoc, CodPortForma: integer; IdFavorecido: double; PlaConta, CodCentroRespon,
  CodTipRecDes, RecPag, DebCre: string; Valor: double; PortFormaParticip: integer;
  CodCentroCusto: string; IdPessoa: integer; ValorAlt: double; CodAlterador, PatroTmp, PlanoTmp: integer): boolean;
var bValida : Boolean;
begin
  FCodAlterador := CodAlterador;
  FValorAlt := ValorAlt;

  if not(ValidaDadosDoc(CodCentroRespon, CodTipRecDes, UnidNegoc)) then
    Result := false
  else
  begin
    Result := true;
    // Pego a Conta Contábil do Favorecido
    if (PlaConta = '') then
    begin
      _Cds.Data := GetDataPacket(
        'SELECT PLANO, PLACONTACREDITO'+CR_LF+
        'FROM   TIPORECEBDESEMB'+CR_LF+
        'WHERE  (CODTIPRECDES = ' +QuotedStr(CodTipRecDes)+ ') AND'+CR_LF+
        '       (RECPAG       = '+QuotedStr(RecPag)+') AND'+CR_LF+
        '       (IDPESSOA     = ' +IntToStr(FIdEmpresa)+ ')');

      if (Plano = 0) and (_Cds.FieldByName('PLANO').asInteger <> 0) then
        Plano := _Cds.FieldByName('PLANO').asInteger;

      PlaConta := _Cds.FieldByName('PLACONTACREDITO').asString;
      if (PlaConta = '') then
      begin
        _Cds.Data := GetDataPacket(
          'SELECT CONTACFORN, PLANO'+CR_LF+
          'FROM   EMPRESAFORN'+CR_LF+
          'WHERE  (IDPESSOA = ' +IntToStr(FIdEmpresa)+') AND'+CR_LF+
          '       (IDFORCLI = ' +FloatToStr(IdFavorecido)+ ')');
        PlaConta := _Cds.FieldByName('CONTACFORN').asString;

        if (Plano = 0) and (_Cds.FieldByName('PLANO').asInteger <> 0) then
          Plano := _Cds.FieldByName('PLANO').asInteger;
      end;
    end;

    FCdsDocumentos.First;
    while not(FCdsDocumentos.EOF) do
    begin
        //Helen - SOL Nº149419 KINTANA Nº 1069206
        bValida  :=(FCdsDocumentos.FieldByName('CODDOCUM').asInteger = CodDocumento) and
                   (FCdsDocumentos.FieldByName('NUMLANCT').asInteger = NumLancto) and
                   (FCdsDocumentos.FieldByName('UNIDNEGO').asInteger = UnidNegoc) and
                   (FCdsDocumentos.FieldByName('CODRESPO').asString  = CodCentroRespon) and
                   (FCdsDocumentos.FieldByName('CODTPREC').asString  = CodTipRecDes) and
                   (FCdsDocumentos.FieldByName('PLACONTA').asString  = PlaConta) and
                   (FCdsDocumentos.FieldByName('CODPORTF').asInteger = CodPortForma) and
                   (FCdsDocumentos.FieldByName('IDFORCLI').asFloat   = IdFavorecido) and
                   (FCdsDocumentos.FieldByName('PORTFORM').asInteger = PortFormaParticip) and
                   (FCdsDocumentos.FieldByName('CODCUSTO').asString  = CodCentroCusto) and
                   (FCdsDocumentos.FieldByName('IDPATRO').asInteger = PatroTmp) and
                   (FCdsDocumentos.FieldByName('IDPLANO').asInteger = PlanoTmp) and
                   (FCdsDocumentos.FieldByName('IDPESSOA').asInteger = IdPessoa);
      If bValida then
      begin
        FCdsDocumentos.Edit;
        FCdsDocumentos.FieldByName('VALOR').asFloat :=
          FCdsDocumentos.FieldByName('VALOR').asFloat + Valor;
        FCdsDocumentos.Post;
        exit;
      end;
      FCdsDocumentos.Next;
    end;

    FCdsDocumentos.Insert;
    FCdsDocumentos.FieldByName('CODDOCUM').asInteger := CodDocumento;
    FCdsDocumentos.FieldByName('NUMLANCT').asInteger := NumLancto;
    FCdsDocumentos.FieldByName('PLANO').asInteger := Plano;
    FCdsDocumentos.FieldByName('UNIDNEGO').asInteger := UnidNegoc;
    FCdsDocumentos.FieldByName('PLACONTA').asString := PlaConta;
    FCdsDocumentos.FieldByName('CODRESPO').asString := CodCentroRespon;
    FCdsDocumentos.FieldByName('CODTPREC').asString := CodTipRecDes;
    FCdsDocumentos.FieldByName('VALOR').asFloat := Valor;
    FCdsDocumentos.FieldByName('CODPORTF').asInteger := CodPortForma;
    FCdsDocumentos.FieldByName('IDFORCLI').asFloat := IdFavorecido;
    FCdsDocumentos.FieldByName('RECPAG').asString := RecPag;
    FCdsDocumentos.FieldByName('DEBCRE').asString := DebCre;
    FCdsDocumentos.FieldByName('PORTFORM').asInteger := PortFormaParticip;
    FCdsDocumentos.FieldByName('CODCUSTO').asString := CodCentroCusto;
    FCdsDocumentos.FieldByName('IDPATRO').asInteger := PatroTmp;
    FCdsDocumentos.FieldByName('IDPLANO').asInteger := PlanoTmp;
    FCdsDocumentos.FieldByName('IDPESSOA').asInteger := IdPessoa;
    FCdsDocumentos.Post;
  end;
end;

function TCtrlIntegraRH.FinalDocumento(const PlaContaAnt, CentroRespon,
  TipRecDes: string; const UnidNegoc, IdForCli: integer): boolean;
begin
  if (FConsTipoDesemb) then
  begin
    Result :=
      (FCdsDocumentos.FieldByName('IDFORCLI').asInteger <> IdForCli) or
      (FCdsDocumentos.EOF);
  end
  else
  begin
    Result :=
      (FCdsDocumentos.FieldByName('PLACONTA').asString <> PlaContaAnt) or
      (FCdsDocumentos.FieldByName('UNIDNEGO').asInteger <> UnidNegoc) or
      (FCdsDocumentos.FieldByName('CODRESPO').asString <> CentroRespon) or
      (FCdsDocumentos.FieldByName('CODTPREC').asString <> TipRecDes) or
      (FCdsDocumentos.FieldByName('IDFORCLI').asInteger <> IdForCli) or
      (FCdsDocumentos.EOF);
  end;
end;

function TCtrlIntegraRH.GravarDocumentos(CriarDocIndividual: boolean; PlnCodigo,
  CodPortForma: integer; DataEmissao, DataRecebimento: TDate; Rateio, UsaPlanoPatro: boolean;
  PlanoPrevGlobal, PatroGlobal, PlanoPadrao: integer; ContaPadrao: string): boolean;
var
  sCodCentroCusto, sPlaContaAnt, sCentroRespon, sDebCred, sTipRecDes, sContaSegregaCriter,
  sObservacao: string;
  iIdPrograma, iNumOrdem, iUnidNegoc, IdForCli, IdFavorecido, iCodDocumento, iIdSegregaCriter,
  FIdPatro, FIdPlanoPrev, FIdContaBanco, iCodForma: integer;
  rNumDocumento, rValor: real;
  svNum: TBookMark;
  //SOL Nº149419 KINTANA Nº 1069206
  bFezNext : Boolean;

  //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  //iCompromisso       : Integer;
  iIDProgramaOrcamen : integer;
  CdsFDO             : TClientDataSet;
  //
begin
  try
    //Helen - SOL Nº149419 KINTANA Nº 1069206
    If FConsTipoDesemb then
      FCdsDocumentos.IndexName := 'OrdemFor'
    else
      FCdsDocumentos.IndexName := 'OrdemDoc';

    if (FCdsDocumentos.IsEmpty) then
      raise Exception.Create('Não há documentos CAP a serem gerados.');

    FCtrlDocumento.IdEspAcesso := FIdEspAcesso;
    FCtrlDocumento.IdUsuario := FIdUsuario;
    FCtrlDocumento.IdModulo := FIdModulo;
    FCtrlDocumento.UsaPlanoPatro := UsaPlanoPatro;

    sCodCentroCusto := CodCentroCusto;

    sObservacao := Observacao;
    iIdPrograma := IdPrograma;
    iCodForma   := CodForma;

    FNumDocGerados := '';
    sDebCred := FCtrlDocumento.GetDebCre(FCodTipDoc);

    if assigned(OnPergunta) then //andre tavares - pendencia 21795 - 22/02/2007
      FCtrlDocumento.OnPergunta := OnPergunta;

    // Felipe A. Santos SOL 218272 KTN 2049247
    //FCdsDocumentos.IndexFieldNames := 'VALOR'; // Felipe A. Santos SOL 188078 kintana 1772223
    // Felipe A. Santos SOL 218272 KTN 2049247 - fim

    FCdsDocumentos.First;
    // Alterado por Helen Bianchi em 17/12/2010 SOL Nº149419 KINTANA Nº 1069206
    // Quando o Centro de Custo estiver em branco e ocorrer o rateio por
    // Centro de Custo, é necessário informar o código para a Variavel
    // sCodCentroCusto, para evitar erros na geração dos documentos
    If Rateio and (sCodCentroCusto = '') then
      sCodCentroCusto := FCdsDocumentos.FieldByName('CodCusto').asString;

    while not(FCdsDocumentos.EOF) do
    begin
      FCtrlDocumento.Prepare(OpDocumento, odlEfetivo);
      iCodDocumento := FCtrlDocumento.GetSequenceDocumento;

      // Indica Favorecido da seguinte forma:
      // 1. Será o Favorecido se este for indicado na parametrização do Documento;
      // 2. Será a própria Pessoa para o caso em que o Usuário solicitar a criação
      //    de Documentos Individuais;
      // 3. Será o Banco em que o Portador Forma possui Conta.
      if (FCdsDocumentos.FieldByName('IDFORCLI').asInteger > 0) then
        IdFavorecido := FCdsDocumentos.FieldByName('IDFORCLI').asInteger
      else
      if (CriarDocIndividual) then
        IdFavorecido := FCdsDocumentos.FieldByName('IDPESSOA').asInteger
      else
        IdFavorecido := GetIdBanco_PortFolha(CodPortForma);

      if (IdFavorecido = 0) then
      begin
        FCdsDocumentos.Next;
        continue;
      end;

      // Gerar o Número do Documento sequencial
      iNumOrdem := 1;
      rNumDocumento := StrToFloat(IntToStr(IdFavorecido) + IntToStr(iNumOrdem));
      while (FCtrlDocumento.ExisteNumDoc(FCdsDocumentos.FieldByName('RECPAG').asString,
             IdFavorecido, FIdEmpresa, rNumDocumento, '')) do
      begin
        Inc(iNumOrdem);
        rNumDocumento := StrToFloat(IntToStr(IdFavorecido) + IntToStr(iNumOrdem));
      end;

      // Inserir Fornecedor se este não existir e for para integrar com o CAP
      if (FCdsDocumentos.FieldByName('RECPAG').asString = 'P') then
      begin
        _Cds.Data := GetDataPacket('SELECT IDPESSOA FROM FORNSERV WHERE IDPESSOA = '+ IntToStr(IdFavorecido));
        if (_Cds.IsEmpty) then
          FCtrlDocumento.ForCli.Inserir(
            IdFavorecido, // IdPessoa
            FIdEmpresa, // IdEmpresa
            0,          // SubConta
            IFF(FCdsDocumentos.FieldByName('PLANO').asInteger=0,PlanoPadrao,FCdsDocumentos.FieldByName('PLANO').asInteger),
            0,          // Ramo
            FCdsDocumentos.FieldByName('CODCUSTO').asString,
            '',         // sContacadianto
            IFF(FCdsDocumentos.FieldByName('PLACONTA').asString='',ContaPadrao,FCdsDocumentos.FieldByName('PLACONTA').asString),
            '',         // sContaDespesa,
            tfcFornecedor);
      end
      else
      begin
        _Cds.Data := GetDataPacket('SELECT IDPESSOA FROM CLIENTEPESS WHERE IDPESSOA = '+ IntToStr(IdFavorecido));
        if (_Cds.IsEmpty) then
          FCtrlDocumento.ForCli.Inserir(
            IdFavorecido, // IdPessoa
            FIdEmpresa, // IdEmpresa
            0,          // SubConta
            IFF(FCdsDocumentos.FieldByName('PLANO').asInteger=0,PlanoPadrao,FCdsDocumentos.FieldByName('PLANO').asInteger),
            0,          // Ramo
            FCdsDocumentos.FieldByName('CODCUSTO').asString,
            '',         // sContacadianto
            IFF(FCdsDocumentos.FieldByName('PLACONTA').asString='',ContaPadrao,FCdsDocumentos.FieldByName('PLACONTA').asString),
            '',         // sContaDespesa,
            tfcCliente);
      end;

      FIdPatro := IFF(FCdsDocumentos.FieldByName('IDPLANO').asInteger=0,
        FCtrlListTerceirosRH.GetIdPatro(Sistema.IdEmpresa), FCdsDocumentos.FieldByName('IDPATRO').asInteger);
      FIdPlanoPrev := IFF(FCdsDocumentos.FieldByName('IDPLANO').asInteger=0,
        FCtrlListTerceirosRH.GetIdPlanoPrev(Sistema.IdEmpresa), FCdsDocumentos.FieldByName('IDPLANO').asInteger);
      // Procurar o critério para segregação na conta débito
      //    Se achou utilizar este critério também para o crédito
      //    Senão Procurar o critério para segregação na conta crédito
      //       Se achou utilizar este critério também para o débito
      //       Senão passar -1 tanto para o débito quanto para o crédito
      iIdSegregaCriter := FCtrlSegregacao.RetornaSegregaCriter(IFF(FCdsDocumentos.FieldByName('PLANO').asInteger=0,PlanoPadrao,FCdsDocumentos.FieldByName('PLANO').asInteger),  // plano contábil ativo
         FIdPlanoPrev,          // plano previdenciário do lançamento contábil
         FIdPatro,              // patrocinadora do lançamento contábil
         IFF(FCdsDocumentos.FieldByName('PLACONTA').asString='',ContaPadrao,FCdsDocumentos.FieldByName('PLACONTA').asString), // conta contábil do lançamento
         sContaSegregaCriter);  // retorna em que conta contábil foi encontrado o critério

      _Cds.Data := GetDataPacket('SELECT IDCBANCARIA FROM CONTABANCARIA '+
        'WHERE FLGCONTAPREF = 1 AND IDPESSOA = '+ IntToStr(IdFavorecido));
      FIdContaBanco := _Cds.FieldByName('IDCBANCARIA').asInteger;

      // Inserir Documento
      FCtrlDocumento.SetValues(iCodDocumento, rNumDocumento, '', '0',
        FCdsDocumentos.FieldByName('RECPAG').asString, '2', '', '',
        IFF(FCdsDocumentos.FieldByName('PLACONTA').asString='',ContaPadrao,FCdsDocumentos.FieldByName('PLACONTA').asString),
        sCodCentroCusto, '', '', '', '', '', '', '', sObservacao,
        DataRecebimento, DataEmissao, DataRecebimento, 0, 0, 0, 0, 0, 0, 0, 0,
        FCodTipDoc, FIdEmpresa, FIdModulo, IdFavorecido, 0, FIdContaBanco, // Id da Conta Bancária,
        0,
        IFF(FCdsDocumentos.FieldByName('PLANO').asInteger=0,PlanoPadrao,FCdsDocumentos.FieldByName('PLANO').asInteger),
        0, 0, 0, 0, 0, FIdUsuario, 0, 0, 0, 0,
        CodPortForma, // Portador Forma
        0, 0, iCodForma, iIdSegregaCriter);



      rValor := 0;
      sPlaContaAnt := FCdsDocumentos.FieldByName('PLACONTA').asString;
      iUnidNegoc := FCdsDocumentos.FieldByName('UNIDNEGO').asInteger;
      sCentroRespon := IFF(CodCentroRespon<>'',CodCentroRespon,FCdsDocumentos.FieldByName('CODRESPO').asString);
      sTipRecDes := FCdsDocumentos.FieldByName('CODTPREC').asString;
      IdForCli := FCdsDocumentos.FieldByName('IDFORCLI').asInteger;

      // Apurar o Valor do Documento atual
      svNum := FCdsDocumentos.GetBookmark;
      repeat
        rValor := rValor + FCdsDocumentos.FieldByName('VALOR').asFloat;
        FCdsDocumentos.Next;
      until FinalDocumento(sPlaContaAnt, sCentroRespon, sTipRecDes, iUnidNegoc, IdForCli);
      FCdsDocumentos.GotoBookmark(svNum);

      // Criar um Lançamento para o Documento atual
      FCtrlDocumento.LanctoDocum.SetValues(DataEmissao, iCodDocumento, 0, 0, 0, rValor, 0,
        PlnCodigo, 0, FIdUsuario, FIdEmpresa, 0, 0, FCodTipDoc, 0, 0, '2', '', '', '', '', '',
        '', '', sDebCred, FIdModulo, 0, UsaPlanoPatro, (FIdModulo = 417), // Contabiliza só no ModAuto
        FCdsDocumentos.FieldByName('CODPORTF').asInteger);


      // Lançar as linhas de rateio para o Documento atual
      repeat
        sCodCentroCusto := FCdsDocumentos.FieldByName('CODCUSTO').asString;
        sPlaContaAnt := FCdsDocumentos.FieldByName('PLACONTA').asString;
        iUnidNegoc := FCdsDocumentos.FieldByName('UNIDNEGO').asInteger;
        sCentroRespon := IFF(CodCentroRespon<>'',CodCentroRespon,FCdsDocumentos.FieldByName('CODRESPO').asString);
        sTipRecDes := FCdsDocumentos.FieldByName('CODTPREC').asString;
        IdForCli := FCdsDocumentos.FieldByName('IDFORCLI').asInteger;
        rValor := 0;
        FIdPatro := IFF(FCdsDocumentos.FieldByName('IDPLANO').asInteger=0,
          FCtrlListTerceirosRH.GetIdPatro(Sistema.IdEmpresa), FCdsDocumentos.FieldByName('IDPATRO').asInteger);
        FIdPlanoPrev := IFF(FCdsDocumentos.FieldByName('IDPLANO').asInteger=0,
          FCtrlListTerceirosRH.GetIdPlanoPrev(Sistema.IdEmpresa), FCdsDocumentos.FieldByName('IDPLANO').asInteger);

        if (Rateio) and (UsaPlanoPatro) then
        begin
          //Marcio Sanches Spinosa SOL 212951 Kintana 2044356 - Inicio
          if {(iIdPrograma = 0) or}
          (rateio) then
          //Marcio Sanches Spinosa SOL 212951 Kintana 2044356 - Fim

            //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662 | Inclusão do Parametro IDProgramaOrcamen
            iIdPrograma := FCtrlListTerceirosRH.GetIdProgramaCCusto(sCodCentroCusto, FIdEmpresa, iIDProgramaOrcamen);

          if (iIdPrograma = 0) then
            iIdPrograma := -1;
        end
        else
          iIdPrograma := -1;

        // Somar os Valores do Centro de Custo caso seja para Ratear os valores se não,
        // somar todos os valores do Documento
        bFezNext := False;
        if (Rateio) then
        begin
          while (sPlaContaAnt    = FCdsDocumentos.FieldByName('PLACONTA').asString) and
                (iUnidNegoc      = FCdsDocumentos.FieldByName('UNIDNEGO').asInteger) and
                (sCentroRespon   = FCdsDocumentos.FieldByName('CODRESPO').asString) and
                (sTipRecDes      = FCdsDocumentos.FieldByName('CODTPREC').asString) and
                (IdForCli        = FCdsDocumentos.FieldByName('IDFORCLI').asInteger) and
                (sCodCentroCusto = FCdsDocumentos.FieldByName('CODCUSTO').asString) and
                (not FCdsDocumentos.EOF) do
          begin
            rValor := rValor + FCdsDocumentos.FieldByName('VALOR').asFloat;
            FCdsDocumentos.Next;
            bFezNext := True;
          end;
        end
        else
        begin
          while (sPlaContaAnt  = FCdsDocumentos.FieldByName('PLACONTA').asString) and
                (iUnidNegoc    = FCdsDocumentos.FieldByName('UNIDNEGO').asInteger) and
                (sCentroRespon = FCdsDocumentos.FieldByName('CODRESPO').asString) and
                (sTipRecDes    = FCdsDocumentos.FieldByName('CODTPREC').asString) and
                (IdForCli      = FCdsDocumentos.FieldByName('IDFORCLI').asInteger) and
                (not FCdsDocumentos.EOF) do
          begin
            rValor := rValor + FCdsDocumentos.FieldByName('VALOR').asFloat;
            FCdsDocumentos.Next;
            bFezNext := True;
          end;
        end;


        //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
        //validar se faz integração o tipo de desemboloso e o parâmetro
        if (FCdsDocumentos.FieldByName('RECPAG').asString = 'P') And
           (TRIM(sCodCentroCusto) <> '')                         Then
           FCtrlDocumento.Orcamento.FDO_SetCDS(IdForCli,
                                               DataEmissao,
                                               sTipRecDes,
                                               sCodCentroCusto,
                                               IFF(iUnidNegoc=0, -1, iUnidNegoc),
                                               FIdPlanoPrev,
                                               FIdPatro,
                                               iIdPrograma,
                                               rValor,
                                               0,
                                               iIDProgramaOrcamen//,
                                               //iCompromisso
                                               );
        //Fim    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

        // Criar o Rateio o Documento atual

        FCtrlDocumento.RateioDocum.SetValues(rValor,
        0,
        0,
        0,
        FIdEmpresa,
        iCodDocumento,
          IFF(iUnidNegoc=0, -1, iUnidNegoc),
          0,
          FIdUsuario,
          0,
          IFF(FCdsDocumentos.FieldByName('PLANO').asInteger=0,PlanoPadrao,FCdsDocumentos.FieldByName('PLANO').asInteger),
          IFF(UsaPlanoPatro, FIdPlanoPrev, -1), IFF(UsaPlanoPatro, FIdPatro, -1),
          iIdPrograma, 0, FIdEmpresa, sTipRecDes,
          FCdsDocumentos.FieldByName('RECPAG').asString,
          IFF(sCentroRespon='', CODCENTRORESPON_PADRAO, sCentroRespon),
          IFF(Rateio, sCodCentroCusto, ''), '',
          //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
          True, 0, 0//, iCompromisso
          //Usa-se o mesmo DataSet pois foi montado com todas as informações
          FCtrlDocumento.Orcamento.CdsFDORateio,
          FCtrlDocumento.Orcamento.CdsFDORateio
          //Fim - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
          );
      until FinalDocumento(sPlaContaAnt, sCentroRespon, sTipRecDes, iUnidNegoc, IdForCli);

      // Efetivar inserção do Documento
      if (FCtrlDocumento.Insert) then
      begin
        if (FNumDocGerados = '') then
          FNumDocGerados := FloatToSTr(rNumDocumento)
        else
          FNumDocGerados := FNumDocGerados +', '+ FloatToSTr(rNumDocumento);
      end
      else
        raise Exception.Create(FCtrlDocumento.MessageInfo);

      // Criar um Alterador para o Documento atual
      if FValorAlt > 0 then
      begin
        FCtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
        FCtrlDocumento.LanctoDocum.SetValues(DataEmissao, iCodDocumento, 0, 0, 0, FValorAlt, 0,
          PlnCodigo, 0, FIdUsuario, FIdEmpresa, 0, 0, 0, 0, FCodAlterador, '4', '', '', '', '', '',
          '', '', sDebCred, FIdModulo, 0, UsaPlanoPatro, false,
          FCdsDocumentos.FieldByName('CODPORTF').asInteger);
        if not (FCtrlDocumento.Insert) then
          raise Exception.Create(FCtrlDocumento.MessageInfo);
      end;
      If not bFezNext then //SOL Nº149419 KINTANA Nº 1069206
        FCdsDocumentos.Next;
    end;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

end.
