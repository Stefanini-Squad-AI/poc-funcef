unit uCtrlAusenciaAtende;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbAusenciaAtende;

Type
  TCtrlAusenciaAtende = class(TCmControlObject)
  private
    FCdsAusenciaAtende: TCMClientDataSet;
    FDbAusenciaAtende: TDbAusenciaAtende;
    procedure SetCdsAusenciaAtende(const Value: TCMClientDataSet);
    procedure SetDbAusenciaAtende(const Value: TDbAusenciaAtende);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbAusenciaAtende : TDbAusenciaAtende read FDbAusenciaAtende write SetDbAusenciaAtende;
    property CdsAusenciaAtende : TCMClientDataSet read FCdsAusenciaAtende write SetCdsAusenciaAtende;

    function SelecionaAusenciaAtende( iIdAusenciaAtende : integer ) : OleVariant;
    function GravaAusenciaAtende : Boolean;

    function ExisteConflito( iIdAusenciaAtende, iIdAtendeAgenda : integer; dDataIni, dDataFim : TDateTime ) : boolean;

    function AusenteNoHorario( iIdAtendeAgenda : integer; dDataHora : TDateTime ) : boolean;     

  published

end;

implementation

{ TCtrlAusenciaAtende }

procedure TCtrlAusenciaAtende.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbAusenciaAtende.DataBaseName    := DataBaseName
  else
    FDbAusenciaAtende.DbAdoConnection := DbAdoConnection;
end;

function TCtrlAusenciaAtende.AusenteNoHorario( iIdAtendeAgenda : integer; dDataHora : TDateTime ) : boolean;
var
  cdsAux : TCMClientDataset;
  sSQL : string;
begin
  cdsAux := TCMClientDataset.Create( nil );
  try
    sSQL :=
     ' select IDAUSENCIAATENDE                                                                                                           ' +
     ' from   AUSENCIAATENDE                                                                                                             ' +
     ' where  DATAHORAINICIO  <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy hh:nn', dDataHora ) ) + ', ''DD/MM/YYYY HH24:MI'' ) ' +
     '   and  DATAHORAFIM     >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy hh:nn', dDataHora ) ) + ', ''DD/MM/YYYY HH24:MI'' ) ' +
     '   and  IDATENDEAGENDA  = ' + IntToStr( iIdAtendeAgenda );

    cdsAux.Data := GetDataPacket( sSQL );

    Result := not cdsAux.IsEmpty;
  finally
    cdsAux.Free;
  end;
end;

constructor TCtrlAusenciaAtende.Create;
begin
  inherited;
  FDbAusenciaAtende  := TDbAusenciaAtende.Create( self );
end;

destructor TCtrlAusenciaAtende.Destroy;
begin
  inherited;
  FDbAusenciaAtende.Free;
  if IsAppServer then FCdsAusenciaAtende.Free;
end;

function TCtrlAusenciaAtende.ExisteConflito(iIdAusenciaAtende, iIdAtendeAgenda: integer; dDataIni, dDataFim: TDateTime): boolean;
var
  cdsAux : TCMClientDataset;
begin
  cdsAux := TCMClientDataset.Create( nil );
  try
    cdsAux.Data := GetDataPacket( ' SELECT IDAUSENCIAATENDE    ' +
                                  ' FROM   AUSENCIAATENDE      ' +
                                  ' WHERE  DATAHORAINICIO <= TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy hh:nn:ss', dDataFim ) ) + ', ''DD/MM/YYYY HH24:MI:SS'' ) ' +
                                  '   AND  DATAHORAFIM    >= TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy hh:nn:ss', dDataIni ) ) + ', ''DD/MM/YYYY HH24:MI:SS'' ) ' +
                                  '   AND  IDATENDEAGENDA =    ' + IntToStr( iIdAtendeAgenda ) +
                                  '   AND  IDAUSENCIAATENDE <> ' + IntToStr( iIdAusenciaAtende ) );

    Result := not cdsAux.IsEmpty;
  finally
    cdsAux.Free;
  end;
end;

function TCtrlAusenciaAtende.GravaAusenciaAtende: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaAusenciaAtende( CdsAusenciaAtende.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds( FCdsAusenciaAtende, FDbAusenciaAtende, [], [] );
      Msg := FDbAusenciaAtende.MessageInfo;
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

procedure TCtrlAusenciaAtende.OnCreateAppServer;
begin
  inherited;
  FCdsAusenciaAtende := TCMClientDataSet.Create( nil );
end;

function TCtrlAusenciaAtende.SelecionaAusenciaAtende( iIdAusenciaAtende: integer ): OleVariant;
begin
  FDbAusenciaAtende.Idausenciaatende.AsInteger := iIdAusenciaAtende;
  Result := GetDataPacket( FDbAusenciaAtende.SSqlSelect );
end;

procedure TCtrlAusenciaAtende.SetCdsAusenciaAtende( const Value: TCMClientDataSet );
begin
  FCdsAusenciaAtende := Value;
end;

procedure TCtrlAusenciaAtende.SetDbAusenciaAtende( const Value: TDbAusenciaAtende );
begin
  FDbAusenciaAtende := Value;
end;

end.

