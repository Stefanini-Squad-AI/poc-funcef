unit uCtrlTpPagtoBeneficio;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbTpPagtoBeneficio;

Type

  TCtrlTpPagtoBeneficio = class(TCmControlObject)
  private
    fCdsTpPagtoBeneficio : TCMClientDataSet;
    fDbTpPagtoBeneficio  : TDbTpPagtoBeneficio;
    procedure SetCdsTpPagtoBeneficio(const Value: TCMClientDataSet);
    procedure SetDbTpPagtoBeneficio(const Value: TDbTpPagtoBeneficio);
  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbTpPagtoBeneficio  : TDbTpPagtoBeneficio read fDbTpPagtoBeneficio  write SetDbTpPagtoBeneficio;
    property CdsTpPagtoBeneficio : TCMClientDataSet   read fCdsTpPagtoBeneficio write SetCdsTpPagtoBeneficio;

    function ListaTpPagtoBeneficio : OleVariant;
    function SelecionaTpPagtoBeneficio(iIdTpPagtoBeneficio: Integer): OleVariant;
    function GravaTpPagtoBeneficio : Boolean;
  published

end;

implementation

{ TCtrlTpPagtoBeneficio }

constructor TCtrlTpPagtoBeneficio.Create;
begin
  inherited;

  fDbTpPagtoBeneficio  := TDbTpPagtoBeneficio.Create(Self);
  fCdsTpPagtoBeneficio := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlTpPagtoBeneficio.Destroy;
begin
  fDbTpPagtoBeneficio.Free;
  fCdsTpPagtoBeneficio.Free;

  inherited;
end;

procedure TCtrlTpPagtoBeneficio.DoChangeDataBase;
begin
  inherited;
  fDbTpPagtoBeneficio.DataBaseName := Self.DataBaseName;
end;

function TCtrlTpPagtoBeneficio.GravaTpPagtoBeneficio: Boolean;
Var Msg : String;
Begin
  If ConnectionSide = cnsClient then
  Begin
    Result := Connection.AppServer.GravaTpPagtoBeneficio( CdsTpPagtoBeneficio.Data );

    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;

      Result := ApplyCds( CdsTpPagtoBeneficio, DbTpPagtoBeneficio, [], [] );

      Msg    := DbTpPagtoBeneficio.MessageInfo;

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

function TCtrlTpPagtoBeneficio.ListaTpPagtoBeneficio: OleVariant;
begin
  If ConnectionSide = cnsclient Then
  Begin
    Result := Connection.AppServer.ListaTpPagtoBeneficio;
  End
  Else
  Begin
    Result := GetDataPacket( 'SELECT IDTPPAGTOBENEFIC, NOME, IDTPPERIODICIDADE, ' +
                             '       FLGFREQUENCIA, FLGPRAZOCERTO, QTDEMESES    ' +
                             'FROM TPPAGTOBENEFICIO                             ' );

  End;
end;

function TCtrlTpPagtoBeneficio.SelecionaTpPagtoBeneficio( iIdTpPagtoBeneficio : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaTpPagtoBeneficio( iIdTpPagtoBeneficio );
  end else begin
    fDbTpPagtoBeneficio.Idtppagtobenefic.AsInteger := iIdTpPagtoBeneficio;
    Result := GetDataPacket( fDbTpPagtoBeneficio.sSqlSelect );
  end;
end;

procedure TCtrlTpPagtoBeneficio.SetCdsTpPagtoBeneficio(const Value: TCMClientDataSet);
begin
  fCdsTpPagtoBeneficio := Value;
end;

procedure TCtrlTpPagtoBeneficio.SetDbTpPagtoBeneficio(
  const Value: TDbTpPagtoBeneficio);
begin
  fDbTpPagtoBeneficio := Value;
end;

end.

 