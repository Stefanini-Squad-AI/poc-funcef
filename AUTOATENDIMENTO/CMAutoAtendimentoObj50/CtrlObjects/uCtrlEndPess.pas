unit uCtrlEndPess;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDb_EndPess;

Type
  TCtrlEndPess = class(TCmControlObject)
  private
    FCdsWebEndereco: TCMClientDataSet;
    FDb_EndPess: TDb_EndPess;
    procedure SetCdsWebEndereco(const Value: TCMClientDataSet);
    procedure SetDb_EndPess(const Value: TDb_EndPess);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property Db_EndPess : TDb_EndPess read FDb_EndPess write SetDb_EndPess;
    property CdsWebEndereco : TCMClientDataSet read FCdsWebEndereco write SetCdsWebEndereco;

    function SelecionaEnderecosPorPessoa( sIdPessoa : String ) : OleVariant;
    function SelecionaCidades : OleVariant;
    function SelecionaEndereco( sIdEndereco : String ) : OleVariant;
    function SelecionaEnderecoPessoa( sIdEndereco : String ) : OleVariant;
    function GravaWebEndereco : Boolean;


  published

end;

implementation

{ TCtrlEndPess }

procedure TCtrlEndPess.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDb_EndPess.DataBaseName    := DataBaseName
  else
    FDb_EndPess.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlEndPess.Create;
begin
  inherited;
  FDb_EndPess  := TDb_EndPess.Create( self );
end;

destructor TCtrlEndPess.Destroy;
begin
  FDb_EndPess.Free;
  if IsAppServer then FCdsWebEndereco.Free;
  inherited;
end;

function TCtrlEndPess.GravaWebEndereco: Boolean;
var
  Msg : String; 
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaWebEndereco( FCdsWebEndereco.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsWebEndereco, FDb_EndPess, [], [] );

      Msg := FDb_EndPess.MessageInfo;

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

procedure TCtrlEndPess.OnCreateAppServer;
begin
  inherited;
  FCdsWebEndereco := TCMClientDataSet.Create( nil );
end;

function TCtrlEndPess.SelecionaCidades: OleVariant;
begin
  Result := GetDataPacket(
   '   select c.IDCIDADES,                         ' +
   '          trim( c.NOME ) as NOMECIDADE,        ' +
   '          e.CODESTADO                          ' +
   '     from CIDADES c,                           ' +
   '          ESTADO e                             ' +
   '    where c.IDESTADO = e.IDESTADO              ' +
   ' order by NOMECIDADE                           ' );
end;

function TCtrlEndPess.SelecionaEndereco(
  sIdEndereco: String): OleVariant;
begin
  FDb_EndPess.Idendereco.AsString := sIdEndereco;
  Result := GetDataPacket( FDb_EndPess.SSqlSelect );
end;

function TCtrlEndPess.SelecionaEnderecoPessoa(
  sIdEndereco: String): OleVariant;
begin
  Result := GetDataPacket(
   ' select     e.IDENDERECO,                                                                    ' +
   '            e.LOGRADOURO,                                                                    ' +
   '            e.NUMERO,                                                                        ' +
   '            e.COMPLEMENTO,                                                                   ' +
   '            e.BAIRRO,                                                                        ' +
   '            c.NOME as CIDADE,                                                                ' +
   '            s.NOMEESTADO as ESTADO,                                                          ' +
   '            e.CEP,                                                                           ' +
   '            e.NOME as TIPOEND,                                                               ' +
   '            e.IDCIDADES,                                                                     ' +
   '            pe.IDENDCORRESP,                                                                 ' +
   '            pe.IDENDCOMERCIAL,                                                               ' +
   '            pe.IDENDENTREGA,                                                                 ' +
   '            pe.IDENDRESIDENCIAL,                                                             ' +
   '            pe.IDENDCOBRANCA                                                                 ' +
   ' from       ENDPESS e,                                                                       ' +
   '            CIDADES c,                                                                       ' +
   '            PESSOA pe,                                                                       ' +
   '            ESTADO s                                                                         ' +
   ' where      e.IDENDERECO = ' + QuotedStr( sIdEndereco )                                        +
   '   and      e.IDPESSOA   = pe.IDPESSOA  (+)                                                  ' +
   '   and      e.IDCIDADES  = c.IDCIDADES  (+)                                                  ' +
   '   and      c.IDESTADO   = s.IDESTADO                                                        ' );

end;

function TCtrlEndPess.SelecionaEnderecosPorPessoa(sIdPessoa: String): OleVariant;
begin
  Result := GetDataPacket(
   ' select     e.IDENDERECO,                                               ' +
   '            e.LOGRADOURO,                                               ' +
   '            e.NUMERO,                                                   ' +
   '            e.COMPLEMENTO,                                              ' +
   '            e.BAIRRO,                                                   ' +
   '            c.NOME as CIDADE,                                           ' +
   '            s.CODESTADO,                                                ' +
   '            e.CEP,                                                      ' +
   '            e.NOME as TIPOEND                                           ' +
   ' from       ENDPESS e,                                                  ' +
   '            CIDADES c,                                                  ' +
   '            PESSOA pe,                                                  ' +
   '            ESTADO s                                                    ' +
   ' where      e.IDPESSOA  = ' + QuotedStr( sIdPessoa )                      +
   '   and      e.IDCIDADES = c.IDCIDADES  (+)                              ' +
   '   and      c.IDESTADO  = s.IDESTADO   (+)                              ' +
   '   and      e.IDPESSOA  = pe.IDPESSOA                                   ' );
end;

procedure TCtrlEndPess.SetCdsWebEndereco(const Value: TCMClientDataSet);
begin
  FCdsWebEndereco := Value;
end;

procedure TCtrlEndPess.SetDb_EndPess(const Value: TDb_EndPess);
begin
  FDb_EndPess := Value;
end;

end.
