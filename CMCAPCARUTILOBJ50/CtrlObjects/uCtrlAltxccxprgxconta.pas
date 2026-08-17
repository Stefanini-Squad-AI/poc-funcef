Unit uCtrlAltxccxprgxconta;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbAltxccxprgxconta, uSistema, DB,
  uDataBase, DbClient, uString, uCMTypes, uCMClientDataSet, uCtrlPadroes;

Type
  TCtrlAltxccxprgxconta = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbAltxccxprgxconta: TDbAltxccxprgxconta;
    Fcds: TClientDataSet;
    _Padroes: TCtrlPadroes;
    Procedure Setcds(Const Value: TClientDataSet);
  public
    Property cds: TClientDataSet read Fcds write Setcds;
    Constructor Create; override;
    Destructor Destroy; override;
    Function ListAltxccxprgxconta(IDALTXCCXPRGXCONTA: double = 0;
      IDEMPRESA: double = 0;
      PLANO: double = 0;
      CODALTERADOR: double = 0;
      idprograma: double = 0;
      PLACONTA: String = '';
      CODCENTROCUSTO: String = ''): OleVariant;
    Function ListAltxccxprgxcontaCCustoAsso(CODALTERADOR,
      IDPROGRAMA: double;
      PLANO: integer = 0;
      PLACONTA: String = ''; IidPlanCentCust: integer = 0): OleVariant;
    Function ListAltxccxprgxcontaCCustoNaoAsso(CodAlterador,
      Plano,
      IdEmpresa,
      idPrograma: double;
      PLACONTA: String = ''; IidPlanCentCust: integer = 0): OleVariant;
    Function GravarAltxccxprgxconta(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
    Function AplicaAlteracoes(cds_Aplica: OleVariant): boolean;
  End;

Implementation

{ TCtrlAltxccxprgxconta }

Function TCtrlAltxccxprgxconta.GravarAltxccxprgxconta(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
Var
  Msg: String;
  sDscLog: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarAltxccxprgxconta(cds.Data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(Cds, _DbAltxccxprgxconta, [], []);
      Msg := _DbAltxccxprgxconta.MessageInfo;

      If Not Result Then
        Raise Exception.create(Msg);

      sDscLog := '';

      If Cds.IsEmpty Then
        sDscLog := 'Exclusao de Alterador x CC x Conta Cont x Programa'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Alterador x CC x Conta Cont x Programa'
      Else
        sDscLog := 'Alteracao de Alterador x CC x Conta Cont x Programa';
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

Constructor TCtrlAltxccxprgxconta.Create;
Begin
  Inherited;
  _DbAltxccxprgxconta := TDbAltxccxprgxconta.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlAltxccxprgxconta.Destroy;
Begin
  _DbAltxccxprgxconta.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlAltxccxprgxconta.DoChangeDataBase;
Begin
  Inherited;
  _DbAltxccxprgxconta.DataBaseName := DataBaseName;
End;

Procedure TCtrlAltxccxprgxconta.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Function TCtrlAltxccxprgxconta.ListAltxccxprgxconta(IDALTXCCXPRGXCONTA,
  IDEMPRESA,
  PLANO,
  CODALTERADOR,
  idprograma: double;
  PLACONTA,
  CODCENTROCUSTO: String): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT  ' +
    '   IDALTXCCXPRGXCONTA,  ' +
    '   CODCENTROCUSTO,      ' +
    '   IDEMPRESA,           ' +
    '   IDPROGRAMA,          ' +
    '   PLANO,               ' +
    '   PLACONTA,            ' +
    '   CODALTERADOR         ' +
    'FROM                    ' +
    '    ALTXCCXPRGXCONTA  where (1=1)  ';
  If idprograma <> 0 Then
    ssql := ssql + ' and idprograma = ' + floattostr(idprograma);
  //else
   //   ssql1 := ssql1 + ' idprograma is null' ;
  If IDALTXCCXPRGXCONTA <> 0 Then
    ssql := ssql + ' and IDALTXCCXPRGXCONTA = ' +
      floattostr(IDALTXCCXPRGXCONTA);
  If IDEMPRESA <> 0 Then
    ssql := ssql + ' and idempresa = ' + floattostr(Idempresa);
  If PLANO <> 0 Then
    ssql := ssql + ' and plano = ' + floattostr(plano);
  If CODALTERADOR <> 0 Then
    ssql := ssql + ' and CODALTERADOR = ' + floattostr(CODALTERADOR);
  If trim(PLACONTA) <> '' Then
    ssql := ssql + ' and PLACONTA = ''' + PLACONTA + '''';
  If trim(CODCENTROCUSTO) <> '' Then
    ssql := ssql + ' and CODCENTROCUSTO = ''' + CODCENTROCUSTO + '''';
  Result := GetDataPacket(ssql);
End;

Function TCtrlAltxccxprgxconta.ListAltxccxprgxcontaCCustoAsso(CODALTERADOR,
      IDPROGRAMA: double;
      PLANO: integer = 0;
      PLACONTA: String = ''; IidPlanCentCust: integer = 0): OleVariant;
Var
  ssql: String;
Begin
  ssql := ' SELECT ' +
    '  A.IDALTXCCXPRGXCONTA, ' +
    '  A.CODCENTROCUSTO, ' +
    '  A.CODALTERADOR, ' +
    '  A.PLANO, ' +
    '  A.PLACONTA, ' +
    '  A.IDEMPRESA, ' +
    '  A.IDPROGRAMA, ' +
    '  C.NOME, ' +
    '  C.STATUSGRUPOCDC, C.CODEXTERNO ' +
    ' FROM ' +
    '  ALTXCCXPRGXCONTA A, CENTCUST C ' +
    ' WHERE ' +
    '    A.CODALTERADOR = ' + floattostr(CODALTERADOR) + ' AND ' +
    '    RTRIM(A.PLANO) = ''' + floattostr(PLANO) + ''' AND ' +
    '    RTRIM(A.PLACONTA) = ''' + PLACONTA + '''';
  If IDPROGRAMA = 0 Then
    ssql := ssql + ' and a.IDPROGRAMA IS NULL '
  Else
    ssql := ssql + ' and a.IDPROGRAMA = ' + FloatToStr(IDPROGRAMA);
  ssql := ssql +
    '  and A.IDEMPRESA = C.IDEMPRESA  ' +
    '  and A.CODCENTROCUSTO = C.CODCENTROCUSTO AND C.ATIVO = ''S'' ';
    if IidPlanCentCust > 0 then // tavares
      ssql := ssql + ' AND C.IDPLANCENTCUST = '+ intToStr(IidPlancentCust);

  ssql := ssql + ' ORDER BY ' +
    '   A.CODCENTROCUSTO, ' +
    '   C.NOME ';
  Result := GetDataPacket(ssql);
End;

Function TCtrlAltxccxprgxconta.ListAltxccxprgxcontaCCustoNaoAsso(CodAlterador,
      Plano,
      IdEmpresa,
      idPrograma: double;
      PLACONTA: String = ''; IidPlanCentCust: integer = 0): OleVariant;
var  ssql: String;
Begin
  ssql := ' SELECT ' +
    '   (0) AS IDALTXCCXPRGXCONTA, ' +
    '   C.CODCENTROCUSTO, ' +
    '   (' + Floattostr(CodAlterador) + ') AS CODALTERADOR, ' +
    '   (' + Floattostr(Plano) + ') AS PLANO, ' +
    '   (''' + Espaco(Placonta, 18) + ''') AS PLACONTA, ' +
    '   (' + Floattostr(IdEmpresa) + ') AS IDEMPRESA, ' +
    '   (' + Floattostr(idPrograma) + ') AS IDPROGRAMA, ' +
    '   C.NOME, ' +
    '   C.STATUSGRUPOCDC, C.CODEXTERNO ' +
    ' FROM ' +
    '   CENTCUST C ' +
    ' WHERE ' +
    '   C.IDEMPRESA = ' + Floattostr(IdEmpresa) + ' AND ' +
    '   NOT EXISTS ' +
    '       (SELECT ' +
    '         A.IDALTXCCXPRGXCONTA ' +
    '        FROM ' +
    '         ALTXCCXPRGXCONTA A ' +
    '        WHERE ' +
    '         A.CODALTERADOR = ' + Floattostr(CodAlterador) + ' AND ' +
    '         RTRIM(A.PLANO) = ' + Floattostr(Plano) + ' AND ' +
    '         RTRIM(A.PLACONTA) = ''' + Placonta + ''' ';
  If idPrograma = 0 Then
    ssql := ssql + ' and a.IDPROGRAMA IS NULL '
  Else
    ssql := ssql + ' and a.IDPROGRAMA = ' + Floattostr(idPrograma);
  ssql := ssql + ' and A.IDEMPRESA = C.IDEMPRESA AND ' +
    '         A.CODCENTROCUSTO = C.CODCENTROCUSTO )  AND C.ATIVO = ''S'' ';

    if IidPlanCentCust > 0 then // tavares
      ssql := ssql + ' AND C.IDPLANCENTCUST = '+ intToStr(IidPlancentCust);

  ssql := ssql + ' ORDER BY ' +
    '   C.CODCENTROCUSTO, ' +
    '   C.NOME ';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlAltxccxprgxconta.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;

Function TCtrlAltxccxprgxconta.AplicaAlteracoes(cds_Aplica: OleVariant): boolean;
Var
  Msg: String;
  _CdsLocal: TCMClientDataSet;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarAltccprgconta_Aplica(cds_Aplica);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      _CdsLocal := TCMClientDataSet.Create(Nil);
      _cdsLocal.Data := cds_Aplica;

      Result := ApplyCds(_cdsLocal, _DbAltxccxprgxconta, [], []);
      Msg := _DbAltxccxprgxconta.MessageInfo;

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

Procedure TCtrlAltxccxprgxconta.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

