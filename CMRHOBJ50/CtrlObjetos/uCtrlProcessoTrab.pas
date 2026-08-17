{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * }
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/11/2002                                 }
{                                                       }
{*******************************************************}

Unit uCtrlProcessoTrab;

Interface

Uses SysUtils, Controls, Db, DbClient, uCmDbObject, uCmControlObject, uCMClientDataSet, Messages,
   uCtrlCustomRH, uCtrlLancamento, uCtrlParamIntegra, uCtrlListTerceirosRH, uCtrlDocumento, dialogs,
   uCtrlSubConta, uCtrlCalcRub, uCtrlBancoPortFolha, uCtrlIntegraRH, uDbProcessoTrab,
   uDbObjProcTrab, uDbHonorarios, uDbEtapaProcTrab, uDbCopartProcTrab, uDbSubConta,
   uCtrlEtapaProcesso, uDbImovel, uDbEventoImovel, uDbHstProcTrab, classes, Wwquery;

Type
   TCtrlProcessoTrab = Class(TCtrlCustomRH)
   Protected
      FCtrlLancamento: TCtrlLancamento;
      FCtrlListTerceirosRH: TCtrlListTerceirosRH;
      FCtrlDocumento: TCtrlDocumento;
      FCtrlSubConta: TCtrlSubConta;
      FCtrlCalcRub: TCtrlCalcRub;
      FCtrlBancoPortFolha: TCtrlBancoPortFolha;
      FCtrlIntegraRH: TCtrlIntegraRH;
      FCtrlEtapaProcesso: TCtrlEtapaProcesso;

      FCdsDocumentoCAPCAR: TCMClientDataSet;
      FCdsDocumentos: TCMClientDataSet;
      FCdsImovel: TCMClientDataSet;
      FCdsEventoImovel: TCMClientDataSet;

      FCodTipRecDes: String;
      FListaNumDocCAPCAR: String;
      FListaPlnCodigo: String;
      FRecPag: String;

      FFazCAPCAR: boolean;
      FFazContab: boolean;
      FObrigaAbc: boolean;
      FObrigaCRespon: boolean;
      FUsaPlanoPatro: boolean;

      FValorTotal_Original: double;
      FValorTotal_Atual: double;
      FValorCAPCAR: double;
      FValorDepPenh: double;
      FValorReclamado_Atual: double;
      FValorAtualizacaoMonetaria_Atual: double;

      FDataDemissao: TDate;
      FDataEmissao: TDate;
      FDataPagamento: TDate;

      FSituacao_Original: integer;
      FIdPlano: integer;
      FPortadorFormaPadrao: integer;
      FIdModulo: integer;
      FIdUsuario: integer;
      FIdEspAcesso: integer;
      FIdEmpresa: integer;
      FNumObjetos_Original: integer;
      FPlanoPrevGlobal: integer;
      FPatroGlobal: integer;
      FIdFavorecido: integer;

      FCodObjeto_Original: OleVariant;
      FValorReclamado_Original: OleVariant;
      FValorAtualizacaoMonetaria_Original: OleVariant;
      //DataHonor: OleVariant;

      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
      Procedure AfterInitialize; Override;

      Function GetValorLancamento(Aplica_se_A: integer; ValorJuros: double): double;
      Procedure SetValoresIntegracao;

      Function GerarIntegracaoCAPCAR: boolean;
      Function GerarCAPCAR: boolean;
      Function GetValorObjeto: double;
      Function GetDataHistorico(DataDemissao: TDate): String;
   Private
      FDbProcesso: TDbProcessoTrab;
      FDbObjetos: TDbObjProcTrab;
      FDbHonorarios: TDbHonorarios;
      FDbEtapas: TDbEtapaProcTrab;
      FDbLitisconsortes: TDbCopartProcTrab;
      FDbSubConta: TDbSubConta;
      FDbImovel: TDbImovel;
      FDbEventoImovel: TDbEventoImovel;
      FDbHstProcTrab: TDbHstProcTrab;
      FNumProcTrab: double;
      FIdPessoa, FNmPessoa, FNmPlanoP, FNmPatroc, FTipoAcao: String;
      FIdPlanPr: Integer;
      FTipoProcAntes: Integer;

      FCdsProcesso: TCMClientDataSet;
      FCdsObjetos: TCMClientDataSet;
      FCdsHonorarios: TCMClientDataSet;
      FCdsHonor: TCMClientDataSet;
      FCdsEtapas: TCMClientDataSet;
      FCdsLitisconsortes: TCMClientDataSet;
      FCdsHistProcesso: TCMClientDataSet;
   Protected
      Procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean); Override;
   Public
      Constructor Create(IdModulo, IdUsuario, IdEmpresa: integer; UsaPlanoPatro: boolean;
         UsuXFilial, UsuXCCusto, IdUsuarioGeral: String); Reintroduce;
      Destructor Destroy; Override;

      Function GerarIntegracao(FazContab: boolean; DataEmissao, DataPagamento,
         DataDemissao: TDateTime; IdPlanoPrev, IdPatro, Plano: integer;
         CodTipRecDes: String; CodTipDoc: integer; ValorJuros: double;
         TipoProcAntes: integer; TipoAcao: String): boolean;

      Function ListProcesso(NumProcTrab: double): OleVariant;
      Function ListDadosProcesso(NumProcTrab: double): OleVariant;
      Function ListDadosLitisconsortes(NumProcTrab: double): OleVariant;
      Function ListLitisconsorte(NumProcTrab: double): OleVariant;
      Function ListObjeto(NumProcTrab: double): OleVariant;
      Function ListObjetoXTipo(NumProcTrab: double; Opcao: integer = 0): OleVariant;
      Function ListObjetoComTipo(NumProcTrab: double): OleVariant;
      Function ListProcessosVinculados(NumProcTrab: double): OleVariant;
      Function ListAdvogadosDoProcesso(NumProcTrab: double): OleVariant;
      Function ListAdvogadosDaContraParte(NumProcTrab: double): OleVariant;
      Function ListReclamantesDoProcesso(NumProcTrab: double): OleVariant;
      Function ListProcessosEnvolvidos(IdPessoa: double): OleVariant;
      Function ListAgendaDoUsuario(IdUsuario: double): OleVariant;
      Function ListHistAlterDoProcesso(NumProcTrab: double): OleVariant;
      Function ListPessoaParticipante(Matricula: String): Boolean;
      Function ContaNossaLitisconsorte(NumProcTrab: double): Integer;
      Function TotalValorSentenca(NumProcTrab: double): double;
      Function GravarProcessoTrab(NomeSubConta: String;
         IdBemAntes, IdConjuntoAntes: double): boolean;
      Function ExcluirProcessoTrab: boolean;
      Function ProcessarTxtLitisconsortes(NumProcTrab: double; DadosArquivo: String;
         Categoria: integer; ValorCondenacao: double; IdEmpresa: integer; CentroCusto: String;
         IdMotivo: integer; DataAlt: String): TStringList;

      // Inicializa variáveis usadas na integração
      Procedure IniciarIntegracao(IdEmpresa, IdModulo, IdUsuario, IdEspAcesso: integer;
         UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal, PatroGlobal: integer);

      Procedure ZerarValoresProcesso;
      Function VerificaNumProcesso(NumProcesso: String): boolean;
      Function VerificaContraParte(sIdPessoa: String): OleVariant;
      Function RetornaPlanoPatro(Plano, Patro: String): String;
      Function GetRecPag: String;
      Procedure SetRecPag(RecPag: String);
      Procedure SetNumContraparte;

      Procedure IniciarValoresContabeis(DataDemissao: TDate);

      Function RatearDespesas(Valor, CodEtapa: double; ListaProcesso: String; DataRateio: TDate): boolean;

      Function AtualizarImovel(IdImovel: double; Inicio: boolean): boolean;

      Function InserirEventoImovel(IdImovel: double; EviData: TDate;
         Inicio: boolean; EviDescricao: String; EviPercent, EviVlrAjustado: double): boolean;

      Procedure AssociarCdsImovel(CdsImovel, CdsEventoImovel: TCMClientDataSet);

      Property CdsProcesso: TCMClientDataSet Read FCdsProcesso Write FCdsProcesso;
      Property CdsObjetos: TCMClientDataSet Read FCdsObjetos Write FCdsObjetos;
      Property CdsHonorarios: TCMClientDataSet Read FCdsHonorarios Write FCdsHonorarios;
      Property CdsHonor: TCMClientDataSet Read FCdsHonor Write FCdsHonor;
      Property CdsEtapas: TCMClientDataSet Read FCdsEtapas Write FCdsEtapas;
      Property CdsLitisconsortes: TCMClientDataSet Read FCdsLitisconsortes Write FCdsLitisconsortes;
      Property CdsImovel: TCMClientDataSet Read FCdsImovel Write FCdsImovel;
      Property CdsEventoImovel: TCMClientDataSet Read FCdsEventoImovel Write FCdsEventoImovel;
      Property CdsHistProcesso: TCMClientDataSet Read FCdsHistProcesso Write FCdsHistProcesso;
      Property NumProcTrab: double Read FNumProcTrab;
      Procedure ReceberValorDepPenh(NumProcTrab: double);
   End;

