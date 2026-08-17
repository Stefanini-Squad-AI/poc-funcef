unit uCtrlSegregacaoProc;
{**********************************************************************}
{  Tela criada em : 14/04/2005                                         }
{  Desenvolvedor  : Rodolpho da Silva                                  }
{  Pendência      : 18434                                              }
{  Descrição      : Criar função para inserir lançamentos nas          }
{                   planilhas divergentes                              }
{                                                                      }
{**********************************************************************}
(*==============================================================================
Analista : Antonio Marcos (amf)
Data     : 29.03.2007
Pendência: 24589
Descricao: A função ProvaZeroMemoCalc foi descontinuada e substituída pela função
getProvaZero da uctrlLancamento na CMContabObju50.
---------------------------------------------------------------------------------
Analista : Alex Pereira
Rotina   : ProcessaSegregacao
Data     : 12/07/2005
Pendência:
Solução  : Passando a gravar uma planilha por critério, quando executado o processo sem filtro.
==============================================================================*)
(*==============================================================================
Analista : Alex Pereira
Rotina   : RetornaSomaLancamentos
Data     : 18/02/2005
Pendência:
Solução  : Ocorreu um erro inesperado na CBS, foram feitos lançamentos contábeis no
           plano OC, que foram segregados na origem, este lançamentos deveriam ter sido feitos no
           plano OA. A CBS fez um update para tirar estes lançamentos
           do plano OC para o plano OA, como estes lançamentos já foram segregados na origem, os mesmos
           devem ser ignorados no processo virtual
==============================================================================*)
(*==============================================================================
Analista : Alex Pereira
Rotina   : ProcessaSegregacao / RetonraSegregacao / RetornaSomaLancamentos
Data     : 05/11/2004
Pendência: 17193
Solução  : Ajustando o Objeto para segregação dos planos: "Comum" e "Administrativo"
==============================================================================*)
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

      procedure GravaRegistroDeSegregacao(iIdEmpresa, iExercicio, iPeriodo, iIdSegregaCriter,  iIdPlanoPrev: integer);
      function RetornaSomaLancamentos(const iIdSegregaCriter, iExercicio, iPeriodo, iIdPlanoPrev: integer): OleVariant;
      function RetonraSegregacao(const iIdPessoa, iExercicio, iPerNumero, iIdSegregaCriter, iIdPlanoPrev: integer): OleVariant;
      function RetornaSegregacaoParaMemoCalc(const iidpessoa, iexercicio, ipernumero, iidplanoprev: integer): OleVariant;
      function RetornaSomaMemoCalc(iIdPlanoPrev, iExercicio, iPeriodo: integer): OleVariant;
      function RetornaLancamentosSegregados(iexercicio, iperiodo, iidplanoprev: integer): OleVariant;

      function MarcarLancamentoSegregado(iexercicio, iperiodo, iplanoprev, iidsegregacao: integer): boolean;

    protected

      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;

    public
      Destructor Destroy; Override;
      constructor Create;  Override;

      property dbSegregacao: TDbSegregacao read FdbSegregacao write SetdbSegregacao;

      function ProcessaSegregacao(sNomeBilhete, sDataLanc, sContaAjuste: string; const ovSelecionados, ovContaSegrega: OleVariant; const iIdUsuario, iExercicio, iPeriodo, iIdPlanoPrev: integer; const bUsaPlanoPatro, bProcessa: boolean): boolean;

      {Esta função tem como finalidade de inserir lançamentos para ajuste de planilha}
      function AjustaPlanilha(cTipoLanc: char; sNumDoc,sHist1,sCodCCustoCred,sContaCred,
                              sDataLanc,sDataSegregaCriter,sCodCCustoDeb,sContaDeb: string;
                              bUsaPlanoPatro: Boolean;
                              fIdEmpresa,fModuloOrigem,fIdUsuario,fCodPlano,
                              fUnidNegoc,fIdPlano,fIdPatro,fIdContrSegrega,fPlnCodigo,
                              fIdSegregaCriter,fValorLanc: Double): boolean;


      function RetornaIdControleSegrega: integer;

      // testa a regra prova-zero da memória de cálculo.
      function ProvaZeroMemoCalc(iexercicio, iperiodo: integer): OleVariant;

      // Processa a segreção de recursos da memória de cálculo.
      function ProcessaSegregacaoMemoCalc(sNomeBilhete, sDataLanc, sContaAjuste: string; const iIdUsuario, iExercicio, iPeriodo, iIdPlanoPrev: integer; const bUsaPlanoPatro, bProcessa: boolean): boolean;

      // Retorna os lançamentos divergentes encontrados na SEGREGAMEMOCALC com a PLANILHA
      function RetornaDivergMemoCalcMaster(dtinicio, dtfim: TDateTime; iidplanoprev: integer): Olevariant;

      // Retorna os detalhes dos lançamentos divergentes encontrados na SEGREGAMEMOCALC com a PLANILHA
      function RetornaDivergMemoCalcDetalhe(dtinicio, dtfim: TDateTime; iidplanoprev, iplcodigo: integer; snumdoc: string): Olevariant;
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
  iIdSegregaCriter, iIdPlanoPrev: integer): OleVariant;
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
          '   AND (IDSEGREGACRITER = '+ IntToStr (iIdSegregaCriter) + ')' + #13 +
          '   AND (IDPLANOPREV = '    + IntToStr (iIdPlanoPrev) + ')';
  Result := GetDataPacket(sSql);
