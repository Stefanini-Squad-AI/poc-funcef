(*******************************************************************************
 EfetivGetImpostoa a retenção dos Impostos associados ao Fornecedor/Cliente;
 Tabelas Relacionadas:
      TRATFISC     
      TIPOAGRE
      FORCLIXAGREG
      FAIXATIPOAGREG
      IMPOSTORETIDO

 >> Retenção de Imposto
           ImpostoRetido.DataProgramada    := qry.FieldByName('DATAPROGRAMADA').AsDateTime;
           ImpostoRetido.OperacaoDocumento := sOperacao;
           ImpostoRetido.IdForCli          := qry.FieldByName('IDFORCLI').AsInteger;
           ImpostoRetido.CodDocumento      := iCodLancCAPCAR;
           ImpostoRetido.NumLancto         := 0/NumLancto;
           ImpostoRetido.ValorLancto       := qry.FieldByName('VALOR').AsFloat;
           ImpostoRetido.ValorLiquido      := qry.FieldByName('VLRLIQUIDO').AsFloat;
           ImpostoRetido.DataLancto        := qry.FieldByName('DATALANCTO').AsDateTime;
           ImpostoRetido.DataEmissao       := qry.FieldByName('DATAEMISSAO').AsDateTime;
           ImpostoRetido.DebCre            := 'D' / 'C'
           ImpostoRetido.Incluir;

 >> Alteração da retenção do Imposto
           ImpostoRetido.OperacaoDocumento := sOperacao;
           ImpostoRetido.CodDocumento      := iCodLancCAPCAR;
           ImpostoRetido.NumLancto         := 0/NumLancto;
           ImpostoRetido.ValorLancto       := qry.FieldByName('VALOR').AsFloat;
           ImpostoRetido.ValorLiquido      := qry.FieldByName('VLRLIQUIDO').AsFloat;
           ImpostoRetido.DebCre            := 'D' / 'C'
           ImpostoRetido.Alterar;

 >> Exclusçao da retenção do Imposto
          ImpostoRetido.CodDocumento    := qry.FieldByName('CODDOCUMENTO').AsInteger;
          ImpostoRetido.NumLancto       := 0/NumLancto > Numero do lançamento do alterador > Indicado qdo a exclusão é somente de um imposto/agregado específico;
          ImpostoRetido.NumLanctoOrigem := Numero do lançamento de origem > Indicado qdo a exclusão é para todos os impostos/agregados lançados para este lançamento;
          ImpostoRetido.TipoExclusao    := teAll > Exclui todos os impostos/agregados
                                           teSoBaixa > Exclui somente os impostos/agregados lançados na Baixa/Criação do lote
                                           teSoLancamento > Exclui somente os impostos/agregados lançados no lançamento do documento
          ImpostoRetido.Excluir;


 11/01/2000 - 2.02.01
   Implemetação da propriedade ValorLiquido :Double.
     Esta deve ser informada antes dos métodos incluir/Alterar uma vez que foi
     aberta a possibilidade do imposto ser calculado tendo como base o valor
     líquido do documento ( valor este gravado na tabela lanctodocum );
   Alteração no método ImpostoRetido.Inserir: Implemetação do teste para a retenção
   de impostos agregados para lançamento de alteradores que obriguem o cálculo de
   tal retenção onde não é efetuado o lançamento de alterador mesmo que o imposto
   esteja associado a tal.
 25/01/2000 - 02.03.03
   Implementação da propriedade ImpostoRetido.DebCre para acerto no cáculo de devolução de
   imposto
 04/02/2000 - 02.17.0
   Criação da propriedade ValorTotalRetido que retorna o total do valor retido para
   o lançamento somando os agregados e diminuindo os impostos.
   Criação da função GetValorPorRateio que verifica os rateios do lançamento
   e calcula proporcionalmente o valor do lançamento de acordo com o Tipo de
   Desembolso, Agrupamento ou Parcelas do lançamento de origem
 16/03/2000 - 2.03.14
   * Inclusão da Propriedade CodTipRecDes ultilizada para a simulação de imposto
     para um tipo de desembolso;
   * Inclusão da propriedade QrySimulacao ( Read Only ) que contém os registros da
     simulaÇão do imposto para o tipo de desembolso com os sequintes campos:
       IDIMPOSTO :float;
       VALORIMPOSTO :float;
       PERCIMPOSTO :float;
       VALORBASE :float;
   * Alteração na seleção do imposto para respeitar a seguimte prioridade dos relacionamentos:
      tgSoPessoa > Só os impostos associados a Pessoa;
      tgClasFisRecDes > Só os impostos associados a classificação fiscal e ao tipo de recebimento/desenbolso;
      tgSoRecDes > Só os impostos associados ao tipo de recebimento/desenbolso;
   * Criação da propriedade CodTipoDoc
     Para verificar no momento do lançamento se o Tipo do Documento é Fiscal
 05/06/2000
   Criação da propriedae TipoImclusao do tipo TTipoInclusao que indica o procedimentos a
   ser executado na inclusão do imposto:
   TiLancaImposto (Default)
   TiSoCalculaValor - Só cálcula valor dos impostos que alteram o saldo do documento na efetivando a retenção

{
  DF 04/07 Gustavo
   Implementação do Lançamento acumulado de Impostos que geram um único documento.
   O Rateio do documento gerado é proporcional ao rateio dos documento que compõe o lote gerado.
   Criada a coluna NUMLOTE na tabela imposto retido para identificar a origem da retenção quando vinda
   de um Lote.
   Criação da propriedade NumLote para indicar os lançamentos de retenção que devem ser agrupados
   para o Tratamento Fiscal 'Lança Imposto Como Novo Documento';
   Criação do método 'EfetivaNovoDocumento' para efetivar os valores calculados para impostos do
   tipo citado acima.
  Fim DF 04/07 Gustavo
}

 26/06/2000 - Alterações Funcef

 *******************************************************************************)

unit uImpostoRetido;

interface

Uses CMwwQuery, Forms, DB, SysUtils, uSistema, uDataBase, uIntegraBack, uFuncaoGeral,
     uDocumento, dCmBackImposto, Dialogs, uLancContab, DbTables, uDiasUteis, uString, wwQuery,
     dBaseDados, JclMath, classes;

Type
   TImpostoRetidoError = Exception;
   TMomentoLancamento = (mlLancamento, mlBaixa);
   TTipoExclusao      = (teAll, teSoBaixa, teSoLancamento);
   TTipoGetImposto    = (tgSoPessoa, tgClasFisRecDes, tgSoRecDes);
   TTipoInclusao      = (tiLancaImposto, tiSoCalculaValor);
   TTipoImpostoLancto = (tilAll, tilAgregados, tilImpostos, tilNovoDoc, tilSomenteValor);

   TImpostoRetido = Class
   private
     _dtmCmBackimposto: TDtmCmBackimposto;

     _iDiaSemanaLancto, _iDiasUteisLancto :ShortInt;
     _DocImposto                  :TDocumento;
     _CodTipoCustoAgreg           :LongInt;
     _liPlanilha,_iNumDependentes :LongInt;
     _VlrInss, _VlrPensao         :Double;
     _AcumulaMes, _DiminuiFaixa   :Boolean;
     _CalculaSobreValorBruto      :Boolean;
     _ValorBase, _ValorRetido     :Double;
     _ValorImposto                :Double;
     _ValorLancto                 :Double;
     _DataRetencao                :TDateTime;
     _DataLancto                  :TDateTime;
     _DatadoLancto                :String;
     _NumLancto                   :LongInt;
     _Fator                       :Integer;
     _DebCre                      :String;
     _TipoGetImposto              :TTipoGetImposto;
     _CodTipRecDes                :String;
     _ClasFisCliFor               :LongInt;
     _CodNewDoc                   :LongInt;
     _IdForCli                    :LongInt;
     _IdForCliPortForma           :LongInt;
     _ContaCliFor,
     _CCustoCliFor                :String;
     _UnidNegocCliFor,
     _SubContaCliFor              :Integer;
     _QryAcumulaImposto           :TwwQuery;
     _CodDocsAcumula              :String;
     _UpdAcumulaImposto           :TUpdateSQL;
     _iCodCidade,_iCodPais        :LongInt;
     _sEstado                     :String;
     _ValorOriginal               :Double;
     fTipoExclusao                :TTipoExclusao;
     FIdForCli, FCodDocumento     :LongInt;
     FNumLancto                   :LongInt;
     FIdImpostoRetido             :LongInt;
     FValorLancto                 :Double;
     FValorLiquido                :Double;
     fExcluiAlteradores           :Boolean;
     FDataLancto                  :TDateTime;
     FDataProgramada              :TDateTime;
     FDataEmissao                 :TDateTime;
     FOperacaoDocumento           :String;
     FDebCre                      :String;
     FCodTipRecDes                :String;
     FCodCentroCusto              :String;
     FPrograma                    :LongInt;
     FMomentoLancamento           :TMomentoLancamento;
     FValorAlteradores            :Double;
     fNumLanctoOrigem             :LongInt;
     fQrySimulacao                :TwwQuery;
     fCodTipoDoc                  :LongInt;
     fAlteraRetencao              :Boolean;
     fCodPortForma                :LongInt;
     fTipoInclusao                :TTipoInclusao;
     fNumLote                     :Double;
     fNumLoteManual               :Double;
     fValorBaseCalculaValor       :Double;
     fValorRetidoCalculaValor     :Double;
     fTipoImpostoLancto           :TTipoImpostoLancto;
     Function  GetImposto         :Boolean;
     Function  GetFaixaImposto    :Boolean;
     Function  GetNumDependentes  :LongInt;
     Function  GetLancaImposto    :Boolean;
     function  GetOperacao        :String;
     procedure EfetivaLancamento;
     procedure ExcluiAlteradoresLancados;
     function  AutorizaLancamento:Boolean;
     Procedure LancaDocumento;
     procedure ExcluiDocLancados;
     //Inclusão do filtro TipoDocumento.RecPag na consulta de documentos
     procedure AcumulaLancaImposto;
   public
     Constructor Create;
     Destructor  Destroy; Override;
     Procedure   Incluir;
     Procedure   Alterar;
     Procedure   Excluir;
     Procedure   AlteraNumLancOrigem(iNumLancOld, iNumLancNew :LongInt);
     //Inclusão do filtro TipoDocumento.RecPag na consulta de documentos
     procedure   EfetivaNovoDocumento;
     procedure   CancelaAcumulaImposto;
     function GetDataLancDocImposto(dData:TDateTime):TDateTime;
     property    NumLote           :Double               Read fNumLote           Write fNumLote;
     property    NumLoteManual     :Double               Read fNumLoteManual     Write fNumLoteManual;
     Property    DebCre            :String               Read FDebCre            Write FDebCre;
     Property    OperacaoDocumento :String               Read GetOperacao        Write FOperacaoDocumento;
     Property    CodTipRecDes      :String               Read FCodTipRecDes      Write FCodTipRecDes;
     Property    CodCentroCusto    :String               Read FCodCentroCusto    Write FCodCentroCusto;
     Property    Programa          :LongInt              Read FPrograma          Write FPrograma;
     Property    IdForCli          :LongInt              Read FIdForCli          Write FIdForCli;
     Property    CodDocumento      :LongInt              Read FCodDocumento      Write FCodDocumento;
     Property    NumLancto         :LongInt              Read FNumLancto         Write FNumLancto;
     Property    NumLanctoOrigem   :LongInt              Read fNumLanctoOrigem   Write fNumLanctoOrigem;
     Property    ValorLancto       :Double               Read FValorLancto       Write FValorLancto;
     Property    ValorLiquido      :Double               Read FValorLiquido      Write FValorLiquido;
     Property    DataProgramada    :TDateTime            Read FDataProgramada    Write FDataProgramada;
     Property    DataLancto        :TDateTime            Read FDataLancto        Write FDataLancto;
     Property    DataEmissao       :TDateTime            Read FDataEmissao       Write FDataEmissao;
     Property    ExcluiAlteradores :Boolean              Read fExcluiAlteradores Write fExcluiAlteradores;
     Property    MomentoLancamento :TMomentoLancamento   Read fMomentoLancamento Write fMomentoLancamento;
     Property    IdImpostoRetido   :LongInt              Read FIdImpostoRetido   Write FIdImpostoRetido;
     Property    TipoExclusao      :TTipoExclusao        Read fTipoExclusao      Write fTipoExclusao;
     Property    CodTipoDoc        :LongInt              Read fCodTipoDoc        Write fCodTipoDoc;
     Property    CodPortForma      :LongInt              Read fCodPortForma      write fCodPortForma;
     Property    TipoInclusao      :TTipoInclusao        Read fTipoInclusao      write fTipoInclusao;
     Property    ValorBaseCalculaValor   :Double         Read fValorBaseCalculaValor   write fValorBaseCalculaValor;
     Property    ValorRetidoCalculaValor :Double         Read fValorRetidoCalculaValor write fValorRetidoCalculaValor;
     Property    TipoImpostoLancto :TTipoImpostoLancto   Read fTipoImpostoLancto       write fTipoImpostoLancto;
     Property    NumDependentes    :LongInt              Read GetNumDependentes;
     Property    ValorAlteradores  :Double               Read FValorAlteradores;
     Property    QrySimulacao      :TwwQuery             Read fQrySimulacao;
     Property    AlteraRetencao    :Boolean              Read fAlteraRetencao;
End;

Var
  ImpostoRetido :TImpostoRetido;

implementation

