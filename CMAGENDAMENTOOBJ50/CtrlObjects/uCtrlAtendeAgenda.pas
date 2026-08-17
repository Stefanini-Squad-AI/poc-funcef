unit uCtrlAtendeAgenda;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbAtendeAgenda, JCLSysUtils;

Type
  TCtrlAtendeAgenda = class(TCmControlObject)
  private
    FCdsAtendeAgenda: TCMClientDataSet;
    FDbAtendeAgenda: TDbAtendeAgenda;
    procedure SetCdsAtendeAgenda(const Value: TCMClientDataSet);
    procedure SetDbAtendeAgenda(const Value: TDbAtendeAgenda);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbAtendeAgenda : TDbAtendeAgenda read FDbAtendeAgenda write SetDbAtendeAgenda;
    property CdsAtendeAgenda : TCMClientDataSet read FCdsAtendeAgenda write SetCdsAtendeAgenda;

    function SelecionaAtendeAgenda( iIdAtendeAgenda : integer ) : OleVariant;
    function GravaAtendeAgenda : Boolean;

    function UsuariosNaoAtendentes : OLEVariant;
    function UsuariosAtendentes    : OLEVariant;

    function UsuariosAssociados( iIdGrupoAtende : integer ) : OLEVariant;
    function LookupAtendentes : OLEVariant;
    function UsuarioEAtendente( iIdUsuario : integer ) : boolean;
    function AtendentePorUsuario( iIdUsuario : integer ) : integer;

    function MontaSelect( sSQL : string ) : string;

  published

end;

implementation

{ TCtrlAtendeAgenda }

procedure TCtrlAtendeAgenda.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbAtendeAgenda.DataBaseName    := DataBaseName
  else
    FDbAtendeAgenda.DbAdoConnection := DbAdoConnection;
end;

function TCtrlAtendeAgenda.AtendentePorUsuario( iIdUsuario: integer): integer;
var
  cdsAux : TCmClientDataset;
begin
  cdsAux := TCmClientDataset.Create( nil );
  try
    cdsAux.Data := GetDataPacket(
     ' select IDATENDEAGENDA                         ' +
     ' from   ATENDEAGENDA                           ' +
     ' where  IDUSUARIO = ' + IntToStr( iIdUsuario ) ) ;
    Result := cdsAux.FieldByName('IDATENDEAGENDA').AsInteger;
  finally
    cdsAux.Free;
  end;
end;

constructor TCtrlAtendeAgenda.Create;
begin
  inherited;
  FDbAtendeAgenda  := TDbAtendeAgenda.Create( self );
end;

destructor TCtrlAtendeAgenda.Destroy;
begin
  inherited;
  FDbAtendeAgenda.Free;
  if IsAppServer then FCdsAtendeAgenda.Free;
end;

