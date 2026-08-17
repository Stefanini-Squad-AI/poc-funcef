{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 20/03/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlFeriado;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbFeriado;

Type
  TCtrlFeriado = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbFeriado: TDbFeriado;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds: TClientDataSet read Fcds write Setcds;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    Function  ListaFeriado( IdPais: Double = 0; IdEstado: Double = 0;
                            IdCidade: Double = 0; IdSindicato: Double = 0;
                            IdFeriado: Double = 0; dData: TDateTime = 0 ): OleVariant;
    Function  ListaFeriadoCidade( IdCidade: Double ): OleVariant;
    Function  ListaFeriadoData( dData: TDateTime ): OleVariant;
    Function  ListaFeriadoEstado( IdEstado: Double ): OleVariant;
    Function  ListaFeriadoFeriado( IdFeriado: Double ): OleVariant;
    Function  ListaFeriadoSindicato( IdSindicato: Double ): OleVariant;
    Function  ListaFeriadoPais( IdPais: Double ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

constructor TCtrlFeriado.Create;
begin
  inherited;
  _DbFeriado := TDbFeriado.Create(Self);
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlFeriado.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbFeriado.Free;

  inherited;
end;

procedure TCtrlFeriado.DoChangeDataBase;
begin
  inherited;
  _DbFeriado.DataBaseName := DatabaseName;
end;

function TCtrlFeriado.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarFeriado( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbFeriado, [], [] );
        Msg    := _DbFeriado.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Commit;
     Except
        On E:Exception Do
        Begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

function TCtrlFeriado.ListaFeriado( IdPais: Double; IdEstado: Double;
         IdCidade: Double; IdSindicato: Double; IdFeriado: Double; dData: TDateTime ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT F.DATAFERIADO, F.IDSINDICATO, F.IDFERIADO, F.IDCIDADES, F.CODESTADO, ' +
         'F.IDPAIS, F.DESCFERIADO, F.IDESTADO, F.FLGTIPO, F.FLGAMBITO, P.NOMEPAIS, ' +
         'E.NOMEESTADO, C.NOME AS NOMECIDADE, A.NOME AS NOMESINDICATO ' +
         'FROM FERIADOS F, PAIS P, ESTADO E, CIDADES C, PESSOA A ' +
         'WHERE ';

  If IdPais <> 0 Then
     Sql := Sql + 'F.IDPAIS = ' + FloatToStr( IdPais ) + ' AND ';

  If IdEstado <> 0 Then
     Sql := Sql + 'F.IDESTADO = ' + FloatToStr( IdEstado ) + ' AND ';

  If IdCidade <> 0 Then
     Sql := Sql + 'F.IDCIDADES = ' + FloatToStr( IdCidade ) + ' AND ';

  If IdSindicato <> 0 Then
     Sql := Sql + 'F.IDSINDICATO = ' + FloatToStr( IdSindicato ) + ' AND ';

  If IdFeriado <> 0 Then
     Sql := Sql + 'F.IDFERIADO = ' + FloatToStr( IdFeriado ) + ' AND ';

  If ddata <> 0 Then
     Sql := Sql + 'F.DATAFERIADO = To_Date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', ddata ) ) +
                  ', ''dd/mm/yyyy'' ) AND ';

  Sql := Sql + 'F.IDPAIS = P.IDPAIS(+) AND ' +
               'F.IDESTADO = E.IDESTADO(+) AND ' +
               'F.IDCIDADES = C.IDCIDADES(+) AND ' +
               'F.IDSINDICATO = A.IDPESSOA(+) ' +
               'ORDER BY F.DESCFERIADO';
  Result := GetDataPacket( Sql );
end;

Function TCtrlFeriado.ListaFeriadoPais( IdPais: Double ): OleVariant;
begin
  Result := ListaFeriado( IdPais );
end;

Function TCtrlFeriado.ListaFeriadoEstado( IdEstado: Double ): OleVariant;
begin
  Result := ListaFeriado( 0, IdEstado );
end;

Function TCtrlFeriado.ListaFeriadoCidade( IdCidade: Double ): OleVariant;
begin
  Result := ListaFeriado( 0, 0, IdCidade );
end;

Function TCtrlFeriado.ListaFeriadoSindicato( IdSindicato: Double ): OleVariant;
begin
  Result := ListaFeriado( 0, 0, 0, IdSindicato );
end;

Function TCtrlFeriado.ListaFeriadoFeriado( IdFeriado: Double ): OleVariant;
begin
  Result := ListaFeriado( 0, 0, 0, 0, IdFeriado );
end;

Function TCtrlFeriado.ListaFeriadoData( dData: TDateTime ): OleVariant;
begin
  Result := ListaFeriado( 0, 0, 0, 0, 0, dData );
end;

procedure TCtrlFeriado.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

