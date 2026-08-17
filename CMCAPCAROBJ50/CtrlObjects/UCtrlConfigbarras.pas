unit UCtrlConfigbarras;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbConfigbarras, uSistema, DB, uDataBase,
DbClient ,uCMTypes, uCtrlConfigRelatorio;

type
  TCtrlConfigbarras = class(TCtrlConfigRelatorio)
  Protected
     procedure DoChangeDataBase; Override;
     procedure OnCreateAppServer;override;
     procedure ProcessaCds(ovCds: OleVariant); override;
  private
    _DbConfigbarras : TDbConfigbarras;
    Fcds   : TClientDataSet;
    // Eventos dos ClientDataSet´s
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    // Métodos
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //  Informa os Compradore existentes
    Function  ListConfigbarras : OleVariant;
    function GravarConfigbarras  : Boolean;
    function GravaUpdatePortador(sSql : String) : Boolean;
End;


implementation

{ TCtrlConfigbarras }

constructor TCtrlConfigbarras.Create;
begin
  inherited;
  _DbConfigbarras := TDbConfigbarras.Create(self);
end;

destructor TCtrlConfigbarras.Destroy;
begin
  _DbConfigbarras.Free;
  if isAppServer then FCds.Free;
  inherited;
end;

procedure TCtrlConfigbarras.DoChangeDataBase;
begin
  inherited;
  _DbConfigbarras.DataBaseName := DataBaseName;
end;

function TCtrlConfigbarras.ListConfigbarras : OleVariant;
var ssql : string;
begin
   ssql := 'SELECT IDCONFIGBARRAS, DESCCONFIGBARRAS '+
        '  FROM CONFIGBARRAS '+
        ' ORDER BY DESCCONFIGBARRAS        ';
   Result := GetDataPacket(ssql);
end;

procedure TCtrlConfigbarras.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlConfigbarras.GravarConfigbarras: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarConfigbarras(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := ApplyCds(Cds,_DbConfigbarras,[],[]);
        Msg    := _DbConfigbarras.MessageInfo;
        If Not Result Then Raise Exception.create(Msg);
          Commit;
     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

procedure TCtrlConfigbarras.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

procedure TCtrlConfigbarras.ProcessaCds(ovCds: OleVariant);
begin
  if ConnectionSide = cnsClient then
  begin
    Connection.AppServer.ConfigBarrasProcessaCds(ovCds);
  end
  else
  begin
    if _Cds.Active then
      _Cds.Close;
    _Cds.Data := ovCds;
    if _Operacao = OpApagar then
    begin
      while not _Cds.Eof do
        _Cds.Delete;
    end;
    if not ApplyCds(_Cds, _DbConfigbarras,
      [_DbReportsRelCM.Idreports, _DbReportsRelCM.Origemcm],
      [_DbConfigbarras.Idreports, _DbConfigbarras.Origemcm]) then
      raise Exception.Create(_DbConfigbarras.MessageInfo)
  end;

end;

function TCtrlConfigbarras.GravaUpdatePortador(sSql : String): Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravaUpdatePortador(sSql);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        ExecSQL(sSql);
        Commit;
     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

end.
