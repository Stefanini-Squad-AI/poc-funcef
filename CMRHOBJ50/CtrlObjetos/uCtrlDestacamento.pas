//******************************************************************************
//N. SIG..........: 128175
//Data............: 17/08/2022
//Responsável.....: Everson Cunha
//Descrição.......: Alteração nas atividade/projeto do rateio e contabilização
//******************************************************************************
//N. SIG..........: 87510
//Data............: 23/08/2019
//Responsável.....: Everson Cunha
//Descrição.......: Melhorias e correções na integração do destacamento.
//******************************************************************************
//N. SIG..........: 74816
//Data............: 09/05/2019
//Responsável.....: Everson Cunha
//Descrição.......: Melhoria na rotina de integração com a Folha, passando a
//                  existir a rubrica que faz o DESCONTO.
//******************************************************************************
//N. SIG..........: 60521
//Data............: 23/04/2019
//Responsável.....: Everson Cunha
//Descrição.......: A funcionalidade de integração do destacamento estava
//                  permitindo realizar a integração do destacamento para datas
//                  em períodos contábeis fechados pois estava passando "Date"
//                  no momento das validações, mas na hora de desfazer integra-
//                  ção estava passando a datalancto da LANCTODOCUM, que estava
//                  em período bloqueado, então não deixava desfazer.
//******************************************************************************
//N. SOL..........: 233230/18354
//Data............: 15/02/2017
//Responsável.....: Peterson Victor
//Descrição.......: Criar uma rotina para desfazer o agrupamento de APs na
//                  funcionalidade de solicitação de destacamento.
//******************************************************************************
//N. Sol..........: 185481
//N. Kintana......: 1907260
//Data............: 01/04/2014
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Agrupamento de AP - Modelo 2
//Funções.........: .dfm e diversas (Agrupamento, qry e cds)
//******************************************************************************
//N. Sol..........: 185594
//N. Kintana......: 1910887
//Data............: 13/03/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão de Msg do sucesso das integrações e
//                  Inclusão de Impressão da AP - Modelo 2
//******************************************************************************
//N. Sol..........: 209932
//N. Kintana......: 2042823
//Data............: 21/08/2013
//Responsável.....: Marcio Sanches Spinosa SOL 209932 Kintana 2042823
//Descrição.......: Ajuste no metodo FctrlDocumento.SetValues alterando
//                  de placonta para placontapass
//******************************************************************************
//N. Sol..........: 214421
//N. Kintana......: 2042036
//Data............: 19/08/2013
//Responsável.....: Marcio Sanches Spinosa SOL 214421 Kintana 2042036
//Descrição.......: Inclusão de um novo filtro para que o documento seja
//                  lançado corretamente
//******************************************************************************
//N. Sol..........: 208290
//N. Kintana......: 2012043
//Data............: 05/06/2013
//Responsável.....: Marcio Sanches Spinosa
//Descrição.......: ajuste na passagem de parametros na função
//                  FctrlPlacontasCapCar.GetPlacontas
//                  dentro do metodo IntegrarDstItemDespesaFinancContabil
//******************************************************************************
//N. Sol..........: 207109
//N. Kintana......: 2000811
//Data............: 13/05/2013
//Responsável.....: solução passada pelo Paulo Nobre por e-mail
//Descrição.......: ERRO NA INTEGRAÇÃO DE DIRETORES DE DESTACAMENTO
//                  DE DIRETORES CEDIDOS
//******************************************************************************
//N. Sol..........: 205125
//N. Kintana......: 1984450
//Data............: 17/04/2013
//Responsável.....: Paulo Nobre
//Descrição.......: PEÇO VERIFICAR "CONTA CONBTABIL NÃO ENCONTRADA" E
//                  MOVIMENTOS PARA INTEGRAÇÃO NO
//                  MODULO AUTO ATENDIMENTO - DESTACAMENTO
//******************************************************************************
//N. Sol..........: 137269
//N. Kintana......: 829602
//Data............: 06/11/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Funções e rotinas para atender as integrações do
//                  Destacamento
//******************************************************************************


Unit uCtrlDestacamento;

Interface

Uses
   SysUtils, Dialogs, Db, Controls, uCmDbObject, uCmControlObject, IvDictio,
   Classes, // edilaine.ferraresi - SOL 185481 / KTN 1907260
   uCMClientDataSet, uCtrlCustomRH, uDbDestacamento,
   uDbDstTrecho, uDbDstTarifa, uDbDstValores, uDiasUteis,
   uDbParamRH, uSistema, Wwdatsrc, Wwquery, uCtrlDocumento,
   uCtrlPlacontasCapCar, uCtrlListTerceirosRH, uCtrlParamIntegra, uCtrlSegregacao,
   uCtrlLancamento, uCtrlModeloHistorico, uCtrlRubricaIndiv, uDbRubricaIndiv;

Type
   TCMQuery = Class(TwwQuery);
   TTipoExclusao = (teExcluirAdiantamentoSomente, teExcluirAcertoSomente, teExcluirTudo);

   TCtrlDestacamento = Class(TCtrlCustomRH)
   Protected
      FCtrlSegregacao: TCtrlSegregacao;
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
      Procedure AfterInitialize; Override;
   Private
      FctrlDocumento: TCtrlDocumento;
      FctrlPlacontasCapCar: TCtrlPlacontasCapCar;
      FctrlListTerceirosRH: TCtrlListTerceirosRH;
      FctrlParamIntegra: TCtrlParamIntegra;
      FctrlLancamento: TCtrlLancamento;
      FctrlModeloHistorico: TCtrlModeloHistorico;
      FCtrlRubricaIndiv: TCtrlRubricaIndiv;

      rPlaContas: TPlaContas;

      FDbDestacamento: TDbDestacamento;
      FCdsDestacamento: TCMClientDataSet;
      FDbDstTrecho: TDbDstTrecho;
      FDbRubricaIndiv: TDbRubricaIndiv;

      FCdsParamRH: TCmClientDataSet;

      FIdEmpresa: Integer;
      FMensagemCtrlDocumento: String;
      FSistema: TSistema;

      FFundacaoCidade: Integer;
      FFundacaoEstado: String;
      FFundacaoPais: Integer;
      sTipOper: String;
      sContaNada: String;
      iIdSegrCriter: Integer;

      Function ListarDestacamento(IdDestacamento: double): OleVariant; overload;
      Function ListarDestacamento(sDestacamento, tipoEnvio : string): OleVariant;  overload;  // edilaine.ferraresi - SOL 185481 / KTN 1907260

      Function ListarUltSeqTrecho(IdDestacamento: double): OleVariant;
      Function ListarParamRH: OleVariant;
      Function LocalizaParametrosParaIntegracaoFinanceira(iditem, tipoviagem: integer; tipcontrato, tipomov: String; Var sCodTipRecDes: String): Boolean;
      Function LocalizaParametrosParaIntegracaoFolhaPagto(iditem, tipoviagem, flgDesconto: integer; tipcontrato: String; Var idProvento, idRegra: Integer): Boolean;
      // Exclui o documento do Financeiro usando a CTRLDOCUMENTO
      Function ExcluirDocumentoCAPCAR(Const iDocumento: Integer): Boolean;
      // Efetua um UPDATE na tabela DESTACAMENTO atualizando CODDOCDESTAC = NULL
      Function LimpaDadosFinancAdiantamento(iDestacamento: Integer): Boolean;
      // Efetua um UPDATE na tabela DESTACAMENTO atualizando CODDOCACERTO = NULL
      Function LimpaDadosFinancAcertoContas(iDestacamento: Integer): Boolean;
      Function EfetuarLancamentoContab(Const iPatro,
         iPlanoPrev: Integer;
         Const sHistCtb,
         sCodCentroCusto: String;
         Const valor: Double;
         Const rNumDoc: Double;
         Var dPlnCodigo: Double;
         dDataPagamento: TDateTime; //Everson Cunha - SIG60521
         iAtivProjeto: Integer //Everson Cunha - SIG128175
         ): Boolean;

      Function TotalDestacamentoTipoDespesa(idDestacamento: Integer; sDespTipoQualificacao: String): Double;

      // Carrega Cidade, Estado e Pais da Fundacao
      Procedure CarregarCidadeEstadoPaisSistema;

   Public
      // SOL 185594 KTN 1910887 - Paulo Nobre
      dNumDocumento: Double;

      Constructor Create(Const sys: TSistema); Reintroduce;
      Destructor Destroy; Override;

      // Calcula a Data de Pagamento com base nas regras definidas pelos Parametros
      Function CalcularDataPagamento(TipoEnvio: String; DataBase: TDateTime): TDateTime;
      Function BuscarContaBancaria(idPessoa: Integer): Integer;
      Function ObrigarContaBancaria: Boolean;
      Function IntegrarDstItemDespesaFinancContabil(iDestacamento: Integer; tipoEnvio: String; bContabiliza: Boolean; TipOper, sObservacao: String; var CodDocumento : integer): Boolean;   // SOL 185594 KTN 1910887 - Paulo Nobre
      Function IntegrarDstItemDespesaFolhaPagamento(IdDestacamento: integer; tipoEnvio, AnoMesRef: String): Boolean;
      Function ExcluirDadosDaIntegracaoFinanceira(Const tipoExclusao: TTipoExclusao; idDestacamento, codDocDestac, codDocAcerto: Integer): Boolean;
      Function ExcluirDadosDaIntegracaoFolhaPagto(IdDestacamento, IdPessoa: integer; tipoEnvio, AnoMesRef, NomeDestacado: String): Boolean;
      Function LiberaAcessosParaManutencao(IdUsuarioLogin: integer; sNomeGrupo: String): Boolean;
      Function LocalizarCotacaoMoeda(iCodMoeda: Integer; sDataCotacao: String): Double;

      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - inicio
      Function IntegrarAgrupamentoFinancContabil(sDestacamento: string;
                                            tipoEnvio: String;
                                            bContabiliza: Boolean;
                                            TipOper, sDtPagto: String;
                                            var CodDocumento : integer;
                                            rVlrTotal : currency;
                                            sContrato, sCodContrato : string): Boolean;

      function GetId(sTabela, sCampo, sCondicao : string ) : integer;
      // edilaine.ferraresi - SOL 185481 / KTN 1907260 - fim

      Property Sistema: TSistema Read FSistema;
      Property fundacaoCidade: Integer Read FFundacaoCidade;
      Property fundacaoEstado: String Read FFundacaoEstado;
      Property fundacaoPais: Integer Read FFundacaoPais;
      Property CdsDestacamento: TCMClientDataSet Read FCdsDestacamento Write FCdsDestacamento;
   End;

Implementation

Uses uCMTypes, uCtrlFuncoesRH, uCtrlPadroes, uListaCamposHistCapCar;

{ TCtrlDestacamento }

Const
   CR_LF = #13#10;

Procedure TCtrlDestacamento.AfterInitialize;
Begin
   Inherited;
   FctrlDocumento.InitializeAs(Self);
   FctrlParamIntegra.InitializeAs(Self);
   FctrlParamIntegra.GetParams(FSistema.idEmpresa, 0, '', '', tiSistema);
   FctrlListTerceirosRH.InitializeAs(Self);
   FctrlPlacontasCapCar.InitializeAs(Self);
   FctrlLancamento.InitializeAs(Self);
   FctrlModeloHistorico.InitializeAs(Self);
   FCtrlRubricaIndiv.InitializeAs(Self);
   FCtrlSegregacao.InitializeAs(Self);

   FCdsParamRH.Data := listarParamRH;
End;

Constructor TCtrlDestacamento.Create(Const sys: TSistema);
Begin
   // Carrega o atributo SISTEMA
   FSistema := sys;

   // Instancia os DB Objects
   FDbDestacamento := TDbDestacamento.Create(Self);
   FDbDstTrecho := TDbDstTrecho.Create(Self);
   FDbRubricaIndiv := TDbRubricaIndiv.Create(Self);

   // Instancia os CTRL Objects
   FctrlDocumento := TctrlDocumento.Create;
   FctrlParamIntegra := TctrlParamIntegra.Create;
   FctrlListTerceirosRH := TctrlListTerceirosRH.Create('', '', '');
   FctrlPlacontasCapCar := TctrlPlacontasCapCar.Create;
   FctrlLancamento := TCtrlLancamento.Create;
   FctrlModeloHistorico := TCtrlModeloHistorico.Create;
   FCtrlRubricaIndiv := TCtrlRubricaIndiv.Create(FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral);
   FCtrlSegregacao := TCtrlSegregacao.Create;

   // Instancia os CDS's
   FcdsDestacamento := TCMClientDataSet.Create(Nil);
   FCdsParamRH := TCMClientDataSet.Create(Nil);

   FIdEmpresa := FSistema.IdEmpresa;

   Inherited Create;
End;

Destructor TCtrlDestacamento.Destroy;
Begin
   FDbDestacamento.Free;
   FDbDstTrecho.Free;
   FDbRubricaIndiv.Free;

   If (IsAppServer) Then
      FCdsDestacamento.Free;
   If (IsAppServer) Then
      FCdsParamRH.Free;

   If Assigned(FctrlDocumento) Then FreeAndNil(FctrlDocumento);
   If Assigned(FctrlParamIntegra) Then FreeAndNil(FctrlParamIntegra);
   If Assigned(FctrlListTerceirosRH) Then FreeAndNil(FctrlListTerceirosRH);
   If Assigned(FctrlPlacontasCapCar) Then FreeAndNil(FctrlPlacontasCapCar);
   If Assigned(FctrlLancamento) Then FreeAndNil(FCtrlLancamento);
   If Assigned(FctrlModeloHistorico) Then FreeAndNil(FCtrlModeloHistorico);
   If Assigned(FCtrlRubricaIndiv) Then FreeAndNil(FCtrlRubricaIndiv);
   If Assigned(FCtrlSegregacao) Then FreeAndNil(FCtrlSegregacao);

   Inherited;
End;

Procedure TCtrlDestacamento.OnCreateAppServer;
Begin
   Inherited;
   FCdsDestacamento := TCMClientDataSet.Create(Nil);
   FCdsParamRH := TCMClientDataSet.Create(Nil);
End;

Procedure TCtrlDestacamento.DoChangeDataBase;
Begin
   Inherited;
   FDbDestacamento.DataBaseName := DataBaseName;
   FDbDstTrecho.DataBaseName := DataBaseName;
   FDbRubricaIndiv.DataBaseName := DataBaseName;
End;

Function TCtrlDestacamento.listarParamRH: OleVariant;
Var
   sSQL: String;
Begin
   sSQL := ' SELECT ' + CR_LF +
      '   * ' + CR_LF +
      ' FROM ' + CR_LF +
      '   PARAMRH ' + CR_LF;

   Result := GetDataPacket(sSQL);
End;

Function TCtrlDestacamento.listarDestacamento(IdDestacamento: double): OleVariant;
Var
   sSQL: String;
