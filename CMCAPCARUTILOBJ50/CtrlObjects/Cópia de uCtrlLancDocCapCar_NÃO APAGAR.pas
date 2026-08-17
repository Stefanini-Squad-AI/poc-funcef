{******************************************************************************}
{  Sistema - Contas a Pagar                                                    }
{  Unit    - uCtrlLancDocCapCar                                                }
{------------------------------------------------------------------------------}
// andré tavares - pendência 21601 - baixa por planos de benefícios
// andre tavares - pendência 22278 - 19/08/2006
{------------------------------------------------------------------------------}
{  Alterações:
Data      : 26.08.2006
Autor     : Antonio Marcos Fernandes de Souza
Pendência : 21703
Descrição : Verifica se a forma de pagamento possui vínculo bancário
Pendência : 21704
Descrição : Verifica a duplicidade do documento mas, respeita a opção do usuário.
--------------------------------------------------------------------------------
Pendência : 21603
Autor     : Andre Tavares
Descrição : Adaptação para chamar o evento de pergunta d ctrlDocumento.
}
{ -----------------------------------------------------------------------------}
// Rotinas   : Várias - procure pelo numero da pendencia
// Data      : 07/04/2005
// Autor     : Andre Tavares
// Pendência : 22079
// Descrição : Criei o OnEmissaoBloqueto que é para ser associado (na tela chamadora)
// a um método que chama a tela de impressao de bloquete, ficando assim, a operação
// na mesma transação do documento;
//------------------------------------------------------------------------------
// Rotinas   : ProcessaDocumento
// Data      : 16.03.2006
// Autor     : Antonio Marcos (amf)
// Pendência : 21669
// Descrição : Trata as mensagens de bloqueio de disponibilidade financeira de
//             forma mais detalhada.
//------------------------------------------------------------------------------
// Rotinas   : Várias - procure pelo numero da pendencia
// Data      : 07/04/2005
// Autor     : Andre Tavares
// Pendência : 18771
// Descrição : Implementação de englobamento\parcelamento de documentos
//------------------------------------------------------------------------------
// Rotinas   : Várias
// Data      : 04/08/2004
// Autor     : David Ayrolla
// Pendência : 17232
// Descrição : Limitar a retenção de INSS de autônomos ao teto.
//------------------------------------------------------------------------------
// Rotinas   : ProcessaDocumento
// Data      : 15/06/2004
// Autor     : andre tavares
// Pendência : 16953
// Descrição : o campo nosso numero estava sendo limpo ao se alterar um documento,
// isso estava causando problemas na baixa (recebimento automático) do documento. 
//------------------------------------------------------------------------------
// Rotinas   : ProcessaDocumento
// Data      : 27/01/2004
// Autor     : Alex Pereira
// Pendência : 16220
// Descrição : Implementar a conciliação de CPMF em Lança e baixa simultanea
//------------------------------------------------------------------------------
// Rotinas   : ProcessaDocumento
// Data      : 27/01/2004
// Autor     : Alex Pereira
// Pendência : 5342 - Múltiplas contas de baixa
// Descrição : Corrigindo procedimento para permitir múltiplas contas de baixa
//------------------------------------------------------------------------------
// Rotinas   : TCtrlLancDocCapCar.Create
//             InicializaImposto
// Data      : 21/01/2004
// Autor     : Alex Pereira
// Pendência : 15965
// Descrição : quando cria um imposto retido não está passando a informação de plano patro
//             Recriando objeto financeiro
//------------------------------------------------------------------------------
// Rotinas   : Várias
// Data      : 16/01/2004 (término)
// Autor     : David Ayrolla
// Pendência : 14393
// Descrição : Implementação de retenção de INSS para autônomos.
//------------------------------------------------------------------------------
// Data      : 13/01/04
// Pendência : 14451 - Nova Segregação de Recursos
// Descrição : Passar a nova estrutura - IDSEGREGACRITER e DATASEGREGACRITER
// Métodos Pendentes:
//    TCtrlLancDocCapCar.ProcessaDocumento ==> procedure ProcessaContabilidade InsereLancaContab  // RESOLVIDO 26/01
//    TCtrlLancDocCapCar.ProcessaDocumento   Documento.setvalues                                  // RESOLVIDO 27/01
//    TCtrlLancDocCapCar.ProcessaAgrupaParcela  ==> procedure InserirParcelas;  Documento.setvalues
//------------------------------------------------------------------------------
unit uCtrlLancDocCapCar;

interface

uses
   SysUtils, Classes, DbClient, uCmControlObject, uCMTypes, uCtrlDocumento,
   uCtrlLancamento, uCtrlFinanc, uCtrlImpostoRetido, UCtrlOrcamento, uCtrlPadroes,
   DCtrlDocCapCar, Db, uCMSqlParams, uListaCamposHistCapCar,  uCtrlModeloHistorico,
   uCtrlParamIntegra, uCtrlSegregacao, uMidasUtil, uCtrlBaixaDocumentos;

