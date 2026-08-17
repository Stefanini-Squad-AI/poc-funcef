Unit uCtrlEmissBordero;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uCtrlDocumento, uCtrlFinanc, uRad, uCtrlParamCap;

Type
  TCtrlEmissBordero = Class(TCmControlObject)
  protected
    Procedure AfterInitialize; override;
  private
    _Documento: TCtrlDocumento;
    _ParamCap: TCtrlParamCap;
    _Financ: TCtrlFinanc;

    _Rad: TRad;
  public
    Constructor Create(idpessoa, idmodulo, idusuario: double; buscapanoPatro: boolean); reintroduce;
    Destructor Destroy; override;
    Function EmissaoBDebito(RecPAg, sLoteBordero, sDataBordero, sCodPortForma: String; IdPessoa: double; IdModulo, IdUsuario,
      IdPlano: Integer; bIntegraContabil: boolean): Boolean;
    Function EmissaoBPagto(RecPAg, sLoteBordero, sDataBordero, sCodPortForma: String; IdPessoa: double; IdModulo, IdUsuario,
      IdPlano: Integer; bIntegraContabil: boolean): Boolean;

    Function VerificaImpresaoBordero(numLote: integer): boolean;
    Function ProcessoRadLiberado(NumLote: LongInt; idempresa: double): Boolean;
    Function LugarDaBaixa(RecPAg: String; IdPessoa: double): String;
  End;

Implementation

{ TCtrlEmissBordero }

Procedure TCtrlEmissBordero.AfterInitialize;
Begin
  Inherited;
  _Documento.InitializeAs(Self);
  _ParamCap.InitializeAs(self);
  _Documento.OpenTransaction := false;
  _Financ.InitializeAs(Self);
  _Financ.OpenTransaction := false;
  //  _Rad.InitializeAs(Self);
End;

Function TCtrlEmissBordero.EmissaoBDebito(RecPAg, sLoteBordero, sDataBordero, sCodPortForma: String; IdPessoa: double; IdModulo,
  IdUsuario, IdPlano: Integer; bIntegraContabil: boolean): Boolean;
Var
  sSql, sData, sLugarBaixa: String;
  _CdsLocal: TClientDataSet;
  iCodLancFinanc: Double;
  bAtualizaLote: boolean;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.EmissaoBDebito(RecPAg, sLoteBordero, sDataBordero, sCodPortForma, IdPessoa, IdModulo,
      IdUsuario, IdPlano, bIntegraContabil);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    bAtualizaLote := True;
    sLugarBaixa := LugarDaBaixa(RecPAg, IdPessoa);
    Result := True;
    If RecPag = 'P' Then
      sSql := ' SELECT  (''D'') as DEBCRE, '
    Else
      sSql := ' SELECT  (''C'') as DEBCRE, ';
    sSql := sSql + ' DOC.DATAPROGRAMADA, ' +
      ' LOTE.CODPORTFORMA , ' +
      ' DOC.IDPESSOA,  PESS.NOME, ' +
      ' DOC.DATAVENCTO, ' +
      ' DOC.NoDOCUMENTO, ' +
      ' DOC.COMPLDOCUMENTO, ' +
      ' DOC.CODDOCUMENTO, ' +
      ' DOC.OPERACAO, LOTE.NUMLOTE, ' +
      ' DOC.PLANO , DOC.PLACONTA,  DOC.CODCENTROCUSTO, ' +
      ' LOTE.CODLANCFINANC, ' +
      ' LOTEX.VALOR, LOTE.NUMCHQBORDERO, ' +
      ' LOTEX.FLGBAIXA, PF.DMAIS ' +
      ' FROM  ' +
      ' PESSOA PESS, DOCUMENTO DOC, LOTEXDOCUM LOTEX , LOTEPAGTO LOTE, PORTADORFORMA PF' +
      ' WHERE (LOTEX.NUMLOTE = ' + sLoteBordero + ') AND ' +
      '       (DOC.IDPESSOA = ' + FloatToStr(IdPessoa) + ') AND ' +
      '       (DOC.RECPAG = ''' + RecPag + ''') AND ' +
      '       (LOTEX.FLGBAIXA = '' ''  OR LOTEX.FLGBAIXA IS NULL) AND ' +
      '       (LOTE.NUMLOTE = LOTEX.NUMLOTE) AND ' +
      '       (DOC.IDFORCLI = PESS.IDPESSOA) AND ' +
      '       (LOTE.CODPORTFORMA = PF.CODPORTFORMA) AND ' +
      '       (LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO) ';

    _CdsLocal := TClientDataSet.create(Nil);
    _CdsLocal.data := GetDataPacket(sSql);
    Try
      StartTransaction;
      If _CdsLocal.FieldByname('OPERACAO').AsString <> '10' Then
      Begin
        sData := DateToStr(_Documento.AjustaDataFloat(StrToDate(sDataBordero), _CdsLocal.FieldByname('DMAIS').AsInteger, slCap));
        _Financ.FazerRateioCAPCAR(_CdsLocal.Data, sLugarBaixa, sLoteBordero, RecPag, StrToDate(sData), StrToFloat(sLoteBordero),
          StrToInt(sCodPortForma), iCodLancFinanc, IdPessoa, IdModulo, IdUsuario, IdPlano, false, bIntegraContabil);
        If iCodLancFinanc = -1 Then
          Result := false;
      End
      Else
      Begin
        bAtualizaLote := false;
        _Documento.EmiteLancaBaixa(_CdsLocal.FieldByname('CODDOCUMENTO').AsInteger, true);
        ExecSQL('UPDATE RECBTOPAGTO SET ' +
          ' NUMCHQBORDERO = ''' + sLoteBordero + ''', NUMLOTE = ' + sLoteBordero +
          ', DATACFLOAT = TO_DATE(''' + sDataBordero + ''',''DD/MM/YYYY'') ' +
          ' WHERE CODDOCUMENTO in (select distinct coddocumento from ' +
          ' lotexdocum lx ,lotepagto lp where  lp.NUMLOTE = ' + sLoteBordero +
          ' and lp.numlote=lx.numlote)');
      End;

      If bAtualizaLote Then
      Begin
        sSql := 'UPDATE LOTEPAGTO SET FLAGEMISSAO = ''1'', DATAEMISSAO = TO_DATE(''' + sDataBordero + ''', ' +
          '''DD/MM/YYYY''), NUMCHQBORDERO = ''' + sLoteBordero + ''' ';
        If iCodLancFinanc > 0 Then
          sSql := sSql + ', CODLANCFINANC = ' + FloatToStr(iCodLancFinanc) + ' ';
        sSql := sSql + ' WHERE NUMLOTE = ' + sLoteBordero;
      End;
      ExecSQL(sSql);
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