function TCtrlAtendeAgenda.GravaAtendeAgenda: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaAtendeAgenda( CdsAtendeAgenda.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds( FCdsAtendeAgenda, FDbAtendeAgenda, [], [] );
      Msg := FDbAtendeAgenda.MessageInfo;
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

function TCtrlAtendeAgenda.LookupAtendentes : OLEVariant;
begin
  Result := GetDataPacket(
   ' SELECT A.IDATENDEAGENDA,         ' +
   '        U.NOMEUSUARIO,            ' +
   '        P.NOME                    ' +
   ' FROM   ATENDEAGENDA   A,         ' +
   '        USUARIOSISTEMA U,         ' +
   '        PESSOA         P          ' +
   ' WHERE  A.IDUSUARIO = U.IDUSUARIO ' +
   '   AND  U.IDUSUARIO = P.IDPESSOA  ' +
   ' ORDER by 3                       ' );
end;

function TCtrlAtendeAgenda.MontaSelect( sSQL : string ): string;
begin
{
SELECT
   P.NOME AS C0,
   DECODE( T.INSCRICAONUMERO, '''', ''Elegível'', ''Participante'' ) AS TIPO ,
   E.MATRICULA AS C2,
   T.INSCRICAONUMERO AS C3,
   S.NOME AS PATROCINADORA,
   N.NOME AS PLANO,
   E.IDPESSOA AS C6
FROM
   ELEGPATRO E,
   PESSOA P,
   PARTPREVPLAN T,
   PATRO R,
   PESSOA S,
   PLANPREV N
WHERE
   ( E.IDPESSOA    = P.IDPESSOA ) AND
   ( E.IDPESSOA    = T.IDPESSOA (+) ) AND
   ( E.IDPESSJUR   = T.IDPESSJUR (+) ) AND
   ( ( ( T.FLGDESATIVADO = 0 ) OR ( T.FLGDESATIVADO IS NULL ) ) ) AND
   ( E.IDPESSJUR   = R.IDPESSOA ) AND
   ( R.IDPESSOA    = S.IDPESSOA ) AND
   ( T.IDPLANOPREV = N.IDPLANOPREV (+) )
 ORDER BY C0 ASC
}
end;

procedure TCtrlAtendeAgenda.OnCreateAppServer;
begin
  inherited;
  FCdsAtendeAgenda := TCMClientDataSet.Create( nil );
end;

function TCtrlAtendeAgenda.SelecionaAtendeAgenda( iIdAtendeAgenda: integer ): OleVariant;
begin
  FDbAtendeAgenda.IdAtendeAgenda.AsInteger := iIdAtendeAgenda;
  Result := GetDataPacket( FDbAtendeAgenda.SSqlSelect );
end;

procedure TCtrlAtendeAgenda.SetCdsAtendeAgenda( const Value: TCMClientDataSet );
begin
  FCdsAtendeAgenda := Value;
end;

procedure TCtrlAtendeAgenda.SetDbAtendeAgenda( const Value: TDbAtendeAgenda );
begin
  FDbAtendeAgenda := Value;
end;

function TCtrlAtendeAgenda.UsuarioEAtendente( iIdUsuario : integer ): boolean;
var
  cdsAux : TCmClientDataset;
begin
  cdsAux := TCmClientDataset.Create( nil );
  try
    cdsAux.Data := GetDataPacket(
     ' select IDATENDEAGENDA                         ' +
     ' from   ATENDEAGENDA                           ' +
     ' where  IDUSUARIO = ' + IntToStr( iIdUsuario ) ) ;
    Result := not ( cdsAux.IsEmpty );
  finally
    cdsAux.Free;
  end;
end;

function TCtrlAtendeAgenda.UsuariosAssociados(iIdGrupoAtende: integer): OLEVariant;
begin
  Result := GetDataPacket(
   ' select   A.IDATENDEAGENDA,           ' +
   '          A.IDUSUARIO,                ' +
   '          U.NOMEUSUARIO ,             ' +
   '          P.NOME                      ' +
   ' from     USUARIOSISTEMA U,           ' +
   '          PESSOA         P,           ' +
   '          ATENDEAGENDA   A            ' +
   ' where    P.IDPESSOA   = U.IDUSUARIO  ' +
   '   and    U.IDUSUARIO  = A.IDUSUARIO  ' +
   '   and    A.IDGRUPOATENDE ' + Iff( iIdGrupoAtende > -1, ' = ' + IntToStr( iIdGrupoAtende ), ' is null ' ) +
   ' order by U.NOMEUSUARIO               ' );
end;

function TCtrlAtendeAgenda.UsuariosAtendentes: OLEVariant;
begin
  Result := GetDataPacket(
   ' select   A.IDATENDEAGENDA,                ' +
   '          A.IDUSUARIO,                     ' +
   '          U.NOMEUSUARIO ,                  ' +
   '          P.NOME                           ' +
   ' from     USUARIOSISTEMA U,                ' +
   '          PESSOA         P,                ' +
   '          ATENDEAGENDA   A                 ' +
   ' where    P.IDPESSOA   = U.IDUSUARIO       ' +
   '   and    U.IDUSUARIO  = A.IDUSUARIO       ' +
   '   and    U.DESATIVADO in ( ''N'', ''X'' ) ' +
   ' order by U.NOMEUSUARIO                    ' );
end;

function TCtrlAtendeAgenda.UsuariosNaoAtendentes: OLEVariant;
begin
  Result := GetDataPacket(
   ' select   U.IDUSUARIO,                                              ' +
   '          U.NOMEUSUARIO ,                                           ' +
   '          P.NOME                                                    ' +
   ' from     USUARIOSISTEMA U,                                         ' +
   '          PESSOA         P                                          ' +
   ' where    P.IDPESSOA   = U.IDUSUARIO                                ' +
   '   and    U.DESATIVADO in ( ''N'', ''X'' )                          ' +
   '   and    U.IDUSUARIO not in ( select IDUSUARIO from ATENDEAGENDA ) ' +
   ' order by U.NOMEUSUARIO                                             ' );
end;

end.

