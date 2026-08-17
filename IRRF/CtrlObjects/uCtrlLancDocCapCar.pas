unit uCtrlLancDocCapCar;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uCMTypes, uCtrlDocumento,
     uCtrlLancamento, uCtrlFinanc, uCtrlImpostoRetido, UCtrlOrcamento, uCtrlPadroes,
     DCtrlDocCapCar, Db;

Const
  QUEBRADELINHA = ( #13 + #10 );
  MSG_ERRO_ALTERADOR = 'Não foi possível inserir Alterador.' + QUEBRADELINHA;
  MSG_ERRO_ATUALIZA_LANCTODOCUM = 'Erro ao atualizar LANCTODOCUM.PLNCODIGO.' + QUEBRADELINHA;
  MSG_ERRO_EXCLUI_CONTAB = 'Erro ao Excluir Contabilização.' + QUEBRADELINHA;
  MSG_ERRO_CONTABILIZA_LANCTO = 'Erro ao contabilizar lançamento.' + QUEBRADELINHA;
  MSG_ERRO_INSERIR_DOC = 'Erro ao Inserir documento.' + QUEBRADELINHA;
  MSG_ERRO_BAIXA_ADIANTO = 'Erro ao baixar adiantamento.' + QUEBRADELINHA;
  MSG_ERRO_ATUALIZA_BAIXA_ADIANTO = 'Erro ao atualizar baixa de adiantamento.' + QUEBRADELINHA;
  MSG_ERRO_LANC_FINANC = 'Erro ao fazer lançamento de baixa no financeiro.' + QUEBRADELINHA;
  MSG_ERRO_BAIXA_DOC = 'Erro ao inserir baixa de documento.' + QUEBRADELINHA;
  MSG_ERRO_REG_ADIANTO = 'Erro na Regularização de Adianamento.' + QUEBRADELINHA;
  MSG_ERRO_EXCLUI_PREVISA0 = 'Erro ao excluir lançamento de Contrato\Previsão.' + QUEBRADELINHA;
  MSG_ERRO_ALTERA_PREVISA0 = 'Erro ao alterar lançamento de Contrato\Previsão.' + QUEBRADELINHA;
  MSG_ERRO_ATUALIZA_ORCAMENTO = 'Erro ao atualizar valores do orçamento.' + QUEBRADELINHA;
  MSG_ERRO_ESTORNA_ORCAMENTO = 'Não Foi Possível Estornar Compromisso orçamentário.' + QUEBRADELINHA;
  MSG_ERRO_EFETIVA_COMPROMISSO = 'Não Foi Possível Efetivar Compromisso orçamentário.' + QUEBRADELINHA;
  MSG_ERRO_ATUALIZA_VALOR_COMPROMISSO = 'Erro ao atualizar valor do compromisso. ' + QUEBRADELINHA;
  MSG_ERRO_EXCLUI_FINANC = 'Erro ao excluir lançamentos de lança e baixa do Financeiro. ' + QUEBRADELINHA;
  MSG_ERRO_EXCLUI_RECBTOPAGTO = 'Erro ao excluir lançamentos de baixa. ' + QUEBRADELINHA;

  MSG_ERRO_OPERLANCTO = 'Operação de Lançamento Inválida.';
  MSG_OBRIGA_INDICACAO_RESERVA = 'Obrigatório a Indicação de Reserva orçamentária para ';
Type
  TOperacaoLancDocCapCar = (opldEfetivo, opldAdiantamento, opldContratoPrevisao, opRegAdiantamento, opldAgrupaParcela);

  TCtrlLancDocCapCar = Class(TCmControlObject)

  private
    _Documento: TCtrlDocumento;
    _Lancamento: TCtrlLancamento;
    _Financeiro: TCtrlFinanc;
    _Imposto: TCtrlImpostoRetido;
    _Orcamento: TOrcamentoBackMT;
    _Padroes: TCtrlPadroes;

    _DtmCtrlDocCapCar: TDtmCtrlDocCapCar;

    _CdsDocumento: TClientDataSet;
    _CdsAlteradores: TClientDataSet;
    _CdsRateio: TClientDataSet;
    _CdsContabilizacao: TClientDataSet;
    _CdsPrevisaoPendente: TClientDataSet;
    _CdsAdiantamentoPendente: TClientDataSet;
    _CdsOrigemParcelas: TClientDataSet;
    _CdsParcelas: TClientDataSet;
    fCodDocumento: Double;

  protected
    procedure AfterInitialize; Override;
  public
    Constructor Create; Override;
    Destructor Destroy; Override;

    function RegularizaAdiantamento( ovCds, ovDocumento: OleVariant; iIdUsuario, iIdEspAcesso: Integer;
            bLancaContab, bUsaPlanoPatro: Boolean; dDataRegularizacao: TDateTime ): Boolean;

    function ExcluiRegulariazaoPrevAdianto ( iCodDocOrigem, iNumLancOrigem,
       iCodDocRegulariza, iNumLancRegulariza, IdEspAcesso, IdUsuario,
       IdModulo: LongInt; UsaPlanoPatro: boolean; IdEmpresa : LongInt ): Boolean;

    function ProcessaDocumento(iIdUsuario, iIdEspAcesso, liUnidNegoc: Integer;
            bLancaContab, bUsaPlanoPatro, bExcluiPlanilha, bEnglobaParcela, bLancaEBaixa,
            bLancaeBaixaNoFinanceiro, bIntegraOrcamento: Boolean;
            ovDocumento, ovAlteradores, ovRateio, ovContabilizacao,
            ovPrevisaoPendente, ovAdiantamentoPendente: OleVariant;
            Operacao: TOperacao; OperacaoLanc: TOperacaoLancDocCapCar; bLancaPartidaDobrada: Boolean;
            dDataRegularizacao: TDateTime): Boolean;

    function ProcessaAgrupaParcela(iIdUsuario, iIdEspAcesso: Integer;
            bLancaContab, bContratoPrevisao, bUsaPlanoPatro: Boolean; ovOrigem, ovParcelas: OleVariant;
            Operacao: TOperacao; DataLancto, DataEmissao: TDateTime; CodTipoDoc,
            CodPortForma, CodForma, idModulo, iPlano, pNumFatura: Integer; bLancaPartidaDobrada: Boolean): Boolean;

    property CodDocumento: Double read fCodDocumento;

    procedure ImprimeEspelhoDoc(iCodDocumento: Double; IdReport: Integer; sNomeReport: String;
       OperacaoLanc: TOperacaoLancDocCapCar);
  end;

implementation

Uses JclMath, uCMMath, uMensErro, Dialogs, Controls, rAutPag, uSistema, 
     DReports, ppReport, Forms, uModulo, fMostraRelat, ppTypes;

{ TCtrlLancDocCapCar }

procedure TCtrlLancDocCapCar.AfterInitialize;
begin
  inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;

  _Documento.InitiAlizeAs(Self);
  _Documento.OpenTransaction := False;

  _Lancamento.InitializeAs(Self);
  _Lancamento.OpenTransaction := False;

  _Financeiro.InitializeAs(Self);
  _Financeiro.OpenTransaction := False;

  _Imposto.InitializeAs(Self);
  _Imposto.OpenTransaction := False;

  _Orcamento.InitializeAs(Self);
  _Orcamento.OpenTransaction := False;
end;

constructor TCtrlLancDocCapCar.Create;
begin
  inherited;
  _Documento := TCtrlDocumento.Create;
  _Lancamento := TCtrlLancamento.Create;
  _Imposto := TCtrlImpostoRetido.Create;
  _Orcamento := TOrcamentoBackMT.Create;
  _Financeiro := TCtrlFinanc.Create(0,0,0,False);
  _Padroes:= TCtrlPadroes.Create;

  _CdsDocumento := TClientDataSet.Create(nil);
  _CdsAlteradores := TClientDataSet.Create(nil);
  _CdsRateio := TClientDataSet.Create(nil);
  _CdsContabilizacao := TClientDataSet.Create(nil);
  _CdsPrevisaoPendente := TClientDataSet.Create(nil);
  _CdsAdiantamentoPendente := TClientDataSet.Create(nil);
  _CdsOrigemParcelas := TClientDataSet.Create(nil);
  _CdsParcelas := TClientDataSet.Create(nil);

  _DtmCtrlDocCapCar := TDtmCtrlDocCapCar.Create(nil);
end;

destructor TCtrlLancDocCapCar.Destroy;
begin
  _Documento.Free;
  _Lancamento.Free;
  _Financeiro.Free;
  _Imposto.Free;
  _Orcamento.Free;
  _Padroes.Free;

  _CdsDocumento.Free;
  _CdsAlteradores.Free;
  _CdsRateio.Free;
  _CdsContabilizacao.Free;
  _CdsPrevisaoPendente.Free;
  _CdsAdiantamentoPendente.Free;
  _CdsOrigemParcelas.Free;
  _CdsParcelas.Free;

  _DtmCtrlDocCapCar.Free;

  inherited;
end;

function TCtrlLancDocCapCar.ExcluiRegulariazaoPrevAdianto(iCodDocOrigem,
  iNumLancOrigem, iCodDocRegulariza, iNumLancRegulariza, IdEspAcesso, IdUsuario,
  IdModulo: Integer;
  UsaPlanoPatro: boolean; IdEmpresa : LongInt): Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
     Result := Connection.AppServer.ExcluiRegulariazaoPrevAdianto(iCodDocOrigem,
               iNumLancOrigem, iCodDocRegulariza, iNumLancRegulariza, IdEspAcesso, IdUsuario,
               IdModulo, UsaPlanoPatro, IdEmpresa );

     if not Result then
       MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     Try
        StartTransaction;

        _Documento.Prepare( OpLanctoDocum, odlRegAdiantamento );
        _Documento.IdEspAcesso := IdEspAcesso;
        _Documento.IdUsuario := IdUsuario;
        _Documento.IdModulo := IdModulo;
        _Documento.UsaPlanoPatro := UsaPlanoPatro;
        _Documento.CodDocumento := iCodDocRegulariza;
        _Documento.Lanctodocum.NumLancto := iNumLancRegulariza;
        result :=  _Documento.Delete;

        if not result then raise Exception.Create( _Documento.MessageInfo );

        _Documento.Prepare( OpLanctoDocum, odlEfetivo );
        _Documento.IdEspAcesso := IdEspAcesso;
        _Documento.IdUsuario := IdUsuario;
        _Documento.IdModulo := IdModulo;
        _Documento.UsaPlanoPatro := UsaPlanoPatro;
        _Documento.CodDocumento := iCodDocOrigem;
        _Documento.Lanctodocum.NumLancto := iNumLancOrigem;
        result :=  _Documento.Delete;

        if not result then raise Exception.Create( _Documento.MessageInfo );
        If Not _Padroes.GravaLogOperacoes(idEmpresa, idModulo, idUsuario, 'Extorna/Exclui Adiantamento', False) Then
           Raise Exception.Create(_Padroes.MessageInfo);

        Commit;
     except
        On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
     End;
  end;
end;

function TCtrlLancDocCapCar.ProcessaDocumento(iIdUsuario, iIdEspAcesso, liUnidNegoc: Integer;
  bLancaContab, bUsaPlanoPatro, bExcluiPlanilha, bEnglobaParcela, bLancaEBaixa,
  bLancaeBaixaNoFinanceiro, bIntegraOrcamento: Boolean;
  ovDocumento, ovAlteradores, ovRateio, ovContabilizacao, ovPrevisaoPendente,
  ovAdiantamentoPendente: OleVariant;
  Operacao: TOperacao; OperacaoLanc: TOperacaoLancDocCapCar; bLancaPartidaDobrada: Boolean;
  dDataRegularizacao: TDateTime): Boolean;

  {** ---------------------------------------------------------------------- **}
  Var
    iCodLancBaixaAdiando, iCodDocumento, iNumLancto, iPlnCodigo: Integer;
    SistemaLancto: TSistemaLancto;
    sDebCre: String;
    rCodLancFianc, rValorRateioComCompromisso, rValorComprometidoReserva: Double;

    iEmpresa,iModulo,iUsuario : Integer;
    sDscLog : String;

  {** ---------------------------------------------------------------------- **}
  procedure RegularizaAdiantamento;
  begin
    if _CdsAdiantamentoPendente.Active and ( _CdsAdiantamentoPendente.ChangeCount > 0 ) then
    Begin
       _CdsAdiantamentoPendente.First;
       while not _CdsAdiantamentoPendente.EOF do
       begin
          if ( _CdsAdiantamentoPendente.FieldByName('STATUS').Value = '2' ) and
             ( Not IsFloatZero(_CdsAdiantamentoPendente.FieldByName('VLRBAIXA').AsFloat) ) then
          begin
             If Not _Documento.RegAdiantamento(_CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger,
                                               _CdsAdiantamentoPendente.FieldByName('CODDOCUMENTO').AsInteger,
                                               _CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                               iIdUsuario,
                                               _CdsDocumento.FieldByName('IDMODULO').AsInteger,
                                               _CdsDocumento.FieldByName('PLANO').AsInteger,
                                               dDataRegularizacao,
                                               _CdsDocumento.FieldByName('NODOCUMENTO').AsString + ' ' + _CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString,
                                               _CdsAdiantamentoPendente.FieldByName('DOCUM').AsString,
                                               _CdsDocumento.FieldByName('NOME').AsString,
                                               _CdsAdiantamentoPendente.FieldByName('VLRBAIXA').AsFloat,
                                               bUsaPlanoPatro,
                                               SistemaLancto) Then
                Raise Exception.Create( MSG_ERRO_REG_ADIANTO  + _Documento.MessageInfo );
          end;
          _CdsAdiantamentoPendente.Next;
       end;
       _CdsAdiantamentoPendente.First;
    End;
  end;

  {** ---------------------------------------------------------------------- **}

  function IntegraorcamentoBack(NumReserva: integer; rValor: Real):boolean;
  var
    rValorCompromisso :Double;
  begin
    Result := True;

    if (Operacao = OpAlterar) and
       (not _DtmCtrlDocCapCar.CdsRateio.FieldByName('NUMRESERVAOLD').IsNull) and
       (_Orcamento.EstornaCompromisso( _DtmCtrlDocCapCar.CdsRateio.FieldByName('NUMRESERVAOLD').AsInteger, _DtmCtrlDocCapCar.CdsRateio.FieldByName('VLRRESORCAMEN').AsFloat, True) <> 0) then
       raise Exception.Create(MSG_ERRO_ESTORNA_ORCAMENTO + _Orcamento.MessageInfo);

    if (_DtmCtrlDocCapCar.CdsRateio.FieldByName('FLGOBRIGARESERVA').AsString = 'S') and
       (NumReserva = 0) then
          raise Exception.Create( MSG_OBRIGA_INDICACAO_RESERVA + '"' + _DtmCtrlDocCapCar.CdsRateio.FieldByName('DESCRICAO').AsString + '"')
       else
       begin
          if (NumReserva <> 0) then
          begin
             if (rValorComprometidoReserva <> 0.00) and (rValorRateioComCompromisso <> 0.00) then
                rValorCompromisso := (rValor * rValorComprometidoReserva) / rValorRateioComCompromisso
             else                                                                                                  
                rValorCompromisso := rValor;

             if (_Orcamento.EfetivaCompromisso(Trunc(NumReserva), rValorCompromisso, True) <> 0) then
                raise Exception.Create(MSG_ERRO_EFETIVA_COMPROMISSO + _Orcamento.MessageInfo)
             else
                _DtmCtrlDocCapCar.SqlUpdValorCompromisso.Prepare;
                _DtmCtrlDocCapCar.SqlUpdValorCompromisso.ParamByName('IDRATEIODOCUM').AsFloat := _DtmCtrlDocCapCar.CdsRateio.FieldByName('IDRATEIODOCUM').AsFloat;
                _DtmCtrlDocCapCar.SqlUpdValorCompromisso.ParamByName('VLRRESORCAMEN').AsFloat := rValorCompromisso;
                If Not ExecSql(_DtmCtrlDocCapCar.SqlUpdValorCompromisso.SqlChanged) Then
                   raise Exception.Create(MSG_ERRO_ATUALIZA_VALOR_COMPROMISSO + MessageInfo);
          end;
       end;
  end;

  {** ---------------------------------------------------------------------- **}
  procedure Atualizaorcamento;
  var
     rTotAdiantamento: Real;
  begin
    rValorRateioComCompromisso := 0.00;
    rValorComprometidoReserva := 0.00;
    rTotAdiantamento := 0.00;

    if _CdsAdiantamentoPendente.Active and ( _CdsAdiantamentoPendente.ChangeCount > 0 ) Then
    Begin
       //Soma efetivamente os valores do rateio que tem compromisso associado para
       //efetivação de compromisso já ultilizado por um adiantamento/previsão
       _CdsRateio.First;
       while not _CdsRateio.Eof Do
       begin
          if _CdsRateio.FieldByName('NUMRESERVA').AsInteger > 0 then
             rValorRateioComCompromisso := rValorRateioComCompromisso + _CdsRateio.FieldByName('VALOR').AsFloat;

          _CdsRateio.Next;
       end;

       _CdsAdiantamentoPendente.First;

       while not _CdsAdiantamentoPendente.EOF do
       begin
          if ( _CdsAdiantamentoPendente.FieldByName('STATUS').AsString = '2') and
             ( not IsFloatZero(_CdsAdiantamentoPendente.FieldByName('VLRBAIXA').AsFloat)) then
             rTotAdiantamento := rTotAdiantamento + _CdsAdiantamentoPendente.FieldByName('VLRBAIXA').AsFloat;

          _CdsAdiantamentoPendente.Next;
       end;

       _CdsAdiantamentoPendente.First;

       while not _CdsAdiantamentoPendente.EOF do
       begin
          if (_CdsAdiantamentoPendente.FieldByName('STATUS').AsString = '2') and
             ( not IsFloatZero(_CdsAdiantamentoPendente.FieldByName('VLRBAIXA').AsFloat)) then
          begin
                _Cds.Data := GetDataPacket(' SELECT ' +
                                           '   ((VALOR * ' + FloatToStrCM(_CdsDocumento.FieldByName('VALOR').AsFloat - rTotAdiantamento) +
                                           ' / ' + FloatToStrCM( _CdsAdiantamentoPendente.FieldByName('VLRBAIXA').AsFloat) + ' )) AS VALORRESERVA, ' +
                                           '   IDRESERVAORCAMEN ' +
                                           ' FROM ' +
                                           '   RATEIODOCUM ' +
                                           ' WHERE ' +
                                           '   CODDOCUMENTO = ' + _CdsAdiantamentoPendente.FieldByName('CODDOCUMENTO').AsString + ' AND ' +
                                           '   IDRESERVAORCAMEN IS NOT NULL ');

                if Not IsFloatZero(_Cds.FieldByName('VALORRESERVA').AsFloat) then
                begin
                   if _Cds.FieldByName('VALORRESERVA').AsFloat < 0 then
                   //Valor do Adiantamento é maior que o do documento altera/Devolve para o compromisso de origem
                   begin
                      If Not ExecSql('UPDATE RESERVAORCAMEN SET VLRDEVOLVIDO = ' + FloatToStrCM(_Cds.FieldByName('VALORRESERVA').AsFloat * -1) + ', ' +
                              ' VLRCOMPROMISSO = VLRCOMPROMISSO - ' + FloatToStrCM(_Cds.FieldByName('VALORRESERVA').AsFloat * -1) +
                              ' WHERE IDRESERVAORCAMEN = ' + _Cds.FieldByName('IDRESERVAORCAMEN').AsString) Then
                         Raise Exception.Create( MSG_ERRO_ATUALIZA_ORCAMENTO + MessageInfo );
                   end
                   else
                     rValorComprometidoReserva := rValorComprometidoReserva + _Cds.FieldByName('VALORRESERVA').AsFloat;
                   //Valor do Documento é Maior que o do adiantamento
                end;
                _Cds.Close;
          end;

          _CdsAdiantamentoPendente.Next;
       end;
    end;
  end;

  {** ---------------------------------------------------------------------- **}
  procedure RegularizaPrevisao;
  Var
    sValor: String;
  begin
    if _CdsPrevisaoPendente.Active and ( _CdsPrevisaoPendente.ChangeCount > 0 ) then
    Begin
      sValor := FloatToStrCM((_CdsPrevisaoPendente.FieldByName('VALRES').AsFloat - _CdsPrevisaoPendente.FieldByName('VLRBAIXA').AsFloat));

      _CdsPrevisaoPendente.First;
      while not _CdsPrevisaoPendente.Eof Do
      begin
        if _CdsPrevisaoPendente.FieldByName('STATUS').AsString = '2' then
        begin
          if FloatsEqual( _CdsPrevisaoPendente.FieldByName('VALRES').AsFloat, _CdsPrevisaoPendente.FieldByName('VLRBAIXA').AsFloat) then
          Begin
             If Not ExecSQL('DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = '+ _CdsPrevisaoPendente.FieldByName('CODDOCUMENTO').AsString) Then
                Raise Exception.Create(MSG_ERRO_EXCLUI_PREVISA0 + MessageInfo);
          End
          else
             If Not ExecSQL('UPDATE LANCTODOCUM SET VALOR = '+ sValor +
                            ' WHERE CODDOCUMENTO = '+ _CdsPrevisaoPendente.FieldByName('CODDOCUMENTO').AsString) Then
                Raise Exception.Create(MSG_ERRO_ALTERA_PREVISA0 + MessageInfo);
        end;
        _CdsPrevisaoPendente.Next;
      end;

      _CdsPrevisaoPendente.First;
    end;
  end;

  {** ---------------------------------------------------------------------- **}
  procedure LancaAlteradores;
  Var
    liUnidNegocioLancto: Integer;
  Begin
    _CdsAlteradores.First;
    While Not _CdsAlteradores.Eof Do
    Begin
       _Documento.Prepare(OpLanctoDocum, odlAlterador);
       _Documento.PartidaDobrada := bLancaPartidaDobrada;
       _Documento.CodDocumento := iCodDocumento;
       _Documento.IdUsuario := iIdUsuario;
       _Documento.IdEspAcesso := iIdEspAcesso;
       _Documento.IdModulo := _CdsDocumento.FieldByName('IDMODULO').AsInteger;
       _Documento.UsaPlanoPatro := bUsaPlanoPatro;

       if _CdsAlteradores.FieldByName('UNIDNEGOC').IsNull then
          liUnidNegocioLancto := 0
       else
          liUnidNegocioLancto := _CdsAlteradores.FieldByName('UNIDNEGOC').AsInteger;

       _Documento.Lanctodocum.SetValues(_CdsAlteradores.FieldByName('DATALANCTO').AsDateTime,
                                        iCodDocumento,
                                        0,
                                        _CdsAlteradores.FieldByName('VLRLIQUIDO').AsFloat,
                                        _CdsAlteradores.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                        _CdsAlteradores.FieldByName('VALOR').AsFloat,
                                        liUnidNegocioLancto,
                                        0,
                                        0,
                                        iIdUsuario,
                                        _CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                        0,
                                        0,
                                        0,
                                        0,
                                        _CdsAlteradores.FieldByName('CODALTERADOR').AsInteger,
                                        '',
                                        '',
                                        '',
                                        '',
                                        _CdsAlteradores.FieldByName('HISTORICOCOMPL').AsString,
                                        '',
                                        '',
                                        '',
                                        _CdsAlteradores.FieldByName('DEBCRE').AsString,
                                        _CdsDocumento.FieldByName('IDMODULO').AsInteger,
                                        _CdsDocumento.FieldByName('PLANO').AsInteger,
                                        bUsaPlanoPatro,
                                        ( Not _CdsContabilizacao.IsEmpty ));

       If Not _Documento.Insert Then
          Raise Exception.Create( MSG_ERRO_ALTERADOR + _Documento.MessageInfo );

       _CdsAlteradores.Next;
    end;
  End;

  {** ---------------------------------------------------------------------- **}
  procedure ProcessaContabilidade;
  Var
    rValLanc: Double;
    cCCustd, cContad, cCCustc, cContac, sHistorico: String;
    cTipoOper: Char;
    iUnidNegoc, iSubContaCre, iSubContaDeb: Integer;
    bJunta: Boolean;
    sNumLancEfetvado: String;
    MarcaNumaLanc: TBookMark;

  begin
    iUnidNegoc := 0;
    iSubContaCre := 0;
    iSubContaDeb := 0;
    cTipoOper := '1';
    rValLanc := 0;
    bJunta := false;
    {**
       Verifica se o documento já foi contabilizado ( no caso de alteração )
       e procede com a exclusão da contabilização antiga para processamento
       em seguida da nova contabilização ( ou não ! )
       Verifica ainda se essa nova contabilização deve ser feira na mesma planilha
       da contabilização anterior ou em nova planilha.
    **}

    if  bLancaContab And
        ( _CdsContabilizacao.ChangeCount > 0 ) Then
    Begin
      if _CdsDocumento.FieldByName('PLNCODIGO').AsFloat > 0 then
      begin

        if ( Not ExecSQL('UPDATE LANCTODOCUM SET PLNCODIGO = NULL WHERE PLNCODIGO = ' + _CdsDocumento.FieldByName('PLNCODIGO').AsString) ) then
           Raise Exception.Create( MSG_ERRO_ATUALIZA_LANCTODOCUM + MessageInfo );

        If Not _Lancamento.ExcluiLancaContab(iIdUsuario,
                                             _CdsDocumento.FieldByName('PLNCODIGO').AsFloat,
                                             _CdsDocumento.FieldByName('IDMODULO').AsFloat,
                                             0,
                                             bUsaPlanoPatro,
                                             bExcluiPlanilha) Then
           Raise Exception.Create(MSG_ERRO_EXCLUI_CONTAB + _Lancamento.MessageInfo );
      end;

      if (bExcluiPlanilha) Then
         iPlnCodigo := 0
      Else
         iPlnCodigo := _CdsDocumento.FieldByName('PLNCODIGO').AsInteger;

      sNumLancEfetvado := '';
      
      _CdsContabilizacao.First;

      while (not _CdsContabilizacao.EOF) do
      begin
        if bLancaPartidaDobrada then
        begin
           {** verifica se o lançamento já foi processado como partida dobrada **}
           if Pos('#' + _CdsContabilizacao.FieldByName('LACNUMLAN').AsString + '#', sNumLancEfetvado ) <> 0 then
           begin
              _CdsContabilizacao.Next;
              Continue;
           end;

           {** Efetua os lançamentos com partida dobrada **}
           bJunta := false;
           cTipoOper := '2';

           if ( trim(_CdsContabilizacao.FieldByName('UNIDNEGOC').AsString) = '' ) then
             iUnidNegoc := liUnidNegoc
           else
             iUnidNegoc := _CdsContabilizacao.FieldByName('UNIDNEGOC').AsInteger;

           rValLanc  := _CdsContabilizacao.FieldByName('LACVALOR').AsFloat;

           if _CdsContabilizacao.FieldByName('LACDEBCRE').AsString = 'D' then
           begin
             cCCustd := _CdsContabilizacao.FieldByName('CODCENTROCUSTO').AsString;
             cContad := _CdsContabilizacao.FieldByName('PLACONTA').AsString;
             iSubContaDeb := _CdsContabilizacao.FieldByName('CODSUBCONTA').AsInteger;

             //Marca o registro a débito que esta sendo processado
             MarcaNumaLanc := _CdsContabilizacao.GetBookmark;

             //busca o registro e crédito com o mesmo LACNUMLAN
             _CdsContabilizacao.Locate('LACNUMLAN;LACDEBCRE',varArrayOf([ _CdsContabilizacao.FieldByName('LACNUMLAN').AsFloat,'C']),[]);

             //Busca os parâmetros para a contabilização
             cCCustc := _CdsContabilizacao.FieldByName('CODCENTROCUSTO').AsString;
             cContac := _CdsContabilizacao.FieldByName('PLACONTA').AsString;
             iSubContaCre := _CdsContabilizacao.FieldByName('CODSUBCONTA').AsInteger;

             //retorna para o registro marcado, libera a marca e guarda o LACNUMLAN processado
             _CdsContabilizacao.GotoBookmark(MarcaNumaLanc);
             _CdsContabilizacao.FreeBookmark(MarcaNumaLanc);
             sNumLancEfetvado := sNumLancEfetvado + '#' + _CdsContabilizacao.FieldByName('LACNUMLAN').AsString + '#';
           end
           else
           begin
             cCCustc := _CdsContabilizacao.FieldByName('CODCENTROCUSTO').AsString;
             cContac := _CdsContabilizacao.FieldByName('PLACONTA').AsString;
             iSubContaCre := _CdsContabilizacao.FieldByName('CODSUBCONTA').AsInteger;

             //Marca o registro a crédito que esta sendo processado
             MarcaNumaLanc := _CdsContabilizacao.GetBookmark;

             //busca o registro e débito com o mesmo LACNUMLAN
             _CdsContabilizacao.Locate('LACNUMLAN;LACDEBCRE',varArrayOf([ _CdsContabilizacao.FieldByName('LACNUMLAN').AsFloat,'D']),[]);

             //Busca os parâmetros para a contabilização
             cCCustd := _CdsContabilizacao.FieldByName('CODCENTROCUSTO').AsString;
             cContad := _CdsContabilizacao.FieldByName('PLACONTA').AsString;
             iSubContaDeb := _CdsContabilizacao.FieldByName('CODSUBCONTA').AsInteger;

             //retorna para o registro marcado, libera a marca e guarda o LACNUMLAN processado
             _CdsContabilizacao.GotoBookmark(MarcaNumaLanc);
             _CdsContabilizacao.FreeBookmark(MarcaNumaLanc);
             sNumLancEfetvado := sNumLancEfetvado + '#' + _CdsContabilizacao.FieldByName('LACNUMLAN').AsString + '#';
           end;
        end
        else
        begin
           {** Efetua os lançamentos a débito ou a crédito em separado juntando os lançamentos **}
           bJunta := true;

           if ( trim(_CdsContabilizacao.FieldByName('UNIDNEGOC').AsString) = '' ) then
             iUnidNegoc := liUnidNegoc
           else
             iUnidNegoc := _CdsContabilizacao.FieldByName('UNIDNEGOC').AsInteger;

           rValLanc  := _CdsContabilizacao.FieldByName('LACVALOR').AsFloat;

           if _CdsContabilizacao.FieldByName('LACDEBCRE').AsString = 'D' then
           begin
             cCCustd := _CdsContabilizacao.FieldByName('CODCENTROCUSTO').AsString;
             cContad := _CdsContabilizacao.FieldByName('PLACONTA').AsString;
             iSubContaDeb := _CdsContabilizacao.FieldByName('CODSUBCONTA').AsInteger;
             cCCustc := '';
             cContac := '';
             iSubContaCre := 0;
             cTipoOper := '0';
           end
           else
           begin
             cCCustd := '';
             cContad := '';
             iSubContaDeb := 0;
             cCCustc := _CdsContabilizacao.FieldByName('CODCENTROCUSTO').AsString;
             cContac := _CdsContabilizacao.FieldByName('PLACONTA').AsString;
             iSubContaCre := _CdsContabilizacao.FieldByName('CODSUBCONTA').AsInteger;
             cTipoOper := '1';
           end;
        end;

        sHistorico :=
          _CdsContabilizacao.FieldByName('LACHIST1').AsString +
          _CdsContabilizacao.FieldByName('LACHIST2').AsString +
          _CdsContabilizacao.FieldByName('LACHIST3').AsString +
          _CdsContabilizacao.FieldByName('LACHIST4').AsString +
          _CdsContabilizacao.FieldByName('LACHIST5').AsString;

        If Not _Lancamento.InsereLancaContab(cTipoOper,
                                      _CdsDocumento.FieldByName('IDPESSOA').AsFloat,
                                      _CdsDocumento.FieldByName('IDMODULO').AsFloat,
                                      iIdUsuario,
                                      _CdsContabilizacao.FieldByName('PLANO').AsInteger,
                                      iUnidNegoc,
                                      iSubContaDeb,
                                      iSubContaCre,
                                      _CdsContabilizacao.FieldByName('IDPLANOPREV').AsFloat,
                                      _CdsContabilizacao.FieldByName('IDPATRO').AsFloat,
                                      iPlnCodigo,
                                      0,
                                      _CdsDocumento.FieldByName('DATALANCTO').AsString,
                                      _CdsContabilizacao.FieldByName('LACNUMDOC').AsString,
                                      sHistorico,
                                      '',
                                      '',
                                      '',
                                      '',
                                      '03',
                                      cCCustd,
                                      cContad,
                                      cCCustc,
                                      cContac,
                                      '',
                                      rValLanc,
                                      bJunta,
                                      bUsaPlanoPatro) Then
           Raise Exception.Create( MSG_ERRO_CONTABILIZA_LANCTO + _Lancamento.MessageInfo );

        iPlnCodigo := Trunc( _Lancamento.RetornoPlnCodigo );

        _CdsContabilizacao.Next;
      end
    end
    Else
    Begin
      {**
         Caso não existam lançamentos para contabilizar ele verifica se o documento
         foi contabilizado e exclui a contabilização do mesmo.
      **}
      If ( not bLancaContab ) And ( _CdsDocumento.FieldByName('PLNCODIGO').AsFloat > 0 ) Then
      Begin
        If ( Not ExecSQL('UPDATE LANCTODOCUM SET PLNCODIGO = NULL WHERE PLNCODIGO = ' + _CdsDocumento.FieldByName('PLNCODIGO').AsString) ) then
           Raise Exception.Create( MSG_ERRO_ATUALIZA_LANCTODOCUM + MessageInfo );

        If Not _Lancamento.ExcluiLancaContab(iIdUsuario,
                                             _CdsDocumento.FieldByName('PLNCODIGO').AsFloat,
                                             _CdsDocumento.FieldByName('IDMODULO').AsFloat,
                                             0,
                                             bUsaPlanoPatro,
                                             True) Then
           Raise Exception.Create( MSG_ERRO_EXCLUI_CONTAB + _Lancamento.MessageInfo );

        iPlnCodigo := 0
      end
      Else
        iPlnCodigo := _CdsDocumento.FieldByName('PLNCODIGO').AsInteger;
    end;
  end;
  {** ---------------------------------------------------------------------- **}
  procedure TrocaDebCre;
  Begin
    _CdsDocumento.Edit;
    if _CdsDocumento.FieldByName('DEBCRE').AsString = 'D' then
       _CdsDocumento.FieldByName('DEBCRE').AsString := 'C'
    else
       _CdsDocumento.FieldByName('DEBCRE').AsString := 'D';
    _CdsDocumento.Post;
  End;
  {** ---------------------------------------------------------------------- **}
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ProcessaDocumento(Integer(Operacao), Integer(OperacaoLanc),
               ovDocumento, ovAlteradores, ovRateio, ovContabilizacao );

     If Not Result Then  MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     iPlnCodigo := 0;

     Result := True;

     _CdsContabilizacao.Data := ovContabilizacao;
     _CdsAlteradores.Data := ovAlteradores;
     _CdsRateio.Data := ovRateio;
     _CdsContabilizacao.Data := ovContabilizacao;
     _CdsDocumento.Data := ovDocumento;
     _CdsAdiantamentoPendente.Data := ovAdiantamentoPendente;
     _CdsPrevisaoPendente.Data := ovPrevisaoPendente;

     if Operacao = opApagar then
       _CdsDocumento.StatusFilter := [usDeleted]
     else
       _CdsDocumento.StatusFilter := [];
     sDscLog := 'Processa Documento';
     Try
        If (_CdsDocumento.FieldByName('RECPAG').AsString = 'P') Then
          SistemaLancto := slCap
        else
          SistemaLancto := slCar;
        // Coloquei o idempresa para orcamento
        _Orcamento.IdEmpresa := _CdsDocumento.FieldByName('IDPESSOA').AsInteger;
        _Orcamento.IdUsuario := iIdUsuario;
        // *****************************************
        // Rotina de Log
        iEmpresa := _CdsDocumento.FieldByName('IDPESSOA').AsInteger;
        iModulo  := _CdsDocumento.FieldByName('IDMODULO').AsInteger;
        iUsuario := iIdUsuario;
        // *************

        StartTransaction;

        If ( OperacaoLanc = opRegAdiantamento ) Then
        begin
           sDscLog := 'Regulariza Adiantamento';
           RegularizaAdiantamento;
        end
        Else
        Begin
           //Incializa a CtrlDocumento de acordo com a operação do lançamento
           Case OperacaoLanc of
           opldEfetivo:
             Begin
                sDscLog  := 'Baixa de Lancamento';
                If bLancaEBaixa Then
                  _Documento.Prepare( OpDocumento, odlLancaeBaixa, sdocBaixado )
               Else
                  If bEnglobaParcela Then
                     _Documento.Prepare( OpDocumento, odlAParcelar )
                  Else
                     _Documento.Prepare( OpDocumento, odlEfetivo );
             End;
           opldAdiantamento:
             Begin
                sDscLog  := 'Adiantamento de Lancamento';
               {If bLancaEBaixa Then
                  _Documento.Prepare( OpDocumento, odlBaixaAdiantamento )
               Else}
                  _Documento.Prepare( OpDocumento, odlAdiantamento );
             End;
           opldContratoPrevisao:
             Begin
               sDscLog  := 'Contrato/Previsao ';
               If bEnglobaParcela Then
                  _Documento.Prepare( OpDocumento, odlPrevAParcelar )
               Else
                  _Documento.Prepare( OpDocumento, odlPrevisao );
             End;
           Else
             Raise Exception.Create( MSG_ERRO_OPERLANCTO );
           End;

           _Documento.IdEspAcesso := iIdEspAcesso;
           _Documento.IdUsuario := iIdUsuario;
           _Documento.IdModulo := _CdsDocumento.FieldByName('IDMODULO').AsInteger;
           _Documento.UsaPlanoPatro := bUsaPlanoPatro;

           Case Operacao of
             opInserir, opAlterar:
               Begin
                  if Operacao = opInserir then
                     sDscLog  := 'Inserir ' + sDscLog
                  else
                     sDscLog  := 'Alterar ' + sDscLog;
                  //Processa Lançamentos na contabilização
                  ProcessaContabilidade;
                  //Atribui os valores para o Lançamento/ALteração do documento
                  _Documento.SetValues(_CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger,
                                       _CdsDocumento.FieldByName('NODOCUMENTO').AsFloat,
                                       _CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString,
                                       '',
                                       _CdsDocumento.FieldByName('RECPAG').AsString,
                                       '',
                                       _CdsDocumento.FieldByName('NUMSLIP').AsString,
                                       _CdsDocumento.FieldByName('NUMLEITCODBARRAS').AsString,
                                       _CdsDocumento.FieldByName('PLACONTA').AsString,
                                       _CdsDocumento.FieldByName('CODCENTROCUSTO').AsString,
                                       '',
                                       _CdsDocumento.FieldByName('NUMDIGCODBARRAS').AsString,
                                       '',
                                       '',
                                       '',
                                       _CdsDocumento.FieldByName('EMISBLOQ').AsString,
                                       _CdsDocumento.FieldByName('REFERENCIA').AsString,
                                       _CdsDocumento.FieldByName('OBS').AsString,
                                       _CdsDocumento.FieldByName('DATAVENCTO').AsDateTime,
                                       _CdsDocumento.FieldByName('DATAEMISSAO').AsDateTime,
                                       _CdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       _CdsDocumento.FieldByName('CODTIPDOC').AsInteger,
                                       _CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                       _CdsDocumento.FieldByName('IDMODULO').AsInteger,
                                       _CdsDocumento.FieldByName('IDFORCLI').AsInteger,
                                       _CdsDocumento.FieldByName('NUMFATURA').AsInteger,
                                       _CdsDocumento.FieldByName('IDCBANCARIA').AsInteger,
                                       _CdsDocumento.FieldByName('UNIDNEGOC').AsInteger,
                                       _CdsDocumento.FieldByName('PLANO').AsInteger,
                                       0,
                                       _CdsDocumento.FieldByName('NUMAPGR').AsInteger,
                                       _CdsDocumento.FieldByName('MOECODIGO').AsInteger,
                                       0,
                                       0,
                                       _CdsDocumento.FieldByName('IDUSUARIOINCLUSAO').AsInteger,
                                       _CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                       0,
                                       0,
                                       _CdsDocumento.FieldByName('CODSUBCONTA').AsInteger,
                                       _CdsDocumento.FieldByName('CODPORTFORMA').AsInteger,
                                       0,
                                       0,
                                       _CdsDocumento.FieldByName('CODFORMA').AsInteger);

                  _Documento.Lanctodocum.SetValues(_CdsDocumento.FieldByName('DATALANCTO').AsDateTime,
                                                   _CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger,
                                                   _CdsDocumento.FieldByName('NUMLANCTO').AsInteger,
                                                   _CdsDocumento.FieldByName('VLRLIQUIDO').AsFloat,
                                                   _CdsDocumento.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                   _CdsDocumento.FieldByName('VALOR').AsFloat,
                                                   0,
                                                   iPlnCodigo,
                                                   0,
                                                   iIdUsuario,
                                                   _CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                                   0,
                                                   0,
                                                   _CdsDocumento.FieldByName('CODTIPDOC').AsInteger,
                                                   0,
                                                   0,
                                                   '',
                                                   '',
                                                   '',
                                                   _CdsDocumento.FieldByName('NUMFATURA_1').AsString,
                                                   _CdsDocumento.FieldByName('HISTORICOCOMPL').AsString,
                                                   _CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString,
                                                   '',
                                                   '',
                                                   _Documento.GetDebCre(_CdsDocumento.FieldByName('CODTIPDOC').AsInteger),
                                                   _CdsDocumento.FieldByName('IDMODULO').AsInteger,
                                                   _CdsDocumento.FieldByName('PLANO').AsInteger,
                                                   bUsaPlanoPatro);
                  //
                  _CdsRateio.First;
                  While Not _CdsRateio.Eof Do
                  Begin
                     _Documento.Rateiodocum.SetValues(_CdsRateio.FieldByName('VALOR').AsFloat,
                                                      _CdsRateio.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                      _CdsRateio.FieldByName('VLRRESORCAMEN').AsFloat,
                                                      _CdsRateio.FieldByName('IDRATEIODOCUM').AsInteger,
                                                      _CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                                      _CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger,
                                                      _CdsRateio.FieldByName('UNIDNEGOC').AsInteger,
                                                      _CdsDocumento.FieldByName('MOECODIGO').AsInteger,
                                                      _CdsDocumento.FieldByName('IDUSUARIOINCLUSAO').AsInteger,
                                                      _CdsRateio.FieldByName('IDRESERVAORCAMEN').AsInteger,
                                                      _CdsDocumento.FieldByName('PLANO').AsInteger,
                                                      _CdsRateio.FieldByName('IDPLANOPREV').AsInteger,
                                                      _CdsRateio.FieldByName('IDPATRO').AsInteger,
                                                      _CdsRateio.FieldByName('IDPROGRAMA').AsInteger,
                                                      0,
                                                      _CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                                      _CdsRateio.FieldByName('CODTIPRECDES').AsString,
                                                      _CdsDocumento.FieldByName('RECPAG').AsString,
                                                      _CdsRateio.FieldByName('CODCENTRORESPON').AsString,
                                                      _CdsRateio.FieldByName('CODCENTROCUSTO').AsString,
                                                      _CdsRateio.FieldByName('NUMIMOVEL').AsString);
                     _CdsRateio.Next;
                  end;

                  If Operacao = opInserir Then
                  Begin
                     If Not _Documento.Insert Then
                        Raise Exception.Create( MSG_ERRO_INSERIR_DOC + _Documento.MessageInfo );
                  End
                  Else
                  Begin
                     If Not _Documento.Update Then
                        Raise Exception.Create( MSG_ERRO_INSERIR_DOC + _Documento.MessageInfo );
                  End;

                  If ( IsFloatZero(_Documento.CodDocumento) ) Then
                     _Documento.CodDocumento := _CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger;

                  If ( IsFloatZero(_Documento.Lanctodocum.NumLancto) ) Then
                     _Documento.Lanctodocum.NumLancto := _CdsDocumento.FieldByName('NUMLANCTO').AsInteger;

                  iCodDocumento := Trunc(_Documento.CodDocumento);
                  iNumLancto := _Documento.Lanctodocum.NumLancto;

                  fCodDocumento := iCodDocumento;

                  _CdsDocumento.Edit;
                    If IsFloatZero(_CdsDocumento.FieldByName('CODDOCUMENTO').AsFloat) Then
                       _CdsDocumento.FieldByName('CODDOCUMENTO').AsFloat := iCodDocumento;

                    If IsFloatZero(_CdsDocumento.FieldByName('NUMLANCTO').AsFloat) Then
                       _CdsDocumento.FieldByName('NUMLANCTO').AsFloat := iNumLancto;
                  _CdsDocumento.Post;

                  //Se for alteraçã e o codlancfinance estiver preenchido é efetuada a exclusão do
                  //lançamento para efetivação das alterações
                  If Not IsFloatZero(_CdsDocumento.FieldByName('CODLANCFINANC').AsFloat) Then
                  Begin
                     If Not _Documento.RecbToPagto.Excluir( _CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger ,_CdsDocumento.FieldByName('NUMLANCTO').AsInteger) Then
                        Raise Exception.Create( MSG_ERRO_EXCLUI_RECBTOPAGTO + _Documento.MessageInfo );

                     If Not _Financeiro.ExcluiFinanceiro(_CdsDocumento.FieldByName('CODLANCFINANC').AsFloat) Then
                        Raise Exception.Create( MSG_ERRO_EXCLUI_FINANC + _Financeiro.MessageInfo );
                  End;

                  //Lança e baixa para adiantamentos passa o 14 para o 15 e contabiliza a baixa
                  if bLancaEBaixa And ( OperacaoLanc = opldAdiantamento ) then
                  begin
                    iCodLancBaixaAdiando := Trunc(_Documento.CodDocumento);
                    _Documento.Prepare( OpLanctoDocum, odlBaixaAdiantamento );

                    If (_CdsDocumento.FieldByName('RECPAG').AsString = 'P') Then
                       sDebCre := 'D'
                    Else
                       sDebCre := 'C';

                    _Documento.Lanctodocum.SetValues(_CdsDocumento.FieldByName('DATALANCTO').AsDateTime,
                                                     iCodLancBaixaAdiando,
                                                     iNumLancto,
                                                     _CdsDocumento.FieldByName('VLRLIQUIDO').AsFloat,
                                                     _CdsDocumento.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                     _CdsDocumento.FieldByName('VALOR').AsFloat,
                                                     0,
                                                     0,
                                                     0,
                                                     iIdUsuario,
                                                     _CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                                     0,
                                                     0,
                                                     _CdsDocumento.FieldByName('CODTIPDOC').AsInteger,
                                                     0,
                                                     0,
                                                     '',
                                                     '',
                                                     '',
                                                     '',
                                                     _CdsDocumento.FieldByName('HISTORICOCOMPL').AsString,
                                                     _CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString,
                                                     '',
                                                     '',
                                                     sDebCre,
                                                     _CdsDocumento.FieldByName('IDMODULO').AsInteger,
                                                     _CdsDocumento.FieldByName('PLANO').AsInteger,
                                                     bUsaPlanoPatro,
                                                     (Not  _CdsContabilizacao.IsEmpty ),
                                                     _CdsDocumento.FieldByName('CODPORTFORMA').AsInteger);
                    If Not _Documento.Update Then
                       Raise Exception.Create( MSG_ERRO_BAIXA_ADIANTO + _Documento.MessageInfo );

                    If Not _Documento.UpdateStatusBaixaAdianto( iCodDocumento, Trunc( _Documento.PlnCodigo ) , iNumLancto,
                               _CdsDocumento.FieldByName('DATALANCTO').AsDateTime, SistemaLancto ) Then
                       Raise Exception.Create( MSG_ERRO_ATUALIZA_BAIXA_ADIANTO + _Documento.MessageInfo );
                  end;

                  //Lança e Baixa
                  If (( OperacaoLanc = opldEfetivo ) And bLancaEBaixa ) Or
                     (( OperacaoLanc = opldAdiantamento ) And bLancaEBaixa ) Then
                  begin
                    rCodLancFianc := 0;

                    if bLancaeBaixaNoFinanceiro then
                    begin
                      TrocaDebCre;

                      _Financeiro.UsaPlanoPatro := bUsaPlanoPatro;
                      If not _Financeiro.FazerRateioCAPCAR(_CdsDocumento.Data,
                                                    'N',
                                                    _CdsDocumento.FieldByName('NUMCHQBORDERO').AsString,
                                                    _CdsDocumento.FieldByName('RECPAG').AsString,
                                                    _CdsDocumento.FieldByName('DATACFLOAT').AsDateTime,
                                                    0,
                                                    _CdsDocumento.FieldByName('CODPORTFORMA').AsFloat,
                                                    rCodLancFianc,
                                                    _CdsDocumento.FieldByName('IDPESSOA').AsFloat,
                                                    _CdsDocumento.FieldByName('IDMODULO').AsFloat,
                                                    iIdUsuario,
                                                    _CdsDocumento.FieldByName('PLANO').AsFloat,
                                                    false,
                                                    (Not  _CdsContabilizacao.IsEmpty )) Then
                      Begin
                         TrocaDebCre;
                         Raise Exception.Create( MSG_ERRO_LANC_FINANC + _Financeiro.MessageInfo );
                      End;

                      TrocaDebCre;
                    end;

                    if ( OperacaoLanc = opldEfetivo ) then
                       iNumLancto := _Documento.Lanctodocum.NumLancto;

                    If not _Documento.RecbToPagto.Inserir( iCodDocumento,
                                                   iNumLancto,
                                                   iIdUsuario,
                                                   Trunc(rCodLancFianc),
                                                   _CdsDocumento.FieldByName('CODPORTFORMA').AsInteger,
                                                   _CdsDocumento.FieldByName('NUMCHQBORDERO').AsInteger,
                                                   0,
                                                   0,
                                                   _CdsDocumento.FieldByName('NUMCHQBORDERO').AsString,
                                                   _CdsDocumento.FieldByName('DATACFLOAT').AsString,
                                                   _CdsDocumento.FieldByName('DATALANCTO').AsString) Then
                       Raise Exception.Create( MSG_ERRO_BAIXA_DOC + _Documento.MessageInfo );
                  end;
               
                  //Lancamento de alteradores cadastrados na inclusão do documento
                  If Operacao = opInserir Then LancaAlteradores;

                  //Calculo de Imposto/Agragados no momento do lançamento do documento para lançamentos
                  //efetivos sem lança e baixa
                  If ( OperacaoLanc = opldEfetivo ) And
                     ( not bLancaEBaixa ) Then
                  Begin
                     _Imposto.PartidaDobrada := bLancaPartidaDobrada;   
                     _Imposto.IdPlanoConta := _CdsDocumento.FieldByName('PLANO').AsInteger;
                     _Imposto.IntegraContab := bLancaContab;
                     _Imposto.IdEmpresa := _CdsDocumento.FieldByName('IDPESSOA').AsInteger;
                     _Imposto.RecPag := _CdsDocumento.FieldByName('RECPAG').AsString[1];
                     _Imposto.IdUsuario := iIdUsuario;
                     _Imposto.IdModulo := _CdsDocumento.FieldByName('IDMODULO').AsInteger;
                     _Imposto.DataProgramada := _CdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime;
                     _Imposto.OperacaoDocumento := '2';
                     _Imposto.IdForCli := _CdsDocumento.FieldByName('IDFORCLI').AsInteger;
                     _Imposto.CodDocumento := iCodDocumento;
                     _Imposto.NumLancto := iNumLancto;
                     _Imposto.ValorLancto := _CdsDocumento.FieldByName('VALOR').AsFloat;
                     _Imposto.ValorLiquido := 0;
                     _Imposto.DataLancto := _CdsDocumento.FieldByName('DATALANCTO').AsDateTime;
                     _Imposto.DataEmissao := _CdsDocumento.FieldByName('DATAEMISSAO').AsDateTime;
                     _Imposto.DebCre := _CdsDocumento.FieldByName('DEBCRE').AsString;
                     _Imposto.MomentoLancamento := mlLancamento;
                     _Imposto.CodTipoDoc := _CdsDocumento.FieldByName('CODTIPDOC').AsInteger;

                     If Operacao = opInserir Then
                        _Imposto.Incluir
                     Else
                        _Imposto.Alterar;
                  End;

                  if OperacaoLanc in [opldEfetivo, opldAdiantamento] then
                  begin
               
                    if ( OperacaoLanc = opldEfetivo ) then
                    begin
                      RegularizaPrevisao;
                      RegularizaAdiantamento;
                   
                      If bIntegraOrcamento Then Atualizaorcamento;
                    end;

                    If bIntegraOrcamento Then
                    Begin
                       With _DtmCtrlDocCapCar Do
                       Begin
                          SqlRateio.Prepare;
                          SqlRateio.ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
                          SqlRateio.Open;

                          CdsRateio.First;
                          while not CdsRateio.Eof do
                          begin
                            IntegraorcamentoBack( CdsRateio.FieldByName('NUMRESERVA').AsInteger, CdsRateio.FieldByName('VALOR').AsFloat );
                            CdsRateio.Next;
                          end;

                          CdsRateio.Close;
                       end;
                    end;

                    {**
                      Implementar processamento de avaliação de fornecedor e
                      agrupa\parcela documentos
                    **}
                  end;
               end;
             opApagar:
               Begin
                  sDscLog  := 'Ecluir ' + sDscLog;
                  _Documento.CodDocumento := _CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger;
                  If Not _Documento.Delete Then
                     Raise Exception.Create( _Documento.MessageInfo );


                  If (_CdsDocumento.FieldByName('CODLANCFINANC').AsInteger <> 0) And
                     ( Not _Financeiro.ExcluiFinanceiro(_CdsDocumento.FieldByName('CODLANCFINANC').AsFloat) ) Then
                     Raise Exception.Create( MSG_ERRO_EXCLUI_FINANC + _Financeiro.MessageInfo );
               End;
           End;
        End;
        If Not _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,sDscLog,False) Then
           Raise Exception.Create(_Padroes.MessageInfo);
        Commit;
     except
        On E:Exception Do
         Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
     End;
  End;