end;




function TCtrlSegregacaoProc.RetornaSomaLancamentos(const iIdSegregaCriter,
  iExercicio, iPeriodo, iIdPlanoPrev: integer): OleVariant;
var
  sSql: string;
begin

  sSql := 'SELECT /*+RULE*/ ' + #13 +
          '   L.DATASEGREGACRITER, L.PLACONTA, ' + #13 +
          '   SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, L.LACVALOR *(-1))) AS TOT_MOVIMENTO ' + #13 +
          'FROM ' +
          '   LANCAMENTO L, PLANILHA P ' + #13 +
          'WHERE ' + #13 +
          '   (L.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ')' + #13 +
          '   AND (L.IDPATRO = ' + IntToStr(PatroComum) + ')' + #13 +
          '   AND (L.IDSEGREGACRITER = ' + IntToStr(iIdSegregaCriter) + ')' + #13 +
          '   AND (P.PEREXERCICIO = '    + IntToStr(iExercicio) +  ')' + #13 +
          '   AND (P.PERNUMERO = '       + IntToStr(iPeriodo) + ')' + #13 +
          '   AND (L.PLNCODIGO = P.PLNCODIGO) ' + #13 +
          '   AND (L.IDSEGREGACONTR IS NULL) ' + #13 +
          'GROUP BY ' + #13 +
          '   L.DATASEGREGACRITER, L.PLACONTA ';
  Result := GetDataPacket(sSql);

end;




procedure TCtrlSegregacaoProc.OnCreateAppServer;
begin
  inherited;

end;




function TCtrlSegregacaoProc.ProcessaSegregacao(sNomeBilhete, sDataLanc, sContaAjuste: string; const ovSelecionados, ovContaSegrega: OleVariant; const iIdUsuario, iExercicio, iPeriodo, iIdPlanoPrev: integer; const bUsaPlanoPatro, bProcessa: boolean): boolean;

