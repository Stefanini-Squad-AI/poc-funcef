{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 30/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlRamoFornecedor;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbRamoFornecedor;

Type
  TCtrlRamoFornecedor = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbRamoFornecedor: TDbRamoFornecedor;
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
    Function  ListaRamoFornecedor( IdRamoFornecedor: Double = 0 ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlRamoFornecedor.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarRamoFornecedor( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbRamoFornecedor, [], [] );
        Msg    := _DbRamoFornecedor.MessageInfo;

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

constructor TCtrlRamoFornecedor.Create;
begin
  inherited;
  _DbRamoFornecedor := TDbRamoFornecedor.Create(Self);
  FCds    := TClientDataSet.Create( nil );
end;

destructor TCtrlRamoFornecedor.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbRamoFornecedor.Free;

  inherited;
end;

procedure TCtrlRamoFornecedor.DoChangeDataBase;
begin
  inherited;
  _DbRamoFornecedor.DataBaseName := DatabaseName;
end;

function TCtrlRamoFornecedor.ListaRamoFornecedor( IdRamoFornecedor: Double ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT IDRAMOFORNECEDOR, DESCRAMOFORNECEDOR ' +
         'FROM RAMOFORNECEDOR ';

  If idRamoFornecedor <> 0 Then
     Sql := Sql + 'WHERE IDRAMOFORNECEDOR = ' + FloatToStr( IdRamoFornecedor )
  Else
     Sql := Sql + 'ORDER BY DESCRAMOFORNECEDOR';

  Result := GetDataPacket( Sql );
end;

procedure TCtrlRamoFornecedor.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

