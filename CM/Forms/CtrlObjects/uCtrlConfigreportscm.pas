unit uCtrlConfigreportscm;

interface

Uses uCmControlObject, classes, Sysutils, uDbConfigreportscm, DbClient, uCMTypes;

Type
  TCtrlConfigreportscm = class(TCmControlObject)

  protected
    procedure DoChangeDataBase; Override;

                         
  private
    _DbConfigreportscm: TDbConfigreportscm;
    FCdsReports: TClientDataSet;
    procedure SetCdsReports(const Value: TClientDataSet);

  public
    Constructor Create; Override;
    Destructor Destroy; Override;

    property CdsReports: TClientDataSet read FCdsReports write SetCdsReports;

    function ProcessaConfigModelo: Boolean;
    procedure OpenCds(liIdReports, liOrigemCM, liIdPessoa: Integer);
  End;



implementation

{ TCtrlConfigreportscm }

constructor TCtrlConfigreportscm.Create;
begin
  inherited;
  _DbConfigreportscm := TDbConfigreportscm.Create(Self);
  FCdsReports := TClientDataSet.Create(nil);
end;

destructor TCtrlConfigreportscm.Destroy;
begin
  _DbConfigreportscm.Free;
  FCdsReports.Free;

  inherited;
end;

procedure TCtrlConfigreportscm.DoChangeDataBase;
begin
  inherited;
  _DbConfigreportscm.DataBaseName := DataBaseName;
end;

procedure TCtrlConfigreportscm.OpenCds(liIdReports, liOrigemCm, liIdPessoa: Integer);
begin
  FCdsReports.Data := GetDataPacket('SELECT IDREPORTS, ORIGEMCM, IDPESSOA, DESCRICAO, TEMPLATE FROM CONFIGREPORTSCM WHERE IDREPORTS = ' + IntToStr(liIdReports) + ' AND ORIGEMCM = ' + IntToStr(liOrigemCM) + ' AND IDPESSOA = ' + IntToStr(liIdPessoa));
end;

function TCtrlConfigreportscm.ProcessaConfigModelo: Boolean;
begin
  If ConnectionSide = CnsClient Then
  Begin
     Result := Connection.AppServer.ProcessaConfigModelo(FCdsReports.Data);

     If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     Result := True;
     Try
        StartTransaction;

        If Not ApplyCds(FCdsReports, _DbConfigreportscm, [], []) Then
           Raise Exception.Create(_DbConfigreportscm.MessageInfo);

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

procedure TCtrlConfigreportscm.SetCdsReports(const Value: TClientDataSet);
begin
  FCdsReports := Value;
end;

end.                             
