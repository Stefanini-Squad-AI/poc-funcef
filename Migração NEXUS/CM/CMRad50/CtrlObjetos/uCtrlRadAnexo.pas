unit uCtrlRadAnexo;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbRadAnexo, db;

Type
  TCtrlRadAnexo = class(TCmControlObject)
  private
    FCdsRadAnexo: TCMClientDataSet;
    FDbRadAnexo: TDbRadAnexo;
    procedure SetCdsRadAnexo(const Value: TCMClientDataSet);
    procedure SetDbRadAnexo(const Value: TDbRadAnexo);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbRadAnexo : TDbRadAnexo read FDbRadAnexo write SetDbRadAnexo;
    property CdsRadAnexo : TCMClientDataSet read FCdsRadAnexo write SetCdsRadAnexo;

    function SelecionaAnexo( const iIdRadAnexo: integer ): OleVariant;
    function SelecionaAnexosDoProcesso( const iIdProcesso: integer ): OleVariant;

    function Grava : Boolean;
    function NextId : integer;

    function GravaAnexo( iIdAnexo : integer; sNomeArquivo : string ) : boolean;
    function RecuperaAnexo( iIdAnexo : integer ) : OLEVariant;
    procedure ExcluiAnexo( iIdAnexo : integer );

  published

end;

implementation

{ TCtrlRadAnexo }

procedure TCtrlRadAnexo.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbRadAnexo.DataBaseName    := DataBaseName
  else
    FDbRadAnexo.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlRadAnexo.Create;
begin
  inherited;
  FDbRadAnexo  := TDbRadAnexo.Create( self );
end;

destructor TCtrlRadAnexo.Destroy;
begin
  FDbRadAnexo.Free;
  if IsAppServer then FCdsRadAnexo.Free;
  inherited;
end;


procedure TCtrlRadAnexo.OnCreateAppServer;
begin
  inherited;
  FCdsRadAnexo := TCMClientDataSet.Create( nil );
end;

procedure TCtrlRadAnexo.SetCdsRadAnexo( const Value: TCMClientDataSet);
begin
  FCdsRadAnexo := Value;
end;

function TCtrlRadAnexo.SelecionaAnexo( const iIdRadAnexo: integer): OleVariant;
begin
  FDbRadAnexo.IdRadAnexo.AsInteger := iIdRadAnexo;
  Result := GetDataPacket( FDbRadAnexo.SSqlSelect );
end;


procedure TCtrlRadAnexo.SetDbRadAnexo(const Value: TDbRadAnexo);
begin
  FDbRadAnexo := Value;
end;

function TCtrlRadAnexo.SelecionaAnexosDoProcesso(const iIdProcesso: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select r.IDRADANEXO  ,            ' +
   '        r.IDPROCESSO  ,            ' +
   '        r.IDUSUARIO   ,            ' +
   '        r.DESCRICAO   ,            ' +
   '        r.DATAHORA    ,            ' +
   '        r.NOMEARQUIVO ,            ' +
   '        u.NOMEUSUARIO              ' +
   ' from   RADANEXO       r ,         ' +
   '        USUARIOSISTEMA u           ' +
   ' where  r.IDUSUARIO  = u.IDUSUARIO ' +
   '   and  r.IDPROCESSO =  ' + IntToStr( iIdProcesso ) +
   ' order by r.DATAHORA ' );
end;

function TCtrlRadAnexo.Grava: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.Grava( FCdsRadAnexo.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsRadAnexo, FDbRadAnexo, [], [] );

      Msg := FDbRadAnexo.MessageInfo;

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

function TCtrlRadAnexo.GravaAnexo( iIdAnexo: integer; sNomeArquivo : string ) : boolean;
var
  cdsAux : TCMClientDataset;
  Msg : string;
  bOk : boolean;
begin
  cdsAux := TCMClientDataset.Create( nil );
  try

    try
      Result := False;

      cdsAux.Data := GetDataPacket(
       ' select * from RADANEXO where IDRADANEXO = ' + IntToStr( iIdAnexo ) );

      cdsAux.Edit;
      ( cdsAux.FieldByName('CONTEUDO') as TBlobField ).LoadFromFile( sNomeArquivo );
      cdsAux.Post;

      bOk := ApplyCds( cdsAux, FDbRadAnexo, [], [] );

      Msg := FDbRadAnexo.MessageInfo;

      if not bOk then raise Exception.Create( Msg );

      result := True;

    except
      On E : exception do
      begin
        Result := False;
        MessageInfo := E.Message;
      end;
    end;

  finally
    cdsAux.Free;
  end;

end;

function TCtrlRadAnexo.NextId: integer;
begin
  Result := GetSequence( 'RADANEXO' );
end;

procedure TCtrlRadAnexo.ExcluiAnexo(iIdAnexo: integer);
begin
  ExecSQL( ' delete from radanexo where idradanexo = ' + IntToStr( iIdAnexo ) );
end;

function TCtrlRadAnexo.RecuperaAnexo(iIdAnexo: integer): OLEVariant;
begin
  Result := GetDataPacket( 'select CONTEUDO from RADANEXO where IDRADANEXO = ' + IntToStr( iIdAnexo ) );
end;

end.