Constructor TImpostoRetido.Create;
Begin
   Inherited Create;

   _dtmCmBackimposto := TDtmCmBackimposto.Create(nil);;

   fExcluiAlteradores := True;
   fMomentoLancamento := mlLancamento;
   _DocImposto        := TDocumento.Create;
   FIdImpostoRetido   := 0;
   fNumLanctoOrigem   := 0;
   fTipoExclusao      := teAll;
   FCodTipRecDes      := '';
   FCodCentroCusto    := '';
   FPrograma          := 0;
   fQrySimulacao      := _DtmCmBackimposto.QrySimulaImposto;
   _ClasFisCliFor     := 0;
   fCodPortForma      := 0;
   fTipoInclusao      := TiLancaImposto;
   fTipoImpostoLancto := tilAll;
   fNumLote           := 0.00;
   fNumLoteManual     := 0.00;
   fValorBaseCalculaValor    := 0.00;
   fValorRetidoCalculaValor  := 0.00;
   _CodDocsAcumula    := '';

   If _DtmCmBackimposto.QryPortForma.Active Then _DtmCmBackimposto.QryPortForma.Close;

   (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).Close;
   If Integraback.RecPag = 'R' Then
   Begin
      _DtmCmBackimposto.DsDadosLancImp.DataSet := _DtmCmBackimposto.QryDadosLancImpRec;
      _DtmCmBackimposto.QryPortForma.Sql.Text  :=
                                           'SELECT ' +
                                           '  PF.IDFORCLI, ' +
                                           '  DC.CONTACCLIENTE AS CONTACONTABIL, ' +
                                           '  DC.CODCENTROCUSTO, ' +
                                           '  DC.CODSUBCONTA, ' +
                                           '  DC.UNIDNEGOC ' +
                                           'FROM ' +
                                           '  PORTADORFORMA PF, EMPRESACLIENTE DC ' +
                                           'WHERE ' +
                                           '  PF.CODPORTFORMA = :CODPORTFORMA AND ' +
                                           '  DC.IDPESSOA = :IDPESSOA AND ' +
                                           '  PF.IDFORCLI = DC.IDFORCLI ';
   End
   Else
   Begin
      _DtmCmBackimposto.DsDadosLancImp.DataSet := _DtmCmBackimposto.QryDadosLancImpPag;
      _DtmCmBackimposto.QryPortForma.Sql.Text  :=
                                           'SELECT ' +
                                           '  PF.IDFORCLI, ' +
                                           '  DC.CONTACFORN AS CONTACONTABIL, ' +
                                           '  DC.CODCENTROCUSTO, ' +
                                           '  DC.CODSUBCONTA, ' +
                                           '  DC.UNIDNEGOC ' +
                                           'FROM ' +
                                           '  PORTADORFORMA PF, EMPRESAFORN DC ' +
                                           'WHERE ' +
                                           '  PF.CODPORTFORMA = :CODPORTFORMA AND ' +
                                           '  DC.IDPESSOA = :IDPESSOA AND ' +
                                           '  PF.IDFORCLI = DC.IDFORCLI ';
   End;

   If (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).Active Then
      (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).Close;

   fAlteraRetencao := false;
   _QryAcumulaImposto := TwwQuery.Create(Application);
   _UpdAcumulaImposto := TUpdateSQL.Create(Application);
   _QryAcumulaImposto.CachedUpdates := True;
   _QryAcumulaImposto.UpdateObject := _UpdAcumulaImposto;

   _QryAcumulaImposto.DataBaseName := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).DataBaseName;
   _QryAcumulaImposto.Sql.Text     := ' SELECT ' +
                                      '  I.CODTIPOCUSTAGREG, ' +
                                      '  I.DATARETENCAO, ' +
                                      '  I.VLRBASE, ' +
                                      '  I.VLRRETIDO, ' +
                                      '  I.IDFORCLI, ' +
                                      '  I.IDPESSOA, ' +
                                      '  I.RECPAG, ' +
                                      '  TA.DESCCUSTAGREG ' +
                                      ' FROM ' +
                                      '  IMPOSTORETIDO I, TIPOAGRE TA ' +
                                      ' WHERE 1=2 ';

End;

Destructor TImpostoRetido.Destroy;
Begin
   _DocImposto.Free;

   FechaQry([ _DtmCmBackimposto.Qry,
                          _DtmCmBackimposto.QryFaixaImposto,
                          _DtmCmBackimposto.QryBaseMes,
                          _DtmCmBackimposto.QryImposto,
                          _DtmCmBackimposto.QryAtuImpostoRetido,
                          _DtmCmBackimposto.QryImpParcEngob,
                          _DtmCmBackimposto.QryImpostoPorDoc,
                          _DtmCmBackimposto.QrySimulaImposto],False,True);

    FechaQry([_QryAcumulaImposto],True,True);
   _UpdAcumulaImposto.Free;

   _DtmCmBackimposto.Free;

   Inherited Destroy;
End;

function  TImpostoRetido.GetOperacao:String;
Begin
   Result := Trim(FOperacaoDocumento);
End;

Function TImpostoRetido.GetLancaImposto:Boolean;
Var
  rValorPorRateio :Double;
Begin
  Result := ((fTipoImpostoLancto = tilAll) Or
             ((fTipoImpostoLancto = tilAgregados) And (_DtmCmBackimposto.QryImpostoCODTRATFISCD.AsString = 'A')) Or
             ((fTipoImpostoLancto = tilImpostos) And (_DtmCmBackimposto.QryImpostoCODTRATFISCD.AsString = '8')) Or
             ((fTipoImpostoLancto = tilNovoDoc) And (_DtmCmBackimposto.QryImpostoCODTRATFISCD.AsString = 'B')) Or
             ((fTipoImpostoLancto = tilSomenteValor) And (_DtmCmBackimposto.QryImpostoCODTRATFISCD.AsString = '9')));

  //Verifica o momento do lançamento
  Result := Result And
            (((fMomentoLancamento = mlLancamento) And (_DtmCmBackimposto.QryImpostoFLGLANCAIMPOSTO.AsString <> 'B')) Or
            ((fMomentoLancamento = mlBaixa) And (_DtmCmBackimposto.QryImpostoFLGLANCAIMPOSTO.AsString  = 'B')));

  If Result then
  Begin
     _DatadoLancto := _DtmCmBackimposto.QryImpostoLANCAMENTOIMPOSTO.AsString;
     If _DatadoLancto = 'L' Then
        _DataRetencao := FDataLancto
     Else
        If _DatadoLancto = 'P' Then
           _DataRetencao := FDataProgramada
        Else
        Begin
           If FDataEmissao = 0 Then
              FDataEmissao := FDataLancto;
           _DataRetencao := FDataEmissao;
        End;

     _CalculaSobreValorBruto := ((_DtmCmBackimposto.QryImpostoFLGCALCVALBRUTO.AsString <> 'N') Or (FValorLiquido = 0));

    If _CalculaSobreValorBruto Then
       _ValorOriginal := fValorLancto
    Else
       _ValorOriginal := FValorLiquido;

       rValorPorRateio := _DtmCmBackimposto.QryImpostoVALORIMPOSTO.AsFloat;//Valor da Tabela de Impostos;

     if _CalculaSobreValorBruto Then
        _ValorLancto := rValorPorRateio
     Else
        _ValorLancto := FValorLiquido * rValorPorRateio/fValorLancto;

     Result := (_ValorLancto > 0 ) ;
  End;
End;

Function TImpostoRetido.GetNumDependentes: Integer;
Begin
  If FazQuery(_DtmCmBackimposto.Qry,'SELECT NUMDEPENDENTES FROM FORNSERV WHERE IDPESSOA = ' + IntToStr(FIdForCli)) And
     (IntegraBack.RecPag = 'P') Then
     Result := _DtmCmBackimposto.Qry.FieldByName('NUMDEPENDENTES').AsInteger
  Else
     Result := 0;

  If FazQuery(_DtmCmBackimposto.Qry,'SELECT VLRINSS, VLRPENSAO FROM PESSOAFISICA WHERE IDPESSOA = ' + IntToStr(FIdForCli)) Then
  Begin
     _VlrInss := _DtmCmBackimposto.Qry.Fields[0].AsFloat;
     _VlrPensao := _DtmCmBackimposto.Qry.Fields[1].AsFloat;
  End
  Else
  Begin
     _VlrInss := 0;
     _VlrPensao := 0;
  End;

  If _DtmCmBackimposto.Qry.Active Then _DtmCmBackimposto.Qry.Close;
End;

Function TImpostoRetido.GetImposto :Boolean;
Var
  sSqlImposto, SqlCalcRateio :String;
