Unit uCtrlEmissCheque;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMTypes,
  uCtrlDocumento, uCtrlFinanc, uCtrlTalaoCheque, uCtrlPeriodo, uCtrlHistoContab, uCtrlLancamento;

Type

  TCtrlEmissCheque = Class(TCmControlObject)
  protected
    Procedure AfterInitialize; override;
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
  private
    Fcds: TClientDataSet;
    _Documento: TCtrlDocumento;
    _Financeiro: TCtrlFinanc;
    _CtrlChequeEmis: TCtrlCheque;
    _CtrlPeriodo: TCtrlPeriodo;
    _CtrlHistoContab: TCtrlHistoContab;
    _CtrlLancamento: TCtrlLancamento;

    // Eventos dos ClientDataSet´s
    Procedure Setcds(Const Value: TClientDataSet);

  public
    Property cds: TClientDataSet read Fcds write Setcds;
    // Métodos
    Constructor Create(idpessoa, idmodulo, idusuario: double; buscapanoPatro: boolean); reintroduce;
    Destructor Destroy; override;
    //  Informa os existentes
    Function GravaEmissao(CdsChequeData: Olevariant; RECPAG: String; IntegraFinanceiro: Boolean; edtNumChqValue, idEmpresa, iCODPORTFORMA:
      Double; sFormaRecPagLancaFinanc, sNumLote, DtEmis: String; bControlaEmisCheque: Boolean; sFormaRecPagFLGCONTROLACHEQUE,
      sFormaRecPagFLGCONTABEMISCHQ, sFormaRecPagCODCENTROCUSTO, sFormaRecPagPLACONTACONTABCHQ, sFormaRecPagCODSUBCONTA,
      sFormaRecPagPLACONTA: String; iDMAIS: Integer; IntegraContab: Boolean; IdModulo, idUsuario, idPlano, uNidNegoc: Double;
      UsaPlanoPatro, bdestinase, bdocto, bdtprog, bvalor, bforn, bhist, blocal: boolean): Boolean;
  End;

Implementation

{ TCtrlEmissCheque }

Constructor TCtrlEmissCheque.Create(idpessoa, idmodulo, idusuario: double; buscapanoPatro: boolean);
Begin
  Inherited Create;
  _Documento := TCtrlDocumento.Create;
  _CtrlPeriodo := TCtrlPeriodo.Create;
  _Financeiro := TCtrlFinanc.Create(idPessoa, idmodulo, idusuario, buscapanoPatro);
  _CtrlChequeEmis := TCtrlCheque.Create;
  _CtrlHistoContab := TCtrlHistoContab.Create;
  _CtrlLancamento := TCtrlLancamento.Create;
End;

Destructor TCtrlEmissCheque.Destroy;
Begin
  _Documento.Free;
  _Financeiro.Free;
  _CtrlChequeEmis.Free;
  _CtrlPeriodo.Free;
  _CtrlHistoContab.Free;
  _CtrlLancamento.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlEmissCheque.DoChangeDataBase;
Begin
  Inherited;
End;

Procedure TCtrlEmissCheque.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Procedure TCtrlEmissCheque.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;

Function TCtrlEmissCheque.GravaEmissao(CdsChequeData: Olevariant; RECPAG: String; IntegraFinanceiro: Boolean; edtNumChqValue, idEmpresa,
  iCODPORTFORMA: Double; sFormaRecPagLancaFinanc, sNumLote, DtEmis: String; bControlaEmisCheque: Boolean; sFormaRecPagFLGCONTROLACHEQUE,
  sFormaRecPagFLGCONTABEMISCHQ, sFormaRecPagCODCENTROCUSTO, sFormaRecPagPLACONTACONTABCHQ, sFormaRecPagCODSUBCONTA,
  sFormaRecPagPLACONTA: String; iDMAIS: Integer; IntegraContab: Boolean; IdModulo, IdUsuario, idPlano, uNidNegoc: Double; UsaPlanoPatro,
    bdestinase, bdocto, bdtprog, bvalor, bforn, bhist, blocal: boolean): Boolean;
