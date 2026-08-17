{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 03/04/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlLogTabelasIndx;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbLogTabelasIndx;

Type
  TCtrlLogTabelasIndx = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbLogTabelasIndx: TDbLogTabelasIndx;
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
    Function  ApagarLogTabelasIndx( DataLimite: TDateTime; bSalva: Boolean = True ): Boolean;
    Function  ListaLogTabelasIndx( IdLogTabela: Double = 0; DataLimite: TDateTime = 0;
              Linhas: Integer = 0 ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlLogTabelasIndx.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarLogTabelasIndx( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbLogTabelasIndx, [], [] );
        Msg    := _DbLogTabelasIndx.MessageInfo;

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

constructor TCtrlLogTabelasIndx.Create;
begin
  inherited;
  _DbLogTabelasIndx := TDbLogTabelasIndx.Create(Self);
  FCds    := TClientDataSet.Create( nil );
end;

destructor TCtrlLogTabelasIndx.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbLogTabelasIndx.Free;

  inherited;
end;

procedure TCtrlLogTabelasIndx.DoChangeDataBase;
begin
  inherited;
  _DbLogTabelasIndx.DataBaseName := DatabaseName;
end;

function TCtrlLogTabelasIndx.ListaLogTabelasIndx( IdLogTabela: Double; DataLimite: TDateTime;
         Linhas: Integer ): OleVariant;
var
  bwhere: Boolean;
  sql: String;
begin
  bwhere := False;
  Sql := 'SELECT IDLOGTABELA, ARQUIVO, NOMECAMPO, VALORATUAL, VALORANTERIOR, ' +
                'OPERACAO, USUARIO, DATAHORA, LOTETRANSMISSAO, CHAVEPRIMARIA ' +
           'FROM LOGTABELASINDX';

  If DataLimite <> 0 Then Begin
     Sql := Sql + ' WHERE DATAHORA <= TO_DATE( ' + QuotedStr( DateToStr( DataLimite ) ) + ', ''DD/MM/YYYY'' )';
     bwhere := True;
  End;

  If IdLogTabela <> 0 Then Begin
     If Not bwhere Then
        Sql := Sql + ' WHERE'
     Else
        Sql := Sql + ' AND';

     Sql := Sql + ' IDLOGTABELA = ' + FloatToStr( IdLogTabela );
  End;

  If Linhas <> 0 Then Begin
     If Not bwhere Then
        Sql := Sql + ' WHERE'
     Else
        Sql := Sql + ' AND';

     Sql := Sql + ' ROWNUM <= ' + IntToStr( linhas );
  End;

  Result := GetDataPacket( Sql );
end;

function TCtrlLogTabelasIndx.ApagarLogTabelasIndx( DataLimite: TDateTime; bSalva: Boolean = True ): Boolean;
var
  sql: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.ApagarLogTabelasIndx( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := True;

        If bsalva Then Begin
           sql := 'INSERT INTO RETLOGTABELAS( IDLOGTABELA, DATAHORA, CHAVEPRIMARIA, ARQUIVO, ' +
                         'USUARIO, OPERACAO, NOMECAMPO, VALORATUAL, VALORANTERIOR, LOTETRANSMISSAO ) ' +
                  'SELECT IDLOGTABELA, DATAHORA, CHAVEPRIMARIA, ARQUIVO, USUARIO, ' +
                         'OPERACAO, NOMECAMPO, VALORATUAL, VALORANTERIOR, LOTETRANSMISSAO ' +
                    'FROM LOGTABELASINDX ' +
                   'WHERE DATAHORA <= TO_DATE( ' + QuotedStr( DateToStr( datalimite ) ) + ', ''DD/MM/YYYY'' )';
           Result := ExecSQL( sql );
        End;

        If Result Then Begin
           sql := 'DELETE FROM LOGTABELASINDX ' +
                   'WHERE DATAHORA <= TO_DATE( ' + QuotedStr( DateToStr( datalimite ) ) + ', ''DD/MM/YYYY'' )';
           Result := ExecSQL( sql );
        End;

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

procedure TCtrlLogTabelasIndx.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

