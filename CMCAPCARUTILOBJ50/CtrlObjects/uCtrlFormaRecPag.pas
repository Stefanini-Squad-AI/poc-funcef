Unit uCtrlFormaRecPag;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbFormaRecPag, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uCtrlPadroes;

Type

  TCtrlFormaRecPag = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbFormaRecPag: TDbFormaRecPag;
    _Padroes: TCtrlPadroes;
    Fcds: TClientDataSet;
    // Eventos dos ClientDataSet´s
    Procedure Setcds(Const Value: TClientDataSet);

  public
    Property cds: TClientDataSet read Fcds write Setcds;
    // Métodos
    Constructor Create; override;
    Destructor Destroy; override;
    //  Informa os Compradore existentes
    Function ListFormaRecPag(idpessoa: double = 0; CODFORMA: double = 0;
      RECPAG: String = ''): OleVariant;
    Function GravarFormaRecPag(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
  End;

Implementation

{ TCtrlFormaRecPag }

Constructor TCtrlFormaRecPag.Create;
Begin
  Inherited;
  _DbFormaRecPag := TDbFormaRecPag.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlFormaRecPag.Destroy;
Begin
  _DbFormaRecPag.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlFormaRecPag.DoChangeDataBase;
Begin
  Inherited;
  _DbFormaRecPag.DataBaseName := DataBaseName;
End;

Function TCtrlFormaRecPag.ListFormaRecPag(idpessoa: double = 0; CODFORMA: double = 0;
  RECPAG: String = ''): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT                     ' +
    '  CODFORMA,               ' +
    '  RECPAG   ,              ' +
    '  DESCRICAO ,             ' +
    '  IDPESSOA  ,             ' +
    '  IDUSUARIOINCLUSAO ,     ' +
    '  FLGDADOSBANCARIOS       ' +
    'FROM  FormaRecPag f ' +
    '  where (1=1) ';
  If idpessoa <> 0 Then
    ssql := ssql + ' and IDPESSOA = ' + floattostr(idpessoa);
  If CODFORMA <> 0 Then
    ssql := ssql + ' and CODFORMA = ' + floattostr(CODFORMA);
  If trim(RECPAG) <> '' Then
    ssql := ssql + ' and  RECPAG = ''' + RECPAG + '''';
  ssql := ssql + ' ORDER BY DESCRICAO               ';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlFormaRecPag.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Function TCtrlFormaRecPag.GravarFormaRecPag(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
Var
  Msg: String;
  sDscLog: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarFormaRecPag(cds.Data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(Cds, _DbFormaRecPag, [], []);
      Msg := _DbFormaRecPag.MessageInfo;
      sDscLog := '';
      If Cds.IsEmpty Then
        sDscLog := 'Exclusao de Forma de Pagamento'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Forma de Pagamento'
      Else
        sDscLog := 'Alteracao de Forma de Pagamento ';

      If Not Result Then
        Raise Exception.create(Msg);
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

Procedure TCtrlFormaRecPag.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;

Procedure TCtrlFormaRecPag.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

