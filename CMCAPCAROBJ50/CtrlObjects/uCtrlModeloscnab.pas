unit uCtrlModeloscnab;

interface

uses sysutils, uCmControlObject, uCmDbObject, uDbModeloscnab, uSistema, DB,
uDataBase,
  DbClient{$IFDEF VER0505}{$ELSE}, uCMTypes{$ENDIF};

type

  TCtrlModeloscnab = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    _DbModeloscnab: TDbModeloscnab;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  public
    property cds: TClientDataSet read Fcds write Setcds;
    constructor Create; override;
    destructor Destroy; override;
    function ListModeloscnab(IdModeloscnab: double = 0; precpag: string = ''):
      OleVariant;
    function GravarModeloscnab: Boolean;
  end;

implementation

{ TCtrlModeloscnab }

constructor TCtrlModeloscnab.Create;
begin
  inherited;
  _DbModeloscnab := TDbModeloscnab.Create(self);
end;

destructor TCtrlModeloscnab.Destroy;
begin
  _DbModeloscnab.Free;
  if isAppServer then
    FCds.Free;
  inherited;
end;

procedure TCtrlModeloscnab.DoChangeDataBase;
begin
  inherited;
  _DbModeloscnab.DataBaseName := DataBaseName;
end;

function TCtrlModeloscnab.ListModeloscnab(IdModeloscnab: double = 0;
  precpag: string = ''): OleVariant;
var
  ssql: string;
begin
  ssql := 'SELECT                   ' +
    '  IDMODELOSCNAB,         ' +
    '  RECPAG,                ' +
    '  DESCRICAO              ' +
    'FROM                     ' +
    '       Modeloscnab C  where (1=1)   ';
  if IdModeloscnab <> 0 then
    ssql := ssql + 'and IdModeloscnab = ' + floattostr(IdModeloscnab);
  if trim(precpag) <> '' then
    ssql := ssql + ' and RECPAG = ' + quotedstr(pRECPAG);
  ssql := ssql + '   ORDER BY DESCRICAO       ';
  Result := GetDataPacket(ssql);
end;

procedure TCtrlModeloscnab.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlModeloscnab.GravarModeloscnab: Boolean;
var
  Msg: string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarModeloscnab(cds.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(Cds, _DbModeloscnab, [], []);
      Msg := _DbModeloscnab.MessageInfo;

      if not Result then
        raise Exception.create(Msg);
      Commit;
    except
      on E: Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

procedure TCtrlModeloscnab.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

end.

