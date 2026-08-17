unit uCtrlSegregacaoProc;

(*==============================================================================
Analista : Alex Pereira
Data     : 05/02/04
Pendência: 14451 Nova segregação de recursos
Solução  : Criação do Objeto derivado do TCtrlSegregacao
==============================================================================*)

interface

uses uCtrlSegregacao, uCMClientDataSet, uCMTypes, sysutils, uCtrlLancamento,
     uDbSegregacao, DB;

  Type

    TCtrlSegregacaoProc = Class(TCtrlSegregacao)

    private
      CtrlLancamento : TCtrlLancamento;
    FdbSegregacao: TDbSegregacao;
    procedure SetdbSegregacao(const Value: TDbSegregacao);

    protected

      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;

    public
      Destructor Destroy; Override;
      constructor Create;  Override;

      property dbSegregacao: TDbSegregacao read FdbSegregacao write SetdbSegregacao;

      function ProcessaSegregacao(sNomeBilhete, sDataLanc, sContaAjuste: string; const ovSelecionados, ovContaSegrega: OleVariant; const iIdUsuario, iExercicio, iPeriodo: integer; const bUsaPlanoPatro, bProcessa: boolean): boolean;
      function RetonraSegregacao(const iIdPessoa, iExercicio, iPerNumero, iIdSegregaCriter: integer): OleVariant;
      function RetornaSomaLancamentos(const iIdSegregaCriter, iExercicio, iPeriodo: integer): OleVariant;

    End;

implementation

{ TCtrlSegregacaoProc }

procedure TCtrlSegregacaoProc.AfterInitialize;
begin
  inherited;
  FdbSegregacao.DataBaseName := DataBaseName;
  CtrlLancamento.InitializeAs(self);
end;

constructor TCtrlSegregacaoProc.Create;
begin
  inherited;
  FdbSegregacao := TDbSegregacao.Create (self);
  CtrlLancamento := TCtrlLancamento.Create;
end;

destructor TCtrlSegregacaoProc.Destroy;
begin
  FreeAndNil (FdbSegregacao);
  FreeAndNil (CtrlLancamento);
  inherited;
end;

procedure TCtrlSegregacaoProc.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlSegregacaoProc.RetonraSegregacao(const iIdPessoa, iExercicio, iPerNumero,
  iIdSegregaCriter: integer): OleVariant;
var
  sSql: string;
begin
  sSql := 'SELECT ' + #13 +
          '   IDSEGREGACAO, IDPESSOA, PEREXERCICIO, PERNUMERO, ' + #13 +
          '   IDSEGREGACRITER, PLNCODIGO ' + #13 +
          'FROM ' + #13 +
          '   SEGREGACAO ' + #13 +
          'WHERE ' + #13 +
          '   (IDPESSOA = '           + IntToStr (iIdPessoa)  + ')' + #13 +
          '   AND (PEREXERCICIO = '   + IntToStr (iExercicio) + ')' + #13 +
          '   AND (PERNUMERO = '      + IntToStr (iPerNumero) + ')' + #13 +
          '   AND (IDSEGREGACRITER = '+ IntToStr (iIdSegregaCriter) + ')';
  Result := GetDataPacket(sSql);
end;

function TCtrlSegregacaoProc.RetornaSomaLancamentos(const iIdSegregaCriter,
  iExercicio, iPeriodo: integer): OleVariant;
var
  sSql: string;
