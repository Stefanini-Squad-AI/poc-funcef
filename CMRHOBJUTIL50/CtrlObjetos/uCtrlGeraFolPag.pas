unit uCtrlGeraFolPag;

interface

uses SysUtils, Controls, Classes, uCmControlObject, uCmDbObject, IvDictio, uCMTranslate,
  uCmClientDataSet, uCMTypes, uDiasUteis, uCtrlIntBanco, uCtrlFuncoesRH, uCtrlCustomRH,
  uCtrlCtFolha, uCtrlIntegraCAPCAR_RH, uCtrlCalcRub, uCtrlBancoPortFolha, uCtrlExecQryRH,
  uCtrlListTerceirosRH;

const
  // Indicação do processo de cálculo
  PREVIA = 0;
  FINAL = 1;

  // Tipos de Folha que podem ser geradas
  FOLHA_NORMAL = 0;
  FOLHA_FERIAS = 1;
  FOLHA_13SAL = 2;
  FOLHA_ESPECIAL = 3;

  // O campo usado atualmente é o VALORCOTAS pois não existe o campo SEQORIGINAL na
  // tabela PREVIFOLPAG. Assim que o mesmo estiver na maioria dos clientes, iremos trocar.
  CAMPO_SEQ_ORIGINAL = 'VALORCOTAS';

