{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPpraCipa;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate, uCMClientDataSet,
  uCtrlCustomRH, uDbPpraCipa, uDbPpraCipaMembro;

type
  TCtrlPpraCipa = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbPpraCipa;
    FDbDet: TDbPpraCipaMembro;
    FCds: TCMClientDataSet;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdPpraCipa, IdEmpresa, IdEstab: integer): OleVariant;
    function ListDetalhe(IdPpraCipa: integer): OleVariant;
    function ListEmpresaProp(IdPessoa: integer = 0): OleVariant;

    function Gravar: boolean;
    function Excluir: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlPpraCipa }

constructor TCtrlPpraCipa.Create;
begin
  inherited;
  FDb := TDbPpraCipa.Create(Self);
  FDbDet := TDbPpraCipaMembro.Create(Self);
end;

destructor TCtrlPpraCipa.Destroy;
begin
  FDbDet.Free;
  FDb.Free;
  if (IsAppServer) then
  begin
    FCds.Free;
    FCdsDet.Free;
  end;
  inherited;
end;

procedure TCtrlPpraCipa.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
  FCdsDet := TCMClientDataSet.Create(nil);
end;

procedure TCtrlPpraCipa.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlPpraCipa.ListGeral(IdPpraCipa, IdEmpresa, IdEstab: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdPpraCipa=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDPPRACIPA, IDESTAB, IDEMPRESA, INDCIPA, NUMPESSCIPA, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PPRACIPA'+CR_LF+
    'WHERE '+CR_LF+
    IFF(IdPpraCipa=-1, '(1 = 2)',
      IFF(IdPpraCipa=0, '(1 = 1)', 
        '  (IDPPRACIPA = ' +FloatToStr(IdPpraCipa)+ ')'))+CR_LF+
    IFF(IdEmpresa=0, '', 'AND (IDEMPRESA = ' +FloatToStr(IdEmpresa)+ ')')+CR_LF+
    IFF(IdEstab=0,   '', 'AND (IDESTAB   = ' +FloatToStr(IdEstab)+ ')'));
end;

function TCtrlPpraCipa.ListDetalhe(IdPpraCipa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PP.IDPPRACIPA, PP.IDPESSOA, PP.IDCIPAFUNCAO,'+CR_LF+
    '  P.NOME, PP.DATAINI, PP.DATAFIM, PF.DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PPRACIPAMEMBRO PP, PPRACIPAFUNCAO PF '+CR_LF+
    'WHERE'+CR_LF+
    IFF(IdPpraCipa=0, '',
      '  (PP.IDPPRACIPA   = ' +IntToStr(IdPpraCipa)+ ') AND'+CR_LF)+
    '  (PP.IDPESSOA     = P.IDPESSOA) AND'+CR_LF+
    '  (PP.IDCIPAFUNCAO = PF.IDCIPAFUNCAO(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(P.NOME)');
end;

function TCtrlPpraCipa.ListEmpresaProp(IdPessoa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.NOME, P.IDPESSOA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, EMPRESAPROP EP'+CR_LF+
    'WHERE'+CR_LF+
    IFF(IdPessoa = 0, '','  (EP.IDPESSOA = '+IntToStr(IdPessoa)+') AND'+CR_LF)+
    '  (EP.IDPESSOA = P.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(P.NOME)');
end;

function TCtrlPpraCipa.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarPpraCipa(FCds.Data, FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsDet, FDbDet, [FDb.IdPpraCipa], [FDbDet.IdPpraCipa]);
        if not(Result) then
          raise Exception.Create(FDbDet.MessageInfo);
      end
      else
        raise Exception.Create(FDb.MessageInfo);

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

function TCtrlPpraCipa.Excluir: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirPpraCipa(FCds.Data, FCdsDet.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      FCdsDet.First;
      while not(FCdsDet.EOF) do
        FCdsDet.Delete;

      StartTransaction;

      Result := ApplyCds(FCdsDet, FDbDet, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCds, FDb, [], []);
        if not(Result) then
          raise Exception.Create(FDb.MessageInfo);
      end
      else
        raise Exception.Create(FDbDet.MessageInfo);

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
