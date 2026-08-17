{******************************************************************************}
{  Sistema - Contas a Pagar                                                    }
{  Unit    - uCtrlLancDocCapCar                                                }
{******************************************************************************}
{--------------------------------------------------------------------------------
 N. Solicitação: WO8229
 Dt Alteração..: 11/03/2024
 Responsável...: Luis Ferrari
 Descrição.....: Inclusão da função getCamposRateio para atender Rateio por planiha    }
//------------------------------------------------------------------------------
// N. Solicitação: WO14157/WO14159
// Dt Alteração..: 10/10/2024
// Responsável...: Luis Ferrari
// Descrição.....: Nova Aba de Informações Judiciais. Parametros para _Documento.SetValues
//--------------------------------------------------------------------------------
// N. Solicitação: WO 3606
// Dt Alteração..: 09/01/2024
// Responsável...: Cássio Florencio Rovaroto
// Descrição.....: Adequação do processo de alteração de AP's, fazendo a correção
//                 automática da data de tributos.
//--------------------------------------------------------------------------------
//N. Solicitação.....: WO 3524
//Dt Alteração.......: 25/10/2023
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação na funcionalidade de alteração de dados de NF,
//                     permitindo corrigir o tipo da Nota Fiscal e o serviço atrelado.
//------------------------------------------------------------------------------
//Rotina.............: ProcessaDocumento
//N. SIG.............: 133236
//Data da Alteração..: 27/04/2023
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação no procedimento de lançamento de alteradores de tributos.
//------------------------------------------------------------------------------
//Rotina.............: ImprimeEspelhoDoc
//N. SIG.............: 124096
//Data da Alteração..: 25/03/2022
//Responsável........: Luis Ferrari
//Descrição..........: Alteração na Impressão do espelho do documento
//------------------------------------------------------------------------------
//N. SIG.............: 118992 e 118993
//Data da Alteração..: 17/09/2021
//Responsável........: Everson Cunha
//Descrição..........: Inclusão do campo Cod. Dossiê
//------------------------------------------------------------------------------
//Rotina.............: ProcessaDocumento
//N. SIG.............: 115585
//Data da Alteração..: 18/05/2021
//Responsável........: Cássio Florencio Rovaroto 
//Descrição..........: Retirada dos campos Tipo de Serviço e Processo Judicial de
//                     lançamento na tabela RATEIODOCUM. Inclusão dos campos Tipo
//                     de Serviço, Processo Judicial e Valor Base de Retenção na
//                     tabela LANCTODOCUM.
//***************************************************************************************
//Nº SIG......: 94320/95404
//Data........: 11/12/2019
//Responsável.: edilaine
//Descrição...: Criação da Integração Orçamentária para sistema web - envio
//***************************************************************************************
//Rotina.............: SetDadosNFS
//N. SIG.............: 75760
//Data da Alteração..: 06/06/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de rotina para definição de dados para nota fiscais de
//                     serviço.
//***************************************************************************************
//Rotina             : ProcessaDocumento, ListaDadosCPRBFornecedor, VerificaTipoServico
//N. SIG..........   : 23656.57673
//Data da Alteração: : 01/11/2017
//Alteração Form:    : uCtrlLancDocCapCar
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Atualização na funcionalidade de lançamento de documento, que
//                     permite a definição de rateio para serviços que possuem cessão de
//										 mão de obra.
//***************************************************************************************
//Rotina.......: ProcessaDocumento
//SOL..........: 222006-17039
//Kintana......: 712379
//Data.........: 20/04/2015     
//Responsável..: Edilaine Ferraresi
//Descrição....: Criação do campo nosso numero na funcionalidade de lançamento
//               de documentos e alteração de dados bancários.
{-------------------------------------------------------------------------------
Pendência   : SOL 250751 PPM 719394
Responsável : William Moreira da Silva
Data        : 09/03/2015
Descrição   : O SOL 249671 era para ter tirado as alteração do sol 184871, que apenas havia comentado
              o 'not' do if , porém havia retirado o if inteiro.
Solução     : Contabilização dos valores incoreta
-------------------------------------------------------------------------------
Pendência   : SOL 249671 PPM 698569
Responsável : Marcio Sanches Spinosa SOL 249671 PPM 698569
Data        : 09/03/2015
Descrição   : Após versão os lançamentos passaram a serem feitos na segunda fórmula.
Solução     : Removido as alterações do SOL 184871.
--------------------------------------------------------------------------------
  N. Sol..........: 184871
  N. Kintana......: 1747071
  Data............: 05/11/2012
  Responsável.....: José Roberto Marque - JRM6
  Rotina..........: Diversas
  Descrição.......: Modificado para correta contabilização conforme novas regras
                    definidas pelo SOL 184871.
------------------------------------------------------------------------------
Nº SOL......: 230863 e 230956
Nº PPM......: 374049 e 362016
Data........: 21/01/2014
Responsável.: Fernando Xavier
Descrição...: FDO
--------------------------------------------------------------------------------------------------
 Rotina......: DocumentoDuplicado
 Nº SOL......: 199641
 Nº KINTANA..: 1921256
 Data........: 25/01/2013
 Responsável.: Edilaine Ferraresi
 Descrição...: permitir que o NODOCUMENTO não seja limitado pelo tipo integer
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
}                                              
{-------------------------------------------------------------------------------
  N. Sol..........: 178983
  N. Kintana......: 1656753
  Data............: 20/07/2012
  Responsável.....: Douglas.Siqueira
  Descrição.......: criação do relatório Aviso de Recebimento - AR
{-------------------------------------------------------------------------------
  N. Sol..........: 178962-9761
  N. Kintana......: 1669317
  Data............: 25/05/2012
  Responsável.....: Edilaine Ferraresi
  Descrição.......: Alteração de dados na LANCAMENTO qdo operacao 2 para contas
                    a Pagar e Receber
--------------------------------------------------------------------------------
  N. Sol..........: 178962-9741
  N. Kintana......: 1668642
  Data............: 24/05/2012
  Responsável.....: Edilaine Ferraresi
  Descrição.......: Alteração de dados na LANCAMENTO qdo operacao 4 (alteradores)
                    para contas a Receber
--------------------------------------------------------------------------------
  N. Sol..........: 178962
  N. Kintana......: 1659255
  Data............: 16/55/2012
  Responsável.....: Edilaine Ferraresi
  Descrição.......: Alteração de dados na LANCAMENTO qdo operacao 4 (alteradores)
                    para contas a Pagar
--------------------------------------------------------------------------------
  N. Sol..........: 136242
  N. Kintana......: 813941
  Data............: 16/12/2011
  Responsável.....: Fábio Henrique Beccaria Sampaio
  Descrição.......: Implementação das FLAGs FLGSimples e FLGEspecial
-------------------------------------------------------------------------------}
//***************************************************************************************
//Rotina:            ProcessaInsertContab
//Nº SOL:            131335
//Nº KINTANA         746962
//Data da Alteração: 25/02/2010
//Responsável:       Ricardo Alves
//Descrição:         Lançamento contábil da participação diferenciado para Contas a Pagar
//                   e para o Contas a Receber.
//**************************************************************************************


{
Rotina............: ProcessaInsertContab, SetIdPatroOrigem
N. Sol.............: 122623
N. Kintana......: 603580
Data...............: 13/11/2009
Responsável...: Ricardo Alves
Descrição........: Criação e tratamento dos campos patrocinadora financeiro e
  plano previdenciário financeiro.
}

{
Data      : 31/07/2007
Autor     : Marcus Oliveira
Pendência : 25312
Descrição : Criar um metodo pra trazer o default do plano e patro no lançamento de documento.
{-------------------------------------------------------------------------------
Data      : 19/07/2007
Autor     : Marcus Oliveira
Pendência : 25349
Descrição : Passando o parametro true para imprimir expandido o rel. de AP 4
{-------------------------------------------------------------------------------
Data      : 05/06/2007
Autor     : Marcus Oliveira
Pendência : 25234
Descrição : Se o tipo de documento não imprimeAP não permitir imprimir AP,
            no lançamento de documento.
{-------------------------------------------------------------------------------
Data      : 01/03/2007
Autor     : Marcus Oliveira
Pendência : 24614
Descrição : Não estava imprimindo a contabilização no modelo de AP 4.
{------------------------------------------------------------------------------}
// andre tavares - pendência 23979 - 13/12/2006 - Não estava fazendo a busca das placontas na tabela tiporecebdesemb, pois
//                                                havia um condição que não permitia a chamada do método.
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
// Autor     : Marcus Oliveira
// Pendência :
// Data      : 14/11/06
// Descrição : Mandar aviso no caso de existir um rad aprovado.
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
   uCtrlHistoContab, //Edilaine - SOL 178962 / KTN 1659255
   uCtrlLancamento, uCtrlFinanc, uCtrlImpostoRetido, UCtrlOrcamento, uCtrlPadroes,
   DCtrlDocCapCar, Db, uCMSqlParams, uListaCamposHistCapCar,  uCtrlModeloHistorico,
   uCtrlParamIntegra, uMidasUtil, uCtrlBaixaDocumentos, uCtrlRADPlus,  rApGr4, uCtrlPlacontasCapCar;

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
   MSG_OBRIGA_INDICACAO_RESERVA         = 'Obrigatório a indicação do Compromisso Orçamentário para ';


type
  TCtrlLancDocCapCar = Class(TCmControlObject)
  private
    _CtrlPlacontasCapCar: TCtrlPlacontasCapCar;
    _Documento: TCtrlDocumento;
    _Lancamento: TCtrlLancamento;
    _Financeiro: TCtrlFinanc;
    _Imposto: TCtrlImpostoRetido;
    _Orcamento: TOrcamentoBackMT;
    _Padroes: TCtrlPadroes;
    _ModeloHist      : TCtrlModeloHistorico;
    _HistoContab     : TCtrlHistoContab;   //Edilaine - SOL 178962 / KTN 1659255

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

    //amf 11.04.2007 23341
    RadPlus: TCtrlRADPlus;

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

    function ProcessaInsertContab ( const bIntegraContab: boolean; // Rodolpho da Silva - 01/02/2007
                                    const sDescTipoDoc: string;
                                    const iIdForCli: integer;
                                    const CdsDoc: TClientDataSet;
                                    const CdsRateio: TClientDataSet;
                                    var CdsContab: TClientDataSet): boolean;

    function GravaContaContabilRateio (var CdsRateio: TClientDataSet;
                                       const iCodPortForma: integer;
                                       const iIdForCli: integer;
                                       const iIdEmpresa: integer;
                                       const sRecPag: string;
                                       const operLancto: TOperacaoLancDocCapCar;
                                       const bLancaeBaixa: boolean): boolean;

  protected
    procedure AfterInitialize; Override;
  public
    //DAVID - Retenção de Imposto
    OnRetencaoINSS : TOnRetencaoINSS;

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


    //Marcus Oliveira 25234 05/06/2007
    function FlgImprimeAP(iCodDocumento: Real): Boolean;

    //Marcus Oliveira 25312 31/07/2007
    function ListaPlanoPatroParamCap: OleVariant;

    procedure ImprimeEspelhoDoc(iCodDocumento: Double; IdReport: Integer; sNomeReport: String;
       OperacaoLanc: TOperacaoLancDocCapCar);

    // andre tavares - Validação dos tipos de documento para englobamento/parcelamento - pendencia 18771
    function ValidaTipoDoc(ovlOrigem: Olevariant; pcodTipoDoc : Integer): boolean;

    //inicio - andré tavares - pendeência 22515 - 28/06/2006
    function DeterminaContabilizacao(const bIntegraContab: boolean; // Rodolpho da Silva - 01/02/2007
                                     var placontas: Tplacontas; const cdsDoc: TClientDataset; var cdsCCBaixasXDocum: TClientDataset;
                                     var cdsContab: TClientDataset; const ovcdsRateio: OleVariant; const idempresa: integer;
                                     const idplano: integer; const blanceBaixa: boolean; const operLancto: TOperacaoLancDocCapCar;
                                     const sDescTipoDoc: string; const recPag: char): boolean;

    //fim - andré tavares - pendeência 22515 - 28/06/2006

    {** amf 26.08.2006 21703 - Verifica pelo código do portador forma, se a
     forma de pagamento da FORMARECPAG tem vínculo com dados bancários. **}
    function VinculoBancario(RecPag: string = ''; CodPortForma: double = 0): boolean; overload;

    //amf 26.08.2006 21704 - Verifica a duplicação do documento
    function DocumentoDuplicado(opOperacao: TOperacao;
                               //const NumDocumento: integer;   // Edilaine - SOL 199641 / KTN 1921256 - comentado
                               const NumDocumento: int64;       // Edilaine - SOL 199641 / KTN 1921256
                               const ComplDocumento: string;
                               const Valor: Double;
                               const IdFornecedor: integer;
                               const DataVencto: TDateTime): boolean;

    //Cássio Rovaroto - SIG nº 57637
    function ListaDadosCPRBFornecedor(pIdForCli: integer): OleVariant;
    function VerificaTipoServico(pCodTipRecDes, pRecPag: string): Boolean;
    //Cássio Rovaroto - SIG nº 75760
    function SetDadosNFS(pCodDocumento: Integer; pNumNFS, pNumSerie, pObsNFS, pDataEmissao: string;
                         pIdServico: Integer = -1; pSimples: Boolean = False): Boolean;

    function GetDadosServico(pIdServico: String): OleVariant;
    function getCamposRateio: OleVariant;        // WO8229 Ferrari
end;

implementation

Uses JclMath, uCMMath, uMensErro, Dialogs, Controls, rAutPag, rAutPagCofin, rApGr3, uSistema,
     ppReport, Forms, fMostraRelat, ppTypes, uCMClientDataSet,   rAutPag1,
     UDbRateiodocum;





{ TCtrlLancDocCapCar }

procedure TCtrlLancDocCapCar.AfterInitialize;
begin
  inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;

  _CtrlPlacontasCapCar.InitiAlizeAs(Self);; //andré tavares - pendência 24064
  _CtrlPlacontasCapCar.OpenTransaction := False;


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
  _HistoContab.InitializeAs(self); //Edilaine - SOL 178962 / KTN 1659255

  //amf 11.04.2007 23341
  RadPlus.InitializeAs(Self);
end;

constructor TCtrlLancDocCapCar.Create;
Var
  X : Integer;
begin

  inherited;

  //amf 11.04.2007 23341
  RadPlus := TCtrlRADPlus.Create;

  OnPergunta := nil;

  _Documento := TCtrlDocumento.Create;

  _Lancamento := TCtrlLancamento.Create;
  _Imposto := TCtrlImpostoRetido.Create;
  _Orcamento := TOrcamentoBackMT.Create;
  _Financeiro := TCtrlFinanc.Create(0,0,0,true);   // o default para plano patro é true.
  _Padroes:= TCtrlPadroes.Create;
  _ModeloHist    := TCtrlModeloHistorico.Create;
  _HistoContab   := TCtrlHistoContab.Create;  //Edilaine - SOL 178962 / KTN 1659255

  _CtrlPlacontasCapCar := TCtrlPlacontasCapCar.Create; //andré tavares - pendência 24064

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

end;

destructor TCtrlLancDocCapCar.Destroy;
begin
  _CtrlPlacontasCapCar.free; //andré tavares - pendência 24064

  _Documento.Free;
  _Lancamento.Free;
  _Financeiro.Free;
  _Imposto.Free;
  _Orcamento.Free;
  _Padroes.Free;
  _ModeloHist.Free;
  _HistoContab.Free;  //Edilaine - SOL 178962 / KTN 1659255

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
  _CdsCCBaixasXDocum.Free;

  //amf 10.03.2006 p:21669
  FreeAndNil(cdsLancamento);

  _DtmCtrlDocCapCar.Free;

  //amf 11.04.2007 23341
  FreeAndNil(RadPlus);

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
  ovAdiantamentoPendente, ovCCBaixasxDocum : OleVariant;
  Operacao: TOperacao; OperacaoLanc: TOperacaoLancDocCapCar; bLancaPartidaDobrada: Boolean;
  dDataRegularizacao: TDateTime; dDataDispFinanc: TDateTime = 0; bContabilizaLancBaixAdianto: Boolean = false;
  bSlipAutomatico: Boolean = false;
  // 27/01/04 Alex 14451 - Nova Segregação Recursos
  const iIdSegregaCriter: integer = -1;
  // 27/04/04 Alex 16220 - CPMF na Lança e Baixa simultânea, parâmetro utilizado apenas na exclusão
  const iNumLoteDoc: integer = -1 ): Boolean;

  Var
    iCodLancBaixaAdiando,
    iCodDocumento,
    iNumLancto,
    iPlnCodigo : Integer;
    iNumLoteManual,
    iEmpresa,iModulo,
    iUsuario {, iNumCompromisso} : Integer;

    SistemaLancto : TSistemaLancto;
    sDebCre,sDscLog: String;

    rValTotAlterador,
    rCodLancFianc,
    rValorRateioComCompromisso,
    rValorComprometidoReserva: double;
//    rValor : Double;

    _BaixaDocumentos : TCtrlBaixaDocumentos;

    x : Integer;//VANDER


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

//  function IntegraorcamentoBack(NumReserva: integer; rValor: real):boolean;
  function IntegraorcamentoBack(NumReserva: longInt; rValor: double):boolean; //pendência 26765 - 15/04/2008
  var
    rValorCompromisso :Double;
  begin
    Result := True;
    if (Operacao = OpAlterar) and
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
             //if (rValorComprometidoReserva <> 0.00) and (rValorRateioComCompromisso <> 0.00) then
             if (not IsFloatZero(rValorComprometidoReserva)) and (not IsFloatZero(rValorRateioComCompromisso)) then //pendência 26765 - 15/04/2008
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

  //Edilaine - SOL 178962 / KTN 1659255
  procedure AtualizaAlteradores;
  var
    cdsForCli: TClientDataSet;
    sqlTxt : string;
    sHistorico : string;
  begin
    try
      CdsForCli := TClientDataSet.Create (nil);

      CdsForCli.data := GetDataPacket('SELECT RAZAOSOCIAL FROM PESSOA WHERE IDPESSOA = ' + _CdsDocumento.FieldByName('IDFORCLI').AsString);

      _CdsAlteradores.First;
      While Not _CdsAlteradores.Eof Do
      Begin
        if (_CdsDocumento.FieldByName('RECPAG').AsString = 'P') Then  // Edilaine - SOL 178962-9741 / KTN 1668642
        begin
          sHistorico := _CdsAlteradores.FieldByName('DESCRICAO').AsString+' DOC: '+_CdsDocumento.FieldByName('NODOCUMENTO').AsString+'; '+
                        'AP: '+Trim(_CdsDocumento.FieldByName('NUMAPGR').AsString)+' / '+CdsForCli.FieldByName('RAZAOSOCIAL').AsString+' / '
        end
        else
        begin
          sHistorico := _CdsAlteradores.FieldByName('DESCRICAO').AsString+' DOC: '+_CdsDocumento.FieldByName('NODOCUMENTO').AsString+'; '+
                        'AR: '+Trim(_CdsDocumento.FieldByName('NUMAPGR').AsString)+' / '+CdsForCli.FieldByName('RAZAOSOCIAL').AsString+' / ';

        end;  // Edilaine - SOL 178962-9741 / KTN 1668642


        if Trim(_CdsDocumento.FieldByName('HISTORICOCOMPL').AsString) <> '' then
           sHistorico := sHistorico + _CdsDocumento.FieldByName('HISTORICOCOMPL').AsString+' / ';
        sHistorico := sHistorico + '('+_CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString+')';

        _HistoContab.ArrumaHistorico(sHistorico);

        sqlTxt := 'UPDATE LANCAMENTO SET '+
                  '  LACNUMDOC = '+QuotedStr(Trim(_CdsDocumento.FieldByName('NODOCUMENTO').AsString+' '+_CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString))+', '+
                  '  LACHIST1 = '+QuotedStr(_HistoContab.Hist1)+', '+
                  '  LACHIST2 = '+QuotedStr(_HistoContab.Hist2)+', '+
                  '  LACHIST3 = '+QuotedStr(_HistoContab.Hist3)+', '+
                  '  LACHIST4 = '+QuotedStr(_HistoContab.Hist4)+', '+
                  '  LACHIST5 = '+QuotedStr(_HistoContab.Hist5)+
                  ' WHERE PLNCODIGO = ' + _CdsAlteradores.FieldByName('PLNCODIGO').AsString;

        try
          GetDataPacket( sqlTxt );
        except
          Raise Exception.Create( MSG_ERRO_ALTERAR_DOC + MessageInfo );
        end;

        //Cássio Rovaroto - WO3606 - Início
        if _CdsAlteradores.FieldByName('VALORBASERETENCAO').AsFloat <> 0 then
        begin
          sqlTxt := 'UPDATE PLANILHA SET '+
                  '  PLNDATDIA = '+QuotedStr(_CdsAlteradores.FieldByName('DATALANCTO').AsString)+
                  ' WHERE PLNCODIGO = ' + _CdsAlteradores.FieldByName('PLNCODIGO').AsString;
          try
            GetDataPacket( sqlTxt );
          except
            Raise Exception.Create( MSG_ERRO_ALTERAR_DOC + MessageInfo );
          end;

          sqlTxt := 'UPDATE LANCTODOCUM SET '+
                  '  DATALANCTO = '+QuotedStr(_CdsAlteradores.FieldByName('DATALANCTO').AsString)+
                  ' WHERE CODDOCUMENTO = ' + _CdsDocumento.FieldByName('CODDOCUMENTO').AsString +
                  '   AND CODALTERADOR = ' + _CdsAlteradores.FieldByName('CODALTERADOR').AsString ;
          try
            GetDataPacket( sqlTxt );
          except
            Raise Exception.Create( MSG_ERRO_ALTERAR_DOC + MessageInfo );
          end;
        end;
        //Cássio Rovaroto - WO 3606  -Fim


        _CdsAlteradores.Next;
      end;
    finally
      CdsForCli.free;
    end;
  end;
  //Edilaine - SOL 178962 / KTN 1659255 - fim

  procedure LancaAlteradores;
  Var
    liUnidNegocioLancto: Integer;
    iIdTipoServico, iIdProcesso: integer; //Cássio Rovaroto - SIG nº 115585
    dValorBaseretencao : Double; //Cássio Rovaroto - SIG nº 115585
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

       //Cássio Rovaroto - sig nº 115585 - Início
       if (_CdsAlteradores.FieldByName('IDTIPOSERVICO').IsNull) then
        iIdTipoServico := -1
       else
        iIdTipoServico := _CdsAlteradores.FieldByName('IDTIPOSERVICO').AsInteger;

       if (_CdsAlteradores.FieldByName('IDPROCESSO').IsNull) then
        iIdProcesso := -1
       else
        iIdProcesso := _CdsAlteradores.FieldByName('IDPROCESSO').AsInteger;

         if (_CdsAlteradores.FieldByName('VALORBASERETENCAO').IsNull) then
        dValorBaseretencao := 0
       else
        dValorBaseretencao := _CdsAlteradores.FieldByName('VALORBASERETENCAO').AsFloat;

       //Cássio Rovaroto - SIG nº 115585 - Fim

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
                                        ( 'S' = Trim( _CdsAlteradores.FieldByName('CONTABILIZA').AsString ) ),
                                        //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                                        0,  // iCodPortForma   : Integer = 0;
                                        0,  // iDiasFloat      : Integer = 0;
                                        '', // sContaBaixa     : String = '';
                                        0,  // liSubContaBaixa : Integer = 0;
                                        0,  // IDDespesaOrc    : Double  = 0;
                                        _CdsAlteradores.FieldByName('IDRATEIODOCUM').AsFloat
                                        //FIM - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                                        , iIdTipoServico, iIdProcesso, dValorBaseretencao //Cássio Rovaroto - SIG nº 115585
                                        );


       If Not _Documento.Insert Then
          Raise Exception.Create( MSG_ERRO_ALTERADOR + _Documento.MessageInfo );

       _CdsAlteradores.Next;
    end;
  End;

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
        {SOL:184871 KTN:1747071 - JRM6}
//        bLancaPartidaDobrada := False; Marcio Sanches Spinosa SOL 249671 PPM 698569
        {SOL:184871 KTN:1747071 - JRM6}
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
                                      //_CdsContabilizacao.FieldByName('LACNUMDOC').AsString, // Edilaine - SOL 178962-9761 / KTN 1669317 - comentado
                                      Trim(_CdsDocumento.FieldByName('NODOCUMENTO').AsString+' '+_CdsDocumento.FieldByName('COMPLDOCUMENTO').AsString),  // Edilaine - SOL 178962-9761 / KTN 1669317
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
                                      _CdsDocumento.FieldByName('DATALANCTO').AsDateTime,
                                      -1,   // Edilaine - SOL 178962-9761 / KTN 1669317
                                      true, // Edilaine - SOL 178962-9761 / KTN 1669317
                                      _CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger // Edilaine - SOL 178962-9761 / KTN 1669317
                                      ) Then
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
     _Imposto.UsaPlanoPatro     := bUsaPlanoPatro;
     _Imposto.NumLanctoOrigem   := 0;
     _Imposto.PartidaDobrada    := bLancaPartidaDobrada;
     _Imposto.IdPlanoConta      := _CdsDocumento.FieldByName('PLANO').AsInteger;
     _Imposto.IntegraContab     := bLancaContab;
     _Imposto.IdEmpresa         := _CdsDocumento.FieldByName('IDPESSOA').AsInteger;
     _Imposto.RecPag            := _CdsDocumento.FieldByName('RECPAG').AsString[1];
     _Imposto.IdUsuario         := iIdUsuario;
     _Imposto.IdEspAcesso       := iIdEspAcesso;
     _Imposto.IdModulo          := _CdsDocumento.FieldByName('IDMODULO').AsInteger;
     _Imposto.DataProgramada    := _CdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime;
     _Imposto.OperacaoDocumento := '2';
     _Imposto.IdForCli          := _CdsDocumento.FieldByName('IDFORCLI').AsInteger;
     _Imposto.CodDocumento      := iCodDocumento;
     _Imposto.NumLancto         := iNumLancto;
     _Imposto.ValorLancto       := _CdsDocumento.FieldByName('VALOR').AsFloat - rValTotAlterador;
     _Imposto.ValorLiquido      := 0;
     _Imposto.DataLancto        := _CdsDocumento.FieldByName('DATALANCTO').AsDateTime;
     _Imposto.DataEmissao       := _CdsDocumento.FieldByName('DATAEMISSAO').AsDateTime;
     _Imposto.DebCre            := _CdsDocumento.FieldByName('DEBCRE').AsString;
     _Imposto.MomentoLancamento := mlLancamento;
     _Imposto.CodTipoDoc        := _CdsDocumento.FieldByName('CODTIPDOC').AsInteger;
     _Imposto.OnRetencaoINSS    := Self.OnRetencaoINSS;
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
            iIdSegregaCriter, iNumLoteDoc);

     If Not Result Then  MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     if assigned(OnPergunta) then
       _Documento.OnPergunta := OnPergunta;

     //andré tavares - pendência 21601 - baixa por planos de benefícios
     _BaixaDocumentos := TCtrlBaixaDocumentos.Create;
     _BaixaDocumentos.InitializeAs(self);

     rValTotAlterador              := 0;
     iPlnCodigo                    := 0;
     Result                        := True;
     _CdsContabilizacao.Data       := ovContabilizacao;
     _CdsAlteradores.Data          := ovAlteradores;
     _CdsRateio.Data               := ovRateio;
     _CdsContabilizacao.Data       := ovContabilizacao;
     _CdsDocumento.Data            := ovDocumento;
     _CdsAdiantamentoPendente.Data := ovAdiantamentoPendente;
     _CdsPrevisaoPendente.Data     := ovPrevisaoPendente;
     _CdsCCBaixasXDocum.Data       := ovCCBaixasXDocum;
     _CdsRateioDelete.Data         := ovRateio;


     //amf 20.04.2007 22592 - pega a aquantidade de cotas.
     if (not _cdsDocumento.FieldByName('QTDECOTAS').IsNull) then
        _Documento.QtdeCotas := _cdsDocumento.FieldByName('QTDECOTAS').AsFloat;

     if (_CdsDocumento.fieldByName('DATAPROGRAMADA').value <> _CdsDocumento.fieldByName('DATAPROGRAMADA').Oldvalue) and
        (not _CdsDocumento.fieldByName('DATADISPONIB').IsNull) then
     begin
       dDataDispFinanc := _CdsDocumento.fieldByName('DATAPROGRAMADA').Value;
     end;


     // Rodolpho da Silva - 21/06/2005
     // Foi inserido esta verificação pois em alguns casos onde o rateio
     //não é necessário, o _CdsRateioDelete ficava vazio então, ao tentar executar um StatusFilter,
     //gerava um erro de "Cds is not edit mode"
     if (not _CdsRateioDelete.IsEmpty) then
        _CdsRateioDelete.StatusFilter := [usDeleted];


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

        // Rotina de Log
        iEmpresa := _CdsDocumento.FieldByName('IDPESSOA').AsInteger;
        iModulo  := _CdsDocumento.FieldByName('IDMODULO').AsInteger;
        iUsuario := iIdUsuario;

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
                  begin
                    // edilaine - SOL 222006-17039 / PPM 712379  -fim
                    if _CdsDocumento.FieldByName('STATUS').AsString = '1' then
                       _Documento.Prepare( OpDocumento, odlEfetivo, ssdocAberto1)
                    else  // edilaine - SOL 222006-17039 / PPM 712379 - fim
                       _Documento.Prepare( OpDocumento, odlEfetivo );
                    _Documento.DataDisponibilidade := dDataDispFinanc;
                  end;
             End;
           opldAdiantamento:
             Begin
                sDscLog  := 'Adiantamento de Lancamento';
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

           _Documento.IdEspAcesso    := iIdEspAcesso;
           _Documento.IdUsuario      := iIdUsuario;
           _Documento.IdModulo       := _CdsDocumento.FieldByName('IDMODULO').AsInteger;
           _Documento.UsaPlanoPatro  := bUsaPlanoPatro;
           _Documento.SlipAutomatico := bSlipAutomatico;

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
                                       _CdsDocumento.FieldByName('NOSSONUMERO').AsString,
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
                                       iIdSegregaCriter,
                                       '',
                                       -1,
                                       // Início Sol: 136242 Ktn: 813941 - FHBS
                                       _CdsDocumento.FieldByName('FLGSIMPLES').AsString,

                                      _CdsDocumento.FieldByName('FLGESPECIAL').AsString
                                       //Cássio Rovaroto - SIG nº 23656.57673 - Início
                                       , _cdsDocumento.FieldByName('NFSNUMERO').AsString,
                                       _CdsDocumento.FieldByName('NFSSERIE').AsString,
                                       _CdsDocumento.FieldByName('NFSDATAEMISSAO').AsDatetime,
                                       _CdsDocumento.FieldByName('NFSOBS').AsString,
                                       //Cássio Rovaroto - SIG nº 23656.57673 - Fim
                                       _CdsDocumento.FieldByName('CODDOSSIE').AsString //Everson Cunha - SIG118992 e 118993
                                       , _CdsDocumento.FieldByName('NFSSERVICO').AsInteger
                                       , _CdsDocumento.FieldByName('NUMPROCESSO').AsString // WO14157/159 Ferrari
                                       , _CdsDocumento.FieldByName('PARTEFUNCEF').AsString // WO14157/159 Ferrari
                                       , _CdsDocumento.FieldByName('PARTECONTRARIA').AsString // WO14157/159 Ferrari
                                       );

                  _Documento.Lanctodocum.SetValues(_CdsDocumento.FieldByName('DATALANCTO').AsDateTime,
                                                   _CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger,
                                                   _CdsDocumento.FieldByName('NUMLANCTO').AsInteger,
                                                   _CdsDocumento.FieldByName('VLRLIQUIDO').AsFloat,
                                                   _CdsDocumento.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                   _CdsDocumento.FieldByName('VALOR').AsFloat,
                                                   0,
                                                   iPlnCodigo,
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

                  _CdsRateio.First;

                  //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                  _Documento.Rateiodocum.IntegraOrcamento := bIntegraOrcamento;
                  //
                  While Not _CdsRateio.Eof Do
                  Begin
                    {//INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                    If bIntegraOrcamento Then
                       Try
                         _Documento.Orcamento.FDO(_CdsDocumento, _CdsRateio, _CdsAlteradores);
                       Except
                         RAISE;
                       End;
                    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662}

                  if Operacao = opInserir then
                  begin
                    _Orcamento.Operacao := 'I';  // SOL 230863 e 230956 PPM 374049 e 362016
                    _Documento.Rateiodocum.FOperacao := 'I';
                  end
                  else if Operacao = opAlterar then
                  begin
                    _Orcamento.Operacao := 'A'; // SOL 230863 e 230956 PPM 374049 e 362016
                    _Documento.Rateiodocum.FOperacao := 'A';
                  end;

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
                                                        _CdsRateio.FieldByName('IDPLANOORIGEM').AsInteger,
                                                        _CdsRateio.FieldByName('IDPATROORIGEM').AsInteger,
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
                                                        _cdsRateio.fieldByName('IDSEGREGACONTR').asInteger,
                                                        //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                                                        //_cdsRateio.fieldByName('IDDESPESAORC').AsFloat,
                                                        _CdsDocumento,
                                                        _CdsRateio,
                                                        _CdsAlteradores
                                                        //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                                                        )



                     else
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
                                                        _CdsRateio.FieldByName('IDPLANOORIGEM').AsInteger,
                                                        _CdsRateio.FieldByName('IDPATROORIGEM').AsInteger,
                                                        _CdsRateio.FieldByName('IDPROGRAMA').AsInteger,
                                                        0,
                                                        _CdsDocumento.FieldByName('IDPESSOA').AsInteger,
                                                        _CdsRateio.FieldByName('CODTIPRECDES').AsString,
                                                        _CdsDocumento.FieldByName('RECPAG').AsString,
                                                        _CdsRateio.FieldByName('CODCENTRORESPON').AsString,
                                                        _CdsRateio.FieldByName('CODCENTROCUSTO').AsString,
                                                        _CdsRateio.FieldByName('NUMIMOVEL').AsString,
                                                        //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                                                        TRUE,
                                                        0,
                                                        0,
                                                        //_cdsRateio.fieldByName('IDDESPESAORC').AsFloat,
                                                        _CdsDocumento,
                                                        _CdsRateio,
                                                        _CdsAlteradores
                                                        //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                                                        //
                                                        );


                     _CdsRateio.Next;
                  end;

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


                  // Executa os métodos de inclusões/exclusões e alterações do documento
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


                  If ( IsFloatZero(_Documento.CodDocumento) ) Then
                     _Documento.CodDocumento := _CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger;

                  If ( IsFloatZero(_Documento.Lanctodocum.NumLancto) ) Then
                     _Documento.Lanctodocum.NumLancto := _CdsDocumento.FieldByName('NUMLANCTO').AsInteger;

                  iCodDocumento := Trunc(_Documento.CodDocumento);
                  iNumLancto    := _Documento.Lanctodocum.NumLancto;
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
                                                   iNumLoteManual,
                                                   0,
                                                   0,
                                                   _CdsDocumento.FieldByName('NUMCHQBORDERO').AsString,
                                                   _CdsDocumento.FieldByName('DATACFLOAT').AsString,
                                                   _CdsDocumento.FieldByName('DATALANCTO').AsString) Then
                       Raise Exception.Create( MSG_ERRO_BAIXA_DOC + _Documento.MessageInfo );
                  end;

                  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                  if (bIntegraOrcamento   ) and
                     (Operacao = opInserir) Then
                  Begin
                     _CdsRateio.First;
                     Try
                        For X := 0 To (_Documento._LstRateioDocum.Count - 1) Do
                        Begin
                           If NOT TDbRateiodocum(_Documento._LstRateioDocum[X]).IDReservaOrcamen.IsNull Then
                           Begin
                              if ( TDbRateiodocum(_Documento._LstRateioDocum[X]).IDReservaOrcamen.AsFloat   <>
                                   _CdsRateio.FieldByName('IDReservaOrcamen').AsFloat                     ) Then
                                   if NOT _CdsRateio.Locate('IDReservaOrcamen',
                                                            TDbRateiodocum(_Documento._LstRateioDocum[X]).IDReservaOrcamen.AsFloat,
                                                            []) Then Continue;
                              //
                              _CdsAlteradores.Filter   := 'IDRATEIO_ORCAMENTO = ' + _CdsRateio.FieldByName('IDRATEIO_ORCAMENTO').AsString;
                              _CdsAlteradores.Filtered := True;
                              //
                              _CdsAlteradores.First;
                              //
                              While Not _CdsAlteradores.EOF do
                              Begin
                                _CdsAlteradores.Edit;
                                _CdsAlteradores.FieldByName('IDRATEIODOCUM').AsInteger := TDbRateiodocum(_Documento._LstRateioDocum[X]).IdRateioDocum.AsInteger;
                                _CdsAlteradores.Post;
                                //
                                _CdsAlteradores.NEXT;
                              End;

                              //_CdsRateio.Next;
                           End;
                           _CdsRateio.Next;
                        End;
                     Finally
                       _CdsAlteradores.Filtered := FALSE;
                     End;//TRY
                  End;
                  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662


                  //Lancamento de alteradores cadastrados na inclusão do documento
                  If Operacao = opInserir Then
                     LancaAlteradores
                  else
                     AtualizaAlteradores;  //Edilaine - SOL 178962 / KTN 1659255

                  // Edilaine - SOL 178962-9761 / KTN 1669317
                  if Operacao = opInserir then
                  begin
                    if not ExecSQL('UPDATE LANCAMENTO SET CODDOCUMENTO = '+IntToStr(iCodDocumento)+' WHERE PLNCODIGO = ' + IntToStr(iPlnCodigo)) then
                       Raise Exception.Create( MSG_ERRO_ALTERAR_DOC + _Documento.MessageInfo );
                  end;
                  // Edilaine - SOL 178962-9761 / KTN 1669317 - fim

                  If ( OperacaoLanc = opldEfetivo ) And
                     ( not bLancaEBaixa ) Then
                  Begin
                     InicializaImposto;

                     If Operacao = opInserir Then
                     begin
                        _Imposto.Incluir;
                     end
                     Else
                     begin
                        _Imposto.NumLanctoOrigem := iNumLancto;
                        _Imposto.Excluir;

                        InicializaImposto;
                        _Imposto.Incluir;
                     end;
                  End
                  else
                  begin
                     // Lançar CPMF com lança e baixa simultânea
                     if bLancaEBaixa then begin
                        InicializaImposto;

                        // modificar os parâmetros para CPMF
                        _Imposto.MomentoLancamento := mlBaixa;
                        _Imposto.CodPortForma      := _CdsDocumento.FieldByName('CODPORTFORMA').AsInteger;
                        _Imposto.NumLote           := -1;
                        _Imposto.NumLoteManual     := iNumLoteManual;
                        _Imposto.Incluir;

                        _Imposto.NumLote           := -1;
                        _Imposto.NumLoteManual     := iNumLoteManual;
                        _Imposto.CodPortForma      := _CdsDocumento.FieldByName('CODPORTFORMA').AsInteger;
                        _Imposto.EfetivaNovoDocumento;
                     end;
                  end;

                  if OperacaoLanc in [opldEfetivo, opldAdiantamento] then
                  begin

                    if ( OperacaoLanc = opldEfetivo ) then
                    begin
                      RegularizaPrevisao;
                      RegularizaAdiantamento;

                      //If bIntegraOrcamento Then Atualizaorcamento;
                    end;

                      //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                   { If bIntegraOrcamento Then
                       Try
                         _Documento.Rateiodocum.
                         _CdsRateio.First;
                         While NOT _CdsRateio.EOF DO
                         begin
                           _Documento.Orcamento.FDO(_CdsDocumento, _CdsRateio, _CdsAlteradores);
                           _CdsRateio.NEXT;
                         End;
                       Except
                         RAISE;
                       End;}
                    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662


                    {
                    //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                    Try
                      {_Documento.Orcamento.FDO(_CdsDocumento.FieldByName( 'IDFORCLI'   ).AsFloat, //AFornecedor     : Double;
                                               _CdsDocumento.FieldByName( 'DATAVENCTO' ).AsDateTime, //AData           : TDateTime;
                                               _CdsRateio.Data,
                                               _CdsAlteradores.Data,
                                               _CdsDocumento.FieldByName('OBS').AsString);
                      //_Documento.Orcamento.FDO(_CdsDocumento, _CdsRateio, _CdsAlteradores);
                    Except
                      RAISE;
                    End;
                     }
                    (*
                    If bIntegraOrcamento Then
                    Begin
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

                       With _DtmCtrlDocCapCar Do
                       Begin
                          SqlRateio.Prepare;
                          SqlRateio.ParamByName('CODDOCUMENTO').AsFloat := iCodDocumento;
                          SqlRateio.Open;


{ pendência 26765 - 15/04/2008 - comentei o trcho de código e refiz abaixo do mesmo

                          CdsRateio.First;
                          // Rodolpho da Silva - P: 24769 - 15/03/2007
                          // Extrai o número do compromisso para
                          iNumCompromisso := CdsRateio.FieldByName('NUMRESERVA').AsInteger;
                          rValor          := 0;


                          while not CdsRateio.Eof do
                          begin
                             // Acumula o valor do rateio para cada compromisso.
                             // Isto atende a estrutura de Segregação na Origem
                             rValor := (rValor + CdsRateio.FieldByName('VALOR').AsFloat);

                             // Vai para a próxima linha de rateio
                             CdsRateio.Next;

                             // Se o número do compromisso for diferente, ou seja, uma segregação
                             //de mais de um rateio e com compromissos diferentes para cada linha,
                             //faz a efetivação do compromisso rateado pela segregação
                             if ((iNumCompromisso <> CdsRateio.FieldByName('NUMRESERVA').AsInteger) or (CdsRateio.Eof)) then
                             begin
                                IntegraorcamentoBack(iNumCompromisso,rValor);
                                iNumCompromisso := CdsRateio.FieldByName('NUMRESERVA').AsInteger;
                                rValor          := 0;
                             end;

                          end;
}
                          //pendência 26765 - 15/04/2008 - refazendo o código acima
                          CdsRateio.First;
                          while not CdsRateio.Eof do
                          begin
                             IntegraorcamentoBack(CdsRateio.FieldByName('NUMRESERVA').AsInteger, CdsRateio.FieldByName('VALOR').AsFloat);
                             // Vai para a próxima linha de rateio
                             CdsRateio.Next;
                          end;

                          CdsRateio.Close;
                       end;
                    end;
                    *)

                    {**
                      Implementar processamento de avaliação de fornecedor e
                      agrupa\parcela documentos
                    **}
                  end;
               end;
             opApagar:
               Begin

                  // Excluir a CPMF quando for lança e baixa simultânea
                  if bLancaEBaixa then begin
                     _Imposto.CodDocumento    := _CdsDocumento.FieldByName('CODDOCUMENTO').AsInteger;
                     _Imposto.NumLancto       := 0;
                     _Imposto.NumLanctoOrigem := 0;
                     _Imposto.TipoExclusao    := teSoBaixa;
                     _Imposto.NumLote         := -1;
                     _Imposto.NumLoteManual   := iNumLoteDoc;
                     _Imposto.Excluir;
                  end;


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

        // Gravar log's
        If Not _Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,sDscLog,False) Then
           Raise Exception.Create(_Padroes.MessageInfo);

         //Baixa por planos de benefícios
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

         ///Baixa por planos de benefícios
         _BaixaDocumentos.Free;


        // Finaliza a operação
        Commit;



     except
        on ErroFDO : EProcessoFDO_GetContaSaldoOrcado do
        Begin
          _BaixaDocumentos.Free;
          Result := False;
          Rollback;
          RAISE;
        End;

        On E:Exception Do
         Begin
           //edilaine SIG95404 : inicio
           if (Operacao in [opInserir, opAlterar]) and (OperacaoLanc = opldEfetivo) then
           begin
              _Documento.EstornaIntegraOrc(_documento.coddocumento, iPlnCodigo);
           end;
           //edilaine SIG95404 : fim

            _BaixaDocumentos.Free;
            Result := False;
            Rollback;

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

   //amf 17.04.2007 25081
   sListaDocs: string;
   cdsDocOrigemSelecionados: TClientDataSet;

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
                            cdsCCBaixasXDocum.fieldByName('PLACONTA').AsString,
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
                            cdsCCBaixasXDocum.fieldByName('IDSEGREGACRITER').asInteger);

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

       //amf 11.04.2007 23341 - deleta os processos RAD que participaram do englobamento dos documentos
       if (_cdsOrigemParcelas.FieldByName('IDPROCESSO').AsInteger > 0) then
          RadPlus.ExcluirProcesso(_cdsOrigemParcelas.FieldByName('IDPROCESSO').AsInteger, True);

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

     //amf 17.04.2007 25081 - cópia do cds para obter a lista do documentos
     try
        cdsDocOrigemSelecionados      := TClientDataSet.Create(nil);
        cdsDocOrigemSelecionados.Data := ovOrigem;
        sListaDocs := '';
        while (not cdsDocOrigemSelecionados.Eof) do
        begin
           if (sListaDocs = '') then
              sListaDocs := cdsDocOrigemSelecionados.FieldByName('CODDOCUMENTO').AsString
           else
              sListaDocs := sListaDocs + ',' + cdsDocOrigemSelecionados.FieldByName('CODDOCUMENTO').AsString;

           cdsDocOrigemSelecionados.Next;
        end;
     finally
        FreeAndNil(cdsDocOrigemSelecionados);

        _Documento.CentroRespon := _Documento.GetMaiorCR(sListaDocs);

     end;

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

   // Rodolpho da Silva - P: 24269 - 24/01/2007
   aStrReports: TMemoryStream;
   Rpt: TRptApGr4;

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
//Inicio 124096 Ferrari
         4579:
         begin
         If not TRptAutPagCofin.PrintReport(IdReport, 1, Sistema.IdEmpresa, Sistema.IdUsuario,
                Sistema.IdModulo, FloatToStr(iCodDocumento) + '|=| |=| |=| |=|', '',
               'BaseDados', Sistema.NomeEmpresa, Sistema.NomeModulo, sMensagem) then
            MsgDlg(sMensagem, 'Impressão do Espelho do Documento "' + sNomeReport, mtError, [], 0);
         end;
