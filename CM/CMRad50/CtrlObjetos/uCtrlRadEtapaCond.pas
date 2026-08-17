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

    function SelecionaRadEtapaCond( iIdRadEtapaCond : integer ) : OleVariant;
    function GravaRadEtapaCond : Boolean;
    function ExcluiRadEtapaCond( iIdRadEtapaCond : integer ) : Boolean;

    function LookupCentRespon( iIdPlanCRespon : integer ) : OLEVariant;
    function LookupTipoDoc    : OLEVariant;
    function LookupCentCust( iIdPlanCentCust : integer ) : OLEVariant;
    function LookupGrupoProd  : OLEVariant;
    function LookupAtivProj   : OLEVariant;

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

      Result := ExecSQL( 'delete from RADETAPACOND where IDRADETAPACOND = ' + IntToStr( iIdRadEtapaCond ) );

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


function TCtrlRadEtapaCond.LookupAtivProj: OLEVariant;
begin
  Result := GetDataPacket(
   ' select   UNIDNEGOC,  ' +
   '          NOME,       ' +
   '          UNECODIGO   ' +
   ' from     UNIDNEGOCIO ' +
   ' order by UNECODIGO   ' );
end;

function TCtrlRadEtapaCond.LookupCentCust( iIdPlanCentCust : integer ) : OLEVariant;
begin
  Result := GetDataPacket(
   ' select   CODCENTROCUSTO ,                               ' +
   '          CODEXTERNO     ,                               ' +
   '          NOME                                           ' +
   ' from     CENTCUST                                       ' +
   ' where    STATUSGRUPOCDC = ''A''                         ' +
   '   and    IDPLANCENTCUST = ' + IntToStr( iIdPlanCentCust ) +
   ' order by CODEXTERNO                                     ' );
end;

function TCtrlRadEtapaCond.LookupCentRespon( iIdPlanCRespon : integer ) : OLEVariant;
begin
  Result := GetDataPacket(
   ' select   CODCENTRORESPON    ,                         ' +
   '          CODEXTERNO         ,                         ' +
   '          NOME                                         ' +
   ' from     CENTRESPON                                   ' +
   ' where    ANALITICOSINTET = ''A''                      ' +
   '   and    IDPLANCRESPON = ' + IntToStr( iIdPlanCRespon ) +
   ' order by CODEXTERNO                                   ' );
end;

function TCtrlRadEtapaCond.LookupGrupoProd: OLEVariant;
begin
  Result := GetDataPacket(
   ' select   CODGRUPOPROD, ' +
   '          DESCGRUPOPROD ' +
   ' from     GRUPPROD      ' +
   ' order by CODGRUPOPROD  ' );
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

function TCtrlRadEtapaCond.SelecionaRadEtapaCond( iIdRadEtapaCond : integer ) : OleVariant;
begin
  FDbRadEtapaCond.IdRadEtapaCond.AsInteger := iIdRadEtapaCond;
  Result := GetDataPacket( FDbRadEtapaCond.SSqlSelect );
end;


function TCtrlRadEtapaCond.SelecionaTodasCond( iIdRadTipoProc: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select   x.IDRADETAPACOND             ,                              ' +
   '          x.IDRADETAPA                 ,                              ' +
   '          x.ORDEM                      ,                              ' +
   '          x.NUMETAPADEST               ,                              ' +
   '          x.CODCENTRORESPON            ,                              ' +
   '          x.CODCENTROCUSTO             ,                              ' +
   '          r.CODEXTERNO as CODEXTERNOCR ,                              ' +
   '          c.CODEXTERNO as CODEXTERNOCC ,                              ' +
   '          x.CODGRUPOPROD               ,                              ' +
   '          x.UNIDNEGOC                  ,                              ' +
   '          x.VLRINICIAL                 ,                              ' +
   '          x.VLRFINAL                   ,                              ' +
   '          x.CODTIPDOC                  ,                              ' +
   '          r.NOME as NOMECENTRRESPON    ,                              ' +
   '          c.NOME as NOMECENTRCUST      ,                              ' +
   '          t.DESCRICAO as NOMETIPODOC   ,                              ' +
   '          u.UNECODIGO                  ,                              ' +
   '          g.DESCGRUPOPROD                                             ' +
   ' FROM     RADETAPACOND             x   ,                              ' +
   '          RADETAPA                 e   ,                              ' +
   '          CENTRESPON               r   ,                              ' +
   '          TIPODOCRECPAG            t   ,                              ' +
   '          UNIDNEGOCIO              u   ,                              ' +
   '          CENTCUST                 c   ,                              ' +
   '          GRUPPROD                 g                                  ' +
   ' where    x.CODCENTRORESPON            = r.CODCENTRORESPON (+)        ' +
   '   and    x.CODTIPDOC                  = t.CODTIPDOC       (+)        ' +
   '   and    x.CODCENTROCUSTO             = c.CODCENTROCUSTO  (+)        ' +
   '   and    x.CODGRUPOPROD               = g.CODGRUPOPROD    (+)        ' +
   '   and    x.UNIDNEGOC                  = u.UNIDNEGOC       (+)        ' +
   '   and    x.IDRADETAPA                 = e.IDRADETAPA                 ' +
   '   and    e.IDRADTIPOPROC              = ' + IntToStr( iIdRadTipoProc ) +
   ' order by x.IDRADETAPA                 ,                              ' +
   '          x.ORDEM                                                     ' ) ;
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