Constructor TCtrlEmissBordero.Create(idpessoa, idmodulo, idusuario: double; buscapanoPatro: boolean);
Begin
  Inherited Create;
  _Documento := TCtrlDocumento.Create;
  _Financ := TCtrlFinanc.Create(idpessoa, idmodulo, idusuario, buscapanoPatro);
  _ParamCap := TCtrlParamCap.Create;
  _Rad := TRad.Create;
End;

Destructor TCtrlEmissBordero.Destroy;
Begin
  Inherited;
  _Documento.free;
  _ParamCap.Free;
  _Financ.free;
  _Rad.Free;
End;

Function TCtrlEmissBordero.VerificaImpresaoBordero(
  numLote: integer): boolean;
Var
  _CdsLocal: TClientDataSet;
Begin
  _CdsLocal := TClientDataSet.Create(Nil);
  _CdsLocal.Data := GetDataPacket('select flagemissao from lotepagto where numlote=' + IntToStr(numLote));
  Result := (_CdsLocal.FieldbyName('flagemissao').asstring = '1');
  _CdsLocal.Free;
End;

Function TCtrlEmissBordero.ProcessoRadLiberado(NumLote: Integer; idempresa: double): Boolean;
Var
  _CdsLocal: TClientDataSet;
Begin
  _CdsLocal := TClientDataSet.Create(Nil);
  _CdsLocal.Data := GetDataPacket('select FLGRAD from  empresaprop  where idempresa = ' + FloatToStr(idempresa));
  If Not _CdsLocal.IsEmpty Then
  Begin
    If _CdsLocal.FieldByName('FLGRAD').AsString = 'S' Then
    Begin
      _CdsLocal.Data := GetDataPacket('SELECT IDPROCESSO FROM LOTEPAGTO WHERE NUMLOTE=' + IntToStr(numLote));
      If Not _CdsLocal.FieldByName('IDPROCESSO').IsNull Then
      Begin
        _Rad.IdProcesso := _CdsLocal.FieldByName('IDPROCESSO').AsInteger;
        Result := _Rad.SituacaoProcesso;
        If Not Result Then
          MessageInfo := 'O Lote ' + IntToStr(NumLote) + ' não está autorizado para emissão';
      End
      Else
        Result := True;
    End
    Else
      Result := True;
  End
  Else
  Begin
    MessageInfo := ' ';
    Result := false;
  End;
End;

Function TCtrlEmissBordero.EmissaoBPagto(RecPAg, sLoteBordero,
  sDataBordero, sCodPortForma: String; IdPessoa: double; IdModulo,
  IdUsuario, IdPlano: Integer; bIntegraContabil: boolean): Boolean;