Implementation

Uses uCMTypes, uCtrlFuncoesRH, uDataBase;

Const
   ABERTO = 0;
   ENCERRADO = 1;

   { TCtrlProcessoTrab }

Constructor TCtrlProcessoTrab.Create(IdModulo, IdUsuario, IdEmpresa: integer;
   UsaPlanoPatro: boolean; UsuXFilial, UsuXCCusto, IdUsuarioGeral: String);
Begin
   FDbProcesso := TDbProcessoTrab.Create(Self);
   FDbObjetos := TDbObjProcTrab.Create(Self);
   FDbHonorarios := TDbHonorarios.Create(Self);
   FDbEtapas := TDbEtapaProcTrab.Create(Self);
   FDbLitisconsortes := TDbCopartProcTrab.Create(Self);
   FDbSubConta := TDbSubConta.Create(Self);
   FDbImovel := TDbImovel.Create(Self);
   FDbEventoImovel := TDbEventoImovel.Create(Self);
   FDbHstProcTrab := TDbHstProcTrab.Create(Self);

   FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
   FCtrlCalcRub := TCtrlCalcRub.Create;
   FCtrlDocumento := TCtrlDocumento.Create;
   FCtrlSubConta := TCtrlSubConta.Create;
   FCtrlLancamento := TCtrlLancamento.Create;
   FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create;
   FCtrlIntegraRH := TCtrlIntegraRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
   FCtrlEtapaProcesso := TCtrlEtapaProcesso.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

   FCtrlDocumento.OpenTransaction := false;
   FCtrlSubConta.OpenTransaction := false;
   FCtrlLancamento.OpenTransaction := false;

   FIdModulo := IdModulo;
   FIdUsuario := IdUsuario;
   FIdEmpresa := IdEmpresa;
   FUsaPlanoPatro := UsaPlanoPatro;

   Inherited Create;
End;

Destructor TCtrlProcessoTrab.Destroy;
Begin
   FDbProcesso.Free;
   FDbObjetos.Free;
   FDbHonorarios.Free;
   FDbEtapas.Free;
   FDbLitisconsortes.Free;
   FDbSubConta.Free;
   FDbImovel.Free;
   FDbEventoImovel.Free;
   FDbHstProcTrab.Free;

   FCtrlLancamento.Free;
   FCtrlDocumento.Free;
   FCtrlListTerceirosRH.Free;
   FCtrlSubConta.Free;
   FCtrlCalcRub.Free;
   FCtrlBancoPortFolha.Free;
   FCtrlIntegraRH.Free;
   FCtrlEtapaProcesso.Free;
   If (IsAppServer) Then
      Begin
         FCdsProcesso.Free;
         FCdsObjetos.Free;
         FCdsHonorarios.Free;
         FCdsHonor.Free;
         FCdsEtapas.Free;
         FCdsLitisconsortes.Free;
         FCdsDocumentoCAPCAR.Free;
         FCdsHistProcesso.Free;
      End;
   Inherited;
End;

Procedure TCtrlProcessoTrab.AfterInitialize;
Begin
   Inherited;
   FCtrlListTerceirosRH.InitializeAs(Self);
   FCtrlCalcRub.InitializeAs(Self);
   FCtrlDocumento.InitializeAs(Self);
   FCtrlSubConta.InitializeAs(Self);
   FCtrlLancamento.InitializeAs(Self);
   FCtrlBancoPortFolha.InitializeAs(Self);
   FCtrlIntegraRH.InitializeAs(Self);
   FCtrlEtapaProcesso.InitializeAs(Self);

   FCtrlCalcRub.IdEmpresa := FIdEmpresa;
End;

Procedure TCtrlProcessoTrab.OnCreateAppServer;
Begin
   Inherited;
   FCdsProcesso := TCMClientDataSet.Create(Nil);
   FCdsObjetos := TCMClientDataSet.Create(Nil);
   FCdsHonorarios := TCMClientDataSet.Create(Nil);
   FCdsHonor := TCMClientDataSet.Create(Nil);
   FCdsDocumentoCAPCAR := TCMClientDataSet.Create(Nil);
   FCdsEtapas := TCMClientDataSet.Create(Nil);
   FCdsLitisconsortes := TCMClientDataSet.Create(Nil);
   FCdsImovel := TCMClientDataSet.Create(Nil);
   FCdsEventoImovel := TCMClientDataSet.Create(Nil);
   FCdsHistProcesso := TCMClientDataSet.Create(Nil);
End;

Procedure TCtrlProcessoTrab.DoChangeDataBase;
Begin
   Inherited;
   FDbProcesso.DataBaseName := DataBaseName;
   FDbObjetos.DataBaseName := DataBaseName;
   FDbHonorarios.DataBaseName := DataBaseName;
   FDbEtapas.DataBaseName := DataBaseName;
   FDbLitisconsortes.DataBaseName := DataBaseName;
   FDbSubConta.DataBaseName := DataBaseName;
   FDbImovel.DataBaseName := DataBaseName;
   FDbEventoImovel.DataBaseName := DataBaseName;
   FDbHstProcTrab.DataBaseName := DataBaseName;

   FCtrlDocumento.DataBase := DataBase;
   FCtrlBancoPortFolha.DataBase := DataBase;
   FCtrlIntegraRH.DataBase := DataBase;
   FCtrlEtapaProcesso.DataBase := DataBase;
End;

Function TCtrlProcessoTrab.ListProcesso(NumProcTrab: double): OleVariant;
Begin
   FDbProcesso.NumProcTrab.asFloat := NumProcTrab;
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  *' + CR_LF +
      'FROM' + CR_LF +
      '  PROCESSOTRAB' + CR_LF +
      'WHERE' + CR_LF +
      '  (NUMPROCTRAB   = ' + FloatToStr(NumProcTrab) + ')');
End;

Function TCtrlProcessoTrab.ListDadosProcesso(NumProcTrab: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  PT.*, P5.NOME AS PARTICIPANTE, TP.NOMETIPOPROC AS TIPO_PROCESSO,' + CR_LF +
      '  TA.DESCRICAO AS TIPO_ACAO, VJ.DESCRICAO AS VARA_JUSTICA, P1.NOME AS ADVOG_REQ,' + CR_LF +
      '  P2.NOME AS NOSSO_ADVOG, P3.NOME AS ADVOG_CASA, P4.NOME AS ASSIST_TECNICO,' + CR_LF +
      '  CI.NOME AS CIDADE, TS.DESCRICAO AS TIPO_SENT, TP.FLGEXIGECCUSTO' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA P1, PESSOA P2, PESSOA P3, PESSOA P4, PESSOA P5, PROCESSOTRAB PT, TIPOPROCESSO TP,' + CR_LF +
      '  TIPOACAOPROCJUR TA, VARAJUSTICA VJ, TIPOSENTENCA TS, CIDADES CI' + CR_LF +
      'WHERE' + CR_LF +
      '  (PT.NUMPROCTRAB   = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (PT.IDRECLAMANTE  = P5.IDPESSOA) AND' + CR_LF +
      '  (PT.IDTIPOPROC    = TP.IDTIPOPROC(+)) AND' + CR_LF +
      '  (PT.IDTIPOACAO    = TA.IDTIPOACAO(+)) AND' + CR_LF +
      '  (PT.IDVARAJUSTICA = VJ.IDVARAJUSTICA(+)) AND' + CR_LF +
      '  (PT.IDCIDADES     = CI.IDCIDADES(+)) AND' + CR_LF +
      '  (PT.IDADVOGRECTE  = P1.IDPESSOA(+)) AND' + CR_LF +
      '  (PT.IDADVOGRECDA  = P2.IDPESSOA(+)) AND' + CR_LF +
      '  (PT.IDADVOGCASA   = P3.IDPESSOA(+)) AND' + CR_LF +
      '  (PT.IDASSISTTECN  = P4.IDPESSOA(+)) AND' + CR_LF +
      '  (PT.CODTIPOSENT   = TS.CODTIPOSENT(+))');
End;

