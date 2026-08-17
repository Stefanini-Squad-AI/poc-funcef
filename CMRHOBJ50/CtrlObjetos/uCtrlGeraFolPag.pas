// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{-------------------------------------------------------------------------------
Autor(a)   : André Imakawa
Data       : 22/01/2021
Nº SIG     : 112823
Descricao  : Exclusão da rubrica deve considerar o motivo.
-------------------------------------------------------------------------------
Autor(a)   : Darivaldo Alencar
Data       : 22/10/2019
Nº SIG     : 93310
Descricao  : Regra 2621 alterada
-------------------------------------------------------------------------------
Nº SIG............: 90993
Alteração.........: 30/09/2019
Responsável.......: Taffarel Sevaybriker
Descrição.........: Erro ao atualizar NUMOCORRENCIAS da RUBRICAINDIV.
                    Alterado para gravar a HISTRUBSAL com SEQRUBRICA original.
--------------------------------------------------------------------------------
Nº SIG............: 78282
Alteração.........: 13/11/2018
Responsável.......: Everson Cunha
Descrição.........: Adicionar ORDER BY na query para que venha primeiro os
                    FLGCOBRA = 1
--------------------------------------------------------------------------------
Nº SIG............: 73541
Alteração.........: 31/08/2018
Responsável.......: Darivaldo Alencar
Descrição.........: Validação de data antes de inserir contribuição
--------------------------------------------------------------------------------
Nº SIG............: 19778
Data da Alteração.: 26/05/2016
Alteração.........:
Responsável.......: André Imakawa
Descrição.........: Solicitamos acertar a rotina do cálculo da folha de pagamento
                    referente a rubrica PENSAO ALIMENTICIA ADIANTAMENTO 13 SAL
--------------------------------------------------------------------------------
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 25/11/2014
Alteração  : ListDescFolha (inclusão da View VW_RUBXEVENTO)
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba
            "Incidência de Eventos" do cadastro de rubricas salariais
--------------------------------------------------------------------------------
Nº SOL......: 228632
Nº KINTANA..: 2062829
Data........: 15/04/14
Responsável.: Thiago Melo
Descrição...: Solicitação referente a inclusão do idfavorecido.
--------------------------------------------------------------------------------
Nº SOL......: 232001
Nº PPM .....: 383102
Data........: 15/05/2014
Responsável.: Fernando Xavier
Descrição...: Está ocorrendo erro na geração da rubrica
              EMPRESTIMO CONSIGNADO CAIXA.
--------------------------------------------------------------------------------
Nº SOL......: 225868
Nº KINTANA..: 2059484
Data........: 12/02/2014
Responsável.: William Moreira da Silva
Descrição...: A rotina de deleção não apaga a rubrica que foi gravada errada
              na geração anterior.
--------------------------------------------------------------------------------
Rotina......: ListDescFolha
Nº SOL......: 150520
Nº KINTANA..: 1093864
Data........: 22/12/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para filtrar as rubricas selecionadas
--------------------------------------------------------------------------------
Rotina......: ListDescFolha
Nº SOL......: 147224
Nº KINTANA..: 1013674
Data........: 11/11/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para verificar o numero e a quantidade de parcelas
              para Excluir as Rubricas de Execesso de Debito
--------------------------------------------------------------------------------
Autor(a)    : Arnaldo V. Scarin
Data        : 22/03/2010
Pendência   : SOL 144095 KINTANA
Descricao   : Correção da Rotina de gravação de debito
--------------------------------------------------------------------------------
Autor(a)    : Arnaldo V. Scarin
Data        : 22/03/2010
Pendência   : SOL 132360 KINTANA 761920
Descricao   : Correção da rotina de gravação de rubricas
--------------------------------------------------------------------------------
Autor(a)    : Arnaldo V. Scarin
Data        : 22/01/2010
Pendência   : SOL 123730 KINTANA 620969
Descricao   : Inclusão da Gravação do NumDocumento (CPF) na Tabela HstRubSal
--------------------------------------------------------------------------------}

unit uCtrlGeraFolPag;

interface

uses SysUtils, Controls, Classes, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
  uCtrlIntBanco, {uCtrlFuncoesRH, }uFuncoesUteisRH, uCtrlCustomRH, uCtrlIntegraRH,
  uCtrlCtFolha, uCtrlBancoPortFolha, uCtrlListTerceirosRH, uCtrlCalcRub, USistema
  ,uCtrlProvDesc    //Darivaldo Alencar SIG73541
  ;

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

  // Mensagens de PROCESSAMENTO
  MSG_SEL_DADOS_INTEGRA = 'Selecionando dados necessários à integração...';
  MSG_GRAVANDO_CAP = 'Gravando dados da Integração com o Contas a Pagar...';
  MSG_GRAVANDO_PAG_ELETRONICO = 'Gravando dados do Pagamento Eletrônico...';
  MSG_APAGANDO_PREVIA = 'Apagando Prévia...';
  MSG_PREPARO_RUB_ESPECIAIS = 'Preparando Rubricas Especiais...';
  // Mensagens de AVISO
  MSG_NAO_GRAVA_PAG_ELETRONICO = '[AVISO] O Arquivo de Pagamento Eletrônico não foi criado.' +
    CR_LF+ 'Verifique se possui acesso à pasta indicada para gravação' +CR_LF+
    'ou alguma informação requerida está faltando.' +CR_LF+
    'Ex: Associação da Rubrica CLT' + CR_LF;
  MSG_NAO_GRAVA_CAP = '[AVISO] A integração com o Contas a Pagar não foi efetuada.' +CR_LF+
    'Verifique se alguma informação requerida está faltando.' +CR_LF+
    'Ex: Favorecido não indicado na Parametrização das Rubricas.' + CR_LF;
  // Mensagens de ERRO
  MSG_ERRO_CRIACAO_CAP = '* Criação do Documento CAP.' + MSG_ERRO;
  MSG_ERRO_GERACAO_PAG_ELETRONICO = '* Geração do Pagamento Eletrônico.';
  MSG_ERRO_ALTERACAO_NUM_OCORR = '* Alteração do Número de Ocorrências da Rubrica Nº ';
  MSG_ERRO_ALOCACAO_OBJETOS = '* Alocação de memória para os objetos' +CR_LF+
    'envolvidos no processo de Geração da Rescisão.' + MSG_ERRO;
  MSG_ERRO_LIBERACAO_OBJETOS = '* Liberação de memória para os objetos' +CR_LF+
    'envolvidos no processo de Geração da Rescisão.' + MSG_ERRO;
  MSG_ERRO_ESCREVE_RUB = '* Ao gravar Histórico de Rubricas Salariais.' + MSG_ERRO;

