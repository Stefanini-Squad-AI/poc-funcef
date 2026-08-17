Unit uCtrlCodigoscnab;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbCodigoscnab, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uCtrlPadroes, uDbCodliqbaixacnab;

Type

  TCtrlCodigoscnab = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbCodigoscnab: TDbCodigoscnab;
    _DbCodliqbaixacnab: TDbCodliqbaixacnab; //andré tavares - pendência 21102 - 23/04/2006

    _Padroes: TCtrlPadroes;
    Fcds: TClientDataSet;
    FCdsCodLiqBaixa: TClientDataSet;
    Procedure Setcds(Const Value: TClientDataSet);
    procedure SetCdsCodLiqBaixa(const Value: TClientDataSet);

  public
    Property cds: TClientDataSet read Fcds write Setcds;
    Property CdsCodLiqBaixa: TClientDataSet read FCdsCodLiqBaixa write SetCdsCodLiqBaixa; //andré tavares - pendência 21102 - 23/04/2006
    Constructor Create; override;
    Destructor Destroy; override;
    Function ListCodigoscnab(idCodigoscnab: double = 0; IdModeloscnab: double = 0; RecPag: String = ''): OleVariant;
    Function ListCodLiqBaixa(IdModeloscnab: double; RecPag: String; CodCnab: string = ''; CodigoLiq: string = ''): Olevariant;//andré tavares - pendência 21102 - 23/04/2006
    Function GravarCodigoscnab(IdPessoa, IdModulo, IdUsuario: Integer): Boolean;
  End;

Implementation

{ TCtrlCodigoscnab }

Constructor TCtrlCodigoscnab.Create;
Begin
  Inherited;
  _DbCodigoscnab := TDbCodigoscnab.Create(self);

  _DbCodliqbaixacnab := TDbCodliqbaixacnab.Create(self); //andré tavares - pendência 21102 - 23/04/2006
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlCodigoscnab.Destroy;
Begin
  _DbCodigoscnab.Free;
  _DbCodliqbaixacnab.Free; //andré tavares - pendência 21102 - 23/04/2006
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlCodigoscnab.DoChangeDataBase;
Begin
  Inherited;
  _DbCodigoscnab.DataBaseName := DataBaseName;

  _DbCodliqbaixacnab.DataBaseName := DataBaseName; //andré tavares - pendência 21102 - 23/04/2006
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
    // Rodolpho da SIlva - P: 20932 - 21/12/2005
    '  FLGCONTABALTERADOR, ' +

    '  CODALTERADOR           ' +
    'FROM                     ' +
    '       CODIGOSCNAB C  WHERE (1=1)   ';
  If idCodigoscnab <> 0 Then
    ssql := ssql + ' AND IDCODIGOSCNAB = ' + floattostr(idCodigoscnab);
  If IDMODELOSCNAB <> 0 Then
    ssql := ssql + ' AND IDMODELOSCNAB = ' + floattostr(IDMODELOSCNAB);
  If trim(RECPAG) <> '' Then
    ssql := ssql + ' AND REGPAG = ' + quotedstr(RECPAG);
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

      Result := ApplyCds(FCds, _DbCodigoscnab, [], []);
      Msg := _DbCodigoscnab.MessageInfo;

      //início - andré tavares - pendência 21102 - 23/04/2006
      Result := ApplyCds(FCdsCodLiqBaixa, _DbCodliqbaixacnab, [_DbCodigoscnab.idmodeloscnab, _DbCodigoscnab.idcodigoscnab, _DbCodigoscnab.recpag],
                                                              [_DbCodliqbaixacnab.idmodeloscnab, _DbCodliqbaixacnab.idcodigoscnab, _DbCodliqbaixacnab.recpag]);
      Msg := _DbCodliqbaixacnab.MessageInfo;
      //fim - andré tavares - pendência 21102 - 23/04/2006

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

procedure TCtrlCodigoscnab.SetCdsCodLiqBaixa(const Value: TClientDataSet);
begin
  FCdsCodLiqBaixa := Value;
end;

//início - andré tavares - pendência 21102 - 23/04/2006
function TCtrlCodigoscnab.ListCodLiqBaixa(IdModeloscnab: double; RecPag: String;  CodCnab: string; CodigoLiq: string): Olevariant;
var sSql, sFiltro: string;
begin
  sFiltro := ' AND 1 = 1 ';
  if trunc(IdModeloscnab) <> 0 then
    sFiltro := SFiltro + ' AND MC.IDMODELOSCNAB = '+ floatToStr(IdModeloscnab);
  if trim(RecPag) <> '' then
    sFiltro := SFiltro + ' AND MC.RECPAG = '+ quotedStr(RecPag);
  if trim(CodigoLiq) <> '' then
    sFiltro := SFiltro + ' AND CL.CODIGOLIQ = '+ quotedStr(CodigoLiq);
  if trim(CodCnab) <> '' then
    sFiltro := SFiltro + ' AND CC.CODIGO = '+ quotedStr(CodigoLiq);

  sSql := ' SELECT CL.*, PF.DESCRICAO AS DESPORTFORMA FROM '+
          ' CODLIQBAIXACNAB CL, MODELOSCNAB MC, CODIGOSCNAB CC, PORTADORFORMA PF '+
          ' WHERE MC.IDMODELOSCNAB = CL.IDMODELOSCNAB AND '+
          '       CC.IDMODELOSCNAB = MC.IDMODELOSCNAB AND '+
          '       CC.IDCODIGOSCNAB = CL.IDCODIGOSCNAB AND '+
          '       MC.RECPAG = CC.RECPAG AND '+
          '       PF.CODPORTFORMA(+) = CL.CODPORTFORMA AND '+
          '       CC.RECPAG = CL.RECPAG '+ sFiltro +
          ' ORDER BY CL.CODIGOLIQ ';

  result := GetDataPacket(sSql);
end;
//fim - andré tavares - pendência 21102 - 23/04/2006

End.