begin

  sSql := 'SELECT /*+RULE*/ ' + #13 +
          '   L.DATASEGREGACRITER, L.PLACONTA, ' + #13 +
          '   SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, 0)) AS TOT_DEBITO, ' + #13 +
          '   SUM(DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, 0)) AS TOT_CREDITO  ' + #13 +
          'FROM ' +
          '   LANCAMENTO L, PLANILHA P ' + #13 +
          'WHERE ' + #13 +
          '   (L.IDPLANOPREV = ' + IntToStr(PlanoPrevComum) + ')' + #13 +
          '   AND (L.IDPATRO = ' + IntToStr(PatroComum) + ')' + #13 +
          '   AND (L.IDSEGREGACRITER = ' + IntToStr(iIdSegregaCriter) + ')' + #13 +
          '   AND (P.PEREXERCICIO = '    + IntToStr(iExercicio) +  ')' + #13 +
          '   AND (P.PERNUMERO = '       + IntToStr(iPeriodo) + ')' + #13 +
          '   AND (L.PLNCODIGO = P.PLNCODIGO) ' + #13 +
          'GROUP BY ' + #13 +
          '   L.DATASEGREGACRITER, L.PLACONTA ';
  Result := GetDataPacket(sSql);

end;

procedure TCtrlSegregacaoProc.OnCreateAppServer;
begin
  inherited;

end;

function TCtrlSegregacaoProc.ProcessaSegregacao(sNomeBilhete, sDataLanc, sContaAjuste: string; const ovSelecionados, ovContaSegrega: OleVariant; const iIdUsuario, iExercicio, iPeriodo: integer; const bUsaPlanoPatro, bProcessa: boolean): boolean;

var
  _CdsSelecionados, _CdsLocal, _CdsSegregaCotacao, _CdsLancamentos, _CdsContaSegrega: TCMClientDataSet;
  iQuant, iAtual, iIdSegregaCriter, iIdSegregacao, i: integer;
  dDataSegregaCriter: TDateTime;
  sMsg, sPlaConta, sContaSegrega, sDebCre, sSql: string;
  fRateio, fLancto, fPercent, fTotal: Extended;

  procedure IncluiLancamentos (const sContaSegrega, sDebCre: string; const iPlanoPrev, iPatro: integer; const rValor: Extended);
  begin
    // INLUI OS LANÇAMENTOS NO _CdsLancamento
    _CdsLancamentos.First;
    if _CdsLancamentos.Locate('PLACONTA;DEBCRE;IDPLANOPREV;IDPATRO',
             VarArrayOf([sContaSegrega, sDebCre, iPlanoPrev, iPatro]),[loCaseInsensitive]) then begin
      _cdsLancamentos.Edit;
      _CdsLancamentos.FieldByName('VALOR').AsFloat := _CdsLancamentos.FieldByName('VALOR').AsFloat + rValor;
      _cdsLancamentos.Post;
    end else begin
      _CdsLancamentos.Insert;
      _CdsLancamentos.FieldByName('PLACONTA').AsString := sContaSegrega;
      _CdsLancamentos.FieldByName('DEBCRE').AsString := sDebCre;
      _CdsLancamentos.FieldByName('IDPLANOPREV').AsInteger := iPlanoPrev;
      _CdsLancamentos.FieldByName('IDPATRO').AsInteger := iPatro;
      _CdsLancamentos.FieldByName('VALOR').AsFloat := rValor;
      _cdsLancamentos.Post;
    end;
  end;

  // cravado partida simples conforme conversa com Flavio Dias em 06/02/04
  Procedure InsereContabilidade(const bAjuste: Boolean);
  var sTipoLanc: char;
      sContaD, sContaC, sMsg: String;
  begin
    _CdsLancamentos.First;
    while not _CdsLancamentos.Eof do begin
      if _CdsLancamentos.FieldByName('DEBCRE').AsString = 'D' then begin
        sTipoLanc := '0';
        sContaD := _CdsLancamentos.FieldByName('PLACONTA').AsString;
        sContaC := '';
      end else begin
        sTipoLanc := '1';
        sContaD := '';
        sContaC := _CdsLancamentos.FieldByName('PLACONTA').AsString;
      end;

      sMsg := 'Segregação de Recursos - ' + _CdsSelecionados.FieldByName('DESCRICAO').AsString + ' - competência: ' + IntToStr(iPeriodo) + '/' + IntToStr (iExercicio);
      if bAjuste then
        sMsg := 'Ajuste ' + sMsg;

      if not CtrlLancamento.InsereLancaContab(sTipoLanc, iIdEmpresa, 1 {contabilidade sempre},
                                       iIdUsuario, CtrlParamIntegra.Plano,
                                       CtrlParamIntegra.uNidNegoc,
                                       0, 0, {contas de segregação não devem possuir subconta}
                                       _CdsLancamentos.FieldByName('IDPLANOPREV').AsInteger,
                                       _CdsLancamentos.FieldByName('IDPATRO').AsInteger,
                                       FdbSegregacao.Plncodigo.AsFloat,
                                       0, sDataLanc, '' {número do documento?},
                                       sMsg,
                                       '', '', '', '',
                                       _CdsSelecionados.FieldByName('TIPCODIGO').AsString,
                                       '', {centro de custo para segregação não rola}
                                       sContaD, '', sContaC,
                                       _CdsSelecionados.FieldByName('HITCODHIST').AsString,
                                       _CdsLancamentos.FieldByName('VALOR').AsFloat,
                                       false, bUsaPlanoPatro,
                                       { este são os lançamentos finais da segregação não possuem critério }
                                       -1, -1 ) then
        raise Exception.Create (CtrlLancamento.MessageInfo);

      // gravar o número da planilha se for a primeira segregação
      if FdbSegregacao.Plncodigo.AsFloat = 0 then begin
        // todos os outros atributos já estão carregados
        FdbSegregacao.Plncodigo.AsFloat := CtrlLancamento.RetornoPlnCodigo;
        if not FdbSegregacao.Update then
          raise Exception.Create (FdbSegregacao.MessageInfo);
      end;

      _CdsLancamentos.Next;
    end;
  end;