type
  TCtrlGeraFolPag = class(TCmControlObject)//TCtrlCustomRH)
  protected
    FCtrlProvDesc: TCtrlProvDesc; //Darivaldo Alencar SIG72541
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlCtFolha: TCtrlCtFolha;
    FCtrlBancoPortFolha: TCtrlBancoPortFolha;
    FCtrlIntegraRH: TCtrlIntegraRH;
    FCtrlCalcRub: TCtrlCalcRub;
    FCtrlIntBanco: TCtrlIntBanco;

    FCdsFunc: TCMClientDataSet;
    FCdsRubEsp: TCMClientDataSet;
    FCdsDocumentos: TCMClientDataSet;
    FCdsPortadorForma: TCMClientDataSet;
    FCdsAuxContab: TCMClientDataSet;
    FCdsRubIndiv: TCMClientDataSet;
    FCdsRubXRub: TCMClientDataSet;
    FCdsDocTxt: TCMClientDataSet;
    FCdsDescFolha: TCMClientDataSet;

    FLstPortForma: TStringList;

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
    FCodDocumentoCAP: integer;
    FCodPortForma: integer;
    FLimDem: integer; // Indica se processa TmpDesc de Outra Empresa (1=Sim, 0=Não)
    FPlanoPadrao: integer;  // Plano Padrão para Favorecido

    FIdPessoa: double; // Código da Pessoa que está sendo processada
    FIdFavorecido: double; // Código do Favorecido da Rubrica que está sendo processada
    FTotalGeral_Prov: double; // Totalizador dos Proventos da Passoa que está sendo processada
    FTotalGeral_Desc: double; // Totalizador dos Descontos da Passoa que está sendo processada
    FValorRubrica: double; // Valor Calculado da Rubrica
    FUltValorLiquido: double;

    FIdPatro: integer; // Código da Patro processada pela TMPDESC
    FIdPlanoContab: integer; // Código do Plano Contábil processado pela TMPDESC
    FMantemTmpDesc: boolean; // Indica se Plano Contábil e Patrocinadora devem ser mantidos da TMPDESC
    FProcTmpDesc: boolean; // Indica se há lançamentos na TMPDESC

    FIntegra_CAP: boolean; // Indica se deve integrar com o CAP
    FIntegra_PagEletronico: boolean; // Indica se deve gerar arquivo de Pagamento Eletrônico
    FRateioCC: boolean; // Indica se deve fazer o rateio por Centro de Custo no CAP
    FCriarDocIndividual: boolean; // Indica se deve criar um Documento CAP por pessoa
    FConsTipoDesemb: boolean; // Indica se deve consolidar tipos de desembolso na mesma AP
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
    FCodCentroCusto: string;
    FUltContaCorrente: string;
    FUltIdBanco: string;
    FUltNumAgencia: string;
    FCodTipRecDes: string; // Código do Tipo de Recebimento Desembolso
    FDiretorioArqPag: string; // Diretório que será gravado o arquivo de Pagamento Eletrônico
    FLOG: string;
    FContaPadrao: string; // Conta Padrão para Favorecido

    FH: THora; // Tempo decorrido

    ApagaSomentePrimeiraVez : String; // SOL 232001 PPM 383102

    function AbrirSQLFunc: boolean; virtual;
    function PrepararRubEspeciais: boolean; virtual;
    function ExisteRegistro_TmpDesc(ListaEmpregado: string): boolean;

    function ListRubricaIndiv: OleVariant;
    function ListHistoricoPessoaMes(IdMotivo: integer): OleVariant;
    function ListRubXRub: OleVariant;
    function ListEndereco: OleVariant;
    function ListDocPagEletronico: OleVariant;
    function ListDescFolha(OutraEmpresa: integer;
                           ValorTaxa: string;
                           bExcluiRubricasExcessoDebito : Boolean = False;
                           ListaIdRubrica: String = ''): OleVariant;
    function ListBanco(IdResponsavel: double): OleVariant;

    procedure SelDadosIntegracaoEmpresa;
    procedure SelDadosIntegracaoPessoa;

    function GetTempoDecorrido: string;
    function GetProxNumSeq_Historico(IdRubrica: double): integer;

    function  Init_Integracao: boolean;
    function  GerarCAP: boolean;
    procedure SetDadosPagEletronico;
    procedure IncCodDocumento;

    function AtualizarIntegracao(const Dados: TCMClientDataSet; IdRubrica, Valor: double): boolean;

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
    function GravarRubrica(IdRubrica         : double;
                           CodProvDesc       : string;
                           IdMotivo          : integer;
                           Mes,
                           MesCobranca,
                           Referencia        : string;
                           IdRegraCalculo    : double;
                           FlgCompoeSalPart,
                           FlgCompoeSalBenef,
                           FlgIRRF,
                           SeqOriginal       : integer;
                           ValorProvento     : double;
                           IdFav             : integer = 0 // Andre Imakawa - SIG 19778
                           ;bValidaData: boolean = false //Darivaldo Alencar SIG73541
                           ) : boolean;

    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce; virtual;
    destructor  Destroy; override;

    property LOG: string read FLOG;

  end;

implementation

uses Db, fAguarde;

{ TCtrlGeraFolPag }

constructor TCtrlGeraFolPag.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  FCtrlProvDesc := TCtrlProvDesc.Create;//Darivaldo Alencar SIG73541
  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlCtFolha := TCtrlCtFolha.Create;
  FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create;
  FCtrlIntegraRH := TCtrlIntegraRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlCalcRub := TCtrlCalcRub.Create;
  FCtrlIntBanco := TCtrlIntBanco.Create;
  FCtrlIntBanco.FechaQryTexto := false;
  FCtrlIntBanco.IdentficaOrigem := 'P';
end;

destructor TCtrlGeraFolPag.Destroy;
begin
  FreeAndNil(FCtrlProvDesc);//Darivaldo Alencar SIG73541
  FreeAndNil(FCtrlListTerceirosRH);
  FreeAndNil(FCtrlCtFolha);
  FreeAndNil(FCtrlBancoPortFolha);
  FreeAndNil(FCtrlIntegraRH);
  FreeAndNil(FCtrlCalcRub);
  FreeAndNil(FCtrlIntBanco);
  inherited;
end;

procedure TCtrlGeraFolPag.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlGeraFolPag.AfterInitialize;
begin
  inherited;
  FCtrlProvDesc.InitializeAs(self);//Darivaldo Alencar SIG73541
  FCtrlListTerceirosRH.InitializeAs(Self);
  FCtrlCtFolha.InitializeAs(Self);
  FCtrlBancoPortFolha.InitializeAs(Self);
  FCtrlIntegraRH.InitializeAs(Self);
  FCtrlCalcRub.InitializeAs(Self);
  FCtrlIntBanco.InitializeAs(Self);
