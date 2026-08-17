Unit uCtrlTipodocrecpag;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTipodocrecpag, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uCtrlPadroes;

Type

  TCtrlTipodocrecpag = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbTipodocrecpag: TDbTipodocrecpag;
    Fcds: TClientDataSet;
    _Padroes: TCtrlPadroes;
    Procedure Setcds(Const Value: TClientDataSet);

  public
    Property cds: TClientDataSet read Fcds write Setcds;
    Constructor Create; override;
    Destructor Destroy; override;
    Function ListTipodocrecpag(RECPAG: String; CODTIPDOC: double): OleVariant;
    Function ListTipoDocAgrupo(Recpag: String; idusuario: integer): OleVariant;
    Function ListTipoDocUsuario(Recpag: String; idusuario: integer): OleVariant;

    Function ListTipoDocLanc(Recpag: String; idusuario: integer): OleVariant;
    Function GravarTipodocrecpag(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
  End;

Implementation

{ TCtrlTipodocrecpag }

Constructor TCtrlTipodocrecpag.Create;
Begin
  Inherited;
  _DbTipodocrecpag := TDbTipodocrecpag.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlTipodocrecpag.Destroy;
Begin
  _DbTipodocrecpag.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlTipodocrecpag.DoChangeDataBase;
Begin
  Inherited;
  _DbTipodocrecpag.DataBaseName := DataBaseName;
End;

Function TCtrlTipodocrecpag.ListTipodocrecpag(RECPAG: String; CODTIPDOC: double): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, NVL(FLGGERANUMDOC, ''N'') AS FLGGERANUMDOC, NVL(FLGDOCFISCAL, ''N'') AS FLGDOCFISCAL, ' +
    '   FLGSERVICO, CODREDUZIDO, RecPag, FLGDOCBANCARIO, IDUSUARIOINCLUSAO, NVL(FLGIMPRIMEAP, ''N'') AS FLGIMPRIMEAP, NVL(FLGNAOGERARAD, ''N'') AS FLGNAOGERARAD ' + // adicionei a coluna FLGNAOGERARAD - pendência 17624 - 16/12/2004
    ' FROM TIPODOCRECPAG WHERE RECPAG = ''' + RECPAG + '''';
  If CODTIPDOC <> 0 Then
    ssql := ssql + ' and  CODTIPDOC = ' + floattostr(CODTIPDOC);
  ssql := ssql + ' ORDER BY DEBCRE DESC,DESCRICAO';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlTipodocrecpag.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Function TCtrlTipodocrecpag.GravarTipodocrecpag(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
Var
  Msg: String;
  sDscLog: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarTipodocrecpag(cds.Data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(Cds, _DbTipodocrecpag, [], []);
      Msg := _DbTipodocrecpag.MessageInfo;

      If Not Result Then
        Raise Exception.create(Msg);

      sDscLog := '';
      If Cds.IsEmpty Then
        sDscLog := 'Exclusao de Tipo de Documento'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Tipo de Documento'
      Else
        sDscLog := 'Alteracao de Tipo de Documento';

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

Procedure TCtrlTipodocrecpag.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;

Function TCtrlTipodocrecpag.ListTipoDocAgrupo(Recpag: String; idusuario: integer): OleVariant;
Var
  ssql: String;
Begin
  ssql := '  SELECT recpag, CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, ' +
    '  FLGGERANUMDOC, FLGDOCFISCAL, FLGIMPRIMEAP FROM TIPODOCRECPAG a ' +
    ' WHERE a.RECPAG =  ' + #39 + recpag + #39 + ' AND ((FLGENGLOBAPARCELA <> ''S'') OR (FLGENGLOBAPARCELA IS NULL)) ' +
    ' and not exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + recpag + #39 + ' and b.idusuario=' + inttostr(IdUsuario) + ') '
    +
    ' union SELECT recpag,CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, ' +
    ' FLGGERANUMDOC, FLGDOCFISCAL, FLGIMPRIMEAP FROM TIPODOCRECPAG a ' +
    ' WHERE a.RECPAG =  ' + #39 + recpag + #39 + ' AND ((FLGENGLOBAPARCELA <> ''S'') OR (FLGENGLOBAPARCELA IS NULL)) ' +
    ' and  exists ' +
    ' (select 1 from UsuarioxTpdocto b where recpag=' + #39 + recpag + #39 + ' and a.codtipdoc=b.codtipdoc  ' +
    ' and b.idusuario=' + inttostr(IdUsuario) + ') ORDER BY DEBCRE DESC,DESCRICAO  ';
  Result := GetDataPacket(ssql);
End;

Function TCtrlTipodocrecpag.ListTipoDocLanc(Recpag: String;
  idusuario: integer): OleVariant;
Var
  ssql: String;
Begin
  ssql := '  SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, ' +
    '  FLGGERANUMDOC, FLGDOCFISCAL, FLGIMPRIMEAP FROM TIPODOCRECPAG a ' +
    ' WHERE a.RECPAG =  ' + #39 + recpag + #39 +
    ' and not exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + recpag + #39 + ' and b.idusuario=' + Inttostr(IdUsuario) + ') '
    +
    ' union SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, ' +
    ' FLGGERANUMDOC, FLGDOCFISCAL, FLGIMPRIMEAP FROM TIPODOCRECPAG a ' +
    ' WHERE a.RECPAG =  ' + #39 + recpag + #39 + ' and  exists ' +
    ' (select 1 from UsuarioxTpdocto b where recpag=' + #39 + recpag + #39 + ' and a.codtipdoc=b.codtipdoc  ' +
    ' and b.idusuario=' + Inttostr(IdUsuario) + ') ORDER BY DEBCRE DESC,DESCRICAO  ';
  Result := GetDataPacket(ssql);
End;

Function TCtrlTipodocrecpag.ListTipoDocUsuario(Recpag: String;
  idusuario: integer): OleVariant;
Var
  sSQL: String;
Begin
  sSQL := 'SELECT ' +
    '  CODTIPDOC,DESCRICAO ' +
    'FROM TIPODOCRECPAG A ' +
    'WHERE ' +
    ' A.RECPAG =  ' + QuotedStr(RECPAG) +
    ' AND NOT EXISTS (SELECT 1 FROM USUARIOxTPDOCTO B ' +
    '                 WHERE B.IDUSUARIO = ' + IntToStr(idusuario) +
    '                       AND RECPAG = ' + QuotedStr(RECPAG) + ') ' +
    'UNION ' +
    'SELECT ' +
    '  CODTIPDOC,DESCRICAO ' +
    'FROM TIPODOCRECPAG A ' +
    'WHERE ' +
    '  A.RECPAG =  ' + QuotedStr(RECPAG) +
    '  AND EXISTS (SELECT 1 FROM USUARIOxTPDOCTO B ' +
    '              WHERE A.CODTIPDOC = B.CODTIPDOC ' +
    '              AND B.IDUSUARIO = ' + IntToStr(idusuario) +
    '              AND RECPAG = ' + QuotedStr(RECPAG) + ') ' +
    'ORDER BY DESCRICAO ';
  Result := GetDataPacket(sSQL);
End;

Procedure TCtrlTipodocrecpag.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

