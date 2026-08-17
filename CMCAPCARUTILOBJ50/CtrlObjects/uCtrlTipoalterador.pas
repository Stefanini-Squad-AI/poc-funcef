Unit uCtrlTipoalterador;
{-----------------------------------------------------------------------------------------
Analista.: Antonio Marcos Fernandes de Souza (amf)
Data.....: 27.01.2006
Pendência: 18886 - Criar campo observação para ser utilizado na tela de lançamento.
Descrição: Alteração na SQL da function ListTipoAlterador: inclusão no select do campo
           Observação.
------------------------------------------------------------------------------------------
}


Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTipoalterador, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uCtrlPadroes;

Type

  TCtrlTipoalterador = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbTipoalterador: TDbTipoalterador;
    Fcds: TClientDataSet;
    _Padroes: TCtrlPadroes;
    Procedure Setcds(Const Value: TClientDataSet);

  public
    Property cds: TClientDataSet read Fcds write Setcds;
    Constructor Create; override;
    Destructor Destroy; override;
    Function ListTipoalterador(idpessoa: double = 0; RECPAG: String = ''; codalterador: double = 0; AcresDecres: String = ''): OleVariant;
    Function ListTipoAlteradorImpXAgreg(idpessoa: double = 0; RECPAG: String = ''; PACRESDECRES: String = ''): OleVariant;
    Function GravarTipoalterador(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
  End;

Implementation

{ TCtrlTipoalterador }

Constructor TCtrlTipoalterador.Create;
Begin
  Inherited;
  _DbTipoalterador := TDbTipoalterador.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlTipoalterador.Destroy;
Begin
  _DbTipoalterador.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlTipoalterador.DoChangeDataBase;
Begin
  Inherited;
  _DbTipoalterador.DataBaseName := DataBaseName;
End;

Function TCtrlTipoalterador.ListTipoalterador(idpessoa: double = 0;
  RECPAG: String = '';
  codalterador: double = 0;
  AcresDecres: String = ''): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT                   ' +
    '  CODALTERADOR,          ' +
    '  IDPESSOA ,             ' +
    '  CODSUBCONTA,           ' +
    '  IDEMPRESA ,            ' +
    '  PLANO   ,              ' +
    '  CODCENTROCUSTO ,       ' +
    '  PLACONTA    ,          ' +
    '  RECPAG    ,            ' +
    '  DESCRICAO  ,           ' +
    '  ACRESDECRES ,          ' +
    '  CONVERTE  ,            ' +
    '  IDUSUARIOINCLUSAO  ,   ' +
    '  FLGCALCULAIMPOSTO ,    ' +
    '  FLGAGREGABAIXA  ,      ' +
    '  FLGAGREGASALDO ,       ' +
    '  CODNATUREZA,           ' +
    '  CODCORRESP,            ' +
    '  FLGCONTABNABAIXA,      ' +
    '  FLGUSACCUSTODOC,       ' +
    '  FLGINCIDEIRRF,         ' + //Bruno Bastos - Pend. 14392 - 11/08/2003
    '  CODTIPRECDES           ' + //Bruno Bastos - Pend. 19025 - 11/05/2005
    '  ,OBSERVACAO            ' + //amf p:18886 - 27.01.2006: Inclusão de campo na tabela
    'FROM                     ' +
    '       Tipoalterador T  where (1=1) ';
  If idpessoa <> 0 Then
    ssql := ssql + ' and iDPESSOA = ' + floattostr(IDPESSOA);
  If trim(RECPAG) <> '' Then
    ssql := ssql + ' and RECPAG = ' + quotedstr(RECPAG);
  If codalterador <> 0 Then
    ssql := ssql + ' and codalterador = ' + floattostr(codalterador);
  If AcresDecres <> '' Then
    ssql := ssql + ' and AcresDecres = ' + quotedstr(AcresDecres);
  ssql := ssql + ' ORDER BY DESCRICAO  ';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlTipoalterador.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Function TCtrlTipoalterador.GravarTipoalterador(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
Var
  Msg: String;
  sDscLog: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarTipoalterador(cds.Data, IdPessoa, IdModulo, IdUsuario);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(Cds, _DbTipoalterador, [], []);
      Msg := _DbTipoalterador.MessageInfo;
      sDscLog := '';
      If Cds.IsEmpty Then
        sDscLog := 'Exclusao de Tipo de Alterador'
      Else If Cds.UpdateStatus = usInserted Then
        sDscLog := 'Inclusao de Tipo de Alterador'
      Else
        sDscLog := 'Alteracao de Tipo de Alterador';

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

Function TCtrlTipoalterador.ListTipoAlteradorImpXAgreg(idpessoa: double = 0;
  RECPAG: String = '';
  PACRESDECRES: String = ''): OleVariant;
Var
  ssql: String;
Begin
  ssql := 'SELECT CODALTERADOR,DESCRICAO,ACRESDECRES ' +
    '  FROM TIPOALTERADOR                      ' +
    ' WHERE (RECPAG = ''' + RECPAG + ''') AND ' +
    '   (IDPESSOA = ' + Floattostr(IDPESSOA) + ') AND            ' +
    '   (ACRESDECRES = ''' + PACRESDECRES + ''') AND      ' +
    ' ((FLGCALCULAIMPOSTO = ''N'') OR (FLGCALCULAIMPOSTO IS NULL))';
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlTipoalterador.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;

Procedure TCtrlTipoalterador.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

End.