end;

procedure TCtrlGeraFolPag.DoChangeDataBase;
begin
  inherited;
  FCtrlProvDesc.DataBase:= DataBase;//Darivaldo Alencar SIG73541
  FCtrlListTerceirosRH.DataBase := DataBase;
  FCtrlCtFolha.DataBase := DataBase;
  FCtrlBancoPortFolha.DataBase := DataBase;
  FCtrlIntegraRH.DataBase := DataBase;
  FCtrlCalcRub.DataBase := DataBase;
  FCtrlIntBanco.DataBase := DataBase;
end;

function TCtrlGeraFolPag.ListBanco(IdResponsavel: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  AGB.IDBANCO, BPF.CODPORTFORMA,'+CR_LF+
    '  F.NUMCONTASALARIO AS CONTACORRENTE, AGB.NUMAGENCIA, BAN.NUMBANCO'+CR_LF+
    'FROM'+CR_LF+
    '  FUNCIONARIO F, AGENCIABANCARIA AGB, BANCO BAN, BANCOPORTFOLHA BPF'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA         = ' +FloatToStr(IdResponsavel)+ ') AND'+CR_LF+
    '  (F.IDAGENCIASALARIO = AGB.IDPESSOA(+)) AND'+CR_LF+
    '  (AGB.IDBANCO        = BAN.IDPESSOA(+)) AND'+CR_LF+
    '  (AGB.IDBANCO        = BPF.IDBANCO(+))');
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
    '  EP.CEP, P.NUMDOCUMENTO' +CR_LF+
    'FROM' +CR_LF+
    '  ENDPESS EP, PESSOA P, CIDADES CI' +CR_LF+
    'WHERE' +CR_LF+
    '  (EP.IDPESSOA  = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
    '  (EP.IDPESSOA  = P.IDPESSOA) AND' +CR_LF+
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

function TCtrlGeraFolPag.ListDescFolha(OutraEmpresa: integer;
                                       ValorTaxa: string;
                                       bExcluiRubricasExcessoDebito: Boolean;
                                       ListaIdRubrica: String): OleVariant;
var
  sSql : String;
