{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/03/2003                                 }
{                                                       }
{*******************************************************}
{$I VERSAO_PADRAO.INC}

unit uCtrlIntegraCAPCAR_RH;

interface

uses Classes, SysUtils, Controls, Db, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH, uCtrlDocumento, uCtrlListTerceirosRH;

type
  TCtrlIntegraCAPCAR_RH = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FCtrlDocumento: TCtrlDocumento;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;

    FCdsDocumentos: TCMClientDataSet;
    FCdsParamCAP: TCMClientDataSet;

    FAgruparRateio: boolean;
    FConsTipoDesemb: boolean;
    FObrigaAbc: boolean;
    FObrigaCRespon: boolean;

    FIdHotel: double;
    FIdEmpresa: integer;
    FIdModulo: integer;
    FIdEspAcesso: integer;
    FIdUsuario: integer;
    FCodTipDoc: integer;

    FNumDocGerados: string;

    FContaPadrao_Favorecido: string; // Conta Contábil usada para criar um Favorecido
    FIdPlano_ContaPadrao_Favorecido: integer; // IdPlano Conta Contábil usada para criar um Favorecido

    function ValidaDadosDoc(const CodCentroRespon, TipRecDes: string;
      const UnidNegoc: integer): boolean;
    function FinalDocumento(const IdFavorecido: integer;
      const CodTipRecDes: string): boolean;
    function FinalDocumentoRateio(const IdFavorecido, UnidNegoc: integer;
      const CodTipRecDes, CodCentroCusto: string): boolean;

    function GetIdBanco_PortFolha(const CodPortForma: integer): integer;
    function GetIdFavorecido: integer;
    function GetNumDocSeq(const IdFavorecido: integer): double;
    function GetValorDocumentoPrincipal(const IdFavorecido: integer): double;
    function GetValorDocumentoRateio(const IdFavorecido, UnidNegoc: integer;
      const CodTipRecDes, CodCentroCusto: string): double;
    function GetNomeFavorecido(const IdFavorecido: integer): string;
    function GetUsaContaContabil(const RecPag: string): boolean;

    procedure CriarRateioDocumento(const UsaPlanoPatro: boolean;
      const PlanoPrevGlobal, PatroGlobal: integer; const IdFavorecido: integer);
  public
    constructor Create(const IdHotel: double;
      const UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function AbrirQueryDocumentos: boolean;

    function SetDadosDocumento(const IdFavorecido: integer; const CodPortForma: integer;
      const RecPag, CodTipRecDes: string; const UnidNegoc: integer; const CodCentroCusto,
      CodCentroRespon: string; const Valor: double): boolean;

    function GravarDocumentos(const DataEmissao, DataPagamento: TDate;
      const AgruparRateio, UsaPlanoPatro: boolean; const PlanoPrevGlobal,
      PatroGlobal: integer; const ContaPadrao_Favorecido: string = '';
      const IdPlano_ContaPadrao_Favorecido: integer = 0): boolean;

    property CdsDocumentos: TCMClientDataSet read FCdsDocumentos write FCdsDocumentos;
    property ConsTipoDesemb: boolean read FConsTipoDesemb write FConsTipoDesemb;
    property ObrigaAbc: boolean read FObrigaAbc write FObrigaAbc;
    property ObrigaCRespon: boolean read FObrigaCRespon write FObrigaCRespon;
    property IdEmpresa: integer read FIdEmpresa write FIdEmpresa;
    property IdModulo: integer read FIdModulo write FIdModulo;
    property IdUsuario: integer read FIdUsuario write FIdUsuario;
    property IdEspAcesso: integer read FIdEspAcesso write FIdEspAcesso;
    property CodTipDoc: integer read FCodTipDoc write FCodTipDoc;
    property NumDocGerados: string read FNumDocGerados;
  end;

implementation

uses  uCMTypes, uCtrlFuncoesRH, uCmCustomCdbObject;
//*Variants,
const
  IDPROGRAMA_NULO = -1;
  PLANOPREVGLOBAL_NULO = -1;
  PATROGLOBAL_NULO = -1;

  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_ERRO_ABRE_TEMP = 'Ocorreu um erro ao tentar abrir a tabela temporária:1'+
    'para os dados dos Documentos.';
  MSG_LISTA_AP = 'Nº: :1Favorecido: :2Valor: :3';

{ TCtrlIntegraCAPCAR_RH }

constructor TCtrlIntegraCAPCAR_RH.Create(const IdHotel: double;
  const UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;

  FCtrlDocumento := TCtrlDocumento.Create;
  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCdsParamCAP := TCMClientDataSet.Create(nil);

  FConsTipoDesemb := false;
  FIdHotel := IdHotel;
  //*{$IFDEF PADRAO_7_09_00}
 //* FCtrlDocumento.IdHotel := Trunc(FIdHotel);
  //*{$ENDIF}
end;

destructor TCtrlIntegraCAPCAR_RH.Destroy;
begin
  FCdsParamCAP.Free;
  FCtrlDocumento.Free;
  FCtrlListTerceirosRH.Free;
  inherited;
end;

procedure TCtrlIntegraCAPCAR_RH.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlIntegraCAPCAR_RH.AfterInitialize;
begin
  inherited;
  FCtrlDocumento.InitializeAs(Self);
  FCtrlListTerceirosRH.InitializeAs(Self);
end;

procedure TCtrlIntegraCAPCAR_RH.DoChangeDataBase;
begin
  inherited;
  //*FCtrlDocumento.DataBaseName := DataBaseName;
//*  FCtrlListTerceirosRH.DataBaseName := DataBaseName;
end;

function TCtrlIntegraCAPCAR_RH.ValidaDadosDoc(const CodCentroRespon, TipRecDes: string;
  const UnidNegoc: integer): boolean;
begin
  Result := false;

  if (TipRecDes = '') then
  begin
    MessageInfo := (' - A indicação do Tipo de Desembolso é obrigatória');
    exit;
  end
  else
    MessageInfo := '';

  if (FObrigaAbc) and (UnidNegoc = 0) then
  begin
    if (MessageInfo <> '') then
      MessageInfo := MessageInfo + CR_LF;
    MessageInfo := MessageInfo +
      (' - A indicação da Atividade/Projeto é obrigatória');
    exit;
  end;

  if (FObrigaCRespon) and (CodCentroRespon = '') then
  begin
    if (MessageInfo <> '') then
      MessageInfo := MessageInfo + CR_LF;
    MessageInfo := MessageInfo +
      (' - A indicação do Centro de Responsabilidade é obrigatória');
    exit;
  end;

  Result := true;
end;

function TCtrlIntegraCAPCAR_RH.FinalDocumento(
  const IdFavorecido: integer; const CodTipRecDes: string): boolean;
begin
  if (FConsTipoDesemb) then
  begin
    Result :=
      (FCdsDocumentos.FieldByName('IDFAVORECIDO').asInteger <> IdFavorecido) or
      (FCdsDocumentos.EOF);
  end
  else
  begin
    Result :=
      (FCdsDocumentos.FieldByName('IDFAVORECIDO').asInteger <> IdFavorecido) or
      (FCdsDocumentos.FieldByName('CODTIPRECDES').asString  <> CodTipRecDes) or
      (FCdsDocumentos.EOF);
  end;
end;

function TCtrlIntegraCAPCAR_RH.FinalDocumentoRateio(const IdFavorecido, UnidNegoc: integer;
  const CodTipRecDes, CodCentroCusto: string): boolean;
begin
  if (FAgruparRateio) then
    Result := // Agrupar por Tipo de Desembolso X Centro de Custo X Atividade/Projeto
      (FCdsDocumentos.FieldByName('IDFAVORECIDO').asInteger  <> IdFavorecido) or
      (FCdsDocumentos.FieldByName('CODTIPRECDES').asString   <> CodTipRecDes) or
      (FCdsDocumentos.FieldByName('CODCENTROCUSTO').asString <> CodCentroCusto) or
      (FCdsDocumentos.FieldByName('UNIDNEGOC').asInteger     <> UnidNegoc) or
      (FCdsDocumentos.EOF)
  else
    Result :=
      (FCdsDocumentos.FieldByName('IDFAVORECIDO').asInteger <> IdFavorecido) or
      (FCdsDocumentos.FieldByName('CODTIPRECDES').asString  <> CodTipRecDes) or
      (FCdsDocumentos.EOF);
end;

function TCtrlIntegraCAPCAR_RH.AbrirQueryDocumentos: boolean;
var
  _SQL: TStringList;
begin
  _SQL := TStringList.Create;
  try
    with (_SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  0 AS IDFAVORECIDO,');
      Add('  LPAD(''1'',18,''1'') AS CONTACONTABIL,');
      Add('  0 AS PLANO,');
      Add('  0 AS SUBCONTA,');
      Add('  LPAD(''1'',15,''1'') AS CODTIPRECDES,');
      Add('  0 AS UNIDNEGOC,');
      Add('  LPAD(''1'',10,''1'') AS CODCENTROCUSTO,');
      Add('  LPAD(''1'',10,''1'') AS CODCENTRORESPON,');
      Add('  0 AS CODPORTFORMA,');
      Add('  ''1'' AS RECPAG,');
      Add('  0.00 AS VALOR');
      Add('FROM');
      Add('  DUAL');
      Add('WHERE');
      Add('  (1 = 2)');
    end;

    try
      FCdsDocumentos.IndexName := '';
      FCdsDocumentos.Close;
      FCdsDocumentos.Data := GetDataPacket(_SQL.Text);
      FCdsDocumentos.AddIndex('OrdemDoc',
        'IDFAVORECIDO;CODTIPRECDES;CODCENTRORESPON;UNIDNEGOC;CODCENTROCUSTO', []);
      FCdsDocumentos.IndexName := 'OrdemDoc';
      Result := true;
    except
      on E: Exception do
      begin
        Result := false;
        FTipoRetorno := RETORNO_ERRO;
        MessageInfo :=
          CMTranslateMsg(MSG_ERRO_ABRE_TEMP, [CR_LF]) +CR_LF+
          ('Mensagem:') +CR_LF+ E.Message;
      end;
    end;
  finally
    _SQL.Free;
  end;
end;

function TCtrlIntegraCAPCAR_RH.GetIdBanco_PortFolha(const CodPortForma: integer): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  PC.IDBANCO'+CR_LF+
      'FROM'+CR_LF+
      '  BANCOPORTFOLHA BPF, PORTADORFORMA PF, PORTADORCONTA PC'+CR_LF+
      'WHERE'+CR_LF+
      IFF(CodPortForma>0,
        '  (BPF.CODPORTFORMA = ' +IntToStr(CodPortForma)+ ') AND',
        '  (BPF.IDBANCO     IS NULL) AND')+CR_LF+
      '  (BPF.IDEMPRESA    = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
      '  (BPF.CODPORTFORMA = PF.CODPORTFORMA) AND'+CR_LF+
      '  (PC.CODPORTADOR   = PF.CODPORTADOR)');

    Result := _CdsAux.FieldByName('IDBANCO').asInteger;
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlIntegraCAPCAR_RH.GetIdFavorecido: integer;
var
  bOk: boolean;
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    // Indica Favorecido da seguinte forma:
    // 1. Será o Favorecido indicado
    // 2. Será o Banco em que o Portador Forma está configurado
    if (FCdsDocumentos.FieldByName('IDFAVORECIDO').asInteger > 0) then
      Result := FCdsDocumentos.FieldByName('IDFAVORECIDO').asInteger
    else
      Result := GetIdBanco_PortFolha(FCdsDocumentos.FieldByName('CODPORTFORMA').asInteger);

    // Inserir Fornecedor se este não existir
    _CdsAux.Data := GetDataPacket(
      'SELECT IDPESSOA FROM FORNSERV WHERE IDPESSOA = '+ IntToStr(Result));
    if (_CdsAux.IsEmpty) then
    begin
      try
        bOk := FCtrlDocumento.ForCli.Inserir(
          Result, // IdPessoa do Favorecido
          FIdEmpresa, // IdEmpresa
          0, // SubConta
          FIdPlano_ContaPadrao_Favorecido, // Plano
          0, // Ramo
          FCdsDocumentos.FieldByName('CODCENTROCUSTO').asString,
          '', // Conta C. Adiantamento
          FContaPadrao_Favorecido, // Conta Contábil
          '', // Conta C. Despesa
          tfcFornecedor);

        if not(bOk) then
          FCtrlDocumento.MessageInfo
      except
        on E: Exception do
        begin
          bOk := false;
          MessageInfo := E.Message;
        end;
      end;

      if not(bOk) then
      begin
        FTipoRetorno := RETORNO_AVISO;
        Result := 0;
        raise Exception.Create(
          ('Não foi possível incluir o Favorecido abaixo:') +CR_LF+
          GetNomeFavorecido(FCdsDocumentos.FieldByName('IDFAVORECIDO').asInteger) +CR_LF+CR_LF+
          ('Motivo:') +CR_LF+ MessageInfo);
      end;
    end;
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlIntegraCAPCAR_RH.GetNumDocSeq(const IdFavorecido: integer): double;
var
  iNumOrdem: integer;
begin
  // Procurar o Número do Documento para o Favorecido que ainda não foi usado.
  // Este Número é composto do ID do Favorecido concatenado com um número sequencial.
  iNumOrdem := 1;
  repeat
    Result := StrToFloat(IntToStr(IdFavorecido) + IntToStr(iNumOrdem));
    Inc(iNumOrdem);
  until not(FCtrlDocumento.ExisteNumDoc(FCdsDocumentos.FieldByName('RECPAG').asString,
            IdFavorecido, FIdEmpresa, Result, ''));
end;

function TCtrlIntegraCAPCAR_RH.GetValorDocumentoPrincipal(const IdFavorecido: integer): double;
var
  svNum: TBookMark;
  sCodTipRecDes: string;
begin
  svNum := FCdsDocumentos.GetBookmark;
  sCodTipRecDes := FCdsDocumentos.FieldByName('CODTIPRECDES').asString;

  Result := 0;
  repeat
    Result := Result + FCdsDocumentos.FieldByName('VALOR').asFloat;
    FCdsDocumentos.Next;
  until (FinalDocumento(IdFavorecido, sCodTipRecDes));

  FCdsDocumentos.GotoBookmark(svNum);
  FCdsDocumentos.FreeBookmark(svNum);
end;

function TCtrlIntegraCAPCAR_RH.GetValorDocumentoRateio(const IdFavorecido, UnidNegoc: integer;
  const CodTipRecDes, CodCentroCusto: string): double;
begin
  Result := 0;
  repeat
    Result := Result + FCdsDocumentos.FieldByName('VALOR').asFloat;
    FCdsDocumentos.Next;
  until (FinalDocumentoRateio(IdFavorecido, UnidNegoc, CodTipRecDes, CodCentroCusto));
end;

function TCtrlIntegraCAPCAR_RH.GetNomeFavorecido(const IdFavorecido: integer): string;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT RAZAOSOCIAL FROM PESSOA WHERE IDPESSOA = ' + IntToStr(IdFavorecido));
    Result := _CdsAux.FieldByName('RAZAOSOCIAL').asString;
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlIntegraCAPCAR_RH.GetUsaContaContabil(const RecPag: string): boolean;
begin
  if not(FCdsParamCAP.Active) then
    FCdsParamCAP.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  RECPAG, INTEGRACONTAB' +CR_LF+
      'FROM' +CR_LF+
      '  PARAMCAP' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSOA = ' +IntToStr(FIdEmpresa)+ ')');

  if (FCdsParamCAP.Locate('RECPAG', UpperCase(RecPag), [])) then
    Result := (FCdsParamCAP.FieldByName('INTEGRACONTAB').asString = 'S')
  else
    Result := false;
end;

function TCtrlIntegraCAPCAR_RH.SetDadosDocumento(const IdFavorecido: integer;
  const CodPortForma: integer; const RecPag, CodTipRecDes: string; const UnidNegoc: integer;
  const CodCentroCusto, CodCentroRespon: string; const Valor: double): boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  Result := false;
  if not(ValidaDadosDoc(CodCentroRespon, CodTipRecDes, UnidNegoc)) then
  begin
    FTipoRetorno := RETORNO_AVISO;
    exit;
  end;

  try
    if (FCdsDocumentos.Locate(
        'IDFAVORECIDO;CODTIPRECDES;UNIDNEGOC;'+
        'CODCENTROCUSTO;CODCENTRORESPON;CODPORTFORMA;RECPAG',
        VarArrayOf([IdFavorecido, CodTipRecDes, UnidNegoc,
                    CodCentroCusto, CodCentroRespon, CodPortForma, RecPag]), [])) then
    begin
      FCdsDocumentos.Edit;
      FCdsDocumentos.FieldByName('VALOR').asFloat :=
        FCdsDocumentos.FieldByName('VALOR').asFloat + Valor;
      FCdsDocumentos.Post;
    end
    else
    begin
      _CdsAux := TCMClientDataSet.Create(nil);
      try
        _CdsAux.Data := GetDataPacket(
          'SELECT CONTACFORN, PLANO, CODSUBCONTA' +CR_LF+
          'FROM   EMPRESAFORN' +CR_LF+
          'WHERE  (IDFORCLI = ' +FloatToStr(IdFavorecido)+ ') AND'+ CR_LF+
          '       (IDPESSOA = ' +IntToStr(FIdEmpresa)+ ')');

        FCdsDocumentos.Insert;
        FCdsDocumentos.FieldByName('IDFAVORECIDO').asInteger := IdFavorecido;

        if not(_CdsAux.IsEmpty) then
        begin
          FCdsDocumentos.FieldByName('CONTACONTABIL').asString := _CdsAux.FieldByName('CONTACFORN').asString;
          FCdsDocumentos.FieldByName('PLANO').asInteger := _CdsAux.FieldByName('PLANO').asInteger;
          FCdsDocumentos.FieldByName('SUBCONTA').asInteger := _CdsAux.FieldByName('CODSUBCONTA').asInteger;
        end;

        FCdsDocumentos.FieldByName('CODTIPRECDES').asString := CodTipRecDes;
        FCdsDocumentos.FieldByName('UNIDNEGOC').asInteger := UnidNegoc;
        FCdsDocumentos.FieldByName('CODCENTROCUSTO').asString := CodCentroCusto;
        FCdsDocumentos.FieldByName('CODCENTRORESPON').asString := CodCentroRespon;
        FCdsDocumentos.FieldByName('CODPORTFORMA').asInteger := CodPortForma;
        FCdsDocumentos.FieldByName('RECPAG').asString := RecPag;
        FCdsDocumentos.FieldByName('VALOR').asFloat := Valor;
        FCdsDocumentos.Post;
      finally
        _CdsAux.Free;
      end;
    end;
    Result := true;
  except
    on E: Exception do
    begin
      FTipoRetorno := RETORNO_ERRO;
      MessageInfo :=
        ('Ocorreu um erro ao tentar inserir os Documentos') +CR_LF+
        MSG_ERRO+ E.Message;
    end;
  end;
end;

procedure TCtrlIntegraCAPCAR_RH.CriarRateioDocumento(const UsaPlanoPatro: boolean;
  const PlanoPrevGlobal, PatroGlobal: integer; const IdFavorecido: integer);
var
  sCodCentroCusto: string;
  sCodTipRecDes: string;
  sCodCentroRespon: string;
  iIdPrograma: integer;
  iUnidNegoc: integer;
  dValor: double;
begin
  repeat
    sCodCentroCusto := FCdsDocumentos.FieldByName('CODCENTROCUSTO').asString;
    sCodTipRecDes := FCdsDocumentos.FieldByName('CODTIPRECDES').asString;
    sCodCentroRespon := FCdsDocumentos.FieldByName('CODCENTRORESPON').asString;

    if (FAgruparRateio) and (UsaPlanoPatro) then
    begin
      iIdPrograma := FCtrlListTerceirosRH.GetIdProgramaCCusto(sCodCentroCusto, FIdEmpresa);
      if (iIdPrograma = 0) then
        iIdPrograma := IDPROGRAMA_NULO;
    end
    else
      iIdPrograma := IDPROGRAMA_NULO;

    if ((FAgruparRateio) or (FConsTipoDesemb)) and
       (FCdsDocumentos.FieldByName('UNIDNEGOC').asInteger > 0) then
      iUnidNegoc := FCdsDocumentos.FieldByName('UNIDNEGOC').asInteger
    else
      iUnidNegoc := ATIVPROJETO_PADRAO;  

    // Somar os Valores do Centro de Custo caso seja para Ratear os valores se não,
    // somar todos os valores do Documento
    dValor := GetValorDocumentoRateio(
      FCdsDocumentos.FieldByName('IDFAVORECIDO').asInteger, iUnidNegoc, sCodTipRecDes,
      FCdsDocumentos.FieldByName('CODCENTROCUSTO').asString);

    // Criar o Rateio o Documento atual
   //* FCtrlDocumento.RateioDocum.SetValues(
   //*   dValor, 0, 0, 0, FIdEmpresa, 0, iUnidNegoc, 0, FIdUsuario, 0, 0,
   //*   IFF(UsaPlanoPatro, PlanoPrevGlobal, PLANOPREVGLOBAL_NULO),
   //*   IFF(UsaPlanoPatro, PatroGlobal, PATROGLOBAL_NULO),
   //*   iIdPrograma, 0, FIdEmpresa, sCodTipRecDes,
   //*   FCdsDocumentos.FieldByName('RECPAG').asString,
   //*   IFF(sCodCentroRespon='', CODCENTRORESPON_PADRAO, sCodCentroRespon),
   //*   IFF(FAgruparRateio, sCodCentroCusto, ''), '');
  until (FinalDocumento(IdFavorecido, sCodTipRecDes));
end;

function TCtrlIntegraCAPCAR_RH.GravarDocumentos(const DataEmissao, DataPagamento: TDate;
  const AgruparRateio, UsaPlanoPatro: boolean; const PlanoPrevGlobal, PatroGlobal: integer;
  const ContaPadrao_Favorecido: string; const IdPlano_ContaPadrao_Favorecido: integer): boolean;
var
  sDebCred: string;
  sMsg: string;
  sContaContabil: string;
  iPlano: integer;
  iSubConta: integer;
  iIdFavorecido: integer;
  dNumDocumento: double;
  dValor: double;
begin
  if (FCdsDocumentos.IsEmpty) then
  begin
    FTipoRetorno := RETORNO_AVISO;
    MessageInfo := ('Não há documentos CAP a serem gerados.');
    Result := false;
    exit;
  end;

  FContaPadrao_Favorecido := ContaPadrao_Favorecido;
  FIdPlano_ContaPadrao_Favorecido := IdPlano_ContaPadrao_Favorecido;

  try
    FCtrlDocumento.IdEspAcesso := FIdEspAcesso;
    FCtrlDocumento.IdUsuario := FIdUsuario;
    FCtrlDocumento.IdModulo := FIdModulo;
    FCtrlDocumento.UsaPlanoPatro := UsaPlanoPatro;

    FAgruparRateio := AgruparRateio;
    FNumDocGerados := '';
    sDebCred := FCtrlDocumento.GetDebCre(FCodTipDoc);

    FCdsDocumentos.First;
    while not(FCdsDocumentos.EOF) do
    begin
      FCtrlDocumento.Prepare(OpDocumento, odlEfetivo);

      // Obter o ID do Favorecido. Caso não seja encontrado, passar para o próximo Documento
      iIdFavorecido := GetIdFavorecido;
      if (iIdFavorecido = 0) then
      begin
        FCdsDocumentos.Next;
        continue;
      end;

      // Gerar o Número do Documento
      dNumDocumento := GetNumDocSeq(iIdFavorecido);

      if (GetUsaContaContabil(FCdsDocumentos.FieldByName('RECPAG').asString)) then
      begin
        if (FContaPadrao_Favorecido <> '') then
        begin
          sContaContabil := FContaPadrao_Favorecido;
          iPlano := FIdPlano_ContaPadrao_Favorecido;
          iSubConta := 0;
        end
        else
        begin
          sContaContabil := FCdsDocumentos.FieldByName('CONTACONTABIL').asString;
          iPlano := FCdsDocumentos.FieldByName('PLANO').asInteger;
          iSubConta := FCdsDocumentos.FieldByName('SUBCONTA').asInteger;
        end;
      end
      else
      begin
        sContaContabil := '';
        iPlano := 0;
        iSubConta := 0;
      end;

      // Inserir Documento
      FCtrlDocumento.SetValues(
        0, dNumDocumento, '', '0', FCdsDocumentos.FieldByName('RECPAG').asString,
        '2' { 2 = Documento Normal }, '', '', sContaContabil, '', '', '', '', '', '', '',
        '', '', DataPagamento, DataEmissao, DataPagamento, 0, 0, 0, 0, 0, 0, 0, 0,
        FCodTipDoc, FIdEmpresa, FIdModulo, iIdFavorecido, 0, 0, 0, iPlano, 0, 0, 0, 0, 0,
        FIdUsuario, 0, 0, 0, iSubConta,
        {$IFDEF PADRAO_7_09_00}
        0, 0, 0, 0, Trunc(FIdHotel));
        {$ELSE}
        0, 0, 0, 0, 0);
        {$ENDIF}

      // Apurar o Valor do Documento
      dValor := GetValorDocumentoPrincipal(iIdFavorecido);

      // Criar o Lançamento para o Documento atual
      FCtrlDocumento.LanctoDocum.SetValues(
        DataEmissao, 0, 0, 0, 0, dValor, 0, 0, 0, FIdUsuario, FIdEmpresa,
        0, 0, 0, 0, 0, '2' { 2 = Documento Normal }, '', '', '', '', '', '', '',
        sDebCred, FIdModulo, 0, UsaPlanoPatro);

      // Fazer o Rateio para o Documento atual
      CriarRateioDocumento(UsaPlanoPatro, PlanoPrevGlobal, PatroGlobal, iIdFavorecido);

      // Efetivar inserção do Documento atual
      if (FCtrlDocumento.Insert) then
      begin
        sMsg := CMTranslateMsg(MSG_LISTA_AP,
            [FloatToSTr(dNumDocumento) + CR_LF,
             GetNomeFavorecido(iIdFavorecido) + CR_LF,
             FormatFloat('###,###,###,##0.00', dValor)]);

        if (FNumDocGerados = '') then
          FNumDocGerados := sMsg
        else
          FNumDocGerados := FNumDocGerados +CR_LF+CR_LF+ sMsg;
      end
      else
        raise Exception.Create(FCtrlDocumento.MessageInfo);
    end;

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      if (FTipoRetorno <> RETORNO_AVISO) then
        FTipoRetorno := RETORNO_ERRO;
      MessageInfo := E.Message;
    end;
  end;
end;

end.
