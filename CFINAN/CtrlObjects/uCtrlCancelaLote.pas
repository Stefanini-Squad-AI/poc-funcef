unit uCtrlCancelaLote;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase,
     DbClient, Classes, uCmTypes, uCtrlImpostoRetido, uCtrlDocumento,
     uCMClientDataSet, uCtrlFinanc, uCtrlLancamento;

type

  TCtrlCancelaLote = class(TCmControlObject)
  Protected
    procedure AfterInitialize; Override;
  private
    _Documento     : TCtrlDocumento;
    _Financ        : TCtrlFinanc;
    _LancaContab   : TCtrlLancamento;
    _ImpostoRetido : TCtrlImpostoRetido;
  Public
    _CdsGrid      : TCMClientDataSet;
    _CdsLotePagto : TCMClientDataSet;
    constructor Create;  Override;
    destructor  Destroy; Override;
    function ListLotePagtoEmpty : OleVariant;
    function ListDadosGridEmpty : OleVariant;

    function Baixa_LotexPagto(iCodDocumento : Integer; sOperacao : String) : Boolean;

    function Baixa_LotePagto(sFLGEmissao, sNumLote, sIDProcesso : String;
                             iIDPessoa, iIDModulo, iIDUsuario, iPlanoContabil : Integer;
                             bUsaPlanoPatro, bIntegraContabil, bEstornaFinanc : Boolean) : Boolean;

    function Exclui_LotexPagto(sNumLote : String) : Boolean;
    function SelecionaDocumentos(iIDPessoa, iIDUsuario: Integer; sRecPag, sNumLote : String): OleVariant;
    function Regera_Lote : Boolean;
    function SelecionaLote(bPageGerados : Boolean; iIDPessoa, iIDUsuario: Integer; sRecPag, sDtINI, sDtFIM : String) : OleVariant;
    function Estorna_Lanca_Contab(iIDUsuario, iPlnCodigo,
                                 iIDModulo, iIDEmpresa : Integer;
                                 bUsaPlanoPatro : Boolean;
                                 sDataEstorno : String) : Boolean;

    function Exclui_Lanc(iIDUsuario, iPlnCodigo,
                         iIDModulo, iNumLan : Integer;
                         bUsaPlanoPatro, bExcluiPlanilha : Boolean) : Boolean;
    function Exclui_Contab_Emissao : Boolean;
    function Cancela_Lote(sIDProcesso : String;
                          iIDPessoa, iIDModulo, iIDUsuario, iPlanoContabil : Integer;
                          bUsaPlanoPatro, bIntegraContabil,
                          bEstornaFinanc, bEstornaContab : Boolean) : Boolean;

end;

implementation

{ TCtrlCancelaLote }

procedure TCtrlCancelaLote.AfterInitialize;
begin
  inherited;
  _Documento.InitializeAs(Self);
  _ImpostoRetido.InitializeAs(Self);
  _ImpostoRetido.OpenTransaction := False;
end;

function TCtrlCancelaLote.Baixa_LotePagto(sFLGEmissao, sNumLote, sIDProcesso : String;
                                          iIDPessoa, iIDModulo, iIDUsuario, iPlanoContabil : Integer;
                                          bUsaPlanoPatro, bIntegraContabil, bEstornaFinanc : Boolean) : Boolean;