type
  TCtrlGeraFolPag = class(TCtrlCustomRH)
  protected
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlCtFolha: TCtrlCtFolha;
    FCtrlBancoPortFolha: TCtrlBancoPortFolha;
    FCtrlIntegraCAPCAR_RH: TCtrlIntegraCAPCAR_RH;
    FCtrlCalcRub: TCtrlCalcRub;
    FCtrlIntBanco: TCtrlIntBanco;
    FCtrlExecQryRH: TCtrlExecQryRH;

    FCdsFunc: TCMClientDataSet;
    FCdsRubEsp: TCMClientDataSet;
    FCdsDocumentos: TCMClientDataSet;
    FCdsPortadorForma: TCMClientDataSet;
    FCdsCAP: TCMClientDataSet;
    FCdsRubIndiv: TCMClientDataSet;
    FCdsRubXRub: TCMClientDataSet;
    FCdsDocTxt: TCMClientDataSet;
    FCdsDescFolha: TCMClientDataSet;

    FLstPortForma: TStringList;

    FHoraInicial: TTime;

    FPortadorFormaPadrao: integer; // Código do Portador Forma Padrão
    FIdEmpresa: integer; // Código da Empresa Proprietária que está sendo processada
    FProcesso: integer; // 0 -> Previa; 1 -> Final
    FOpcaoPrevia: integer;
    FTipoMotivo: integer; // Tipo da Folha a ser gerada (Normal, Férias, 13º Sal, Especial)
    FIdMotivo: integer; // Código do Tipo da Folha a ser gerada
    FTipoCliente: integer; // Identifica o Cliente que está utilizando a Folha (Ex: REFER)
    FPlanoPrevGlobal: integer;
    FPatroGlobal: integer;
    FIdPlano: integer;
    FUltPortForma: integer;
    FCodPortForma: integer;
    FLimDem: integer; // Indica se processa TmpDesc de Outra Empresa (1=Sim, 0=Não)

    FContaPadrao_Favorecido: string; // Conta Contábil usada para criar um Favorecido
    FIdPlano_ContaPadrao_Favorecido: integer; // IdPlano Conta Contábil usada para criar um Favorecido

    FIdPessoa: integer; // Código da Pessoa que está sendo processada
    FIdFavorecido: integer; // Código do Favorecido da Rubrica que está sendo processada
    FTotalGeral_Prov: double; // Totalizador dos Proventos da Passoa que está sendo processada
    FTotalGeral_Desc: double; // Totalizador dos Descontos da Passoa que está sendo processada
    FValorRubrica: double; // Valor Calculado da Rubrica
    FUltValorLiquido: double;

    FProcTmpDesc: boolean; // Indica se há lançamentos na TMPDESC
    FIntegra_CAP: boolean; // Indica se deve integrar com o CAP
    FIntegra_PagEletronico: boolean; // Indica se deve gerar arquivo de Pagamento Eletrônico
    FRateioCC: boolean; // Indica se deve fazer o rateio por Centro de Custo no CAP
    FCriarDocIndividual: boolean; // Indica se deve criar um Documento CAP por pessoa
    FUsaPlanoPatro: boolean; // Indica se deve usar Plano da Patrocinadora

    FNormalFim: TDate;
    FDataPagamento: TDate;
    FDataEmissao: TDateTime;
    FDataProcessamento: TDate;
    FGeracaoFolhaNormal: boolean;

    FTipoEmpresa: string;
    FNomeTabela: string;
    FSQL: string; // Variável auxiliar para a criação de SQLs dinâmicos
    //FMascara: string; // Máscara do Plano de Contas
    FListaIdRubPrincipal: string;
    FMesRef: string;
    FMesPagto: string;
    FListaTipoDesemb: string;
    FReferencia: string;
    FIdRegra: string;
    FCodProvDescFGTS: string;
    FUltContaCorrente: string;
    FUltIdBanco: string;
    FUltNumAgencia: string;
    FCodTipRecDes: string; // Código do Tipo de Recebimento Desembolso
    FDiretorioArqPag: string; // Diretório que será gravado o arquivo de Pagamento Eletrônico
    FLOG: string;
    FNumDocGerados: string;

    FIAppCliente: OleVariant;

    procedure EnviarMensagem(const Processo: WideString; const TempoDecorrido: WideString = '';
      QtdeFunc: Integer = 0; const PessoaAtual: WideString = ''; NumRegistros: Integer = 0;
      Incremento: Integer = 0; const Msg: WideString = '');

    function AbrirSQLFunc: boolean; virtual;
    function PrepararRubEspeciais: boolean; virtual;
    function ExisteRegistro_TmpDesc(ListaEmpregado: string): boolean;

    function ListRubricaIndiv: OleVariant;
    function ListHistoricoPessoaMes(IdMotivo: integer): OleVariant;
    function ListRubXRub: OleVariant;
    function ListEndereco: OleVariant;
    function ListDocPagEletronico: OleVariant;
    function ListDescFolha(OutraEmpresa: integer; ValorTaxa: string): OleVariant;
    function ListBanco(IdResponsavel: double): OleVariant;

    procedure SelDadosIntegracaoEmpresa;
    procedure SelDadosIntegracaoPessoa;

    function GetTempoDecorrido: string;
    function GetProxNumSeq_Historico(IdRubrica: double): integer;

    function  Init_Integracao: boolean;
    function  GerarCAP: boolean;
    procedure SetDadosPagEletronico;

    procedure SetUltValorLiquido(const CodRubCLT: string; const Valor: double);

    function GerarLinhaCAP(const IdRubrica: double; const Valor: double): boolean;

    function  GerarIntegracaoCAP: boolean;
    function  GerarPagEletronico: boolean;

    function  SetRubricaIndiv_JaProcessada(IdMotivo: integer; IdRubrica: double;
      SeqRubricaIndiv: integer): boolean;
    procedure SomarValorRubEspecial(ValProvento, ValBase: double; AchouBase: boolean);
    procedure CalcAnuenioREFER(Matricula: string; var Referencia: string);
    procedure SomarTotalGeral(FlgDesconto: integer; Valor: double);

    function  CriarObjetos_Geracao: boolean; virtual;
    procedure DestruirObjetos_Geracao; virtual;

    function ApagarPrevia: boolean; virtual;
    function ProcDescFolha(IdMotivo: integer; IdRubrica: double; ValorTaxa: string;
      var TotDesc, ValBase: double): boolean;
    function GravarRubrica(IdRubrica: double; CodProvDesc: string; IdMotivo: integer;
      Mes, MesCobranca, Referencia: string; IdRegraCalculo: double; FlgCompoeSalPart,
      FlgCompoeSalBenef, FlgIRRF, SeqOriginal: integer; ValorProvento: double): boolean;

    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  public
    constructor Create(IdEmpresa: integer; IdHotel: double;
      UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce; virtual;
    destructor  Destroy; override;

    property LOG: string read FLOG;
    property NumDocGerados: string read FNumDocGerados;
  end;

implementation

uses Db, fAguarde;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_AVISO_PAGTO_ELETR =
    '[AVISO] O Arquivo de Pagamento Eletrônico não foi criado. :1'+
    'Verifique se possui acesso à pasta indicada para gravação :2'+
    'ou alguma informação requerida está faltando. :3'+
    'Ex: Associação da Rubrica CLT';
  MSG_AVISO_CAP =
    '[AVISO] A integração com o Contas a Pagar não foi efetuada. :1'+
    'Verifique se alguma informação requerida está faltando. :2'+
    'Ex: Favorecido não indicado na Parametrização das Rubricas.';
  MSG_ALOCA_MEM =
    '* Alocação de memória para os objetos :1'+
    'envolvidos no processo de Geração da Rescisão.';
  MSG_LIBERA_MEM =
    '* Liberação de memória para os objetos :1'+
    'envolvidos no processo de Geração da Rescisão.';

{ TCtrlGeraFolPag }

constructor TCtrlGeraFolPag.Create(IdEmpresa: integer; IdHotel: double;
  UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlCtFolha := TCtrlCtFolha.Create;
  FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create(IdEmpresa);
  FCtrlIntegraCAPCAR_RH := TCtrlIntegraCAPCAR_RH.Create(IdHotel, UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlCalcRub := TCtrlCalcRub.Create;
  FCtrlExecQryRH := TCtrlExecQryRH.Create;
  FCtrlIntBanco := TCtrlIntBanco.Create;
  FCtrlIntBanco.FechaQryTexto := false;
  FCtrlIntBanco.IdentficaOrigem := 'P';

  FIdEmpresa := IdEmpresa;
end;

destructor TCtrlGeraFolPag.Destroy;
begin
  FreeAndNil(FCtrlListTerceirosRH);
  FreeAndNil(FCtrlCtFolha);
  FreeAndNil(FCtrlBancoPortFolha);
  FreeAndNil(FCtrlIntegraCAPCAR_RH);
  FreeAndNil(FCtrlCalcRub);
  FreeAndNil(FCtrlIntBanco);
  FreeAndNil(FCtrlExecQryRH);
  inherited;
end;

procedure TCtrlGeraFolPag.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlGeraFolPag.AfterInitialize;
begin
  inherited;
  FCtrlListTerceirosRH.InitializeAs(Self);
  FCtrlCtFolha.InitializeAs(Self);
  FCtrlBancoPortFolha.InitializeAs(Self);
  FCtrlIntegraCAPCAR_RH.InitializeAs(Self);
  FCtrlCalcRub.InitializeAs(Self);
  FCtrlIntBanco.InitializeAs(Self);
  FCtrlExecQryRH.InitializeAs(Self);
  FCtrlExecQryRH.OpenTransaction := false;
end;

procedure TCtrlGeraFolPag.DoChangeDataBase;
begin
  inherited;
  FCtrlListTerceirosRH.DataBaseName := DataBaseName;
  FCtrlCtFolha.DataBaseName := DataBaseName;
  FCtrlBancoPortFolha.DataBaseName := DataBaseName;
  FCtrlIntegraCAPCAR_RH.DataBaseName := DataBaseName;
  FCtrlCalcRub.DataBaseName := DataBaseName;
  FCtrlIntBanco.DataBaseName := DataBaseName;
end;

function TCtrlGeraFolPag.ListBanco(IdResponsavel: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  AGB.IDBANCO, BPF.CODPORTFORMA,' +CR_LF+
    '  F.NUMCONTASALARIO AS CONTACORRENTE, AGB.NUMAGENCIA, BAN.NUMBANCO' +CR_LF+
    'FROM' +CR_LF+
    '  FUNCIONARIO F, AGENCIABANCARIA AGB, BANCO BAN,' +CR_LF+
    '  (SELECT CODPORTFORMA, IDBANCO' +CR_LF+
    '   FROM   BANCOPORTFOLHA' +CR_LF+
    '   WHERE (IDEMPRESA = ' +IntToStr(FIdEmpresa)+ ')) BPF' +CR_LF+
    'WHERE' +CR_LF+
    '  (F.IDPESSOA      = ' +FloatToStr(IdResponsavel)+ ') AND' +CR_LF+
    '  (AGB.IDPESSOA(+) = F.IDAGENCIASALARIO) AND' +CR_LF+
    '  (AGB.IDBANCO     = BAN.IDPESSOA(+)) AND' +CR_LF+
    '  (AGB.IDBANCO     = BPF.IDBANCO(+))');
end;      

function TCtrlGeraFolPag.ListRubricaIndiv: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  IDEMPRESA, IDPESSOA, IDRUBRICA, NUMOCORRENCIAS, SEQRUBRICAINDIV,' +CR_LF+
    '  CODPORTFORMA, IDFAVORECIDO, IDREGRACALCULO, VALORRUBRICA,' +CR_LF+
    '  ANOMESINICIO, FLGPERMANENTE, PARCELAS, FLGPERCENT, FLGTPRUBMANUT' +CR_LF+
    'FROM' +CR_LF+
    '  RUBRICAINDIV' +CR_LF+
    'WHERE' +CR_LF+
    '  (FLGTPRUBMANUT  = ''2'') AND' +CR_LF+
    '  ((FLGPERMANENTE = 1) OR' +CR_LF+
    '   (PARCELAS      > NUMOCORRENCIAS)) AND' +CR_LF+
    '  (IDEMPRESA      = ' +IntToStr(FIdEmpresa)+ ')' +CR_LF+
    'ORDER BY' +CR_LF+
    '  IDPESSOA, IDEMPRESA, IDRUBRICA, SEQRUBRICAINDIV');
end;

function TCtrlGeraFolPag.ListHistoricoPessoaMes(IdMotivo: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  H.VALORPROVENTO, H.IDPESSOA, H.IDRUBRICA, H.SEQRUBRICA, PD.FLGDESCONTO' +CR_LF+
    'FROM' +CR_LF+
    '  ' +FNomeTabela+ ' H, PROVDESC PD' +CR_LF+
    'WHERE' +CR_LF+
    '  (H.IDPESSOA    = ' +FCdsFunc.FieldByName('IDPESSOA').asString+ ') AND' +CR_LF+
    '  (H.MES         = ' +QuotedStr(FMesRef)+ ') AND' +CR_LF+
    '  (H.IDMOTIVO    = ' +IntToStr(IdMotivo)+ ') AND' +CR_LF+
    '  (H.MESCOBRANCA = ' +QuotedStr(FMesPagto)+ ') AND' +CR_LF+
    '  (H.IDPESSJUR   = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
    '  (H.IDRUBRICA   = PD.IDPROVENTO)');
end;

function TCtrlGeraFolPag.ListRubXRub: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  IDRUBPRINC, IDRUBSECUND, FLGBASECALC,' +CR_LF+
    '  FLGTIPOFOLHA, INDPERIODO, FLGACAOINCIDE' +CR_LF+
    'FROM' +CR_LF+
    '  RUBXRUB' +CR_LF+
    'ORDER BY' +CR_LF+
    '  IDRUBPRINC, IDRUBSECUND');
end;

function TCtrlGeraFolPag.ListEndereco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  EP.LOGRADOURO, EP.NUMERO, EP.COMPLEMENTO,' +CR_LF+
    '  EP.BAIRRO, CI.NOME AS CIDADE, EP.CODESTADO,' +CR_LF+
    '  EP.CEP, DP.NUMDOCUMENTO' +CR_LF+
    'FROM' +CR_LF+
    '  ENDPESS EP, DOCPESSOA DP, CIDADES CI' +CR_LF+
    'WHERE' +CR_LF+
    '  (EP.IDPESSOA  = ' +IntToStr(FIdPessoa)+ ') AND' +CR_LF+
    '  (EP.IDPESSOA  = DP.IDPESSOA) AND' +CR_LF+
    '  (EP.IDCIDADES = CI.IDCIDADES(+))');
