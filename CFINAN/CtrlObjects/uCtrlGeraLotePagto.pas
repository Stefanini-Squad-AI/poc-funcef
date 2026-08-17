unit uCtrlGeraLotePagto;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase,
     DbClient, Classes, uCmTypes, uCtrlImpostoRetido;

type

  TCtrlGeraLotePagto = class(TCmControlObject)
  Protected
    procedure AfterInitialize; Override;
  private
    _CdsAux            : TClientDataSet;
    _CdsLotePagto      : TClientDataSet;
    _CdsLotexDocumento : TClientDataSet;
    _ImpostoRetidoLote : TCtrlImpostoRetido;
    function ListNumLote(pCODDOCUMENTO : Integer) : OleVariant;
    function ListCodLancFinanc(pCODDOCUMENTO : Integer) : OleVariant;
  Public
    constructor Create; Override;
    destructor  Destroy; Override;

    function ListDocPendentes : OleVariant;
    function ListLotexDocumento : OleVariant;
    function ListLotePagto : OleVariant;

    function VerificaContaAdiantamento(pOperacao, pRecPag : String;
                                       IntegraContabilidade : Boolean;
                                       pIDDocumento : Integer) : Boolean;
    function SeqLote(var iSeqDisperdicado : Double) : Double;
    function GeraLote(ovLotePagto, ovLotexDocumento : OleVariant;
                      pCODPORTFORMA : Integer;
                      var iNumLancto : Integer; var sDebCre : String;
                      sRecPag: String; IdEmpresa: Integer) : Boolean;
end;


implementation

{ TCtrlGeraLotePagto }

constructor TCtrlGeraLotePagto.Create;
begin
  inherited;
  _CdsAux            := TClientDataSet.Create(nil);
  _CdsLotePagto      := TClientDataSet.Create(nil);
  _CdsLotexDocumento := TClientDataSet.Create(nil);
  _ImpostoRetidoLote := TCtrlImpostoRetido.Create;
end;

destructor TCtrlGeraLotePagto.Destroy;
begin
  inherited;
  _CdsAux.Free;
  _CdsLotePagto.Free;
  _CdsLotexDocumento.Free;
  _ImpostoRetidoLote.Free;
end;

function TCtrlGeraLotePagto.VerificaContaAdiantamento(pOperacao, pRecPag : String;
                                                      IntegraContabilidade : Boolean;
                                                      pIDDocumento : Integer) : Boolean;
var sListSQL : TStrings;
begin
  Result   := False;
  sListSQL := TStringList.Create;
  try
    if (pOperacao = '14') and
       (IntegraContabilidade) then
    begin
      if pRecPag = 'P' then
      begin
        with sListSQL do
        begin
          Clear;
          Append('SELECT CONTACADIANTAMENTO FROM EMPRESAFORN EMP , DOCUMENTO DOC ');
          Append('WHERE DOC.CODDOCUMENTO  =  ' + QuotedStr(IntToStr(pIDDocumento)) + ' AND ');
          Append('      DOC.IDPESSOA      = EMP.IDPESSOA AND ');
          Append('      DOC.IDFORCLI      = EMP.IDFORCLI ');
        end;
      end
      else
      begin
        with sListSQL do
        begin
          Clear;
          Append('SELECT CONTACADIANTAMENTO FROM EMPRESACLIENTE EMP , DOCUMENTO DOC ');
          Append('WHERE DOC.CODDOCUMENTO = ' + QuotedStr(IntToStr(pIDDocumento)) + ' AND ');
          Append('       DOC.IDPESSOA    = EMP.IDPESSOA AND ');
          Append('       DOC.IDFORCLI    = EMP.IDFORCLI ');
        end;
      end;
      _CdsAux.Data := GetDataPacket(sListSQL);
      sListSQL.Free;
      if _CdsAux.FieldByName('CONTACADIANTAMENTO').AsString <> '' then
        Result := True
      else
        MessageInfo := 'Não existe Conta de Adiantamento';
    end
    else
      Result := True;
  except
    on E:Exception do
    begin
      Result := False;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlGeraLotePagto.ListDocPendentes : OleVariant;
