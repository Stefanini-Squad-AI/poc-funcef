// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// ****************************************************************
//Rotina......: GerarContabilidade
//Nº SIG......: 114503
//Data........: 21/05/2021
//Responsável.: edilaine
//Descrição...: Contabilizacao de rubricas de emprestimo em plano/patro errado
//***************************************************************************************
//Rotina......: ProcessaLanctoDocum
//Nº SIG......: 94320-95404
//Data........: 11/12/2019
//Responsável.: edilaine
//Descrição...: Integração Orçamentária com sistema web - envio de dados
//***************************************************************************************
// Autor(a)    : Darivaldo Alencar
// Data        : 02/02/2018
// Pendência   : SIG 62214
// Rotina      : ListaEmpregados
// Descricao   : Gerando duplicidade para funcionario com dependente
// *****************************************************************************
// Autor(a)    : William Moreira da Silva
// Data        : 25/04/2017
// Pendência   : SIG 44973
// Rotina      : ListaIdRubricaParam
// Descricao   : Sistema estava desconsiderando ultimo caractere do filtro
// *****************************************************************************
// Autor(a)    : Edilaine Ferraresi
// Data        : 17/03/2013
// Pendência   : SOL 188851 Kintana 1784371
// Rotina      : DFM, bbtnConfirmarClick
// Descricao   : ajuste para o sistema efetuar a avaliação do fornecedor
// *****************************************************************************
// Autor(a)    : Fábio H B Sampaio
// Data        : 21/01/2013
// Pendência   : SOL 223280 / KTN 2057740
// Descricao   : Melhora de performance na seleção de rubricas e empregados
//-----------------------------------------------------------------------------
// Autor(a)    : Fábio H B Sampaio
// Data        : 03/12/2013
// Pendência   : SOL 221835 / KTN 2054506
// Descricao   : Implementação da condição IDPESSJUR para melhor desempenho da
//               consulta na HISTRUBSAL dentro da rotina ListaIdIntegra
//-----------------------------------------------------------------------------
// Autor(a)    : Fábio H B Sampaio
// Data        : 03/12/2013
// Pendência   : SOL 221835 / KTN 2054506
// Descricao   : Correção da rotina ListaEmpregados para quando ListaIdPessoa
//               for em branco.
//-----------------------------------------------------------------------------
// Autor(a)    : Felipe A. Santos
// Data        : 25/10/2013
// Pendência   : SOL 218135/15336 kintana 2049538
// Descricao   : Somente enviei para homologação referente ao sol 218135
//-----------------------------------------------------------------------------
// Autor(a)    : Fábio H B Sampaio
// Data        : 22/10/2013
// Pendência   : SOL 218135 kintana 2049538
// Descricao   : Implementação para que o filtro das rubricas não impacte na 
//               contabilização.
//-----------------------------------------------------------------------------
// Autor(a)    : Felipe A. Santos
// Data        : 10/09/2013
// Pendência   : SOL 216235 kintana 2045698
// Descricao   : foi corrigido o loop infinito na rotina GerarIntegracao
//-----------------------------------------------------------------------------
// Autor(a)    : Felipe A. Santos
// Data        : 14/08/2013
// Pendência   : SOL 188078 kintana 1772223
// Descricao   : Foi alterado a rotina GerarIntegracao para ratear o valor da
//               Rubrica caso a mesma tenha mais de um tipo de desembolso cadas-
//               trado. Foi alterado a rotina ListaIdIntegra, pois estava demo-
//               rando para abrir o formulário.
//------------------------------------------------------------------------------
// Autor(a)    : Edilaine Ferraresi
// Data        : 15/08/2013
// Pendência   : SOL 188078 kintana 1772223
// Descricao   : Melhora de performance.
//------------------------------------------------------------------------------
// Autor(a)    : Monica Gonzaga
// Data        : 28/01/2013
// Pendência   : SOL 188078 kintana 1772223
// Descricao   : Inclusao da Aba Seleção de Rubricas e Empregados.
//------------------------------------------------------------------------------
// Autor(a)    :  Arnaldo V. Scarin
// Data        :  01/06/2011
// Pendência   :  SOL 154381 KINTANA 1186492
// Descricao   :  Correção do Plano Previdenciario e Patro na Integração contábil,
//                de forma que as rubricas de emprestimo possam ser contabilizadas
//                no PGA.
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit uCtrlParamContabFolha;

interface

uses SysUtils, Db, Controls, classes, Forms, uCmControlObject, uCmDbObject, uCmClientDataSet,
  uCMTypes, uCtrlLancamento, uCtrlFuncoesRH, uCtrlCustomRH, uCtrlIntegraRH, uCtrlSegregacao,
  uCtrlBancoPortFolha, uCtrlListTerceirosRH, uCtrlPpraCipa, uCtrlParamIntegra, uSistema,
  uCtrlIntegraOrcFDO,                   //edilaine - SIG94320/95404
  dBaseDados, uCMFileUtils;

const
  // Mensagens de PROCESSAMENTO
  MSG_SEL_DADOS_PESSOAS = 'Selecionando dados das Pessoas...';
  MSG_PROCESSANDO = 'Processando informações...';
  MSG_GRAVANDO_CAP = 'Gravando dados da Integração com o Contas a Pagar...';
  // Mensagens de AVISO
  // Mensagens de ERRO
  MSG_ERRO_SEL_DADOS_PESSOAS = 'Não há dados a serem processados para esta competência ou' +
    CR_LF+ 'Dados Cadastrais incompletos.';
  MSG_ERRO_GERACAO_CAP = 'Ocorreu um erro durante o processamento da integração.' +CR_LF+
    'Consulte Resultado da geração para maiores detalhes.';


type
  TProgramaSegrega = record
     // 12/12 Alex - armazenar o grupo contábil do passivo e o programa do mesmo isto para evitar buscar o programa a cada
     // lançamento contábil do sistema otimizando o processo de contabilização.
     sContaPrograma, sContaSegregacao: string;
     iPlanoPrevCont, iIdSegregaCriter: integer;
  end;

  TRetornoIntegra = record   // Edilaine -  SOL 188078 / KTN 1772223
     sIdRubrica : string;
     sIdPessoa  : string;
  end;

  TCtrlParamContabFolha = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FCtrlSegregacao : TCtrlSegregacao;
    FCtrlLancamento: TCtrlLancamento;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlBancoPortFolha: TCtrlBancoPortFolha;
    FCtrlIntegraRH: TCtrlIntegraRH;
    FCtrlPpraCipa: TCtrlPpraCipa;

    FCtrlIntegraOrcFDO : TCtrlIntegraOrcFDO;                   //edilaine - SIG94320

    FCdsPrincipal: TCMClientDataSet;
    FCdsContabFolha: TCMClientDataSet;
    FCdsDocumentos: TCMClientDataSet;
    FCdsContasCC: TCMClientDataSet;
    FCdsEmpresa: TCMClientDataSet;
    FCdsAux: TCMClientDataSet; // Felipe A. Santos

    FListaCodPortadorForma: TStringList;

    FPortadorFormaPadrao: integer;
    FIdModulo: integer;
    FIdUsuario: integer;
    FIdEmpresa: integer;
    FIdPatroTmp: integer;
    FIdPlanoTmp: integer;
    FIdFavorecido: integer;
    FUnidNegoc:Integer ;
    FLocalErro: integer;
    FRateio: integer; // Felipe A. Santos SOL 188078 kintana 1772223

    FIdEstab: double;
    FIdRubrica: double;
    FIdPatro: double;
    FIdPlanoPrev: double;
    FPlnCodigo: double;
    FVlrProvento : double; // Felipe A. Santos SOL 188078 kintana 1772223
    FVlrRateio : double; // Felipe A. Santos SOL 188078 kintana 1772223

    FListaPlnCodigo: string;

    FCodCentroCusto: string;
    FCentroCustoEmp: string;

    FDataRef: string;
    FNomeTabela: string;
    FAnoMes: string;
    FListaIdTipoFolha: string;
    FListaTipoDesemb: string;

    FListaIdFunc:   string;
    FListaIdRubrica:   string;
    FListaTipoContrato: string;

    FCancelProcRubIncompleta: boolean;
    FUsaPlanoPatro: boolean;
    FTemOutroCC: boolean;
    FRateioCC: boolean;
    FMantemCCusto: boolean;

    FH: THora; // Tempo decorrido

    // Alex 12/12 armazenar dados para rateio por programa e segregação de recursos
    rProgramaSegrega : TProgramaSegrega;

    function GetTempoDecorrido: string;

    function GetAtividadeProgeto:Integer ;
    function AbrirQueryPrincipal(FazCAP: boolean): boolean;

    function GerarContabilidade(TipoOperacao: string; Consolida: boolean): boolean;

    function GerarCAP(IdPlano: integer): boolean;

    function  VerificaTemOutroCC: boolean;
    function  GetIdBancoContaSalario(IdAgenciaSalario: double): integer;
    function  ListContabFolha: OleVariant;

    procedure EnviarMensagem(const Processo: WideString; const TempoDecorrido: WideString = '';
      NumRegistros: Integer = 0; Incremento: Integer = 0; const Msg: WideString = '');
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function ListaIdIntegra(sCampo, Mes: String;  Ano, IdEstab, IdModulo: integer;
      ListaIdTipoFolha: string; Previa: Boolean; sListaCODTIPRECDES: String): TRetornoIntegra;

    Function  ListaEmpregados(sTipoContrato, ListaIdPessoa: string): OleVariant;

    function GerarIntegracao(
      FazCAP, FazContab, Consolida: boolean; Mes, Ano: integer;
      DataEmissao, DataPagamento: TDateTime; IdEmpresa, IdModulo, IdUsuario: integer;
      IdEstab: double; ListaIdTipoFolha, ListaTipoDesemb, TipoOperacao: string;
      ListaIdRubrica,ListaIdFunc:string;
      Previa, CancelProcRubIncompleta, RateioCC, ObrigaAbc, ObrigaCRespon: boolean;
      PlanoPrevGlobal, PatroGlobal, CodTipDoc: integer; UsaPlanoPatro: boolean;
      IdPatro, IdPlanoPrev: integer; ConsTipoDesemb, MantemCCusto: boolean): boolean;

    function ListaTipoDesembolsoXRubrica(idrubrica : string) : OleVariant; // Felipe SOL 188078 kintana 1772223
    function ListaIdRubricaParam(ListaTipoDesemb : string) : string; // Felipe SOL 188078 kintana 1772223
    function GetNumRateio : integer;

    function  GetListaFornecedores(iMes, iAno, iEstab : integer; sFolhas, sDesembolso : string; bPrevia : boolean ) : OleVariant;  //Edilaine - SOL 188851 Kintana 1784371

  end;

implementation

const
  ERRO_GENERICO = 0;
  ERRO_CONTAB = 1;
  ERRO_CAP = 2;

{ TCtrlParamContabFolha }

constructor TCtrlParamContabFolha.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  FCtrlSegregacao := TCtrlSegregacao.Create; //(FIdEmpresa);
  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlLancamento := TCtrlLancamento.Create;
  FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create;
  FCtrlIntegraRH := TCtrlIntegraRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlPpraCipa := TCtrlPpraCipa.Create;

  FCtrlIntegraOrcFDO := TCtrlIntegraOrcFDO.create;               //edilaine - SIG94320

  FCdsContasCC := TCMClientDataSet.Create(nil);
  FCdsEmpresa := TCMClientDataSet.Create(nil);
  FCdsAux := TCMClientDataSet.Create(nil);

  FListaCodPortadorForma := TStringList.Create;

  FCtrlLancamento.OpenTransaction := false;
end;

