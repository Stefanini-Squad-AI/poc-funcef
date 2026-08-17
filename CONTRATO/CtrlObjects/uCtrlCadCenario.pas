{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit uCtrlCadCenario;

Interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils, wwQuery, provider, uMidasUtil, uDbCadCenario, uCMTypes;

Type
  TCtrlCadCenario = class(TCmControlObject)

  Protected

    Procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

  Private
    _dbCadCenario  : TdbCadCenario;

    FCdsCadCenario : TClientDataSet;
    Procedure SetCdsCadCenario(const Value: TClientDataSet);

  public
    Constructor Create; Override;
    Destructor  Destroy;Override;

    Function Procurar(idCenarioOrcamen:Double): OleVariant;
    Function AplicaOperacaoCadCenario: Boolean;

    Property CdsCadCenario : TClientDataSet Read FCdsCadCenario Write SetCdsCadCenario;
  end;

Implementation
//************************************************
Procedure TCtrlCadCenario.OnCreateAppServer;
Begin
  Inherited;

  FCdsCadCenario := TClientDataSet.Create( Nil );
End;
//************************************************
Procedure TCtrlCadCenario.DoChangeDataBase;
Begin
  Inherited;

  _dbCadCenario.DatabaseName := DataBaseName;
End;
//************************************************
Constructor TCtrlCadCenario.Create;
Begin
  Inherited;

  _DbCadCenario := TDbCadCenario.Create( Self );
  //
End;
//************************************************
Destructor TCtrlCadCenario.Destroy;
Begin
  Inherited;

  _DbCadCenario.Free;

  If ( isAppServer ) Then Begin

    FreeCds( [ FCdsCadCenario ] );
  End;
End;
//************************************************
Function TCtrlCadCenario.AplicaOperacaoCadCenario: Boolean;
Begin
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.AplicaOperacaoCadCenario(FCdsCadCenario.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsCadCenario,_DbCadCenario,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbCadCenario.MessageInfo;
            Abort;
         End Else
            Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         End;
      End;
   End;
End;
//************************************************
Function TCtrlCadCenario.Procurar(idCenarioOrcamen:Double): OleVariant;
Begin

  _DbCadCenario.IdCenarioOrcamen.AsFloat := idCenarioOrcamen;
  Result := GetDataPacket(_DbCadCenario.SSqlSelect);

End;
//************************************************
Procedure TCtrlCadCenario.SetCdsCadCenario(
  const Value: TClientDataSet);
Begin

  FCdsCadCenario := Value;
End;
//************************************************
End.