//FIM 124096
////douglas.siqueira SOL178983
         20462:
         begin
         If not TRptAutPag1.PrintReport(IdReport, 1, Sistema.IdEmpresa, Sistema.IdUsuario,
                Sistema.IdModulo, FloatToStr(iCodDocumento) + '|=| |=| |=| |=|', '',
               'BaseDados', Sistema.NomeEmpresa, Sistema.NomeModulo, sMensagem) then
            MsgDlg(sMensagem, 'Impressão do Espelho do Documento "' + sNomeReport, mtError, [], 0);
         end;

////douglas.siqueira SOL178983

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

         // Início - Rodolpho da Silva - 14/11/2006
         20206 : begin

                   //Marcus Oliveira P.25234 05/06/2007
                   if not FlgImprimeAP(CodDocumento) then
                   begin
                      MsgDlg('Tipo de documento não imprime AP. ', 'Atenção', mtError, [mbOK], 0 );
                      exit;
                   end
                   else
                    if not TRptApGr4.PrintReport(IdReport,1,Sistema.IdEmpresa,
                                                 Sistema.IdUsuario,Sistema.IdModulo,
                                                 FloatToStr(iCodDocumento) + '|=| ' +

                                                 //Marcus Oliveira P.25349 19/07/2007
                                                 'True |=| ' +                       // Imprime rel. expandido
                                                 '|=| ' +                             // C.Resp.
                                                 '|=| ' +                             // Data Emissao
                                                 '0 |=| ' +                           // Tipo da Ap
                                                 '0 |=| ' +                           // Lote
                                                 'True |=| ',                             // Imprime contabil   -  Marcus Oliveira P.24614 01/03/2007
                                                 '',
                                                 'BaseDados',Sistema.NomeEmpresa,Sistema.NomeModulo,
                                                 sMensagem) then
                    MsgDlg(sMensagem, 'Impressão do Espelho do Documento "' + sNomeReport, mtError, [], 0);
                 end;
         // Fim - Rodolpho da Silva - 14/11/2006

         Else
            MsgDlg( sMensagem + 'O Relatório "' + sNomeReport + '" não foi implementado para impressão automática.', 'Aviso', mtWarning, [], 0 );
       end;
     end;