Begin
  If FCodTipRecDes <> '' Then
  Begin
     If _TipoGetImposto = tgSoPessoa Then
        SqlCalcRateio := ' (SELECT (:VALORLANCADO) AS VALORIMPOSTO FROM DUAL) QTOTALPORDESEMB '
     Else
     Begin
        If Trim(FCodCentroCusto) = '' Then
           SqlCalcRateio := ' (SELECT (' + IntToStr(fPrograma) + ') AS IDPROGRAMA, (''@'') AS CODCENTROCUSTO, (''' + Espaco(Trim(FCodTipRecDes),15) + ''') AS CODTIPRECDES, (:VALORLANCADO) AS VALORIMPOSTO FROM DUAL) QTOTALPORDESEMB '
        Else
           SqlCalcRateio := ' (SELECT (' + IntToStr(fPrograma) + ') AS IDPROGRAMA, (''' + Espaco(Trim(FCodCentroCusto),10) + ''') AS CODCENTROCUSTO, (''' + Espaco(Trim(FCodTipRecDes),15) + ''') AS CODTIPRECDES, (:VALORLANCADO) AS VALORIMPOSTO FROM DUAL) QTOTALPORDESEMB ';
     End;
  End
  Else
  Begin
     If Trim(FOperacaoDocumento) = '3' Then
     Begin
         If _TipoGetImposto = tgSoPessoa Then
            SqlCalcRateio :=
                    ' (SELECT DISTINCT ' +
                    '   SUM(((:VALORLANCADO * Q2.VALOR)/ Q3.VALOR)) AS VALORIMPOSTO ' +
                    ' FROM ' +
                    '   (SELECT ' +
                    '      DOC.NUMFATURA, ' +
                    '      LAN.VALOR ' +
                    '   FROM ' +
                    '      DOCUMENTO DOC, ' +
                    '      LANCTODOCUM LAN ' +
                    '   WHERE ' +
                    '     (DOC.CODDOCUMENTO = :CODDOCUMENTO) AND ' +
                    '     ((LAN.OPERACAO = ''3'') OR (LAN.OPERACAO = ''13'')) AND ' +
                    '      (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1, ' +
                    '  (SELECT ' +
                    '    D.NUMFATURA, ' +
                    '    RD.VALOR ' +
                    '   FROM ' +
                    '    RATEIODOCUM RD, DOCUMENTO D, TIPORECEBDESEMB TRD ' +
                    '   WHERE ' +
                    '    (D.NUMFATURA IS NOT NULL) AND ' +
                    '    (TRD.FLGCALCULAIMPOSTO = ''S'') AND ' +
                    '    (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND ' +
                    '    (RD.CODTIPRECDES = TRD.CODTIPRECDES) AND ' +
                    '    (RD.RECPAG       = TRD.RECPAG) AND ' +
                    '    (RD.IDPESSOA     = TRD.IDPESSOA)) Q2, ' +
                    '   (SELECT ' +
                    '     D.NUMFATURA, SUM(L.VALOR) AS VALOR ' +
                    '    FROM ' +
                    '     LANCTODOCUM L, DOCUMENTO D ' +
                    '    WHERE ' +
                    '     ((L.OPERACAO = ''1'') OR  (L.OPERACAO = ''11'')) AND ' +
                    '     (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                    '     (D.OPERACAO = L.OPERACAO) AND ' +
                    '     (D.NUMFATURA IS NOT NULL) ' +
                    '    GROUP BY D.NUMFATURA) Q3 ' +
                    ' WHERE ' +
                    '   (Q1.NUMFATURA = Q2.NUMFATURA) AND ' +
                    '   (Q3.NUMFATURA = Q2.NUMFATURA)) QTOTALPORDESEMB '
        Else
            SqlCalcRateio :=
                    '(SELECT DISTINCT ' +
                    '  Q2.CODTIPRECDES, ' +
                    '  DECODE(Q2.CODCENTROCUSTO,NULL,''@'',Q2.CODCENTROCUSTO) AS CODCENTROCUSTO, ' +
                    '  DECODE(Q2.IDPROGRAMA,NULL,0,Q2.IDPROGRAMA) AS IDPROGRAMA, ' +
                    '  SUM(((:VALORLANCADO * Q2.VALOR)/ Q3.VALOR)) AS VALORIMPOSTO ' +
                    ' FROM ' +
                    '  (SELECT ' +
                    '     DOC.NUMFATURA, ' +
                    '     LAN.VALOR ' +
                    '  FROM ' +
                    '     DOCUMENTO DOC, ' +
                    '     LANCTODOCUM LAN ' +
                    '  WHERE ' +
                    '    (DOC.CODDOCUMENTO = :CODDOCUMENTO) AND ' +
                    '    ((LAN.OPERACAO = ''3'') OR (LAN.OPERACAO = ''13'')) AND ' +
                    '     (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1, ' +
                    ' (SELECT ' +
                    '   D.NUMFATURA, ' +
                    '   RD.VALOR, ' +
                    '   TRD.CODTIPRECDES, ' +
                    '   RD.CODCENTROCUSTO, ' +
                    '   RD.IDPROGRAMA ' +
                    '  FROM ' +
                    '   RATEIODOCUM RD, DOCUMENTO D, TIPORECEBDESEMB TRD ' +
                    '  WHERE ' +
                    '   (D.NUMFATURA IS NOT NULL) AND ' +
                    '   (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND ' +
                    '   (RD.CODTIPRECDES = TRD.CODTIPRECDES) AND ' +
                    '   (RD.RECPAG       = TRD.RECPAG) AND ' +
                    '   (RD.IDPESSOA     = TRD.IDPESSOA)) Q2, ' +
                    '  (SELECT ' +
                    '    D.NUMFATURA, SUM(L.VALOR) AS VALOR ' +
                    '   FROM ' +
                    '    LANCTODOCUM L, DOCUMENTO D ' +
                    '   WHERE ' +
                    '    ((L.OPERACAO = ''1'') OR  (L.OPERACAO = ''11'')) AND ' +
                    '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                    '    (D.OPERACAO = L.OPERACAO) AND ' +
                    '    (D.NUMFATURA IS NOT NULL) ' +
                    '   GROUP BY D.NUMFATURA) Q3 ' +
                    ' WHERE ' +
                    '  (Q1.NUMFATURA = Q2.NUMFATURA) AND ' +
                    '  (Q3.NUMFATURA = Q2.NUMFATURA) ' +
                    ' GROUP ' +
                    '  BY Q2.CODCENTROCUSTO, Q2.CODTIPRECDES, Q2.IDPROGRAMA) QTOTALPORDESEMB ';
     End
     Else
     Begin
         If _TipoGetImposto = tgSoPessoa Then
            SqlCalcRateio :=
                    ' (SELECT DISTINCT ' +
                    '   ((:VALORLANCADO * QRATEIO.VALOR)/QDOCINI.VALOR) AS VALORIMPOSTO ' +
                    ' FROM ' +
                    '  (SELECT ' +
                    '     SUM(R.VALOR) AS VALOR, R.CODDOCUMENTO ' +
                    '   FROM ' +
                    '     RATEIODOCUM R, ' +
                    '     TIPORECEBDESEMB TRD ' +
                    '   WHERE ' +
                    '     (R.CODDOCUMENTO = :CODDOCUMENTO) AND ' +
                    '     (R.CODTIPRECDES = TRD.CODTIPRECDES) AND ' +
                    '     (R.RECPAG       = TRD.RECPAG) AND ' +
                    '     (R.IDPESSOA     = TRD.IDPESSOA) AND ' +
                    '     (TRD.FLGCALCULAIMPOSTO = ''S'') ' +
                    '   GROUP BY ' +
                    '     R.CODDOCUMENTO) QRATEIO, ' +
                    '  (SELECT ' +
                    '     L.VALOR, L.CODDOCUMENTO ' +
                    '   FROM ' +
                    '     DOCUMENTO D, LANCTODOCUM L ' +
                    '   WHERE ' +
                    '     (D.CODDOCUMENTO = :CODDOCUMENTO) AND ' +
                    '     (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                    '     (D.OPERACAO = L.OPERACAO)) QDOCINI ' +
                    ' WHERE ' +
                    '   QRATEIO.CODDOCUMENTO = QDOCINI.CODDOCUMENTO ) QTOTALPORDESEMB '
         Else
{
  Inclusão do teste pelo centro de custo ao buscar rateio do imposto: Somente para
  impostos atrelados ao Tipo De Recebimento/Desembolso
}
               SqlCalcRateio :=
                       '(SELECT DISTINCT ' +
                       '  QRATEIO.CODTIPRECDES, ' +
                       '  DECODE(QRATEIO.CODCENTROCUSTO,NULL,''@'',QRATEIO.CODCENTROCUSTO) AS CODCENTROCUSTO, ' +
                       '  DECODE(QRATEIO.IDPROGRAMA,NULL,0,QRATEIO.IDPROGRAMA) AS IDPROGRAMA, ' +
                       '  SUM(((:VALORLANCADO * QRATEIO.VALOR)/QDOCINI.VALOR)) AS VALORIMPOSTO  ' +
                       ' FROM ' +
                       ' (SELECT ' +
                       '    SUM(R.VALOR) AS VALOR, R.CODDOCUMENTO, TRD.CODTIPRECDES, R.CODCENTROCUSTO, R.IDPROGRAMA ' +
                       '  FROM ' +
                       '    RATEIODOCUM R, ' +
                       '    TIPORECEBDESEMB TRD ' +
                       '  WHERE ' +
                       '    (R.CODDOCUMENTO = :CODDOCUMENTO) AND ' +
                       '    (R.CODTIPRECDES = TRD.CODTIPRECDES) AND ' +
                       '    (R.RECPAG       = TRD.RECPAG) AND ' +
                       '    (R.IDPESSOA     = TRD.IDPESSOA) ' +
                       '  GROUP BY ' +
                       '    R.CODDOCUMENTO, TRD.CODTIPRECDES, R.CODCENTROCUSTO, R.IDPROGRAMA) QRATEIO, ' +
                       ' (SELECT ' +
                       '    L.VALOR, L.CODDOCUMENTO ' +
                       '  FROM ' +
                       '    DOCUMENTO D, LANCTODOCUM L ' +
                       '  WHERE ' +
                       '    (D.CODDOCUMENTO = :CODDOCUMENTO) AND ' +
                       '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                       '    (D.OPERACAO = L.OPERACAO)) QDOCINI ' +
                       ' WHERE ' +
                       '  QRATEIO.CODDOCUMENTO = QDOCINI.CODDOCUMENTO ' +
                       ' GROUP BY QRATEIO.CODTIPRECDES, QRATEIO.CODCENTROCUSTO, QRATEIO.IDPROGRAMA) QTOTALPORDESEMB ';
     End;
  End;

  Case _TipoGetImposto of
    //Lança os impostos associados ao Cliente/Fornecedor
    tgSoPessoa:
    Begin
       sSqlImposto :=
       ' SELECT DISTINCT ' +
       '  T.CODTIPOCUSTAGREG, T.FLGACUMULA, T.VLRABATFIXO, T.FLGTIPOCALC, T.CODALTERADOR, ' +
       '  T.VLRMINIMO, T.DESCCUSTAGREG, T.VALPORDEPENDENTE, T.LANCAMENTOIMPOSTO, ' +
       '  T.CODTRATFISCD, T.FLGCALCVALBRUTO, TA.ACRESDECRES, T.FLGLANCAIMPOSTO, SUM(QTOTALPORDESEMB.VALORIMPOSTO) AS VALORIMPOSTO, T.FLGALTERARETENCAO, T.FLGSEMPRECALCULA, (''S'') AS FLGCALCULAIMPOSTO  ' +
       ' FROM ' +
       '  TIPOAGRE T, FORCLIXAGREG F, TIPOALTERADOR TA, ' +
       SqlCalcRateio +
       ' WHERE ' +
       '  (F.IDPESSOA = :IDPESSOA)  AND ' +
       '  (F.IDFORCLI = :IDFORCLI)  AND ' +
       '  (F.RECPAG = :RECPAG)       AND ' +
       '  (T.CODALTERADOR = TA.CODALTERADOR(+)) AND ' +
       '  (T.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG) ' +
       ' GROUP BY ' +
       '  T.CODTIPOCUSTAGREG, T.FLGACUMULA, T.VLRABATFIXO, T.FLGTIPOCALC, T.CODALTERADOR, ' +
       '  T.VLRMINIMO, T.DESCCUSTAGREG, T.VALPORDEPENDENTE, T.LANCAMENTOIMPOSTO, ' +
       '  T.CODTRATFISCD, T.FLGCALCVALBRUTO, TA.ACRESDECRES, T.FLGLANCAIMPOSTO, T.FLGALTERARETENCAO, T.FLGSEMPRECALCULA ';
    End;
    //Lança os impostos associados a classificação fiscal e tipo de desembolso
    tgClasFisRecDes:
    Begin
       sSqlImposto :=
       ' SELECT DISTINCT ' +
       '  T.CODTIPOCUSTAGREG, T.FLGACUMULA, T.VLRABATFIXO, T.FLGTIPOCALC, T.CODALTERADOR, ' +
       '  T.VLRMINIMO, T.DESCCUSTAGREG, T.VALPORDEPENDENTE, T.LANCAMENTOIMPOSTO, ' +
       '  T.CODTRATFISCD, T.FLGCALCVALBRUTO, TA.ACRESDECRES, T.FLGLANCAIMPOSTO, SUM(QTOTALPORDESEMB.VALORIMPOSTO) AS VALORIMPOSTO, T.FLGALTERARETENCAO, T.FLGSEMPRECALCULA, TRD.FLGCALCULAIMPOSTO ' +
       ' FROM ' +
       '  TIPOAGRE T, TIPOALTERADOR TA, CLASFISXTIPOAGRE CA, TIPRECDESXTIPAGRE TR, TIPORECEBDESEMB TRD, ' +
       SqlCalcRateio +
       ' WHERE ' +
       '  (T.CODALTERADOR = TA.CODALTERADOR(+)) AND ' +
       '  (TR.CODTIPRECDES = TRD.CODTIPRECDES) AND ' +
       '  (TR.IDPESSOA = TRD.IDPESSOA) AND ' +
       '  (TR.RECPAG = TRD.RECPAG) AND ' +
       '  (T.CODTIPOCUSTAGREG = TR.CODTIPOCUSTAGREG) AND ' +
       '  (T.CODTIPOCUSTAGREG = CA.CODTIPOCUSTAGREG) AND ' +
       '  (CA.IDCLASFISCLIFOR = :IDCLASFISCLIFOR) AND ' +
       '  (CA.RECPAG = :RECPAG) AND ' +
       '  (QTOTALPORDESEMB.CODTIPRECDES = TR.CODTIPRECDES) AND ' +
       '  (QTOTALPORDESEMB.CODCENTROCUSTO = DECODE(TR.CODCENTROCUSTO,NULL,''@'',TR.CODCENTROCUSTO)) AND ' +
       '  (QTOTALPORDESEMB.IDPROGRAMA = DECODE(TR.IDPROGRAMA,NULL,0,TR.IDPROGRAMA)) AND ' +
       '  (RTRIM(TR.CODTIPRECDES) IN (' + _CodTipRecDes + ') ) AND ' +
       '  (TR.RECPAG = :RECPAG) AND ' +
       '  (TR.IDPESSOA = :IDPESSOA) AND ' +
       '  (T.CODTIPOCUSTAGREG NOT IN ' + //Busca o TipoAgre Que não está associado ao fornecedor
       '      (SELECT ' +
       '          CODTIPOCUSTAGREG ' +
       '       FROM ' +
       '          FORCLIXAGREG ' +
       '       WHERE ' +
       '         (IDPESSOA = :IDPESSOA)  AND ' +
       '         (IDFORCLI = :IDFORCLI)  AND ' +
       '         (RECPAG = :RECPAG))) ' +
       ' GROUP BY ' +
       '  T.CODTIPOCUSTAGREG, T.FLGACUMULA, T.VLRABATFIXO, T.FLGTIPOCALC, T.CODALTERADOR, ' +
       '  T.VLRMINIMO, T.DESCCUSTAGREG, T.VALPORDEPENDENTE, T.LANCAMENTOIMPOSTO, ' +
       '  T.CODTRATFISCD, T.FLGCALCVALBRUTO, TA.ACRESDECRES, T.FLGLANCAIMPOSTO, T.FLGALTERARETENCAO, T.FLGSEMPRECALCULA, TRD.FLGCALCULAIMPOSTO ';
    End;
    //Lança os impostos associados ao tipo de desembolso/recebimento
    tgSoRecDes:
    Begin
       sSqlImposto :=
       ' SELECT DISTINCT ' +
       '  T.CODTIPOCUSTAGREG, T.FLGACUMULA, T.VLRABATFIXO, T.FLGTIPOCALC, T.CODALTERADOR, ' +
       '  T.VLRMINIMO, T.DESCCUSTAGREG, T.VALPORDEPENDENTE, T.LANCAMENTOIMPOSTO, ' +
       '  T.CODTRATFISCD, T.FLGCALCVALBRUTO, TA.ACRESDECRES, T.FLGLANCAIMPOSTO,  SUM(QTOTALPORDESEMB.VALORIMPOSTO) AS VALORIMPOSTO, T.FLGALTERARETENCAO, T.FLGSEMPRECALCULA, TRD.FLGCALCULAIMPOSTO ' +
       ' FROM ' +
       '  TIPOAGRE T, TIPOALTERADOR TA, TIPRECDESXTIPAGRE TR, TIPORECEBDESEMB TRD, ' +
       SqlCalcRateio +
       ' WHERE ' +
       '  (T.CODALTERADOR = TA.CODALTERADOR(+)) AND ' +
       '  (T.CODTIPOCUSTAGREG = TR.CODTIPOCUSTAGREG) AND ' +
       '  (TR.CODTIPRECDES = TRD.CODTIPRECDES) AND ' +
       '  (TR.IDPESSOA = TRD.IDPESSOA) AND ' +
       '  (TR.RECPAG = TRD.RECPAG) AND ' +
       '  (QTOTALPORDESEMB.CODTIPRECDES(+) = TR.CODTIPRECDES) AND ' +
       '  (QTOTALPORDESEMB.CODCENTROCUSTO(+) = DECODE(TR.CODCENTROCUSTO,NULL,''@'',TR.CODCENTROCUSTO)) AND ' +
       '  (QTOTALPORDESEMB.IDPROGRAMA(+) = DECODE(TR.IDPROGRAMA,NULL,0,TR.IDPROGRAMA)) AND ' +
       '  (RTRIM(TR.CODTIPRECDES) IN (' + _CodTipRecDes + ')) AND ' +
       '  (TR.RECPAG = :RECPAG) AND ' +
       '  (TR.IDPESSOA = :IDPESSOA) AND ' +
       '  ((T.FLGASSOCIACLASFIS = ''N'') OR (FLGASSOCIACLASFIS IS NULL)) AND ' +
       '  (T.CODTIPOCUSTAGREG NOT IN ' + //Busca o TipoAgre Que não está associado ao fornecedor
       '      (SELECT ' +
       '          CODTIPOCUSTAGREG ' +
       '       FROM ' +
       '          FORCLIXAGREG ' +
       '       WHERE ' +
       '         (IDPESSOA = :IDPESSOA)  AND ' +
       '         (IDFORCLI = :IDFORCLI)  AND ' +
       '         (RECPAG = :RECPAG))) ' +
       ' GROUP BY ' +
       '  T.CODTIPOCUSTAGREG, T.FLGACUMULA, T.VLRABATFIXO, T.FLGTIPOCALC, T.CODALTERADOR, ' +
       '  T.VLRMINIMO, T.DESCCUSTAGREG, T.VALPORDEPENDENTE, T.LANCAMENTOIMPOSTO, ' +
       '  T.CODTRATFISCD, T.FLGCALCVALBRUTO, TA.ACRESDECRES, T.FLGLANCAIMPOSTO, T.FLGALTERARETENCAO, T.FLGSEMPRECALCULA, TRD.FLGCALCULAIMPOSTO ';
    End;
  End;

  With _DtmCmBackimposto.QryImposto Do
  Begin
     If Active       Then Close;
     If Prepared     Then UnPrepare;
     Sql.Text := sSqlImposto;
     Prepare;
     ParamByName('IDPESSOA').AsFloat        := Sistema.IdEmpresa;
     ParamByName('IDFORCLI').AsFloat        := FIdForCli;
     ParamByName('RECPAG').AsString         := IntegraBack.RecPag;
     ParamByName('VALORLANCADO').AsFloat    := FValorLancto;

     If FCodTipRecDes = '' Then
          ParamByName('CODDOCUMENTO').AsFloat    := FCodDocumento;

     If _TipoGetImposto = tgClasFisRecDes Then
        ParamByName('IDCLASFISCLIFOR').AsFloat := _ClasFisCliFor;

     Open;
     Result := Not IsEmpty;
  End;
End;

Function TImpostoRetido.GetFaixaImposto: Boolean;
Begin
  If _DtmCmBackimposto.QryFaixaImposto.Active       Then _DtmCmBackimposto.QryFaixaImposto.Close;
  If Not _DtmCmBackimposto.QryFaixaImposto.Prepared Then _DtmCmBackimposto.QryFaixaImposto.Prepare;

  If _ValorBase < 0 Then
    _DtmCmBackimposto.QryFaixaImposto.ParamByName('PVLRINICIALFAIXA').AsFloat  := 0
  Else
    _DtmCmBackimposto.QryFaixaImposto.ParamByName('PVLRINICIALFAIXA').AsFloat  := _ValorBase;

  _DtmCmBackimposto.QryFaixaImposto.ParamByName('PCODTIPOCUSTAGREG').AsFloat := _CodTipoCustoAgreg;
  _DtmCmBackimposto.QryFaixaImposto.Open;
  _DtmCmBackimposto.QryFaixaImposto.First;
  Result := Not _DtmCmBackimposto.QryFaixaImposto.IsEmpty;
End;

function TImpostoRetido.AutorizaLancamento:Boolean;
Begin
   //Não lança imposto se o tipo do documento <> fiscal e o fmomentolancamento <> MlBaixa
   Result := (FMomentoLancamento = MlBaixa);
   If Not Result Then
      Result := FazQuery(_DtmCmBackimposto.Qry,'SELECT ' +
                                       ' CODTIPDOC ' +
                                       'FROM ' +
                                       ' TIPODOCRECPAG ' +
                                       'WHERE ' +
                                       ' ((FLGDOCFISCAL = ''S'') OR (FLGDOCFISCAL IS NULL)) AND ' +
                                       ' (CODTIPDOC =  ' + intToStr(fCodTipoDoc) + ')');
   If _DtmCmBackimposto.Qry.Active Then _DtmCmBackimposto.Qry.Close;
End;

Procedure TImpostoRetido.Incluir;
Var
  sOperacao :String;
  bEDocFiscal :Boolean;
Begin
   bEDocFiscal := AutorizaLancamento;

   If Not _QryAcumulaImposto.Active Then _QryAcumulaImposto.Open;

   //Busca o Fornecedor associado ao portadorforma
   _IdForCli := 0;
   _IdForCliPortForma := 0;

   If fCodPortForma <> 0 Then
   Begin
     If _DtmCmBackimposto.QryPortForma.Active       Then _DtmCmBackimposto.QryPortForma.Close;
     If Not _DtmCmBackimposto.QryPortForma.Prepared Then _DtmCmBackimposto.QryPortForma.Prepare;
     _DtmCmBackimposto.QryPortForma.ParamByName('CODPORTFORMA').AsFloat := fCodPortForma;
     _DtmCmBackimposto.QryPortForma.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
     _DtmCmBackimposto.QryPortForma.open;
     _DtmCmBackimposto.QryPortForma.First;
     If Not _DtmCmBackimposto.QryPortForma.IsEmpty Then
     Begin
        _IdForCliPortForma := _DtmCmBackimposto.QryPortFormaIdForCli.AsInteger;
        _IdForCli        := _DtmCmBackimposto.QryPortFormaIdForCli.AsInteger;
        _ContaCliFor     := _DtmCmBackimposto.QryPortFormaCONTACONTABIL.AsString;
        _CCustoCliFor    := _DtmCmBackimposto.QryPortFormaCODCENTROCUSTO.AsString;
        _UnidNegocCliFor := _DtmCmBackimposto.QryPortFormaUNIDNEGOC.AsInteger;
        _SubContaCliFor  := _DtmCmBackimposto.QryPortFormaCODSUBCONTA.AsInteger;
     End;
   End;

   //Busca A Classificação Fiscal
   If (_DtmCmBackimposto.DsClasFisCliFor.DataSet as TwwQuery).Active Then (_DtmCmBackimposto.DsClasFisCliFor.DataSet as TwwQuery).Close;

   If IntegraBack.RecPag = 'P' Then
      _DtmCmBackimposto.DsClasFisCliFor.DataSet := _DtmCmBackimposto.QryClasFisPag
   Else
      _DtmCmBackimposto.DsClasFisCliFor.DataSet := _DtmCmBackimposto.QryClasFisRec;

   If Not (_DtmCmBackimposto.DsClasFisCliFor.DataSet as TwwQuery).Prepared Then (_DtmCmBackimposto.DsClasFisCliFor.DataSet as TwwQuery).Prepare;

   (_DtmCmBackimposto.DsClasFisCliFor.DataSet as TwwQuery).ParamByname('IDPESSOA').AsFloat := Sistema.idEmpresa;
   (_DtmCmBackimposto.DsClasFisCliFor.DataSet as TwwQuery).Open;
   (_DtmCmBackimposto.DsClasFisCliFor.DataSet as TwwQuery).First;

   _ClasFisCliFor := (_DtmCmBackimposto.DsClasFisCliFor.DataSet as TwwQuery).FieldByName('IDCLASFISCLIFOR').AsInteger;
   (_DtmCmBackimposto.DsClasFisCliFor.DataSet as TwwQuery).Close;

   //Abrir a QryDesenbolso - Contém os rateios do documento que está sendo lançado
   _CodTipRecDes := '';
   sOperacao     := FOperacaoDocumento;

   //Se FCodTipRecDes <> '' ... O Cálculo do imposto é uma simulação não existindo a 'figura do documento'
   If FCodTipRecDes <> '' Then
   Begin
     If _DtmCmBackimposto.QrySimulaImposto.Active Then
     Begin
        If _DtmCmBackimposto.QrySimulaImposto.UpdatesPending Then _DtmCmBackimposto.QrySimulaImposto.CancelUpdates;
        _DtmCmBackimposto.QrySimulaImposto.Close;
     End;

     _DtmCmBackimposto.QrySimulaImposto.Open;
     _DtmCmBackimposto.QrySimulaImposto.First;

     _CodTipRecDes := '''' + FCodTipRecDes + '''';
   End
   Else
   Begin
     //Loop pelos desembolsos do documento a ser incluso
     If (_DtmCmBackimposto.DsRateio.DataSet as TwwQuery).Active Then (_DtmCmBackimposto.DsRateio.DataSet as TwwQuery).Close;

     Case sOperacao[1] of
       '1','2': _DtmCmBackimposto.DsRateio.DataSet := _DtmCmBackimposto.QryRateioImposto;
       '3':     _DtmCmBackimposto.DsRateio.DataSet := _DtmCmBackimposto.QryRateioImposto3;
     End;

     If Not (_DtmCmBackimposto.DsRateio.DataSet as TwwQuery).Prepared Then (_DtmCmBackimposto.DsRateio.DataSet as TwwQuery).Prepare;

     (_DtmCmBackimposto.DsRateio.DataSet as TwwQuery).ParamByname('CODDOCUMENTO').AsFloat := FCodDocumento;
     (_DtmCmBackimposto.DsRateio.DataSet as TwwQuery).Open;
     (_DtmCmBackimposto.DsRateio.DataSet as TwwQuery).First;

     While (Not (_DtmCmBackimposto.DsRateio.DataSet as TwwQuery).Eof) Do
     Begin
         _CodTipRecDes := _CodTipRecDes + '''' + Trim((_DtmCmBackimposto.DsRateio.DataSet as TwwQuery).FieldByName('CODTIPRECDES').AsString) + ''',';
        (_DtmCmBackimposto.DsRateio.DataSet as TwwQuery).Next;
     End;

     (_DtmCmBackimposto.DsRateio.DataSet as TwwQuery).Close;
     _CodTipRecDes := Copy(_CodTipRecDes,1,Length(_CodTipRecDes)-1);
   End;

   fAlteraRetencao := false;

   If Trim(_CodTipRecDes) <> '' Then
   Begin
      //Lança os impostos associados ao Cliente/Fornecedor
      FValorAlteradores := 0;

      _TipoGetImposto := tgSoPessoa;
      If GetImposto Then
      Begin
         _iNumDependentes  := NumDependentes;

         While Not _DtmCmBackimposto.QryImposto.Eof Do
         Begin
            If GetLancaImposto And
               (bEDocFiscal And (_DtmCmBackimposto.QryImpostoFLGCALCULAIMPOSTO.AsString = 'S')) Then
            Begin
                 EfetivaLancamento;
                 If Not fAlteraRetencao Then
                    fAlteraRetencao := (_DtmCmBackimposto.QryImpostoFLGALTERARETENCAO.AsString = 'S');
            End;
            _DtmCmBackimposto.QryImposto.Next;
         End;
      End;

      //Lança os impostos associados a classificação fiscal e tipo de desembolso
       _TipoGetImposto := tgClasFisRecDes;
      If GetImposto Then
      Begin
         _iNumDependentes  := NumDependentes;

         While Not _DtmCmBackimposto.QryImposto.Eof Do
         Begin
            If GetLancaImposto And
               (bEDocFiscal And (_DtmCmBackimposto.QryImpostoFLGCALCULAIMPOSTO.AsString = 'S')) Then
            Begin
              EfetivaLancamento;
              If Not fAlteraRetencao Then
                 fAlteraRetencao := (_DtmCmBackimposto.QryImpostoFLGALTERARETENCAO.AsString = 'S');
            End;
            _DtmCmBackimposto.QryImposto.Next;
         End;
      End;

      //Lança os impostos associados ao tipo de desembolso/recebimento
      _TipoGetImposto := tgSoRecDes;
      If GetImposto Then
      Begin
         _iNumDependentes  := NumDependentes;

         While Not _DtmCmBackimposto.QryImposto.Eof Do
         Begin
            If GetLancaImposto And
               ((bEDocFiscal And (_DtmCmBackimposto.QryImpostoFLGCALCULAIMPOSTO.AsString = 'S')) Or (_DtmCmBackimposto.QryImpostoFLGSEMPRECALCULA.AsString = 'S')) Then
            Begin
              EfetivaLancamento;
              If Not fAlteraRetencao Then
                 fAlteraRetencao := (_DtmCmBackimposto.QryImpostoFLGALTERARETENCAO.AsString = 'S');
            End;
            _DtmCmBackimposto.QryImposto.Next;
         End;
      End;
   End;

   FCodTipRecDes := '';
   FCodCentroCusto := '';
   FPrograma := 0;
   fCodPortForma := 0;

   FechaQry([_DtmCmBackimposto.QryFaixaImposto,_DtmCmBackimposto.QryBaseMes,_DtmCmBackimposto.QryImposto,_DtmCmBackimposto.QryAtuImpostoRetido,_DtmCmBackimposto.QryImpParcEngob],False,False);

   fNumLote       := 0.00;
   fNumLoteManual := 0.00;
   fTipoInclusao  := TiLancaImposto;
