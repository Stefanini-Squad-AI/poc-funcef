{-------------------------------------------------------------------------------
Data      : 09/03/2018
Autor     : Everson Luiz Pereira da Cunha
SIG       : SIG TIBERO
Descrição : Melhoria para adaptação ao TIBERO.
            Inclusão de alias nas tabelas e campos.
            Retirar INDEX, +rule etc
--------------------------------------------------------------------------------}

Unit uCtrlClasfisxtipoagre;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbClasfisxtipoagre, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uCtrlPadroes;

Type

  TCtrlClasfisxtipoagre = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbClasfisxtipoagre: TDbClasfisxtipoagre;
    Fcds: TClientDataSet;
    _Padroes: TCtrlPadroes;
    Procedure Setcds(Const Value: TClientDataSet);

  public
    Property cds: TClientDataSet read Fcds write Setcds;
    Constructor Create; override;
    Destructor Destroy; override;
    Function ListClasfisxtipoagre(RECPAG: String = ''; IDCLASFISCLIFOR: double = 0): OleVariant;
    Function ListImpostosAgregados(RECPAG: String;
      IDCLASFISCLIFOR: double; CODTRATFISCD, CODTRATFISCD1: String): OleVariant;
    Procedure ProcuraClasfisxtipoagre(Idclasfisxagre: double);
    Function GravarClasfisxtipoagre(IdPessoa, IdModulo, IdUsuario : Integer): Boolean;
  End;

Implementation

{ TCtrlClasfisxtipoagre }

Constructor TCtrlClasfisxtipoagre.Create;
Begin
  Inherited;
  _DbClasfisxtipoagre := TDbClasfisxtipoagre.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlClasfisxtipoagre.Destroy;
Begin
  _DbClasfisxtipoagre.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlClasfisxtipoagre.DoChangeDataBase;
Begin
  Inherited;
  _DbClasfisxtipoagre.DataBaseName := DataBaseName;
End;

Function TCtrlClasfisxtipoagre.ListClasfisxtipoagre(RECPAG: String = ''; IDCLASFISCLIFOR: double = 0): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT                 ' +
    '     C.IDCLASFISXAGRE, ' +
    '     C.IDCLASFISCLIFOR,' +
    '     C.CODTIPOCUSTAGREG,' +
    '     C.RECPAG,          ' +
    '     T.DESCCUSTAGREG    ' +
    '    FROM                ' +
    '     CLASFISXTIPOAGRE C,' +
    '     TIPOAGRE T         ' +
    '    WHERE               ';
  If trim(RECPAG) <> '' Then
    ssql := ssql + '  C.RECPAG = ' + quotedstr(RECPAG) + ' AND ';
  If IDCLASFISCLIFOR <> 0 Then
    ssql := ssql + '  C.IDCLASFISCLIFOR = ' + floattostr(IDCLASFISCLIFOR) + ' AND ';
  ssql := ssql + '     (C.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG) ' +
    '    ORDER BY                                  ' +
    '      T.DESCCUSTAGREG                         ';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlClasfisxtipoagre.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Procedure TCtrlClasfisxtipoagre.ProcuraClasfisxtipoagre(Idclasfisxagre: double);
Begin
  _dbClasfisxtipoagre.Idclasfisxagre.Asfloat := Idclasfisxagre;
End;

Function TCtrlClasfisxtipoagre.ListImpostosAgregados(RECPAG: String;
  IDCLASFISCLIFOR: double; CODTRATFISCD, CODTRATFISCD1: String): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT      ' +
    '    TIPOAGRE.DESCCUSTAGREG,    ' +
    '    TIPOAGRE.CODTIPOCUSTAGREG, ' +
    '     '' '' IDCLASFISCLIFOR,    ' +
    '     TIPOAGRE.RECPAG           ' +
    '    FROM                       ' +
    '       TIPOAGRE,               ' +
    '       TIPOALTERADOR           ' +
    '    WHERE                      ' +
//    '       ( FLGASSOCIACLASFIS = ''S'' ) AND  ' +        //Everson TIBERO
    '       ( TIPOAGRE.FLGASSOCIACLASFIS = ''S'' ) AND  ' + //Everson TIBERO
    '       ( TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+) ) AND  ' +
    '       ( TIPOAGRE.CODTRATFISCD IN (''8'',''9'',''A'',''B'') ) AND     ' +
    '       ( TIPOAGRE.CODTIPOCUSTAGREG NOT IN                            ' +
    '          ( SELECT C.CODTIPOCUSTAGREG FROM CLASFISXTIPOAGRE C        ' +
    '              WHERE (C.RECPAG = ' + quotedstr(RECPAG) + ') AND   ' +
    '                    (C.IDCLASFISCLIFOR = ' + floattostr(IDCLASFISCLIFOR) + ' )))         ' +
    '       AND (((TIPOAGRE.CODTRATFISCD = ''' + CODTRATFISCD + ''') AND (TIPOALTERADOR.ACRESDECRES = ''C'')) OR ' +
    '            ((TIPOAGRE.CODTRATFISCD = ''' + CODTRATFISCD1 + ''') AND (TIPOALTERADOR.ACRESDECRES = ''D'')) OR ' +
    '             (TIPOALTERADOR.ACRESDECRES IS NULL)) ORDER BY TIPOAGRE.DESCCUSTAGREG ';
  Result := GetDataPacket(ssql);
End;

Function TCtrlClasfisxtipoagre.GravarClasfisxtipoagre(IdPessoa, IdModulo, IdUsuario : Integer): Boolean;
Var
  Msg: String;
  sDscLog: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarClasfisxtipoagre(cds.Data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(Cds, _DbClasfisxtipoagre, [], []);
      Msg := _DbClasfisxtipoagre.MessageInfo;

      If Not Result Then
        Raise Exception.create(Msg);
      sDscLog := '';
      If Cds.IsEmpty Then
        sDscLog := 'Exclusao de Classificacao Fiscal X Impostos Agregados'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Classificacao Fiscal X Impostos Agregados'
      Else
        sDscLog := 'Alteracao de Classificacao Fiscal X Impostos Agregados';
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

Procedure TCtrlClasfisxtipoagre.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;

Procedure TCtrlClasfisxtipoagre.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

