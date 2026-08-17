unit uCtrlUnidnegocio;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbUnidnegocio, uSistema, DB, uDataBase,
DbClient, Wwquery, Provider;

type

  TCtrlUnidnegocio = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  private
    _DbUnidnegocio : TDbUnidnegocio;
    _dsp      : TDataSetProvider;
    Fcds      : TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    Property dsp : TDataSetProvider read _dsp;
    constructor Create;  Override;
    Destructor  Destroy; Override;
    Function ListUnidnegocio( idpessoa : double = 0 ): OleVariant;
    function GravarUnidnegocio     : Boolean;
End;


implementation

{ TCtrlUnidnegocio }

constructor TCtrlUnidnegocio.Create;
begin
  inherited;
  _DbUnidnegocio := TDbUnidnegocio.Create;
  FCds                := TClientDataSet.Create(nil);
  _dsp                := TDataSetProvider.Create(nil);
  _dsp                := _DbUnidnegocio.Dsp;

end;

destructor TCtrlUnidnegocio.Destroy;
begin
  _DbUnidnegocio.Free;
  inherited;
end;

procedure TCtrlUnidnegocio.DoChangeDataBase;
begin
  inherited;
  _DbUnidnegocio.DataBaseName := DataBaseName;
  _qrySQL.DataBaseName        := DataBaseName;
end;

function TCtrlUnidnegocio.ListUnidnegocio( idpessoa : double = 0 ): OleVariant;
var ssql : string;
begin
If ConnectionSide = cnsClient Then
Begin
   Result := Connection.AppServer.ListUnidnegocio( idpessoa );
   MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
Begin
   ssql := 'SELECT  '+
        '   UNIDNEGOC,NOME,UNECODIGO,UNETIPO '+
        'FROM                                '+
        '  UNIDNEGOCIO                       '+
        'WHERE                               '+
        '  IDPESSOA = '+floattostr(IDPESSOA)+
        'ORDER BY     '+
        '  UNECODIGO,UNETIPO  ';
   Result := GetDataPacket(ssql);
end;
end;

procedure TCtrlUnidnegocio.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlUnidnegocio.GravarUnidnegocio: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarUnidnegocio(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := ApplyCds(Cds,_DbUnidnegocio,[],[]);
        Msg    := _DbUnidnegocio.MessageInfo;

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

end.