var iCodigoFinanc : Double;
begin
  try
    _Financ := TCtrlFinanc.Create(iIDPessoa, iIDModulo, iIDUsuario, bUsaPlanoPatro);
    _Financ.InitializeAs(self);
    _Financ.OpenTransaction := False;
    if sFLGEMISSAO = '1' then
    begin
      if not ExecSQL('UPDATE LOTEPAGTO SET FLAGCANCEL = ''C'', ' +
                     'CODLANCFINANC = NULL, PLNCODIGO = NULL   ' +
                     'WHERE NUMLOTE = ' + sNumLote) then
      begin
        MessageInfo := 'Erro ao atualizar o Lote como Baixado';
        Raise Exception.Create(MessageInfo);
      end
    end
    else
    begin
      if not ExecSQL('DELETE LOTEPAGTO WHERE NUMLOTE = ' + sNumLote) then
      begin
        MessageInfo := 'Erro ao excluir o Lote';
        Raise Exception.Create(MessageInfo);
      end;
    end;

    if not ExecSQL('UPDATE DOCUMENTO SET NUMSLIP = NULL WHERE CODDOCUMENTO ' +
                   'IN (SELECT CODDOCUMENTO FROM LOTEXDOCUM WHERE NUMLOTE = ' + sNumLote + ' )') then
    begin
      MessageInfo := 'Erro ao atualizar o NUMSLIP do Documento Emitido';
      Raise Exception.Create(MessageInfo);
    end;

    if trim(sIDProcesso) <> '' then
      if not ExecSQL('UPDATE RADINSTPROCESSO SET FLGOK = ''R'' WHERE (IDPROCESSO = ' + sIDPROCESSO + ')') then
      begin
        MessageInfo := 'Erro ao atualizar processo referente ao Lote no RAD';
        Raise Exception.Create(MessageInfo);
      end;
    _cdsGrid.First;

    iCodigoFinanc := _cdsGrid.FieldByname('CODLANCFINANC').AsInteger;
    if (not _cdsGrid.FieldByname('CODLANCFINANC').IsNull) then
    begin
      if bEstornaFinanc then
        _Financ.EstornoFinanceiro(Date,0, True, iCodigoFinanc,
                                  iIDPessoa, iIDModulo, iIDUsuario, iPlanoContabil,
                                  bIntegraContabil)
      else
        _Financ.ExcluiFinanceiro(iCodigoFinanc);

      if _cdsGrid.FieldByname('CODLANCFINANC').AsInteger = - 1 then
      begin
        MessageInfo := 'Erro ao cancelar\estornar Lançamento no Financeiro';
        Raise Exception.Create(MessageInfo);
      end;
    end;
    Result := True;
    _Financ.Free;
  except
    on E:Exception do
    begin
      Result := False;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlCancelaLote.Baixa_LotexPagto(iCodDocumento : Integer; sOperacao : String) : Boolean;
begin
  try
    if not ExecSQL('UPDATE DOCUMENTO SET EMISBLOQ = NULL WHERE CODDOCUMENTO = ' +
                   IntToStr(iCodDocumento)) then
      Raise Exception.Create(MessageInfo);

    if not ExecSQL('UPDATE LOTEXDOCUM SET FLGBAIXA= ''C'' WHERE CODDOCUMENTO = '  +
                   IntToStr(iCodDocumento)) then
      Raise Exception.Create(MessageInfo);
    if sOPERACAO = '10' then
      _Documento.EmiteLancaBaixa(iCodDocumento, False);
    Result := True;
  except
    on E:Exception do
    begin
      Result := False;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlCancelaLote.Cancela_Lote(sIDProcesso : String;
                                       iIDPessoa, iIDModulo, iIDUsuario, iPlanoContabil : Integer;
                                       bUsaPlanoPatro, bIntegraContabil,
                                       bEstornaFinanc, bEstornaContab : Boolean) : Boolean;

begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.Cancela_Lote(sIDProcesso,
                                                iIDPessoa, iIDModulo, iIDUsuario, iPlanoContabil,
                                                bUsaPlanoPatro, bIntegraContabil,
                                                bEstornaFinanc, bEstornaContab);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      if _cdsGrid.FieldByName('NUMLOTE').AsString = '' then
      begin
        MessageInfo := 'Erro: numero do lote em branco';
        Raise Exception.Create(MessageInfo);
      end;
      _cdsGrid.First;
      while not _cdsGrid.EOF do
      begin
        if _cdsGrid.FieldByName('FLAGEMISSAO').AsString =  '1' then
          Baixa_LotexPagto(_cdsGrid.FieldByName('CODDOCUMENTO').AsInteger,
                           _cdsGrid.FieldByName('OPERACAO').AsString)
        else
          Exclui_LotexPagto(_cdsGrid.FieldByName('NUMLOTE').AsString);

        _ImpostoRetido.CodDocumento    := _cdsGrid.FieldByName('CODDOCUMENTO').AsInteger;
        _ImpostoRetido.NumLancto       := 0;
        _ImpostoRetido.NumLanctoOrigem := 0;
        _ImpostoRetido.TipoExclusao    := teSoBaixa;
        _ImpostoRetido.NumLote         := _cdsGrid.FieldByName('NUMLOTE').AsFloat;
        _ImpostoRetido.NumLoteManual   := 0;
        _ImpostoRetido.Excluir;
        _cdsGrid.Next;
      end;