end;

function TCtrlLancDocCapCar.ProcessaAgrupaParcela(iIdUsuario,
  iIdEspAcesso: Integer; bLancaContab, bContratoPrevisao, bUsaPlanoPatro: Boolean; ovOrigem,
  ovParcelas: OleVariant; Operacao: TOperacao; DataLancto, DataEmissao: TDateTime;
  CodTipoDoc, CodPortForma, CodForma, idModulo, iPlano, pNumFatura: Integer;
  bLancaPartidaDobrada: Boolean ): Boolean;
  var
   iEmpresa,iModulo,iUsuario : Integer;
    sDscLog : String;
  {****************************************************************************}
  function VerificaPlaconta: Boolean;
    var
      sPlaconta: string;
  begin
    if _CdsOrigemParcelas.IsEmpty then
    begin
       Result := False;
       MessageInfo := 'Não foi selecionado nenhum documento, impossível parcelar';
    end
    else
    begin
      Result := False;
      _CdsOrigemParcelas.First;
      sPlaconta := Trim( _CdsOrigemParcelas.FieldByName('Placonta').AsString);

      while not _CdsOrigemParcelas.Eof do
      begin
        Result := ( sPlaconta = Trim( _CdsOrigemParcelas.FieldByName('Placonta').AsString) );

        if not Result then
        begin
           MessageInfo := 'Só é possível Parcelar Documentos Com a mesma conta contábil.';
           Break;
        end
        else
        begin
           sPlaconta := Trim( _CdsOrigemParcelas.FieldByName('Placonta').AsString );
           _CdsOrigemParcelas.Next;
        end;
      end;
    end;
  end;

  {****************************************************************************}

  procedure InserirParcelas;
  begin
    _CdsOrigemParcelas.First;
    _CdsParcelas.First;

    While not _CdsParcelas.EOF do
    begin
       if bContratoPrevisao then
          _Documento.Prepare( OpDocumento, odlPrevParcela )
       else
          _Documento.Prepare( OpDocumento, odlParcela );

       _Documento.IdEspAcesso := iIdEspAcesso;
       _Documento.IdUsuario := iIdUsuario;
       _Documento.IdModulo := _CdsOrigemParcelas.FieldByName('IDMODULO').AsInteger;
       _Documento.UsaPlanoPatro := bUsaPlanoPatro;

       _Documento.SetValues(_CdsParcelas.FieldByName('CODDOCUMENTO').AsInteger,
                            _CdsParcelas.FieldByName('NODOCUMENTO').AsFloat,
                            _CdsParcelas.FieldByName('COMPLDOCUMENTO').AsString,
                            '',
                            _CdsParcelas.FieldByName('RECPAG').AsString,
                            '',
                            '',
                            '',
                            _CdsOrigemParcelas.FieldByName('PLACONTA').AsString,
                            '',
                            '',
                            '',
                            '',
                            '',
                            '',
                            '',
                            _CdsParcelas.FieldByName('REFERENCIA').AsString,
                            _CdsParcelas.FieldByName('OBS').AsString,
                            _CdsParcelas.FieldByName('DATAVENCTO').AsDateTime,
                            DataEmissao,
                            _CdsParcelas.FieldByName('DATAPROGRAMADA').AsDateTime,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            CodTipoDoc,
                            _CdsOrigemParcelas.FieldByName('IDPESSOA').AsInteger,
                            idModulo,
                            _CdsOrigemParcelas.FieldByName('IDFORCLI').AsInteger,
                            _CdsParcelas.FieldByName('NUMFATURA').AsInteger,
                            _CdsParcelas.FieldByName('IDCBANCARIA').AsInteger,
                            _CdsOrigemParcelas.FieldByName('UNIDNEGOC').AsInteger,
                            iPlano,
                            0,
                            _CdsParcelas.FieldByName('NUMAPGR').AsInteger,
                            _CdsOrigemParcelas.FieldByName('MOECODIGO').AsInteger,
                            0,
                            0,
                            _CdsParcelas.FieldByName('IDUSUARIOINCLUSAO').AsInteger,
                            _CdsOrigemParcelas.FieldByName('IDPESSOA').AsInteger,
                            0,
                            0,
                            _CdsOrigemParcelas.FieldByName('CODSUBCONTA').AsInteger,
                            CodPortForma,
                            0,
                            0,
                            CodForma);



       _Documento.Lanctodocum.SetValues(DataLancto,
                                        0,
                                        0,
                                        _CdsParcelas.FieldByName('VALOR').AsFloat,
                                        _CdsParcelas.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                        _CdsParcelas.FieldByName('VALOR').AsFloat,
                                        0,
                                        0,
                                        0,
                                        iIdUsuario,
                                        _CdsOrigemParcelas.FieldByName('IDPESSOA').AsInteger,
                                        0,
                                        0,
                                        CodTipoDoc,
                                        0,
                                        0,
                                        '',
                                        '',
                                        '',
                                        _CdsParcelas.FieldByName('NUMFATURA').AsString,
                                        _CdsParcelas.FieldByName('HISTORICOCOMPL').AsString,
                                        _CdsParcelas.FieldByName('COMPLDOCUMENTO').AsString,
                                        '',
                                        '',
                                        _Documento.GetDebCre( CodTipoDoc ),
                                        idModulo,
                                        iPlano,
                                        bUsaPlanoPatro);

       result := _Documento.Insert;

       if not result then raise Exception.Create( _Documento.MessageInfo );

       fCodDocumento := _Documento.CodDocumento;

       _CdsParcelas.Next;
    end;

    _CdsOrigemParcelas.first;
    while not _CdsOrigemParcelas.eof do
    begin
       if (_CdsParcelas.FieldByName('NUMAPGR').AsFloat > 0) then
          result := ExecSQL('UPDATE DOCUMENTO SET NUMFATURA = ' + _CdsParcelas.FieldByName('NUMFATURA').AsString +
                            ' , STATUS = ''2'', NUMAPGR = ' + _CdsParcelas.FieldByName('NUMAPGR').AsString +
                            ' WHERE CODDOCUMENTO = ' + _CdsOrigemParcelas.FieldByName('CODDOCUMENTO').AsString)
       else
          result := ExecSQL('UPDATE DOCUMENTO SET NUMFATURA = ' + _CdsParcelas.FieldByName('NUMFATURA').AsString +
                            ' ,  STATUS = ''2'' ' +
                            ' WHERE CODDOCUMENTO = ' + _CdsOrigemParcelas.FieldByName('CODDOCUMENTO').AsString);

       if not result then raise Exception.Create( MessageInfo );

       _CdsOrigemParcelas.next;
    end;

    _DtmCtrlDocCapCar.SQLDocImposto.Prepare;
    _DtmCtrlDocCapCar.SQLDocImposto.ParamByName('NUMFATURA').AsFloat := _CdsParcelas.FieldByName('NUMFATURA').AsFloat;

    if bContratoPrevisao then
       _DtmCtrlDocCapCar.SQLDocImposto.ParamByName('OPERACAO').AsString := '13'
    else
       _DtmCtrlDocCapCar.SQLDocImposto.ParamByName('OPERACAO').AsString := '3';

    _DtmCtrlDocCapCar.SQLDocImposto.Open;
    _DtmCtrlDocCapCar.CdsDocImposto.First;

    While Not _DtmCtrlDocCapCar.CdsDocImposto.Eof Do
    Begin
       _Imposto.PartidaDobrada := bLancaPartidaDobrada;
       _Imposto.IdPlanoConta := _DtmCtrlDocCapCar.CdsDocImposto.FieldByName('PLANO').AsInteger;
       _Imposto.IntegraContab := bLancaContab;
       _Imposto.IdEmpresa := _DtmCtrlDocCapCar.CdsDocImposto.FieldByName('IDPESSOA').AsInteger;
       _Imposto.RecPag := _DtmCtrlDocCapCar.CdsDocImposto.FieldByName('RECPAG').AsString[1];
       _Imposto.IdUsuario := iIdUsuario;
       _Imposto.IdModulo := _DtmCtrlDocCapCar.CdsDocImposto.FieldByName('IDMODULO').AsInteger;
       _Imposto.DataProgramada := _DtmCtrlDocCapCar.CdsDocImposto.FieldByName('DATAPROGRAMADA').AsDateTime;
       _Imposto.OperacaoDocumento := _DtmCtrlDocCapCar.CdsDocImposto.FieldByName('OPERACAO').AsString;
       _Imposto.IdForCli := _DtmCtrlDocCapCar.CdsDocImposto.FieldByName('IDFORCLI').AsInteger;
       _Imposto.CodDocumento := _DtmCtrlDocCapCar.CdsDocImposto.FieldByName('CODDOCUMENTO').AsInteger;
       _Imposto.NumLancto := _DtmCtrlDocCapCar.CdsDocImposto.FieldByName('NUMLANCTO').AsInteger;;
       _Imposto.ValorLancto := _DtmCtrlDocCapCar.CdsDocImposto.FieldByName('VALOR').AsFloat;
       _Imposto.DataLancto := _DtmCtrlDocCapCar.CdsDocImposto.FieldByName('DATALANCTO').AsDateTime;
       _Imposto.DataEmissao := _DtmCtrlDocCapCar.CdsDocImposto.FieldByName('DATAEMISSAO').AsDateTime;
       _Imposto.DebCre := _DtmCtrlDocCapCar.CdsDocImposto.FieldByName('DEBCRE').AsString;
       _Imposto.CodTipoDoc := _DtmCtrlDocCapCar.CdsDocImposto.FieldByName('CODTIPDOC').AsInteger;
       _Imposto.MomentoLancamento := mlLancamento;
       _Imposto.ValorLiquido := 0;

       If Operacao = opInserir Then _Imposto.Incluir;

       _DtmCtrlDocCapCar.CdsDocImposto.Next;
    End;

    _DtmCtrlDocCapCar.CdsDocImposto.Close;
  end;
  {****************************************************************************}

  procedure ApagarParcelas;
  begin
     if bContratoPrevisao then
        _Cds.Data := GetDataPacket(' SELECT CODDOCUMENTO FROM DOCUMENTO WHERE NUMFATURA = ' + IntToStr(pNumFatura) +
                                   ' AND RTRIM(OPERACAO) = ''13''')
     else
        _Cds.Data := GetDataPacket(' SELECT CODDOCUMENTO FROM DOCUMENTO WHERE NUMFATURA = ' + IntToStr(pNumFatura) +
                                   ' AND RTRIM(OPERACAO) = ''3''');

     While (not _Cds.Eof) Do
     begin
        if bContratoPrevisao then
           _Documento.Prepare( OpDocumento, odlPrevParcela )
        else
           _Documento.Prepare( OpDocumento, odlParcela );

        _Documento.IdEspAcesso := iIdEspAcesso ;
        _Documento.IdUsuario := iIdUsuario;
        _Documento.IdModulo := idModulo;
        _Documento.UsaPlanoPatro := bUsaPlanoPatro;
        _Documento.CodDocumento := _Cds.FieldByName('CODDOCUMENTO').AsInteger;

        result :=  _Documento.Delete;

        if not result then raise Exception.Create( _Documento.MessageInfo );

        _Cds.Next;
     end;

      _Cds.Close;

    _CdsOrigemParcelas.first;
    while not _CdsOrigemParcelas.eof do
    begin
       result := ExecSQL( 'UPDATE DOCUMENTO SET NUMFATURA = NULL, STATUS = ''0'' WHERE CODDOCUMENTO = ' + _CdsOrigemParcelas.FieldByName('CODDOCUMENTO').AsString );

       if not result then raise Exception.Create( MessageInfo );

       _CdsOrigemParcelas.next;
    end;
  end;

