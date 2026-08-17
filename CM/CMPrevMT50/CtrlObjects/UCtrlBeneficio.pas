unit UCtrlBeneficio;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbBeneficio, uFuncoesPrevMT50;

Type

  TCtrlBeneficio = class(TCmControlObject)
  private
    FCdsBeneficio: TCMClientDataSet;
    FDbBeneficio: TDbBeneficio;
    procedure SetCdsBeneficio(const Value: TCMClientDataSet);
    procedure SetDbBeneficio(const Value: TDbBeneficio);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbBeneficio  : TDbBeneficio     read FDbBeneficio  write SetDbBeneficio;
    property CdsBeneficio : TCMClientDataSet read FCdsBeneficio write SetCdsBeneficio;

    function ListaBeneficio : OleVariant;
    function SelecionaBeneficio ( iIdBeneficio : Integer ) : OleVariant;
    function ExisteBeneficio    ( iIdBeneficio : Integer ) : Boolean;

    function GravaBeneficio : Boolean;

  published

end;

implementation

{ TCtrlBeneficio }

constructor TCtrlBeneficio.Create;
begin
  inherited;
  FDbBeneficio  := TDbBeneficio.Create(Self);
  FCdsBeneficio := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlBeneficio.Destroy;
begin
  FDbBeneficio.Free;
  FCdsBeneficio.Free;
  inherited;
end;

procedure TCtrlBeneficio.DoChangeDataBase;
begin
  inherited;
  FDbBeneficio.DataBaseName := Self.DataBaseName;
end;


function TCtrlBeneficio.GravaBeneficio: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarBeneficio( CdsBeneficio.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsBeneficio, DbBeneficio, [], [] );

      Msg := DbBeneficio.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;


procedure TCtrlBeneficio.SetCdsBeneficio(const Value: TCMClientDataSet);
begin
  FCdsBeneficio := Value;
end;

procedure TCtrlBeneficio.SetDbBeneficio(const Value: TDbBeneficio);
begin
  FDbBeneficio := Value;
end;

function TCtrlBeneficio.SelecionaBeneficio( iIdBeneficio : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaBeneficio( iIdBeneficio );
  end else begin
    FDbBeneficio.IdBeneficio.AsInteger := iIdBeneficio;
    Result := GetDataPacket( FDbBeneficio.SSqlSelect );
  end;
end;


function TCtrlBeneficio.ExisteBeneficio(iIdBeneficio: Integer): Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
    FDbBeneficio.IdBeneficio.AsInteger := iIdBeneficio;
    CdsBeneficio.Data := GetDataPacket( FDbBeneficio.SSqlSelect );
    Result := Not CdsBeneficio.IsEmpty;
  end;
end;


function TCtrlBeneficio.ListaBeneficio: OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaBeneficio;
  end else begin
    Result := GetDataPacket( 'SELECT IDBENEFICIO, NOME '+
                             'FROM BENEFICIO ORDER BY NOME ' );
  end;
end;


end.

