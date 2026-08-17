unit uCtrlPrePlanilhaRPP;
//------------------------------------------------------------------------------
//Pendência: MIGRACAO-ORACLE
//Analista : edilaine
//Data     : 13/10/2025
//Solução  : remover concatenaçao de espaços nas contas contábeis
//           mudança de CHAR para VARCHAR2 na migração
//==============================================================================
// Rotinas   : Diversas
// Data      : 14/03/2005
// Autor     : Alex Pereira
// Pendência : 18814
// Descrição : Implementação do filtro por plano e patro (seleção de planilhas)
//             na execução do processo
//------------------------------------------------------------------------------

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask,CMProcura,DBTables,uCtrlPrePlanilha,
     uCMSqlParams, uCMTypes,
     uCtrlLancamento, uCtrlHistoContab;

  Type

    TCtrlPrePlanilhaRPP = Class(TCtrlPrePlanilha)

    private

      Lancamento: TCtrlLancamento;
      HistoContab   : TCtrlHistoContab;

      FsMensAPS_Log: String;
      FMaxProgresso: Integer;
      FProgresso: Integer;
      FNomeRateio: string;
    FNomeCampo: string;
      procedure SetsMensAPS_Log(const Value: String);
      procedure SetNomeRateio(const Value: string);
    procedure SetNomeCampo(const Value: string);

    protected

      procedure AfterInitialize;override;

    public

      destructor Destroy; Override;
      constructor Create;  Override;

      {Esta função tem como finalidade trazer os detalhes do cadastro pre-planilha (rateio por plano e patro}
      function ListCdsDetalheRPP(dPanCodigo :Double; const sPanOrigem: string = '') :OleVariant;

      function GeraRateioPorPPrevePatro(dEmpresa: Double;
                                        iUsuario, iPlano, iExercicio, iPeriodo: Integer; sTipoOper,
                                        sDataGera,sTipoFecha: string; bUsaPPatro: Boolean;
                                        const iPancodigo: integer): Boolean;

      property sMensAPS_Log : String read FsMensAPS_Log write SetsMensAPS_Log;
      property MaxProgresso : Integer read FMaxProgresso;
      property Progresso: Integer read FProgresso;
      property NomeRateio : string read FNomeRateio write SetNomeRateio;
      property NomeCampo : string read FNomeCampo write SetNomeCampo;
   End;


implementation

function TCtrlPrePlanilhaRPP.ListCdsDetalheRPP(dPanCodigo :Double; const sPanOrigem: string) :OleVariant;
var
  sSql :string;
begin
      sSql := 'SELECT ' +
              '     PANCODIGO,         ' +
              '     PANNUMLANC,        ' +
              '     PLANO,             ' +
              '     PANCONTABASE,      ' +
              '     IDPESSOA,          ' +
              '     IDUSUARIOINCLUSAO, ' +
              '     HITCODHIST,        ' +
              '     PANORIGEM,         ' +
              '     PANTIPO,           ' +
              '     CODCENTROCUSTO,    ' +
              '     IDEMPRESA,         ' +
              '     UNIDNEGOC,         ' +
              '     CODSUBCONTA,       ' +
              '     IDPLANOPREV,       ' +
              '     IDPATRO,           ' +
              '     DECODE(PANORIGEM,''O'',PANCONTABASE,'' '') AS CONTABASE,    ' +
              '     DECODE(PANORIGEM,''D'',PANCONTABASE,'' '') AS CONTADESTINO, ' +
              '     DECODE(PANORIGEM,''C'',PANCONTABASE,'' '') AS CONTRAPARTIDA ' +
              'FROM ' +
              '     PREDETALHE ' +
              'WHERE (PANCODIGO = '+ FloatToStr(dPanCodigo) + ') ';

              if sPanOrigem <> '' then
                 sSql := sSql + '     AND (PANORIGEM = ' + QuotedStr(sPanOrigem) + ') ';

              sSql := sSql + 'ORDER BY PANORIGEM, PANCONTABASE ';

      Result := GetDataPacket(sSql);

end;

function TCtrlPrePlanilhaRPP.GeraRateioPorPPrevePatro(dEmpresa: Double;
  iUsuario, iPlano, iExercicio, iPeriodo: Integer; sTipoOper,
  sDataGera,sTipoFecha: string; bUsaPPatro: Boolean; const iPancodigo: integer): Boolean;

var
    cTipoLanc :char;
    dAcuCor, dAcuOfi, dAcuGer, dAcuGer1, dAcuGer2, dAcuHist, dValCor,dPlnCodigo,dTotLanc : Double;
    dValLanc,dValOfi,dValGe1,dValGe2,dValGe3,dvalhistdeb,dTotal,dPercentual :Double;
    sMens,sContaD,sContaC,sCCustoD,sCCustoC,sNumDoc,sHistoricoOri,sHistPad,sConta,sCCusto : string;
    iSubContaC,iSubContaD,iModulo,iPlanoPrev,iPatro,iUnidNegoc,iCodPlano,iX :Integer;

    bAchou :Boolean;
    sContaDebito, sContaCredito,sPlanoPrev,sPatro : string;

    sHist1,sHist2,sHist3,sHist4,sHist5,sHistorico :string;

    _sqlSaldosD        : TCMSqlParams;
    _sqlUpdPlanilha    : TCMSqlParams;
    _sqlSaldosDPP      : TCMSqlParams;
    _sqlSaldosOT       : TCMSqlParams;
    _sqlSaldosO        : TCMSqlParams;
    _sqlPlanoPrevOri   : TCMSqlParams;
    _sqlHistoPadrao    : TCMSqlParams;
    _sqlBuscaContaxCC  : TCMSqlParams;
    _sqlPlanilhaGerada : TCMSqlParams;
    _sqlInsContasxCC   : TCMSqlParams;

    _cdsBuscaContaxCC : TClientDataSet;
    _cdsHistoPadrao   : TClientDataSet;
    _cdsRateio        : TClientDataSet;
    _cdsContasRef     : TClientDataSet;
    _cdsVerifPlanil   : TClientDataSet;
    _cdsSaldosDPP     : TClientDataSet;
    _cdsSaldosD       : TClientDataSet;
    _cdsSaldosOT      : TClientDataSet;
    _cdsSaldosO       : TClientDataSet;
    _cdsPlanilhaGerada: TClientDataSet;
    _cdsPlanoPrevOri  : TClientDataSet;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GeraRateioPorPPrevePatro(dEmpresa,iUsuario,iPlano,
                         iExercicio,iPeriodo,sTipoOper, sDataGera,sTipoFecha,bUsaPPatro,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         FsMensAPS_Log := Connection.AppServer.MessageInfo;


   End Else
   Begin
      FMaxProgresso := 0;
      FProgresso    := 0;
      sMens         := '';
      FsMensAPS_Log := '';
      MessageInfo   := '*';
      iModulo       := 1;
      dPlnCodigo    := 0;
      sContaDebito  := '';
      sContaCredito := '';
      iSubContaC    := 0;
      iSubContaD    := 0;
      iUnidNegoc    := 0;

      _sqlSaldosD  := TCMSqlParams.Create(nil);
      _sqlSaldosD.ControlObject := Self;

      _sqlUpdPlanilha  := TCMSqlParams.Create(nil);
      _sqlUpdPlanilha.ControlObject := Self;

      _sqlHistoPadrao  := TCMSqlParams.Create(nil);
      _sqlHistoPadrao.ControlObject := Self;

      _sqlSaldosDPP  := TCMSqlParams.Create(nil);
      _sqlSaldosDPP.ControlObject := Self;

      _sqlSaldosOT  := TCMSqlParams.Create(nil);
      _sqlSaldosOT.ControlObject := Self;

      _sqlSaldosO  := TCMSqlParams.Create(nil);
      _sqlSaldosO.ControlObject := Self;

      _sqlPlanoPrevOri  := TCMSqlParams.Create(nil);
      _sqlPlanoPrevOri.ControlObject := Self;

      _sqlHistoPadrao  := TCMSqlParams.Create(nil);
      _sqlHistoPadrao.ControlObject := Self;

      _sqlPlanilhaGerada  := TCMSqlParams.Create(nil);
      _sqlPlanilhaGerada.ControlObject := Self;

      _sqlInsContasxCC  := TCMSqlParams.Create(nil);
      _sqlInsContasxCC.ControlObject := Self;

      _cdsHistoPadrao   := TClientDataSet.Create(nil);
      _cdsRateio        := TClientDataSet.Create(nil);
      _cdsContasRef     := TClientDataSet.Create(nil);
      _cdsVerifPlanil   := TClientDataSet.Create(nil);
      _cdsSaldosDPP     := TClientDataSet.Create(nil);
      _cdsSaldosD       := TClientDataSet.Create(nil);
      _cdsSaldosOT      := TClientDataSet.Create(nil);
      _cdsSaldosO       := TClientDataSet.Create(nil);
      _cdsPlanilhaGerada:= TClientDataSet.Create(nil);
      _cdsPlanoPrevOri  := TClientDataSet.Create(nil);

      //=========================================
      _sqlSaldosD.SQL.Clear;
      _sqlSaldosD.SQL.Add('SELECT U.IDPLANOPREV,U.IDPATRO,                                           ');
      _sqlSaldosD.SQL.Add('   SUM(DECODE(U.SALDO,NULL,0,U.SALDO)) AS SALDOCOR                        ');
      _sqlSaldosD.SQL.Add('FROM                                                                      ');
      _sqlSaldosD.SQL.Add('   ((SELECT                                                               ');
      _sqlSaldosD.SQL.Add('       IDPLANOPREV, IDPATRO,                                              ');
      _sqlSaldosD.SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)          ');
      _sqlSaldosD.SQL.Add('       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO          ');
      _sqlSaldosD.SQL.Add('    FROM PLANOSALDO                                                       ');
      _sqlSaldosD.SQL.Add('    WHERE (PLANO =:PLANO) AND                                             ');
      _sqlSaldosD.SQL.Add('          (PEREXERCICIO =:PEREXERCICIO) AND                               ');
      _sqlSaldosD.SQL.Add('          ((PERNUMERO <:PERNUMERO) OR (PERNUMERO IS NULL)) AND            ');
      _sqlSaldosD.SQL.Add('          (IDPESSOA =:IDPESSOA) AND                                       ');
      _sqlSaldosD.SQL.Add('          (PLACONTA = :CONTAINI)                                          ');
      _sqlSaldosD.SQL.Add('    GROUP BY IDPLANOPREV, IDPATRO)                                        ');
      _sqlSaldosD.SQL.Add('     UNION                                                                ');
      _sqlSaldosD.SQL.Add('   (SELECT L.IDPLANOPREV, L.IDPATRO,                                      ');
      _sqlSaldosD.SQL.Add('           SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO ');
      _sqlSaldosD.SQL.Add('    FROM PLANILHA P, LANCAMENTO L                                         ');
      _sqlSaldosD.SQL.Add('    WHERE (L.PLANO =:PLANO) AND                                           ');
      _sqlSaldosD.SQL.Add('          (P.PEREXERCICIO =:PEREXERCICIO) AND                             ');
      _sqlSaldosD.SQL.Add('          (P.PERNUMERO =:PERNUMERO) AND                                   ');
      _sqlSaldosD.SQL.Add('          (P.IDPESSOA =:IDPESSOA) AND                                     ');
      _sqlSaldosD.SQL.Add('          (P.PLNDATDIA <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND             ');
      _sqlSaldosD.SQL.Add('          (P.PLNEFETIVADO = ''S'') AND                                      ');
      _sqlSaldosD.SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                                 ');
      _sqlSaldosD.SQL.Add('          (L.PLACONTA LIKE :CONTAINIL)                                    ');
      _sqlSaldosD.SQL.Add('    GROUP BY L.IDPLANOPREV, L.IDPATRO)                                    ');
      _sqlSaldosD.SQL.Add('          ) U                                                             ');
      _sqlSaldosD.SQL.Add('GROUP BY U.IDPLANOPREV,U.IDPATRO                                          ');
      //=========================================
      _sqlPlanoPrevOri.SQL.Clear;
      _sqlPlanoPrevOri.SQL.Add('SELECT IDPLANOPREV, IDPATRO,     ');
      _sqlPlanoPrevOri.SQL.Add('   ''N'' AS CALC,  (0) AS VALOR  ');
      _sqlPlanoPrevOri.SQL.Add('FROM LANCAMENTO                  ');
      _sqlPlanoPrevOri.SQL.Add('WHERE   (1 = 2)                  ');
      _cdsPlanoPrevOri.Data := _sqlPlanoPrevOri.Data;
      //=========================================

      _cdsRateio.Data := ListPrePlanilha(iPancodigo, dEmpresa, 'T');

      FMaxProgresso := _cdsRateio.RecordCount;

      _cdsRateio.First;

      try
         While not _cdsRateio.EOF do
         Begin

           MessageInfo := 'a';
           FNomeRateio := 'Gerando Rateio : '+_cdsRateio.FieldByName('PANDESCRICAO').AsString;

           Try

              StartTransaction;

              //=== Verifica se a planilha já foi gerada para ser excluida. ===
              _cdsVerifPlanil.Data := ListVerifPlanil(_cdsRateio.FieldByName('PANCODIGO').AsInteger, trunc(dEmpresa), sDataGera);

              If not _cdsVerifPlanil.isEmpty then
              Begin
                 // se o flag PARAMCONTAB.PACNAOAPAGAPLANIL estiver ligado
                 // é necessáriao apagar o PLANILHA.PANCODIGO senão da erro na 2 exclusão
                 // pois a planilha não é excluida
                 ExecSQL ('UPDATE PLANILHA SET PANCODIGO = NULL WHERE PLNCODIGO = ' + IntToStr(_cdsVerifPlanil.FieldByName('PLNCODIGO').asInteger));

                 If not Lancamento.ExcluiLancaContab(iUsuario,_cdsVerifPlanil.FieldByName('PLNCODIGO').asInteger,
                                     iModulo, 0,bUsaPPatro, True) Then
              Begin
                     sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                     Raise Exception.Create(Lancamento.MessageInfo);
                 End;
                 MessageInfo := 'Excluída a Planilha no. ' + _cdsVerifPlanil.FieldByName('PLNPLANIL').asString+ ' do dia '+sDataGera;
              End;


              //== pega as contas de referencia ===
              _cdsContasRef.Data := ListCdsDetalheRPP(_cdsRateio.FieldByName('PANCODIGO').AsFloat, 'C');
              _cdsContasRef.First;
               while not _cdsContasRef.EOF do
               begin
                  if _cdsContasRef.FieldByName('PANTIPO').AsString = 'D' then
                     sContaDebito  := _cdsContasRef.FieldByName('PANCONTABASE').AsString
                  else
                     sContaCredito := _cdsContasRef.FieldByName('PANCONTABASE').AsString;
                  _cdsContasRef.Next;
               end;

               //=== escreve sql plano previvenciario ====
               _cdsContasRef.Data := ListCdsDetalheRPP(_cdsRateio.FieldByName('PANCODIGO').AsFloat, 'O');

               dTotal     := 0;
               sPlanoPrev := '';
               sPatro     := '';

               _cdsContasRef.First;
               While not _cdsContasRef.EOF do
               Begin
                  _sqlSaldosD.Prepare;
                  //_sqlSaldosD.ParamByName('CONTAINI').AsString      := Copy(_cdsContasRef.FieldByName('PANCONTABASE').AsString+'                  ',1,18);  //MIGRACAO-ORACLE
                  _sqlSaldosD.ParamByName('CONTAINI').AsString      := trim(_cdsContasRef.FieldByName('PANCONTABASE').AsString);                              //MIGRACAO-ORACLE
                  _sqlSaldosD.ParamByName('CONTAINIL').AsString     := trim(_cdsContasRef.FieldByName('PANCONTABASE').AsString)+'%';
                  _sqlSaldosD.ParamByName('PLANO').AsInteger        := _cdsContasRef.FieldByName('PLANO').AsInteger;
                  _sqlSaldosD.ParamByName('PEREXERCICIO').AsInteger := iExercicio;

                  if sTipoFecha = 'D' then
                     _sqlSaldosD.ParamByName('PERNUMERO').AsInteger := iPeriodo
                  else
                     _sqlSaldosD.ParamByName('PERNUMERO').AsInteger := iPeriodo-1;

                  _sqlSaldosD.ParamByName('IDPESSOA').AsFloat     := dEmpresa;

                  if sTipoFecha = 'D' then
                     _sqlSaldosD.ParamByName('DATAREF').AsString := DateToStr(StrToDate(sDataGera)-1);

                  _cdsSaldosD.Data := _sqlSaldosD.Data;
                  _cdsSaldosD.First;
                  while not _cdsSaldosD.EOF do
                  begin
                     if ((_cdsContasRef.FieldByName('IDPLANOPREV').IsNull) or (_cdsContasRef.FieldByName('IDPLANOPREV').AsInteger = _cdsSaldosD.FieldByName('IDPLANOPREV').AsInteger)) and
                        ((_cdsContasRef.FieldByName('IDPATRO').IsNull) or (_cdsContasRef.FieldByName('IDPATRO').AsInteger = _cdsSaldosD.FieldByName('IDPATRO').AsInteger)) then
                     begin
                        dTotal := dTotal + _cdsSaldosD.FieldByName('SALDOCOR').AsFloat;
                        bAchou := False;
                        _cdsPlanoPrevOri.First;
                        while not _cdsPlanoPrevOri.EOF do
                        begin
                           if (_cdsPlanoPrevOri.FieldByName('IDPLANOPREV').AsInteger = _cdsSaldosD.FieldByName('IDPLANOPREV').AsInteger) and
                              (_cdsPlanoPrevOri.FieldByName('IDPATRO').AsInteger = _cdsSaldosD.FieldByName('IDPATRO').AsInteger) then
                           begin
                              bAchou := True;
                              _cdsPlanoPrevOri.Edit;
                              _cdsPlanoPrevOri.FieldByName('VALOR').AsFloat := _cdsPlanoPrevOri.FieldByName('VALOR').AsFloat + _cdsSaldosD.FieldByName('SALDOCOR').AsFloat;
                              _cdsPlanoPrevOri.Post;
                              Break;
                           end;
                           _cdsPlanoPrevOri.Next;
                        end;
                        if not bAchou then begin
                           _cdsPlanoPrevOri.Insert;
                           _cdsPlanoPrevOri.FieldByName('IDPLANOPREV').AsInteger := _cdsSaldosD.FieldByName('IDPLANOPREV').AsInteger;
                           _cdsPlanoPrevOri.FieldByName('IDPATRO').AsInteger     := _cdsSaldosD.FieldByName('IDPATRO').AsInteger;
                           _cdsPlanoPrevOri.FieldByName('VALOR').AsFloat         := _cdsSaldosD.FieldByName('SALDOCOR').AsFloat;
                           _cdsPlanoPrevOri.FieldByName('CALC').AsString         := 'N';
                           _cdsPlanoPrevOri.Post;
                           if not _cdsContasRef.FieldByName('IDPLANOPREV').IsNull then
                           begin
                              if sPlanoPrev = '' then
                                 sPlanoPrev := _cdsSaldosD.FieldByName('IDPLANOPREV').AsString
                              else
                                 sPlanoPrev := sPlanoPrev + ','+ _cdsSaldosD.FieldByName('IDPLANOPREV').AsString;
                           end;
                           if not _cdsContasRef.FieldByName('IDPATRO').IsNull then
                           begin
                              if sPatro = '' then
                                 sPatro := _cdsSaldosD.FieldByName('IDPATRO').AsString
                              else
                                 sPatro := sPatro + ','+ _cdsSaldosD.FieldByName('IDPATRO').AsString;
                           end;
                        end;
                     end;
                     _cdsSaldosD.Next;
                  end;
                  _cdsContasRef.Next;
               end;
               sNumDoc        := 'Rat.Plano/Patro';
               sHistorico     := '';
               sHistPad       := '';
               cTipoLanc      := '2';
               iPlanoPrev     := 0;
               iPatro         := 0;
               iCodPlano      := iPlano;
               _cdsContasRef.Data := ListCdsDetalheRPP(_cdsRateio.FieldByName('PANCODIGO').AsFloat, 'D');

               _cdsContasRef.First;
               while not _cdsContasRef.EOF do
               begin

                  _sqlSaldosOT.SQL.Clear;
                  _sqlSaldosOT.SQL.Add('SELECT  /*+ INDEX LANCAMENTO */                                              ');
                  _sqlSaldosOT.SQL.Add('       L.PLACONTA, L.CODSUBCONTA,                                            ');

                  if _cdsContasRef.FieldByName('CODCENTROCUSTO').isNull then
                     _sqlSaldosOT.SQL.Add('       L.CODCENTROCUSTO, L.IDEMPRESA,                                        ');

                  if _cdsContasRef.FieldByName('UNIDNEGOC').isNull then
                     _sqlSaldosOT.SQL.Add('       L.UNIDNEGOC,                                                          ');

                  _sqlSaldosOT.SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOTOT ');
                  _sqlSaldosOT.SQL.Add('FROM PLANILHA P, LANCAMENTO L                                                ');
                  _sqlSaldosOT.SQL.Add('WHERE (L.PLACONTA LIKE :PLACONTA) AND                                        ');
                  _sqlSaldosOT.SQL.Add('      (L.PLANO = :PLANO) AND                                                 ');
                  _sqlSaldosOT.SQL.Add('      (P.PEREXERCICIO = :PEREXERCICIO) AND                                   ');
                  _sqlSaldosOT.SQL.Add('      (P.PERNUMERO = :PERNUMERO) AND                                         ');
                  _sqlSaldosOT.SQL.Add('      (P.IDPESSOA = :IDPESSOA) AND                                           ');
                  _sqlSaldosOT.SQL.Add('      (P.PLNEFETIVADO = ''S'') AND                                           ');

                  if sTipoFecha = 'D' then
                     _sqlSaldosOT.SQL.Add('      (P.PLNDATDIA <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND                   ');

                  if sPlanoPrev <> '' then
                     _sqlSaldosOT.SQL.Add('      (L.IDPLANOPREV IN ('+sPlanoPrev+')) AND ');

                  if sPatro <> '' then
                     _sqlSaldosOT.SQL.Add('      (L.IDPATRO IN ('+sPatro+')) AND ');

                  _sqlSaldosOT.SQL.Add('      (P.PLNCODIGO = L.PLNCODIGO)                                            ');
                  _sqlSaldosOT.SQL.Add('GROUP BY L.PLACONTA,                                                         ');

                  if _cdsContasRef.FieldByName('CODCENTROCUSTO').isNull then
                     _sqlSaldosOT.SQL.Add('        L.CODCENTROCUSTO, L.IDEMPRESA,                                     ');

                  if _cdsContasRef.FieldByName('UNIDNEGOC').isNull then
                     _sqlSaldosOT.SQL.Add('        L.UNIDNEGOC,                                                       ');

                  _sqlSaldosOT.SQL.Add('        L.CODSUBCONTA                                                      ');

                  sHistoricoOri := _cdsRateio.FieldByName('PANDESCRICAO').asString;
                  sHistPad      := '';
                  if not _cdsContasRef.FieldByName('HITCODHIST').IsNull then
                  begin
                     _sqlHistoPadrao.SQL.Clear;
                     _sqlHistoPadrao.SQL.Add('SELECT HITCODHIST, HITDESCR1     ');
                     _sqlHistoPadrao.SQL.Add('FROM HISTOPADRAO                 ');
                     _sqlHistoPadrao.SQL.Add('WHERE (IDPESSOA = :IDPESSOA) AND ');
                     _sqlHistoPadrao.SQL.Add('     (HITCODHIST = :HITCODHIST)  ');

                     _sqlHistoPadrao.Prepare;
                     _sqlHistoPadrao.ParamByName('IDPESSOA').AsFloat    := dEmpresa;
                     _sqlHistoPadrao.ParamByName('HITCODHIST').AsString := Copy(_cdsContasRef.FieldByName('HITCODHIST').AsString+'    ',1,4);
                     _cdsHistoPadrao.Data := _sqlHistoPadrao.Data;

                     if not _cdsHistoPadrao.IsEmpty then begin
                        sHistoricoOri := _cdsHistoPadrao.FieldByName('HITDESCR1').asString;
                        sHistPad      := _cdsContasRef.FieldByName('HITCODHIST').AsString;
                     end;
                  end;
                  //
                  _sqlSaldosOT.Prepare;
                  _sqlSaldosOT.ParamByName('PLACONTA').AsString      := trim(_cdsContasRef.FieldByName('PANCONTABASE').AsString)+'%';
                  _sqlSaldosOT.ParamByName('PLANO').AsInteger        := _cdsContasRef.FieldByName('PLANO').AsInteger;
                  _sqlSaldosOT.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
                  _sqlSaldosOT.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
                  _sqlSaldosOT.ParamByName('IDPESSOA').AsFloat       := dEmpresa;

                  if sTipoFecha = 'D' then
                     _sqlSaldosOT.ParamByName('DATAREF').AsString := sDataGera;

                  _cdsSaldosOT.Data := _sqlSaldosOT.Data;

                  _cdsSaldosOT.First;
                  while not _cdsSaldosOT.EOF do
                  begin

                     _sqlSaldosO.SQL.Clear;
                     _sqlSaldosO.SQL.Add('SELECT  /*+ INDEX LANCAMENTO */                                               ');
                     _sqlSaldosO.SQL.Add('       L.PLACONTA, L.CODSUBCONTA,                                             ');
                     _sqlSaldosO.SQL.Add('       L.IDPLANOPREV, L.IDPATRO,                                              ');
                     _sqlSaldosO.SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOCOR  ');
                     _sqlSaldosO.SQL.Add('FROM PLANILHA P, LANCAMENTO L                                                 ');
                     _sqlSaldosO.SQL.Add('WHERE (L.PLACONTA = :PLACONTA) AND                                            ');
                     _sqlSaldosO.SQL.Add('      (L.PLANO = :PLANO) AND                                                  ');
                     _sqlSaldosO.SQL.Add('      (P.PEREXERCICIO = :PEREXERCICIO) AND                                    ');
                     _sqlSaldosO.SQL.Add('      (P.PERNUMERO = :PERNUMERO) AND                                          ');
                     _sqlSaldosO.SQL.Add('      (P.IDPESSOA = :IDPESSOA) AND                                            ');
                     _sqlSaldosO.SQL.Add('      (P.PLNEFETIVADO = ''S'') AND                                            ');

                     if _cdsContasRef.FieldByName('CODCENTROCUSTO').isNull then
                     begin
                        if _cdsSaldosOT.FieldByName('CODCENTROCUSTO').isNull then
                        begin
                           _sqlSaldosO.SQL.Add('    (L.CODCENTROCUSTO IS NULL) AND                                      ');
                        end else
                        begin
                           //_sqlSaldosO.SQL.Add('    (L.CODCENTROCUSTO = '''+Copy(_cdsSaldosOT.FieldByName('CODCENTROCUSTO').AsString + '          ',1,10)+''') AND ');  //MIGRACAO-ORACLE
                           _sqlSaldosO.SQL.Add('    (L.CODCENTROCUSTO = '''+trim(_cdsSaldosOT.FieldByName('CODCENTROCUSTO').AsString)+''') AND     ');                  //MIGRACAO-ORACLE
                           _sqlSaldosO.SQL.Add('    (L.IDEMPRESA = '+_cdsSaldosOT.FieldByName('IDEMPRESA').AsString+') AND      ');
                        end;
                     end;
                     if _cdsContasRef.FieldByName('UNIDNEGOC').isNull then
                     begin
                        if not _cdsSaldosOT.FieldByName('UNIDNEGOC').isNull then
                         begin
                           _sqlSaldosO.SQL.Add('    (L.UNIDNEGOC = '+_cdsSaldosOT.FieldByName('UNIDNEGOC').AsString+') AND     ');
                        end else begin
                           _sqlSaldosO.SQL.Add('    (L.UNIDNEGOC IS NULL) AND                                                 ');
                        end;
                     end;

                     if sTipoFecha = 'D' then
                        _sqlSaldosO.SQL.Add('      (P.PLNDATDIA <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND                    ');
                     if sPlanoPrev <> '' then
                        _sqlSaldosO.SQL.Add('      (L.IDPLANOPREV IN ('+sPlanoPrev+')) AND ');
                     if sPatro <> '' then
                        _sqlSaldosO.SQL.Add('      (L.IDPATRO IN ('+sPatro+')) AND ');

                     _sqlSaldosO.SQL.Add('      (P.PLNCODIGO = L.PLNCODIGO)                                             ');
                     _sqlSaldosO.SQL.Add('GROUP BY L.PLACONTA,                                                          ');
                     _sqlSaldosO.SQL.Add('         L.IDPLANOPREV, L.IDPATRO, L.CODSUBCONTA                              ');
                     _sqlSaldosO.SQL.Add('ORDER BY L.PLACONTA,                                                          ');
                     _sqlSaldosO.SQL.Add('         L.CODSUBCONTA, L.IDPLANOPREV, L.IDPATRO                              ');

                     _sqlSaldosO.Prepare;
                     //_sqlSaldosO.ParamByName('PLACONTA').AsString      := Copy(_cdsSaldosOT.FieldByName('PLACONTA').AsString+'                  ',1,18);  //MIGRACAO-ORACLE
                     _sqlSaldosO.ParamByName('PLACONTA').AsString      := trim(_cdsSaldosOT.FieldByName('PLACONTA').AsString);                              //MIGRACAO-ORACLE
                     _sqlSaldosO.ParamByName('PLANO').AsInteger        := _cdsContasRef.FieldByName('PLANO').AsInteger;
                     _sqlSaldosO.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
                     _sqlSaldosO.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
                     _sqlSaldosO.ParamByName('IDPESSOA').AsFloat       := dEmpresa;

                     if sTipoFecha = 'D' then
                        _sqlSaldosO.ParamByName('DATAREF').AsString    := sDataGera;

                     _cdsSaldosO.Data := _sqlSaldosO.Data;

                     dTotLanc       := 0;
                     _cdsPlanoPrevOri.First;
                     while not _cdsPlanoPrevOri.EOF do
                     begin
                        _cdsPlanoPrevOri.Edit;
                        _cdsPlanoPrevOri.FieldByName('CALC').AsString := 'N';
                        _cdsPlanoPrevOri.Post;
                        _cdsPlanoPrevOri.Next;
                     end;

                     _cdsSaldosO.First;
                     while not _cdsSaldosO.EOF do
                     begin
                        If (_cdsSaldosO.FieldByName('CODSUBCONTA').AsInteger = _cdsSaldosOT.FieldByName('CODSUBCONTA').AsInteger) then
                        Begin
                           iPlanoPrev  := _cdsSaldosO.FieldByName('IDPLANOPREV').AsInteger;
                           iPatro      := _cdsSaldosO.FieldByName('IDPATRO').AsInteger;
                           dPercentual := 0;
                           _cdsPlanoPrevOri.First;
                           while not _cdsPlanoPrevOri.EOF do
                           begin
                              if (_cdsPlanoPrevOri.FieldByName('IDPLANOPREV').AsInteger = _cdsSaldosO.FieldByName('IDPLANOPREV').AsInteger) and
                                 (_cdsPlanoPrevOri.FieldByName('IDPATRO').AsInteger = _cdsSaldosO.FieldByName('IDPATRO').AsInteger) then begin
                                 if dTotal <> 0 then
                                    dPercentual := (_cdsPlanoPrevOri.FieldByName('VALOR').AsFloat/dTotal);
                                 _cdsPlanoPrevOri.Edit;
                                 _cdsPlanoPrevOri.FieldByName('CALC').AsString := 'S';
                                 _cdsPlanoPrevOri.Post;
                                 Break;
                              end;
                              _cdsPlanoPrevOri.Next;
                           end;
                           //
                           sHistorico := sHistoricoOri+' '+format('%18.7f', [dPercentual*100])+'%';

                           HistoContab.ArrumaHistorico(sHistorico);

                           dValLanc := (_cdsSaldosOT.FieldByName('SALDOTOT').AsFloat * dPercentual);
                           dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                           dTotLanc := dTotLanc + dValLanc;
                           dValLanc := dValLanc - _cdsSaldosO.FieldByName('SALDOCOR').AsFloat;
                           if dValLanc > 0 then
                              sConta := sContaCredito
                           else
                              sConta := sContaDebito;

                           sContaD   := _cdsSaldosO.FieldByName('PLACONTA').AsString;
                           if _cdsContasRef.FieldByName('CODCENTROCUSTO').isNull then
                              sCCustoD    := _cdsSaldosOT.FieldByName('CODCENTROCUSTO').AsString
                           else
                              sCCustoD    := _cdsContasRef.FieldByName('CODCENTROCUSTO').AsString;

                           if _cdsContasRef.FieldByName('UNIDNEGOC').isNull then
                           begin
                              if _cdsSaldosOT.FieldByName('UNIDNEGOC').AsString = '' then
                                iUnidNegoc := 0
                              else
                                 iUnidNegoc := StrToInt(_cdsSaldosOT.FieldByName('UNIDNEGOC').AsString);
                           end else
                           begin
                              if _cdsContasRef.FieldByName('UNIDNEGOC').AsString = '' then
                                 iUnidNegoc := 0
                              else
                                 iUnidNegoc := StrToInt(_cdsContasRef.FieldByName('UNIDNEGOC').AsString);
                           end;
                           if _cdsSaldosO.FieldByName('CODSUBCONTA').AsString = '' then
                              iSubContaD := 0
                           else
                              iSubContaD := StrToInt(_cdsSaldosO.FieldByName('CODSUBCONTA').AsString);

                           sContaC    := sConta;
                           sCCustoC   := '';
                           iSubContaC := 0;

                           //Faz o lançamento
                           FNomeCampo := 'Gerando Conta : ' + sContaD;
                           if dValLanc <> 0 then
                           Begin
                              dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                              If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                        iCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                        iPlanoPrev, iPatro,dPlnCodigo,0,
                                                        sDataGera,sNumDoc,HistoContab.Hist1,
                                                        HistoContab.Hist2,HistoContab.Hist3,
                                                        HistoContab.Hist4,HistoContab.Hist5,
                                                        sTipoOper,sCCustoD,sContaD,
                                                        sCCustoC,sContaC, sHistPad,
                                                        dValLanc,False,bUsaPPatro) Then

                              Begin
                                 sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                                 Raise Exception.Create(Lancamento.MessageInfo);
                              End Else
                              Begin
                                 dPlnCodigo := Lancamento.RetornoPlnCodigo;
                              End;

                           End;

                        End;
                        _cdsSaldosO.Next;
                     End;

                     //Complementa Lançamentos
                     _cdsPlanoPrevOri.First;
                     While not _cdsPlanoPrevOri.EOF do
                     Begin
                        If _cdsPlanoPrevOri.FieldByName('CALC').AsString = 'N' then
                        Begin
                           dPercentual:=0;
                           if dTotal <> 0 then
                              dPercentual := (_cdsPlanoPrevOri.FieldByName('VALOR').AsFloat/dTotal);

                           dValLanc := (_cdsSaldosOT.FieldByName('SALDOTOT').AsFloat * dPercentual);
                           dValLanc := StrToFloat(format('%18.2f', [dValLanc]));

                           if dValLanc > 0 then
                              sConta := sContaCredito
                           else
                              sConta := sContaDebito;
                           //
                           sHistorico := sHistoricoOri+' '+format('%18.7f', [dPercentual*100])+'%';

                           HistoContab.ArrumaHistorico(sHistorico);

                           if _cdsContasRef.FieldByName('CODCENTROCUSTO').isNull then
                              sCCustoD    := _cdsSaldosOT.FieldByName('CODCENTROCUSTO').AsString
                           else
                              sCCustoD    := _cdsContasRef.FieldByName('CODCENTROCUSTO').AsString;

                           if _cdsContasRef.FieldByName('UNIDNEGOC').isNull then
                           begin
                              if _cdsSaldosOT.FieldByName('UNIDNEGOC').AsString = '' then
                                iUnidNegoc := 0
                              else
                                 iUnidNegoc := StrToInt(_cdsSaldosOT.FieldByName('UNIDNEGOC').AsString)
                           end else
                           begin
                              if _cdsContasRef.FieldByName('UNIDNEGOC').AsString = '' then
                                iUnidNegoc := 0
                              else
                                iUnidNegoc := StrToInt(_cdsContasRef.FieldByName('UNIDNEGOC').AsString);
                           end;

                           sContaD    := _cdsSaldosOT.FieldByName('PLACONTA').AsString;

                           if _cdsSaldosOT.FieldByName('CODSUBCONTA').AsString = '' then
                             iSubContaD := 0
                           else
                             iSubContaD := StrToInt(_cdsSaldosOT.FieldByName('CODSUBCONTA').AsString);

                           iPlanoPrev := _cdsPlanoPrevOri.FieldByName('IDPLANOPREV').AsInteger;
                           iPatro     := _cdsPlanoPrevOri.FieldByName('IDPATRO').AsInteger;
                           sContaC    := sConta;
                           sCCustoC   := '';
                           iSubContaC := 0;

                           //Faz o lançamento
                           FNomeCampo := 'Gerando Conta : ' + sContaD;
                           If dValLanc <> 0 then
                           Begin
                              dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                              dTotLanc := dTotLanc + dValLanc;

                              If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                        iCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                        iPlanoPrev, iPatro,dPlnCodigo,0,
                                                        sDataGera,sNumDoc,HistoContab.Hist1,
                                                        HistoContab.Hist2,HistoContab.Hist3,
                                                        HistoContab.Hist4,HistoContab.Hist5,
                                                        sTipoOper,sCCustoD,sContaD,
                                                        sCCustoC,sContaC, sHistPad,
                                                        dValLanc,False,bUsaPPatro) Then

                              Begin
                                 sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                                 Raise Exception.Create(Lancamento.MessageInfo);
                              End Else
                              Begin
                                 dPlnCodigo := Lancamento.RetornoPlnCodigo;
                              End;
                           End;
                        End;
                        _cdsPlanoPrevOri.Next;
                     End;

                     If Format('%17.2f',[dTotLanc]) <> Format('%17.2f',[_cdsSaldosOT.FieldByName('SALDOTOT').AsFloat]) then
                     Begin
                        sHistorico := sHistoricoOri+' - Arredondamento';

                        HistoContab.ArrumaHistorico(sHistorico);

                        dValLanc := StrToFloat(format('%18.2f', [(_cdsSaldosOT.FieldByName('SALDOTOT').AsFloat-dTotLanc)]));
                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPatro,dPlnCodigo,0,
                                                  sDataGera,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC, sHistPad,
                                                  dValLanc,False,bUsaPPatro) Then

                        Begin
                           sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                           dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;
                     End;
                     _cdsSaldosOT.Next;
                  End;

                  _cdsContasRef.Next;
               End;

             //=========== Atualiza a tabela =========
             _sqlUpdPlanilha.SQL.Clear;
             _sqlUpdPlanilha.SQL.Add('UPDATE   PLANILHA            ');
             _sqlUpdPlanilha.SQL.Add('SET PANCODIGO = :PANCODIGO   ');
             _sqlUpdPlanilha.SQL.Add('WHERE  PLNCODIGO =:PLNCODIGO ');

             _sqlUpdPlanilha.Prepare;
             _sqlUpdPlanilha.ParamByName('PANCODIGO').asFloat := _cdsRateio.FieldByName('PANCODIGO').AsFloat;
             _sqlUpdPlanilha.ParamByName('PLNCODIGO').asFloat := dPlnCodigo;

             If not ExecSQL(_sqlUpdPlanilha.SQLChanged,False) Then
             Begin
                sMens := 'Erro ao Atualizar a Tabela PLANILHA.';
                Raise Exception.Create(sMens);
             End;

             //====== Verifica se a planilha foi gerada ======
             _sqlPlanilhaGerada.SQL.Clear;
             _sqlPlanilhaGerada.SQL.Add('SELECT   PLNPLANIL           ');
             _sqlPlanilhaGerada.SQL.Add('FROM  PLANILHA               ');
             _sqlPlanilhaGerada.SQL.Add('WHERE  PLNCODIGO =:PLNCODIGO ');

             _sqlPlanilhaGerada.Prepare;
             _sqlPlanilhaGerada.ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
             _cdsPlanilhaGerada.Data := _sqlPlanilhaGerada.Data;

             If not _cdsPlanilhaGerada.isEmpty then
             Begin
                MessageInfo := 'Gerada a Planilha no. ' + _cdsPlanilhaGerada.FieldByName('PLNPLANIL').asString;
                sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
             End;

             Commit;
             FNomeRateio := '';
             FNomeCampo  := '';

             Result := True;

             MessageInfo := 'Planilhas de Rateio geradas com sucesso!';

             sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);

             sMensAPS_Log := sMensAPS_Log + '************************************' + chr(13);


           Except
              on E:Exception Do
              Begin
                 RollBack;
                 Result := False;
                 FNomeRateio := '';
                 FNomeCampo  := '';

                 MessageInfo := 'Problemas na geração da Planilha '+_cdsRateio.FieldByName('PANDESCRICAO').AsString;

                 sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);

                 sMensAPS_Log := sMensAPS_Log + '**********************************' + chr(13);

                 FProgresso := 0;
                 MessageInfo := sMens+' '+E.Message;
              End
           End;

           FProgresso := FProgresso + 1;
           _cdsRateio.Next;
        End;

     finally
        _sqlUpdPlanilha.Free;
        _sqlSaldosDPP.Free;
        _sqlSaldosO.Free;
        _sqlSaldosD.Free;
        _sqlHistoPadrao.Free;
        _sqlInsContasxCC.Free;
        _sqlPlanilhaGerada.Free;

        _cdsPlanilhaGerada.Free;
        _cdsHistoPadrao.Free;
        _cdsRateio.Free;
        _cdsContasRef.Free;
        _cdsVerifPlanil.Free;
        _cdsSaldosDPP.Free;
        _cdsSaldosD.Free;
        _cdsSaldosO.Free;
     end;
  End;

end;



procedure TCtrlPrePlanilhaRPP.SetsMensAPS_Log(const Value: String);
begin
  FsMensAPS_Log := Value;
end;

procedure TCtrlPrePlanilhaRPP.SetNomeRateio(const Value: string);
begin
  FNomeRateio := Value;
end;

procedure TCtrlPrePlanilhaRPP.AfterInitialize;
begin
  Lancamento.InitializeAs (self);
  HistoContab.InitializeAs (self);
  inherited;
end;

constructor TCtrlPrePlanilhaRPP.Create;
begin
  inherited;
  Lancamento    := TCtrlLancamento.Create;
  HistoContab   := TCtrlHistoContab.Create;

end;

destructor TCtrlPrePlanilhaRPP.Destroy;
begin
  FreeAndNil (Lancamento);
  FreeAndNil (HistoContab);
  inherited;

end;

procedure TCtrlPrePlanilhaRPP.SetNomeCampo(const Value: string);
begin
  FNomeCampo := Value;
end;

end.

