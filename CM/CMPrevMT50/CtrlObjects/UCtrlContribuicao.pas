unit UCtrlContribuicao;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDBContribuicao, uFuncoesPrevMT50;

Type

  TCtrlContribuicao = class(TCmControlObject)
  private
    FCdsContribuicao: TCMClientDataSet;
    FDbContribuicao: TDbContribuicao;
    procedure SetCdsContribuicao(const Value: TCMClientDataSet);
    procedure SetDbContribuicao(const Value: TDbContribuicao);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbContribuicao  : TDbContribuicao     read FDbContribuicao    write SetDbContribuicao;
    property CdsContribuicao : TCMClientDataSet    read FCdsContribuicao   write SetCdsContribuicao;

    function ListaContribuicao : OleVariant;
    function SelecionaContribuicao ( iIdContribuicao : Integer ) : OleVariant;
    function ExisteContribuicao    ( iIdContribuicao : Integer ) : Boolean;

    function GravaContribuicao : Boolean;

  published

end;

implementation

{ TCtrlContribuicao }

constructor TCtrlContribuicao.Create;
begin
  inherited;
  FDbContribuicao  := TDbContribuicao.Create(Self);
  FCdsContribuicao := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlContribuicao.Destroy;
begin
  FDbContribuicao.Free;
  FCdsContribuicao.Free;
  inherited;
end;

procedure TCtrlContribuicao.DoChangeDataBase;
begin
  inherited;
  FDbContribuicao.DataBaseName := Self.DataBaseName;
end;


function TCtrlContribuicao.GravaContribuicao: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarContribuicao( CdsContribuicao.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsContribuicao, DbContribuicao, [], [] );

      Msg := DbContribuicao.MessageInfo;

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


procedure TCtrlContribuicao.SetCdsContribuicao(const Value: TCMClientDataSet);
begin
  FCdsContribuicao := Value;
end;

procedure TCtrlContribuicao.SetDbContribuicao(const Value: TDbContribuicao);
begin
  FDbContribuicao := Value;
end;

function TCtrlContribuicao.SelecionaContribuicao( iIdContribuicao : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaContribuicao( iIdContribuicao );
  end else begin
    FDbContribuicao.IdContribuicao.AsInteger := iIdContribuicao;
    Result := GetDataPacket( FDbContribuicao.SSqlSelect );
  end;
end;


function TCtrlContribuicao.ExisteContribuicao(iIdContribuicao: Integer): Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
    FDbContribuicao.IdContribuicao.AsInteger := iIdContribuicao;
    CdsContribuicao.Data := GetDataPacket( FDbContribuicao.SSqlSelect );
    Result := Not CdsContribuicao.IsEmpty;
  end;
end;


function TCtrlContribuicao.ListaContribuicao: OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaContribuicao;
  end else begin
    Result := GetDataPacket( 'SELECT IDCONTRIBUICAO, NOME '+
                             'FROM CONTRIBUICAO ORDER BY NOME ' );
  end;
end;


end.

