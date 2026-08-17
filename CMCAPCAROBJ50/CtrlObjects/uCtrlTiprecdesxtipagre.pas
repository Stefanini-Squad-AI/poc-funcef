//Marcus Oliveira P. 24035 15/01/2007
Unit uCtrlTiprecdesxtipagre;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTiprecdesxtipagre, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uCtrlPadroes;

Type
  TCtrlTiprecdesxtipagre = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbTiprecdesxtipagre: TDbTiprecdesxtipagre;
    Fcds: TClientDataSet;
    _Padroes : TCtrlPadroes;
    Procedure Setcds(Const Value: TClientDataSet);
  public
    Property cds: TClientDataSet read Fcds write Setcds;
    Constructor Create; override;
    Destructor Destroy; override;
    Function ListTipImpAgrAsso(tp: integer; RECPAG: String = ''; IDTIPRECDESXAGRE: integer = 0;
      IDPESSOA: integer = 0; CODTIPRECDES: String = ''; IDPROGRAMA: String = ''; CODCENTROCUSTO: String = ''): OleVariant;
    Function ListTipImpAgrNaoAsso(tp: integer; RECPAG: String = ''; IDPESSOA: integer = 0;
      CODTIPRECDES: String = ''; IDPROGRAMA: String = ''; CODCENTROCUSTO: String = ''): OleVariant;
    Procedure ProcuraTiprecdesxtipagre(Idtiprecdesxagre: double);
    Function GravarTiprecdesxtipagre(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;

  End;

Implementation

{ TCtrlTiprecdesxtipagre }

Function TCtrlTiprecdesxtipagre.GravarTiprecdesxtipagre(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
Var
  Msg: String;
  sDscLog: String;
  _cdsAux: TClientDataSet;

Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarTiprecdesxtipagre(cds.Data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin

    Try
      StartTransaction;

      Result := ApplyCds(Cds, _DbTiprecdesxtipagre, [], []);
      Msg := _DbTiprecdesxtipagre.MessageInfo;

      If Not Result Then
        Raise Exception.create(Msg);
      If Not Result Then
        Raise Exception.create(Msg);
      sDscLog := '';
      If Cds.IsEmpty Then
        sDscLog := 'Exclusao de Tipo Rec/Des X Impostos Agregados'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Tipo Rec/Des X Impostos Agregados'
      Else
        sDscLog := 'Alteracao de Tipo Rec/Des X Impostos Agregados';
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

Constructor TCtrlTiprecdesxtipagre.Create;
Begin
  Inherited;
  _DbTiprecdesxtipagre := TDbTiprecdesxtipagre.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlTiprecdesxtipagre.Destroy;
Begin
  _DbTiprecdesxtipagre.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlTiprecdesxtipagre.DoChangeDataBase;
Begin
  Inherited;
  _DbTiprecdesxtipagre.DataBaseName := DataBaseName;
End;

Function TCtrlTiprecdesxtipagre.ListTipImpAgrAsso(tp: integer; RECPAG: String; IDTIPRECDESXAGRE: integer;
  IDPESSOA: integer; CODTIPRECDES, IDPROGRAMA, CODCENTROCUSTO: String): OleVariant;
Var
  ssql, _SQLIMPOSTO, _TEXTOORDERBY: String;
Begin
  _SQLIMPOSTO := ' SELECT ' +
    ' T.IDTIPRECDESXAGRE, ' +
    ' T.CODTIPRECDES, ' +
    ' C.CODIMPOSTO, ' +
    ' T.RECPAG, ' +
    ' T.IDPESSOA, ' +
    ' T.CODTIPOCUSTAGREG, ' +
    ' T.CODCENTROCUSTO, ' +
    ' T.IDEMPRESA, ' +
    ' T.IDPROGRAMA, ' +
    ' C.DESCCUSTAGREG, ' +
    ' P.DESCPROGRAMA, ' +
    ' CC.NOME, ' +
    ' CC.CODEXTERNO ' + // andre tavares 01/07/2004
    ' FROM ' +
    '   TIPRECDESXTIPAGRE T, ' +
    '   TIPOAGRE C, ' +
    '   PROGRAMA P, ' +
    '   CENTCUST CC ' +
    ' WHERE ' +
    '  (C.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG) ' +
    '  AND (T.IDPROGRAMA = P.IDPROGRAMA(+)) ' +
    '  AND (T.CODCENTROCUSTO = CC.CODCENTROCUSTO (+)) ';


  _TEXTOORDERBY := ' ORDER BY C.DESCCUSTAGREG ';

  ssql := _SQLIMPOSTO;
  If trim(CODTIPRECDES) <> '' Then
    ssql := ssql + ' AND   (RTRIM(T.CODTIPRECDES) = ' + quotedstr(CODTIPRECDES) + ') ';
  If trim(RECPAG) <> '' Then
    ssql := ssql + ' AND (T.RECPAG = ' + quotedstr(RECPAG) + ') ';
  If IDPESSOA <> 0 Then
    ssql := ssql + ' AND  (T.IDPESSOA  = ' + floattostr(IDPESSOA) + ') ';

  If tp = 1 Then
  Begin
    If trim(IDPROGRAMA) <> '' Then
      ssql := ssql + ' AND   (T.IDPROGRAMA = ' + IDPROGRAMA + ') '
    Else
      ssql := ssql + ' AND   (T.IDPROGRAMA is null) ';
    If trim(CODCENTROCUSTO) <> '' Then
      ssql := ssql + ' AND RTRIM(T.CODCENTROCUSTO) = ' + QuotedStr(Trim(CODCENTROCUSTO)) 
    Else
      ssql := ssql + ' AND T.CODCENTROCUSTO is null';
  End;

  If tp = 2 Then
  Begin
    If trim(IDPROGRAMA) <> '' Then
      ssql := ssql + ' AND   (T.IDPROGRAMA = ' + IDPROGRAMA + ') ';
    {Alex 16/04/04 Else
      ssql := ssql + ' AND   (T.IDPROGRAMA is null) ';}
    If trim(CODCENTROCUSTO) <> '' Then
      ssql := ssql + ' AND RTRIM(T.CODCENTROCUSTO) = ' + QuotedStr(Trim(CODCENTROCUSTO)) ;
    {Alex 16/04/04 Else
      ssql := ssql + ' AND T.CODCENTROCUSTO is null';}
  End;

  ssql := ssql + _TEXTOORDERBY;

  Result := GetDataPacket(ssql);
End;

Procedure TCtrlTiprecdesxtipagre.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Procedure TCtrlTiprecdesxtipagre.ProcuraTiprecdesxtipagre(Idtiprecdesxagre: double);
Begin
  _dbTiprecdesxtipagre.Idtiprecdesxagre.Asfloat := Idtiprecdesxagre;
End;

Function TCtrlTiprecdesxtipagre.ListTipImpAgrNaoAsso(tp: integer; RECPAG: String;
  IDPESSOA: integer; CODTIPRECDES, IDPROGRAMA, CODCENTROCUSTO: String): OleVariant;
Var
  ssql: String;
Begin
  If tp = 1 Then
  Begin
    ssql :=
      ' SELECT DISTINCT ' +
      '   TIPOAGRE.DESCCUSTAGREG, ' +
      '   TIPOAGRE.CODTIPOCUSTAGREG, ' +
      '   TIPOAGRE.CODIMPOSTO' +
      ' FROM ' +
      '    TIPOAGRE, ' +
      '    TIPOALTERADOR ' +
      ' WHERE ' +
      '    ( ''' + CODTIPRECDES + ''' <> ''0'' ) AND ' +
      '    ( TIPOAGRE.IDPESSOA = ' + inttostr(IDPESSOA) + ') AND ' +
      '    ( TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+) ) AND ' +
      '    ( TIPOAGRE.CODTRATFISCD IN (''8'',''9'',''A'',''B'') ) AND ' +
      '    ( TIPOAGRE.CODTIPOCUSTAGREG NOT IN ' +
      '      ( SELECT ' +
      '           CODTIPOCUSTAGREG ' +
      '        FROM ' +
      '           TIPRECDESXTIPAGRE ' +
      '        WHERE ' +
      '           (RECPAG = ''' + RECPAG + ''') AND ' +
      '           (RTRIM(CODTIPRECDES) = ''' + CODTIPRECDES + ''') AND ' +
      '           (IDPESSOA = ' + inttostr(IDPESSOA) + ')';
    If trim(IDPROGRAMA) = '' Then
      ssql := ssql + ' AND (IDPROGRAMA IS NULL) '
    Else
      ssql := ssql + ' AND (RTRIM(IDPROGRAMA) =  ''' + IDPROGRAMA + ''') ';
    If trim(CODCENTROCUSTO) = '' Then
      ssql := ssql + ' AND (CODCENTROCUSTO IS NULL) '
    Else
      ssql := ssql + ' AND (RTRIM(CODCENTROCUSTO) =  ''' + Trim(CODCENTROCUSTO) + ''') ';
    ssql := ssql + ')) ';
  End
  Else
  Begin
    ssql := ' SELECT DISTINCT ' +
      '   TIPOAGRE.DESCCUSTAGREG, ' +
      '    TIPOAGRE.CODTIPOCUSTAGREG ' +
      ' FROM ' +
      '    TIPOAGRE, ' +
      '    TIPOALTERADOR ' +
      ' WHERE ' +
      '    ( ''' + CODTIPRECDES + ''' <> ''0'' ) AND ' +
      '    ( TIPOAGRE.IDPESSOA = ' + inttostr(IDPESSOA) + ') AND ' +
      '    ( TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+) ) AND ' +
      '    ( TIPOAGRE.CODTRATFISCD IN (''8'',''9'',''A'',''B'') ) AND ' +
      '    ( TIPOAGRE.CODTIPOCUSTAGREG NOT IN ' +
      '      ( SELECT ' +
      '           CODTIPOCUSTAGREG ' +
      '        FROM ' +
      '           TIPRECDESXTIPAGRE ' +
      '        WHERE ' +
      '           (RECPAG = ''' + RECPAG + ''') AND ' +
      '           (RTRIM(CODTIPRECDES) = ''' + CODTIPRECDES + ''') AND ' +
      '           (IDPESSOA = ' + inttostr(IDPESSOA) + '))) ';
  End;
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlTiprecdesxtipagre.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;

Procedure TCtrlTiprecdesxtipagre.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