begin
 sSql := 'SELECT' +CR_LF+
         '  TD.MESREFERENCIA, TD.IDTITULAR AS IDPESSOA, TD.FLGTIPODESC, TD.VALOR,' +CR_LF+
         '  TD.IDEMPRESA, TD.IDPROVENTO, TD.IDPLANOPREV, TD.ORDEM, TD.CODPROVDESC,' +CR_LF+
         // INICIO - edilaine - SOL 191668 / KTN 1820235 (substituição do alias PD. por  RXE.)
         '  TD.REFERENCIA, TD.IDFUNDACAO, TD.IDLOTE, NVL(RXE.FLGSALFAMILIA,0) FLGSALFAMILIA, ' +CR_LF+
         '  NVL(RXE.FLGFERIAS,0) FLGFERIAS, NVL(RXE.FLGDECIMOTERCEIRO,0) FLGDECIMOTERCEIRO , ' +CR_LF+
         '  PD.NUMPRIORIDADE, NVL(RXE.FLGRESCISAO,0) FLGRESCISAO, PD.IDREGRA,' +CR_LF+
         // FIM - edilaine - SOL 191668 / KTN 1820235 (substituição do alias PD. por  RXE.)
         '  PD.IDPROVENTOEXCESSODEB,'+CR_LF+
         '  TD.VALORRECEBIDO, TD.MESCOBRANCA, TD.VALORBASE1, TD.NUMPARCELAS, TD.PARCELA,' +CR_LF+
         '  TD.IDPESSJUR, NVL(TD.IDPLANPREVCONTAB, TD.IDPLANOPREV) AS IDPLANPREVCONTAB' +CR_LF+
         'FROM' +CR_LF+
         '  TMPDESC TD, PROVDESC PD,' +CR_LF+
         '  VW_RUBXEVENTO RXE ' +CR_LF+  // edilaine - SOL 191668 / KTN 1820235
         'WHERE' +CR_LF+
         '  (TD.IDTITULAR    = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
         IFF(OutraEmpresa = 0,'  (TD.IDPESSJUR    = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF,'')+
         '  (TD.MESCOBRANCA  = ' +QuotedStr(FMesRef)+ ') AND' +CR_LF+
         '  (TD.FLGDESCFOLHA = ''P'') AND' +CR_LF+
         '  (NVL(TD.VALORRECEBIDO,0) = 0) AND' +CR_LF+
         // Para Taxa deve-se pegar o que vem do AdmPrev (FLGTIPODESC = P)
         // Para Valor deve-se pegar o que vem de todos os programas EXCETO o AdmPrev
         '  (TD.FLGTIPODESC ' +IFF(ValorTaxa='T',' =','<>')+ ' ''P'') AND' +CR_LF+
    {    '  ((TD.FLGTIPODESC    = ''P'' AND' +CR_LF+
         '    ' +QuotedStr(ValorTaxa)+ ' = ''T'') OR' +CR_LF+
         '   (' +QuotedStr(ValorTaxa)+ ' = ''V'')) AND' +CR_LF+    }
         '  (TD.FLGDESCONTO  = 1) AND' +CR_LF+
         '  (TD.FLGTIPODESC IN (''P'',''A'',''E'',''C'')) AND' +CR_LF+
         IFF(ListaIdRubrica='','','  (TD.IDPROVENTO IN ('+ListaIdRubrica+')) AND') +CR_LF+ // Alterado por FHBS - SOL: 150520 KTN: 1093864
         '  (PD.IDPROVENTO   = TD.IDPROVENTO) AND ' +CR_LF+
         '  (PD.IDPROVENTO   = RXE.IDPROVENTO(+))' +CR_LF+  // edilaine - SOL 191668 / KTN 1820235

         'UNION' +CR_LF+

         'SELECT' +CR_LF+
         '  TD.MESREFERENCIA, TD.IDTITULAR AS IDPESSOA, TD.FLGTIPODESC, TD.VALORINFO AS VALOR,' +CR_LF+
         '  TD.IDEMPRESA, TD.IDPROVENTO, TD.IDPLANOPREV, TD.ORDEM, TD.CODPROVDESC,' +CR_LF+
         // INICIO - edilaine - SOL 191668 / KTN 1820235 (substituição do alias PD. por  RXE.)
         '  TD.REFERENCIA, TD.IDFUNDACAO, TD.IDLOTE, NVL(RXE.FLGSALFAMILIA,0) FLGSALFAMILIA, '+CR_LF+
         '  NVL(RXE.FLGFERIAS,0) FLGFERIAS, NVL(RXE.FLGDECIMOTERCEIRO,0) FLGDECIMOTERCEIRO, ' +CR_LF+
         '  PD.NUMPRIORIDADE, NVL(RXE.FLGRESCISAO,0) FLGRESCISAO, PD.IDREGRA,' +CR_LF+
         // FIM - edilaine - SOL 191668 / KTN 1820235 (substituição do alias PD. por  RXE.)
         '  PD.IDPROVENTOEXCESSODEB,'+CR_LF+
         '  TD.VALORRECEBIDO, TD.MESCOBRANCA, TD.VALORBASE1, TD.NUMPARCELAS, TD.PARCELA,' +CR_LF+
         '  TD.IDPESSJUR, NVL(TD.IDPLANPREVCONTAB, TD.IDPLANOPREV) AS IDPLANPREVCONTAB' +CR_LF+
         'FROM' +CR_LF+
         '  TMPDESC TD, PROVDESC PD, ' +CR_LF+
         '  VW_RUBXEVENTO RXE ' +CR_LF+  // edilaine - SOL 191668 / KTN 1820235
         'WHERE' +CR_LF+
         '  (TD.IDTITULAR    = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
         IFF(OutraEmpresa = 0,'  (TD.IDPESSJUR    = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF,'')+
         '  (TD.MESCOBRANCA  = ' +QuotedStr(FMesRef)+ ') AND' +CR_LF+
         '  (TD.FLGDESCFOLHA = ''P'') AND' +CR_LF+
         '  (NVL(TD.VALORRECEBIDO,0) = 0) AND' +CR_LF+
         // Para Taxa deve-se pegar o que vem do AdmPrev (FLGTIPODESC = P)
         // Para Valor deve-se pegar o que vem de todos os programas EXCETO o AdmPrev
         '  (TD.FLGTIPODESC ' +IFF(ValorTaxa='T',' =','<>')+ ' ''P'') AND' +CR_LF+
    {    '  ((TD.FLGTIPODESC    = ''P'' AND' +CR_LF+
         '    ' +QuotedStr(ValorTaxa)+ ' = ''T'') OR' +CR_LF+
         '   (' +QuotedStr(ValorTaxa)+ ' = ''V'')) AND' +CR_LF+   }
         '  (TD.FLGDESCONTO  = 2) AND' +CR_LF+
         '  (TD.FLGTIPODESC IN (''P'',''A'',''E'',''C'')) AND' +CR_LF+
         IFF(ListaIdRubrica='','','  (TD.IDPROVENTO IN ('+ListaIdRubrica+')) AND') +CR_LF+ // Alterado por FHBS - SOL: 150520 KTN: 1093864
         '  (PD.IDPROVENTO   = TD.IDPROVENTO) AND ' +CR_LF+
         '  (PD.IDPROVENTO   = RXE.IDPROVENTO(+))' +CR_LF+  // edilaine - SOL 191668 / KTN 1820235

         'ORDER BY' +CR_LF+
         '  NUMPRIORIDADE, MESREFERENCIA, CODPROVDESC, REFERENCIA';

  // Alterado por Arnaldo V. Scarin em 06/11/2010 - SOL 147224 KTN 1013674
  if bExcluiRubricasExcessoDebito then
  begin
    sSql := 'SELECT * FROM ('+CR_LF+
            sSql + ') RI'+CR_LF+
                   ' WHERE NOT EXISTS (SELECT 1 FROM ' + FNomeTabela + ' H' + CR_LF +
                   '                    WHERE H.IDPESSOA      = ' + FloatToStr(FIdPessoa) + CR_LF +
                   '                      AND H.MES           = ' + QuotedStr(FMesRef) + CR_LF +
                   '                      AND H.IDPESSJUR     = ' + IntToStr(FIdEmpresa) + CR_LF +
                   '                      AND H.IDRUBRICA     = RI.IDPROVENTOEXCESSODEB' + CR_LF +
                   '                      AND H.VALORPROVENTO = RI.VALOR' + CR_LF +
                   // Alterado por FHBS - SOL: 147224 KTN: 1013674
                   '                      AND TRIM(H.REFERENCIA) = TRIM(RI.PARCELA||''/''||RI.NUMPARCELAS) )';
  end;

  Result := GetDataPacket(sSql);
end;

procedure TCtrlGeraFolPag.SelDadosIntegracaoEmpresa;
begin
  if (FIntegra_CAP) then
    FIdPlano := FCtrlListTerceirosRH.GetPlano(FIdEmpresa); // ID do Plano de Contas
end;

procedure TCtrlGeraFolPag.SelDadosIntegracaoPessoa;
begin
  if (FIntegra_CAP) or (FIntegra_PagEletronico) then
  begin
    if (FIntegra_PagEletronico) then
    begin
      _Cds.Data := ListBanco(FIdPessoa);
      if not(_Cds.IsEmpty) then
      begin
        FUltContaCorrente := _Cds.FieldByName('CONTACORRENTE').asString;
        FUltNumAgencia := _Cds.FieldByName('NUMAGENCIA').asString;
        FUltIdBanco := _Cds.FieldByName('NUMBANCO').asString;

        if (FCodPortForma > 0) then
          FUltPortForma := FCodPortForma
        else
        if (_Cds.FieldByName('CODPORTFORMA').asInteger = 0) then
          FUltPortForma := FPortadorFormaPadrao
        else
          FUltPortForma := _Cds.FieldByName('CODPORTFORMA').asInteger;
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
  end;
end;

function TCtrlGeraFolPag.AbrirSQLFunc: boolean;
begin
  Result := false;
end;

function TCtrlGeraFolPag.GetTempoDecorrido: string;
begin
  DecodeTime(Time, FH.Hora, FH.Minuto, FH.Segundo, FH.MicroSegundo);
  FH.HoraAtual := FH.MicroSegundo + 1000 * FH.Segundo + 60000 * FH.Minuto + 3600000 * FH.Hora;
  Result := TempoDecorridoHMS(FH.HoraAtual - FH.HoraInicial, false);
end;

function TCtrlGeraFolPag.GetProxNumSeq_Historico(IdRubrica: double): integer;
begin
  _Cds.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  MAX(SEQRUBRICA) AS SEQ' +CR_LF+
    'FROM' +CR_LF+
    '  '+ FNomeTabela +CR_LF+
    'WHERE' +CR_LF+
    '  (IDPESSOA  = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
    '  (MES       = ' +QuotedStr(FMesRef)+ ') AND' +CR_LF+
    '  (IDRUBRICA = ' +FloatToStr(IdRubrica)+ ')');

  Result := _Cds.FieldByName('SEQ').asInteger + 1;
end;

function TCtrlGeraFolPag.Init_Integracao: boolean;
begin
  Result := true;
  if (FIntegra_CAP) or (FIntegra_PagEletronico) then
  begin
    DoProgresso([MSG_SEL_DADOS_INTEGRA]);
    try
      // Banco Padrão
      FPortadorFormaPadrao := FCtrlBancoPortFolha.GetCodPortFormaPadrao;

      if (FIntegra_CAP) then
        if not(FCtrlIntegraRH.AbrirQueryDocumentos) then
          raise Exception.Create(FCtrlIntegraRH.MessageInfo);

      if (FIntegra_PagEletronico) then
      begin
        FCdsPortadorForma.Data := FCtrlBancoPortFolha.ListPortadorXConta;
        FCdsDocTxt.Data := ListDocPagEletronico;
        if (FCdsDocTxt.IndexDefs.Count = 0) then
          FCdsDocTxt.AddIndex('Index1', 'IDBANCO;NOME', []);
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
    // Guardo o valor da Rubrica
    FCtrlIntegraRH.ConsTipoDesemb := FConsTipoDesemb;
    if not(FCtrlIntegraRH.SetDadosDocumento(
      FCodDocumentoCAP, -1, FIdPlano,
      IFF(FCdsAuxContab.FieldByName('UNIDNEGOC').asInteger<>0,
        FCdsAuxContab.FieldByName('UNIDNEGOC').asInteger, -1),
      IFF(FCodPortForma>0, FCodPortForma, FPortadorFormaPadrao),
      FIdFavorecido, '', FCdsAuxContab.FieldByName('CODCENTRORESPON').asString,
      FCodTipRecDes, 'P', IFF(FCdsAuxContab.FieldByName('FLGDESCONTO').asInteger=0, 'D', 'C'),
      FValorRubrica, 0,
      IFF(FRateioCC, FCdsFunc.FieldByName('CODCENTROCUSTO').asString, ''),
      FCdsFunc.FieldByName('IDPESSOA').asInteger, 0, 0, FIdPatro, FIdPlanoContab)) then
    begin
      raise Exception.Create(FCtrlIntegraRH.MessageInfo);
    end;

    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := MSG_ERRO_CRIACAO_CAP + E.Message;
      Result := false;
    end;
  end;
end;

procedure TCtrlGeraFolPag.SetDadosPagEletronico;
var
  sLogradouro, sNumero, sComplemento, sBairro,
  sCidade, sCodEstado, sCep, sNumDocumento: string;
begin
  if (FUltValorLiquido = 0) or (FUltContaCorrente = '') then
    exit;

  FCdsPortadorForma.Locate('CODPORTFORMA', FUltPortForma, []);
  _Cds.Data := ListEndereco;

  if (_Cds.IsEmpty) then
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
    sLogradouro := _Cds.FieldByName('LOGRADOURO').asString;
    sNumero := _Cds.FieldByName('NUMERO').asString;
    sComplemento := _Cds.FieldByName('COMPLEMENTO').asString;
    sBairro := _Cds.FieldByName('BAIRRO').asString;
    sCidade := _Cds.FieldByName('CIDADE').asString;
    sCodEstado := _Cds.FieldByName('CODESTADO').asString;
    sCEP := _Cds.FieldByName('CEP').asString;
    sNumDocumento := _Cds.FieldByName('NUMDOCUMENTO').asString;
  end;

  with (FCdsDocTxt) do
  begin
    Insert;
    FieldByName('CONTALIQUIDO').asString := '';
    FieldByName('IDPESSOA').asFloat := FCdsFunc.FieldByName('IDPESSOA').asFloat;
    FieldByName('NOME').asString := FCdsFunc.FieldByName('NOME').asString;
    FieldByName('RAZAOSOCIAL').asString := FCdsFunc.FieldByName('NOME').asString;
    FieldByName('NUMDOCUMENTO').asString := sNumdocumento;
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
    FieldByName('IDFORCLI').asFloat := FIdPessoa;
    FieldByName('TIPOCONTA').asString := '1';
    FieldByName('CODDOCUMENTO').asInteger := 0; // Identificador para retorno
    FieldByName('LIVRE').asString := Trim(FCdsFunc.FieldByName('MATRICULA').asString);
    FieldByName('VALOR').asFloat := FUltValorLiquido;
    FieldByName('VALORDESCONTO').asFloat := 0;
    FieldByName('VALORJUROS').asFloat := 0;
    FieldByName('DATAVENCTO').asString := DateToStr(FDataPagamento);
    FieldByName('DATAPROGRAMADA').asString := DateToStr(FDataPagamento);
    FieldByName('TIPOMOEDA').asInteger := 0;
    FieldByName('NUMLOTE').asInteger := 0;
    FieldByName('CODPORTFORMA').asInteger := FUltPortForma;
    FieldByName('CODPORTADOR').asInteger := FCdsPortadorForma.FieldByName('CODPORTADOR').asInteger;
    FieldByName('CODFORMAPAGTO').asInteger := FCdsPortadorForma.FieldByName('CODFORMAPAGTO').asInteger;
    FieldByName('CODTIPOPAGTO').asInteger := FCdsPortadorForma.FieldByName('CODTIPOPAGTO').asInteger;
    FieldByName('FLGEMITEAVISO').asString := FCdsPortadorForma.FieldByName('FLGEMITEAVISO').asString;
    FieldByName('CODARQUIVOREMESSA').asInteger := FCdsPortadorForma.FieldByName('CODARQUIVOREMESSA').asInteger;
    FieldByName('IDBANCO').asInteger := FCdsPortadorForma.FieldByName('IDBANCO').asInteger;           //Portador Forma
    FieldByName('NOCONTACORR').asString := FCdsPortadorForma.FieldByName('NOCONTACORR').asString;
    FieldByName('CODBARRA').asString := '';
    FieldByName('CODBARRAVALOR').asString := '';
    FieldByName('NODOCUMENTO').asFloat := StrToFloat(FloatToStr(FIdPessoa) + Copy(FMesPagto,1,4)); // Codigo que aparece no relatorio
    FieldByName('COMPLDOCUMENTO').asString := Copy(FMesPagto,6,2); // Codigo que aparece no relatorio
    FieldByName('TIPO').asString := 'F';
    FieldByName('NUMEMPRESABANCO').asString := FCdsPortadorForma.FieldByName('NUMEMPRESABANCO').asString;
    FieldByName('DEBCRE').asString := '';
    Post;
  end;
end;

procedure TCtrlGeraFolPag.IncCodDocumento;
begin
  if (FIntegra_CAP) and (FCriarDocIndividual) then
    Inc(FCodDocumentoCAP);
end;

function TCtrlGeraFolPag.AtualizarIntegracao(const Dados: TCMClientDataSet;
  IdRubrica, Valor: double): boolean;
var
  DadosAux: TCMClientDataSet;
begin
  try
    FCodCentroCusto := FCdsFunc.FieldByName('CODCENTROCUSTO').asString;

    FCdsAuxContab.Data := FCtrlCtFolha.ListContabFolhaXEmpresa(IdRubrica,
      FIdEmpresa, FCodCentroCusto);

    if (FCdsAuxContab.IsEmpty) then
    begin
      FCodCentroCusto := '';
      FCdsAuxContab.Data := FCtrlCtFolha.ListContabFolhaXEmpresa(IdRubrica, FIdEmpresa, '');
    end;

    if not(FCdsAuxContab.IsEmpty) then
    begin
      FCodTipRecDes := FCdsAuxContab.FieldByName('CODTIPRECDES').asString;
      FIdFavorecido := FCdsAuxContab.FieldByName('IDFAVORECIDO').asInteger;
      FValorRubrica := Valor;

      if (Assigned(Dados)) then
        DadosAux := Dados
      else  
        DadosAux := FCdsAuxContab;

      if (Dados.FieldByName('CODRUBCLT').asString = '40599') or
         (Dados.FieldByName('CODRUBCLT').asString = '40999') then
      begin
        FUltValorLiquido := FValorRubrica;
        if (FCriarDocIndividual) then
          FIdFavorecido := FIdPessoa;
      end;

      if (FIntegra_CAP) and (FCodTipRecDes <> '') and
         (VerificaCodigoEm(FListaTipoDesemb, FCodTipRecDes, ',') = 1) then
      begin
        GerarCAP;
      end;
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
      try
        DoProgresso([MSG_GRAVANDO_PAG_ELETRONICO]);

        FCdsPessoasAux.Data := FCdsDocTxt.Data;
        FCdsDocTxt.Filter := '';
        FCdsDocTxt.Filtered := true;

        FCdsAuxContab.Data := FCtrlBancoPortFolha.ListPortadorXContaXFolha;
        while not(FCdsAuxContab.EOF) do
        begin
          FUltPortForma := FCdsAuxContab.FieldByName('CODPORTFORMA').asInteger;
          if (FLstPortForma.IndexOf(IntToStr(FUltPortForma)) <> -1) then
          begin
            FCdsDocTxt.Filter := 'CODPORTFORMA = ' + IntToStr(FUltPortForma);
            InserirCdsPessoas;
            FCtrlIntBanco.IndiceDoBanco := FCdsAuxContab.FieldByName('CODARQUIVOREMESSA').asInteger;
          
            if (FCtrlIntBanco.VerficaDadosEmpresa('P', FUltPortForma)) then
            begin
              if (FCtrlIntBanco.ValidaRemessa('P', FCdsPessoasAux.Data, false)) then
              begin
                FCtrlIntBanco.DataPagamento := DateToStr(FDataPagamento);
                FCtrlIntBanco.MontaPagamentoEletronico(
                  FCdsAuxContab.FieldByName('CODARQUIVOREMESSA').asInteger,
                  FCdsAuxContab.FieldByName('CONTROLEREMESSA').asInteger,
                  FCdsPessoasAux.Data, FDiretorioArqPag);
              end
              else
                raise Exception.Create('Erro na geração do arquivo de Pagamento Eletrônico.'+CR_LF+
                                       ' * Código do Portador Forma = ' + IntToStr(FUltPortForma)+CR_LF+
                                       'Erro: ' +CR_LF+ FCtrlIntBanco.MessageInfo);
            end;
          end;
          FCdsAuxContab.Next;
        end;
        frmAguarde.Apaga;
      except
        on E: Exception do
        begin
          frmAguarde.Apaga;
          MessageInfo := MSG_ERRO_GERACAO_PAG_ELETRONICO + E.Message;
          Result := false;
        end;
      end;
    finally
      FreeAndNil(FCdsPessoasAux);
    end;
  end
  else
    DoProgresso(['','',0,'',0,0,MSG_NAO_GRAVA_PAG_ELETRONICO]);
end;

function TCtrlGeraFolPag.GerarIntegracaoCAP: boolean;
begin
  Result := true;
  if not(FCdsDocumentos.IsEmpty) then
  begin
    try
      DoProgresso([MSG_GRAVANDO_CAP]);

      // Gravar no Banco os Documentos
      if not(FCtrlIntegraRH.GravarDocumentos(
          FCriarDocIndividual, 0, IFF(FCodPortForma>0, FCodPortForma, FPortadorFormaPadrao),
          FDataEmissao, FDataPagamento, FRateioCC, FUsaPlanoPatro, FPlanoPrevGlobal,
          FPatroGlobal, FPlanoPadrao, FContaPadrao)) then
      begin
        raise Exception.Create(FCtrlIntegraRH.MessageInfo);
      end;
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
    DoProgresso(['','',0,'',0,0,MSG_NAO_GRAVA_CAP]);
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
      '  (IDPESSOA        = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
      '  (IDRUBRICA       = ' +FloatToStr(IdRubrica)+ ') AND' +CR_LF+
      '  (IDEMPRESA       = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
      '  (SEQRUBRICAINDIV = ' +IntToStr(SeqRubricaIndiv)+ ') AND' +CR_LF+
      '  (FLGTPRUBMANUT   = ''2'')');
  except
    Result := false;
    MessageInfo := MSG_ERRO_ALTERACAO_NUM_OCORR + FloatToStr(IdRubrica);
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
begin
  _Cds.Data := GetDataPacket(
    'SELECT NUMLINHA' +CR_LF+
    'FROM   VALTABGENER' +CR_LF+
    'WHERE  (CODTABELA = ''ADMAJUSTADA'') AND' +CR_LF+
    '       (CODCAMPO  = ''MATRICULA'') AND' +CR_LF+
    '       (VALOR     = ' +QuotedStr(Matricula)+ ')');

  if not(_Cds.IsEmpty) then
  begin
    sNumLinha := _Cds.FieldByName('NUMLINHA').asString;
    _Cds.Data := GetDataPacket(
      'SELECT VALOR' +CR_LF+
      'FROM   VALTABGENER' +CR_LF+
      'WHERE  (CODTABELA = ''ADMAJUSTADA'') AND' +CR_LF+
      '       (CODCAMPO  = ''DATREFER'') AND' +CR_LF+
      '       (NUMLINHA  = ' +sNumLinha+ ')');

    Referencia := IntToStr(Round(Int((FNormalFim -
      StrToDate(_Cds.FieldByName('VALOR').asString)) / 365.25)));
  end;
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
      FCdsAuxContab := TCMClientDataSet.Create(nil);

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
      MessageInfo := MSG_ERRO_ALOCACAO_OBJETOS + E.Message;
    end;
  end;
