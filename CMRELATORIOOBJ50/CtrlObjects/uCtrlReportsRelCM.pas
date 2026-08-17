{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 07/06/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlReportsRelCM;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uSistema, uDbReportsRelCM;

Type
  TCtrlReportsRelCM = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbReports: TDbReportsRelCm;
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
    Function  ListaReports( IdReports: Double = 0; OrigemCm: Double = -1; scondicao: String = '' ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlReportsRelCM.Gravar: Boolean;
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

constructor TCtrlReportsRelCM.Create;
begin
  inherited;
  _DbReports := TDbReportsRelCm.Create( Self );
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlReportsRelCM.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;
  _DbReports.Free;
  inherited;
end;

procedure TCtrlReportsRelCM.DoChangeDataBase;
begin
  inherited;
  _DbReports.DataBaseName := DatabaseName;
end;

function TCtrlReportsRelCM.ListaReports( IdReports: Double = 0; OrigemCm: Double = -1; scondicao: String = '' ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT R.IDREPORTS, R.ORIGEMCM, R.IDMODULO, R.IDGRUPORELATORIO, R.ORIGEMCMGR, ' +
                'R.IDDATAVIEW, R.ORIGEMCMDV, R.NAME, R.DESCRIPTION, R.TEMPLATE, ' +
                'R.PPREPORT, R.FORMPARAMREL, R.FORMEVENTOS, R.FLGFILTROMANUAL, ' +
                'R.FLGTIPO, R.FLGEXIBENOPREVIEW, R.FLGAUDITORIAFRONT, ' +
                'D.NAME AS NOMEDATAVIEW, G.DESCRICAO, M.NOMEMODULO ' +
           'FROM REPORTS R, DATAVIEW D, GRUPORELATORIO G, MODULO M ' +
          'WHERE R.IDDATAVIEW = D.IDDATAVIEW(+) ' +
            'AND R.ORIGEMCMDV = D.ORIGEMCMDV(+) ' +
            'AND R.IDGRUPORELATORIO = G.IDGRUPORELATORIO(+) ' +
            'AND R.ORIGEMCMGR = G.ORIGEMCMGR(+) ' +
            'AND R.IDMODULO = M.IDMODULO(+) ';

  If idReports <> 0 Then
     Sql := Sql + 'AND IDREPORTS = ' + FloatToStr( IdReports ) + ' ';

  If OrigemCm > -1 Then
     Sql := Sql + 'AND ORIGEMCM = ' + FloatToStr( OrigemCm ) + ' ';

  If scondicao <> '' Then 
     Sql := Sql + Trim( scondicao ) + ' ';

  Sql := Sql + 'ORDER BY NAME';
  Result := GetDataPacket( Sql );
end;

procedure TCtrlReportsRelCM.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