var sSQL : String;
begin
  sSql := 'SELECT L.VLRLIQUIDO,(0)as SALDO, D.IDFORCLI, D.OPERACAO, D.CODDOCUMENTO,'+
          '       D.IDPESSOA, D.NODOCUMENTO,D.COMPLDOCUMENTO,D.DATAPROGRAMADA,'+
          '       D.DATAVENCTO,D.RECPAG, P.RAZAOSOCIAL AS NOME, D.STATUS, D.NUMLEITCODBARRAS, D.NUMDIGCODBARRAS '+
          'FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P WHERE (1=2) ';
  Result := GetDataPacket(sSQL);
end;

function TCtrlGeraLotePagto.ListLotePagto: OleVariant;
var sSQL : String;
begin
  sSQL := 'SELECT NUMLOTE, IDPESSOA, CODPORTFORMA, DATAEMISSAO, IDPROCESSO, ' +
          '  NUMCHQBORDERO, FAVORECIDO, FLAGEMISSAO, FLAGCANCEL, OBSERVACAO, ' +
          '  IDUSUARIOINCLUSAO, DATADIFERIDO ' +
          'FROM LOTEPAGTO WHERE (1=2)';
  Result := GetDataPacket(sSQL);
end;

function TCtrlGeraLotePagto.ListLotexDocumento: OleVariant;
var sSQL : String;
begin
  sSQL := 'SELECT 0 AS VLRLIQUIDO, LD.NUMLOTE, LD.CODDOCUMENTO, LD.VALOR, ' +
          '  LD.CODBARRA, LD.CODBARRAVALOR, P.RAZAOSOCIAL AS NOME, D.DATAPROGRAMADA, '+
          '  D.IDPESSOA, D.DATAVENCTO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.OPERACAO, '+
          '  D.IDFORCLI,0 AS IMP, 0 AS TOT '+
          'FROM LOTEXDOCUM LD, PESSOA P, DOCUMENTO D '+
          'WHERE  (1=2)';
  Result := GetDataPacket(sSQL);
end;


function TCtrlGeraLotePagto.SeqLote(var iSeqDisperdicado : Double): Double;
var
  iNumSeq : Double;
begin
  if iSeqDisperdicado = 0 then
  begin
    iNumSeq          := GetSequence('LOTEPAGTO');
    iSeqDisperdicado := iNumSeq;
  end
  else
    iNumSeq          := iSeqDisperdicado;

  Result := iNumSeq;
end;

function TCtrlGeraLotePagto.GeraLote(ovLotePagto, ovLotexDocumento : OleVariant;
                                     pCODPORTFORMA : Integer;
                                     var iNumLancto : Integer; var sDebCre : String;
                                     sRecPag: String; IdEmpresa: Integer): Boolean;
var
  VlrRetencao : Double;
  sSQL, sIDProcesso, sIDUsuarioInclusao  : String;
  Decimal     : Char;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GeraLote(ovLotePagto, ovLotexDocumento,
                                     pCODPORTFORMA, iNumLancto, sDebCre,
                                     sRecPag, IdEmpresa);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      if _CdsLotePagto.Active then _CdsLotePagto.Close;
      _CdsLotePagto.Data := ovLotePagto;

      if _CdsLotexDocumento.Active then _CdsLotexDocumento.Close;
      _CdsLotexDocumento.Data := ovLotexDocumento;

      sSQL := 'INSERT INTO LOTEPAGTO (NUMLOTE, IDPESSOA, ' +
              'CODPORTFORMA, IDPROCESSO, IDUSUARIOINCLUSAO, ' +
              'DATAEMISSAO, NUMCHQBORDERO, ' +
              'FAVORECIDO, FLAGEMISSAO, FLAGCANCEL, OBSERVACAO';
      with _CdsLotePagto do
      begin
        if not FieldByName('DATADIFERIDO').IsNull then
          sSQL := sSQL + ', DATADIFERIDO) '
        else
          sSQL := sSQL + ') ';
// -----------------------------------------------------------------------------
       { Os campos IDPRCESSO do _CdsLotePagto, podem ser igual a NULL }
        if FieldByName('IDPROCESSO').IsNull then
          sIDProcesso := 'Null'
        else
          sIDProcesso := FieldByName('IDPROCESSO').AsString;

        if FieldByName('IDUSUARIOINCLUSAO').IsNull then
          sIDUsuarioInclusao := 'Null'
        else
          sIDUsuarioInclusao := FieldByName('IDUSUARIOINCLUSAO').AsString;