// -----------------------------------------------------------------------------
      _cdsGrid.First;
      if not Baixa_LotePagto(_cdsGrid.FieldByName('FLAGEMISSAO').AsString,
                             _cdsGrid.FieldByName('NUMLOTE').AsString,
                             sIDProcesso,
                             iIDPessoa,
                             iIDModulo,
                             iIDUsuario,
                             iPlanoContabil,
                             bUsaPlanoPatro,
                             bIntegraContabil,
                             bEstornaFinanc) then
        Raise Exception.Create(MessageInfo);

// -----------------------------------------------------------------------------
      if not _cdsLotePagto.FieldByName('PLNCODIGO').isNull then
      begin
        if bEstornaContab then
        begin
          if not Estorna_Lanca_Contab(iIDUsuario,
                                      _cdsLotePagto.FieldByName('PLNCODIGO').AsInteger,
                                      iIDModulo,
                                      iIDPessoa,
                                      bUsaPlanoPatro,
                                      DateToStr(Date)) then
            Raise Exception.Create(MessageInfo);
        end
        else
        begin
          if not Exclui_Lanc(iIDUsuario,
                             _cdsLotePagto.FieldByName('PLNCODIGO').AsInteger,
                             iIDModulo,
                             0,
                             bUsaPlanoPatro, True) then
            Raise Exception.Create(MessageInfo);
        end;
      end;
// -----------------------------------------------------------------------------
      Commit;
      Result := True;
    except
      on E:Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

constructor TCtrlCancelaLote.Create;
begin
  inherited;
  _Documento     := TCtrlDocumento.Create;
  _CdsGrid       := TCMClientDataSet.Create(nil);
  _CdsLotePagto  := TCMClientDataSet.Create(nil);
  _LancaContab   := TCtrlLancamento.Create;
  _ImpostoRetido := TCtrlImpostoRetido.Create;
end;

destructor TCtrlCancelaLote.Destroy;
begin
  inherited;
  _Documento.Free;
  _CdsGrid.Free;
  _CdsLotePagto.Free;
  _LancaContab.Free;
  _ImpostoRetido.Free;
end;

function TCtrlCancelaLote.Estorna_Lanca_Contab(iIDUsuario, iPlnCodigo,
                                              iIDModulo, iIDEmpresa : Integer;
                                              bUsaPlanoPatro : Boolean;
                                              sDataEstorno : String) : Boolean;
begin
  try
    _LancaContab.EstornaLancaContab(iIDUsuario, iPlnCodigo, iIDModulo, iIDEmpresa,
                                    bUsaPlanoPatro, sDataEstorno);
    Result := True;
  except
    on E:Exception do
    begin
      Result := False;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlCancelaLote.Exclui_Contab_Emissao: Boolean;
begin
   Result := False;
end;

function TCtrlCancelaLote.Exclui_Lanc(iIDUsuario, iPlnCodigo, iIDModulo,
  iNumLan: Integer; bUsaPlanoPatro, bExcluiPlanilha: Boolean): Boolean;
begin
  try
    _LancaContab.ExcluiLancaContab(iIDUsuario, iPlnCodigo, iIDModulo, iNumLan,
                                   bUsaPlanoPatro, bExcluiPlanilha);
    Result := True;
  except
    on E:Exception do
    begin
      Result := False;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlCancelaLote.Exclui_LotexPagto(sNumLote: String): Boolean;
begin
  try
    if not ExecSQL('UPDATE DOCUMENTO SET EMISBLOQ = NULL WHERE CODDOCUMENTO = ' +
                   _cdsGrid.FieldByName('CODDOCUMENTO').AsString) then
      Raise Exception.Create(MessageInfo);

    if not ExecSQL('DELETE LOTEXDOCUM WHERE CODDOCUMENTO = '  +
                   _cdsGrid.FieldByName('CODDOCUMENTO').AsString +
                   ' AND NUMLOTE = ' + sNumLote) then
      Raise Exception.Create(MessageInfo);
    Result := True;
  except
    on E:Exception do
    begin
      Result := False;
      MessageInfo := E.Message;
    end;
  end;
end;