Function TCtrlProcessoTrab.ListDadosLitisconsortes(NumProcTrab: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  DECODE(P.TIPO,''F'',P.NOME,P.RAZAOSOCIAL) AS NOME,' + CR_LF +
      '  DECODE(C.IDMOTIVO,NULL,''Normal'',M.DESCRICAO) AS SITUACAO,' + CR_LF +
      '  DECODE(NVL(C.INDTESTEMUNHA,0),' + CR_LF +
      '    0,''Litisconsorte Contraparte'',' + CR_LF +
      '    3,''Nossa Litisconsorte'',' + CR_LF +
      '    1,''Testemunha Contraparte'',' + CR_LF +
      '    2,''Nossa Testemunha'',' + CR_LF +
      '    4,''Parte Ré''' + CR_LF +
      '  ) AS CATEGORIA,' + CR_LF +
      '  C.IDPESSOA,' + CR_LF +
      '  C.NUMPROCTRAB,' + CR_LF +
      '  C.IDMOTIVO,' + CR_LF +
      '  C.INDTESTEMUNHA,' + CR_LF +
      '  C.DATAALTSIT,' + CR_LF +
      '  C.VALORCONDENACAO,' + CR_LF +
      '  C.IDPLANPREVCTBPATR,' + CR_LF +
      '  C.IDEMPRESA,' + CR_LF +
      '  C.CODCENTROCUSTO,' + CR_LF +
      '  VW.IDPLANOPREV, ' + CR_LF +
      '  VW.IDPATRO, ' + CR_LF +
      //      '  PL.NOME AS PLANO,' + CR_LF +
      //      '  P2.NOME AS PATRO' + CR_LF +
      '  VW.PLANOCONTABIL AS PLANO,' + CR_LF +
      '  VW.PATROCINADORA AS PATRO' + CR_LF +
      'FROM' + CR_LF +
      //      '  PESSOA P, COPARTPROCTRAB C, MOTIVO M, PESSOA P2, PARTPREVPLAN PR, PLANPREV PL' + CR_LF +
      '  PESSOA P, COPARTPROCTRAB C, MOTIVO M, VWPLANPREVCTBPATR VW' + CR_LF +
      'WHERE' + CR_LF +
      '  (C.NUMPROCTRAB  = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (C.IDPESSOA     = P.IDPESSOA) AND' + CR_LF +
      '  (C.IDMOTIVO     = M.IDMOTIVO(+)) AND' + CR_LF +
      //      '  (C.IDPESSOA     = PR.IDPESSOA(+)) AND' + CR_LF +
      '  (C.IDPLANPREVCTBPATR = VW.IDPLANPREVCTBPATR (+) )' + CR_LF +
      //      '  (PR.IDPESSJUR   = P2.IDPESSOA(+)) AND' + CR_LF +
      //      '  (PR.FLGDESATIVADO(+) = 0) AND' + CR_LF +
      //      '  (PR.IDPLANOPREV = PL.IDPLANOPREV(+))' + CR_LF +
      'ORDER BY UPPER(NOME)');
End;

Function TCtrlProcessoTrab.ListLitisconsorte(NumProcTrab: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  DECODE(P.TIPO,''F'',P.NOME,P.RAZAOSOCIAL) AS NOME, C.IDPESSOA, C.NUMPROCTRAB' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA P, COPARTPROCTRAB C' + CR_LF +
      'WHERE' + CR_LF +
      '  (C.NUMPROCTRAB = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (C.IDPESSOA    = P.IDPESSOA)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  UPPER(NOME)');
End;

Function TCtrlProcessoTrab.ListObjeto(NumProcTrab: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  NUMPROCTRAB, CODTIPOOBJETO, VALORRECL, PERCPROB, VALORSENTENCA,' + CR_LF +
      '  OBSERVACAO, INDVALOR, DATAINICIO, DATAFINAL, PERCORIG, DATAAVAL, IDTIPOPROC, TIPCODIGO, FLGCONTABVLPRINC, FLGCONTABENCERRADO' + CR_LF +
      'FROM' + CR_LF +
      '  OBJPROCTRAB' + CR_LF +
      'WHERE' + CR_LF +
      '  (NUMPROCTRAB   = ' + FloatToStr(NumProcTrab) + ')' + CR_LF +
      'ORDER BY' + CR_LF +
      '  CODTIPOOBJETO');
End;

Function TCtrlProcessoTrab.ListObjetoXTipo(NumProcTrab: double; Opcao: integer): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  OBJ.NUMPROCTRAB, OBJ.CODTIPOOBJETO, OBJ.VALORRECL, OBJ.PERCPROB, OBJ.PERCORIG,' + CR_LF +
      '  OBJ.VALORSENTENCA, OBJ.INDVALOR, OBJ.DATAINICIO, OBJ.DATAFINAL, OBJ.OBSERVACAO,' + CR_LF +
      '  ((OBJ.VALORRECL * OBJ.PERCPROB) / 100) ' + IFF(Opcao = 0, '', ' * OBJ.PERCORIG / 100') + ' AS VALORPROVAVEL, TOBJ.DESCRICAO,' + CR_LF +
      '  ((OBJ.VALORRECL * OBJ.PERCORIG) / 100) AS VALORORIG, OBJ.DATAAVAL, OBJ.IDTIPOPROC, OBJ.TIPCODIGO, OBJ.FLGCONTABVLPRINC, DECODE(OBJ.FLGCONTABVLPRINC, 0, ''Não'', ''Sim'') DSCCONTABVLPRINC,' + CR_LF +
      '  OBJ.FLGCONTABENCERRADO, DECODE(NVL(OBJ.FLGCONTABENCERRADO, 0), 0, ''Não'', ''Sim'') DSCCONTABENCERRADO' + CR_LF +
      'FROM' + CR_LF +
      '  OBJPROCTRAB OBJ, TIPOOBJPROCTRAB TOBJ' + CR_LF +
      'WHERE' + CR_LF +
      '  (OBJ.NUMPROCTRAB   = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (OBJ.CODTIPOOBJETO = TOBJ.CODTIPOOBJETO)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  UPPER(DESCRICAO)');
End;

Function TCtrlProcessoTrab.ListObjetoComTipo(NumProcTrab: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  TOBJ.DESCRICAO, OBJ.VALORRECL, OBJ.PERCPROB, OBJ.VALORSENTENCA,' + CR_LF +
      '  ((OBJ.VALORRECL * OBJ.PERCPROB) / 100) AS VALORPROVAVEL, OBJ.OBSERVACAO,' + CR_LF +
      '  ((OBJ.VALORRECL * OBJ.PERCORIG) / 100) AS VALORORIG, OBJ.DATAAVAL' + CR_LF +
      'FROM' + CR_LF +
      '  OBJPROCTRAB OBJ, TIPOOBJPROCTRAB TOBJ' + CR_LF +
      'WHERE' + CR_LF +
      '  (OBJ.NUMPROCTRAB   = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (OBJ.CODTIPOOBJETO = TOBJ.CODTIPOOBJETO)');
End;

Function TCtrlProcessoTrab.ListProcessosVinculados(NumProcTrab: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  P.NOME, P.IDPESSOA, PT.*' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA P, PROCESSOTRAB PT' + CR_LF +
      'WHERE' + CR_LF +
      '  (PT.IDPROCVINCULADO = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (PT.IDRECLAMANTE    = P.IDPESSOA)');
End;

Function TCtrlProcessoTrab.ListAdvogadosDoProcesso(NumProcTrab: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  P.IDPESSOA, P.NOME' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA P, PROCESSOTRAB PT' + CR_LF +
      'WHERE' + CR_LF +
      '  (PT.NUMPROCTRAB   = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  ((PT.IDADVOGRECDA = P.IDPESSOA) OR' + CR_LF +
      '   (PT.IDASSISTTECN = P.IDPESSOA))' + CR_LF +
      'ORDER BY' + CR_LF +
      '  UPPER(NOME)');
End;

Function TCtrlProcessoTrab.ListAdvogadosDaContraParte(NumProcTrab: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  P.IDPESSOA, P.NOME' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA P, PROCESSOTRAB PT' + CR_LF +
      'WHERE' + CR_LF +
      '  (PT.NUMPROCTRAB   = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (PT.IDADVOGRECTE = P.IDPESSOA)' + CR_LF +
      'ORDER BY' + CR_LF +
      '  UPPER(NOME)');
End;

Function TCtrlProcessoTrab.ListReclamantesDoProcesso(NumProcTrab: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  PT.PROCJCJNUM, P.NOME' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA P, PROCESSOTRAB PT' + CR_LF +
      'WHERE' + CR_LF +
      '  (PT.NUMPROCTRAB  = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (PT.IDRECLAMANTE = P.IDPESSOA)');
End;

Function TCtrlProcessoTrab.ListProcessosEnvolvidos(IdPessoa: double): OleVariant;
Begin
   Result := GetDataPacket(
      '(SELECT' + CR_LF +
      '   NUMPROCTRAB, DATANOTIF, ''Contraparte'' AS CATEGORIA,' + CR_LF +
      '   DECODE(INDMATERIA,1,''Trabalhista'',2,''Previdenciário'',''Judicial'') AS TIPO' + CR_LF +
      ' FROM' + CR_LF +
      '   PROCESSOTRAB' + CR_LF +
      ' WHERE' + CR_LF +
      '   (IDRECLAMANTE = ' + FloatToStr(IdPessoa) + '))' + CR_LF +
      'UNION' + CR_LF +
      '(SELECT' + CR_LF +
      '   C.NUMPROCTRAB, P.DATANOTIF,' + CR_LF +
      '   DECODE(NVL(C.INDTESTEMUNHA,0),' + CR_LF +
      '     0,''Litisconsorte Contraparte'',' + CR_LF +
      '     3,''Nossa Litisconsorte'',' + CR_LF +
      '     1,''Testemunha Contraparte'',' + CR_LF +
      '     2,''Nossa Testemunha'',' + CR_LF +
      '     4,''Parte Ré''' + CR_LF +
      '   ) AS CATEGORIA,' + CR_LF +
      '   DECODE(P.INDMATERIA,1,''Trabalhista'',2,''Previdenciário'',''Judicial'') AS TIPO' + CR_LF +
      ' FROM' + CR_LF +
      '   COPARTPROCTRAB C, PROCESSOTRAB P' + CR_LF +
      ' WHERE' + CR_LF +
      '   (C.IDPESSOA    = ' + FloatToStr(IdPessoa) + ') AND' + CR_LF +
      '   (C.NUMPROCTRAB = P.NUMPROCTRAB))' + CR_LF +
      'ORDER BY 1');
