Unit uCtrlTipoagre;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTipoagre, uDbFaixatipoagreg, uDbTipcustagregconta,
  uSistema, DB, uDataBase, DbClient, uCMTypes, uCtrlPadroes;

Type

  TCtrlTipoagre = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _Padroes: TCtrlPadroes;
    _DbTipoagre: TDbTipoagre;
    _DbFaixatipoagreg: TDbFaixatipoagreg;
    _DbTipcustagregconta: TDbTipcustagregconta;
    Fcds: TClientDataSet;
    FcdsFaixa: TClientDataSet;
    FcdsTipCust: TClientDataSet;
    Procedure Setcds(Const Value: TClientDataSet);
    Procedure SetCdsFaixa(Const Value: TclientDataSet);
    Procedure SetCdsTipFaixa(Const Value: TClientDataSet);

  public
    Property cds: TClientDataSet read Fcds write Setcds;
    Property cdsfaixa: TclientDataSet read FcdsFaixa write SetCdsFaixa;
    Property cdstipCust: TClientDataSet read FcdsTipCust write SetCdsTipFaixa;

    Constructor Create; override;
    Destructor Destroy; override;
    Function ListTipoagre(RECPAG: String = ''; IDCLASFISCLIFOR: double = 0; CODTIPDOC: double = 0): OleVariant;
    Function ListFAIXATIPOAGREG(CODTIPOCUSTAGREG: double): OleVariant;
    Function GravarTipoagre: Boolean;
    Function GravarTipoagreDet(iIdPessoa, iIdModulo, iIdUsuario: integer): Boolean;
    Function ExcluirTipoagreDet(iIdPessoa, iIdModulo, iIdUsuario: integer): Boolean;
  End;

Implementation

{ TCtrlTipoagre }

Constructor TCtrlTipoagre.Create;
Begin
  Inherited;
  _DbTipoagre := TDbTipoagre.Create(self);
  _DbFaixatipoagreg := TDbFaixatipoagreg.Create(self);
  _DbTipcustagregconta := TDbTipcustagregconta.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlTipoagre.Destroy;
Begin
  _DbTipoagre.Free;
  _DbFaixatipoagreg.Free;
  _DbTipcustagregconta.Free;
  _Padroes.Free;
  If isAppServer Then
  Begin
    FCds.Free;
    FCdsFaixa.Free;
    FcdsTipCust.Free;
  End;
  Inherited;
End;

Procedure TCtrlTipoagre.DoChangeDataBase;
Begin
  Inherited;
  _DbTipoagre.DataBaseName := DataBaseName;
  _DbFaixatipoagreg.DataBaseName := DataBaseName;
  _DbTipcustagregconta.DataBaseName := DataBaseName;
End;

Function TCtrlTipoagre.ListTipoagre(RECPAG: String = ''; IDCLASFISCLIFOR: double = 0; CODTIPDOC: double = 0): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT                     ' +
    '     CODTIPOCUSTAGREG,     ' +
    '     DESCCUSTAGREG,        ' +
    '     UNIDNEGOC    ,        ' +
    '     CODTRATFISCE ,        ' +
    '     IDPESSOA     ,        ' +
    '     TOTALITEM    ,        ' +
    '     IDFORCLI     ,        ' +
    '     CODCENTRORESPON,      ' +
    '     PERCVALOR      ,      ' +
    '     RECPAG         ,      ' +
    '     CODTRATFISCD   ,      ' +
    '     FLGINCIDERECEB ,      ' +
    '     CODTIPRECDES   ,      ' +
    '     FLGINCIDECOMPRA ,     ' +
    '     CODTIPDOC       ,     ' +
    '     FLGINCIDENFCOMPL ,    ' +
    '     FLGCHECATOTAL    ,    ' +
    '     FLGACUMULA        ,   ' +
    '     VLRABATFIXO       ,   ' +
    '     FLGTIPOCALC       ,   ' +
    '     CODALTERADOR      ,   ' +
    '     VLRMINIMO         ,   ' +
    '     VALPORDEPENDENTE  ,   ' +
    '     LANCAMENTOIMPOSTO ,   ' +
    '     FLGBASE     ,         ' +
    '     FLGCALCVALBRUTO    ,  ' +
    '     FLGLANCAIMPOSTO    ,  ' +
    '     FLGASSOCIACLASFIS  ,  ' +
    '     FLGALTERARETENCAO ,   ' +
    '     FLGSEMPRECALCULA  ,   ' +
    '     FLGUSAVALFORCLI,      ' +
    '     CODIGOGPS,            '+ // andré tavares - pendência 21175 - 31/03/2006
    '     CODIMPOSTO,           '+ //CATIA - 22654 - 10/07/2006
    '     IDPROGRAMA            '+
    ' FROM      TIPOAGRE T  WHERE (1=1)   ';
  If trim(RECPAG) <> '' Then
    ssql := ssql + ' and RECPAG = ' + quotedstr(RECPAG);
  If IDCLASFISCLIFOR <> 0 Then
    ssql := ssql + ' and IDCLASFISCLIFOR = ' + floattostr(IDCLASFISCLIFOR);
  If CODTIPDOC <> 0 Then
    ssql := ssql + ' and CODTIPDOC = ' + floattostr(CODTIPDOC);
  ssql := ssql + ' ORDER BY DESCCUSTAGREG              ';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlTipoagre.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Function TCtrlTipoagre.GravarTipoagre: Boolean;