end;



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
{SOL:184871 KTN:1747071 - JRM6}
//bSomou : Boolean; Marcio Sanches Spinosa SOL 249671 PPM 698569
{SOL:184871 KTN:1747071 - JRM6}

begin

  {** Só junta os lançamentos na planilha se não for partida dobrada **}
  {SOL:184871 KTN:1747071 - JRM6}
//  bSomou := false; Marcio Sanches Spinosa SOL 250751 PPM 698569
  //Willliam Moreira da Silva - SOL 250751 - A demanda 249671 era para ter tirado as alteração do sol 184871, que apenas havia comentado
  //o 'not' do if abaixa, porém havia retirado o if inteiro.
  //if not ParamIntegra.PartidaDobrada then
  if not ParamIntegra.PartidaDobrada then
  //Willliam Moreira da Silva - SOL 250751
  {SOL:184871 KTN:1747071 - JRM6}
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
         (CdsContab.FieldByName('IDSEGREGACRITER').AsInteger = _iIdSegregaCriter) then
      begin
{SOL:184871 KTN:1747071 - JRM6}
//        bSomou := True; Marcio Sanches Spinosa SOL 249671 PPM 698569
{SOL:184871 KTN:1747071 - JRM6}
        CdsContab.Edit;
        CdsContab.FieldByName('LACVALOR').AsFloat   := CdsContab.FieldByName('LACVALOR').AsFloat + _ValorCorrente;
        CdsContab.FieldByName('LACVALHIST').AsFloat := CdsContab.FieldByName('LACVALHIST').AsFloat + _ValorMoeda;
        CdsContab.FieldByName('NOME_1').AsString    := '';

        CdsContab.Post;
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

  {SOL:184871 KTN:1747071 - JRM6}
  //Marcio Sanches Spinosa SOL 249671 PPM 698569 - Inicio