var
  _CdsSelecionados, _CdsLocal, _CdsSegregaCotacao, _CdsLancamentos, _CdsContaSegrega: TCMClientDataSet;
  iQuant, iAtual, iIdSegregaCriter, i: integer;
  dDataSegregaCriter: TDateTime;
  sMsg, sPlaConta, sContaSegrega, sDebCre, sSql: string;
  fRateio, fLancto, fPercent, fTotal: Extended;
  sErroAviso : string;

  procedure IncluiLancamentos (const sContaSegrega, sDebCre: string; const iPlanoPrev, iPatro: integer; const rValor: Extended);
  begin
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

      if not CtrlLancamento.InsereLancaContab(sTipoLanc, iIdEmpresa, 1,
                                       iIdUsuario, CtrlParamIntegra.Plano,
                                       CtrlParamIntegra.uNidNegoc,
                                       0, 0,
                                       _CdsLancamentos.FieldByName('IDPLANOPREV').AsInteger,
                                       _CdsLancamentos.FieldByName('IDPATRO').AsInteger,
                                       FdbSegregacao.Plncodigo.AsFloat,
                                       0, sDataLanc, '',
                                       sMsg,
                                       '', '', '', '',
                                       _CdsSelecionados.FieldByName('TIPCODIGO').AsString,
                                       '',
                                       sContaD, '', sContaC,
                                       '',
                                       _CdsLancamentos.FieldByName('VALOR').AsFloat,
                                       false, bUsaPlanoPatro,
                                       -1, -1 ) then
        raise Exception.Create (CtrlLancamento.MessageInfo);

      FdbSegregacao.Plncodigo.AsFloat := CtrlLancamento.RetornoPlnCodigo;

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
      DoProgresso ([sNomeBilhete, iAtual, iQuant, '']);

      _CdsSelecionados.First;
      sPlaConta := '';
      while not _CdsSelecionados.Eof do begin

        // identifica que possui uma mensagem de erro ou aviso. O default é erro, para
        // trocar para aviso alterar o valor da variável
        sErroAviso := 'E';
        StartTransaction;
        try

          sMsg := '-----------------------------------------------------------------------------------'+ #13#10;
          sMsg := sMsg + 'Critério: ' + _CdsSelecionados.FieldByName('DESCRICAO').AsString + #13#10;

          iIdSegregaCriter := _CdsSelecionados.FieldByName('IDSEGREGACRITER').AsInteger;
          // seleciona segregação anterior para excluir a contabilização da mesma
          // ou incluir nova segregação
          _CdsLocal.Data := RetonraSegregacao(iIdEmpresa, iExercicio, iPeriodo, iIdSegregaCriter,  iIdPlanoPrev);
          if _CdsLocal.IsEmpty then begin
            FdbSegregacao.Plncodigo.Clear;
            FdbSegregacao.Idsegregacao.Clear;

            FdbSegregacao.Idpessoa.AsInteger := iIdEmpresa;
            FdbSegregacao.Perexercicio.AsInteger := iExercicio;
            FdbSegregacao.Pernumero.AsInteger := iPeriodo;
            FdbSegregacao.Idsegregacriter.AsInteger := iIdSegregaCriter;
            FdbSegregacao.Idplanoprev.AsInteger := iIdPlanoPrev;
            if not FdbSegregacao.Insert then
              raise Exception.Create (FdbSegregacao.MessageInfo);
          end else begin
            FdbSegregacao.Idsegregacao.AsInteger := _CdsLocal.FieldByName('IDSEGREGACAO').AsInteger;
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
              // excluir apenas os lançamentos da planilha. O mesmo número de
              // Planilha é reeproveitável, isto otimiza o processo para gerar nova planilhha
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
            _CdsLocal.Data := RetornaSomaLancamentos(iIdSegregaCriter, iExercicio, iPeriodo, iIdPlanoPrev);
            if _CdsLocal.IsEmpty then begin
              sErroAviso := 'A';
              raise exception.Create ('Nenhum lançamento encontrado para este critério!');
            end;

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
              // verificar se existe um total de débitos
              fTotal := _CdsLocal.FieldByName('TOT_MOVIMENTO').AsFloat;
              if fTotal > 0 then sDebCre := 'D'
              else sDebCre := 'C';
              fTotal := ABS (fTotal);

              if fTotal <> 0 then begin
                // zerar o plano de operações comums
                if sDebCre = 'D' then
                  IncluiLancamentos(sContaSegrega, 'C', iIdPlanoPrev, PatroComum, fTotal)
                else
                  IncluiLancamentos(sContaSegrega, 'D', iIdPlanoPrev, PatroComum, fTotal);

                // fazer o rateio
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

            // NÃO PRECISA DESFAZER DO LANÇAMENTO NA EXCLUSÃO ACIMA.
            // EXCETO QUE SEJA DESENVOLVIDO APENAS UM DESFAZ SEGREGAÇÃO
            // grava o IDSEGREGACAO nos lançamentos da contabilidade
            sSql := 'UPDATE  /*+RULE*/ LANCAMENTO SET IDSEGREGACAO = ' + IntToStr ( FdbSegregacao.Idsegregacao.AsInteger ) + #13 +
                    ' WHERE IDSEGREGACRITER = ' + IntToStr(_CdsSelecionados.FieldByName('IDSEGREGACRITER').AsInteger) + #13 +
                    ' AND PLNCODIGO IN (SELECT PLNCODIGO FROM PLANILHA WHERE PEREXERCICIO = ' + IntToStr (iExercicio) + #13 +
                    '                   AND PERNUMERO = ' + IntToStr (iPeriodo) + ')';
            if not ExecSQL (sSql) then
              raise exception.Create ('Não consegui atualizar o IDSEGREGACAO na tabela lançamento!');

            if not FdbSegregacao.Update then
              raise Exception.Create (FdbSegregacao.MessageInfo);

            sMsg := sMsg + ' '+#13#10;
            sMsg := sMsg + 'Critério Segregado ! Planilha Interna: ' + IntToStr (FdbSegregacao.Plncodigo.AsInteger) + #13#10;
            sMsg := sMsg + '-----------------------------------------------------------------------------------'+ #13#10;

          end;

          Commit;
        except
          on E:Exception do begin
            result := false;
            Rollback;

            // registrar erro ou aviso
            sMsg := sMsg + '-----------------------------------------------------------------------------------'+ #13#10;
            if sErroAviso = 'A' then begin
              sMsg := sMsg + 'AVISO - Critério: ' + _CdsSelecionados.FieldByName('DESCRICAO').AsString + #13#10;
            end else begin
              sMsg := sMsg + 'ERRO - Critério: ' + _CdsSelecionados.FieldByName('DESCRICAO').AsString + #13#10;
            end;
            sMsg := sMsg + E.Message + #13#10 +
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