const
   QUEBRADELINHA = ( #13 + #10 );

   MSG_ERRO_ALTERADOR                   = 'Não foi possível inserir Alterador.' + QUEBRADELINHA;
   MSG_ERRO_ATUALIZA_LANCTODOCUM        = 'Erro ao atualizar LANCTODOCUM.PLNCODIGO.' + QUEBRADELINHA;
   MSG_ERRO_EXCLUI_CONTAB               = 'Erro ao Excluir Contabilização.' + QUEBRADELINHA;
   MSG_ERRO_CONTABILIZA_LANCTO          = 'Erro ao contabilizar lançamento.' + QUEBRADELINHA;
   MSG_ERRO_INSERIR_DOC                 = 'Erro ao Inserir documento.' + QUEBRADELINHA;

   //amf 16.03.2006 p:21669 - inicio
   MSG_ERRO_ALTERAR_DOC                 = 'Erro ao Alterar documento.' + QUEBRADELINHA;
   MSG_ERRO_EXCLUIR_DOC                 = 'Erro ao Excluir documento.' + QUEBRADELINHA;
   //amf 16.03.2006 p:21669 - fim

   MSG_ERRO_BAIXA_ADIANTO               = 'Erro ao baixar adiantamento.' + QUEBRADELINHA;
   MSG_ERRO_ATUALIZA_BAIXA_ADIANTO      = 'Erro ao atualizar baixa de adiantamento.' + QUEBRADELINHA;
   MSG_ERRO_LANC_FINANC                 = 'Erro ao fazer lançamento de baixa no financeiro.' + QUEBRADELINHA;
   MSG_ERRO_BAIXA_DOC                   = 'Erro ao inserir baixa de documento.' + QUEBRADELINHA;
   MSG_ERRO_REG_ADIANTO                 = 'Erro na Regularização de Adiantamento.' + QUEBRADELINHA;
   MSG_ERRO_EXCLUI_PREVISA0             = 'Erro ao excluir lançamento de Contrato\Previsão.' + QUEBRADELINHA;
   MSG_ERRO_ALTERA_PREVISA0             = 'Erro ao alterar lançamento de Contrato\Previsão.' + QUEBRADELINHA;
   MSG_ERRO_ATUALIZA_ORCAMENTO          = 'Erro ao atualizar valores do orçamento.' + QUEBRADELINHA;
   MSG_ERRO_ESTORNA_ORCAMENTO           = 'Não Foi Possível Estornar Compromisso orçamentário.' + QUEBRADELINHA;
   MSG_ERRO_EFETIVA_COMPROMISSO         = 'Não Foi Possível Efetivar Compromisso orçamentário.' + QUEBRADELINHA;
   MSG_ERRO_ATUALIZA_VALOR_COMPROMISSO  = 'Erro ao atualizar valor do compromisso. ' + QUEBRADELINHA;
   MSG_ERRO_EXCLUI_FINANC               = 'Erro ao excluir lançamentos de lança e baixa do Financeiro. ' + QUEBRADELINHA;
   MSG_ERRO_EXCLUI_RECBTOPAGTO          = 'Erro ao excluir lançamentos de baixa. ' + QUEBRADELINHA;
   MSG_ERRO_MARCA_BAIXA_ADIANTO         = 'Erro ao atualizar status de lança e baixa para o lançamento. ' + QUEBRADELINHA;

   MSG_ERRO_OPERLANCTO                  = 'Operação de Lançamento Inválida.';
   // Alex 13/12/04 18172
   //MSG_OBRIGA_INDICACAO_RESERVA         = 'Obrigatório a Indicação de Reserva orçamentária para ';
   MSG_OBRIGA_INDICACAO_RESERVA         = 'Obrigatório a indicação do Compromisso Orçamentário para ';


type

  TOperacaoLancDocCapCar = (opldEfetivo, opldAdiantamento, opldContratoPrevisao, opRegAdiantamento, opldAgrupaParcela);

  TPlacontas = Record
                 iPlano: integer;
                 sPlaconta, sPlacontaPass : string;
                 iSubConta, iSubContaPass : integer;
                 iIdSegregaCriter: integer;
                 scodCentroCusto: string;
               end;

  TCtrlLancDocCapCar = Class(TCmControlObject)
  private
    _Documento: TCtrlDocumento;
    _Lancamento: TCtrlLancamento;
    _Financeiro: TCtrlFinanc;
    _Imposto: TCtrlImpostoRetido;
    _Orcamento: TOrcamentoBackMT;
    _Padroes: TCtrlPadroes;
    _ModeloHist      : TCtrlModeloHistorico;

    _Segregacao: TCtrlSegregacao;

    _DtmCtrlDocCapCar: TDtmCtrlDocCapCar;

    _CdsDocumento: TClientDataSet;
    _CdsAlteradores: TClientDataSet;
    _CdsRateio: TClientDataSet;
    _CdsContabilizacao: TClientDataSet;
    _CdsPrevisaoPendente: TClientDataSet;
    _CdsAdiantamentoPendente: TClientDataSet;
    _CdsOrigemParcelas: TClientDataSet;
    _CdsParcelas: TClientDataSet;
    // 27/01/04 Alex 5342 Múltiplas contas de baixa
    _CdsCCBaixasXDocum: TClientDataSet;
    fCodDocumento: Double;
    // INÍCIO: Marcio Motta - 18/02/2005 - 17379
    _CdsRateioDelete: TClientDataSet;
    //    FIM: Marcio Motta - 18/02/2005 - 17379

    //amf 10.03.2006 p:21669
    cdsLancamento: TClientDataSet;
    FbIntragaContabilidade: boolean;


    function FazerInsertContab( const _DebCre: string;
                                const _ContaContabil : string;
                                const _NomeConta: string;
                                const _idPlano : integer;
                                const _CentroCusto: string;
                                const _CodCCustoExterno: string;
                                const _NomeCentroCusto: string;
                                const _UnidNegoc: integer;
                                const _NomeUnidNegoc: string;
                                const _ValorCorrente: double;
                                const _ValorMoeda: double;
                                const _Historico: string;
                                const _IdPlanoPrev: integer;
                                const _IdPatro: integer;
                                const _NomePlanoPrev: string;
                                const _NomePatro: string;
                                const _iIdSegregaCriter: integer;
                                const _sDescSegregaCriter: string;
                                const _LacNumLan: integer;
                                const _SubConta: integer;
                                var   CdsContab: TClientDataSet): boolean;

    function ProcessaInsertContab ( const sDescTipoDoc: string;
                                    const iIdForCli: integer;
                                    const CdsDoc: TClientDataSet;
                                    const CdsRateio: TClientDataSet;
                                    var CdsContab: TClientDataSet): boolean;


    function GetPlacontas(const codPortForma, idforcli, idempresa, idprog, idpatro: integer;
                          const codcentrocusto, codtiporecdes: string; const recpag: string;
                          const operLancto: TOperacaoLancDocCapCar;
                          const blanceBaixa: Boolean;
                          var   PlaContas: TPlacontas): boolean;


    function GravaContaContabilRateio (var CdsRateio: TClientDataSet;
                                       const iCodPortForma: integer;
                                       const iIdForCli: integer;
                                       const iIdEmpresa: integer;
                                       const sRecPag: string;
                                       const operLancto: TOperacaoLancDocCapCar;
                                       const bLancaeBaixa: boolean): boolean;

    function DeterminaSegregacao (var CdsRateio: TClientDataSet): boolean;

    function LancaMultiplasContasBaixa (const cdsRateio: TClientDataSet;
                                        var CdsCCBaixasXDocum: TClientDataSet;
                                        var iPlanoDoc: integer;
                                        var sPlacontaDoc : string;
                                        var sCentroCustoDoc : string;
                                        var iIdSegregaCriter: integer): boolean;

    //inicio - andré tavares - pendeência 22515 - 28/06/2006
    function GetParamPlaconta(const idempresa: integer; const recpag: string): Olevariant;

    procedure GetContasTabelaAranha(var placontas: TPlacontas; const recpag: string; const codtiporecdes: string = ''; const codcentrocusto: string = '';
                                    const idempresa: integer = 0; const idpatro: integer = 0; const idprograma: integer = 0);

    procedure getContaTiporecdes(var placontas: TPlacontas;
                                 const idempresa: integer;
                                 const codtiporecdes, recpag: string);

    function GetContasForCli(var placontas: TPlacontas;
                              const idforcli, idempresa: integer;
                              const RecPag: string; const bAdiantamento: boolean): boolean;

    function getContasPortForma(var placontas: TPlacontas;
                                 const codportforma: integer): boolean;
    procedure SetbIntragaContabilidade(const Value: boolean);

    //fim - andré tavares - pendeência 22515 - 28/06/2006


  protected
    procedure AfterInitialize; Override;
  public
    //DAVID - Retenção de Imposto
    OnRetencaoINSS : TOnRetencaoINSS;

    //andre tavares - pendência 22079 - 14/07/2006 - evento para emissao de bloquete - para ficar tudo na mesma trasação
    OnEmissaoBloqueto: function: Boolean of object;

    //andre tavares - pendência 21603 - 27/07/2006 - evento para fazer qualquer pergunta no meio de um processo
    OnPergunta: TEventoPergunta;

    Constructor Create; Override;
    Destructor Destroy; Override;

    Function LerSequencia( pTabela : String ) : Double;
    function RegularizaAdiantamento( Const ovCds, ovDocumento: OleVariant; iIdUsuario, iIdEspAcesso: Integer;
            bLancaContab, bUsaPlanoPatro: Boolean; dDataRegularizacao: TDateTime ): Boolean;

    function ExcluiRegulariazaoPrevAdianto ( iCodDocOrigem, iNumLancOrigem,
       iCodDocRegulariza, iNumLancRegulariza, IdEspAcesso, IdUsuario,
       IdModulo: LongInt; UsaPlanoPatro: boolean; IdEmpresa : LongInt ): Boolean;


    (* Gustavo 03/04/2003 - Inicio *)
    function ProcessaDocumento(iIdUsuario, iIdEspAcesso, liUnidNegoc: Integer;
            bLancaContab, bUsaPlanoPatro, bExcluiPlanilha, bEnglobaParcela, bLancaEBaixa,
            bLancaeBaixaNoFinanceiro, bIntegraOrcamento: Boolean;
            Const ovDocumento, ovAlteradores, ovRateio, ovContabilizacao,
            ovPrevisaoPendente, ovAdiantamentoPendente,
            // 27/01/04 Alex 5342 Múltiplas contas de baixa
            ovCCBaixasXDocum: OleVariant;
            Operacao: TOperacao; OperacaoLanc: TOperacaoLancDocCapCar; bLancaPartidaDobrada: Boolean;
            dDataRegularizacao: TDateTime; dDataDispFinanc: TDateTime = 0; bContabilizaLancBaixAdianto: Boolean = false;
            bSlipAutomatico: Boolean = false;
            // 27/01/04 Alex 14451 - Nova Segregação Recursos
            const iIdSegregaCriter: integer = -1;
            // 27/04/04 Alex 16220 - CPMF na Lança e Baixa simultânea, parâmetro utilizado apenas na exclusão
            const iNumLoteDoc: integer = -1 ): Boolean;
    (* Gustavo 03/04/2003 - Fim *)

    function ProcessaAgrupaParcela(iIdUsuario, iIdEspAcesso: Integer;
            bLancaContab, bContratoPrevisao, bUsaPlanoPatro: Boolean; Const ovOrigem, ovParcelas: OleVariant;
            Operacao: TOperacao; DataLancto, DataEmissao: TDateTime; CodTipoDoc,
            CodPortForma, CodForma, idModulo, iPlano, pNumFatura: Integer; bLancaPartidaDobrada: Boolean): Boolean;


    property CodDocumento: Double read fCodDocumento;

    property bIntragaContabilidade: boolean read FbIntragaContabilidade write SetbIntragaContabilidade;

    procedure ImprimeEspelhoDoc(iCodDocumento: Double; IdReport: Integer; sNomeReport: String;
       OperacaoLanc: TOperacaoLancDocCapCar);

    // andre tavares - Validação dos tipos de documento para englobamento/parcelamento - pendencia 18771
    function ValidaTipoDoc(ovlOrigem: Olevariant; pcodTipoDoc : Integer): boolean;

    //inicio - andré tavares - pendeência 22515 - 28/06/2006
    function DeterminaContabilizacao(var placontas: Tplacontas; const cdsDoc: TClientDataset; var cdsCCBaixasXDocum: TClientDataset;
                                                    var cdsContab: TClientDataset; const ovcdsRateio: OleVariant; const idempresa: integer;
                                                    const idplano: integer; const blanceBaixa: boolean; const operLancto: TOperacaoLancDocCapCar;
                                                    const sDescTipoDoc: string; const recPag: char): boolean;

    //fim - andré tavares - pendeência 22515 - 28/06/2006

    {** amf 26.08.2006 21703 - Verifica pelo código do portador forma, se a
     forma de pagamento da FORMARECPAG tem vínculo com dados bancários. **}
    function VinculoBancario(RecPag: string = '';
                                               CodPortForma: double = 0): boolean;

    //amf 26.08.2006 21704 - Aviso da Duplicação do documento
    function DocumentoDuplicado(const NumDocumento: integer;
                                const ComplDocumento: string;
                                const Valor: double;
                                const IdFornecedor: integer;
                                const DataVencto: TDateTime): boolean;
  end;

implementation

Uses JclMath, uCMMath, uMensErro, Dialogs, Controls, rAutPag, rApGr3, uSistema,
     ppReport, Forms, fMostraRelat, ppTypes;

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

  _ModeloHist.InitializeAs(self);

  _Segregacao.InitializeAs(self);
end;

constructor TCtrlLancDocCapCar.Create;
Var
  X : Integer;
begin
  inherited;

  OnEmissaoBloqueto := nil;
  OnPergunta := nil;
  fbIntragaContabilidade := true;

  _Documento := TCtrlDocumento.Create;
  
  _Lancamento := TCtrlLancamento.Create;
  _Imposto := TCtrlImpostoRetido.Create;
  _Orcamento := TOrcamentoBackMT.Create;
  // 21/01/04 Alex 15965
  //_Financeiro := TCtrlFinanc.Create(0,0,0,False);
  _Financeiro := TCtrlFinanc.Create(0,0,0,true);   // o default para plano patro é true.
  _Padroes:= TCtrlPadroes.Create;
  _ModeloHist    := TCtrlModeloHistorico.Create;

  _Segregacao := TCtrlSegregacao.Create;

  _CdsDocumento := TClientDataSet.Create(nil);
  _CdsAlteradores := TClientDataSet.Create(nil);
  _CdsRateio := TClientDataSet.Create(nil);

  //Marcio Motta - 18/02/2005 - 17379
  _CdsRateioDelete := TClientDataSet.Create(nil);

  _CdsContabilizacao := TClientDataSet.Create(nil);
  _CdsPrevisaoPendente := TClientDataSet.Create(nil);
  _CdsAdiantamentoPendente := TClientDataSet.Create(nil);
  _CdsOrigemParcelas := TClientDataSet.Create(nil);
  _CdsParcelas := TClientDataSet.Create(nil);
  // 27/01/04 Alex 14451
  _CdsCCBaixasXDocum := TClientDataSet.Create(nil);

  //amf 10.03.2006 p:21669
  cdsLancamento    := TClientDataSet.Create(nil);

  // Cria o DataModulo e atribui ao ControlObject dos SqlParam a Control
  _DtmCtrlDocCapCar := TDtmCtrlDocCapCar.Create(nil);
  For X:=0 To _DtmCtrlDocCapCar.ComponentCount - 1 Do
    If _DtmCtrlDocCapCar.Components[x] is TCMSqlParams Then
      TCMSqlParams(_DtmCtrlDocCapCar.Components[x]).ControlObject := Self;
  //-------------------------------
end;

destructor TCtrlLancDocCapCar.Destroy;
begin
  _Documento.Free;
  _Lancamento.Free;
  _Financeiro.Free;
  _Imposto.Free;
  _Orcamento.Free;
  _Padroes.Free;
  _ModeloHist.Free;

  _Segregacao.Free;

  _CdsDocumento.Free;
  _CdsAlteradores.Free;
  _CdsRateio.Free;

  // Marcio Motta - 18/02/2005 - 17379
  _CdsRateioDelete.Free;

  _CdsContabilizacao.Free;
  _CdsPrevisaoPendente.Free;
  _CdsAdiantamentoPendente.Free;
  _CdsOrigemParcelas.Free;
  _CdsParcelas.Free;
  //23/01/04 Alex 5342 Múltiplas Contas de Baixa
  _CdsCCBaixasXDocum.Free;

  //amf 10.03.2006 p:21669
  FreeAndNil(cdsLancamento);

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
  Const ovDocumento, ovAlteradores, ovRateio, ovContabilizacao, ovPrevisaoPendente,
  ovAdiantamentoPendente, ovCCBaixasxDocum { 27/01/04 Alex 5342 }: OleVariant;
  Operacao: TOperacao; OperacaoLanc: TOperacaoLancDocCapCar; bLancaPartidaDobrada: Boolean;
  dDataRegularizacao: TDateTime; dDataDispFinanc: TDateTime = 0; bContabilizaLancBaixAdianto: Boolean = false;
  bSlipAutomatico: Boolean = false;
  // 27/01/04 Alex 14451 - Nova Segregação Recursos
  const iIdSegregaCriter: integer = -1;
  // 27/04/04 Alex 16220 - CPMF na Lança e Baixa simultânea, parâmetro utilizado apenas na exclusão
  const iNumLoteDoc: integer = -1 ): Boolean;

  {** ---------------------------------------------------------------------- **}
  Var
    iCodLancBaixaAdiando,
    iCodDocumento,
    iNumLancto,
    iPlnCodigo : Integer;
    // Alex 16220
    iNumLoteManual: integer;

    SistemaLancto : TSistemaLancto;
    sDebCre : String;

    rValTotAlterador, //Bruno Bastos - Pend. 14392 - 11/08/2003
    rCodLancFianc,
    rValorRateioComCompromisso,
    rValorComprometidoReserva : Double;

    // Rodolpho da Silva - P: 22592 - 04/10/2006
    iQtdeTDObrigQtdCotas : integer;

    iEmpresa,iModulo,iUsuario : Integer;
    sDscLog : String;

    _BaixaDocumentos : TCtrlBaixaDocumentos;
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
       // INÍCIO: Marcio Motta - 17/02/2005 - 17379

       //**********************************************************************
       // Código comentado porque o ClientDataSet correto a ser utilizado para
       // fazer o ESTORNO é o _CdsRateio, declarado nesta unit e ponteirado com
       // ovRateio passado como parâmetro pela função PROCESSADOCUMENTO, que
       // por sua vez é um ponteiro para o CdsDet da tela de LANÇAMENTOS.
       // O _DtmCtrlDocCapCar.CdsRateio é carregado nesta UNIT depois de
       // aplicar as alterações no banco e por isso o NUMRESERVAOLD é
       // sobrescrito pelos dados atuais e consequentemente não se consegue
       // estornar o lançamento alterado, pois o o valor contido em NUMRESERVAOLD
       // é o atual e não o antigo.
       // *********************************************************************

       // ---> (not _DtmCtrlDocCapCar.CdsRateio.FieldByName('NUMRESERVAOLD').IsNull) and
       // ---> (_Orcamento.EstornaCompromisso( _DtmCtrlDocCapCar.CdsRateio.FieldByName('NUMRESERVAOLD').AsInteger, _DtmCtrlDocCapCar.CdsRateio.FieldByName('VLRRESORCAMEN').AsFloat, True) <> 0) then

       // O Código abaixo substitui o código acima
       (not _CdsRateio.FieldByName('NUMRESERVAOLD').IsNull) and
       (_Orcamento.EstornaCompromisso( _CdsRateio.FieldByName('NUMRESERVAOLD').AsInteger, _CdsRateio.FieldByName('VLRRESORCAMEN').AsFloat, True) <> 0) then
       //    FIM: Marcio Motta - 17/02/2005 - 17379
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

       //Bruno Bastos - Pend. 14392 - 11/08/2003 - Início
       If _CdsAlteradores.FieldByName('FLGINCIDEIRRF').AsString = 'S' Then
         rValTotAlterador := rValTotAlterador + _CdsAlteradores.FieldByName('VALOR').AsFloat;
       //Bruno Bastos - Pend. 14392 - 11/08/2003 - Fim

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
                                        ( 'S' = Trim( _CdsAlteradores.FieldByName('CONTABILIZA').AsString ) ) );    // ( Not _CdsContabilizacao.IsEmpty ));

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

        sHistorico := GetHistoricoCapCar( _ModeloHist,_CdsDocumento.FieldByName('IDPESSOA').AsFloat,
                                         _CdsDocumento.FieldByName('IDMODULO').AsInteger,1,
                                         sHistorico,
                                         {[_CdsContabilizacao.FieldByName('CODDOCUMENTO').AsString,
                                         _CdsContabilizacao.FieldByName('COMPLDOCUMENTO').AsString,
                                         _CdsContabilizacao.FieldByName('RAZAOSOCIAL').AsString   ,
                                         _CdsContabilizacao.FieldByName('DSCLANCAMENTO').AsString,
                                         _CdsContabilizacao.FieldByName('DATAVENCIMENTO').AsString,
                                         _CdsContabilizacao.FieldByName('HISTORICOCOMPL').AsString]);}

                                       [ _CdsDocumento.FieldByName('NODOCUMENTO').AsString,
                                         _CdsContabilizacao.FieldByName('COMPLDOCUMENTO').AsString,
                                         _CdsContabilizacao.FieldByName('RAZAOSOCIAL').AsString,
                                         _CdsContabilizacao.FieldByName('DATAVENCIMENTO').AsString,
                                         _CdsDocumento.FieldByName('DATAPROGRAMADA').AsString,
                                         _CdsContabilizacao.FieldByName('HISTORICOCOMPL').AsString,
                                         _CdsContabilizacao.FieldByName('TIPODOCUMENTO').AsString,
                                         _CdsDocumento.FieldByName('NUMAPGR').AsString]);


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
                                      bUsaPlanoPatro,
                                      // 13/01/04 Alex 14451 - pendente
                                      _CdsContabilizacao.FieldByName('IDSEGREGACRITER').AsInteger,
                                      _CdsDocumento.FieldByName('DATALANCTO').AsDateTime) Then
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
  procedure InicializaImposto;
  var
    x, y : extended;
  begin
     // 21/01/04 Alex 15965
     _Imposto.UsaPlanoPatro := bUsaPlanoPatro;
     _Imposto.NumLanctoOrigem := 0;
     _Imposto.PartidaDobrada := bLancaPartidaDobrada;
     _Imposto.IdPlanoConta := _CdsDocumento.FieldByName('PLANO').AsInteger;
     _Imposto.IntegraContab := bLancaContab;
     _Imposto.IdEmpresa := _CdsDocumento.FieldByName('IDPESSOA').AsInteger;
     _Imposto.RecPag := _CdsDocumento.FieldByName('RECPAG').AsString[1];
     _Imposto.IdUsuario := iIdUsuario;

      //andré tavares - pendência 21219 - 06/02/2006 - aproveitei para resolver o bug da autorização de lançamento de documentos
      _Imposto.IdEspAcesso := iIdEspAcesso;

     _Imposto.IdModulo := _CdsDocumento.FieldByName('IDMODULO').AsInteger;
     _Imposto.DataProgramada := _CdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime;
     _Imposto.OperacaoDocumento := '2';
     _Imposto.IdForCli := _CdsDocumento.FieldByName('IDFORCLI').AsInteger;
     _Imposto.CodDocumento := iCodDocumento;
     _Imposto.NumLancto := iNumLancto;
     _Imposto.ValorLancto := _CdsDocumento.FieldByName('VALOR').AsFloat - rValTotAlterador;
     _Imposto.ValorLiquido := 0;
     _Imposto.DataLancto := _CdsDocumento.FieldByName('DATALANCTO').AsDateTime;
     _Imposto.DataEmissao := _CdsDocumento.FieldByName('DATAEMISSAO').AsDateTime;
     _Imposto.DebCre := _CdsDocumento.FieldByName('DEBCRE').AsString;
     _Imposto.MomentoLancamento := mlLancamento;
     _Imposto.CodTipoDoc := _CdsDocumento.FieldByName('CODTIPDOC').AsInteger;

     //DAVID - Retenção de Imposto
     _Imposto.OnRetencaoINSS     := Self.OnRetencaoINSS;
  end;
