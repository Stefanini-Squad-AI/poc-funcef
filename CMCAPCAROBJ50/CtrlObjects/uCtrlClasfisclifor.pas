Unit uCtrlClasfisclifor;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, DbClient, uCMTypes,
  uDbClasfisclifor, uDbTipofatxclasfis, uCtrlPadroes;

Type

  TCtrlClasfisclifor = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure AfterInitialize; override;
  private
    _DbClasfisclifor: TDbClasfisclifor;
    _DbTipofatxclasfis: TDbTipofatxclasfis;
    _CdsClasFis, _CdsClasFisXTipoFat: TClientDataSet;
    _Padroes: TCtrlPadroes;

  public
    Constructor Create; override;
    Destructor Destroy; override;

    Function ListTipofatxclasfis(IDTIPOFATURA: double = 0; IDCLASFISCLIFOR: double = 0): OleVariant;
    Function ListTIPOFATURAxTIPOFATXCLASFIS(IDCLASFISCLIFOR: double): Olevariant;
    Function ListClasfisclifor(IDCLASFISCLIFOR: double): OleVariant;
    Function GravarClasfisclifor(ovClasFis, ovClasFisXTipoFat: OleVariant; Operacao: TOperacao; IdPessoa, IdModulo, IdUsuario: Integer):
      Boolean;
  End;

Implementation

{ TCtrlClasfisclifor }

Constructor TCtrlClasfisclifor.Create;
Begin
  Inherited;
  _CdsClasFis := TClientDataSet.Create(Nil);
  _CdsClasFisXTipoFat := TClientDataSet.Create(Nil);
  _Padroes := TCtrlPadroes.Create;

  _DbClasfisclifor := TDbClasfisclifor.Create(self);
  _DbTipofatxclasfis := TDbTipofatxclasfis.Create(self);
End;

Destructor TCtrlClasfisclifor.Destroy;
Begin
  _CdsClasFis.Free;
  _CdsClasFisXTipoFat.Free;
  _Padroes.Free;

  _DbClasfisclifor.Free;
  _DbTipofatxclasfis.Free;

  Inherited;
End;

Function TCtrlClasfisclifor.ListClasfisclifor(IDCLASFISCLIFOR: double): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT                     ' +
    '  IDCLASFISCLIFOR ,        ' +
    '  DESCCLASFISCLIFOR ,      ' +
    '  CODREDUZIDO   ,          ' +
    '  FLGTIPOFATURA            ' +
    'FROM                       ' +
    '       Clasfisclifor C     ';
  If IDCLASFISCLIFOR <> 0 Then
    ssql := ssql + ' where IDCLASFISCLIFOR = ' + floattostr(IDCLASFISCLIFOR);
  ssql := ssql + ' ORDER BY DESCCLASFISCLIFOR ';
  Result := GetDataPacket(ssql);
End;

Function TCtrlClasfisclifor.GravarClasfisclifor(ovClasFis, ovClasFisXTipoFat:
  OleVariant; Operacao: TOperacao; IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
Var
  sDscLog: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarClasfisclifor(ovClasFis, ovClasFisXTipoFat, Integer(Operacao), IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;

      _CdsClasFis.Data := ovClasFis;
      _CdsClasFisXTipoFat.Data := ovClasFisXTipoFat;
      sDscLog := 'Classificacao fiscal';
      Case Operacao Of
        opInserir, opAlterar:
          Begin
            Result := ApplyCds(_CdsClasFis, _DbClasfisclifor, [], []);
            If Not Result Then
              Raise Exception.create(_DbClasfisclifor.MessageInfo);

            Result := ApplyCds(_CdsClasFisXTipoFat, _DbTipofatxclasfis, [_DbClasfisclifor.Idclasfisclifor],
              [_DbTipofatxclasfis.Idclasfisclifor], True);
            If Not Result Then
              Raise Exception.create(_DbTipofatxclasfis.MessageInfo);
          End;
        opApagar:
          Begin
            sDscLog := 'Exclusao de Classificacao fiscal';
            _CdsClasFis.First;
            While Not _CdsClasFis.Eof Do
              _CdsClasFis.Delete;

            _CdsClasFisXTipoFat.First;
            While Not _CdsClasFisXTipoFat.Eof Do
              _CdsClasFisXTipoFat.Delete;

            Result := ApplyCds(_CdsClasFisXTipoFat, _DbTipofatxclasfis, [_DbTipofatxclasfis.Idclasfisclifor],
              [_DbClasfisclifor.Idclasfisclifor]);
            If Not Result Then
              Raise Exception.create(_DbTipofatxclasfis.MessageInfo);

            Result := ApplyCds(_CdsClasFis, _DbClasfisclifor, [], []);
            If Not Result Then
              Raise Exception.create(_DbClasfisclifor.MessageInfo);

          End;
      End;
      If Not _Padroes.GravaLogOperacoes(IdPessoa, IdModulo, IdUsuario, sDscLog, False) Then
        Raise Exception.Create(_Padroes.MessageInfo);

      Commit;
      Result := True;
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

Function TCtrlClasfisclifor.ListTIPOFATURAxTIPOFATXCLASFIS(
  IDCLASFISCLIFOR: double): Olevariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT ' +
    '  T.FLGTIPOFATURA, T.DESCTIPOFATURA, T.IDTIPOFATURA, TX.IDCLASFISCLIFOR ' +
    'FROM ' +
    '  TIPOFATURA T, TIPOFATXCLASFIS TX ' +
    'WHERE ' +
    '  TX.IDTIPOFATURA(+)    = T.IDTIPOFATURA    AND' +
    '  TX.IDCLASFISCLIFOR(+) = ' + floattostr(IDCLASFISCLIFOR) +
    '  ORDER BY ' +
    '  T.FLGTIPOFATURA, T.DESCTIPOFATURA';
  Result := GetDataPacket(ssql);
End;

Function TCtrlClasfisclifor.ListTipofatxclasfis(IDTIPOFATURA,
  IDCLASFISCLIFOR: double): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT                     ' +
    '  IDCLASFISCLIFOR,    ' +
    '  IDTIPOFATURA       ' +
    'FROM                  ' +
    '      Tipofatxclasfis where (1=1)';
  If IDTIPOFATURA <> 0 Then
    ssql := ssql + ' and IDTIPOFATURA = ' + floattostr(IDTIPOFATURA);
  If IDCLASFISCLIFOR <> 0 Then
    ssql := ssql + ' and IDCLASFISCLIFOR = ' + floattostr(IDCLASFISCLIFOR);
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlClasfisclifor.DoChangeDataBase;
Begin
  Inherited;
  _DbClasfisclifor.DataBaseName := DataBaseName;
  _DbTipofatxclasfis.DataBaseName := DataBaseName;
End;

Procedure TCtrlClasfisclifor.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