end;

function TCtrlGeraFolPag.ListDocPagEletronico: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  LPAD(''1'',18,''1'') AS CONTALIQUIDO,' +CR_LF+
    '  0 AS IDPESSOA,' +CR_LF+
    '  LPAD(''1'',30,''1'') AS NOME,' +CR_LF+
    '  LPAD(''1'',30,''1'') AS RAZAOSOCIAL,' +CR_LF+
    '  LPAD(''1'',18,''1'') AS NUMDOCUMENTO,' +CR_LF+
    '  LPAD(''1'',15,''1'') AS CONTACORRENTE,' +CR_LF+
    '  LPAD(''1'',10,''1'') AS CODBANCOFAVORECIDO,' +CR_LF+
    '  LPAD(''1'',15,''1'') AS NUMAGENCIA,' +CR_LF+
    '  LPAD(''1'',40,''1'') AS LOGRADOURO,' +CR_LF+
    '  LPAD(''1'',08,''1'') AS NUMERO,' +CR_LF+
    '  LPAD(''1'',20,''1'') AS COMPLEMENTO,' +CR_LF+
    '  LPAD(''1'',20,''1'') AS BAIRRO,' +CR_LF+
    '  LPAD(''1'',20,''1'') AS CIDADE,' +CR_LF+
    '  ''123'' AS CODESTADO,' +CR_LF+
    '  LPAD(''1'',08,''1'') AS CEP,' +CR_LF+
    '  0 AS IDFORCLI,' +CR_LF+
    '  0 AS CODDOCUMENTO,' +CR_LF+
    '  LPAD(''1'', 13, ''1'') AS LIVRE,' +CR_LF+
    '  0.00 AS VALOR,' +CR_LF+
    '  0.00 AS VALORDESCONTO,' +CR_LF+
    '  0.00 AS VALORJUROS,' +CR_LF+
    '  LPAD(''1'',10,''1'') AS DATAVENCTO,' +CR_LF+
    '  LPAD(''1'',10,''1'') AS DATAPROGRAMADA,' +CR_LF+
    '  0 AS TIPOMOEDA,' +CR_LF+
    '  0 AS NUMLOTE,' +CR_LF+
    '  0 AS CODPORTFORMA,' +CR_LF+
    '  0 AS CODFORMAPAGTO,' +CR_LF+
    '  0 AS CODTIPOPAGTO,' +CR_LF+
    '  ''0'' AS FLGEMITEAVISO,' +CR_LF+
    '  0 AS CODARQUIVOREMESSA,' +CR_LF+
    '  0 AS CODPORTADOR,' +CR_LF+
    '  0 AS IDBANCO,' +CR_LF+
    '  LPAD(''1'',13,''1'') AS NOCONTACORR,' +CR_LF+
    '  LPAD(''1'',10,''1'') AS CODBARRA,' +CR_LF+
    '  LPAD(''1'',10,''1'') AS CODBARRAVALOR,' +CR_LF+
    '  0 AS NODOCUMENTO,' +CR_LF+
    '  ''123'' AS COMPLDOCUMENTO,' +CR_LF+
    '  ''1'' AS TIPO,' +CR_LF+
    '  LPAD(''1'',20,''2'') AS NUMEMPRESABANCO,' +CR_LF+
    '  ''1'' AS DEBCRE,' +CR_LF+
    '  ''1'' AS TIPOCONTA' +CR_LF+
    'FROM' +CR_LF+
    '  DUAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (1 = 2)');
end;

