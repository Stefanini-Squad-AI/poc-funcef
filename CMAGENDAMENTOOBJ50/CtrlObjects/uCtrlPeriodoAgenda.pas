unit uCtrlPeriodoAgenda;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbPeriodoAgenda, uDbHorarioAgenda;

Type
  TCtrlPeriodoAgenda = class(TCmControlObject)
  private
    FCdsPeriodoAgenda: TCMClientDataSet;
    FDbPeriodoAgenda: TDbPeriodoAgenda;
    FCdsHorarioAgenda: TCMClientDataSet;
    FDbHorarioAgenda: TDbHorarioAgenda;
    procedure SetCdsPeriodoAgenda(const Value: TCMClientDataSet);
    procedure SetDbPeriodoAgenda(const Value: TDbPeriodoAgenda);
    procedure SetCdsHorarioAgenda(const Value: TCMClientDataSet);
    procedure SetDbHorarioAgenda(const Value: TDbHorarioAgenda);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbPeriodoAgenda : TDbPeriodoAgenda read FDbPeriodoAgenda write SetDbPeriodoAgenda;
    property DbHorarioAgenda : TDbHorarioAgenda read FDbHorarioAgenda write SetDbHorarioAgenda;

    property CdsPeriodoAgenda : TCMClientDataSet read FCdsPeriodoAgenda write SetCdsPeriodoAgenda;
    property CdsHorarioAgenda : TCMClientDataSet read FCdsHorarioAgenda write SetCdsHorarioAgenda;

    function SelecionaPeriodoAgenda( iIdPeriodoAgenda : integer ) : OleVariant;
    function SelecionaHorarioAgenda( iIdPeriodoAgenda : integer ) : OleVariant;

    function GravaPeriodoAgenda : Boolean;
    function ApagaPeriodoAgenda( iIdPeriodoAgenda : integer ) : Boolean;

    function ExisteConflito( iIdPeriodoAgenda, iIdGrupoAtende : integer; dDataIni, dDataFim : TDateTime ) : boolean;

  published

end;

implementation

{ TCtrlPeriodoAgenda }

procedure TCtrlPeriodoAgenda.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
  begin
    FDbPeriodoAgenda.DataBaseName    := DataBaseName;
    FDbHorarioAgenda.DataBaseName    := DataBaseName;
  end
  else
  begin
    FDbPeriodoAgenda.DbAdoConnection := DbAdoConnection;
    FDbHorarioAgenda.DbAdoConnection := DbAdoConnection;
  end;
end;

constructor TCtrlPeriodoAgenda.Create;
begin
  inherited;
  FDbPeriodoAgenda  := TDbPeriodoAgenda.Create( self );
  FDbHorarioAgenda  := TDbHorarioAgenda.Create( self );
end;

destructor TCtrlPeriodoAgenda.Destroy;
begin
  inherited;
  FDbPeriodoAgenda.Free;
  FDbHorarioAgenda.Free;
  if IsAppServer then FCdsPeriodoAgenda.Free;
  if IsAppServer then FCdsHorarioAgenda.Free;
end;

function TCtrlPeriodoAgenda.GravaPeriodoAgenda: Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaPeriodoAgenda( CdsPeriodoAgenda.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsPeriodoAgenda, FDbPeriodoAgenda, [], [] );
      if not Result then raise Exception.Create( FDbPeriodoAgenda.MessageInfo );

      Result := ApplyCds( FCdsHorarioAgenda, FDbHorarioAgenda, [DbPeriodoAgenda.Idperiodoagenda], [DbHorarioAgenda.Idperiodoagenda] );
      if not Result then raise Exception.Create( FDbHorarioAgenda.MessageInfo );

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

procedure TCtrlPeriodoAgenda.OnCreateAppServer;
begin
  inherited;
  FCdsPeriodoAgenda := TCMClientDataSet.Create( nil );
end;

function TCtrlPeriodoAgenda.SelecionaHorarioAgenda(  iIdPeriodoAgenda: integer): OleVariant;
begin
  Result := GetDataPacket( ' select * from HORARIOAGENDA where IDPERIODOAGENDA = ' + IntToStr( iIdPeriodoAgenda ) );
end;

function TCtrlPeriodoAgenda.SelecionaPeriodoAgenda( iIdPeriodoAgenda: integer ): OleVariant;
begin
  FDbPeriodoAgenda.Idperiodoagenda.AsInteger := iIdPeriodoAgenda;
  Result := GetDataPacket( FDbPeriodoAgenda.SSqlSelect );
end;

procedure TCtrlPeriodoAgenda.SetCdsHorarioAgenda(
  const Value: TCMClientDataSet);
begin
  FCdsHorarioAgenda := Value;
end;

procedure TCtrlPeriodoAgenda.SetCdsPeriodoAgenda( const Value: TCMClientDataSet );
begin
  FCdsPeriodoAgenda := Value;
end;

procedure TCtrlPeriodoAgenda.SetDbHorarioAgenda(  const Value: TDbHorarioAgenda);
begin
  FDbHorarioAgenda := Value;
end;

procedure TCtrlPeriodoAgenda.SetDbPeriodoAgenda( const Value: TDbPeriodoAgenda );
begin
  FDbPeriodoAgenda := Value;
end;

function TCtrlPeriodoAgenda.ExisteConflito(iIdPeriodoAgenda, iIdGrupoAtende: integer; dDataIni, dDataFim: TDateTime): boolean;
var
  cdsAux : TCMClientDataset;
begin
  cdsAux := TCMClientDataset.Create( nil );
  try
    cdsAux.Data := GetDataPacket( ' SELECT IDPERIODOAGENDA ' +
                                  ' FROM   PERIODOAGENDA   ' +
                                  ' WHERE  DATAINICIO <= TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy hh:nn:ss', dDataFim ) ) + ', ''DD/MM/YYYY HH24:MI:SS'' ) ' +
                                  '   AND  DATAFIM    >= TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy hh:nn:ss', dDataIni ) ) + ', ''DD/MM/YYYY HH24:MI:SS'' ) ' +
                                  '   AND  IDGRUPOATENDE = ' + IntToStr( iIdGrupoAtende ) +
                                  '   AND  IDPERIODOAGENDA <> ' + IntToStr( iIdPeriodoAgenda ) );

    Result := not cdsAux.IsEmpty;
  finally
    cdsAux.Free;
  end;
end;

function TCtrlPeriodoAgenda.ApagaPeriodoAgenda( iIdPeriodoAgenda : integer ) : Boolean;
begin
  StartTransaction;
  try
    ExecSQL( ' delete from HORARIOAGENDA  ' +
             ' where IDPERIODOAGENDA = ' + IntToStr( iIdPeriodoAgenda ) );

    ExecSQL( ' delete from PERIODOAGENDA  ' +
             ' where IDPERIODOAGENDA = ' + IntToStr( iIdPeriodoAgenda ) );

    Commit;

    Result := True;
  except
    on E : Exception do
    begin
      Result := False;
      Rollback;
      MessageInfo := E.Message;
    end;
  end;
end;

end.
