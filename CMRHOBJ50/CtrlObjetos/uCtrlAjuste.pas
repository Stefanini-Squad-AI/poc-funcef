{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlAjuste;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlCustomRH,
  uDbAjustPesq;

type
  TCtrlAjuste = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbDet: TDbAjustPesq;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function ListMestre(IdPesqSalar: double): OleVariant;
    function ListDetalhe(IdPesqSalar: double): OleVariant;

    function ListEntidade: OleVariant;

    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlAjuste }

constructor TCtrlAjuste.Create;
begin
  inherited;
  FDbDet := TDbAjustPesq.Create(Self);
end;

destructor TCtrlAjuste.Destroy;
begin
  FDbDet.Free;
  if (IsAppServer) then
    FCdsDet.Free;
  inherited;
end;

procedure TCtrlAjuste.OnCreateAppServer;
begin
  inherited;
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlAjuste.DoChangeDataBase;
begin
  inherited;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlAjuste.ListMestre(IdPesqSalar: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IdPesqSalar, NomePesqSalar, DataRefPesq'+CR_LF+
    'FROM'+CR_LF+
    '  PesqISal'+CR_LF+
    'WHERE'+CR_LF+
    '  (IdPesqSalar = '+FloatToStr(IdPesqSalar)+')');
end;

function TCtrlAjuste.ListDetalhe(IdPesqSalar: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  AJ.IdPesqSalar, AJ.IdEmpresaPartic, AJ.Fator, PJ.Nome'+CR_LF+
    'FROM'+CR_LF+
    '  Pessoa PJ, AjustPesq AJ'+CR_LF+
    'WHERE'+CR_LF+
    '  (AJ.IdPesqSalar     = '+FloatToStr(IdPesqSalar)+') AND'+CR_LF+
    '  (AJ.IdEmpresaPartic = PJ.IdPessoa)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  IdPesqSalar');
end;

function TCtrlAjuste.ListEntidade: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PJ.IdPessoa, PJ.Nome'+CR_LF+
    'FROM'+CR_LF+
    '  Pessoa PJ, Terceiro TE'+CR_LF+
    'WHERE'+CR_LF+
    '  (TE.IdPessoa = PJ.IdPessoa)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  PJ.Nome');
end;

function TCtrlAjuste.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarPeriodo(FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsDet, FDbDet, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbDet.MessageInfo);
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