begin

  if ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ProcessaDocumento(iIdUsuario, iIdEspAcesso, liUnidNegoc,
            bLancaContab, bUsaPlanoPatro, bExcluiPlanilha, bEnglobaParcela, bLancaEBaixa,
            bLancaeBaixaNoFinanceiro, bIntegraOrcamento,
            ovDocumento, ovAlteradores, ovRateio, ovContabilizacao,
            ovPrevisaoPendente, ovAdiantamentoPendente, ovCCBaixasxDocum,
            Integer(Operacao), Integer(OperacaoLanc), bLancaPartidaDobrada,
            dDataRegularizacao, dDataDispFinanc, bContabilizaLancBaixAdianto, bSlipAutomatico,
            // 27/01/04 Alex 14451 - Nova Segregação Recursos
            iIdSegregaCriter, { Alex 16220 27/04/04} iNumLoteDoc);

     If Not Result Then  MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin

     //andre tavares - pendência 21603 - 27/07/2006 - evento para fazer qualquer pergunta no meio de um processo
     if assigned(OnPergunta) then
       _Documento.OnPergunta := OnPergunta;

     //andré tavares - pendência 21601 - baixa por planos de benefícios
     _BaixaDocumentos := TCtrlBaixaDocumentos.Create;
     _BaixaDocumentos.InitializeAs(self);

     rValTotAlterador := 0; //Bruno Bastos - Pend. 14392 - 11/08/2003
     iPlnCodigo := 0;

     // Rodolpho da Silva - P: 22592 - 04/10/2006
     iQtdeTDObrigQtdCotas := 0;



     Result := True;

     _CdsContabilizacao.Data := ovContabilizacao;
     _CdsAlteradores.Data := ovAlteradores;
     _CdsRateio.Data := ovRateio;
     _CdsContabilizacao.Data := ovContabilizacao;
     _CdsDocumento.Data := ovDocumento;
     _CdsAdiantamentoPendente.Data := ovAdiantamentoPendente;
     _CdsPrevisaoPendente.Data := ovPrevisaoPendente;
     // 23/01/04 Alex 14451 Múltiplas Contas de Baixa
     _CdsCCBaixasXDocum.Data := ovCCBaixasXDocum;

     // INÍCIO: Marcio Motta - 18/02/2005 - 17379
     _CdsRateioDelete.Data := ovRateio;


     //início - andré tavares - pendência 23416 - 29/10/2006
     if (_CdsDocumento.fieldByName('DATAPROGRAMADA').value <> _CdsDocumento.fieldByName('DATAPROGRAMADA').Oldvalue) and
        (not _CdsDocumento.fieldByName('DATADISPONIB').IsNull) then
     begin
       dDataDispFinanc := _CdsDocumento.fieldByName('DATAPROGRAMADA').Value;
     end;
     //fim - andré tavares - pendência 23416 - 29/10/2006


     // Rodolpho da Silva - 21/06/2005
     // Foi inserido esta verificação pois em alguns casos onde o rateio
     //não é necessário, o _CdsRateioDelete ficava vazio então, ao tentar executar um StatusFilter,
     //gerava um erro de "Cds is not edit mode"
     if (not _CdsRateioDelete.IsEmpty) then

        _CdsRateioDelete.StatusFilter := [usDeleted];
     //    FIM: Marcio Motta - 18/02/2005 - 17379


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
                  (* Gustavo 03/04/2003 - Inicio *)
                  begin
                     _Documento.Prepare( OpDocumento, odlEfetivo );
                     _Documento.DataDisponibilidade := dDataDispFinanc;
                  end;
                  (* Gustavo 03/04/2003 - Fim *)
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
           _Documento.SlipAutomatico := bSlipAutomatico;

           // Alex 16220 26/04/04
           if bLancaEBaixa then
             iNumLoteManual :=  GetSequence('LOTEMANUAL')
           else
             iNumLoteManual := 0;


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
                                       // INÍCIO - andre tavares - pendência 16953 - 15/06/2004
                                       //'',
                                       _CdsDocumento.FieldByName('NOSSONUMERO').AsString,
                                       // FIM - andre tavares - pendência 16953 - 15/06/2004
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
                                       _CdsDocumento.FieldByName('CODFORMA').AsInteger,
                                       // 27/01/04 Alex 14451
                                       iIdSegregaCriter);

                  _Documento.Lanctodocum.SetValues(_CdsDocumento.FieldByName('DATALANCTO').AsDateTime,
                                                   _CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger,
                                                   _CdsDocumento.FieldByName('NUMLANCTO').AsInteger,
                                                   _CdsDocumento.FieldByName('VLRLIQUIDO').AsFloat,
                                                   _CdsDocumento.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                   _CdsDocumento.FieldByName('VALOR').AsFloat,
                                                   0,
                                                   iPlnCodigo,
                                                   // Alex 26/04/04 16220 0,
                                                   iNumLoteManual,
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
                     // Início - Rodolpho da Silva - P: 22592 - 04/10/2006
                     if (iQtdeTDObrigQtdCotas > 1) then
                        raise Exception.Create('Existem ' + IntToStr(iQtdeTDObrigQtdCotas) +
                                               ' tipos de Recebimento/Desembolso que obrigam quantidade de cotas. ' +
                                               'Para esta operação, somente é possível permitir apenas um tipo de Recebimento/Desembolso ' +
                                               'que obrigue a quantidade de cotas.');

                     _Cds.Data := GetDataPacket('SELECT NVL(FLGOBRQTDECOTAS,''N'') AS FLGOBRQTDECOTAS ' +
                                                'FROM TIPORECEBDESEMB ' +
                                                'WHERE TRIM(CODTIPRECDES) = ' + QuotedStr(Trim(_CdsRateio.FieldByName('CODTIPRECDES').AsString)));
                     if (_Cds.FieldByName('FLGOBRQTDECOTAS').AsString = 'S') then
                        Inc(iQtdeTDObrigQtdCotas);
                     // Fim - Rodolpho da Silva - P: 22592 - 04/10/2006


                     if not _cdsRateio.FieldByName('IDSEGREGACONTR').IsNull then //início - andre tavares - pendência 22278 - 19/08/2006
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
                                                        _CdsRateio.FieldByName('NUMIMOVEL').AsString,
                                                        false,
                                                        _cdsRateio.fieldByName('IDPLANOVIRTUAL').asInteger,
                                                        _cdsRateio.fieldByName('IDSEGREGACONTR').asInteger
                                                        )
                     else //fim - andre tavares - pendência 22278 - 19/08/2006
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

                  // 27/01/04 Alex 14451 - Múltiplas contas de baixa
                  if not _CdsCCBaixasXDocum.isEmpty then begin
                    _CdsCCBaixasXDocum.First;
                    while not _CdsCCBaixasXDocum.Eof do begin
                      _Documento.CcBaixasxDocum.SetValues (_CdsCCBaixasXDocum.FieldByName('VALOR').AsFloat,
                                                           0,
                                                           _CdsCCBaixasXDocum.FieldByName('IDPESSOA').AsInteger,
                                                           _CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger,
                                                           _CdsCCBaixasXDocum.FieldByName('UNIDNEGOC').AsInteger,
                                                           _CdsCCBaixasXDocum.FieldByName('PLANO').AsInteger,
                                                           _CdsCCBaixasXDocum.FieldByName('IDPLANOPREV').AsInteger,
                                                           _CdsCCBaixasXDocum.FieldByName('IDPATRO').AsInteger,
                                                           _CdsCCBaixasXDocum.FieldByName('IDSEGREGACRITER').AsInteger,
                                                           _CdsCCBaixasXDocum.FieldByName('PLACONTA').AsString);

                      _CdsCCBaixasXDocum.Next;
                    end;
                  end;
                  // Fim 27/01/04 Alex 14451 - Múltiplas contas de baixa

                 {amf 16.03.2006
                  If Operacao = opInserir Then
                  Begin
                     If Not _Documento.Insert Then
                        Raise Exception.Create( MSG_ERRO_INSERIR_DOC + _Documento.MessageInfo );
                  End
                  Else
                  Begin
                     if Not _Documento.Update Then
                        Raise Exception.Create( MSG_ERRO_INSERIR_DOC + _Documento.MessageInfo );
                  End; }

                  //amf 16.03.2006 p:21669 - inicio
                  case Operacao of
                       opInserir : begin
                                       If Not _Documento.Insert Then
                                          Raise Exception.Create( MSG_ERRO_INSERIR_DOC + _Documento.MessageInfo );
                                    end;

                       opAlterar : begin
                                       If Not _Documento.Update Then
                                          Raise Exception.Create( MSG_ERRO_ALTERAR_DOC + _Documento.MessageInfo );
                                    end;

                       opApagar : begin
                                       If Not _Documento.Delete Then
                                          Raise Exception.Create( MSG_ERRO_EXCLUIR_DOC + _Documento.MessageInfo );
                                    end;
                  end;
                 //amf 16.03.2006 p:21669 - fim


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
                                                     // Alex 26/04/04 16220 0,
                                                     iNumLoteManual,
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
                                                     bContabilizaLancBaixAdianto,
                                                     (* (Not  _CdsContabilizacao.IsEmpty ) *)
                                                     _CdsDocumento.FieldByName('CODPORTFORMA').AsInteger);
                    If Not _Documento.Update Then
                       Raise Exception.Create( MSG_ERRO_BAIXA_ADIANTO + _Documento.MessageInfo );

                    if not ExecSQL('UPDATE LANCTODOCUM SET FLGLANCBAIXAADTO = ''S'' WHERE CODDOCUMENTO = ' + IntToStr(iCodLancBaixaAdiando) + ' AND NUMLANCTO = ' + IntToStr(iNumLancto)) then
                       Raise Exception.Create( MSG_ERRO_MARCA_BAIXA_ADIANTO + _Documento.MessageInfo );

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
                                                   // Alex 26/04/04 16220 _CdsDocumento.FieldByName('NUMCHQBORDERO').AsInteger,
                                                   iNumLoteManual,
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
                     InicializaImposto;

                     If Operacao = opInserir Then begin
                        _Imposto.Incluir;
                     end Else begin
                        _Imposto.NumLanctoOrigem := iNumLancto;
                        _Imposto.Excluir;

                        InicializaImposto;
                        _Imposto.Incluir;
                     end;
                  End else begin
                     // Alex 19/04 16220
                     // Lançar CPMF com lança e baixa simultânea
                     if bLancaEBaixa then begin
                        InicializaImposto;

                        // modificar os parâmetros para CPMF
                        _Imposto.MomentoLancamento := mlBaixa;
                        {if _Imposto.DebCre = 'D' then
                          _Imposto.DebCre := 'C'
                        else
                          _Imposto.DebCre := 'D';
                        }

                        _Imposto.CodPortForma := _CdsDocumento.FieldByName('CODPORTFORMA').AsInteger;
                        _Imposto.NumLote := -1;
                        _Imposto.NumLoteManual := iNumLoteManual;
                        _Imposto.Incluir;  // não sei o motivo real, mas é obrigatório chamar este método

                        _Imposto.NumLote := -1;
                        _Imposto.NumLoteManual := iNumLoteManual;
                        _Imposto.CodPortForma := _CdsDocumento.FieldByName('CODPORTFORMA').AsInteger;
                        _Imposto.EfetivaNovoDocumento;
                     end;
                     // fim Alex 19/04 16220
                     // Lançar CPMF com lança e baixa simultânea
                  end;

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
                       // INÍCIO: Marcio Motta - 18/02/2005 - 17379
                       // ******************************************************
                       // Faz o estorno no ORÇAMENTO dos registros EXCLUÍDOS do
                       // RATEIO no documento do Contas a Pagar.
                       // ******************************************************
                       if (Operacao = OpAlterar) and
                          (_CdsRateioDelete.StatusFilter = [usDeleted]) and
                          (_CdsRateioDelete.RecordCount > 0) then
                          begin
                            _CdsRateioDelete.First;
                            while not _CdsRateioDelete.Eof do
                              begin
                                if ( _Orcamento.EstornaCompromisso( _CdsRateioDelete.FieldByName('NUMRESERVAOLD').AsInteger, _CdsRateioDelete.FieldByName('VLRRESORCAMEN').AsFloat, True) <> 0) then
                                  raise Exception.Create(MSG_ERRO_ESTORNA_ORCAMENTO + _Orcamento.MessageInfo);

                                _CdsRateioDelete.Next;
                              end;
                          end;
                       //   FIM: Marcio Motta - 18/02/2005 - 17379

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

                  // 16220 excluir a CPMF quando for lança e baixa simultânea
                  if bLancaEBaixa then begin
                     _Imposto.CodDocumento    := _CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger;
                     _Imposto.NumLancto       := 0;
                     _Imposto.NumLanctoOrigem := 0;
                     _Imposto.TipoExclusao    := teSoBaixa;
                     _Imposto.NumLote         := -1;
                     _Imposto.NumLoteManual   := iNumLoteDoc;
                     _Imposto.Excluir;
                  end;
                  // fim 16220 excluir a CPMF quando for lança e baixa simultânea


                  sDscLog  := 'Excluir ' + sDscLog;
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

        //andre tavares - pendência 22079 - 14/07/2006
        // se o evento estiver associado e se for um lançamento de documento
          if assigned(OnEmissaoBloqueto) and (operacaoLanc = opldEfetivo) then
            if not OnEmissaoBloqueto then
              Raise Exception.Create('Não foi possível emitir a Ficha de compensação.');


         //andré tavares - pendência 21601 - baixa por planos de benefícios
         If bLancaEBaixa Then
         begin
           if not _BaixaDocumentos.VerificaPortadorContaXPlano( trunc(_Documento.CodDocumento),
                                                                _CdsDocumento.FieldByName('CODPORTFORMA').AsInteger ) then
           begin
             messageinfo := 'Um ou mais documentos selecionados possuem rateios cujos planos previdenciários'+#13+
                             'contábeis não estão relacionados à Conta Caixa X Forma de Pagamento selecionada.';
             raise exception.create( messageinfo );
           end;
         end;

         //andré tavares - pendência 21601 - baixa por planos de benefícios
         _BaixaDocumentos.Free;
         
        Commit;




     except
        On E:Exception Do
         Begin
           //andré tavares - pendência 21601 - baixa por planos de benefícios
            _BaixaDocumentos.Free;
            Result := False;
            Rollback;
            //DAVID - Retenção de Imposto
            if ( E is EAbort ) then
              MessageInfo := ''
            else
              MessageInfo := E.Message;
         End;
     End;
  End;
