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
    _dsp: TDataSetProvider;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds: TClientDataSet read Fcds write Setcds;
    Property dsp: TDataSetProvider read _dsp;
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
    Function  Inserir: Boolean;
    Function  Alterar: Boolean;
    Function  Excluir( IdMoeda: Double ): Boolean;
  End;

implementation

function TCtrlMoeda.Alterar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.AlterarPais( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        CdsToDbObject( Fcds, TCmDbObject( _DbMoeda ) );
        Result := _DbMoeda.Update;
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
  _dsp     := TDataSetProvider.Create( nil );
  _dsp     := _DbMoeda.Dsp;
end;

destructor TCtrlMoeda.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _dsp.DataSet := nil;
  _dsp := nil;
  _dsp.Free;
  _DbMoeda.Free;

  inherited;
end;

procedure TCtrlMoeda.DoChangeDataBase;
begin
  inherited;
  _DbMoeda.DataBaseName := DatabaseName;
end;

function TCtrlMoeda.Excluir(IdMoeda: Double): Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.ExcluirPais( IdMoeda );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        _DbMoeda.MoeCodigo.AsFloat := IdMoeda;
        Result := _DbMoeda.Delete;
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

function TCtrlMoeda.Inserir: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.InserirPais( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        CdsToDbObject( Fcds, TCmDbObject( _DbMoeda ) );
        Result := _DbMoeda.Insert;
        Msg    := _DbMoeda.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Commit;
     except
        On E:Exception Do
        Begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
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
         'FLGTIPOPRAZO, FLGPERIODO, IDUSUARIOINCLUSAO ' +
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
  Result := _cds.FieldByName( 'MOEDACORRENTE' ).AsFloat;
  _Cds.Close;
end;

procedure TCtrlMoeda.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.
 