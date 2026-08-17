{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 17/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlMoeda;

interface

Uses Classes, DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject,
     uCmControlObject, uDbMoeda, uSistema;

Type
  TCtrlMoeda = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbMoeda: TDbMoeda;
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
    Procedure Procurar( IdMoeda: Double = 0 );
    Function  ListaMoeda( IdMoeda: Double = 0; SoMoeda: Boolean = False; SoAtivos: Boolean = True ): OleVariant;
    Function  MoedaCorrente( IdEmpresa: Double ): Double;
    Function  Gravar: Boolean;
  End;

implementation

Uses uCmTypes;

function TCtrlMoeda.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarMoeda( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbMoeda, [], [] );
        Msg    := _DbMoeda.MessageInfo;

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

constructor TCtrlMoeda.Create;
begin
  inherited;
  _DbMoeda := TDbMoeda.Create;
  FCds     := TClientDataSet.Create( nil );
end;

destructor TCtrlMoeda.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbMoeda.Free;

  inherited;
end;

procedure TCtrlMoeda.DoChangeDataBase;
begin
  inherited;
  _DbMoeda.DataBaseName := DatabaseName;
end;

procedure TCtrlMoeda.Procurar(IdMoeda: Double);
begin
  If ConnectionSide = cnsClient Then Begin
     Connection.AppServer.ProcurarMoeda( IdMoeda );
  End Else Begin
     _DbMoeda.MoeCodigo.AsFloat := IdMoeda;
  End;
end;

Function TCtrlMoeda.ListaMoeda( IdMoeda: Double; SoMoeda: Boolean; SoAtivos: Boolean ): OleVariant;
var
  bwhere: Boolean;
  sql: String;
begin
  bwhere := False;
  Sql := 'SELECT MOECODIGO, MOEDESC, MOESIGLA, MOEDAREFERENCIA, FATORCONVERSAO, ' +
         'MOEPERIODICIDADE, DATAINICIO, DATAFIM, DESCUNIDADETAXA, FLGPERCVALOR, ' +
         'MOEINATIVO, FLGTIPOPRAZO, FLGPERIODO, IDUSUARIOINCLUSAO ' +
         'FROM MOEDA ';

  If SoAtivos Then Begin
     If Not bwhere Then Begin
        Sql := Sql + 'WHERE ';
        bwhere := True;
     End;

     Sql := Sql + '(MOEINATIVO = ''A'') ';
  End;
                                  
  If IdMoeda <> 0 Then Begin
     If Not bwhere Then
        Sql := Sql + 'WHERE '
     Else
        Sql := Sql + 'AND ';

     If SoMoeda Then
        Sql := Sql + '(MOECODIGO = ' + FloatToStr( IdMoeda ) + ') '
     Else
        Sql := Sql + '(MOECODIGO <> ' + FloatToStr( IdMoeda ) + ') ';
  End;

  Sql := Sql + 'ORDER BY MOEDESC';
  Result := GetDataPacket( Sql );
end;

Function TCtrlMoeda.MoedaCorrente( IdEmpresa: Double ): Double;
var
  sql: String;
begin
  Sql := 'SELECT MOEDACORRENTE FROM PARAMGLOBAL WHERE IDPESSOA = ' + FloatToStr( IdEmpresa );
  _cds.Data := GetDataPacket( Sql );
  Result    := _cds.FieldByName( 'MOEDACORRENTE' ).AsFloat;
  _Cds.Close;
end;

procedure TCtrlMoeda.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.
 