// -----------------------------------------------------------------------------
        sSQL := sSQL + 'VALUES (' + FieldByName('NUMLOTE').AsString      + ','
                                  + FieldByName('IDPESSOA').AsString     + ','
                                  + FieldByName('CODPORTFORMA').AsString + ','
                                  + sIDProcesso                          + ','
                                  + sIDUsuarioInclusao                   + ','
                                  + 'TO_DATE(' + QuotedStr(FieldByName('DATAEMISSAO').AsString) + ', ''DD/MM/YYYY''), '
                                  + QuotedStr(FieldByName('NUMCHQBORDERO').AsString) + ','
                                  + QuotedStr(FieldByName('FAVORECIDO').AsString) + ','
                                  + QuotedStr(FieldByName('FLAGEMISSAO').AsString) + ','
                                  + QuotedStr(FieldByName('FLAGCANCEL').AsString) + ','
                                  + QuotedStr(FieldByName('OBSERVACAO').AsString);
        if not _CdsLotePagto.FieldByName('DATADIFERIDO').IsNull then
          sSQL := sSQL + ', TO_DATE(' + QuotedStr(FieldByName('DATADIFERIDO').AsString) + ', ''DD/MM/YYYY''))'
        else
          sSQL := sSQL + ')';

        if not ExecSQL(sSQL) then
          Raise Exception.Create(MessageInfo);
      end;
      sSQL := '';
      with _CdsLotexDocumento do
      begin
        First;
        while not(EOF) do
        begin
// -----------------------------------------------------------------------------
          if _CdsAux.Active then _CdsAux.Close;
          _CdsAux.Data := ListNumLote(FieldByName('CODDOCUMENTO').AsInteger);
          iNumLancto   := _CdsAux.FieldByName('NUMLANCTO').AsInteger;
          sDebCre      := _CdsAux.FieldByName('DEBCRE').AsString;
          _CdsAux.Close;