end;

function TCtrlLancDocCapCar.ProcessaAgrupaParcela(iIdUsuario,
  iIdEspAcesso: Integer; bLancaContab, bContratoPrevisao, bUsaPlanoPatro: Boolean; Const ovOrigem,
  ovParcelas: OleVariant; Operacao: TOperacao; DataLancto, DataEmissao: TDateTime;
  CodTipoDoc, CodPortForma, CodForma, idModulo, iPlano, pNumFatura: Integer;
  bLancaPartidaDobrada: Boolean): Boolean;

  var
   iEmpresa,iModulo,iUsuario : Integer;
   sDscLog : String;
   //início - andre tavares - penência 18771 - 04/04/2005
   sFiltro, sSql, sCCbaixaCmp : string;
   cdsCCBaixasXDocum : TClientDataSet;
   iTotCCBaixas, iTotIdSegregaCriter, iIdSegregaCriter : integer;
   bMultiplasContasBaixa : Boolean;
   //fim - andre tavares - penência 18771 - 04/04/2005
  {****************************************************************************}
   { andre tavares - pendência 18771 - retirei esta trava, pois ela
     não permite o englobamento ou parcelamento de documentos com contas de baixas diferentes

  function VerificaPlaconta: Boolean;
    var
      sPlaconta: string;
  begin
    result := true; //andre tavares - pendência 18771 - 05/04/2005
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

  end;}

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
                            // inicio - andre tavares - pendencia 18771 - 05/04/2005
                            // _CdsOrigemParcelas.FieldByName('PLACONTA').AsString,
                            cdsCCBaixasXDocum.fieldByName('PLACONTA').AsString,
                            // fim - andre tavares - pendencia 18771 - 05/04/2005
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
                            CodForma,
                            // 13/01/04 Alex 14451 Pendente
                            // inicio - andre tavares - pendencia 18771 - 05/04/2005
                            //-1);
                            cdsCCBaixasXDocum.fieldByName('IDSEGREGACRITER').asInteger);
                            // fim - andre tavares - pendencia 18771 - 05/04/2005


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

       //início - André Tavares - pendência 18771 - 05/04/2005
       // colocar id fi multipalascontas
       if bMultiplasContasBaixa then
       begin
         CdsCCBaixasXDocum.First;
         while not CdsCCBaixasXDocum.Eof do
         begin
           _Documento.CcBaixasxDocum.SetValues (CdsCCBaixasXDocum.FieldByName('VALOR').AsFloat,
                                               0,
                                               CdsCCBaixasXDocum.FieldByName('IDPESSOA').AsInteger,
                                               _CdsParcelas.FieldByName('CODDOCUMENTO').AsInteger,
                                               CdsCCBaixasXDocum.FieldByName('UNIDNEGOC').AsInteger,
                                               CdsCCBaixasXDocum.FieldByName('PLANO').AsInteger,
                                               CdsCCBaixasXDocum.FieldByName('IDPLANOPREV').AsInteger,
                                               CdsCCBaixasXDocum.FieldByName('IDPATRO').AsInteger,
                                               CdsCCBaixasXDocum.FieldByName('IDSEGREGACRITER').AsInteger,
                                               CdsCCBaixasXDocum.FieldByName('PLACONTA').AsString);

           CdsCCBaixasXDocum.Next;
         end;
       end;
       //fim - André Tavares - pendência 18771 - 05/04/2005

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

       If Operacao = opInserir Then
         _Imposto.Incluir;

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

    (*
    _CdsOrigemParcelas.first;
    while not _CdsOrigemParcelas.eof do
    begin
       result := ExecSQL( 'UPDATE DOCUMENTO SET NUMFATURA = NULL, STATUS = ''0'' WHERE CODDOCUMENTO = ' + _CdsOrigemParcelas.FieldByName('CODDOCUMENTO').AsString );

       if not result then raise Exception.Create( MessageInfo );

       _CdsOrigemParcelas.next;
    end;
    *)

    result := ExecSQL( 'UPDATE DOCUMENTO SET NUMFATURA = NULL, STATUS = ''0'', NUMAPGR = NULL WHERE NUMFATURA = ' + IntToStr(pNumFatura));
    if not result then raise Exception.Create( MessageInfo );
  end;

begin
  if ConnectionSide = cnsClient then
  begin
     Result := Connection.AppServer.ProcessaAgrupaParcela(iIdUsuario, iIdEspAcesso,
            bLancaContab, bContratoPrevisao, bUsaPlanoPatro, ovOrigem, ovParcelas,
            Operacao, DataLancto, DataEmissao, CodTipoDoc, CodPortForma, CodForma,
            idModulo, iPlano, pNumFatura, bLancaPartidaDobrada);

     if not Result then
       MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     _CdsOrigemParcelas.Data := ovOrigem;
     _CdsParcelas.Data := ovParcelas;


     //início - andre tavares - pendência 18771 - 04/04/2005
     cdsCCBaixasXDocum := TclientDataset.Create(nil);
     sFiltro := '';
     iIdSegregaCriter := -1;
     sCCbaixaCmp := '';
     _CdsOrigemParcelas.first;
     while not _CdsOrigemParcelas.eof do
     begin
       sFiltro := sFiltro + _CdsOrigemParcelas.fieldByName('CODDOCUMENTO').asString + ',';
       _CdsOrigemParcelas.Next;
     end;
     sFiltro[length(sFiltro)] := ' ';

     sSql := ' SELECT PLANO, PLACONTA, IDPESSOA, UNIDNEGOC, '+
             '        IDPATRO, IDPLANOPREV, IDSEGREGACRITER, SUM(VALOR) AS VALOR '+
             'FROM ( '+
             'SELECT '+
             '  C.PLANO, C.PLACONTA, '+
             '  C.IDPESSOA, C.UNIDNEGOC, '+
             '  C.IDPATRO, C.IDPLANOPREV, '+
             '  NVL(C.IDSEGREGACRITER, -1) AS IDSEGREGACRITER, '+
             'SUM(C.VALOR) AS VALOR '+
             'FROM CCBAIXASXDOCUM C '+
             'WHERE C.CODDOCUMENTO IN ( '+ sFiltro +') '+
             'GROUP BY C.PLANO, C.PLACONTA, C.IDPESSOA, C.UNIDNEGOC, '+
             '         C.IDPATRO, C.IDPLANOPREV, C.IDSEGREGACRITER '+
             'UNION ALL '+
             'SELECT '+
             '  R.PLANO, D.PLACONTA, '+
             '  R.IDPESSOA, R.UNIDNEGOC, '+
             '  R.IDPATRO, R.IDPLANOPREV, '+
             '  NVL(D.IDSEGREGACRITER, -1) AS IDSEGREGACRITER, '+
             '  SUM(R.VALOR) AS VALOR '+
             'FROM RATEIODOCUM R, DOCUMENTO D '+
             'WHERE R.CODDOCUMENTO IN ( '+ sFiltro +') AND'+
             '      D.CODDOCUMENTO = R.CODDOCUMENTO AND D.PLACONTA IS NOT NULL '+
             'GROUP BY R.PLANO, D.PLACONTA, R.IDPESSOA, R.UNIDNEGOC, '+
             '         R.IDPATRO, R.IDPLANOPREV, D.IDSEGREGACRITER ) '+
             'GROUP BY PLANO, PLACONTA, IDPESSOA, UNIDNEGOC, '+
             '         IDPATRO, IDPLANOPREV, IDSEGREGACRITER';

     cdsCCBaixasXDocum.Data := GetDataPacket(sSql);
     cdsCCBaixasXDocum.First;
     sCCbaixaCmp := cdsCCBaixasXDocum.fieldByName('PLACONTA').asString;
     iIdSegregaCriter := cdsCCBaixasXDocum.fieldByName('IDSEGREGACRITER').asInteger;
     iTotIdSegregaCriter := 1;
     iTotCCBaixas := 1;
     bMultiplasContasBaixa := false;

     while not cdsCCBaixasXDocum.Eof do
     begin
       if trim(cdsCCBaixasXDocum.fieldByName('PLACONTA').asString) <> trim(sCCbaixaCmp) then
       begin
         sCCbaixaCmp := cdsCCBaixasXDocum.fieldByName('PLACONTA').asString;
         inc(iTotCCBaixas);
       end;
       if iIdSegregaCriter <> cdsCCBaixasXDocum.fieldByName('IDSEGREGACRITER').asInteger then
       begin
         iIdSegregaCriter := cdsCCBaixasXDocum.fieldByName('IDSEGREGACRITER').asInteger;
         inc(iTotIdSegregaCriter);
       end;
       cdsCCBaixasXDocum.Next;
     end;//while

     bMultiplasContasBaixa := (iTotCCBaixas > 1) or (iTotIdSegregaCriter > 1);


