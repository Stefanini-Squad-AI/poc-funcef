{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit uCtrlCompContasOrcamen;

Interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider, uMidasUtil, 
  uDbCompContasOrcamen, uCMTypes;

Type
  TCtrlCompContasOrcamen = class(TCmControlObject)

  Protected

    Procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

  Private
    _dbCompContasOrcamen : TdbCompContasOrcamen;

    FCdsCompContasOrcamen : TClientDataSet;

    Procedure SetCdsCompContasOrcamen( Const Value : TClientDataSet );

  Public

    Constructor Create; Override;
    Destructor  Destroy;Override;

    Function Procurar( idCompContasOrcamen : Double ) : OleVariant;
    Function AplicaOperacaoCompContasOrcamen: Boolean;

    Property CdsCompContasOrcamen : TClientDataSet Read FCdsCompContasOrcamen Write SetCdsCompContasOrcamen;
  End;

Implementation
//************************************************
Procedure TCtrlCompContasOrcamen.DoChangeDataBase;
Begin
  Inherited;

  _dbCompContasOrcamen.DatabaseName := DataBaseName;
End;
//************************************************
Procedure TCtrlCompContasOrcamen.OnCreateAppServer;
Begin
  Inherited;

  FCdsCompContasOrcamen := TClientDataSet.Create( Nil );
End;
//************************************************
Constructor TCtrlCompContasOrcamen.Create;
Begin
  Inherited;

  _DbCompContasOrcamen := TDbCompContasOrcamen.Create( Self );
End;
//************************************************
Destructor TCtrlCompContasOrcamen.Destroy;
Begin
 Inherited;

  _DbCompContasOrcamen.Free;

  If ( isAppServer ) Then Begin

    FreeCds( [ FCdsCompContasOrcamen ] );
  End;
End;
//************************************************
Function TCtrlCompContasOrcamen.AplicaOperacaoCompContasOrcamen: Boolean;
Begin
   If ( ConnectionSide = cnsClient ) Then Begin

      Result := Connection.AppServer.AplicaOperacaoCompContasOrcamen(FCdsCompContasOrcamen.Data);

      If ( Not Result ) Then Begin
        MessageInfo := Connection.AppServer.MessageInfo;
      End;

   End Else Begin

      MessageInfo := '';
      Try
        StartTransaction;
        Result := ApplyCDS( FCdsCompContasOrcamen, _DbCompContasOrcamen, [], [] );

        If ( Not Result ) Then Begin

          MessageInfo := _DbCompContasOrcamen.MessageInfo;
          Abort;
        End Else Begin
          Commit;
        End;
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
Function TCtrlCompContasOrcamen.Procurar( idCompContasOrcamen : Double ) : OleVariant;
Begin

  _DbCompContasOrcamen.Idcompcontasorc.AsFloat := idCompContasOrcamen ;
  Result := GetDataPacket( _DbCompContasOrcamen.SSqlSelect );

End;
//************************************************
Procedure TCtrlCompContasOrcamen.SetCdsCompContasOrcamen( Const Value : TClientDataSet );
Begin

  FCdsCompContasOrcamen := Value;
End;
//************************************************
End.