// -----------------------------------------------------------------------------
          if not ExecSQL(' UPDATE DOCUMENTO SET CODPORTFORMA = ' + IntToStr(pCODPORTFORMA) +
                         ' WHERE CODDOCUMENTO = ' + FieldByName('CODDOCUMENTO').AsString) then
            Raise Exception.Create(MessageInfo);

          _ImpostoRetidoLote.NumLote           := FieldByName('NUMLOTE').AsFloat;
          _ImpostoRetidoLote.DataProgramada    := _CdsLotePagto.FieldByName('DATAEMISSAO').AsDateTime;
          _ImpostoRetidoLote.OperacaoDocumento := FieldByName('OPERACAO').AsString;
          _ImpostoRetidoLote.IdForCli          := FieldByName('IDFORCLI').AsInteger;
          _ImpostoRetidoLote.CodDocumento      := FieldByName('CODDOCUMENTO').AsInteger;
          _ImpostoRetidoLote.NumLancto         := iNumLancto;
          _ImpostoRetidoLote.ValorLancto       := FieldByName('VALOR').AsFloat;
          _ImpostoRetidoLote.ValorLiquido      := FieldByName('VLRLIQUIDO').AsFloat;
          _ImpostoRetidoLote.DataLancto        := _CdsLotePagto.FieldByName('DATAEMISSAO').AsDateTime;
          _ImpostoRetidoLote.DataEmissao       := _CdsLotePagto.FieldByName('DATAEMISSAO').AsDateTime;
          _ImpostoRetidoLote.DebCre            := sDebCre;
          _ImpostoRetidoLote.MomentoLancamento := mlBaixa;
          _ImpostoRetidoLote.CodPortForma      := pCODPORTFORMA;

          _ImpostoRetidoLote.RecPag            := sRecPag[1];
          _ImpostoRetidoLote.IdEmpresa         := IdEmpresa;

          _ImpostoRetidoLote.Incluir;

          VlrRetencao := _ImpostoRetidoLote.ValorAlteradores;

          //Para documentos com a natureza invertida
          if ((sDebCre = 'D') and (sRecPag = 'P')) or
             ((sDebCre = 'C') and (sRecPag = 'R')) then
             VlrRetencao := VlrRetencao * -1;

          if _ImpostoRetidoLote.ValorAlteradores <> 0 then
          begin
            Edit;
            FieldByName('VALOR').AsFloat := FieldByName('VALOR').AsFloat + VlrRetencao;
            Post;
          end;

          if FieldByName('OPERACAO').AsString = '10' then
          begin
            if ExecSQL(' UPDATE RECBTOPAGTO SET NUMCHQBORDERO = ' +
                         QuotedStr(_CdsLotePagto.FieldByName('NUMLOTE').AsString) +
                       ' WHERE CODDOCUMENTO = ' + FieldByName('CODDOCUMENTO').AsString) then
            begin
              if _CdsAux.Active then _CdsAux.Close;
              _CdsAux.Data := ListCodLancFinanc(FieldByName('CODDOCUMENTO').AsInteger);
              if not _CdsAux.IsEmpty  Then
              begin
                if not ExecSQL('UPDATE MOVIMFINANC SET NUMCHQBORDERO = ' +
                             QuotedStr(_cdsLotePagto.FieldByName('NUMLOTE').AsString) +
                             ', HISTORICO = ''BORDERÔ Nº ' + _cdsLotePagto.FieldByName('NUMLOTE').AsString +
                             ''' WHERE CODLANCFINANC = ' + _CdsAux.Fields[0].AsString) then
                  MessageInfo := 'Não foi possível atualizar movimento financeiro para o Doc ' +
                                  FieldByName('CODDOCUMENTO').AsString + ', verifique.';
              end
              else
                Raise Exception.Create('Erro ao selecionar movimento financeiro para o Doc ' +
                           _CdsLoteXDocumento.FieldByName('CODDOCUMENTO').AsString + ', verifique.');
             end
             else
               Raise Exception.Create('Não foi possível atualiar Nº do Cheque\Borderô para o Doc ' +
                     _CdsLoteXDocumento.FieldByName('CODDOCUMENTO').AsString + ', verifique.');
          end;
          { Esta variavel serve para guardar o Separador padrão da máquina em que
            o sistema está sendo rodado. Eu utilizo este recurso porque, pode ocorrer,
            do campo VALOR no INSERT abaixo conter centavos. Neste caso, dava erro no
            mesmo de excesso de valores.}
          Decimal := DecimalSeparator;
          DecimalSeparator := '.';
          if not ExecSQL('INSERT INTO LOTEXDOCUM ' +
                         '(NUMLOTE, CODDOCUMENTO, VALOR, CODBARRA, CODBARRAVALOR) ' +
                         'VALUES ' +
                         '(' + FieldByName('NUMLOTE').AsString + ','
                             + FieldByName('CODDOCUMENTO').AsString + ','
                             + FieldByName('VALOR').AsString + ','
                             + QuotedStr(FieldByName('CODBARRA').AsString) + ','
                             + QuotedStr(FieldByName('CODBARRAVALOR').AsString) + ')') then
            Raise Exception.Create(MessageInfo);
           DecimalSeparator := Decimal;
          {--------------------------------------------------------------------}
          _CdsLotexDocumento.Next;
        end;
        _ImpostoRetidoLote.NumLote      := FieldByName('NUMLOTE').AsFloat;
        _ImpostoRetidoLote.CodPortForma := pCODPORTFORMA;
        _ImpostoRetidoLote.EfetivaNovoDocumento;
      end;
      Result := True;
      Commit;
      _ImpostoRetidoLote.CancelaAcumulaImposto;
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

function TCtrlGeraLotePagto.ListNumLote(pCODDOCUMENTO: Integer) : OleVariant;
var sSQL : String;
begin
  sSQL := 'SELECT ' +
          'L.NUMLANCTO,L.DEBCRE ' +
          'FROM ' +
          '  DOCUMENTO D, LANCTODOCUM L ' +
          'WHERE ' +
          '  (D.CODDOCUMENTO = ' + IntToStr(pCODDOCUMENTO) +  ') AND ' +
          '  (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
          '  (D.OPERACAO = L.OPERACAO) ';
  Result := GetDataPacket(sSQL);
end;

function TCtrlGeraLotePagto.ListCodLancFinanc(
  pCODDOCUMENTO: Integer): OleVariant;
var sSQL : String;
begin
  sSQL := 'SELECT CODLANCFINANC FROM RECBTOPAGTO WHERE CODDOCUMENTO = ' +
          IntToStr(pCODDOCUMENTO);
  Result := GetDataPacket(sSQL);
end;

procedure TCtrlGeraLotePagto.AfterInitialize;
begin
  inherited;
  _ImpostoRetidoLote.InitializeAs(Self)
end;

end.
