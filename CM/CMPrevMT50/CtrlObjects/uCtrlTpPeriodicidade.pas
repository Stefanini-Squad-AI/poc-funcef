unit uCtrlTpPeriodicidade;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbTpPeriodicidade;

Type

  TCtrlTpPeriodicidade = class(TCmControlObject)
  private
    fCdsTpPeriodicidade : TCMClientDataSet;
    fDbTpPeriodicidade  : TDbTpPeriodicidade;
    procedure SetCdsTpPeriodicidade(const Value: TCMClientDataSet);
    procedure SetDbTpPeriodicidade(const Value: TDbTpPeriodicidade);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbTpPeriodicidade  : TDbTpPeriodicidade read fDbTpPeriodicidade  write SetDbTpPeriodicidade;
    property CdsTpPeriodicidade : TCMClientDataSet   read fCdsTpPeriodicidade write SetCdsTpPeriodicidade;

    function ListaTpPeriodicidade : OleVariant;
    function SelecionaTpPeriodicidade( iIdTpPeriodicidade : Integer): OleVariant;

    function GravaTpPeriodicidade : Boolean;
  published

end;

implementation

{ TCtrlTpPeriodicidade }

constructor TCtrlTpPeriodicidade.Create;
begin
  inherited;

  fDbTpPeriodicidade  := TDbTpPeriodicidade.Create(Self);
  fCdsTpPeriodicidade := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlTpPeriodicidade.Destroy;
begin
  fDbTpPeriodicidade.Free;
  fCdsTpPeriodicidade.Free;

  inherited;
end;

procedure TCtrlTpPeriodicidade.DoChangeDataBase;
begin
  inherited;
  fDbTpPeriodicidade.DataBaseName := Self.DataBaseName;
end;

function TCtrlTpPeriodicidade.GravaTpPeriodicidade: Boolean;
Var Msg : String;
Begin
  If ConnectionSide = cnsClient then
  Begin
    Result := Connection.AppServer.GravaTpPeriodicidade( CdsTpPeriodicidade.Data );

    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;

      Result := ApplyCds( CdsTpPeriodicidade, DbTpPeriodicidade, [], [] );

      Msg    := DbTpPeriodicidade.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
    Except
      on E : Exception do begin
        Result      := False;
        Rollback;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

function TCtrlTpPeriodicidade.ListaTpPeriodicidade: OleVariant;
begin
  If ConnectionSide = cnsclient Then
  Begin
    Result := Connection.AppServer.ListaTpPeriodicidade;
  End
  Else
  Begin
    Result := GetDataPacket( 'SELECT IDTPPERIODICIDADE, NOME, QTDEMESES ' +
                             'FROM TPPERIODICIDADE                      ' );
  End;
end;

function TCtrlTpPeriodicidade.SelecionaTpPeriodicidade( iIdTpPeriodicidade : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaSelecionaTpPeriodicidade( iIdTpPeriodicidade );
  end else begin
    fDbTpPeriodicidade.IdTpPeriodicidade.AsInteger := iIdTpPeriodicidade;
    Result := GetDataPacket( fDbTpPeriodicidade.sSqlSelect );
  end;
end;

procedure TCtrlTpPeriodicidade.SetCdsTpPeriodicidade(const Value: TCMClientDataSet);
begin
  fCdsTpPeriodicidade := Value;
end;

procedure TCtrlTpPeriodicidade.SetDbTpPeriodicidade(
  const Value: TDbTpPeriodicidade);
begin
  fDbTpPeriodicidade := Value;
end;

end.

 