//  if not bSomou then
//  begin
  //Marcio Sanches Spinosa SOL 249671 PPM 698569 - Fim
    {SOL:184871 KTN:1747071 - JRM6}
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

    CdsContab.Post;
    {SOL:184871 KTN:1747071 - JRM6}
//  end; Marcio Sanches Spinosa SOL 249671 PPM 698569
  {SOL:184871 KTN:1747071 - JRM6}
end;

function TCtrlLancDocCapCar.ProcessaInsertContab(const bIntegraContab: boolean;
                                                 const sDescTipoDoc: string;
                                                 const iIdForCli: integer;
                                                 const CdsDoc: TClientDataSet;
                                                 const CdsRateio: TClientDataSet;
                                                 var CdsContab: TClientDataSet): boolean;

var
   sHistoricoPadrao, sHistoricoContab, sHistorico :String;
   sDebCred: string;
   iLacNumLan, iLacNumLan2 : integer;
   cdsForCli: TClientDataSet;
   sObrigaCC, sNome, sObrigaSubConta, scentroCusto, scentroCustoExt : string;
   iSubconta : Integer;

   cdsLocal: TCMClientDataSet;
   sContaCredAdm, sContaDebAdm, sNomePatro, sDescPlano: string;
   recPlanoPatro: TDadosFinanceiro;
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
//        //Marcio Sanches Spinosa SOL 249671 PPM 698569 - Inicio
//        end
//        else
//        {SOL:184871 KTN:1747071 - JRM6}
//        Begin
//          if Sistema.idmodulo = 3 then
//          begin
//              scentroCusto    := '';
//              scentroCustoExt := '';
////              scentroCusto    := CdsRateio.FieldByName('CODCENTROCUSTO').AsString;
////              scentroCustoExt := CdsRateio.FieldByName('CODEXTERNOCC').AsString;
//          end
//          else
//          begin
//              scentroCusto    := CdsRateio.FieldByName('CODCENTROCUSTO').AsString;
//              scentroCustoExt := CdsRateio.FieldByName('CODEXTERNOCC').AsString;
//          end;
        //Marcio Sanches Spinosa SOL 249671 PPM 698569 - Fim
        end;
        {SOL:184871 KTN:1747071 - JRM6}


        if trim(sObrigaSubConta) = 'S' then
        begin
          isubConta := CdsRateio.FieldByName('CODSUBCONTAPASS').AsInteger;
          if isubConta = 0 then
          begin
            raise exception.Create('A Conta Contábil '+ CdsRateio.FieldByName('PLACONTAPASS').AsString + ' Obriga Subconta.');
          end;
        end
        else isubConta := 0;

        // Ricardo A. SOL 122623 KTN 603580
        // agora sempre será utilizado a patrocinadora financeira e o plano previdenciário financeiro
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



        if bIntegraContab then
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
          //Marcio Sanches Spinosa SOL 249671 PPM 698569 - Inicio
