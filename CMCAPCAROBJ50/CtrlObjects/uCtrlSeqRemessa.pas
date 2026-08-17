unit uCtrlSeqRemessa;

interface

uses sysutils, uCmControlObject, uCmDbObject, uDbSeqRemessa, uSistema, DB,
uDataBase,
  DbClient{$IFDEF VER0505}{$ELSE}, uCMTypes{$ENDIF};

type

  TCtrlSeqRemessa = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    _DbSeqRemessa: TDbSeqRemessa;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  public
    property cds: TClientDataSet read Fcds write Setcds;
    constructor Create; override;
    destructor Destroy; override;
    function ListSeqRemessa(NumEmpresaBanco: String = ''): OleVariant;
    function GravarSeqRemessa: Boolean;
  end;

implementation

{ TCtrlSeqRemessa }

constructor TCtrlSeqRemessa.Create;
begin
  inherited;
  _DbSeqRemessa := TDbSeqRemessa.Create(self);
end;

destructor TCtrlSeqRemessa.Destroy;
begin
  _DbSeqRemessa.Free;
  if isAppServer then
    FCds.Free;
  inherited;
end;

procedure TCtrlSeqRemessa.DoChangeDataBase;
begin
  inherited;
  _DbSeqRemessa.DataBaseName := DataBaseName;

end;

function TCtrlSeqRemessa.ListSeqRemessa(NumEmpresaBanco: String = ''): OleVariant;
var
  ssql: string;
begin
  ssql := ' SELECT                   ' +
          '   NUMEMPRESABANCO,       ' +
          '   CONTROLEREMESSA, DESCRICAO ' +
          ' FROM SEQREMESSA C  WHERE (1=1) ';
  if trim(NumEmpresaBanco) <> '' then
    ssql := ssql + ' AND NUMEMPRESABANCO = ' + quotedStr(NumEmpresaBanco);

  Result := GetDataPacket(ssql);
end;

procedure TCtrlSeqRemessa.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlSeqRemessa.GravarSeqRemessa: Boolean;
var
  Msg: string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarSeqRemessa(cds.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(Cds, _DbSeqRemessa, [], [],True);
      Msg := _DbSeqRemessa.MessageInfo;

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

procedure TCtrlSeqRemessa.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

end.

