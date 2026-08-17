{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/09/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlBancoPortFolha;

interface

uses SysUtils, DBClient, uCMTypes, uCmDbObject, uCmControlObject, IvDictio,
  uCtrlCustomRH, uDbBancoPortFolha;

type
  TCtrlBancoPortFolha = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbBancoPortFolha: TDbBancoPortFolha;
    FCdsBancoPortFolha: TClientDataSet;

    FCodPortFormaPadrao: integer;
    FIdEmpresa: integer;
  public
    constructor Create(IdEmpresa: integer); reintroduce;
    destructor  Destroy; override;

    function ListBanco: OleVariant;
    function ListBancoPortFolha(RecPag: string = '-1'): OleVariant;
    function ListBancoPortFolhaBanco(IdBanco: double): OleVariant;
    function ListPortBanco: OleVariant;
    function ListPortadorXConta: OleVariant;
    function ListPortadorXContaXFolha: OleVariant;
    function ListContasEmpresa: OleVariant;

    function GetCodPortFormaPadrao: integer;
    function GetCodPortForma(IdBanco: double): integer;
    function GetBancoEmpresa(CodPortForma: integer): integer;

    function GravarBancoPortFolha(ExcluirCodPortFormaPadrao: boolean): boolean;

    property CdsBancoPortFolha: TClientDataSet read FCdsBancoPortFolha write FCdsBancoPortFolha;
    property CodPortFormaPadrao: integer read FCodPortFormaPadrao write FCodPortFormaPadrao;
    property IdEmpresa: integer read FIdEmpresa write FIdEmpresa;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlBancoPortFolha }

constructor TCtrlBancoPortFolha.Create(IdEmpresa: integer);
begin
  inherited Create;
  FDbBancoPortFolha := TDbBancoPortFolha.Create(Self);

  FIdEmpresa := IdEmpresa;
end;

destructor TCtrlBancoPortFolha.Destroy;
begin
  FDbBancoPortFolha.Free;
  if (IsAppServer) then
    FCdsBancoPortFolha.Free;
  inherited;
end;

procedure TCtrlBancoPortFolha.OnCreateAppServer;
begin
  inherited;
  FCdsBancoPortFolha := TClientDataSet.Create(nil);
end;

procedure TCtrlBancoPortFolha.DoChangeDataBase;
begin
  inherited;
  FDbBancoPortFolha.DataBaseName := DataBaseName;
end;

function TCtrlBancoPortFolha.ListBanco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  PB.IDPESSOA, PB.NOME' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA PB, BANCO B' +CR_LF+
    'WHERE' +CR_LF+
    '  (B.IDPESSOA       = PB.IDPESSOA) AND' +CR_LF+
    '  (PB.IDPESSOA NOT IN (SELECT IDBANCO' +CR_LF+
    '                       FROM   BANCOPORTFOLHA' +CR_LF+
    '                       WHERE  (IDEMPRESA = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
    '                              (IDBANCO  IS NOT NULL)))');
end;

function TCtrlBancoPortFolha.ListBancoPortFolha(RecPag: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  *' +CR_LF+
    'FROM' +CR_LF+
    '  PORTADORFORMA' +CR_LF+
    'WHERE' +CR_LF+
    '  (IDPESSOA = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
    IFF(RecPag='-1', '', '  (RECPAG   = ' +QuotedStr(RecPag)+ ')') +CR_LF+
    'ORDER BY' +CR_LF+
    '  DESCRICAO');
end;

function TCtrlBancoPortFolha.ListBancoPortFolhaBanco(IdBanco: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  PF.*' +CR_LF+
    'FROM' +CR_LF+
    '  PORTADORFORMA PF, PORTADORCONTA PC' +CR_LF+
    'WHERE' +CR_LF+
    '  ((PC.IDBANCO   IS NULL) OR' +CR_LF+
    '   (PC.IDBANCO    = ' +FloatToStr(IdBanco)+ ')) AND' +CR_LF+
    '  (PF.IDPESSOA    = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
    '  (PF.RECPAG      = ''P'') AND' +CR_LF+
    '  (PF.CODPORTADOR = PC.CODPORTADOR)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  UPPER(PF.DESCRICAO)');
end;

function TCtrlBancoPortFolha.ListPortBanco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  BPF.IDBANCOPORTFORMA, BPF.IDBANCO, BPF.CODPORTFORMA, BPF.IDEMPRESA,' +CR_LF+
    '  PB.NOME AS NOMEBANCO, PF.DESCRICAO' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA PB, BANCOPORTFOLHA BPF, PORTADORFORMA PF' +CR_LF+
    'WHERE' +CR_LF+
    '  (BPF.IDEMPRESA    = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
    '  (BPF.IDBANCO IS NOT NULL) AND' +CR_LF+
    '  (BPF.IDBANCO      = PB.IDPESSOA(+)) AND' +CR_LF+
    '  (BPF.CODPORTFORMA = PF.CODPORTFORMA(+))');
