{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 08/07/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlDdField;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbDdField;

Type
  TCtrlDdField = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbDdField: TDbDdField;
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
    Function  ListaDdField( IdDdField: Double = 0; IdDdTable: Double = 0 ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlDdField.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarDdField( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbDdField, [], [] );
        Msg    := _DbDdField.MessageInfo;

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

constructor TCtrlDdField.Create;
begin
  inherited;
  _DbDdField := TDbDdField.Create( Self );
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlDdField.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;
  _DbDdField.Free;
  inherited;
end;

procedure TCtrlDdField.DoChangeDataBase;
begin
  inherited;
  _DbDdField.DataBaseName := DatabaseName;
end;

function TCtrlDdField.ListaDdField( IdDdField: Double = 0; IdDdTable: Double = 0 ): OleVariant;
var
  bwhere: Boolean;
  sql: String;
begin
  Sql := 'SELECT IDDDFIELD, TIPODEDADO, TIPOCHAVE, TAMANHO, SORTABLE, SELECTABLE, ' +
                'SEARCHABLE, IDDDTABLE, FLGOBRIGATORIO, FIELDNAME, FIELDALIAS, ' +
                'DISPLAYFORMAT, DESCRICAO, CHAVE, CAMPODOBANCO ' +
           'FROM DDFIELD ';

  If IdDdTable <> 0 Then Begin
     Sql := Sql + 'WHERE IDDDTABLE = ' + FloatToStr( IdDdTable ) + ' ';
     bwhere := True;
  End Else
     bwhere := False;

  If IdDdField <> 0 Then Begin
     If bwhere Then
        Sql := Sql + 'AND'
     Else
        Sql := Sql + 'WHERE';

     Sql := Sql + ' IDDDFIELD = ' + FloatToStr( IdDdField ) + ' '; 
  End;

  Sql := Sql + 'ORDER BY FIELDNAME';
  Result := GetDataPacket( Sql );
end;

procedure TCtrlDdField.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