destructor TCtrlParamContabFolha.Destroy;
begin
  FCtrlSegregacao.Free;
  FCtrlLancamento.Free;
  FCtrlListTerceirosRH.Free;
  FCtrlBancoPortFolha.Free;
  FCtrlIntegraRH.Free;
  FCtrlPpraCipa.Free;

  FCtrlIntegraOrcFDO.free;               //edilaine - SIG94320

  FCdsContasCC.Free;
  FCdsEmpresa.Free;
  FCdsAux.Free; // Felipe A. SAntos

  FListaCodPortadorForma.Free;
  inherited;
end;

procedure TCtrlParamContabFolha.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlParamContabFolha.AfterInitialize;
begin
  inherited;
  FCtrlSegregacao.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true);
  FCtrlSegregacao.GetParams(Sistema.IdEmpresa);  // instanciar as propriedades do objeto
  FCtrlListTerceirosRH.InitializeAs(Self);
  FCtrlBancoPortFolha.InitializeAs(Self);
  FCtrlIntegraRH.InitializeAs(Self);
  FCtrlLancamento.InitializeAs(Self);
  FCtrlPpraCipa.InitializeAs(Self);

  FCtrlIntegraOrcFDO.InitializeAs(Self);               //edilaine - SIG94320
end;

procedure TCtrlParamContabFolha.DoChangeDataBase;
begin
  inherited;
  FCtrlListTerceirosRH.DataBase := DataBase;
  FCtrlBancoPortFolha.DataBase := DataBase;
  FCtrlIntegraRH.DataBase := DataBase;
  FCtrlPpraCipa.DataBase := DataBase;
  FCtrlIntegraOrcFDO.DataBase := DataBase;               //edilaine - SIG94320
end;

procedure TCtrlParamContabFolha.EnviarMensagem(const Processo, TempoDecorrido: WideString;
  NumRegistros, Incremento: Integer; const Msg: WideString);
begin
  try
    DoProgresso([Processo, TempoDecorrido, NumRegistros, Incremento, Msg]);
  except
    on E: Exception do
      MessageInfo := E.Message;
  end;
end;

function TCtrlParamContabFolha.GetTempoDecorrido: string;
begin
  DecodeTime(Time, FH.Hora, FH.Minuto, FH.Segundo, FH.MicroSegundo);
  FH.HoraAtual := FH.MicroSegundo + 1000 * FH.Segundo + 60000 * FH.Minuto + 3600000 * FH.Hora;
  Result := TempoDecorridoHMS(FH.HoraAtual - FH.HoraInicial, false);
end;

function TCtrlParamContabFolha.AbrirQueryPrincipal(FazCAP: boolean): boolean;
var
  _SQL: TStringList;
begin
  _SQL := TStringList.Create;
  try
    with (_SQL) do
    begin
      Clear;
      if not(FTemOutroCC) then // não tem rateio de horas trabalhadas para outros C.Custo
      begin
        Add('SELECT');
        Add('  F.IDAGENCIASALARIO, F.IDEMPRESA, F.CODCENTROCUSTO, H.IDRUBRICA,');
        Add('  F.CODCENTROCUSTO AS CENTCUSTEMPREG,');
        Add('  H.IDPATRO, H.IDPLANOCONTABIL,');
        Add('  H.CODPROVDESC, SUM(H.VALORPROVENTO) AS TOTALPROVENTO');
        Add('FROM');
        Add('  FUNCIONARIO F, '+FNomeTabela+' H,');
        // ------------------------------------------------------------------------------- //
        Add('  (SELECT DISTINCT IDPROVENTO FROM CONTABFOLHA) CF');
        // ------------------------------------------------------------------------------- //
        Add('WHERE');
        Add('  (H.MES       = '+QuotedStr(FAnoMes)+ ') AND');

        if (FListaIdTipoFolha <> '') then
          Add(MontaLinhaSelSQL('  (H.IDMOTIVO',FListaIdTipoFolha,3));

        // Inicio - Monica Gonzaga SOL 188078 kintana 1772223
        if(FListaIdFunc <> '') then
        //Add(MontaLinhaSelSQL('     (F.IDPESSOA',FListaIdFunc,3));
        Add(FU.QuebrarListaFiltro(5, '(F.IDPESSOA ', FListaIdFunc, 500)+ ' AND ');

        if(FListaIdRubrica <> '') then
        Add(MontaLinhaSelSQL('     (CF.IDPROVENTO',FListaIdRubrica,3));

        if(FListaTipoContrato <> '') then
        Add(MontaLinhaSelSQL('     (F.TIPOCONTRATO',FListaTipoContrato,3));
        // FIM - Monica Gonzaga SOL 188078 kintana 1772223

        Add('  (F.IDESTAB   = ' +FloatToStr(FIdEstab)+ ') AND');
        Add('  (H.IDPESSOA    = F.IDPESSOA) AND');
        Add('  (CF.IDPROVENTO = H.IDRUBRICA)');
        Add('GROUP BY');
        Add('  F.IDEMPRESA, F.CODCENTROCUSTO, H.IDRUBRICA, H.CODPROVDESC, F.IDAGENCIASALARIO,');
        Add('  H.IDPATRO, H.IDPLANOCONTABIL');
        Add('ORDER BY');
        Add('  F.IDEMPRESA, F.CODCENTROCUSTO, CENTCUSTEMPREG, H.IDRUBRICA');
      end
      else  // tem rateio de horas trabalhadas para outros C.Custo
      begin
        Add('SELECT');
        Add('  TUDO.IDEMPRESA, TUDO.IDAGENCIASALARIO, TUDO.CODCENTROCUSTO,');
        Add('  TUDO.IDRUBRICA, TUDO.CODPROVDESC,');
        Add('  TUDO.CENTCUSTEMPREG, TUDO.IDPATRO, TUDO.IDPLANOCONTABIL,');
        Add('  ROUND(SUM(TUDO.TOTALPROVENTO),2) AS TOTALPROVENTO');
        Add('FROM');
        // ------------------------------------------------------------------------------- //
        Add('  (SELECT');
        Add('     F.IDEMPRESA, F.IDAGENCIASALARIO, F.CODCENTROCUSTO, H.IDRUBRICA,');
        Add('     F.CODCENTROCUSTO AS CENTCUSTEMPREG,');
        Add('     H.IDPATRO, H.IDPLANOCONTABIL,');
        Add('     H.CODPROVDESC, SUM(H.VALORPROVENTO) AS TOTALPROVENTO');
        Add('   FROM');
        Add('     FUNCIONARIO F, '+FNomeTabela+' H,');
        // ------------------------------------------------------------------------------- //
        Add('     (SELECT DISTINCT IDPROVENTO FROM CONTABFOLHA) CF');
        // ------------------------------------------------------------------------------- //
        Add('   WHERE');
        Add('     (H.MES       = '+QuotedStr(FAnoMes)+ ') AND');

        if (FListaIdTipoFolha <> '') then
          Add(MontaLinhaSelSQL('     (H.IDMOTIVO',FListaIdTipoFolha,4));

        // Inicio - Monica Gonzaga SOL 188078 kintana 1772223
        if(FListaIdFunc <> '') then
        //Add(MontaLinhaSelSQL('     (F.IDPESSOA',FListaIdFunc,4));
        Add(FU.QuebrarListaFiltro(5, '(F.IDPESSOA ', FListaIdFunc, 500)+ ' AND ');

        if(FListaIdRubrica <> '') then
        Add(MontaLinhaSelSQL('     (CF.IDPROVENTO',FListaIdRubrica,4));

          if(FListaTipoContrato <> '') then
        Add(MontaLinhaSelSQL('     (F.TIPOCONTRATO',FListaTipoContrato,4));
        // FIM - Monica Gonzaga SOL 188078 kintana 1772223

        Add('     (F.IDESTAB   = ' +FloatToStr(FIdEstab)+ ') AND');
        Add('     (H.IDPESSOA    = F.IDPESSOA) AND');
        Add('     (CF.IDPROVENTO = H.IDRUBRICA)');
        Add('   GROUP BY');
        Add('     H.IDRUBRICA, H.CODPROVDESC, F.IDEMPRESA, F.CODCENTROCUSTO, F.IDAGENCIASALARIO,');
        Add('     H.IDPATRO, H.IDPLANOCONTABIL');
        // ------------------------------------------------------------------------------- //
        Add('   UNION');
        // ------------------------------------------------------------------------------- //
        Add('   SELECT');
        Add('     HCC.IDEMPRESA, HCC.IDAGENCIASALARIO, HCC.CODCENTROCUSTO, H.IDRUBRICA, HCC.CENTCUSTEMPREG,');
        Add('     H.IDPATRO, H.IDPLANOCONTABIL,');
        Add('     H.CODPROVDESC, (-SUM(H.VALORPROVENTO) * HCC.RATEIO) AS TOTALPROVENTO');
        Add('   FROM');
        Add('     '+FNomeTabela+' H, ');
        // ------------------------------------------------------------------------------- //
        Add('     (SELECT DISTINCT IDPROVENTO FROM CONTABFOLHA) CF,');
        // ------------------------------------------------------------------------------- //
        Add('     (SELECT');
        Add('        F.IDPESSOA, F.IDAGENCIASALARIO, F.IDEMPRESA, F.CODCENTROCUSTO,');
        Add('        F.CODCENTROCUSTO AS CENTCUSTEMPREG,');
        Add('        TO_NUMBER(DECODE(HC.FLGCARGATOTAL,1,1,SUM(HC.HORASTRAB)/HT.JORNADAMENSAL)) AS RATEIO');
        Add('      FROM');
        Add('        HORATRABOUTROCC HC, FUNCIONARIO F, HORATRAB HT');
        Add('      WHERE');
        Add('        (');
        Add('          (TO_CHAR(HC.DATATRAB,''YYYY/MM'')    = ' +QuotedStr(FAnoMes)+ ') OR');
        Add('          (');
        Add('            (TO_CHAR(HC.DATATRAB,''YYYY/MM'') <= ' +QuotedStr(FAnoMes)+ ') AND');
        Add('            (HC.FLGPERMANENTE                  = 1)');
        Add('          )');
        Add('        ) AND');
        Add('        (HC.FLGRATEIO = 1) AND');
        Add('        (HC.IDPESSOA  = F.IDPESSOA) AND');
        Add('        (F.IDESTAB   = ' +FloatToStr(FIdEstab)+ ') AND');
        Add('        (F.IDHORARIO  = HT.IDHORARIO)');
        Add('      GROUP BY');
        Add('        F.IDPESSOA, F.IDEMPRESA, F.CODCENTROCUSTO, HT.JORNADAMENSAL,');
        Add('        HC.FLGCARGATOTAL, F.IDAGENCIASALARIO) HCC');
        // ------------------------------------------------------------------------------- //
        Add('   WHERE');
        Add('     (H.MES       = ' +QuotedStr(FAnoMes)+ ') AND');

        if (FListaIdTipoFolha <> '') then
          Add(MontaLinhaSelSQL('     (H.IDMOTIVO',FListaIdTipoFolha,4));

        // Inicio - Monica Gonzaga SOL 188078 kintana 1772223
        if(FListaIdFunc <> '') then
        //Add(MontaLinhaSelSQL('     (F.IDPESSOA',FListaIdFunc,4));
        Add(FU.QuebrarListaFiltro(5, '(F.IDPESSOA ', FListaIdFunc, 500)+ ' AND ');

        if(FListaIdRubrica <> '') then
        Add(MontaLinhaSelSQL('     (CF.IDPROVENTO',FListaIdRubrica,4));

        if(FListaTipoContrato <> '') then
        Add(MontaLinhaSelSQL('     (F.TIPOCONTRATO',FListaTipoContrato,4));
        // FIM - Monica Gonzaga SOL 188078 kintana 1772223

        Add('     (H.IDPESSOA    = HCC.IDPESSOA) AND');
        Add('     (CF.IDPROVENTO = H.IDRUBRICA)');
        Add('   GROUP BY');
        Add('     H.IDRUBRICA, H.CODPROVDESC, HCC.IDEMPRESA, HCC.CODCENTROCUSTO,');
        Add('     HCC.RATEIO, HCC.IDAGENCIASALARIO, HCC.CENTCUSTEMPREG,');
        Add('     H.IDPATRO, H.IDPLANOCONTABIL');
        // ------------------------------------------------------------------------------- //
        Add('   UNION');
        // ------------------------------------------------------------------------------- //
        Add('   SELECT');
        Add('     HCC.IDEMPRESA, HCC.IDAGENCIASALARIO, HCC.CODCENTROCUSTO, H.IDRUBRICA, HCC.CENTCUSTEMPREG,');
        Add('     H.IDPATRO, H.IDPLANOCONTABIL,');
        Add('     H.CODPROVDESC, (SUM(H.VALORPROVENTO) * HCC.RATEIO) AS TOTALPROVENTO');
        Add('   FROM');
        Add('     '+FNomeTabela+' H, ');
        // ------------------------------------------------------------------------------- //
        Add('     (SELECT DISTINCT IDPROVENTO FROM CONTABFOLHA) CF,');
        // ------------------------------------------------------------------------------- //
        Add('     (SELECT');
        Add('        F.IDPESSOA, F.IDAGENCIASALARIO, HC.IDEMPRESA, HC.CODCENTROCUSTO,');
        Add('        F.CODCENTROCUSTO AS CENTCUSTEMPREG,');
        Add('        TO_NUMBER(DECODE(HC.FLGCARGATOTAL,1,1,SUM(HC.HORASTRAB)/HT.JORNADAMENSAL)) AS RATEIO');
        Add('      FROM');
        Add('        HORATRABOUTROCC HC, FUNCIONARIO F, HORATRAB HT');
        Add('      WHERE');
        Add('        (');
        Add('          (TO_CHAR(HC.DATATRAB,''YYYY/MM'')    = ' +QuotedStr(FAnoMes)+ ') OR');
        Add('          (');
        Add('            (TO_CHAR(HC.DATATRAB,''YYYY/MM'') <= ' +QuotedStr(FAnoMes)+ ') AND');
        Add('            (HC.FLGPERMANENTE                  = 1)');
        Add('          )');
        Add('        ) AND');
        Add('        (HC.FLGRATEIO = 1) AND');
        Add('        (HC.IDPESSOA  = F.IDPESSOA) AND');
        Add('        (F.IDESTAB   = ' +FloatToStr(FIdEstab)+ ') AND');
        Add('        (F.IDHORARIO  = HT.IDHORARIO)');
        Add('      GROUP BY');
        Add('        F.IDPESSOA, HC.IDEMPRESA, HC.CODCENTROCUSTO, HT.JORNADAMENSAL,');
        Add('        HC.FLGCARGATOTAL, F.IDAGENCIASALARIO, F.CODCENTROCUSTO) HCC');
        Add('   WHERE');
        Add('     (H.MES         = ' +QuotedStr(FAnoMes)+ ') AND');

        if (FListaIdTipoFolha <> '') then
          Add(MontaLinhaSelSQL('     (H.IDMOTIVO',FListaIdTipoFolha,4));

        // Inicio - Monica Gonzaga SOL 188078 kintana 1772223
        if(FListaIdFunc <> '') then
        Add(MontaLinhaSelSQL('     (F.IDPESSOA',FListaIdFunc,4));

        if(FListaIdRubrica <> '') then
        Add(MontaLinhaSelSQL('     (CF.IDPROVENTO',FListaIdRubrica,4));

        if(FListaTipoContrato <> '') then
        Add(MontaLinhaSelSQL('     (F.TIPOCONTRATO',FListaTipoContrato,4));
        // FIM - Monica Gonzaga SOL 188078 kintana 1772223

        Add('     (H.IDPESSOA    = HCC.IDPESSOA) AND');
        Add('     (CF.IDPROVENTO = H.IDRUBRICA)');
        Add('   GROUP BY');
        Add('     H.IDRUBRICA, H.CODPROVDESC, HCC.IDEMPRESA, HCC.CODCENTROCUSTO,');
        Add('     H.IDPATRO, H.IDPLANOCONTABIL,');
        Add('     HCC.RATEIO, HCC.IDAGENCIASALARIO, HCC.CENTCUSTEMPREG');
        Add('  ) TUDO');
        // ------------------------------------------------------------------------------- //
        Add('GROUP BY');
        Add('  IDEMPRESA, CODCENTROCUSTO, IDRUBRICA, CODPROVDESC, IDAGENCIASALARIO, CENTCUSTEMPREG,');
        Add('  IDPATRO, IDPLANOCONTABIL');
        Add('ORDER BY');
        Add('  IDEMPRESA, CODCENTROCUSTO, IDRUBRICA, CODPROVDESC, CENTCUSTEMPREG');
      end;
     //SaveToFile('C:\Planus\Temp\IntegraçãoCAP.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;
    DoProgresso([MSG_SEL_DADOS_PESSOAS]);
    FCdsPrincipal.Data := GetDataPacket(_SQL);
    DoProgresso(['', '', FCdsPrincipal.RecordCount + 1 + IFF(FazCAP, 1, 0)]);

    Result := not(FCdsPrincipal.IsEmpty);
    if not(Result) then
      MessageInfo := MSG_ERRO_SEL_DADOS_PESSOAS;
  finally
    _SQL.Free;
  end;
