unit uCtrlRadEtapaCond;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbRadEtapaCond;

Type
  TCtrlRadEtapaCond = class(TCmControlObject)
  private
    FCdsRadEtapaCond: TCMClientDataSet;
    FDbRadEtapaCond: TDbRadEtapaCond;
    procedure SetCdsRadEtapaCond(const Value: TCMClientDataSet);
    procedure SetDbRadEtapaCond(const Value: TDbRadEtapaCond);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbRadEtapaCond : TDbRadEtapaCond read FDbRadEtapaCond write SetDbRadEtapaCond;
    property CdsRadEtapaCond : TCMClientDataSet read FCdsRadEtapaCond write SetCdsRadEtapaCond;

    function SelecionaTodasCond( iIdRadTipoProc : integer ) : OleVariant;
    function SelecionaCondDoc( iIdRadTipoProc : integer ) : OleVariant;

    function SelecionaRadEtapaCond( iIdRadEtapaCond : integer ) : OleVariant;
    function GravaRadEtapaCond : Boolean;
    function ExcluiRadEtapaCond( iIdRadEtapaCond : integer ) : Boolean;

    function LookupCentRespon : OLEVariant;
    function LookupTipoDoc    : OLEVariant;

  published

end;

implementation

{ TCtrlRadEtapaCond }

procedure TCtrlRadEtapaCond.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbRadEtapaCond.DataBaseName    := DataBaseName
  else
    FDbRadEtapaCond.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlRadEtapaCond.Create;
begin
  inherited;
  FDbRadEtapaCond  := TDbRadEtapaCond.Create( self );
end;

destructor TCtrlRadEtapaCond.Destroy;
begin
  FDbRadEtapaCond.Free;
  if IsAppServer then FCdsRadEtapaCond.Free;
  inherited;
end;

function TCtrlRadEtapaCond.ExcluiRadEtapaCond( iIdRadEtapaCond : integer ) : Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarRadEtapaCond( CdsRadEtapaCond.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSQL( 'delete from RadEtapaCond where IDRadEtapaCond = ' + IntToStr( iIdRadEtapaCond ) );

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      On E : Exception Do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

function TCtrlRadEtapaCond.GravaRadEtapaCond: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarRadEtapaCond( CdsRadEtapaCond.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsRadEtapaCond, FDbRadEtapaCond, [], [] );

      Msg := FDbRadEtapaCond.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      On E : Exception Do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;


function TCtrlRadEtapaCond.LookupCentRespon: OLEVariant;
begin
  Result := GetDataPacket(
   ' SELECT   C.CODCENTRORESPON , ' +
   '          C.NOME              ' +
   ' FROM     CENTRESPON        C ' +
   ' ORDER BY C.NOME            , ' +
   '          C.CODCENTRORESPON   ' );
end;


function TCtrlRadEtapaCond.LookupTipoDoc: OLEVariant;
begin
  Result := GetDataPacket(
   ' select   CODTIPDOC,                                                                 ' +
   '          DESCRICAO,                                                                 ' +
   '          decode( RECPAG, ''P'', ''Contas a Pagar'', ''Contas a Receber'') as RECPAG ' +
   ' from     TIPODOCRECPAG                                                              ' +
   ' order by DESCRICAO                                                                  ' );
end;

procedure TCtrlRadEtapaCond.OnCreateAppServer;
begin
  inherited;
  FCdsRadEtapaCond := TCMClientDataSet.Create( nil );
end;

function TCtrlRadEtapaCond.SelecionaCondDoc( iIdRadTipoProc : integer ) : OleVariant;
begin
  Result := GetDataPacket(
   ' select x.IDRADETAPACOND           ,                               ' +
   '        x.IDRADETAPA               ,                               ' +
   '        x.NUMETAPADEST             ,                               ' +
   '        x.CODCENTRORESPON          ,                               ' +
   '        x.CODCENTROCUSTO           ,                               ' +
   '        x.CODGRUPOPROD             ,                               ' +
   '        x.UNIDNEGOC                ,                               ' +
   '        x.VLRINICIAL               ,                               ' +
   '        x.VLRFINAL                 ,                               ' +
   '        x.CODTIPDOC                ,                               ' +
   '        c.NOME as NOMECENTRRESPON  ,                               ' +
   '        t.DESCRICAO as NOMETIPODOC                                 ' +
   ' FROM   RADETAPACOND             x ,                               ' +
   '        RADETAPA                 e ,                               ' +
   '        CENTRESPON               c ,                               ' +
   '        TIPODOCRECPAG            t                                 ' +
   ' where  x.CODCENTRORESPON          = c.CODCENTRORESPON (+)         ' +
   '   and  x.CODTIPDOC                = t.CODTIPDOC       (+)         ' +
   '   and  x.IDRADETAPA               = e.IDRADETAPA                  ' +
   '   and  e.IDRADTIPOPROC            = ' + IntToStr( iIdRadTipoProc ) );
end;


function TCtrlRadEtapaCond.SelecionaRadEtapaCond( iIdRadEtapaCond : integer ) : OleVariant;
begin
  FDbRadEtapaCond.IdRadEtapaCond.AsInteger := iIdRadEtapaCond;
  Result := GetDataPacket( FDbRadEtapaCond.SSqlSelect );
end;

function TCtrlRadEtapaCond.SelecionaTodasCond( iIdRadTipoProc: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select x.*                                             ' +
   ' FROM   RADETAPACOND    x ,                             ' +
   '        RADETAPA        e                               ' +
   ' where  x.IDRADETAPA    = e.IDRADETAPA                  ' +
   '   and  e.IDRADTIPOPROC = ' + IntToStr( iIdRadTipoProc ) );

end;

procedure TCtrlRadEtapaCond.SetCdsRadEtapaCond( const Value: TCMClientDataSet);
begin
  FCdsRadEtapaCond := Value;
end;

procedure TCtrlRadEtapaCond.SetDbRadEtapaCond(const Value: TDbRadEtapaCond);
begin
  FDbRadEtapaCond := Value;
end;

end.

