{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
unit uCtrlCriaRelatorio;

interface

Uses
  Classes, DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider, uMidasUtil, 
  uDbRelatOrc, uDbLinhasRelatOrc, uCMTypes;

Type
  TCtrlCriaRelatorio = class(TCmControlObject)

  Protected

    Procedure DoChangeDataBase; Override;
    procedure OnCreateAppServer; Override;

  Private

    _dbCriaRelatorio   : TdbRelatOrc;
    _dbLinhasRelatOrc  : TdbLinhasRelatOrc;

    FCdsCriaRelatorio  : TClientDataSet;
    FCdsLinhasRelatOrc : TClientDataSet;

    procedure SetCdsCriaRelatorio(const Value: TClientDataSet);
    procedure SetCdsLinhasRelatOrc(const Value: TClientDataSet);

  Public

    Constructor Create; Override;
    Destructor  Destroy;Override;

    Property CdsCriaRelatorio  : TClientDataSet Read FCdsCriaRelatorio  Write SetCdsCriaRelatorio;
    Property CdsLinhasRelatOrc : TClientDataSet Read FCdsLinhasRelatOrc Write SetCdsLinhasRelatOrc;

    Function GravarCriaRelatorio  : Boolean;
    Function ExcluirCriaRelatorio : Boolean;
    Function Procurar( idRelatOrc : Double ): OleVariant;
    Function ProcurarDetalhe( idRelatOrc : Double ): OleVariant;

    Function  PegaProximaLinha( idRelatOrc : Double ) : integer;

    Function  TraduzFLGINDENTACAO( pIndent : String ) : String;
    Function  TraduzFLGTIPOLINHA( pTipoLinha : String ) : String;
  End;

Implementation
//************************************************
procedure TCtrlCriaRelatorio.OnCreateAppServer;
begin
  Inherited;

  FCdsCriaRelatorio  := TClientDataSet.Create( Nil );
  FCdsLinhasRelatOrc := TClientDataSet.Create( Nil );
End;
//************************************************
Procedure TCtrlCriaRelatorio.DoChangeDataBase;
Begin
  Inherited;
  _dbCriaRelatorio.DatabaseName  := DataBaseName;
  _dbLinhasRelatOrc.DatabaseName := DataBaseName;
End;
//************************************************
Constructor TCtrlCriaRelatorio.Create;
Begin
  Inherited;

  _dbCriaRelatorio   := TdbRelatOrc.Create( Self );
  _dbLinhasRelatOrc  := TdbLinhasRelatOrc.Create( Self );
End;
//************************************************
Destructor TCtrlCriaRelatorio.Destroy;
Begin
  Inherited;
  _dbCriaRelatorio.Free;
  _dbLinhasRelatOrc.Free;

  If ( isAppServer ) Then Begin

    FreeCds( [ CdsCriaRelatorio, CdsLinhasRelatOrc ] );
  End;
End;
//************************************************
Function TCtrlCriaRelatorio.GravarCriaRelatorio: Boolean;
Var
  Msg  : String;

Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Result := Connection.AppServer.GravarCriaRelatorio ( FCdsCriaRelatorio.Data, FCdsLinhasRelatOrc.Data );

    If ( Not Result ) Then Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End Else Begin
    Try
      StartTransaction;

      // Pai
      Result := ApplyCds( FCdsCriaRelatorio, _dbCriaRelatorio, [], [] );
      Msg    := _dbCriaRelatorio.MessageInfo;
      If ( Not Result ) Then Begin

        Raise Exception.Create(Msg);
      End;

      // itens Filhos
      Result := ApplyCds( FCdsLinhasRelatOrc, _dbLinhasRelatOrc, [ _dbCriaRelatorio.Idrelatorc ], [ _dbLinhasRelatOrc.Idrelatorc ] );
      Msg    := _dbLinhasRelatOrc.MessageInfo;
      If ( Not Result ) Then Begin

        Raise Exception.Create(Msg);
      End;

      Commit;
    Except
      On E:Exception Do Begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;
//************************************************
function TCtrlCriaRelatorio.ExcluirCriaRelatorio: Boolean;
Var
  Msg  : String;

begin
  If ( ConnectionSide = cnsClient ) Then Begin

    Result := Connection.AppServer.ExcluirCriaRelatorio( FCdsCriaRelatorio.Data,
                                                         FCdsLinhasRelatOrc.Data );

    If ( Not Result ) Then Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End Else Begin
    Try
      StartTransaction;

      // itens Filhos
      Result := ApplyCds( FCdsLinhasRelatOrc, _dbLinhasRelatOrc, [], [] );
      Msg    := _dbLinhasRelatOrc.MessageInfo;

      If ( Not Result ) Then Begin

        Raise Exception.Create( Msg );
      End;

      // Pai
      Result := ApplyCds( FCdsCriaRelatorio, _dbCriaRelatorio, [], [] );
      Msg    := _dbCriaRelatorio.MessageInfo;

      If ( Not Result ) Then Begin

        Raise Exception.Create( Msg );
      End;

      Commit;
    Except
      On E:Exception Do Begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      End;
    End;
  End;
end;
//************************************************
Function TCtrlCriaRelatorio.Procurar( idRelatOrc : Double ) : OleVariant;
Begin

   _DbCriaRelatorio.idRelatOrc.AsFloat := idRelatOrc;
   Result := GetDataPacket(_DbCriaRelatorio.SSqlSelect);
End;
//************************************************
Function TCtrlCriaRelatorio.ProcurarDetalhe( idRelatOrc : Double ) : OleVariant;
Var
  SqlLocal : TStringList;

  CdsLocal : TClientDataSet;

Begin
  SqlLocal := TStringList.Create;
  CdsLocal := TClientDataSet.Create( Nil );

  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '  NUMDECIMAIS,    IDRELATORC,     IDPLANOORCAMEN, IDLINHASRELATORC, IDCONTAPARA100,' );
    SqlLocal.Add( '  IDCONTAORCAMEN, FLGTIPOLINHA,   FLGINDENTACAO,    FLGACUMULADO,' );
    SqlLocal.Add( '  ''                               '' AS TIPOLINHA,' );
    SqlLocal.Add( '  ''               '' AS INDENT' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  LINHASRELATORC' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  ( IDRELATORC = ' + FloatToStr( idRelatOrc ) + ' )' );

    CdsLocal.Data := GetDataPacket( SqlLocal.Text );

    While ( Not CdsLocal.EOF ) Do Begin

      CdsLocal.Edit;
      CdsLocal.FieldByName( 'INDENT' ).AsString    := TraduzFLGINDENTACAO( CdsLocal.FieldByName( 'FLGINDENTACAO' ).AsString );
      CdsLocal.FieldByName( 'TIPOLINHA' ).AsString := TraduzFLGTIPOLINHA( CdsLocal.FieldByName( 'FLGTIPOLINHA' ).AsString );
      CdsLocal.Post;

      CdsLocal.Next;
    End;

    Result := CdsLocal.Data;
  Finally

    SqlLocal.Free;
    CdsLocal.Free;
  End;
