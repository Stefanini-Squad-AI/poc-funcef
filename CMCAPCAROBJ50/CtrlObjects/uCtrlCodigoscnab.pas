Unit uCtrlCodigoscnab;
                              
Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbCodigoscnab, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uCtrlPadroes;

Type

  TCtrlCodigoscnab = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbCodigoscnab: TDbCodigoscnab;
    _Padroes: TCtrlPadroes;
    Fcds: TClientDataSet;
    Procedure Setcds(Const Value: TClientDataSet);

  public
    Property cds: TClientDataSet read Fcds write Setcds;
    Constructor Create; override;
    Destructor Destroy; override;
    Function ListCodigoscnab(idCodigoscnab: double = 0; IDMODELOSCNAB: double = 0; RECPAG: String = ''): OleVariant;
    Function GravarCodigoscnab(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
  End;

Implementation

{ TCtrlCodigoscnab }

Constructor TCtrlCodigoscnab.Create;
Begin
  Inherited;
  _DbCodigoscnab := TDbCodigoscnab.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlCodigoscnab.Destroy;
Begin
  _DbCodigoscnab.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlCodigoscnab.DoChangeDataBase;
Begin
  Inherited;
  _DbCodigoscnab.DataBaseName := DataBaseName;
End;

Function TCtrlCodigoscnab.ListCodigoscnab(idCodigoscnab: double = 0;
  IDMODELOSCNAB: double = 0;
  RECPAG: String = ''): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT                   ' +
    '  IDCODIGOSCNAB,         ' +
    '  IDMODELOSCNAB,         ' +
    '  RECPAG,                ' +
    '  TIPO,                  ' +
    '  CODIGO,                ' +
    '  DESCRICAO,             ' +
    '  FLGINDICABAIXA,        ' +
    '  CODALTERADOR           ' + 
    'FROM                     ' +
    '       Codigoscnab C  where (1=1)   ';
  If idCodigoscnab <> 0 Then
    ssql := ssql + ' and idCodigoscnab = ' + floattostr(idCodigoscnab);
  If IDMODELOSCNAB <> 0 Then
    ssql := ssql + ' and IDMODELOSCNAB = ' + floattostr(IDMODELOSCNAB);
  If trim(RECPAG) <> '' Then
    ssql := ssql + ' and REGPAG = ' + quotedstr(RECPAG);
  ssql := ssql + '  ORDER BY DESCRICAO      ';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlCodigoscnab.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Function TCtrlCodigoscnab.GravarCodigoscnab(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
Var
  Msg: String;
  sDscLog: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarCodigoscnab(cds.Data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;

      Result := ApplyCds(Cds, _DbCodigoscnab, [], []);
      Msg := _DbCodigoscnab.MessageInfo;

      sDscLog := '';
      If Cds.IsEmpty Then
        sDscLog := 'Exclusao Codigo de Cobrança Eletronica'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Codigo de Cobrança Eletronica'
      Else
        sDscLog := 'Alteracao de Codigo de Cobrança Eletronica';

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

Procedure TCtrlCodigoscnab.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;

Procedure TCtrlCodigoscnab.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