begin
  if ConnectionSide = cnsClient then
  begin
     Result := Connection.AppServer.ProcessaDocumento(iIdUsuario, iIdEspAcesso,
               bLancaContab, bUsaPlanoPatro, ovOrigem, ovParcelas, Integer(Operacao));

     if not Result then
       MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     _CdsOrigemParcelas.Data := ovOrigem;
     _CdsParcelas.Data := ovParcelas;

     result := VerificaPlaconta;

     if result then
     begin
       Try
          iEmpresa  := _CdsOrigemParcelas.FieldByName('IdPessoa').AsInteger;
          iModulo   := IdModulo;
          iUsuario  := iIdUsuario;
          sDscLog   := 'Agrupa Parcela';

          StartTransaction;

          case Operacao of
             opInserir:
               begin
                  sDscLog   := 'Inclusao Agrupa Parcela';
                  InserirParcelas;
               end;
             opAlterar:
               begin
                  sDscLog   := 'Alteracao Agrupa Parcela';
                  ApagarParcelas;
                  InserirParcelas;
               end;
             opApagar:
               begin
                  sDscLog   := 'Exclusao Agrupa Parcela';
                  ApagarParcelas;
               end;
          end;

          if result then
          begin
             If Not _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,sDscLog,False) Then
                Raise Exception.Create(_Padroes.MessageInfo);
             Commit;
          end;
       except
          On E:Exception Do
           Begin
              Rollback;
              Result := False;
              MessageInfo := E.Message;
           End;
       End;
     end;
  end;
