{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 09/07/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlBancoPortador;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uDbBancoPortForma;

type
  TCtrlBancoPortador = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbBancoPortForma;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListPortadorForma(RecPag: string = '-1'): OleVariant;
    function ListPortBanco: OleVariant;
    function GetCodPortFormaPadrao: integer;

    function Gravar(CodPortFormaPadrao: string = ''): boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uFuncoesUteis;

{ TCtrlBancoPortador }

constructor TCtrlBancoPortador.Create;
begin
  inherited;
  FDb := TDbBancoPortForma.Create(Self);
end;

destructor TCtrlBancoPortador.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlBancoPortador.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlBancoPortador.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlBancoPortador.ListPortadorForma(RecPag: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  PORTADORFORMA'+CR_LF+
    IFF(RecPag='-1', '', 'WHERE (RECPAG = ''P'')'));
end;

function TCtrlBancoPortador.ListPortBanco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  BPF.IDBANCOPORTFORMA, BPF.IDBANCO, BPF.CODPORTFORMA, BPF.VLRARREDSALARIO,'+CR_LF+
    '  BPF.DFLOATPAGTO, BPF.COLVALOR, BPF.TAMVALOR, BPF.PREFIXOARQ,'+CR_LF+
    '  PB.NOME AS NOMEBANCO, PF.DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PB, BANCOPORTFORMA BPF, PORTADORFORMA PF'+CR_LF+
    'WHERE'+CR_LF+
    '  (BPF.IDBANCO IS NOT NULL) AND'+CR_LF+
    '  (BPF.IDBANCO      = PB.IDPESSOA(+)) AND'+CR_LF+
    '  (BPF.CODPORTFORMA = PF.CODPORTFORMA(+))');
end;

function TCtrlBancoPortador.GetCodPortFormaPadrao: integer;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  NVL(CODPORTFORMA, -1) AS CODPORTFORMA'+CR_LF+
    'FROM'+CR_LF+
    '  BANCOPORTFORMA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDBANCO IS NULL)');

  Result := _Cds.FieldByName('CODPORTFORMA').asInteger;

  _Cds.Free;
end;

function TCtrlBancoPortador.Gravar(CodPortFormaPadrao: string): boolean;
var
  _Cds: TCMClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data, CodPortFormaPadrao);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := false;    
      if (CodPortFormaPadrao <> '') then
      begin
        _Cds := TCMClientDataSet.Create(nil);

        // Inserir primeiro o Portador Forma Padrão
        _Cds.Data := GetDataPacket(
          'SELECT'+CR_LF+
          '  IDBANCOPORTFORMA, IDBANCO, CODPORTFORMA, VLRARREDSALARIO,'+CR_LF+
          '  DFLOATPAGTO, COLVALOR, TAMVALOR, PREFIXOARQ'+CR_LF+
          'FROM'+CR_LF+
          '  BANCOPORTFORMA'+CR_LF+
          'WHERE'+CR_LF+
          '  (IDBANCO IS NULL)');

        if (_Cds.IsEmpty) then
        begin
          _Cds.Insert;
          _Cds.FieldByName('IDBANCO').Clear;
        end
        else
          _Cds.Edit;

        _Cds.FieldByName('CODPORTFORMA').asString := CodPortFormaPadrao;
        _Cds.Post;

        Result := ApplyCds(_Cds, FDb, [], []);
        _Cds.Free;
      end;

      if (Result) or (CodPortFormaPadrao <> '') then
      begin
        // Aplica as alterações feitas no PortadorForma
        Result := ApplyCds(FCds, FDb, [], []);
        if not(Result) then
          MessageInfo := FDb.MessageInfo;
      end
      else
        MessageInfo := FDb.MessageInfo;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