function TCtrlSegregacaoProc.AjustaPlanilha(cTipoLanc: char; sNumDoc,
  sHist1, sCodCCustoCred, sContaCred, sDataLanc, sDataSegregaCriter,
  sCodCCustoDeb, sContaDeb: string; bUsaPlanoPatro: Boolean; fIdEmpresa,
  fModuloOrigem, fIdUsuario, fCodPlano, fUnidNegoc, fIdPlano, fIdPatro,
  fIdContrSegrega, fPlnCodigo, fIdSegregaCriter, fValorLanc: Double): boolean;

var
  dDataSegregaCriter: TDateTime;

begin
   try
      StartTransaction;

      //  Se a data for nula, instancia ela como nula...
      if Trim(sDataSegregaCriter) = '' then
         dDataSegregaCriter := 0
      else
         dDataSegregaCriter := StrToDate(sDataSegregaCriter);


      if not CtrlLancamento.InsereLancaContab(cTipoLanc,
                                              fIdEmpresa,
                                              fModuloOrigem,
                                              fIdUsuario,
                                              fCodPlano,
                                              fUnidNegoc,
                                              0,
                                              0,
                                              fIdPlano,
                                              fIdPatro,
                                              fPlnCodigo,
                                              0,
                                              sDataLanc,
                                              sNumDoc,
                                              sHist1,
                                              '',
                                              '',
                                              '',
                                              '',
                                              '03',
                                              sCodCCustoDeb,
                                              sContaDeb,
                                              sCodCCustoCred,
                                              sContaCred,
                                              '',
                                              fValorLanc,
                                              False,
                                              bUsaPlanoPatro,
                                              Trunc(fIdSegregaCriter),
                                              dDataSegregaCriter,
                                              Trunc(fIdContrSegrega),
                                              False) then
      raise exception.Create(CtrlLancamento.MessageInfo);


      Commit;

   except
      on e: exception do
      begin
         Rollback;
         Result      := False;
         MessageInfo := E.Message;
      end;
   end;
end;




function TCtrlSegregacaoProc.RetornaIdControleSegrega: integer;
begin
   Result := GetSequence('IDCONTRSEGREGA');
end;

