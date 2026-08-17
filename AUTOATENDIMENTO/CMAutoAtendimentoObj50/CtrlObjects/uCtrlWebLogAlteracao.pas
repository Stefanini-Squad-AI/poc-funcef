unit uCtrlWebLogAlteracao;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbWebLogAlteracao;

Type
  TCtrlWebLogAlteracao = class(TCmControlObject)
  private
    FCdsWebLogAlteracao: TCMClientDataSet;
    FDbWebLogAlteracao: TDbWebLogAlteracao;
    procedure SetCdsWebLogAlteracao(const Value: TCMClientDataSet);
    procedure SetDbWebLogAlteracao(const Value: TDbWebLogAlteracao);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebLogAlteracao : TDbWebLogAlteracao read FDbWebLogAlteracao write SetDbWebLogAlteracao;
    property CdsWebLogAlteracao : TCMClientDataSet read FCdsWebLogAlteracao write SetCdsWebLogAlteracao;

    function SelecionaWebLogAlteracao( iIdWebLogAlteracao : integer ) : OleVariant;
    function SelecionaWebLogAlteracaoEmAberto : OleVariant;
    function SelecionaWebLogAlteracaoPorWebTransfDados( iIdWebTransfDados : integer ) : OleVariant;
    function GravaWebLogAlteracao : Boolean;
    function ProximoId : integer;

    function NomeUsuarioSistema( sUsuarioOracle : string ) : string;

  published

end;

implementation

{ TCtrlWebLogAlteracao }

constructor TCtrlWebLogAlteracao.Create;
begin
  inherited;
  FDbWebLogAlteracao  := TDbWebLogAlteracao.Create( Self );
end;

destructor TCtrlWebLogAlteracao.Destroy;
begin
  FDbWebLogAlteracao.Free;
  if IsAppServer then FCdsWebLogAlteracao.Free;
  inherited;
end;

procedure TCtrlWebLogAlteracao.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebLogAlteracao.DataBaseName    := DataBaseName
  else
    FDbWebLogAlteracao.dbADOConnection := dbADOConnection;
end;

function TCtrlWebLogAlteracao.GravaWebLogAlteracao: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarWebLogAlteracao( CdsWebLogAlteracao.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsWebLogAlteracao, FDbWebLogAlteracao, [], [] );

      Msg := FDbWebLogAlteracao.MessageInfo;

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

procedure TCtrlWebLogAlteracao.OnCreateAppServer;
begin
  inherited;
  FCdsWebLogAlteracao := TCMClientDataSet.Create( nil );
end;

function TCtrlWebLogAlteracao.SelecionaWebLogAlteracao(
  iIdWebLogAlteracao : integer ) : OleVariant;
begin
  if ConnectionSide = cnsClient then
    Result := Connection.AppServer.SelecionaWebLogAlteracao( iIdWebLogAlteracao )
  else
  begin
    FDbWebLogAlteracao.Idweblogalteracao.AsInteger := iIdWebLogAlteracao;
    Result := GetDataPacket( FDbWebLogAlteracao.SSqlSelect );
  end;
end;

procedure TCtrlWebLogAlteracao.SetCdsWebLogAlteracao(
  const Value: TCMClientDataSet);
begin
  FCdsWebLogAlteracao := Value;
end;

procedure TCtrlWebLogAlteracao.SetDbWebLogAlteracao(
  const Value: TDbWebLogAlteracao);
begin
  FDbWebLogAlteracao := Value;
end;

function TCtrlWebLogAlteracao.ProximoId: integer;
begin
  Result := FDbWebLogAlteracao.ProximoId; 
end;

function TCtrlWebLogAlteracao.SelecionaWebLogAlteracaoEmAberto: OleVariant;
begin
  Result := GetDataPacket(
    '   select w.IDWEBLOGALTERACAO,                                 ' +
    '          w.IDWEBTRANSFDADOS,                                  ' +
    '          w.DATAHORA,                                          ' +
    '          w.OPERACAO,                                          ' +
    '          w.CHAVEPRIMARIA,                                     ' +
    '          w.NOMECAMPO,                                         ' +
    '          w.USUARIO,                                           ' +
    '          w.VALORATUAL,                                        ' +
    '          w.VALORANTERIOR,                                     ' +
    '          w.TABELA,                                            ' +
    '          w.LOTE                                               ' +
    '     from WEBLOGALTERACAO w                                    ' +
    '    where w.IDWEBTRANSFDADOS is null                           ' +
    ' order by w.IDWEBLOGALTERACAO                                  ' );
end;

function TCtrlWebLogAlteracao.SelecionaWebLogAlteracaoPorWebTransfDados(
  iIdWebTransfDados: integer): OleVariant;
begin
  Result := GetDataPacket(
    '   select w.IDWEBLOGALTERACAO,                                 ' +
    '          w.IDWEBTRANSFDADOS,                                  ' +
    '          w.DATAHORA,                                          ' +
    '          w.OPERACAO,                                          ' +
    '          w.CHAVEPRIMARIA,                                     ' +
    '          w.NOMECAMPO,                                         ' +
    '          w.USUARIO,                                           ' +
    '          w.VALORATUAL,                                        ' +
    '          w.VALORANTERIOR,                                     ' +
    '          w.TABELA,                                            ' +
    '          w.LOTE                                               ' +
    '     from WEBLOGALTERACAO w                                    ' +
    '    where w.IDWEBTRANSFDADOS = ' + IntToStr( iIdWebTransfDados ) +
    ' order by w.IDWEBLOGALTERACAO                                  ' );

end;

function TCtrlWebLogAlteracao.NomeUsuarioSistema( sUsuarioOracle: string ): string;
var
  cdsLocal : TCMClientDataSet;
  sIdUsuario : string;
  sPrefixo : string;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try
    sPrefixo   := UpperCase( Copy( sUsuarioOracle, 1, 2 ) );
    sIdUsuario := Copy( sUsuarioOracle, 3, length( sUsuarioOracle ) - 2 );

    if sPrefixo = 'CM' then
    begin

      if StrToIntDef( sIdUsuario, 0 ) = 0 then
        Result := sUsuarioOracle + '*'
      else
      begin

        cdsLocal.Data := GetDataPacket(
         ' select NOMEUSUARIO    ' +
         ' from   USUARIOSISTEMA ' +
         ' where  IDUSUARIO =    ' + sIdUsuario );

        Result := cdsLocal.FieldByName('NOMEUSUARIO').AsString + '**';

      end;

    end
    else
      Result := sUsuarioOracle + '*';

  finally
    cdsLocal.Free;
  end;
end;

end.