//          end
//          else
//          {SOL:184871 KTN:1747071 - JRM6}
//          Begin
//            if Sistema.idmodulo <> 3 then
//            begin
//                scentroCusto    := '';
//                scentroCustoExt := '';
////                scentroCusto    := CdsRateio.FieldByName('CODCENTROCUSTO').AsString;
////                scentroCustoExt := CdsRateio.FieldByName('CODEXTERNOCC').AsString;
//            end
//            else
//            begin
//                scentroCusto    := CdsRateio.FieldByName('CODCENTROCUSTO').AsString;
//                scentroCustoExt := CdsRateio.FieldByName('CODEXTERNOCC').AsString;
//            end;
           //Marcio Sanches Spinosa SOL 249671 PPM 698569 - Fim
          end;
          {SOL:184871 KTN:1747071 - JRM6}

          if trim(sObrigaSubConta) = 'S' then
          begin
            isubConta := CdsRateio.FieldByName('CODSUBCONTA').AsInteger;
            if isubConta = 0 then
            begin
              raise exception.Create('A Conta Contábil '+ CdsRateio.FieldByName('PLACONTA').AsString + ' Obriga Subconta.');
            end;
          end
          else isubConta := 0;


          // Ricardo A. SOL 122623 KTN 603580
          // agora sempre será utilizado a patrocinadora financeira e o plano previdenciário financeiro
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

        // Ricardo A. SOL 122623 KTN 603580
        recPlanoPatro := _Documento.LocalizaPlanoPatroFinanceiro(
             CdsRateio.FieldByName( 'IDPESSOA' ).AsInteger,
             CdsDoc.FieldByName( 'CODPORTFORMA' ).AsInteger,
             CdsDoc.FieldByName( 'IDFORCLI' ).AsInteger,
             CdsRateio.FieldByName( 'IDPATROORIGEM' ).AsInteger,
             CdsRateio.FieldByName( 'IDPLANOORIGEM' ).AsInteger,
             CdsRateio.FieldByName( 'IDPROGRAMA' ).AsInteger,
             CdsRateio.FieldByName( 'RECPAG' ).AsString,
             CdsRateio.FieldByName( 'CODCENTROCUSTO' ).AsString,
             CdsRateio.FieldByName( 'CODTIPRECDES' ).AsString
             );

        // se plano previdenciário origem diferente do plano financeiro então lança
        // novo lançamento contábil de fundo administrativo
        if ( recPlanoPatro.ReceitaDespesaAdministrativa ) and
          ( CdsRateio.FieldByName( 'IDPLANOORIGEM' ).AsInteger <> CdsRateio.FieldByName( 'IDPLANOPREV' ).AsInteger  ) then
        begin

          cdsLocal := TCMClientDataSet.Create( nil );
          try
            // armazena conta de crédito/débito administrativo
            cdsLocal.Data := getDataPacket( 'SELECT SEGFDOADMCREDITO, SEGFDOADMDEBITO' +
              ' FROM PLANOCONTA WHERE' +
              ' PLANO = ' + CdsRateio.FieldByName('PLANO').AsString +
//              ' AND PLACONTA = ' + CdsRateio.FieldByName('PLACONTA').AsString
              ' AND PLACONTA = ' + recPlanoPatro.PlaConta
              );

            // Ricardo A. SOL 131335 KTN 746962
            if ParamIntegra.RecPag = 'P' then
            begin
              sContaCredAdm := cdsLocal.FieldByName( 'SEGFDOADMCREDITO' ).AsString;
              sContaDebAdm  := cdsLocal.FieldByName( 'SEGFDOADMDEBITO' ).AsString;
            end
            else
            begin
              sContaDebAdm  := cdsLocal.FieldByName( 'SEGFDOADMCREDITO' ).AsString;
              sContaCredAdm := cdsLocal.FieldByName( 'SEGFDOADMDEBITO' ).AsString;
            end;
            // FIM Ricardo A. SOL 131335 KTN 746962

            cdsLocal.Close;
            cdsLocal.Data := GetDataPacket( 'SELECT NOME FROM PLANPREVCONTABIL WHERE ' +
              'IDPLANOPREV = ' + cdsRateio.FieldByName( 'IDPLANOORIGEM' ).AsString  );
            sDescPlano := cdsLocal.FieldByName( 'NOME' ).AsString;

            cdsLocal.Close;
            cdsLocal.Data := GetDataPacket( 'SELECT NOME FROM PESSOA WHERE ' +
              'IDPESSOA = ' + cdsRateio.FieldByName( 'IDPATROORIGEM' ).AsString );
            sNomePatro := cdsLocal.FieldByName( 'NOME' ).AsString;
          finally
            FreeAndNil( cdsLocal );
          end;

          iLacNumLan2 := Self.GetNextID;

          // crédito
          funcaogeral.TestaContaCC(False, CdsRateio.FieldByName('PLANO').AsInteger,
                sContaCredAdm,
                sObrigaCC, sNome, sObrigaSubConta);
          FazerInsertContab (
                             'C',
                             sContaCredAdm,
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
                             CdsRateio.FieldByName('IDPLANOORIGEM').AsInteger,
                             CdsRateio.FieldByName('IDPATROORIGEM').AsInteger,
                             sDescPlano,
                             sNomePatro,
                             CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger,
                             CdsRateio.FieldByName('DESCSEGREGACRITER').AsString,
                             iLacNumLan2,
                             iSubConta,
                             CdsContab);

          // débito
          funcaogeral.TestaContaCC(False, CdsRateio.FieldByName('PLANO').AsInteger,
                sContaDebAdm,
                sObrigaCC, sNome, sObrigaSubConta);

          FazerInsertContab (
                             'D',
                             sContaDebAdm,
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
                             CdsRateio.FieldByName('IDPLANOORIGEM').AsInteger,
                             CdsRateio.FieldByName('IDPATROORIGEM').AsInteger,
                             sDescPlano,
                             sNomePatro,
                             CdsRateio.FieldByName('IDSEGREGACRITER').AsInteger,
                             CdsRateio.FieldByName('DESCSEGREGACRITER').AsString,
                             iLacNumLan2,
                             iSubConta,
                             CdsContab);

        end;


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
  Result := true;
  try

    CdsRateio.First;

    while not CdsRateio.Eof do
    begin

       if not _CtrlPlacontasCapCar.GetPlacontas (iCodPortForma, iIdForCli, iIdempresa,
                        cdsRateio.fieldByName('IDPROGRAMA').asInteger,
                       // Ricardo A. SOL 122623 KTN 603580
                       cdsRateio.fieldByName('IDPLANOORIGEM').asInteger,
                       // FIM Ricardo A. SOL 122623 KTN 603580
                        cdsRateio.FieldByName('CODCENTROCUSTO').AsString,
                        cdsRateio.FieldByName('CODTIPRECDES').AsString,
                        sRecPag, operLancto, blancaeBaixa, PlaContas, paramintegra.IntegraContab, paramintegra.plano) then
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

