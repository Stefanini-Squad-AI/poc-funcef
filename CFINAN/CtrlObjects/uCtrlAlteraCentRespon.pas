unit uCtrlAlteraCentRespon;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMTypes,
     Classes, uString;

type
  TRateioFinanc = Record
    IdRateioFinanc  :Longint;
    IdPessoa        :Longint;
    CodLancFinanc   :Longint;
    Unidnegoc       :Longint;
    Codtiprecdes    :String;
    Recpag          :String;
    Codcentrorespon :String;
    Moecodigo       :Longint;
    Valor           :Double;
    Valoroutramoeda :Double;
End;

type
  TCtrlAlteraCentRespon = class(TCmControlObject)
  Protected
//     procedure DoChangeDataBase; Override;
//     procedure OnCreateAppServer;override;
  private
    _CdsRateioFinancLote : TClientDataSet;
    _CdsLotexDocum       : TClientDataSet;
    _CdsRecbToPagto      : TClientDataSet;
    _CdsValLancDoc       : TClientDataSet;
    _CdsRateioFinancRecb : TClientDataSet;
    _CdsAlteraRateios    : TClientDataSet;
  Public
    constructor Create;  Override;
    destructor  Destroy; Override;
    function GravaAlteraCentRespon(iIDEmpresa : Integer;
                                   sTipoDesemb, sCROrigem, sCRDestino : String;
                                   ovRateios : OleVariant) : Boolean;
End;

implementation

{ TCtrlAlteraCentRespon }

constructor TCtrlAlteraCentRespon.Create;
begin
  inherited;
  _CdsLotexDocum       := TClientDataSet.Create(nil);
  _CdsRecbToPagto      := TClientDataSet.Create(nil);
  _CdsValLancDoc       := TClientDataSet.Create(nil);
  _CdsRateioFinancLote := TClientDataSet.Create(nil);
  _CdsRateioFinancRecb := TClientDataSet.Create(nil);
  _CdsAlteraRateios    := TClientDataSet.Create(nil);
end;

destructor TCtrlAlteraCentRespon.Destroy;
begin
  inherited;
  _CdsLotexDocum.Free;
  _CdsRecbToPagto.Free;
  _CdsValLancDoc.Free;
  _CdsRateioFinancLote.Free;
  _CdsRateioFinancRecb.Free;
  _CdsAlteraRateios.Free;
end;

function TCtrlAlteraCentRespon.GravaAlteraCentRespon(iIDEmpresa : Integer;
                                                     sTipoDesemb, sCROrigem, sCRDestino : String;
                                                     ovRateios : OleVariant) : Boolean;
var
  RateioFinanc : TRateioFinanc;
  BmMarcaRateioFinancLote,
  BmMarcaRateios,
  BmMarcaRateioFinancRecb : TBookMark;
  sSql : String;
  LstSQL : TStrings;