end;

function TCtrlLancDocCapCar.RegularizaAdiantamento( ovCds, ovDocumento: OleVariant; iIdUsuario,
         iIdEspAcesso: Integer; bLancaContab, bUsaPlanoPatro: Boolean; dDataRegularizacao: TDateTime ): Boolean;
begin
  Result := ProcessaDocumento( iIdUsuario, iIdEspAcesso, 0, bLancaContab, bUsaPlanoPatro,
            false, false, false, false, false, ovDocumento, null, null, null, null, ovCds, opInserir,
            opRegAdiantamento, false, dDataRegularizacao );
end;

procedure TCtrlLancDocCapCar.ImprimeEspelhoDoc(iCodDocumento: Double; IdReport: Integer; sNomeReport: String;
      OperacaoLanc: TOperacaoLancDocCapCar);
Var
   sMensagem: String;
   dtm: TdtmReports;
   rpt: TppReport;
   sCodDocumento : String;
begin
   if ( OperacaoLanc in [ opldEfetivo, opldAgrupaParcela ] ) and ( IdReport > 0 ) then
     if (MsgDlg('Confirma a Impressão do Espelho do Documento "' + sNomeReport + '" ?','Confirmar', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
     begin
       Case IdReport of
         2546:
         begin
         If not TRptAutPag.PrintReport(IdReport, 1, Sistema.IdEmpresa, Sistema.IdUsuario,
                Sistema.IdModulo, FloatToStr(iCodDocumento) + '|=| |=| |=| |=|', '',
               'BaseDados', Sistema.NomeEmpresa, Sistema.NomeModulo, sMensagem) then
            MsgDlg(sMensagem, 'Impressão do Espelho do Documento "' + sNomeReport, mtError, [], 0);
         end;
         3272:
         begin
           // -----------------------------------------------------------------------------
           // Acerto para Impressão da AP modelo 3 - 03/12/2002 - Fabio Barros
           // -----------------------------------------------------------------------------

           dtm := TdtmReports(Application.FIndComponent(Modulo.FormEventos));
           if dtm <> nil then
           begin
             if Application.FIndComponent('frmMostraRelat') = nil then
               frmMostraRelat := nil;

             rpt := TppReport(dtm.FIndComponent(Modulo.PpReports));

             try
               sCodDocumento := FloatToStr(iCodDocumento);
               Modulo.CodDocumento := StrToInt(Trim(sCodDocumento));
               if (rpt <> nil) and (dtm.MostraParam(Modulo.FormParam)) then
               begin
                 rpt.Device := dvPrinter;
                 rpt.PrInt;
                 rpt.Device := dvScreen;
               end;
             finally
               Modulo.coddocumento := 0;
             end;
           end;

         end;
         Else
            MsgDlg(sMensagem, 'O Relatório "' + sNomeReport + '" não foi implementado para impressão automática.', mtError, [], 0);
       end;
     end;
end;


end.