//alex definindo novo modeleo de implementação
function TCtrlLancDocCapCar.DeterminaContabilizacao(const bIntegraContab: boolean;
                                                    var placontas: Tplacontas; const cdsDoc: TClientDataset; var cdsCCBaixasXDocum: TClientDataset;
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
      if not _CtrlPlacontasCapCar.DeterminaSegregacao(CdsRateio, idempresa) then
        raise exception.create (_CtrlPlacontasCapCar.messageinfo);


      if not ProcessaInsertContab (bIntegraContab,sDescTipoDoc, cdsDoc.FieldByName('IDFORCLI').AsInteger,
                                   cdsDoc, CdsRateio, cdsContab) then
        raise exception.create (messageinfo);


      iPlanoDoc := 0;
      sPlacontaDoc := '';
      sCentroCustoDoc := '';
      iIdSegregaCriter := -1;


      if not _CtrlPlacontasCapCar.LancaMultiplasContasBaixa (CdsRateio, cdsCCBaixasXDocum, iPlanoDoc, sPlacontaDoc, sCentroCustoDoc, iIdSegregaCriter) then
        raise exception.create (_CtrlPlacontasCapCar.messageinfo);

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

function TCtrlLancDocCapCar.DocumentoDuplicado(opOperacao: TOperacao;
                                               //const NumDocumento: integer;   // Edilaine - SOL 199641 / KTN 1921256 - comentado
                                               const NumDocumento: int64;       // Edilaine - SOL 199641 / KTN 1921256
                                               const ComplDocumento: string;
                                               const Valor: Double;
                                               const IdFornecedor: integer;
                                               const DataVencto: TDateTime): boolean;
var
  sSQL: string;
begin
  try
    Result := False;
 
    sSQL := 'SELECT COUNT(*) AS TOTDOC FROM DOCUMENTO D, LANCTODOCUM L ' +
            'WHERE D.CODDOCUMENTO = L.CODDOCUMENTO ' +
            'AND D.OPERACAO = L.OPERACAO ';

            if opOperacao = opAlterar then
               sSQL := sSQL + ' AND D.NODOCUMENTO <> ' + IntToStr(NumDocumento);
 
            sSQL := sSQL +
            ' AND L.VALOR = ' +  StringReplace(FloatToStr(Valor),',','.',[rfReplaceAll]) +
            ' AND D.IDFORCLI = ' + IntToStr(IdFornecedor) +
            ' AND D.DATAVENCTO = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', DataVencto)) + ',''DD/MM/YYYY'')';
 
    _Cds.Data := GetDataPacket(sSQL);
    Result := _Cds.FieldByName('TOTDOC').AsInteger > 0;
 
  except
     Result := false;
  end;
