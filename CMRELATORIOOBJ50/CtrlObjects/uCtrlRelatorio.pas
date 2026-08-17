{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 07/06/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlRelatorio;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbRelatorio, uSistema;

Type
  TCtrlReports = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbReports: TDbReports;
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
    Procedure Procurar( IdReports: Double = 0; OrigemCm: Double = -1 );
    Function  ListaReports( IdReports: Double = 0; OrigemCm: Double = -1; scondicao: String = '' ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlReports.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarReports( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbReports, [], [] );
        Msg    := _DbReports.MessageInfo;

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

constructor TCtrlReports.Create;
begin
  inherited;
  _DbReports := TDbReports.Create( Self );
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlReports.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;
  _DbReports.Free;
  inherited;
end;

procedure TCtrlReports.DoChangeDataBase;
begin
  inherited;
  _DbReports.DataBaseName := DatabaseName;
end;

function TCtrlReports.ListaReports( IdReports: Double = 0; OrigemCm: Double = -1; scondicao: String = '' ): OleVariant;
var
  bwhere: Boolean;
  sql: String;
begin
  Sql := 'SELECT IDREPORTS, ORIGEMCM, IDMODULO, IDGRUPORELATORIO, ORIGEMCMGR, ' +
                 'IDDATAVIEW, ORIGEMCMDV, NAME, DESCRIPTION, TEMPLATE, PPREPORT, ' +
                 'FORMPARAMREL, FORMEVENTOS, FLGTIPO, FLGFILTROMANUAL, ' +
                 'FLGEXIBENOPREVIEW, FLGAUDITORIAFRONT ' +
         'FROM REPORTS ';

  bwhere := False;

  If idReports <> 0 Then Begin
     Sql := Sql + 'WHERE IDREPORTS = ' + FloatToStr( IdReports ) + ' ';
     bwhere := True;
  End;

  If OrigemCm > -1 Then Begin
     If bwhere Then
        Sql := Sql + 'AND '
     Else Begin
        Sql := Sql + 'WHERE ';
        bwhere := True;
     End;

     Sql := Sql + 'ORIGEMCM = ' + FloatToStr( OrigemCm ) + ' ';
  End;

  If scondicao <> '' Then Begin
     If Not bwhere Then Begin
        Sql := Sql + 'WHERE ';
     End;

     Sql := Sql + Trim( scondicao ) + ' ';
  End;

  Sql := Sql + 'ORDER BY NAME';
  Result := GetDataPacket( Sql );
end;

procedure TCtrlReports.Procurar( IdReports: Double = 0; OrigemCm: Double = -1 );
begin
  If ConnectionSide = cnsClient Then Begin
     Connection.AppServer.ProcurarReports( IdReports, OrigemCm );
  End Else Begin
     _dbReports.IdReports.AsFloat := IdReports;
     _dbReports.OrigemCm.AsFloat  := OrigemCm;
  End;
end;

procedure TCtrlReports.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