end;

procedure TCtrlGeraFolPag.DestruirObjetos_Geracao;
begin
  try
    FreeAndNil(FCdsFunc);
    FreeAndNil(FCdsRubEsp);
    FreeAndNil(FCdsRubIndiv);
    FreeAndNil(FCdsRubXRub);
    FreeAndNil(FCdsDescFolha);

    if (FIntegra_CAP) or (FIntegra_PagEletronico) then
    begin
      FreeAndNil(FLstPortForma);
      FreeAndNil(FCdsAuxContab);

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
      MessageInfo := MSG_ERRO_LIBERACAO_OBJETOS + E.Message;
  end;
end;

function TCtrlGeraFolPag.ApagarPrevia: boolean;
begin
  DoProgresso([MSG_APAGANDO_PREVIA]);
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
        FIdPatro  := IFF(FMantemTmpDesc, FCdsDescFolha.FieldByName('IDPESSJUR').asInteger, 0);
        FIdPlanoContab := IFF(FMantemTmpDesc, FCdsDescFolha.FieldByName('IDPLANPREVCONTAB').asInteger, 0);

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
            FloatToStr(FIdPessoa), dValorDesc, TotDesc, 1, 0, 0, FTotalGeral_Prov,
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

function TCtrlGeraFolPag.GravarRubrica(IdRubrica          : double;
                                       CodProvDesc        : string;
                                       IdMotivo           : integer;
                                       Mes,
                                       MesCobranca,
                                       Referencia         : string;
                                       IdRegraCalculo     : double;
                                       FlgCompoeSalPart,
                                       FlgCompoeSalBenef,
                                       FlgIRRF,
                                       SeqOriginal        : integer;
                                       ValorProvento      : double;
                                       IdFav              : integer = 0
                                       ;bValidaData: boolean = false //Darivaldo Alencar SIG73541
                                       ) : boolean;