end;

//Marcus Oliveira P. 25234 05/06/2007 Verifica o Flg se está imprimindo AP ou não.
function TCtrlLancDocCapCar.FlgImprimeAP(iCodDocumento: real): Boolean;
var
cdsImprimeAP : TClientDataSet;
sSql: String;
begin

  cdsImprimeAP := TClientDataSet.Create(nil);

  sSql := 'SELECT                                                                      ' +
          '   TD.FLGIMPRIMEAP AS IMPRIMEAP, D.CODDOCUMENTO  ' +
          'FROM                                                                        ' +
          '   TIPODOCRECPAG TD, DOCUMENTO D                                            ' +
          'WHERE                                                                       ' +
          '   D.CODTIPDOC = TD.CODTIPDOC AND                                           ' +
          '   D.CODDOCUMENTO = ' + floattostr( iCodDocumento );


  cdsImprimeAP.Data := GetDataPacket(sSql);

  if UpperCase( cdsImprimeAP.FieldByName('IMPRIMEAP').AsString ) <> 'N' then
    Result := True
    else
    Result := False;

  FreeAndNil(cdsImprimeAP);
  
end;


function TCtrlLancDocCapCar.ListaPlanoPatroParamCap: OleVariant;
begin
Result := GetDataPacket('SELECT IDPLANOPREV, IDPATRO FROM PARAMCAP WHERE RECPAG = '+ QuotedStr( ParamIntegra.RecPag ) );