Var
  Msg: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarTipoagre(cds.Data);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(Cds, _DbTipoagre, [], []);
      Msg := _DbTipoagre.MessageInfo;

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

Function TCtrlTipoagre.ListFAIXATIPOAGREG(CODTIPOCUSTAGREG: double): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT  ' +
    '   CODTIPOCUSTAGREG, NUMFAIXA, VLRINICIALFAIXA, VLRFINALFAIXA, VLRABATVALOR, ' +
    '   VLRABATCALC, PERCCUSTAGREG, VLRFIXO, PERCBASE, NUMDIASAPURA, NUMDIASVENC  ' +
    'FROM FAIXATIPOAGREG  ' +
    ' WHERE CODTIPOCUSTAGREG = ' + floattostr(CODTIPOCUSTAGREG) +
    ' ORDER BY NUMFAIXA ';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlTipoagre.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
  FCdsFaixa := TClientDataSet.Create(Nil);
  FcdsTipCust := TClientDataSet.Create(Nil);
End;

Procedure TCtrlTipoagre.SetCdsFaixa(Const Value: TclientDataSet);
Begin
  FcdsFaixa := Value;
End;

Procedure TCtrlTipoagre.SetCdsTipFaixa(Const Value: TClientDataSet);
Begin
  FcdsTipCust := Value;
End;

Function TCtrlTipoagre.GravarTipoagreDet(iIdPessoa, iIdModulo, iIdUsuario: integer): Boolean;
Var
  Msg: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarTipoagreDet(cds.Data, cdsfaixa.Data, cdstipCust.Data, iIdPessoa, iIdModulo, iIdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;

      // Pai
      Result := ApplyCds(cds, _DbTipoagre, [], []);
      Msg := _DbTipoagre.MessageInfo;
      If Not Result Then
        Raise Exception.Create(Msg);

      // itens Filhos
      Result := ApplyCds(cdsfaixa, _DbFaixatipoagreg, [_DbTipoagre.CODTIPOCUSTAGREG], [_DbFaixatipoagreg.CODTIPOCUSTAGREG]);
      Msg := _DbFaixatipoagreg.MessageInfo;
      If Not Result Then
        Raise Exception.Create(Msg);

      // itens Filhos
      Result := ApplyCds(cdstipCust, _DbTipcustagregconta, [_DbTipoagre.CODTIPOCUSTAGREG], [_DbTipcustagregconta.CODTIPOCUSTAGREG]);
      Msg := _DbTipcustagregconta.MessageInfo;
      If Not Result Then
        Raise Exception.Create(Msg);

      If Not _Padroes.GravaLogOperacoes(iIdPessoa, iIdModulo, iIdUsuario, 'Impostos com Tabela de Retenção', False) Then
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

Function TCtrlTipoagre.ExcluirTipoagreDet(iIdPessoa, iIdModulo, iIdUsuario: integer): Boolean;
Var
  Msg: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.ExcluirTipoagreDet(cds.Data, cdsfaixa.Data, cdstipCust.Data, iIdPessoa, iIdModulo, iIdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;

      // itens Filhos
      Result := ApplyCds(cdsfaixa, _DbFaixatipoagreg, [_DbTipoagre.CODTIPOCUSTAGREG], [_DbFaixatipoagreg.CODTIPOCUSTAGREG]);
      Msg := _DbFaixatipoagreg.MessageInfo;
      If Not Result Then
        Raise Exception.Create(Msg);

      // itens Filhos
      Result := ApplyCds(cdstipCust, _DbTipcustagregconta, [_DbTipoagre.CODTIPOCUSTAGREG], [_DbTipcustagregconta.CODTIPOCUSTAGREG]);
      Msg := _DbTipcustagregconta.MessageInfo;
      If Not Result Then
        Raise Exception.Create(Msg);

      // Pai
      Result := ApplyCds(cds, _DbTipoagre, [], []);
      Msg := _DbTipoagre.MessageInfo;
      If Not Result Then
        Raise Exception.Create(Msg);

      If Not _Padroes.GravaLogOperacoes(iIdPessoa, iIdModulo, iIdUsuario, 'Impostos com Tabela de Retenção', False) Then
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

Procedure TCtrlTipoagre.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