Var
  sSql, sData, sLugarBaixa: String;
  _CdsLocal: TClientDataSet;
  iCodLancFinanc: Double;
  bAtualizaLote: boolean;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.EmissaoBDebito(RecPAg, sLoteBordero, sDataBordero, sCodPortForma, IdPessoa, IdModulo,
      IdUsuario, IdPlano, bIntegraContabil);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    bAtualizaLote := True;
    sLugarBaixa := LugarDaBaixa(RecPAg, IdPessoa);
    Result := True;
    If RecPag = 'P' Then
      sSql := ' SELECT  (''D'') as DEBCRE, '
    Else
      sSql := ' SELECT  (''C'') as DEBCRE, ';
    sSql := sSql + ' DOC.DATAPROGRAMADA, ' +
      ' LOTE.CODPORTFORMA , ' +
      ' DOC.IDPESSOA,  PESS.NOME, ' +
      ' DOC.DATAVENCTO, ' +
      ' DOC.NoDOCUMENTO, ' +
      ' DOC.COMPLDOCUMENTO, ' +
      ' DOC.CODDOCUMENTO, ' +
      ' DOC.OPERACAO, LOTE.NUMLOTE, ' +
      ' DOC.PLANO , DOC.PLACONTA,  DOC.CODCENTROCUSTO, ' +
      ' LOTE.CODLANCFINANC, ' +
      ' LOTEX.VALOR, LOTE.NUMCHQBORDERO, ' +
      ' LOTEX.FLGBAIXA, PF.DMAIS ' +
      ' FROM  ' +
      ' PESSOA PESS, DOCUMENTO DOC, LOTEXDOCUM LOTEX , LOTEPAGTO LOTE, PORTADORFORMA PF' +
      ' WHERE (LOTEX.NUMLOTE = ' + sLoteBordero + ') AND ' +
      '       (DOC.IDPESSOA = ' + FloatToStr(IdPessoa) + ') AND ' +
      '       (DOC.RECPAG = ''' + RecPag + ''') AND ' +
      '       (LOTEX.FLGBAIXA = '' ''  OR LOTEX.FLGBAIXA IS NULL) AND ' +
      '       (LOTE.NUMLOTE = LOTEX.NUMLOTE) AND ' +
      '       (DOC.IDFORCLI = PESS.IDPESSOA) AND ' +
      '       (LOTE.CODPORTFORMA = PF.CODPORTFORMA) AND ' +
      '       (LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO) ';

    _CdsLocal := TClientDataSet.create(Nil);
    _CdsLocal.data := GetDataPacket(sSql);
    Try
      StartTransaction;
      If _CdsLocal.FieldByname('OPERACAO').AsString <> '10' Then
      Begin
        sData := DateToStr(_Documento.AjustaDataFloat(StrToDate(sDataBordero), _CdsLocal.FieldByname('DMAIS').AsInteger, slCap));
        _Financ.FazerRateioCAPCAR(_CdsLocal.Data, sLugarBaixa, sLoteBordero, RecPag, StrToDate(sData), StrToFloat(sLoteBordero),
          StrToInt(sCodPortForma), iCodLancFinanc, IdPessoa, IdModulo, IdUsuario, IdPlano, false, bIntegraContabil);
        If iCodLancFinanc = -1 Then
          Result := false;
      End
      Else
      Begin
        bAtualizaLote := false;
        _Documento.EmiteLancaBaixa(_CdsLocal.FieldByname('CODDOCUMENTO').AsInteger, true);
        ExecSQL('UPDATE RECBTOPAGTO SET ' +
          ' NUMCHQBORDERO = ''' + sLoteBordero + ''', NUMLOTE = ' + sLoteBordero +
          ', DATACFLOAT = TO_DATE(''' + sDataBordero + ''',''DD/MM/YYYY'') ' +
          ' WHERE CODDOCUMENTO in (select distinct coddocumento from ' +
          ' lotexdocum lx ,lotepagto lp where  lp.NUMLOTE = ' + sLoteBordero +
          ' and lp.numlote=lx.numlote)');
      End;

      If bAtualizaLote Then
      Begin
        sSql := 'UPDATE LOTEPAGTO SET FLAGEMISSAO = ''1'', DATAEMISSAO = TO_DATE(''' + sDataBordero + ''', ' +
          '''DD/MM/YYYY''), NUMCHQBORDERO = ''' + sLoteBordero + ''' ';
        If iCodLancFinanc > 0 Then
          sSql := sSql + ', CODLANCFINANC = ' + FloatToStr(iCodLancFinanc) + ' ';
        sSql := sSql + ' WHERE NUMLOTE = ' + sLoteBordero;
      End;
      ExecSQL(sSql);
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

Function TCtrlEmissBordero.LugarDaBaixa(RecPAg: String;
  IdPessoa: double): String;
var
  _CdsLocal: TClientDataSet;
Begin
  _CdsLocal := TClientDataSet.Create(Nil);
  _CdsLocal.Data := _ParamCap.ListParamCAP( RecPag,StrToInt(FloatToStr(IdPessoa)));
  _CdsLocal.First;
  result := _CdsLocal.FieldByName('FLGSTATUSFINANC').AsString;
End;

End.