Begin
   sSQL := ' SELECT D.*, P.NOME AS NOMEDESTACADO ' + CR_LF +
      ' FROM DESTACAMENTO D, PESSOA P ';
   If (IdDestacamento = -1) Then
      sSQL := sSQL + ' WHERE (1 = 2) ' + CR_LF
   Else
      Begin
         sSQL := sSQL + ' WHERE ' + CR_LF;
         sSQL := sSQL + '  (IDDESTACAMENTO = ' + FloatToStr(IdDestacamento) + ') ';
         sSQL := sSQL + '   AND (P.IDPESSOA = D.IDPESSOA) ' + CR_LF;
      End;

   Result := GetDataPacket(sSQL);
End;

Function TCtrlDestacamento.listarDestacamento(sDestacamento, tipoEnvio : string): OleVariant;
Var
   sSQL: String;
Begin
   sSQL := ' SELECT D.*, P.NOME AS NOMEDESTACADO, IDA.DATAINI AS DATAIDA, VOLTA.DATAINI AS DATAVOLTA, V.TOTAL ' + CR_LF +
           '   FROM DESTACAMENTO D, PESSOA P, DSTTRECHO IDA, DSTTRECHO VOLTA, ' +cr_lf+
           '       (SELECT IDDESTACAMENTO, MIN(NUMSEQ) IDIDA, MAX(NUMSEQ) IDVOLTA from DSTTRECHO ' +cr_lf+
           '         GROUP BY IDDESTACAMENTO) T,                   ' + cr_lf+
           '       (SELECT IDDESTACAMENTO, SUM(VLRITEM) AS TOTAL   ' + cr_lf+
           '          FROM DESTACAMENTOXITEMDESPESA                ' + cr_lf+
           '         WHERE TIPOQUALIFICACAO = '+quotedstr(tipoEnvio) + cr_lf+
           '         GROUP BY IDDESTACAMENTO) V             ' + cr_lf+
           '  WHERE t.iddestacamento = d.iddestacamento     ' + CR_LF+
           '    AND v.iddestacamento = d.iddestacamento     ' + CR_LF+
           '    AND (P.IDPESSOA = D.IDPESSOA)               ' + CR_LF+
           '    AND IDA.IDDESTACAMENTO = T.IDDESTACAMENTO   ' + CR_LF+
           '    AND IDA.NUMSEQ = T.IDIDA                    ' + CR_LF+
           '    AND VOLTA.IDDESTACAMENTO = T.IDDESTACAMENTO ' + CR_LF+
           '    AND VOLTA.NUMSEQ = T.IDVOLTA                ' + CR_LF+
           '    AND (D.IDDESTACAMENTO in (' + sDestacamento + ')) ';
   Result := GetDataPacket(sSQL);
End;


Function TCtrlDestacamento.listarUltSeqTrecho(IdDestacamento: double): OleVariant;
Begin
   Result := GetDataPacket(
      ' SELECT ' + CR_LF +
      '   MAX(NUMSEQ) AS ULTSEQ ' + CR_LF +
      ' FROM ' + CR_LF +
      '   DSTTRECHO ' + CR_LF +
      ' WHERE ' + CR_LF +
      '   (IDDESTACAMENTO = ' + FloatToStr(IdDestacamento) + ') ');
End;

Function TCtrlDestacamento.ExcluirDadosDaIntegracaoFinanceira(Const tipoExclusao: TTipoExclusao; idDestacamento, codDocDestac, codDocAcerto: Integer): Boolean;
Begin
   Result := False;
   MessageInfo := '';
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.ExcluirDadosDaIntegracaoFinanceira(FCdsDestacamento.Data);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            Case (tipoExclusao) Of
               teExcluirAdiantamentoSomente:
                  Begin
                     // Efetua um UPDATE na tabela DESTACAMENTO
                     // 'setando' CODDOCDESTAC = NULL
                     If Not LimpaDadosFinancAdiantamento(idDestacamento) Then
                        Raise Exception.Create(FMensagemCtrlDocumento);

                     // Exclui o Documento do Destacamento no Financeiro
                     // Caso o mesmo já não tenha sido liquidado.
                     // A Control do Documento trata as situações.
                     If Not ExcluirDocumentoCAPCAR(codDocDestac) Then
                        Raise Exception.Create('CapCar - ' + FMensagemCtrlDocumento);

                     Result := True;
                  End;
               teExcluirAcertoSomente:
                  Begin
                     // Efetua um UPDATE na tabela DESTACAMENTO
                     // 'setando' CODDOCACERTO = NULL
                     If Not LimpaDadosFinancAcertoContas(idDestacamento) Then
                        Raise Exception.Create(FMensagemCtrlDocumento);

                     // Exclui o Documento de Acerto de Contas no Financeiro
                     // Caso o mesmo já não tenha sido liquidado.
                     // A Control do Documento trata as situações.
                     If Not excluirDocumentoCAPCAR(codDocAcerto) Then
                        Raise Exception.Create('CapCar - ' + FMensagemCtrlDocumento);

                     Result := True;
                  End;
               teExcluirTudo:
                  Begin
                     // Efetua um UPDATE na tabela DESTACAMENTO
                     // 'setando' CODDOCADESTAC = NULL
                     If Not LimpaDadosFinancAdiantamento(idDestacamento) Then
                        Raise Exception.Create(FMensagemCtrlDocumento);

                     // Exclui o Documento do Destacamento no Financeiro
                     // Caso o mesmo já não tenha sido liquidado.
                     // A Control do Documento trata as situações.
                     If Not excluirDocumentoCAPCAR(codDocDestac) Then
                        Raise Exception.Create('CapCar - ' + FMensagemCtrlDocumento);

                     // Efetua um UPDATE na tabela DESTACAMENTO
                     // 'setando' CODDOCACERTO = NULL
                     If Not LimpaDadosFinancAcertoContas(idDestacamento) Then
                        Raise Exception.Create(FMensagemCtrlDocumento);

                     // Exclui o Documento de Acerto de Contas no Financeiro
                     // Caso o mesmo já não tenha sido liquidado.
                     // A Control do Documento trata as situações.
                     If Not excluirDocumentoCAPCAR(codDocAcerto) Then
                        Raise Exception.Create('CapCar - ' + FMensagemCtrlDocumento);

                     Result := True;
                  End;
            End;
         Except
            On E: Exception Do
               Begin
                  Result := false;
                  MessageInfo := E.Message;
               End;
         End;
      End;
End;

Function TCtrlDestacamento.excluirDocumentoCAPCAR(Const iDocumento: Integer): Boolean;
Var
   CtrlDocumento: TCtrlDocumento;
Begin
   Result := True;
   FMensagemCtrlDocumento := '';
   If iDocumento > 0 Then
      Begin
         CtrlDocumento := TCtrlDocumento.Create;
         CtrlDocumento.InitializeAs(Padroes);
         Try
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
            CtrlDocumento.CodDocumento := iDocumento;

            CtrlDocumento.IdUsuario := FSistema.idUsuario;
            CtrlDocumento.IdEspAcesso := FSistema.idEspAcesso;
            CtrlDocumento.UsaPlanoPatro := FSistema.UsaPlanoPatro;
            CtrlDocumento.IdModulo := FSistema.idModulo;

            result := CtrlDocumento.Delete;
         Finally
            FMensagemCtrlDocumento := CtrlDocumento.MessageInfo;
            FreeAndNil(CtrlDocumento);
         End;
      End;
End;

Function TCtrlDestacamento.LimpaDadosFinancAdiantamento(iDestacamento: Integer): Boolean;
Var
   _qryAux: TCMQuery;
   sSQL: String;
Begin

   sSQL := ' UPDATE ' + CR_LF +
      '   DESTACAMENTO ' + CR_LF +
      ' SET ' + CR_LF +
      '   CODDOCDESTAC = NULL, FLGINTEGRARFINANC = ''N'', IDUSUARIOSISTEMA = NULL ' + CR_LF +
      ' WHERE ' + CR_LF +
      //    '   IDDESTACAMENTO = ' + IntToStr(iDestacamento); //Peterson Victor SOL233230/18354
      ' CODDOCDESTAC = (SELECT CODDOCDESTAC FROM DESTACAMENTO WHERE IDDESTACAMENTO = ' + IntToStr(iDestacamento) + ' ) '; //Peterson Victor SOL233230/18354


   Try
      Try
         _qryAux := TCMQuery.Create(Nil);
         _qryAux.DatabaseName := FDbDestacamento.DataBaseName;
         _qryAux.SQL.Text := sSql;
         _qryAux.ExecSQL;
         Result := True;
      Except
         On E: Exception Do
            Begin
               MessageInfo := E.Message;
               Result := False;
            End;
      End;
   Finally
      _qryAux.Free;
   End;
End;

Function TCtrlDestacamento.LimpaDadosFinancAcertoContas(iDestacamento: Integer): Boolean;
Var
   _qryAux: TCMQuery;
   sSQL: String;
Begin
   sSQL := ' UPDATE ' + CR_LF +
      '   DESTACAMENTO ' + CR_LF +
      ' SET ' + CR_LF +
      '   CODDOCACERTO = NULL, FLGINTEGRARFINANC = ''N'', IDUSUARIOACERTO = NULL ' + CR_LF +
      ' WHERE ' + CR_LF +
      '   IDDESTACAMENTO = ' + IntToStr(iDestacamento);
   Try
      _qryAux := TCMQuery.Create(Nil);
      _qryAux.DatabaseName := FDbDestacamento.DataBaseName;
      _qryAux.SQL.Text := sSql;
      Try
         _qryAux.ExecSQL;
         Result := True;
      Except
         On E: Exception Do
            Begin
               MessageInfo := E.Message;
               Result := False;
            End;
      End;
   Finally
      _qryAux.Free;
   End;
End;

Procedure TCtrlDestacamento.carregarCidadeEstadoPaisSistema;
Var
   _CdsAux: TCMClientDataSet;
   sSql: String;
Begin
   sSql := ' SELECT ' + CR_LF;
   sSql := sSql + '   c.IDCIDADES, p.IDPAIS, e.CODESTADO ' + CR_LF;
   sSql := sSql + ' FROM ' + CR_LF;
   sSql := sSql + '   CIDADES c, ' + CR_LF;
   sSql := sSql + '   ESTADO e, ' + CR_LF;
   sSql := sSql + '   PAIS p, ' + CR_LF;
   sSql := sSql + '   ENDPESS ep ' + CR_LF;
   sSql := sSql + ' WHERE ' + CR_LF;
   sSql := sSql + '   c.IDESTADO = e.IDESTADO ' + CR_LF;
   sSql := sSql + '   AND e.IDPAIS = p.IDPAIS ' + CR_LF;
   sSql := sSql + '   AND ep.IDCIDADES = c.IDCIDADES ' + CR_LF;
   sSql := sSql + '   AND ep.IDPESSOA = ' + IntToStr(FSistema.IdEmpresa);

   _CdsAux := TCMClientDataSet.Create(Nil);
   _CdsAux.Data := GetDataPacket(sSql);

   FFundacaoCidade := _CdsAux.Fields[0].AsInteger;
   FFundacaoPais := _CdsAux.Fields[1].AsInteger;
   FFundacaoEstado := _CdsAux.Fields[2].AsString;

   _CdsAux.Free;
End;

Function TCtrlDestacamento.BuscarContaBancaria(idPessoa: Integer): Integer;
Var cdsTemp: TCMClientDataSet;
Begin
   Try
      cdsTemp := TCMClientDataSet.Create(Nil);
      cdsTemp.Data := GetDataPacket('SELECT IDCBANCARIA FROM CONTABANCARIA WHERE IDPESSOA = ' + IntToStr(idPessoa) + ' AND FLGCONTAPREF = 1 ');
      If cdsTemp.IsEmpty Then
         Result := 0
      Else
         Result := cdsTemp.Fields[0].AsInteger;
   Finally
      FreeAndNil(cdsTemp);
   End;
End;

Function TCtrlDestacamento.ObrigarContaBancaria: Boolean;
Var cdsTemp: TCMClientDataSet;
   sSql: String;
Begin
   Try
      cdsTemp := TCMClientDataSet.Create(Nil);
      sSql := 'SELECT F.FLGDADOSBANCARIOS       ' + #13 +
         '  FROM PORTADORFORMA PF, FORMARECPAG F, PARAMRH P ' + #13 +
         ' WHERE PF.IDPESSOA = F.IDPESSOA  ' + #13 +
         '   AND PF.RECPAG   = F.RECPAG    ' + #13 +
         '   AND PF.CODFORMA = F.CODFORMA  ' + #13 +
         '   AND PF.IDPESSOA = P.IDPESSOA  ' + #13 +
         '   AND PF.RECPAG   = P.RECPAGDES ' + #13 +
         '   AND PF.CODPORTFORMA = P.CODPORTFORMAPAG ' + #13 +
         '   AND P.IDPESSOA = ' + IntToStr(FSistema.IdEmpresa);
      cdsTemp.Data := GetDataPacket(sSql);
      Result := (cdsTemp.FieldByName('FLGDADOSBANCARIOS').AsString = 'S')
   Finally
      FreeAndNil(cdsTemp);
   End;
End;

//==============================================================================
// Função para integrar os Ítens de Despesa com o módulo Financeiro - CapCar
//==============================================================================

Function TCtrlDestacamento.IntegrarDstItemDespesaFinancContabil(
   iDestacamento: Integer;
   tipoEnvio: String;
   bContabiliza: Boolean;
   TipOper, sObservacao: String;
   var CodDocumento : integer): Boolean;            // SOL 185594 KTN 1910887 - Paulo Nobre