//     result := VerificaPlaconta;
     //if result then
     //begin
     //fim - andre tavares - pendência 18771 - 04/04/2005
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

        //início - andre tavares - pendência 18771 - 06/04/2005
        cdsCCBaixasXDocum.Free;
        //free - andre tavares - pendência 18771 - 06/04/2005
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
            //início - andre tavares - pendência 18771 - 06/04/2005
            cdsCCBaixasXDocum.Free;
            //FIM - andre tavares - pendência 18771 - 06/04/2005
            Result := False;
            MessageInfo := E.Message;
         End;
     End;
     //end;
  end;
end;

function TCtrlLancDocCapCar.RegularizaAdiantamento( Const ovCds, ovDocumento: OleVariant; iIdUsuario,
         iIdEspAcesso: Integer; bLancaContab, bUsaPlanoPatro: Boolean; dDataRegularizacao: TDateTime ): Boolean;
begin
  Result := ProcessaDocumento( iIdUsuario, iIdEspAcesso, 0, bLancaContab, bUsaPlanoPatro,
            false, false, false, false, false, ovDocumento, null, null, null, null, ovCds,
            // 27/01/04 Alex 5342 Múltiplas contas de baixa - pendente
            null,
            opInserir, opRegAdiantamento, false, dDataRegularizacao );
end;

procedure TCtrlLancDocCapCar.ImprimeEspelhoDoc(iCodDocumento: Double; IdReport: Integer; sNomeReport: String;
      OperacaoLanc: TOperacaoLancDocCapCar);
Var
   sMensagem: String;
   sExibir : String;
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
            If MsgDlg('Exibir as informações da Contabilização?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
              sExibir := ' True '
            else
              sExibir :=' False ';
            If not TRptApGr3.PrintReport(IdReport, 1, Sistema.IdEmpresa, Sistema.IdUsuario,
              Sistema.IdModulo, FloatToStr(iCodDocumento) + '|=|'+ sExibir + '|=| |=| |=|', '',
               'BaseDados', Sistema.NomeEmpresa, Sistema.NomeModulo, sMensagem) then
            MsgDlg(sMensagem, 'Impressão do Espelho do Documento "' + sNomeReport, mtError, [], 0);
         end;
         Else
            MsgDlg( sMensagem + 'O Relatório "' + sNomeReport + '" não foi implementado para impressão automática.', 'Aviso', mtWarning, [], 0 );
       end;
     end;
end;
//************************************************
Function TCtrlLancDocCapCar.LerSequencia(pTabela: String): Double;
Begin
  Result := GetSequence( pTabela );
End;

//início - andre tavares - Validação dos tipos de documento para englobamento/parcelamento - pendencia 18771
function TCtrlLancDocCapCar.ValidaTipoDoc(ovlOrigem: Olevariant; pcodTipoDoc : Integer): boolean;
var cds, cdsTipDocFinal: TClientDataSet;
    bDocFiscal: Boolean;
    iCodTipDoc: Integer;
begin
  cds := TClientDataSet.Create(nil);
  cdsTipDocFinal := TClientDataSet.Create(nil);
  cds.data := ovlOrigem;
  cds.First;
  bDocFiscal := cds.fieldbyName('FLGDOCFISCAL').asString = 'S'; //TIPO DE DOCUMENTO DOS DOCUMENTOS DE ORIGEM
  iCodTipDoc := cds.fieldbyName('CODTIPDOC').asInteger;
  result := true;

  while not cds.eof do
  begin
    if cds.fieldbyName('CODTIPDOC').asInteger <> iCodTipDoc then
    begin
      result := false;
      Messageinfo := 'Não se pode englobar/parcelar documentos de tipos diferentes, '+
                     'pois a contabilização não ficaria correta.';
      break;
    end;
    cds.Next;
  end;

  if result then
  begin
     //BUSCA O TIPO DO DOCUMENTO de destino (OPERAÇÃ0 3)
     cdsTipDocFinal.Close;
     cdsTipDocFinal.Data := GetDataPacket('SELECT CODTIPDOC, NVL(FLGDOCFISCAL, ''S'') '+
                               ' AS FLGDOCFISCAL FROM TIPODOCRECPAG WHERE CODTIPDOC = '+ intToStr(pCodTipoDoc));

     // se os documentos de origem e o documento destino forem do tipo FISCAL então dá erro
     if (bDocFiscal) and (cdsTipDocFinal.fieldbyName('FLGDOCFISCAL').asString = 'S') then
     begin
       result := false;
       Messageinfo := 'O tipo de documento do Englobamento/Parcela não pode ser do tipo Fiscal, '+
                      'pois os documento(s) de origem já são do tipo Fiscal e já tem descontos de impostos.';
     end;

     // se os documentos de origem e o documento destino forem do tipo NÃO FISCAL então dá erro
     if (not bDocFiscal) and (cdsTipDocFinal.fieldbyName('FLGDOCFISCAL').asString <> 'S') then
     begin
       result := false;
       Messageinfo := 'O tipo de documento do Englobamento/Parcela tem que ser do tipo Fiscal, '+
                      'pois os documento(s) de origem não são e ainda não tem descontos de impostos.';
     end;

  end;

  cds.free;
  cdsTipDocFinal.Free;
end;
//fim - andre tavares




//BUSCA A PARAMETRIZACAO DE BUSCA DAS PLACONTAS
function TCtrlLancDocCapCar.GetParamPlaconta(const idempresa: integer; const recpag: string): Olevariant;
begin
  try
    result := getdataPacket(' SELECT NVL(FLGPCPDECCPRPA, ''N'') AS FLGPCPDECCPRPA, NVL(FLGPCPDECCPR, ''N'') AS FLGPCPDECCPR, '+
                            '        NVL(FLGPCPDECC, ''N'')     AS FLGPCPDECC,     NVL(FLGPCPDEPR, ''N'')   AS FLGPCPDEPR,   '+
                            '        NVL(FLGPCPDECCPA, ''N'')   AS FLGPCPDECCPA,   NVL(FLGPCPDEPRPA, ''N'') AS FLGPCPDEPRPA, '+
                            '        NVL(FLGPCPDEPA, ''N'')     AS FLGPCPDEPA,     NVL(FLGPCPDE, ''N'')     AS FLGPCPDE      '+
                            ' FROM PARAMCAP WHERE IDPESSOA = '+ intTostr(idempresa) +' AND RECPAG = '+ quotedStr(recpag) );
  except
    on e: Exception do
      self.messageInfo := e.Message;
  end;
end;


//busca as placontas para contabilização
function TCtrlLancDocCapCar.GetPlacontas(const codPortForma, idforcli, idempresa, idprog, idpatro: integer;
                                         const codcentrocusto, codtiporecdes: string; const recpag: string;
                                         const operLancto: TOperacaoLancDocCapCar;
                                         const blanceBaixa: boolean;
                                         var   PlaContas: TPlacontas): boolean;

var cdsParamPlaconta : TClientDataset;
    ssql : string;

    function ObrigaSubconta(sPlaconta: string): boolean;
    begin
      Result := False;
      if ( ParamIntegra.IntegraContab ) AND ( sPlaconta <> '' )  then
      begin
        with TClientDataset.Create(nil) do
        begin
          try
            data := getDataPacket('SELECT PLASUBCONTA FROM PLANOCONTA WHERE RTRIM(PLACONTA) = RTRIM('+ sPlaconta +') AND PLANO = '+ intTostr(paramIntegra.Plano));
            if not IsEmpty then
              Result := (FieldByName('PLASUBCONTA').AsString = 'S');
          finally
            free;
          end;//try
        end;//with
      end; //if
    end;//function

begin
  result := true;

  PlaContas.sPlaconta       := '';
  PlaContas.iSubConta       := 0;
  PlaContas.sPlacontaPass   := '';
  PlaContas.iSubContaPass   := 0;
  PlaContas.iPlano          := paramIntegra.Plano;

  cdsParamPlaconta := TClientDataset.Create(nil);
  sSql := '';
  try
    try


      // Adiantamento
      // CAP - D - conta adiantamento Fornecedor
      // CAR - C - conta adiantamento Cliente
      if ( operLancto = opldAdiantamento ) then
        if not GetContasForCli(PlaContas, idforcli, idempresa, recpag, true) then
          raise exception.create(messageinfo);


      // Lança e baixa simultânea
      // CAP - C - conta do Portador Forma
      // CAR - D - conta do Portador Forma
      if blanceBaixa then
        if not GetContasPortForma(PlaContas, codPortForma) then
          raise exception.create(messageinfo);



      cdsParamPlaconta.Data := GetParamPlaconta(idempresa, recpag);

      //buscas na tabela aranha
      if trim(cdsParamPlaconta.fieldByName('FLGPCPDECCPRPA').asString) = 'S' then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, codcentrocusto, idempresa, idpatro, idprog);

      if ( (trim(PlaContas.sPlaconta) = '') or
           (trim(PlaContas.sPlacontaPass) = '') ) and
           (trim(cdsParamPlaconta.fieldByName('FLGPCPDECCPR').asString) = 'S') then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, codcentrocusto, idempresa, 0, idprog);

      if ( (trim(PlaContas.sPlaconta) = '') or
           (trim(PlaContas.sPlacontaPass) = '') ) and
           (trim(cdsParamPlaconta.fieldByName('FLGPCPDECC').asString) = 'S') then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, codcentrocusto, idempresa, 0, 0);

      if ( (trim(PlaContas.sPlaconta) = '') or
           (trim(PlaContas.sPlacontaPass) = '') ) and
           (trim(cdsParamPlaconta.fieldByName('FLGPCPDEPR').asString) = 'S') then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, '', idempresa, 0, idprog);

      if ( (trim(PlaContas.sPlaconta) = '') or
           (trim(PlaContas.sPlacontaPass) = '') ) and
           (trim(cdsParamPlaconta.fieldByName('FLGPCPDECCPA').asString) = 'S') then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, codcentrocusto, idempresa, idpatro, 0);

      if ( (trim(PlaContas.sPlaconta) = '') or
           (trim(PlaContas.sPlacontaPass) = '') ) and
           (trim(cdsParamPlaconta.fieldByName('FLGPCPDEPRPA').asString) = 'S') then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, '', idempresa, idpatro, idprog);

      if ( (trim(PlaContas.sPlaconta) = '') or
           (trim(PlaContas.sPlacontaPass) = '') ) and
           (trim(cdsParamPlaconta.fieldByName('FLGPCPDEPA').asString) = 'S') then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, '', idempresa, idpatro, 0);

      if ( (trim(PlaContas.sPlaconta) = '') or
           (trim(PlaContas.sPlacontaPass) = '') ) and
           (trim(cdsParamPlaconta.fieldByName('FLGPCPDE').asString) = 'S') then
        GetContasTabelaAranha(PlaContas, recpag, codtiporecdes, '', idempresa, 0, 0);

      //se não achou na tabela aranha entao busca na tabela tiporecebdesemb OU se achou a conta e a mesma obriga subconta
      if (trim(PlaContas.sPlaconta) = '') or
         ( (trim(PlaContas.sPlacontaPass) <> '') and
           ((ObrigaSubconta(PlaContas.sPlaconta) or ObrigaSubconta(PlaContas.sPlacontaPass))
         ) ) then
        getContaTiporecdes(PlaContas, idempresa, codtiporecdes, recpag);

      //se não achou na tabela aranha entao busca na tabela tiporecebdesemb OU se achou a conta e a mesma obriga subconta
