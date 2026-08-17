{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 30/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlTipOper;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbTipOper;

Type
  TCtrlTipOper = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbTipOper: TDbTipOper;
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
    Function  ListaTipOper( IdTipOper: String = ''; iordem: Integer = 0 ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlTipOper.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarTipOper( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbTipOper, [], [] );
        Msg    := _DbTipOper.MessageInfo;

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

constructor TCtrlTipOper.Create;
begin
  inherited;
  _DbTipOper := TDbTipOper.Create(Self);
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlTipOper.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbTipOper.Free;

  inherited;
end;

procedure TCtrlTipOper.DoChangeDataBase;
begin
  inherited;
  _DbTipOper.DataBaseName := DatabaseName;
end;

function TCtrlTipOper.ListaTipOper( IdTipOper: String = ''; iordem: Integer = 0 ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT TIPCODIGO, TIPDESCRICAO ' +
         'FROM TIPOPER ';

  If IdTipOper <> '' Then
     Sql := Sql + 'WHERE TIPCODIGO = ' + QuotedStr( IdTipOper );

  If iordem = 1 Then
     Sql := Sql + ' ORDER BY TIPCODIGO'
  Else
     Sql := Sql + ' ORDER BY TIPDESCRICAO';

  Result := GetDataPacket( Sql );
end;

procedure TCtrlTipOper.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