begin
  inherited;
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravaAlteraCentRespon(iIDEmpresa,
                                   sTipoDesemb, sCROrigem, sCRDestino, ovRateios);
    If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
        _Cds.Data := ovRateios;
        StartTransaction;
        sSql := 'SELECT ' +
                '  L.CODLANCFINANC, LX.VALOR ' +
                'FROM ' +
                '  LOTEPAGTO L, LOTEXDOCUM LX ' +
                'WHERE ' +
                '  (LX.CODDOCUMENTO = ' + _Cds.FieldByName('CODDOCUMENTO').AsString + ') AND ' +
                '  ((L.FLAGCANCEL IS NULL) OR (L.FLAGCANCEL <> ''C'')) AND ' +
                '  (L.CODLANCFINANC IS NOT NULL)                       AND ' +
                '  (LX.NUMLOTE = L.NUMLOTE)                                ';
        _CdsLotexDocum.Data := GetDataPacket(sSQL);

        sSql := 'SELECT ' +
                '  R.CODLANCFINANC, L.VALOR ' +
                'FROM ' +
                ' RECBTOPAGTO R, LANCTODOCUM L ' +
                'WHERE ' +
                '  (R.CODDOCUMENTO = ' + _Cds.FieldByName('CODDOCUMENTO').AsString + ')  AND ' +
                '  (R.CODLANCFINANC IS NOT NULL) AND  ' +
                '  (L.CODDOCUMENTO = R.CODDOCUMENTO) AND ' +
                '  (L.OPERACAO = ''5'') AND ' +
                '  (L.ESTORNO IS NULL)';
        _CdsRecbToPagto.Data := GetDataPacket(sSQL);

        sSQL := 'SELECT ' +
                '  L.VALOR ' +
                'FROM ' +
                '  LANCTODOCUM L, DOCUMENTO D ' +
                'WHERE ' +
                '  (L.CODDOCUMENTO = ' + _Cds.FieldByName('CODDOCUMENTO').AsString + ') AND ' +
                '  (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ' +
                '  (D.OPERACAO = L.OPERACAO) AND ' +
                '  (L.ESTORNO IS NULL)';
        _CdsValLancDoc.Data := GetDataPacket(sSQL);
      // -----------------------------------------------------------------------------

        if sTipoDesemb = '' then
          raise Exception.Create('Tipo de Desembolso não indicado');
        if sCROrigem = '' then
          raise Exception.Create('Centro de responsabilidade de origem não informado');
        if sCRDestino = '' then
          raise Exception.Create('Centro de responsabilidade de destino não informado');
        if _Cds.IsEmpty then
          raise Exception.Create('Documento não informado');

        if not _Cds.Locate('CODCENTRORESPON;CODTIPRECDES',
                           VarArrayOf([sCROrigem,sTipoDesemb]),[]) then
          raise Exception.Create('Registro não consta no rateio');

        _Cds.First;
        while not _Cds.EOF do
        begin
          _CdsLotexDocum.First;
      // -----------------------------------------------------------------------------
          while not _CdsLotexDocum.EOF do
          begin
            sSQL := 'SELECT ' +
                    '   IDPESSOA, ' +
                    '    CODLANCFINANC, ' +
                    '    UNIDNEGOC, ' +
                    '    CODTIPRECDES, ' +
                    '    RECPAG, ' +
                    '    CODCENTRORESPON, ' +
                    '   MOECODIGO, ' +
                    '    VALOR, ' +
                    '    VALOROUTRAMOEDA, ' +
                    '    IDRATEIOFINANC ' +
                    'FROM ' +
                    '   RATEIOFINANC ' +
                    'WHERE ' +
                    '   (CODLANCFINANC = ' + _CdsLotexDocum.FieldByName('CODLANCFINANC').AsString + ')';
            _CdsRateioFinancLote.Data := GetDataPacket(sSQL);

            while not _CdsRateioFinancLote.EOF do
            begin
              with RateioFinanc do
              begin
                BmMarcaRateioFinancLote := _CdsRateioFinancLote.GetBookMark;

                if (Trim(_CdsRateioFinancLote.FieldByName('CODCENTRORESPON').AsString) = Trim(sCROrigem)) and
                   (Trim(_CdsRateioFinancLote.FieldByName('CODTIPRECDES').AsString) = Trim(sTipoDesemb)) then
                begin
                  IdPessoa        := _CdsRateioFinancLote.FieldByName('IDPESSOA').AsInteger;
                  CodLancFinanc   := _CdsRateioFinancLote.FieldByName('CODLANCFINANC').AsInteger;
                  Unidnegoc       := _CdsRateioFinancLote.FieldByName('UNIDNEGOC').AsInteger;
                  Codtiprecdes    := _CdsRateioFinancLote.FieldByName('CODTIPRECDES').AsString;
                  Recpag          := _CdsRateioFinancLote.FieldByName('RECPAG').AsString;
                  Codcentrorespon := _CdsRateioFinancLote.FieldByName('CODCENTRORESPON').AsString;
                  Moecodigo       := _CdsRateioFinancLote.FieldByName('MOECODIGO').AsInteger;
                  Valor           := _CdsRateioFinancLote.FieldByName('VALOR').AsFloat;
                  Valoroutramoeda := _CdsRateioFinancLote.FieldByName('VALOROUTRAMOEDA').AsFloat;
                  IdRateioFinanc  := _CdsRateioFinancLote.FieldByName('IDRATEIOFINANC').AsInteger;
                  _CdsRateioFinancLote.GotoBookMark(BmMarcaRateioFinancLote);
                  _CdsRateioFinancLote.FreeBooKMark(BmMarcaRateioFinancLote);

                  _CdsRateioFinancLote.Edit;
                  _CdsRateioFinancLote.FieldByName('CODCENTRORESPON').AsString := sCRDestino;
                  _CdsRateioFinancLote.Post;

                  DecimalSeparator := '.';
                  if not ExecSQL('UPDATE ' +
                                 '  RATEIOFINANC ' +
                                 'SET ' +
                                 '  VALOR = ' + _CdsRateioFinancLote.FieldByName('VALOR').AsString +
                                 ', CODCENTRORESPON = ' + QuotedStr(sCRDestino) +
                                 'WHERE ' +
                                 '  IDRATEIOFINANC = ' + _CdsRateioFinancLote.FieldByName('IDRATEIOFINANC').AsString) then
                    raise Exception.Create(MessageInfo);
                  DecimalSeparator := ',';
                end;
              end;
              _CdsRateioFinancLote.Next;
            end;
            _CdsLotexDocum.Next;
          end;
      // -----------------------------------------------------------------------------
          _CdsRecbToPagto.First;
          while not _CdsRecbToPagto.EOF do
          begin
            if _CdsRateioFinancRecb.Active then _CdsRateioFinancRecb.Close;
            sSql := 'SELECT ' +
                    '   IDPESSOA, CODLANCFINANC, UNIDNEGOC, CODTIPRECDES, RECPAG, CODCENTRORESPON, ' +
                    '   MOECODIGO, VALOR, VALOROUTRAMOEDA, IDRATEIOFINANC ' +
                    'FROM ' +
                    '   RATEIOFINANC ' +
                    'WHERE ' +
                    '   (CODLANCFINANC = ' + _CdsRecbToPagto.FieldByName('CODLANCFINANC').AsString + ')';
            _CdsRateioFinancRecb.Data := GetDataPacket(sSQL);
            while not _CdsRateioFinancRecb.EOF do
            begin
              with RateioFinanc do
              begin
                BmMarcaRateioFinancRecb := _CdsRateioFinancRecb.GetBookMark;
                if (Trim(_CdsRateioFinancRecb.FieldByName('CODCENTRORESPON').AsString) = Trim(sCROrigem)) and
                   (Trim(_CdsRateioFinancRecb.FieldByName('CODTIPRECDES').AsString) = Trim(sTipoDesemb)) then
                begin
                  IdPessoa        := _CdsRateioFinancRecb.FieldByName('IDPESSOA').AsInteger;
                  CodLancFinanc   := _CdsRateioFinancRecb.FieldByName('ICODLANCFINANC').AsInteger;
                  Unidnegoc       := _CdsRateioFinancRecb.FieldByName('IUNIDNEGOC').AsInteger;
                  Codtiprecdes    := _CdsRateioFinancRecb.FieldByName('ICODTIPRECDES').AsString;
                  Recpag          := _CdsRateioFinancRecb.FieldByName('IRECPAG').AsString;
                  Codcentrorespon := _CdsRateioFinancRecb.FieldByName('ICODCENTRORESPON').AsString;
                  Moecodigo       := _CdsRateioFinancRecb.FieldByName('IMOECODIGO').AsInteger;
                  Valor           := _CdsRateioFinancRecb.FieldByName('IVALOR').AsFloat;
                  Valoroutramoeda := _CdsRateioFinancRecb.FieldByName('IVALOROUTRAMOEDA').AsFloat;
                  IdRateioFinanc  := _CdsRateioFinancRecb.FieldByName('IIDRATEIOFINANC').AsInteger;
                  _CdsRateioFinancRecb.GotoBookMark(BmMarcaRateioFinancRecb);
                  _CdsRateioFinancRecb.FreeBookMark(BmMarcaRateioFinancRecb);
                  _CdsRateioFinancRecb.Edit;
                  _CdsRateioFinancRecb.FieldByName('CODCENTRORESPON').AsString := sCRDestino;
                  _CdsRateioFinancRecb.Post;

                  DecimalSeparator := '.';
                  if not ExecSQL('UPDATE ' +
                                 '  RATEIOFINANC ' +
                                 'SET ' +
                                 '  VALOR = ' + _CdsRateioFinancRecb.FieldByName('VALOR').AsString +
                                 ', CODCENTRORESPON = ' + QuotedStr(_CdsRateioFinancRecb.FieldByName('CODCENTRORESPON').AsString) +
                                 'WHERE ' +
                                 '  IDRATEIOFINANC = ' + _CdsRateioFinancRecb.FieldByName('IDRATEIOFINANC').AsString) then
                    raise Exception.Create(MessageInfo);
                  DecimalSeparator := ',';
                end;
              end;
              _CdsRateioFinancRecb.Next;
            end;
            _CdsRecbToPagto.Next;
          end;
      // -----------------------------------------------------------------------------
          LstSQL := TStringList.Create;
          with LstSQL do
          begin
            Clear;
            Append('SELECT                                                            ');
            Append('  CODDOCUMENTO,                                                   ');
            Append('  CODTIPRECDES,                                                   ');
            Append('  RECPAG,                                                         ');
            Append('  IDPESSOA,                                                       ');
            Append('  CODCENTRORESPON,                                                ');
            Append('  UNIDNEGOC,                                                      ');
            Append('  MOECODIGO,                                                      ');
            Append('  VALOR,                                                          ');
            Append('  VALOROUTRAMOEDA,                                                ');
            Append('  IDUSUARIOINCLUSAO,                                              ');
            Append('  IDRATEIODOCUM                                                   ');
            Append('FROM                                                              ');
            Append('  RATEIODOCUM                                                     ');
            Append('WHERE                                                             ');
            Append('  (CODDOCUMENTO = ' + _Cds.FieldByName('CODDOCUMENTO').AsString + ') AND');
            Append('  (IDPESSOA     = ' + IntToStr(iIDEmpresa) + ')                   ');
            Append('UNION                                                             ');
            Append('SELECT                                                            ');
            Append('  R.CODDOCUMENTO,                                                 ');
            Append('  R.CODTIPRECDES,                                                 ');
            Append('  R.RECPAG,                                                       ');
            Append('  R.IDPESSOA,                                                     ');
            Append('  R.CODCENTRORESPON,                                              ');
            Append('  R.UNIDNEGOC,                                                    ');
            Append('  R.MOECODIGO,                                                    ');
            Append('  R.VALOR,                                                        ');
            Append('  R.VALOROUTRAMOEDA,                                              ');
            Append('  R.IDUSUARIOINCLUSAO,                                            ');
            Append('  R.IDRATEIODOCUM                                                 ');
            Append('FROM                                                              ');
            Append('  RATEIODOCUM R,DOCUMENTO D ,DOCUMENTO DOC                        ');
            Append('WHERE                                                             ');
            Append('  (D.CODDOCUMENTO = ' + _Cds.FieldByName('CODDOCUMENTO').AsString + ') AND');
            Append('  (R.IDPESSOA     = ' + IntToStr(iIDEmpresa) + ') AND             ');
            Append('   D.NUMFATURA  = DOC.NUMFATURA AND                               ');
            Append('   DOC.OPERACAO = ''1'' AND                                       ');
            Append('   DOC.CODDOCUMENTO = R.CODDOCUMENTO                              ');
          end;
          if _CdsAlteraRateios.Active then _CdsAlteraRateios.Close;
          _CdsAlteraRateios.Data := GetDataPacket(LstSQL);
          LstSql.Free;

          while not _CdsAlteraRateios.EOF do
          begin
            if  (Trim(_CdsAlteraRateios.FieldByName('CODCENTRORESPON').AsString) = Trim(sCROrigem)) and
                (Trim(_CdsAlteraRateios.FieldByName('CODTIPRECDES').AsString) = Trim(sTipoDesemb)) then
            begin
              BmMarcaRateios := _CdsAlteraRateios.GetBookMark;
              _CdsAlteraRateios.GotoBookMark(BmMarcaRateios);
              _CdsAlteraRateios.FreeBookMark(BmMarcaRateios);
              _CdsAlteraRateios.Edit;
              _CdsAlteraRateios.FieldByName('CODCENTRORESPON').AsString := sCRDestino;
              _CdsAlteraRateios.Post;
              DecimalSeparator := '.';
              if not ExecSQL('UPDATE ' +
                             '  RATEIODOCUM ' +
                             'SET ' +
                             '  VALOR = ' + _CdsAlteraRateios.FieldByName('VALOR').AsString +
                             ', CODCENTRORESPON = ' + QuotedStr(sCRDestino) +
                             ' WHERE ' +
                             '  IDRATEIODOCUM = ' + _CdsAlteraRateios.FieldByName('IDRATEIODOCUM').AsString) then
                raise Exception.Create(MessageInfo);
              DecimalSeparator := ',';
            end;
            _CdsAlteraRateios.Next;
          end;
          _Cds.Next;
        end;
        Commit;
        Result := True;
    Except
      On E:Exception Do
      Begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      End;
    End;
  End;
end;

end.
