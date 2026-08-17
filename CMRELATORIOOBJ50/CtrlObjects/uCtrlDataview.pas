{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 15/05/2002                             }
{                                                       }
{*******************************************************}

// Alterações:
{*************************************************************************************
Nº SOL............: 264387
Nº PPM............: 1153361
Data da Alteração.: 12/11/2015
Responsável.......: Peterson Victor
Descrição.........: Criação da função ListaReports
**************************************************************************************
}

unit uCtrlDataview;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbDataview;

Type
  TCtrlDataview = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbDataview: TDbDataview;
    Fcds: TClientDataSet;
    IdInserido: Double;
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
    Function  ListaDataview( IdDataview: Double = 0; OrigemCmDv: Double = -1 ): OleVariant;
    Function  ListaDataviewInserido(): OleVariant;
    Function  Gravar: Boolean;
    Function  ListaReports( IdReports: Double): OleVariant;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlDataview.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarDataview( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbDataview, [], [] );
        Msg    := _DbDataview.MessageInfo;
        IdInserido := _DbDataview.Iddataview.AsFloat;

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

constructor TCtrlDataview.Create;
begin
  inherited;
  _DbDataview := TDbDataview.Create( Self );
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlDataview.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;
  _DbDataview.Free;
  inherited;
end;

procedure TCtrlDataview.DoChangeDataBase;
begin
  inherited;
  _DbDataview.DataBaseName := DatabaseName;
end;

function TCtrlDataview.ListaDataview( IdDataview: Double = 0; OrigemCmDv: Double = -1 ): OleVariant;
var
  bwhere: Boolean;
  sql: String;
begin
  Sql := 'SELECT IDDATAVIEW, ORIGEMCMDV, NAME, TEMPLATE, DESCRIPTION, CLASSNAME, CLASSDESCRIPTION ' +
         'FROM DATAVIEW ';

  bwhere := False;

  If idDataview <> 0 Then Begin
     Sql := Sql + 'WHERE IdDATAVIEW = ' + FloatToStr( IdDataview ) + ' ';
     bwhere := True;
  End;

  If OrigemCmDv <> -1 Then Begin
     If bwhere Then
        Sql := Sql + 'AND '
     Else
        Sql := Sql + 'WHERE ';

     Sql := Sql + 'ORIGEMCMDV = ' + FloatToStr( OrigemCmDv ) + ' ';
  End;

  Sql := Sql + 'ORDER BY NAME';
  Result := GetDataPacket( Sql );
end;

Function  TCtrlDataview.ListaDataviewInserido(): OleVariant;
begin
  Result := ListaDataview( IdInserido, 0 );
end;

function TCtrlDataview.ListaReports( IdReports : Double   ): OleVariant;
var
  bwhere: Boolean;
  sql: String;
begin
{
  Sql := 'SELECT IDREPORTS, NAME, IDGRUPORELATORIO, IDMODULO, ' +
         '       ORIGEMCM, ORIGEMCMGR, ORIGEMCMDV, IDDATAVIEW ' +
         'FROM REPORTS ' +
}

  Sql :=  'SELECT * ' +
          {
          'NAME, IDREPORTS, ORIGEMCM, IDGRUPORELATORIO, IDMODULO, ORIGEMCMGR, '+
          'DESCRIPTION, TEMPLATE, IDDATAVIEW, ORIGEMCMDV, FLGFILTROMANUAL, FORMEVENTOS, '+
          'FORMPARAMREL, PPREPORT, FLGAUDITORIAFRONT, TRGDTINCLUSAO, TRGUSERINCLUSAO, '+
          'FLGTIPO, FLGEXIBENOPREVIEW, FLGEXPORTADADOS, FLGSUBREPORT, IDSUBDATAVIEW1,' +
          'ORIGEMCMDV1, IDSUBDATAVIEW2, ORIGEMCMDV2, IDSUBDATAVIEW3, ORIGEMCMDV3, '+
          'IDSUBDATAVIEW4, ORIGEMCMDV4, FLGRELATATIVO '+
          }
          'FROM REPORTS ' +
          'WHERE IDREPORTS = ' + FloatToStr( IdReports);

  Result := GetDataPacket( Sql );
end;


procedure TCtrlDataview.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;


end.