//      if (PlaContas.sPlacontaPass = '') or
//         ((trim(PlaContas.sPlacontaPass) <> '') and ObrigaSubconta(PlaContas.sPlacontaPass)) then
//        getContaTiporecdes(PlaContas, idempresa, codtiporecdes, recpag);

      // busca a conta no fornecedor ou cliente
      if ( (trim(PlaContas.sPlaconta) = '') or (trim(PlaContas.sPlacontaPass) = '') ) or
         (
           ((Placontas.iSubConta = 0) or (Placontas.iSubContaPass = 0)) and
           (ObrigaSubconta(PlaContas.sPlaconta) or ObrigaSubconta(PlaContas.sPlacontaPass)
          )) then
        GetContasForCli(PlaContas, idforcli, idempresa, recpag, false);




    except
      on e: Exception do
      begin
        messageInfo := e.Message;
        result := false
      end;
    end;

  finally
    cdsParamPlaconta.Free;
  end;
end;



procedure TCtrlLancDocCapCar.GetContasTabelaAranha(var placontas: TPlacontas; const recpag: string; const codtiporecdes, codcentrocusto: string; const idempresa, idpatro, idprograma: integer);
var ssql: string;
    cds: TClientDataset;
begin

  cds := TClientDataset.Create(nil);
  try
    try
      ssql := ' SELECT PLACONTA, PLACONTAPASS FROM TIPORDXCCXCONTA ' +
              ' WHERE IDPESSOA            = '+ intToStr(idempresa)   +
              ' AND RECPAG                = '+ quotedStr(recpag)     +
              ' AND IDEMPRESA             = '+ intToStr(idempresa);

              if trim(codtiporecdes) <> '' then
                ssql := ssql + ' AND RTRIM(CODTIPRECDES)   = '+ quotedStr(codtiporecdes)
              else
                ssql := ssql + ' AND CODTIPRECDES IS NULL ';

              if trim(codcentrocusto) <> '' then
                ssql := ssql + ' AND RTRIM(CODCENTROCUSTO) = '+ quotedStr(codcentrocusto)
              else
                ssql := ssql + ' AND CODCENTROCUSTO IS NULL ';

              if idpatro > 0 then
                ssql := ssql + ' AND IDPATRO               = '+ intToStr(idpatro)
              else
                ssql := ssql + ' AND IDPATRO IS NULL ';

              if idprograma > 0 then
                ssql := ssql + ' AND IDPROGRAMA            = '+ intToStr(idprograma)
              else
                ssql := ssql + ' AND IDPROGRAMA IS NULL ';

      cds.Data := getDataPacket(ssql);

      if not cds.IsEmpty then
      begin
        if trim(placontas.sPlaconta) = '' then
          placontas.sPlaconta     := cds.fieldByName('PLACONTA').asString;

        if trim(placontas.sPlacontaPass) = '' then
          placontas.sPlacontaPass := cds.fieldByName('PLACONTAPASS').asString;
      end;

    except
      on e: Exception do
        self.messageInfo := e.Message;
    end;

  finally
    cds.Free;
  end;
end;



procedure TCtrlLancDocCapCar.getContaTiporecdes(var placontas: TPlacontas; const idempresa: integer; const codtiporecdes, recpag: string);
var ssql: string;
    cds : TClientDataset;
begin
  cds := TClientDataset.Create(nil);
  try
    try
      ssql := ' SELECT PLACONTA, PLACONTACREDITO AS PLACONTAPASS, CODSUBCONTA, CODSUBCONTACRE AS CODSUBCONTAPASS '+
              ' FROM TIPORECEBDESEMB '+
              ' WHERE IDPESSOA            = '+ intToStr(idempresa)      +
              ' AND RECPAG                = '+ quotedStr(recpag)        +
              ' AND RTRIM(CODTIPRECDES)   = '+ quotedStr(codtiporecdes);

      cds.Data := getDataPacket(ssql);

      if not cds.IsEmpty then
      begin
        if trim(placontas.sPlaconta) = '' then
          placontas.sPlaconta     := cds.fieldByName('PLACONTA').asString;

        if trim(placontas.sPlacontaPass) = '' then
          placontas.sPlacontaPass := cds.fieldByName('PLACONTAPASS').asString;

        if placontas.iSubConta = 0 then
          placontas.iSubConta := cds.fieldByName('CODSUBCONTA').asInteger;

        if placontas.iSubContaPass = 0 then
          placontas.iSubContaPass := cds.fieldByName('CODSUBCONTAPASS').asInteger;

      end;

    except
      on e: Exception do
        self.messageInfo := e.Message;
    end;

  finally
    cds.Free;
  end;
end;


function TCtrlLancDocCapCar.GetContasForCli(var placontas: TPlacontas;
                                             const idforcli, idempresa: integer;
                                             const RecPag: string; const bAdiantamento: boolean): boolean;
var ssql: string;
    cds: TclientDataset;
begin
  result := true;
  cds := TclientDataset.Create(nil);
  try
    try
      if RecPag = 'R' then
        cds.Data := getDataPacket(' SELECT C.CONTACADIANTAMENTO AS CADIANTAMENTO, C.CONTACCLIENTE AS PLACONTAPASS, C.CODSUBCONTA AS SUBCONTA, C.CONTACRECEITA AS PLACONTA '+
                                ' FROM EMPRESACLIENTE C WHERE (C.IDFORCLI = '+ intToStr(idforcli) + ') AND (C.IDPESSOA = '+ intToStr(idempresa) +')' )
      else
        cds.Data := getDataPacket(' SELECT F.CONTACADIANTAMENTO AS CADIANTAMENTO, F.CONTACFORN AS PLACONTAPASS, F.CODSUBCONTA AS SUBCONTA, F.CONTACDESPESA AS PLACONTA '+
                                  ' FROM EMPRESAFORN F WHERE (F.IDFORCLI = '+ intToStr(idforcli) +') AND (F.IDPESSOA = '+ intToStr(idempresa) +')' );


      if bAdiantamento then
      begin
        //início - andré tavares - pendencia 23149 - 23/08/2006
        //placontas.sPlaconta := cds.fieldByName('CADIANTAMENTO').asString;
        placontas.sPlacontaPass := cds.fieldByName('CADIANTAMENTO').asString;
        //fim - andré tavares - pendencia 23149 - 23/08/2006

//        if placontas.sPlaconta = '' then
        if placontas.sPlacontaPass = '' then //andré tavares - pendencia 23149 - 23/08/2006
          raise exception.create ('A conta de adiantamento do Fornecedor/Cliente não foi preenchida');
      end;

      if trim(placontas.sPlacontaPass) = '' then
        placontas.sPlacontaPass := cds.fieldByName('PLACONTAPASS').asString;

      if trim(placontas.sPlaconta) = '' then
        placontas.sPlaconta := cds.fieldByName('PLACONTA').asString;

      if placontas.iSubContaPass = 0 then
        placontas.iSubContaPass := cds.fieldByName('SUBCONTA').asInteger;

    except
      on e: Exception do
      begin
        messageInfo := e.Message;
        result := false;
      end;
    end;
  finally
    cds.Free;
  end;
end;

function TCtrlLancDocCapCar.getContasPortForma(var placontas: TPlacontas; const codportforma: integer): boolean;
var ssql: string;
    cds: TclientDataset;
begin
  Result := true;
  cds := TClientDataset.Create(nil);
  try
    try
      ssql := ' SELECT PF.CODPORTFORMA, '+
              '        NVL(PF.PLACONTA, PC.PLACONTA) AS PLACONTAPASS, '+
              '        NVL(PF.CODSUBCONTA, PC.CODSUBCONTA) AS CODSUBCONTAPASS '+
              ' FROM PORTADORFORMA PF, PORTADORCONTA PC '+
              ' WHERE PF.CODPORTFORMA = '+ intToStr(codportforma) +' AND '+
              '       PF.CODPORTADOR = PC.CODPORTADOR ';

      cds.Data := getDataPacket(ssql);

      if cds.fieldByName('PLACONTAPASS').asString <> '' then begin
        placontas.sPlacontaPass := cds.fieldByName('PLACONTAPASS').asString;
        placontas.iSubContaPass := cds.fieldByName('CODSUBCONTAPASS').asInteger;
      end else
        raise exception.create ('Não foi encontrada a conta contábil nem no Portador/Forma nem no Portador/Conta!')

    except
      on e: Exception do
      begin
        messageInfo := e.Message;
        result := false
      end;
    end;

  finally
    cds.Free;
  end;
end;


function TCtrlLancDocCapCar.FazerInsertContab( const _DebCre: string;
                                               const _ContaContabil : string;
                                               const _NomeConta: string;
                                               const _idPlano : integer;
                                               const _CentroCusto: string;
                                               const _CodCCustoExterno: string;
                                               const _NomeCentroCusto: string;
                                               const _UnidNegoc: integer;
                                               const _NomeUnidNegoc: string;
                                               const _ValorCorrente: double;
                                               const _ValorMoeda: double;
                                               const _Historico: string;
                                               const _IdPlanoPrev: integer;
                                               const _IdPatro: integer;
                                               const _NomePlanoPrev: string;
                                               const _NomePatro: string;
                                               const _iIdSegregaCriter: integer;
                                               const _sDescSegregaCriter: string;
                                               const _LacNumLan: integer;
                                               const _SubConta: integer;
                                               var   CdsContab: TClientDataSet): boolean;

//Catia p:23197 29/08/2006
Procedure ArrumaHistorico(sHistorico:String;var sHist1,sHist2,sHist3,sHist4,sHist5:String);
    var iFator,ia,i,iNumero:Integer;
        aHistorico:Array[1..5] of String;
    Begin
       iFator:=0;
       aHistorico[1]:='';
       aHistorico[2]:='';
       aHistorico[3]:='';
       aHistorico[4]:='';
       aHistorico[5]:='';
       for ia := 1 to 5 do
       Begin
          aHistorico[ia]:=copy(sHistorico,(iFator+1),40);
          if length(trim(copy(sHistorico,(iFator+1),200))) <= 40 then
             Break;
          iNumero:=40;
          for i := 1 to 40 do
          begin
            if copy(aHistorico[ia],iNumero,1) = ' ' then
            Begin
               aHistorico[ia]:=copy(sHistorico,(iFator+1),iNumero);
               Break;
            end;
            iNumero:=(iNumero-1);
          end;
          iFator:=iFator+iNumero;
       end;
       sHist1:=aHistorico[1];
       sHist2:=aHistorico[2];
       sHist3:=aHistorico[3];
       sHist4:=aHistorico[4];
       sHist5:=aHistorico[5];
    end;



                                               
