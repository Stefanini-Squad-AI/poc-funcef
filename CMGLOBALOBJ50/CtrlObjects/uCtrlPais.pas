{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 17/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlPais;

{--------------------------------------------------------------------------------
Rotina......: ListPais 
N. Sol......: 229353-16212
N. Kintana..: 434575
Data........: 18-09-2014
Responsável.: Higor Nayde
Descrição...: ajuste referente ao e-social
--------------------------------------------------------------------------------}

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbPais;

Type
  TCtrlPais = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbPais: TDbPais;
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
    Function  ListaPais( IdPais: Double = 0 ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlPais.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarPais( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbPais, [], [] );
        Msg    := _DbPais.MessageInfo;

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

constructor TCtrlPais.Create;
begin
  inherited;
  _DbPais := TDbPais.Create(Self);
  FCds    := TClientDataSet.Create( nil );
end;

destructor TCtrlPais.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbPais.Free;

  inherited;
end;

procedure TCtrlPais.DoChangeDataBase;
begin
  inherited;
  _DbPais.DataBaseName := DatabaseName;
end;

function TCtrlPais.ListaPais( IdPais: Double ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT IDPAIS, NOMEPAIS, NOMENACIONALIDADE, MASCARACPOSTAL, ' +
                'CODREGIAO, CODRECEITAFEDERAL, CODINTERNACIONAL,CODIGOESOCIAL ' +   // Higor SOL 229353-16212 / PPM 434575
           'FROM PAIS ';

  If idPais <> 0 Then
     Sql := Sql + 'WHERE IDPAIS = ' + FloatToStr( IdPais )
  Else
     Sql := Sql + 'ORDER BY NOMEPAIS';

  Result := GetDataPacket( Sql );
end;

procedure TCtrlPais.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