end;

function TCtrlBancoPortFolha.ListPortadorXConta: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  PFR.CODPORTFORMA, PFR.CODPORTADOR, PFR.DESCRICAO,' +CR_LF+
    '  PFR.CODARQUIVOREMESSA, PFR.CONTROLEREMESSA,' +CR_LF+
    '  PFR.CODFORMAPAGTO, PFR.FLGEMITEAVISO,' +CR_LF+
    '  PFR.CODTIPOPAGTO, PFR.NUMEMPRESABANCO,' +CR_LF+
    '  PCT.IDBANCO, PCT.NOCONTACORR' +CR_LF+
    'FROM' +CR_LF+
    '  PORTADORFORMA PFR, PORTADORCONTA PCT' +CR_LF+
    'WHERE' +CR_LF+
    '  (PFR.IDPESSOA    = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
    '  (PFR.CODPORTADOR = PCT.CODPORTADOR)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  UPPER(PFR.DESCRICAO)');
end;

function TCtrlBancoPortFolha.ListPortadorXContaXFolha: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '  BPF.CODPORTFORMA, PFR.CODARQUIVOREMESSA, PFR.CONTROLEREMESSA, PTB.IDBANCO'+CR_LF+
    'FROM'+CR_LF+
    '  PORTADORFORMA PFR, PORTADORCONTA PTB, BANCOPORTFOLHA BPF'+CR_LF+
    'WHERE'+CR_LF+
    '  (PFR.IDPESSOA     = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
    '  (PFR.CODPORTFORMA = BPF.CODPORTFORMA) AND'+CR_LF+
    '  (PTB.CODPORTADOR  = PFR.CODPORTADOR)');
end;

function TCtrlBancoPortFolha.ListContasEmpresa: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  PC.IDAGENCIA, AB.NUMAGENCIA, PA.NOME AS NOMEAGENCIA,' +CR_LF+
    '  B.IDPESSOA AS IDBANCO, B.NUMBANCO, PB.NOME AS NOMEBANCO,' +CR_LF+
    '  PC.NOCONTACORR, DECODE(BF.IDBANCO,NULL,1,0) AS PADRAO,' +CR_LF+
    '  TO_CHAR(DECODE(EP.LOGRADOURO,NULL,' +CR_LF+
    '    '''',' +CR_LF+
    '    RTRIM(EP.LOGRADOURO) ||'', ''|| TO_CHAR(EP.NUMERO) ||' +CR_LF+
    '    TO_CHAR(DECODE(RTRIM(EP.COMPLEMENTO),NULL,' +CR_LF+
    '      '''',' +CR_LF+
    '      '' - '' || RTRIM(EP.COMPLEMENTO)' +CR_LF+
    '    )) ||'' - ''||' +CR_LF+
    '    RTRIM(EP.BAIRRO) ||'' - ''|| RTRIM(CI.NOME) ||' +QuotedStr((' - CEP:'))+ '||' +CR_LF+
    '      RTRIM(SUBSTR(EP.CEP,1,5))' +CR_LF+
    '  )) ||''-''|| RTRIM(SUBSTR(EP.CEP,6,3)) AS ENDERECOAGENCIA' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA PB, PESSOA PA, ENDPESS EP, AGENCIABANCARIA AB, BANCOPORTFOLHA BF,' +CR_LF+
    '  PORTADORFORMA PF, PORTADORCONTA PC, BANCO B, CIDADES CI' +CR_LF+
    'WHERE' +CR_LF+
    '  (BF.IDEMPRESA      = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
    '  (BF.CODPORTFORMA   = PF.CODPORTFORMA) AND' +CR_LF+
    '  (PF.CODPORTADOR    = PC.CODPORTADOR) AND' +CR_LF+
    '  (PC.IDBANCO        = PB.IDPESSOA) AND' +CR_LF+
    '  (PC.IDBANCO        = B.IDPESSOA) AND' +CR_LF+
    '  (PC.IDAGENCIA      = AB.IDPESSOA) AND' +CR_LF+
    '  (PC.IDAGENCIA      = PA.IDPESSOA) AND' +CR_LF+
    '  (PA.IDPESSOA       = EP.IDPESSOA(+)) AND' +CR_LF+
    '  (PA.IDENDCOMERCIAL = EP.IDENDERECO(+)) AND' +CR_LF+
    '  (EP.IDCIDADES      = CI.IDCIDADES(+))');