function TCtrlSegregacaoProc.ProvaZeroMemoCalc(iexercicio,
  iperiodo: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT /*+RULE*/ ' +
    'DISTINCT PLNCODIGO ' +
    'FROM ' +
    '(SELECT P.PLNCODIGO, m.IDSEGREGACRITER, m.DATASEGREGACRITER, m.IDPLANOPREV, m.IDPATRO,' +
    '        SUM (DECODE(m.LACDEBCRE, ''D'', m.LACVALOR, m.LACVALOR*(-1))) AS TOT_SALDO ' +
    ' FROM MEMOCALCSEGREGA M, PLANILHA P ' +
    ' WHERE P.PEREXERCICIO = ' + IntToStr(iexercicio) +
    '       AND P.PERNUMERO = ' + IntToStr(iperiodo) +
    '       AND M.PLNCODIGO = P.PLNCODIGO ' +
    ' GROUP BY P.PLNCODIGO, M.IDSEGREGACRITER, M.DATASEGREGACRITER, M.IDPLANOPREV, M.IDPATRO ' +
    ' HAVING SUM (DECODE(M.LACDEBCRE, ''D'', M.LACVALOR, M.LACVALOR*(-1))) <> 0 ' +
    ')' ;
  Result := GetDataPacket(sSQL);
end;

function TCtrlSegregacaoProc.ProcessaSegregacaoMemoCalc(sNomeBilhete, sDataLanc, sContaAjuste: string;
const iIdUsuario, iExercicio, iPeriodo, iIdPlanoPrev: integer; const bUsaPlanoPatro,
bProcessa: boolean): boolean;
var
  sMsg, sPlaConta, sContaSegrega, sDebCre, sSql: string;
  fRateio, fLancto, fPercent, fTotal: Extended;
  sErroAviso : string;
  cdsLocal: TCMClientDataSet;
  cdsSegregacao: TCMClientDataSet;
  sTipoLanc, sContaD, sContaC: string;
  rValor: extended;
begin
  if ConnectionSide = cnsclient then
    Connection.AppServer.ProcessaSegregacaoMemoCalc(sNomeBilhete, sDataLanc, sContaAjuste,
                                             iIdUsuario, iExercicio, iPeriodo, bUsaPlanoPatro, bProcessa)
  else
  begin
    Result := true;
    try
       try
          //Cria/Atualiza o registro de segregação.
          cdsSegregacao := TCMClientDataSet.Create(nil);
          cdsSegregacao.Data := RetornaSegregacaoParaMemoCalc(iIdempresa, iExercicio, iPeriodo, iIdPlanoPrev);

          if cdsSegregacao.IsEmpty then
          begin
            FdbSegregacao.Plncodigo.Clear;
            FdbSegregacao.Idsegregacao.Clear;

            FdbSegregacao.Idpessoa.AsInteger := iIdEmpresa;
            FdbSegregacao.Perexercicio.AsInteger := iExercicio;
            FdbSegregacao.Pernumero.AsInteger := iPeriodo;
            FdbSegregacao.Idplanoprev.AsInteger := iIdPlanoPrev;
            if not FdbSegregacao.Insert then
              raise Exception.Create (FdbSegregacao.MessageInfo);
          end else
          begin
            FdbSegregacao.Idsegregacao.AsInteger := cdsSegregacao.FieldByName('IDSEGREGACAO').AsInteger;
            FdbSegregacao.LoadFromDb;
          end;


          // retorna a contabilização(soma) os valores encontrados na memocalc
          cdsLocal          := TCMClientDataSet.Create(nil);
          cdsLocal.Data := RetornaSomaMemoCalc(iidplanoprev, iexercicio, iperiodo);

          // Insere na contabilidade a contabilização da memória de cálculo.
          while (not cdsLocal.Eof) do
          begin
            if (cdsLocal.FieldByName('VALOR').AsFloat > 0) then
            begin
               sTipoLanc := '0';
               sContaD   := cdsLocal.FieldByName('PLACONTA').AsString;
               sContaC   := '';
               rValor    := Abs(cdsLocal.FieldByName('VALOR').AsFloat);
            end
            else
            begin
               sTipoLanc := '1';
               sContaD   := '';
               sContaC   := cdsLocal.FieldByName('PLACONTA').AsString;
               rValor    := Abs(cdsLocal.FieldByName('VALOR').AsFloat);
            end;

            sMsg := 'Segregação Recursos - Memória de Cálculo - comp: ' + IntToStr(iPeriodo) + '/' + IntToStr (iExercicio);

            if not CtrlLancamento.InsereLancaContab
                                      (sTipoLanc[1],
                                       iIdEmpresa,
                                       1,
                                       iIdUsuario,
                                       CtrlParamIntegra.Plano,
                                       CtrlParamIntegra.uNidNegoc,
                                       0,
                                       0,
                                       cdsLocal.FieldByName('IDPLANOPREV').AsInteger,
                                       cdsLocal.FieldByName('IDPATRO').AsInteger,
                                       FdbSegregacao.Plncodigo.AsFloat,
                                       0,
                                       sDataLanc,
                                       '' ,
                                       sMsg,
                                       '',
                                       '',
                                       '',
                                       '',
                                       '03',
                                       cdsLocal.FieldByName('CODCENTROCUSTO').AsString,
                                       sContaD,
                                       '',
                                       sContaC,
                                       '',
                                       rValor,
                                       false,
                                       bUsaPlanoPatro,
                                       -1,
                                       -1,
                                       -1,
                                       False,
                                       -1,
                                       False ) then
                                       raise Exception.Create (CtrlLancamento.MessageInfo);

            FdbSegregacao.PlnCodigo.AsFloat := CtrlLancamento.RetornoPlnCodigo;

            cdsLocal.Next;
         end;

         // atualizar o lançamento com o ID da segregação.
         MarcarLancamentoSegregado(iexercicio, iperiodo, iidplanoprev, FdbSegregacao.Idsegregacao.AsInteger);

      except
         on E:Exception do begin
            result := false;
            Rollback;

            // registrar erro ou aviso
            sMsg := sMsg + '-----------------------------------------------------------------------------------'+ #13#10;
            if sErroAviso = 'A' then begin
              sMsg := sMsg + 'AVISO - Critério: ' + cdsLocal.FieldByName('DESCRICAO').AsString + #13#10;
            end else begin
              sMsg := sMsg + 'ERRO - Critério: ' + cdsLocal.FieldByName('DESCRICAO').AsString + #13#10;
            end;
            sMsg := sMsg + E.Message + #13#10 +
                    '-----------------------------------------------------------------------------------';
         end;
      end;
    finally
         FreeAndNil(cdsLocal);
         FreeAndNil(cdsSegregacao);
         if FileExists(sNomeBilhete) then DeleteFile(sNomeBilhete);
    end;
 end;
end;


function TCtrlSegregacaoProc.RetornaSomaMemoCalc(iIdPlanoPrev, iExercicio, iPeriodo: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT M.IDPLANOPREV, M.IDPATRO, M.PLACONTA, M.CODCENTROCUSTO, M.UNIDNEGOC, M.CODSUBCONTA, ' +
    'SUM(DECODE(M.LACDEBCRE, ''D'', M.LACVALOR, M.LACVALOR*(-1))) AS VALOR ' +
    ' FROM PLANILHA P, LANCAMENTO L, MEMOCALCSEGREGA M ' +
    ' WHERE  P.PLNCODIGO = L.PLNCODIGO ' +
    ' AND P.PLNCODIGO = M.PLNCODIGO ' +
    ' AND L.IDSEGREGACONTR = M.IDSEGREGACONTR ' +
    ' AND P.PEREXERCICIO = ' + IntToStr(iexercicio) +
    ' AND P.PERNUMERO = ' + IntToStr(iperiodo) +
    ' AND L.IDPLANOPREV = ' + IntToStr(iidplanoprev) +
    ' GROUP BY m.IDPLANOPREV, m.IDPATRO, m.PLACONTA, M.CODCENTROCUSTO, M.UNIDNEGOC, M.CODSUBCONTA ';

  Result := GetDataPacket(sSQL);
end;


procedure TCtrlSegregacaoProc.GravaRegistroDeSegregacao(iIdEmpresa, iExercicio, iPeriodo, iIdSegregaCriter,  iIdPlanoPrev: integer);
var
   cdsSegregacao: TCmClientDataSet;
begin
   try

    cdsSegregacao := TCMClientDataSet.Create(nil);
    cdsSegregacao.Data := RetornaSegregacaoParaMemoCalc(iIdEmpresa, iExercicio, iPeriodo, iIdPlanoPrev);

    if cdsSegregacao.IsEmpty then
    begin
      FdbSegregacao.Plncodigo.Clear;
      FdbSegregacao.Idsegregacao.Clear;
      FdbSegregacao.Idpessoa.AsInteger := iIdEmpresa;
      FdbSegregacao.Perexercicio.AsInteger := iExercicio;
      FdbSegregacao.Pernumero.AsInteger := iPeriodo;
      FdbSegregacao.Idplanoprev.AsInteger := iIdPlanoPrev;
      if not FdbSegregacao.Insert then
        raise Exception.Create (FdbSegregacao.MessageInfo);
    end else
    begin
      FdbSegregacao.Idsegregacao.AsInteger := cdsSegregacao.FieldByName('IDSEGREGACAO').AsInteger;
      FdbSegregacao.LoadFromDb;
    end;
   finally
      FreeAndNil(cdsSegregacao);
   end;
end;

function TCtrlSegregacaoProc.RetornaDivergMemoCalcDetalhe(dtinicio,
  dtfim: TDateTime; iidplanoprev, iplcodigo: integer;
  snumdoc: string): Olevariant;
var
  sSQL: string;
begin
  sSQL :=
   'SELECT PL.PLNCODIGO,' +
   '       M.LACNUMDOC, '+
   '       M.CODCENTROCUSTO,' +
   '       M.UNIDNEGOC, ' +
   '       M.IDPLANOPREV, ' +
   '       M.IDPATRO, ' +
   '       S.DESCRICAO, ' +
   '       M.IDSEGREGACRITER, ' +
   '       M.DATASEGREGACRITER, ' +
   '       PC.NOME AS NOMEPLANO, ' +
   '       PPA.NOME AS NOMEPATRO, ' +
   '       NVL(SUM(DECODE(M.LACDEBCRE,''D'',M.LACVALOR)),0) AS DEBITO, ' +
   '       NVL(SUM(DECODE(M.LACDEBCRE,''C'',M.LACVALOR)),0) AS CREDITO, ' +
   '       NVL(SUM(DECODE(M.LACDEBCRE,''D'',NVL(M.LACVALOR,0))),0) - NVL(SUM (DECODE(M.LACDEBCRE,''C'',NVL(M.LACVALOR,0))),0)AS DIFERENCA ' +
   'FROM PESSOA PPA, ' +
   '     PATRO  PTR, '+
   '     PLANPREVCONTABIL PC, ' +
   '     PLANILHA PL, ' +
   '     MEMOCALCSEGREGA M, ' +
   '     SEGREGACRITER S '+
   'WHERE (PPA.IDPESSOA      = PTR.IDPESSOA) ' +
   '  AND (PTR.IDPESSOA      = M.IDPATRO) ' +
   '  AND (PC.IDPLANOPREV    = M.IDPLANOPREV) ' +
   '  AND (PL.PLNCODIGO      = M.PLNCODIGO) ' +
   '  AND (M.IDSEGREGACRITER = S.IDSEGREGACRITER (+) ) ' +
   '  AND ((M.LACNUMDOC IS NULL) OR (M.LACNUMDOC = ' + QuotedStr(snumdoc) + '))' +
   '  AND (PL.PLNCODIGO      = ' + IntToStr(iplcodigo) + ')' +
   '  AND (PL.PLNDATDIA BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtinicio)) + '  AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtfim)) + ') ' +
   '  AND (M.IDPLANOPREV = ' + IntToStr(iidplanoprev) + ')' +
   'GROUP BY PL.PLNCODIGO, ' + //   -- FILTRO MESTRE
   '         M.LACNUMDOC,  ' +  //-- FILTRO MESTRE
   '         M.CODCENTROCUSTO, ' +
   '         M.UNIDNEGOC, ' +
   '         M.IDPLANOPREV, ' +
   '         M.IDPATRO, ' +
   '         S.DESCRICAO, ' +
   '         M.IDSEGREGACRITER, ' +
   '         M.DATASEGREGACRITER, ' +
   '         PC.NOME, ' +
   '         PPA.NOME' ;

   Result := GetDataPacket(sSQL);