var
  iSeqRubrica  : integer;
  sIdInforme,
  sCodIrrfDarf,
  sNumCPF,
  sSql         : String;
  idFavorecido : String; // Thiago Melo SOL 228632 kintana 2062829
  CdsValidaData, CdsValidaTP: TCMClientDataSet; bInserirTabela: Boolean; //Darivaldo Alencar SIG73541

  // Thiago Melo SOL 228632 kintana 2062829
  function retornaIdFavorecido (_idPessoa, _idRubrica : Double) : String;
  var
    _cds : TCMClientDataSet;
  begin
    _cds := TCMClientDataSet.Create(nil);
    try
      _cds.Data := GetDataPacket('SELECT IDFAVORECIDO ' + CR_LF +
                                 '  FROM RUBRICAINDIV ' + CR_LF +
                                 ' WHERE IDPESSOA  = ' + FloatToStr(_idPessoa) + CR_LF +
                                 '   AND IDRUBRICA = ' + FloatToStr(_idRubrica) + CR_LF +
                                 '   AND IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

      result := _cds.FieldByName('IDFAVORECIDO').AsString;
    finally
      FreeAndNil(_cds)
    end;
  end;
  // Thiago Melo SOL 228632 kintana 2062829
begin
  try
    //Darivaldo Alencar SIG73541 -Inicio
    bInserirTabela:= True;
    if (bValidaData) then
      begin
        try
          CdsValidaData    := TCMClientDataSet.create(nil);
          CdsValidaTP      := TCMClientDataSet.create(nil);
          CdsValidaTP.Data := FCtrlProvDesc.ListProvDesc(IdRubrica);

          if (UpperCase(CdsValidaTP.Fieldbyname('FLGCONTRIBUICAO').asString) =  'C') or
             (UpperCase(CdsValidaTP.Fieldbyname('FLGCONTRIBUICAO').asString) =  'S') or
             (UpperCase(CdsValidaTP.Fieldbyname('FLGCONTRIBUICAO').asString) =  'P')
          then begin
             CdsValidaData.Data:= GetDataPacket(' SELECT C.FLGCOBRA,C.DATAFINAL '+ CR_LF +
                                                '  FROM CONTRIBPREVPARTP C '+ CR_LF +
                                                ' WHERE C.IDPESSOA = '+ FloatToStr(FIdPessoa)+ CR_LF +
                                                ' AND C.IDCONTRIBUICAO = 1 '+ CR_LF +
                                                ' ORDER BY C.FLGCOBRA DESC '); //Everson Cunha - SIG78282

             if not(CdsValidaData.IsEmpty) then
               begin
                 if (CdsValidaData.fieldbyname('DATAFINAL').asString = EmptyStr) then
                     bInserirTabela:= CdsValidaData.fieldbyname('FLGCOBRA').asInteger = 1
                 else begin
                     bInserirTabela:= (CdsValidaData.fieldbyname('DATAFINAL').AsDateTime > FDataProcessamento) and
                                      (CdsValidaData.fieldbyname('FLGCOBRA').asInteger = 1);
                 end;
               end;
          end;
        finally
          FreeAndNil(CdsValidaData);
          FreeAndNil(CdsValidaTP);
        end;
      end;

   if(bInserirTabela) then
    begin
    //Darivaldo Alencar SIG73541 -Fim

      //TAES - SIG90993 - início
      if((SeqOriginal <> 0) and ((IdMotivo = 5) or (IdMotivo = 15))) then
        begin
            iSeqRubrica := SeqOriginal;
            SeqOriginal := 0;
        end
      else
        begin
             iSeqRubrica := GetProxNumSeq_Historico(IdRubrica);
        end;
      //TAES - SIG90993 - fim

      // Andre Imakawa - SIG 19778 - Inicio
      if IdFav <> 0 then
         idFavorecido := IntToStr(IdFav)
      else
         idFavorecido := retornaIdFavorecido(FIdPessoa, IdRubrica); // Thiago Melo SOL 228632 kintana 2062829
      // Andre Imakawa - SIG 19778 - Fim
    
      if (FProcesso = FINAL) then
      begin
        _Cds.Data := GetDataPacket('SELECT IDINFORME, CODIRRFDARF' +CR_LF+
                                   'FROM PROVDESC'+CR_LF+
                                   'WHERE (IDPROVENTO = ' +FloatToStr(IdRubrica)+ ')');
        sIdInforme   := _Cds.FieldByName('IDINFORME').asString;
        sCodIrrfDarf := _Cds.FieldByName('CODIRRFDARF').asString;
        _cds.Data := GetDataPacket('Select NumDocumento from Pessoa'+CR_LF+
                                   'Where IDPEssoa = '+FloatToStr(FIdPessoa));
        sNumCPF   := _Cds.FieldByName('NumDocumento').asString;
      end
      else
      begin
        sIdInforme   := '';
        sCodIrrfDarf := '';
        sNumCPF      := '';
      end;

      //William Moreira da Silva - SOL 225868 - KINTANA 2059484
      if ApagaSomentePrimeiraVez <> FloatToStr(FIdPessoa) then begin // SOL 232001 PPM 383102
        sSql := 'Delete from ' + FNomeTabela                    + CR_LF +
                'where IDRUBRICA    = ' + FloatToStr(IdRubrica) + CR_LF +
                '  and MES          = ' + QuotedStr(Mes)        + CR_LF +
                '  AND IDPESSOA     = ' + FloatToStr(FIdPessoa) + CR_LF +
                '  AND IDMOTIVO     = ' + FloatToStr(FIdMotivo) + CR_LF +  // Andre Imakawa - SIG 112823
                '  and MESCOBRANCA  = ' + QuotedStr(MesCobranca);

         ExecSql(sSql);
        sSQL := ' ';
        ApagaSomentePrimeiraVez := FloatToStr(FIdPessoa);
      end;
      //William Moreira da Silva - SOL 225868 - KINTANA 2059484

      sSql := 'INSERT INTO ' + FNomeTabela + CR_LF+
              '  (SEQRUBRICA,'        + CR_LF +
              '   IDPESSOA,'          + CR_LF;
      // Thiago Melo SOL 228632 kintana 2062829
      //if UpperCase(FNomeTabela) = 'HISTRUBSAL' then begin // Andre Imakawa - SIG 19778
        if (Trim(idFavorecido) <> '') then begin
          sSql := sSql +  '   IDFAVORECIDO,'          + CR_LF;
       // end;
      end;
      // Thiago Melo SOL 228632 kintana 2062829

      If FProcesso = FINAL then
        sSql := sSql + '   NUMDOCUMENTO,'      + CR_LF;

      sSql := sSql +
              '   IDPESSJUR,'         + CR_LF +
              '   IDPATRO,'           + CR_LF +
              '   IDPLANOCONTABIL,'   + CR_LF +
              '   IDRUBRICA,'         + CR_LF +
              '   CODPROVDESC,'       + CR_LF +
              '   IDMOTIVO,'          + CR_LF +
              '   MES,'               + CR_LF +
              '   MESCOBRANCA,'       + CR_LF +
              '   REFERENCIA,'        + CR_LF +
              '   IDREGRACALCULO,'    + CR_LF +
              '   FLGCOMPOESALPART,'  + CR_LF +
              '   FLGCOMPOESALBENEF,' + CR_LF +
              '   FLGIRRF,'           + CR_LF +
              '   DATAPAGAMENTO,'     + CR_LF +
              '   VALORPROVENTO,'     + CR_LF +
              '   '+CAMPO_SEQ_ORIGINAL;
      If FProcesso = PREVIA Then
        sSql := sSql + ')' + CR_LF
      else
      begin
        sSql := sSql +',' + CR_LF + '   IDMODULO';
        // Alterado por Arnaldo V. Scarin em 22/03/2010
        // SOL 132360 KINTANA 761920
        // Correção da rotina de gravação de rubricas
        If sIdInforme <> '' then
          sSql := sSql +',' + CR_LF + '   IDINFORME';
        If sCodIrrfDarf <> '' then
          sSql := sSql +',' + CR_LF + '   CODIRRFDARF';
        sSql := sSql + ')' + CR_LF;
      end;
      sSql := sSql +  'VALUES(' +
              IntToStr(iSeqRubrica)  + ', ' + CR_LF +
              FloatToStr(FIdPessoa)  + ', ' + CR_LF;
      // Thiago Melo SOL 228632 kintana 2062829
      //if UpperCase(FNomeTabela) = 'HISTRUBSAL' then begin // Andre Imakawa - SIG 19778
        if (Trim(idFavorecido) <> '') then begin
          sSql := sSql + QuotedStr(idFavorecido) + ',' + CR_LF;
      //  end;
      end;
      // Thiago Melo SOL 228632 kintana 2062829
      If FProcesso = FINAL then
        sSql := sSql + QuotedStr(sNumCPF) + ',' + CR_LF;
      sSql := sSql +
              FloatToStr(FIdEmpresa) + ', ' + CR_LF +
              IFF(FTipoEmpresa='P', IFF(FIdPatro > 0,FloatToStr(FIdPatro),FloatToStr(FIdEmpresa)), 'NULL') + ', '+ CR_LF +
              IFF(FTipoEmpresa='P', IFF(FIdPlanoContab > 0,FloatToStr(FIdPlanoContab),'NULL'), 'NULL') + ', ' + CR_LF +
              FloatToStr(IdRubrica)  + ', '+ CR_LF +
              QuotedStr(CodProvDesc) + ', '+ CR_LF +
              IntToStr(IdMotivo)     + ', '+ CR_LF +
              QuotedStr(Mes)         + ', '+ CR_LF +
              QuotedStr(MesCobranca) + ', '+ CR_LF +
              QuotedStr(Referencia)  + ', '+ CR_LF +
              IFF(IdRegraCalculo=0, 'NULL', FloatToStr(IdRegraCalculo)) +', '+ CR_LF +
              IntToStr(FlgCompoeSalPart)  + ', '+ CR_LF +
              IntToStr(FlgCompoeSalBenef) + ', '+ CR_LF +
              IntToStr(FlgIRRF)           + ', '+ CR_LF +
              'TO_DATE('+QuotedStr(DateToStr(FDataProcessamento)) +',''DD/MM/YYYY''), '+ CR_LF +
              OraNumero(FloatToStr(ValorProvento)) +
              IFF(SeqOriginal=0, ', NULL', ', '+IntToStr(SeqOriginal)) + CR_LF +
              IFF(FProcesso=PREVIA, ')', ', 21' + CR_LF +
              IFF(sIdInforme='','', ', '+sIdInforme + CR_LF )+
              IFF(sCodIrrfDarf='','',', '+QuotedStr(sCodIrrfDarf))+')');

      ExecSQL(sSql);
    end; //Darivaldo Alencar SIG73541 -Fim

    if (IdRubrica = 32871) then                         //SIG93310
        FCtrlCalcRub.dVlrInssOutrasEmp:= ValorProvento; //SIG93310

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := MSG_ERRO_ESCREVE_RUB + E.Message;
    end;
  end;
end;

function TCtrlGeraFolPag.PrepararRubEspeciais: boolean;
begin
  DoProgresso([MSG_PREPARO_RUB_ESPECIAIS]);
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
      FSQL := FSQL + '  (TD.IDPESSOA            IN (' +ListaEmpregado+ '))'
    else
      FSQL := FSQL + '  (TD.IDPESSOA             = ' +ListaEmpregado+ ')';
  end;

  _CdsAux.Data := GetDataPacket(FSQL);
  Result := (_CdsAux.FieldByName('CONTA').asInteger > 0);
  _CdsAux.Free;
end;

end.