end;

function TCtrlBancoPortFolha.GetCodPortFormaPadrao: integer;
var
  _CdsAux: TClientDataSet;
begin
  _CdsAux := TClientDataSet.Create(nil);

  _CdsAux.Close;
  _CdsAux.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  NVL(CODPORTFORMA,-1) AS CODPORTFORMA' +CR_LF+
    'FROM' +CR_LF+
    '  BANCOPORTFOLHA' +CR_LF+
    'WHERE' +CR_LF+
    '  (IDBANCO  IS NULL) AND' +CR_LF+
    '  (IDEMPRESA = ' +IntToStr(FIdEmpresa)+ ')');

  Result := _CdsAux.FieldByName('CODPORTFORMA').asInteger;

  _CdsAux.Free;
end;

function TCtrlBancoPortFolha.GetCodPortForma(IdBanco: double): integer;
var
  _CdsAux: TClientDataSet;
begin
  _CdsAux := TClientDataSet.Create(nil);

  _CdsAux.Close;
  _CdsAux.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  NVL(CODPORTFORMA,0) AS CODPORTFORMA' +CR_LF+
    'FROM' +CR_LF+
    '  BANCOPORTFOLHA' +CR_LF+
    'WHERE' +CR_LF+
    '  (IDBANCO   = ' +FloatToStr(IdBanco)+ ') AND' +CR_LF+
    '  (IDEMPRESA = ' +FloatToStr(FIdEmpresa)+ ')');

  Result := _CdsAux.FieldByName('CODPORTFORMA').asInteger;

  _CdsAux.Free;
end;

function TCtrlBancoPortFolha.GetBancoEmpresa(CodPortForma: integer): integer;
var
  _CdsAux: TClientDataSet;
begin
  _CdsAux := TClientDataSet.Create(nil);

  _CdsAux.Close;
  _CdsAux.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  PC.IDBANCO' +CR_LF+
    'FROM' +CR_LF+
    '  PORTADORFORMA PF, PORTADORCONTA PC' +CR_LF+
    'WHERE' +CR_LF+
    '  (PF.CODPORTFORMA = ' +IntToStr(CodPortForma)+ ') AND' +CR_LF+
    '  (PF.CODPORTADOR  = PC.CODPORTADOR)');

  Result := _CdsAux.FieldByName('IDBANCO').asInteger;

  _CdsAux.Free;
end;

function TCtrlBancoPortFolha.GravarBancoPortFolha(ExcluirCodPortFormaPadrao: boolean): boolean;
var
  _CdsAux: TClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarBancoPortFolha(FCdsBancoPortFolha.Data,
      FIdEmpresa, FCodPortFormaPadrao, ExcluirCodPortFormaPadrao);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := true;
    try
      StartTransaction;
      
      if (FCodPortFormaPadrao > 0) or (ExcluirCodPortFormaPadrao) then
      begin
        _CdsAux := TClientDataSet.Create(nil);

        // Inserir primeiro o Portador Forma Padrão
        _CdsAux.Data := GetDataPacket(
          'SELECT' +CR_LF+
          '  IDBANCOPORTFORMA, IDBANCO, CODPORTFORMA, IDEMPRESA' +CR_LF+
          'FROM' +CR_LF+
          '  BANCOPORTFOLHA' +CR_LF+
          'WHERE' +CR_LF+
          '  (IDBANCO  IS NULL) AND' +CR_LF+
          '  (IDEMPRESA = ' +IntToStr(FIdEmpresa)+ ')');

        if not(ExcluirCodPortFormaPadrao) then
        begin
          if (_CdsAux.IsEmpty) then
          begin
            _CdsAux.Insert;
            _CdsAux.FieldByName('IDBANCO').Clear;
          end
          else
            _CdsAux.Edit;

          _CdsAux.FieldByName('IDEMPRESA').asInteger := FIdEmpresa;
          _CdsAux.FieldByName('CODPORTFORMA').asInteger := FCodPortFormaPadrao;
          _CdsAux.Post;
        end
        else
          _CdsAux.Delete;

        Result := ApplyCds(_CdsAux, FDbBancoPortFolha, [], []);

        _CdsAux.Free;
      end;

      if not(Result) then
        raise Exception.Create(FDbBancoPortFolha.MessageInfo)
      else
      begin
        Result := ApplyCds(FCdsBancoPortFolha, FDbBancoPortFolha, [], []);
        if not(Result) then
          raise Exception.Create(FDbBancoPortFolha.MessageInfo);
      end;

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