End;

Function TCtrlProcessoTrab.ListAgendaDoUsuario(IdUsuario: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  EP.ASSUNTO, EP.DATAREALOCOR, EP.NUMSEQ, EP.OBSERVETAPA,' + CR_LF +
      '  TR.DESCRICAO, P.NOME, PT.PROCJCJNUM, VJ.DESCRICAO AS VARA,' + CR_LF +
      '  CI.NOME AS CIDADE, ES.CODESTADO AS UF' + CR_LF +
      'FROM' + CR_LF +
      '  PESSOA P, PROCESSOTRAB PT, ETAPAPROCTRAB EP, TIPORECTRAB TR,' + CR_LF +
      '  CIDADES CI, ESTADO ES, VARAJUSTICA VJ' + CR_LF +
      'WHERE' + CR_LF +
      '  (EP.NUMPROCTRAB    = PT.NUMPROCTRAB) AND' + CR_LF +
      '  (EP.CODTIPORECURSO = TR.CODTIPORECURSO) AND' + CR_LF +
      '  (PT.IDADVOGCASA    = ' + FloatToStr(IdUsuario) + ') AND' + CR_LF +
      '  (EP.DATAREALOCOR  >= SYSDATE) AND' + CR_LF +
      '  (PT.IDRECLAMANTE   = P.IDPESSOA) AND' + CR_LF +
      '  (PT.IDVARAJUSTICA  = VJ.IDVARAJUSTICA(+)) AND' + CR_LF +
      '  (PT.IDCIDADES      = CI.IDCIDADES(+)) AND' + CR_LF +
      '  (CI.IDESTADO       = ES.IDESTADO(+))' + CR_LF +
      'ORDER BY' + CR_LF +
      '  EP.DATAREALOCOR');
End;

Function TCtrlProcessoTrab.ListHistAlterDoProcesso(NumProcTrab: double): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  HST.IDVARAJUSTICA, HST.IDTIPOPROC, HST.FLGPARTEATIVA,' + CR_LF +
      '  HST.TRGDTINCLUSAO, TP.NOMETIPOPROC AS TIPOPROCESSO,' + CR_LF +
      '  VJ.DESCRICAO AS VARA, US.NOMEUSUARIO,' + CR_LF +
      '  DECODE(HST.FLGPARTEATIVA,0,''Passiva'',1,''Ativa'',''Não Parte'') AS PARTE' + CR_LF +
      'FROM' + CR_LF +
      '  HSTPROCTRAB HST, TIPOPROCESSO TP,' + CR_LF +
      '  VARAJUSTICA VJ, USUARIOSISTEMA US' + CR_LF +
      'WHERE' + CR_LF +
      '  (HST.NUMPROCTRAB   = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (HST.IDTIPOPROC    = TP.IDTIPOPROC) AND' + CR_LF +
      '  (US.IDUSUARIO      = TRIM(SUBSTR(HST.TRGUSERINCLUSAO,3,28))) AND' + CR_LF +
      '  (HST.IDVARAJUSTICA = VJ.IDVARAJUSTICA(+))' + CR_LF +
      'ORDER BY' + CR_LF +
      '  HST.TRGDTINCLUSAO DESC');
End;

Function TCtrlProcessoTrab.ListPessoaParticipante(Matricula: String): Boolean;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT PP.IDPESSOA, P.NOME, PPC.IDPLANPREVCTBPATR, PP.FLGDESATIVADO,' + CR_LF +
      'PL.NOME AS PLANO, PPC.IDPLANPREVCTBPATR, P2.NOME AS PATRO' + CR_LF +
      'FROM   PESSOA P, PESSOA P2, PARTPREVPLAN PP, ELEGPATRO EL, ' + CR_LF +
      '  PLANPREVCONTABPATRO PPC, PLANPREV PL' + CR_LF +
      'WHERE' + CR_LF +
      '  (EL.MATRICULA   = ' + QuotedStr(Matricula) + ') AND' + CR_LF +
      '  (PP.IDPESSOA    = EL.IDPESSOA) AND' + CR_LF +
      '  (PP.IDPESSOA    = P.IDPESSOA) AND' + CR_LF +
      '  (PP.IDPLANOPREV = PPC.IDPLANOPREV) AND' + CR_LF +
      '  (PP.IDPESSJUR   = PPC.IDPATRO) AND' + CR_LF +
      '  (PP.IDPLANOPREV = PL.IDPLANOPREV) AND' + CR_LF +
      '  (PP.IDPESSJUR   = P2.IDPESSOA) AND' + CR_LF +
      '  (PP.IDPESSJUR   = EL.IDPESSJUR)');

   If (_CdsAux.RecordCount > 1) Then
      Begin
         _CdsAux.Filter := 'FLGDESATIVADO = 0';
         _CdsAux.Filtered := true;
      End;

   FIdPessoa := _CdsAux.FieldByName('IDPESSOA').asString;
   FNmPessoa := _CdsAux.FieldByName('NOME').asString;
   FNmPlanoP := _CdsAux.FieldByName('PLANO').asString;
   FNmPatroc := _CdsAux.FieldByName('PATRO').asString;
   FIdPlanPr := _CdsAux.FieldByName('IDPLANPREVCTBPATR').asInteger;

   _CdsAux.Free;
End;

Function TCtrlProcessoTrab.ContaNossaLitisconsorte(NumProcTrab: double): Integer;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT COUNT(*) AS CONTA' + CR_LF +
      'FROM   COPARTPROCTRAB' + CR_LF +
      'WHERE' + CR_LF +
      '  (NUMPROCTRAB  = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (INDTESTEMUNHA = 3)');

   Result := _CdsAux.FieldByName('CONTA').asInteger;

   _CdsAux.Free;
End;

Function TCtrlProcessoTrab.VerificaNumProcesso(NumProcesso: String): boolean;
Var
   _CdsProcesso: TCMClientDataSet;
Begin
   _CdsProcesso := TCMClientDataSet.Create(Nil);

   _CdsProcesso.Data := GetDataPacket(
      'SELECT NUMPROCTRAB' + CR_LF +
      'FROM   PROCESSOTRAB' + CR_LF +
      'WHERE  (PROCJCJNUM = ' + QuotedStr(NumProcesso) + ')');
   Result := Not (_CdsProcesso.IsEmpty);

   _CdsProcesso.Free;
End;

Function TCtrlProcessoTrab.VerificaContraParte(sIdPessoa: String): OleVariant;
Begin
   Result := GetDataPacket(
      '(SELECT DISTINCT' + CR_LF +
      '   P.NOME, PT.NUMPROCTRAB, PT.PROCJCJNUM, ''Contraparte'' AS TIPO' + CR_LF +
      ' FROM' + CR_LF +
      '   PESSOA P, PROCESSOTRAB PT' + CR_LF +
      ' WHERE' + CR_LF +
      '   (P.IDPESSOA = ' + sIdPessoa + ') AND' + CR_LF +
      '   (P.IDPESSOA = PT.IDRECLAMANTE))' + CR_LF +
      'UNION' + CR_LF +
      '(SELECT DISTINCT' + CR_LF +
      '   P.NOME, PT.NUMPROCTRAB, PT.PROCJCJNUM,' + CR_LF +
      '   DECODE(NVL(CP.INDTESTEMUNHA,0),' + CR_LF +
      '     0,''Litisconsorte Contraparte'',' + CR_LF +
      '     3,''Nossa Litisconsorte'',' + CR_LF +
      '     1,''Testemunha Contraparte'',' + CR_LF +
      '     2,''Nossa Testemunha'',' + CR_LF +
      '     4,''Parte Ré''' + CR_LF +
      '   ) AS TIPO' + CR_LF +
      ' FROM' + CR_LF +
      '   PESSOA P, COPARTPROCTRAB CP, PROCESSOTRAB PT' + CR_LF +
      ' WHERE' + CR_LF +
      '   (P.IDPESSOA     = ' + sIdPessoa + ') AND' + CR_LF +
      '   (P.IDPESSOA     = CP.IDPESSOA) AND' + CR_LF +
      '   (CP.NUMPROCTRAB = PT.NUMPROCTRAB))');
