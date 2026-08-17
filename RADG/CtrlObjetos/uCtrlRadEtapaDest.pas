unit uCtrlRadEtapaDest;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbRadEtapaDest;

Type
  TCtrlRadEtapaDest = class(TCmControlObject)
  private
    FCdsRadEtapaDest: TCMClientDataSet;
    FDbRadEtapaDest: TDbRadEtapaDest;
    procedure SetCdsRadEtapaDest(const Value: TCMClientDataSet);
    procedure SetDbRadEtapaDest(const Value: TDbRadEtapaDest);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbRadEtapaDest : TDbRadEtapaDest read FDbRadEtapaDest write SetDbRadEtapaDest;
    property CdsRadEtapaDest : TCMClientDataSet read FCdsRadEtapaDest write SetCdsRadEtapaDest;

    function SelecionaDestEtapa( iIdRadEtapa : integer ) : OleVariant;
    function SelecionaDestProcesso( iIdRadTipoProc : integer ) : OleVariant;


  published

end;

implementation

{ TCtrlRadEtapaDest }

procedure TCtrlRadEtapaDest.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbRadEtapaDest.DataBaseName    := DataBaseName
  else
    FDbRadEtapaDest.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlRadEtapaDest.Create;
begin
  inherited;
  FDbRadEtapaDest  := TDbRadEtapaDest.Create( self );
end;

destructor TCtrlRadEtapaDest.Destroy;
begin
  FDbRadEtapaDest.Free;
  if IsAppServer then FCdsRadEtapaDest.Free;
  inherited;
end;


procedure TCtrlRadEtapaDest.OnCreateAppServer;
begin
  inherited;
  FCdsRadEtapaDest := TCMClientDataSet.Create( nil );
end;

function TCtrlRadEtapaDest.SelecionaDestEtapa( iIdRadEtapa : integer ) : OleVariant;
begin
  Result := GetDataPacket(
   ' select d.IDPESSOA    ,                   ' +
   '        d.IDRADETAPA  ,                   ' +
   '        p.NOME        ,                   ' +
   '        p.EMAIL                           ' +
   ' from   RADTIPOPROC  r,                   ' +
   '        RADETAPADEST d,                   ' +
   '        RADETAPA     e,                   ' +
   '        PESSOA       p                    ' +
   ' where  r.IDRADTIPOPROC = e.IDRADTIPOPROC ' +
   '   and  e.IDRADETAPA    = d.IDRADETAPA    ' +
   '   and  d.IDPESSOA      = p.IDPESSOA      ' +
   '   and  r.IDRADTIPOPROC = ' + IntToStr( iIdRadEtapa ) );
end;

function TCtrlRadEtapaDest.SelecionaDestProcesso(iIdRadTipoProc: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select e.IDPESSOA                      , ' +
   '        e.IDRADETAPA                    , ' +
   '        p.NOME                          , ' +
   '        p.EMAIL                           ' +
   ' from   RADTIPOPROC  r,                   ' +
   '        RADETAPADEST e,                   ' +
   '        PESSOA       p                    ' +
   ' where  r.IDRADTIPOPROC = e.IDRADTIPOPROC ' +
   '   and  e.IDPESSOA      = p.IDPESSOA      ' +
   '   and  r.IDRADTIPOPROC = ' + IntToStr( iIdRadTipoProc ) );
end;

procedure TCtrlRadEtapaDest.SetCdsRadEtapaDest( const Value: TCMClientDataSet);
begin
  FCdsRadEtapaDest := Value;
end;

procedure TCtrlRadEtapaDest.SetDbRadEtapaDest(const Value: TDbRadEtapaDest);
begin
  FDbRadEtapaDest := Value;
end;

end.