var
_hist1,_hist2,_hist3,_hist4,_hist5 : string;
begin

  {** Só junta os lançamentos na planilha se não for partida dobrada **}
  if not  ParamIntegra.PartidaDobrada then
  begin
     CdsContab.First;
     while (not CdsContab.Eof) do
     begin
        if (CdsContab.FieldByName('PLACONTA').AsString       = _ContaContabil) and
           (CdsContab.FieldByName('CODCENTROCUSTO').AsString = _CentroCusto) and
           (CdsContab.FieldByName('UNIDNEGOC').AsInteger     = _UnidNegoc) and
           (CdsContab.FieldByName('CODSUBCONTA').AsInteger   = _SubConta) and
           (CdsContab.FieldByName('LACDEBCRE').AsString      = _DebCre) and
           (CdsContab.FieldByName('IDPLANOPREV').AsFloat     = _IdPlanoPrev) and
           (CdsContab.FieldByName('IDPATRO').AsFloat         = _IdPatro) and
           // 23/01/04 Alex 14451
           (CdsContab.FieldByName('IDSEGREGACRITER').AsInteger = _IdPatro) then
        begin
           CdsContab.Edit;
           CdsContab.FieldByName('LACVALOR').AsFloat   := CdsContab.FieldByName('LACVALOR').AsFloat + _ValorCorrente;
           CdsContab.FieldByName('LACVALHIST').AsFloat := CdsContab.FieldByName('LACVALHIST').AsFloat + _ValorMoeda;
           CdsContab.Post;
     // alex      Exit;
        end;
        CdsContab.Next
     end;
  end;
 //Catia p:23197 29/08/2006
           _Hist1:='';
           _Hist2:='';
           _Hist3:='';
           _Hist4:='';
           _Hist5:='';

           ArrumaHistorico(_Historico, _Hist1, _Hist2, _Hist3, _Hist4, _Hist5);



  CdsContab.Insert;
  CdsContab.FieldByName('PLACONTA').AsString        := _ContaContabil;
  CdsContab.FieldByName('PLANO').AsInteger          := _idPlano;
  CdsContab.FieldByName('CODCENTROCUSTO').AsString  := _CentroCusto;
  CdsContab.FieldByName('CODEXTERNO').AsString      := _CodCCustoExterno;
  CdsContab.FieldByName('NOME_1').AsString          := _NomeCentroCusto;
  CdsContab.FieldByName('UNIDNEGOC').AsInteger      := _UnidNegoc;
  CdsContab.FieldByName('NOME').AsString            := _NomeUnidNegoc;
  CdsContab.FieldByName('LACVALOR').AsFloat         := _ValorCorrente;
  CdsContab.FieldByName('LACVALHIST').AsFloat       := _ValorMoeda;
  //Catia p:23197 29/08/2006
  CdsContab.FieldByName('LACHIST1').AsString        := _Hist1;
  CdsContab.FieldByName('LACHIST2').AsString        := _Hist2;
  CdsContab.FieldByName('LACHIST3').AsString        := _Hist3;
  CdsContab.FieldByName('LACHIST4').AsString        := _Hist4;
  CdsContab.FieldByName('LACHIST5').AsString        := _Hist5;

  CdsContab.FieldByName('LACDEBCRE').AsString       := _DebCre;
  CdsContab.FieldByName('PLANOME').AsString         := _NomeConta;
  CdsContab.FieldByName('HITCODHIST').AsString      := _Historico;
  CdsContab.FieldByName('IDPLANOPREV').AsFloat      := _IdPlanoPrev;
  CdsContab.FieldByName('IDPATRO').AsFloat          := _IdPatro;
  CdsContab.FieldByName('DESCPLANO').AsString       := _NomePlanoPrev;
  CdsContab.FieldByName('NOMEPATRO').AsString       := _NomePatro;
  CdsContab.FieldByName('IDSEGREGACRITER').AsInteger := _iIdSegregaCriter;
  CdsContab.FieldByName('SEGREGACRITER').AsString    := _sDescSegregaCriter;


  {** Referência para o lançamento da contabilização como partida dobrada **}
  if CdsContab.FieldByName('LACNUMLAN').AsFloat = 0 then
     CdsContab.FieldByName('LACNUMLAN').AsFloat := _LacNumLan;
  {** Referência para o lançamento da contabilização como partida dobrada **}

  if _SubConta <> 0 then CdsContab.FieldByName('CODSUBCONTA').AsInteger := _SubConta;

  (*// alex verificar
  CdsContab.FieldByName('CODDOCUMENTO').AsString    := cdsDoc.FieldByName('CODDOCUMENTO').AsString;
  CdsContab.FieldByName('COMPLDOCUMENTO').AsString  := cdsDoc.FieldByName('COMPLDOCUMENTO').AsString;
  CdsContab.FieldByName('RAZAOSOCIAL').AsString     := cdsForcli.fieldByName('RAZAOSOCIAL').asString;
  CdsContab.FieldByName('DSCLANCAMENTO').AsString   := 'Lancamento de Documento';
  CdsContab.FieldByName('DATAVENCIMENTO').AsString  := cdsDoc.fieldByName('DATAVENCTO').asString;
  CdsContab.FieldByName('HISTORICOCOMPL').AsString  := cdsDoc.fieldByName('HISTORICOCOMPL').asString;
  CdsContab.FieldByName('TIPODOCUMENTO').AsString   := sDescTipoDoc;
  *)
  CdsContab.Post;

end;

function TCtrlLancDocCapCar.ProcessaInsertContab( const sDescTipoDoc: string;
                               const iIdForCli: integer;
                               const CdsDoc: TClientDataSet;
                               const CdsRateio: TClientDataSet;
                               var CdsContab: TClientDataSet): boolean;

var
   sHistoricoPadrao, sHistoricoContab :String;
   sDebCred: string;
   iLacNumLan: integer;
   cdsForCli: TClientDataSet;
   sObrigaCC, sNome, sObrigaSubConta, scentroCusto, scentroCustoExt : string;
   iSubconta : Integer;
begin
  result := true;
  try
    try

      CdsForCli := TClientDataSet.Create (nil);

      CdsForCli.data := GetDataPacket('SELECT RAZAOSOCIAL FROM PESSOA WHERE IDPESSOA = ' + IntToStr(iIdForCli));

      sHistoricoPadrao := 'LANC. DOC. '+ cdsDoc.fieldByName('NODOCUMENTO').asString +'/'+ cdsDoc.fieldByName('COMPLDOCUMENTO').asString +' '+
                          cdsForcli.fieldByName('RAZAOSOCIAL').asString + ' Vencimento: ' + cdsDoc.fieldByName('DATAVENCTO').asString +' '+
                          cdsDoc.fieldByName('HISTORICOCOMPL').asString;

      sHistoricoContab := GetHistoricoCapCar(_ModeloHist, cdsDoc.fieldByName('IDPESSOA').asInteger,
                                             cdsDoc.fieldByName('IDMODULO').asInteger, 1, sHistoricoPadrao,[cdsDoc.fieldByName('NODOCUMENTO').asString,
                                                                                    cdsDoc.fieldByName('COMPLDOCUMENTO').asString,
                                                                                    cdsforCli.fieldByName('RAZAOSOCIAL').asString,
                                                                                    cdsDoc.fieldByName('DATAVENCTO').asString,
                                                                                    cdsDoc.fieldByName('DATAPROGRAMADA').asString,
                                                                                    cdsDoc.fieldByName('HISTORICOCOMPL').asString,
                                                                                    sDescTipoDoc,
                                                                                    cdsDoc.fieldByName('NUMAPGR').asString
                                                                                    ]);
      CdsRateio.First;
      while not CdsRateio.eof do
      begin

        iLacNumLan := Self.GetNextID;

        // INSERIR AS CONTAS DE PASSAGEM
        if ParamIntegra.RecPag = 'P' then sDebCred := 'C'
        else sDebCred := 'D';

        funcaogeral.TestaContaCC(False, CdsRateio.FieldByName('PLANO').AsInteger,
                                 CdsRateio.FieldByName('PLACONTAPASS').AsString,
                                 sObrigaCC, sNome, sObrigaSubConta);
        if trim(sObrigaCC) = 'S' then
        begin
          scentroCusto    := CdsRateio.FieldByName('CODCENTROCUSTO').AsString;
          scentroCustoExt := CdsRateio.FieldByName('CODEXTERNOCC').AsString;
          if trim(scentroCusto) = '' then
            raise exception.Create('A Conta Contábil '+ CdsRateio.FieldByName('PLACONTAPASS').AsString + ' Obriga Centro de Custo.');
        end
        else
        begin
          scentroCusto := '';
          scentroCustoExt := '';
        end;

        if trim(sObrigaSubConta) = 'S' then
        begin
          isubConta := CdsRateio.FieldByName('CODSUBCONTAPASS').AsInteger;
          if isubConta = 0 then
          begin
            raise exception.Create('A Conta Contábil '+ CdsRateio.FieldByName('PLACONTAPASS').AsString + ' Obriga Subconta.');
          end;
        end
        else isubConta := 0;


        FazerInsertContab (sDebCred, CdsRateio.FieldByName('PLACONTAPASS').AsString,
                           sNome,
                           CdsRateio.FieldByName('PLANO').AsInteger,
                           scentroCusto,
                           scentroCustoExt,
                           CdsRateio.FieldByName('NOMECENTROCUSTO').AsString,
                           CdsRateio.FieldByName('UNIDNEGOC').AsInteger,
                           CdsRateio.FieldByName('NOME').AsString,
                           CdsRateio.FieldByName('VALOR').AsFloat,
                           CdsRateio.FieldByName('VALOROUTRAMOEDA').AsFloat,
                           sHistoricoContab,
                           CdsRateio.FieldByName('IDPLANOPREV').AsInteger,
                           CdsRateio.FieldByName('IDPATRO').AsInteger,
                           CdsRateio.FieldByName('DESCPLANO').AsString,
                           CdsRateio.FieldByName('NOMEPATRO').AsString,
                           CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger,
                           CdsRateio.FieldByName('DESCSEGREGACRITER').AsString,
                           iLacNumLan,
                           isubConta,
                           CdsContab);

//-----------------------------------------------
        if bIntragaContabilidade then
        begin
          // INSERIR AS CONTAS DE RECEITA/DESPESA
          if ParamIntegra.RecPag = 'P' then sDebCred := 'D'
          else sDebCred := 'C';

          funcaogeral.TestaContaCC(False, CdsRateio.FieldByName('PLANO').AsInteger,
                                   CdsRateio.FieldByName('PLACONTA').AsString,
                                   sObrigaCC, sNome, sObrigaSubConta);
          if trim(sObrigaCC) = 'S' then
          begin
            scentroCusto    := CdsRateio.FieldByName('CODCENTROCUSTO').AsString;
            scentroCustoExt := CdsRateio.FieldByName('CODEXTERNOCC').AsString;
            if trim(scentroCusto) = '' then
              raise exception.Create('A Conta Contábil '+ CdsRateio.FieldByName('PLACONTA').AsString + ' Obriga Centro de Custo.');
          end
          else
          begin
            scentroCusto := '';
            scentroCustoExt := '';
          end;

          if trim(sObrigaSubConta) = 'S' then
          begin
            isubConta := CdsRateio.FieldByName('CODSUBCONTA').AsInteger;
            if isubConta = 0 then
            begin
              raise exception.Create('A Conta Contábil '+ CdsRateio.FieldByName('PLACONTA').AsString + ' Obriga Subconta.');
            end;
          end
          else isubConta := 0;


          FazerInsertContab (sDebCred, CdsRateio.FieldByName('PLACONTA').AsString,
                             sNome,
                             CdsRateio.FieldByName('PLANO').AsInteger,
                             scentroCusto,
                             scentroCustoExt,
                             CdsRateio.FieldByName('NOMECENTROCUSTO').AsString,
                             CdsRateio.FieldByName('UNIDNEGOC').AsInteger,
                             CdsRateio.FieldByName('NOME').AsString,
                             CdsRateio.FieldByName('VALOR').AsFloat,
                             CdsRateio.FieldByName('VALOROUTRAMOEDA').AsFloat,
                             sHistoricoContab,
                             CdsRateio.FieldByName('IDPLANOPREV').AsInteger,
                             CdsRateio.FieldByName('IDPATRO').AsInteger,
                             CdsRateio.FieldByName('DESCPLANO').AsString,
                             CdsRateio.FieldByName('NOMEPATRO').AsString,
                             CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger,
                             CdsRateio.FieldByName('DESCSEGREGACRITER').AsString,
                             iLacNumLan,
                             isubConta,
                             CdsContab);
        end;//if
//-----------------------------------------------
        CdsRateio.Next;
      end
    except
      on e:Exception do
      begin
        result := false;
        messageInfo := e.message;
      end;
    end;
  finally
    cdsForCli.free;
  end;


end;



function TCtrlLancDocCapCar.GravaContaContabilRateio(var CdsRateio: TClientDataSet;
                                                     const iCodPortForma: integer;
                                                     const iIdForCli: integer;
                                                     const iIdEmpresa: integer;
                                                     const sRecPag: string;
                                                     const operLancto: TOperacaoLancDocCapCar;
                                                     const bLancaeBaixa: boolean): boolean;
var
  PlaContas: TPlacontas;
begin
  result := true;
  try

    CdsRateio.First;
    while not CdsRateio.Eof do
    begin

       if not GetPlacontas (iCodPortForma, iIdForCli, iIdempresa,
                        cdsRateio.fieldByName('IDPROGRAMA').asInteger,
                        cdsRateio.fieldByName('IDPATRO').asInteger,
                        cdsRateio.FieldByName('CODCENTROCUSTO').AsString,
                        cdsRateio.FieldByName('CODTIPRECDES').AsString,
                        sRecPag, operLancto, blancaeBaixa, PlaContas) then
         raise exception.create (messageinfo);


      cdsRateio.Edit;
      cdsRateio.fieldByName('PLANO').ASInteger          := placontas.iPlano;
      cdsRateio.fieldByName('PLACONTA').asString        := placontas.sPlaconta;
      cdsRateio.fieldByName('PLACONTAPASS').asString    := placontas.sPlacontaPass;
      cdsRateio.fieldByName('CODSUBCONTA').Asinteger    := placontas.iSubConta;
      cdsRateio.fieldByName('CODSUBCONTAPASS').Asinteger:= placontas.iSubContaPass;
      cdsRateio.Post;


      CdsRateio.Next;
    end;
  except
    on E:Exception do
    begin
      messageinfo := e.message;
      result := false;
    end;

  end;


end;



function TCtrlLancDocCapCar.DeterminaSegregacao(var CdsRateio: TClientDataSet): boolean;
var
  iIdSegregaCriter: integer;
  sContaSegregar: string;