End;

Procedure TImpostoRetido.EfetivaLancamento;
Var
  wAno,wMes,wDia :Word;
  sDataMesAno :String;
  _DevolucaoImposto :Boolean;
Begin
   _CodTipoCustoAgreg := _DtmCmBackimposto.QryImpostoCODTIPOCUSTAGREG.AsInteger;
   _AcumulaMes        := (_DtmCmBackimposto.QryImpostoFLGACUMULA.AsString = 'M');
   _DiminuiFaixa      := (_DtmCmBackimposto.QryImpostoFLGTIPOCALC.AsString = '1');
   _ValorBase         := 0;
   _ValorRetido       := 0;

   if _AcumulaMes Then
   Begin
     If _DtmCmBackimposto.QryBaseMes.Active       Then _DtmCmBackimposto.QryBaseMes.Close;
     If Not _DtmCmBackimposto.QryBaseMes.Prepared Then _DtmCmBackimposto.QryBaseMes.Prepare;
     _DtmCmBackimposto.QryBaseMes.ParamByName('PCODTIPOCUSTAGREG').AsFloat := _CodTipoCustoAgreg;
     _DtmCmBackimposto.QryBaseMes.ParamByName('PIDFORCLI').AsFloat         := FIdForCli;
     _DtmCmBackimposto.QryBaseMes.ParamByName('PIDPESSOA').AsFloat         := Sistema.IdEmpresa;
     _DtmCmBackimposto.QryBaseMes.ParamByName('PRECPAG').AsString          := Integraback.RecPag;

     DecodeDate(_DataRetencao,wAno,wMes,wDia);
     If wMes < 10 Then
        sDataMesAno := '0' + IntToStr(wMes) + '/' + IntToStr(wAno)
     Else
        sDataMesAno := IntToStr(wMes) + '/' + IntToStr(wAno);

     _DtmCmBackimposto.QryBaseMes.ParamByName('PDATARETENCAO').AsString    := sDataMesAno;
     _DtmCmBackimposto.QryBaseMes.Open;
     _DtmCmBackimposto.QryBaseMes.First;

     If Not _DtmCmBackimposto.QryBaseMes.IsEmpty Then
     Begin
       _ValorBase         := _DtmCmBackimposto.QryBaseMesVALORBASE.AsFloat;
       _ValorRetido       := _DtmCmBackimposto.QryBaseMesVALORRETIDO.AsFloat;
     End;
   End;

   If TipoInclusao = TiSoCalculaValor Then
   Begin
      _ValorBase := _ValorBase + fValorBaseCalculaValor;
      _ValorRetido := _ValorRetido + fValorRetidoCalculaValor;
   End;

   _ValorBase := _ValorBase + _ValorLancto;
   _ValorBase := _ValorBase -
                 _DtmCmBackimposto.QryImpostoVLRABATFIXO.AsFloat -
                 (_DtmCmBackimposto.QryImpostoVALPORDEPENDENTE.AsFloat * _iNumDependentes) -
                 _VlrInss -
                 _VlrPensao;

   If GetFaixaImposto Then
   Begin
      _ValorBase := _ValorBase - _DtmCmBackimposto.QryFaixaImpostoVLRABATVALOR.AsFloat;

      If _DiminuiFaixa Then
         _ValorBase := _ValorBase - _DtmCmBackimposto.QryFaixaImpostoVLRINICIALFAIXA.AsFloat;

      _ValorImposto := _ValorBase * (_DtmCmBackimposto.QryFaixaImpostoPERCCUSTAGREG.AsFloat/100);

      _ValorImposto := _ValorImposto * (_DtmCmBackimposto.QryFaixaImpostoPERCBASE.AsFloat/100);

      _ValorImposto := _ValorImposto - _DtmCmBackimposto.QryFaixaImpostoVLRABATCALC.AsFloat +
                                       _DtmCmBackimposto.QryFaixaImpostoVLRFIXO.AsFloat;

      _ValorImposto := _ValorImposto - _ValorRetido;

      _NumLancto    := 0;

      If ((fDebCre = 'D') And (IntegraBack.RecPag = 'P')) Or
         ((fDebCre = 'C') And (IntegraBack.RecPag = 'R')) Then
      Begin
         _Fator := -1;
         If _DtmCmBackimposto.QryImpostoACRESDECRES.AsString = 'D' Then
            _DebCre := 'C'
         Else
            _DebCre := 'D';

         _DevolucaoImposto := (_ValorImposto > 0);
      End
      Else
      Begin
         _DebCre := _DtmCmBackimposto.QryImpostoACRESDECRES.AsString;
         _Fator := 1;
         _DevolucaoImposto := False;
      End;

      If _DatadoLancto = 'E' Then
         _DataLancto := FDataLancto
      Else
         _DataLancto := _DataRetencao;

      //INCLUSAO DO _DevolucaoImposto E EXCLUSAO DO VALORIMPOSTO * _FATOR          

      //Lança os alteradores se existir um documento de origem (FCodTipRecDes = '')
      If (_DevolucaoImposto) Or
         ( (_ValorImposto ) >= _DtmCmBackimposto.QryImpostoVLRMINIMO.AsFloat) Then
      Begin
        If (FCodTipRecDes = '') Then
        Begin
           If (Not _DtmCmBackimposto.QryImpostoCODALTERADOR.IsNull) Then
           Begin

              If ((_DebCre = 'D') And (IntegraBack.RecPag = 'P')) Or
                 ((_DebCre = 'C') And (IntegraBack.RecPag = 'R')) Then
                 FValorAlteradores   := FValorAlteradores - (_ValorImposto * _Fator )
              else
                 FValorAlteradores   := FValorAlteradores + (_ValorImposto * _Fator );

              If (fTipoInclusao = TiLancaImposto) Then
              Begin
                 _liPlanilha             := 0;
                 Documento.Operacao      := '4';
                 Documento.CodDocumento  := FCodDocumento;
                 Documento.NumLancto     := Documento.GerarNumLancto(nil,Documento.CodDocumento);
                 _NumLancto              := Documento.NumLancto;

                 Documento.Valorliquido := FValorLiquido;

                 If (Trim(_DebCre) <> 'C') And (Trim(_DebCre) <> 'D') Then
                    Raise Exception.Create('DebCre inválido para o CodDocumento: ' + IntToStr(Documento.CodDocumento) + ' e Alterador: ' + _DtmCmBackimposto.QryImpostoCODALTERADOR.AsString);

                 Documento.CriarLanctoDoc(_DtmCmBackimposto.Qry,
                                          Documento.CodDocumento,
                                          Documento.NumLancto,
                                          _DtmCmBackimposto.QryImpostoCODALTERADOR.AsInteger,
                                          _liPlanilha,
                                          DateToStr(_DataLancto),
                                          _ValorImposto,
                                          0,-1,
                                          _DebCre,
                                          Documento.Operacao,
                                          _DtmCmBackimposto.QryImpostoDESCCUSTAGREG.AsString,
                                          Sistema.idUsuario, True, -1, '');
              End;
           End;
        End;
      End
      Else
        _ValorImposto := 0;

      //Lança Imposto Como Novo Documentos
      If (_DtmCmBackimposto.QryImpostoCODTRATFISCD.AsString = 'B') And
         (( (_ValorImposto ) > 0) or _DevolucaoImposto) And (Trim(FCodTipRecDes) = '') Then
      Begin
         //Busca Dados para lançamento de documento
         if (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).Active Then (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).Close;
         If Not (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).Prepared Then (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).Prepare;
         (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).ParamByname('CODTIPOCUSTAGREG').AsFloat := _DtmCmBackimposto.QryImpostoCODTIPOCUSTAGREG.AsFloat;
         (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).ParamByname('IDPESSOA').AsFloat         := Sistema.idEmpresa;
         (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).Open;
         (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).First;

         Try
           If (fTipoInclusao = TiLancaImposto) Then
              //Caso a retenção seja proveniente de um lote acumla o valor para do lançamento do documento para ser lançado em EfetivaNovoDocumento
              If (fNumLote = 0.00) Then LancaDocumento;
         finally
           (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).Close;
         end;
      End;

      //Lança os Imposto sse existir um documento de origem (FCodTipRecDes = '')
      If ((_AcumulaMes) Or (( (_ValorImposto ) > 0) or _DevolucaoImposto)) And
         (FCodTipRecDes = '') And (fTipoInclusao = TiLancaImposto) Then
      Begin
         //Lança Impostos para tratamentos fiscais diferentes de 'B' - "Lança Imposto Como Novo Documento" ou
         //quando é caracterizado retenção na baixa de lote.
         If (fNumLote = 0.00) Or
            (_DtmCmBackimposto.QryImpostoCODTRATFISCD.AsString <> 'B') Then
         Begin
            If _DtmCmBackimposto.QryAtuImpostoRetido.Active       Then _DtmCmBackimposto.QryAtuImpostoRetido.Close;
            If Not _DtmCmBackimposto.QryAtuImpostoRetido.Prepared Then _DtmCmBackimposto.QryAtuImpostoRetido.Prepare;

            _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('PIDIMPOSTORETIDO').AsFloat := LeultRegistro(nil,'IMPOSTORETIDO');
            _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('PDATARETENCAO').AsDateTime := _DataRetencao;
            _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('PCODTIPOCUSTAGREG').AsFloat := _CodTipoCustoAgreg;
            _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('PVLRBASE').AsFloat := _ValorLancto * _Fator;
            _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('PVLRRETIDO').AsFloat := _ValorImposto * _Fator;
            _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('PIDFORCLI').AsFloat := FIdForCli;
            _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
            _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('PCODDOCUMENTO').AsFloat := FCodDocumento;
            _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('PRECPAG').AsString := IntegraBack.RecPag;

            If _CodNewDoc <= 0 Then
               _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('CODDOCLANCADO').Clear
            Else
               _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('CODDOCLANCADO').AsFloat := _CodNewDoc;

            If _NumLancto = 0 Then
               _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('PNUMLANCTO').Clear
            Else
               _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('PNUMLANCTO').AsFloat := _NumLancto;

            _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('PNUMLANCTOORIGEM').AsFloat := FNumLancto;

            If fNumLote > 0 Then
               _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('NUMLOTE').AsFloat := fNumLote
            Else
               _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('NUMLOTE').Clear;

            If fNumLoteManual > 0 Then
               _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('NUMLOTEMANUAL').AsFloat := fNumLoteManual
            Else
               _DtmCmBackimposto.QryAtuImpostoRetido.ParamByName('NUMLOTEMANUAL').Clear;

            _DtmCmBackimposto.QryAtuImpostoRetido.ExecSql;
         End
         Else
            //Acumula o valor do lançamento na IMPOSTORETIDO para ser lançado em EfetivaNovoDocumento
            AcumulaLancaImposto;
      End;

      _CodNewDoc := 0;

      //Enche a query de simulação do lançamento dos impostos sse não existir um documento de origem (FCodTipRecDes <> '')
      If FCodTipRecDes <> '' Then
      Begin
        _DtmCmBackimposto.QrySimulaImposto.Append;
        _DtmCmBackimposto.QrySimulaImpostoIDIMPOSTO.AsFloat    := _DtmCmBackimposto.QryImpostoCODTIPOCUSTAGREG.AsFloat;

        _DtmCmBackimposto.QrySimulaImpostoVALORIMPOSTO.AsFloat := _ValorImposto;

        _DtmCmBackimposto.QrySimulaImpostoPERCIMPOSTO.AsFloat  := _DtmCmBackimposto.QryFaixaImpostoPERCCUSTAGREG.AsFloat;
        _DtmCmBackimposto.QrySimulaImpostoVALORBASE.AsFloat    := _ValorLancto*(_DtmCmBackimposto.QryFaixaImpostoPERCBASE.AsFloat/100);
        _DtmCmBackimposto.QrySimulaImposto.Post;
      End;
   End;
