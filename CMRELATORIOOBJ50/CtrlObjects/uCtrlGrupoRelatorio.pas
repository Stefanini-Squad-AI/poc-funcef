{===============================================================================
Responsável : Thiago Melo
Pendência   : SOL 143297 Kintana 928391
Descrição   : Foi adicionado condições para inclusão de grupo mestre na função
              ListaGrupoRelatorio          
=============================================================================== }

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 16/05/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlGrupoRelatorio;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbGrupoRelatorio;

Type
  TCtrlGrupoRelatorio = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbGrupoRelatorio: TDbGrupoRelatorio;
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
    // Thiago Melo SOL 143297 Kintana 928391
    Function  ListaGrupoRelatorio( IdGrupoRelatorio: Double = 0; OrigemCmGr: Double = -1; idGrupoMestre: Double = -1 ): OleVariant;
    Function  Gravar: Boolean;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlGrupoRelatorio.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarGrupoRelatorio( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbGrupoRelatorio, [], [] );
        Msg    := _DbGrupoRelatorio.MessageInfo;

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

constructor TCtrlGrupoRelatorio.Create;
begin
  inherited;
  _DbGrupoRelatorio := TDbGrupoRelatorio.Create( Self );
  FCds := TClientDataSet.Create( nil );
end;

destructor TCtrlGrupoRelatorio.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;
  _DbGrupoRelatorio.Free;
  inherited;
end;

procedure TCtrlGrupoRelatorio.DoChangeDataBase;
begin
  inherited;
  _DbGrupoRelatorio.DataBaseName := DatabaseName;
end;

function TCtrlGrupoRelatorio.ListaGrupoRelatorio( IdGrupoRelatorio: Double = 0; OrigemCmGr: Double = -1; idGrupoMestre: Double = -1 ): OleVariant;
var
  bwhere: Boolean;
  sql: String;
begin
  // Thiago Melo SOL 143297 Kintana 928391
  Sql := 'SELECT IDGRUPORELATORIO, ORIGEMCMGR, DESCRICAO, IDGRUPOMESTRE ' +
         'FROM GRUPORELATORIO ';

  bwhere := False;

  If idGrupoRelatorio <> 0 Then Begin
     Sql := Sql + 'WHERE IDGRUPORELATORIO = ' + FloatToStr( IdGrupoRelatorio ) + ' ';
     bwhere := True;
  End;

  If OrigemCmGr > -1 Then Begin
     If bwhere Then
        Sql := Sql + 'AND '
     Else
        Sql := Sql + 'WHERE ';

     Sql := Sql + 'ORIGEMCMGR = ' + FloatToStr( OrigemCmGr ) + ' ';
  End;

  Sql := Sql + 'ORDER BY DESCRICAO';
  Result := GetDataPacket( Sql );
end;

procedure TCtrlGrupoRelatorio.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

