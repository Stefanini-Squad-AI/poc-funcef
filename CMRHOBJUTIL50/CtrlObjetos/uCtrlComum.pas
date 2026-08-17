Unit
  uCtrlComum;

Interface

Uses
  SysUtils, uCmControlObject, uCmDbObject, DB, DbClient, uCMTypes, uCtrlCustomRH,
  Classes, uMidasUtil, uCMClientDataSet;

Type
  TCTrlComum = class(TCtrlCustomRH)
  Protected

  Private

  Public
    Function AtualizaTabela( //pUsaTransacao : Boolean;
                             pSql          : String ) : Boolean;
    Function FazQuery( pCdsLocal : TClientDataSet;
                       pSqlLocal : String ) : Boolean;
    Function ExecutaComandos( pStlComandosSQL: TStringList;
                              pAbreTrans : Boolean = False): Boolean;
    Procedure FechaCds( pDataModulo : TDataModule );
End;

Implementation

{ TCtrlComum }
//************************************************
Function TCTrlComum.AtualizaTabela( //pUsaTransacao : Boolean;
                                    pSql          : String ): Boolean;
Begin
  MessageInfo := '';
  If ConnectionSide = cnsClient Then Begin

    Result := Connection.AppServer.AtualizaTabela( pSql );
    MessageInfo := Connection.AppServer.MessageInfo;

  End Else Begin
    Try
      //If pUsaTransacao Then StartTransaction;

      ExecSql( pSql );
      //If pUsaTransacao Then Commit;
      Result := True;
    Except
      On E : Exception Do Begin
        //If pUsaTransacao Then Rollback;
        Result := False;
        MessageInfo := E.Message;
        Raise Exception.Create( MessageInfo );
      End;
    End;
  End;
End;
//************************************************
Function TCTrlComum.FazQuery( pCdsLocal : TClientDataSet;
                              pSqlLocal : String ): Boolean;
Begin
  Try
    pCdsLocal.Data := GetDataPacket( pSqlLocal );

    Result := ( Not pCdsLocal.IsEmpty );
  Except
    On E : Exception Do Begin
      Result := False;
      MessageInfo := E.Message;
    End;
  End;
End;
//************************************************
Function TCTrlComum.ExecutaComandos( pStlComandosSQL : TStringList;
                                     pAbreTrans : Boolean = False ) : Boolean;
Var
  Posicao       : Integer;
  ovComandosSQL : OleVariant;
Begin
  If ConnectionSide = cnsClient Then Begin

    ovComandosSQL := StringlistToVariant( pStlComandosSQL );
    Result := Connection.AppServer.ExecutaComandos( ovComandosSQL );
    MessageInfo := Connection.AppServer.MessageInfo;

  End Else Begin
    Try
      If pAbreTrans Then StartTransaction;

      For Posicao := 0 To pStlComandosSQL.Count - 1 Do Begin
        ExecSql( pStlComandosSQL[ Posicao ] );
      End;

      If pAbreTrans Then Commit;
      MessageInfo := 'Atualizações realizadas';
      Result := True;
    Except
      On E : Exception Do Begin
        Result := False;
        MessageInfo := E.Message;

        If pAbreTrans Then RollBack;
      End;
    End;
  End;
End;
//************************************************
Procedure TCTrlComum.FechaCds( pDataModulo : TDataModule );
Var
  Posicao : Integer;
Begin
  For Posicao := 0 To pDataModulo.ComponentCount - 1 Do Begin
    If ( pDataModulo.Components[ Posicao ].ClassType = TCMClientDataSet ) Then Begin

      If ( TCMClientDataSet( pDataModulo.Components[ Posicao ] ).Active ) Then Begin
        TCMClientDataSet( pDataModulo.Components[ Posicao ] ).EmptyDataSet;
        TCMClientDataSet( pDataModulo.Components[ Posicao ] ).Close;
        TCMClientDataSet( pDataModulo.Components[ Posicao ] ).Active := False;
      End;

    End Else If ( pDataModulo.Components[ Posicao ].ClassType = TClientDataSet ) Then Begin

      If ( TClientDataSet( pDataModulo.Components[ Posicao ] ).Active ) Then Begin
        TClientDataSet( pDataModulo.Components[ Posicao ] ).EmptyDataSet;
        TClientDataSet( pDataModulo.Components[ Posicao ] ).Close;
        TClientDataSet( pDataModulo.Components[ Posicao ] ).Active := False;
      End;
    End;
  End;
End;
//************************************************
End.