function TCtrlGeraFolPag.ListDescFolha(OutraEmpresa: integer; ValorTaxa: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  TD.MESREFERENCIA, TD.IDTITULAR AS IDPESSOA, TD.FLGTIPODESC, TD.VALOR,' +CR_LF+
    '  TD.IDEMPRESA, TD.IDPROVENTO, TD.IDPLANOPREV, TD.ORDEM, TD.CODPROVDESC,' +CR_LF+
    '  TD.REFERENCIA, TD.IDFUNDACAO, TD.IDLOTE, PD.FLGSALFAMILIA, PD.FLGFERIAS,' +CR_LF+
    '  PD.FLGDECIMOTERCEIRO, PD.NUMPRIORIDADE, PD.FLGRESCISAO, PD.IDREGRA,' +CR_LF+
    '  TD.VALORRECEBIDO, TD.MESCOBRANCA, TD.VALORBASE1, TD.NUMPARCELAS, TD.PARCELA' +CR_LF+
    'FROM' +CR_LF+
    '  TMPDESC TD, PROVDESC PD' +CR_LF+
    'WHERE' +CR_LF+
    '  (TD.IDTITULAR    = ' +IntToStr(FIdPessoa)+ ') AND' +CR_LF+
    IFF(OutraEmpresa = 0,'  (TD.IDPESSJUR    = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF,'')+
    '  (TD.MESCOBRANCA  = ' +QuotedStr(FMesRef)+ ') AND' +CR_LF+
    '  (TD.FLGDESCFOLHA = ''P'') AND' +CR_LF+
    '  (NVL(TD.VALORRECEBIDO,0) = 0) AND' +CR_LF+
    // Para Taxa deve-se pegar o que vem do AdmPrev (FLGTIPODESC = P)
    // Para Valor deve-se pegar o que vem de todos os programas EXCETO o AdmPrev 
    '  (TD.FLGTIPODESC ' +IFF(ValorTaxa='T',' =','<>')+ ' ''P'') AND' +CR_LF+
    '  (TD.FLGDESCONTO  = 1) AND' +CR_LF+
    '  (TD.FLGTIPODESC IN (''P'',''A'',''E'',''C'')) AND' +CR_LF+
    '  (PD.IDPROVENTO   = TD.IDPROVENTO)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  NUMPRIORIDADE, MESREFERENCIA, CODPROVDESC, REFERENCIA');
end;

procedure TCtrlGeraFolPag.SelDadosIntegracaoEmpresa;
begin
  if (FIntegra_CAP) then
    FIdPlano := FCtrlListTerceirosRH.GetPlano(FIdEmpresa); // ID do Plano de Contas
end;

procedure TCtrlGeraFolPag.SelDadosIntegracaoPessoa;
var
  _CdsAux: TCMClientDataSet;
begin
  if (FIntegra_CAP) or (FIntegra_PagEletronico) then
  begin
    _CdsAux := TCMClientDataSet.Create(nil);

    if (FIntegra_PagEletronico) then
    begin
      _CdsAux.Close;
      _CdsAux.Data := ListBanco(FIdPessoa);
      if not(_CdsAux.IsEmpty) then
      begin
        FUltContaCorrente := _CdsAux.FieldByName('CONTACORRENTE').asString;
        FUltNumAgencia := _CdsAux.FieldByName('NUMAGENCIA').asString;
        FUltIdBanco := _CdsAux.FieldByName('NUMBANCO').asString;

        if (FCodPortForma > 0) then
          FUltPortForma := FCodPortForma
        else
        if (_CdsAux.FieldByName('CODPORTFORMA').asInteger = 0) then
          FUltPortForma := FPortadorFormaPadrao
        else
          FUltPortForma := _CdsAux.FieldByName('CODPORTFORMA').asInteger;
      end
      else
      begin
        FUltContaCorrente := '';
        FUltNumAgencia := '';
        FUltIdBanco := '';

        if (FCodPortForma > 0) then
          FUltPortForma := FCodPortForma
        else
          FUltPortForma := FPortadorFormaPadrao;
      end;
    end
    else
      FUltPortForma := FCodPortForma;

    if (FLstPortForma.IndexOf(IntToStr(FUltPortForma)) = -1) then
      FLstPortForma.Add(IntToStr(FUltPortForma));

    _CdsAux.Free;
  end;
end;

procedure TCtrlGeraFolPag.EnviarMensagem(const Processo, TempoDecorrido: WideString;
  QtdeFunc: Integer; const PessoaAtual: WideString; NumRegistros, Incremento: Integer;
  const Msg: WideString);
begin
  try
    if (FGeracaoFolhaNormal) then
      FIAppCliente.ProcessarGeracaoFolPagNormal_CB(Processo, TempoDecorrido, QtdeFunc,
        PessoaAtual, NumRegistros, Incremento, Msg)
    else
      FIAppCliente.ProcessarRescisaoContrato_CB(Processo, TempoDecorrido, QtdeFunc,
        PessoaAtual, NumRegistros, Incremento);
  except
  end;
end;

function TCtrlGeraFolPag.AbrirSQLFunc: boolean;
begin
  Result := false;
end;

function TCtrlGeraFolPag.GetTempoDecorrido: string;
begin
  Result := FormatDateTime('hh:mm:ss', Time - FHoraInicial);
end;

function TCtrlGeraFolPag.GetProxNumSeq_Historico(IdRubrica: double): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  MAX(SEQRUBRICA) AS SEQ' +CR_LF+
    'FROM' +CR_LF+
    '  '+ FNomeTabela +CR_LF+
    'WHERE' +CR_LF+
    '  (IDPESSOA  = ' +IntToStr(FIdPessoa)+ ') AND' +CR_LF+
    '  (MES       = ' +QuotedStr(FMesRef)+ ') AND' +CR_LF+
    '  (IDRUBRICA = ' +FloatToStr(IdRubrica)+ ')');

  Result := _CdsAux.FieldByName('SEQ').asInteger + 1;
  _CdsAux.Free;
end;

function TCtrlGeraFolPag.Init_Integracao: boolean;
begin
  Result := true;
  if (FIntegra_CAP) or (FIntegra_PagEletronico) then
  begin
    EnviarMensagem(CMTranslate('Selecionando dados necessários à integração...'));
    try
      // Banco Padrão
      FPortadorFormaPadrao := FCtrlBancoPortFolha.GetCodPortFormaPadrao;

      if (FIntegra_CAP) then
        if not(FCtrlIntegraCAPCAR_RH.AbrirQueryDocumentos) then
          raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);

      if (FIntegra_PagEletronico) then
      begin
        FCdsPortadorForma.Close;
        FCdsPortadorForma.Data := FCtrlBancoPortFolha.ListPortadorXConta;
        FCdsDocTxt.Close;
        FCdsDocTxt.Data := ListDocPagEletronico;
        if (FCdsDocTxt.IndexDefs.Count = 0) then
          FCdsDocTxt.AddIndex('Index1', 'IDBANCO;NUMAGENCIA;NOME', []);
        FCdsDocTxt.IndexName := 'Index1';
      end;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlGeraFolPag.GerarCAP: boolean;
begin
  try
    // Guardar o valor da Rubrica
    if not(FCtrlIntegraCAPCAR_RH.SetDadosDocumento(
           IFF(FCriarDocIndividual,
             FCdsFunc.FieldByName('IDPESSOA').asInteger, FIdFavorecido),
           IFF(FCodPortForma>0, FCodPortForma, FPortadorFormaPadrao), 'P',
           FCodTipRecDes,
           IFF(FCdsCAP.FieldByName('UNIDNEGOC').asInteger<>0,
             FCdsCAP.FieldByName('UNIDNEGOC').asInteger, UNIDNEGOC_PADRAO),
           IFF(FRateioCC, FCdsFunc.FieldByName('CODCENTROCUSTO').asString, ''),
           FCdsCAP.FieldByName('CODCENTRORESPON').asString,
           FValorRubrica)) then
    begin
      raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);
    end;

    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := CMTranslate('* Criação do Documento CAP.') + MSG_ERRO + E.Message;
      Result := false;
    end;
  end;
end;