Var
   dDataPagamento: TDateTime;
   valorTotalDestacamento, valorTotalAcerto: Double;
   valorTotalDocumento, rNumDocumento: Double;
   sCodCentroCusto, sCodCentroRespon, sJustificativa: String;
   sDebCre, sHistComp: String;
   sOperacao, sSql: String;
   sHistCtb, tipoLancamento: String;
   iCodTipDoc, iPortadorForma, iCodForma: Integer;
   iPessoa, iCodFormaPag, iCodFormaRec, iIdCBancaria: Integer;
   iPlanoPrev, iPatro: Integer;
   iPrograma: Integer;
   iDestacado, iNumOrdem: Integer;
   iCodDocumento, iAtivProjeto: Integer;
   dPlnCodigo: Double;
   _CdsAux: TCMClientDataSet;
   sCodTipRecDes, sRecPag: String;
   sObjViagem, sTipoContrato: String;
   sReferencia, sCompldocumento: String;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);
   Result := False;
   Try
      If Not Self.InTransaction Then
         Self.StartTransaction;

      dNumDocumento := 0;  // SOL 185594 KTN 1910887 - Paulo Nobre

      MessageInfo := '';
      iPortadorForma := 0;
      FcdsDestacamento.Data := listarDestacamento(iDestacamento);
      iDestacado := FcdsDestacamento.FieldByName('IDPESSOA').AsInteger;
      sCodCentroCusto := FcdsDestacamento.FieldByName('CODCENTROCUSTO').AsString;
      sCodCentroRespon := FcdsDestacamento.FieldByName('CODCENTRORESPON').AsString;
      iCodFormaPag := FcdsDestacamento.FieldByName('CODFORMAPAG').AsInteger;
      iCodFormaRec := FcdsDestacamento.FieldByName('CODFORMAREC').AsInteger;
      iIdCBancaria := FcdsDestacamento.FieldByName('IDCBANCARIA').AsInteger;
      iAtivProjeto := -1;   //FcdsDestacamento.FieldByName('IDPROGRAMA').AsInteger; // SOL 207109

      // T I P O    D E    L A N Ç A M E N T O
      If tipoEnvio = 'A' Then // Adiantamentos
         Begin
            valorTotalDestacamento := TotalDestacamentoTipoDespesa(iDestacamento, 'A'); // Adiantamentos
            tipoLancamento := 'P'; // Pagamento
            iCodForma := iCodFormaPag;
            valorTotalDocumento := valorTotalDestacamento;
            dDataPagamento := FcdsDestacamento.FieldByName('DATAPAGTODESTAC').AsDateTime;
            sHistComp := 'Adiantamento de Viagem Nº: ' + IntToStr(iDestacamento);
            sCompldocumento := '1'; // Sequência 1
         End
      Else // Acerto de Contas
         Begin
            valorTotalAcerto := TotalDestacamentoTipoDespesa(iDestacamento, 'C'); // Acerto de Contas
            If valorTotalAcerto > 0 Then
               tipoLancamento := 'P' // Pagamento
            Else
               tipoLancamento := 'R'; // Recebimento

            iCodForma := iCodFormaRec;
            valorTotalDocumento := abs(valorTotalAcerto);
            dDataPagamento := FcdsDestacamento.FieldByName('DATAPAGTOACERTO').AsDateTime;
            sHistComp := 'Acerto de Contas de Viagem Nº: ' + IntToStr(iDestacamento);
            sCompldocumento := '2'; // Sequência 2
         End;

      If (FcdsParamRH.FieldByName('CODTIPDOCREC').isnull) Or (FcdsParamRH.FieldByName('CODTIPDOCPAG').isnull) Then
         Raise exception.Create('Parâmetro do Sistema -> Tipo De Documento, não Informado !')
      Else
         iCodTipDoc := iff(tipoLancamento = 'R', FcdsParamRH.FieldByName('CODTIPDOCREC').AsInteger, FcdsParamRH.FieldByName('CODTIPDOCPAG').AsInteger);

      If (FcdsParamRH.FieldByName('CODPORTFORMAREC').isnull) Or (FcdsParamRH.FieldByName('CODPORTFORMAPAG').isnull) Then
         Raise exception.Create('Parâmetro do Sistema -> Portador Forma, não Informado !')
      Else
         iPortadorForma := iff(tipoLancamento = 'R', FcdsParamRH.FieldByName('CODPORTFORMAREC').AsInteger, FcdsParamRH.FieldByName('CODPORTFORMAPAG').AsInteger);

      sRecPag := iff(tipoLancamento = 'R', 'R', 'P'); // Receber ou Pagar
      sDebCre := iff(tipoLancamento = 'R', 'D', 'C'); // Debitar ou Creditar

      If FCdsParamRH.FieldByName('IDPLANOPREV').AsInteger > 0 Then
         iPlanoPrev := FCdsParamRH.FieldByName('IDPLANOPREV').AsInteger
      Else
         iPlanoPrev := FCtrlListTerceirosRH.GetIdPlanoPrev(Sistema.IdEmpresa);

      If FCdsParamRH.FieldByName('IDPATRO').AsInteger > 0 Then
         iPatro := FCdsParamRH.FieldByName('IDPATRO').AsInteger
      Else
         iPatro := FCtrlListTerceirosRH.GetIdPatro(Sistema.IdEmpresa);

      // Inserir Fornecedor se este não existir e for para integrar com o CAP
      If (tipoLancamento = 'P') Then // Pagar
         Begin
            _Cds.Data := GetDataPacket('SELECT IDPESSOA FROM FORNSERV WHERE IDPESSOA = ' + IntToStr(iDestacado));
            If (_Cds.IsEmpty) Then
               FCtrlDocumento.ForCli.Inserir(
                  iDestacado, // IdPessoa
                  Sistema.IdEmpresa, // IdEmpresa
                  0, 0, 0, '', '', '', '',
                  tfcFornecedor); // TTipoForCli
         End
      Else // Receber
         Begin
            _Cds.Data := GetDataPacket('SELECT IDPESSOA FROM CLIENTEPESS WHERE IDPESSOA = ' + IntToStr(iDestacado));
            If (_Cds.IsEmpty) Then
               FCtrlDocumento.ForCli.Inserir(
                  iDestacado, // IdPessoa
                  Sistema.IdEmpresa, // IdEmpresa
                  0, 0, 0, '', '', '', '',
                  tfcCliente); // TTipoForCli
         End;

      // Gerar o Número Sequencial do Documento baseado no IdDestacamento