begin
  result := true;
  try
    CdsRateio.First;
    while not CdsRateio.Eof do begin
      iIdSegregaCriter := _Segregacao.RetornaSegregaCriter (CdsRateio.FieldByName('PLANO').AsInteger,
                               CdsRateio.FieldByName('IDPLANOPREV').AsInteger,
                               CdsRateio.FieldByName('IDPATRO').AsInteger,
                               CdsRateio.FieldByName('PLACONTA').AsString,
                               sContaSegregar);

      if iIdSegregaCriter = -1 then
        iIdSegregaCriter := _Segregacao.RetornaSegregaCriter (CdsRateio.FieldByName('PLANO').AsInteger,
                               CdsRateio.FieldByName('IDPLANOPREV').AsInteger,
                               CdsRateio.FieldByName('IDPATRO').AsInteger,
                               CdsRateio.FieldByName('PLACONTAPASS').AsString,
                               sContaSegregar);

      CdsRateio.Edit;
      CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
      CdsRateio.Post;
      CdsRateio.Next;
    end;

  except
    on e:Exception do
    begin
      messageinfo := e.message;
      result := false;
    end;
  end;

end;



// se no somatório das contas contábeis, tiver mais de um conjunto
// PLACONTA / IDSEGREGACRITER abrir múltiplas contas de baixa
function TCtrlLancDocCapCar.LancaMultiplasContasBaixa (
                              const cdsRateio: TClientDataSet;
                              var CdsCCBaixasXDocum: TClientDataSet;
                              var iPlanoDoc: integer;
                              var sPlacontaDoc : string;
                              var sCentroCustoDoc : string;
                              var iIdSegregaCriter: integer): boolean;

var
  iSegregaCriter, iSegrega, iConta: integer;
  sPlaconta: string;
  bAchou: boolean;
begin;

  result := true;
  try
    sPlaconta := '';
    iSegregaCriter := -1;
    iSegrega := 0;
    iConta := 0;
    CdsRateio.First;
    // este somatório pode dar errado devido a falta de ordenação da query,
    // a conta pode se repetir, mas se possuir mais de uma conta diferente de baixa
    // é obrigatório a utilização de múltiplas conta de baixa
    while not CdsRateio.Eof do begin
      if (sPlaconta <> CdsRateio.FieldByName('PLACONTAPASS').AsString) then
      begin
        sPlaconta := CdsRateio.FieldByName('PLACONTAPASS').AsString;
        inc(iConta);
      end;
      if (iSegregaCriter <> CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger) then
      begin
        iSegregaCriter := CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger;
        inc(iSegrega);
      end;
      CdsRateio.Next;
    end;


    // necessário múltiplas contas de baixa
    CdsCCBaixasXDocum.Data := getDataPacket(' SELECT PT.NOME AS PATROCINADORA, PL.NOME AS PLANPREVCONTABIL, S.DESCRICAO AS SEGREGACRITER, '+
                                            '        CC.PLACONTA, CC.VALOR, CC.IDPATRO, CC.IDPLANOPREV, CC.IDSEGREGACRITER, CC.PLANO, CC.UNIDNEGOC, CC.IDPESSOA '+
                                            ' FROM CCBAIXASXDOCUM CC, PESSOA PT, PATRO PA, PLANPREVCONTABIL PL, SEGREGACRITER S '+
                                            ' WHERE CC.CODDOCUMENTO = -1 AND ( CC.IDPATRO = PA.IDPESSOA )  AND ( PA.IDPESSOA = PT.IDPESSOA ) '+
                                            '       AND ( CC.IDPLANOPREV = PL.IDPLANOPREV ) '+
                                            '       AND ( CC.IDSEGREGACRITER = S.IDSEGREGACRITER(+) ) ');



    CdsCCBaixasXDocum.EmptyDataSet;  // apaga o clientdataset para gravar tudo de novo, ou não
    if (iConta > 1) or (iSegrega > 1) then begin
      CdsRateio.First;
      while not CdsRateio.Eof do begin
        CdsCCBaixasXDocum.First;
        bAchou := False;
        while (not CdsCCBaixasXDocum.Eof) and (not bAchou) do begin
          // verificar a chave da tabela ccbaixasxdocum para somar o valor
          if (CdsCCBaixasXDocum.FieldByName('IDPATRO').AsInteger         = CdsRateio.FieldByName('IDPATRO').AsInteger) and
             (CdsCCBaixasXDocum.FieldByName('IDPLANOPREV').AsInteger     = CdsRateio.FieldByName('IDPLANOPREV').AsInteger) and
             (CdsCCBaixasXDocum.FieldByName('IDSEGREGACRITER').AsInteger = CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger) and
             (CdsCCBaixasXDocum.FieldByName('PLACONTA').AsString         = CdsRateio.FieldByName('PLACONTAPASS').AsString) and
             (CdsCCBaixasXDocum.FieldByName('UNIDNEGOC').AsInteger       = CdsRateio.FieldByName('UNIDNEGOC').AsInteger) then begin

            CdsCCBaixasXDocum.Edit;
            //andre tavares - 300/08/2006 - estava dando erro na valia com um rateio específico
//            CdsCCBaixasXDocum.FieldByName('VALOR').AsFloat := CdsCCBaixasXDocum.FieldByName('VALOR').AsFloat + CdsRateio.FieldByName('LACVALOR').AsFloat;
            CdsCCBaixasXDocum.FieldByName('VALOR').AsFloat := CdsCCBaixasXDocum.FieldByName('VALOR').AsFloat + CdsRateio.FieldByName('VALOR').AsFloat;
            CdsCCBaixasXDocum.Post;

            bAchou := true;
          end;
          CdsCCBaixasXDocum.Next;
        end;

        if (not bAchou) then begin
          // não foi encontrada a conta de baixa acima
          CdsCCBaixasXDocum.Insert;
          CdsCCBaixasXDocum.FieldByName('IDPATRO').AsInteger         := CdsRateio.FieldByName('IDPATRO').AsInteger;
          CdsCCBaixasXDocum.FieldByName('IDPLANOPREV').AsInteger     := CdsRateio.FieldByName('IDPLANOPREV').AsInteger;
          CdsCCBaixasXDocum.FieldByName('IDSEGREGACRITER').AsInteger := CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger;
          CdsCCBaixasXDocum.FieldByName('PLANO').AsInteger           := CdsRateio.FieldByName('PLANO').AsInteger;
          CdsCCBaixasXDocum.FieldByName('PLACONTA').AsString         := CdsRateio.FieldByName('PLACONTAPASS').AsString;
          CdsCCBaixasXDocum.FieldByName('UNIDNEGOC').AsInteger       := CdsRateio.FieldByName('UNIDNEGOC').AsInteger;

          CdsCCBaixasXDocum.FieldByName('VALOR').AsFloat      := CdsRateio.FieldByName('VALOR').AsFloat;
          CdsCCBaixasXDocum.FieldByName('IDPESSOA').AsInteger := cdsRateio.fieldByName('IDPESSOA').asInteger;
          CdsCCBaixasXDocum.Post;
        end;

        CdsRateio.Next;
      end;
    end else begin  // não é múltiplas contas de baixa
       iPlanoDoc        := CdsRateio.FieldByName('PLANO').AsInteger;
       sPlacontaDoc     := CdsRateio.FieldByName('PLACONTAPASS').AsString;;
       sCentroCustoDoc  := CdsRateio.FieldByName('CODCENTROCUSTO').AsString;
       iIdSegregaCriter := CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger;
    end;

  except
    on e:exception do
    begin
      messageInfo := e.message;
      result := false;
    end;
  end;
end;




//alex definindo novo modeleo de implementação
function TCtrlLancDocCapCar.DeterminaContabilizacao(var placontas: Tplacontas; const cdsDoc: TClientDataset; var cdsCCBaixasXDocum: TClientDataset;
                                                    var cdsContab: TClientDataset; const ovcdsRateio: OleVariant; const idempresa: integer;
                                                    const idplano: integer; const blanceBaixa: boolean; const operLancto: TOperacaoLancDocCapCar;
                                                    const sDescTipoDoc: string; const recPag: char): boolean;


var
  CdsRateio : TClientDataSet;
  iPlanoDoc, iIdSegregaCriter: integer;
  sPlacontaDoc, sCentroCustoDoc: string;

begin
  try
    try

      placontas.iPlano           := 0;
      placontas.sPlaconta        := '';
      placontas.sPlacontaPass    := '';
      placontas.iSubConta        := 0;
      placontas.iSubContaPass    := 0;
      placontas.iIdSegregaCriter := -1;
      placontas.scodCentroCusto  := '';

      result := true;

      cdsContab.EmptyDataSet;
      cdsCCBaixasXDocum.EmptyDataSet;
      _Segregacao.GetParams(IdEmpresa);

      CdsRateio := TClientDataset.Create(nil);
      CdsRateio.Data := ovcdsRateio;


      // Para lançamentos com baixa simultânea tem que ter um portadorforma para baixa
      if blanceBaixa and (cdsDoc.FieldByName('CODPORTFORMA').AsInteger = 0) then
      begin
        messageinfo := 'Lançamento com Baixa Simultânea sem Conta Caixa X Forma de Pagamento/Recebimento Associado.';
        raise exception.create (messageinfo);
      end;

      // grava todas as contas contábeis, débito e crédito, no cdsrateio
      if not GravaContaContabilRateio (CdsRateio, cdsDoc.FieldByName('CODPORTFORMA').AsInteger,
                                cdsDoc.FieldByName('IDFORCLI').AsInteger,
                                idempresa, recPag, operLancto, blanceBaixa) then
        raise exception.create (messageinfo);


      // grava o critério de segregação  no cdsrateio
      if not DeterminaSegregacao(CdsRateio) then
        raise exception.create (messageinfo);


      if not ProcessaInsertContab (sDescTipoDoc, cdsDoc.FieldByName('IDFORCLI').AsInteger,
                                   cdsDoc, CdsRateio, cdsContab) then
        raise exception.create (messageinfo);


      iPlanoDoc := 0;
      sPlacontaDoc := '';
      sCentroCustoDoc := '';
      iIdSegregaCriter := -1;


      if not LancaMultiplasContasBaixa (CdsRateio, cdsCCBaixasXDocum, iPlanoDoc, sPlacontaDoc, sCentroCustoDoc, iIdSegregaCriter) then
        raise exception.create (messageinfo);

      if cdsCCBaixasXDocum.IsEmpty then
      begin
        placontas.sPlacontaPass    := sPlacontaDoc;
        placontas.iPlano           := iPlanoDoc;
        placontas.scodCentroCusto  := sCentroCustoDoc;
        placontas.iIdSegregaCriter := iIdSegregaCriter
      end;


    except
      on E:Exception do
      begin
        messageinfo := e.message;
        result := false;
      end;
    end;
  finally
    CdsRateio.Free;
  end;
end;




//fim - andré tavares - pendeência 22515 - 28/06/2006


procedure TCtrlLancDocCapCar.SetbIntragaContabilidade(const Value: boolean);
begin
  FbIntragaContabilidade := Value;
end;

function TCtrlLancDocCapCar.VinculoBancario(RecPag: string;
  CodPortForma: double): boolean;
var
  sSQL: string;
  cds: TCLientDataSet;
begin
  try
     Result := False;
     cds := TClientDataSet.Create(nil);
     sSQL :=
       'SELECT FRP.FLGDADOSBANCARIOS FROM PORTADORFORMA PF, FORMARECPAG FRP '+
       'WHERE PF.CODFORMA = FRP.CODFORMA AND PF.CODPORTFORMA = ' + FloatToStr(CodPortForma);
     cds.Data := GetDataPacket(sSQL);
     Result := cds.FieldByName('FLGDADOSBANCARIOS').AsString = 'S';
  finally
    FreeAndNil(cds);
  end;
end;

function TCtrlLancDocCapCar.DocumentoDuplicado(const NumDocumento: integer;
  const ComplDocumento: string; const Valor: Double; const IdFornecedor: integer;
  const DataVencto: TDateTime): boolean;
var
  sSQL: TStringList;
  cds: TClientDataSet;
begin
  try
    Result := False;
    sSQL := TStringList.Create;
    cds := TClientDataSet.Create(nil);

    sSQL.Add('SELECT COUNT(*) AS TOTDOC FROM DOCUMENTO D, LANCTODOCUM L ');
    sSQL.ADD('WHERE D.CODDOCUMENTO = L.CODDOCUMENTO ');
    sSQL.Add('AND D.OPERACAO = L.OPERACAO ');
    sSQL.Add('AND D.NODOCUMENTO = ' + IntToStr(NumDocumento));

    if trim(ComplDocumento) <> '' then
       sSQL.Add(' AND D.COMPLDOCUMENTO = ' + QuotedStr(ComplDocumento));

    sSQL.Add(' AND L.VALOR = ' + FloatToStr(Valor));
    sSQL.Add(' AND D.IDFORCLI = ' + IntToStr(IdFornecedor));
    sSQL.Add(' AND D.DATAVENCTO = CAST(' + QuotedStr(FormatDateTime('dd/mm/yyyy', DataVencto)) + ' AS DATE)');

    cds.Data := GetDataPacket(sSQL);
    Result := cds.FieldByName('TOTDOC').AsInteger > 0;
  finally
    FreeAndNil(sSQL);
    FreeAndNil(cds);
  end;
end;

end.