function TCtrlCancelaLote.ListDadosGridEmpty: OleVariant;
var LstSQL : TStrings;
begin
  LstSQL := TStringList.Create;
  with LstSQL do
  begin
    Append('SELECT                                     ');
    Append('  P.NOME,                                  ');
    Append('  D.DATAPROGRAMADA,                        ');
    Append('  D.IDPESSOA,                              ');
    Append('  D.DATAVENCTO,                            ');
    Append('  D.NODOCUMENTO,                           ');
    Append('  D.COMPLDOCUMENTO,                        ');
    Append('  D.CODDOCUMENTO,                          ');
    Append('  D.OPERACAO,                              ');
    Append('  D.PLANO, D.PLACONTA, D.CODCENTROCUSTO,   ');
    Append('  LP.FLAGEMISSAO, LP.CODLANCFINANC,        ');
    Append('  LD.VALOR,                                ');
    Append('  LD.NUMLOTE,                              ');
    Append('  LD.FLGBAIXA,                             ');
    Append('  L.NUMLANCTO                              ');
    Append('FROM                                       ');
    Append('  DOCUMENTO D, PESSOA P, LOTEXDOCUM LD, LOTEPAGTO LP, LANCTODOCUM L ');
    Append('WHERE  1=2');
  end;
  Result := GetDataPacket(LstSQL);
  LstSQL.Free;
end;

function TCtrlCancelaLote.ListLotePagtoEmpty : OleVariant;
var sSQL : String;
begin
  sSQL := 'SELECT ' +
          '  LP.NUMLOTE, LP.CODLANCFINANC, ' +
          '  LP.IDUSUARIOINCLUSAO, LP.DATAEMISSAO, ' +
          '  LP.NUMCHQBORDERO, LP.FAVORECIDO, ' +
          '  LP.FLAGEMISSAO, LP.CODPORTFORMA, LP.FLAGCANCEL, ' +
          '  LP.IDPESSOA, LP.OBSERVACAO, LP.PLNCODIGO, LP.IDPROCESSO ' +
          'FROM ' +
          '  LOTEPAGTO LP ' +
          'WHERE ' +
          '  1=2 ';
  Result := GetDataPacket(sSQL);
end;

function TCtrlCancelaLote.Regera_Lote : Boolean;
var iNumSeqLote : Integer;
    LstSQL      : TStrings;
    Decimal     : Char;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.Regera_Lote;
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      if not ExecSQL('UPDATE LOTEPAGTO SET FLAGCANCEL = ''R'', PLNCODIGO = NULL WHERE NUMLOTE = ' +
             _cdsLotePagto.FieldByName('NUMLOTE').AsString) then
        Raise Exception.Create(MessageInfo);

      iNumSeqLote:= GetSequence('LOTEPAGTO');
      LstSQL := TStringList.Create;
      with LstSQL do
      begin
        Append('INSERT INTO                      ');
        Append('LOTEPAGTO (NUMLOTE,              ');
        Append('           CODLANCFINANC,        ');
        Append('           IDUSUARIOINCLUSAO,    ');
        Append('           CODPORTFORMA,         ');
        Append('           DATAEMISSAO,          ');
        Append('           NUMCHQBORDERO,        ');
        Append('           FAVORECIDO,           ');
        Append('           FLAGCANCEL,           ');
        Append('           OBSERVACAO,           ');
        Append('           IDPESSOA)             ');
        Append('Values( ' + FloatToStr(iNumSeqLote) + ', Null, ');
        Append(           IntToStr(_cdsLotePagto.FieldByName('IDUSUARIOINCLUSAO').AsInteger) + ', ');
        Append(           IntToStr(_cdsLotePagto.FieldByName('CODPORTFORMA').AsInteger) + ', ');
        Append(           'TO_DATE(' +  QuotedStr(_cdsLotePagto.FieldByName('DATAEMISSAO').AsString) + ',''DD/MM/YYYY''), ');
        Append(           QuotedStr(_cdsLotePagto.FieldByName('NUMCHQBORDERO').AsString) + ', ');
        Append(           QuotedStr(_cdsLotePagto.FieldByName('FAVORECIDO').AsString) + ', Null, ');
        Append(           QuotedStr(_cdsLotePagto.FieldByName('OBSERVACAO').AsString) + ', ');
        Append(           QuotedStr(_cdsLotePagto.FieldByName('IDPESSOA').AsString) + ')');
      end;
      if not ExecSQL(LstSQL.Text) then
        raise Exception.Create(MessageInfo);
      LstSQL.Free;

      _cdsGrid.First;
      while not _cdsGrid.Eof do
      begin
        Decimal := DecimalSeparator;
        DecimalSeparator := '.';
        if not ExecSQL('INSERT INTO LOTEXDOCUM(NUMLOTE,CODDOCUMENTO,VALOR) Values(' +
                       FloatToStr(iNumSeqLote) + ',' +
                       _cdsGrid.FieldByName('CODDOCUMENTO').AsString + ', ' +
                       _cdsGrid.FieldByName('VALOR').AsString + ')') then
          raise Exception.Create(MessageInfo);

        DecimalSeparator := Decimal;

        if not ExecSQL('UPDATE DOCUMENTO SET EMISBLOQ = NULL WHERE CODDOCUMENTO = ' +
                       _cdsGrid.FieldByName('CODDOCUMENTO').AsString) then
          raise Exception.Create(MessageInfo);
        _cdsGrid.Next;
      end;
      Commit;
      Result := True;
    except
      on E:Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlCancelaLote.SelecionaDocumentos(iIDPessoa, iIDUsuario: Integer; sRecPag, sNumLote : String ): OleVariant;