procedure TCtrlGeraFolPag.SetDadosPagEletronico;
var
  _CdsAux: TCMClientDataSet;
  sLogradouro, sNumero, sComplemento, sBairro,
  sCidade, sCodEstado, sCep, sNumDocumento: string;
begin
  if (FUltValorLiquido = 0) or (FUltContaCorrente = '') then
    exit;

  FCdsPortadorForma.Locate('CODPORTFORMA', FUltPortForma, []);

  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsAux.Data := ListEndereco;

  if (_CdsAux.IsEmpty) then
  begin
    sLogradouro := '';
    sNumero := '';
    sComplemento := '';
    sBairro := '';
    sCidade := '';
    sCodEstado := '';
    sCEP := '';
    sNumDocumento := '';
  end
  else
  begin
    sLogradouro := _CdsAux.FieldByName('LOGRADOURO').asString;
    sNumero := _CdsAux.FieldByName('NUMERO').asString;
    sComplemento := _CdsAux.FieldByName('COMPLEMENTO').asString;
    sBairro := _CdsAux.FieldByName('BAIRRO').asString;
    sCidade := _CdsAux.FieldByName('CIDADE').asString;
    sCodEstado := _CdsAux.FieldByName('CODESTADO').asString;
    sCEP := _CdsAux.FieldByName('CEP').asString;
    sNumDocumento := _CdsAux.FieldByName('NUMDOCUMENTO').asString;
  end;

  with (FCdsDocTxt) do
  begin
    Insert;
    FieldByName('CONTALIQUIDO').asString := '';
    FieldByName('IDPESSOA').asFloat := FCdsFunc.FieldByName('IDPESSOA').asFloat;
    FieldByName('NOME').asString := FCdsFunc.FieldByName('NOME').asString;
    FieldByName('RAZAOSOCIAL').asString := FCdsFunc.FieldByName('NOME').asString;
    FieldByName('NUMDOCUMENTO').asString := sNumDocumento;
    FieldByName('CONTACORRENTE').asString := FUltContaCorrente;
    FieldByName('CODBANCOFAVORECIDO').asString := FUltIdBanco;
    FieldByName('NUMAGENCIA').asString := FUltNumAgencia;
    FieldByName('LOGRADOURO').asString := sLogradouro;
    FieldByName('NUMERO').asString := sNumero;
    FieldByName('COMPLEMENTO').asString := sComplemento;
    FieldByName('BAIRRO').asString := sBairro;
    FieldByName('CIDADE').asString := sCidade;
    FieldByName('CODESTADO').asString := sCodEstado;
    FieldByName('CEP').asString := sCEP;
    FieldByName('IDFORCLI').asInteger := FIdPessoa;
    FieldByName('TIPOCONTA').asString := '1';
    // Identificador para retorno do arquivo.
    // Data e Hora atual no seguinte formato: MSec + Sec + Min + Hor + Ano + Mes + Dia
    FieldByName('CODDOCUMENTO').asString := FormatDateTime('ZZZSSNNHHYYYYMMDD', Now);
    FieldByName('LIVRE').asString := Trim(FCdsFunc.FieldByName('MATRICULA').asString);
    FieldByName('VALOR').asFloat := FUltValorLiquido;
    FieldByName('VALORDESCONTO').asFloat := 0;
    FieldByName('VALORJUROS').asFloat := 0;
    FieldByName('DATAVENCTO').asString := '';
    FieldByName('DATAPROGRAMADA').asDateTime := FDataPagamento;
    FieldByName('TIPOMOEDA').asInteger := 0;
    FieldByName('NUMLOTE').asInteger := 0;
    FieldByName('CODPORTFORMA').asInteger := FUltPortForma;
    FieldByName('CODPORTADOR').asFloat := FCdsPortadorForma.FieldByName('CODPORTADOR').asFloat;
    FieldByName('CODFORMAPAGTO').asFloat := FCdsPortadorForma.FieldByName('CODFORMAPAGTO').asFloat;
    FieldByName('CODTIPOPAGTO').asFloat := FCdsPortadorForma.FieldByName('CODTIPOPAGTO').asFloat;
    FieldByName('FLGEMITEAVISO').asString := FCdsPortadorForma.FieldByName('FLGEMITEAVISO').asString;
    FieldByName('CODARQUIVOREMESSA').asInteger := FCdsPortadorForma.FieldByName('CODARQUIVOREMESSA').asInteger;
    FieldByName('IDBANCO').asFloat := FCdsPortadorForma.FieldByName('IDBANCO').asFloat;           //Portador Forma
    FieldByName('NOCONTACORR').asString := FCdsPortadorForma.FieldByName('NOCONTACORR').asString;
    FieldByName('CODBARRA').asString := '';
    FieldByName('CODBARRAVALOR').asString := '';
    FieldByName('NODOCUMENTO').asFloat := StrToFloat(IntToStr(FIdPessoa) + Copy(FMesPagto,1,4)); // Codigo que aparece no relatorio
    FieldByName('COMPLDOCUMENTO').asString := Copy(FMesPagto,6,2); // Codigo que aparece no relatorio
    FieldByName('TIPO').asString := 'F';
    FieldByName('NUMEMPRESABANCO').asString := FCdsPortadorForma.FieldByName('NUMEMPRESABANCO').asString;
    FieldByName('DEBCRE').asString := '';
    Post;
  end;
  _CdsAux.Free;
end;

procedure TCtrlGeraFolPag.SetUltValorLiquido(const CodRubCLT: string; const Valor: double);
begin
  if (CodRubCLT = '40599') or (CodRubCLT = '40999') then
    FUltValorLiquido := Valor;
end;

function TCtrlGeraFolPag.GerarLinhaCAP(const IdRubrica: double; const Valor: double): boolean;
begin
  try
    FCdsCAP.Data := FCtrlCtFolha.ListParametroCAP(FIdEmpresa, IdRubrica);
    if not(FCdsCAP.IsEmpty) then
    begin
      FCodTipRecDes := FCdsCAP.FieldByName('CODTIPRECDES').asString;
      FIdFavorecido := FCdsCAP.FieldByName('IDFAVORECIDO').asInteger;
      FValorRubrica := Valor;

      if (VerificaCodigoEm(FListaTipoDesemb, FCodTipRecDes, ',') = 1) then
        GerarCAP;
    end;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlGeraFolPag.GerarPagEletronico: boolean;
var
  FCdsPessoasAux: TCMClientDataSet;
  FDiasUteis: TDiasUteis;

