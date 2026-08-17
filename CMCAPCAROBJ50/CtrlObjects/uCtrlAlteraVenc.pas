Unit uCtrlAlteraVenc;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase,
  DbClient, uCMTypes, uCtrlPadroes;

Type
  TCtrlAlteraVenc = Class(TCmControlObject)
  protected
    Procedure AfterInitialize; override;
  private
    _Padroes: TCtrlPadroes;
  public
    Constructor Create; override;
    Destructor Destroy; override;
    Function ListDocumento(iCodDocumento: Integer; RecPag: String): OleVariant;
    Function AlteraVencimento(iCodDocumento: Integer; DataProgramada:
      TDateTime; iEmpresa, iModulo, iUsuario: Integer): Boolean;
  End;

Implementation

{ TCtrlAlteraVenc }

Procedure TCtrlAlteraVenc.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(self);
  _Padroes.OpenTransaction := false;
End;

Function TCtrlAlteraVenc.AlteraVencimento(iCodDocumento: Integer;
  DataProgramada: TDateTime; iEmpresa, iModulo, iUsuario: Integer): Boolean;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.AlteraVencimento(iCodDocumento,
      DataProgramada, iEmpresa, iModulo, iUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    StartTransaction;
    Try
      If Not ExecSQL('UPDATE DOCUMENTO SET DATAPROGRAMADA = TO_DATE(' +
        QuotedStr(DateToStr(DataProgramada)) + ', ''DD/MM/YYYY'') ' +
        'WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento)) Then
        Raise Exception.Create(MessageInfo);
      If Not _Padroes.GravaLogOperacoes(iEmpresa, iModulo, iUsuario, 'Alteracao de Vencimento', False) Then
        Raise Exception.Create(_Padroes.MessageInfo);
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
End;

Constructor TCtrlAlteraVenc.Create;
Begin
  Inherited;
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlAlteraVenc.Destroy;
Begin
  Inherited;
_Padroes.Free;
End;

Function TCtrlAlteraVenc.ListDocumento(iCodDocumento: Integer; RecPag: String):
  OleVariant;
Var
  sSQL: String;
Begin
  sSQL := 'SELECT ' +
    '  P.RAZAOSOCIAL,D.CODDOCUMENTO, ' +
    '  D.NODOCUMENTO,D.COMPLDOCUMENTO,D.DATAVENCTO, ' +
    '  D.DATAPROGRAMADA AS DATAATU,D.DATAPROGRAMADA, ' +
    '  D.DATAEMISSAO ' +
    'FROM PESSOA P,DOCUMENTO D ' +
    'WHERE ' +
    '(D.CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ') AND ' +
    '(D.RECPAG = ' + QuotedStr(RecPag) + ') AND ' +
    '(P.IDPESSOA = D.IDFORCLI) ';
  Result := GetDataPacket(sSQL);
End;

End.