end;

function TCtrlSegregacaoProc.RetornaDivergMemoCalcMaster(dtinicio,
  dtfim: TDateTime; iidplanoprev: integer): Olevariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT DISTINCT ' +
    '       ''N'' AS CHECADO,' +
    '       P.PLNCODIGO,' +
    '       P.PLNPLANIL,' +
    '       M.LACNUMDOC,' +
    '       P.PLNDATDIA,' +
    '       NVL(SUM(DECODE(M.LACDEBCRE,''C'',M.LACVALOR)),0) AS LANCREDITO,' +
    '       NVL(SUM(DECODE(M.LACDEBCRE,''D'',M.LACVALOR)),0) AS LANDEBITO,' +
    '				NVL(SUM(DECODE(M.LACDEBCRE,''D'',M.LACVALOR)),0) - NVL(SUM(DECODE(M.LACDEBCRE,''C'',M.LACVALOR)),0) AS DIFERENCA ' +
    'FROM 	PLANILHA P, ' +
    '				MEMOCALCSEGREGA M ' +
    'WHERE 	(M.IDPLANOPREV = ' + IntToStr(iidplanoprev) + ')' +
    '	  AND (P.PLNDATDIA BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtinicio)) + '  AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtfim)) + ') ' +
    '		AND EXISTS (SELECT	PL.PLNPLANIL,' +
    '												MC.IDPLANOPREV,' +
    '												MC.IDPATRO,' +
    '												MC.IDSEGREGACRITER,' +
    '												MC.DATASEGREGACRITER,' +
    '												NVL(SUM(DECODE(MC.LACDEBCRE,''C'',MC.LACVALOR)),0) AS CREDITO,' +
    '                       NVL(SUM(DECODE(MC.LACDEBCRE,''D'',MC.LACVALOR)),0) AS DEBITO,' +
    '                       NVL(SUM(DECODE(MC.LACDEBCRE,''C'',MC.LACVALOR)) - SUM(DECODE(MC.LACDEBCRE,''D'',MC.LACVALOR)),0)AS DIFERENCA ' +
    '               FROM    PLANILHA PL,' +
    '                       MEMOCALCSEGREGA MC '+
    '               WHERE   (MC.IDPLANOPREV = ' + IntToStr(iidplanoprev) + ') ' +
    '                   AND (PL.PLNCODIGO = MC.PLNCODIGO) ' +
    '                   AND (PL.PLNCODIGO = P.PLNCODIGO) ' +
    '                   AND (PL.PLNDATDIA BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtinicio)) + '  AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtfim)) + ') ' +
    '               GROUP BY PL.PLNPLANIL, ' +
    '                        MC.IDPLANOPREV,' +
    '                        MC.IDPATRO, ' +
    '                        MC.IDSEGREGACRITER, ' +
    '                        MC.DATASEGREGACRITER ' +
    '               HAVING   (SUM(DECODE(MC.LACDEBCRE,''C'',NVL(MC.LACVALOR,0),0)) - SUM(DECODE(MC.LACDEBCRE,''D'',NVL(MC.LACVALOR,0),0))) <> 0) ' +
    '                    AND (P.PLNCODIGO = M.PLNCODIGO) ' +
    'GROUP BY P.PLNCODIGO,' +
    '         P.PLNPLANIL,' +
    '         M.LACNUMDOC,' +
    '         P.PLNDATDIA ' +
    'ORDER BY P.PLNPLANIL,' +
    '         M.LACNUMDOC ' ;

    Result := GetDataPacket(sSQL);