{-->}procedure InserirCdsPessoas;
     var
       c: byte;
     begin
       FCdsDocTxt.First;
       FCdsPessoasAux.EmptyDataSet;
       while not(FCdsDocTxt.EOF) do
       begin
         FCdsPessoasAux.Insert;
         for c:=0 to FCdsDocTxt.FieldCount-1 do
           FCdsPessoasAux.Fields[c].Value := FCdsDocTxt.Fields[c].Value;
         FCdsPessoasAux.Post;
         FCdsDocTxt.Next;
       end;
       FCdsPessoasAux.First;
{-->}end;
begin
  Result := true;
  if not(FCdsDocTxt.IsEmpty) then
  begin
    try
      FCdsPessoasAux := TCMClientDataSet.Create(nil);
      FDiasUteis := TDiasUteis.Create;
      FDiasUteis.InitializeAs(Self);
      FDiasUteis.DataBaseName := DataBaseName;
      try
        EnviarMensagem(CMTranslate('Gravando dados do Pagamento Eletrônico...'));

        FCdsPessoasAux.Data := FCdsDocTxt.Data;
        FCdsDocTxt.Filter := '';
        FCdsDocTxt.Filtered := true;

        FCdsCAP.Data := FCtrlBancoPortFolha.ListPortadorXContaXFolha;
        while not(FCdsCAP.EOF) do
        begin
          FUltPortForma := FCdsCAP.FieldByName('CODPORTFORMA').asInteger;
          if (FLstPortForma.IndexOf(IntToStr(FUltPortForma)) <> -1) then
          begin
            FCdsDocTxt.Filter := 'CODPORTFORMA = ' + IntToStr(FUltPortForma);
            InserirCdsPessoas;
            FCtrlIntBanco.IndiceDoBanco := FCdsCAP.FieldByName('CODARQUIVOREMESSA').asInteger;

            if (FCtrlIntBanco.VerficaDadosEmpresa('P', FUltPortForma, FIdEmpresa)) then
            begin
              if (FCtrlIntBanco.ValidaRemessa('P', FCdsPessoasAux.Data, false)) then
              begin
                // Caso o modelo do arquivo for Folha de Pagamento Bradesco,
                // indicar a Data do Débito, que é sempre um dia antes da Data de Pagamento,
                // no mesmo campo que seria informada a Data de Pagamento.
                if (FCtrlIntBanco.IndiceDoBanco = 3) then
                  FCtrlIntBanco.DataPagamento := DateToStr(FDiasUteis.UltDiaUtilAnterior(
                    FCdsFunc.FieldByName('IDEMPRESA').asInteger, FDataPagamento,
                    true, true, false))
                else
                  FCtrlIntBanco.DataPagamento := DateToStr(FDataPagamento);

                FCtrlIntBanco.MontaPagamentoEletronico(
                  FCdsCAP.FieldByName('CODARQUIVOREMESSA').asInteger,
                  FCdsCAP.FieldByName('CONTROLEREMESSA').asInteger,
                  FCdsPessoasAux.Data, FDiretorioArqPag);
              end
              else
                raise Exception.Create(
                  CMTranslate('Erro na geração do arquivo de Pagamento Eletrônico.') +CR_LF+
                  CMTranslate(' * Código do Portador Forma = ') + IntToStr(FUltPortForma) +CR_LF+
                  CMTranslate('Erro: ') +CR_LF+ FCtrlIntBanco.MessageInfo);
            end;
          end;
          FCdsCAP.Next;
        end;

        if not(FCtrlExecQryRH.ExecutarListaSQL(FCtrlIntBanco.stlComandosSQL.Text)) then
          raise Exception.Create(FCtrlExecQryRH.MessageInfo);

        frmAguarde.Apaga;
      except
        on E: Exception do
        begin
          frmAguarde.Apaga;
          MessageInfo := CMTranslate('* Geração do Pagamento Eletrônico.') +CR_LF+
            CMTranslate('Erro:') +CR_LF+ E.Message;
          Result := false;
        end;
      end;
    finally
      FreeAndNil(FCdsPessoasAux);
      FreeAndNil(FDiasUteis);
    end;
  end
  else
    EnviarMensagem('','',0,'',0,0,
      CMTranslateMsg(MSG_AVISO_PAGTO_ELETR, [CR_LF, CR_LF, CR_LF]));
end;

function TCtrlGeraFolPag.GerarIntegracaoCAP: boolean;
begin
  Result := true;
  if not(FCdsDocumentos.IsEmpty) then
  begin
    try
      EnviarMensagem(CMTranslate('Gravando dados da Integração com o Contas a Pagar...'));
      FCtrlIntegraCAPCAR_RH.ConsTipoDesemb := FCriarDocIndividual;

      // Gravar no Banco os Documentos
      if not(FCtrlIntegraCAPCAR_RH.GravarDocumentos(
          FDataEmissao, FDataPagamento, FRateioCC, FUsaPlanoPatro, FPlanoPrevGlobal,
          FPatroGlobal, FContaPadrao_Favorecido, FIdPlano_ContaPadrao_Favorecido)) then
      begin
        FTipoRetorno := FCtrlIntegraCAPCAR_RH.TipoRetorno;
        raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);
      end
      else
        FNumDocGerados := FCtrlIntegraCAPCAR_RH.NumDocGerados;

      FCdsDocumentos.EmptyDataSet;
    except
      on E: Exception do
      begin
        frmAguarde.Apaga;
        MessageInfo := E.Message;
        Result := false;
      end;
    end;
  end
  else
    EnviarMensagem('','',0,'',0,0,
      CMTranslateMsg(MSG_AVISO_CAP, [CR_LF, CR_LF]));
end;

function TCtrlGeraFolPag.SetRubricaIndiv_JaProcessada(IdMotivo: integer; IdRubrica: double;
  SeqRubricaIndiv: integer): boolean;
begin
  try
    // Os campos IDLOTE e ANOMESREF são preenchidos para que a "Final" possa ser desfeita
    Result := ExecSQL(
      'UPDATE RUBRICAINDIV' +CR_LF+
      'SET    NUMOCORRENCIAS = NUMOCORRENCIAS + 1,' +CR_LF+
      '       IDLOTE         = ' +IntToStr(IdMotivo)+ ',' +CR_LF+
      '       ANOMESREF      = ' +QuotedStr(FMesRef) +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSOA        = ' +IntToStr(FIdPessoa)+ ') AND' +CR_LF+
      '  (IDRUBRICA       = ' +FloatToStr(IdRubrica)+ ') AND' +CR_LF+
      '  (IDEMPRESA       = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
      '  (SEQRUBRICAINDIV = ' +IntToStr(SeqRubricaIndiv)+ ') AND' +CR_LF+
      '  (FLGTPRUBMANUT   = ''2'')');    
  except
    Result := false;
    MessageInfo := CMTranslate('* Alteração do Número de Ocorrências da Rubrica Nº ') +
      FloatToStr(IdRubrica);
  end;
end;

procedure TCtrlGeraFolPag.SomarValorRubEspecial(ValProvento, ValBase: double;
  AchouBase: boolean);
begin
  FCdsRubEsp.Edit;
  if (FCdsRubXRub.FieldByName('FLGBASECALC').asInteger = 0) then
    FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat :=
      FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat + ValProvento *
      (1 - FCdsRubXRub.FieldByName('FLGACAOINCIDE').asInteger * 2)
  else  // opção informada
  if (AchouBase) then
    FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat :=
      FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat + ValBase *
      (1 - FCdsRubXRub.FieldByName('FLGACAOINCIDE').asInteger * 2);
  FCdsRubEsp.Post;
