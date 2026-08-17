{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 03/04/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlPracaComp;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbPracaComp;

Type
  TCtrlPracaComp = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbPracaComp: TDbPracaComp;
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
    Function  ListaPracaComp( IdPracaComp: Double = 0 ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlPracaComp.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarPracaComp( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbPracaComp, [], [] );
        Msg    := _DbPracaComp.MessageInfo;

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

constructor TCtrlPracaComp.Create;
begin
  inherited;
  _DbPracaComp := TDbPracaComp.Create(Self);
  FCds    := TClientDataSet.Create( nil );
end;

destructor TCtrlPracaComp.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbPracaComp.Free;

  inherited;
end;

procedure TCtrlPracaComp.DoChangeDataBase;
begin
  inherited;
  _DbPracaComp.DataBaseName := DatabaseName;
end;

function TCtrlPracaComp.ListaPracaComp( IdPracaComp: Double ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT IDPRACACOMP, CODIGO, DESCRICAO ' +
         'FROM PRACACOMP ';

  If idPracaComp <> 0 Then
     Sql := Sql + 'WHERE IDPRACACOMP = ' + FloatToStr( IdPracaComp )
  Else
     Sql := Sql + 'ORDER BY DESCRICAO';

  Result := GetDataPacket( Sql );
end;

procedure TCtrlPracaComp.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