Var
  Msg: String;
  _CdsLotePagto, _CdsAux, _CdsCheque: TClientDataSet;
  bLanca: Boolean;
  NumChq, iPlanilhaChq, iCodLancFinanc, rValorLote, rValHistDed: Double;
  sData, sqlGrid, sHistAlteracao, sCodDoc, sNumCheqBord, sDebCre: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarEmissao(cds.Data);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      Result := true;
      StartTransaction;
      _CdsCheque := TClientDataSet.Create(Nil);
      _CdsCheque.Data := CdsChequeData;
      _CdsLotePagto := TClientDataSet.Create(Nil);
      _CdsLotePagto.Data := GetDataPacket('SELECT NUMLOTE, DATAEMISSAO, DATADIFERIDO ' +
        ' FROM LOTEPAGTO                                                ' +
        ' WHERE                                                         ' +
        ' (IDPESSOA = ' + FloatToStr(idEmpresa) + ') AND        ' +
        ' (CODPORTFORMA = ' + FloatToStr(iCODPORTFORMA) + ') AND         ' +
        ' (NUMLOTE IN (' + sNumLote + ')) AND                    ' +
        ' ((FLAGEMISSAO = ''0'') OR (FLAGEMISSAO IS NULL)) AND          ' +
        ' ((FLAGCANCEL = ''0'') OR (FLAGCANCEL IS NULL))                ' +
        'ORDER BY NUMLOTE                                               ');

      bLanca := ((sFormaRecPagLancaFinanc = 'S') And (IntegraFinanceiro));

      NumChq := Round(edtNumChqValue) - 1;
      _CdsLotePagto.First;
      While Not _CdsLotePagto.Eof Do
      Begin
        NumChq := NumChq + 1;
        If (bControlaEmisCheque) Or
          ((Not bControlaEmisCheque) And (sFormaRecPagFLGCONTROLACHEQUE = 'S')) Then
        Begin
          _CtrlChequeEmis.ValidaPrimeiroCheque := False;
          _CtrlChequeEmis.MostraMsg := True;
          _CtrlChequeEmis.VerificaChq := True;
          _CtrlChequeEmis.CodPortador := StrToInt(FloatToStr(iCODPORTFORMA));
          _CtrlChequeEmis.NumCheque := NumChq;
          _CtrlChequeEmis.GravaNumChq := True;
          If _CtrlChequeEmis.ValidaNumCheque <> vcOk Then
            Raise EdataBaseError.Create(_CtrlChequeEmis.MessageInfo);
        End;
        If _CdsLotePagto.FieldByName('DATADIFERIDO').IsNull Then
        Begin
          If Trim(DtEmis) <> '' Then
            sData := _CdsLotePagto.FieldByName('DataEmissao').AsString
          Else
            sData := DtEmis;
        End
        Else
          sData := _CdsLotePagto.FieldByName('DATADIFERIDO').AsString;
        If bLanca Then
        Begin
          If RecPag = 'P' Then
            sqlGrid := ' SELECT  (''D'') as DEBCRE, '
          Else
            sqlGrid := ' SELECT  (''C'') as DEBCRE, ';
          sqlGrid := sqlGrid + ' DOC.DATAPROGRAMADA,                               ' +
            ' lote.codportforma ,            ' +
            ' DOC.IDPESSOA,  pess.nome,                         ' +
            ' DOC.DATAVENCTO,                                   ' +
            ' DOC.NoDOCUMENTO,                                  ' +
            ' DOC.COMPLDOCUMENTO,                               ' +
            ' DOC.CODDOCUMENTO,                                 ' +
            ' DOC.OPERACAO, LOTE.NUMLOTE,                       ' +
            ' DOC.PLANO , DOC.PLACONTA,  DOC.CODCENTROCUSTO,    ' +
            ' LOTE.CODLANCFINANC,                               ' +
            ' LOTEX.VALOR,lote.numchqbordero,                   ' +
            ' LOTEX.FLGBAIXA                                    ' +
            ' FROM                                              ' +
            ' DOCUMENTO DOC,                                    ' +
            ' PESSOA PESS,                                      ' +
            ' LOTEXDOCUM LOTEX ,                                ' +
            ' lotepagto lote                                    ' +
            ' WHERE (LOTEX.NUMLOTE      = ' + _CdsLotePagto.FieldByName('NUMLOTE').AsString + ')   AND ' +
            '       (DOC.IDPESSOA       = ' + FloattoStr(IdEmpresa) + ')   AND ' +
            '       (DOC.RECPAG         = ''' + RecPag + ''') AND ' +
            '       (LOTEX.FLGBAIXA     = '' ''  OR LOTEX.FLGBAIXA IS NULL) AND (LOTE.NUMLOTE = LOTEX.NUMLOTE) AND ' +
            '       (DOC.IDFORCLI       = PESS.IDPESSOA) AND (LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO)';
          _CdsAux := TClientDataSet.Create(Nil);
          _CdsAux.Data := GetDataPacket(sqlGrid);
          If _CdsAux.FieldByname('OPERACAO').AsString <> '10' Then
          Begin
            iCodLancFinanc := 0;
            sData := DateToStr(_Documento.AjustaDataFloat(StrToDate(sData), iDMAIS, slCap));
            If Not _Financeiro.FazerRateioCAPCAR(_CdsAux.Data, 'C', FloatToStr(NumChq), RecPag, StrToDate(sData), StrToFloat(sNumLote),
              iCODPORTFORMA, iCodLancFinanc, IdEmpresa, IdModulo, idUsuario, idPlano, false, IntegraContab) Then
              Raise EdataBaseError.Create(_Financeiro.MessageInfo);
          End
          Else
          Begin
            If _CdsAux.FieldByName('OPERACAO').AsString = '10' Then
            Begin
              sCodDoc := _CdsAux.FieldByName('CODDOCUMENTO').AsString;
              sNumCheqBord := FloatToStr(NumChq);
              sNumLote := _CdsAux.FieldByName('NUMLOTE').AsString;
              sqlGrid := 'UPDATE RECBTOPAGTO SET ' +
                ' NUMCHQBORDERO = ''' + sNumCheqBord +
                ''', NUMLOTE = ' + sNumlote +
                ', DATACFLOAT = TO_DATE(''' + sData + ''',''DD/MM/YYYY'') WHERE CODDOCUMENTO = ' + sCodDoc;
              _CdsAux.Data := GetDataPacket(sqlGrid);
              //Altera o RecbToPagto Para o novo número do cheque e para a data de emissão do cheque
              If Not _CdsAux.IsEmpty Then
              Begin
                sqlGrid := 'SELECT CODLANCFINANC FROM RECBTOPAGTO WHERE CODDOCUMENTO = ' + sCodDoc;
                _CdsAux.Data := GetDataPacket(sqlGrid);
                If Not _CdsAux.IsEmpty Then
                Begin
                  sqlGrid := 'UPDATE MOVIMFINANC SET ' +
                    ' NUMCHQBORDERO = ''' + sNumCheqBord +
                    ''', HISTORICO = ''CHEQUE Nº ' + sNumCheqBord +
                    ''', DATALANCFINAN = TO_DATE(''' + sData + ''',''DD/MM/YYYY'') ' +
                    ' WHERE CODLANCFINANC = ' + _CdsAux.Fields[0].AsString;
                  _CdsAux.Data := GetDataPacket(sqlGrid);
                  //Altera o Histórico da movimfinanc, nº do cheque e data de lançamento
                  If Not _CdsAux.IsEmpty Then
                  Begin
                    sqlGrid := 'UPDATE LANCTODOCUM SET ' +
                      ' DATALANCTO = TO_DATE(''' + sData + ''',''DD/MM/YYYY'') ' +
                      ' WHERE CODDOCUMENTO = ' + sCodDoc;
                    _CdsAux.Data := GetDataPacket(sqlGrid);
                    //Altera data do lançamento na lanctodocum
                    If Not _CdsAux.IsEmpty Then
                    Begin
                      sqlGrid := 'SELECT PLNCODIGO FROM LANCTODOCUM WHERE CODDOCUMENTO = ' + sCodDoc +
                        ' AND RTRIM(OPERACAO) = ''10''';
                      _CdsAux.Data := GetDataPacket(sqlGrid);
                      //Altera data e histórico da planilha
                      If Not _CdsAux.IsEmpty Then
                      Begin
                        _CtrlPeriodo.RetornaPeriodoExercicioData(idempresa, sdata);

                        iPlanilhaChq := _CdsAux.Fields[0].AsFloat;
                        If Not ExecSQL('UPDATE PLANILHA SET ' +
                          ' PLNDATDIA = TO_DATE(''' + sData + ''',''DD/MM/YYYY''), ' +
                          ' PEREXERCICIO = ' + IntToStr(_CtrlPeriodo.Exercicio) + ',' +
                          ' PERNUMERO = ' + IntToStr(_CtrlPeriodo.Periodo) + ' ' +
                          ' WHERE PLNCODIGO = ' + FloatToStr(iPlanilhaChq)) Then
                          Raise EdataBaseError.Create('Não foi possível atualizar data do lançamento do documento Doc ' +
                            sCodDoc + ', verifique')
                        Else
                        Begin
                          _CdsAux.Data :=
                            GetDataPacket('SELECT LACHIST1,LACHIST2,LACHIST3,LACHIST4,LACHIST5 FROM LANCAMENTO WHERE PLNCODIGO = ' +
                            FloatToStr(iPlanilhaChq) + ' AND LACNUMLAN = 1 ');
                          If Not _CdsAux.IsEmpty Then
                          Begin
                            sHistAlteracao := _CdsAux.Fields[0].AsString + ' ' +
                              _CdsAux.Fields[1].AsString + ' ' +
                              _CdsAux.Fields[2].AsString + ' ' +
                              _CdsAux.Fields[3].AsString + ' ' +
                              _CdsAux.Fields[4].AsString + ' ';
                            sHistAlteracao := sHistAlteracao + ' CHEQUE Nº ' + sNumCheqBord;
                            _CtrlHistoContab.ArrumaHistorico(sHistAlteracao);
                            If Not ExecSQL('UPDATE LANCAMENTO SET ' +
                              ' LACHIST1 = ''' + _CtrlHistoContab.Hist1 + ''',' +
                              ' LACHIST2 = ''' + _CtrlHistoContab.Hist2 + ''',' +
                              ' LACHIST3 = ''' + _CtrlHistoContab.Hist3 + ''',' +
                              ' LACHIST4 = ''' + _CtrlHistoContab.Hist4 + ''',' +
                              ' LACHIST5 = ''' + _CtrlHistoContab.Hist5 + '''' +
                              ' WHERE PLNCODIGO = ' + FloatToStr(iPlanilhaChq) +
                              ' AND LACNUMLAN = 1 ') Then
                              Raise EdataBaseError.Create('Não foi possível atualizar histórico do lançamento contábil do documento Doc '
                                +
                                sCodDoc + ', verifique');
                          End;
                        End;
                      End;
                    End
                    Else
                      Raise EdataBaseError.Create('Não foi possível atualizar data do lançamento do documento Doc ' +
                        sCodDoc + ', verifique');
                  End
                  Else
                    Raise EdataBaseError.Create('Não foi possível atualizar movimento financeiro para o Doc ' +
                      sCodDoc + ', verifique');
                End
                Else
                  Raise EdataBaseError.Create('Erro ao selecionar movimento financeiro para o Doc ' +
                    sCodDoc + ', verifique');
              End
              Else
                Raise EdataBaseError.Create('Não foi possível atualiar Nº do Cheque\Borderô para o Doc ' +
                  sCodDoc + ', verifique');

              _Documento.EmiteLancaBaixa(StrToInt(sCodDoc), true);
            End;
          End;
        End;

        SqlGrid := 'UPDATE LotePagto SET NUMCHQBORDERO = ' + FloatToStr(NumChq) + ', ' +
          'DATAEMISSAO = TO_DATE('''+sData+''',''DD/MM/YYYY''),';

        bLanca := False;

        If (sFormaRecPagLancaFinanc = 'S') And
          (IntegraFinanceiro) And (iCodLancFinanc <> 0) Then
        Begin
          SqlGrid := SqlGrid + 'CODLANCFINANC = ' + FloatToStr(iCodLancFinanc) + ', ';
          bLanca := True;
        End;

        SqlGrid := SqlGrid + 'FLAGEMISSAO = ''1'' ' +
          'WHERE IDPESSOA = ' + FloatToStr(idEmpresa) + ' AND ' +
          'NUMLOTE        = ' + sNumLote;
        ExecSql(SqlGrid);

        //        If qryUpdate.RowsAffected = 0 Then
        //          Abort;

        If (sFormaRecPagFLGCONTABEMISCHQ = 'S') Then
        Begin
          If _CdsCheque.Locate('NUMLOTE', _CdsLotePagto.FieldByName('NUMLOTE').AsInteger, []) Then
          Begin
            If DtEmis <> '' Then
              sData := _CdsCheque.FieldByName('DataEmissao').AsString
            Else
              sData := DtEmis;
            _CtrlPeriodo.RetornaPeriodoExercicioData(idempresa, sdata);

            rValorLote := _CdsCheque.FieldByName('VALOR').AsFloat;
            If (Trim(sFormaRecPagCODSUBCONTA) = '0') Or (Trim(sFormaRecPagCODSUBCONTA) = '') Then
              sFormaRecPagCODSUBCONTA := '0';
            sHistAlteracao := 'Emissão de Cheque Nº ' + FloatToStr(NumChq);
            _CtrlHistoContab.ArrumaHistorico(sHistAlteracao);
            _CtrlLancamento.lcTestaConta := True;
            If not _CtrlLancamento.InsereLancaContab('0', idEmpresa, idModulo, idUsuario, idPlano, uNidNegoc,
              StrToFloat(sFormaRecPagCODSUBCONTA), 0, 0, 0,
              0, 0, sData, '', _CtrlHistoContab.Hist1, _CtrlHistoContab.Hist2, _CtrlHistoContab.Hist3, _CtrlHistoContab.Hist4,
              _CtrlHistoContab.Hist5, '03', sFormaRecPagCODCENTROCUSTO, sFormaRecPagPLACONTACONTABCHQ, '', '', '', rvalorLote, false,
              UsaPlanoPatro) Then
              Raise EdataBaseError.Create(_CtrlLancamento.MessageInfo);

            _CtrlLancamento.lcTestaConta := True;
            If not _CtrlLancamento.InsereLancaContab('1', idEmpresa, idModulo, idUsuario, idPlano, uNidNegoc,
              StrToFloat(sFormaRecPagCODSUBCONTA), 0, 0, 0,
              0, 0, sData, '', _CtrlHistoContab.Hist1, _CtrlHistoContab.Hist2, _CtrlHistoContab.Hist3, _CtrlHistoContab.Hist4,
              _CtrlHistoContab.Hist5, '03', '', '', sFormaRecPagCODCENTROCUSTO, sFormaRecPagPLACONTA, '', rvalorLote, false,
              UsaPlanoPatro) Then
              Raise EdataBaseError.Create(_CtrlLancamento.MessageInfo);
            If Not ExecSQL('UPDATE LOTEPAGTO SET PLNCODIGO = ' + FloatToStr(_CtrlLancamento.RetornoPlnCodigo) + ' WHERE NUMLOTE = ' +
              sNumLote) Then
              Raise EdataBaseError.Create('Não foi Inserir Lançamento Contab');
          End;
        End;
        _CdsLotePagto.Next;
      End;

      sqlGrid := 'update paramcap set ';
      If bdestinase Then
        sqlGrid := sqlGrid + 'flgdestinase=0, '
      Else
        sqlGrid := sqlGrid + 'flgdestinase=1, ';
      If bdocto Then
        sqlGrid := sqlGrid + 'flgdocto=0, '
      Else
        sqlGrid := sqlGrid + 'flgdocto=1, ';
      If bdtprog Then
        sqlGrid := sqlGrid + 'flgdtprog=0, '
      Else
        sqlGrid := sqlGrid + 'flgdtprog=1, ';
      If bvalor Then
        sqlGrid := sqlGrid + 'flgvalor=0, '
      Else
        sqlGrid := sqlGrid + 'flgvalor=1, ';
      If bforn Then
        sqlGrid := sqlGrid + 'flgforn=0, '
      Else
        sqlGrid := sqlGrid + 'flgforn=1, ';
      If bhist Then
        sqlGrid := sqlGrid + 'flghist=0, '
      Else
        sqlGrid := sqlGrid + 'flghist=1, ';
      If blocal Then
        sqlGrid := sqlGrid + 'flglocal=0 '
      Else
        sqlGrid := sqlGrid + 'flglocal=1 ';
      sqlGrid := sqlGrid + ' where idpessoa=' + FloatToStr(idempresa);
      sqlGrid := sqlGrid + '   and recpag=''P''';
      ExecSQL(sqlGrid);
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

Procedure TCtrlEmissCheque.AfterInitialize;
Begin
  Inherited;
  _Documento.InitializeAs(self);
  _Financeiro.InitializeAs(self);
  _CtrlChequeEmis.InitializeAs(self);
  _CtrlPeriodo.InitializeAs(self);
  _CtrlHistoContab.InitializeAs(self);
  _CtrlLancamento.InitializeAs(self);
  _Documento.OnMessageInfo := Nil;
  _Financeiro.OnMessageInfo := Nil;
  _CtrlChequeEmis.OnMessageInfo := Nil;
  _CtrlPeriodo.OnMessageInfo := Nil;
  _CtrlHistoContab.OnMessageInfo := Nil;
  _CtrlLancamento.OnMessageInfo := Nil;
End;

End.

