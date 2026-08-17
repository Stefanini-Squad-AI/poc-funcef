Unit uCtrlAlteraDocEmitido;

{ MUDANÇAS

Pend    : 15465
Autor   : Alex
Data    : 05/11/03
Correção: Corrigida a o update documento ...
}

Interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, uCMTypes,
  DbClient, Classes;

Type

  TCtrlAlteraDocEmitido = Class(TCmControlObject)
  protected
    Procedure AfterInitialize; override;
  private
  public
    Constructor Create; override;
    Destructor Destroy; override;
    Function GravaAlteraDocEmitido(ovDocEmitidos: OleVariant): Boolean;
  End;

Implementation

Procedure TCtrlAlteraDocEmitido.AfterInitialize;
Begin
  Inherited;
End;

Function TCtrlAlteraDocEmitido.GravaAlteraDocEmitido(ovDocEmitidos: OleVariant): Boolean;
Var
  CdsDocEmitidos: TClientDataSet;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravaAlteraDocEmitido(ovDocEmitidos);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    Try
      CdsDocEmitidos := TClientDataSet.Create(Nil);
      CdsDocEmitidos.Data := ovDocEmitidos;
      StartTransaction;
      While Not CdsDocEmitidos.Eof Do
      Begin
        // by alex - 05/11/03 - pend 15465 - quotedstr
        if CdsDocEmitidos.FieldByName('EMISBLOQ').AsString = 'S' then begin
           ExecSql('update DOCUMENTO set EMISBLOQ = ' + QuotedStr(CdsDocEmitidos.FieldByName('EMISBLOQ').AsString) +
             ' , CONTROLEREMESSA = ' + CdsDocEmitidos.FieldByName('CONTROLEREMESSA').AsString +
             ' where CODDOCUMENTO = ' + CdsDocEmitidos.FieldByName('CODDOCUMENTO').AsString);
        end else begin
           ExecSql('update DOCUMENTO set EMISBLOQ = ' + QuotedStr(CdsDocEmitidos.FieldByName('EMISBLOQ').AsString) +
             ' , CONTROLEREMESSA = NULL ' +
             ' where CODDOCUMENTO = ' + CdsDocEmitidos.FieldByName('CODDOCUMENTO').AsString);
        end;
        CdsDocEmitidos.Next;
      End;
      Commit;
    Except
      On E: Exception Do
      Begin
        Result := False;
        MessageInfo := E.Message;
        Rollback;
      End;
    End;
  End;
End;

Constructor TCtrlAlteraDocEmitido.Create;
Begin
  Inherited;
End;

Destructor TCtrlAlteraDocEmitido.Destroy;
Begin
  Inherited;
End;

End.

