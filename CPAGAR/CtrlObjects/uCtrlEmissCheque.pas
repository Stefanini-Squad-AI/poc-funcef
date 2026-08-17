Unit uCtrlEmissCheque;

{=====================================================================================
Nº SOL......: 235849
Nº PPM......: 459943
Data........: 23/07/2014
Responsável.: Paulo Nobre SOL 235849 PPM 459943
Descrição...: Ajuste na baixa automatica
=====================================================================================
Data      : 01/06/2007
Autor     : Marcus Oliveira
Pendência : 25399
Descrição : Passando o parametro da data de emissão para o método GravaEmissao e
            corrigido o parametro que tava cravado na query para trazer de acordo com o parametro informado.
{=====================================================================================
Autor     : André Tavares
Rotina    : Diversas
Data      : 31/01/2006
Pendência : 21352
Descrição : aproveitei pra colocar o filtro idpessoa na query
{=====================================================================================
Data      : 28/01/2005
Autor     : Rodolpho da SIlva
Pendência : 18498
Descrição : Inserir documento no CFinan conforme parâmetro do momento do lançamento
======================================================================================

Data      : 13/01/04
Pendência : 14451 - Nova Segregação de Recursos
Descrição : Passar a nova estrutura - IDSEGREGACRITER e DATASEGREGACRITER

Métodos Pendentes:
          TCtrlEmissCheque.GravaEmissao InsereLancaContab - 2 Ocorrências


------------------------------------------------------------------------------}
Interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMTypes,
  uCtrlDocumento, uCtrlFinanc, uCtrlTalaoCheque, uCtrlPeriodo, uCtrlHistoContab,
  uCtrlLancamento, uCtrlBaixaDocumentos, uListaCamposHistCapCar, uCtrlModeloHistorico;

Type

  TCtrlEmissCheque = Class(TCmControlObject)
  protected
    Procedure AfterInitialize; override;
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
  private
    igdpessoa : Double;
    bguscapanoPatro : Boolean;

    Fcds: TClientDataSet;
    _Documento: TCtrlDocumento;
    _Financeiro: TCtrlFinanc;
    _CtrlChequeEmis: TCtrlCheque;
    _CtrlPeriodo: TCtrlPeriodo;
    _CtrlHistoContab: TCtrlHistoContab;
    _CtrlLancamento: TCtrlLancamento;
    _ModeloHist : TCtrlModeloHistorico;
    BaixaDocumentos: TCtrlBaixaDocumentos;

    // Eventos dos ClientDataSet´s
    Procedure Setcds(Const Value: TClientDataSet);

  public
    Property cds: TClientDataSet read Fcds write Setcds;
    // Métodos
    Constructor Create(idpessoa, idmodulo, idusuario: double; buscapanoPatro: boolean); reintroduce;
    Destructor Destroy; override;
    //  Informa os existentes
    Function GravaEmissao(CdsChequeData: Olevariant; RECPAG: String; IntegraFinanceiro: Boolean; edtNumChqValue, idEmpresa,
      iCODPORTFORMA, iCODPORTADOR: Double; sFormaRecPagLancaFinanc, sNumLote: String; DtEmis: TDateTime; bControlaEmisCheque: Boolean; sFormaRecPagFLGCONTROLACHEQUE,
      sFormaRecPagFLGCONTABEMISCHQ, sFormaRecPagCODCENTROCUSTO, sFormaRecPagPLACONTACONTABCHQ, sFormaRecPagCODSUBCONTA,
      sFormaRecPagPLACONTA: String; iDMAIS: Integer; IntegraContab: Boolean; IdModulo, idUsuario, idPlano, uNidNegoc: Double;
      UsaPlanoPatro, bdestinase, bdocto, bdtprog, bvalor, bforn, bhist, blocal: boolean; bBaixaNoCheque, bOPAutomatico,
      bLancaBaixaFloat : Boolean; IdEspAcesso: Integer; bPartidaDobrada, bConsData : Boolean): Boolean;
  End;

Implementation

{ TCtrlEmissCheque }

Constructor TCtrlEmissCheque.Create(idpessoa, idmodulo, idusuario: double; buscapanoPatro: boolean);
Begin
  Inherited Create;
  igdpessoa := idPessoa;
  bguscapanoPatro := buscapanoPatro;

  _Documento := TCtrlDocumento.Create;
  _CtrlPeriodo := TCtrlPeriodo.Create;
  _Financeiro := TCtrlFinanc.Create(idPessoa, idmodulo, idusuario, buscapanoPatro);
  _CtrlChequeEmis := TCtrlCheque.Create;
  _CtrlHistoContab := TCtrlHistoContab.Create;
  _CtrlLancamento := TCtrlLancamento.Create;
  _ModeloHist := TCtrlModeloHistorico.Create;
  BaixaDocumentos := TCtrlBaixaDocumentos.Create;

  _CtrlChequeEmis.IdEmpresa := Trunc( idPessoa );
End;

Destructor TCtrlEmissCheque.Destroy;
Begin
  _Documento.Free;
  _Financeiro.Free;
  _CtrlChequeEmis.Free;
  _CtrlPeriodo.Free;
  _CtrlHistoContab.Free;
  _CtrlLancamento.Free;
  _ModeloHist.Free;
  BaixaDocumentos.Free;
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
  iCODPORTFORMA, iCODPORTADOR: Double; sFormaRecPagLancaFinanc, sNumLote : String; DtEmis: TDatetime; bControlaEmisCheque: Boolean; sFormaRecPagFLGCONTROLACHEQUE,
  sFormaRecPagFLGCONTABEMISCHQ, sFormaRecPagCODCENTROCUSTO, sFormaRecPagPLACONTACONTABCHQ, sFormaRecPagCODSUBCONTA,
  sFormaRecPagPLACONTA: String; iDMAIS: Integer; IntegraContab: Boolean; IdModulo, IdUsuario, idPlano, uNidNegoc: Double; UsaPlanoPatro,
    bdestinase, bdocto, bdtprog, bvalor, bforn, bhist, blocal: boolean; bBaixaNoCheque, bOPAutomatico,
    bLancaBaixaFloat : Boolean; IdEspAcesso : Integer; bPartidaDobrada, bConsData : Boolean): Boolean;
Var
  Msg: String;
  _CdsLotePagto, _CdsAux, _CdsCheque, _CdsBuscaRateio: TClientDataSet;
  bLanca: Boolean;
  NumChq, iPlanilhaChq, iCodLancFinanc, rValorLote, rValHistDed, fplncodogo: Double;
  sqlGrid, sqlLote, sHistAlteracao, sCodDoc, sNumCheqBord, sDebCre: String;
  x: integer;
  slotelocal  : string;
  sData : TdateTime;
  cdsMomentoLanc: TClientDataSet;

 

Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravaEmissao(CdsChequeData, RECPAG, IntegraFinanceiro,
                     edtNumChqValue, idEmpresa, iCODPORTFORMA, iCODPORTADOR, sFormaRecPagLancaFinanc,
                     sNumLote, DtEmis, bControlaEmisCheque, sFormaRecPagFLGCONTROLACHEQUE,
                     sFormaRecPagFLGCONTABEMISCHQ, sFormaRecPagCODCENTROCUSTO,
                     sFormaRecPagPLACONTACONTABCHQ, sFormaRecPagCODSUBCONTA,
                     sFormaRecPagPLACONTA, iDMAIS, IntegraContab, IdModulo, IdUsuario,
                     idPlano, uNidNegoc, UsaPlanoPatro, bdestinase, bdocto, bdtprog,
                     bvalor, bforn, bhist, blocal, igdpessoa, bguscapanoPatro,bBaixaNoCheque,
                     bOPAutomatico, bLancaBaixaFloat, IdEspAcesso, bPartidaDobrada, bConsData);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      Result := true;
      StartTransaction;
      slotelocal := sNumLote;
      _CdsCheque := TClientDataSet.Create(Nil);
      _CdsCheque.Data := CdsChequeData;
      _CdsLotePagto := TClientDataSet.Create(Nil);
      _CdsBuscaRateio := TClientDataSet.Create(Nil);
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
          _CtrlChequeEmis.CodPortador := StrToInt(FloatToStr(iCODPORTADOR));
          _CtrlChequeEmis.NumCheque := NumChq;
          _CtrlChequeEmis.GravaNumChq := True;
          If _CtrlChequeEmis.ValidaNumCheque <> vcOk Then
            Raise EdataBaseError.Create(_CtrlChequeEmis.MessageInfo);
        End;
        If _CdsLotePagto.FieldByName('DATADIFERIDO').IsNull Then
        Begin
          If bConsData Then
            sData := _CdsLotePagto.FieldByName('DataEmissao').AsDateTime
          Else
            sData := DtEmis;
        End
        Else
          sData := _CdsLotePagto.FieldByName('DATADIFERIDO').AsDateTime;
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
            ' LOTEX.FLGBAIXA, DOC.NUMSLIP, LOTE.NUMSLIP, LOTE.FAVORECIDO   ' +
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
            sData := _Documento.AjustaDataFloat(sData, iDMAIS, slCap);

             

            //  Início - Rodolpho - P: 18498 - 28/01/2005
            try
                cdsMomentoLanc      := TClientDataSet.Create(nil); { andre tavares - pendencia 21352 - 31/01/2006 - aproveitei pra colocar o filtro idpessoa na query}
                cdsMomentoLanc.Data := GetDataPacket('SELECT LANCAFINANC, FLGSTATUSFINANC FROM PARAMCAP WHERE RECPAG = ''P'' AND IDPESSOA = '+ floatTostr(IdEmpresa) );//Adicionei o FLGSTATUSFINANC para passar no parametro

                if cdsMomentoLanc.FieldByName('LANCAFINANC').AsString = 'S' then
                begin
                   If Not _Financeiro.FazerRateioCAPCAR(_CdsAux.Data,
                      //Marcus Oliveira P.25399 19/06/2007
                      cdsMomentoLanc.Fieldbyname('FLGSTATUSFINANC').AsString,
                      FloatToStr(NumChq), RecPag,sData,
                      _CdsLotePagto.FieldByName('NUMLOTE').AsFloat,
                      iCODPORTFORMA, iCodLancFinanc, IdEmpresa, IdModulo, idUsuario, idPlano, false, IntegraContab,
                      //Marcus Oliveira P.25399 01/06/2007
                      DtEmis) Then
                      Raise EdataBaseError.Create(_Financeiro.MessageInfo);
                end;

            finally
                FreeAndNil(cdsMomentoLanc);
            end;
            //  Fim    - Rodolpho - P: 18498 - 28/01/2005




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
                ', DATACFLOAT = TO_DATE(''' + DateToStr(sData) + ''',''DD/MM/YYYY'') WHERE CODDOCUMENTO = ' + sCodDoc;
               //Altera o RecbToPagto Para o novo número do cheque e para a data de emissão do cheque
              If ExecSql(sqlGrid) Then
              Begin
                sqlGrid := 'SELECT CODLANCFINANC FROM RECBTOPAGTO WHERE CODDOCUMENTO = ' + sCodDoc;
                _CdsAux.Data := GetDataPacket(sqlGrid);
                If Not _CdsAux.IsEmpty Then
                Begin
                  sqlGrid := 'UPDATE MOVIMFINANC SET ' +
                    ' NUMCHQBORDERO = ''' + sNumCheqBord +
                    ''', HISTORICO = ''CHEQUE Nº ' + sNumCheqBord +
                    ''', DATALANCFINAN = TO_DATE(''' + DateToStr(sData) + ''',''DD/MM/YYYY'') ' +
                    ' WHERE CODLANCFINANC = ' + _CdsAux.Fields[0].AsString;
                  //Altera o Histórico da movimfinanc, nº do cheque e data de lançamento
                  If ExecSql(sqlGrid)  Then
                  Begin
                    sqlGrid := 'UPDATE LANCTODOCUM SET ' +
                      ' DATALANCTO = TO_DATE(''' + DateToStr(sData) + ''',''DD/MM/YYYY'') ' +
                      ' WHERE CODDOCUMENTO = ' + sCodDoc;
                    //Altera data do lançamento na lanctodocum
                    If ExecSql(sqlGrid)  Then
                    Begin
                      sqlGrid := 'SELECT PLNCODIGO FROM LANCTODOCUM WHERE CODDOCUMENTO = ' + sCodDoc +
                        ' AND RTRIM(OPERACAO) = ''10''';
                      _CdsAux.Data := GetDataPacket(sqlGrid);
                      //Altera data e histórico da planilha
                      If Not _CdsAux.IsEmpty Then
                      Begin
                        _CtrlPeriodo.RetornaPeriodoExercicioData(idempresa, DateToStr(sData));

                        iPlanilhaChq := _CdsAux.Fields[0].AsFloat;
                        If Not ExecSQL('UPDATE PLANILHA SET ' +
                          ' PLNDATDIA = TO_DATE(''' + DateToStr(sData) + ''',''DD/MM/YYYY''), ' +
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
          'DATAEMISSAO = TO_DATE('''+DateToStr(sData)+''',''DD/MM/YYYY''),';

        bLanca := False;

        If (sFormaRecPagLancaFinanc = 'S') And
          (IntegraFinanceiro) And (iCodLancFinanc <> 0) Then
        Begin
          SqlGrid := SqlGrid + 'CODLANCFINANC = ' + FloatToStr(iCodLancFinanc) + ', ';
          bLanca := True;
        End;

        SqlGrid := SqlGrid + 'FLAGEMISSAO = ''1'' ' +
          'WHERE IDPESSOA = ' + FloatToStr(idEmpresa) + ' AND ' +
          'NUMLOTE        = ' + _CdsLotePagto.FieldByName('NUMLOTE').AsString;
        ExecSql(SqlGrid);

        If (sFormaRecPagFLGCONTABEMISCHQ = 'S') Then
        Begin
          If _CdsCheque.Locate('NUMLOTE', _CdsLotePagto.FieldByName('NUMLOTE').AsInteger, []) Then
          Begin
             _CdsBuscaRateio.Data := GetDataPacket('SELECT SUM(VALORRATEIOLOTE) AS VALORRATEIOLOTE, '+#13+
                                                   '    IDPATRO,  IDPLANOPREV                       '+#13+
                                                   'FROM                                            '+#13+
                                                   '(                                               '+#13+
                                                   'SELECT                                          '+#13+
                                                   '  (((LX.VALOR * RD.VALOR ) / L.VALOR)) AS VALORRATEIOLOTE, '+#13+
                                                   '  RD.IDPATRO,                                   '+#13+
                                                   '  RD.IDPLANOPREV                                '+#13+
                                                   'FROM                                            '+#13+
                                                   '  DOCUMENTO D,                                  '+#13+
                                                   '  LANCTODOCUM L,                                '+#13+
                                                   '  RATEIODOCUM RD,                               '+#13+
                                                   '  LOTEXDOCUM LX                                 '+#13+
                                                   'WHERE                                           '+#13+
                                                   '  LX.NUMLOTE = '+_CdsLotePagto.FieldByName('NUMLOTE').AsString+' AND                    '+#13+
                                                   '  RTRIM(D.OPERACAO) <> ''3'' AND                '+#13+
                                                   '  LX.CODDOCUMENTO = RD.CODDOCUMENTO AND         '+#13+
                                                   '  LX.CODDOCUMENTO = D.CODDOCUMENTO AND          '+#13+
                                                   '  D.CODDOCUMENTO = L.CODDOCUMENTO AND           '+#13+
                                                   '  D.OPERACAO = L.OPERACAO                       '+#13+
                                                   'UNION                                           '+#13+
                                                   'SELECT                                          '+#13+
                                                   '  (((LX.VALOR * RD.VALOR ) / L.VALOR)) AS VALORRATEIOLOTE,  '+#13+
                                                   '  RD.IDPATRO,                                   '+#13+
                                                   '  RD.IDPLANOPREV                                '+#13+
                                                   'FROM                                            '+#13+
                                                   '  DOCUMENTO D,                                  '+#13+
                                                   '  LANCTODOCUM L,                                '+#13+
                                                   '  VWRATEIOPARCELADO RD,                         '+#13+
                                                   '  LOTEXDOCUM LX                                 '+#13+
                                                   'WHERE                                           '+#13+
                                                   '  LX.NUMLOTE = '+_CdsLotePagto.FieldByName('NUMLOTE').AsString+'  AND                    '+#13+
                                                   '  RTRIM(D.OPERACAO) = ''3'' AND                 '+#13+
                                                   '  LX.CODDOCUMENTO = RD.CODDOCUMENTO AND         '+#13+
                                                   '  LX.CODDOCUMENTO = D.CODDOCUMENTO AND          '+#13+
                                                   '  D.CODDOCUMENTO = L.CODDOCUMENTO AND           '+#13+
                                                   '  D.OPERACAO = L.OPERACAO)                      '+#13+
                                                   'GROUP BY                                        '+#13+
                                                   '  IDPATRO,                                      '+#13+
                                                   '  IDPLANOPREV                                   ');
             while not _CdsBuscaRateio.eof do
             begin
                If bConsData Then
                   sData := _CdsCheque.FieldByName('DataEmissao').AsDateTime
                Else
                   sData := DtEmis;
                _CtrlPeriodo.RetornaPeriodoExercicioData(idempresa, DateToStr(sData));

                rvalorLote   := _CdsBuscaRateio.FieldByName('VALORRATEIOLOTE').AsFloat;
                fplncodogo := 0;
                If (Trim(sFormaRecPagCODSUBCONTA) = '0') Or (Trim(sFormaRecPagCODSUBCONTA) = '') Then
                   sFormaRecPagCODSUBCONTA := '0';
                sHistAlteracao := 'Emissão de Cheque Nº ' + FloatToStr(NumChq);
                _CtrlHistoContab.ArrumaHistorico(sHistAlteracao);
                _CtrlLancamento.lcTestaConta := True;

                if _CdsCheque.FindField('CODDOCUMENTO') <> nil then
                sHistAlteracao := GetHistoricoCapCar( _ModeloHist,
                                         IdEmpresa,
                                         Trunc(IdModulo),1,
                                         sHistAlteracao,
                                         [_CdsCheque.FieldByName('CODDOCUMENTO').AsString,
                                         _CdsCheque.FieldByName('COMPLDOCUMENTO').AsString,
                                         _CdsCheque.FieldByName('RAZAOSOCIAL').AsString   ,
                                         _CdsCheque.FieldByName('DSCLANCAMENTO').AsString,
                                         _CdsCheque.FieldByName('DATAVENCIMENTO').AsString,
                                         _CdsCheque.FieldByName('HISTORICOCOMPL').AsString]);

                If not _CtrlLancamento.InsereLancaContab('0', idEmpresa, idModulo, idUsuario, idPlano, uNidNegoc,
                   StrToFloat(sFormaRecPagCODSUBCONTA), 0,
                   _CdsBuscaRateio.FieldByName('IDPLANOPREV').AsInteger,
                   _CdsBuscaRateio.FieldByName('IDPATRO').AsInteger,
                   fplncodogo, 0, DateToStr(sData), '',
                   sHistAlteracao,
                   '',
                   '',
                   '',
                   '', '03',
                   sFormaRecPagCODCENTROCUSTO,
                   sFormaRecPagPLACONTACONTABCHQ, '', '', '', rvalorLote, false,
                   UsaPlanoPatro,

                   -1, -1) Then
                   Raise EdataBaseError.Create(_CtrlLancamento.MessageInfo);

                fplncodogo := _CtrlLancamento.RetornoPlnCodigo;
                _CtrlLancamento.lcTestaConta := True;
                If not _CtrlLancamento.InsereLancaContab('1', idEmpresa, idModulo, idUsuario, idPlano, uNidNegoc,
                   StrToFloat(sFormaRecPagCODSUBCONTA), 0,
                   _CdsBuscaRateio.FieldByName('IDPLANOPREV').AsInteger,
                   _CdsBuscaRateio.FieldByName('IDPATRO').AsInteger,
                   fplncodogo, 0, DateToStr(sData), '',
                   sHistAlteracao,
                   '',
                   '',
                   '',
                   '', '03',
                   '', '',
                   sFormaRecPagCODCENTROCUSTO,
                   sFormaRecPagPLACONTA, '', rvalorLote, false,
                   UsaPlanoPatro,

                   -1, -1) Then
                   Raise EdataBaseError.Create(_CtrlLancamento.MessageInfo);
                If Not ExecSQL('UPDATE LOTEPAGTO SET PLNCODIGO = ' + FloatToStr(_CtrlLancamento.RetornoPlnCodigo) + ' WHERE NUMLOTE in (' +
                   sNumLote+')') Then
                   Raise EdataBaseError.Create('Não foi Inserir Lançamento Contab');
                _CdsBuscaRateio.next;
             End;
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
      if bBaixaNoCheque then
      begin
         sqlLote := ' SELECT DISTINCT ' +
               '     LOTEPAGTO.NUMLOTE, ' +
               '     PORTADORFORMA.DESCRICAO, ' +
               '     LOTEPAGTO.DATAEMISSAO,  ' +
               '     LOTEPAGTO.FAVORECIDO, ' +
               '     LOTEPAGTO.NUMCHQBORDERO, ' +
               '     LOTEPAGTO.CODPORTFORMA, ' +
               '     SUM(LOTEX.VALOR), ' +
               '     LOTEPAGTO.PLNCODIGO ' +
               ' FROM ' +
               '     DOCUMENTO DOC, ' +
               '     LOTEPAGTO, ' +
               '     LOTEXDOCUM LOTEX, ' +
               '     (SELECT ' +
               '          COUNT(*) AS TOTDOCUM, ' +
               '          LP.NUMLOTE ' +
               '      FROM ' +
               '          DOCUMENTO D, ' +
               '          LOTEPAGTO LP, ' +
               '          LOTEXDOCUM LD ' +
               '      WHERE ' +
               '         (D.RECPAG = '''+RECPAG+''')  AND ' +
               '         (LD.CODDOCUMENTO = D.CODDOCUMENTO) AND' +
               '         (LP.NUMLOTE = LD.NUMLOTE) AND' +
               '         (LP.NUMLOTE in ('+slotelocal+')) ' +
               '      GROUP BY ' +
               '            LP.NUMLOTE) TOTDOCUM, ' +
               '     (SELECT ' +
               '          COUNT(*) AS TOTDOCUM , ' +
               '          LP.NUMLOTE ' +
               '      FROM ' +
               '          DOCUMENTO D, ' +
               '          LOTEPAGTO LP, ' +
               '          LOTEXDOCUM LD ' +
               '      WHERE ' +
               '          (D.RECPAG = '''+RECPAG+''') AND ' +
               '          (LD.CODDOCUMENTO = D.CODDOCUMENTO) AND ' +
               '         (LP.NUMLOTE = LD.NUMLOTE) AND' +
               '          (LP.NUMLOTE in ('+slotelocal+')) ' +
               '      GROUP BY ' +
               '           LP.NUMLOTE  ) TOTLOTE , ' +
               '     PORTADORFORMA ' +
               ' WHERE ' +
               '     (FLAGCANCEL IS NULL OR FLAGCANCEL = '' '') AND ' +
               '     (LOTEPAGTO.CODPORTFORMA = PORTADORFORMA.CODPORTFORMA) AND ' +
               '     (TOTLOTE.TOTDOCUM = TOTDOCUM.TOTDOCUM) AND ' +
               '     (TOTLOTE.NUMLOTE = TOTDOCUM.NUMLOTE) AND ' +
               '     (TOTLOTE.NUMLOTE = LOTEPAGTO.NUMLOTE) AND ' +
               '     (LOTEPAGTO.CODPORTFORMA = '+ FloatToStr(iCODPORTFORMA)+ ') AND ' +
               '     DOC.IDPESSOA = '+FloatToStr(idEmpresa)+' AND ' +
               '     DOC.RECPAG = '''+RECPAG+''' AND ' +
               '     LOTEPAGTO.NUMLOTE = LOTEX.NUMLOTE AND ' +
               '     LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO AND ' +
               '     ((LOTEX.FLGBAIXA  IN (''N'',''R''))  OR (LOTEX.FLGBAIXA IS NULL)) ' +
               ' GROUP BY LOTEPAGTO.NUMLOTE,PortadorForma.DESCRICAO, LOTEPAGTO.DATAEMISSAO, ' +
               '      LOTEPAGTO.FAVORECIDO, LOTEPAGTO.NUMCHQBORDERO, LOTEPAGTO.CODPORTFORMA, LOTEPAGTO.PLNCODIGO ';

         if bOPAutomatico then
         begin
            ExecSql('UPDATE LOTEPAGTO SET NUMSLIP = ''' + FloatToStr(LeUltRegistro(nil,'ORDEMPAGTO')) + ''' ' +
                   'WHERE NUMLOTE IN (' + slotelocal + ') AND ' +
                   'NUMSLIP IS NULL');
         end;

         if not BaixaDocumentos.ProcessaBaixaAutomatica(GetDataPacket(sqlLote), 0, //Paulo Nobre SOL 235849 PPM 459943
                DtEmis,
                TSistemaLancto(Trunc(IdModulo) - 3), bLancaBaixaFloat, Trunc(IdUsuario),
                Trunc(IdEmpresa), IdEspAcesso,
                Trunc(idPlano), UsaPlanoPatro, IntegraContab,
                bPartidaDobrada, RecPag) then
            Raise Exception.Create(BaixaDocumentos.MessageInfo);
         end;
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
  _Documento.OpenTransaction := False;
  _Financeiro.InitializeAs(self);
  _Financeiro.OpenTransaction := False;
  _CtrlChequeEmis.InitializeAs(self);
  _CtrlPeriodo.InitializeAs(self);
  _CtrlPeriodo.OpenTransaction := False;
  _CtrlHistoContab.InitializeAs(self);
  _CtrlHistoContab.OpenTransaction := False;
  _CtrlLancamento.InitializeAs(self);
  _CtrlLancamento.OpenTransaction := False;
  _ModeloHist.InitializeAs(self);
  BaixaDocumentos.InitializeAs(self);
  BaixaDocumentos.OpenTransaction := False;
  _Documento.OnMessageInfo := Nil;
  _Financeiro.OnMessageInfo := Nil;
  _CtrlChequeEmis.OnMessageInfo := Nil;
  _CtrlPeriodo.OnMessageInfo := Nil;
  _CtrlHistoContab.OnMessageInfo := Nil;
  _CtrlLancamento.OnMessageInfo := Nil;
  BaixaDocumentos.OnMessageInfo := Nil;
End;

End.