End;

Function TCtrlProcessoTrab.GravarProcessoTrab(NomeSubConta: String;
   IdBemAntes, IdConjuntoAntes: double): boolean;
Var
   _CdsSubConta: TCMClientDataSet;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.GravarProcessoTrab(FIdModulo, FIdUsuario, FIdEmpresa,
            FUsaPlanoPatro, FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, NomeSubConta,
            FCdsProcesso.Data, FCdsHonorarios.Data, FCdsHonor.Data, FCdsObjetos.Data,
            FCdsEtapas.Data, FCdsLitisconsortes.Data, FCdsImovel.Data, FCdsEventoImovel.Data,
            FCdsHistProcesso.Data);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         _CdsSubConta := TCMClientDataSet.Create(Nil);
         Try
            StartTransaction;

            // Criar Sub-Conta se for indicado no parâmetro e esta não existir
            NomeSubConta := Trim(NomeSubConta);
            If (NomeSubConta <> '') Then
               Begin
                  _CdsSubConta.Data := FCtrlListTerceirosRH.ListSubConta(FIdEmpresa, 0, NomeSubConta);

                  If (_CdsSubConta.IsEmpty) Then
                     Begin
                        _CdsSubConta.Insert;
                        _CdsSubConta.FieldByName('CODSUBCONTA').asFloat :=
                           FCtrlSubConta.LeUltimoRegSubConta(FIdEmpresa) + 1;
                        _CdsSubConta.FieldByName('IDPESSOA').asInteger := FIdEmpresa;
                        _CdsSubConta.FieldByName('NOMESUBCONTA').asString := NomeSubConta;
                        _CdsSubConta.Post;

                        Result := ApplyCds(_CdsSubConta, FDbSubConta, [], []);
                        If Not (Result) Then
                           Raise Exception.Create(FDbSubConta.MessageInfo);
                     End;

                  FCdsProcesso.FieldByName('CODSUBCONTA').asFloat :=
                     _CdsSubConta.FieldByName('CODSUBCONTA').asFloat;
               End;

            // Gravar Processo
            Result := ApplyCds(FCdsProcesso, FDbProcesso, [], []);
            If Not (Result) Then
               Raise Exception.Create(FDbProcesso.MessageInfo);

            FNumProcTrab := FDbProcesso.NumProcTrab.asFloat;

            // Gravar Hist. Processo
            Result := ApplyCds(FCdsHistProcesso, FDbHstProcTrab,
               [FDbProcesso.NumProcTrab], [FDbHstProcTrab.NumProcTrab]);
            If Not (Result) Then
               Raise Exception.Create(FDbHstProcTrab.MessageInfo);

            // Gravar Litisconsortes
            Result := ApplyCds(FCdsLitisconsortes, FDbLitisconsortes,
               [FDbProcesso.NumProcTrab], [FDbLitisconsortes.NumProcTrab]);
            If Not (Result) Then
               Raise Exception.Create(FDbLitisconsortes.MessageInfo);

            // Gravar Honorários das Etapas
            Result := ApplyCds(FCdsHonorarios, FDbHonorarios,
               [FDbProcesso.NumProcTrab], [FDbHonorarios.NumProcTrab]);
            If Not (Result) Then
               Raise Exception.Create(FDbHonorarios.MessageInfo);

            // Gravar Honorários da Aba
            Result := ApplyCds(FCdsHonor, FDbHonorarios,
               [FDbProcesso.NumProcTrab], [FDbHonorarios.NumProcTrab]);
            If Not (Result) Then
               Raise Exception.Create(FDbHonorarios.MessageInfo);

            // Gravar Objetos
            Result := ApplyCds(FCdsObjetos, FDbObjetos,
               [FDbProcesso.NumProcTrab], [FDbObjetos.NumProcTrab]);
            If Not (Result) Then
               Raise Exception.Create(FDbObjetos.MessageInfo);

            // Gravar Etapas
            Result := ApplyCds(FCdsEtapas, FDbEtapas,
               [FDbProcesso.NumProcTrab], [FDbEtapas.NumProcTrab]);
            If Not (Result) Then
               Raise Exception.Create(FDbEtapas.MessageInfo)
            Else
               Begin
                  FCtrlEtapaProcesso.CdsEtapas := FCdsEtapas;
                  FCtrlEtapaProcesso.CdsProcesso := FCdsProcesso;
                  FCtrlEtapaProcesso.AtualizarCAF(IdBemAntes, IdConjuntoAntes);
               End;

            // Gravar Imóvel
            Result := ApplyCds(FCdsImovel, FDbImovel, [], []);
            If Not (Result) Then
               Raise Exception.Create(FDbImovel.MessageInfo);

            // Gravar Evento Imóvel
            Result := ApplyCds(FCdsEventoImovel, FDbEventoImovel, [], []);
            If Not (Result) Then
               Raise Exception.Create(FDbEventoImovel.MessageInfo);

            Commit;
         Except
            On E: Exception Do
               Begin
                  Rollback;
                  Result := false;
                  MessageInfo := E.Message;
               End;
         End;
         _CdsSubConta.Free;
      End;
End;

Function TCtrlProcessoTrab.ExcluirProcessoTrab: boolean;
Var
   sNumProcTrab, sListaIdImagem: String;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.ExcluirProcessoTrab(FIdModulo, FIdUsuario, FIdEmpresa,
            FUsaPlanoPatro, FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, FCdsProcesso.Data,
            FCdsHonorarios.Data, FCdsHonor.Data, FCdsObjetos.Data, FCdsEtapas.Data,
            FCdsLitisconsortes.Data, FCdsHistProcesso.Data);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;

            sNumProcTrab := FDbProcesso.NumProcTrab.asString;

            // Excluir Hist. Processo
//            If (FCdsHistProcesso.RecordCount > 0) Then
//               Begin
            If Not (ExecSQL('DELETE HSTPROCTRAB WHERE NUMPROCTRAB = ' + sNumProcTrab)) Then
               Raise Exception.Create(MessageInfo);
            FCdsHistProcesso.EmptyDataSet;
            //               End;

                        // Excluir Honorários
            If (FCdsHonorarios.RecordCount > 0) Then
               Begin
                  If Not (ExecSQL('DELETE HONORARIOS WHERE NUMPROCTRAB = ' + sNumProcTrab)) Then
                     Raise Exception.Create(MessageInfo);
                  FCdsHonorarios.EmptyDataSet;
               End;

            // Excluir Honorários
{            If (FCdsHonor.RecordCount > 0) Then
               Begin
                  If Not (ExecSQL('DELETE HONORARIOS WHERE NUMPROCTRAB = ' + sNumProcTrab)) Then
                     Raise Exception.Create(MessageInfo);
                  FCdsHonor.EmptyDataSet;
               End;}

            // Excluir Objetos junto com seu Histórico
            If (FCdsObjetos.RecordCount > 0) Then
               Begin
                  If Not (ExecSQL('DELETE HSTOBJPROCTRAB WHERE NUMPROCTRAB = ' + sNumProcTrab)) Then
                     Raise Exception.Create(MessageInfo);

                  // Excluir Rateios
                  If Not (ExecSQL('DELETE JURIDICORATEIOCONTABIL WHERE NUMPROCTRAB = ' + sNumProcTrab)) Then
                     Raise Exception.Create(MessageInfo);

                  If Not (ExecSQL('DELETE OBJPROCTRAB WHERE NUMPROCTRAB = ' + sNumProcTrab)) Then
                     Raise Exception.Create(MessageInfo);
                  FCdsObjetos.EmptyDataSet;
               End;

            If (FCdsEtapas.RecordCount > 0) Then
               Begin
                  // Excluir Imagens associadas às Etapas
                  sListaIdImagem := '';
                  FCdsEtapas.DisableControls;
                  FCdsEtapas.First;
                  While Not (FCdsEtapas.EOF) Do
                     Begin
                        If (sListaIdImagem = '') Then
                           sListaIdImagem := FCdsEtapas.FieldByName('IDIMAGEM').asString
                        Else
                           sListaIdImagem := sListaIdImagem + ',' + FCdsEtapas.FieldByName('IDIMAGEM').asString;
                        FCdsEtapas.Next;
                     End;

                  If (sListaIdImagem <> '') Then
                     Begin
                        If (Pos(',', sListaIdImagem) > 0) Then
                           sListaIdImagem := ' IN (' + sListaIdImagem + ')'
                        Else
                           sListaIdImagem := ' = ' + sListaIdImagem;

                        If Not (ExecSQL('DELETE IMAGENS WHERE IDIMAGEM ' + sListaIdImagem)) Then
                           Raise Exception.Create(MessageInfo);
                     End;

                  // Excluir honorarios juridicos
                  If Not (ExecSQL('DELETE HONORJURIDICOSGERAIS WHERE NUMPROCTRAB = ' + sNumProcTrab)) Then
                     Raise Exception.Create(MessageInfo);

                  // Excluir Desdobramentos das Etapas
                  If Not (ExecSQL('DELETE ETPDESDOBRAMENTO WHERE NUMPROCTRAB = ' + sNumProcTrab)) Then
                     Raise Exception.Create(MessageInfo);

                  // Excluir Etapas
                  If Not (ExecSQL('DELETE ETAPAPROCTRAB WHERE NUMPROCTRAB = ' + sNumProcTrab)) Then
                     Raise Exception.Create(MessageInfo);
                  FCdsEtapas.EmptyDataSet;
                  FCdsEtapas.EnableControls;
               End;

            // Excluir Litisconsortes
            If (FCdsLitisconsortes.RecordCount > 0) Then
               Begin
                  If Not (ExecSQL('DELETE COPARTPROCTRAB WHERE NUMPROCTRAB = ' + sNumProcTrab)) Then
                     Raise Exception.Create(MessageInfo);
                  FCdsLitisconsortes.EmptyDataSet;
               End;

            // Desassociar Processos Vinculados
            If Not (ExecSQL(
               'UPDATE PROCESSOTRAB SET IDPROCVINCULADO=NULL WHERE (IDPROCVINCULADO = ' +
               sNumProcTrab + ')')) Then
               Raise Exception.Create(MessageInfo);

            // Excluir Processo
            Result := ApplyCds(FCdsProcesso, FDbProcesso, [], []);
            If Not (Result) Then
               Raise Exception.Create(FDbProcesso.MessageInfo);

            Commit;
         Except
            On E: Exception Do
               Begin
                  Rollback;
                  Result := false;
                  MessageInfo := E.Message;
               End;
         End;
      End;