var LstSQL : TStrings;
begin
  LstSQL := TStringList.Create;
  with LstSQL do
  begin
    Append('SELECT                                            ');
    Append('  P.NOME,                                         ');
    Append('  D.DATAPROGRAMADA,                               ');
    Append('  D.IDPESSOA,                                     ');
    Append('  D.DATAVENCTO,                                   ');
    Append('  D.NoDOCUMENTO,                                  ');
    Append('  D.COMPLDOCUMENTO,                               ');
    Append('  D.CODDOCUMENTO,                                 ');
    Append('  D.OPERACAO,                                     ');
    Append('  D.PLANO, D.PLACONTA, D.CODCENTROCUSTO,          ');
    Append('  LP.FLAGEMISSAO, LP.CODLANCFINANC,               ');
    Append('  LT.VALOR,                                       ');
    Append('  LT.NUMLOTE,                                     ');
    Append('  LT.FLGBAIXA,                                    ');
    Append('  L.NUMLANCTO                                     ');
    Append('FROM                                              ');
    Append('  DOCUMENTO D, PESSOA P, LOTEXDOCUM LT, LOTEPAGTO LP, LANCTODOCUM L ');
    Append('WHERE                                             ');
    Append('  (D.IDPESSOA = ' + InttoStr(iIDPessoa) + ') AND ');
    Append('  (D.RECPAG = ' + QuotedStr(sRecPag) + ') AND     ');
    Append('   D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG = ' + QuotedStr(sRecPag));
    Append(    ' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + QuotedStr(sRecPag) + ' and b.idusuario=');
    Append(      InttoStr(iIDUsuario)+ ') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = ');
    Append(      QuotedStr(sRecPag) + '  and exists (select 1 from UsuarioxTpdocto b where recpag='+ QuotedStr(sRecPag) +' and a.codtipdoc=b.codtipdoc and b.idusuario=');
    Append(      InttoStr(iIDUsuario)+ ')) and                ');
    Append('  (LT.NUMLOTE = ' + sNumLote + ')  AND            ');
    Append('  ((LT.FLGBAIXA  IS NULL) OR (LT.FLGBAIXA <> ''B'')) AND ');
    Append('  (LP.NUMLOTE = LT.NUMLOTE) AND                   ');
    Append('  (D.IDFORCLI = P.IDPESSOA) AND                   ');
    Append('  (L.CODDOCUMENTO = D.CODDOCUMENTO) AND           ');
    Append('  (L.OPERACAO = D.OPERACAO) AND                   ');
    Append('  (L.ESTORNO IS NULL) AND                         ');
    Append('  (LT.CODDOCUMENTO = D.CODDOCUMENTO)              ');
  end;
  Result := GetDataPacket(LstSQL);
  LstSQL.Free;
end;

function TCtrlCancelaLote.SelecionaLote(bPageGerados : Boolean; iIDPessoa, iIDUsuario: Integer; sRecPag, sDtINI, sDtFIM : String) : OleVariant;
var sSQL : String;
    LstSQL : TStrings;
begin
  LstSQL := TStringList.Create;
  if bPageGerados then
    sSQL := ' (LP.FLAGCANCEL = '' '' OR RTRIM(LP.FLAGCANCEL) IS NULL ) AND '
  else
    sSQL := ' (LP.FLAGCANCEL = ''C'') AND ';

  if (sDtINI <> '') and (sDtFIM <> '') then
    sSQL := sSQL + ' (LP.DATAEMISSAO BETWEEN TO_DATE(' + QuotedStr(sDtINI) + ',''DD/MM/YYYY'')  AND  TO_DATE(' + QuotedStr(sDtFIM) + ',''DD/MM/YYYY'')) AND ';

  with LstSQL do
  begin
    Append('SELECT DISTINCT                                                     ');
    Append('  LP.NUMLOTE, LP.CODLANCFINANC,                                     ');
    Append('  LP.IDUSUARIOINCLUSAO, LP.DATAEMISSAO,                             ');
    Append('  LP.NUMCHQBORDERO, LP.FAVORECIDO,                                  ');
    Append('  LP.FLAGEMISSAO, LP.CODPORTFORMA, LP.FLAGCANCEL,                   ');
    Append('  LP.IDPESSOA, LP.OBSERVACAO, LP.PLNCODIGO, LP.IDPROCESSO           ');
    Append('FROM LOTEPAGTO LP, LOTEXDOCUM LT, DOCUMENTO D,                      ');
    Append('  (SELECT count(*) AS TOTDOCUM , LP.NUMLOTE                         ');
    Append('   FROM LOTEPAGTO LP, LOTEXDOCUM LD, DOCUMENTO D                    ');
    Append('   WHERE D.RECPAG = ' + QuotedStr(sRecPag) + ' AND ' + sSQL          );
    Append('         LP.NUMLOTE = LD.NUMLOTE AND                                ');
    Append('       ((LD.FLGBAIXA IS NULL) OR (LD.FLGBAIXA <> ''B'')) AND        ');
    Append('         LD.CODDOCUMENTO = D.CODDOCUMENTO                           ');
    Append('   GROUP BY LP.NUMLOTE) TOTDOCUM,                                   ');
    Append('  (SELECT count(*) AS TOTDOCUM, LP.NUMLOTE                          ');
    Append('   FROM LOTEPAGTO LP, LOTEXDOCUM LD, DOCUMENTO D                    ');
    Append('   WHERE D.RECPAG = ' + QuotedStr(sRecPag) + ' AND ' + sSQL          );
    Append('         LP.NUMLOTE = LD.NUMLOTE AND                                ');
    Append('       ((LD.FLGBAIXA IS NULL) OR (LD.FLGBAIXA <> ''B'')) AND        ');
    Append('         LD.CODDOCUMENTO = D.CODDOCUMENTO  AND                      ');
    Append('         D.CODTIPDOC in (SELECT CODTIPDOC                           ');
    Append('                         FROM TIPODOCRECPAG TD                      ');
    Append('                         WHERE TD.RECPAG = ' + QuotedStr(sRecPag)    );
    Append('                               AND NOT EXISTS                       ');
    Append('                              (SELECT 1 FROM USUARIOxTPDOCTO B      ');
    Append('                               WHERE RECPAG = ' + QuotedStr(sRecPag) );
    Append('                                     AND B.IDUSUARIO =              ');
    Append(                                      IntToStr(iIDUsuario) + ')'      );
    Append('                         UNION                                      ');
    Append('                         SELECT CODTIPDOC FROM TIPODOCRECPAG A      ');
    Append('                         WHERE A.RECPAG = ' + QuotedStr(sRecPag)     );
    Append('                               AND EXISTS                           ');
    Append('                              (SELECT 1 FROM USUARIOxTPDOCTO B      ');
    Append('                               WHERE RECPAG = ' + QuotedStr(sRecPag) );
    Append('                               AND A.CODTIPDOC = B.CODTIPDOC        ');
    Append('                               AND B.IDUSUARIO =                    ');
    Append(                                IntToStr(iIDUsuario)+'))             ');
    Append('   GROUP BY LP.NUMLOTE) TOTLOTE                                     ');
    Append('WHERE ' + sSQL                                                       );
    Append('  TOTLOTE.TOTDOCUM = TOTDOCUM.TOTDOCUM AND                          ');
    Append('  TOTLOTE.NUMLOTE = TOTDOCUM.NUMLOTE AND                            ');
    Append('  TOTLOTE.NUMLOTE = LP.NUMLOTE AND                                  ');
    Append('  LP.IDPESSOA = ' + InttoStr(iIDPessoa) + ' AND                     ');
    Append('  D.RECPAG = ' + QuotedStr(sRecPag) + ' AND                         ');
    Append('  ((LT.FLGBAIXA IS NULL) OR (LT.FLGBAIXA <> ''B'')) AND             ');
    Append('  LP.NUMLOTE = LT.NUMLOTE AND                                       ');
    Append('  LT.CODDOCUMENTO = D.CODDOCUMENTO                                  ');
  end;
  Result := GetDataPacket(LstSQL);
  LstSQL.Free;
end;

end.
