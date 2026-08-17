unit uCtrlWebTransfDados;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbWebTransfDados;

Type
  TCtrlWebTransfDados = class(TCmControlObject)
  private
    FCdsWebTransfDados: TCMClientDataSet;
    FDbWebTransfDados: TDbWebTransfDados;
    procedure SetCdsWebTransfDados(const Value: TCMClientDataSet);
    procedure SetDbWebTransfDados(const Value: TDbWebTransfDados);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebTransfDados : TDbWebTransfDados read FDbWebTransfDados write SetDbWebTransfDados;
    property CdsWebTransfDados : TCMClientDataSet read FCdsWebTransfDados write SetCdsWebTransfDados;

    function SelecionaWebTransfDados( iIdWebTransfDados : integer ) : OleVariant;
    function LookupDtTransf( sSituacao : String ) : OleVariant;
    function GravaWebTransfDados( bStartTransaction : boolean = True ) : Boolean;

    function ProximoId : integer;
    function UltimoSincronizado : OleVariant;
    function UltimoIdSincronizado : integer;

  published

end;

implementation

{ TCtrlWebTransfDados }

constructor TCtrlWebTransfDados.Create;
begin
  inherited;
  FDbWebTransfDados  := TDbWebTransfDados.Create( Self );
end;

destructor TCtrlWebTransfDados.Destroy;
begin
  FDbWebTransfDados.Free;
  if IsAppServer then FCdsWebTransfDados.Free;
  inherited;
end;

procedure TCtrlWebTransfDados.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebTransfDados.DataBaseName    := DataBaseName
  else
    FDbWebTransfDados.dbADOConnection := dbADOConnection;
end;

function TCtrlWebTransfDados.GravaWebTransfDados( bStartTransaction : boolean = True ): Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarWebTransfDados( CdsWebTransfDados.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      if bStartTransaction then StartTransaction;

      Result := ApplyCds( FCdsWebTransfDados, FDbWebTransfDados, [], [] );

      Msg := FDbWebTransfDados.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      if bStartTransaction then Commit;
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

procedure TCtrlWebTransfDados.OnCreateAppServer;
begin
  inherited;
  FCdsWebTransfDados := TCMClientDataSet.Create( nil );
end;

function TCtrlWebTransfDados.SelecionaWebTransfDados(
  iIdWebTransfDados : integer ) : OleVariant;
begin
  if ConnectionSide = cnsClient then
    Result := Connection.AppServer.SelecionaWebTransfDados( iIdWebTransfDados )
  else
  begin
    FDbWebTransfDados.IdWebTransfDados.AsInteger := iIdWebTransfDados;
    Result := GetDataPacket( FDbWebTransfDados.SSqlSelect );
  end;
end;

procedure TCtrlWebTransfDados.SetCdsWebTransfDados(
  const Value: TCMClientDataSet);
begin
  FCdsWebTransfDados := Value;
end;

procedure TCtrlWebTransfDados.SetDbWebTransfDados(
  const Value: TDbWebTransfDados);
begin
  FDbWebTransfDados := Value;
end;

function TCtrlWebTransfDados.ProximoId: integer;
var
  cdsProximoId : TCMClientDataSet;
begin
  cdsProximoId := TCMClientDataSet.Create( nil );
  try
    cdsProximoId.Data := GetDataPacket( ' select max( IDWEBTRANSFDADOS ) as ULTIMO ' +
                                        ' from   WEBTRANSFDADOS                    ' );

    Result := cdsProximoId.FieldByName('ULTIMO').AsInteger + 1;
  finally
    cdsProximoId.Free;
  end;
end;

function TCtrlWebTransfDados.LookupDtTransf( sSituacao : String ): OleVariant;
var
  sOper : String;
begin
  if sSituacao = '1' then
    sOper := ' = '
  else
    sOper := ' > ';

  Result := GetDataPacket( '   select IDWEBTRANSFDADOS,        ' +
                           '          DTTRANSF,                ' +
                           '          SITUACAO,                ' +
                           '          NOMEBASE                 ' +
                           '     from WEBTRANSFDADOS           ' +
                           '    where SITUACAO ' + sOper + ' 1 ' +
                           ' order by IDWEBTRANSFDADOS desc    ' );
end;

function TCtrlWebTransfDados.UltimoSincronizado : OleVariant;
begin
  Result := GetDataPacket(
   ' select IDWEBTRANSFDADOS,                                                           ' +
   '        DTTRANSF,                                                                   ' +
   '        SITUACAO,                                                                   ' +
   '        NOMEBASE                                                                    ' +
   '   from WEBTRANSFDADOS                                                              ' +
   '  where SITUACAO         = 2                                                        ' +
   '    AND IDWEBTRANSFDADOS = ( select NVL( max( IDWEBTRANSFDADOS ), 0 ) + 1 as ULTIMO ' +
   '                               from WEBTRANSFDADOS                                  ' +
   '                              where SITUACAO = 3  )                                 ' );
end;

function TCtrlWebTransfDados.UltimoIdSincronizado: integer;
var
  cdsProximoId : TCMClientDataSet;
begin
  cdsProximoId := TCMClientDataSet.Create( nil );
  try
    cdsProximoId.Data := GetDataPacket( ' select NVL( max( IDWEBTRANSFDADOS ), 0 ) + 1 as ULTIMO ' +
                                        '   from WEBTRANSFDADOS                                  ' +
                                        '  where SITUACAO = 3                                    ' );

    Result := cdsProximoId.FieldByName('ULTIMO').AsInteger;
  finally
    cdsProximoId.Free;
  end;
end;

end.