//      iNumOrdem := 1;
      rNumDocumento := iDestacamento;
{      While (FCtrlDocumento.ExisteNumDoc(sRecPag, iDestacamento, Sistema.IdEmpresa, rNumDocumento, '')) Do
         Begin
            Inc(iNumOrdem);
            rNumDocumento := StrToFloat(IntToStr(iDestacamento) + IntToStr(iNumOrdem));
         End;}

      iPrograma := FCtrlListTerceirosRH.GetIdProgramaCCusto(sCodCentroCusto, Sistema.IdEmpresa);
      If (iPrograma = 0) Then
         iPrograma := -1;

      // Parâmetros do CtrlDocumento
      FctrlDocumento.OpenTransaction := False;
      FctrlDocumento.Prepare(OpDocumento, odlEfetivo, sdocAberto);
      FctrlDocumento.UsaPlanoPatro := FSistema.UsaPlanoPatro;
      FctrlDocumento.IdUsuario := FSistema.idUsuario;
      FctrlDocumento.IdEspAcesso := FSistema.idEspAcesso;
      FctrlDocumento.IdModulo := FSistema.idModulo;
      FctrlDocumento.MessageInfo := '';

      // Obtendo a sequence
      iCodDocumento := FCtrlDocumento.GetSequenceDocumento;

      // Selecionando os Ítems de Despesa do Destacamento
      sSql := 'SELECT D.IDDESTACAMENTO, X.IDDSTITEMDESPESA AS IDITEM, S.DESCRICAO AS DSCITEM, X.INDOBJETIVO, F.TIPOCONTRATO, D.IDEMPRESA, D.IDPESSOA,  ' + CR_LF;
      sSql := sSql + '     CASE WHEN X.VLRITEM > 0 THEN ''P'' WHEN X.VLRITEM < 0 THEN ''R'' END AS TIPOMOV, X.VLRITEM  ' + CR_LF;
      sSql := sSql + 'FROM DESTACAMENTO D, DESTACAMENTOXITEMDESPESA X, DSTITEMDESPESA S, FUNCIONARIO F ' + CR_LF;
      sSql := sSql + 'WHERE D.IDDESTACAMENTO = ' + FloatToStr(iDestacamento) + CR_LF;
      sSql := sSql + '      AND D.IDDESTACAMENTO = X.IDDESTACAMENTO ' + CR_LF;
      sSql := sSql + '      AND D.IDPESSOA = F.IDPESSOA ' + CR_LF;
      sSql := sSql + '      AND X.IDDSTITEMDESPESA = S.IDDSTITEMDESPESA ' + CR_LF;
      sSql := sSql + '      AND S.FLGINTEGRARFIN = ''S'' ' + CR_LF; // Integrar
      sSql := sSql + '      AND S.FLGATIVA = ''S'' ' + CR_LF;
      If tipoEnvio = 'A' Then // Adiantamento
         sSql := sSql + 'AND S.TIPOQUALIFICACAO = ''A'' ' // DIÁRIAS, TAXI, TRANSPORTE, TRANSPORTE FUNCEF, HOSPEDAGEM (ADIANTAMENTOS)
      Else
         sSql := sSql + 'AND  S.TIPOQUALIFICACAO = ''C''  '; // Acerto de Contas
      sSql := sSql + 'ORDER BY D.IDDESTACAMENTO, X.IDDSTITEMDESPESA  ' + CR_LF;
      _CdsAux.Data := GetDataPacket(sSql);
      If Not _CdsAux.IsEmpty Then
         Begin
            _CdsAux.First;
            While Not _CdsAux.EOF Do
               Begin
                  If _CdsAux.Fieldbyname('INDOBJETIVO').asInteger = 0 Then
                     sObjViagem := 'Institucional'
                  Else If _CdsAux.Fieldbyname('INDOBJETIVO').asInteger = 1 Then
                     sObjViagem := 'Treinamento'
                  Else If _CdsAux.Fieldbyname('INDOBJETIVO').asInteger = 2 Then
                     sObjViagem := 'Audiência';

                  If _CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'E' Then
                     sTipoContrato := 'Efetivo'
                  Else If _CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'S' Then
                     sTipoContrato := 'LEF'
                  Else If _CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'T' Then
                     sTipoContrato := 'Terceirizado'
                  Else If _CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'G' Then
                     sTipoContrato := 'Estagiário'
                  Else If _CdsAux.Fieldbyname('TIPOCONTRATO').asString = '3' Then
                     sTipoContrato := 'Cessão'
                  Else If _CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'P' Then
                     sTipoContrato := 'Prop/Dir S/Vinc'
                  Else If _CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'A' Then
                     sTipoContrato := 'Autônomo';

                  // ********** Campo REFERENCIA - tabela DOCUMENTO - Aba Geral AP/AR - Campo Referência *************

                  // Empregados Quadro Próprio  (E)	                        Adiantamento viagens institucionais e audiências  (0,2)
                  If (_CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'E') And (_CdsAux.Fieldbyname('INDOBJETIVO').asInteger In [0, 2]) Then
                     sReferencia := 'DIACI 009/99';
                  // Empregados Quadro Próprio (E)	                        Adiantamento viagens de treinamento (1)
                  If (_CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'E') And (_CdsAux.Fieldbyname('INDOBJETIVO').asInteger = 1) Then
                     sReferencia := '2007/004';
                  // Empregados Cedidos (Cessão/Prop Dir s/ Vinc) (3, P)
                  If (_CdsAux.Fieldbyname('TIPOCONTRATO').asString = '3') Or (_CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'P') Then
                     sReferencia := '2007/012';
                  // Conselheiros e membros de comitês (A)
                  If (_CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'A') Then
                     sReferencia := '2008/029';

                  // ************ Campo UNIDNEGOC - tabela RATEIODOCUM - Aba Rateio - Campo Atividade/Projeto *********

                 // Empregados Quadro Próprio, Cedidos, Conselheiros e Membros de Comitês
                  If (_CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'E') Or
                     (_CdsAux.Fieldbyname('TIPOCONTRATO').asString = '3') Or
                     (_CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'P') Or // SOL 207109
                     (_CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'A') Then
                     //iAtivProjeto := 96; // Institucional       //Everson Cunha - SIG128175
                     iAtivProjeto := 55; //VG - Instituc. Diárias //Everson Cunha - SIG128175

                  // Empregados Quadro Próprio e Cedidos - área investimentos
                  If ((_CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'E')
                   Or (_CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'P')//Marcio Sanches Spinosa SOL 214421 Kintana 2042036
                   Or (_CdsAux.Fieldbyname('TIPOCONTRATO').asString = '3')) And
                     (FcdsDestacamento.FieldByName('IDPROGRAMA').AsInteger = 3) Then
                     //iAtivProjeto := 95; // Investimento        //Everson Cunha - SIG128175
                     iAtivProjeto := 55; //VG - Instituc. Diárias //Everson Cunha - SIG128175

                  // Viagens cujo objetivo principal seja audiência
                  If (_CdsAux.Fieldbyname('INDOBJETIVO').asInteger = 2) Then
                     //iAtivProjeto := 97; // Audiência           //Everson Cunha - SIG128175   
                     iAtivProjeto := 55; //VG - Instituc. Diárias //Everson Cunha - SIG128175

                  // Viagens cujo objetivo principal seja treinamento
                  If (_CdsAux.Fieldbyname('INDOBJETIVO').asInteger = 1) Then
                     //iAtivProjeto := 18; // T&D Específico      //Everson Cunha - SIG128175
                     iAtivProjeto := 391; //VG - Treinam. Diárias //Everson Cunha - SIG128175

                  // *********************************************************************************************

                  If LocalizaParametrosParaIntegracaoFinanceira(
                     _CdsAux.Fieldbyname('IDITEM').asInteger,
                     _CdsAux.Fieldbyname('INDOBJETIVO').asInteger, // Objetivo da Viagem
                     _CdsAux.Fieldbyname('TIPOCONTRATO').asString, // Tipo de Contrato
                     _CdsAux.Fieldbyname('TIPOMOV').asString,     // Pagar ou Receber
                     sCodTipRecDes) Then
                     Begin
                        // Carrega o Plano de Contas atualizando o registro "rPlaContas"
                        FctrlPlacontasCapCar.GetPlacontas(iPortadorForma,
                           iDestacado, // idforcli
                           FSistema.IdEmpresa, // idEmpresa
                           iPrograma, // idProg
                           //Marcio Sanches Spinosa SOL 208290 Kintana 2012043 - Inicio
//                           iPatro, // idPatro
                           iPlanoPrev,
                           //Marcio Sanches Spinosa SOL 208290 Kintana 2012043 - Fim
                           sCodCentroCusto, // codCentroCusto
                           sCodTipRecDes, // codtiporecdes
                           _CdsAux.Fieldbyname('tipomov').asString, // recpag
                           opldEfetivo, // operLanctoDocCapCar
                           False, // bLancaBaixa
                           rPlaContas, // PlaContas [var]
                           bContabiliza, // bIntegraContab
                           //Marcio Sanches Spinosa SOL 208290 Kintana 2012043 - Inicio
//                           iPlanoPrev); // planoContabil
                           FCtrlParamIntegra.Plano);
                           //Marcio Sanches Spinosa SOL 208290 Kintana 2012043 - Fim
                        If (rPlaContas.sPlaconta = '') Or (rPlaContas.iPlano <= 0) Then
                           Raise exception.Create('Conta Contábil não encontrada.');

                        If trim(FctrlPlacontasCapCar.MessageInfo) <> '' Then
                           Raise exception.Create(FctrlPlacontasCapCar.MessageInfo);

                        // Critério de Segregação
                        If Not FCtrlSegregacao.Active Then
                           FCtrlSegregacao.GetParams(FSistema.IdEmpresa);

                        iIdSegrCriter := FCtrlSegregacao.RetornaSegregaCriter(
                           FCtrlParamIntegra.Plano,
                           iPlanoPrev,
                           iPatro,
                           rPlaContas.sPlaconta,
                           sContaNada);

                        sHistCtb := GetHistoricoCapCar(FctrlModeloHistorico, // Obj : TCtrlModeloHistorico
                           FSistema.IdEmpresa, // IdPessoa
                           iff(_CdsAux.Fieldbyname('tipomov').asString = 'P', 3, 4), // IdModulo
                           1, // Tipo
                           sHistComp, // Historico complemento usado na aba principal do CAP/CAR
                           [// Args : array of String
                           FormatFloat('#0', rNumDocumento),
                              '',
                              FcdsDestacamento.FieldByName('NOMEDESTACADO').AsString,
                              FormatDateTime('dd/mm/yyyy', dDataPagamento),
                              FormatDateTime('dd/mm/yyyy', dDataPagamento),
                              sHistComp,
                              '',
                              ''
                              ]);

                        If FctrlModeloHistorico.MessageInfo <> '' Then
                           Raise exception.Create(FctrlModeloHistorico.MessageInfo);

                        // CONTABILIZAR PRIMEIRO, PARA SE OBTER PLNCODIGO
                        If Not EfetuarLancamentoContab(
                           iPatro,
                           iPlanoPrev,
                           sHistCtb,
                           sCodCentroCusto,
                           _CdsAux.Fieldbyname('vlritem').asFloat,
                           rNumDocumento,
                           dPlnCodigo,
                           dDataPagamento, //Everson Cunha - SIG60521
                           iAtivProjeto //Everson Cunha - SIG128175
                           ) Then
                           Raise exception.Create('Não foi possível efetuar o Lançamento Contábil.' + #13 + MessageInfo);

                        // Seta valores para a tabela RATEIODOCUM
                        FctrlDocumento.Rateiodocum.SetValues(
                           _CdsAux.Fieldbyname('vlritem').asFloat,
                           0,
                           0,
                           0,
                           FSistema.IdEmpresa,
                           iCodDocumento,
                           iAtivProjeto, // Atividade Projeto - Unidade de Negócio
                           0,
                           FSistema.idUsuario,
                           0,
                           FCtrlParamIntegra.Plano,
                           iPlanoPrev,
                           iPatro,
                           iPrograma,
                           0,
                           FSistema.IdEmpresa,
                           sCodTipRecDes,
                           _CdsAux.Fieldbyname('tipomov').asString,
                           sCodCentroRespon,
                           sCodCentroCusto,
                           '');
                     End
                  Else
                     Raise exception.Create('Parâmetro de Integração Financeira não localizado para:' + #13 + #13 +
                        'Nº Interno : ' + _CdsAux.Fieldbyname('IDDESTACAMENTO').asString + #13 +
                        'Item : ' + _CdsAux.Fieldbyname('DSCITEM').asString + ' - ( ' + iff(_CdsAux.Fieldbyname('tipomov').asString = 'P', 'Pagamento', 'Recebimento') + ' ) ' + #13 +
                        'Objetivo da Viagem : ' + sObjViagem + #13 +
                        'Tipo do Contrato : ' + sTipoContrato + #13 +
                        MessageInfo);

                  _CdsAux.Next;

               End;

            // Seta valores para a tabela DOCUMENTO
            FctrlDocumento.SetValues(
               iCodDocumento,
               rNumDocumento,
               sCompldocumento, // Complemento - COMPLDOCUMENTO
               '',
               sRecPag,
               '2', // Operação
               '',
               '',
               //Marcio Sanches Spinosa SOL 209932 Kintana 2042823 - Inicio
//               rPlaContas.sPlaconta, // Placonta
               rPlaContas.sPlacontaPass, // PlacontaPass
               //Marcio Sanches Spinosa SOL 209932 Kintana 2042823 - Fim
               sCodCentroCusto,
               '',
               '',
               '',
               '',
               '',
               '',
               sReferencia, // Referencia
               sObservacao, // Observação - Justificativa
               dDataPagamento, // Data de Lançamento e Vencimento
               Date, // Data de Emissão
               dDataPagamento, // Data Programada
               0, 0, 0, 0, 0, 0, 0, 0,
               iCodTipDoc,
               Sistema.idEmpresa,
               Sistema.idModulo,
               iDestacado,
               0,
               iIdCBancaria,
               //FCtrlParamIntegra.uNidNegoc, //Everson Cunha - SIG128175
               iAtivProjeto,                  //Everson Cunha - SIG128175
               FCtrlParamIntegra.Plano,
               0, 0, 0, 0, 0,
               Sistema.idUsuario,
               Sistema.idEmpresa,
               1,
               0,
               0,
               iPortadorForma,
               0,
               0,
               iCodforma,
               iIdSegrCriter);

            If trim(FctrlDocumento.MessageInfo) <> '' Then
               Raise exception.Create(FctrlDocumento.MessageInfo);

            // Seta valores para a tabela LANCTODOCUM
            FctrlDocumento.Lanctodocum.SetValues(
               dDataPagamento,
               iCodDocumento,
               0,
               valorTotalDocumento,
               0,
               valorTotalDocumento,
               //FCtrlParamIntegra.uNidNegoc, //Everson Cunha - SIG128175
               iAtivProjeto,                  //Everson Cunha - SIG128175
               strtoint(floattostr(dPlnCodigo)),
               0,
               FSistema.idUsuario,
               FSistema.idEmpresa,
               0,
               0,
               iCodTipDoc,
               0,
               0,
               '2',
               '',
               '',
               '',
               sHistComp, // Historico complemento usado na aba principal do CAP/CAR
               '',
               '',
               '',
               sDebCre,
               FSistema.idModulo,
               rPlaContas.iPlano,
               FSistema.UsaPlanoPatro,
               bContabiliza,
               iPortadorForma);

            If trim(FctrlDocumento.MessageInfo) <> '' Then
               Raise exception.Create(FctrlDocumento.MessageInfo);

            // Inserindo definitivamente o movimento nas tabelas
            If Not FctrlDocumento.Insert Then
               Raise exception.Create(FctrlDocumento.MessageInfo);

            // Atualizando o Destacamento com os numeros de documentos gerados
            sSql := ' UPDATE DESTACAMENTO ' + CR_LF;
            sSql := sSql + ' SET ' + CR_LF;
            sSql := sSql + iff(tipoEnvio = 'A', 'CODDOCDESTAC = ', 'CODDOCACERTO = ') + FloatToStr(FctrlDocumento.CodDocumento) + ', FLGINTEGRARFINANC = ''N'', ' + CR_LF;
            sSql := sSql + iff(tipoEnvio = 'A', 'IDUSUARIOSISTEMA = ', 'IDUSUARIOACERTO = ') + FloatToStr(FSistema.IdUsuario);
            sSql := sSql + ' WHERE IDDESTACAMENTO = ' + IntToStr(iDestacamento);
            If Not ExecSQL(sSql) Then
               Raise exception.Create(MessageInfo);

            If Self.InTransaction Then
               Self.Commit;

            CodDocumento  := iCodDocumento;  // SOL 185594 KTN 1910887 - Paulo Nobre
            dNumDocumento := rNumDocumento;  // SOL 185594 KTN 1910887 - Paulo Nobre

            Result := True;
         End;
   Except
      On E: Exception Do
         Begin
            If Self.InTransaction Then
               Self.Rollback;
            Result := False;
            Self.MessageInfo := E.Message;
         End;
   End;
   _CdsAux.Free;
End;

//==============================================================================
// Função para Efetuar o lançamento contábil
//==============================================================================

Function TCtrlDestacamento.EfetuarLancamentoContab(Const iPatro,
   iPlanoPrev: Integer;
   Const sHistCtb,
   sCodCentroCusto: String;
   Const valor: Double;
   Const rNumDoc: Double;
   Var dPlnCodigo: Double;
   dDataPagamento: TDateTime; //Everson Cunha - SIG60521
   iAtivProjeto: Integer //Everson Cunha - SIG128175
   ): Boolean;
Begin
   Result := False;
   Try
      FctrlLancamento.OpenTransaction := False;
      FctrlLancamento.MessageInfo := '';

      If Not FctrlLancamento.InsereLancaContab(
         '2', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
         FSistema.idEmpresa, // Empresa
         FSistema.idModulo, // Módulo de Origem
         FSistema.idUsuario, // Usuário Ativo
         FCtrlParamIntegra.Plano, // Plano de Contas
         //FCtrlParamIntegra.uNidNegoc, // Unidade de Negócio //Everson Cunha - SIG128175
         iAtivProjeto, // Unidade de Negócio                  //Everson Cunha - SIG128175
         rPlaContas.iSubConta, // Sub-Conta de Débito
         rPlaContas.iSubContaPass, // Sub-Conta de Crédito
         iPlanoPrev, // iPlanoPrev
         iPatro, // iPatro
         dPlnCodigo, // Número da Planilha
         0, // Número do Lançamento
         //FormatDateTime('dd/mm/yyyy', Date), // Data da Lancamento   //Everson Cunha - SIG60521
         FormatDateTime('dd/mm/yyyy', dDataPagamento),                 //Everson Cunha - SIG60521
         FormatFloat('#0', rNumDoc), // Número do Documento
         sHistCtb, // 1ª Linha do Histórico
         '', // 2ª Linha do Histórico
         '', // 3ª Linha do Histórico
         '', // 4ª Linha do Histórico
         '', // 5ª Linha do Histórico
         sTipOper, // Sub-Programa (TIPCODIGO)
         sCodCentroCusto, // Centro de Custo para Débito
         rPlaContas.sPlaconta, // Conta para Débito
         sCodCentroCusto, // Centro de Custo para Crédito
         rPlaContas.sPlacontaPass, // Conta para Crédito
         '', // Código do Histórico Padrão
         Valor, // Valor do Lançamento
         True, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
         FSistema.UsaPlanoPatro, // Indica se usa Plano da Patrocinadora
         iIdSegrCriter, // Criterio de segregação
         Date) Then
         Raise exception.Create(FctrlLancamento.MessageInfo)
      Else
         Begin
            If FctrlLancamento.RetornoPlnCodigo > 0 Then
               dPlnCodigo := FctrlLancamento.RetornoPlnCodigo;
         End;
      Result := True;
   Except
      On E: Exception Do
         Begin
            If Self.MessageInfo = '' Then
               Self.MessageInfo := e.Message
            Else
               Self.MessageInfo := Self.MessageInfo + #13#10 + e.Message;
            Result := False;
         End;
   End;
End;

//==============================================================================
// Integrando com a Folha de Pagamento
//==============================================================================

Function TCtrlDestacamento.IntegrarDstItemDespesaFolhaPagamento(IdDestacamento: integer; tipoEnvio, AnoMesRef: String): Boolean;
Var
   _CdsRubricaIndiv, _CdsAux: TCMClientDataSet;
   sSql, sTipoContrato, sObjViagem: String;
   iNumSeq, idProvento, idRegra: Integer;
Begin
   Try
      Try
         iNumSeq := 0;
         Result := False;
         MessageInfo := '';

         StartTransaction;

         _CdsAux := TCMClientDataSet.Create(Nil);
         _CdsRubricaIndiv := TCMClientDataSet.Create(Nil);
         _CdsRubricaIndiv.Data := FCtrlRubricaIndiv.ListRubricaIndiv(-1, 0, 0, 0);

        //Everson Cunha - SIG74816 - Início
        //Verifica se cada item do destacamento possui parametrização com a Folha
        sSql :=
        'SELECT DI.DESCRICAO, DPI.IDPROVENTO, DECODE(DXI.INDOBJETIVO, 0, ''Institucional'', 1, ''Treinamento'', 2, ''Audiência'') INDOBJETIVO, ' + #13#10 +
        '       DECODE(F.TIPOCONTRATO, ''E'', ''Efetivo'', ''S'', ''LEF'', ''T'', ''Terceirizado'', ''G'', ''Estagiário'',   ' + #13#10 +
        '                              ''3'', ''Cessão'', ''P'', ''Prop/Dir S/Vinc'', ''A'', ''Autônomo'') TIPOCONTRATO      ' + #13#10 +
        '  FROM CM.DESTACAMENTO D' + #13#10 +
        '  JOIN CM.DESTACAMENTOXITEMDESPESA DXI ON D.IDDESTACAMENTO = DXI.IDDESTACAMENTO' + #13#10 +
        '  JOIN CM.DSTITEMDESPESA DI ON DI.IDDSTITEMDESPESA = DXI.IDDSTITEMDESPESA' + #13#10 +
        '  JOIN CM.FUNCIONARIO F ON F.IDPESSOA = D.IDPESSOA' + #13#10 +
        '  LEFT JOIN CM.DSTPARAMINTEGRACAO DPI ON DPI.INDTIPO = DXI.IDDSTITEMDESPESA AND DPI.TIPOVIAGEM = DXI.INDOBJETIVO AND DPI.FLGDESCONTO = 0' + #13#10 +
        '                      AND DPI.TIPOCONTRATO = F.TIPOCONTRATO' + #13#10 +
        ' WHERE DXI.IDDESTACAMENTO = ' + FloatToStr(IdDestacamento) + #13#10 +
        '   AND DI.FLGATIVA = ''S''' + #13#10 +
        '   AND DI.FLGINTEGRARFOL = ''S''' + #13#10 +
        '   AND DPI.IDPROVENTO IS NULL' + #13#10 ;

        If tipoEnvio = 'A' Then
           sSql := sSql + '   AND DI.TIPOQUALIFICACAO = ''A'' ' + #13#10
        Else
           sSql := sSql + '   AND DI.TIPOQUALIFICACAO = ''C'' ' + #13#10 ;

        sSql := sSql + ' UNION ALL' + #13#10 +

       'SELECT DISTINCT DI.DESCRICAO, DPI.IDPROVENTO, DECODE(DXI.INDOBJETIVO, 0, ''Institucional'', 1, ''Treinamento'', 2, ''Audiência'') INDOBJETIVO, ' + #13#10 +
        '       DECODE(F.TIPOCONTRATO, ''E'', ''Efetivo'', ''S'', ''LEF'', ''T'', ''Terceirizado'', ''G'', ''Estagiário'',   ' + #13#10 +
        '                              ''3'', ''Cessão'', ''P'', ''Prop/Dir S/Vinc'', ''A'', ''Autônomo'') TIPOCONTRATO      ' + #13#10 +
        '  FROM CM.DESTACAMENTO D' + #13#10 +
        '  JOIN CM.DESTACAMENTOXITEMDESPESA DXI ON D.IDDESTACAMENTO = DXI.IDDESTACAMENTO' + #13#10 +
        '  JOIN CM.DSTITEMDESPESA DII ON DII.IDDSTITEMDESPESA = DXI.IDDSTITEMDESPESA' + #13#10 +
        '  JOIN CM.DSTITEMDESPESA DI ON DI.IDDSTITEMDESPESA = ' + iff(tipoEnvio = 'A', '-1', '-2') + #13#10 +
        '  JOIN CM.FUNCIONARIO F ON F.IDPESSOA = D.IDPESSOA' + #13#10 +
        '  LEFT JOIN CM.DSTPARAMINTEGRACAO DPI ON DPI.INDTIPO = DI.IDDSTITEMDESPESA AND DPI.TIPOVIAGEM = DXI.INDOBJETIVO AND DPI.FLGDESCONTO = 1' + #13#10 +
        '                      AND DPI.TIPOCONTRATO = F.TIPOCONTRATO' + #13#10 +
        ' WHERE DXI.IDDESTACAMENTO = ' + FloatToStr(IdDestacamento) + #13#10 +
        '   AND DI.FLGATIVA = ''S''' + #13#10 +
        '   AND DI.FLGINTEGRARFOL = ''S''' + #13#10 +
        '   AND DPI.IDPROVENTO IS NULL' + #13#10 +
        '   AND DI.TIPOQUALIFICACAO = ''T'' ' + #13#10 ;

        If tipoEnvio = 'A' Then // Adiantamento
           sSql := sSql + '   AND DII.TIPOQUALIFICACAO = ''A'' ' + #13#10
        Else
           sSql := sSql + '   AND DII.TIPOQUALIFICACAO = ''C'' ' + #13#10 ;

        sSql := sSql + ' ORDER BY DI.DESCRICAO, INDOBJETIVO ' + #13#10 ;

        _CdsAux.Data := GetDataPacket(sSql);

        If _CdsAux.IsEmpty Then //Todas as parametrizações estão feitas
        begin
          //SQL com SUM por rubrica
          sSql :=
          'SELECT D.IDPESSOA, D.IDEMPRESA, SUM(DXI.VLRITEM) VLRITEM, PD.IDPROVENTO, PD.IDREGRA' + #13#10 +
          '  FROM CM.DESTACAMENTO D' + #13#10 +
          '  JOIN CM.DESTACAMENTOXITEMDESPESA DXI ON D.IDDESTACAMENTO = DXI.IDDESTACAMENTO' + #13#10 +
          '  JOIN CM.DSTITEMDESPESA DI ON DI.IDDSTITEMDESPESA = DXI.IDDSTITEMDESPESA' + #13#10 +
          '  JOIN CM.FUNCIONARIO F ON F.IDPESSOA = D.IDPESSOA' + #13#10 +
          '  JOIN CM.DSTPARAMINTEGRACAO DPI ON DPI.INDTIPO = DXI.IDDSTITEMDESPESA AND DPI.TIPOVIAGEM = DXI.INDOBJETIVO' + #13#10 +
          '                                AND DPI.FLGDESCONTO = 0 AND DPI.TIPOCONTRATO = F.TIPOCONTRATO' + #13#10 +
          '  JOIN CM.PROVDESC PD ON PD.IDPROVENTO = DPI.IDPROVENTO' + #13#10 +
          ' WHERE DXI.IDDESTACAMENTO = ' + FloatToStr(IdDestacamento) + #13#10 +
          '   AND DI.FLGATIVA = ''S''' + #13#10 +
          '   AND DI.FLGINTEGRARFOL = ''S''' + #13#10 ;

          If tipoEnvio = 'A' Then
             sSql := sSql + '   AND DI.TIPOQUALIFICACAO = ''A'' ' + #13#10
          Else
             sSql := sSql + '   AND DI.TIPOQUALIFICACAO = ''C'' ' + #13#10 ;

          sSql := sSql + ' GROUP BY D.IDPESSOA, D.IDEMPRESA, PD.IDPROVENTO, PD.IDREGRA' + #13#10 +

          ' UNION ALL' + #13#10 +

          'SELECT D.IDPESSOA, D.IDEMPRESA, SUM(DXI.VLRITEM) VLRITEM, PD.IDPROVENTO, PD.IDREGRA' + #13#10 +
          '  FROM CM.DESTACAMENTO D' + #13#10 +
          '  JOIN CM.DESTACAMENTOXITEMDESPESA DXI ON D.IDDESTACAMENTO = DXI.IDDESTACAMENTO' + #13#10 +
          '  JOIN CM.DSTITEMDESPESA DII ON DII.IDDSTITEMDESPESA = DXI.IDDSTITEMDESPESA' + #13#10 +
          '  JOIN CM.DSTITEMDESPESA DI ON DI.IDDSTITEMDESPESA = ' + iff(tipoEnvio = 'A', '-1', '-2') + #13#10 +
          '  JOIN CM.FUNCIONARIO F ON F.IDPESSOA = D.IDPESSOA' + #13#10 +
          '  JOIN CM.DSTPARAMINTEGRACAO DPI ON DPI.INDTIPO = DI.IDDSTITEMDESPESA AND DPI.TIPOVIAGEM = DXI.INDOBJETIVO' + #13#10 +
          '                                    AND DPI.FLGDESCONTO = 1 AND DPI.TIPOCONTRATO = F.TIPOCONTRATO' + #13#10 +
          '  JOIN CM.PROVDESC PD ON PD.IDPROVENTO = DPI.IDPROVENTO' + #13#10 +
          ' WHERE DXI.IDDESTACAMENTO = ' + FloatToStr(IdDestacamento) + #13#10 +
          '   AND DI.FLGATIVA = ''S''' + #13#10 +
          '   AND DI.FLGINTEGRARFOL = ''S''' + #13#10 +
          '   AND DI.TIPOQUALIFICACAO = ''T''' + #13#10 ;

          If tipoEnvio = 'A' Then // Adiantamento
             sSql := sSql + '   AND DII.TIPOQUALIFICACAO = ''A'' ' + #13#10
          Else
             sSql := sSql + '   AND DII.TIPOQUALIFICACAO = ''C'' ' + #13#10 ;

          sSql := sSql + ' GROUP BY D.IDPESSOA, D.IDEMPRESA, PD.IDPROVENTO, PD.IDREGRA' + #13#10 +

          ' ORDER BY PD.IDPROVENTO';

          _CdsAux.Data := GetDataPacket(sSql);
          _CdsAux.First;

          While Not _CdsAux.EOF Do
          Begin
            //If iNumSeq = 0 Then //Everson Cunha - SIG87510
               iNumSeq := FCtrlRubricaIndiv.UltimoNumSeq(_CdsAux.Fieldbyname('IDPESSOA').asInteger, _CdsAux.Fieldbyname('IDPROVENTO').asInteger, _CdsAux.Fieldbyname('IDEMPRESA').asInteger) + 1;
            //Else                //Everson Cunha - SIG87510
            //   inc(iNumSeq);    //Everson Cunha - SIG87510

            _CdsRubricaIndiv.Insert;
            _CdsRubricaIndiv.FieldByName('IDEMPRESA').asInteger := _CdsAux.Fieldbyname('IDEMPRESA').asInteger;
            _CdsRubricaIndiv.FieldByName('IDPESSOA').asInteger := _CdsAux.Fieldbyname('IDPESSOA').asInteger;
            _CdsRubricaIndiv.FieldByName('IDRUBRICA').asInteger := _CdsAux.Fieldbyname('IDPROVENTO').asInteger;
            _CdsRubricaIndiv.FieldByName('IDMOTIVO').asInteger := 1; // Folha Mensal Empregados
            _CdsRubricaIndiv.FieldByName('SEQRUBRICAINDIV').asInteger := iNumSeq;
            _CdsRubricaIndiv.FieldByName('NUMOCORRENCIAS').asInteger := 0; // Só ocorre uma vez
            _CdsRubricaIndiv.FieldByName('FLGPERMANENTE').asInteger := 0; // Não é rubrica permanente
            _CdsRubricaIndiv.FieldByName('FLGTPRUBMANUT').asString := '2';
            _CdsRubricaIndiv.FieldByName('PARCELAS').asInteger := 1;
            _CdsRubricaIndiv.FieldByName('IDREGRACALCULO').asFloat := _CdsAux.Fieldbyname('IDREGRA').asInteger;
            _CdsRubricaIndiv.FieldByName('ANOMESINICIO').asString := AnoMesRef;
            _CdsRubricaIndiv.FieldByName('ANOMESREF').asString := AnoMesRef;
            _CdsRubricaIndiv.FieldByName('VALORRUBRICA').asFloat := _CdsAux.Fieldbyname('VLRITEM').asFloat;
            _CdsRubricaIndiv.Post;

            _CdsAux.Next;
          end;

          If (_CdsRubricaIndiv.Active) And Not (_CdsRubricaIndiv.IsEmpty) Then
          Begin
            Result := ApplyCds(_CdsRubricaIndiv, FDbRubricaIndiv, [], []);

            If Not (Result) Then
              Raise Exception.Create(FDbRubricaIndiv.MessageInfo);
          End;

          // Atualizando o Destacamento
          sSql := ' UPDATE DESTACAMENTO ' + CR_LF;
          sSql := sSql + ' SET  ' + CR_LF;
          sSql := sSql + ' FLGINTEGRARFOLHA = ''N'', ' + CR_LF;
          sSql := sSql + iff(tipoEnvio = 'A', 'FLGLANCAFOLHA = ', 'FLGLANCAFOLHAACERTO = ') + FloatToStr(1) + ',' + CR_LF;
          sSql := sSql + iff(tipoEnvio = 'A', 'ANOMESREFADIANT = ', 'ANOMESREFACERTO = ') + quotedstr(AnoMesRef) + CR_LF;
          sSql := sSql + ', TIPOMOTIVONAOINTEGRACAO = 0' + CR_LF; // 0 - Sem problemas na folha de adiantamento
          sSql := sSql + ' WHERE IDDESTACAMENTO = ' + IntToStr(IdDestacamento);

          If Not ExecSQL(sSql) Then
             Raise exception.Create(MessageInfo);

          If Self.InTransaction Then
             Commit;

          Result := true;

        end
        else
        begin //Necessita de parametrização
          _CdsAux.First;
          Raise exception.Create('Parâmetro de Integração da Folha não localizado para:' + #13 +
                                 //'Nº Interno : ' + FloatToStr(IdDestacamento) + #13 + //Everson Cunha - SIG87510
                                 'Item : ' + _CdsAux.Fieldbyname('DESCRICAO').asString + #13 +
                                 'Objetivo da Viagem : ' + _CdsAux.Fieldbyname('INDOBJETIVO').asString + #13 +
                                 'Tipo do Contrato : ' + _CdsAux.Fieldbyname('TIPOCONTRATO').asString + #13 +
                                  MessageInfo);
        end;

        {
         // Selecionando as Ítems de Despesa do Destacamento
         sSql := 'SELECT D.IDDESTACAMENTO, D.IDEMPRESA, D.IDPESSOA, X.IDDSTITEMDESPESA AS IDITEM,   ' + CR_LF;
         sSql := sSql + 'CASE WHEN X.VLRITEM > 0 THEN 0 WHEN X.VLRITEM < 0 THEN 1 END AS FLGDESCONTO, ' + CR_LF;
         sSql := sSql + 'X.VLRITEM, X.INDOBJETIVO, S.DESCRICAO AS DSCITEM, F.TIPOCONTRATO' + CR_LF;
         sSql := sSql + 'FROM DESTACAMENTO D, DESTACAMENTOXITEMDESPESA X, DSTITEMDESPESA S, FUNCIONARIO F ' + CR_LF;
         sSql := sSql + 'WHERE D.IDDESTACAMENTO = ' + FloatToStr(IdDestacamento) + CR_LF;
         sSql := sSql + '      AND D.IDDESTACAMENTO = X.IDDESTACAMENTO ' + CR_LF;
         sSql := sSql + '      AND D.IDPESSOA = F.IDPESSOA ' + CR_LF;
         sSql := sSql + '      AND X.IDDSTITEMDESPESA = S.IDDSTITEMDESPESA ' + CR_LF;
         sSql := sSql + '      AND S.FLGINTEGRARFOL = ''S'' ' + CR_LF; // Integrar
         sSql := sSql + '      AND S.FLGATIVA = ''S'' ' + CR_LF;

         If tipoEnvio = 'A' Then // Adiantamento
         begin
           sSql := sSql + '      AND S.TIPOQUALIFICACAO = ''A'' ' + CR_LF; // DIÁRIAS, TAXI, TRANSPORTE, TRANSPORTE FUNCEF, HOSPEDAGEM - (ADIANTAMENTOS)
         end
         Else
         begin
           sSql := sSql + 'AND  S.TIPOQUALIFICACAO = ''C''  '; // Acerto de Contas
         end;

         sSql := sSql + 'ORDER BY D.IDDESTACAMENTO, X.IDDSTITEMDESPESA  ' + CR_LF;

        _CdsAux.Data := GetDataPacket(sSql);

        If Not _CdsAux.IsEmpty Then
        Begin
          _CdsAux.First;
          While Not _CdsAux.EOF Do
          Begin
            sTipoContrato := '';
            sObjViagem := '';

            If _CdsAux.Fieldbyname('INDOBJETIVO').asInteger = 0 Then
               sObjViagem := 'Institucional'
            Else
            If _CdsAux.Fieldbyname('INDOBJETIVO').asInteger = 1 Then
               sObjViagem := 'Treinamento'
            Else
            If _CdsAux.Fieldbyname('INDOBJETIVO').asInteger = 2 Then
               sObjViagem := 'Audiência';

            If _CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'E' Then
               sTipoContrato := 'Efetivo'
            Else
            If _CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'S' Then
               sTipoContrato := 'LEF'
            Else
            If _CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'T' Then
               sTipoContrato := 'Terceirizado'
            Else
            If _CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'G' Then
               sTipoContrato := 'Estagiário'
            Else
            If _CdsAux.Fieldbyname('TIPOCONTRATO').asString = '3' Then
               sTipoContrato := 'Cessão'
            Else
            If _CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'P' Then
               sTipoContrato := 'Prop/Dir S/Vinc'
            Else
            If _CdsAux.Fieldbyname('TIPOCONTRATO').asString = 'A' Then
               sTipoContrato := 'Autônomo';

            If LocalizaParametrosParaIntegracaoFolhaPagto(
               _CdsAux.Fieldbyname('IDITEM').asInteger,
               _CdsAux.Fieldbyname('INDOBJETIVO').asInteger,
               _CdsAux.Fieldbyname('FLGDESCONTO').asInteger,
               _CdsAux.Fieldbyname('TIPOCONTRATO').asString,
               idProvento,
               idRegra) Then
            Begin
              If iNumSeq = 0 Then
                 iNumSeq := FCtrlRubricaIndiv.UltimoNumSeq(_CdsAux.Fieldbyname('IDPESSOA').asInteger, idProvento, _CdsAux.Fieldbyname('IDEMPRESA').asInteger) + 1
              Else
                inc(iNumSeq);

              _CdsRubricaIndiv.Insert;
              _CdsRubricaIndiv.FieldByName('IDEMPRESA').asInteger := _CdsAux.Fieldbyname('IDEMPRESA').asInteger;
              _CdsRubricaIndiv.FieldByName('IDPESSOA').asInteger := _CdsAux.Fieldbyname('IDPESSOA').asInteger;
              _CdsRubricaIndiv.FieldByName('IDRUBRICA').asInteger := idProvento;
              _CdsRubricaIndiv.FieldByName('IDMOTIVO').asInteger := 1; // Folha Mensal Empregados
              _CdsRubricaIndiv.FieldByName('SEQRUBRICAINDIV').asInteger := iNumSeq;
              _CdsRubricaIndiv.FieldByName('NUMOCORRENCIAS').asInteger := 0; // Só ocorre uma vez
              _CdsRubricaIndiv.FieldByName('FLGPERMANENTE').asInteger := 0; // Não é rubrica permanente
              _CdsRubricaIndiv.FieldByName('FLGTPRUBMANUT').asString := '2';
              _CdsRubricaIndiv.FieldByName('PARCELAS').asInteger := 1;
              _CdsRubricaIndiv.FieldByName('IDREGRACALCULO').asFloat := idRegra;
              _CdsRubricaIndiv.FieldByName('ANOMESINICIO').asString := AnoMesRef;
              _CdsRubricaIndiv.FieldByName('ANOMESREF').asString := AnoMesRef;
              _CdsRubricaIndiv.FieldByName('VALORRUBRICA').asFloat := _CdsAux.Fieldbyname('VLRITEM').asFloat;
              _CdsRubricaIndiv.Post;
            End
            Else
              Raise exception.Create('Parâmetro de Integração da Folha não localizado para:' + #13 + #13 +
                                     'Nº Interno : ' + _CdsAux.Fieldbyname('IDDESTACAMENTO').asString + #13 +
                                     'Item : ' + _CdsAux.Fieldbyname('DSCITEM').asString + #13 +
                                     'Objetivo da Viagem : ' + sObjViagem + #13 +
                                     'Tipo do Contrato : ' + sTipoContrato + #13 +
                                     MessageInfo);

            _CdsAux.Next;

          End;

          If (_CdsRubricaIndiv.Active) And Not (_CdsRubricaIndiv.IsEmpty) Then
          Begin
            Result := ApplyCds(_CdsRubricaIndiv, FDbRubricaIndiv, [], []);

            If Not (Result) Then
               Raise Exception.Create(FDbRubricaIndiv.MessageInfo);

          End;

          // Atualizando o Destacamento
          sSql := ' UPDATE DESTACAMENTO ' + CR_LF;
          sSql := sSql + ' SET  ' + CR_LF;
          sSql := sSql + ' FLGINTEGRARFOLHA = ''N'', ' + CR_LF;
          sSql := sSql + iff(tipoEnvio = 'A', 'FLGLANCAFOLHA = ', 'FLGLANCAFOLHAACERTO = ') + FloatToStr(1) + ',' + CR_LF;
          sSql := sSql + iff(tipoEnvio = 'A', 'ANOMESREFADIANT = ', 'ANOMESREFACERTO = ') + quotedstr(AnoMesRef) + CR_LF;
          sSql := sSql + ', TIPOMOTIVONAOINTEGRACAO = 0' + CR_LF; // 0 - Sem problemas na folha de adiantamento
          sSql := sSql + ' WHERE IDDESTACAMENTO = ' + IntToStr(IdDestacamento);

          If Not ExecSQL(sSql) Then
             Raise exception.Create(MessageInfo);

          If Self.InTransaction Then
             Commit;

          Result := true;
        End;

        }//Everson Cunha - SIG74816 - Fim

      Except
        On E: Exception Do
        Begin
          //MessageInfo := E.Message; //Everson Cunha - SIG87510
          MessageInfo := 'Nº Interno : ' + FloatToStr(IdDestacamento) + #13 + #13 + E.Message; //Everson Cunha - SIG87510

          Result := false;

          If Self.InTransaction Then
             Rollback;
        End;
      End;
   Finally
     FreeAndNil(_CdsRubricaIndiv);
     FreeAndNil(_CdsAux);
   End;
End;

Function TCtrlDestacamento.LocalizaParametrosParaIntegracaoFinanceira(iditem, tipoviagem: integer; tipcontrato, tipomov: String; Var sCodTipRecDes: String): Boolean;
Var qryAux: Twwquery;
Begin
   Result := False;
   qryAux := Twwquery.Create(Nil);
   qryAux.DataBaseName := 'BaseDados';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT D.CODTIPRECDES                ');
   qryAux.SQL.Add('FROM DSTPARAMINTEGRACAO D          ');
   qryAux.SQL.Add('WHERE D.INDTIPO = ' + IntToStr(iditem));
   qryAux.SQL.Add('      AND D.TIPOVIAGEM = ' + IntToStr(tipoviagem));
   qryAux.SQL.Add('      AND D.TIPOCONTRATO = ' + quotedstr(tipcontrato));  //Paulo Nobre SOL 205125 KTN 1984450
   qryAux.SQL.Add('      AND D.RECPAG = ' + quotedstr(tipomov));
   qryAux.Open;
   If Not qryAux.EOF Then
      Begin
         sCodTipRecDes := qryAux.fieldbyname('CODTIPRECDES').asString;
         Result := True;
      End;

   FreeAndNil(qryAux);
End;

Function TCtrlDestacamento.LocalizaParametrosParaIntegracaoFolhaPagto(iditem, tipoviagem, flgDesconto: integer; tipcontrato: String; Var idProvento, idRegra: Integer): Boolean;
Var qryAux: Twwquery;
Begin
   Result := False;
   qryAux := Twwquery.Create(Nil);
   qryAux.DataBaseName := 'BaseDados';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT D.IDPROVENTO, PD.IDREGRA                           ');
   qryAux.SQL.Add('FROM DSTPARAMINTEGRACAO D, RUBRICAXPESS RP, PROVDESC PD   ');
   qryAux.SQL.Add('WHERE D.IDPROVENTO = RP.IDRUBRICA         ');
   qryAux.SQL.Add('     AND RP.IDRUBRICA = PD.IDPROVENTO    ');
   qryAux.SQL.Add('     AND RP.IDPESSOA = 1                 '); // Funcef
   qryAux.SQL.Add('     AND D.INDTIPO = ' + IntToStr(iditem));
   qryAux.SQL.Add('     AND D.TIPOVIAGEM = ' + IntToStr(tipoviagem));
   qryAux.SQL.Add('     AND D.FLGDESCONTO = ' + IntToStr(flgDesconto));
   qryAux.SQL.Add('     AND D.TIPOCONTRATO = ' + quotedstr(tipcontrato));
   qryAux.SQL.Add('     AND PD.FLGTPRUBRICA LIKE ''%F%''    ');
   qryAux.Open;
   If Not qryAux.EOF Then
      Begin
         idProvento := qryAux.fieldbyname('IDPROVENTO').asInteger;
         idRegra := qryAux.fieldbyname('IDREGRA').asInteger;
         Result := True;
      End;

   FreeAndNil(qryAux);
End;

Function TCtrlDestacamento.ExcluirDadosDaIntegracaoFolhaPagto(IdDestacamento, IdPessoa: integer; tipoEnvio, AnoMesRef, NomeDestacado: String): Boolean;
Var _CdsAux, _CdsAux2: TCMClientDataSet;
   sSql, sSql2: String;
   idProvento, idRegra: Integer;
Begin
   Try
      Try
         Result := False;
         _CdsAux := TCMClientDataSet.Create(Nil);
         _CdsAux2 := TCMClientDataSet.Create(Nil);
         MessageInfo := '';

         // Verificando se a Folha foi efetivada para o Ano e Mes de cobrança e Destacado
         sSql := ' SELECT MESCOBRANCA  ' + CR_LF;
         sSql := sSql + ' FROM HISTRUBSAL          ' + CR_LF;
         //sSql := sSql + ' WHERE MESCOBRANCA = ' + QuotedStr(AnoMesRef) + CR_LF; //Everson Cunha - SIG87510
         sSql := sSql + ' WHERE MES = ' + QuotedStr(AnoMesRef) + CR_LF;           //Everson Cunha - SIG87510
         sSql := sSql + '       AND IDPESSOA = ' + inttoStr(IdPessoa) + CR_LF;
         sSql := sSql + '       AND IDMOTIVO = 1 ' + CR_LF; // Folha Mensal Empregados

         _CdsAux2.Data := GetDataPacket(sSql);

         If _CdsAux2.IsEmpty Then
            Begin
              //Everson Cunha - SIG74816 - Início
              sSql :=
              'SELECT DISTINCT DPI.IDPROVENTO, SUM(DXI.VLRITEM) VLRITEM' + #13#10 +
              '  FROM CM.DESTACAMENTO D' + #13#10 +
              '  JOIN CM.DESTACAMENTOXITEMDESPESA DXI ON D.IDDESTACAMENTO = DXI.IDDESTACAMENTO' + #13#10 +
              '  JOIN CM.DSTITEMDESPESA DI ON DI.IDDSTITEMDESPESA = DXI.IDDSTITEMDESPESA' + #13#10 +
              '  JOIN CM.FUNCIONARIO F ON F.IDPESSOA = D.IDPESSOA' + #13#10 +
              '  JOIN CM.DSTPARAMINTEGRACAO DPI ON DPI.INDTIPO = DXI.IDDSTITEMDESPESA AND DPI.TIPOVIAGEM = DXI.INDOBJETIVO' + #13#10 +
              '                                  AND DPI.FLGDESCONTO = 0 AND DPI.TIPOCONTRATO = F.TIPOCONTRATO' + #13#10 +
              ' WHERE DXI.IDDESTACAMENTO = ' + FloatToStr(IdDestacamento) + #13#10 +
              '   AND DI.FLGINTEGRARFOL = ''S''' + #13#10 ;

              If tipoEnvio = 'A' Then // Adiantamento
                  sSql := sSql + '   AND DI.TIPOQUALIFICACAO = ''A'' ' + #13#10
              Else
                  sSql := sSql + '   AND DI.TIPOQUALIFICACAO = ''C'' ' + #13#10 ;

              sSql := sSql + ' GROUP BY DPI.IDPROVENTO ' + #13#10 +
              
              ' UNION ALL' + #13#10 +

              'SELECT DISTINCT DPI.IDPROVENTO, SUM(DXI.VLRITEM) VLRITEM' + #13#10 +
              '  FROM CM.DESTACAMENTO D' + #13#10 +
              '  JOIN CM.DESTACAMENTOXITEMDESPESA DXI ON D.IDDESTACAMENTO = DXI.IDDESTACAMENTO' + #13#10 +
              '  JOIN CM.DSTITEMDESPESA DII ON DII.IDDSTITEMDESPESA = DXI.IDDSTITEMDESPESA' + #13#10 +
              '  JOIN CM.DSTITEMDESPESA DI ON DI.IDDSTITEMDESPESA = ' + iff(tipoEnvio = 'A', '-1', '-2') + #13#10 +
              '  JOIN CM.FUNCIONARIO F ON F.IDPESSOA = D.IDPESSOA' + #13#10 +
              '  JOIN CM.DSTPARAMINTEGRACAO DPI ON DPI.INDTIPO = DI.IDDSTITEMDESPESA AND DPI.TIPOVIAGEM = DXI.INDOBJETIVO' + #13#10 +
              '                              AND DPI.FLGDESCONTO = 1 AND DPI.TIPOCONTRATO = F.TIPOCONTRATO' + #13#10 +
              ' WHERE DXI.IDDESTACAMENTO = ' + FloatToStr(IdDestacamento) + #13#10 +
              '   AND DI.FLGINTEGRARFOL = ''S''' + #13#10 +
              '   AND DI.TIPOQUALIFICACAO = ''T''' + #13#10 ;

              If tipoEnvio = 'A' Then // Adiantamento
                  sSql := sSql + '   AND DII.TIPOQUALIFICACAO = ''A'' ' + #13#10
              Else
                  sSql := sSql + '   AND DII.TIPOQUALIFICACAO = ''C'' ' + #13#10 ;

              sSql := sSql + ' GROUP BY DPI.IDPROVENTO ' + #13#10 ;

              _CdsAux.Data := GetDataPacket(sSql);

              If Not _CdsAux.IsEmpty Then
              Begin
                _CdsAux.First;
                While Not _CdsAux.EOF Do
                Begin
                  sSql2 := 'DELETE FROM RUBRICAINDIV' + CR_LF;
                  sSql2 := sSql2 + 'WHERE IDPESSOA = ' + inttoStr(IdPessoa) + CR_LF;
                  sSql2 := sSql2 + '      AND FLGTPRUBMANUT = ''2'' ' + CR_LF;
                  sSql2 := sSql2 + '      AND IDRUBRICA = ' + _CdsAux.Fieldbyname('IDPROVENTO').AsString + CR_LF;
                  //sSql2 := sSql2 + '      AND VALORRUBRICA = ' + _CdsAux.Fieldbyname('VLRITEM').AsString + CR_LF;           //Everson Cunha - SIG87510
                  sSql2 := sSql2 + '      AND VALORRUBRICA = ' + QuotedStr(_CdsAux.Fieldbyname('VLRITEM').AsString) + CR_LF;  //Everson Cunha - SIG87510
                  sSql2 := sSql2 + '      AND ANOMESINICIO = ' + QuotedStr(AnoMesRef);

                  ExecSQL(sSql2);

                  _CdsAux.Next;
                end;
              end;

              // Atualizando o Destacamento
              sSql := ' UPDATE DESTACAMENTO ' + CR_LF;
              sSql := sSql + ' SET  ' + CR_LF;
              sSql := sSql + iff(tipoEnvio = 'A', 'FLGLANCAFOLHA = ', 'FLGLANCAFOLHAACERTO = ') + FloatToStr(0) + ',' + CR_LF;
              sSql := sSql + iff(tipoEnvio = 'A', 'ANOMESREFADIANT = NULL', 'ANOMESREFACERTO = NULL') + CR_LF;
              sSql := sSql + ', TIPOMOTIVONAOINTEGRACAO = 0' + CR_LF;
              sSql := sSql + ' WHERE IDDESTACAMENTO = ' + IntToStr(IdDestacamento);

              If Not ExecSQL(sSql) Then
                 Raise exception.Create(MessageInfo);

              Result := true;

              {
               // Selecionando os Ítems de Despesa do Destacamento
               sSql := 'SELECT D.IDDESTACAMENTO, D.IDEMPRESA, D.IDPESSOA, X.IDDSTITEMDESPESA AS IDITEM,   ' + CR_LF;
               sSql := sSql + 'CASE WHEN X.VLRITEM > 0 THEN 0 WHEN X.VLRITEM < 0 THEN 1 END AS FLGDESCONTO, ' + CR_LF;
               sSql := sSql + 'X.VLRITEM, X.INDOBJETIVO, S.DESCRICAO AS DSCITEM, F.TIPOCONTRATO' + CR_LF;
               sSql := sSql + 'FROM DESTACAMENTO D, DESTACAMENTOXITEMDESPESA X, DSTITEMDESPESA S, FUNCIONARIO F ' + CR_LF;
               sSql := sSql + 'WHERE D.IDDESTACAMENTO = ' + FloatToStr(IdDestacamento) + CR_LF;
               sSql := sSql + '      AND D.IDDESTACAMENTO = X.IDDESTACAMENTO ' + CR_LF;
               sSql := sSql + '      AND D.IDPESSOA = F.IDPESSOA ' + CR_LF;
               sSql := sSql + '      AND X.IDDSTITEMDESPESA = S.IDDSTITEMDESPESA ' + CR_LF;
               sSql := sSql + '      AND S.FLGINTEGRARFOL = ''S'' ' + CR_LF; // Integrar
               sSql := sSql + '      AND S.FLGATIVA = ''S'' ' + CR_LF;
               If tipoEnvio = 'A' Then // Adiantamento
                  sSql := sSql + 'AND S.TIPOQUALIFICACAO = ''A'' ' // DIÁRIAS, TAXI, TRANSPORTE, TRANSPORTE FUNCEF, HOSPEDAGEM - (ADIANTAMENTOS)
               Else
                  sSql := sSql + 'AND  S.TIPOQUALIFICACAO = ''C''  '; // Acerto de Contas
               sSql := sSql + 'ORDER BY D.IDDESTACAMENTO, X.IDDSTITEMDESPESA  ' + CR_LF;


               _CdsAux.Data := GetDataPacket(sSql);
               If Not _CdsAux.IsEmpty Then
                  Begin
                     _CdsAux.First;
                     While Not _CdsAux.EOF Do
                        Begin
                           If LocalizaParametrosParaIntegracaoFolhaPagto(
                              _CdsAux.Fieldbyname('IDITEM').asInteger,
                              _CdsAux.Fieldbyname('INDOBJETIVO').asInteger,
                              _CdsAux.Fieldbyname('FLGDESCONTO').asInteger,
                              _CdsAux.Fieldbyname('TIPOCONTRATO').asString,
                              idProvento,
                              idRegra) Then
                              Begin
                                 sSql2 := 'DELETE FROM RUBRICAINDIV' + CR_LF;
                                 sSql2 := sSql2 + 'WHERE IDPESSOA = ' + inttoStr(IdPessoa) + CR_LF;
                                 sSql2 := sSql2 + '      AND FLGTPRUBMANUT = ''2'' ' + CR_LF;
                                 sSql2 := sSql2 + '      AND IDRUBRICA = ' + inttostr(idProvento) + CR_LF;
                                 sSql2 := sSql2 + '      AND ANOMESINICIO = ' + QuotedStr(AnoMesRef);
                                 ExecSQL(sSql2);
                              End
                           Else
                              Raise exception.Create('Parâmetro de Integração da Folha não localizado para o:' + #13 + #13 +
                                 'Item : ' + _CdsAux.Fieldbyname('DSCITEM').asString + #13 +
                                 MessageInfo);

                           _CdsAux.Next;
                        End;

                     // Atualizando o Destacamento
                     sSql := ' UPDATE DESTACAMENTO ' + CR_LF;
                     sSql := sSql + ' SET  ' + CR_LF;
                     sSql := sSql + iff(tipoEnvio = 'A', 'FLGLANCAFOLHA = ', 'FLGLANCAFOLHAACERTO = ') + FloatToStr(0) + ',' + CR_LF;
                     sSql := sSql + iff(tipoEnvio = 'A', 'ANOMESREFADIANT = NULL', 'ANOMESREFACERTO = NULL') + CR_LF;
                     sSql := sSql + ', TIPOMOTIVONAOINTEGRACAO = 0' + CR_LF;
                     sSql := sSql + ' WHERE IDDESTACAMENTO = ' + IntToStr(IdDestacamento);
                     If Not ExecSQL(sSql) Then
                        Raise exception.Create(MessageInfo);

                     Result := true;
                  End;
                  }//Everson Cunha - SIG74816 - Fim
            End
         Else
            Begin
               Raise exception.Create('Folha de Pagamento já Efetivada para o:' + #13 + #13 +
                  'Destacado : ' + NomeDestacado + #13 +
                  'Ano/Mês de Referência : ' + QuotedStr(AnoMesRef) + #13 + MessageInfo);
            End;
      Except
         On E: Exception Do
            Begin
               MessageInfo := E.Message;
               Result := false;
            End;
      End;
   Finally
      FreeAndNil(_CdsAux);
      FreeAndNil(_CdsAux2);
   End;
End;

Function TCtrlDestacamento.LiberaAcessosParaManutencao(IdUsuarioLogin: integer; sNomeGrupo: String): Boolean;
Var qryAux: Twwquery;
Begin
   qryAux := Twwquery.Create(Nil);
   qryAux.DataBaseName := 'BaseDados';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('select g.idusuario, g.idgrupo, ga.nomegrupo ');
   qryAux.SQL.Add('from grupousu g, grupoacesso ga             ');
   qryAux.SQL.Add('WHERE g.idgrupo = ga.idgrupo                ');
   qryAux.SQL.Add('     and TRIM(ga.nomegrupo) = ' + quotedstr(sNomeGrupo)); // Grupo de quem pode alterar Datas de Pagamento do Destacamento
   qryAux.SQL.Add('     and g.idusuario = ' + IntToStr(IdUsuarioLogin));
   qryAux.Open;
   Result := Not qryAux.EOF;

   FreeAndNil(qryAux);
End;

Function TCtrlDestacamento.TotalDestacamentoTipoDespesa(idDestacamento: Integer; sDespTipoQualificacao: String): Double;
Var cdsTemp: TCMClientDataSet;
   sSql: String;
Begin
   Try
      cdsTemp := TCMClientDataSet.Create(Nil);
      sSql := 'SELECT SUM(VLRITEM) AS TOTAL_TIPO ' + #13 +
         ' FROM DESTACAMENTOXITEMDESPESA  ' + #13 +
         ' WHERE IDDESTACAMENTO = ' + IntToStr(idDestacamento) + #13 +
         '       AND TIPOQUALIFICACAO = ' + quotedStr(sDespTipoQualificacao);
      cdsTemp.Data := GetDataPacket(sSql);
      Result := cdsTemp.FieldByName('TOTAL_TIPO').asFloat;
   Finally
      FreeAndNil(cdsTemp);
   End;
End;

Function TCtrlDestacamento.LocalizarCotacaoMoeda(iCodMoeda: Integer; sDataCotacao: String): Double;
Var _CdsAuxi: TCMClientDataSet;
   sQuery: String;
Begin
   Result := 0;
   _CdsAuxi := TCMClientDataSet.Create(Nil);
   sQuery := 'SELECT COTVALOR FROM COTACAOMOEDA WHERE ' + #13 +
      ' MOECODIGO = ' + QuotedStr(IntToStr(iCodMoeda)) + ' AND ' + #13 +
      ' COTDATA = ' + QuotedStr(sDataCotacao);
   _CdsAuxi.Data := GetDataPacket(sQuery);
   If Not _CdsAuxi.EOF Then
      result := _CdsAuxi.fieldbyname('COTVALOR').asFloat;

   FreeAndNil(_CdsAuxi);
End;

Function TCtrlDestacamento.CalcularDataPagamento(TipoEnvio: String; DataBase: TDateTime): TDateTime;
Var
   iPz, iQtdDias: Integer;
   dDtaPz: TDateTime;
Begin
   carregarCidadeEstadoPaisSistema;

   // Quantidade de dias úteis para Pagamento ou Recebimento, Definido nos Parametros gerais do sistema
   iQtdDias := FcdsParamRH.FieldByName('DIASENVIODST').AsInteger;

   If TipoEnvio = 'A' Then // Adiantamento sempre são dias antes da viagem
      Begin
         dDtaPz := DataBase - iQtdDias;

         While Not diasUteis.diaUtil(dDtaPz, fundacaoCidade, fundacaoPais, fundacaoEstado, True, True, False) Do
            dDtaPz := dDtaPz - 1; // Achar o dia útil anterior
      End
   Else // 'C' - Acerto de Contas sempre são dias após a viagem, pago no retorno
      Begin
         If iQtdDias > 0 Then // Tem Prazo
            Begin
               iPz := 1;
               dDtaPz := DataBase + iQtdDias;
               While iPz <= iQtdDias Do
                  Begin
                     While Not diasUteis.diaUtil(dDtaPz, fundacaoCidade, fundacaoPais, fundacaoEstado, True, True, False) Do
                        dDtaPz := dDtaPz + 1; // Achar o dia útil Posterior

                     iPz := iPz + 1;
                  End;
            End
         Else
            Begin
               dDtaPz := DataBase;
               While Not diasUteis.diaUtil(dDtaPz, fundacaoCidade, fundacaoPais, fundacaoEstado, True, True, False) Do
                  dDtaPz := dDtaPz + 1; // Achar o dia útil Posterior
            End;
      End;

   Result := dDtaPz;
End;


function TCtrlDestacamento.IntegrarAgrupamentoFinancContabil(sDestacamento,
  tipoEnvio: String; bContabiliza: Boolean; TipOper, sDtPagto: String;
  var CodDocumento: integer; rVlrTotal: currency; 
  sContrato, sCodContrato : string): Boolean;
var
  iIdFavorecido    : integer;
  iCodForma        : integer;
  sRecPag, sDebCre : string;
  rValorDocumento  : currency;
  dDataPagamento   : TDateTime;
  iPortadorForma   : integer;
  iCodTipDoc       : integer;
  iPlanoPrev, iPatro : integer;
  iPrograma        : integer;
  iCodCentroRespon : integer;
  iAtivProjeto     : integer;
  sObjViagem, sSql : string;
  sReferencia      : string;
  sCodTipRecDes    : string;
  sHistCtb, sCodCC : string;
  tipoLancamento   : string;
  sTipoContrato    : string;
  dPlnCodigo       : double;
  sObservacao      : string;
  iIdDestaca       : integer;
begin
   Result := False;
   try
     Try
        If Not Self.InTransaction Then
           Self.StartTransaction;

        dNumDocumento    := 0;
        MessageInfo      := '';
        iCodCentroRespon := 10004; // GetId('CENTRESPON', 'CODCENTRORESPON', 'NOME = ''GEAPE'' ' );
        iCodForma        := GetId('FORMARECPAG', 'CODFORMA', 'DESCRICAO = ''Credito Diversas C/C na CAIXA'' ' );
        iIdFavorecido    := GetId('PESSOA', 'IDPESSOA', 'NOME = '+quotedstr(UpperCase(sContrato)) );
        sHistCtb         := 'Adiantamento de viagem diversos empregados '+sDtPagto;
        rValorDocumento  := rVlrTotal;
        dDataPagamento   := StrToDate(sDtPagto);
        sCodCC           := '';

        sObservacao := 'Pagamento de despesas com destacamento:'+CR_LF;

        FcdsDestacamento.Data := listarDestacamento(sDestacamento, tipoEnvio);

        {iDestacado := FcdsDestacamento.FieldByName('IDPESSOA').AsInteger;
        sCodCentroCusto := FcdsDestacamento.FieldByName('CODCENTROCUSTO').AsString;
        sCodCentroRespon := FcdsDestacamento.FieldByName('CODCENTRORESPON').AsString;
        iCodFormaPag := FcdsDestacamento.FieldByName('CODFORMAPAG').AsInteger;
        iCodFormaRec := FcdsDestacamento.FieldByName('CODFORMAREC').AsInteger;
        iIdCBancaria := FcdsDestacamento.FieldByName('IDCBANCARIA').AsInteger;
        iAtivProjeto := -1;
        }
        // T I P O    D E    L A N Ç A M E N T O
        If tipoEnvio = 'A' Then // Adiantamentos
           Begin
              //valorTotalDestacamento := rVlrTotal; // TotalDestacamentoTipoDespesa(iDestacamento, 'A'); // Adiantamentos
              tipoLancamento := 'P'; // Pagamento
              //iCodForma := iCodFormaPag;
              //valorTotalDocumento := valorTotalDestacamento;
              //dDataPagamento := StrToDate(sDtPagto); // FcdsDestacamento.FieldByName('DATAPAGTODESTAC').AsDateTime;
              //sHistComp := 'Adiantamento de Viagem Nº: ' + IntToStr(iDestacamento);
              //sCompldocumento := '1'; // Sequência 1
           End
        Else // Acerto de Contas
           Begin
              //valorTotalAcerto := rVlrTotal;  //TotalDestacamentoTipoDespesa(iDestacamento, 'C'); // Acerto de Contas
              If rVlrTotal > 0 Then
                 tipoLancamento := 'P' // Pagamento
              Else
                 tipoLancamento := 'R'; // Recebimento

              //iCodForma := iCodFormaRec;
              //valorTotalDocumento := abs(valorTotalAcerto);
              //dDataPagamento := StrToDate(sDtPagto); // FcdsDestacamento.FieldByName('DATAPAGTOACERTO').AsDateTime;
              //sHistComp := 'Acerto de Contas de Viagem Nº: ' + IntToStr(iDestacamento);
              //sCompldocumento := '2'; // Sequência 2
           End;

        If (FcdsParamRH.FieldByName('CODTIPDOCREC').isnull) Or (FcdsParamRH.FieldByName('CODTIPDOCPAG').isnull) Then
           Raise exception.Create('Parâmetro do Sistema -> Tipo De Documento, não Informado !')
        Else
           iCodTipDoc := iff(tipoLancamento = 'R', FcdsParamRH.FieldByName('CODTIPDOCREC').AsInteger, FcdsParamRH.FieldByName('CODTIPDOCPAG').AsInteger);

        If (FcdsParamRH.FieldByName('CODPORTFORMAREC').isnull) Or (FcdsParamRH.FieldByName('CODPORTFORMAPAG').isnull) Then
           Raise exception.Create('Parâmetro do Sistema -> Portador Forma, não Informado !')
        Else
           iPortadorForma := iff(tipoLancamento = 'R', FcdsParamRH.FieldByName('CODPORTFORMAREC').AsInteger, FcdsParamRH.FieldByName('CODPORTFORMAPAG').AsInteger);

        sRecPag := iff(tipoLancamento = 'R', 'R', 'P'); // Receber ou Pagar
        sDebCre := iff(tipoLancamento = 'R', 'D', 'C'); // Debitar ou Creditar

        If FCdsParamRH.FieldByName('IDPLANOPREV').AsInteger > 0 Then
           iPlanoPrev := FCdsParamRH.FieldByName('IDPLANOPREV').AsInteger
        Else
           iPlanoPrev := FCtrlListTerceirosRH.GetIdPlanoPrev(Sistema.IdEmpresa);

        If FCdsParamRH.FieldByName('IDPATRO').AsInteger > 0 Then
           iPatro := FCdsParamRH.FieldByName('IDPATRO').AsInteger
        Else
           iPatro := FCtrlListTerceirosRH.GetIdPatro(Sistema.IdEmpresa);

        // Parâmetros do CtrlDocumento
        FctrlDocumento.OpenTransaction := False;
        FctrlDocumento.Prepare(OpDocumento, odlEfetivo); //, sdocAberto);
        FctrlDocumento.UsaPlanoPatro := FSistema.UsaPlanoPatro;
        FctrlDocumento.IdUsuario := FSistema.idUsuario;
        FctrlDocumento.IdEspAcesso := FSistema.idEspAcesso;
        FctrlDocumento.IdModulo := FSistema.idModulo;
        FctrlDocumento.MessageInfo := '';

        // Obtendo a sequence
        CodDocumento := FCtrlDocumento.GetSequenceDocumento;

        // Selecionando os Ítems de Despesa do Destacamento
        sSql := 'SELECT D.IDDESTACAMENTO, X.IDDSTITEMDESPESA AS IDITEM, S.DESCRICAO AS DSCITEM, X.INDOBJETIVO, F.TIPOCONTRATO, D.IDEMPRESA, D.IDPESSOA,  ' + CR_LF;
        sSql := sSql + '     DECODE(SIGN(X.VLRITEM), 1, ''P'', -1, ''R'') AS TIPOMOV, X.VLRITEM,  ' + CR_LF;
        sSql := sSql + '     D.CODCENTROCUSTO ' + CR_LF;
        sSql := sSql + ' FROM DESTACAMENTO D, DESTACAMENTOXITEMDESPESA X, DSTITEMDESPESA S, FUNCIONARIO F ' + CR_LF;
        sSql := sSql + 'WHERE X.IDDESTACAMENTO = D.IDDESTACAMENTO ' + CR_LF;
        sSql := sSql + '  AND F.IDPESSOA = D.IDPESSOA ' + CR_LF;
        sSql := sSql + '  AND X.IDDSTITEMDESPESA = S.IDDSTITEMDESPESA ' + CR_LF;
        sSql := sSql + '  AND D.IDDESTACAMENTO in (' + sDestacamento +') '+ CR_LF;
        sSql := sSql + '  AND S.FLGINTEGRARFIN = ''S'' ' + CR_LF; // Integrar
        sSql := sSql + '  AND S.FLGATIVA = ''S'' ' + CR_LF;
        sSql := sSql + '  AND S.TIPOQUALIFICACAO = '+quotedstr(tipoEnvio) + CR_LF;
        sSql := sSql + 'ORDER BY D.IDDESTACAMENTO, X.IDDSTITEMDESPESA  ' + CR_LF;
        _Cds.Data := GetDataPacket(sSql);
        If Not _Cds.IsEmpty Then
           Begin
              _Cds.First;
              iIdDestaca := _Cds.Fieldbyname('IDDESTACAMENTO').asInteger;
              While Not _Cds.EOF Do
                 Begin
                    // codigo do centro de custo
                    sCodCC := _Cds.Fieldbyname('CODCENTROCUSTO').asString;

                    iPrograma := FCtrlListTerceirosRH.GetIdProgramaCCusto(sCodCC, Sistema.IdEmpresa);
                    If (iPrograma = 0) Then
                       iPrograma := -1;

                    case _Cds.Fieldbyname('INDOBJETIVO').asInteger of
                      0 : begin
                            sObjViagem := 'Institucional';
                            //iAtivProjeto := 96;  // Institucional      //Everson Cunha - SIG128175
                            iAtivProjeto := 55; //VG - Instituc. Diárias //Everson Cunha - SIG128175
                          end;
                      1 : begin
                            sObjViagem   := 'Treinamento';
                            //iAtivProjeto := 18;  // T&D Específico      //Everson Cunha - SIG128175
                            iAtivProjeto := 391;  //VG - Treinam. Diárias //Everson Cunha - SIG128175
                          end;
                      2 : begin
                            sObjViagem := 'Audiência';
                            //iAtivProjeto := 97;  // Audiência           //Everson Cunha - SIG128175
                            iAtivProjeto := 55;  //VG - Instituc. Diárias //Everson Cunha - SIG128175
                          end;
                    end;

                    // Empregados Quadro Próprio e Cedidos - área investimentos
                    If (sCodContrato <> 'A') and (iPrograma = 3) Then
                       //iAtivProjeto := 95; // Investimento}       //Everson Cunha - SIG128175
                       iAtivProjeto := 55; //VG - Instituc. Diárias //Everson Cunha - SIG128175

                    If      sCodContrato = 'E' Then  sTipoContrato := 'Efetivo'
                    Else If sCodContrato = 'P' Then  sTipoContrato := 'Cedidos'
                    Else If sCodContrato = 'A' Then  sTipoContrato := 'Autônomo';

                    // ********** Campo REFERENCIA - tabela DOCUMENTO - Aba Geral AP/AR - Campo Referência *************

                    // Empregados Quadro Próprio  (E)	  Adiantamento viagens institucionais e audiências  (0,2)
                    If (sCodContrato = 'E') And (_Cds.Fieldbyname('INDOBJETIVO').asInteger In [0, 2]) Then
                       sReferencia := 'DIACI 009/99';
                    // Empregados Quadro Próprio (E)	  Adiantamento viagens de treinamento (1)
                    If (sCodContrato = 'E') And (_Cds.Fieldbyname('INDOBJETIVO').asInteger = 1) Then
                       sReferencia := '2007/004';
                    // Empregados Cedidos (Cessão/Prop Dir s/ Vinc) (3, P)
                    If (sCodContrato = 'P') Then
                       sReferencia := '2007/012';
                    // Conselheiros e membros de comitês (A)
                    If (sCodContrato = 'A') Then
                       sReferencia := '2008/029';

                    If LocalizaParametrosParaIntegracaoFinanceira(_Cds.Fieldbyname('IDITEM').asInteger,
                                                                  _Cds.Fieldbyname('INDOBJETIVO').asInteger, // Objetivo da Viagem
                                                                  _Cds.Fieldbyname('TIPOCONTRATO').asString, // Tipo de Contrato
                                                                  _Cds.Fieldbyname('TIPOMOV').asString,     // Pagar ou Receber
                                                                  sCodTipRecDes) Then
                       Begin
                          // Carrega o Plano de Contas atualizando o registro "rPlaContas"
                          FctrlPlacontasCapCar.GetPlacontas(iPortadorForma,
                             -1, // idforcli
                             FSistema.IdEmpresa, // idEmpresa
                             iPrograma, // idProg
                             iPlanoPrev,
                             _Cds.Fieldbyname('CODCENTROCUSTO').asString, // codCentroCusto
                             sCodTipRecDes, // codtiporecdes
                             _Cds.Fieldbyname('TIPOMOV').asString, // recpag
                             opldEfetivo, // operLanctoDocCapCar
                             False, // bLancaBaixa
                             rPlaContas, // PlaContas [var]
                             bContabiliza, // bIntegraContab
                             FCtrlParamIntegra.Plano);
                          If ((rPlaContas.sPlaconta = '') and (rPlaContas.sPlacontaPass = ''))  Or (rPlaContas.iPlano <= 0) Then
                             Raise exception.Create('Conta Contábil não encontrada.');

                          If trim(FctrlPlacontasCapCar.MessageInfo) <> '' Then
                             Raise exception.Create(FctrlPlacontasCapCar.MessageInfo);

                          // CONTABILIZAR PRIMEIRO, PARA SE OBTER PLNCODIGO
                          If Not EfetuarLancamentoContab( iPatro,
                                                          iPlanoPrev,
                                                          sHistCtb,
                                                          sCodCC,
                                                          _Cds.Fieldbyname('vlritem').asFloat,
                                                          CodDocumento,
                                                          dPlnCodigo,
                                                          dDataPagamento, //Everson Cunha - SIG60521
                                                          iAtivProjeto //Everson Cunha - SIG128175
                                                          ) Then
                             Raise exception.Create('Não foi possível efetuar o Lançamento Contábil.' + #13 + MessageInfo);

                          // Seta valores para a tabela RATEIODOCUM
                          FctrlDocumento.Rateiodocum.SetValues(
                             _Cds.Fieldbyname('vlritem').asFloat,
                             0,
                             0,
                             0,
                             FSistema.IdEmpresa,
                             CodDocumento,
                             iAtivProjeto, // Atividade Projeto - Unidade de Negócio
                             0,
                             FSistema.idUsuario,
                             0,
                             FCtrlParamIntegra.Plano,
                             iPlanoPrev,
                             iPatro,
                             iPrograma,
                             0,
                             FSistema.IdEmpresa,
                             sCodTipRecDes,
                             _Cds.Fieldbyname('tipomov').asString,
                             IntToStr(iCodCentroRespon),
                             _Cds.Fieldbyname('CODCENTROCUSTO').asString,
                             '');
                       End
                    Else
                       Raise exception.Create('Parâmetro de Integração Financeira não localizado para:' + #13 + #13 +
                          'Nº Interno : ' + _Cds.Fieldbyname('IDDESTACAMENTO').asString + #13 +
                          'Item : ' + _Cds.Fieldbyname('DSCITEM').asString + ' - ( ' + iff(_Cds.Fieldbyname('tipomov').asString = 'P', 'Pagamento', 'Recebimento') + ' ) ' + #13 +
                          'Objetivo da Viagem : ' + sObjViagem + #13 +
                          'Tipo do Contrato : ' + sTipoContrato + #13 +
                          MessageInfo);

                    _Cds.Next;

                    if (iIdDestaca <> _Cds.Fieldbyname('IDDESTACAMENTO').asInteger) or (_Cds.eof) then
                    begin
                      FcdsDestacamento.Locate('IDDESTACAMENTO', iIdDestaca, []);
                      sObservacao := sObservacao + FcdsDestacamento.Fieldbyname('IDDESTACAMENTO').asString +' - '+
                                                   FcdsDestacamento.Fieldbyname('NOMEDESTACADO').asString +' - '+
                                                   FcdsDestacamento.FieldByName('DATAIDA').AsString+'  '+
                                                   FcdsDestacamento.FieldByName('DATAVOLTA').AsString +
                                                   ' - R$ '+FormatCurr('#,##0.00', FcdsDestacamento.FieldByName('TOTAL').AsCurrency) +CR_LF;
                                                   
                      iIdDestaca := _Cds.Fieldbyname('IDDESTACAMENTO').asInteger;
                    end;

                 End;

              // Seta valores para a tabela DOCUMENTO
              FctrlDocumento.SetValues(
                 CodDocumento,
                 CodDocumento,
                 iff(tipoEnvio = 'A', '1', '2'), // Complemento - COMPLDOCUMENTO
                 '',
                 sRecPag,
                 '2', // Operação
                 '',
                 '',
                 rPlaContas.sPlacontaPass, // PlacontaPass
                 sCodCC,
                 '',
                 '',
                 '',
                 '',
                 '',
                 '',
                 sReferencia, // Referencia
                 sObservacao, // Observação - Justificativa
                 dDataPagamento, // Data de Lançamento e Vencimento
                 Date, // Data de Emissão
                 dDataPagamento, // Data Programada
                 0, 0, 0, 0, 0, 0, 0, 0,
                 iCodTipDoc,
                 Sistema.idEmpresa,
                 Sistema.idModulo,
                 iIdFavorecido,
                 0,
                 -1,
                 //FCtrlParamIntegra.uNidNegoc, //Everson Cunha - SIG128175
                 iAtivProjeto,                  //Everson Cunha - SIG128175
                 FCtrlParamIntegra.Plano,
                 0, 0, 0, 0, 0,
                 Sistema.idUsuario,
                 Sistema.idEmpresa,
                 1,
                 0,
                 0,
                 iPortadorForma,
                 0,
                 0,
                 iCodforma,
                 iIdSegrCriter);

              If trim(FctrlDocumento.MessageInfo) <> '' Then
                 Raise exception.Create(FctrlDocumento.MessageInfo);

              // Seta valores para a tabela LANCTODOCUM
              FctrlDocumento.Lanctodocum.SetValues(
                 dDataPagamento,
                 CodDocumento,
                 0,
                 rVlrTotal,
                 0,
                 rVlrTotal,
                 //FCtrlParamIntegra.uNidNegoc, //Everson Cunha - SIG128175
                 iAtivProjeto,                  //Everson Cunha - SIG128175
                 strtoint(floattostr(dPlnCodigo)),
                 0,
                 FSistema.idUsuario,
                 FSistema.idEmpresa,
                 0,
                 0,
                 iCodTipDoc,
                 0,
                 0,
                 '2',
                 '',
                 '',
                 '',
                 '', //sHistComp, // Historico complemento usado na aba principal do CAP/CAR
                 '',
                 '',
                 '',
                 sDebCre,
                 FSistema.idModulo,
                 rPlaContas.iPlano,
                 FSistema.UsaPlanoPatro,
                 bContabiliza,
                 iPortadorForma);

              If trim(FctrlDocumento.MessageInfo) <> '' Then
                 Raise exception.Create(FctrlDocumento.MessageInfo);

              // Inserindo definitivamente o movimento nas tabelas
              If Not FctrlDocumento.Insert Then
                 Raise exception.Create(FctrlDocumento.MessageInfo);

              // Atualizando o Destacamento com os numeros de documentos gerados
              sSql := ' UPDATE DESTACAMENTO ' + CR_LF;
              sSql := sSql + ' SET ' + CR_LF;
              sSql := sSql + iff(tipoEnvio = 'A', 'CODDOCDESTAC = ', 'CODDOCACERTO = ') + FloatToStr(FctrlDocumento.CodDocumento) + ', FLGINTEGRARFINANC = ''N'', ' + CR_LF;
              sSql := sSql + iff(tipoEnvio = 'A', 'IDUSUARIOSISTEMA = ', 'IDUSUARIOACERTO = ') + FloatToStr(FSistema.IdUsuario);
              sSql := sSql + ' WHERE IDDESTACAMENTO in (' + sDestacamento+')';
              If Not ExecSQL(sSql) Then
                 Raise exception.Create(MessageInfo);

              If Self.InTransaction Then
                 Self.Commit;

              dNumDocumento := CodDocumento;

              Result := True;
           End;
     Except
        On E: Exception Do
           Begin
              If Self.InTransaction Then
                 Self.Rollback;
              Result := False;
              Self.MessageInfo := E.Message;
           End;
     End;
  finally

  end;
end;

function TCtrlDestacamento.GetId(sTabela, sCampo, sCondicao : string): integer;
begin
  _Cds.Data := GetDataPacket('SELECT '+sCampo+' FROM '+sTabela+' WHERE '+sCondicao);
  if not _cds.isEmpty then
     result := _cds.Fields[0].AsInteger
  else
     result := -1;
end;

End.

