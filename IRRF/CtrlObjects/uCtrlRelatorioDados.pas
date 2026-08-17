{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 28/08/2011                             }
{*******************************************************}
Unit uCtrlRelatorioDados;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, UDbRelatorioDados, DB,
   uDataBase, uSistema, DbClient, {$IFNDEF VERSAO0505}uCMTypes{$ENDIF};

Type
   TCtrlRelatorioDados = Class(TCmControlObject)

   Private
      FDbRelatorioDados: TDbRelatorioDados;

      FCdsRelatorioDados: TClientDataSet;

      Procedure SetDbRelatorioDados(Const Value: TDbRelatorioDados);
      Procedure SetCdsRelatorioDados(Const Value: TClientDataSet);

   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;

   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Property CdsRelatorioDados: TClientDataSet Read FCdsRelatorioDados Write SetCdsRelatorioDados;
      Property DbRelatorioDados: TDbRelatorioDados Read FDbRelatorioDados Write setDbRelatorioDados;

      Function GravarRelatorioDados: Boolean;
      Function ProcurarRelatorioDados(iIdRelatorioDados: Integer): OleVariant;
      Function ListRelatorioDados: OleVariant;
   Protected

   End;

Implementation

{ TCtrlNatuRendimento }

Constructor TCtrlRelatorioDados.Create;
Begin
   Inherited;
   FDbRelatorioDados := TDbRelatorioDados.create(self);
End;

Destructor TCtrlRelatorioDados.Destroy;
Begin
   FDbRelatorioDados.Free;
   If isAppServer Then
      Begin
         FCdsRelatorioDados.free;
      End;
   Inherited;
End;

Procedure TCtrlRelatorioDados.DoChangeDataBase;
Begin
   Inherited;
   DbRelatorioDados.DataBaseName := DataBaseName;
End;

Procedure TCtrlRelatorioDados.SetCdsRelatorioDados(Const Value: TClientDataSet);
Begin
   FCdsRelatorioDados := Value;
End;

Procedure TCtrlRelatorioDados.SetDbRelatorioDados(Const Value: TDbRelatorioDados);
Begin
   FDbRelatorioDados := Value;
End;

Function TCtrlRelatorioDados.GravarRelatorioDados: Boolean;
Var
   Msg: String;
Begin
   Try
      StartTransaction;
      // Pai
      Result := ApplyCds(FCdsRelatorioDados, FDbRelatorioDados, [], []);
      Msg := FDbRelatorioDados.MessageInfo;
      If Not Result Then
         Raise Exception.Create(Msg);
      Commit;
   Except
      On E: Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
   End;
End;

Function TCtrlRelatorioDados.ProcurarRelatorioDados(iIdRelatorioDados: Integer): OleVariant;
Var
   sSql: String;
Begin
   sSql := 'SELECT * ' + #13#10 +
      '  FROM RELATORIO_DADOS_CADASTRAIS ' + #13#10 +
      ' WHERE IDRelatorioDados = ' + IntToStr(iIdRelatorioDados);
   Result := GetDataPacket(sSql);
End;

Procedure TCtrlRelatorioDados.OnCreateAppServer;
Begin
   Inherited;
   FcdsRelatorioDados := TClientDataSet.Create(Nil);
End;

Function TCtrlRelatorioDados.ListRelatorioDados: OleVariant;
Var
   sSql: String;
Begin
   sSql := 'SELECT * ' + #13#10 +
      '  FROM RELATORIO_DADOS_CADASTRAIS ' + #13#10 +
      ' ORDER BY IdRelatorioDados';
   Result := GetDataPacket(sSql);
End;

End.