End;

Function TCtrlProcessoTrab.ProcessarTxtLitisconsortes(NumProcTrab: double; DadosArquivo: String;
   Categoria: integer; ValorCondenacao: double; IdEmpresa: integer; CentroCusto: String;
   IdMotivo: integer; DataAlt: String): TStringList;
Var
   lstArquivo: TStringList;
   sMsg, sMatricula, sCateg: String;
   c, iNumErros: integer;
Begin
   Case (Categoria) Of
      0: sCateg := 'Litisconsorte Contraparte';
      3: sCateg := 'Nossa Litisconsorte';
      1: sCateg := 'Testemunha Contraparte';
      2: sCateg := 'Nossa Testemunha';
      4: sCateg := 'Parte Ré';
   End;

   lstArquivo := TStringList.Create;
   Result := TStringList.Create;

   // LOOP para cada linha no arquivo
   lstArquivo.Text := DadosArquivo;
   For c := 1 To lstArquivo.Count Do
      Begin
         // sMatricula := TiraCaracter(trim(lstArquivo[c-1]),'-'); ???
         sMatricula := trim(lstArquivo[c - 1]);
         // Buscar a pessoa e inserir em CdsLitisconsortes caso já não esteja lá
         ListPessoaParticipante(sMatricula);
         If (FIdPessoa = '') Then
            Result.Add(sMatricula + ' Matrícula Não Encontrada')
         Else
            Begin
               If Not (FCdsLitisconsortes.Locate('IDPESSOA;NUMPROCTRAB',
                  VarArrayOf([StrToFloat(FIdPessoa), NumProcTrab]), [])) Then
                  Begin
                     FCdsLitisconsortes.Insert;
                     FCdsLitisconsortes.FieldByName('IDPESSOA').asString := FIdPessoa;
                     FCdsLitisconsortes.FieldByName('NOME').asString := copy(FNmPessoa, 1, 55);
                     FCdsLitisconsortes.FieldByName('SITUACAO').asString := 'Normal';
                     FCdsLitisconsortes.FieldByName('CATEGORIA').asString := sCateg;
                     FCdsLitisconsortes.FieldByName('NUMPROCTRAB').asFloat := NumProcTrab;
                     FCdsLitisconsortes.FieldByName('INDTESTEMUNHA').asInteger := Categoria;
                     FCdsLitisconsortes.FieldByName('IDPLANPREVCTBPATR').asInteger := FIdPlanPr;
                     FCdsLitisconsortes.FieldByName('PLANO').asString := FNmPlanoP;
                     FCdsLitisconsortes.FieldByName('PATRO').asString := FNmPatroc;
                     If (CentroCusto <> '') Then
                        Begin
                           FCdsLitisconsortes.FieldByName('IDEMPRESA').asInteger := IdEmpresa;
                           FCdsLitisconsortes.FieldByName('CODCENTROCUSTO').asString := CentroCusto;
                        End;
                     If (IdMotivo <> 0) Then
                        Begin
                           FCdsLitisconsortes.FieldByName('IDMOTIVO').asInteger := IdMotivo;
                           FCdsLitisconsortes.FieldByName('DATAALTSIT').asString := DataAlt;
                        End;
                     FCdsLitisconsortes.FieldByName('VALORCONDENACAO').asFloat := ValorCondenacao;
                     FCdsLitisconsortes.Post;
                  End
               Else
                  Result.Add(sMatricula + ' ' + trim(FCdsLitisconsortes.FieldByName('NOME').asString) + ' Já é Litisconsorte');
            End;
      End;

   If (Result.Text = '') Then
      MessageInfo := 'Processo executado com sucesso.'
   Else
      MessageInfo := 'Processo executado com erros.';
End;

//**************** INICIO ROTINAS FINANCEIRAS E CONTABEIS ************************

Procedure TCtrlProcessoTrab.IniciarIntegracao(IdEmpresa, IdModulo, IdUsuario,
   IdEspAcesso: integer; UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal,
   PatroGlobal: integer);
Begin
   FIdEmpresa := IdEmpresa;
   FIdModulo := IdModulo;
   FIdUsuario := IdUsuario;
   FIdEspAcesso := IdEspAcesso;
   FPortadorFormaPadrao := FCtrlBancoPortFolha.GetCodPortFormaPadrao;
   FUsaPlanoPatro := UsaPlanoPatro;
   FObrigaAbc := ObrigaAbc;
   FObrigaCRespon := ObrigaCRespon;
   FPlanoPrevGlobal := PlanoPrevGlobal;
   FPatroGlobal := PatroGlobal;
End;

Function TCtrlProcessoTrab.GerarIntegracao(FazContab: boolean; DataEmissao,
   DataPagamento, DataDemissao: TDateTime; IdPlanoPrev, IdPatro, Plano: integer;
   CodTipRecDes: String; CodTipDoc: integer; ValorJuros: double;
   TipoProcAntes: integer; TipoAcao: String): boolean;