end;

function TCtrlParamContabFolha.GerarIntegracao(
  FazCAP, FazContab, Consolida: boolean; Mes, Ano: integer;
  DataEmissao, DataPagamento: TDateTime; IdEmpresa, IdModulo, IdUsuario: integer;
  IdEstab: double; ListaIdTipoFolha, ListaTipoDesemb, TipoOperacao: string;
  ListaIdRubrica,ListaIdFunc : string;
  Previa, CancelProcRubIncompleta, RateioCC, ObrigaAbc, ObrigaCRespon: boolean;
  PlanoPrevGlobal, PatroGlobal, CodTipDoc: integer; UsaPlanoPatro: boolean;
  IdPatro, IdPlanoPrev: integer; ConsTipoDesemb, MantemCCusto: boolean): boolean;
var
  iIdPlano, iUltIdEmpresa: integer;
  bTransacaoAberta: boolean;
  sFiltro: string;

begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GerarIntegracaoContabCAP(
      FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, FazCAP, FazContab, Consolida, Mes, Ano,
      DataEmissao, DataPagamento, IdEmpresa, IdModulo, IdUsuario, IdEstab, ListaIdTipoFolha,
      ListaTipoDesemb, TipoOperacao, Previa, CancelProcRubIncompleta, RateioCC, ObrigaAbc,
      ObrigaCRespon, PlanoPrevGlobal, PatroGlobal, CodTipDoc, UsaPlanoPatro, IdPatro,
      IdPlanoPrev, ConsTipoDesemb, MantemCCusto);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := false;
    bTransacaoAberta := false;
    FLocalErro := ERRO_GENERICO;

    DecodeTime(Time, FH.Hora, FH.Minuto, FH.Segundo, FH.MicroSegundo);
    FH.HoraInicial := FH.MicroSegundo + 1000 * FH.Segundo + 60000 * FH.Minuto + 3600000 * FH.Hora;
    try
      FCdsPrincipal := TCMClientDataSet.Create(nil);
      FCdsContabFolha := TCMClientDataSet.Create(nil);
      if (FazCAP) then
        FCdsDocumentos := TCMClientDataSet.Create(nil);

      if (Previa) then
        FNomeTabela := 'PREVIAFOLPAG'
      else
        FNomeTabela := 'HISTRUBSAL';

      FUsaPlanoPatro := UsaPlanoPatro;
      FCancelProcRubIncompleta := CancelProcRubIncompleta;
      FIdEmpresa := IdEmpresa;
      FIdEstab := IdEstab;
      FIdModulo := IdModulo;
      FIdUsuario := IdUsuario;
      FIdPatro := IdPatro;
      FIdPlanoPrev := IdPlanoPrev;

      // Alex - este será o plano (PLANPREVCONTAB) a ser utizado no lançamento contábil
      // para que este processo funcione é necessário que o usuário parametrize as contas a débito e crédito
      // sempre em conjunto, ou seja, para um débito um crédito correspondente. Lançamentos múltiplos não vão funcionar.
      rProgramaSegrega.iPlanoPrevCont := -1;
      rProgramaSegrega.iIdSegregaCriter := -1;
      rProgramaSegrega.sContaPrograma := '';
      rProgramaSegrega.sContaSegregacao := '';

      FAnoMes := IntToStr(Ano) +'/'+ PoeZero(Mes);
      FDataRef := IntToStr(TrazUltDiaMes(Mes, Ano)) +'/'+ PoeZero(Mes) +'/'+ IntToStr(Ano);
      FPlnCodigo := 0;
      FListaPlnCodigo := '';
      iUltIdEmpresa := 0;
      iIdPlano := 0;

      FListaIdTipoFolha := ListaIdTipoFolha;
      FListaTipoDesemb := ListaTipoDesemb;

      FListaIdFunc := ListaIdFunc;
      FListaIdRubrica := ListaIdRubrica;

      // FHBS - SOL 218135 / KTN 2049538 - Inicio
      // Foi implementado a validaçaõ abaixo pois a rotina não sera processada
      // para ambos os processoas ao mesmo tempo, ou seja, ou FazCAP ou FazContab.
      // Quando for processar a Contabilização, deverá ser feito para todas as rubricas e empregrados
      if (FazContab) and (Trim(FListaIdFunc) = '') and (Trim(FListaIdRubrica) = '') then
      begin
        FListaTipoContrato := '';
      end;
      // FHBS - SOL 218135 / KTN 2049538 - Fim

      FRateioCC := RateioCC;
      FMantemCCusto := MantemCCusto;

      FCtrlIntegraRH.CdsDocumentos := FCdsDocumentos;
      FCtrlIntegraRH.ObrigaAbc := ObrigaAbc;
      FCtrlIntegraRH.ObrigaCRespon := ObrigaCRespon;
      FCtrlIntegraRH.IdModulo := FIdModulo;
      FCtrlIntegraRH.IdUsuario := FIdUsuario;
      FCtrlIntegraRH.CodTipDoc := CodTipDoc;
      FCtrlIntegraRH.ConsTipoDesemb := ConsTipoDesemb;

      try
        // Verifica se algum empregado trabalhou em outros Centros de Custo no Mês
        FTemOutroCC := VerificaTemOutroCC;

        // Montar Query Principal
        if not(AbrirQueryPrincipal(FazCAP)) then
          raise Exception.Create(MessageInfo);

        FCdsContabFolha.Filter := '';
        FCdsContabFolha.Data := ListContabFolha;
        FCdsContabFolha.Filtered := true;

        EnviarMensagem('', GetTempoDecorrido, FCdsPrincipal.RecordCount);

        // Obter dados auxiliares para a geração da(s) AP(s)
        if (FazCAP) then
        begin
          if not(FCtrlIntegraRH.AbrirQueryDocumentos) then
            raise Exception.Create(MessageInfo);

          FPortadorFormaPadrao := FCtrlBancoPortFolha.GetCodPortFormaPadrao;
        end;

        EnviarMensagem(MSG_PROCESSANDO);

        // Início da Transação
        StartTransaction;
        bTransacaoAberta := true;

        FCdsPrincipal.First;

        // LOOP para a geração da Linhas de Integração
        while not(FCdsPrincipal.EOF) do
        begin
          FIdRubrica      := FCdsPrincipal.FieldByName('IDRUBRICA').asFloat;
          FCodCentroCusto := FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString;
          FCentroCustoEmp := FCdsPrincipal.FieldByName('CENTCUSTEMPREG').asString;
          FIdEmpresa      := FCdsPrincipal.FieldByName('IDEMPRESA').asInteger;
          FIdPatroTmp     := FCdsPrincipal.FieldByName('IDPATRO').asInteger;
          FIdPlanoTmp     := FCdsPrincipal.FieldByName('IDPLANOCONTABIL').asInteger;

          if (iUltIdEmpresa <> FIdEmpresa) then
          begin
            FCtrlIntegraRH.IdEmpresa := FIdEmpresa;
            FCdsEmpresa.Data := FCtrlPpraCipa.ListEmpresaProp(FIdEmpresa);
            EnviarMensagem('','',0,0,'Empresa: '+ FCdsEmpresa.FieldByName('NOME').asString);

            if (FPlnCodigo > 0) then
            begin
              FListaPlnCodigo := FListaPlnCodigo +
                'Empresa: '+ FCdsEmpresa.FieldByName('NOME').asString +CR_LF+
                ',  Planilha Nº: '+
                FloatToStr(FCtrlListTerceirosRH.GetNumPlanilha(FPlnCodigo))+CR_LF;
            end;

            // Alex 12/11 independente se contabiliza ou não é necessário verificar o plano de contas atual
            //if (FazCAP) then // Obtém o ID do Plano de Contas
            iIdPlano := FCtrlListTerceirosRH.GetPlano(FIdEmpresa);
            // alex  passar o plano de contas
            // Obtém as Contas Contábeis x Centros de Custo
            FCdsContasCC.Data := FCtrlListTerceirosRH.ListContasCCusto(FIdEmpresa, iIdPlano);

            FPlnCodigo := 0;
            iUltIdEmpresa := FIdEmpresa;
          end;

          sFiltro :=
            '(IDPROVENTO = ' +FloatToStr(FIdRubrica)+ ') AND '+
            '((IDPESSDEBITO IS NULL) OR (IDPESSDEBITO = ' +IntToStr(FIdEmpresa)+ ')) AND '+
            '((IDPESSCREDITO IS NULL) OR (IDPESSCREDITO = ' +IntToStr(FIdEmpresa)+ ')) AND ';

          FCdsContabFolha.Filter := sFiltro +
            '(CODCENTROCUSTO = ' +QuotedStr(FCodCentroCusto)+ ') AND '+
            '(IDEMPRESA = ' +IntToStr(FIdEmpresa)+ ')';

          if (FCdsContabFolha.IsEmpty) then
          begin
            FCodCentroCusto := '';
            FCdsContabFolha.Filter := sFiltro + '(CODCENTROCUSTO IS NULL)';
          end;

          if not(FCdsContabFolha.IsEmpty) then
          begin
            if (FazContab) then
            begin
              // Alex 12/12 passando os campos: rProgramaSegrega.iPlanoPrevCont, rProgramaSegrega.iIdSegregaCriter, sContaPrograma, sContaSegregacao
              // para otimizar o programa
              if not(GerarContabilidade(TipoOperacao, Consolida)) then
              begin
                FLocalErro := ERRO_CONTAB;
                raise Exception.Create(MessageInfo);
              end;
             end;
          end;

          // Felipe A. Santos SOL 188078 kintana 1772223

          FCdsContabFolha.Filter := FCdsContabFolha.Filter + ' AND (CODTIPRECDES <> '''')';

          if not(FCdsContabFolha.IsEmpty) and (FazCAP) and
             ((FListaIdRubrica = '') or (Pos(QuotedStr(FloatToStr(FIdRubrica)),FListaIdRubrica) > 0)) then // FHBS - SOL 218135 / KTN 2049538
          begin
            FRateio := GetNumRateio; // reateio o valor da rubrica por desembolso
            FVlrProvento := FCdsPrincipal.FieldByName('TOTALPROVENTO').AsFloat;
            FVlrRateio := Truncar((FVlrProvento / FRateio), 2);

            FCdsContabFolha.First;
            while not(FCdsContabFolha.Eof) do
            begin
              if (Trim(FCdsContabFolha.FieldByName('CODTIPRECDES').asString) <> '') and
                 (VerificaCodigoEm(FListaTipoDesemb,
                  Trim(FCdsContabFolha.FieldByName('CODTIPRECDES').asString), ',') = 1) then
              begin
                FCdsPrincipal.Edit;

                // joga o valor + a sobra no ultimo registro
                if (FCdsContabFolha.RecNo <> FRateio) then
                   FCdsPrincipal.FieldByName('TOTALPROVENTO').AsFloat := FVlrRateio
                else
                   FCdsPrincipal.FieldByName('TOTALPROVENTO').AsFloat := FVlrProvento;

                FCdsPrincipal.Post;

                if not(GerarCAP(iIdPlano)) then
                begin
                    FLocalErro := ERRO_CAP;
                    raise Exception.Create(MessageInfo);
                end;

                FVlrProvento := FVlrProvento - FVlrRateio; // para calcular a sobra e jogar no ultimo documento
              end;

              FCdsContabFolha.Next;
            end;
          end;
          FCdsPrincipal.Next; // Felipe A. Santos SOL 216235 kintana 2045698
          EnviarMensagem('', GetTempoDecorrido, 0, 1); // // Felipe A. Santos SOL 216235 kintana 2045698
        end;

        // Felipe A. Santos SOL 188078 kintana 1772223 - fim

        // inicio do comentário Felipe A. Santos SOL 188078 kintana 1772223
        {if not(FCdsContabFolha.IsEmpty) then
         begin
              if (Trim(FCdsContabFolha.FieldByName('CODTIPRECDES').asString) <> '') and
                 (VerificaCodigoEm(FListaTipoDesemb,
                  Trim(FCdsContabFolha.FieldByName('CODTIPRECDES').asString), ',') = 1) then
              begin
                if not(GerarCAP(iIdPlano)) then
                begin
                  FLocalErro := ERRO_CAP;
                  raise Exception.Create(MessageInfo);
                end;
              end;
          end;

              FCdsPrincipal.Next;
              EnviarMensagem('', GetTempoDecorrido, 0, 1);
          end;
         } // fim do comentário Felipe A. Santos SOL 188078 kintana 1772223

        if (FPlnCodigo > 0) then
        begin
          FCdsEmpresa.Data := FCtrlPpraCipa.ListEmpresaProp(FIdEmpresa);
          FListaPlnCodigo := FListaPlnCodigo + 'Empresa: '+
            FCdsEmpresa.FieldByName('NOME').asString+
            ',  Planilha Nº: '+
            FloatToStr(FCtrlListTerceirosRH.GetNumPlanilha(FPlnCodigo))+CR_LF;
        end;

        //edilaine - 94320/95404: inicio
        if (FPlnCodigo > 0) and
           (FCtrlIntegraOrcFDO.IntegraOrcON(sistema.IdModulo, 'C')) Then
        begin

          //verifica mas nao para o processo
          //if FCtrlIntegraOrcFDO.VerificaSaldoFDO(Trunc(FPlnCodigo), false) then
          begin
            {inserir documento na fila para envio de dados após commit}
            if not FCtrlIntegraOrcFDO.InsereDocumentoFilaFDO(-1,
                                                             Sistema.IdModulo,
                                                             Trunc(FPlnCodigo),
                                                             FDataRef,  //_Documento.DataProgramada.AsString,
                                                             'D',
                                                             'P',
                                                             FCdsPrincipal.FieldByName('TOTALPROVENTO').AsFloat
                                                            ) then
               Raise Exception.Create( FCtrlIntegraOrcFDO.MessageInfo );

            FCtrlIntegraOrcFDO.EnviaDadosFDO(-1, Trunc(FPlnCodigo));
          {end
          else
          begin
            FCtrlIntegraOrcFDO.ExcluiDocumentoFilaFDO(-1, Trunc(FPlnCodigo));
            MessageInfo := FCtrlIntegraOrcFDO.MessageInfo; }
          end;
        end;
        //edilaine - 94320/95404: fim


        if (FazCAP) then
        begin
          EnviarMensagem(MSG_GRAVANDO_CAP);
          // Gravo no Banco os Documentos
          if not(FCtrlIntegraRH.GravarDocumentos(false, 0, FPortadorFormaPadrao,
              DataEmissao, DataPagamento, RateioCC, UsaPlanoPatro, PlanoPrevGlobal,
              PatroGlobal,0,'')) then
            raise Exception.Create(FCtrlIntegraRH.MessageInfo);

          EnviarMensagem('', GetTempoDecorrido, 0, 1);
          FCdsDocumentos.EmptyDataSet;         
        end;

        Commit;
        EnviarMensagem('', GetTempoDecorrido, 0, 1);

        if (FazContab) then
        begin
          MessageInfo := 'a Contabilização';// Felipe A. Santos SOL 188078 kintana 1772223 - acrescentado um (a) na mensagem
          EnviarMensagem('', '', 0, 0,
            '[Ok] Geração da integração com a Contabilidade.'+CR_LF+
            FListaPlnCodigo+
            Replicate('-',50));
        end;

        if (FazCAP) then
        begin
          MessageInfo := MessageInfo +IFF(MessageInfo='','',' e ')+ 'Contas a Pagar';
          EnviarMensagem('', '', 0, 0,
            '[Ok] Geração da integração com o Contas a Pagar.'+CR_LF+
            'Documento(s) Nº.: ' +FCtrlIntegraRH.NumDocGerados+CR_LF+
            Replicate('-',50));
        end;

        MessageInfo := 'Integração com ' +MessageInfo+ ' realizada com sucesso.';

        Result := true;
      except
        on E: Exception do
        begin
          if (bTransacaoAberta) then
            Rollback;

          MessageInfo := MSG_ERRO_GERACAO_CAP;
          EnviarMensagem('', '', 0, 0,
            '[Erro] Geração da integração' +
            IFF(FLocalErro=ERRO_CONTAB, ' com a Contabilidade',
              IFF(FLocalErro=ERRO_CAP, ' com o contas a Pagar', ''))+ '.'+CR_LF+
            E.Message +CR_LF+ Replicate('-',50));
        end;
      end;
    finally
      FCdsPrincipal.Free;
      FCdsContabFolha.Free;
      if (FazCAP) then
        FCdsDocumentos.Free;

    end;
    EnviarMensagem('', GetTempoDecorrido);
  end;
end;


function TCtrlParamContabFolha.GerarContabilidade(TipoOperacao: string; Consolida: boolean): boolean;
var
  SvNum: TBookMark;
  sCodCentroCustoAux, FSalvaContaDebito, FSalvaCodCentroCustoDebito: string;
  dCodSubContaDeb, dCodSubContaCre: double;
  bTemContaCC, bTemAlguma, bBookMark, bPartidaDobrada: boolean;
  // Alex 12/11 armazenar o plano e patro a contabilizar
  sPrograma, sContaBasePrograma, sContaBaseSegregacao: string;

  // Alterado por Arnaldo V. Scarin em 01/06/2011
  // SOL 154381 - KTN: 1186492
  iIdPlanoPrev, iIdPatro : Double;
  sRubricas,sRubIndiv : String;
begin
  bBookMark := false;
  bTemAlguma := false;
  bTemContaCC := false;
  bPartidaDobrada := ParamIntegra.PartidaDobrada;
  SvNum := FCdsContabFolha.GetBookMark;

  { Flávio Nogueira Sol 156058/4981
    21/06/2011 }

  FUnidNegoc:=GetAtividadeProgeto() ; // Verifica se existe Atividade Vinculada na CONTABFOLHA

  if FUnidNegoc  <=0 then    // Caso não exista ele pegar o Valor Delfault Global
     FUnidNegoc:=ParamIntegra.UnidNegoc; // Unidade de Negócio


  // Alterado por Arnaldo V. Scarin em 01/06/2011
  // SOL 154381 - KTN: 1186492
  sRubricas := '39980*39981*39355*39097*39938*39937*39099*39868*39966*39982*39983*'+
               '39524*39869*39967*39521*39870*39968*00450*39871*36480*36479*39873*'+
               '36732*39872*39867*39123*39101*39520*'+
               '40848*40850*40852*40854';           //edilaine SIG114503

  sRubIndiv := Format('%.5d',[trunc(FidRubrica)]);

  // Alterado por Arnaldo V. Scarin em 01/06/2011
  // SOL 154381 - KTN: 1186492
  If (Pos(sRubIndiv,sRubricas) <> 0) then
  begin
    iIdPlanoPrev := FIdPlanoPrev;
    iIdPatro     := FIdPatro;
  end
  else
  begin
    iIdPlanoPrev :=  IFF(FIdPlanoTmp > 0, FIdPlanoTmp, FIdPlanoPrev);
    iIdPatro     := IFF(FIdPlanoTmp > 0, FIdPatroTmp, FIdPatro);
  end;


  try
    sCodCentroCustoAux := FCodCentroCusto; // Salva Código do Centro de Custo
    FCdsContabFolha.First;
    while not(FCdsContabFolha.EOF) do
    begin
      bTemContaCC := false;
      if (Trim(FCdsContabFolha.FieldByName('CONTADEBITO').asString) <> '') then
      begin
        bTemAlguma := true;
        bTemContaCC :=
          (FCodCentroCusto = FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString) or
          (FCdsContasCC.Locate('PLANO;PLACONTA;IDEMPRESA;CODCENTROCUSTO',
           VarArrayOf([FCdsContabFolha.FieldByName('IDPLANO2').asInteger,
                       FCdsContabFolha.FieldByName('CONTADEBITO').asString,
                       FIdEmpresa,
                       FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString]), []));

        if (bTemContaCC) then
        begin
          bBookMark := false;
          break;
        end
        else
        begin
          SvNum := FCdsContabFolha.GetBookMark;
          bBookMark := (FCodCentroCusto = '') or
            (not(FCdsContasCC.Locate('PLANO;PLACONTA',
                 VarArrayOf([FCdsContabFolha.FieldByName('IDPLANO2').asInteger,
                             FCdsContabFolha.FieldByName('CONTADEBITO').asString]), [])));
        end;
      end;
      FCdsContabFolha.Next;
    end;

    if not(bTemContaCC) and not(bBookMark) then
    begin
      FCdsContabFolha.First;
      while not(FCdsContabFolha.EOF) do
      begin
        bTemContaCC := false;
        if (Trim(FCdsContabFolha.FieldByName('CONTADEBITO').asString) <> '') then
        begin
          bTemAlguma := true;
          bTemContaCC :=
            (FCodCentroCusto = FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString) or
            (FCdsContasCC.Locate('PLANO;PLACONTA;IDEMPRESA;CODCENTROCUSTO',
             VarArrayOf([FCdsContabFolha.FieldByName('IDPLANO2').asInteger,
                         FCdsContabFolha.FieldByName('CONTADEBITO').asString,
                         FIdEmpresa,
                         FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString]), []));

          if (bTemContaCC) then
          begin
            bBookMark := false;
            break;
          end
          else
          begin
            bTemContaCC :=
              (FCodCentroCusto = '') and
              (FCdsContasCC.Locate('PLANO;PLACONTA',
               VarArrayOf([FCdsContabFolha.FieldByName('IDPLANO2').asInteger,
                           FCdsContabFolha.FieldByName('CONTADEBITO').asString]), []));

            if (bTemContaCC) then
            begin
              FCodCentroCusto := FCdsContasCC.FieldByName('CODCENTROCUSTO').asString;
              bBookMark := false;
              break;
            end
            else
            begin
              SvNum := FCdsContabFolha.GetBookMark;
              bBookMark := (FCodCentroCusto = '') or
                (not(FCdsContasCC.Locate('PLANO;PLACONTA',
                     VarArrayOf([FCdsContabFolha.FieldByName('IDPLANO2').asInteger,
                                 FCdsContabFolha.FieldByName('CONTADEBITO').asString]), [])));
            end;
          end;
        end;
        FCdsContabFolha.Next;
      end;
    end;

    if (bBookMark) then
      FCdsContabFolha.GotoBookMark(SvNum);

    if (bBookMark) or (bTemContaCC) then
    begin
      //--------------------------------------------------------------------------------------
      // INÍCIO
      // definir plano a ser lançado:
      //    se carimbo, plano adm ou plano comum
      // definir também critério para segregação
      //--------------------------------------------------------------------------------------
      // os métodos para definir segregação e plano/programa obrigam que o usuário parametrize
      // sempre um débito para um crédito correspondente
      if not FCtrlSegregacao.SegregaVirtual then begin

         // se a segregação não estiver ativa decidir se o plano será um carimbo ou o plano de operações comuns

         // Alterado por Arnaldo V. Scarin em 01/06/2011
         // SOL 154381 - KTN: 1186492
         rProgramaSegrega.iPlanoPrevCont := trunc(iIdPlanoPrev);

      end else begin

         // definir o plano previdenciário a ser utilizado
         // nesta condição o plano a ser contabilizado é um carimbo que provavelmente veio de uma contribuição ou empréstimo
         if (FIdPlanoTmp <> FCtrlSegregacao.PlanoPrevComum) and (FIdPlanoTmp <> FCtrlSegregacao.PlanoPrevAdm) and (FIdPlanoTmp <> 0) then begin
            rProgramaSegrega.iPlanoPrevCont   := FIdPlanoTmp;
            rProgramaSegrega.sContaPrograma   := '';
            rProgramaSegrega.iIdSegregaCriter := -1;
            rProgramaSegrega.sContaSegregacao := '';
         end else begin

            case FCdsContabFolha.FieldByName('FLGDESCONTO').AsInteger of
               0: begin  // PROVENTO
                     sContaBasePrograma   := FCdsContabFolha.FieldByName('CONTACREDITO').asString;
                     sContaBaseSegregacao := FCdsContabFolha.FieldByName('CONTADEBITO').asString;
                  end;
               1: begin // DESCONTO
                     sContaBasePrograma   := FCdsContabFolha.FieldByName('CONTADEBITO').asString;
                     sContaBaseSegregacao := FCdsContabFolha.FieldByName('CONTACREDITO').asString;
                  end;
            else
               sContaBasePrograma   := FCdsContabFolha.FieldByName('CONTACREDITO').asString;
               sContaBaseSegregacao := FCdsContabFolha.FieldByName('CONTADEBITO').asString;
            end;

            // aqui não temos carimbo, é necessário verificar tanto o plano quanto o critério para segregação
            // somente será necessário determinar o programa se o plano administrativo estiver preenchido, caso contrário o plano será o comum mesmo
            if FCtrlSegregacao.PlanoPrevAdm <=  0 then begin
               rProgramaSegrega.iPlanoPrevCont := FCtrlSegregacao.PlanoPrevComum;
               // não é necessário zerar as variáveis de controle aqui
            end else begin
               // definir plano a lançar
               if (rProgramaSegrega.sContaPrograma = '') or // conta de verificação do programa anterior não está preenchida. Iniciar uma verificação
                  (rProgramaSegrega.sContaPrograma <> copy(sContaBasePrograma,1, length(rProgramaSegrega.sContaPrograma))) then begin // a conta sendo verificada é a mesma conta verificada anteriormente

                  // determinar o programa a ser utilizado
                  // o result da função RetornaPrograma é o próprio IdPrograma encontrado
                  if FCtrlSegregacao.RetornaPrograma (FCdsContabFolha.FieldByName('IDPLANO1').asInteger,
                                                      sContaBasePrograma,
                                                      rProgramaSegrega.sContaPrograma,     // esta variável é por referência, se alterou o programa a própria variável já está alterada
                                                      sPrograma) <> -1 then begin
                     if sPrograma = 'INV' then begin
                        rProgramaSegrega.iPlanoPrevCont := FCtrlSegregacao.PlanoPrevComum;
                        // não é necessário atribuir a variável scontaPrograma pois o método RetornaPrograma já faz isto
                        // rProgramaSegrega.sContaPrograma :=
                     end else begin
                        if sPrograma = 'ADM' then begin
                           // O plano adminstrativo pode não esta parametrizado
                           rProgramaSegrega.iPlanoPrevCont := FCtrlSegregacao.PlanoPrevAdm;
                           // não é necessário atribuir a variável scontaPrograma pois o método RetornaPrograma já faz isto
                           // rProgramaSegrega.sContaPrograma :=
                        end;
                     end;
                  end else begin
                     // não foi encontrado a parametrização do programa, neste caso o plano default é o administrativo
                     rProgramaSegrega.iPlanoPrevCont := FCtrlSegregacao.PlanoPrevAdm;
                     // zerar as variáveis de controle para a próxima busa iniciar novamente
                     rProgramaSegrega.sContaPrograma := '';
                  end;
               end;
            end;

            // Procurar o critério para segregação na conta débito
            //    Se achou utilizar este critério também para o crédito
            //    Senão Procurar o critério para segregação na conta crédito
            //       Se achou utilizar este critério também para o débito
            //       Senão passar -1 tanto para o débito quanto para o crédito
            if (rProgramaSegrega.iIdSegregaCriter = -1) or // não há critério selecionado
               (rProgramaSegrega.sContaSegregacao = '') or // conta de verificação da segregação anterior não está preenchida. Iniciar uma verificação
               (rProgramaSegrega.sContaSegregacao <> copy(sContaBaseSegregacao,1, length(rProgramaSegrega.sContaSegregacao))) then begin // a conta sendo verificada é diferente da conta verificada anteriormente

               rProgramaSegrega.iIdSegregaCriter := FCtrlSegregacao.RetornaSegregaCriter(
                  FCdsContabFolha.FieldByName('IDPLANO1').asInteger,      // plano contábil ativo
                  rProgramaSegrega.iPlanoPrevCont,
                  // em primeira vista parece que o iff (idplanotmp está errado, deveria ser iff (idpatrotmp... mas não no select feito
                  // na cbs todas as patrostmp estão com o valor de 1, desta forma a pergunta está correta

                  // Alterado por Arnaldo V. Scarin em 01/06/2011
                  // SOL 154381 - KTN: 1186492
                  trunc(iIdPatro), // ID da Patrocinadora
                  sContaBaseSegregacao,
                  rProgramaSegrega.sContaSegregacao);  // retorna em que conta contábil foi encontrado o critério
            end;
         end;
      end;
      //--------------------------------------------------------------------------------------
      // FIM
      // definir plano a ser lançado:
      //    se carimbo, plano adm ou plano comum
      // definir também critério para segregação
      //--------------------------------------------------------------------------------------

      if (FCdsContabFolha.FieldByName('CODSUBDEBITO').IsNull) then
        dCodSubContaDeb := 0
      else
        dCodSubContaDeb := FCdsContabFolha.FieldByName('CODSUBDEBITO').asFloat;

      if (FCodCentroCusto = '') then
        FCodCentroCusto := FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString;

      if (bPartidaDobrada) then
      begin
          FSalvaContaDebito := FCdsContabFolha.FieldByName('CONTADEBITO').asString;
          FSalvaCodCentroCustoDebito := FCodCentroCusto;
      end
      else
      begin   // Não é  Partida Dobrada, lança Débito
        if (FCtrlLancamento.InsereLancaContab(
            '0', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
            FIdEmpresa, // Empresa
            FIdModulo, // Módulo de Origem
            FIdUsuario, // Usuário Ativo
            FCdsContabFolha.FieldByName('IDPLANO2').asFloat, // Plano de Contas
            FUnidNegoc, // Unidade de Negócio
            dCodSubContaDeb, // Sub-Conta de Débito
            0, // Sub-Conta de Crédito
            // Alex 11/12 IFF(FIdPlanoTmp > 0, FIdPlanoTmp, FIdPlanoPrev), // ID do Plano Previdenciário
            rProgramaSegrega.iPlanoPrevCont,

            // Alterado por Arnaldo V. Scarin em 01/06/2011
            // SOL 154381 - KTN: 1186492
            iIdPatro, // ID da Patrocinadora
            FPlnCodigo, // Número da Planilha
            0, // Número do Lançamento
            FDataRef, // Data do Lançamento
            FAnoMes, // Número do Documento
            'CONT FOLHA PAGTO '+ FCdsPrincipal.FieldByName('CODPROVDESC').asString +' '+
              FCdsContabFolha.FieldByName('DESCRICAO').asString +' '+ FAnoMes, // 1ª Linha da Histórico
            '', // 2ª Linha da Histórico
            '', // 3ª Linha da Histórico
            '', // 4ª Linha da Histórico
            '', // 5ª Linha da Histórico
            TipoOperacao, // Tipo de Operação Indicado
            IFF(FMantemCCusto, FCentroCustoEmp, FCodCentroCusto), // Centro de Custo para Débito
            FCdsContabFolha.FieldByName('CONTADEBITO').asString, // Conta para Débito
            '', // Centro de Custo para Crédito
            '', // Conta para Crédito
            FCdsContabFolha.FieldByName('HITCODHISTDEBITO').AsString, // Código do Histórico Padrão, eleito o do débito tanto para o débito quando o crédito
            FCdsPrincipal.FieldByName('TOTALPROVENTO').asFloat, // Valor a ser Lançado
            Consolida, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
            FUsaPlanoPatro, // Indica se usa Plano da Patrocinadora
            rProgramaSegrega.iIdSegregaCriter, // critério para segregação na conta débito
            IFF(rProgramaSegrega.iIdSegregaCriter=-1,-1,StrToDate(FDataRef)) // repete a data do lançamento para o critério
          )) then
          FPlnCodigo := FCtrlLancamento.RetornoPlnCodigo
        else
          raise Exception.Create(FCtrlLancamento.MessageInfo);
      end;
    end
    else
    if (bTemAlguma) and (FCancelProcRubIncompleta) then
      raise Exception.Create('Conta a Débito Não Encontrada para a Rubrica '+
        FloatToStr(FIdRubrica)+' (Código Interno) e Centro de Custo '+
        FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString);


    bBookMark := false;
    bTemAlguma := false;
    SvNum := FCdsContabFolha.GetBookMark;

    FCodCentroCusto := sCodCentroCustoAux; // retorna a salva

    FCdsContabFolha.First;
    while not(FCdsContabFolha.EOF) do
    begin
      bTemContaCC := False;
      if (Trim(FCdsContabFolha.FieldByName('CONTACREDITO').asString) <> '') then
      begin
        bTemAlguma := true;
        bTemContaCC :=
          (FCodCentroCusto = FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString) or
          (FCdsContasCC.Locate('PLANO;PLACONTA;IDEMPRESA;CODCENTROCUSTO',
           VarArrayOf([FCdsContabFolha.FieldByName('IDPLANO1').asInteger,
                       FCdsContabFolha.FieldByName('CONTACREDITO').asString,
                       FIdEmpresa,
                       FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString]), []));
        if (bTemContaCC) then
        begin
          bBookMark := false;
          break;
        end
        else
        begin
          SvNum := FCdsContabFolha.GetBookMark;
          bBookMark := (FCodCentroCusto = '') or
            (not(FCdsContasCC.Locate('PLANO;PLACONTA',
                 VarArrayOf([FCdsContabFolha.FieldByName('IDPLANO1').asInteger,
                             FCdsContabFolha.FieldByName('CONTACREDITO').asString]), [])));
        end;
      end;
      FCdsContabFolha.Next;
    end;

    if not(bTemContaCC) and not(bBookMark) then
    begin
      FCdsContabFolha.First;
      while not(FCdsContabFolha.EOF) do
      begin
        bTemContaCC := False;
        if (Trim(FCdsContabFolha.FieldByName('CONTACREDITO').asString) <> '') then
        begin
          bTemAlguma := true;
          bTemContaCC :=
            (FCodCentroCusto = FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString) or
            (FCdsContasCC.Locate('PLANO;PLACONTA;IDEMPRESA;CODCENTROCUSTO',
             VarArrayOf([FCdsContabFolha.FieldByName('IDPLANO1').asInteger,
                         FCdsContabFolha.FieldByName('CONTACREDITO').asString,
                         FIdEmpresa,
                         FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString]), []));

          if (bTemContaCC) then
          begin
            bBookMark := false;
            break;
          end
          else
          begin
            bTemContaCC :=
              (FCodCentroCusto = '') and
              (FCdsContasCC.Locate('PLANO;PLACONTA',
               VarArrayOf([FCdsContabFolha.FieldByName('IDPLANO1').asInteger,
                           FCdsContabFolha.FieldByName('CONTACREDITO').asString]), []));

            if (bTemContaCC) then
            begin
              FCodCentroCusto := FCdsContasCC.FieldByName('CODCENTROCUSTO').asString;
              bBookMark := false;
              break;
            end
            else
            begin
            SvNum := FCdsContabFolha.GetBookMark;
              bBookMark := (FCodCentroCusto = '') or
                (not(FCdsContasCC.Locate('PLANO;PLACONTA',
                     VarArrayOf([FCdsContabFolha.FieldByName('IDPLANO1').asInteger,
                                 FCdsContabFolha.FieldByName('CONTACREDITO').asString]), [])));
            end;
          end;
        end;
        FCdsContabFolha.Next;
      end;
    end;

    if (bBookMark) then
      FCdsContabFolha.GotoBookMark(SvNum);

    if (bBookMark) or (bTemContaCC) then
    begin

      (* INÍCIO este código foi resolvido na parte do débito, já que para a segregação funcionar é necessário parametrizar um débito para um crédito.
      // Procurar o critério para segregação na conta débito
      //    Se achou utilizar este critério também para o crédito
      //    Senão Procurar o critério para segregação na conta crédito
      //       Se achou utilizar este critério também para o débito
      //       Senão passar -1 tanto para o débito quanto para o crédito
      if rProgramaSegrega.iIdSegregaCriter = -1 then
        rProgramaSegrega.iIdSegregaCriter := FCtrlSegregacao.RetornaSegregaCriter(
           FCdsContabFolha.FieldByName('IDPLANO1').asInteger,      // plano contábil ativo
           // Alex 12/11 se o plano é carimbado passar o plano correto para a segregação, desta forma nenhum critério será retornado
           //round(FIdPlanoPrev),          // plano previdenciário do lançamento contábil
           //round(FIdPatro),              // patrocinadora do lançamento contábil
           rProgramaSegrega.iPlanoPrevCont,
           // em primeira vista parece que o iff (idplanotmp está errado, deveria ser iff (idpatrotmp... mas não no select feito
           // na cbs todas as patrostmp estão com o valor de 1, desta forma a pergunta está correta
           trunc(IFF(FIdPlanoTmp > 0, FIdPatroTmp, FIdPatro)), // ID da Patrocinadora
           FCdsContabFolha.FieldByName('CONTACREDITO').asString, // conta contábil do lançamento
           sContaSegregaCriter);  // retorna em que conta contábil foi encontrado o critério
      FIM este código foi resolvido na parte do débito, já que para a segregação funcionar é necessário parametrizar um débito para um crédito. *)

      if (FCdsContabFolha.FieldByName('CODSUBCREDITO').IsNull) then
        dCodSubContaCre := 0
      else
        dCodSubContaCre := FCdsContabFolha.FieldByName('CODSUBCREDITO').asFloat;

      if (FCodCentroCusto = '') then
        FCodCentroCusto := FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString;

      if not (bPartidaDobrada) then // se for Partida Dobrada, não lança o Crédito
      begin
        if (FCtrlLancamento.InsereLancaContab(
            '1', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
            FIdEmpresa, // Empresa
            FIdModulo, // Módulo de Origem
            FIdUsuario, // Usuário Ativo
            FCdsContabFolha.FieldByName('IDPLANO1').asFloat, // Plano de Contas
            FUnidNegoc,                //ParamIntegra.UnidNegoc, // Unidade de Negócio
            0, // Sub-Conta de Débito
            dCodSubContaCre, // Sub-Conta de Crédito
            // Alex 11/12 IFF(FIdPlanoTmp > 0, FIdPlanoTmp, FIdPlanoPrev), // ID do Plano Previdenciário
            rProgramaSegrega.iPlanoPrevCont,

            // Alterado por Arnaldo V. Scarin em 01/06/2011
            // SOL 154381 - KTN: 1186492
            iIdPatro, // ID da Patrocinadora
            FPlnCodigo, // Número da Planilha
            0, // Número do Lançamento
            FDataRef, // Data do Lançamento
            FAnoMes, // Número do Documento
            'CONT FOLHA PAGTO '+ FCdsPrincipal.FieldByName('CODPROVDESC').asString +' '+
              FCdsContabFolha.FieldByName('DESCRICAO').asString +' '+ FAnoMes, // 1ª Linha da Histórico
            '', // 2ª Linha da Histórico
            '', // 3ª Linha da Histórico
            '', // 4ª Linha da Histórico
            '', // 5ª Linha da Histórico
            TipoOperacao, // Tipo de Operação Indicado
            '', // Centro de Custo para Débito
            '', // Conta para Débito
            IFF(FMantemCCusto, FCentroCustoEmp, FCodCentroCusto), // Centro de Custo para Crédito
            FCdsContabFolha.FieldByName('CONTACREDITO').asString, // Conta para Crédito
            FCdsContabFolha.FieldByName('HITCODHISTDEBITO').AsString, // Código do Histórico Padrão, eleito o do débito tanto para o débito quando o crédito
            FCdsPrincipal.FieldByName('TOTALPROVENTO').asFloat, // Valor a ser Lançado
            Consolida, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
            FUsaPlanoPatro, // Indica se usa Plano da Patrocinadora
            rProgramaSegrega.iIdSegregaCriter, // critério para segregação na conta débito
            IFF(rProgramaSegrega.iIdSegregaCriter=-1,-1,StrToDate(FDataRef)) // repete a data do lançamento para o critério
          )) then
          FPlnCodigo := FCtrlLancamento.RetornoPlnCodigo
        else
          raise Exception.Create(FCtrlLancamento.MessageInfo);
      end
      else
       begin   // Partida Dobrada, lança o Débito e o Crédito

            if (FCtrlLancamento.InsereLancaContab(
            '2', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
            FIdEmpresa, // Empresa
            FIdModulo, // Módulo de Origem
            FIdUsuario, // Usuário Ativo
            FCdsContabFolha.FieldByName('IDPLANO2').asFloat, // Plano de Contas
            ///Flávio Nogueira   Sol 156058/4981
            FUnidNegoc ,
            dCodSubContaDeb, // Sub-Conta de Débito
            dCodSubContaCre, // Sub-Conta de Crédito
            // Alterado por Arnaldo V. Scarin em 01/06/2011
            // SOL 154381 - KTN: 1186492
            iIdPlanoPrev, // ID do Plano Previdenciário
            iIdPatro, // ID da Patrocinadora
            FPlnCodigo, // Número da Planilha
            0, // Número do Lançamento
            FDataRef, // Data do Lançamento
            FAnoMes, // Número do Documento
            'CONT FOLHA PAGTO '+ FCdsPrincipal.FieldByName('CODPROVDESC').asString +' '+
              FCdsContabFolha.FieldByName('DESCRICAO').asString +' '+ FAnoMes, // 1ª Linha da Histórico
            '', // 2ª Linha da Histórico
            '', // 3ª Linha da Histórico
            '', // 4ª Linha da Histórico
            '', // 5ª Linha da Histórico
            TipoOperacao, // Tipo de Operação Indicado
            FSalvaCodCentroCustoDebito, // Centro de Custo para Débito
            FSalvaContaDebito, // Conta para Débito
            IFF(FMantemCCusto, FCentroCustoEmp, FCodCentroCusto), // Centro de Custo para Crédito
            FCdsContabFolha.FieldByName('CONTACREDITO').asString, // Conta para Crédito
            '', // Código do Histórico Padrão
            FCdsPrincipal.FieldByName('TOTALPROVENTO').asFloat, // Valor a ser Lançado
            Consolida, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
            FUsaPlanoPatro, // Indica se usa Plano da Patrocinadora
            rProgramaSegrega.iIdSegregaCriter, // critério para segregação na conta débito
            IFF(rProgramaSegrega.iIdSegregaCriter=-1,-1,StrToDate(FDataRef)) // repete a data do lançamento para o critério
          )) then
          FPlnCodigo := FCtrlLancamento.RetornoPlnCodigo
        else
          raise Exception.Create(FCtrlLancamento.MessageInfo);
      end;
    end
    else
    if (bTemAlguma) and (FCancelProcRubIncompleta) then
      raise Exception.Create('Conta a Crédito Não Encontrada para a Rubrica '+
        FloatToStr(FIdRubrica)+' (Código Interno) e Centro de Custo '+
        FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString);

    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;


function TCtrlParamContabFolha.GerarCAP(IdPlano: integer): boolean;
var
  iCodPortadorForma: integer;
  liIdPlanoPrev    : integer;     //edilaine SIG114503
  liIdPatro        : integer;     //edilaine SIG114503
  lstRubrica       : TStringList; //edilaine SIG114503
begin
  lstRubrica := TStringList.create; //edilaine SIG114503
  try
    try
      //edilaine SIG114503 : inicio
      lstRubrica.commatext := '39980,39981,39355,39097,39938,39937,39099,39868,39966,39982,39983,'+
                              '39524,39869,39967,39521,39870,39968,00450,39871,36480,36479,39873,'+
                              '36732,39872,39867,39123,39101,39520,40848,40850,40852,40854';

      If lstRubrica.IndexOf(IntToStr(trunc(FidRubrica))) > -1 then
      begin
        liIdPlanoPrev := Trunc(FIdPlanoPrev);
        liIdPatro     := Trunc(FIdPatro);
      end
      else
      begin
        liIdPlanoPrev := Trunc(IFF(FIdPlanoTmp > 0, FIdPlanoTmp, FIdPlanoPrev));
        liIdPatro     := Trunc(IFF(FIdPlanoTmp > 0, FIdPatroTmp, FIdPatro));
      end;
      //edilaine SIG114503 : fim

      // O Favorecido será obtido na seguinte ordem:
      //  * Parametrização Contábil da Rubrica;
      //  * Banco que a Pessoa possui Conta Salário e esteja parametrizado como um dos
      //    Bancos indicados no Portador Forma;
      //  * Portador Forma Padrão.
      FIdFavorecido := FCdsContabFolha.FieldByName('IDFAVORECIDO').asInteger;
      if not(FCdsContabFolha.FieldByName('IDFAVORECIDO').IsNull) then
        FIdFavorecido := FCdsContabFolha.FieldByName('IDFAVORECIDO').asInteger
      else
      begin
        FIdFavorecido := GetIdBancoContaSalario(FCdsPrincipal.FieldByName('IDAGENCIASALARIO').asFloat);
        if (FIdFavorecido > 0) then
        begin
          iCodPortadorForma := ExisteCodigo(FListaCodPortadorForma, IntToStr(FIdFavorecido));
          if (iCodPortadorForma = -1) then
          begin
            iCodPortadorForma := FCtrlBancoPortFolha.GetCodPortForma(FIdFavorecido);
            FListaCodPortadorForma.Add(IntToStr(FIdFavorecido) +'='+ IntToStr(iCodPortadorForma));
          end;
        end
        else
        if (FPortadorFormaPadrao > 0) then
        begin
          iCodPortadorForma := FPortadorFormaPadrao;
          FIdFavorecido := FCtrlBancoPortFolha.GetBancoEmpresa(iCodPortadorForma);
        end;
      end;

      // Guardar o valor da Rubrica
      if not(FCtrlIntegraRH.SetDadosDocumento(-1, -1, IdPlano,
        IFF(FCdsContabFolha.FieldByName('UNIDNEGOC').asInteger<>0,
          FCdsContabFolha.FieldByName('UNIDNEGOC').asInteger, -1),
        FPortadorFormaPadrao, FIdFavorecido, '',
        FCdsContabFolha.FieldByName('CODCENTRORESPON').asString,
        FCdsContabFolha.FieldByName('CODTIPRECDES').asString,
        'P', IFF(FCdsContabFolha.FieldByName('FLGDESCONTO').asInteger=0, 'D', 'C'),
        FCdsPrincipal.FieldByName('TOTALPROVENTO').asFloat, 0,
        IFF(FRateioCC, FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString, ''),
        //iCodPortadorForma, 0, 0, FIdPatroTmp, FIdPlanoTmp)) then           //edilaine SIG114503
        iCodPortadorForma, 0, 0, liIdPatro, liIdPlanoPrev)) then             //edilaine SIG114503
      begin
        raise Exception.Create(FCtrlIntegraRH.MessageInfo);
      end;

      Result := true;
    except
      on E: Exception do
      begin
        MessageInfo := E.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(lstRubrica);
  end;
end;

// Alteração VerificaTemOutroCC  - Monica Gonzaga SOL 188078 kintana 1772223
function TCtrlParamContabFolha.VerificaTemOutroCC: boolean;
begin
  _Cds.Data := GetDataPacket(
          'SELECT COUNT(*) AS CONTA'+CR_LF+
          'FROM   HORATRABOUTROCC H, FUNCIONARIO F'+CR_LF+
          'WHERE'+CR_LF+
          '  ('+CR_LF+
          '    (TO_CHAR(H.DATATRAB,''YYYY/MM'') = ' +QuotedStr(FAnoMes)+ ') OR'+CR_LF+
          '    ('+CR_LF+
          '      (TO_CHAR(H.DATATRAB,''YYYY/MM'') <= ' +QuotedStr(FAnoMes)+ ') AND'+CR_LF+
          '      (H.FLGPERMANENTE = 1)'+CR_LF+
          '    )'+CR_LF+
          '  ) AND'+CR_LF+
          '  (H.FLGRATEIO = 1) AND'+CR_LF+
          '  (H.IDPESSOA  = F.IDPESSOA) AND'+CR_LF+
          '  (F.IDESTAB   = ' +FloatToStr(FIdEstab)+ ') AND'+CR_LF+
          '  (F.IDEMPRESA = ' +FloatToStr(FIdEmpresa)+ ')'
          );

  Result := (_Cds.FieldByName('CONTA').asInteger > 0);
end;

function TCtrlParamContabFolha.GetIdBancoContaSalario(IdAgenciaSalario: double): integer;
begin
  _Cds.Data := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '  NVL(AG.IDBANCO,0) AS IDBANCO'+CR_LF+
    'FROM'+CR_LF+
    '  AGENCIABANCARIA AG, BANCOPORTFOLHA BPF'+CR_LF+
    'WHERE'+CR_LF+
    '  (AG.IDPESSOA = ' +FloatToStr(IdAgenciaSalario)+ ') AND'+CR_LF+
    '  (AG.IDBANCO  = BPF.IDBANCO)');

  Result := _Cds.FieldByName('IDBANCO').asInteger;
end;

function TCtrlParamContabFolha.ListContabFolha: OleVariant;
var
  sSQL: String;
begin
  sSQL :=
    'SELECT'+CR_LF+
    '  C.IDPROVENTO, C.IDEMPRESA, C.CODCENTROCUSTO,'+CR_LF+
    '  C.IDPLANO1, C.IDPLANO2, C.CONTADEBITO, C.IDPESSDEBITO,'+CR_LF+
    '  C.IDPESSCREDITO, C.CODSUBDEBITO, C.CODSUBCREDITO,'+CR_LF+
    '  C.CONTACREDITO, C.RECPAG, C.CODTIPRECDES, C.CODCENTRORESPON,'+CR_LF+
    '  C.UNIDNEGOC, C.IDFAVORECIDO, PD.DESCRICAO,'+CR_LF+
    '  PD.FLGDESCONTO, PD.CODRUBCLT, C.HITCODHISTDEBITO'+CR_LF+
    'FROM'+CR_LF+
    '  CONTABFOLHA C, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (C.IDPROVENTO = PD.IDPROVENTO)'+CR_LF;

  // Inicio - Monica Gonzaga SOL 188078 kintana 1772223
  if(FListaIdRubrica <> '') then
    sSQL := sSQL + '  AND ' + MontaLinhaSelSQL('(C.IDPROVENTO',FListaIdRubrica,3,False);
  // FIM- Monica Gonzaga SOL 188078 kintana 1772223

  // Felipe A. Santos SOL 188078 kintana 1772223
  sSQL := sSQL + ' ORDER BY CODCENTROCUSTO, CODTIPRECDES'; // para gerenciar o valor que sobrar no ultimo documento
  // Felipe A. Santos SOL 188078 kintana 1772223  - fim

  Result := GetDataPacket(sSQL);
end;

{ Flávio Nogueira Sol 156058/4981 }

function TCtrlParamContabFolha.GetAtividadeProgeto: Integer;
begin
  Result:=0;
  try
  _Cds.Data := GetDataPacket(
  'SELECT  TO_CHAR(CONTABFOLHA.UNIDNEGOC) AS UNIDNEGOC '+CR_LF+
  'FROM CONTABFOLHA '+CR_LF+
  'INNER JOIN RUBRICAXPESS ON  CONTABFOLHA.IDPROVENTO = RUBRICAXPESS.IDRUBRICA'+CR_LF+
  'INNER JOIN  UNIDNEGOCIO ON  CONTABFOLHA.UNIDNEGOC = UNIDNEGOCIO.UNIDNEGOC '+CR_LF+
  'WHERE RUBRICAXPESS.IDRUBRICA = '+FloatToStr(FIdRubrica));
  Result := _Cds.FieldByName('UNIDNEGOC').Asinteger;
  except
   Result:=0;
   end;
end;

//Monica - Inicio  - SOL 188078 kintana 1772223
Function  TCtrlParamContabFolha.ListaEmpregados(sTipoContrato, ListaIdPessoa: string): OleVariant;
var
  sSQLPes: String;
begin
  sSQLPes := '';
  if ListaIdPessoa <> '' then
  begin
    if Pos(',', ListaIdPessoa) > 0 then
      //sSQLPes := '    AND (F.IDPESSOA IN (' +ListaIdPessoa+ ')) '+CR_LF   //Monica Gonzaga SOL 188078 kintana 1772223 - comentado
      sSQLPes := FU.QuebrarListaFiltro(7, '(F.IDPESSOA     ', ListaIdPessoa, 500)+ CR_LF   //Monica Gonzaga SOL 188078 kintana 1772223
    else
      sSQLPes := '       (F.IDPESSOA = ' +ListaIdPessoa+ ') '+CR_LF;

    sSQLPes := '   AND ' + sSQLPes; // FHBS - SOL 221835 / KTN 2054506
  end;

  FListaTipoContrato:= sTipoContrato;

  Result := GetDataPacket(
  'SELECT P.NOME,D.MATRICULA, P.IDPESSOA' +CR_LF+
  '  FROM FUNCIONARIO F, PESSOA P, DEPENTIT D' +CR_LF+
  ' WHERE F.TIPOCONTRATO in(' + sTipoContrato + ') ' +CR_LF+
  '   AND F.IDPESSOA = P.IDPESSOA  '  +CR_LF+
  '   AND F.IDPESSOA = D.IDPESSOA  '  +CR_LF+
  '   AND D.IDTITULAR = F.IDPESSOA  ' +CR_LF+ //Darivaldo Alencar SIG62214
  sSQLPes+
  '    ORDER BY P.NOME');
end;


function TCtrlParamContabFolha.ListaIdIntegra(sCampo, Mes: String;
  Ano, IdEstab, IdModulo: integer; ListaIdTipoFolha: String;
  Previa: Boolean; sListaCODTIPRECDES: String): TRetornoIntegra;

    procedure RemoveDuplicates(const stringList : TStringList) ;
     var
       buffer: TStringList;
       cnt: Integer;
     begin
       stringList.Sort;
       buffer := TStringList.Create;
       try
         buffer.Sorted := True;
         buffer.Duplicates := dupIgnore;
         buffer.BeginUpdate;
         for cnt := 0 to stringList.Count - 1 do
           buffer.Add(stringList[cnt]) ;
         buffer.EndUpdate;
         stringList.Assign(buffer) ;
       finally
         FreeandNil(buffer) ;
       end;
     end;


var
  sTabela, sResult, AnoMes, sSQL: string;
  lstRubrica, lstPessoa : TStringList;
begin
  lstRubrica := TStringList.create;
  lstPessoa  := TStringList.create;

  AnoMes:=  inttostr(Ano) + '/' + Mes;
  if (Previa) then
    sTabela := 'PREVIAFOLPAG'
  else
    sTabela := 'HISTRUBSAL';

         { Inicio Comentário Felipe A. Santos, foi mudado a select retirando o distinct (como verifica os repetidos abaixo)
           e a tabela CF para melhora de desepenho pois estava demorando 1 minuto para abrir a tela SOL 188078 kintana 1772223

         'SELECT DISTINCT h.IdPessoa, h.idrubrica  '+ #13#10 +
          '  FROM (select IdPessoa, idrubrica, idmotivo from '+sTabela+ #13#10 +
//          '         where mescobranca = (select mescobranca from '+sTabela+' where rownum = 1 and mes = '+ quotedStr(AnoMes) +') ' + #13#10 +
          '         where mes = '+ quotedStr(AnoMes) + #13#10 +
          '       ) H,' + #13#10 +
          '       FUNCIONARIO F, ' + #13#10 +

          '       (SELECT DISTINCT IDPROVENTO ' + #13#10 +
        '          FROM CONTABFOLHA' + #13#10 + 
          '         WHERE ' + IFF(Trim(sListaCODTIPRECDES)='',
                                 'CODTIPRECDES is not null',
                                 FU.QuebrarListaFiltro(2, '(CODTIPRECDES',sListaCODTIPRECDES,50)) + #13#10 +
          '        ) CF' + #13#10 +

          ' WHERE F.IDPESSOA = H.IDPESSOA  ' + #13#10 +
          '   AND CF.IDPROVENTO = H.IDRUBRICA ' + #13#10 +
          '   AND F.IDESTAB = ' + IntToStr(IdEstab)+ #13#10 +

          '   AND EXISTS  (SELECT 1  ' + #13#10 +
          '                  FROM MOTIVO m ' + #13#10 +
          '                 WHERE m.idmotivo = h.idmotivo ' + #13#10;
          }
          // fim comentário Felipe A. Santos SOL 188078 kintana 1772223

  // Felipe A. Santos SOL 188078 kintana 1772223
  sSQL := 'SELECT h.IdPessoa, h.idrubrica  '+ #13#10 +
          '  FROM ' + sTabela + ' H, ' + #13#10 +
          '       FUNCIONARIO F ' + #13#10 +
          ' WHERE F.IDPESSOA = H.IDPESSOA  ' + #13#10 +
          '   AND ' + ListaIdRubricaParam(sListaCODTIPRECDES) + #13#10 +
          '   AND F.IDESTAB = ' + IntToStr(IdEstab)+ #13#10 +
          '   AND H.MES = ' +  quotedStr(AnoMes) + #13#10 +
          '   and H.IDPESSJUR in (1, 91008) ' + #13#10 +  // FHBS - 17/01/2014 - SOL 223280
          '   AND EXISTS  (SELECT 1  ' + #13#10 +
          '                  FROM MOTIVO m ' + #13#10 +
          '                 WHERE m.idmotivo = h.idmotivo ' + #13#10;

  // Felipe A. Santos SOL 188078 kintana 1772223 - fim

  if ListaIdTipoFolha <> '' then
     sSQL := sSQL + '                   AND (m.idmotivo IN (' +ListaIdTipoFolha+ ')) ' + #13#10;

  sSQL := sSQL +    '                   AND m.GRUPOMOTIVO IN (''F'',''D'') )'+ #13#10;

  sSQL := StringReplace(sSQL, 'H.IDRUBRICA = ', 'H.IDRUBRICA IN ', [rfReplaceAll]); // Felipe A. Santos SOL 188078 kintana 1772223

  _Cds.Data := GetDataPacket(sSQL);

  Result.sIdRubrica := '-1';
  Result.sIdPessoa  := '-1';

  _Cds.First;
  while not _Cds.Eof do
  begin
    if lstPessoa.IndexOf( _Cds.Fields[0].AsString+',' ) = -1 then
       lstPessoa.Add( _Cds.Fields[0].AsString + ',' );

    if lstRubrica.IndexOf( _Cds.Fields[1].AsString+',' ) = -1 then
       lstRubrica.Add( _Cds.Fields[1].AsString + ',' );

    _Cds.Next;

  end;
  _Cds.Close;

  if lstPessoa.Count > 0 then
  begin
    lstPessoa.Strings[ lstPessoa.Count-1 ] := StringReplace( lstPessoa.Strings[ lstPessoa.Count-1 ] , ',', '', []);
    Result.sIdPessoa  := lstPessoa.Text;
  end;

  if lstRubrica.Count > 0 then
  begin
    lstRubrica.Strings[ lstRubrica.Count-1 ] := StringReplace( lstRubrica.Strings[ lstRubrica.Count-1 ] , ',', '', []);
    Result.sIdRubrica := Copy( lstRubrica.text, 1, Length(lstRubrica.Text)-1);
   end;
end;
//Monica - FIM  - SOL 188078 kintana 1772223


function TCtrlParamContabFolha.ListaTipoDesembolsoXRubrica(
  idrubrica: string): OleVariant;
var
   sSQL : string; // Felipe A. Santos SOL 188078 kintana 1772223
begin
     // Felipe A. Santos SOL 188078 kintana 1772223

     // pega todos os desembolsos relacionados a rubrica
     sSQL := ' SELECT DISTINCT idprovento, codtiprecdes FROM CONTABFOLHA ' +
              ' WHERE IDPROVENTO = ' + idrubrica +
              ' AND CODTIPRECDES IS NOT NULL ';

     Result := GetDataPacket(sSQL);

     // Felipe A. Santos SOL 188078 kintana 1772223
end;

function TCtrlParamContabFolha.GetNumRateio: integer;
var
   iCount : integer; // Felipe A. Santos SOL 188078 kintana 1772223
begin
     // Felipe A. Santos SOL 188078 kintana 1772223
      iCount := 0;

      FCdsContabFolha.First;
      while not(FCdsContabFolha.Eof) do
      begin
           if (Trim(FCdsContabFolha.FieldByName('CODTIPRECDES').asString) <> '') and
              (VerificaCodigoEm(FListaTipoDesemb,
               Trim(FCdsContabFolha.FieldByName('CODTIPRECDES').asString), ',') = 1) then
               iCount := iCount + 1;

           FCdsContabFolha.Next;
      end;

      if iCount = 0 then
         iCount := 1;

      Result := iCount;

      // Felipe A. Santos SOL 188078 kintana 1772223
end;

function TCtrlParamContabFolha.ListaIdRubricaParam(
  ListaTipoDesemb: string): string;
var
   sStrListaAux, sParam, sSQL : string; // Felipe A. Santos SOL 188078 kintana 1772223
begin
   // Felipe A. Santos SOL 188078 kintana 1772223

   // melhora de performance e correção de filtro de rubricas por desembolso

   if ListaTipoDesemb = '' then
      sParam := 'CODTIPRECDES IS NOT NULL'
   else
      sParam := FU.QuebrarListaFiltro(2,'(CODTIPRECDES',ListaTipoDesemb,999);

   sSQL := 'SELECT DISTINCT IDPROVENTO FROM CONTABFOLHA ' + #13#10 +
           ' WHERE ' + sParam + #13#10 +
           '   AND IDPROVENTO IS NOT NULL';

   try
      FCdsAux.Data := GetDataPacket(sSQL);

      FCdsAux.First;
      while not(FCdsAux.Eof) do
      begin
          sStrListaAux := sStrListaAux + FCdsAux.FieldByName('IDPROVENTO').AsString + ',';
          FCdsAux.Next;
      end;

      //William Moreira da Silva - SIG 44973
      //sStrListaAux := Copy(sStrListaAux, 0, Length(sStrListaAux) -2);
      sStrListaAux := Copy(sStrListaAux, 0, Length(sStrListaAux) -1);
      //William Moreira da Silva - SIG 44973

      if sStrListaAux = '' then
         sStrListaAux := '-1';

      sStrListaAux := FU.QuebrarListaFiltro(2, '(IDRUBRICA',sStrListaAux,999);

      Result := sStrListaAux;
   finally
       FCdsAux.EmptyDataSet;
   end;

   // Felipe A. Santos SOL 188078 kintana 1772223 - fim
end;


//Edilaine - SOL 188851 Kintana 1784371
function TCtrlParamContabFolha.GetListaFornecedores(iMes, iAno,
  iEstab: integer; sFolhas, sDesembolso : string;
  bPrevia: boolean): OleVariant;
var
  _sSQL : string;
begin
  FAnoMes := IntToStr(iAno) +'/'+ PoeZero(iMes);

  if (bPrevia) then
     FNomeTabela := 'SELECT /*+ INDEX (R XIE3PREVIAFOLPAG) */ * FROM PREVIAFOLPAG R'
  else
     FNomeTabela := 'SELECT /*+ INDEX(R BITMAP_INDX_1) */ * FROM HISTRUBSAL R';

  _sSQL := 'SELECT DISTINCT  '+
           '       CF.CODCENTRORESPON, CF.IDFAVORECIDO, CF.CODTIPRECDES, CF.AVALIAFORNECEDOR, '+
           '       CF.FLGAVALIAFORNEC, NVL(AV.QTDAVAL,0) QTDAVAL '+
           '  FROM '+
           '       ('+FNomeTabela+' WHERE R.MES = '+QuotedStr(FAnoMes)+') H, '+
           '       (SELECT DISTINCT C.IDPROVENTO, C.CODCENTRORESPON, C.IDFAVORECIDO, C.CODTIPRECDES, '+
           '               P.FLGAVALIAFORNEC, CR.AVALIAFORNECEDOR '+
           '          FROM CONTABFOLHA C, PESSOA P, CENTRESPON CR '+
           '         WHERE P.IDPESSOA = C.IDFAVORECIDO '+
           '           AND C.CODCENTRORESPON = CR.CODCENTRORESPON '+
           '           AND C.IDFAVORECIDO IS NOT NULL '+
           '           AND C.CODTIPRECDES IN ('+sDesembolso+') '+
           '           AND (CR.AVALIAFORNECEDOR = ''S'') '+
           '           AND P.FLGAVALIAFORNEC = ''N'' '+
           '           AND P.NUMDOCUMENTO IS NOT NULL '+
           '       ) CF, '+
           '       (select af.idpessoa, count(af.dtavaliacao) as qtdaval '+
           '          from avaliacaofornec af '+
           '         where TO_CHAR(af.dtavaliacao, ''YYYY/MM'')=  '+QuotedStr(FAnoMes)+
           '         group by af.idpessoa '+
           '       ) AV '+
           ' WHERE (AV.IDPESSOA(+) = CF.IDFAVORECIDO) '+
           '   AND (H.IDRUBRICA = CF.IDPROVENTO)      '+
           '   AND (H.IDMOTIVO   IN ('+sFolhas+'))    ';

  Result := GetDataPacket( _sSQL );

end;

end.