End;
//************************************************
procedure TCtrlCriaRelatorio.SetCdsCriaRelatorio(
  const Value: TClientDataSet);
begin

  FCdsCriaRelatorio := Value;
end;
//************************************************
procedure TCtrlCriaRelatorio.SetCdsLinhasRelatOrc(
  const Value: TClientDataSet);
begin

   FCdsLinhasRelatOrc := Value;
end;
//************************************************
Function TCtrlCriaRelatorio.PegaProximaLinha( idRelatOrc : Double ) : Integer;
Var
  SqlLocal : TStringList;

  CdsLocal : TClientDataSet;

Begin
  SqlLocal := TStringList.Create;
  CdsLocal := TClientDataSet.Create( Nil );

  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '  MAX( IDLINHASRELATORC ) AS PROXIMA' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  LINHASRELATORC' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  ( IDRELATORC = ' + FloatToStr( idRelatOrc ) + ' )' );

    CdsLocal.Data := GetDataPacket( SqlLocal.Text );

    Result := CdsLocal.FieldByName( 'PROXIMA' ).AsInteger;
  Finally

   SqlLocal.Free;
   CdsLocal.Free;
  End;
End;
//************************************************
Function TCtrlCriaRelatorio.TraduzFLGINDENTACAO( pIndent : String ) : String;
Begin

  //Preenche a descrição da indentação
  If      ( pIndent = '1' ) Then Result := 'Nível 1'
  Else If ( pIndent = '2' ) Then Result := '..Nível 2'
  Else If ( pIndent = '3' ) Then Result := '....Nível 3'
  Else If ( pIndent = '4' ) Then Result := '......Nível 4'
  Else If ( pIndent = '5' ) Then Result := '........Nível 5';
End;
//************************************************
Function TCtrlCriaRelatorio.TraduzFLGTIPOLINHA( pTipoLinha : String ) : String;
Begin

  //Preenche a descrição do tipo de linha
  If      ( pTipoLinha = 'E' ) Then Result := 'Com espaçamento entre as linhas'
  Else If ( pTipoLinha = 'F' ) Then Result := 'Desenha uma linha fina'
  Else If ( pTipoLinha = 'G' ) Then Result := 'Desenha uma linha grossa'
  Else If ( pTipoLinha = 'D' ) Then Result := 'Desenha uma linha dupla';
End;
//************************************************
End.