End;


Procedure TImpostoRetido.Alterar;
Var
  sDecSeparator: Char;
Begin
   sDecSeparator := DecimalSeparator;
   DecimalSeparator := '.';

   If _DtmCmBackimposto.QryImpostoPorDoc.Active Then _DtmCmBackimposto.QryImpostoPorDoc.Close;
   If Not _DtmCmBackimposto.QryImpostoPorDoc.Prepared Then _DtmCmBackimposto.QryImpostoPorDoc.Prepare;
   _DtmCmBackimposto.QryImpostoPorDoc.ParamByName('CODDOCUMENTO').AsFloat := FCodDocumento;
   _DtmCmBackimposto.QryImpostoPorDoc.Open;
   _DtmCmBackimposto.QryImpostoPorDoc.First;

   If FNumLancto = 0 Then
   Begin
      If FIdImpostoRetido <> 0 Then
      Begin
        _DtmCmBackimposto.QryImpostoPorDoc.Filter   := 'IDIMPOSTORETIDO = ' + IntToStr(FIdImpostoRetido);
        _DtmCmBackimposto.QryImpostoPorDoc.Filtered := True;
      End
      Else
        _DtmCmBackimposto.QryImpostoPorDoc.Filtered := False
   End
   Else
   Begin
      _DtmCmBackimposto.QryImpostoPorDoc.Filter   := 'NUMLANCTO = ' + IntToStr(FNumLancto);
      _DtmCmBackimposto.QryImpostoPorDoc.Filtered := True;
   End;

   _DtmCmBackimposto.QryImpostoPorDoc.First;
   While Not _DtmCmBackimposto.QryImpostoPorDoc.Eof Do
   Begin
      _CalculaSobreValorBruto := ((_DtmCmBackimposto.QryImpostoPorDocFLGCALCVALBRUTO.AsString <> 'N') Or (FValorLiquido = 0));

      if _CalculaSobreValorBruto Then
         _ValorLancto := FValorLancto
      Else
         _ValorLancto := FValorLiquido;

         _Fator := 1;
      

      If FNumLancto = 0 Then
      Begin
         If FIdImpostoRetido <> 0 Then
            ExecutarQuery(_DtmCmBackimposto.qry,'UPDATE IMPOSTORETIDO SET VLRBASE = ' + FloatToStr(_ValorLancto * _Fator) +
                                        ' WHERE (IMPOSTORETIDO = ' + IntToStr(FIdImpostoRetido) + ')')
         Else
            ExecutarQuery(_DtmCmBackimposto.qry,'UPDATE IMPOSTORETIDO SET VLRBASE = ' + FloatToStr(_ValorLancto * _Fator) +
                                        ' WHERE (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ') AND ' +
                                        '      (CODTIPOCUSTAGREG = ' + FloatToStr(_DtmCmBackimposto.QryImpostoPorDocCODTIPOCUSTAGREG.AsFloat) + ')');
      End
      Else
         ExecutarQuery(_DtmCmBackimposto.qry,'UPDATE IMPOSTORETIDO SET VLRRETIDO = ' + FloatToStr(_ValorLancto * _Fator) +
                                        ' WHERE (NUMLANCTO = ' + IntToStr(FNumLancto) + ') AND ' +
                                              ' (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ')');

      _DtmCmBackimposto.QryImpostoPorDoc.Next;
   End;

   DecimalSeparator := sDecSeparator;
   FIdImpostoRetido := 0;
End;

Procedure TImpostoRetido.Excluir;
Var
  sSqlSelect, sSqlDelete :String;
