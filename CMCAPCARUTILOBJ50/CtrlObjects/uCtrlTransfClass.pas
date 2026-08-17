unit uCtrlTransfClass;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
{-------------------------------------------------------------------------------
Data      : 11/01/05
Analista  : Alex Pereira
Pendência : 18323
Descrição : Correção na rotina quando o documento possuía múltiplas contas de baixa
            Gerando apenas uma planilha de transferência
            Obrigar o tipo de operação
------------------------------------------------------------------------------}

// Marchetti - Pendencia 16967
// Ajuste na critica do processo
// Retirada a critica de contas no metodo bbtnConfirmaClaClick. Foi colocada a critica
// no uCtrlTransfClass
// Colocada a rotina para contemplar multiplas contas de baixa

{-------------------------------------------------------------------------------
Data      : 13/01/04
Pendência : 14451 - Nova Segregação de Recursos
Descrição : Passar a nova estrutura - IDSEGREGACRITER e DATASEGREGACRITER

Métodos Pendentes:
          TCtrlTransfClass.GravaTransfClass InsereLancaContab 2 ocorrencias
Resolvido através da solucao da pendencia 16967
------------------------------------------------------------------------------}

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, Classes,
     DbClient, uCMTypes, uCMClientDataSet, uCtrlDocumento, uCtrlLancamento, JclMath,
     ucmfileutils, Forms, USistema ;

type
  TCtrlTransfClass = class(TCmControlObject)
  Protected
    procedure AfterInitialize; Override;
  private
    _CdsAltTipo      : TCMClientDataSet;
    _Cds             : TCMClientDataSet;
    _CdsCCBaixa      : TCMClientDataSet;
    _CdsRateioDocum  : TCMClientDataSet;
    _Documento       : TCtrlDocumento;
    _Lancamento      : TCtrlLancamento;
  Public
    constructor Create;  Override;
    destructor  Destroy; Override;
    function    GravaTransfClass(sIDTipoOrigem, sIDTipoDestino,
                                 sPlacontaOrigem, sPlacontaDestino,
                                 sRecPag, sDataAte, sDataLancamento : String;
                                 iTipoData, iIDEmpresa, iIDModulo,
                                 iIDUsuario, iPlano: Integer;
                                 ValorZero : Double;
                                 bSincroniza, bDataLancamentoEnabled,
                                 bIntegraContab, bTransfContab, bUsaPlanoPatro : Boolean;
                                 const sTipOper: string): Integer;
End;


implementation

{ TCtrlTransfClass }

procedure TCtrlTransfClass.AfterInitialize;
begin
  inherited;
  _Documento.InitializeAs(self);
  _Lancamento.InitializeAs(self);
end;

constructor TCtrlTransfClass.Create;
begin
  inherited;
  _Cds := TCMClientDataSet.Create(nil);
  _CdsCCBaixa := TCMClientDataSet.Create(nil);
  _CdsAltTipo := TCMClientDataSet.Create(nil);
  _CdsRateioDocum := TCMClientDataSet.Create(nil);
  _Documento := TCtrlDocumento.Create;
  _Lancamento := TCtrlLancamento.Create;
end;

destructor TCtrlTransfClass.Destroy;
begin
  _Cds.Free;
  _CdsCCBaixa.Free;
  _CdsAltTipo.Free;
  _CdsRateioDocum.Free;
  _Documento.Free;
  _Lancamento.Free;
  inherited;
end;

function TCtrlTransfClass.GravaTransfClass(sIDTipoOrigem, sIDTipoDestino,
                                           sPlacontaOrigem, sPlacontaDestino,
                                           sRecPag, sDataAte, sDataLancamento : String;
                                           iTipoData, iIDEmpresa, iIDModulo,
                                           iIDUsuario, iPlano: Integer;
                                           ValorZero : Double;
                                           bSincroniza, bDataLancamentoEnabled,
                                           bIntegraContab, bTransfContab, bUsaPlanoPatro : Boolean;
                                           const sTipOper: string) : Integer;

var
  sHistorico, sSql : String;
  rValor, rTotal, rTotUN, rSaldo : Double;
  // Alex 11/01/04 Pend 18323 - armazenar o número da planilha para gerar apenas uma planilha de transferência
  rPlnCodigo: Double;
  sCCustoD, sContaD, sCCustoC, sContaC : String;
  LstSQL : TStrings;
