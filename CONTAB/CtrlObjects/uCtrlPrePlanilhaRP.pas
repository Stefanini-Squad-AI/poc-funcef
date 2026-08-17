unit uCtrlPrePlanilhaRP;

{------------------------------------------------------------------------------
  Responsável : Cássio Rovaroto de Camargo
  Data        : 17/09/2009
  SOL Nº      : 124450
  KINTANA Nº  : 632038
  Descrição   : Inclusão do campo DATAVIGPREPLANILHA, para tratar o problema
                ao alterar o rateio dos programas.
 ------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 26/04/2007
  Pendência    : 25025
  Solução      : Criado a property bIgnoraSegregacao para ignorar a segregação na origem.
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 16/08/2005
  Pendência    : 19986
  Solução      : Na geração do rateio por programa, para as contas com o mesmo
                 nível, não suprimir o 1º caracter da conta de destino.
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 15/04/2005
  Pendência    : 19050
  Solução      : Estava dando erro em planilhas com marcação por percentual
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 05/04/2005
  Pendência    : 18965
  Solução      : 1) Respeitar o cadastramento da planilha na marcação do atributo:
                    "Integra planilha manualmente"
                 2) Se o percentual de rateio for determinado pelo saldo das contas,
                   calcular um percentual de rateio único para aquele grupo contábil,
                   independente a marcação do parâmetro anterior.

------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 22/02/2005
  Pendência    : 17813 / 18439
  Solução      : Método completamente refeito
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 25/01/2005
  Pendência    : 18439
  Solução      : Filtrar o processamento de rateio por programa pela planilha
                 cadastrada

                 Criado método: ListPrePlanilhaRP

                 Movido o método: GeraRateioporPrograma
                              de: uCtrlProcessaContab