Begin
   //Exclusão de lançamentos de imposto provenientes de baixa
   If (FNumLancto = 0) And (FNumLanctoOrigem = 0) And (fTipoExclusao = teSoBaixa) Then
   Begin
      If fNumLoteManual <> 0 Then
      Begin
         sSqlSelect := 'SELECT DISTINCT CODDOCUMENTO, CODDOCLANCADO, NUMLANCTO FROM IMPOSTORETIDO WHERE NUMLOTEMANUAL = ' + FloatToStr(fNumLoteManual);
         sSqlDelete := 'DELETE FROM IMPOSTORETIDO WHERE NUMLOTEMANUAL = ' + FloatToStr(fNumLoteManual);
      End
      Else
        If fNumLote <> 0 Then
        Begin
           sSqlSelect := 'SELECT DISTINCT CODDOCUMENTO, CODDOCLANCADO, NUMLANCTO FROM IMPOSTORETIDO WHERE NUMLOTE = ' + FloatToStr(fNumLote);
           sSqlDelete := 'DELETE FROM IMPOSTORETIDO WHERE NUMLOTE = ' + FloatToStr(fNumLote);
        End
        Else
           Exit;
           //Raise Exception.Create('Erro ao excluir Imposto Proveniente de Baixa de Documento: O Número do lote está zerado');

      If _DtmCmBackimposto.QryAux.Active Then _DtmCmBackimposto.QryAux.Close;
      _DtmCmBackimposto.QryAux.Sql.Text := sSqlSelect;
      _DtmCmBackimposto.QryAux.Open;

      If _DtmCmBackimposto.qry.Active Then _DtmCmBackimposto.qry.Close;
      _DtmCmBackimposto.qry.Sql.Text := sSqlDelete;
      _DtmCmBackimposto.qry.ExecSQL;

      _DtmCmBackimposto.QryAux.First;
      While Not _DtmCmBackimposto.QryAux.Eof Do
      Begin

        if _DtmCmBackimposto.QryAux.FieldByName('CODDOCLANCADO').AsInteger > 0 then
        begin
           _CodNewDoc := _DtmCmBackimposto.QryAux.FieldByName('CODDOCLANCADO').AsInteger;
           ExcluiDocLancados;
        end
        else
        begin
           //Verifica se o lançamento de origem é um alterador e procede com a exclusão do mesmo
           _CodNewDoc := _DtmCmBackimposto.QryAux.FieldByName('CODDOCUMENTO').AsInteger;
           fNumLancto := _DtmCmBackimposto.QryAux.FieldByName('NUMLANCTO').AsInteger;
           ExcluiAlteradoresLancados;
           //***********************************************************************************
        end;

        _DtmCmBackimposto.QryAux.Next;
      End;
   End
   Else
   Begin
      //Exclusão de todas as retenções associadas a o documento
      If FNumLancto = 0 Then
      Begin
         If FazQuery(_DtmCmBackimposto.QryAux,'SELECT CODDOCUMENTO, NUMLANCTO, CODDOCLANCADO FROM IMPOSTORETIDO WHERE ' +
                                      ' (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ')') Then
         Begin
           ExecutarQuery(_DtmCmBackimposto.qry,'DELETE FROM IMPOSTORETIDO WHERE ' +
                                       ' (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ')');

            While Not _DtmCmBackimposto.QryAux.Eof Do
            Begin
              FNumLancto := _DtmCmBackimposto.QryAux.FieldByName('NUMLANCTO').AsInteger;
              _CodNewDoc := _DtmCmBackimposto.QryAux.FieldByName('CODDOCLANCADO').AsInteger;

              ExcluiDocLancados;

              _CodNewDoc := _DtmCmBackimposto.QryAux.FieldByName('CODDOCUMENTO').AsInteger;
              fNumLancto := _DtmCmBackimposto.QryAux.FieldByName('NUMLANCTO').AsInteger;
              ExcluiAlteradoresLancados;

              _DtmCmBackimposto.QryAux.Next;
            End;
         End;
      End
      Else
      Begin
         //Exclui diversos tipo de retenção para o lançamento de origem
         If fNumLanctoOrigem <> 0 Then
         Begin

           Case fTipoExclusao of
             teAll: //Exclui todos as retenções para o lançamento de origem
             Begin
                sSqlSelect := 'SELECT CODDOCUMENTO, NUMLANCTO, CODDOCLANCADO FROM IMPOSTORETIDO WHERE (NUMLANCTOORIGEM = ' + IntToStr(fNumLanctoOrigem) + ')';
                sSqlDelete := 'DELETE FROM IMPOSTORETIDO WHERE (NUMLANCTOORIGEM = ' + IntToStr(fNumLanctoOrigem) + ')';
             End;
             teSoBaixa: //Exclui somente as retenções na baixa do lançamento de origem
             Begin
                sSqlSelect := 'SELECT I.CODDOCUMENTO, I.NUMLANCTO, I.CODDOCLANCADO FROM IMPOSTORETIDO I, TIPOAGRE T WHERE (I.NUMLANCTOORIGEM = ' + IntToStr(fNumLanctoOrigem) + ') AND (T.FLGLANCAIMPOSTO = ''B'') AND (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG)';
                sSqlDelete := 'DELETE FROM IMPOSTORETIDO WHERE (NUMLANCTOORIGEM = ' + IntToStr(fNumLanctoOrigem) + ') AND (CODTIPOCUSTAGREG IN (SELECT CODTIPOCUSTAGREG FROM TIPOAGRE WHERE (FLGLANCAIMPOSTO = ''B'')))';
             End;
             teSoLancamento: //Exclui somente as retenções no lançamento do lançamento de origem
             Begin
                sSqlSelect := 'SELECT I.CODDOCUMENTO, I.NUMLANCTO, I.CODDOCLANCADO FROM IMPOSTORETIDO I, TIPOAGRE T WHERE (I.NUMLANCTOORIGEM = ' + IntToStr(fNumLanctoOrigem) + ') AND ((T.FLGLANCAIMPOSTO <> ''B'') OR (T.FLGLANCAIMPOSTO IS NULL)) AND (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG)';
                sSqlDelete := 'DELETE FROM IMPOSTORETIDO WHERE (NUMLANCTOORIGEM = ' + IntToStr(fNumLanctoOrigem) + ') AND (CODTIPOCUSTAGREG IN (SELECT CODTIPOCUSTAGREG FROM TIPOAGRE WHERE (FLGLANCAIMPOSTO <> ''B'') OR (FLGLANCAIMPOSTO IS NULL)))';
             End;
           End;

           If FazQuery(_DtmCmBackimposto.QryAux,sSqlSelect) Then
           Begin
              ExecutarQuery(_DtmCmBackimposto.qry,sSqlDelete);

              While Not _DtmCmBackimposto.QryAux.Eof Do
              Begin
                FNumLancto := _DtmCmBackimposto.QryAux.FieldByName('NUMLANCTO').AsInteger;
                _CodNewDoc := _DtmCmBackimposto.QryAux.FieldByName('CODDOCLANCADO').AsInteger;
                ExcluiDocLancados;

                 //Alteração Nova - Verificar se os alteradores de origem serão excluídos
                FNumLancto := _DtmCmBackimposto.QryAux.FieldByName('NUMLANCTO').AsInteger;
                _CodNewDoc := _DtmCmBackimposto.QryAux.FieldByName('CODDOCUMENTO').AsInteger;
                ExcluiAlteradoresLancados;

                _DtmCmBackimposto.QryAux.Next;
              End;
           End;

           //Exclui Documentos lançados provenientes de lotes
           if (fTipoExclusao = teSoBaixa) and
             (_CodNewDoc = 0) and (fNumLote <> 0.00) then
           begin
             sSqlSelect := 'SELECT I.CODDOCUMENTO, I.NUMLANCTO, I.CODDOCLANCADO FROM IMPOSTORETIDO I, TIPOAGRE T WHERE (I.NUMLOTE = ' + FloatToStr(fNumLote) + ') AND (T.FLGLANCAIMPOSTO = ''B'') AND (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG)';
             sSqlDelete := 'DELETE FROM IMPOSTORETIDO WHERE (NUMLOTE = ' + FloatToStr(fNumLote) + ') AND (CODTIPOCUSTAGREG IN (SELECT CODTIPOCUSTAGREG FROM TIPOAGRE WHERE (FLGLANCAIMPOSTO = ''B'')))';

             if FazQuery(_DtmCmBackimposto.QryAux, sSqlSelect) then
             begin
               ExecutarQuery(_DtmCmBackimposto.Qry, sSqlDelete);

               while not _DtmCmBackimposto.QryAux.EOF do
               begin
                 FNumLancto := _DtmCmBackimposto.QryAux.FieldByName('NUMLANCTO').AsInteger;
                 _CodNewDoc := _DtmCmBackimposto.QryAux.FieldByName('CODDOCLANCADO').AsInteger;
                 ExcluiDocLancados;

                 //Alteração Nova - Verificar se os alteradores de origem serão excluídos
                 FNumLancto := _DtmCmBackimposto.QryAux.FieldByName('NUMLANCTO').AsInteger;
                 _CodNewDoc := _DtmCmBackimposto.QryAux.FieldByName('CODDOCUMENTO').AsInteger;
                 ExcluiAlteradoresLancados;

                 _DtmCmBackimposto.QryAux.Next;
               end;
             end;
           end;
         End
         Else
         Begin
           //Exclui as retenções para o lançamento específico
           FazQuery(_DtmCmBackimposto.QryAux,'SELECT CODDOCUMENTO, CODDOCLANCADO, NUMLANCTO FROM IMPOSTORETIDO WHERE ' +
                                  ' (NUMLANCTO = ' + IntToStr(FNumLancto) + ') AND ' +
                                  ' (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ')');

           ExecutarQuery(_DtmCmBackimposto.qry,'DELETE FROM IMPOSTORETIDO WHERE ' +
                                          ' (NUMLANCTO = ' + IntToStr(FNumLancto) + ') AND ' +
                                          ' (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ')');

           If Not (_DtmCmBackimposto.QryAux.IsEmpty) Then
           Begin
              _CodNewDoc := _DtmCmBackimposto.QryAux.FieldByName('CODDOCLANCADO').AsInteger;
              ExcluiDocLancados;              

              _CodNewDoc := _DtmCmBackimposto.QryAux.FieldByName('CODDOCUMENTO').AsInteger;
              fNumLancto := _DtmCmBackimposto.QryAux.FieldByName('NUMLANCTO').AsInteger;
              ExcluiAlteradoresLancados;
           End;
         End;
      End;
   End;

   fNumLanctoOrigem := 0;
   fNumLancto := 0;
   fNumLote := 0;
   fNumLoteManual := 0;
   _CodNewDoc       := 0;
   fTipoExclusao    := teAll;
End;

Procedure TImpostoRetido.ExcluiAlteradoresLancados;
Var
   sSql, sDataLancto: String;
   iPlnCodigo: LongInt;
   bEstorna: Boolean;
Begin
  If fExcluiAlteradores Then
  Begin
     If FazQuery(_DtmCmBackimposto.qry,'SELECT PLNCODIGO,DATALANCTO FROM LANCTODOCUM WHERE ' +
                               ' (NUMLANCTO = ' + IntToStr(FNumLancto) + ') AND ' +
                               ' (CODDOCUMENTO = ' + IntToStr(_CodNewDoc) + ') AND ESTORNO IS NULL AND OPERACAO = ''4''') Then
     Begin
           sDataLancto := _DtmCmBackimposto.qry.FieldByName('DATALANCTO').AsString;
           iPlnCodigo := _DtmCmBackimposto.qry.FieldByName('PLNCODIGO').AsInteger;

           sSql := 'DELETE FROM LANCTODOCUM ' +
                    'WHERE (CODDOCUMENTO = '+ IntToStr(_CodNewDoc) + ') AND ' +
                    ' (NUMLANCTO = ' + IntToStr(FNumLancto) + ') AND ' +
                    '( OPERACAO = ''4'')';
           ExecutarQuery(_DtmCmBackimposto.qry,sSql);

           bEstorna := False;
                If (iPlnCodigo > 0) And
                   (Not Documento.EstornaExcluiContab(iPlnCodigo, sDataLancto, bEstorna, True)) Then Abort;
     End;
  End;
End;

Procedure TImpostoRetido.AlteraNumLancOrigem(iNumLancOld, iNumLancNew :LongInt);
Begin
  If _DtmCmBackimposto.QryAltNumLanc.Active       Then _DtmCmBackimposto.QryAltNumLanc.Close;
  If Not _DtmCmBackimposto.QryAltNumLanc.Prepared Then _DtmCmBackimposto.QryAltNumLanc.Prepare;
  _DtmCmBackimposto.QryAltNumLanc.ParamByName('NEWNUMLANCTOORIGEM').AsFloat := iNumLancNew;
  _DtmCmBackimposto.QryAltNumLanc.ParamByName('NUMLANCTOORIGEM').AsFloat    := iNumLancOld;
  _DtmCmBackimposto.QryAltNumLanc.ExecSql;
End;

Procedure TImpostoRetido.LancaDocumento;
Var
  iCodLancCAPCAR, iNumLancto, iCodDoCumento, ifSubConta, ifPlano, iPlnCodigo :LongInt;
  sCompl, sfPlaConta, sfCentroCusto, sDebCre, sHistCompl :String;
  fNumDocumento, rValorTotalRateio, rSumrValorPorRateio, rValorPorRateio:Double;
  bexiste :boolean;
  ssubcontad, sunidnegd, scodcemtcustd, splacontad, ssubcontac, sunidnegc,
  scodcemtcustc, splacontac, sMens :String;
  liExercicio, liPeriodo, liEmpresa, iContReg :LongInt;
  sHistorico, sHisto1, sHisto2, sHisto3, sHisto4, sHisto5, sComplHst :String;
  dDataLanctoDocImposto :TDateTime;

  Function GetHistNumDocumento: String;
  Begin
     With TwwQuery.Create(nil) Do
       Try
          DataBaseName := 'BaseDados';
          Sql.Text :=  ' SELECT ' +
                       '   D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL ' +
                       ' FROM  ' +
                       '   DOCUMENTO D, PESSOA P WHERE D.IDFORCLI = P.IDPESSOA AND D.CODDOCUMENTO = ' + FloatToStr(FCodDocumento);
          Open;

          If IsEmpty Then
             Result := ''
          Else
             Result := ' Ref Doc Nº ' + Trim(Fields[0].AsString + ' ' + Fields[1].AsString) + ' ' + Fields[2].AsString;
       finally
          free;
       End;
  End;

  procedure LancaContabNovoDocumento(rValorLancto: Double; sUnidNegDdLancto, sUnidNegCLancto: String; iPlanoLancto, iPatrocinadoraLancto: Integer; bJundaLancto: Boolean);
  Begin
     If (IntegraBack.Contabilidade = 'S') Then
     Begin
         iPlnCodigo:= LANCACONTAB(True,
                                 'BASEDADOS',
                                 DateToStr(_DataLancto),
                                 IntToStr(Sistema.IdModulo),
                                 '0',
                                 'D',
                                 '','','','','','','','','','',
                                 FloatToStr(fNumDocumento),
                                 sHisto1,
                                 sHisto2,
                                 sHisto3,
                                 sHisto4,
                                 sHisto5,
                                 '03',
                                 scodcemtcustd,
                                 splacontad,
                                 '',
                                 '',
                                 liExercicio,
                                 liPeriodo,
                                 Sistema.IdEmpresa,
                                 Sistema.IdUsuario,
                                 IntegraBack.Plano,
                                 rValorLancto,
                                 0,0,0,0,0,0,0,0,
                                 sUnidNegDdLancto,
                                 bJundaLancto,
                                 0,
                                 0,
                                 ssubcontad,
                                 '','','',
                                 iPlnCodigo,
                                 sMens,
                                 IntegraBack.MascaraPlano,
                                 True,
                                 0,
                                 iPlanoLancto,
                                 iPatrocinadoraLancto,
                                 (((iPlanoLancto > 0)  And (iPatrocinadoraLancto > 0)) AND Sistema.UsaPlanoPatro));

         If iPlnCodigo < 0 Then EDataBaseError.Create(sMens);

         iPlnCodigo:=LANCACONTAB(True,
                                 'BASEDADOS',
                                 DateToStr(_DataLancto),
                                 IntToStr(Sistema.IdModulo),
                                 '1',
                                 'C',
                                 '','','','','','','','','','',
                                 FloatToStr(fNumDocumento),
                                 sHisto1,
                                 sHisto2,
                                 sHisto3,
                                 sHisto4,
                                 sHisto5,
                                 '03',
                                 '',
                                 '',
                                 scodcemtcustC,
                                 splacontaC,
                                 liExercicio,
                                 liPeriodo,
                                 Sistema.IdEmpresa,
                                 Sistema.IdUsuario,
                                 IntegraBack.Plano,
                                 rValorLancto,
                                 0,0,0,0,0,0,0,0,
                                 sUnidNegCLancto,
                                 bJundaLancto,
                                 0,
                                 0,
                                 '',
                                 ssubcontaC,'','',
                                 iPlnCodigo,
                                 sMens,
                                 IntegraBack.MascaraPlano,
                                 True,
                                 0,
                                 iPlanoLancto,
                                 iPatrocinadoraLancto,
                                 (((iPlanoLancto > 0)  And (iPatrocinadoraLancto > 0)) AND Sistema.UsaPlanoPatro));

         If iPlnCodigo < 0 Then EDataBaseError.Create(sMens);
     End;
  End;