end;

procedure TCtrlGeraFolPag.CalcAnuenioREFER(Matricula: string; var Referencia: string);
var
  sNumLinha: string;
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(
    'SELECT NUMLINHA' +CR_LF+
    'FROM   VALTABGENER' +CR_LF+
    'WHERE  (CODTABELA = ''ADMAJUSTADA'') AND' +CR_LF+
    '       (CODCAMPO  = ''MATRICULA'') AND' +CR_LF+
    '       (VALOR     = ' +QuotedStr(Matricula)+ ')');

  if not(_CdsAux.IsEmpty) then
  begin
    sNumLinha := _CdsAux.FieldByName('NUMLINHA').asString;
    _CdsAux.Close;
    _CdsAux.Data := GetDataPacket(
      'SELECT VALOR' +CR_LF+
      'FROM   VALTABGENER' +CR_LF+
      'WHERE  (CODTABELA = ''ADMAJUSTADA'') AND' +CR_LF+
      '       (CODCAMPO  = ''DATREFER'') AND' +CR_LF+
      '       (NUMLINHA  = ' +sNumLinha+ ')');

    Referencia := IntToStr(Round(Int((FNormalFim -
      StrToDate(_CdsAux.FieldByName('VALOR').asString)) / 365.25)));
  end;
  _CdsAux.Free;
end;

procedure TCtrlGeraFolPag.SomarTotalGeral(FlgDesconto: integer; Valor: double);
begin
  case (FlgDesconto) of
    0 : FTotalGeral_Prov := FTotalGeral_Prov + Valor;
    1 : FTotalGeral_Desc := FTotalGeral_Desc + Valor;
  end;
end;

function TCtrlGeraFolPag.CriarObjetos_Geracao: boolean;
begin
  try
    FCdsFunc := TCMClientDataSet.Create(nil);
    FCdsRubEsp := TCMClientDataSet.Create(nil);
    FCdsRubIndiv := TCMClientDataSet.Create(nil);
    FCdsRubXRub := TCMClientDataSet.Create(nil);
    FCdsDescFolha := TCMClientDataSet.Create(nil);

    if (FIntegra_CAP) or (FIntegra_PagEletronico) then
    begin
      FLstPortForma := TStringList.Create;
      FCdsCAP := TCMClientDataSet.Create(nil);

      if (FIntegra_CAP) then
        FCdsDocumentos := TCMClientDataSet.Create(nil);

      if (FIntegra_PagEletronico) then
      begin
        FCdsPortadorForma := TCMClientDataSet.Create(nil);
        FCdsDocTxt := TCMClientDataSet.Create(nil);
      end;
    end;

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := CMTranslateMsg(MSG_ALOCA_MEM, [CR_LF]) +MSG_ERRO+ E.Message;
    end;
  end;
end;

procedure TCtrlGeraFolPag.DestruirObjetos_Geracao;
begin
  try
    FCdsFunc.Close;
    FCdsRubEsp.Close;
    FCdsRubIndiv.Close;
    FCdsRubXRub.Close;
    FCdsDescFolha.Close;

    FreeAndNil(FCdsFunc);
    FreeAndNil(FCdsRubEsp);
    FreeAndNil(FCdsRubIndiv);
    FreeAndNil(FCdsRubXRub);
    FreeAndNil(FCdsDescFolha);

    if (FIntegra_CAP) or (FIntegra_PagEletronico) then
    begin
      FreeAndNil(FLstPortForma);
      FreeAndNil(FCdsCAP);

      if (FIntegra_CAP) then
        FreeAndNil(FCdsDocumentos);

      if (FIntegra_PagEletronico) then
      begin
        FreeAndNil(FCdsPortadorForma);
        FreeAndNil(FCdsDocTxt);
      end;
    end;
  except
    on E: Exception do
      MessageInfo := CMTranslateMsg(MSG_LIBERA_MEM, [CR_LF]) +MSG_ERRO+ E.Message;
  end;
end;

function TCtrlGeraFolPag.ApagarPrevia: boolean;
begin
  EnviarMensagem(CMTranslate('Apagando Prévia...'));
  Result := false;
end;

function TCtrlGeraFolPag.ProcDescFolha(IdMotivo: integer; IdRubrica: double;
  ValorTaxa: string; var TotDesc, ValBase: double): boolean;
var
  sReferencia: string;
  dValorDesc: double;

{->}function EfetivarDescFolha: boolean;
    begin
      try
        // Escrever na tabela TMPDESC o valor do desconto
        // O campo IDSEQINTERNOFB é preenchido para que a "Final" possa ser desfeita
        ExecSQL(
          'UPDATE' +CR_LF+
          '  TMPDESC' +CR_LF+
          'SET' +CR_LF+
          '  VALORRECEBIDO   = ' +OraNumero(FloatToStr(dValorDesc))+ ',' +CR_LF+
          '  VALOR           = ' +OraNumero(FloatToStr(dValorDesc))+ ',' +CR_LF+
          '  SITENVIO        = ''2'',' +CR_LF+
          '  DATARECEBIMENTO = TO_DATE(' +QuotedStr(DateToStr(FDataProcessamento))+ ',''DD/MM/YYYY''),' +CR_LF+
          '  IDSEQINTERNOFB  = ' +IntToStr(IdMotivo)+CR_LF+
          'WHERE' +CR_LF+
          '  (IDLOTE = ' +IntToStr(FCdsDescFolha.FieldByName('IDLOTE').asInteger)+ ') AND' +CR_LF+
          '  (ORDEM  = ' +FloatToStr(FCdsDescFolha.FieldByName('ORDEM').asFloat)+ ')');
        Result := true;
      except
        on E: Exception do
        begin
          MessageInfo := E.Message;
          Result := false;
        end;
      end;
{->}end;
begin
  Result := false;
  try
    FCdsDescFolha.Filtered := false;
    if (IdRubrica > 0) then
    begin
      FCdsDescFolha.Filter := 'IDPROVENTO = ' + FloatToStr(IdRubrica);
      FCdsDescFolha.Filtered := true;
    end;

    FCdsDescFolha.First;
    if not(FCdsDescFolha.IsEmpty) then
    begin
      while not(FCdsDescFolha.EOF) do
      begin
        IdRubrica := FCdsDescFolha.FieldByName('IDPROVENTO').asFloat;

        if (FCdsDescFolha.FieldByName('NUMPARCELAS').asInteger > 1) then
          sReferencia := '  ' + FCdsDescFolha.FieldByName('PARCELA').asString +'/'+
            FCdsDescFolha.FieldByName('NUMPARCELAS').asString
        else
          sReferencia := FCdsDescFolha.FieldByName('REFERENCIA').asString;

        if (ValorTaxa = 'T') then // Se for taxa...
        begin
          dValorDesc := FCdsDescFolha.FieldByName('VALORBASE1').asFloat;
          ValBase := dValorDesc; // Atribuir ao Valor Base o Valor Informado pela Rubrica
        end
        else
          dValorDesc := FCdsDescFolha.FieldByName('VALOR').asFloat;

        if (FCdsDescFolha.FieldByName('IDREGRA').asString <> '') then
        begin
          FCtrlCalcRub.CalcBeneficio(IdMotivo, FCdsDescFolha.FieldByName('IDREGRA').asString,
            IntToStr(FIdPessoa), dValorDesc, TotDesc, 1, 0, 0, FTotalGeral_Prov,
            FTotalGeral_Desc);

          TotDesc := dValorDesc;
        end;

        if (dValorDesc <> 0) then
        begin
          // Gravar a Rubrica na TMPDESC caso o processo seja Final
          if (FProcesso = FINAL) then
          begin
            Result := EfetivarDescFolha;
            if not(Result) then
              raise Exception.Create(MessageInfo);
          end;

          // Gravar a Rubrica no Histórico
          Result := GravarRubrica(
            IdRubrica, FCdsDescFolha.FieldByName('CODPROVDESC').asString, IdMotivo,
            FMesRef, FMesPagto, IFF(sReferencia='', '***', sReferencia),
            FCdsDescFolha.FieldByName('IDREGRA').asFloat, 0, 0, 0, 0, dValorDesc);
          if not(Result) then
            raise Exception.Create(MessageInfo);
        end;
        FCdsDescFolha.Next;
      end;
      Result := true;
    end;
  except
    on E: Exception do
      MessageInfo := E.Message;
  end;
