Unit uCtrlPortadorconta;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbPortadorconta, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uCtrlPadroes;

Type
  TCtrlPortadorconta = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbPortadorconta: TDbPortadorconta;
    _Padroes: TCtrlPadroes;
    Fcds: TClientDataSet;
    Procedure Setcds(Const Value: TClientDataSet);
  public
    Property cds: TClientDataSet read Fcds write Setcds;
    Constructor Create; override;
    Destructor Destroy; override;
    Function ListPortadorconta(Codportador: double = 0; RECPAG: String = ''; IDPESSOA: double = 0): OleVariant;
    Function ListContaxForma(Codportador: double = 0): Olevariant;
    Function GravarPortadorconta(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
  End;

Implementation

{ TCtrlPortadorconta }

Function TCtrlPortadorconta.GravarPortadorconta(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
Var
  Msg, sDscLog: String;

Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarPortadorconta(cds.Data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(Cds, _DbPortadorconta, [], []);
      Msg := _DbPortadorconta.MessageInfo;

      sDscLog := '';
      If Cds.IsEmpty Then
        sDscLog := 'Exclusao de Contas Bancarias X Caixas'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Contas Bancarias X Caixas'
      Else
        sDscLog := 'Alteracao de Contas Bancarias X Caixas ';

      If Not Result Then
        Raise Exception.create(Msg);
      If sDscLog <> '' Then
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

Constructor TCtrlPortadorconta.Create;
Begin
  Inherited;
  _DbPortadorconta := TDbPortadorconta.Create(self);
  _Padroes := TCtrlPadroes.Create;

End;

Destructor TCtrlPortadorconta.Destroy;
Begin
  _DbPortadorconta.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlPortadorconta.DoChangeDataBase;
Begin
  Inherited;
  _DbPortadorconta.DataBaseName := DataBaseName;
End;

Procedure TCtrlPortadorconta.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Function TCtrlPortadorconta.ListPortadorconta(Codportador: double = 0; RECPAG: String = ''; IDPESSOA: double = 0): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT         ' +
    '  CODPORTADOR, IDUSUARIOINCLUSAO, IDAGENCIA, CODCENTROCUSTO, MOECODIGO, ' +
    '  PLANO, PLACONTA, IDBANCO, NOCONTACORR, IDPESSOA, DESCRICAO, IDEMPRESA, ' +
    '  FLGGRAVAFLUXO, UNIDNEGOC, CODSUBCONTA, FLGSTATUS, CONTROLEREMESSA, FLGCONTAINVEST ' +
    ' ,NDIASAPURACPMF '+//andré tavares - pendência 22316 - 17/05/2006
    'FROM ' +
    '  PORTADORCONTA ' +
    'WHERE ';
  If Codportador <> 0 Then
    ssql := ssql + ' Codportador = ' + floattostr(Codportador);

  If (IDPessoa <> 0) And (Codportador <> 0) Then
  Begin
    ssql := ssql + ' AND ';
  End;
  If IDPessoa <> 0 Then
    ssql := ssql + ' IDPESSOA = ' + floattostr(IDPessoa);
  Result := GetDataPacket(ssql);
End;

Function TCtrlPortadorconta.ListContaxForma(Codportador: double): Olevariant;
Var
  ssql: String;
Begin
  ssql := ' Select Distinct                ' +
    '    Pc.CodPortador, Pc.PlaConta ' +
    ' From  PortadorConta Pc, PortadorForma Pf ' +
    ' Where ' +
    '   Pc.CodPortador = Pf.CodPortador and  ' +
    '   Pc.CodPortador = ' + floattostr(CodPortador);
  result := GetDataPacket(ssql);
End;

Procedure TCtrlPortadorconta.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;

Procedure TCtrlPortadorconta.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