Begin
   {   If (ConnectionSide = cnsClient) Then
         Begin
            Result := Connection.AppServer.GerarIntegracaoProcesso(FazContab, DataEmissao,
               DataPagamento, DataDemissao, IdPlanoPrev, IdPatro, Plano,
               CodTipRecDes, CodTipDoc);
            MessageInfo := Connection.AppServer.MessageInfo;
         End
      Else
         Begin
            Result := true;

            FCodTipRecDes := CodTipRecDes;
            FIdPlano := Plano;
            FListaNumDocCAPCAR := '';
            FListaPlnCodigo := '';
            FFazContab := FazContab;
            FDataEmissao := DataEmissao;
            FDataDemissao := DataDemissao;
            FDataPagamento := DataPagamento;
            FValorTotal_Atual := 0;
            FValorCAPCAR := 0;
            FTipoProcAntes := TipoProcAntes;
            FTipoAcao := TipoAcao;
            MessageInfo := '';

            Try
               FCdsObjetos.DisableControls;
               FCdsObjetos.First;
               Try
                  StartTransaction;

                  DoProgresso(['']);
                  While Not (FCdsObjetos.EOF) Do
                     Begin

                        FCdsObjetos.Next;
                        DoProgresso(['']);
                     End;

   {               FValorCAPCAR := FValorCAPCAR - FValorDepPenh; // abate depos. + penhoras

                  If (FazCAPCAR) And (FValorCAPCAR <> 0) Then
                     If Not (GerarIntegracaoCAPCAR) Then
                        Raise Exception.Create(MessageInfo);}

   DoProgresso(['']);
   Commit;

   // Criação das mensagens de término do processo de integração
{               If (FazCAPCAR) Then
      Begin
         If (FListaNumDocCAPCAR <> '') Then
            MessageInfo :=
               'Contas a ' + IFF(FRecPag = 'P', 'Pagar', 'Receber') + ' gerada com sucesso.' + CR_LF +
               'Documento(s) Nº.: ' + FListaNumDocCAPCAR
         Else
            MessageInfo :=
               'Contas a ' + IFF(FRecPag = 'P', 'Pagar', 'Receber') + ' não foi feita.';
      End;

   If (FazContab) Then
      Begin
         If (MessageInfo <> '') Then
            MessageInfo := MessageInfo + CR_LF + CR_LF;

         If (FListaPlnCodigo <> '') Then
            MessageInfo := MessageInfo +
               'Contabilização gerada com sucesso.' + CR_LF +
               'Planilha(s) Nº.: ' + FListaPlnCodigo
         Else
            MessageInfo := MessageInfo +
               'Contabilidade não foi feita.';
      End;
Except
   On E: Exception Do
      Begin
         Rollback;
         Result := false;
         MessageInfo := E.Message;
      End;
End;

FCdsObjetos.First;
FCdsObjetos.EnableControls;

If (FazCAPCAR) Then
   FCdsDocumentos.Free;
Except
On E: Exception Do
   Begin
      Result := false;
      MessageInfo := E.Message;
   End;
End;

// A nova situação passa a ser a "anterior", caso o usuário faça nova atualização
IniciarValoresContabeis(DataDemissao);
End;}
End;

Function TCtrlProcessoTrab.GerarIntegracaoCAPCAR: boolean;
Var
   bErro: boolean;
Begin
   Try
      FIdFavorecido := FCdsProcesso.FieldByName('IDRECLAMANTE').asInteger;
      bErro := Not (GerarCAPCAR);
      If Not (bErro) Then
         Begin
            // Gravar no Banco os Documentos
            If Not (FCtrlIntegraRH.GravarDocumentos(
               false, 0, FPortadorFormaPadrao, FDataEmissao, FDataPagamento,
               false, FUsaPlanoPatro, FPlanoPrevGlobal, FPatroGlobal, 0, '')) Then
               Begin
                  Raise Exception.Create(FCtrlIntegraRH.MessageInfo);
               End;

            FCdsDocumentos.EmptyDataSet;
         End;
   Except
      On E: Exception Do
         Begin
            MessageInfo := E.Message;
            bErro := true;
         End;
   End;

   If (bErro) Then
      MessageInfo := 'Contas a Pagar/Receber Não Efetuada.' + CR_LF + CR_LF + MessageInfo
   Else
      Begin
         If (FListaNumDocCAPCAR = '') Then
            FListaNumDocCAPCAR := FCtrlIntegraRH.NumDocGerados
         Else
            FListaNumDocCAPCAR := FListaNumDocCAPCAR + ',' + FCtrlIntegraRH.NumDocGerados;
      End;

   Result := Not (bErro);
End;

Procedure TCtrlProcessoTrab.IniciarValoresContabeis(DataDemissao: TDate);
Var
   c: integer;
   dValorObjeto: double;
Begin
   FCdsObjetos.DisableControls;
   FCdsObjetos.First;

   FSituacao_Original := FCdsProcesso.FieldByName('FLGSITPROC').asInteger;
   FNumObjetos_Original := FCdsObjetos.RecordCount;

   FCodObjeto_Original := VarArrayCreate([1, FNumObjetos_Original], varDouble);
   FValorReclamado_Original := VarArrayCreate([1, FNumObjetos_Original], varDouble);
   FValorAtualizacaoMonetaria_Original := VarArrayCreate([1, FNumObjetos_Original], varDouble);

   c := 1;
   FValorTotal_Original := 0;
   While Not (FCdsObjetos.EOF) Do
      Begin
         dValorObjeto := GetValorObjeto;

         FCodObjeto_Original[c] := FCdsObjetos.FieldByName('CODTIPOOBJETO').asFloat;
         FValorReclamado_Original[c] := dValorObjeto;
         FValorAtualizacaoMonetaria_Original[c] := FCtrlCalcRub.ValorAtualProcesso(
            dValorObjeto, GetDataHistorico(DataDemissao),
            FCdsProcesso.FieldByName('MOEDAPROCTRAB').asString,
            FCdsProcesso.FieldByName('IDREGRA').asString,
            FCdsProcesso.FieldByName('NUMPROCTRAB').asString,
            FCdsProcesso.FieldByName('INDTAXACONV').asInteger) - dValorObjeto;

         FValorTotal_Original := FValorTotal_Original + dValorObjeto;
         FCdsObjetos.Next;
         Inc(c);
      End;
   FCdsObjetos.First;
   FCdsObjetos.EnableControls;
End;

Function TCtrlProcessoTrab.GetValorLancamento(Aplica_se_A: integer; ValorJuros: double): double;
Var
   iNumDias, iNumMeses, iNumAnos: integer;
Begin
   Case (Aplica_se_A) Of
      0: Result := FValorReclamado_Atual; // Principal
      1: Result := FValorAtualizacaoMonetaria_Atual; // Correção Monetária
      2: // Juros
         Begin
            CalculaDifData(IFF(FCdsProcesso.FieldByName('FLGSITPROC').asInteger = 1,
               FCdsProcesso.FieldByName('DATAEFETENC').asString,
               IFF(FCdsProcesso.FieldByName('DATAJUROS').IsNull,
               FCdsProcesso.FieldByName('DATANOTIF').asString,
               FCdsProcesso.FieldByName('DATAJUROS').asString)),
               DateToStr(FDataEmissao), iNumDias, iNumMeses, iNumAnos);

            If (ValorJuros > 0) Then
               Result := FValorReclamado_Atual * iNumMeses * ValorJuros / 100
            Else
               Result := JuroComposto(FValorReclamado_Atual, iNumMeses, ValorJuros);

            If (FFazCAPCAR) Then
               FValorCAPCAR := FValorCAPCAR + Result;
         End;
   Else
      Result := 0;
   End;
End;

Procedure TCtrlProcessoTrab.SetValoresIntegracao;
Var
   c: integer;
   dValorObjeto: double;
Begin
   dValorObjeto := GetValorObjeto;
   FValorReclamado_Atual := dValorObjeto;
   FValorAtualizacaoMonetaria_Atual := FCtrlCalcRub.ValorAtualProcesso(
      dValorObjeto, GetDataHistorico(FDataDemissao),
      FCdsProcesso.FieldByName('MOEDAPROCTRAB').asString,
      FCdsProcesso.FieldByName('IDREGRA').asString,
      FCdsProcesso.FieldByName('NUMPROCTRAB').asString,
      FCdsProcesso.FieldByName('INDTAXACONV').asInteger) - dValorObjeto;

   If (FFazCAPCAR) And (FSituacao_Original = ABERTO) Then
      FValorCAPCAR := FValorCAPCAR + FValorAtualizacaoMonetaria_Atual + dValorObjeto;

   If (FValorTotal_Original > 0) Then
      For c := 1 To FNumObjetos_Original Do
         If (FCdsObjetos.FieldByName('CODTIPOOBJETO').asFloat = FCodObjeto_Original[c]) Then
            Begin
               FValorReclamado_Atual := FValorReclamado_Atual - FValorReclamado_Original[c];
               FValorAtualizacaoMonetaria_Atual := FValorAtualizacaoMonetaria_Atual - FValorAtualizacaoMonetaria_Original[c];

               If (FFazCAPCAR) And (FSituacao_Original = ENCERRADO) Then
                  FValorCAPCAR := FValorCAPCAR + FValorAtualizacaoMonetaria_Atual + FValorReclamado_Atual;

               break;
            End;
End;

Function TCtrlProcessoTrab.GetValorObjeto: double;
Begin
   // Se o processo está encerrado, o valor do objeto será o Valor da Sentença, se não, será o Valor Provável
   If (FCdsProcesso.FieldByName('FLGSITPROC').asInteger = 1) Then // Processo encerrado
      Result := FCdsObjetos.FieldByName('VALORSENTENCA').asFloat
   Else
      Result := FCdsObjetos.FieldByName('VALORPROVAVEL').asFloat;
End;

Procedure TCtrlProcessoTrab.SetNumContraparte;
Var
   iNum: integer;
Begin
   FCdsLitisconsortes.DisableControls;
   FCdsLitisconsortes.First;

   iNum := 0;
   While Not (FCdsLitisconsortes.EOF) Do
      Begin
         If (FCdsLitisconsortes.FieldByName('INDTESTEMUNHA').asInteger = 0) Then
            Inc(iNum);
         FCdsLitisconsortes.Next;
      End;
   FCdsProcesso.FieldByName('QTDERECTES').asInteger := iNum + 1;

   FCdsLitisconsortes.First;
   FCdsLitisconsortes.EnableControls;
End;

Function TCtrlProcessoTrab.GetRecPag: String;
Var
   dValorObjeto, dValorAtualizacaoMonetaria: double;
Begin
   FCdsObjetos.DisableControls;
   FCdsObjetos.First;

   FValorTotal_Atual := 0;
   While Not (FCdsObjetos.EOF) Do
      Begin
         dValorObjeto := GetValorObjeto;
         dValorAtualizacaoMonetaria := FCtrlCalcRub.ValorAtualProcesso(
            dValorObjeto, GetDataHistorico(FDataDemissao),
            FCdsProcesso.FieldByName('MOEDAPROCTRAB').asString,
            FCdsProcesso.FieldByName('IDREGRA').asString,
            FCdsProcesso.FieldByName('NUMPROCTRAB').asString,
            FCdsProcesso.FieldByName('INDTAXACONV').asInteger) - dValorObjeto;

         FValorTotal_Atual := FValorTotal_Atual + dValorObjeto + dValorAtualizacaoMonetaria;

         FCdsObjetos.Next;
      End;

   FCdsObjetos.First;
   FCdsObjetos.EnableControls;

   FCdsEtapas.DisableControls;
   FCdsEtapas.First;

   While Not (FCdsEtapas.EOF) Do
      Begin
         If FCdsEtapas.FieldByName('FLGVALORABATE').asInteger > 0 Then
            FValorTotal_Atual := FValorTotal_Atual - // menos dep/penh, mais lev/convol.
            FCdsEtapas.FieldByName('VALORREC').asFloat *
               IFF(FCdsEtapas.FieldByName('FLGVALORABATE').asInteger < 3, 1, -1);

         FCdsEtapas.Next;
      End;

   FCdsEtapas.First;
   FCdsEtapas.EnableControls;

   // Indicação de Integração com o Contas A Pagar ou A Receber é feito de acordo com a
   // Parte da empresa no processo (Ativa ou Passiva) e se o valor aumentou ou diminuiu
   // |------------|---------------------|
   // |            |        Valor        |
   // |    Parte   |----------|----------|
   // |            | Aumentou | Diminuiu |
   // |------------|----------|----------|
   // |  Passiva   |     P    |    R     |
   // |------------|----------|----------|
   // |   Ativa    |     R    |    P     |
   // |------------|----------|----------|
   Case (FCdsProcesso.FieldByName('FLGPARTEATIVA').asInteger) Of
      0: // Parte Passiva
         Begin
            If (FValorTotal_Atual > FValorTotal_Original) Then
               FRecPag := 'P'
            Else
               FRecPag := 'R';
         End;
      1: // Parte Ativa
         Begin
            If (FValorTotal_Atual > FValorTotal_Original) Then
               FRecPag := 'R'
            Else
               FRecPag := 'P';
         End;
   End;
   Result := FRecPag;
End;

Procedure TCtrlProcessoTrab.SetRecPag(RecPag: String);
Begin
   FRecPag := RecPag;
End;

Function TCtrlProcessoTrab.GerarCAPCAR: boolean;
Begin
   Try
      // Guardo o valor da Rubrica
      If Not (FCtrlIntegraRH.SetDadosDocumento(
         -1, -1, FIdPlano, -1, FPortadorFormaPadrao, FIdFavorecido, '', CODCENTRORESPON_PADRAO,
         FCodTipRecDes, FRecPag, IFF(FRecPag = 'P', 'D', 'C'), Abs(FValorCAPCAR), 0, '', 0)) Then
         Begin
            Raise Exception.Create(FCtrlIntegraRH.MessageInfo);
         End;

      Result := true;
   Except
      On E: Exception Do
         Begin
            MessageInfo := E.Message;
            Result := false;
         End;
   End;
End;

Procedure TCtrlProcessoTrab.ZerarValoresProcesso;
Begin
   FValorTotal_Original := 0;
   FValorReclamado_Atual := 0;
   FValorAtualizacaoMonetaria_Atual := 0;
End;

Function TCtrlProcessoTrab.GetDataHistorico(DataDemissao: TDate): String;
Begin
   If (FCdsProcesso.FieldByName('FLGSITPROC').asInteger = 0) Then
      Begin
         If (FIdModulo = MODCON) Then
            Begin
               If (DataDemissao = 0) Then
                  Result := FCdsProcesso.FieldByName('DATANOTIF').asString
               Else
                  Result := DateToStr(DataDemissao);
            End
         Else
            Result := FCdsProcesso.FieldByName('DATANOTIF').asString;
      End
   Else
      Result := FCdsProcesso.FieldByName('DATAEFETENC').asString;
End;

Function TCtrlProcessoTrab.RatearDespesas(Valor, CodEtapa: double; ListaProcesso: String; DataRateio: TDate): boolean;
Var
   sNumProcesso: String;
   iNumSeq: integer;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.RatearDespesas(Valor, CodEtapa, ListaProcesso);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;
            ExecSQL('UPDATE PROCESSOTRAB SET DESPESAPROC = DESPESAPROC + ' + Float2String(Valor) +
               ' WHERE NUMPROCTRAB IN (' + ListaProcesso + ')');

            While (CodEtapa > 0) And (ListaProcesso <> '') Do
               Begin
                  ExtraiString(ListaProcesso, sNumProcesso, ',');
                  iNumSeq := FCtrlEtapaProcesso.ApanhaProximoNumSeq(sNumProcesso);

                  //-- Renan Cristiano SOL 131242 Kintana 745290 Início.
                  ExecSQL('INSERT INTO ETAPAPROCTRAB (NUMPROCTRAB,NUMSEQ,CODTIPORECURSO,' +
                     '  VALORREC,DATAREALOCOR,ASSUNTO,FLGVALORABATE) ' +
                     'VALUES (' + sNumProcesso + ',' + IntToStr(iNumSeq) +
                     ',' + FloatToStr(CodEtapa) + ',' + Float2String(Valor) +
                     ',TO_DATE(' + QuotedStr(dateToStr(DataRateio)) + ',''DD/MM/YYYY''),' +
                     '''Rateio de Despesas'',0)');
                  //-- Renan Cristiano SOL 131242 Kintana 745290 Fim.
               End;

            Commit;
            Result := true;
         Except
            On E: Exception Do
               Begin
                  Rollback;
                  Result := false;
                  MessageInfo := E.Message;
               End;
         End;
      End;
End;

Function TCtrlProcessoTrab.AtualizarImovel(IdImovel: double; Inicio: boolean): boolean;
Begin
   FCtrlEtapaProcesso.CdsProcesso := FCdsProcesso;
   FCtrlEtapaProcesso.CdsEtapas := FCdsEtapas;
   FCtrlEtapaProcesso.AtualizarImovel(IdImovel, Inicio);
End;

Function TCtrlProcessoTrab.InserirEventoImovel(IdImovel: double; EviData: TDate;
   Inicio: boolean; EviDescricao: String; EviPercent, EviVlrAjustado: double): boolean;
Begin
   FCtrlEtapaProcesso.InserirEventoImovel(IdImovel, EviData, Inicio, EviDescricao,
      EviPercent, EviVlrAjustado);
End;

Procedure TCtrlProcessoTrab.AssociarCdsImovel(CdsImovel, CdsEventoImovel: TCMClientDataSet);
Begin
   FCdsImovel := CdsImovel;
   FCdsEventoImovel := CdsEventoImovel;
   FCtrlEtapaProcesso.CdsImovel := FCdsImovel;
   FCtrlEtapaProcesso.CdsEventoImovel := FCdsEventoImovel;
End;

Procedure TCtrlProcessoTrab.OnApplyCdsRecord(aCds: TClientDataSet;
   Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean);
Var sSQL, sNumProc: String;
Begin
   Inherited;
   If (sTableName = 'OBJPROCTRAB') And (CdsState = usDeleted) Then
      Begin
         sNumProc := aCds.Fieldbyname('NUMPROCTRAB').AsString;
         If sNumProc = '' Then
            sNumProc := '0';

         sSQL := 'delete from HSTOBJPROCTRAB where NUMPROCTRAB = ' + sNumProc +
            ' and CODTIPOOBJETO = ' +
            aCds.Fieldbyname('CODTIPOOBJETO').AsString;
         If Not ExecSQL(sSQL) Then
            Raise Exception.Create(MessageInfo);
      End;
End;

Function TCtrlProcessoTrab.TotalValorSentenca(NumProcTrab: double): double;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT SUM(VALORSENTENCA) AS TOTAL' + CR_LF +
      'FROM   OBJPROCTRAB' + CR_LF +
      'WHERE' + CR_LF +
      '  (NUMPROCTRAB  = ' + FloatToStr(NumProcTrab) + ')');

   Result := _CdsAux.FieldByName('TOTAL').asInteger;

   _CdsAux.Free;
End;

Procedure TCtrlProcessoTrab.ReceberValorDepPenh(NumProcTrab: double);
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT SUM(VALORREC * DECODE(NVL(FLGVALORABATE,0),1,1,2,1,3,-1,4,-1,0)) AS TOTAL' + CR_LF +
      'FROM   ETAPAPROCTRAB' + CR_LF +
      'WHERE' + CR_LF +
      '  (NUMPROCTRAB  = ' + FloatToStr(NumProcTrab) + ')');

   FValorDepPenh := _CdsAux.FieldByName('TOTAL').asFloat;

   _CdsAux.Free;
End;

Function TCtrlProcessoTrab.RetornaPlanoPatro(Plano, Patro: String): String;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT IDPLANPREVCTBPATR' + CR_LF +
      'FROM   PLANPREVCONTABPATRO' + CR_LF +
      'WHERE' + CR_LF +
      '  (IDPLANOPREV  = ' + Plano + ') AND' + CR_LF +
      '  (IDPATRO  = ' + Patro + ')');

   Result := _CdsAux.FieldByName('IDPLANPREVCTBPATR').asString;

   _CdsAux.Free;
End;

End.

