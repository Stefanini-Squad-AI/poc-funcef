Unit uCtrlRamoxdesemb;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbRamoxdesemb, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uCtrlPadroes;

Type
  TCtrlRamoxdesemb = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbRamoxdesemb: TDbRamoxdesemb;
    _Padroes: TCtrlPadroes;
    Fcds: TClientDataSet;
    Procedure Setcds(Const Value: TClientDataSet);
  public
    Property cds: TClientDataSet read Fcds write Setcds;
    Constructor Create; override;
    Destructor Destroy; override;
    Function GravarRamoxdesemb(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
  End;

Implementation

{ TCtrlRamoxdesemb }

Function TCtrlRamoxdesemb.GravarRamoxdesemb(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
Var
  Msg: String;
  sDscLog: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarRamoxdesemb(cds.Data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(Cds, _DbRamoxdesemb, [], []);
      Msg := _DbRamoxdesemb.MessageInfo;

      If Not Result Then
        Raise Exception.create(Msg);

      sDscLog := '';

      If Cds.IsEmpty Then
        sDscLog := 'Exclusao de Ramos de Fornecedor x Tipo desembolso'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Ramos de Fornecedor x Tipo desembolso'
      Else
        sDscLog := 'Alteracao de Ramos de Fornecedor x Tipo desembolso';
      If Not _Padroes.GravaLogOperacoes(IdPessoa, IdModulo, IdUsuario, sDscLog, False) Then
        Raise Exception.Create(_Padroes.MessageInfo);

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

Constructor TCtrlRamoxdesemb.Create;
Begin
  Inherited;
  _DbRamoxdesemb := TDbRamoxdesemb.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlRamoxdesemb.Destroy;
Begin
  _DbRamoxdesemb.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlRamoxdesemb.DoChangeDataBase;
Begin
  Inherited;
  _DbRamoxdesemb.DataBaseName := DataBaseName;
End;

Procedure TCtrlRamoxdesemb.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Procedure TCtrlRamoxdesemb.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;

Procedure TCtrlRamoxdesemb.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