end;

function TCtrlGeraFolPag.GravarRubrica(IdRubrica: double; CodProvDesc: string;
  IdMotivo: integer; Mes, MesCobranca, Referencia: string; IdRegraCalculo: double;
  FlgCompoeSalPart, FlgCompoeSalBenef, FlgIRRF, SeqOriginal: integer; ValorProvento: double): boolean;
var
  iSeqRubrica: integer;
  sIdInforme, sCodIrrfDarf: string;
begin
  try
    iSeqRubrica := GetProxNumSeq_Historico(IdRubrica);

    if (FProcesso = FINAL) then
    begin
      _Cds.Data := GetDataPacket(
        'SELECT' +CR_LF+
        '  IDINFORME, CODIRRFDARF' +CR_LF+
        'FROM' +CR_LF+
        '  PROVDESC'+CR_LF+
        'WHERE' +CR_LF+
        '  (IDPROVENTO = ' +FloatToStr(IdRubrica)+ ')');

      sIdInforme := _Cds.FieldByName('IDINFORME').asString;
      sCodIrrfDarf := _Cds.FieldByName('CODIRRFDARF').asString;
    end
    else
    begin
      sIdInforme := '';
      sCodIrrfDarf := '';
    end;

    ExecSQL(
      'INSERT INTO ' +FNomeTabela+ CR_LF+
      '  (SEQRUBRICA, IDPESSOA, IDPESSJUR, IDPATRO, IDRUBRICA, CODPROVDESC, IDMOTIVO,' +CR_LF+
      '   MES, MESCOBRANCA, REFERENCIA, IDREGRACALCULO, FLGCOMPOESALPART,' +CR_LF+
      '   FLGCOMPOESALBENEF, FLGIRRF, DATAPAGAMENTO, VALORPROVENTO' +
      ', '+CAMPO_SEQ_ORIGINAL+
      IFF(FProcesso=PREVIA, ')', ', IDMODULO'+IFF(sIdInforme='','',', IDINFORME')+
          IFF(sCodIrrfDarf='','',', CODIRRFDARF')+')') +CR_LF+
      'VALUES' +CR_LF+
      '  (' +
      IntToStr(iSeqRubrica) +', '+
      IntToStr(FIdPessoa) +', '+
      FloatToStr(FIdEmpresa) +', '+
      IFF(FTipoEmpresa='P', FloatToStr(FIdEmpresa), 'NULL') +', '+
      FloatToStr(IdRubrica) +', '+
      QuotedStr(CodProvDesc) +', '+
      IntToStr(IdMotivo) +', '+
      QuotedStr(Mes) +', '+
      QuotedStr(MesCobranca) +', '+
      QuotedStr(Referencia) +', '+
      IFF(IdRegraCalculo=0, 'NULL', FloatToStr(IdRegraCalculo)) +', '+
      IntToStr(FlgCompoeSalPart) +', '+
      IntToStr(FlgCompoeSalBenef) +', '+
      IntToStr(FlgIRRF) +', '+
      'TO_DATE('+QuotedStr(DateToStr(FDataProcessamento)) +',''DD/MM/YYYY''), '+
      OraNumero(FloatToStr(ValorProvento)) +
      IFF(SeqOriginal=0, ', NULL', ', '+IntToStr(SeqOriginal)) +      
      IFF(FProcesso=PREVIA, ')', ', 21'+IFF(sIdInforme='','', ', '+sIdInforme)+
          IFF(sCodIrrfDarf='','',', '+QuotedStr(sCodIrrfDarf))+')'));

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := CMTranslate('* Ao gravar Histórico de Rubricas Salariais.') +
        MSG_ERRO+ E.Message;
    end;
  end;
end;

function TCtrlGeraFolPag.PrepararRubEspeciais: boolean;
begin
  EnviarMensagem(CMTranslate('Preparando Rubricas Especiais...'));
  Result := false;
end;

function TCtrlGeraFolPag.ExisteRegistro_TmpDesc(ListaEmpregado: string): boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  FSQL :=
    'SELECT' +CR_LF+
    '  COUNT(*) AS CONTA' +CR_LF+
    'FROM' +CR_LF+
    '  TMPDESC TD';

  if (ListaEmpregado = '') then
    FSQL := FSQL + ', (SELECT IDPESSOA FROM FUNCIONARIO) FUNC';

  FSQL := FSQL +CR_LF+
    'WHERE' +CR_LF+
    '  (TD.MESCOBRANCA          = ' +QuotedStr(FMesRef)+ ') AND' +CR_LF+
    '  (NVL(TD.VALORRECEBIDO,0) = 0) AND' +CR_LF;

  if (ListaEmpregado = '') then
    FSQL := FSQL + '  (TD.IDPESSOA             = FUNC.IDPESSOA)'
  else
  begin
    if (Pos(',',ListaEmpregado) > 0) then
      // FSQL := FSQL + '  (TD.IDPESSOA            IN (' +ListaEmpregado+ '))'
      FSQL := FSQL + QuebrarListaFiltro(2, '(TD.IDPESSOA  ', ListaEmpregado, 50) // ECF 20/07/05
    else
      FSQL := FSQL + '  (TD.IDPESSOA             = ' +ListaEmpregado+ ')';
  end;

  _CdsAux.Data := GetDataPacket(FSQL);
  Result := (_CdsAux.FieldByName('CONTA').asInteger > 0);
  _CdsAux.Free;
end;

end.
