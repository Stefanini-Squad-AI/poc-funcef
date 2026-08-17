unit uCtrlRadEtapa;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbRadEtapaNovo;

Type
  TCtrlRadEtapa = class(TCmControlObject)
  private
    FCdsRadEtapa: TCMClientDataSet;
    FDbRadEtapa: TDbRadEtapa;
    procedure SetCdsRadEtapa(const Value: TCMClientDataSet);
    procedure SetDbRadEtapa(const Value: TDbRadEtapa);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbRadEtapa : TDbRadEtapa read FDbRadEtapa write SetDbRadEtapa;
    property CdsRadEtapa : TCMClientDataSet read FCdsRadEtapa write SetCdsRadEtapa;

    function SelecionaEtapasRAD( iIdRadTipoProc : integer ) : OleVariant;

    function SelecionaRadEtapa( iIdRadEtapa : integer ) : OleVariant;
    function GravaRadEtapa : Boolean;
    function ExcluiRadEtapa( iIdRadEtapa : integer ) : Boolean;

  published

end;

implementation

{ TCtrlRadEtapa }

procedure TCtrlRadEtapa.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbRadEtapa.DataBaseName    := DataBaseName
  else
    FDbRadEtapa.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlRadEtapa.Create;
begin
  inherited;
  FDbRadEtapa  := TDbRadEtapa.Create( self );
end;

destructor TCtrlRadEtapa.Destroy;
begin
  FDbRadEtapa.Free;
  if IsAppServer then FCdsRadEtapa.Free;
  inherited;
end;

function TCtrlRadEtapa.ExcluiRadEtapa( iIdRadEtapa : integer ) : Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarRadEtapa( CdsRadEtapa.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ExecSQL( 'delete from RADETAPA where IDRADETAPA = ' + IntToStr( iIdRadEtapa ) );

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

function TCtrlRadEtapa.GravaRadEtapa: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarRadEtapa( CdsRadEtapa.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsRadEtapa, FDbRadEtapa, [], [] );

      Msg := FDbRadEtapa.MessageInfo;

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


procedure TCtrlRadEtapa.OnCreateAppServer;
begin
  inherited;
  FCdsRadEtapa := TCMClientDataSet.Create( nil );
end;

function TCtrlRadEtapa.SelecionaEtapasRAD( iIdRadTipoProc : integer ) : OleVariant;
begin
  Result := GetDataPacket(
   ' select e.IDRADETAPA                ,                   ' +
   '        e.IDRADTIPOPROC             ,                   ' +
   '        e.NUMERO                    ,                   ' +
   '        e.DESCRICAO                 ,                   ' +
   '        e.IDGRPRESPON               ,                   ' +
   '        e.PRAZOESTIMADO             ,                   ' +
   '        e.FLGACAOAPROVA             ,                   ' +
   '        e.FLGQTDEAUTORIZA           ,                   ' +   
   '        e.QTDEAUTORIZA              ,                   ' +
   '        e.NUMETAPADEST              ,                   ' +
   '        e.FLGPODERETORNAR           ,                   ' +
   '        e.FLGETAPARETORNO           ,                   ' +
   '        e.NUMETAPARET               ,                   ' +
   '        e.FLGPODERECUSAR            ,                   ' +
   '        e.FLGELSE                   ,                   ' +
   '        e.NUMETAPAELSE              ,                   ' +
   '        e.FLGAVISOS                 ,                   ' +
   '        e.FLGAVISOGRUPO             ,                   ' +
   '        e.FLGAVISOSOLIC             ,                   ' +
   '        e.AVISOOUTROS               ,                   ' +
   '        g.NOME as NOMEGRUPORESPON                       ' +
   ' from   RADETAPA     e,                                 ' +
   '        RADGRPRESPON G                                  ' +
   ' where  e.IDGRPRESPON   = g.IDGRPRESPON (+)             ' +
   '   and  e.IDRADTIPOPROC = ' + IntToStr( iIdRadTipoProc ) );
end;

function TCtrlRadEtapa.SelecionaRadEtapa( iIdRadEtapa : integer ) : OleVariant;
begin
  FDbRadEtapa.Idradetapa.AsInteger := iIdradetapa;
  Result := GetDataPacket( FDbRadEtapa.SSqlSelect );
end;

procedure TCtrlRadEtapa.SetCdsRadEtapa( const Value: TCMClientDataSet);
begin
  FCdsRadEtapa := Value;
end;

procedure TCtrlRadEtapa.SetDbRadEtapa(const Value: TDbRadEtapa);
begin
  FDbRadEtapa := Value;
end;

end.