end;

function TCtrlLancDocCapCar.ListaDadosCPRBFornecedor(pIdForCli: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT NVL(FLGCPRB,0) AS FLGCPRB, NVL(ALIQCPRB, 11) AS ALIQCPRB ' +
          '  FROM EMPRESAFORN ' +
  				' WHERE IDFORCLI =  ' + IntToStr(pIdForCli);
          
	Result := GetDataPacket(sSQL);
end;

function TCtrlLancDocCapCar.VerificaTipoServico(
  pCodTipRecDes, pRecPag: string): Boolean;
var
   cds: TCMClientDataSet;
begin
   Result := False;
   cds:= TCMClientDataSet.Create(nil);
   try
      cds.Data := GetDataPacket('SELECT NVL(FLGMAODEOBRA, ''N'') AS TIPOSERVICO ' +#13+
                                '  FROM TIPORECEBDESEMB ' +#13+
                                ' WHERE CODTIPRECDES = ' + QuotedStr(pCodTipRecDes) +#13+
                                '   AND RECPAG = ' + QuotedStr(pRecPag) +#13+
                                '   AND PLANO = (SELECT PLANO FROM PARAMCONTAB)');
      if cds.FieldByName('TIPOSERVICO').AsString = 'S' then
         Result := True;
   finally
     FreeAndNil(cds);
   end;
end;

function TCtrlLancDocCapCar.SetDadosNFS(pCodDocumento: Integer; pNumNFS, pNumSerie,
  pObsNFS, pDataEmissao: string; pIdServico: Integer; pSimples: Boolean): Boolean;
var
  sSQL: string;
begin
  if not InTransaction then
    StartTransaction;

  sSQL := 'UPDATE DOCUMENTO SET NFSNUMERO = ' + QuotedStr(pNumNFS)  +#13#10;

  if pNumSerie <> EmptyStr then
    sSQL := sSQL + ', NFSSERIE = ' + QuotedStr(pNumSerie) +#13#10;

  sSQL := sSQL + ', NFSDATAEMISSAO = TO_DATE('+ QuotedStr(pDataEmissao) + ',''DD/MM/YYYY'')' +#13#10;

  if pObsNFS <> EmptyStr then
    sSQL := sSQL + ', NFSOBS = ' + QuotedStr(pObsNFS) +#13#10;
  
  sSQL := sSQL + ' , NFSSERVICO = ' + IntToStr(pIdServico) +#13#10;
 
  if pSimples then
    sSQL := sSQL + ' , FLGSIMPLES = ''S'' ' +#13#10
  else
    sSQL := sSQL + ' , FLGSIMPLES = ''N'' ' +#13#10;

  sSQL := sSQL + ' WHERE CODDOCUMENTO = ' + IntToStr(pCodDocumento);

  Result := ExecSQL(sSQL);

  if not Result then
  begin
    Rollback;
    raise Exception.Create(MessageInfo);
  end
  else
    Commit;

end;

function TCtrlLancDocCapCar.GetDadosServico(pIdServico: String): OleVariant;
var
   cds: TCMClientDataSet;
begin
   cds:= TCMClientDataSet.Create(nil);
   try
    cds.Data := GetDataPacket('SELECT NOME AS NOME_SERVICO,  ' + #13 +
                                '       IDSERVICO AS NFSSERVICO' + #13 +
                                '  FROM LISTA_SERVICOS         ' + #13 +
                                ' WHERE IDSERVICO = ' + pIdServico);

    Result := cds.Data;
   finally
    FreeAndNil(cds);
   end;
end;

// Inicio WO8229 Ferrari
function TCtrlLancDocCapCar.getCamposRateio: OleVariant;
var
   sSQL    : string;
begin
  sSQL := ' SELECT   0 AS IDPADRRATEIODOC,'+ #13 +
          ' 0 AS IDGRUPORATEIO,'+ #13 +
          ' 0 AS IDPROGRAMA,'+ #13 +
          ' ''                                                            '' AS DESCPROGRAMA,'+ #13 +
          ' 0 AS IDEMPRESAPROP,'+ #13 +
          ' ''P'' AS RECPAG,'+ #13 +
          ' ''               '' AS CODTIPRECDES,'+ #13 +
          ' ''                                   '' AS TIPODESEMBOLSO,'+ #13 +
          ' 0 AS CODCENTROCUSTO,'+ #13 +
          ' ''                              '' AS CENTROCUSTO,'+ #13 +
          ' ''                              '' AS NOMECENTROCUSTO,'+ #13 +
          ' ''0'' AS CODCCEXTERNO,'+ #13 +
          ' ''          '' AS CODCENTRORESPON,'+ #13 +
          ' ''                              '' AS CENTRORESPON,'+ #13 +
          ' ''0'' AS CODCREXTERNO,'+ #13 +
          ' 0 AS UNIDNEGOC,'+ #13 +
          ' ''                         '' AS UNIDNEGOCIO,'+ #13 +
          ' 0 AS IDPATRO,'+ #13 +
          ' ''                                                            '' AS PATRO,'+ #13 +
          ' 0 AS IDPLANOPREV,'+ #13 +
          ' ''                                                  '' AS PLANPREV,'+ #13 +
          ' ''                                                  '' AS DESCPLANOORIGEM,'+ #13 +
          ' ''                  '' AS PLACONTACREDITO,'+ #13 +
          ' ''    '' AS HITCODHIST,'+ #13 +
          ' 0 AS IDPATROORIGEM,'+ #13 +
          ' 0 AS IDPLANOORIGEM,'+ #13 +
          ' 0 AS PERCENTRATEIO,'+ #13 +
          ' 0 AS VALORFDO,'+ #13 +
          ' 0 AS TOTAL,'+ #13 +
          ' '' '' AS FLGATIVIDADE,'+ #13 +
          ' '' '' AS FLGIDPROGRAMA,'+ #13 +
          ' '' '' AS FLGCENTROCUSTO,'+ #13 +
          ' '' '' AS FLGCENTRORESPON,'+ #13 +
          ' '' '' AS FLGTIPODESEMBOLSO,'+ #13 +
          ' '' '' AS FLGPATRO,'+ #13 +
          ' '' '' AS UNETIPO'+ #13 +
          ' FROM  DUAL WHERE 1 = 2';
  Result := GetDataPacket(sSQL);
end;
// Fim WO8229 Ferrari

end.


