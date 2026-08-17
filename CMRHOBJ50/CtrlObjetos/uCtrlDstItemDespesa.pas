{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio C. Frioli               }
{ Criado Em: 15/08/2007                                 }
{                                                       }
{*******************************************************}

unit uCtrlDstItemDespesa;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbDstItemDespesa;

type
  TCtrlDstItemDespesa = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbDstItemDespesa;
    FCds: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListDstItemDespesa(IdDestacamento: double = 0): OleVariant;

    function Gravar: boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlFormFGTS }

constructor TCtrlDstItemDespesa.Create;
begin
  inherited;
  FDb := TDbDstItemDespesa.Create(Self);
end;

destructor TCtrlDstItemDespesa.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlDstItemDespesa.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlDstItemDespesa.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlDstItemDespesa.ListDstItemDespesa(IdDestacamento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdDestacamento=0,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDDESTACAMENTO, IDDSTTIPODESPESA, OBSERVACAO, VALOR'+CR_LF+
    'FROM'+CR_LF+
    '  DSTITEMDESPESA'+CR_LF+
    IFF(IdDestacamento=-1, 'WHERE (1 = 2)',
      IFF(IdDestacamento=0, 'ORDER BY'+CR_LF+'  DESCRICAO', 'WHERE'+CR_LF+
        '  (IDDESTACAMENTO = ' +FloatToStr(IdDestacamento)+ ')')));
end;

function TCtrlDstItemDespesa.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDb.MessageInfo);
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
