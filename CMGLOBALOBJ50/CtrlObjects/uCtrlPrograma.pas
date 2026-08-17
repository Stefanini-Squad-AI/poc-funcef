{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 17/01/2002                             }
{                                                       }
{*******************************************************}

{
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
}

unit uCtrlPrograma;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbPrograma;

Type
  TCtrlPrograma = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbPrograma: TDbPrograma;
    cdsAux : TClientDataSet;
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
    Function  ListaPrograma( IdPrograma: Double = 0 ): OleVariant;
    Function  Gravar: Boolean;
    Function  ExisteTipo(const sTipo : string) : boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlPrograma.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarPrograma( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbPrograma, [], [] );
        Msg    := _DbPrograma.MessageInfo;

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

constructor TCtrlPrograma.Create;
begin
  inherited;
  _DbPrograma := TDbPrograma.Create(Self);
  FCds := TClientDataSet.Create( nil );
  cdsAux := TClientDataSet.Create( nil );
end;


destructor TCtrlPrograma.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;
  cdsAux.Free;

  _DbPrograma.Free;

  inherited;
end;

procedure TCtrlPrograma.DoChangeDataBase;
begin
  inherited;
  _DbPrograma.DataBaseName := DatabaseName;
end;

function TCtrlPrograma.ListaPrograma( IdPrograma: Double ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT IDPROGRAMA, DESCPROGRAMA, CODPROGRAMA, FLGTIPOPROGRAMA, ' +
         ' IDPROGRAMAORCAMEN ' + //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
         'FROM PROGRAMA ';

  If IdPrograma <> 0 Then
     Sql := Sql + 'WHERE IDPROGRAMA = ' + FloatToStr( IdPrograma ) + ' ';

  Sql := Sql + 'ORDER BY DESCPROGRAMA';
  Result := GetDataPacket( Sql );
end;

procedure TCtrlPrograma.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;



function TCtrlPrograma.ExisteTipo(const sTipo: string): boolean;
var sSQL : string;
begin
   sSQL := 'SELECT NVL(COUNT(*),0) AS TOTAL FROM PROGRAMA WHERE FLGTIPOPROGRAMA = ' + QuotedStr(sTipo);
   cdsAux.Data := GetDataPacket(sSQL);
   Result := cdsAux.FieldByName('TOTAL').AsInteger > 0;
end;


end.