end;

function TCtrlSegregacaoProc.RetornaSegregacaoParaMemoCalc(const iidpessoa,
  iexercicio, ipernumero, iidplanoprev: integer): OleVariant;
var
  sSql: string;
begin
  sSql := 'SELECT ' + #13 +
          '   IDSEGREGACAO, IDPESSOA, PEREXERCICIO, PERNUMERO, ' + #13 +
          '   PLNCODIGO ' + #13 +
          'FROM ' + #13 +
          '   SEGREGACAO ' + #13 +
          'WHERE ' + #13 +
          '   (IDPESSOA = '           + IntToStr (iIdPessoa)  + ')' + #13 +
          '   AND (PEREXERCICIO = '   + IntToStr (iExercicio) + ')' + #13 +
          '   AND (PERNUMERO = '      + IntToStr (iPerNumero) + ')' + #13 +
          '   AND (IDPLANOPREV = '    + IntToStr (iIdPlanoPrev) + ')';
  Result := GetDataPacket(sSql);
end;

function TCtrlSegregacaoProc.RetornaLancamentosSegregados(iexercicio, iperiodo, iidplanoprev: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT DISTINCT L.PLNCODIGO, L.LACNUMLAN, L.LACDEBCRE ' +
    'FROM PLANILHA P, LANCAMENTO L, MEMOCALCSEGREGA M ' +
    'WHERE  P.PLNCODIGO = L.PLNCODIGO ' +
    ' AND P.PLNCODIGO = M.PLNCODIGO ' +
    ' AND L.IDSEGREGACONTR = M.IDSEGREGACONTR ' +
    ' AND P.PEREXERCICIO = ' + IntToStr(iexercicio) +
    ' AND P.PERNUMERO = ' + IntToStr(iperiodo) +
    ' AND L.IDPLANOPREV = ' + IntToStr(iidplanoprev) ;

  Result := GetDataPacket(sSQL);
end;

function TCtrlSegregacaoProc.MarcarLancamentoSegregado(iexercicio, iperiodo, iplanoprev, iidsegregacao: integer): boolean;
var
   cdsLocal: TCmClientDataSet;
   sSQL: string;
   iAtual, iQuant: integer;
begin
   try
      Result := True;

      cdsLocal := TCMClientDataSet.Create(nil);
      cdsLocal.Data := RetornaLancamentosSegregados(iexercicio, iperiodo, iplanoprev);

      // Progresso
      iAtual := 1;
      iQuant := cdsLocal.RecordCount;
      DoProgresso (['Aguarde', iAtual, iQuant, '']);

      while (not cdsLocal.Eof) do
      begin
         sSQL :=
           'UPDATE LANCAMENTO SET IDSEGREGACAO = ' + IntToStr(iidsegregacao) +
           'WHERE PLNCODIGO = ' + cdsLocal.FieldByName('PLNCODIGO').AsString +
           '  AND LACNUMLAN = ' + cdsLocal.FieldByName('LACNUMLAN').AsString +
           '  AND LACDEBCRE = ' + QuotedStr(cdsLocal.FieldByName('LACDEBCRE').AsString);
         if not ExecSQL (sSql) then
         begin
            Result := False;
            raise exception.Create ('Não consegui atualizar o IDSEGREGACAO na tabela lançamento!');
         end;

         inc(iAtual);
         DoProgresso (['Aguarde', iAtual, iQuant, '']);
         cdsLocal.Next;
      end;
   finally

      FreeAndNil(cdsLocal);
   end;
end;

end.