Begin
  sCompl        := '';
  iCodDoCumento := 0;
  ifSubConta    := 0;
  ifPlano       := 0;
  sfPlaConta    := '';
  sfCentroCusto := '';
  fNumDocumento := 0;
  bexiste       := True;

  _IdForCli := _IdForCliPortForma;

  If (_IdForCli = 0) Then
  Begin
     _IdForCli        := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('IDFORCLI').AsInteger;
     _ContaCliFor     := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CONTACLIFOR').AsString;
     _CCustoCliFor    := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CCUSTOCLIFOR').AsString;
     _UnidNegocCliFor := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('UNIDNEGOCCLIFOR').AsInteger;
     _SubContaCliFor  := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('SUBCONTACLIFOR').AsInteger;
  End;

  If _IdForCli <> 0 Then
  Begin
     While bexiste do
     begin
      fNumDocumento := leultRegistro(nil,'NUMDOCIMPOSTO');
      bexiste       := Documento.ValidaNumDoc(_DtmCmBackimposto.Qry,
                                      IntegraBack.RecPag,
                                      (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('IDFORCLI').AsInteger,
                                      fNumDocumento,
                                      sCompl,
                                      iCodDoCumento,
                                      ifSubConta,
                                      ifPlano,
                                      sfPlaConta,
                                      sfCentroCusto);
     End;

     //Tratamento das datas de lançamento do documento associado ao imposto
     If fNumLote = 0.00 Then
        dDataLanctoDocImposto := _DataLancto
     Else
        dDataLanctoDocImposto := GetDataLancDocImposto(_DataLancto);

     iCodLancCAPCAR := _DocImposto.GetCodigo(nil);
     _CodNewDoc     := iCodLancCAPCAR;

     _DocImposto.Inserir(_DtmCmBackimposto.Qry,
                         iCodLancCAPCAR,
                         IntToStr(Sistema.IdModulo),
                         InttoStr(IntegraBack.Plano),
                         _ContaCliFor, //Add To Qry
                         _CCustoCliFor, //Add To Qry
                         -1,
                         _UnidNegocCliFor, //Add To Qry
                         Sistema.idEmpresa,
                         _IdForCli,
                         (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODTIPDOC').AsInteger,
                         -1 ,
                         IntegraBack.RecPag,
                         fNumDocumento,
                         sCompl,
                         DateToStr(_DataLancto),
                         DateToStr(dDataLanctoDocImposto),
                         DateToStr(dDataLanctoDocImposto),
                         '0',
                         -1,
                         '2',
                         Sistema.IdUsuario,
                         _SubContaCliFor, //Add To Qry
                         -1,
                         '',
                         '',
                         False,
                         -1,
                         -1,
                         -1);

     //Contabilização do Documento Gerado no imposto: D - TIPO AGRE C - FORNECEDOR
     {
       Alteração no lançamento de documento associado a imposto para marcar o
       documento como 'Autorizado para emissão': FLGCONFIRMARECPAG
     }
     If (fNumLote <> 0.00) And
        (Not ExecutarQuery(_DtmCmBackimposto.qry,'UPDATE DOCUMENTO SET FLGCONFIRMARECPAG = ''S'' WHERE CODDOCUMENTO = ' + IntToStr(iCodLancCAPCAR))) Then
        TImpostoRetidoError.Create('Não foi possível autorizar documento resultante de imposto para emissão');

     iPlnCodigo:= 0;

     // Inicializa Parametros contabeis se o sistema estiver integrado com a mesma
     If (IntegraBack.Contabilidade = 'S') Then
     Begin
        sDebCre := _DocImposto.BuscaDebCre((_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODTIPDOC').AsInteger);

        If (sDebCre = 'C') Then
        Begin
          ssubcontad    := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODSUBCONTACONTAB').AsString;
          sunidnegd     := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('UNIDNEGOCCONTAB').AsString;
          scodcemtcustd := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODCENTROCUSTO').AsString;
          splacontad    := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('PLACONTA').AsString;
          ssubcontac    := IntToStr(_SubContaCliFor);

          If _UnidNegocCliFor = 0 Then
            sunidnegc     := ''
          Else
            sunidnegc     := IntToStr(_UnidNegocCliFor);

          scodcemtcustc := _CCustoCliFor;
          splacontac    := _ContaCliFor;
        End
        Else
        Begin
          ssubcontac    := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODSUBCONTACONTAB').AsString;
          sunidnegc     := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('UNIDNEGOCCONTAB').AsString;
          scodcemtcustc := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODCENTROCUSTO').AsString;
          splacontac    := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('PLACONTA').AsString;
          ssubcontad    := IntToStr(_SubContaCliFor);

          If _UnidNegocCliFor = 0 Then
             sunidnegd     := ''
          Else
             sunidnegd     := IntToStr(_UnidNegocCliFor);

          scodcemtcustd := _CCustoCliFor;
          splacontad    := _ContaCliFor;
        End;

        liExercicio := 0;
        liPeriodo   := 0;
        liEmpresa   := Sistema.IdEmpresa;
        If TestaPeriodo(True,'BaseDados',DateToStr(_DataLancto),IntToStr(Sistema.IdModulo),liExercicio,
           liPeriodo,liEmpresa,sMens) <> 0 Then EDataBaseError.Create(sMens);

        //Inclusão do filtro TipoDocumento.RecPag na consulta de documentos
        //Verificar Montagem do Histórico
        sHistorico := 'Lançamento de Documento Associado a Imposto';

        If Not _DtmCmBackimposto.QryImpostoDESCCUSTAGREG.IsNull Then
           sHistorico := 'Lançamento de ' + _DtmCmBackimposto.QryImpostoDESCCUSTAGREG.AsString + ' - '+
                         (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('RAZAOSOCIAL').AsString
        Else
           If Not _QryAcumulaImposto.FieldByName('DESCCUSTAGREG').IsNull Then
              sHistorico := 'Lançamento de ' + _QryAcumulaImposto.FieldByName('DESCCUSTAGREG').AsString + ' - '+
                            (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('RAZAOSOCIAL').AsString;


        {**
          Inclusão do hsitórico complementar baseado no nome do fornecedore e nº do documento de origem.
          Caso a retenção seja originada de um lote, é gravado apenas o número do lote.
        **}
        If fNumLote = 0.00 Then
           sComplHst := GetHistNumDocumento
        Else
           sComplHst := ' Ref. Lote Nº ' + FloatToStr(fNumLote);

        FuncaoGeral.ArrumaHistorico(sHistorico, sHisto1, sHisto2, sHisto3, sHisto4, sHisto5);

        iPlnCodigo:= 0;
     End;

     //Insere o rateio
     If fNumLote = 0.00 Then
     Begin
       If (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('UNIDNEGOC').IsNull Then
       Begin
           LancaContabNovoDocumento(_ValorImposto, sunidnegd, sunidnegC,
                                    -1,
                                    -1,
                                    False);

          _DocImposto.Rateio.Inserir(iCodLancCAPCAR,
                                    (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODTIPRECDES').AsString,
                                    IntegraBack.RecPag,
                                    (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODCENTRORESPON').AsString,
                                    Sistema.IdEmpresa,
                                    _ValorImposto,
                                    0,
                                    Sistema.IdUsuario,
                                    IntegraBack.uNidNegoc,
                                    -1,
                                    '',-1,-1,-1)
       End
       Else
       Begin
          //Implementaca da chamada da funcao de rateio da contabilizacao
           LancaContabNovoDocumento(_ValorImposto,
                                    (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('UNIDNEGOC').AsString,
                                    (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('UNIDNEGOC').AsString,
                                    -1,
                                    -1,
                                    False);

          _DocImposto.Rateio.Inserir(iCodLancCAPCAR,
                                    (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODTIPRECDES').AsString,
                                    IntegraBack.RecPag,
                                    (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODCENTRORESPON').AsString,
                                    Sistema.IdEmpresa,
                                    _ValorImposto,
                                    0,
                                    Sistema.IdUsuario,
                                    (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('UNIDNEGOC').AsInteger,
                                    -1,
                                    '',-1,-1,-1);
       End;
     End
     Else
     Begin
       //Faz rateio proporcional ao rateio dos documentos de origem do imposto com tratamento Fiscal 'B'
       //BuscaRateio dos Documentos envolvidos no lote.

       If _DtmCmBackimposto.Qry.Active Then _DtmCmBackimposto.Qry.Close;

       //Verifica se documento de origem é englobado ou parcelado e muda
       //a query do rateio de acordo com a operacao do documento de origem

       _DtmCmBackimposto.Qry.Sql.Text := ' SELECT ' +
                                         ' DECODE(CODCENTROCUSTO,NULL,'''',CODCENTROCUSTO) AS CODCENTROCUSTO, ' +
                                         ' DECODE(IDPLANOPREV,NULL,-1,IDPLANOPREV) AS IDPLANOPREV, ' +
                                         ' DECODE(IDPATRO,NULL,-1,IDPATRO) AS IDPATRO, ' +
                                         ' DECODE(IDPROGRAMA,NULL,-1,IDPROGRAMA) AS IDPROGRAMA, ' +
                                         ' SUM(VALOR) AS VALOR ' +
                                         ' FROM ' +
                                         '  RATEIODOCUM ' +
                                         ' WHERE ' +
                                         '   CODDOCUMENTO IN (' + Copy(_CODDOCSACUMULA,2,Length(_CODDOCSACUMULA)) +  ')' +
                                         ' GROUP BY ' +
                                         '   CODCENTROCUSTO, IDPLANOPREV, IDPATRO, IDPROGRAMA ' +
                                         'UNION ' +
                                         ' SELECT DISTINCT ' +
                                         '  DECODE(Q2.CODCENTROCUSTO,NULL,'''',Q2.CODCENTROCUSTO) AS CODCENTROCUSTO, ' +
                                         '  DECODE(Q2.IDPLANOPREV,NULL,-1,Q2.IDPLANOPREV) AS IDPLANOPREV, ' +
                                         '  DECODE(Q2.IDPATRO,NULL,-1,Q2.IDPATRO) AS IDPATRO, ' +
                                         '  DECODE(Q2.IDPROGRAMA,NULL,0,Q2.IDPROGRAMA) AS IDPROGRAMA, ' +
                                         '  SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALORIMPOSTO ' +
                                         ' FROM ' +
                                         '  (SELECT ' +
                                         '     DOC.NUMFATURA, ' +
                                         '     LAN.VALOR ' +
                                         '  FROM ' +
                                         '     DOCUMENTO DOC, ' +
                                         '     LANCTODOCUM LAN ' +
                                         '  WHERE ' +
                                         '    (DOC.CODDOCUMENTO IN (' + Copy(_CODDOCSACUMULA,2,Length(_CODDOCSACUMULA)) +  ')) AND ' +
                                         '    ((LAN.OPERACAO = ''3'') OR (LAN.OPERACAO = ''13'')) AND ' +
                                         '     (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1, ' +
                                         ' (SELECT ' +
                                         '   D.NUMFATURA, ' +
                                         '   RD.VALOR, ' +
                                         '   RD.CODCENTROCUSTO, ' +
                                         '   RD.IDPLANOPREV, ' +
                                         '   RD.IDPATRO, ' +
                                         '   RD.IDPROGRAMA ' +
                                         '  FROM ' +
                                         '   RATEIODOCUM RD, DOCUMENTO D ' +
                                         '  WHERE ' +
                                         '   (D.NUMFATURA IS NOT NULL) AND ' +
                                         '   (D.CODDOCUMENTO = RD.CODDOCUMENTO)) Q2, ' +
                                         '  (SELECT ' +
                                         '    D.NUMFATURA, SUM(L.VALOR) AS VALOR ' +
                                         '   FROM ' +
                                         '    LANCTODOCUM L, DOCUMENTO D ' +
                                         '   WHERE ' +
                                         '    ((L.OPERACAO = ''1'') OR  (L.OPERACAO = ''11'')) AND ' +
                                         '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                                         '    (D.OPERACAO = L.OPERACAO) AND ' +
                                         '    (D.NUMFATURA IS NOT NULL) ' +
                                         '   GROUP BY D.NUMFATURA) Q3 ' +
                                         ' WHERE ' +
                                         '  (Q1.NUMFATURA = Q2.NUMFATURA) AND ' +
                                         '  (Q3.NUMFATURA = Q2.NUMFATURA) ' +
                                         ' GROUP ' +
                                         '  BY Q2.CODCENTROCUSTO, Q2.IDPROGRAMA, Q2.IDPATRO, Q2.IDPLANOPREV ';

       _DtmCmBackimposto.Qry.Open;
       _DtmCmBackimposto.Qry.First;

       rValorTotalRateio := 0;
       While Not _DtmCmBackimposto.Qry.Eof Do
       Begin
          rValorTotalRateio := rValorTotalRateio + _DtmCmBackimposto.Qry.FieldByName('VALOR').AsFloat ;
          _DtmCmBackimposto.Qry.Next;
       End;

       _DtmCmBackimposto.Qry.First;
       iContReg := _DtmCmBackimposto.Qry.Recordcount;
       rSumrValorPorRateio := 0;

       While Not _DtmCmBackimposto.Qry.Eof Do
       Begin
         Dec(iContReg);

         If iContReg = 0 Then
             //Equivale ao arredondamento pois o último lançamento tem o valor exato da diferença só que com duas casas decimais
            rValorPorRateio := _QryAcumulaImposto.FieldByName('VLRRETIDO').AsFloat - rSumrValorPorRateio
         Else
            rValorPorRateio := ((_DtmCmBackimposto.Qry.FieldByName('VALOR').AsFloat * _QryAcumulaImposto.FieldByName('VLRRETIDO').AsFloat)/rValorTotalRateio);

         rSumrValorPorRateio := rSumrValorPorRateio +  rValorPorRateio;


         If (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('UNIDNEGOC').IsNull Then
         Begin
           //Implementaca da chamada da funcao de rateio da contabilizacao
           LancaContabNovoDocumento(rValorPorRateio,
                                    (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('UNIDNEGOC').AsString,
                                    (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('UNIDNEGOC').AsString,
                                    _DtmCmBackimposto.Qry.FieldByName('IDPLANOPREV').AsInteger,
                                    _DtmCmBackimposto.Qry.FieldByName('IDPATRO').AsInteger, False);

           _DocImposto.Rateio.Inserir(iCodLancCAPCAR,
                                    (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODTIPRECDES').AsString,
                                    IntegraBack.RecPag,
                                    (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODCENTRORESPON').AsString,
                                    Sistema.IdEmpresa,
                                    rValorPorRateio,
                                    0,
                                    Sistema.IdUsuario,
                                    IntegraBack.uNidNegoc,
                                    -1,
                                    _DtmCmBackimposto.Qry.FieldByName('CODCENTROCUSTO').AsString,
                                    _DtmCmBackimposto.Qry.FieldByName('IDPATRO').AsInteger,
                                    _DtmCmBackimposto.Qry.FieldByName('IDPROGRAMA').AsInteger,
                                    _DtmCmBackimposto.Qry.FieldByName('IDPLANOPREV').AsInteger)
         End
         Else
         Begin
            //Implementaca da chamada da funcao de rateio da contabilizacao
           LancaContabNovoDocumento(rValorPorRateio, sunidnegd, sunidnegC,
                                    _DtmCmBackimposto.Qry.FieldByName('IDPLANOPREV').AsInteger,
                                    _DtmCmBackimposto.Qry.FieldByName('IDPATRO').AsInteger, False);

            _DocImposto.Rateio.Inserir(iCodLancCAPCAR,
                                    (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODTIPRECDES').AsString,
                                    IntegraBack.RecPag,
                                    (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODCENTRORESPON').AsString,
                                    Sistema.IdEmpresa,
                                    rValorPorRateio,
                                    0,
                                    Sistema.IdUsuario,
                                    (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('UNIDNEGOC').AsInteger,
                                    -1,
                                    _DtmCmBackimposto.Qry.FieldByName('CODCENTROCUSTO').AsString,
                                    _DtmCmBackimposto.Qry.FieldByName('IDPATRO').AsInteger,
                                    _DtmCmBackimposto.Qry.FieldByName('IDPROGRAMA').AsInteger,
                                    _DtmCmBackimposto.Qry.FieldByName('IDPLANOPREV').AsInteger);
         End;

         _DtmCmBackimposto.Qry.Next;
       End;

       _DtmCmBackimposto.Qry.Close;
     End;

     //Insere Lanctodocum
     If IntegraBack.MascaraNoDocum <> '' Then
     Begin
        _DocImposto.TipoFaturaLancto := sCompl;
        _DocImposto.NumFaturaLancto  := FloatToStr(fNumDocumento);
        _DocImposto.CodTipDoc        := (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).FieldByName('CODTIPDOC').AsInteger;
     End;

     iNumLancto:=_DocImposto.GerarNumLancto(nil,iCodLancCAPCAR);
     _DocImposto.Valorliquido := _ValorImposto;

     If Not _DtmCmBackimposto.QryImpostoDESCCUSTAGREG.IsNull Then
       sHistCompl := 'Lançamento de ' + _DtmCmBackimposto.QryImpostoDESCCUSTAGREG.AsString + sComplHst
     Else
       sHistCompl := 'Lançamento de ' + _QryAcumulaImposto.FieldByName('DESCCUSTAGREG').AsString + sComplHst;

     If (Trim(sDebCre) <> 'C') And (Trim(sDebCre) <> 'D') Then
        Raise Exception.Create('DebCre inválido para o CodDocumento: ' + IntToStr(iCodLancCAPCAR) + ' e Histórico: ' + sHistCompl);

     _DocImposto.CriarLanctoDoc(_DtmCmBackimposto.Qry,
                                iCodLancCAPCAR,
                                iNumLancto,
                                -1,
                                iPlnCodigo,
                                DateToStr(_DataLancto),
                                _ValorImposto,
                                0,
                                -1,
                                sDebCre,
                                '2',
                                sHistCompl,
                                Sistema.idUsuario,
                                False,
                                -1,
                                '');
  End;
End;

Procedure TImpostoRetido.ExcluiDocLancados;
Var
   liRetFuncao:LongInt;

   Procedure ExecSql(sSql: String);
   Begin
      If DtmBaseDados.Qry.Active Then DtmBaseDados.Qry.Close;
      DtmBaseDados.Qry.Sql.Text := sSql;
      DtmBaseDados.Qry.ExecSQL;
   End;

Begin
   If _CodNewDoc > 0 Then
   Begin
     //Adicionei aqui junto do ExcluiDocLancados

     If FazQuery(_DtmCmBackimposto.Qry,' SELECT L.CODDOCUMENTO, L.NUMLANCTO, L.DATALANCTO, P.DESCRICAO FROM LANCTODOCUM L, ' +
                                      '  RECBTOPAGTO R, PORTADORFORMA P ' +
                                      ' WHERE ' +
                                      '  (L.CODDOCUMENTO = ' + FloatToStr(_CodNewDoc) + ') AND ' +
                                      '  (RTRIM(L.OPERACAO) = ''5'') AND ' +
                                      '  (L.CODDOCUMENTO = R.CODDOCUMENTO) AND ' +
                                      '  (L.NUMLANCTO = R.NUMLANCTO) AND ' +
                                      '  (P.CODPORTFORMA(+) = R.CODPORTFORMA) ') Then
        Raise Exception.Create('Existem lançamentos de baixa de imposto no dia ' +
                               _DtmCmBackimposto.Qry.FieldByName('DATALANCTO').AsString + ' na conta ' +
                               _DtmCmBackimposto.Qry.FieldByName('DESCRICAO').AsString);

     FazQuery(_DtmCmBackimposto.Qry,' SELECT ' +
                           '  L.PLNCODIGO ' +
                           ' FROM ' +
                           '  LANCTODOCUM L, DOCUMENTO D ' +
                           ' WHERE ' +
                           '  (D.CODDOCUMENTO = ' + FloatToStr(_CodNewDoc) + ') AND ' +
                           '  (RTRIM(D.OPERACAO) <> ''5'') AND ' +
                           '  (L.ESTORNO IS NULL) AND ' +
                           '  (D.CODDOCUMENTO = L.CODDOCUMENTO) ');

     liRetFuncao := 0;

     ExecSql('DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = ' + IntToStr(_CodNewDoc) + ' AND RTRIM(OPERACAO) <> ''5''');
     ExecSql('DELETE FROM RATEIODOCUM WHERE CODDOCUMENTO = ' + IntToStr(_CodNewDoc));
     ExecSql('DELETE FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(_CodNewDoc));

     _DtmCmBackimposto.Qry.First;
     While Not _DtmCmBackimposto.Qry.Eof Do
     Begin
        If _DtmCmBackimposto.Qry.FieldByName('PLNCODIGO').AsInteger > 0  Then
           liRetFuncao := ExcluiLanc(True,
                          _DtmCmBackimposto.Qry.FieldByName('PLNCODIGO').AsInteger,
                          'BASEDADOS',
                          IntToStr(Sistema.IdModulo),
                          IntegraBack.Plano,
                          Sistema.IdEmpresa,
                          Sistema.IdUsuario,
                          true,
                          0,
                          IntegraBack.MascaraPlano);
        _DtmCmBackimposto.Qry.Next;
     End;

     if liRetFuncao < 0 then
        EDataBaseError.Create('Não foi possível excluir documento associado ao imposto!');
   End;
End;

procedure TImpostoRetido.AcumulaLancaImposto;
Begin
   If _QryAcumulaImposto.Locate('CODTIPOCUSTAGREG',_CodTipoCustoAgreg,[]) Then
      _QryAcumulaImposto.Edit
   Else
      _QryAcumulaImposto.Append;

   _QryAcumulaImposto.FieldByName('CODTIPOCUSTAGREG').AsFloat := _CodTipoCustoAgreg;
   _QryAcumulaImposto.FieldByName('DATARETENCAO').AsFloat := _DataRetencao;
   _QryAcumulaImposto.FieldByName('VLRBASE').AsFloat := _QryAcumulaImposto.FieldByName('VLRBASE').AsFloat + (_ValorLancto * _Fator);
   _QryAcumulaImposto.FieldByName('VLRRETIDO').AsFloat := _QryAcumulaImposto.FieldByName('VLRRETIDO').AsFloat + (_ValorImposto * _Fator);
   _QryAcumulaImposto.FieldByName('IDFORCLI').AsFloat := FIdForCli;
   _QryAcumulaImposto.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;;
   _QryAcumulaImposto.FieldByName('RECPAG').AsString := IntegraBack.RecPag;
   _QryAcumulaImposto.FieldByName('DESCCUSTAGREG').AsString := _DtmCmBackimposto.QryImpostoDESCCUSTAGREG.AsString;
   _CodDocsAcumula := _CodDocsAcumula + ',' + FloatToStr(FCodDocumento);
   _QryAcumulaImposto.Post;
End;

procedure TImpostoRetido.EfetivaNovoDocumento;
Var
  X:Integer;
  DiaSemana: Array [1..5] of String;
Begin
   DiaSemana[1] := 'Segunda';
   DiaSemana[2] := 'Terça';
   DiaSemana[3] := 'Quarta';
   DiaSemana[4] := 'Quinta';
   DiaSemana[5] := 'Sexta';

   //Se houver retenção com tratamento fiscal do tipo 'B' e for proveniente de Lote
   //o _CodDocsAcumula é <> ''. O lançamento é feito com um Loop nas queryes de _QryAcumulaImposto e
   //_QryAcumulaDoc
   If (fNumLote <> 0.00) Then
   Begin

      //Lança a(s) retenções(s) e documentos resultantes
      _QryAcumulaImposto.First;

      _iDiaSemanaLancto := 0;
      _iDiasUteisLancto := 0;
      _iCodCidade       := 0;
      _iCodPais         := 0;
      _sEstado          := '';

      If (fCodPortForma <> 0.00) Then
      Begin
        //Busca dados da Cidade, Pais e Estado
        If FazQuery(_DtmCmBackimposto.Qry,' SELECT E.IDCIDADES, ' +
                                  '        ES.IDPAIS, ' +
                                  '        ES.CODESTADO ' +
                                  ' FROM ' +
                                  '   ENDPESS E, PESSOA P, CIDADES C, ESTADO ES ' +
                                  ' WHERE P.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa)+ ' AND ' +
                                  '       P.IDENDCOMERCIAL = E.IDENDERECO AND ' +
                                  '       E.IDCIDADES = C.IDCIDADES AND ' +
                                  '       ES.IDESTADO = C.IDESTADO') Then
        Begin
           _iCodCidade       := _DtmCmBackimposto.Qry.Fields[0].AsInteger;
           _iCodPais         := _DtmCmBackimposto.Qry.Fields[1].AsInteger;
           _sEstado          := _DtmCmBackimposto.Qry.Fields[2].AsString;
        End;

        //Busca parâmetros do portador forma para efetuar lançamento
        If FazQuery(_DtmCmBackimposto.Qry,'SELECT DIASEMANALANCTO, DIASUTEISLANCTO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + FloatToStr(fCodPortForma)) Then
        Begin
           For X:=1 To 5 Do
           Begin
              If DiaSemana[x] = _DtmCmBackimposto.Qry.Fields[0].AsString Then
              Begin
                 _iDiaSemanaLancto := x;
                 Break;
              End;
           End;
           _iDiasUteisLancto := _DtmCmBackimposto.Qry.Fields[1].AsInteger;
        End;

        _DtmCmBackimposto.Qry.Close;
      End;

      While Not _QryAcumulaImposto.Eof Do
      Begin
         //Lança o Documento
          if (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).Active Then (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).Close;
          If Not (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).Prepared Then (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).Prepare;
         (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).ParamByname('CODTIPOCUSTAGREG').AsFloat := _QryAcumulaImposto.FieldByName('CODTIPOCUSTAGREG').AsFloat;
         (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).ParamByname('IDPESSOA').AsFloat         := Sistema.idEmpresa;
         (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).Open;
         (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).First;

         If Not (_DtmCmBackimposto.DsDadosLancImp.DataSet as TwwQuery).IsEmpty Then
         Begin
            _ValorImposto := _QryAcumulaImposto.FieldByName('VLRRETIDO').AsFloat;

            LancaDocumento;

            //Lança o Imposto Referente ao documento acima
            _DtmCmBackimposto.QryLancAcumulaImposto.ParamByName('IDIMPOSTORETIDO').AsFloat := LeultRegistro(nil,'IMPOSTORETIDO');
            _DtmCmBackimposto.QryLancAcumulaImposto.ParamByName('DATARETENCAO').AsDateTime := GetDataLancDocImposto(_QryAcumulaImposto.FieldByName('DATARETENCAO').AsDateTime);
            _DtmCmBackimposto.QryLancAcumulaImposto.ParamByName('CODTIPOCUSTAGREG').AsFloat := _QryAcumulaImposto.FieldByName('CODTIPOCUSTAGREG').AsFloat;
            _DtmCmBackimposto.QryLancAcumulaImposto.ParamByName('VLRBASE').AsFloat := _QryAcumulaImposto.FieldByName('VLRBASE').AsFloat;
            _DtmCmBackimposto.QryLancAcumulaImposto.ParamByName('VLRRETIDO').AsFloat := _QryAcumulaImposto.FieldByName('VLRRETIDO').AsFloat;
            _DtmCmBackimposto.QryLancAcumulaImposto.ParamByName('IDFORCLI').AsFloat := _QryAcumulaImposto.FieldByName('IDFORCLI').AsFloat;
            _DtmCmBackimposto.QryLancAcumulaImposto.ParamByName('IDPESSOA').AsFloat := _QryAcumulaImposto.FieldByName('IDPESSOA').AsFloat;
            _DtmCmBackimposto.QryLancAcumulaImposto.ParamByName('CODDOCLANCADO').AsFloat := _CodNewDoc;
            _DtmCmBackimposto.QryLancAcumulaImposto.ParamByName('RECPAG').AsString := IntegraBack.RecPag;

            If fNumLote > 0.00 Then
               _DtmCmBackimposto.QryLancAcumulaImposto.ParamByName('NUMLOTE').AsFloat := fNumLote
            Else
               _DtmCmBackimposto.QryLancAcumulaImposto.ParamByName('NUMLOTE').Clear;

            If fNumLoteManual > 0.00 Then
               _DtmCmBackimposto.QryLancAcumulaImposto.ParamByName('NUMLOTEMANUAL').AsFloat := fNumLoteManual
            Else
               _DtmCmBackimposto.QryLancAcumulaImposto.ParamByName('NUMLOTEMANUAL').Clear;

            _DtmCmBackimposto.QryLancAcumulaImposto.ExecSql;
         End;

         _QryAcumulaImposto.Next;
      End;
   End;

   FechaQry([_QryAcumulaImposto],False,True);
   _CodDocsAcumula := '';
End;

procedure TImpostoRetido.CancelaAcumulaImposto;
Begin
   FechaQry([_QryAcumulaImposto],false,True);
   _CodDocsAcumula := '';
End;

function TImpostoRetido.GetDataLancDocImposto(dData:TDateTime):TDateTime;
Var
  iDiaSemanaData :Integer;
  DataFeriado :TDateTime;
  bExisteFeriado :Boolean;
Begin
   //SE O NÚMERO DE DIAS ÚTEIS ENTRE A DATADOLANÇAMENTO E A "DATA DO DIA DA SEMANA" DO
   //LANCAMENTO FOR >= DIASUTEISLANCTO LANCA DOCUMENTO PARA A "DATA DO DIA DA SEMANA"
   //SENAO LANÇA PARA "DATA DO DIA DA SEMANA" + 7
   iDiaSemanaData := DayOfWeek(dData) - 1;

   If (_iDiaSemanaLancto - iDiaSemanaData) < _iDiasUteisLancto Then
      Result := dData + (_iDiaSemanaLancto - iDiaSemanaData) + 7
   Else
   Begin
      Result  := dData + (_iDiaSemanaLancto - iDiaSemanaData);
      If (DiasUteis.ContaDiasNaoUteis(dData,Result,_iCodCidade,_iCodPais,_sEstado,True,True,False) > _iDiasUteisLancto) Then
         Result  := Result + 7;
   End;

   //SE A DATA RESULTANTE FOR UM FERIADO EXTRAORDINÁRIO CONSIDERA O PRIMEIRO DIA
   //ÚTIL POSTERIOR COMO DATA RESULTANTE
   //SE A DATA RESULTANTE FOR UM FERIADO NORMAL CONSIDERA O PRIMEIRO DIA
   //ÚTIL ANTERIOR COMO DATA RESULTANTE
   //O TESTE É PERSISTIDO ATÉ SE ENCONTRAR UMA DATA ÚTIL PARA O LANÇAMENTO

   DataFeriado := Result;
   bExisteFeriado := True;

   While bExisteFeriado Do
   Begin
     bExisteFeriado := False;
     If DiasUteis.Feriado(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False) Then
     Begin
        DataFeriado := DiasUteis.UltDiaUtilAnterior(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False,False);
        bExisteFeriado := True;
     End
     Else
     Begin
        If DiasUteis.Feriado(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,True) Then
        Begin
           DataFeriado := DiasUteis.PrimeiroDiaUtilPosterior(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False,False);
           bExisteFeriado := True;
        End;
     End;

     If ((DataFeriado - _iDiasUteisLancto) < dData) Then DataFeriado := Result + 7;
   End;

   If (Result <> DataFeriado) Then Result := DataFeriado;
End;

end.

{
Criação da propriedade CodCentroCusto para a indicação do centro de custo na
simulação do cálculo do imposto;
Correção das consultas de seleção do imposto associados ao Tipo de Desenbolso e
Centro de Custo: Erro na comparação qdo o centro de custo é nulo

Criação da propriedade Programa para a indicação do programa na
simulação do cálculo do imposto;
Correção das consultas de seleção do imposto associados ao Tipo de Desenbolso e
Centro de Custo: Erro na comparação qdo o centro de custo é nulo
Inclusão nas consultas acima do atributo indentificador do programa
}


