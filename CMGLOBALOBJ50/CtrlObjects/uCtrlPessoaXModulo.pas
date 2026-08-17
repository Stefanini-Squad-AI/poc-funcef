{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 08/04/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlPessoaXModulo;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbPessoaxModulo;

Type
  TCtrlPessoaxModulo = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbPessoaxModulo: TDbPessoaxModulo;
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
    Function  ListaPessoaxModulo( IdPessoa: Double = 0; IdModulo: Double = 0 ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlPessoaxModulo.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarPessoaxModulo( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := True;

        With fcds Do Begin
             First;

             While ( Not Eof ) And ( Result ) Do Begin
                   If FieldByName( 'IdModuloRespon' ).Value <> Null Then
                      Result := ExecSql( 'UPDATE PESSOA SET IDMODULORESPON = ' +
                                         FieldByName( 'IdModuloRespon' ).AsString +
                                         ' WHERE IDPESSOA = ' + FieldByName( 'IdPessoa' ).AsString )
                   Else
                      Result := ExecSql( 'UPDATE PESSOA SET IDMODULORESPON = NULL ' +
                                         ' WHERE IDPESSOA = ' + FieldByName( 'IdPessoa' ).AsString );

                   fcds.Next
             End;

             EmptyDataset;
        End;

        Msg := _DbPessoaxModulo.MessageInfo;

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

constructor TCtrlPessoaxModulo.Create;
begin
  inherited;
  _DbPessoaxModulo := TDbPessoaxModulo.Create(Self);
  FCds    := TClientDataSet.Create( nil );
end;

destructor TCtrlPessoaxModulo.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbPessoaxModulo.Free;

  inherited;
end;

procedure TCtrlPessoaxModulo.DoChangeDataBase;
begin
  inherited;
  _DbPessoaxModulo.DataBaseName := DatabaseName;
end;

function TCtrlPessoaxModulo.ListaPessoaxModulo( IdPessoa: Double; IdModulo: Double ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT P.IDPESSOA, P.NOME AS NOMEPESSOA, P.IDMODULORESPON, M.NOMEMODULO ' +
         'FROM PESSOA P, MODULO M ' +
         'WHERE ';

  If IdModulo <> 0 Then
     Sql := Sql + 'P.IDMODULORESPON = ' + FloatToStr( IdModulo )
  Else
     Sql := Sql + 'P.IDMODULORESPON IS NOT NULL';

  If IdPessoa <> 0 Then
     Sql := Sql + ' AND P.IDPESSOA = ' + FloatToStr( IdPessoa );

  Sql := Sql + ' AND P.IDMODULORESPON = M.IDMODULO ' +
               'ORDER BY NOMEPESSOA';
  Result := GetDataPacket( Sql );
end;

procedure TCtrlPessoaxModulo.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

