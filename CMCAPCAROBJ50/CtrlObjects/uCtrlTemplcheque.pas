Unit uCtrlTemplcheque;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTemplcheque, uSistema, DB, uDataBase,
  DbClient, uDbConfigCheque, uCMTypes, uCtrlPadroes;

Type
  TCtrlTemplcheque = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbTemplcheque: TDbTemplcheque;
    Fcds: TClientDataSet;
    _Padroes: TCtrlPadroes;

    _DbConfigCheque: TDbConfigCheque;
    FcdsConfigCheque: TClientDataSet;

    // Eventos dos ClientDataSet´s
    Procedure Setcds(Const Value: TClientDataSet);
    Procedure SetcdsConfigCheque(Const Value: TClientDataSet);

  public
    Property cds: TClientDataSet read Fcds write Setcds;
    Property cdsConfigCheque: TClientDataSet read FcdsConfigCheque write SetcdsConfigCheque;
    // Métodos
    Constructor Create; override;
    Destructor Destroy; override;
    //  Informa os Compradore existentes
    Function ListTemplcheque(IDTEMPLCHEQUE: double = 0): OleVariant;
    Function GravarTemplcheque(IdPessoa, IdModulo, IdUsuario : Integer): Boolean;
    Function ExcluirTemplcheque: Boolean;
  End;

Implementation

{ TCtrlTemplcheque }

Constructor TCtrlTemplcheque.Create;
Begin
  Inherited;
  _DbTemplcheque := TDbTemplcheque.Create(self);
  _DbConfigCheque := TDbConfigCheque.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlTemplcheque.Destroy;
Begin
  _DbTemplcheque.Free;
  _DbConfigCheque.free;
  _Padroes.Free;
  If isAppServer Then
  Begin
    FCds.Free;
    FcdsConfigCheque.Free;
  End;
  Inherited;
End;

Procedure TCtrlTemplcheque.DoChangeDataBase;
Begin
  Inherited;
  _DbTemplcheque.DataBaseName := DataBaseName;
  _DbConfigCheque.DataBaseName := DataBaseName;
End;

Function TCtrlTemplcheque.ListTemplcheque(IDTEMPLCHEQUE: double = 0): OleVariant;
Var
  ssql: String;
Begin
  ssql := ' SELECT IDTEMPLCHEQUE,LAYOUT,QTDEDIGITOSANO, FLGIMPCONDENSADO, ' +
    '        NUMCHQSALTO, NUMLINHASSALTO ' +
    ' FROM ' +
    '  TEMPLCHEQUE WHERE (1=1)';
  If IDTEMPLCHEQUE <> 0 Then
    ssql := ssql + ' and IDTEMPLCHEQUE = ' + floattostr(IDTEMPLCHEQUE);
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlTemplcheque.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Function TCtrlTemplcheque.GravarTemplcheque(IdPessoa, IdModulo, IdUsuario : Integer): Boolean;
Var
  Msg: String;
  sDscLog: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarTemplcheque(cds.Data, cdsConfigCheque.data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      // Pai
      Result := ApplyCds(FCds, _DbTemplcheque, [], []);
      Msg := _DbTemplcheque.MessageInfo;
      If Not Result Then
        Raise Exception.create(Msg);

      sDscLog := '';

      If Cds.IsEmpty Then
        sDscLog := 'Exclusao de Configuracao de Modelo de Cheque'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Ramos de Configuracao de Modelo de Cheque'
      Else
        sDscLog := 'Alteracao de Ramos de Configuracao de Modelo de Cheque';
      If Not _Padroes.GravaLogOperacoes(IdPessoa, IdModulo, IdUsuario, sDscLog, False) Then
        Raise Exception.Create(_Padroes.MessageInfo);

      Commit;

      // filho
      Result := ApplyCds(FcdsConfigCheque, _DbConfigCheque,
        [_DbTemplcheque.Idtemplcheque], [_DbConfigCheque.Idtemplcheque]);
      Msg := _DbConfigCheque.MessageInfo;
      If Not Result Then
        Raise Exception.create(Msg);

    Except
      On E: Exception Do
      Begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

Procedure TCtrlTemplcheque.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
  FcdsConfigCheque := TClientDataSet.Create(Nil);
End;

Function TCtrlTemplcheque.ExcluirTemplcheque: Boolean;
Var
  Msg: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarTemplbloqcheque(cds.Data, cdsConfigCheque.data);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      // filho
      Result := ApplyCds(FcdsConfigCheque, _DbConfigCheque,
        [_DbTemplcheque.Idtemplcheque], [_DbConfigCheque.Idtemplcheque]);
      Msg := _DbConfigCheque.MessageInfo;
      If Not Result Then
        Raise Exception.create(Msg);

      // pai
      Result := ApplyCds(FCds, _DbTemplCheque, [], []);
      Msg := _DbTemplcheque.MessageInfo;
      If Not Result Then
        Raise Exception.create(Msg);

      Commit;
    Except
      On E: Exception Do
      Begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

Procedure TCtrlTemplcheque.SetcdsConfigCheque(Const Value: TClientDataSet);
Begin
  FcdsConfigCheque := Value;
End;

Procedure TCtrlTemplcheque.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