begin
  if ConnectionSide = cnsclient then
    Connection.AppServer.ProcessaSegregacao (sNomeBilhete, sDataLanc, sContaAjuste,
                                             ovSelecionados, ovContaSegrega, iIdUsuario,
                                             iExercicio, iPeriodo, bUsaPlanoPatro, bProcessa)

  else begin

    Result := true;
    try
      _CdsSelecionados   := TCMClientDataSet.Create(nil);
      _CdsLocal          := TCMClientDataSet.Create(nil);
      _CdsSegregaCotacao := TCMClientDataSet.Create(nil);
      _CdsLancamentos    := TCMClientDataSet.Create(nil);
      _CdsContaSegrega   := TCMClientDataSet.Create(nil);

      _CdsContaSegrega.Data := ovContaSegrega;
      _CdsSelecionados.Data := ovSelecionados;
      iQuant := _CdsSelecionados.RecordCount;
      iAtual := 1;
      // força um do progresso para montar a tela
      DoProgresso ([sNomeBilhete, iAtual, iQuant, '']);

      _CdsSelecionados.First;
      sPlaConta := '';
      while not _CdsSelecionados.Eof do begin
        StartTransaction;
        try

          sMsg := '-----------------------------------------------------------------------------------'+ #13#10;
          sMsg := sMsg + 'Critério: ' + _CdsSelecionados.FieldByName('DESCRICAO').AsString + #13#10;

          iIdSegregaCriter := _CdsSelecionados.FieldByName('IDSEGREGACRITER').AsInteger;
          // seleciona segregação anterior para excluir a contabilização da mesma
          // ou incluir nova segregação
          _CdsLocal.Data := RetonraSegregacao(iIdEmpresa, iExercicio, iPeriodo, iIdSegregaCriter);
          if _CdsLocal.IsEmpty then begin
            iIdSegregacao := -1;
            FdbSegregacao.Idpessoa.AsInteger := iIdEmpresa;
            FdbSegregacao.Perexercicio.AsInteger := iExercicio;
            FdbSegregacao.Pernumero.AsInteger := iPeriodo;
            FdbSegregacao.Idsegregacriter.AsInteger := iIdSegregaCriter;
            if not FdbSegregacao.Insert then
              raise Exception.Create (FdbSegregacao.MessageInfo);
          end else begin
            iIdSegregacao := _CdsLocal.FieldByName('IDSEGREGACAO').AsInteger;
            FdbSegregacao.Idsegregacao.AsInteger := iIdSegregacao;
            FdbSegregacao.LoadFromDb;

            sMsg := sMsg + 'Planilha: ' + IntToStr (FdbSegregacao.Plncodigo.AsInteger) + ' - excluindo lançamentos' + #13#10;

            // verificar se existem lançamentos para excluir
            _CdsLocal.Data := CtrlLancamento.SelecionaLancamentos(fdbSegregacao.Plncodigo.AsFloat,
                                                                  iIdEmpresa,
                                                                  iExercicio,
                                                                  iPeriodo,
                                                                  tpSoPeriodo,
                                                                  '', '', '', '',
                                                                  teAmbos, tomAmbos,
                                                                  tolPlnCodigo,
                                                                  tsSemSoma, false);
            if not _CdsLocal.IsEmpty then begin
              // excluir apenas os lançamentos da planilha. O mesmo número de Planilha é reeproveitável
              if not CtrlLancamento.ExcluiLancaContab(iIdUsuario,
                FdbSegregacao.Plncodigo.AsFloat, 1, 0, bUsaPlanoPatro, false) then
                raise Exception.Create(CtrlLancamento.MessageInfo);
            end;
          end;
          // aqui temos a tabela SEGREGACAO criada, com ou sem PLNCODIGO
          // se PLNCODIGO = NULL - criar planilha - nova segregação
          // senão reaprovetar planilha anterior - segregação refeita

          // se bprocessa for false - o usuário escolheu apenas apagar o processo anterior
          if bProcessa then begin

            // verificar os lançamentos originais para segregar
            _CdsLocal.Data := RetornaSomaLancamentos(iIdSegregaCriter, iExercicio, iPeriodo);
            if _CdsLocal.IsEmpty then
              raise exception.Create ('Nenhum lançamento encontrado para este critério!');

            // criar um Cds para totalizar os lançamentos a serem feitos
            _CdsLancamentos.Data := GetDataPacket ('SELECT ''                  '' AS PLACONTA, ' +
                                                   ''' '' AS DEBCRE, 0 AS VALOR, ' +
                                                   '0 AS IDPLANOPREV, 0 AS IDPATRO '+
                                                   'FROM DUAL WHERE 1=2' );

            dDataSegregaCriter := -1;
            _CdsSegregaCotacao.Data := ListaSegregaCotacaoXData(-2, -2);

            while not _CdsLocal.Eof do begin     // somatório das contas contábeis para segregar

              // montar a cotação do critério para a data selecionada
              if dDataSegregaCriter <> _CdsLocal.FieldByName('DATASEGREGACRITER').AsDateTime then begin
                dDataSegregaCriter := _CdsLocal.FieldByName('DATASEGREGACRITER').AsDateTime;

                // procurar se a cotação ainda atende ao critério
                if not ((_CdsSegregaCotacao.FieldByName('DATAINI').AsDateTime<=dDataSegregaCriter) and
                        (_CdsSegregaCotacao.FieldByName('DATAFIM').AsDateTime>=dDataSegregaCriter)) then begin

                  _CdsSegregaCotacao.Data := ListaSegregaCotacaoXData( iIdSegregaCriter, dDataSegregaCriter);
                  if _CdsSegregaCotacao.IsEmpty then
                    raise Exception.Create ('Não foi encontrado cotação para o critério : ' + _CdsSelecionados.FieldByName('DESCRICAO').AsString + #13#10 +
                                            'Na data: ' + FormatDateTime ('dd/mm/yyyy', dDataSegregaCriter));

                  // verificar se o rateio for por percentual e o total é dif de 100
                  if (_CdsSelecionados.FieldByName('FLGTIPOCOTACAO').AsString = 'P') and   // cálculo por percentual
                     (_CdsSegregaCotacao.FieldByName ('TOT_COTACAO').AsFloat <> 100) then
                    raise Exception.Create ('O percentual do critério: ' + _CdsSelecionados.FieldByName('DESCRICAO').AsString + #13#10 +
                                            'Na data: ' + FormatDateTime('dd/mm/yyyy',dDataSegregaCriter) + ' não totaliza 100%!')
                end;
              end;
              // fim montar a cotação do critério para a data selecionada

              // buscar a conta para segregação
              if sPlaConta <> _CdsLocal.FieldByName('PLACONTA').AsString then begin
                sPlaConta := _CdsLocal.FieldByName('PLACONTA').AsString;
                _CdsContaSegrega.First;
                if not _CdsContaSegrega.Locate('PLACONTA',VarArrayOf([sPlaConta]),[loCaseInsensitive]) then
                  raise Exception.Create('Não encontrei a conta para segregação da conta contábil: ' + sPlaConta);
                sContaSegrega := _CdsContaSegrega.FieldByName('SEGREGACONTA').AsString
              end;

              // grava lançamentos
              for i:= 1 to 2 do begin
                // verificar se existe um total de débitos
                if i = 1 then begin
                  fTotal := _CdsLocal.FieldByName('TOT_DEBITO').AsFloat;
                  sDebCre := 'D';
                // verificar se existe um total de débitos
                end else begin
                  fTotal := _CdsLocal.FieldByName('TOT_CREDITO').AsFloat;
                  sDebCre := 'C';
                end;

                if fTotal <> 0 then begin
                  // zerar o plano de operações comums
                  if sDebCre = 'D' then
                    IncluiLancamentos(sContaSegrega, 'C', PlanoPrevComum, PatroComum, fTotal)
                  else
                    IncluiLancamentos(sContaSegrega, 'D', PlanoPrevComum, PatroComum, fTotal);

                  // fazer o rateio
                  // 05/02/04 faz o rateio por plano e patro, não há condições de
                  // se fazer partida dobrada, visto que não se sabe qual débito
                  // pertence a qual crédito. Discutido com Flávio
                  fRateio := 0;
                  _CdsSegregaCotacao.First;
                  while not _CdsSegregaCotacao.Eof do begin
                    // último registro arredondar
                    if _CdsSegregaCotacao.RecordCount = _CdsSegregaCotacao.RecNo then begin
                      fLancto := fTotal - fRateio;
                    end else begin
                      if (_CdsSelecionados.FieldByName('FLGTIPOCOTACAO').AsString = 'P') then   // cálculo por percentual
                        fPercent := _CdsSegregaCotacao.FieldByName('COTACAO').AsFloat / 100
                      else
                        fPercent := _CdsSegregaCotacao.FieldByName('COTACAO').AsFloat / _CdsSegregaCotacao.FieldByName ('TOT_COTACAO').AsFloat;

                      // ARREDONDAR LANÇAMENTOS PARA 2 CASAS DECIMAIS.
                      fLancto := StrToFloat( FormatFloat( '#0.00', (fTotal * fPercent)));
                      fRateio := fRateio + fLancto;
                    end;

                    IncluiLancamentos(sContaSegrega, sDebCre,
                        _CdsSegregaCotacao.FieldByName('IDPLANOPREV').AsInteger,
                        _CdsSegregaCotacao.FieldByName('IDPATRO').AsInteger,
                        fLancto);

                    _CdsSegregaCotacao.Next
                  end;
                end;
              end;
              // fim grava lançamentos

              _CdsLocal.Next;
            end;

            // insere lancamento contábil
            InsereContabilidade(false);

            // faz ajuste contábil DAS DIFERENÇAS DE CENTAVOS
            _CdsLancamentos.EmptyDataSet;
            _CdsLocal.Data := CtrlLancamento.SelecionaProvaZero(dbSegregacao.Plncodigo.AsFloat);
            while not _CdsLocal.Eof do begin
              if _CdsLocal.FieldByName('TOT_SALDO').AsFloat <> 0 then begin  // temos uma diferença
                if _CdsLocal.FieldByName('TOT_SALDO').AsFloat < 0 then begin  // Crédito maior que crédito
                  fLancto := _CdsLocal.FieldByName('TOT_SALDO').AsFloat * -1;  // O VALOR AQUI É NEGATIVO
                  sDebCre := 'D';
                end else begin   // Débito maior que débito
                  fLancto := _CdsLocal.FieldByName('TOT_SALDO').AsFloat;
                  sDebCre := 'C';
                end;

                IncluiLancamentos(sContaAjuste, sDebCre,
                                  _CdsLocal.FieldByName('IDPLANOPREV').AsInteger,
                                  _CdsLocal.FieldByName('IDPATRO').AsInteger,
                                  fLancto);

              end;
              _CdsLocal.Next;
            end;
            InsereContabilidade(true);
            // FIM faz ajuste contábil DAS DIFERENÇAS DE CENTAVOS

            // NÃO PRECISA DESFAZER DO LANÇAMENTO NA EXCLUSÃO ACIMA.
            // EXCETO QUE SEJA DESENVOLVIDO APENAS UM DESFAZ SEGREGAÇÃO
            // grava o IDSEGREGACAO nos lançamentos da contabilidade
            sSql := 'UPDATE  /*+RULE*/ LANCAMENTO SET IDSEGREGACAO = ' + IntToStr ( FdbSegregacao.Idsegregacao.AsInteger ) + #13 +
                    ' WHERE IDSEGREGACRITER = ' + IntToStr(_CdsSelecionados.FieldByName('IDSEGREGACRITER').AsInteger) + #13 +
                    ' AND PLNCODIGO IN (SELECT PLNCODIGO FROM PLANILHA WHERE PEREXERCICIO = ' + IntToStr (iExercicio) + #13 +
                    '                   AND PERNUMERO = ' + IntToStr (iPeriodo) + ')';
            if not ExecSQL (sSql) then
              raise exception.Create ('Não consegui atualizar o IDSEGREGACAO na tabela lançamento!');

            sMsg := sMsg + ' '+#13#10;
            sMsg := sMsg + 'Critério Segregado ! Planilha Interna: ' + IntToStr (FdbSegregacao.Plncodigo.AsInteger) + #13#10;
            sMsg := sMsg + '-----------------------------------------------------------------------------------'+ #13#10;
          end;

          Commit;
        except
          on E:Exception do begin
            result := false;
            Rollback;

            // registrar erro
            sMsg := sMsg + '-----------------------------------------------------------------------------------'+ #13#10+
                    'ERRO - Critério: ' + _CdsSelecionados.FieldByName('DESCRICAO').AsString + #13#10 +
                    E.Message + #13#10 +
                    '-----------------------------------------------------------------------------------';
          end;
        end;
        _CdsSelecionados.Next;
        // o último parâmetro será utilizado para passar a mensagem do processamento
        Inc (iAtual);
        DoProgresso ([sNomeBilhete, iAtual, iQuant, sMsg]);
      end;
    finally
      FreeAndNil (_CdsSelecionados);
      FreeAndNil (_CdsLocal);
      FreeAndNil (_CdsSegregaCotacao);
      FreeAndNil (_CdsLancamentos);
      FreeAndNil (_CdsContaSegrega);

      if FileExists(sNomeBilhete) then DeleteFile(sNomeBilhete);
    end;

  end
end;

procedure TCtrlSegregacaoProc.SetdbSegregacao(const Value: TDbSegregacao);
begin
  FdbSegregacao := Value;
end;

end.
