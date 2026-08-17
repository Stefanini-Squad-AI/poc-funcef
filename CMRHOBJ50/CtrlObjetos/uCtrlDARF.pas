{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/03/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlDARF;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlCustomRH,
  uDbContribDARF, uDbItemDARF;

type
  TCtrlDARF = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbContribDARF;
    FDbDet: TDbItemDARF;
    FCds: TCMClientDataSet;
    FCdsDet: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Gravar: boolean;
    function Excluir: boolean;
    function ListMestre(IdContribDARF: integer = 0): OleVariant;
    function ListDetalhe(IdContribDARF: integer): OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;    
    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlDARF }

constructor TCtrlDARF.Create;
begin
  inherited;
  FDb := TDbContribDARF.Create(Self);
  FDbDet := TDbItemDARF.Create(Self);
end;

destructor TCtrlDARF.Destroy;
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

procedure TCtrlDARF.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
  FCdsDet := TCMClientDataSet.Create(nil);  
end;

procedure TCtrlDARF.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FDbDet.DataBaseName := DataBaseName;
end;

function TCtrlDARF.ListMestre(IdContribDARF: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IdContribDARF, DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  ContribDARF'+CR_LF+
    IFF(IdContribDARF=-1, 'WHERE (1 = 2)',
      IFF(IdContribDARF=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IdContribDARF = ' +IntToStr(IdContribDARF)+ ')')));
end;

function TCtrlDARF.ListDetalhe(IdContribDARF: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  IdContribDARF, IdItemDARF, Descricao'+CR_LF+
    'FROM'+CR_LF+
    '  ItemDARF'+CR_LF+
    'WHERE'+CR_LF+
    '  (IdContribDARF = '+IntToStr(IdContribDARF)+')');
end;

function TCtrlDARF.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data, FCdsDet.Data);
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
        Result := ApplyCds(FCdsDet, FDbDet, [], []);
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

function TCtrlDARF.Excluir: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Excluir(FCds.Data, FCdsDet.Data);
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
