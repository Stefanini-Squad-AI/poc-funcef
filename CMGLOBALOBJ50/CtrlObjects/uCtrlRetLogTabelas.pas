{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 03/04/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlRetLogTabelas;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbRetLogTabelas;

Type
  TCtrlRetLogTabelas = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbRetLogTabelas: TDbRetLogTabelas;
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
    Function  ApagarRetLogTabelas( DataLimite: TDateTime = 0 ): Boolean;
    Function  ListaRetLogTabelas( IdLogTabela: Double = 0; DataLimite: TDateTime = 0;
              Linhas: Integer = 0 ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlRetLogTabelas.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarRetLogTabelas( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbRetLogTabelas, [], [] );
        Msg    := _DbRetLogTabelas.MessageInfo;

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

constructor TCtrlRetLogTabelas.Create;
begin
  inherited;
  _DbRetLogTabelas := TDbRetLogTabelas.Create(Self);
  FCds    := TClientDataSet.Create( nil );
end;

destructor TCtrlRetLogTabelas.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbRetLogTabelas.Free;

  inherited;
end;

procedure TCtrlRetLogTabelas.DoChangeDataBase;
begin
  inherited;
  _DbRetLogTabelas.DataBaseName := DatabaseName;
end;

function TCtrlRetLogTabelas.ListaRetLogTabelas( IdLogTabela: Double; DataLimite: TDateTime;
         Linhas: Integer ): OleVariant;
var
  bwhere: Boolean;
  sql: String;
begin
  Sql := 'SELECT IDLOGTABELA, ARQUIVO, NOMECAMPO, VALORATUAL, VALORANTERIOR, ' +
         'OPERACAO, USUARIO, DATAHORA, LOTETRANSMISSAO, CHAVEPRIMARIA ' +
         'FROM RETLOGTABELAS';
  bwhere := False;

  If DataLimite <> 0 Then Begin
     Sql := Sql + ' WHERE DATAHORA <= TO_DATE( ' + QuotedStr( DateToStr( DataLimite ) ) + ', ''DD/MM/YYYY'' )';
     bwhere := True;
  End;

  If IdLogTabela <> 0 Then begin
     If Not bwhere Then Begin
        Sql := Sql + ' WHERE ';
        bwhere := True;
     End Else
        Sql := Sql + ' AND ';

     Sql := Sql + 'IDLOGTABELA = ' + FloatToStr( IdLogTabela )
  End;

  If Linhas <> 0 Then Begin
     If Not bwhere Then Begin
        Sql := Sql + ' WHERE ';

     End Else
        Sql := Sql + ' AND ';

     Sql := Sql + 'ROWNUM <= ' + IntToStr( linhas );
  End;

  Result := GetDataPacket( Sql );
end;

function TCtrlRetLogTabelas.ApagarRetLogTabelas( DataLimite: TDateTime ): Boolean;
var
  sql: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.ApagarRetLogTabelas( DataLimite );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        sql := 'DELETE FROM RETLOGTABELAS ' +
               'WHERE DATAHORA <= TO_DATE( ' + QuotedStr( DateToStr( datalimite ) ) + ', ''DD/MM/YYYY'' )';
        Result := ExecSQL( sql );
                           
        If Result Then
           Commit
        Else
           RollBack;
     Except
        Result := False;
        RollBack;
        Raise;
     End;
  End;
end;

procedure TCtrlRetLogTabelas.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