begin
  inherited;


  // Marcio Motta - 06/04/2005 - 18043
  CMDebugToFile ('INÍCIO LOG FILE BETA 3 = ' + Application.ExeName, 'c:\LogCPagar.TXT');
  CMDebugToFile ('PASSO 1 - Início da Rotina', 'c:\LogCPagar.TXT');

  if ConnectionSide = cnsClient then
  begin
    CMDebugToFile ('PASSO 2 - Aplicação Cliente', 'c:\LogCPagar.TXT');
    Result := Connection.AppServer.GravaTransfClass(sIDTipoOrigem, sIDTipoDestino,
                                           sPlacontaOrigem, sPlacontaDestino,
                                           sRecPag, sDataAte, sDataLancamento,
                                           iTipoData, iIDEmpresa, iIDModulo,
                                           iIDUsuario, iPlano, ValorZero,
                                           bSincroniza, bDataLancamentoEnabled,
                                           bIntegraContab, bTransfContab, bTransfContab, bUsaPlanoPatro,
                                           sTipOper);
    if Result < 0 then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    LstSQL := TStringList.Create;
    try
      CMDebugToFile ('PASSO 3 - Início da Transação', 'c:\LogCPagar.TXT');
      StartTransaction;
      Result := -1;

      if ( bTransfContab ) then
      begin
         // Alex 12/01/05 18323 - Obrigar o tipo de operação
         CMDebugToFile ('PASSO 4 - Trata o Preecnhimento da tela', 'c:\LogCPagar.TXT');

         if sTipOper = '' then
           raise Exception.Create('Para realizar a transferência contábil é necessário informar o Tipo de Operação.')
         else
           // Marcio Motta - 04/04/2005 - 18043
           CMDebugToFile ('sTipOper = ' + sTipOper, 'c:\LogCPagar.TXT');

         if ( trim(sPlacontaOrigem) = '' ) then
            raise Exception.Create('Para realizar a transferência contábil é necessário informar a conta de origem.')
         else
           // Marcio Motta - 04/04/2005 - 18043
           CMDebugToFile ('sPlacontaOrigem = ' + sPlacontaOrigem, 'c:\LogCPagar.TXT');


         if ( trim(sPlacontaDestino) = '' ) then
            raise Exception.Create('Para realizar a transferência contábil é necessário informar a conta de destino.')
         else
           // Marcio Motta - 04/04/2005 - 18043
           CMDebugToFile ('sPlacontaDestino = ' + sPlacontaDestino, 'c:\LogCPagar.TXT');
      end;

      if (trim(sIDTipoOrigem) <> '') and (trim(sIDTipoDestino) = '') then
        raise Exception.Create('Obrigatório preencher o Tipo de Destino')
      else
        // Marcio Motta - 04/04/2005 - 18043
        begin
          CMDebugToFile ('sIDTipoOrigem = ' + sIDTipoOrigem, 'c:\LogCPagar.TXT');
          CMDebugToFile ('sIDTipoDestino = ' + sIDTipoDestino, 'c:\LogCPagar.TXT');
        end;

      if trim(sDataAte) = '' then
        raise Exception.Create('Obrigatório preencher a Data')
      else
        // Marcio Motta - 04/04/2005 - 18043
        CMDebugToFile ('sDataAte = ' + sDataAte, 'c:\LogCPagar.TXT');

      if bDataLancamentoEnabled and (trim(sDataLancamento) = '') then
        raise Exception.Create('Obrigatório preencher a Data do lançamento')
      else
        // Marcio Motta - 04/04/2005 - 18043
        CMDebugToFile ('sDataLancamento = ' + sDataLancamento, 'c:\LogCPagar.TXT');

      if StrToDate(sDataAte) >= Date then
        raise Exception.Create('Data não pode ser maior ou igual a data de hoje');

      if trim(sIDTipoOrigem) = '' then
        raise Exception.Create('Obrigatório informar o Tipo de Origem');

      if trim(sPlaContaDestino) <> '' then
      begin
        if bTransfContab then
        begin
           // Alex 11/01/04 Pend 18323 - armazenar o número da planilha para gerar apenas uma planilha de transferência
           rPlnCodigo := 0;

           CMDebugToFile ('PASSO 5 - Verifica se existem Múltiplas Contas de Baixa', 'c:\LogCPagar.TXT');

           // Pendencia 16967 - Marchetti
           // Verifica se existem documentos com múltiplas contas de baixa
           _CdsCCBaixa.Close;

           sSQL :=
           'SELECT                                                            ' + #13 +
           '  D.CODDOCUMENTO,                                                 ' + #13 +
           '  D.CODCENTROCUSTO,                                               ' + #13 +
           '  D.NODOCUMENTO,                                                  ' + #13 +
           '  D.COMPLDOCUMENTO,                                               ' + #13 +
           '  L.DATALANCTO,                                                   ' + #13 +
           '  P.RAZAOSOCIAL,                                                  ' + #13 +
           // INÍCIO NOVOS CAMPOS Alex 11/01/05 18323
           '  L.VALOR AS VLRDOC,                                              ' + #13 +
           '  C.IDPATRO, C.IDPLANOPREV, C.UNIDNEGOC, C.IDSEGREGACRITER,       ' + #13 +
           '  C.PLACONTA, SUM(C.VALOR) AS VLRCCBAIXA                          ' + #13 +
           // FIM Alex 11/01/05 18323
           'FROM                                                              ' + #13 +
           '  PESSOA P,                                                       ' + #13 +
           '  DOCUMENTO D,                                                    ' + #13 +
           '  LANCTODOCUM L,                                                  ' + #13 +
           '  CCBAIXASXDOCUM C                                                ' + #13 +
           'WHERE                                                             ' + #13 +
           '  (D.IDPESSOA = ' + IntToStr(iIDEmpresa) + ') AND                 ' + #13 +
           '  (RTRIM(C.PLACONTA) = RTRIM(' + QuotedStr(sPlaContaOrigem) + ')) AND   ' + #13 +
           '  (C.PLANO = ' + IntToStr(iPlano) + ') AND                        ' + #13 +
           '  (D.STATUS <> ''2'') AND                                         ' + #13 +
           '  (D.RECPAG = ' + QuotedStr(sRecPag) + ') AND                     ' + #13 +
           '  (D.IDFORCLI = P.IDPESSOA) AND                                   ' + #13 +
           '  (C.CODDOCUMENTO = D.CODDOCUMENTO) AND                           ' + #13 +
           '  (L.CODDOCUMENTO = D.CODDOCUMENTO) AND                           ' + #13 +
           '  (L.OPERACAO     = D.OPERACAO)                                   ' + #13;

           if iTipoData = 0 Then
             sSQL := sSQL +
             'AND (D.DATAPROGRAMADA <= TO_DATE(' + QuotedStr(sDataAte) + ',''DD/MM/YYYY''))' + #13
           else
             sSQL := sSQL +
             'AND (D.DATAVENCTO <= TO_DATE(' + QuotedStr(sDataAte) + ',''DD/MM/YYYY''))' + #13;

           if bSincroniza then
             sSQL := sSQL +
              'AND D.CODDOCUMENTO IN ( SELECT DISTINCT CODDOCUMENTO FROM RATEIODOCUM WHERE  (RTRIM(CODTIPRECDES) = RTRIM(' + QuotedStr(sIDTipoOrigem) + ')) ) ' + #13;

           sSql := sSql +
           'GROUP BY                                                             ' + #13 +
           '  D.CODDOCUMENTO, D.CODCENTROCUSTO, D.NODOCUMENTO, D.COMPLDOCUMENTO, ' + #13 +
           '  L.DATALANCTO, P.RAZAOSOCIAL, L.VALOR,                              ' + #13 +
           '  C.IDPATRO, C.IDPLANOPREV, C.UNIDNEGOC, C.IDSEGREGACRITER,          ' + #13 +
           '  C.PLACONTA                                                         ' + #13;

           _CdsCCBaixa.Data := GetDataPacket(sSQL);

           // Marcio Motta - 04/04/2005 - 18043
           CMDebugToFile ('INÍCIO - SQL Múltiplas contas (Query) ****************************', 'c:\LogCPagar.TXT');
           CMDebugToFile ('sSql = ' + sSql, 'LogCPagar.TXT');
           CMDebugToFile ('FIM - SQL Múltiplas contas (Query) ****************************', 'c:\LogCPagar.TXT');
           CMDebugToFile ('CDS - Múltiplas contas (Qtd. Registros) = ' + IntToStr (_CdsCCBaixa.RecordCount), 'c:\LogCPagar.TXT');
           _CdsCCBaixa.Data;

           try
             //_CdsCCBaixa.SaveToFile('c:\CdsCCBaixa.cds');
             _CdsCCBaixa.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CdsCCBaixa.cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
           except
             on exception do
               CMDebugToFile ('Erro na gravação do CdsCCBaixa', 'c:\LogCPagar.TXT');
           end;
           // Fim..............................



           // Fim Pendencia 16967 - Marchetti
           CMDebugToFile ('PASSO 6 - Verifica se existem Contas Únicas', 'c:\LogCPagar.TXT');

           _Cds.Close;
           with LstSQL do
           begin
             Clear;
             Append('SELECT DISTINCT                                                   ');
             Append('  D.CODDOCUMENTO,                                                 ');
             Append('  D.CODCENTROCUSTO,                                               ');
             Append('  D.NODOCUMENTO,                                                  ');
             Append('  DECODE(D.IDSEGREGACRITER,NULL,-1,D.IDSEGREGACRITER) AS IDSEGREGACRITER, ');
             Append('  D.COMPLDOCUMENTO,                                               ');
             Append('  L.DATALANCTO,                                                   ');
             Append('  P.RAZAOSOCIAL                                                   ');
             Append('FROM                                                              ');
             Append('  PESSOA P,                                                       ');
             Append('  DOCUMENTO D,                                                    ');
             Append('  LANCTODOCUM L,                                                  ');
             Append('  RATEIODOCUM R                                                   ');
             Append('WHERE                                                             ');
             Append('  (D.IDPESSOA = ' + IntToStr(iIDEmpresa) + ') AND                 ');
             Append('  (RTRIM(D.PLACONTA) = RTRIM(' + QuotedStr(sPlaContaOrigem) + ')) AND   ');
             Append('  (D.PLANO = ' + IntToStr(iPlano) + ') AND                        ');
             Append('  (D.STATUS <> ''2'') AND                                         ');
             Append('  (D.RECPAG = ' + QuotedStr(sRecPag) + ') AND                     ');
             Append('  (D.IDFORCLI = P.IDPESSOA) AND                                   ');
             Append('  (L.CODDOCUMENTO = D.CODDOCUMENTO) AND                           ');
             Append('  (L.OPERACAO     = D.OPERACAO)     AND                           ');
             Append('  (D.CODDOCUMENTO = R.CODDOCUMENTO)                               ');
             if iTipoData = 0 Then
               Append('AND (D.DATAPROGRAMADA <= TO_DATE(' + QuotedStr(sDataAte) + ',''DD/MM/YYYY''))')
             else
               Append('AND (D.DATAVENCTO <= TO_DATE(' + QuotedStr(sDataAte) + ',''DD/MM/YYYY''))');

             if bSincroniza then
               Append('AND (RTRIM(R.CODTIPRECDES) = RTRIM(' + QuotedStr(sIDTipoOrigem) + '))');
           end;
           _Cds.Data := GetDataPacket(LstSQL);

           // Marcio Motta - 04/04/2005 - 18043
           CMDebugToFile ('INÍCIO - SQL Conta Única (Query) ****************************', 'c:\LogCPagar.TXT');
           CMDebugToFile ('LstSQL.Text = ' + LstSQL.Text, 'c:\LogCPagar.TXT');
           CMDebugToFile ('FIM - SQL Conta Única (Query) ****************************', 'c:\LogCPagar.TXT');
           CMDebugToFile ('CDS - Conta Única (Registros) = ' + IntToStr (_Cds.RecordCount), 'c:\LogCPagar.TXT');
           _Cds.Data;

           try
             //_Cds.SaveToFile('c:\Cds.cds');
             _Cds.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\Cds.cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
           except
             on exception do
               CMDebugToFile ('Erro na gravação do Cds', 'c:\LogCPagar.TXT');
           end;

           if not _Cds.IsEmpty then
           begin
             CMDebugToFile ('PASSO 6A - Existem documentos comuns', 'c:\LogCPagar.TXT');
             _Cds.First;
             while not _Cds.EOF do
             begin
               CMDebugToFile ('PASSO 7 - Calcula o Saldo do Documento', 'c:\LogCPagar.TXT');
               _Documento.Saldo.CalculaSaldo(_Cds.FieldByName('CODDOCUMENTO').AsInteger, 0);
               rSaldo := _Documento.Saldo.Valor;

               // Marcio Motta - 05/04/2005 - 18043
               CMDebugToFile ('rSaldo = ' + FloatToStr(rSaldo), 'c:\LogCPagar.TXT');

               if not IsFloatZero(rSaldo) then
               begin
                 if sRecPag = 'R' then
                 begin
                   sCCustoD := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                   sContaD  := sPlacontaDestino;
                   sCCustoC := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                   sContaC  := sPlacontaOrigem;;
                 end
                 else
                 begin
                   sCCustoC := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                   sContaC  := sPlacontaDestino;
                   sCCustoD := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                   sContaD  := sPlacontaOrigem;
                 end;

                 with LstSQL do
                 begin
                   Clear;
                   Append('SELECT                                                ');
                   Append('  IDPLANOPREV,                                        ');
                   Append('  IDPATRO,                                            ');
                   Append('  UNIDNEGOC,                                          ');
                   Append('  SUM(VALOR) AS VALOR                                 ');
                   Append('FROM                                                  ');
                   Append('  RATEIODOCUM                                         ');
                   Append('WHERE                                                 ');
                   Append('  CODDOCUMENTO = ' + _Cds.FieldByName('CODDOCUMENTO').AsString);
                   Append('GROUP BY                                              ');
                   Append('  IDPLANOPREV, IDPATRO, UNIDNEGOC                     ');
                 end;
                 _CdsRateioDocum.Data := GetDataPacket(LstSQL);

                 CMDebugToFile ('PASSO 8 - Calcula o Total do Rateio', 'c:\LogCPagar.TXT');
                 rTotUN := 0;
                 while not _CdsRateioDocum.EOF do
                 begin
                   rTotUN := rTotUN + _CdsRateioDocum.FieldByName('VALOR').AsFloat;
                   _CdsRateioDocum.Next;
                 end;

                 // Marcio Motta - 05/04/2005 - 18043
                 CMDebugToFile ('INÍCIO - SQL RateioDocum (Query) ****************************', 'c:\LogCPagar.TXT');
                 CMDebugToFile ('LstSQL.Text = ' + LstSQL.Text, 'c:\LogCPagar.TXT');
                 CMDebugToFile ('FIM - SQL RateioDocum (Query) ****************************', 'c:\LogCPagar.TXT');
                 CMDebugToFile ('CDS - RateioDocum (Registros) = ' + IntToStr(_CdsRateioDocum.RecordCount), 'c:\LogCPagar.TXT');
                 CMDebugToFile ('rTotUN = ' + FloatToStr(rTotUN), 'c:\LogCPagar.TXT');
                 _CdsRateioDocum.Data;

                 try
                   //_CdsRateioDocum.SaveToFile('c:\CdsRateioDocum.cds');
                   _CdsRateioDocum.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CdsRateioDocum.cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
                 except
                   on exception do
                     CMDebugToFile ('Erro na gravação do CdsRateioDocum', 'LogCPagar.TXT');
                 end;
                 // Fim..............................


                 rTotal := 0;
                 _CdsRateioDocum.First;
                 while not _CdsRateioDocum.EOF do
                 begin
                   rValor := _CdsRateioDocum.FieldByName('VALOR').AsFloat * ( rSaldo/rTotUN );
                   rValor := StrToFloat(Format('%17.2f',[rValor]));
                   rTotal := rTotal + rValor;
                   sHistorico := 'Transferência da Conta ' +
                                 sPlaContaOrigem +
                                 ' para Conta ' + sPlaContaDestino +
                                 ' ref. atraso do documento ' + _Cds.FieldByName('NODOCUMENTO').AsString +
                                 '/' + _Cds.FieldByName('COMPLDOCUMENTO').AsString + ' ' +
                                 _Cds.FieldByName('RAZAOSOCIAL').AsString;

                   CMDebugToFile ('PASSO 9 - Insere o Lançamento', 'c:\LogCPagar.TXT');
                   if not _Lancamento.InsereLancaContab('2',
                                                        iIDEmpresa,
                                                        iIDModulo,
                                                        iIDUsuario,
                                                        iPlano,
                                                        _cdsRateioDocum.FieldByName('UNIDNEGOC').AsFloat,
                                                        0,
                                                        0,
                                                        _cdsRateioDocum.FieldByName('IDPLANOPREV').AsInteger,
                                                        _cdsRateioDocum.FieldByName('IDPATRO').AsInteger,
                                                        rPlnCodigo, // Alex 11/01/04 18323 0,
                                                        0,
                                                        sDataLancamento,
                                                        _Cds.FieldByName('NODOCUMENTO').AsString + '/' +_Cds.FieldByName('COMPLDOCUMENTO').AsString,
                                                        sHistorico,
                                                        '','','','',
                                                        sTipOper,
                                                        sCCustoD, sContaD,sCCustoC,sContaC,
                                                        '',
                                                        rValor,
                                                        False,
                                                        bUsaPlanoPatro,
                                                        _Cds.FieldByName('IDSEGREGACRITER').AsInteger,
                                                        _Cds.FieldByName('DATALANCTO').ASDateTime) then
                     raise Exception.Create(_Lancamento.MessageInfo);

                     // Alex 11/01/04 Pend 18323 - armazenar o número da planilha para gerar apenas uma planilha de transferência
                     CMDebugToFile ('PASSO 10 - Retorna o PlnCodigo', 'c:\LogCPagar.TXT');
                     rPlnCodigo := _Lancamento.RetornoPlnCodigo;

                   _CdsRateioDocum.Next;
                 end;

                 if Format('%17.2f',[rSaldo]) <> Format('%17.2f',[rTotal]) then
                 begin
                   _CdsRateioDocum.First;
                   rValor := rSaldo - rTotal;
                   CMDebugToFile ('PASSO 11 - Verifica se existe diferença entre o SALDO e o TOTAL' +#13+
                                              'Se existir diferença faz o lançamento', 'c:\LogCPagar.TXT');
                   if not _Lancamento.InsereLancaContab('2',
                                                        iIDEmpresa,
                                                        iIDModulo,
                                                        iIDUsuario,
                                                        iPlano,
                                                        _cdsRateioDocum.FieldByName('UNIDNEGOC').AsFloat,
                                                        0,
                                                        0,
                                                        _cdsRateioDocum.FieldByName('IDPLANOPREV').AsInteger,
                                                        _cdsRateioDocum.FieldByName('IDPATRO').AsInteger,
                                                        rPlnCodigo,
                                                        0,
                                                        sDataLancamento,
                                                        _Cds.FieldByName('NODOCUMENTO').AsString + '/' +_Cds.FieldByName('COMPLDOCUMENTO').AsString,
                                                        sHistorico,
                                                        '','','','',
                                                        // Alex 12/01/05 18323 - Obrigar o tipo de operação
                                                        sTipOper,
                                                        sCCustoD, sContaD,sCCustoC,sContaC,
                                                        '',
                                                        rValor,
                                                        False,
                                                        bUsaPlanoPatro,
                                                        _Cds.FieldByName('IDSEGREGACRITER').AsInteger,
                                                        _Cds.FieldByName('DATALANCTO').ASDateTime) then
                     raise Exception.Create(_Lancamento.MessageInfo);
                 end;
                 CMDebugToFile ('PASSO 12 - Atualiza a tabela DOCUMENTO, alterando a conta', 'c:\LogCPagar.TXT');
                 if not ExecSQL(' UPDATE DOCUMENTO SET PLACONTA = ' +
                                  QuotedStr(sPlaContaDestino) +
                                ' WHERE CODDOCUMENTO = ' +
                                 _Cds.FieldByName('CODDOCUMENTO').AsString) then
                   raise Exception.Create(MessageInfo)
                 else
                   // Marcio Motta - 05/04/2005 - 18043
                   CMDebugToFile ('UPDATE na tabela DOCUMENTO executado', 'c:\LogCPagar.TXT');
               end;
               _Cds.Next;
             end;
           end
           else
            if _CdsCCBaixa.IsEmpty then
               begin
                 CMDebugToFile ('PASSO 13 - Se não tem registros comuns nem com múltiplas' +#13+
                                //'Contas de Baixa', 'c:\LogCPagar.TXT');
                                'Contas de Baixa', Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\LogCPagar.TXT');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
                 raise Exception.Create('Não existem registros a serem reclassificados no período.');
               end;

           // Pendencia 16967 - Marchetti
           // Processa multiplas contas de baixa
           if not _CdsCCBaixa.IsEmpty then
           begin
             CMDebugToFile ('PASSO 14 - Existem documentos com Múltiplas Contas de Baixa', 'c:\LogCPagar.TXT');
              while not _CdsCCBaixa.Eof do
              begin
                 CMDebugToFile ('PASSO 15 - Calcula o Saldo do Documento - Múltiplas Contas', 'c:\LogCPagar.TXT');
                 _Documento.Saldo.CalculaSaldo(_CdsCCBaixa.FieldByName('CODDOCUMENTO').AsInteger, 0);
                 rSaldo := _Documento.Saldo.Valor;

                 if not IsFloatZero(rSaldo) then
                 begin
                    if sRecPag = 'R' then
                    begin
                      sCCustoD := _CdsCCBaixa.FieldByName('CODCENTROCUSTO').AsString;
                      sContaD  := sPlacontaDestino;
                      sCCustoC := _CdsCCBaixa.FieldByName('CODCENTROCUSTO').AsString;
                      sContaC  := sPlacontaOrigem;
                    end
                    else
                    begin
                      sCCustoC := _CdsCCBaixa.FieldByName('CODCENTROCUSTO').AsString;
                      sContaC  := sPlacontaDestino;
                      sCCustoD := _CdsCCBaixa.FieldByName('CODCENTROCUSTO').AsString;
                      sContaD  := sPlacontaOrigem;
                    end;

                     rValor := _CdsCCBaixa.FieldByName('VLRCCBAIXA').AsFloat /
                               _CdsCCBaixa.FieldByName('VLRDOC').AsFloat *
                               rSaldo;

                     rValor := StrToFloat(Format('%17.2f',[rValor]));
                     //Alex 11/01/05 18323 rTotal := rTotal + rValor;
                     sHistorico := 'Transferência da Conta ' +
                                   sPlaContaOrigem +
                                   ' para Conta ' + sPlaContaDestino +
                                   ' ref. atraso do documento ' + _CdsCCBaixa.FieldByName('NODOCUMENTO').AsString +
                                   '/' + _CdsCCBaixa.FieldByName('COMPLDOCUMENTO').AsString + ' ' +
                                   _CdsCCBaixa.FieldByName('RAZAOSOCIAL').AsString;

                     CMDebugToFile ('PASSO 16 - Insere o lançamento Múltiplas Contas', 'c:\LogCPagar.TXT');
                     if not _Lancamento.InsereLancaContab('2',
                                                          iIDEmpresa,
                                                          iIDModulo,
                                                          iIDUsuario,
                                                          iPlano,
                                                          _CdsCCBaixa.FieldByName('UNIDNEGOC').AsFloat,
                                                          0,
                                                          0,
                                                          _CdsCCBaixa.FieldByName('IDPLANOPREV').AsInteger,
                                                          _CdsCCBaixa.FieldByName('IDPATRO').AsInteger,
                                                          rPlnCodigo,
                                                          0,
                                                          sDataLancamento,
                                                          _CdsCCBaixa.FieldByName('NODOCUMENTO').AsString + '/' +_CdsCCBaixa.FieldByName('COMPLDOCUMENTO').AsString,
                                                          sHistorico,
                                                          '','','','',
                                                          sTipOper,
                                                          sCCustoD, sContaD,sCCustoC,sContaC,
                                                          '',
                                                          rValor,
                                                          False,
                                                          bUsaPlanoPatro,
                                                          StrToIntDef(_CdsCCBaixa.FieldByName('IDSEGREGACRITER').AsString, -1),
                                                          _CdsCCBaixa.FieldByName('DATALANCTO').AsDateTime) then
                       raise Exception.Create(_Lancamento.MessageInfo);

                       // Alex 11/01/04 Pend 18323 - armazenar o número da planilha para gerar apenas uma planilha de transferência
                       CMDebugToFile ('PASSO 17 - Busca o número da Planilha', 'c:\LogCPagar.TXT');
                       rPlnCodigo := _Lancamento.RetornoPlnCodigo;
                 end;

                 CMDebugToFile ('PASSO 18 - Atualiza a tabela CCBAIXASXDOCUM', 'c:\LogCPagar.TXT');
                 if not ExecSQL(' UPDATE CCBAIXASXDOCUM SET PLACONTA = ' +
                                  QuotedStr(sPlaContaDestino) +
                                ' WHERE CODDOCUMENTO = ' +
                                 _CdsCCBaixa.FieldByName('CODDOCUMENTO').AsString +
                                 ' AND PLACONTA = ' + QuotedStr(sPlaContaOrigem)) then
                    raise Exception.Create(MessageInfo)
                 else
                   // Marcio Motta - 05/04/2005 - 18043
                   CMDebugToFile ('UDPDATE na tabela CCBAIXASXDOCUM', 'c:\LogCPagar.TXT');

                 _CdsCCBaixa.Next;
              end;
           end
           else
              if _Cds.IsEmpty then
                begin
                  CMDebugToFile ('PASSO 19 - Não existem documentos comuns', 'c:\LogCPagar.TXT');
                  raise Exception.Create('Não existem registros a serem reclassificados no período.');
                end;
           // Fim Pendencia 16967

        end;
      end;

      if trim(sIDTipoDestino) <> '' then
      begin
        with LstSQL do
        begin
          Clear;
          Append('SELECT                                                            ');
          Append('  R.CODDOCUMENTO,                                                 ');
          Append('  R.IDPESSOA,                                                     ');
          Append('  R.CODTIPRECDES,                                                 ');
          Append('  R.RECPAG,                                                       ');
          Append('  R.CODCENTRORESPON,                                              ');
          Append('  R.UNIDNEGOC                                                     ');
          Append('FROM                                                              ');
          Append('  DOCUMENTO D,                                                    ');
          Append('  RATEIODOCUM R                                                   ');
          Append('WHERE                                                             ');
          Append('  (D.IDPESSOA = ' + IntToStr(iIDEmpresa) + ') AND                 ');
          Append('  (D.STATUS <> ''2'') AND                                         ');
          Append('  (D.RECPAG = ' + QuotedStr(sRecPag) + ') AND                     ');
          Append('  (D.CODDOCUMENTO = R.CODDOCUMENTO) AND                           ');
          Append('  (RTRIM(R.CODTIPRECDES) = RTRIM(' + QuotedStr(sIDTipoOrigem) + '))');
          if iTipoData = 0 Then
            Append('AND (D.DATAPROGRAMADA <= TO_DATE(' + QuotedStr(sDataAte) + ',''DD/MM/YYYY''))')
          else
            Append('AND (D.DATAVENCTO <= TO_DATE(' + QuotedStr(sDataAte) + ',''DD/MM/YYYY''))');
        end;
        if _CdsAltTipo.Active then _CdsAltTipo.Close;
        _CdsAltTipo.Data := GetDataPacket(LstSQL);

        // Marcio Motta - 05/04/2005 - 18043
        CMDebugToFile ('sIDTipoDestino = ' + sIDTipoDestino, 'c:\LogCPagar.TXT');
        CMDebugToFile ('INÍCIO - SQL TipoDestino (Query) ****************************', 'c:\LogCPagar.TXT');
        CMDebugToFile ('LstSQL.Text = ' + LstSQL.Text, 'c:\LogCPagar.TXT');
        CMDebugToFile ('FIM - SQL TipoDestino (Query) ****************************', 'c:\LogCPagar.TXT');
        CMDebugToFile ('CDS - CdsAltTipo (Registros) = ' + IntToStr(_CdsAltTipo.RecordCount), 'c:\LogCPagar.TXT');
        _CdsAltTipo.Data;

        try
          //_CdsAltTipo.SaveToFile('c:\CdsAltTipo.cds');
          _CdsAltTipo.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CdsAltTipo.cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
        except
          on exception do
            CMDebugToFile ('Erro na gravação do CdsAltTipo', 'c:\LogCPagar.TXT');
        end;

        if _CdsAltTipo.IsEmpty then
          begin
            CMDebugToFile ('PASSO 20 - CDSAltTipo sem registros', 'c:\LogCPagar.TXT');
            raise Exception.Create('Não foi encontrado nenhum registro para reclassificação')
          end
        else

        begin
          _CdsAltTipo.First;
          while not _CdsAltTipo.EOF do
          begin
            CMDebugToFile ('PASSO 21 - Calcula o Saldo de Documentos', 'c:\LogCPagar.TXT');
            _Documento.Saldo.CalculaSaldo(_CdsAltTipo.FieldByName('CODDOCUMENTO').AsInteger,0);
            rSaldo := _Documento.Saldo.Valor;

            if not IsFloatZero(rSaldo) then
            begin
              CMDebugToFile ('PASSO 22 - Atualiza a Tabela de Rateios', 'c:\LogCPagar.TXT');
              sSql := ' UPDATE RATEIODOCUM SET CODTIPRECDES = ' + QuotedStr(sIDTipoDestino) + ' ' +
                      ' WHERE CODDOCUMENTO = ' + _CdsAltTipo.FieldByName('CODDOCUMENTO').AsString + ' AND ' +
                      ' IDPESSOA = ' + _CdsAltTipo.FieldByName('IDPESSOA').AsString + ' AND ' +
                      ' CODTIPRECDES = ' + QuotedStr(_CdsAltTipo.FieldByName('CODTIPRECDES').AsString) + ' AND ' +
                      ' RECPAG = ' + QuotedStr(_CdsAltTipo.FieldByName('RECPAG').AsString) + ' AND ' +
                      ' CODCENTRORESPON = ' + QuotedStr(_CdsAltTipo.FieldByName('CODCENTRORESPON').AsString) + ' AND ' +
                      ' UNIDNEGOC = ' + QuotedStr(_CdsAltTipo.FieldByName('UNIDNEGOC').AsString);
              if not ExecSQL(sSQL) then
                raise Exception.Create(MessageInfo)
              else
                begin
                  // Marcio Motta - 05/04/2005 - 18043
                  CMDebugToFile ('INÍCIO UPDATE na Tabela RATEIODOCUM*****************', 'c:\LogCPagar.TXT');
                  CMDebugToFile ('sSql = ' + sSql, 'c:\LogCPagar.TXT');
                  CMDebugToFile ('INÍCIO UPDATE na Tabela RATEIODOCUM*****************', 'c:\LogCPagar.TXT');
                end;
            end;
            _CdsAltTipo.Next;
          end;
        end;
      end;
      Commit;
      LstSQL.Free;
      Result := trunc(rPlnCodigo);
    except
      on E:Exception do
      begin
        if LstSQL <> Nil then LstSQL.Free;
        Result := -1;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;

end;

end.
