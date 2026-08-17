{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 08/07/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlDdTable;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbDdTable;

Type
  TCtrlDdTable = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbDdTable: TDbDdTable;
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
    Function  ListaDdTable( IdDdTable: Double = 0 ): OleVariant;
    Function  ListaDdTableField( IdDdTable: Double = 0; IdDdField: Double = 0 ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlDdTable.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarDdTable( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbDdTable, [], [] );
        Msg    := _DbDdTable.MessageInfo;

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

constructor TCtrlDdTable.Create;
begin
  inherited;
  _DbDdTable := TDbDdTable.Create( Self );
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlDdTable.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;
  _DbDdTable.Free;
  inherited;
end;

procedure TCtrlDdTable.DoChangeDataBase;
begin
  inherited;
  _DbDdTable.DataBaseName := DatabaseName;
end;

function TCtrlDdTable.ListaDdTable( IdDdTable: Double = 0 ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT IDDDTABLE, TABLENAME, TABLEALIAS, DESCRICAO ' +
         'FROM DDTABLE ';

  If idDdTable <> 0 Then
     Sql := Sql + 'WHERE IDDDTABLE = ' + FloatToStr( IdDdTable )
  Else
     Sql := Sql + 'ORDER BY TABLENAME';

  Result := GetDataPacket( Sql );
end;

Function  TCtrlDdTable.ListaDdTableField( IdDdTable: Double = 0; IdDdField: Double = 0 ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT T.IDDDTABLE, T.TABLENAME, T.TABLEALIAS, F.FIELDNAME, F.IDDDFIELD, F.FIELDALIAS ' +
         'FROM DDTABLE T, DDFIELD F ' +
         'WHERE T.IDDDTABLE = F.IDDDTABLE ';

  If idDdTable <> 0 Then
     Sql := Sql + 'AND T.IDDDTABLE = ' + FloatToStr( IdDdTable ) + ' ';

  If idDdField <> 0 Then
     Sql := Sql + 'AND F.IDDDFIELD = ' + FloatToStr( IdDdField ) + ' ';

  Sql := Sql + 'ORDER BY T.TABLENAME, F.FIELDNAME ASC ';

  Result := GetDataPacket( Sql );
end;

procedure TCtrlDdTable.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