------------------------------------------------------------------------------}

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask,CMProcura,DBTables,
     uCtrlPrePlanilha, uCMSqlParams, uCMClientDataSet, uCMTypes,
     uCtrlLancamento, uCtrlPlanoSaldo, uCtrlHistoContab, uCtrlContaContabil,
     uCtrlPadroes, uDBContasxcc;

  Type

    TCtrlPrePlanilhaRP = Class(TCtrlPrePlanilha)

    private
       CtrlLancamento     : TCtrlLancamento;
       CtrlPlanoSaldo     : TCtrlPlanoSaldo;
       CtrlHistoContab    : TCtrlHistoContab;
       CtrlContaContabil  : TCtrlContaContabil;
       CtrlPadroes        : TCtrlPadroes;
       FDBContasxcc       : TDBContasxcc;
       FbIgnoraSegregacao : Boolean;
       function ExcluiPlanilha ( sNomeBilhete: string;
                                 const dEmpresa: Double;
                                 const dModulo : Double;
                                 const iUsuario: Integer;
                                 const iPanCodigo: integer;
                                 const sDataGera: String;
                                 var sMsg: string): Boolean;

      // retorna o saldo da movimentação do mês até o dia OU no DIA (APENAS DATA)
      function ListSaldoMovMes ( const sPlaConta       : string;
                                 const iPlano          : integer;
                                 const iPerExercicio   : integer;
                                 const iPerNumero      : integer;
                                 const iIdPessoa       : integer;
                                 const sDataRef        : string;
                                 const iIdPlanoPrev    : integer;
                                 const iIdPatro        : integer;
                                 const sCodCentroCusto : string;
                                 const bApenasData     : boolean;
                                 const bCCustoUnico    : boolean): OleVariant;
      procedure SetbIgnoraSegregacao(const Value: Boolean);
    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;

    public

      Destructor Destroy; Override;
      constructor Create;  Override;

      {Esta função tem como finalidade trazer os detalhes do cadastro pre-planilha (rateio por programa}
      function ListCdsDetalheRP( const dPanCodigo :Double;
                                 const bApenasConta: Boolean = false  ) :OleVariant;

      // Alex 25/01/04 - 18439 - listagem da tabela pre-palinha,
      // RETORNA AINDA A CONTA BASE PARA EXECUÇÃO DO PROCESSO = 5281
      function ListPrePlanilhaRP ( const iIdEmpresa: integer;
                                   const iPanCodigo: integer = -1;
                                   const sInativo: string = 'N'): OleVariant;


      { Esta função gera lancamento de rateios}
      Function GeraRateioPorPrograma( sNomeBilhete: string;
                                      const dEmpresa,dModulo: Double;
                                      const iUsuario, iPlano, iExercicio, iPeriodo: Integer;
                                      const dDataIni, dDataFim: TDateTime;
                                      const bUsaPPatro, bAssociaCCustos, bExcluiPlanilha: Boolean;
                                      const iPanCodigo: integer;
                                      const sCodCCLancto: string): Boolean;

      //Cássio - SOL Nº 124450 KINTANA Nº632038
      //Busca a data de vigência para as contas novas inseridas
      Function ListaDataVigencia(const iIDPlano: Integer): TDateTime;
      property bIgnoraSegregacao : Boolean read FbIgnoraSegregacao write SetbIgnoraSegregacao;
    End;


implementation

procedure TCtrlPrePlanilhaRP.AfterInitialize;
begin
  inherited;
  FDBContasxcc.DataBaseName := DataBaseName;

  CtrlLancamento.InitializeAs (self);
  CtrlPlanoSaldo.InitializeAs (self);
  CtrlHistoContab.InitializeAs (self);
  CtrlContaContabil.InitializeAs (self);
  CtrlPadroes.InitializeAs (self);

end;

constructor TCtrlPrePlanilhaRP.Create;
begin
  inherited;
  FDBContasxcc := TDbContasxcc.Create (Self);

  CtrlLancamento    := TCtrlLancamento.Create;
  CtrlPlanoSaldo    := TCtrlPlanoSaldo.Create;
  CtrlHistoContab   := TCtrlHistoContab.Create;
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlPadroes       := TCtrlPadroes.Create;
end;

destructor TCtrlPrePlanilhaRP.Destroy;
begin
  FreeAndNil (FDBContasxcc);

  FreeAndNil (CtrlLancamento);
  FreeAndNil (CtrlPlanoSaldo);
  FreeAndNil (CtrlHistoContab);
  FreeAndNil (CtrlContaContabil);
  FreeAndNil (CtrlPadroes);
  inherited;
end;

procedure TCtrlPrePlanilhaRP.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlPrePlanilhaRP.ExcluiPlanilha(sNomeBilhete:string; const dEmpresa, dModulo: Double;
  const iUsuario, iPanCodigo: integer; const sDataGera: string; var sMsg: string): Boolean;

var
  _cdsVerifPlanil: TCMClientDataSet;

begin
   try
      Result := true;
      _cdsVerifPlanil := TCMClientDataSet.Create (nil);
      _cdsVerifPlanil.Data := ListVerifPlanil(iPanCodigo, trunc(dEmpresa), sDataGera);

      try
         if not _cdsVerifPlanil.isEmpty then begin
            // Pend 17191 Alex Pereira 14/07/2004
            // com o flag paramcontab.pacnaoapagaplanil ligado a planilha não é excluída,
            // devendo ter o pancodigo zerado para não dar problema na segunda exclusão
            ExecSQL ('UPDATE PLANILHA SET PANCODIGO = NULL WHERE PLNCODIGO = ' + IntToStr(_cdsVerifPlanil.FieldByName('PLNCODIGO').asInteger));

            if not CtrlLancamento.ExcluiLancaContab(iUsuario,_cdsVerifPlanil.FieldByName('PLNCODIGO').asInteger,
                                                    dModulo, 0, True, True) then
               raise Exception.Create (CtrlLancamento.MessageInfo)
            else
               sMsg := sMsg + 'Excluída a Planilha no. ' + _cdsVerifPlanil.FieldByName('PLNPLANIL').asString+ ' do dia '+ sDataGera + #13;
               DoProgresso ([sNomeBilhete, 0, 0, '', sMsg]);
               sMsg := '';
         end else
            sMsg := sMsg + 'Não há planilhas a excluir no dia ' + sDataGera + #13;
      except
         on E:Exception do begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   finally
      _cdsVerifPlanil.free;
   end;
end;

function TCtrlPrePlanilhaRP.GeraRateioPorPrograma( sNomeBilhete: string;
                                      const dEmpresa,dModulo: Double;
                                      const iUsuario, iPlano, iExercicio,iPeriodo: Integer;
                                      const dDataIni, dDataFim: TDateTime;
                                      const bUsaPPatro, bAssociaCCustos, bExcluiPlanilha: Boolean;
                                      const iPanCodigo: integer; const sCodCCLancto: string): Boolean;
var
   cTipoLanc :char;
   dAcuCor, dAcuOfi, dAcuGer, dAcuGer1, dAcuGer2, dAcuHist, dValCor,dPlnCodigo, dPlnPlanil : Double;
   dTotLanc, dValLanc,dValOfi,dValGe1,dValGe2,dValGe3,dvalhistdeb,dTotal,dPercentual :Double;
   sContaD,sContaC,sCCusto,sNumDoc,sHistoricoOri,sHistPad,sConta,sHistorico, sTipoOper : string;
   iSubContaC,iSubContaD,iPlanoPrev,iPatro,iUnidNegoc,iCodPlano,iX :Integer;

  _cdsHistoPadrao       : TCMClientDataSet;
  _cdsRateio            : TCMClientDataSet;
  _cdsContas521_522_523 : TCMClientDataSet;
  _cdsSaldos5281        : TCMClientDataSet;
  _CdsSaldoConta        : TCMClientDataSet;

  // variáveis para a barra de progresso
  sMsg: String;
  iQuant, iAtual: Integer;

  // Variável para calcular a data do lançamento para planilhas diárias
  dDataAtu : TDateTime;
  sDataGera: string;
  bPlanilhaDiaria: Boolean;

  iIdSegregaCriter: integer;
  dDataSegregaCriter: TDateTime;


begin
   {Funcão implementada na Aplicação Servidora}
   if ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.GeraRateioPorPrograma(dEmpresa,dModulo,iUsuario,
                   iPlano, iExercicio, iPeriodo, dDataIni, dDataFim, bUsaPPatro);

      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo
      else begin
//         FsMensAPS_Log := Connection.AppServer.MessageInfo;
         MessageInfo   := 'Geração efetuada com sucesso!';
      end;

   end else begin
      try

         iAtual := 0;
         iQuant := 0;
         sMsg   := '';

         iSubContaD    := 0;
         iSubContaC    := 0;
         iUnidNegoc    := 0;
         Result        := True;

         _cdsHistoPadrao       := TCMClientDataSet.Create(nil);
         _cdsRateio            := TCMClientDataSet.Create(nil);
         _cdsContas521_522_523 := TCMClientDataSet.Create(nil);
         _cdsSaldos5281        := TCMClientDataSet.Create(nil);
         _CdsSaldoConta        := TCMClientDataSet.Create(nil);

         _cdsRateio.Data := ListPrePlanilhaRP (trunc(dEmpresa), iPanCodigo);

         try
            StartTransaction;

            // Alex estou obrigando a passagem de parâmetro da planilha, desta forma o while terá sempre 1 registro
            sMsg := '';
            _cdsRateio.First;
            while not _cdsRateio.EOF do begin

               // verifica se a planilha é de periodicidade diária ou mensal
               if _cdsRateio.FieldByName('FLGPERIODOGERA').AsString = 'D' then dDataAtu := dDataIni
               else dDataAtu := dDataFim;
               bPlanilhaDiaria := _cdsRateio.FieldByName('FLGPERIODOGERA').AsString = 'D';

               sMsg := sMsg + '========================================================' + #13 +
                              'Planilha: ' + _cdsRateio.FieldByName('PANDESCRICAO').AsString + #13 +
                              'Periodicidade: ' ;

               if bPlanilhaDiaria then
                  sMsg := sMsg + 'Diária' + #13
               else
                  sMsg := sMsg + 'Mensal' + #13;

               sTipoOper := _cdsRateio.FieldByName('TIPCODIGO').AsString;
               if  sTipoOper = '' then sTipoOper := '03';

               // excluir as planilhas por data antes de começar o prcessamento
               if bExcluiPlanilha then begin
                  sMsg := sMsg + '-------------------------------------------------------------------------' + #13 +
                                 'Excluindo planilhas anteriores: ' + #13;

                  DoProgresso ([sNomeBilhete, 0, 0]);

                  while (dDataAtu <= dDataFim) do begin
                     sDataGera := FormatDateTime ('dd/mm/yyyy', dDataAtu);
                     //=== Verifica se a planilha já foi gerada para ser excluida. ===
                     if not ExcluiPlanilha (sNomeBilhete,dEmpresa, dModulo,iUsuario, _cdsRateio.FieldByName('PANCODIGO').AsInteger, sDataGera, sMsg) then
                        raise Exception.Create (MessageInfo);

                     dDataAtu := dDataAtu +1;
                  end;
                  sMsg := sMsg + #13 +
                               'Rotina de exclusão de planilhas anteriores finalizada com sucesso! ' + #13 +
                               '-------------------------------------------------------------------------' + #13;
                  DoProgresso ([sNomeBilhete, 0, 0, '', sMsg]);
                  sMsg := '';
               end;
               // excluir as planilhas por data antes de começar o prcessamento

               //== pega as contas de referencia ===
               _cdsContas521_522_523.Data := ListCdsDetalheRP ( _cdsRateio.FieldByName('PANCODIGO').AsFloat, true);

               // Fazer o rateio pelo saldo da conta contábil
               dTotal := 0;
               if (_cdsRateio.FieldByName('PANCONTAPERC').IsNull) or (_cdsRateio.FieldByName('PANCONTAPERC').AsString <> 'P') then begin

                  _cdsContas521_522_523.First;
                  while not _cdsContas521_522_523.EOF do begin

                      _CdsSaldoConta.Data := CtrlPlanoSaldo.RetornaSaldoContaExerc (iExercicio, iPeriodo,
                                                             _cdsContas521_522_523.FieldByName('PLANO').AsInteger,
                                                             dEmpresa, _cdsContas521_522_523.FieldByName('PLACONTA').AsString,
                                                             tAtual,
                                                             StrToIntDef(_cdsContas521_522_523.FieldByName('IDPLANOPREV').AsString, -99),
                                                             StrToIntDef(_cdsContas521_522_523.FieldByName('IDPATRO').AsString, -99), false
                                                             _cdsContas521_522_523.FieldByName('CODCENTROCUSTO').AsString);

                    if not _CdsSaldoConta.IsEmpty then begin
                      dTotal := dTotal + _CdsSaldoConta.FieldByName('SALDO').AsFloat;
                      // Alex 05/04/05 18965
                      _cdsContas521_522_523.edit;
                      _cdsContas521_522_523.FieldByName('SALDOCONTA').AsFloat := _CdsSaldoConta.FieldByName('SALDO').AsFloat;
                      _cdsContas521_522_523.post;
                    end;
                    _cdsContas521_522_523.Next;
                  end;
                  // Alex 15/04/05 19050 - a planilha mesmo por percentual estava dando este erro, pois este bloco estava fora deste bloco do if
                  // Alex 05/04/05 18965
                  if dTotal = 0 then raise Exception.Create ('Esta planilha foi parametrizada para se apurar o percentual por "conta".' + #13 +
                                                             'Não foi possível se obter os saldos contábeis das contas de "destino". '  + #13 +
                                                             'Favor verificar a parametrização.');

               end;
               // fim Fazer o rateio pelo saldo da conta contábil

               if bPlanilhaDiaria then dDataAtu := dDataIni
               else dDataAtu := dDataFim;

               // Processar as planilhas
               iAtual := 0;
               iQuant := 0;
               while dDataAtu <= dDataFim do begin

                  dPlnCodigo    := 0;
                  sDataGera := FormatDateTime ('dd/mm/yyyy', dDataAtu);

                  _cdsSaldos5281.Data := ListSaldoMovMes ( _cdsRateio.FieldByName('PANCONTABASE').AsString,
                                                           _cdsRateio.FieldByName('PLANO').AsInteger,
                                                           iExercicio, iPeriodo, trunc (dEmpresa),
                                                           sDataGera,
                                                           StrToIntDef(_cdsRateio.FieldByName('IDPLANOPREV').AsString, -1),
                                                           StrToIntDef(_cdsRateio.FieldByName('IDPATRO').AsString, -1),
                                                           _cdsRateio.FieldByName('CODCENTROCUSTO').AsString,
                                                           bPlanilhaDiaria,
                                                           (sCodCCLancto <> ''));

                  if _cdsSaldos5281.IsEmpty then begin
                     if bPlanilhaDiaria then begin
                        sMsg := sMsg + '-------------------------------------------------------------------------' + #13 +
                                       'Não existem lançamentos contábeis para os dados abaixo: '+ #13 +
                                       'Data: ' + sDataGera + ' Conta Contábil: ' + trim(_cdsRateio.FieldByName('PANCONTABASE').AsString)+  #13;
                     end else begin
                        sMsg := sMsg + '-------------------------------------------------------------------------' + #13 +
                                       'Não existem lançamentos contábeis para os dados abaixo: '+ #13 +
                                       'Mes: ' + IntToStr(iPeriodo) + ' Ano: ' + IntToStr(iExercicio) + ' Conta Contábil: ' + trim(_cdsRateio.FieldByName('PANCONTABASE').AsString)+  #13;
                     end;
                     if not _cdsRateio.FieldByName('IDPATRO').IsNull then
                        sMsg := sMsg + 'Patrocinadora:' + IntToStr(_cdsRateio.FieldByName('IDPATRO').AsInteger) + #13;
                     if not _cdsRateio.FieldByName('IDPLANOPREV').IsNull then
                        sMsg := sMsg + 'Plano Previdenciario:' + IntToStr(_cdsRateio.FieldByName('IDPLANOPREV').AsInteger) + #13;
                     if not _cdsRateio.FieldByName('CODCENTROCUSTO').IsNull then
                        sMsg := sMsg + 'Centro de Custos: ' + _cdsRateio.FieldByName('CODCENTROCUSTO').AsString + #13;

                     sMsg := sMsg + #13 + 'Não foi gerado nehum rateio com estas condições! ' + #13 +
                                   '-----------------------------------------------------------' + #13;
                  end else begin

                     if (iQuant = 0) then
                        iQuant := (trunc(dDataFim) - trunc (dDataIni) + 1) * _cdsSaldos5281.RecordCount;

                     DoProgresso ([sNomeBilhete, 0, 0]);


                     // Definir o histórico
                     sHistoricoOri := _cdsRateio.FieldByName('PANDESCRICAO').asString;
                     sHistPad      := '';
                     if not _cdsRateio.FieldByName('HITCODHIST').IsNull then begin
                        _cdsHistoPadrao.Data := CtrlHistoContab.ListHistoContab (dEmpresa, tohCodigo, _cdsRateio.FieldByName('HITCODHIST').AsString);
                        if not _cdsHistoPadrao.IsEmpty then begin
                           sHistoricoOri := _cdsHistoPadrao.FieldByName('HITDESCR1').asString;
                           sHistPad      := _cdsRateio.FieldByName('HITCODHIST').AsString;
                        end;
                     end;

                     dValOfi        := 0;
                     dValGe1        := 0;
                     dValGe2        := 0;
                     dValGe3        := 0;
                     dValHistDeb    := 0;
                     iCodPlano      := iPlano;
                     sNumDoc        := 'Rateio por Prog';
                     cTipoLanc      := '2';


                     // Fazer os lançamentos contábeis
                     _cdsSaldos5281.First;
                     while not _cdsSaldos5281.EOF do begin
                        dTotLanc       := 0;
                        iPlanoPrev     := _cdsSaldos5281.FieldByName('IDPLANOPREV').AsInteger;
                        iPatro         := _cdsSaldos5281.FieldByName('IDPATRO').AsInteger;

                        // varre as 521 e 523
                        _cdsContas521_522_523.First;
                        while not _cdsContas521_522_523.EOF do begin

                           if _cdsRateio.FieldByName('PANCONTAPERC').AsString = 'P' then begin
                              dPercentual    := _cdsContas521_522_523.FieldByName('PANPERC').AsFloat/100;
                           end else begin

                              { Alex 05/04/05 18965
                              _CdsSaldoConta.Data := CtrlPlanoSaldo.RetornaSaldoContaExerc (iExercicio, iPeriodo,
                                                                     _cdsContas521_522_523.FieldByName('PLANO').AsInteger,
                                                                     dEmpresa,
                                                                     _cdsContas521_522_523.FieldByName('PLACONTA').AsString,
                                                                     tAtual,
                                                                     StrToIntDef(_cdsContas521_522_523.FieldByName('IDPLANOPREV').AsString, -99),
                                                                     StrToIntDef(_cdsContas521_522_523.FieldByName('IDPATRO').AsString, -99), false
                                                                     _cdsContas521_522_523.FieldByName('CODCENTROCUSTO').AsString);

                              if dTotal <> 0 then
                                 dPercentual := _CdsSaldoConta.FieldByName('SALDO').AsFloat/dTotal
                              else
                                 dPercentual := 0;
                              }
                              dPercentual := _cdsContas521_522_523.FieldByName('SALDOCONTA').AsFloat / dTotal;
                           end;
                           sHistorico := sHistoricoOri+' '+format('%18.7f', [dPercentual*100])+'%';

                           CtrlHistoContab.ArrumaHistorico(sHistorico);

                           iCodPlano      := _cdsContas521_522_523.FieldByName('PLANO').AsInteger;
                           // se o cliente parametrizar a 5281 dará erro no if abaixo
                           sConta := trim(_cdsContas521_522_523.FieldByName('PLACONTA').AsString);

                           // Testa se conta existe no plano de conta antes
                           // efetuar o lancamento
                           if not CtrlContaContabil.TestaContaContabilProc(iCodPlano,dEmpresa,iPeriodo,iExercicio,sConta,False,False) then
                           begin
                              //
                              // Conta 5 2 8 1 01 01 03 81
                              //  =    5 2 1 1 01 03 81
                              //  =    5 2 3 1 01 03 81
                              // parametrizar a conta 5281
                              iX := length(trim(_cdsRateio.FieldByName('PANCONTABASE').AsString));
                              //Alex 16/08/2005 - P: 19986 - FUNCEF
                              // para funcionar para receitas administrativas o grau é o mesmo
                              // não mudar o nível, ex:
                              // Conta 5 1 8 1 01 01
                              //  =    5 1 1 1 01 01
                              //  =    5 1 2 1 01 01
                              // Neste caso a parametrização será 511, 512, 518
                              //sConta         := trim(trim(_cdsContas521_522_523.FieldByName('PLACONTA').AsString)+copy(_cdsSaldos5281.FieldByName('PLACONTA').AsString,(iX+2),(18-iX)));
                              sConta := trim(trim(_cdsContas521_522_523.FieldByName('PLACONTA').AsString)+
                                          copy(_cdsSaldos5281.FieldByName('PLACONTA').AsString,
                                               (iX+iX-length(trim(_cdsContas521_522_523.FieldByName('PLACONTA').AsString))+1),(18-iX)));
                              //Alex 16/08/2005 - P: 19986 - FUNCEF

                              if not CtrlContaContabil.TestaContaContabilProc(iCodPlano,dEmpresa,iPeriodo,iExercicio,sConta,False,False) then
                              begin
                                MessageInfo := 'Encontrado problemas em se determinar a conta contábil para processamento! ' + #13 +
                                               'Conta: ' +_cdsContas521_522_523.FieldByName('PLACONTA').AsString + #13 +
                                               'Conta Calculada: ' + sConta + #13 +
                                               CtrlContaContabil.MessageInfo;
                                Raise Exception.Create(MessageInfo);
                              end;
                           end;

                           iIdSegregaCriter := -1;
                           dDataSegregaCriter := -1;
                           if not _cdsSaldos5281.FieldByName('IDSEGREGACRITER').IsNull then begin
                              iIdSegregaCriter := _cdsSaldos5281.FieldByName('IDSEGREGACRITER').AsInteger;
                              dDataSegregaCriter := _cdsSaldos5281.FieldByName('DATASEGREGACRITER').AsDateTime;
                           end;

                           dValCor        := (_cdsSaldos5281.FieldByName('SALDOCOR').AsFloat * dPercentual);
                           iUnidNegoc  := StrToIntDef(_cdsSaldos5281.FieldByName('UNIDNEGOC').AsString, 0);

                           // utilizar um único centro de custos para os lançamentos contábeis
                           if sCodCCLancto <> '' then
                             sCCusto := sCodCCLancto
                           else
                             sCCusto := _cdsSaldos5281.FieldByName('CODCENTROCUSTO').AsString;

                           sContaD        := sConta;
                           iSubContaD := StrToIntDef(_cdsSaldos5281.FieldByName('CODSUBCONTA').AsString, 0);

                           sContaC        := _cdsSaldos5281.FieldByName('PLACONTA').AsString;
                           iSubContaC     := iSubContaD;
                           dValLanc       := dValCor;

                           //=== faz lancamento ===
                           if dValLanc <> 0 then begin
                              dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                              dTotLanc := dTotLanc + dValLanc;

                              //========== insere Centro de Custos ===========
                              if (bAssociaCCustos) and (sCCusto <> '') then begin
                                 FDBContasxcc.Clear;
                                 FDBContasxcc.Codcentrocusto.AsString := sCCusto;
                                 FDBContasxcc.Idempresa.AsFloat       := dEmpresa;
                                 FDBContasxcc.Placonta.AsString       := sContaD;
                                 FDBContasxcc.Plano.AsInteger         := iCodPlano;

                                 // Se o if abaixo não funcionar... CtrlContaContabil.ListContasxCC
                                 if not FDBContasxcc.LoadFromDb then begin
                                   FDBContasxcc.Codcentrocusto.AsString := sCCusto;
                                   FDBContasxcc.Idempresa.AsFloat       := dEmpresa;
                                   FDBContasxcc.Placonta.AsString       := sContaD;
                                   FDBContasxcc.Plano.AsInteger         := iCodPlano;
                                   FDBContasxcc.Idusuarioinclusao.AsInteger := iUsuario;
                                   if not FDBContasxcc.Insert then
                                      raise exception.Create ('Erro ao se tentar associar Conta Contábil x Centro de Custos! '   + #13 +
                                                              'Centro de Custos: ' + sCCusto  + #13 +
                                                              'Conta Contábil: '   + sContaD   + #13 +
                                                              FDBContasxcc.MessageInfo);
                                 end;
                              end;

                              //==========================================
                              // Alex 05/04/05 18965
                              //CtrlLancamento.lcTestaConta := not (_cdsRateio.FieldByName('FLGINTEGRAPLAN').AsBoolean);
                              CtrlLancamento.lcTestaConta := not (_cdsRateio.FieldByName('FLGINTEGRAPLAN').AsString = 'S');
                              if not CtrlLancamento.InsereLancaContab(cTipoLanc,dEmpresa,dModulo,iUsuario,
                                                        iCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                        iPlanoPrev, iPatro,dPlnCodigo,0,
                                                        sDataGera,sNumDoc,CtrlHistoContab.Hist1,
                                                        CtrlHistoContab.Hist2,CtrlHistoContab.Hist3,
                                                        CtrlHistoContab.Hist4,CtrlHistoContab.Hist5,
                                                        sTipoOper,sCCusto,sContaD,
                                                        sCCusto,sContaC,sHistPad,
                                                        dValLanc,False,bUsaPPatro,
                                                        iIdSegregaCriter, dDataSegregaCriter) then begin
                                 Raise Exception.Create('O lançamento contábil não pode ser feito! ' + #13 +
                                                        'Conta Débito : ' + sContaD + ' C.Custos: ' + sCCusto + #13 +
                                                        'Conta Crétido: ' + sContaC + ' C.Custos: ' + sCCusto + #13 +
                                                        CtrlLancamento.MessageInfo);
                              end else begin
                                 dPlnCodigo := CtrlLancamento.RetornoPlnCodigo;
                                 dPlnPlanil := CtrlLancamento.RetornoPlnPlanil;
                              end;

                           end;
                           _cdsContas521_522_523.Next;
                        end;


                        // Lançar o arredondamento, caso possua
                        if Format('%17.2f',[dTotLanc]) <> Format('%17.2f',[_cdsSaldos5281.FieldByName('SALDOCOR').AsFloat]) then begin
                           sHistorico := sHistoricoOri+' - Arredondamento';

                           CtrlHistoContab.ArrumaHistorico(sHistorico);

                           dValLanc := StrToFloat(format('%18.2f', [(_cdsSaldos5281.FieldByName('SALDOCOR').AsFloat-dTotLanc)]));

                           // Alex 05/04/05 18965
                           //CtrlLancamento.lcTestaConta := not (_cdsRateio.FieldByName('FLGINTEGRAPLAN').AsBoolean);
                           CtrlLancamento.lcTestaConta := not (_cdsRateio.FieldByName('FLGINTEGRAPLAN').AsString = 'S');
                           if not CtrlLancamento.InsereLancaContab(cTipoLanc,dEmpresa,dModulo,iUsuario,
                                                     iCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                     iPlanoPrev, iPatro,dPlnCodigo,0,
                                                     sDataGera,sNumDoc,CtrlHistoContab.Hist1,
                                                     CtrlHistoContab.Hist2,CtrlHistoContab.Hist3,
                                                     CtrlHistoContab.Hist4,CtrlHistoContab.Hist5,
                                                     sTipoOper,sCCusto,sContaD,
                                                     sCCusto,sContaC,sHistPad,
                                                     dValLanc,False,bUsaPPatro,
                                                     iIdSegregaCriter, dDataSegregaCriter) then begin
      //                         sMensAPS_Log := sMensAPS_Log + CtrlLancamento.MessageInfo + chr(13);
                              Raise Exception.Create('O lançamento contábil não pode ser feito! ' + #13 +
                                                     'Conta Débito : ' + sContaD + ' C.Custos: ' + sCCusto + #13 +
                                                     'Conta Crétido: ' + sContaC + ' C.Custos: ' + sCCusto + #13 +
                                                     CtrlLancamento.MessageInfo);
                           end;
                        end;
                        _cdsSaldos5281.Next;
                     end;


                     //=========== Atualiza a tabela =========
                     if not ExecSQL ('UPDATE PLANILHA SET PANCODIGO = ' + _cdsRateio.FieldByName('PANCODIGO').AsString +
                                     ' WHERE  PLNCODIGO = ' + FloatToStr (dPlnCodigo)) then begin
                        Raise Exception.Create('Erro ao se atulizar a planilha! ' + #13 + MessageInfo);
                     end;

                     sMsg := sMsg + 'Gerada a Planilha no. ' + FloatToStr (dPlnPlanil) + ' Código Interno: ' + FloatToStr (dPlnCodigo) + ' Data: ' + sDataGera + #13;
                  end;
                  // fim do lançamento contábil

                  inc (iAtual);
                  DoProgresso ([sNomeBilhete, iAtual, iQuant, '', sMsg]);
                  sMsg := '';
                  dDataAtu := dDataAtu + 1;
               end;  // end do for da data

               if not Padroes.GravaLogOperacoes(dEmpresa,dModulo,iUsuario, 'Rateio Por Programa',False) then
                  raise Exception.Create( Padroes.MessageInfo );


               Commit;
               _cdsRateio.Next;
            end;



         Except
            on E:Exception do begin
               Result := False;
               RollBack;

               MessageInfo := 'Problemas na geração da Planilha '+_cdsRateio.FieldByName('PANDESCRICAO').AsString + #13 +
                              E.Message;
             end;
         end;

      finally
         _cdsHistoPadrao.Free;
         _cdsRateio.Free;
         _cdsContas521_522_523.Free;
         _cdsSaldos5281.Free;
         _CdsSaldoConta.Free; // Alex 18/08/04 17380

      end;
   end;

end;

function TCtrlPrePlanilhaRP.ListCdsDetalheRP(const dPanCodigo :Double;
                                             const bApenasConta: Boolean) :OleVariant;
var
  sSql :string;
begin
      sSql := 'SELECT ' +
              '   D.PANCODIGO, D.PANNUMLANC, D.PLANO, D.PANCONTABASE, D.IDPESSOA, D.PLACONTA, ' + #13 +
              '   D.IDUSUARIOINCLUSAO, D.PANPERC, D.IDPATRO, D.IDPLANOPREV, D.HITCODHIST,     ' + #13 +
              '   D.IDEMPRESA, D.CODCENTROCUSTO, D.TIPCODIGO,                                 ' + #13 +
              '   CC.CODEXTERNO, PC.NOME PLANPREVCONTABIL, PE.NOME PATRO,                     ' + #13 +
              //Cássio - SOL Nº 124450 KINTANA Nº632038 - Início
              //Inclusão do campo DATAVIGPREPLANILHA
              // 05/04/05 Alex 18965
              '   0 AS SALDOCONTA, D.DATAVIGPREPLANILHA                                       ' + #13 +
              //Cássio - SOL Nº 124450 KINTANA Nº632038 - Fim
              'FROM                                                                           ' + #13 +
              '    PREDETALHE D, CENTCUST CC, PLANPREVCONTABIL PC, PATRO PA, PESSOA PE        ' + #13 +
              'WHERE (PANCODIGO = ' + FloatToStr(dPanCodigo) + ')                             ' + #13 +
              '  AND (D.IDEMPRESA = CC.IDEMPRESA (+))                                         ' + #13 +
              '  AND (D.CODCENTROCUSTO = CC.CODCENTROCUSTO (+))                               ' + #13 +
              '  AND (D.IDPLANOPREV = PC.IDPLANOPREV (+))                                     ' + #13 +
              '  AND (D.IDPATRO = PA.IDPESSOA (+))                                            ' + #13 +
              '  AND (PA.IDPESSOA = PE.IDPESSOA (+))                                          ' + #13 +
              //Cássio - SOL Nº 124450 KINTANA Nº632038 - Início
              //Busca a adta de Vigência atual da Planilha
              '  AND (D.DATAVIGPREPLANILHA  = (SELECT MAX(DATAVIGPREPLANILHA) FROM PREDETALHE ' +
              '                                 WHERE PANCODIGO = '+ FloatToStr(dPanCodigo) +' ))';
              //Cássio - SOL Nº 124450 KINTANA Nº632038 - Fim

      if bApenasConta then
         sSql := sSql + '   AND ( PLACONTA IS NOT NULL )' + #13;


      Result := GetDataPacket(sSql);

end;




function TCtrlPrePlanilhaRP.ListPrePlanilhaRP(const iIdEmpresa,
  iPanCodigo: integer; const sInativo: string): OleVariant;
var
  sSql, sFiltro: string;
begin
  sFiltro := '   AND ( P.IDPESSOA = ' + IntToStr(iIdEmpresa) + ' ) ' + #13;

  if iPanCodigo <> -1 then
    sFiltro := sFiltro + '   AND ( P.PANCODIGO = ' + IntToStr (iPanCodigo) + ' )' +#13;

  if sInativo = 'N' then
    sFiltro := sFiltro + '   AND ( P.PANINATIVO = ''N''  ) ' + #13;

  sSql := 'SELECT '                                                                          + #13 +
          '  P.PANDESCRICAO, P.PANCODIGO, P.PANCONTAPERC, P.PANFASE, P.FLGINTEGRAPLAN, '     + #13 +
          '  P. FLGPERIODOGERA, D.PLANO, D.PANCONTABASE, D.IDPLANOPREV, D.IDPATRO, '         + #13 +
          '  D.HITCODHIST, D.TIPCODIGO, D.CODCENTROCUSTO '                                   + #13 +
          'FROM '                                                                            + #13 +
          '   PREPLANILHA P, PREDETALHE D '                                                  + #13 +
          'WHERE '                                                                           + #13 +
          '   ( P.PANIDENTIFICACAO = ''G'' ) '                                               + #13 +
          '   AND ( D.PANCONTABASE IS NOT NULL) '                                            + #13 +
          '   AND ( D.PANCODIGO = P.PANCODIGO) '                                             + #13 +
          sFiltro;

  Result := GetDataPacket ( sSql );

end;

function TCtrlPrePlanilhaRP.ListSaldoMovMes(const sPlaConta: string;
  const iPlano, iPerExercicio, iPerNumero, iIdPessoa: integer;
  const sDataRef: string; const iIdPlanoPrev, iIdPatro: integer;
  const sCodCentroCusto : string; const bApenasData   : boolean;
  const bCCustoUnico    : boolean): OleVariant;
var
   sSql, sFiltro: string;

begin
   sFiltro := '';

   if iIdPlanoPrev <> -1 then
      sFiltro := sFiltro + '  AND (L.IDPLANOPREV = ' + IntToStr (iIdPlanoPrev) + ') ' + #13;

   if iIdPatro <> -1 then
      sFiltro := sFiltro + '  AND (L.IDPATRO = ' + IntToStr (iIdPatro) + ') ' + #13;

   if sCodCentroCusto <> '' then
      sFiltro := sFiltro + '  AND (L.CODCENTROCUSTO = ' +  QuotedStr (sCodCentroCusto) + ') ' + #13;

   if bApenasData then
      sFiltro := sFiltro + '  AND (P.PLNDATDIA = TO_DATE( ' + QuotedStr(sDataRef) + ' ,''DD/MM/YYYY'')) ' + #13
   else
      sFiltro := sFiltro + '  AND (P.PLNDATDIA <= TO_DATE( ' + QuotedStr (sDataRef) + ' ,''DD/MM/YYYY'')) ' + #13;

   //Marcus Oliveira P. 25025 26/04/2007   
   if bIgnoraSegregacao then
      sFiltro := sFiltro + '  AND (L.IDSEGREGACONTR IS NULL) ' + #13 ;



   sSql := 'SELECT L.PLACONTA, L.IDEMPRESA, L.UNIDNEGOC, ' + #13 +
           '       L.IDPLANOPREV, L.IDPATRO, L.CODSUBCONTA, L.IDSEGREGACRITER, L.DATASEGREGACRITER, ' + #13;

   if not bCCustoUnico then  // somente totalizar a query por movimentos se o usuário não escolher um único ccustos para lançamento
      sSql := sSql + '       L.CODCENTROCUSTO, ' + #13;

   sSql := sSql +
           '       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOCOR ' + #13 +
           'FROM PLANILHA P, LANCAMENTO L                                  ' + #13 +
           'WHERE (L.PLACONTA LIKE '  + QuotedStr(sPlaConta+'%') + ') ' + #13 +
           '  AND (L.PLANO = '        + IntToStr(iPlano)         + ') ' + #13 +
           '  AND (P.PEREXERCICIO = ' + IntToStr(iPerExercicio)  + ') ' + #13 +
           '  AND (P.PERNUMERO = '    + IntToStr(iPerNumero)     + ') ' + #13 +
           '  AND (P.IDPESSOA = '     + IntToStr(iIdPessoa)      + ') ' + #13 +
           sFiltro +
           '  AND (P.PLNEFETIVADO = ''S'') ' + #13 +
           '  AND (P.PLNCODIGO = L.PLNCODIGO) ' + #13 +
           'GROUP BY L.PLACONTA, L.IDEMPRESA, L.UNIDNEGOC, ' + #13 +
           '         L.IDPLANOPREV, L.IDPATRO, L.CODSUBCONTA, L.IDSEGREGACRITER, L.DATASEGREGACRITER ' + #13;

   if not bCCustoUnico then
      sSql := sSql + ', L.CODCENTROCUSTO ' + #13;

   sSql := sSql + 'HAVING SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) <> 0 ';


   Result := GetDataPacket (sSql);

end;

procedure TCtrlPrePlanilhaRP.OnCreateAppServer;
begin
  inherited;

end;

procedure TCtrlPrePlanilhaRP.SetbIgnoraSegregacao(const Value: Boolean);
begin
  FbIgnoraSegregacao := Value;
end;

function TCtrlPrePlanilhaRP.ListaDataVigencia(const iIDPlano : Integer): TDateTime;
var sSql :string;
    oCds : TClientDataSet;
begin
  Result := 0;
  oCds := TClientDataSet.Create(Nil);
  try
    sSql := 'SELECT MAX(DATAVIGPREPLANILHA) AS DATA' +#13+
            'FROM PREDETALHE'+#13+
            'WHERE (PLANO = '+IntToStr(iIDPlano)+')';
    oCds.Data := GetDataPacket(sSql);
    Result := oCds.FieldByName('DATA').asDateTime;
  Finally
    FreeAndNil(oCds);
  end;
end;


end.


