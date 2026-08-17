unit uCtrlWebConfiguracao;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbWebConfiguracao;

Type
  TCtrlWebConfiguracao = class(TCmControlObject)
  private
    FCdsWebConfiguracao: TCMClientDataSet;
    FDbWebConfiguracao: TDbWebConfiguracao;
    procedure SetCdsWebConfiguracao(const Value: TCMClientDataSet);
    procedure SetDbWebConfiguracao(const Value: TDbWebConfiguracao);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebConfiguracao : TDbWebConfiguracao read FDbWebConfiguracao write SetDbWebConfiguracao;
    property CdsWebConfiguracao : TCMClientDataSet read FCdsWebConfiguracao write SetCdsWebConfiguracao;

    function SelecionaWebConfiguracao : OleVariant;
    function LookupFundacao : OleVariant;
    function NomeFundacao( iIdFundacao : Integer ) : OleVariant;
    function GravaWebConfiguracao : Boolean;

  published

end;

implementation

{ TCtrlWebConfiguracao }

procedure TCtrlWebConfiguracao.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebConfiguracao.DataBaseName    := DataBaseName
  else
    FDbWebConfiguracao.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlWebConfiguracao.Create;
begin
  inherited;
  FDbWebConfiguracao  := TDbWebConfiguracao.Create( self );
end;

destructor TCtrlWebConfiguracao.Destroy;
begin
  FDbWebConfiguracao.Free;
  if IsAppServer then FCdsWebConfiguracao.Free;
  inherited;
end;

function TCtrlWebConfiguracao.GravaWebConfiguracao: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarWebConfiguracao( CdsWebConfiguracao.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsWebConfiguracao, FDbWebConfiguracao, [], [] );

      Msg := FDbWebConfiguracao.MessageInfo;

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

function TCtrlWebConfiguracao.LookupFundacao: OleVariant;
begin
  Result := GetDataPacket( ' select IDPESSOA,   ' +
                           '        NOMEEMPRESA ' +
                           '   from EMPRESAPROP ' );
end;

function TCtrlWebConfiguracao.NomeFundacao(
  iIdFundacao: Integer): OleVariant;
begin
  Result := GetDataPacket( ' select NOMEEMPRESA ' +
                           '   from EMPRESAPROP ' +
                           '  where IDPESSOA =  ' +  IntToStr( iIdFundacao ) );
end;

procedure TCtrlWebConfiguracao.OnCreateAppServer;
begin
  inherited;
  FCdsWebConfiguracao := TCMClientDataSet.Create( nil );
end;

function TCtrlWebConfiguracao.SelecionaWebConfiguracao : OleVariant;
begin
  Result := GetDataPacket( ' select *               ' +    
                           '   from WEBCONFIGURACAO ' );
end;

procedure TCtrlWebConfiguracao.SetCdsWebConfiguracao(
  const Value: TCMClientDataSet);
begin
  FCdsWebConfiguracao := Value;
end;

procedure TCtrlWebConfiguracao.SetDbWebConfiguracao(
  const Value: TDbWebConfiguracao);
begin
  FDbWebConfiguracao := Value;
end;

end.

