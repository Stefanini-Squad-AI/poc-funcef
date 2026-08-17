{
--------------------------------------------------------------------------------
Pendência   : SOL 194557 Kintana 1862527
Responsável : Otacilio aquino
Data        : 21/11/2012
Descrição   : Inconsistência ao consultar o contrato falta de campo (SITENVIO)
              na query de entrada.
--------------------------------------------------------------------------------
Pendência   : SOL 165269 Kintana 1428881
Responsável : Fanuel Junior
Data        : 22/09/2011
Descrição   : Corrigido erro no Extrato Simples que estava apresentando itens
              internos e quitados como abertos
--------------------------------------------------------------------------------
Pendência   : SOL 159249 KINTANA 1376423
Responsável : Fanuel Junior
Data        : 30/08/2011
Descrição   : Erro ao mostrar valor efetivos para valores pagos
--------------------------------------------------------------------------------
Pendência   : SOL 140492 KINTANA 881593
Responsável : Ádler Souza
Data        : 31/08/2010
Descrição   : Inserir o valor do fundo garantidor abaixo da prestação.
--------------------------------------------------------------------------------
Pendência   : SOL 146488 KINTANA 997592
Responsável : BRUNO AZEVEDO
Data        : 29/10/2010
Descrição   : Correção na query consulta saldo de contrato..
--------------------------------------------------------------------------------
Pendência   : SOL 140310 KINTANA 877933
Responsável : BRUNO AZEVEDO
Data        : 28/07/2010
Descrição   : Permitir atualizar o saldo do contrato apenas para as datas que tem
              atualização diária.
--------------------------------------------------------------------------------
Pendência   : SOL 140315 KINTANA 876139
Responsável : BRUNO AZEVEDO
Data        : 22/07/2010
Descrição   : Apresentar os contratos por ordem de situação.
--------------------------------------------------------------------------------
Pendência   : SOL 131352 KINTANA 747109
Responsável : BRUNO AZEVEDO
Data        : 30/06/2010
Descrição   : Modificação na consulta de contratos para apresentar os contratos 
              existentes ao invés do participante ter que informar todas as 
              informações.
--------------------------------------------------------------------------------
}
unit uCtrlWebEmprestimo;

interface

uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCtrlWebRegra,
     uTypesEmptmoAA, uCmTypes, uCtrlRegra, JCLSysUtils, uCtrlFuncoesAA, ADODB,
     uTiposRegraMT, uCtrlReports, DB, uMidasUtil, JCLStrings, uSistema,  
     wwstorep, uCmFileUtils;

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA

Type

  TCtrlWebEmprestimo = class(TCmControlObject)
  private

    FWebRegra: TCtrlWebRegra;
    FReports: TCtrlReports;
    procedure SetWebRegra(const Value: TCtrlWebRegra);
    procedure SetReports(const Value: TCtrlReports);

  protected

    procedure AfterInitialize; Override;

  public

    //AutoEmprestimo
    sNomeArqLog : string;
    bGeraLogProcesso : Boolean;
    bGeraLogQuery    : Boolean;


    constructor Create; override;
    destructor Destroy; override;

    property WebRegra   : TCtrlWebRegra read FWebRegra write SetWebRegra;
    property Reports : TCtrlReports read FReports write SetReports;


    //Indica se há uma transação em andamento
    function InTransaction : boolean;

    //Recupera próximo contrato
    function SeqContrato : extended;

    //Tipos de empréstimos
    function TipoEmptmo: OLEVariant;

    //Verifica se o tipo de um contrato pode quitar outro
    function  PermiteQuitacao( const IDTipoContr : Integer; const IDTipoQuit  : Integer ) : boolean;

    //Tipos de contratos
    function TipoContrEmptmo: OLEVariant;

    //Consulta Parcela de FGQC
    function ConsultaFGQC( iIdContratoEmptmo : extended ): OleVariant;

    //Pega o próximo seqüence
    function LeUltRegistro( sTabela : string ) : extended;

    //Recupera os dados de responsáveis
    function Responsavel( iIdTitular, iIdBenef : integer ) : OLEVariant;

    //Verifica suspensão
    function VerificaSuspensao( iIdRegraValidSusp       : Int64;
                                iIdPessoa               : Int64;
                                iIdBenef                : Int64;
                                iIdPatro                : Int64;
                                sFlgInterno             : String;
                                nTseMeses               : Integer;
                                dTseInicioSusp          : TDateTime;
                                dTseFinalSusp           : TDateTime;
                                iFlgFerias              : Integer;
                                iIdEmpresaProp          : integer;
                                iIdTipoContrEmptmo      : Integer;
                                iTipoSuspAnterior       : Integer;
                                dDtCredito              : TDateTime;
                                dDataSuspAnterior       : TDateTime;
                                var iIDTIPOSUSPEMPTMO   : integer;
                                var dDataFinalSuspensao : TDateTime ) : Boolean;

    //Recupera dados do contrato
    function ConsultaContrato( iIdPessoa : integer;
                               iIdContratoEmptmo : extended;
                               sFlgSituacao : string;
                               iIdTipoEmptmo,
                               iIdTipoContrEmptmo : extended ): OleVariant;

    //BRUNO AZEVEDO SOL 131352 KINTANA 747109
    function ConsultaContratoPessoa( iIdPessoa, iIdTitular : integer ): OleVariant;
    function ConsultaTipoContratoPessoa( iIdPessoa : integer ): OleVariant;

    //BRUNO AZEVEDO SOL 140310 KINTANA 877933
    function UltimaAtualizacaoDiaria( iIdContratoEmptmo : Extended ): OleVariant;
    function ChecaAtualizacaoDiaria( iIdContratoEmptmo : Extended; Data: String ): OleVariant;

    //BRUNO AZEVEDO SOL 140310 KINTANA 877933
    function Saldo(fSaldo: Extended): OleVariant;

    //Totaliza Saldo Devedor de empréstimos
    function SaldoEmprestimos( iIdPessoa : integer ) : OleVariant;


    //Recupera os dados do contrato de inscrição em empréstimo
    function RelatorioInscricao( iIdDataView, iOrigemCMDV : integer; iIdInscricaoEmptmo: extended ) : OleVariant;

    //Recupera os dados do contrato de concessão de empréstimo
    function RelatorioConcessao( iIdDataView, iOrigemCMDV : integer; iIdContratoEmptmo: extended ) : OleVariant;

    //Dados para extrato de empréstimo
    function ExtratoEmprestimos( iIdPessoa, iIdTitular : integer;
                                 iIdContratoEmptmo : extended;
                                 sFlgSituacao : string;
                                 iIdTipoEmptmo,
                                 iIdTipoContrEmptmo : extended;
                                 iIdEmpresaProp     : integer;
                                 bAgrupa,
                                 bNaoExibirAtuDiaria : boolean ) : OleVariant;


    //Lookup de tipos de contrato
    function ListaTpContrato( iIdPlanoPrev, iIdEmpresaProp : integer ) : OleVariant;

    //Primeira renovação de 2006
    function PrimeiraRenovacao2006( iIdPessoa, iIdBenef, iIdTipoContrEmptmo : integer ) : boolean;

    //Totaliza provisão de perda
    function TotalizaProvPerda(  IDContratoEmptmo, iIDITEMPROVPERDA : Extended ): Currency;

    //Dados do tipo de contrato
    function DadosTpContrato( iIdTipoContrEmptmo : integer ) : OleVariant;


    //Verifica quantidade de inscrições ativas
    function InscricoesAtivas ( iIdPessoa, iIdTipoContrEmptmo : integer ) : integer;
    

    //Indica o limite e o total de inscrições
    function LimiteInscricoes( iIdPessoa, iIdTipoEmptmo, iIdEmpresaProp : integer ) : OleVariant;

    //Acerta o plano de origem de um contrato
    function  AcertaPlanoOrigem( IDContratoEmptmo : Extended;
                                 IDPessoa         : Extended;
                                 IDPlanoPrev      : Integer;
                                 bFlgExcepcional  : Boolean;
                                 bUpdate          : Boolean ): Integer;

     //Retorna o BenefBFCiario
     function BenefBFCiario( iIdPessoa, iIdPlanoPrev : extended ) : OLEVariant;

    //Indica o limite e o total de contratos
    function LimiteContratos( iIdPessoa, iIdTipoEmptmo, iIdEmpresaProp, iIdMutuario : integer ) : OleVariant;


    //Recupera os parâmetros do empréstimo
    function ParametrosEmprestimo( iIdEmpresaProp : integer ) : OleVariant;

    //Verifica se é obrigatório o preenchimento de avalista
    function VerificaObrigatoriedadeAvalista( iIDBENEF, iIDREGRAAVAL, iIdEmpresaProp : integer ) : boolean;

    //Dados do Alista
    function DadosAvalista( iIdAvalista : integer ) : OLEVariant;

    //Dados do solicitante de empréstimos
    function DadosSolic( const iIdPessoa: integer; const bFlgExcepcional : boolean; const sMatricula: string = '' ): OleVariant;

    //Auto-Emprestimo - 01/09/2007
    //Dados bancários do solicitante de empréstimos
    function DadosBancariosSolic( const iIdPessoa: integer ): OleVariant;

    //Verifica se já existe o codigo do auto empréstimo
    function VerificaAutoEmprestimo( fCodAutoEmp : extended; var fIdContratoEmptmo: Extended ) : boolean;

    // Valida id do fornecedor de crédito
    function VerificaFornecedorCredito( const iIdFornCred: Extended ) : boolean;

    //Busca Contratos Quitáveis para verificar prazo minimo de renovação
    function BuscaCarenciaPorContratosQuitaveis( const iIdTipoContratoEmptmo: integer ): OleVariant;

    //Busca o Plano contábil
    function BuscaPlanoPrevOrigemFUNCEF( const iIdMutuario: Extended ): OleVariant;


    //Auto-Emprestimo - Fim

    //Verifica se já há um contrato ativo
    function VerificaContratoAtivo( IDTitular   : Int64;
                                    IDMutuario  : Int64;
                                    IDTipoContr : Integer;
                                    IDContrato  : Extended ): Boolean;



    //Recupera Datas de Empréstimo
    function RecuperaDatasEmprestimo( iIdPessJur, iIdPlanoPrev : integer; sSitFundacao : string ) : OleVariant;


    //Retorna a quantidade de feriados que cai em uma data
    function Feriados( dData: TDateTime; iCidade, iPais: integer; sEstado, sTipos : string ) : OleVariant;


    //Dados de empréstimos anteriores
    function ContratosAnteriores( iIdPessoa, iIdBenef, iIdTipoEmptmo, iIdTipoContrEmptmo : integer; dData, dDataAtualiza : TDateTime; sJoinPlano, sQuitavel : string ) : OleVariant;
    function ContratosAnteriores2( iIdPessoa, iIdBenef : integer ) : OleVariant;


    //Recupera itens de empréstimos em aberto (copiado da uCalcEmptmo)
    function ItensEmAberto_uCalc( iIdContratoEmptmo: extended; iFiltroData, iFiltroMes : integer;
                                  dDataVencto : TDateTime; iAnoCobranca, iMesCobranca : integer ): OleVariant;

    //Recupera itens de empréstimos em aberto (copiado da fCadInsricao)
    function ItensEmAberto_fCad( iIdContratoEmptmo : extended;
                                 sAnoMesCobranca   : string    ): OleVariant;

    //Calcula itens de quitação
    function CalculaItensQuitacao( const rContrato    : TDadosContrato;
                                   iIdEmpresaProp     ,
                                   iIdTipoEmptmo      ,
                                   iIdTipoContrEmptmo : integer;
                                   iOrigem,
                                   iIDITEMPROVPERDA   : integer;
                                   dDataQuit          ,
                                   dDataMorte         ,
                                   dDataAssinatura    : TDateTime;
                                   bFlgExcepcional,
                                   bFinanciamento     : boolean;
                                   iFlgAbonoDiverg    : integer;
                                   iTipoCliente       : integer;
                                   var vLista         : TListaItem ) : boolean;


    //Verifica se o participante atende Limites de Concessão, limites de
    //quantidade e prazos do Empréstimo
    function BuscaLimites( const iIdPessoa, iIdBenef,
                                 iIdTipoEmptmo, iIdTipoContrEmptmo  : Integer;
                           const fVlrContrato, fVlrParcCalc         : Currency;
                           const iPrazo                             : Integer;
                           const iOrigem                            : Integer;
                           const iIdSitPart, iIdRegra               : Int64;
                           const dDataFinalBeneficio                : TDateTime;
                           const fMargem, fReserva, fSaldoEPAnt     : Currency;
                           const fVlrParcelas, fVlrPendencias       : Currency;
                           const dDataSolic                         : TDateTime;
                           const fVlrLiquidoEP                      : Currency;
                           const iIdEmpresaProp                     : integer;
                           const fVlrSalBase                        : Currency ): Boolean;

    //Dados do contrato
    function LookTipoContrato( iIdEmpresaProp,
                               iIdTipoEmptmo,
                               iIdTipoContrEmptmo : integer ) : OLEVariant;

    //Recupera itens de empréstimos
    function BuscaItens( iIdTipoContrEmptmo, iItcEvento : integer ) : OleVariant;


    //Itens de empréstimos
    function ItensEmprestimo( iIdContratoEmptmo : extended; iHmeTipoMov, iHmeParcela, iFlgEnvio,
                              iFlgBaixado, iFlgDivergPend, iHmeAnoCompetencia,
                              iHmeMesCompetencia : integer; dHmeDataPrevista,
                              dHmeDataEfetiva, dHmeDataVencto, dHmeDataAtualiza : TDateTime;
                              iCentralizado, iAgrupado, iEventoExclusao, iIdItemEmptmo,
                              iAbonoDiverg : integer ) : OleVariant;

    //Parcelas a vencer
    function ParcelasAVencer( iIdContratoEmptmo : extended; dHmeDataPrevista : TDateTime ) : OleVariant;

    //Verifica um documento
    function VerificaDocumento( iCodDocumento : integer ) : Integer;

    //Verifica se o contrato possui atualização diária
    function PossuiAtualizacaoDiaria( iIdContratoEmptmo : extended; dData : TDateTime ) :  Boolean;

    //Verifica se possui assinatura
    function PossuiAssinatura( iIdPessoa, iIdBenef, iIdTipoContrEmptmo : integer; var sMensagem : string ) : boolean;

    //Lookup de assinatura
    function LookAssinatura( iIdPessoa, iIdBenef, iIdTipoContrEmptmo : integer ) : OLEVariant;

    //Lookup possui assinatura
    function LookPossuiAssinatura( iIdPessoa, iIdBenef, iIdTipoContrEmptmo : integer ) : OLEVariant;

    //Máximo de contratos padrão obrigatórios
    function LookMaxContratoPadraoObrig( iIdTipoContrEmptmo : integer ) : OLEVariant;

    //Contrato padrão ativo
    function ContratoPadraoAtivo( iIdTipoContrEmptmo : integer ) : OLEVariant;

    //Remarca envio
    function RemarcaEnvio ( iIdContratoEmptmo : extended;
                            sHmeFormaCobranca : string;
                            iHmeAnoCobranca,   iHmeMesCobranca,
                            iHmeParcela : integer ) : boolean;

    // função que varre a lista de itens de um contrato e se for o caso,
    //   chama a função que grava o Histórico do Movimento na tabela HISTMOVEMPTMO.
    //   A saída será True se a operação foi bem sucedida e False caso negativo
    function GravaMovEmptmo( rContrato               : TDadosContrato;
                             vLista                  : TListaItem;
                             iEvento                 : Integer;
                             iParcela                : Integer;
                             iAnoCompetencia         : Integer;
                             iMesCompetencia         : Integer;
                             iAnoCobranca            : Integer;
                             iMesCobranca            : Integer;
                             iParcelasRemanescentes  : Integer;
                             dDataPrevista           : TDateTime;
                             dDataUltAtualiza        : TDateTime;
                             sFormaEnvio             : String;
                             sTipoFolha              : String;
                             bFLGEXCEPCIONAL         : Boolean;
                             iFLGUSAFIARIO           : integer;
                             iIdUsuario              : integer;
                             iIdModulo               : integer;
                             sVersao                 : string;
                             var iIdHistMovEmptmo    : Extended ) : Boolean;


    // função que grava as informações pertinentes a um contrato no histórico de movimento
    //   de Empréstimo (tabela HISTMOVEMPTMO), tendo como saída True se a operação foi
    //   bem sucedida e False caso negativo
    function InsertMovEmptmo( ItemContrato         : TItemRecDep;
                              rContrato            : TDadosContrato;
                              sVersao              : string;
                              var iIdHistMovEmptmo : Extended ) : Boolean;
                              

    // AutoEmprestimo - 30/09/2007
    // Insere assinatura de contrato padrão
    function InsertAssinaturaContr( iIdTitular : Integer;
                                    iIdBenef   : Integer;
                                    iIdContratoPadrao: Integer;
                                    sObservacao: string;
                                    //Pendência 27300 - 28/01/2008
                                    sNumComprova: string;
                                    //Fim Pendência 27300
                                    dDataAssinatura: TDateTime ) : Boolean;


    //Pendência 27300 - 28/01/2008
    //Exclui assinatura pelo num.comprova - auto-empréstimo
    function DeleteAssinaturaContr(sNumComprova: string): Boolean;
    //Fim Pendência 27300


    //Busca Saldos Anterior e Posterior
    function BuscaSaldosAntPos( iIdContratoEmptmo: extended;
                                dData: TDateTime;
                                iFlgSaldoDevAnt : integer;
                                iFlgCalcDia : integer;
                                bVerificaParcela  : Boolean = False ) : TSaldosAntPos;


    function SaldoParcelaAnt( iIDCONTRATOEMPTMO : extended; dHMEDATAATUALIZA : TDateTime; iALTERAPARCELA : integer ) : OLEVariant;


    //Busca saldo anterior da atualização diária
    function SaldoAntAtuDia( iIDCONTRATOEMPTMO : extended; dHMEDATAATUALIZA : TDateTime ) : OLEVariant;


    //Recupera saldo anterior
    function SaldoAnt ( iIdContratoEmptmo : extended; dHmeDataAtualiza : TDateTime ) : OleVariant;


    //Soma Anos
    function SomaAnos( dDataIni: TDateTime; iAnos: integer): TDateTime;


    //Função que retorna o Dia de uma determinada data
    function ExtraiDia(dData: tDateTime): word;


    //Função que retorna o Mês de uma determinada data
    function ExtraiMes(dData: tDateTime): word;


    //Função que retorna o Ano de uma determinada data
    function ExtraiAno(dData: tDateTime): word;


    //Converte '.' para ','
    function ConverteVirg(sConverter: String): String;


    //Recupera a quantidade mínima e máxima de parcelas
    function NumParcelas( iIdTipoContrEmptmo, iIdTipoEmptmo : integer ) : OleVariant;


    //Recupera dados do participante para cálculo do salário base
    function DadosSalPart( iIdPessoa : integer ) : OleVariant;


    //Recupera regra correspondente ao item de menor sequência de cálculo
    function RegraItemMenorSeq( iIdTipoContrEmptmo : integer ) : integer;

    //Recupera saldo de quitação
    function SaldoQuitacao( iIdContratoEmptmo, iIdItemEmptmo : integer ) : OLEVariant;

    //Recuperação de dados de seguros
    function PegaSeguroAnt(  iIdContratoEmptmo : Extended; iIDITEMSEGCONC : integer ) : Currency;
    function PegaSeguroComplAnt( iIdContratoEmptmo : Extended; iIDITEMSEGCOMPL : integer ) : Currency;

    //Converte uma ListaItem em um DataPacket e vice-versa
    function  ListaItemToDataPacket( vLista : TListaItem ) : OLEVariant;
    procedure DataPacketToListaItem( oData          : OLEVariant;
                                     iNumParcelas   : integer;
                                     sFormaCobranca : string;
                                     var vLista     : TListaItem);


    //Gera simulação de parcelas do empréstimo
    function SimulaEmprestimo( sParcelas : string;
                               iIdTipoContrEmptmo,
                               iIdEmpresaProp,
                               iIdPais,
                               iIdCidades,
                               iTipoContrQuitAnt : integer;
                               sCodEstado : String;
                               fSalPart,
                               fSalMantido,
                               fSalAuxDoenca,
                               fSalBenef,
                               //Pendência 24902 - 20/12/2007
                               //fSalarioBase,
                               //fVlrMaxPermit : Currency;
                               fSalarioBase : Currency;
                               var fVlrMaxPermit : Currency;
                               sMoeSigla : string;
                               fVlrParcela,
                               fVlrMargem,
                               fValReserva,
                               fTxJuros,
                               fSaldoaQuitar,
                               fVlrSolicitado,
                               fVlrContratosAnt,
                               fSaldoQuitacao : Currency;
                               sAnoMesCompetencia : string;
                               DataCredito,
                               DataAssinatura,
                               DataInscricao,
                               dDataPrimParc : TDateTime;
                               iIdSitPart,
                               iIdPatro,
                               iIdPlanoPrev,
                               iIdTitular,
                               iIdBenef : integer;
                               bFlgExcepcional : boolean;
                               iIdContratoEmptmoAnt : extended;
                               iPrazoAnt            : integer;
                               fValorSolicAnt       : Currency;
                               dDataCreditoAnt      : TDateTime;
                               iUltParcelaGerada,
                               iPrazoAnterior,
                               iNumParcPagas : integer;
                               fVlrDevSeg,
                               fVlrSeguroAnt,
                               fVlrSeguroComplAnt : Currency;
                               fVlrDividas : Currency;
                               var vLista : TListaItem
                               //Pendência 22248 - 01/08/2006
                               ; iIDREGRAMARGEM, iTipoCliente : Integer;
                               fTotalParcelas, fTotalPendencias : Currency;
                               iMaxParcelas : Integer;
                               sFLGINTERNO : String
                               //Fim Pendência 22248
                               ) : OleVariant;


    function CalculaItens( const rContrato           : TDadosContrato;
                           const rConcessao          : TDadosConcessao;
                           const iEvento             : Integer;
                           const iOrigem             : Integer;
                           const iPais               : Integer;
                           const sEstado             : String;
                           const iCidade             : Integer;
                           const iParcela            : Integer;
                           const iIdSitPart          : Int64;
                           const sFormaCobranca      : String;
                           const fTxJuros, fSaldoDev, fVlrSolic, fSaldoEPAnt, fMargem,
                                 fReserva, fSalPart, fSalMantido, fSalAuxDoenca,
                                 fSalBenef, fSalarioBase, fVlrMaxPermit : Currency;
                           const iNumParcPagas       : Integer;
                           const iPrazoAnterior      : Integer;
                           const iUltParcelaGerada   : Integer;
                           const dDataRef            : TDateTime;
                           const dDataAtualiza       : TDateTime;
                           const sAnoMesCompetencia  : String;
                           const iIdEmpresaProp      : integer;
                           var   vLista              : TListaItem;
                           const fVlrDevolSeguro     : Currency = 0;
                           const fVlrSegAnt          : Currency = 0;
                           const fVlrSegComplAnt     : Currency = 0;
                           const bAlteraSaldoDev     : Boolean = True;
                           const fVlrContratosAnt    : Currency = 0;
                           const fVlrDividas         : Currency = 0;
                           const iTipoContrQuitAnt   : Integer = -1;
                           const bCriaObjetoRegra    : Boolean = False;
                           const dDataAtraso         : TDateTime = 0;
                           const fValorEmAberto      : Currency = 0;
                           const dDataAtrasoAnt      : TDateTime = 0;
                           const fValorEmAbertoAnt   : Currency = 0;
                           const fValorProvisao      : Currency = 0;
                           const bGravaQueryRegra    : Boolean = True;
                           const iFinanciamento      : Integer = 0
                          ) : Boolean;



    //Prepara dataset da regra que verifica se a parcela pode ser concedida ou não
    function DatasetVerificaPrazoConcessao( iNumParcela, iIdTitular, iIdBeneficiario : integer; bFlgExcepcional : boolean ): OleVariant;

    //Calcula salário base
    function BuscaSalarioBase( iIdPessoa, iIdBenef, iIdEmpresa, iIdRegra : integer;
     bFlgExcepcional : boolean; dDataSolic : TDateTime; iLote, iTipoCliente : integer ) : Currency;

    //Calcula margem consignável
    //Pendência 22248 - 03/08/2006 - Inclusão do parâmetro iPrazo
    function BuscaMargem( iIdTitular, iIdBenef, iIdEmpresa, iIdRegra : integer;
                          fSalarioBase, fParcelas, fPendencias : currency; bFlgExcepcional : boolean;
                          dDataSolic : TDateTime; iPrazo: Integer; bFinanciamento : boolean;
                          iLote : integer; sContrAQuitar : string; iTipoCliente : Integer ) : Currency;

    //Verifica se há concessão na mesma data
    function VerificaConcessaoIgualPosterior( iIdTitular      : integer;
                                              iIdMutuario     : integer;
                                              dDataCredito    : TDateTime;
                                              bPosterior      : boolean ): Boolean;

    //Tipo de Suspensão
    function LookTipoSusp( iIdTipoContrEmptmo : integer; bFlgFerias : boolean ) : OLEVariant;

    //Recupera os dados de um determinado item em um tipo de contrato
    function ItemXTipoContrato( iIdTipoContrEmptmo, iIdItemEmptmo : integer ) : OleVariant;

    //Totaliza contratos em aberto
    function TotalizaAbertos( iIdContratoEmptmo : extended ) : OleVariant;

    //Todos os dados do contrato
    function TodosDadosContratos( iIdContratoEmptmo : extended ) : OLEVariant;

    //Retorna a hora atual do servidor (para ser utilizada pela interface)
    function HoraServidor : TDateTime;

    //Valida suspensão
    function ValidaSuspensao( iIdRegraValidSusp   : Int64;
                              iIdContratoEmptmo   : Extended;
                              iIdPessoa           : Int64;
                              iIdBenef            : Int64;
                              iIdPatro            : Int64;
                              sFlgInterno         : String;
                              iIdTipoSuspEmptmo   : Int64;
                              nTseMeses           : Integer;
                              dTseInicioSusp      : TDateTime;
                              dTseFinalSusp       : TDateTime;
                              iFlgFerias          : Integer;
                              iNumParcAberto      : Integer;
                              iNumParcPagas       : Integer;
                              dDataInicioAnt      : TDateTime;
                              dDataAtualiza       : TDateTime;
                              iIdSuspensaoAtual   : Int64;
                              iIdEmpresaProp      : integer;
                              iExcepcional        : Integer = 0;
                              iIDPessjurCedido    : Integer = 0;
                              iLote               : Integer = 0 ) : TDateTime;

    function Avalistas : OLEVariant;

    //Executa regra que retorna a data de crédito do empréstimo
    function RegraDataCredito( sRuleName,
                               sTipoData,
                               sFlgInterno,
                               sTipoCobranca,
                               sHoraEncerra : String;
                               bChkExcepcional : boolean;
                               iIdPatro,
                               iIdPlanoPrev,
                               iPais,
                               iCidade : integer;
                               sUF : String;
                               dDtInscricao : TDateTime;
                               iIdEmpresaProp : integer ) : TDateTime;

    //Executa regra que retorna a data da 1a. parcela do empréstimo
    function RegraData1aParc( sRuleName : string;
                              iIdTipoContrEmprmo : integer;
                              dDataCredito : TDateTime;
                              iIdEmpresaProp : integer ) : TDateTime;

    //Verifica, através de regra, se o participante é elegível para empréstimo
    function VerificaElegibilidade( sRuleName : String;
                                    iIdTitular,
                                    iIdBeneficiario,
                                    //Pendência 23312 - 20/09/2006
                                    iIdPlanoPrev,
                                    //Fim Pendência 23312
                                    iMesesRenovacao,
                                    iParcPagas,
                                    iIdEmpresaProp : integer;
                                    bFlgExcepcional : boolean;
                                    sNomeEmpresa : string;
                                    var dDataFinal: TDateTime ) : boolean;

    //Pendência 26775 - 26/12/2007
    function IdentificaPlanoCobranca( iIdRegra : Int64;
                                      iIdPessoa,
                                      iIDPlanoPrev,
                                      iIdEmpresaProp : integer
                                    ) : Int64;
    //Fim Pendência 26775

    function CalculaEPAnterior(  ContratosAnt : OLEVariant;
                                 iIdEmpresaProp : integer;
                                 iIdTipoEmptmo,
                                 iIdTipoContrEmptmo,
                                 iIDITEMDEVSEGQUIT,
                                 iIDITEMPROVPERDA : integer;
                                 dDtCredito : TDateTime;
                                 bFlgExcepcional : boolean;
                                 iTEPMAXCONTRATO : integer;
                                 //Pendência 26916 - 21/12/2007
                                 iTCEMAXCONTRATO : integer;
                                 //Fim Pendência 26916
                                 iFlgAbonoDiverg : integer;
                                 iTipoCliente    : integer;
                                 var bContratoValido : boolean;
                                 var iQtdEPQuitado : integer;
                                 var cSaldoAQuitar : Currency;
                                 var cTotalParcelas : Currency;
                                 var cTotalPendencias : Currency;
                                 var cQuitacao : Currency ) : OLEVariant;

    procedure VerificaQuitacao( cdsContratosAnteriores : TCMClientDataset;
                                iTEPMAXCONTRATO : integer;
                                bFlgExcepcional : boolean;
                                var bContratoValido : boolean;
                                var iQtdEPQuitado : integer;
                                var fSaldoaQuitar : Currency );

    function Beneficiarios( iIdInscricaoEmptmo : extended ) : OLEVariant;

    function CalculaQuitacaoContratoAnterior( cdsContratosAnteriores : TCMClientdataset;
                                              iIdEmpresaProp : integer;
                                              iIdTipoEmptmo,
                                              iIdTipoContrEmptmo,
                                              iIDITEMDEVSEGQUIT,
                                              iIDITEMPROVPERDA : integer;
                                              dDtCredito : TDateTime;
                                              bFlgExcepcional : boolean;
                                              iFlgAbonoDiverg : integer;
                                              iTipoCliente    : integer;
                                              SavePlace         : TBookmark;
                                              var fVlrTotalAberto : Currency ) : OLEVariant;

    //Incrição em Empréstimos
    function InscreveEmptmo(  iIdTipoContrEmptmo,
                              iIdTipoEmptmo,
                              iIdPatro,
                              iIdPlanoPrev,
                              iIdTitular,
                              iIdBenef,
                              iParcelas,
                              iIdEmpresaProp : integer;
                              sFLGFORMAPAG,
                              sFLGFORMAREC,
                              sCODFORMAPAGTO,
                              sPORTFORMAPAGTO,
                              sPORTFORMARECTO,
                              sContaBancariaPag,
                              sContaBancariaRec,
                              sMoeCodigo : string;
                              dDtCredito :TDateTime;
                              fVlrSolicitado,
                              fVLRSALBASE,
                              fMargem,
                              fVlrMaxPermit,
                              fTxJuros : Currency;
                              iIdAvalista : integer;
                              sBeneficiarios : string;
                              bTransacao : boolean;
                              oItens : OLEVariant ) : extended;


    //Contratação de Empréstimo
    function ContrataEmptmo( NovoContrato           : TDadosContrato;
                             vLista                 : TListaItem;
                             oContratosAnteriores   : OLEVariant;
                             iFLGCALCDIA            : integer;
                             iFLGSALDODEVANT        : integer;
                             iTEPMAXCONTRATO        : integer;
                             dDataCred              : TDateTime;
                             fVlrLiquidoEP          : Currency;
                             fSaldoAQuitar          : Currency;
                             iIdEmpresaProp         : integer;
                             iIdTipoEmptmo          : integer;
                             iIdTipoContrEmptmo     : integer;
                             iFLGUSAFIARIO          : integer;
                             iFLGESTORNOPOSQUIT     : integer;
                             iFLGQUITAPARCMORTE     : integer;
                             iFLGDATAATUSLD         : integer;
                             iIDITEMPROVPERDA       : integer;
                             iIdUsuario             : integer;
                             iIdModulo              : integer;
                             sVersao                : string;
                             sFLGFORMAPAG           : string;
                             sFLGFORMAREC           : string;
                             sCODFORMAPAGTO         : string;
                             sPORTFORMAPAGTO        : string;
                             sPORTFORMARECTO        : string;
                             sContaBancariaPag      : string;
                             sContaBancariaRec      : string;
                             iIdAvalista            : integer;
                             sBeneficiarios         : string;
                             bFlgExcepcional        : boolean;
                             iFlgAbonoDiverg        : integer;
                             iTipoCliente           : integer;
                             iQtdeItensEmptmo       : integer;
                             iQtdeParcelasEmAberto  : integer;
                             iIdUltHistMovEmptmo    : extended;
                             oItens                 : OLEVariant;
                             var iIdInscricaoEmptmo : extended ) : extended;


    //Salva o empréstimo
    function GravaContrato( NovoContrato : TDadosContrato ) : extended;


    //Atualiza a situação do contrato anterior
    function AtualizaFlgSituacao( ID        : Extended;
                                  sTabela   : String;
                                  cSituacao : Char
                                 ): Boolean;


    //Contratação de Empréstimo
    function AtualizaContratosAnteriores( oContratosAnteriores : OLEVariant;
                                          iIdContratoEmptmo    : extended;
                                          iFLGCALCDIA          : integer;
                                          iFLGSALDODEVANT      : integer;
                                          iTEPMAXCONTRATO      : integer;
                                          dDataCred            : TDateTime;
                                          fSaldoAQuitar        : Currency;
                                          iIdEmpresaProp       : integer;
                                          iIdTipoEmptmo        : integer;
                                          iIdTipoContrEmptmo   : integer;
                                          iFLGUSAFIARIO        : integer;
                                          iFLGESTORNOPOSQUIT   : integer;
                                          iFLGQUITAPARCMORTE   : integer;
                                          iIDITEMPROVPERDA     : integer;
                                          iIdUsuario           : integer;
                                          iIdModulo            : integer;
                                          sVersao              : string;
                                          bFlgExcepcional      : boolean;
                                          iFlgAbonoDiverg      : integer;
                                          iTipoCliente         : integer ) : boolean;

    //Acerta situação contratual
    procedure AcertaSituacaoContratual( IDContratoEmptmo: Extended; iFLGCALCDIA : integer );

    //Situação do contrato
    function SituacaoContrato( IDContratoEmptmo: Extended ) : string;

    //Existe quitação
    function ExisteQuitacao( IDContrato: Extended ): Boolean;

    //Existe saldo devedor
    function ExisteSaldoDevedor( IDContrato: Extended; iFLGCALCDIA : integer ): Boolean;

    //Última data de atualização
    function UltimaDataAtualizacao( IDContrato: Extended ): TDateTime;

    //Ajuste de saldo (atualização diária)
    procedure ExecutaAjusteSaldo( IDContrato      : Extended;
                                  dDataAtualiza   : TDateTime;
                                  fSaldoDev       : Currency;
                                  iFLGSALDODEVANT   : Integer;
                                  iFLGCALCDIA       : Integer );

    function SaldoDevAnt( IDContrato        : Extended;
                          dData             : TDateTime;
                          iAnoCompetencia   : Integer;
                          iMesCompetencia   : Integer;
                          iFLGSALDODEVANT   : Integer;
                          iFLGCALCDIA       : Integer;
                          bVerificaParcela  : Boolean = False
                        ): TSaldoDevAnt;


    //Verifica se existem itens de empréstimo em aberto (copiada da uCalcEmptmo)
    function ExistemItensEmAberto_uCalc( iIdContratoEmptmo: extended;
                                         bData : boolean;
                                         dData : TDateTime;
                                         bMes  : Boolean;
                                         iAno  : Integer;
                                         iMes  : Integer ): boolean;

    //Verifica se existem itens de empréstimo em aberto (copiada da fCadInscricao )
    function ExistemItensEmAberto_fCad( dDataInscricao : TDateTime;
                                        vContratosAnteriores : OLEVariant;
                                        var fVlrEmAberto: Currency ): boolean;

    //Procedure que abre a query de outras dívidas
    function OutrasDividas( iIdBenef : integer; dDataCred : TDateTime ) : OLEVariant;

    //Retorna o nome da empresa passada como parâmetro
    function NomeEmpresa( iIdEmpresaProp : integer ) : string;


    // marca com flgQuitado = 1 os itens em aberto quitados
    function MarcaItensQuitados( IDContratoEmptmo   : Extended;
                                 dDataQuit          : TDateTime;
                                 iOrigem            : Integer;
                                 iFLGQUITAPARCMORTE : integer;
                                 iIdEmpresaProp     : integer ): Integer;


    //Valida a inscrição
    function ValidaInscricao(const iTitular      : Integer;
                             const iTipoEmptmo   : Integer;
                             const iInscricao    : Integer;
                             const iIdEmpresaProp: Integer ): Boolean;

    // função que verifica para um determinado tipo de empréstimo, se o participante
    //   excedeu o limite de contratos.  Só serão levados em consideração os contratos
    //   'Ativos' com o FLGSITUACAO = 'A'
    function ValidaContrato( const IDTitular       : Integer;
                             const IDMutuario      : Integer;
                             const IDTipoEmptmo    : Integer;
                             const IDTipoContr     : Integer;
                             const iQuantQuitado   : Integer;
                             const iIdEmpresaProp  : Integer;
                             const bFlgExcepcional : boolean;
                             var   sMensagens      : string ) : Boolean;

    //Pendência 27857 - 07/05/2008
    // função que verifica para um determinado tipo de empréstimo, se o participante
    // possui contrato em quitação (FLGSITUACAO = 'K')
    function ValidaContratoEmQuitacao(const IDTitular       : Integer;
                                      const IDMutuario      : Integer;
                                      const IDTipoEmptmo    : Integer;
                                      const IDTipoContr     : Integer;
                                      const iQuantQuitado   : Integer;
                                      const iIdEmpresaProp  : Integer;
                                      const bFlgExcepcional : boolean;
                                      var   sMensagens      : string ) : Boolean;
    //Fim Pendência 27857

    // Verifica contratos anteriores não efetivados
    function VerificaConcessaoNaoEfetivada( iIdTitular,
                                            iIdMutuario,
                                            iIdTipoContr : integer;
                                            bFlgExcepcional : boolean;
                                            iTipoVerifica : Integer ) : boolean;


    //Verifica se o usuário possui suspensão de concessão
    function PossuiSuspensaoConcessao( iIdPessoa : integer; dData : TDateTime ) : Boolean;

    //Retorna o último IDHISTMOVEMPTMO gerado
    function UltIDHISTMOVEMPTMO : extended;

    //Retorna a quantidade de itens de empréstimos para um idpessoa
    function QtdeItensEmptmo( iIdTitular, iIdBenef : integer; iIDCONTRATOEMPTMO : extended = 0; iIdUltHistMovEmptmo : extended = 0 ) : integer;

    //Retorna a quantidade de parcelas em aberto para um idpessoa
    function QtdeParcelasEmAberto( iIdTitular, iIdBenef : integer; dData : TDateTime; iIDCONTRATOEMPTMO : extended = 0 ) : integer;

//Pendência 23733 - 19/12/2006
function ValidaTipoContratoEmprestimo(ContratosAnt : OLEVariant;
                                      iIdEmpresaProp,
                                      iIDTITULAR,
                                      iIDBENEF,
                                      iIDTIPOCONTREMPTMO,
                                      iIDREGRATIPOCONTR : Integer
                                      ) : Boolean;
//Fim Pendência 23733

//Recupera valor máximo do empréstimo
function BuscaVlrSolicMax( iIdEmpresaProp,
                           iIdTipoContrEmptmo,
                           iIdPatro,
                           iIdPlanoPrev,
                           iIdPessoa,
                           iIdBenef,
                           iIdSitPart,
                           iNumParcelas : integer;
                           sFlgInterno : string;
                           fMargem,
                           fReserva,
                           fTxJuros,
                           fSaldoEPAnt,
                           fVlrContrato,
                           fVlrContratosAnt,
                           fSalParticipacao,
                           fSalMantido,
                           fSalAuxDoenca,
                           fSalBenef,
                           fSalarioBase : Currency;
                               //Pendência 26950 e 26951 - 30/11/2007
                               iLote : integer;
                               dDataAssinatura,
                               dDataCredito,
                               dDataPrimParc : TDateTime;
                               iTipoCLiente : Integer;
                               sContrAQuitar : string;
                               dContratosAnteriores: OleVariant ) : Currency;
                               //Fim Pendência 26950 e 26951

    //Pendência 27385 - 08/02/2008
    //Verifica existência do contrato na base
    function BuscaContratoEmptmo(const iIdContratoEmptmo: Double): OleVariant;

    //Verifica existência de itens do contrato na base
    function BuscaHistMovEmptmo(const iIdContratoEmptmo: Double): OleVariant;

    //Verifica existência do item centralizador
    function BuscaQuantHistMovEmptmo(const iIdContratoEmptmo, iIdTipoContrEmptmo: Double): OleVariant;
    //Fim Pendência 27385

    //Pendência 26118
    //Verifica existência de contratação já realizada na mesma data
    function BuscaContratacaoRealizada(sIDPessoa, sIDContratoEmptmo : string): boolean;
    //Fim Pendência 26118

  published

end;

implementation

{ TCtrlWebEmprestimo }

//Recupera dados do contrato
function TCtrlWebEmprestimo.ConsultaContrato( iIdPessoa : integer;
                                              iIdContratoEmptmo : extended;
                                              sFlgSituacao : string;
                                              iIdTipoEmptmo,
                                              iIdTipoContrEmptmo : extended ): OleVariant;
var
  sWhere : string;
begin

  if iIdContratoEmptmo > 0 then
    sWhere := ' cnt.IDCONTRATOEMPTMO = ' + FloatToStr( iIdContratoEmptmo ) + ' and ';

  if sFlgSituacao <> '' then
    sWhere := sWhere + ' cnt.FLGSITUACAO = ' + QuotedStr( sFlgSituacao ) + ' and ';

  if iIdTipoEmptmo > 0 then
    sWhere := ' tem.IDTIPOEMPTMO = ' + FloatToStr( iIdTipoEmptmo ) + ' and ';

  if iIdTipoContrEmptmo > 0 then
    sWhere := ' tip.IDTIPOCONTREMPTMO = ' + FloatToStr( iIdTipoContrEmptmo ) + ' and ';

  Result := GetDataPacket(
   ' select   cnt.IDCONTRATOEMPTMO,                                                       ' +
   '          cnt.IDINSCRICAOEMPTMO,                                                      ' +
   '          cnt.FLGSITUACAO,                                                            ' +
   '          cnt.IDPATRO,                                                                ' +
   '          cnt.IDPLANOPREV,                                                            ' +
   '          tip.TCEDESCRICAO,                                                           ' +
   '          tem.DESCTIPOEMPTMO,                                                         ' +
   '          cnt.NUMPARCELAS,                                                            ' +
   '          cnt.DATAASSINATURA,                                                         ' +
   '          ins.DATAINSC,                                                               ' +
   '          cnt.DATACREDITO,                                                            ' +
   '          cnt.DATAPRIMPARC,                                                           ' +
   '          cnt.DATACANC,                                                               ' +
   '          cnt.VLRCONTRATO,                                                            ' +
   '          cnt.TXJUROS,                                                                ' +
   '          cnt.VLRPARCELA,                                                             ' +
   '          cnt.IDPESSOA,                                                               ' +
   '          cnt.IDBENEF,                                                                ' +   
   '          tem.IDTIPOEMPTMO,                                                           ' +
   '          tip.IDTIPOCONTREMPTMO                                                       ' +
   ' from     INSCRICAOEMPTMO ins,                                                        ' +
   '          CONTRATOEMPTMO  cnt,                                                        ' +
   '          TIPOCONTREMPTMO tip,                                                        ' +
   '          TIPOEMPTMO      tem                                                         ' +
   ' where    ' + sWhere                                                                    +
   '          ( ( cnt.IDPESSOA           = ' + IntToStr( iIdPessoa ) + ' )                ' +
   '          or ( cnt.IDBENEF         = ' + IntToStr( iIdPessoa ) + ' ) )                ' +
   '   and    cnt.IDTIPOCONTREMPTMO  = tip.IDTIPOCONTREMPTMO                              ' +
   '   and    tip.IDTIPOEMPTMO       = tem.IDTIPOEMPTMO                                   ' +
   '   and    cnt.IDINSCRICAOEMPTMO  = ins.IDINSCRICAOEMPTMO (+)                          ' );
end; {ConsultaContrato}

//Consulta 'Valor da Parcela de FGQC'
function TCtrlWebEmprestimo.ConsultaFGQC( iIdContratoEmptmo : extended ): OleVariant;
begin

  Result := GetDataPacket(
    '   SELECT HME.HMEVLRPREVISTO ' +
    '  FROM HISTMOVEMPTMO HME ' +
    ' WHERE HME.IDCONTRATOEMPTMO = ' + FloatToStr( iIdContratoEmptmo ) +
    '   AND HME.HMEPARCELA = (SELECT MAX(H.HMEPARCELA) ' +
    '                           FROM HISTMOVEMPTMO H ' +
    '                          WHERE H.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ' +
    '                          AND   NVL(H.FLGESTORNADO,0) = 0 ' +
    '                          AND   H.HMETIPOMOV = 1 ' +
    '                          AND   H.HMEORIGEM <> 12) ' +
    '   AND HME.HMEDESTACADO = 1 ' +
    '   AND HME.HMEORIGEM <> 12 ' +
    '   AND HME.HMETIPOMOV = 1 ' +
    '   AND NVL(HME.FLGESTORNADO,0) = 0 ');

end; {ConsultaFGQC}

//Dados do solicitante de empréstimos
function TCtrlWebEmprestimo.DadosSolic( const iIdPessoa: integer; const bFlgExcepcional : boolean;
                                        const sMatricula: string = '' ): OleVariant;    // Auto-Emprestimo - Vinicius - 27/08/2007
var
  cdsLocal : TCmClientDataset;
  sSQL, sSQLAux,
  sSQLComum : string;
begin
  cdsLocal := TCmClientDataset.Create( nil );
  try

    if bFlgExcepcional then
    begin
      sSQLComum :=
       ' SELECT '                                                                                                           +
       '    DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME, '                                              +
       '    ELP.MATRICULA AS MATRICULA_TIT, '                                                                               +
       '    DECODE(DEP.IDTITULAR, NULL, '''', DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA, '                   +
       '    PPP.INSCRICAONUMERO, '                                                                                          +
       '    DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF, '                               +
       '    PEP.NOME AS NOME_TIT, '                                                                                         +
       '    PEP.NUMDOCUMENTO AS CPF_TIT, '                                                                                  +
       '    SIP.DESCRICAO AS SIT_PART, '                                                                                    +
       '    SPP.DESCRICAO AS SIT_PLANO, '                                                                                   +
       '    PPA.NOME AS NOME_PATRO, '                                                                                       +
       '    DECODE(PLP2.NOME, NULL, PLP.NOME, PLP2.NOME) AS NOME_PLANO, '                                                   +
       '    DEP.IDPESSOA, '                                                                                                 +
       '    DEP.IDTITULAR, '                                                                                                +
       '    ELP.IDPESSJUR, '                                                                                                +
       '    DECODE(BFC.IDPLANOPREV, NULL, PPP.IDPLANOPREV, BFC.IDPLANOPREV) AS IDPLANOPREV, '                               +
       '    SIP.IDSITPART, '                                                                                                +
       '    SIP.FLGINTERNO '                                                                                                +
       ' FROM '                                                                                                             +
       '    PESSOA       PDP, '                                                                                             +
       '    PESSOA       PEP, '                                                                                             +
       '    PESSOA       PPA, '                                                                                             +
       '    DEPENTIT     DEP, '                                                                                             +
       '    ELEGPATRO    ELP, '                                                                                             +
       '    PARTPREVPLAN PPP, '                                                                                             +
       '    PLANPREV     PLP, '                                                                                             +
       '    PLANPREV     PLP2, '                                                                                            +
       '    SITPART      SIP, '                                                                                             +
       '    SITPLANOPREV SPP, '                                                                                             +
       '    ( '                                                                                                             +
       '    SELECT DISTINCT '                                                                                               +
       '       IDPESSOA, IDPLANOPREV '                                                                                      +
       '    FROM '                                                                                                          +
       '       BENEFBFCIARIO '                                                                                              +
       '    WHERE '                                                                                                         +
       '           (DATAFINAL IS NULL OR DATAFINAL > (SELECT SYSDATE FROM DUAL)) '                                          +
       '       AND IDSITBENEFICIO IN (1, 2, 7) '                                                                            +
       '    ) BFC '                                                                                                         ;

      sSQLAux := sSQLComum           +
       ' WHERE '                                           +
       '        ELP.IDPESSOA       = PEP.IDPESSOA  '       +
       '    AND ELP.IDPESSJUR      = PPA.IDPESSOA  '       +
       '    AND ELP.IDPESSJUR      = PPP.IDPESSJUR  '      +
       '    AND ELP.IDPESSOA       = PPP.IDPESSOA  '       +
       '    AND ELP.IDPESSOA       = DEP.IDTITULAR(+)  '   +
       '    AND DEP.IDPESSOA       = PDP.IDPESSOA(+)  '    +
       '    AND DEP.IDPESSOA       = BFC.IDPESSOA(+) '     +
       '    AND BFC.IDPLANOPREV    = PLP2.IDPLANOPREV(+) ' +
       '    AND PPP.IDPLANOPREV    = BFC.IDPLANOPREV '     +
       '    AND PPP.IDPLANOPREV    = PLP.IDPLANOPREV '     +
       '    AND PPP.IDSITPART      = SIP.IDSITPART '       +
       '    AND PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV '  +
       '    AND PPP.FLGDESATIVADO  = 0 ' ;

       // Auto-Emprestimo - 27/08/2007
       if iIdPessoa <> -1 then
          sSQLAux := sSQLAux + '    AND DEP.IDPESSOA       = ' + IntToStr( iIdPessoa );

       if sMatricula <> '' then
          sSQLAux := sSQLAux + '    AND DEP.MATRICULA      = ' + QuotedStr( sMatricula );
       // Fim Auto-Empréstimo

       //Pendência 23553 - 17/10/2006
       sSQLAux := sSQLAux +
       '    ORDER BY DECODE( DEP.IDDEPENDENCIA, ''PRP'', ''   '', IDDEPENDENCIA )';
       //Fim Pendência 23553

      if bGeraLogQuery then CMDebugToFile( 'Início Query DadosSolic.. ', sNomeArqLog );
      if bGeraLogQuery then CMDebugToFile( sSQLAux, sNomeArqLog );
      cdsLocal.Data := GetDataPacket( sSQLAux );
      if bGeraLogQuery then CMDebugToFile( 'Término Query DadosSolic.. ', sNomeArqLog );

      if cdsLocal.IsEmpty then
      begin
        cdsLocal.Close;

        sSQLAux := sSQLComum           +
         ' WHERE '                                          +
         '        ELP.IDPESSOA       = PEP.IDPESSOA '       +
         '    AND ELP.IDPESSJUR      = PPA.IDPESSOA '       +
         '    AND ELP.IDPESSJUR      = PPP.IDPESSJUR(+) '   +
         '    AND ELP.IDPESSOA       = PPP.IDPESSOA(+) '    +
         '    AND ELP.IDPESSOA       = DEP.IDTITULAR(+) '   +
         '    AND DEP.IDPESSOA       = PDP.IDPESSOA(+) '    +
         //Ajuste de erro de time-out PAR - 18/04/2008
         '    AND DEP.IDPESSOA       = BFC.IDPESSOA(+) '     +
         '    AND BFC.IDPLANOPREV    = PLP2.IDPLANOPREV(+) ' +
         //fim Ajuste
         '    AND PPP.IDPLANOPREV    = PLP.IDPLANOPREV '    +
         '    AND PPP.IDSITPART      = SIP.IDSITPART '      +
         '    AND PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV ' +
         '    AND PPP.FLGDESATIVADO  = 0 ' ;

        // Auto-Emprestimo - 27/08/2007
        if iIdPessoa <> -1 then
           sSQLAux := sSQLAux + '    AND DEP.IDPESSOA       = ' + IntToStr( iIdPessoa );

        if sMatricula <> '' then
           sSQLAux := sSQLAux + '    AND DEP.MATRICULA      = ' + QuotedStr( sMatricula );
        // Fim Auto-Empréstimo

         //Pendência 23553 - 17/10/2006
        sSQLAux := sSQLAux +
         '    ORDER BY DECODE( DEP.IDDEPENDENCIA, ''PRP'', ''   '', IDDEPENDENCIA )';
         //Fim Pendência 23553

        if bGeraLogQuery then CMDebugToFile( 'Início Query DadosSolic.. ', sNomeArqLog );
        if bGeraLogQuery then CMDebugToFile( sSQLAux, sNomeArqLog );
        cdsLocal.Data := GetDataPacket( sSQLAux );
        if bGeraLogQuery then CMDebugToFile( 'Término Query DadosSolic.. ', sNomeArqLog );
      end;

    end
    else
    begin
      cdsLocal.Close;

      sSQLAux :=
       ' SELECT ' +
       '    DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME, ' +
       '    ELP.MATRICULA AS MATRICULA_TIT, ' +
       '    DEP.MATRICULA AS MATRICULA, ' +
       '    PPP.INSCRICAONUMERO, ' +
       '    DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF, ' +
       '    PEP.NOME AS NOME_TIT, ' +
       '    PEP.NUMDOCUMENTO AS CPF_TIT, ' +
       '    SIP.DESCRICAO AS SIT_PART, ' +
       '    SPP.DESCRICAO AS SIT_PLANO, ' +
       '    PPA.NOME AS NOME_PATRO, ' +
       '    PLP.NOME AS NOME_PLANO, ' +
       '    DEP.IDPESSOA, ' +
       '    DEP.IDTITULAR, ' +
       '    ELP.IDPESSJUR, ' +
       '    PPP.IDPLANOPREV, ' +
       '    SIP.DESCRICAO AS SIT_PART, ' +
       '    SPP.DESCRICAO AS SIT_PLANO, ' +
       //Pendência 23925 - 01/12/2006
       '    SIP.IDSITPART, ' +
       //Fim Pendência 23925
       '    SIP.FLGINTERNO ' +
       ' FROM ' +
       '    PESSOA       PDP, ' +
       '    PESSOA       PEP, ' +
       '    PESSOA       PPA, ' +
       '    DEPENTIT     DEP, ' +
       '    ELEGPATRO    ELP, ' +
       '    PARTPREVPLAN PPP, ' +
       '    PLANPREV     PLP, ' +
       '    SITPART      SIP, ' +
       '    SITPLANOPREV SPP ' +
       ' WHERE ' +
       '    ( ELP.IDPESSOA       = PEP.IDPESSOA ) AND ' +
       '    ( ELP.IDPESSJUR      = PPA.IDPESSOA ) AND ' +
       '    ( ELP.IDPESSJUR      = PPP.IDPESSJUR ) AND ' +
       '    ( ELP.IDPESSOA       = PPP.IDPESSOA ) AND ' +
       '    ( ELP.IDPESSOA       = DEP.IDTITULAR(+) ) AND ' +
       '    ( DEP.IDPESSOA       = PDP.IDPESSOA(+) ) AND ' +
       '    ( PPP.IDPLANOPREV    = PLP.IDPLANOPREV ) AND ' +
       '    ( PPP.IDSITPART      = SIP.IDSITPART ) AND ' +
       '    ( PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV ) AND ' +
       '    ( PPP.FLGDESATIVADO  = 0 ) AND ' ;

       // Auto-Emprestimo - 27/08/2007
       if iIdPessoa <> -1 then
          sSQLAux := sSQLAux + '    ( DEP.IDPESSOA       = ' + IntToStr( iIdPessoa ) + ' ) ';

       if sMatricula <> '' then
          sSQLAux := sSQLAux + '    ( DEP.MATRICULA      = ' + QuotedStr( sMatricula ) + ' ) ';
       // Fim Auto-Empréstimo

       //Pendência 23553 - 17/10/2006
       sSQLAux := sSQLAux +
       '    ORDER BY DECODE( DEP.IDDEPENDENCIA, ''PRP'', ''   '', IDDEPENDENCIA )';
       //Fim Pendência 23553

      if bGeraLogQuery then CMDebugToFile( 'Inicio Query DadosSolic.. ', sNomeArqLog );
      if bGeraLogQuery then CMDebugToFile( sSQLAux, sNomeArqLog );
      cdsLocal.Data := GetDataPacket( sSQLAux );
      if bGeraLogQuery then CMDebugToFile( 'Término Query DadosSolic.. ', sNomeArqLog );
    end;

    Result := cdsLocal.Data;

  finally
    cdsLocal.Free;
  end;
end;

// Busca dados bancários do solicitante
function TCtrlWebEmprestimo.DadosBancariosSolic(const iIdPessoa: integer): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT C.IDCBANCARIA, C.IDPESSOA, C.IDAGENCIA, C.CONTACORRENTE,          ' +#13+
           '       C.FLGCONTAPREF, C.TIPOCONTA, A.NUMAGENCIA, A.IDBANCO,             ' +#13+
           '       PB.NOME AS NOMEBANCO, B.NUMBANCO, PA.NOME AS NOMEAGENCIA          ' +#13+
           '  FROM PESSOA PB, BANCO B, AGENCIABANCARIA A, CONTABANCARIA C, PESSOA PA ' +#13+
           ' WHERE C.IDAGENCIA = A.IDPESSOA     ' +#13+
           '   AND A.IDBANCO = B.IDPESSOA       ' +#13+
           '   AND PA.IDPESSOA =  A.IDPESSOA    ' +#13+
           '   AND B.IDPESSOA = PB.IDPESSOA     ' +#13+
           '   AND C.FLGCONTAPREF = 1           ' +#13+
           '   AND C.IDPESSOA = ' + IntToStr( iIdPessoa );

   if bGeraLogQuery then CMDebugToFile( 'Início Query DadosBancarios.. ', sNomeArqLog );
   if bGeraLogQuery then CMDebugToFile( sSql, sNomeArqLog );
   Result := GetDataPacket( sSql );
   if bGeraLogQuery then CMDebugToFile( 'Término Query DadosBancarios.. ', sNomeArqLog );
end;



function TCtrlWebEmprestimo.VerificaAutoEmprestimo(fCodAutoEmp: extended; var fIdContratoEmptmo: Extended): boolean;
var sSql : String;
    cdsTemp : TCMClientDataSet;
begin
   try
      Result := False;
      fIdContratoEmptmo := -1;
      cdsTemp := TCMClientDataSet.Create( nil );

      sSql := 'SELECT IDCONTRATOEMPTMO ' +#13+
              '  FROM CONTRATOEMPTMO   ' +#13+
              ' WHERE CODAUTOEMP = ' + FloatToStr( fCodAutoEmp );
      cdsTemp.Data := GetDataPacket( sSql );

      if not cdsTemp.IsEmpty then begin
         Result := True;
         fIdContratoEmptmo := cdsTemp.FieldByName('IDCONTRATOEMPTMO').AsFloat;
      end;
   finally
      FreeAndNil( cdsTemp );
   end;
end;



function TCtrlWebEmprestimo.VerificaFornecedorCredito( const iIdFornCred: Extended): boolean;
var sSql : String;
    cdsTemp : TCMClientDataSet;
begin
   try
      Result := True;
      cdsTemp := TCMClientDataSet.Create( nil );

      sSql := 'SELECT IDPESSOA ' +#13+
              '  FROM FORNSERV   ' +#13+
              ' WHERE IDPESSOA = ' + FloatToStr( iIdFornCred );
      cdsTemp.Data := GetDataPacket( sSql );

      Result := ( not cdsTemp.IsEmpty );
   finally
      FreeAndNil( cdsTemp );
   end;
end;



function TCtrlWebEmprestimo.DadosTpContrato( iIdTipoContrEmptmo: integer): OleVariant;
var sSql : String;
begin
   sSql := ' select   tip.IDTIPOCONTREMPTMO,                                             ' +
   '          tem.IDTIPOEMPTMO,                                                  ' +
   '          tip.TCEDESCRICAO,                                                  ' +
   '          tip.FLGOBRIGBENEF,                                                 ' +
   '          tip.TCEMINRENOVA,                                                  ' +
   '          tip.NUMPARCDESCONTO,                                               ' +
   '          moe.MOECODIGO,                                                     ' +
   '          tip.FLGCONCESSAOZERO,                                              ' +
   '          tip.IDREGRAJURCONC,                                                ' +
   '          tip.IDREGRAJUREXIBE,                                               ' +
   '          tip.IDREGRAELEG,                                                   ' +
   '          tip.IDREGRALIMITES,                                                ' +
   '          tip.IDREGRAPRAZOSCONC,                                             ' +
   '          tip.IDREGRAMARGEM,                                                 ' +
   '          tip.IDREGRARESERVA,                                                ' +
   '          tip.IDREGRASALBAS,                                                 ' +
   '          tip.IDREGRADATACRED,                                               ' +
   '          tip.IDREGRAPRAZOMAX,                                               ' +
   '          tip.TCELEGENDACALC,                                                ' +
   '          nvl( tip.TCELEGENDAEXIBE, tip.TCELEGENDACALC ) as TCELEGENDAEXIBE, ' +
   '          nvl( tip.IDREGRAPRIMPARC, 0) as IDREGRAPRIMPARC,                   ' +
   '          tem.DESCTIPOEMPTMO,                                                ' +
   '          tem.TEPMAXCONTRATO,                                                ' +
   '          tip.ORIGEMCMINSC,                                                  ' +
   '          tip.IDREPORTSINSC,                                                 ' +
   '          moe.MOESIGLA,                                                      ' +
   '          tip.TCEMAXINSCR,                                                   ' +
   '          tip.TCEMAXCONTRATO,                                                ' +
   '          tip.TCENUMPARCSIM,                                                 ' +
   '          tip.FLGUSOAUTOEMP,                                                 ' +
   '          tip.FLGFORMAPAG,                                                   ' +
   '          tip.FLGFORMAREC,                                                   ' +
   //Pendência 27869 - 05/05/2008
   //'          tip.FLGVERPRAZOTIPOQUIT,                                           ' +
   //'          tip.FLGVERIFICACONTRATO                                            ' +
   '          nvl(tip.FLGVERPRAZOTIPOQUIT,0) as FLGVERPRAZOTIPOQUIT,             ' +
   '          nvl(tip.FLGVERIFICACONTRATO,2) as FLGVERIFICACONTRATO,              ' +
   //Fim Pendência 27869
   //Pendência 27232 e 27749 - 17/04/2008
   '          tip.FLGVERIFICAITEMABERTO,                                         ' +
   '          tip.FLGNAOVERIFICAMRGPCL                                           ' +
   //Fim Pendência 27232 e 27749
   ' from     TIPOCONTREMPTMO tip,                                               ' +
   '          TIPOEMPTMO      tem,                                               ' +
   '          MOEDA           moe                                                ' +
   ' where    tip.IDTIPOCONTREMPTMO  = ' + IntToStr( iIdTipoContrEmptmo )          +
   '   and    tip.IDTIPOEMPTMO       = tem.IDTIPOEMPTMO                          ' +
           '   and    tip.MOECODIGO          = moe.MOECODIGO (+)                         ';


   if bGeraLogQuery then CMDebugToFile( 'Início Query DadosTpContrato.. ', sNomeArqLog );
   if bGeraLogQuery then CMDebugToFile( sSql, sNomeArqLog );
   Result := GetDataPacket(sSql);
   if bGeraLogQuery then CMDebugToFile( 'Término Query DadosTpContrato.. ', sNomeArqLog );
end; {DadosTpContrato}


//Dados para extrato de empréstimo
function TCtrlWebEmprestimo.ExtratoEmprestimos( iIdPessoa, iIdTitular : integer;
                                                iIdContratoEmptmo : extended;
                                                sFlgSituacao : string;
                                                iIdTipoEmptmo,
                                                iIdTipoContrEmptmo : extended;
                                                iIdEmpresaProp     : integer;
                                                bAgrupa,
                                                bNaoExibirAtuDiaria : boolean ) : OleVariant;
var
  sSQL            : String;
  cdsLocal        : TCMClientDataset;
  bFLGEXCEPCIONAL : boolean;
begin

   cdsLocal := TCMClientDataset.Create( nil );
   try
     cdsLocal.Data := ParametrosEmprestimo( iIdEmpresaProp );
     bFLGEXCEPCIONAL := ( cdsLocal.FieldByName('FLGEXCEPCIONAL').AsInteger = 1 );
   finally
     cdsLocal.Free;
   end;

   sSQL :=
   'SELECT '                                                                  + #13 +
   '  DECODE( c.FLGSITUACAO, ''E'', ''A'', c.FLGSITUACAO ) as FLGSITUACAO, '  + #13 +
   '  DECODE(H.HMETIPOMOV, 0, 0, 1, 2, 2, 6, 3, 9, 4, 7, 5, 1, 6, 3, 7, 4, 8, 5, 8) AS ORDENACAO, ' + #13 +
   // Fanuel Junior SOL 165269 Kintana 1428881
   //BRUNO AZEVEDO E FANUEL
   //'  DECODE( H.FLGSUSPENSAO, 1, ''Suspenso'', decode ( NVL (H.HMECENTRALIZA, 0) , 1, decode( NVL( H.HMEVLREFETIVO, 0 ), 0, ''Em aberto'', ''Paga'' ), ' + #13 +
   //'  decode ( NVL (H.HMEDESTACADO, 0) , 1, decode( NVL( H.HMEVLREFETIVO, 0 ), 0, ''Em aberto'', ''Paga'' ) ,'''') ) ) AS SITPARCELA,  ' + #13 +
   ' (CASE   '+ #13 +
   '      WHEN H.FLGSUSPENSAO = 1 THEN     '+ #13 +
   '        ''Suspenso''                   '+ #13 +
 //  '     WHEN (NVL(H.HMEVLREFETIVO, 0) <> 0)  AND H.HMEDATAEFETIVA IS NOT NULL THEN  '+ #13 +
   '     WHEN (H.HMEVLREFETIVO IS NOT NULL) AND ( H.HMEDATAEFETIVA IS NOT NULL) THEN   '+ #13 +
   '        ''Paga''                           '+ #13 +
   '     WHEN NVL(H.FLGABONADO, 0) =  1 THEN   '+ #13 +
   '        ''Abonado''                        '+ #13 +
   '     WHEN NVL(H.FLGQUITADO, 0) =  1 THEN   '+ #13 +
   '        ''Quitado''    '+ #13 +
   '     ELSE              '+ #13 +
   '        ''Em aberto''  '+ #13 +
   ' END ) AS SITPARCELA,  '+ #13 +

   '  DATACREDITO, '                                                          + #13 +
   '  C.IDTIPOCONTREMPTMO, '                                                  + #13 +
   '  C.IDCONTRATOEMPTMO, '                                                   + #13 +
   '  I.IDITEMEMPTMO, '                                                       + #13 +
   '  I.ITEDESCRICAO, '                                                       + #13 +
   '  H.HMEVLRPREVISTO, '                                                     + #13 +
   '  H.HMEVLREFETIVO, '                                                      + #13 +
   '  HMETXJUROS as TXJUROS, '                                                + #13 +
   '  CODDOCUMENTO, '                                                         + #13 +
   '  IDRUBRICA, '                                                            + #13 +
   '  H.HMEDATAPREVISTA, '                                                    + #13 +
   '  H.HMECENTRALIZA, '                                                      + #13 +
   '  H.HMEDESTACADO, '                                                       + #13 +
   '  H.HMEDATAEFETIVA, '                                                     + #13 +
   '  H.HMEDATAVENCTO, '                                                      + #13 +
   '  H.HMEANOCOMPETENCIA AS ANOCOMP, '                                       + #13 +
   '  H.HMEMESCOMPETENCIA AS MESCOMP, '                                       + #13 +
   '  H.HMEANOCOBRANCA AS ANOCOBR, '                                          + #13 +
   '  H.HMEMESCOBRANCA AS MESCOBR, '                                          + #13 +

   '  (TO_CHAR(NVL(H.HMEPARCELAALT, H.HMEPARCELA), ''00'') || ''/'' || TO_CHAR(H.HMENUMPARCELAS, ''00'')) AS HMEPARCELA, '  + #13 +

   '  H.HMESEQCOBRANCA, '                                                     + #13 +
   '  H.HMESALDODEV, '                                                        + #13 +
   '  TC.TCEDESCRICAO, '                                                      + #13 +
   '  H.HMETIPOMOV AS TIPOMOV, '                                              + #13 +
   '  IC.ITCSEQCALCULO, '                                                     + #13 +

   '  DECODE(C.FLGFORMAPAG, '                                                 + #13 +
   '         ''F'', ''Folha de Pagamento'', '                                 + #13 +
   '                ''Banco'' '                                               + #13 +
   '        ) AS FLGFORMAPAG, '                                               + #13 +

   '  DECODE(NVL(H.FLGSUSPENSAO, 0), '                                        + #13 +
   '         0 , '' '', '                                                     + #13 +
   '             TSE.TSEDESCRICAO '                                           + #13 +
   '        ) AS SUSPENSAO, '                                                 + #13 +

   '  DECODE(H.HMETIPOMOV, '                                                  + #13 +
   '         0, ''Concessão/Renovação'', '                                    + #13 +
   '         1, ''Prestação '', '                                             + #13 +
   '         2, ''Amortização/Refinanciamento'', '                            + #13 +
   '         3, ''Quitação'', '                                               + #13 +
   '         4, ''Atualização de Débito'', '                                  + #13 +
   '         5, ''Atualização de Saldo (Diária)'' , '                         + #13 +
   '         6, ''Importação/Migração'', '                                    + #13 +
   '         7, ''Ajustes (Cobrança/Devolução)'', '                           + #13 +
   '         8, ''Ajustes (Saldo Devedor)'' '                                 + #13 +
   '        ) AS EVENTO, '                                                    + #13 +

   '  TO_CHAR(H.HMEMESCOMPETENCIA, ''00'') || ''/'' || TO_CHAR(H.HMEANOCOMPETENCIA,''0000'') AS ANOMESCOMP, ' + #13 +
   '  TO_CHAR(H.HMEMESCOBRANCA, ''00'')    || ''/'' || TO_CHAR(H.HMEANOCOBRANCA,''0000'')    AS ANOMESCOBR, ' + #13 +
   '    DECODE(NVL(H.HMECENTRALIZA,0),0,0,H.HMEVLRPREVISTO-NVL(HMEVLREFETIVO,0)) + ' +
   '    DECODE(NVL(H.HMEDESTACADO,0),0,0,H.HMEVLRPREVISTO-NVL(HMEVLREFETIVO,0)) AS VLR_ABERTO ' + #13 +

   'FROM '                                                                    + #13 +
   '  HISTMOVEMPTMO    H,   '                                                 + #13 +
   '  CONTRATOEMPTMO   C,   '                                                 + #13 +
   '  ITEMXTIPOCONTR   IC,  '                                                 + #13 +
   '  TIPOCONTREMPTMO  TC,  '                                                 + #13 +
   '  TIPOSUSPEMPTMO   TSE, '                                                 + #13 +
   '  ITEMEMPTMO       I    '                                                 + #13 +



   ' where                                                                  ' + #13 +
   '          C.IDPESSOA        = ' + IntToStr( iIdTitular )                + #13 +
   '   and    C.IDBENEF         = ' + IntToStr( iIdPessoa )                 + #13 +
   '  AND NVL(H.FLGESTORNADO, 0) = 0 '                                        + #13 ;

   if bAgrupa then sSQL := sSQL +
   '  AND ( (H.HMECENTRALIZA  = 1) OR (H.HMEDESTACADO = 1) ) '                + #13;

   if bNaoExibirAtuDiaria then sSQL := sSQL +
   '  AND H.HMETIPOMOV        <> 5 '                                          + #13;

   if iIdContratoEmptmo > 0 then sSQL := sSQL +
   '  AND C.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', iIdContratoEmptmo)      + #13;

   if iIdTipoContrEmptmo > 0 then
      sSQL := sSQL +
   ' AND (C.IDTIPOCONTREMPTMO = ' + FloatToStr(iIdTipoContrEmptmo)   + ')     ';

   if iIdTipoEmptmo > 0 then
     sSQL := sSQL +
  ' AND (C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO)                  ' +
  ' AND (TC.IDTIPOEMPTMO     = ' + FloatToStr(iIdTipoEmptmo) + ')     ' ;

  if sFlgSituacao <> '' then sSQL := sSQL +
   '   and    ( decode( c.FLGSITUACAO, ''E'', ''A'', c.FLGSITUACAO ) = ' + QuotedStr( sFlgSituacao ) + ' ) ' ;

   sSQL := sSQL +
   '  AND C.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO '                          + #13 +
   '  AND C.IDTIPOCONTREMPTMO = IC.IDTIPOCONTREMPTMO '                        + #13 +
   '  AND I.IDITEMEMPTMO      = IC.IDITEMEMPTMO '                             + #13 +
   '  AND H.IDITEMEMPTMO      = IC.IDITEMEMPTMO '                             + #13 +
   '  AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO '                        + #13 +
   '  AND H.IDTIPOSUSPEMPTMO  = TSE.IDTIPOSUSPEMPTMO(+) '                     + #13;

   if bFLGEXCEPCIONAL then
   begin
      sSQL := sSQL +
      'UNION '                                                    + #13 +

      'SELECT '                                                   + #13 +
      '  DECODE( c.FLGSITUACAO, ''E'', ''A'', c.FLGSITUACAO ) as FLGSITUACAO, '  + #13 +
      '  DECODE(H.HMETIPOMOV, 0, 0, 1, 2, 2, 6, 3, 9, 4, 7, 5, 1, 6, 3, 7, 4, 8, 5, 8) AS ORDENACAO, ' + #13 +
      // Fanuel Junior SOL 165269 Kintana 1428881
      //BRUNO AZEVEDO E FANUEL
      //'  DECODE( H.FLGSUSPENSAO, 1, ''Suspenso'', decode ( NVL (H.HMECENTRALIZA, 0) , 1, decode( NVL( H.HMEVLREFETIVO, 0 ), 0, ''Em aberto'', ''Paga'' ), ' + #13 +
     // '  decode ( NVL (H.HMEDESTACADO, 0) , 1, decode( NVL( H.HMEVLREFETIVO, 0 ), 0, ''Em aberto'', ''Paga'' ) ,'''') ) ) AS SITPARCELA,  ' + #13 +

      ' (CASE   '+ #13 +
      '      WHEN H.FLGSUSPENSAO = 1 THEN     '+ #13 +
      '        ''Suspenso''                   '+ #13 +
      //'     WHEN (NVL(H.HMEVLREFETIVO, 0) <> 0)  AND H.HMEDATAEFETIVA IS NOT NULL THEN  '+ #13 +
      '     WHEN (H.HMEVLREFETIVO IS NOT NULL) AND ( H.HMEDATAEFETIVA IS NOT NULL) THEN   '+ #13 +
      '        ''Paga''                           '+ #13 +
      '     WHEN NVL(H.FLGABONADO, 0) =  1 THEN   '+ #13 +
      '        ''Abonado''                        '+ #13 +
      '     WHEN NVL(H.FLGQUITADO, 0) =  1 THEN   '+ #13 +
      '        ''Quitado''    '+ #13 +
      '     ELSE              '+ #13 +
      '        ''Em aberto''  '+ #13 +
      ' END ) AS SITPARCELA,  '+ #13 +

      '  DATACREDITO, '                                           + #13 +
      '  C.IDTIPOCONTREMPTMO, '                                   + #13 +
      '  C.IDCONTRATOEMPTMO, '                                    + #13 +
      '  I.IDITEMEMPTMO, '                                        + #13 +
      '  I.ITEDESCRICAO, '                                        + #13 +
      '  H.HMEVLRPREVISTO, '                                      + #13 +
      '  H.HMEVLREFETIVO, '                                       + #13 +
      '  HMETXJUROS as TXJUROS, '                                 + #13 +
      '  CODDOCUMENTO, '                                          + #13 +
      '  IDRUBRICA, '                                             + #13 +
      '  H.HMEDATAPREVISTA, '                                     + #13 +
      '  H.HMECENTRALIZA, '                                       + #13 +
      '  H.HMEDESTACADO, '                                        + #13 +
      '  H.HMEDATAEFETIVA, '                                      + #13 +
      '  H.HMEDATAVENCTO, '                                       + #13 +
      '  H.HMEANOCOMPETENCIA AS ANOCOMP, '                        + #13 +
      '  H.HMEMESCOMPETENCIA AS MESCOMP, '                        + #13 +
      '  H.HMEANOCOBRANCA AS ANOCOBR, '                           + #13 +
      '  H.HMEMESCOBRANCA AS MESCOBR, '                           + #13 +

      '  (TO_CHAR(NVL(H.HMEPARCELAALT, H.HMEPARCELA), ''00'') || ''/'' || TO_CHAR(H.HMENUMPARCELAS, ''00'')) AS HMEPARCELA, '  + #13 +

      '  H.HMESEQCOBRANCA, '                                      + #13 +
      '  H.HMESALDODEV, '                                         + #13 +
      '  TC.TCEDESCRICAO, '                                       + #13 +
      '  H.HMETIPOMOV AS TIPOMOV, '                               + #13 +
      '  IC.ITCSEQCALCULO, '                                      + #13 +
      '  DECODE(C.FLGFORMAPAG, '                                  + #13 +
      '         ''F'', ''Folha de Pagamento'', '                  + #13 +
      '                ''Banco'') AS FLGFORMAPAG, '               + #13 +

      '  DECODE(NVL(H.FLGSUSPENSAO, 0), 1, ''Suspensa'', '' '') AS SUSPENSAO, '  + #13 +

      '  DECODE(H.HMETIPOMOV, '                                   + #13 +
      '         0, ''Concessão/Renovação'', '                     + #13 +
      '         1, ''Prestação '', '                              + #13 +
      '         2, ''Amortização/Refinanciamento'', '             + #13 +
      '         3, ''Quitação'', '                                + #13 +
      '         4, ''Atualização de Débito'', '                   + #13 +
      '         5, ''Atualização de Saldo (Diária)'' , '          + #13 +
      '         6, ''Importação/Migração'', '                     + #13 +
      '         7, ''Ajustes (Cobrança/Devolução)'', '            + #13 +
      '         8, ''Ajustes (Saldo Devedor)'' '                  + #13 +
      '        ) AS EVENTO, '                                     + #13 +

      '  TO_CHAR(H.HMEMESCOMPETENCIA, ''00'') || ''/'' || TO_CHAR(H.HMEANOCOMPETENCIA,''0000'') AS ANOMESCOMP, ' + #13 +
      '  TO_CHAR(H.HMEMESCOBRANCA, ''00'')    || ''/'' || TO_CHAR(H.HMEANOCOBRANCA,''0000'')    AS ANOMESCOBR, ' + #13 +
      '    DECODE(NVL(H.HMECENTRALIZA,0),0,0,H.HMEVLRPREVISTO-NVL(HMEVLREFETIVO,0)) + ' +
      '    DECODE(NVL(H.HMEDESTACADO,0),0,0,H.HMEVLRPREVISTO-NVL(HMEVLREFETIVO,0)) AS VLR_ABERTO ' + #13 +

      'FROM '                                                     + #13 +
      '  HISTMOVEMPTMOEXT H,   '                                  + #13 +
      '  CONTRATOEMPTMO   C,   '                                  + #13 +
      '  ITEMXTIPOCONTR   IC,  '                                  + #13 +
      '  TIPOCONTREMPTMO  TC,  '                                  + #13 +
      '  ITEMEMPTMO       I    '                                  + #13 +

      'WHERE '                                                    + #13 +
      '      ( ( c.IDPESSOA = ' + IntToStr( iIdPessoa ) + ' ) '       + #13 +
      '          or ( c.IDBENEF = ' + IntToStr( iIdPessoa ) + ' ) ) ' + #13 +

      '  AND NVL(H.FLGESTORNADO, 0) = 0 '                                        + #13 ;

      if bAgrupa then sSQL := sSQL +
      '  AND ( (H.HMECENTRALIZA = 1) OR (H.HMEDESTACADO = 1) ' + ' ) '           + #13;

      if bNaoExibirAtuDiaria then sSQL := sSQL +
      '  AND H.HMETIPOMOV    <> 5 '                                              + #13;

      if iIdContratoEmptmo > 0 then sSQL := sSQL +
      '  AND C.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', iIdContratoEmptmo)      + #13;

      if sFlgSituacao <> '' then sSQL := sSQL +
       '   and    ( decode( c.FLGSITUACAO, ''E'', ''A'', c.FLGSITUACAO ) = ' + QuotedStr( sFlgSituacao ) + ' ) ' ;

      sSQL := sSQL +
      '  AND C.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO   '         + #13 +
      '  AND C.IDTIPOCONTREMPTMO = IC.IDTIPOCONTREMPTMO '         + #13 +
      '  AND I.IDITEMEMPTMO      = IC.IDITEMEMPTMO      '         + #13 +
      '  AND H.IDITEMEMPTMO      = IC.IDITEMEMPTMO      '         + #13 +
      '  AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO '         + #13;

      if iIdTipoContrEmptmo > 0 then
         sSQL := sSQL +
      ' AND (C.IDTIPOCONTREMPTMO = ' + FloatToStr(iIdTipoContrEmptmo)   + ')     ';

      if iIdTipoEmptmo > 0 then
        sSQL := sSQL +
     ' AND (C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO)                  ' +
     ' AND (TC.IDTIPOEMPTMO     = ' + FloatToStr(iIdTipoEmptmo) + ')     ' ;

   end;
   // Fanuel Junior SOL 165269 Kintana 1428881
   //BRUNO AZEVEDO SOL 140315 KINTANA 876139
   if bFLGEXCEPCIONAL then sSQL := sSQL + #13 +
   'ORDER BY '                                                                                  + #13 +
   //'  FLGSITUACAO, IDCONTRATOEMPTMO, HMEDATAPREVISTA, ORDENACAO, HMEPARCELA, ITCSEQCALCULO, HMESEQCOBRANCA, HMECENTRALIZA DESC' + #13
     ' FLGSITUACAO, IDCONTRATOEMPTMO,HMEPARCELA, IDITEMEMPTMO, HMEDATAPREVISTA, ORDENACAO, ITCSEQCALCULO, HMESEQCOBRANCA, HMECENTRALIZA  DESC '+ #13

   // Fanuel Junior SOL 165269 Kintana 1428881
   else sSQL := sSQL + #13 +
   'ORDER BY '                                                                            + #13 +
   //'  FLGSITUACAO, IDCONTRATOEMPTMO, H.HMEANOCOMPETENCIA, H.HMEMESCOMPETENCIA,                      '  + #13 +
   //                  '  H.HMETIPOMOV, H.HMEPARCELA, IC.ITCSEQCALCULO, H.HMESEQCOBRANCA, HMECENTRALIZA DESC '  + #13;
  ' FLGSITUACAO, IDCONTRATOEMPTMO,HMEPARCELA, IDITEMEMPTMO, HMEDATAPREVISTA, ORDENACAO, ITCSEQCALCULO, HMESEQCOBRANCA, HMECENTRALIZA  DESC '+ #13;

   //BRUNO AZEVEDO SOL 140315 KINTANA 876139
   CmDebugToFile(sSQL,'C:\AAErro.txt');
   Result := GetDataPacket( sSQL );
end;


//Retorna a quantidade de feriados que cai em uma data
function TCtrlWebEmprestimo.Feriados(dData: TDateTime; iCidade,
  iPais: integer; sEstado, sTipos : string): OleVariant;
begin
  Result := GetDataPacket(
   ' select count( IDFERIADO ) as NO_FERIADOS                                                           ' +
   ' from   FERIADOS                                                                                    ' +
   ' where  ( DATAFERIADO = to_date( ''' + FormatDateTime('dd/mm/yyyy', dData) + ''', ''DD/MM/YYYY'') ) ' +
   '   and  ( (  IDPAIS =  ' + IntToStr( iPais ) + ' )                                                  ' +
   '    or  ( (  IDPAIS =  ' + IntToStr( iPais ) + ' ) AND (CODESTADO = ''' + sEstado + ''' ) )         ' +
   '    or  ( IDCIDADES =  ' + IntToStr(iCidade) + ' ) )                                                ' +
   '   and  ( FLGTIPO in ( ' + sTipos + ' ) )                                                           ' );
end;


//Indica o limite e o total de inscrições
function TCtrlWebEmprestimo.LimiteContratos( iIdPessoa, iIdTipoEmptmo, iIdEmpresaProp, iIdMutuario : integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select   tem.TEPMAXCONTRATO,                                                ' +
   '          count( cnt.IDCONTRATOEMPTMO ) as NUMCONTRATO                       ' +
   ' from     CONTRATOEMPTMO  cnt,                                               ' +
   '          TIPOCONTREMPTMO tip,                                               ' +
   '          TIPOEMPTMO      tem                                                ' +
   ' where    ( tip.IDTIPOCONTREMPTMO = cnt.IDTIPOCONTREMPTMO                  ) ' +
   '   and    ( tip.IDTIPOEMPTMO      = tem.IDTIPOEMPTMO                       ) ' +
   '   and    ( cnt.FLGSITUACAO       in (''A'', ''E'', ''K'')                 ) ' +
   '   and    ( tem.IDEMPRESAPROP     = ' + IntToStr( iIdEmpresaProp )     + ' ) ' +
   '   and    ( cnt.IDPESSOA          = ' + IntToStr( iIdPessoa )          + ' ) ' +
   '   and    ( tem.IDTIPOEMPTMO      = ' + IntToStr( iIdTipoEmptmo )      + ' ) ' +
   '   and    ( cnt.IDBENEF           = ' + IntToStr( iIdMutuario   )      + ' ) ' +
   ' group by tem.TEPMAXCONTRATO                                                 ' );
end;

function TCtrlWebEmprestimo.LimiteInscricoes(iIdPessoa, iIdTipoEmptmo, iIdEmpresaProp : integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select    tem.TEPMAXINSCR,                                                   ' +
   '           count( ins.IDINSCRICAOEMPTMO) as NUMINSC                           ' +
   ' from      INSCRICAOEMPTMO ins,                                               ' +
   '           CONTRATOEMPTMO  cnt,                                               ' +
   '           TIPOCONTREMPTMO tip,                                               ' +
   '           TIPOEMPTMO TEM                                                     ' +
   ' where     ( ins.IDPESSOA          =  ' + IntToStr( iIdPessoa)          + ' ) ' +
   '   and     ( tip.IDTIPOEMPTMO      =  ' + IntToStr( iIdTipoEmptmo )     + ' ) ' +
   '   and     ( tem.IDEMPRESAPROP     =  ' + IntToStr( iIdEmpresaProp )    + ' ) ' +
   '   and     ( cnt.IDINSCRICAOEMPTMO is null                                  ) ' +
   '   and     ( ins.IDINSCRICAOEMPTMO =  cnt.IDINSCRICAOEMPTMO (+)             ) ' +
   '   and     ( tip.IDTIPOCONTREMPTMO =  ins.IDTIPOCONTREMPTMO                 ) ' +
   '   and     ( tip.IDTIPOEMPTMO      =  tem.IDTIPOEMPTMO                      ) ' +
   '   and     ( ins.FLGSITUACAO       <> ''C''                                 ) ' +
   ' group by  tem.TEPMAXINSCR                                                    ' );
end; {LimiteInscricoes}



//Lookup de tipos de contrato
function TCtrlWebEmprestimo.ListaTpContrato( iIdPlanoPrev, iIdEmpresaProp : integer ) : OleVariant;
var
  sSQL : string;
begin
  sSQL := ' SELECT TCE.IDTIPOCONTREMPTMO,                    ' +
          '        TCE.TCEDESCRICAO,                         ' +
          '        TCE.FLGUSOINTERNET                        ' +
          ' FROM   TIPOCONTREMPTMO TCE,                      ' +
          '        TIPOEMPTMO      TEP                       ' +
          ' WHERE  ( TCE.IDTIPOEMPTMO  = TEP.IDTIPOEMPTMO )  ' ;

  if iIdPlanoPrev > 0 then
   sSQL := sSQL +
          //Pendência 26844 - 20/12/2007
          '   AND  ( ( TCE.IDPLANOPREV  IS NULL ) OR         ' +
          '          ( TCE.IDPLANOPREV   =                   ' +
          IntToStr( iIdPlanoPrev ) + ' ) )                   ' ;
          //Fim Pendência 26844

  sSQL := sSQL +
         '    AND ( TEP.IDEMPRESAPROP  =                     ' +
         IntToStr( iIdEmpresaProp ) + ' )                    ' +
   '    AND ( TCE.FLGSITUACAO    = ''A''                              ) ' +
   '    AND ( TCE.FLGUSOINTERNET = 1                                  ) ' ;

  Result:= GetDataPacket( sSQL );
end; {ListaTpContrato}


//Totaliza Saldo Devedor de empréstimos
function TCtrlWebEmprestimo.ParametrosEmprestimo( iIdEmpresaProp: integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' SELECT ' +
   '    PEP.IDEMPRESAPROP, ' +
   '    PEP.IDGRUPOREGRA, ' +
   '    PEP.FLGOBRIGAVERBA, ' +
   '    PEP.FLGVERBAUNICA, ' +
   '    PEP.FLGFORMAPORT, ' +
   '    PEP.CODFORMAPAGTO, ' +
   '    PEP.PORTFORMARECTO, ' +
   '    PEP.PORTFORMAPAGTO, ' +
   '    PEP.FLGFORMAREC, ' +
   '    PEP.FLGFORMAPAG, ' +
   '    PEP.FLGDATAATUSLD, ' +
   '    PEP.FLGSALDODEVANT, ' +
   '    PEP.FLGPENDCONCESSAO, ' +
   '    PEP.IDTIPOCLIENTE, ' +
   '    PEP.IDPROGRAMA, ' +
   '    PEP.IDEMPRESA, ' +
   '    PEP.CODCENTROCUSTO, ' +
   '    PEP.IDCIDADES, PEP.IDESTADO, PEP.IDPAIS, ' +
   '    PEP.FLGINTEGRACONC, ' +
   '    PEP.FLGUSAFIARIO, ' +
   '    PEP.FLGIMPRIMEINSC, ' +
   '    PEP.FLGINTEGRACONTAB, ' +
   '    PEP.FLGINTEGRAFOLHA, ' +
   '    PEP.FLGINTEGRACAPCAR, ' +
   '    PEP.TIPODOCPAG, ' +
   '    PEP.TIPODOCREC, ' +
   '    PEP.FLGGERARUBRICA, ' +
   '    PEP.FLGSUSPENSAOAUTO, ' +
   '    PEP.FLGAMTPRESTAB, ' +
   '    PEP.FLGRENPRESTAB, ' +
   '    PEP.FLGCONCULTDIAMES, ' +
   '    PEP.IDITEMIOF, ' +
   '    PEP.IDITEMIOFCOMPL, ' +
   '    PEP.IDITEMIOFCOMPLCON, ' +
   '    PEP.FLGAGRUPAPARC, ' +
   '    PEP.FLGAGRUPAPARCFOL, ' +
   '    PEP.FLGSUSPENDEATRASO, ' +
   '    PEP.FLGOBRIGAAVALISTA, ' +
   '    PEP.FLGCALCDIA, ' +
   '    PEP.FLGMOSTRATIT, ' +
   '    PEP.FLGTRAVARDATA, ' +
   '    PEP.FLGTRATAASSINAT, ' +
   '    PEP.IDREGRAAVAL, ' +
   '    PEP.FLGENVIODIVERG, ' +
   '    PEP.FLGPARCDIVERG, ' +
   '    PEP.FLGTRATQUITCANC, ' +
   '    PEP.HORAENCERRA, ' +
   '    PEP.FLGCONTABCONC, ' +
   '    PEP.FLGCONTABPARCELA, ' +
   '    PEP.FLGCONTABENCARGO, ' +
   '    PEP.FLGINTEGRAENVIO, ' +
   '    PEP.FLGINTEGRAQUITA, ' +
   '    CID.NOME AS NOME_CIDADE, ' +
   '    EST.CODESTADO, EST.NOMEESTADO, ' +
   '    PAI.NOMEPAIS, ' +
   '    REG.NOMEREGRA, ' +
   '    PEP.IDITEMSEGCONC, ' +
   '    PEP.IDITEMDEVSEGCONC, ' +
   '    PEP.IDITEMDEVSEGQUIT, ' +
   '    PEP.IDITEMSEGCOMPL, ' +
   '    PEP.IDITEMINESPERADO, ' +
   '    PEP.IDITEMSLDMAIS, ' +
   '    PEP.IDITEMSLDMENOS, ' +
   '    NVL(PEP.FLGEXCEPCIONAL,0) AS FLGEXCEPCIONAL, ' +
   '    PEP.IDREGRADEVSEG, ' +
   '    PEP.FLGINSCRET, ' +
   '    PEP.IDREGRAATUALDIA, ' +
   '    DEV.NOMEREGRA AS REGRADEV, ' +
   '    ATU.NOMEREGRA AS REGRAATU, ' +
   '    PEP.FLGCONTROLAINSC, ' +
   '    PEP.FLGUSAFLOATCONC, ' +
   '    PEP.FLGQUITAPARCMORTE, ' +
   '    PEP.FLGPARTIDADOBRADA, ' +
   '    PEP.IDITEMPROVPERDA, ' +
   '    PEP.IDITEMSEGESPECIAL, ' +
   '    PEP.FLGIMPRINSCRICAO, ' +
   '    PEP.IDSEGURADORA, ' +
   '    PEP.FLGESTORNADIVERG, ' +
   '    PEP.FLGESTORNOPOSQUIT, ' +
   '    PEP.FLGABONODIVERG, ' +
   //Pendência 23733 - 19/12/2006
   '    PEP.IDREGRATIPOCONTR, ' +
   '    TIP.NOMEREGRA AS REGRATIPOCONTR, ' +
   //Fim Pendência 23733
   //Pendência 26775 - 26/12/2007
   '    PEP.IDREGRAPLANOCOB, ' +
   '    PLC.NOMEREGRA AS REGRAPLANOCOB ' +
   //Fim Pendência 26775
   ' FROM ' +
   '    CIDADES     CID, ' +
   '    ESTADO      EST, ' +
   '    PAIS        PAI, ' +
   '    PARAMEMPTMO PEP, ' +
   '    REGRA       REG, ' +
   '    REGRA       DEV, ' +
   '    REGRA       ATU, ' +
   //Pendência 23733 - 19/12/2006
   '    REGRA       TIP, ' +
   //Fim Pendência 23733
   //Pendência 26775 - 26/12/2007
   '    REGRA       PLC  ' +
   //Fim Pendência 26775
   ' WHERE ' +
   '        PEP.IDEMPRESAPROP   = ' + IntToStr( iIdEmpresaProp ) +
   '    AND PEP.IDCIDADES       = CID.IDCIDADES(+) ' +
   '    AND PEP.IDESTADO        = EST.IDESTADO(+) ' +
   '    AND PEP.IDPAIS          = PAI.IDPAIS(+) ' +
   '    AND PEP.IDREGRAAVAL     = REG.IDREGRA(+) ' +
   '    AND PEP.IDREGRADEVSEG   = DEV.IDREGRA(+) ' +
   '    AND PEP.IDREGRAATUALDIA = ATU.IDREGRA(+) ' +
   //Pendência 23733 - 19/12/2006
   '    AND PEP.IDREGRATIPOCONTR= TIP.IDREGRA(+) ' +
   //Fim Pendência 23733
   //Pendência 26775 - 26/12/2007
   '    AND PEP.IDREGRAPLANOCOB = PLC.IDREGRA(+) ' );
   //Fim Pendência 26775
end;


//Recupera Datas de Empréstimo
function TCtrlWebEmprestimo.RecuperaDatasEmprestimo(iIdPessJur,
  iIdPlanoPrev: integer; sSitFundacao: string): OleVariant;
begin

  Result := GetDataPacket(
   ' select                                              ' +
   '  DIACOBN, FLGUTILN, FLGDIAPOSANTN, FLGMESCOBN,      ' +
   '  DIACOBA, FLGUTILA, FLGDIAPOSANTA, FLGMESCOBA,      ' +
   '  DIACOBD, FLGUTILD, FLGDIAPOSANTD, FLGMESCOBD,      ' +
   '  DIACOBC, FLGUTILC, FLGDIAPOSANTC, FLGMESCOBC,      ' +
   '  DIASAPOSD, DIASAPOSC                               ' +
   ' from      DATASPATROEMPTMO                          ' +
   ' where     IDPESSJUR   = ' + IntToStr( iIdPessJur )    +
   '   and     IDPLANOPREV = ' + IntToStr( iIdPlanoPrev )  +
   '   and     SITFUNDACAO = ' + QuotedStr( sSitFundacao ) );
end;


//Totaliza Saldo Devedor de empréstimos
function TCtrlWebEmprestimo.SaldoEmprestimos( iIdPessoa : integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select   decode( cnt.FLGSITUACAO, ''E'', ''A'', cnt.FLGSITUACAO ) as FLGSITUACAO,    ' +
   '          cnt.IDCONTRATOEMPTMO,                                                       ' +
   '          ins.DATAINSC,                                                               ' +
   '          cnt.VLRCONTRATO,                                                            ' +
   '          cnt.DATACREDITO,                                                            ' +
   '          cnt.NUMPARCELAS,                                                            ' +
   '          hme.HMESALDODEV + nvl( parcaberto.VALOR_DEVIDO, 0 ) as SALDO_DEVEDOR,       ' +
   '          nvl( hme.HMENUMPARCELAS, 0 ) +                                              ' +
   '           nvl( parcnpagas.PARCELAS_DEVIDAS, 0 ) as PARC_RESTANTES                    ' +
   ' from     CONTRATOEMPTMO  cnt,                                                        ' +
   '          INSCRICAOEMPTMO ins,                                                        ' +
   '          HISTMOVEMPTMO   hme,                                                        ' +
   '          ( select   con.IDCONTRATOEMPTMO,                                            ' +
   '                     max(IDHISTMOVEMPTMO) as IDHISTMOVEMPTMO                          ' +
   '            from     HISTMOVEMPTMO  hme,                                              ' +
   '                     CONTRATOEMPTMO con                                               ' +
   '            where    ( ( hme.HMECENTRALIZA    =  1) or ( hme.HMEDESTACADO =  1    ) ) ' +
   '              and    ( ( hme.FLGESTORNADO     =  0) or ( hme.FLGESTORNADO is null ) ) ' +
   '              and    ( con.IDPESSOA           =  ' + IntToStr( iIdPessoa ) + '      ) ' +
   '              and    ( hme.IDCONTRATOEMPTMO   =  con.IDCONTRATOEMPTMO               ) ' +
   '            group by con.IDCONTRATOEMPTMO ) max,                                      ' +
   '          ( select   hme.IDCONTRATOEMPTMO,                                            ' +
   '                     sum( hme.HMEVLRPREVISTO ) as VALOR_DEVIDO                        ' +
   '            from     CONTRATOEMPTMO cnt,                                              ' +
   '                     HISTMOVEMPTMO  hme                                               ' +
   '            where    ( hme.FLGBAIXADO        is not null                            ) ' +
   '              and    ( hme.IDCONTRATOEMPTMO  =  cnt.IDCONTRATOEMPTMO                ) ' +
   '              and    ( cnt.IDPESSOA          =  ' + IntToStr( iIdPessoa ) + '       ) ' +
   '              and    ( hme.HMETIPOMOV        in ( 1, 2, 3, 4 )                      ) ' +
   '              and    ( ( HME.FLGESTORNADO    =  0) or ( HME.FLGESTORNADO IS NULL )  ) ' +
   '              and    ( ( HME.HMECENTRALIZA   =  1) or ( HME.HMEDESTACADO =  1    )  ) ' +
   '              and    ( ( HME.FLGQUITADO      =  0) or ( HME.FLGQUITADO   IS NULL )  ) ' +
   '              and    ( ( HME.FLGABONADO      =  0) or ( HME.FLGABONADO   IS NULL )  ) ' +
   '            group by hme.IDCONTRATOEMPTMO ) parcaberto,                               ' +
   '          ( select   hme.IDCONTRATOEMPTMO,                                            ' +
   '                     count(*) as PARCELAS_DEVIDAS                                     ' +
   '            from     CONTRATOEMPTMO cnt,                                              ' +
   '                     HISTMOVEMPTMO  hme                                               ' +
   '            where    ( hme.FLGBAIXADO        is not null                            ) ' +
   '              and    ( hme.IDCONTRATOEMPTMO  =  cnt.IDCONTRATOEMPTMO                ) ' +
   '              and    ( cnt.IDPESSOA          =  ' + IntToStr( iIdPessoa ) + '       ) ' +
   '              and    ( hme.HMETIPOMOV        =  1                                   ) ' +
   '              and    ( ( HME.FLGESTORNADO    =  0) or ( HME.FLGESTORNADO IS NULL )  ) ' +
   '              and    ( ( HME.HMECENTRALIZA   =  1) or ( HME.HMEDESTACADO =  1    )  ) ' +
   '              and    ( ( HME.FLGQUITADO      =  0) or ( HME.FLGQUITADO   IS NULL )  ) ' +
   '              and    ( ( HME.FLGABONADO      =  0) or ( HME.FLGABONADO   IS NULL )  ) ' +
   '            group by hme.IDCONTRATOEMPTMO ) parcnpagas                                ' +
   ' where    ( cnt.IDPESSOA          =  ' + IntToStr( iIdPessoa ) + '    )               ' +
   '   and    ( cnt.IDCONTRATOEMPTMO  =  hme.IDCONTRATOEMPTMO             )               ' +
   '   and    ( cnt.IDCONTRATOEMPTMO  =  max.IDCONTRATOEMPTMO             )               ' +
   '   and    ( hme.IDHISTMOVEMPTMO   =  max.IDHISTMOVEMPTMO              )               ' +
   '   and    ( cnt.IDINSCRICAOEMPTMO =  ins.IDINSCRICAOEMPTMO            )               ' +
   '   and    ( hme.IDCONTRATOEMPTMO  =  parcaberto.IDCONTRATOEMPTMO (+)  )               ' +
   '   and    ( hme.IDCONTRATOEMPTMO  =  parcnpagas.IDCONTRATOEMPTMO (+)  )               ' +
   ' order by FLGSITUACAO,                                                                ' +
   '          cnt.IDCONTRATOEMPTMO                                                        ' );
end; {SaldoEmprestimos}




//Dados de empréstimos anteriores
function TCtrlWebEmprestimo.ContratosAnteriores( iIdPessoa, iIdBenef,
                            iIdTipoEmptmo, iIdTipoContrEmptmo : integer; dData, dDataAtualiza : TDateTime; sJoinPlano, sQuitavel : string ) : OleVariant;
var
  sSQL : String;
  cdsTemp, cdsCont : TCMClientDataSet;
begin
  sSQL :=
   '  SELECT DISTINCT ' +
   '     0 AS FLGESCOLHA, ' +
   '     0 AS FLGOBRIGATORIO, ' +
   '     CON.IDCONTRATOEMPTMO , CON.VLRCONTRATO, CON.DATACREDITO, CON.FLGFORMAREC, CON.DATAASSINATURA, ' +
   '     CON.IDINSCRICAOEMPTMO, CON.NUMPARCELAS, CON.IDTIPOCONTREMPTMO, CON.VLRPARCELA, CON.FLGSITUACAO, ' +
   '     CON.IDTIPOSUSPEMPTMO, CON.DATAINICIOSUSP, CON.DATAFIMSUSP, CON.FLGSUSPENSAOAUTO, CON.DATALIBSUSP, ' +
   '     CON.MOECODIGO, MOE.MOESIGLA, CON.IDPATRO, CON.IDPESSOA, CON.IDPLANOPREV, CON.IDBENEF, ' +
   '     CON.DATAPRIMPARC, TCE.TCEDESCRICAO, TCE.IDTIPOEMPTMO, TCE.TCEMINRENOVA, ' +
   '     SLD.HMESALDODEV, ' +
   '     NVL(PAR.NUMPARCPAGAS, 0) AS NUMPARCPAGAS, ' +
   '     0 AS VLRATUAL, ' +
   '     0 AS VLRDEVSEG, ' +
   '     NVL(VAL.VLRTOTAL, 0) AS VLREMABERTO, ' +
   '     ATU.ULT_PARC, ' +
   '     SIT.IDSITPART ' +
   ' ' +
   '  FROM ' +
   '     CONTRATOEMPTMO  CON, ' +
   '     PARTPREVPLAN    PPP, ' +
   '     MOEDA           MOE, ' +
   '     TIPOCONTREMPTMO TCE, ' +
   '     SITPART         SIT, ' +
   ' ' +
   '     ( ' +
   '     SELECT ' +
   '        H.IDCONTRATOEMPTMO, MAX(H.HMEPARCELA) AS ULT_PARC ' +
   '     FROM ' +
   '        HISTMOVEMPTMO H, ' +
   '        CONTRATOEMPTMO C ' +
   '     WHERE ' +
   '            ( C.IDPESSOA         = ' + IntToStr( iIdPessoa ) + ' ) ' +
   '        AND ( C.IDBENEF          = ' + IntToStr( iIdBenef  ) + ' ) ' +
   '        AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO ) ' +
   '     GROUP BY ' +
   '        H.IDCONTRATOEMPTMO ' +
   '     ) ATU, ' +
   '    ( ' +
   '    SELECT ' +
   '      COUNT(PAG.HMEPARCELA) AS NUMPARCPAGAS, ' +
   '      C.IDCONTRATOEMPTMO ' +
   '    FROM ' +
   '      CONTRATOEMPTMO C, ' +
   '      ( ' +
   '      SELECT ' +
   '        H.IDCONTRATOEMPTMO, ' +
   '        H.HMEPARCELA, ' +
   '           SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, H.HMEVLRPREVISTO, 0), 2)) - SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) AS TOTAL ' +
   '      FROM ' +
   '        HISTMOVEMPTMO H, ' +
   '           CONTRATOEMPTMO C ' +
   '        WHERE ' +
   '               ( H.HMECENTRALIZA    = 1 OR H.HMEDESTACADO = 1 ) ' +
   '           AND ( C.IDPESSOA         = ' + IntToStr( iIdPessoa ) + ' ) ' +
   '           AND ( C.IDBENEF          = ' + IntToStr( iIdBenef  ) + ' ) ' +
   '           AND ( C.FLGSITUACAO      NOT IN (''C'', ''Q'') ) ' +
   '           AND ( H.FLGSUSPENSAO     IS NULL OR H.FLGSUSPENSAO = 0 ) ' +
   '           AND ( H.FLGESTORNADO     IS NULL OR H.FLGESTORNADO = 0 ) ' +
   '           AND ( H.FLGABONADO       IS NULL OR H.FLGABONADO = 0 ) ' +
   '           AND ( H.HMETIPOMOV       = 1 ) ' +
   '           AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO ) ' +
   '      GROUP BY ' +
   '        H.IDCONTRATOEMPTMO, H.HMEPARCELA ' +
   '      HAVING ' +
   '               ( SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, HMEVLRPREVISTO, 0), 2)) - SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) = 0 ) ' +
   '        AND ( HMEPARCELA <> 0 ) ' +
   '      ) PAG ' +
   '     WHERE ' +
   '            ( C.IDPESSOA           = ' + IntToStr( iIdPessoa ) + ' ) ' +
   '        AND ( C.IDBENEF            = ' + IntToStr( iIdBenef  ) + ' ) ' +
   '        AND ( C.FLGSITUACAO        NOT IN (''C'', ''Q'') ) ' +
   '        AND ( C.IDCONTRATOEMPTMO   = PAG.IDCONTRATOEMPTMO(+) ) ' +
   '     GROUP BY ' +
   '        C.IDCONTRATOEMPTMO ' +
   '     ) PAR, ' +
   '    ( ' +
   '    SELECT ' +
   '      H.IDHISTMOVEMPTMO, H.HMESALDODEV, H.IDCONTRATOEMPTMO ' +
   '    FROM ' +
   '      HISTMOVEMPTMO H, ' +
   '        ( ' +
   '        SELECT ' +
   '           MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO ' +
   '        FROM ' +
   '           HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, ' +
   '           ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TCE ' +
   '        WHERE ' +
   '               ( CON.IDPESSOA           = ' + IntToStr( iIdPessoa ) + ' ) ' +
   '           AND ( CON.IDBENEF            = ' + IntToStr( iIdBenef  ) + ' ) ' +
   '           AND ( HME.HMEDATAATUALIZA   <= to_date( ''' + FormatDateTime( 'dd/mm/yyyy', dDataAtualiza ) + ''', ''DD/MM/YYYY'') ) ' +
   '           AND ( ITC.ITCTRATASALDODEV  <> 0 ) ' +
   '           AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NULL) ) ' +
   '           AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) ' +
   '           AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) ' +
   '           AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) ' +
   '           AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) ' +
   '           AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) ' +
   '        GROUP BY ' +
   '           HME.IDCONTRATOEMPTMO ' +
   '        ) ULT ' +
   '    WHERE ' +
   '            ( H.HMEDATAATUALIZA <= to_date( ''' + FormatDateTime( 'dd/mm/yyyy', dDataAtualiza ) + ''', ''DD/MM/YYYY'') ) ' +
   '      AND ( H.IDHISTMOVEMPTMO = ULT.IDHISTMOVEMPTMO ) ' +
   '    ) SLD, ' +
   '    ( ' +
   '    SELECT ' +
   '      SUM(H.HMEVLRPREVISTO) AS VLRTOTAL, H.IDCONTRATOEMPTMO ' +
   '    FROM ' +
   //Pendência 27888 - 09/05/2008
   //'      HISTMOVEMPTMO H, CONTRATOEMPTMO C ' +
   '      HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOSUSPEMPTMO TSE ' +
   //Fim Pendência 27888
   '    WHERE ' +
   '            ( C.IDPESSOA           =  ' + IntToStr( iIdPessoa ) + '  ) ' +
   '        AND ( C.IDBENEF            =  ' + IntToStr( iIdBenef  ) + '  ) ' +
   '        AND ( H.HMEDATAPREVISTA    <= to_date( ''' + FormatDateTime( 'dd/mm/yyyy', dData ) + ''', ''DD/MM/YYYY'') ) ' +
   '        AND ( H.HMETIPOMOV         NOT IN (0, 5, 8) ) ' +
   '        AND ( (H.HMEDATAEFETIVA    IS NULL) OR (H.HMEDATAEFETIVA > to_date( ''' + FormatDateTime( 'dd/mm/yyyy', dData ) + ''', ''DD/MM/YYYY'') ) ) ' +
   '        AND ( (H.HMEVLREFETIVO     IS NULL) OR (H.HMEDATAEFETIVA > to_date( ''' + FormatDateTime( 'dd/mm/yyyy', dData ) + ''', ''DD/MM/YYYY'') ) ) ' +
   '        AND ( (H.HMECENTRALIZA     = 1) OR (H.HMEDESTACADO   = 1) ) ' +
   '        AND ( (H.FLGQUITADO        IS NULL) OR (H.FLGQUITADO = 0) ) ' +
   '        AND ( (H.FLGABONADO        IS NULL) OR (H.FLGABONADO = 0) ) ' +
   '        AND ( (H.FLGESTORNADO      IS NULL) OR (H.FLGESTORNADO = 0) ) ' +
   '        AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO ) ' +
   //Pendência 27888 - 09/05/2008
   //'        AND ( ( C.IDTIPOSUSPEMPTMO   IS NULL AND (H.FLGSUSPENSAO IS NULL OR H.FLGSUSPENSAO = 0) ) ) ' +
   '        AND H.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+) ' +
   '        AND (NVL(H.FLGSUSPENSAO, 0) =  0 OR ' +
   '            (NVL(H.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1) ) ' +
   //Fim Pendência 27888
   ' ' +
   '     GROUP BY ' +
   '        H.IDCONTRATOEMPTMO ' +
   '    ) VAL ' +
   '  WHERE ' +
   '         ( CON.IDPESSOA            = ' + IntToStr( iIdPessoa ) + ' ) ' +
   '     AND ( CON.IDBENEF             = ' + IntToStr( iIdBenef  ) + ' ) ' +
//   '     AND ( TCE.IDTIPOEMPTMO        = ' + IntToStr( iIdTipoEmptmo ) + ' ) ' +
   '     AND ( CON.FLGSITUACAO         NOT IN (''C'', ''Q'') ) ' +
   '     AND ( VAL.VLRTOTAL > 0        OR SLD.HMESALDODEV > 0 ) ' +
   '     AND ( PPP.IDPESSOA            = CON.IDPESSOA ) ' +
   ' ' +
   '     AND ( ' + QuotedStr( sJoinPlano ) + ' IS NOT NULL OR ( ' + QuotedStr( sJoinPlano ) + ' IS NULL AND PPP.IDPLANOPREV = CON.IDPLANOPREV) ) ' +
   ' ' +
   '     AND ( ' + QuotedStr( sQuitavel ) + ' IS NULL OR CON.IDTIPOCONTREMPTMO IN ' +
   '                                               ( ' +
   '                                               SELECT ' +
   '                                                   IDTIPOCONTRQUIT ' +
   '                                               FROM ' +
   '                                                   TIPOCONTRXQUIT ' +
   '                                               WHERE ' +
   '                                                   IDTIPOCONTREMPTMO = ' + IntToStr( iIdTipoContrEmptmo ) +
   '                                               ) ' +
   '         ) ' +
   ' ' +
   '     AND ( SIT.IDSITPART           = PPP.IDSITPART ) ' +
   '     AND ( CON.IDCONTRATOEMPTMO    = PAR.IDCONTRATOEMPTMO(+) ) ' +
   '     AND ( CON.IDCONTRATOEMPTMO    = SLD.IDCONTRATOEMPTMO(+) ) ' +
   '     AND ( CON.IDCONTRATOEMPTMO    = VAL.IDCONTRATOEMPTMO(+) ) ' +
   '     AND ( CON.IDCONTRATOEMPTMO    = ATU.IDCONTRATOEMPTMO(+) ) ' +
   '     AND ( CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO ) ' +
   '     AND ( CON.MOECODIGO           = MOE.MOECODIGO(+) ) ' +
   '     AND PPP.FLGDESATIVADO         = 0 ' ;

   // Marca quitaçoes obrigatorias - AutoEmprestimo
   try
      cdsTemp := TCMClientDataSet.Create( nil );
      cdsCont := TCMClientDataSet.Create( nil );

      cdsCont.Data := GetDataPacket( sSQL );

      //Pendência 26951 - 07/12/2007
      cdsCont.Data := CopyClientDataSet( cdsCont );
      //Fim Pendência 26951

      if (not cdsCont.isEmpty) and (iIdTipoContrEmptmo > 0) then begin
         while not cdsCont.Eof do begin
            sSQL := 'SELECT NVL(FLGOBRIGATORIO,0) AS FLGOBRIGATORIO '+#13+
                    '  FROM TIPOCONTRXQUIT  '+#13+
                    ' WHERE IDTIPOCONTREMPTMO = ' + IntToStr( iIdTipoContrEmptmo ) +#13+
                    '   AND IDTIPOCONTRQUIT   = ' + cdsCont.FieldByName('IDTIPOCONTREMPTMO').AsString;
            cdsTemp.Data := GetDataPacket( sSQL );

            if cdsTemp.FieldByName('FLGOBRIGATORIO').AsInteger = 1 then begin
               cdsCont.Edit;
               cdsCont.FieldByName('FLGOBRIGATORIO').AsInteger := 1;
               cdsCont.FieldByName('FLGESCOLHA').AsInteger     := 1;
               cdsCont.Post;
            end;

            cdsCont.Next;
         end;
      end;

      Result := cdsCont.Data;
   finally
      cdsTemp.Free;
      cdsCont.Free;
   end;
end; {ContratosAnteriores}



//Recupera itens de empréstimos em aberto
function TCtrlWebEmprestimo.ItensEmAberto_uCalc( iIdContratoEmptmo: extended; iFiltroData, iFiltroMes : integer;
                                                 dDataVencto : TDateTime; iAnoCobranca, iMesCobranca : integer ): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
    ' SELECT /*+INDEX(HME XIE29HISTMOVEMPTMO) */ ' +
    '  HME.IDCONTRATOEMPTMO, HME.IDHISTMOVEMPTMO, ' +
    '  HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, ' +
    '  HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEVLRPREVISTO ' +
    ' FROM ' +
    '    HISTMOVEMPTMO HME ' +
    ' WHERE ' +
    '        ( HME.IDCONTRATOEMPTMO = ' + FloatToStr( iIdContratoEmptmo ) + ' ) ' +
    '    AND ( HME.HMETIPOMOV       NOT IN (0, 5, 8) ) ' +
    '    AND HME.FLGBAIXADO           = 0 ' +
    '    AND HME.HMEDATAEFETIVA       IS NULL ' +
    '    AND HME.HMEVLREFETIVO        IS NULL ' +
    '    AND HME.HMEVLRPREVISTO      <> 0 ' +
    '    AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1) ' +
    '    AND NVL(HME.FLGESTORNADO, 0) = 0 ' +
    '    AND NVL(HME.FLGSUSPENSAO, 0) = 0 ' +
    '    AND NVL(HME.FLGQUITADO, 0)   = 0 ' +
    '    AND NVL(HME.FLGABONADO, 0)   = 0 ' ;

   if iFiltroData > 0 then
    sSQL := sSQL +
     '    AND HME.HMEDATAVENCTO < to_date( ''' + FormatDateTime('dd/mm/yyyy', dDataVencto ) + ''', ''DD/MM/YYYY'') ';

   if iFiltroMes > 0 then
    sSQL := sSQL +
     '    AND ( HME.HMEMESCOBRANCA <> ' + IntToStr( iMesCobranca ) + ' OR HME.HMEANOCOBRANCA <> ' + IntToStr( iAnoCobranca ) + ' ) ';

  Result := GetDataPacket( sSQL );
end; {ItensEmAberto}



//Calcula itens de quitação
function TCtrlWebEmprestimo.CalculaItensQuitacao( const rContrato    : TDadosContrato;
                                                  iIdEmpresaProp     ,
                                                  iIdTipoEmptmo      ,
                                                  iIdTipoContrEmptmo : integer;
                                                  iOrigem,
                                                  iIDITEMPROVPERDA   : integer;
                                                  dDataQuit          ,
                                                  dDataMorte         ,
                                                  dDataAssinatura    : TDateTime;
                                                  bFlgExcepcional,
                                                  bFinanciamento     : boolean;
                                                  iFlgAbonoDiverg    : integer;
                                                  iTipoCliente       : integer;
                                                  var   vLista       : TListaItem ) : boolean;
var
  cdsParametros    ,
  cdsItensQuitacao ,
  cdsItens         ,
  cdsParcelas      ,
  cdsParcelasAVencer,
  cdsTipoContrato  : TCMClientDataSet;

  iEvento : integer;
  iPais,
  iCidade,
  iEstado,
  iFlgCalcDia,
  iFlgSaldoDevAnt : integer;
  sEstado : String;
  sValor                  : String;
  bTransacao : Boolean;

  fNovoSaldoDev           : Real;
  fVlrProvPerda           : Currency;

  rSaldosAntPos           : TSaldosAntPos;
  vSQL                    : array of String;
  sSql, sSqlExec          : String;
  i, j, k, iContador      : Integer;
  bCabecalho              : Boolean;
  sCabecalho              : String;

  iQuantAberto   ,
  iNumParcPagas  ,
  iNumParcelas   ,
  iNumParcRest   : integer;
begin
  iEvento := 3;

  Result := False;

  //Define os parâmetros que serão passados para a regra
  iPais    := -1;
  iCidade  := -1;
  iEstado  := -1;
  sEstado  := '';

  //Criação dos clientdatasets utilizados
  cdsParametros      := TCMClientDataSet.Create( nil );
  cdsItensQuitacao   := TCMClientDataSet.Create( nil );
  cdsItens           := TCMClientDataSet.Create( nil );
  cdsParcelas        := TCMClientDataSet.Create( nil );
  cdsTipoContrato    := TCMClientDataSet.Create( nil );
  cdsParcelasAVencer := TCMClientDataSet.Create( nil );
  try
    cdsParametros.Data := ParametrosEmprestimo( iIdEmpresaProp );
    if not cdsParametros.IsEmpty then
    begin
      iPais           := cdsParametros.FieldByName('IDPAIS').AsInteger;
      iCidade         := cdsParametros.FieldByName('IDCIDADES').AsInteger;
      iEstado         := StrToInt( trim( cdsParametros.FieldByName('IDESTADO').AsString ) );
      sEstado         := trim( cdsParametros.FieldByName('CODESTADO').AsString );
      iFlgCalcDia     := cdsParametros.FieldByName('FLGCALCDIA').AsInteger;
      iFlgSaldoDevAnt := cdsParametros.FieldByName('FLGSALDODEVANT').AsInteger;
    end;

    bTransacao := False;
    i          := 0;
    k          := 0;
    sSql       := '';

    sValor    := '0';

    //Testa número mínimo de parcelas pagas para quitação
    cdsParcelas.Data := GetDataPacket(
         'SELECT '                                                                              + #13 +
         '  CNT.NUMPARCELAS, '                                                                  + #13 +
         '  HME.HMENUMPARCELAS, '                                                               + #13 +
         '  COUNT(PAG.HMEPARCELA) AS NUMPARCPAGAS '                                             + #13 +
         'FROM '                                                                                + #13 +
         '  HISTMOVEMPTMO HME, '                                                                + #13 +
         '  CONTRATOEMPTMO CNT, '                                                               + #13 +
         '  TIPOCONTREMPTMO TIP, '                                                              + #13 +
         '  ( '                                                                                 + #13 +
         '  SELECT '                                                                            + #13 +
         '     H.IDCONTRATOEMPTMO, H.HMEPARCELA, '                                              + #13 +
         '     SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, H.HMEVLRPREVISTO, 0), 2)) - '              +
              'SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) AS TOTAL '                                + #13 +
         '  FROM '                                                                              + #13 +
         '     HISTMOVEMPTMO H, '                                                               + #13 +
         '     CONTRATOEMPTMO C '                                                               + #13 +
         '  WHERE '                                                                             + #13 +
         '         ( C.IDPESSOA           = ' + IntToStr(rContrato.IDPessoa) + ' ) '            + #13 +
         '     AND ( C.IDBENEF            = ' + IntToStr(rContrato.IDBenef) + ' ) '             + #13 +
         '     AND ( H.HMECENTRALIZA      = 1 OR H.HMEDESTACADO = 1 ) '                         + #13 +
         '     AND ( C.FLGSITUACAO        NOT IN (''C'',''Q'') ) '                              + #13 +
         '     AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO ) '                              + #13 +
         '  GROUP BY '                                                                          + #13 +
         '     H.IDCONTRATOEMPTMO, H.HMEPARCELA '                                               + #13 +
         '  HAVING '                                                                            + #13 +
         '         ( SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, HMEVLRPREVISTO, 0), 2)) - '          +
                    'SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) = 0 ) '                             + #13 +
         '     AND ( H.HMEPARCELA <> 0 ) '                                                      + #13 +
         '  ) PAG, '                                                                            + #13 +

         '  ( '                                                                                 + #13 +
         '  SELECT '                                                                            + #13 +
         '     MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                                        + #13 +
         '  FROM '                                                                              + #13 +
         '     HISTMOVEMPTMO '                                                                  + #13 +
         '  WHERE '                                                                             + #13 +
         '         ( IDCONTRATOEMPTMO     = ' + FormatFloat('#0', rContrato.IDContratoEmptmo) + ' ) '    + #13 +
         '     AND ( HMECENTRALIZA        = 1 OR HMEDESTACADO = 1 ) '                           + #13 +
         '     AND ( HMETIPOMOV          <> 5 ) '                                               + #13 +
         '  ) HST '                                                                             + #13 +

         'WHERE '                                                                               + #13 +
         '      ( CNT.IDPESSOA            = ' + IntToStr(rContrato.IDPessoa) + ' ) '            + #13 +
         '  AND ( CNT.IDBENEF             = ' + IntToStr(rContrato.IDBenef) + ' ) '             + #13 +
         '  AND ( CNT.IDTIPOCONTREMPTMO   = ' + IntToStr(rContrato.IDTipoContrEmptmo) + ' ) '   + #13 +
         '  AND ( CNT.FLGSITUACAO         NOT IN (''C'',''Q'') ) '                              + #13 +
         '  AND ( CNT.IDCONTRATOEMPTMO    = PAG.IDCONTRATOEMPTMO(+) ) '                         + #13 +
         '  AND ( CNT.IDTIPOCONTREMPTMO   = TIP.IDTIPOCONTREMPTMO ) '                           + #13 +
         '  AND ( HME.IDHISTMOVEMPTMO     = HST.IDHISTMOVEMPTMO ) '                             + #13 +
         'GROUP BY '                                                                            + #13 +
         '  CNT.NUMPARCELAS, HME.HMENUMPARCELAS ' );

    iQuantAberto   := 0;
    iNumParcPagas  := 0;
    iNumParcelas   := 0;
    iNumParcRest   := 0;

    //Se a query estiver vazia, passa os valores zerados
    if not( cdsParcelas.IsEmpty ) then
    begin
      if not( cdsParcelas.FieldByName('NUMPARCPAGAS').IsNull   ) then iNumParcPagas  := cdsParcelas.FieldByName('NUMPARCPAGAS').AsInteger;
      if not( cdsParcelas.FieldByName('NUMPARCELAS').IsNull    ) then iNumParcelas   := cdsParcelas.FieldByName('NUMPARCELAS').AsInteger;
      if not( cdsParcelas.FieldByName('HMENUMPARCELAS').IsNull ) then iNumParcRest   := cdsParcelas.FieldByName('HMENUMPARCELAS').AsInteger;
    end;


    cdsTipoContrato.Data := LookTipoContrato( iIdEmpresaProp, 0, iIdTipoContrEmptmo );

    if ( iOrigem = 3 ) and ( iNumParcPagas < cdsTipoContrato.FieldByName('TCEMINQUIT').AsInteger ) then
      raise Exception.Create( 'Número de Parcelas pagas inferior ao permitido para quitação.' );

    cdsParcelas.Close;
    cdsTipoContrato.Close;

    // Busca total da provisão para perdas
    fVlrProvPerda := 0;
    if not iIDITEMPROVPERDA > 0 then
    begin
      fVlrProvPerda := TotalizaProvPerda( rContrato.IDContratoEmptmo, iIDITEMPROVPERDA );
    end;


    try

      //Início da Transacao
      if not InTransaction then
      begin
        bTransacao := True;
        StartTransaction;
      end;


      //Abertura da query dos itens de Quitação
      cdsItensQuitacao.Data := BuscaItens( rContrato.IDTipoContrEmptmo, 3 );
      cdsItensQuitacao.First;

      if ( iOrigem = 8 ) and ( ( iTipoCliente = 19971 ) or ( iTipoCliente = 19991 ) ) then
      begin

        // busca os saldos devedores (Anterior e "Posterior")
        rSaldosAntPos := BuscaSaldosAntPos( rContrato.IDContratoEmptmo,
                                            dDataMorte, iFlgSaldoDevAnt, iFlgCalcDia
                                            );

        // Saldo Devedor
        fNovoSaldoDev := rSaldosAntPos.fSaldoDevPos;

        if bFlgExcepcional then fNovoSaldoDev := rSaldosAntPos.fSaldoDevAnt;

        // Monta a linha do SQL que conterá o Saldo Devedor na Morte
        SetLength(vSQL, i + 1);

        sSQL := // '/* -------------- Saldo Devedor Anterior ----------------------------------------- */ ' + #13 +
        'SELECT '                                                                                                      +
        '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                             +  ' AS IDCONTRATOEMPTMO, '   +
        '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                     +  ' AS IDTIPOCONTREMPTMO, '  +
        '  ' + IntToStr(rContrato.IDTipoEmptmo)                                          +  ' AS IDTIPOEMPTMO, '       +
        '  ' + IntToStr(rContrato.IDPlanoPrev)                                           +  ' AS IDPLANOPREV, '        +
        '  ' + IntToStr(rContrato.IDPatro)                                               +  ' AS IDPESSJUR, '          +
        '  ' + IntToStr(rContrato.IDSitPart)                                             +  ' AS IDSITPART, '          +
        '  ' + IntToStr(rContrato.IdPessoa)                                              +  ' AS IDPESSOA,  '          ;

        if bFinanciamento then sSQL := sSQL +
        '  1'                                                                            + ' AS FLGFINANCIAMENTO, '
        else sSQL := sSQL +
        '  0'                                                                            + ' AS FLGFINANCIAMENTO, ';

        sSQL := sSQL +
        //Pendência 22836 - 03/10/2006
        '  00'                                                                           +  ' AS FLGEXCEPCIONAL, '     +
        //Fim Pendência 22836

        '  ' + QuotedStr( NullToSpace( rContrato.SiglaIndexador) )                       +  ' AS NOMEINDICE, '         +

        '  ' + ConverteVirgulaParaPonto(rContrato.fValMargem)                            +  ' AS MARGEM, '             +
        '  ' + ConverteVirgulaParaPonto(rContrato.fValReserva)                           +  ' AS RESERVA, '            +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao)))   +  ' AS DATAINSC, '           +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataCredito)))     +  ' AS DATACREDITO, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura)))  +  ' AS DATAASSIN, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc)))    +  ' AS DATAPRIMPARC, '       +

        '  ' + IntToStr(iPais)                                                           +  ' AS IDPAIS, '             +
        '  ' + QuotedStr( NullToSpace( sEstado) )                                        +  ' AS CODESTADO, '          +
        '  ' + IntToStr(iCidade)                                                         +  ' AS IDCIDADES, '          +

        '  -3'                                                                           +  ' AS ORDENACAO, '          +
        '  0' + IntToStr(Trunc(rSaldosAntPos.dDataAtuPos))                               +  ' AS DATAORDENACAO, '      +

        '  -3'                                                                           +  ' AS IDITEMEMPTMO, '       +
        '  -3'                                                                           +  ' AS EVENTOITEM, '         +
        '  -3'                                                                           +  ' AS ORIGEMITEM, '         +
        '  ' + IntToStr(iEvento)                                                         +  ' AS EVENTO, '             +
        '  ' + IntToStr(iOrigem)                                                         +  ' AS ORIGEM, '             +
        '  -3'                                                                           +  ' AS SEQCALCULO, '         +

        '  ' + IntToStr(rSaldosAntPos.iParcelaAnt)                                       +  ' AS PARCATUAL, '          +
        ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                     +  ' AS NUMPARCELAS, '        +

        '  -3'                                                                           +  ' AS CENTRALIZA, '         +
        '  -3'                                                                           +  ' AS DESTACADO, '          +

        '  0'                                                                            +  ' AS FLGENVIO, '           +
        '  0'                                                                            +  ' AS FLGBAIXADO, '         +
        '  0'                                                                            +  ' AS FLGESTORNADO, '       +
        '  0'                                                                            +  ' AS FLGABONADO, '         +
        '  ''0'''                                                                        +  ' AS FLGFORMACOB, '        +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataQuit)))         +  ' AS DATAEVENTO, '         +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataMorte)))        +  ' AS DATAMORTE, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataAssinatura)))   +  ' AS DATASOLNOVO, '          +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt)))+  ' AS DATAPREVISTA, '       +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt)))+  ' AS DATAEFETIVA, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt)))+  ' AS DATAATUALIZA, '       +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt)))+  ' AS DATAVENCTO, '         +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuAnt)))    +  ' AS COMPETENCIA, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuAnt)))    +  ' AS COBRANCA, '           +

      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevAnt)                      +  ' AS VLRPREVISTO, '        +
      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevAnt)                      +  ' AS VLREFETIVO, '         +
      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevAnt)                      +  ' AS SALDODEV, '           +
      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevPos)                      +  ' AS SALDODEVPOS, '        +
      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fTxJurosAnt)                       +  ' AS TXJUROS, '            +

      '  ' + ConverteVirgulaParaPonto(fVlrProvPerda)                                   +  ' AS VLRPROVPERDA, '       +

      '  ' + IntToStr( iQuantAberto  )                                                 +  ' AS QUANTITEMABERTO, '    +
      '  ' + IntToStr( iNumParcPagas )                                                 +  ' AS NUMPARCPAGAS, '       +
      '  ' + IntToStr( iNumParcelas  )                                                 +  ' AS PRAZOANT, '           +
      '  ' + IntToStr( iNumParcRest  )                                                 +  ' AS PRAZOREST, '          +
      // SOL194557  KTN 1862527 Otacilio
      ' 0'                                                                             +  ' AS FLGSUSPENSAO, -1 AS OPERACAO, -1 AS SITENVIO '        +
      'FROM '                                                                                                        +
      '  DUAL ';

        vSQL[i] := sSQL;  // armazeno SQL montado no vetor
        inc(i);           // incrementa a variável de índice do vetor
      end;  // if iOrigem = 8

      // ----------------------------------------------------------------------------------------

      // busca os saldos devedores (Anterior e "Posterior"
      rSaldosAntPos := BuscaSaldosAntPos( rContrato.IDContratoEmptmo, dDataQuit,
                       iFlgSaldoDevAnt, iFlgCalcDia, True );


      // Saldo Devedor
      fNovoSaldoDev := rSaldosAntPos.fSaldoDevPos;

      if bFlgExcepcional then
        fNovoSaldoDev := rSaldosAntPos.fSaldoDevAnt;

      // Monta PRIMEIRA LINHA do Saldo Devedor Anterior
      SetLength(vSql, i + 1);

      sSql := {'/* -------------- Saldo Devedor Anterior ----------------------------------------- */ ' + #13 +}
      'SELECT '                                                                                                      +
      '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                             +  ' AS IDCONTRATOEMPTMO, '   +
      '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                     +  ' AS IDTIPOCONTREMPTMO, '  +
      '  ' + IntToStr(rContrato.IDTipoEmptmo)                                          +  ' AS IDTIPOEMPTMO, '       +
      '  ' + IntToStr(rContrato.IDPlanoPrev)                                           +  ' AS IDPLANOPREV, '        +
      '  ' + IntToStr(rContrato.IDPatro)                                               +  ' AS IDPESSJUR, '          +
      '  ' + IntToStr(rContrato.IDSitPart)                                             +  ' AS IDSITPART, '          +
      '  ' + IntToStr(rContrato.IdPessoa)                                              +  ' AS IDPESSOA,  '          ;


      if bFinanciamento then sSQL := sSQL +
      '  1'                                                                            + ' AS FLGFINANCIAMENTO, '
      else sSQL := sSQL +
      '  0'                                                                            + ' AS FLGFINANCIAMENTO, ';

      sSQL := sSQL +
      //Pendência 22836 - 03/10/2006
      '  00'                                                                           +  ' AS FLGEXCEPCIONAL, '     +
      //Fim Pendência 22836

      '  ' + QuotedStr( NullToSpace( rContrato.SiglaIndexador) )                       +  ' AS NOMEINDICE, '         +

      '  ' + ConverteVirgulaParaPonto(rContrato.fValMargem)                            +  ' AS MARGEM, '             +
      '  ' + ConverteVirgulaParaPonto(rContrato.fValReserva)                           +  ' AS RESERVA, '            +

      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao)))   +  ' AS DATAINSC, '           +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataCredito)))     +  ' AS DATACREDITO, '        +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura)))  +  ' AS DATAASSIN, '          +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc)))    +  ' AS DATAPRIMPARC, '       +

      '  ' + IntToStr(iPais)                                                           +  ' AS IDPAIS, '             +
      '  ' + QuotedStr( NullToSpace( sEstado) )                                        +  ' AS CODESTADO, '          +
      '  ' + IntToStr(iCidade)                                                         +  ' AS IDCIDADES, '          +

      '-2'                                                                             +  ' AS ORDENACAO, '          +
      '0'  + IntToStr( Trunc( rSaldosAntPos.dDataAtuPos ) )                            +  ' AS DATAORDENACAO, '      +

      '  -1'                                                                           +  ' AS IDITEMEMPTMO, '       +
      '  -1'                                                                           +  ' AS EVENTOITEM, '         +
      '  -1'                                                                           +  ' AS ORIGEMITEM, '         +
      '  ' + IntToStr(iEvento)                                                         +  ' AS EVENTO, '             +
      '  ' + IntToStr(iOrigem)                                                         +  ' AS ORIGEM, '             +
      '  -1'                                                                           +  ' AS SEQCALCULO, '         +

      '  ' + IntToStr(rSaldosAntPos.iParcelaAnt)                                       +  ' AS PARCATUAL, '          +
      ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                     +  ' AS NUMPARCELAS, '        +

      '  -1'                                                                           +  ' AS CENTRALIZA, '         +
      '  -1'                                                                           +  ' AS DESTACADO, '          +

      '  0'                                                                            +  ' AS FLGENVIO, '           +
      '  0'                                                                            +  ' AS FLGBAIXADO, '         +
      '  0'                                                                            +  ' AS FLGESTORNADO, '       +
      '  0'                                                                            +  ' AS FLGABONADO, '         +
      '  ''0'''                                                                        +  ' AS FLGFORMACOB, '        +

      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataQuit)))         +  ' AS DATAEVENTO, '         +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataMorte)))        +  ' AS DATAMORTE, '          +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataAssinatura)))   +  ' AS DATASOLNOVO, '        +

      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt)))  +  ' AS DATAPREVISTA, '       +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt)))  +  ' AS DATAEFETIVA, '        +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt)))  +  ' AS DATAATUALIZA, '       +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuAnt)))  +  ' AS DATAVENCTO, '         +

      '  ' + QuotedStr( NullToSpace( FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuAnt)))      +  ' AS COMPETENCIA, '        +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuAnt)))      +  ' AS COBRANCA, '           +

      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevAnt)                      +  ' AS VLRPREVISTO, '        +
      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevAnt)                      +  ' AS VLREFETIVO, '         +
      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevAnt)                      +  ' AS SALDODEV, '           +
      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevPos)                      +  ' AS SALDODEVPOS, '        +
      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fTxJurosAnt)                       +  ' AS TXJUROS, '            +

      '  ' + ConverteVirgulaParaPonto(fVlrProvPerda)                                   +  ' AS VLRPROVPERDA, '       +

      '  ' + IntToStr( iQuantAberto  )                                                 +  ' AS QUANTITEMABERTO, '    +
      '  ' + IntToStr( iNumParcPagas )                                                 +  ' AS NUMPARCPAGAS, '       +
      '  ' + IntToStr( iNumParcelas  )                                                 +  ' AS PRAZOANT, '           +
      '  ' + IntToStr( iNumParcRest  )                                                 +  ' AS PRAZOREST, '          +
	  // SOL194557  KTN 1862527 Otacilio
      ' 0'                                                                             +  ' AS FLGSUSPENSAO, -1 AS OPERACAO, -1 AS SITENVIO '  +
      'FROM '                                                                                                        +
      '  DUAL ';

      //Armazeno SQL montado no vetor
      vSql[i] := sSql;
      //Incrementa a variável de índice do vetor
      inc(i);

      // Monta a SEGUNDA linha do SQL (linha do Saldo Devedor "Posterior")
      SetLength(vSql, i + 1);

      sSql := {'/* -------------- Saldo Devedor "Posterior" -------------------------------------- */ ' +}
      'SELECT '                                                                                                      +
      '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                             +  ' AS IDCONTRATOEMPTMO, '   +
      '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                     +  ' AS IDTIPOCONTREMPTMO, '  +
      '  ' + IntToStr(rContrato.IDTipoEmptmo)                                          +  ' AS IDTIPOEMPTMO, '       +
      '  ' + IntToStr(rContrato.IDPlanoPrev)                                           +  ' AS IDPLANOPREV, '        +
      '  ' + IntToStr(rContrato.IDPatro)                                               +  ' AS IDPESSJUR, '          +
      '  ' + IntToStr(rContrato.IDSitPart)                                             +  ' AS IDSITPART, '          +
      '  ' + IntToStr(rContrato.IdPessoa)                                              +  ' AS IDPESSOA,  '          ;

      if bFinanciamento then sSQL := sSQL +
      '  1'                                                                            + ' AS FLGFINANCIAMENTO, '
      else sSQL := sSQL +
      '  0'                                                                            + ' AS FLGFINANCIAMENTO, ';

      sSQL := sSQL +
      //Pendência 22836 - 03/10/2006
      '  00'                                                                           +  ' AS FLGEXCEPCIONAL, '     +
      //Fim Pendência 22836

      '  ' + QuotedStr( NullToSpace( rContrato.SiglaIndexador))                        +  ' AS NOMEINDICE, '         +

      '  ' + ConverteVirgulaParaPonto(rContrato.fValMargem)                            +  ' AS MARGEM, '             +
      '  ' + ConverteVirgulaParaPonto(rContrato.fValReserva)                           +  ' AS RESERVA, '            +

      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao)))  +  ' AS DATAINSC, '           +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataCredito)))    +  ' AS DATACREDITO, '        +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))) +  ' AS DATAASSIN, '          +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc)))   +  ' AS DATAPRIMPARC, '       +

      '  ' + IntToStr(iPais)                                                           +  ' AS IDPAIS, '             +
      '  ' + QuotedStr( NullToSpace( sEstado))                                         +  ' AS CODESTADO, '          +
      '  ' + IntToStr(iCidade)                                                         +  ' AS IDCIDADES, '          +

      '-1'                                                                             +  ' AS ORDENACAO, '          +
      ' 0' + IntToStr(Trunc(rSaldosAntPos.dDataAtuPos))                                +  ' AS DATAORDENACAO, '      +

      '  -2'                                                                           +  ' AS IDITEMEMPTMO, '       +
      '  -2'                                                                           +  ' AS EVENTOITEM, '         +
      '  -2'                                                                           +  ' AS ORIGEMITEM, '         +
      '  ' + IntToStr(iEvento)                                                         +  ' AS EVENTO, '             +
      '  ' + IntToStr(iOrigem)                                                         +  ' AS ORIGEM, '             +
      '  -2'                                                                           +  ' AS SEQCALCULO, '         +

      '  ' + IntToStr(rSaldosAntPos.iParcelaPos)                                       +  ' AS PARCATUAL, '          +
      ' 0' + IntToStr(rSaldosAntPos.iParcRestaPos)                                     +  ' AS NUMPARCELAS, '        +

      '  -2'                                                                           +  ' AS CENTRALIZA, '         +
      '  -2'                                                                           +  ' AS DESTACADO, '          +

      '  0'                                                                            +  ' AS FLGENVIO, '           +
      '  0'                                                                            +  ' AS FLGBAIXADO, '         +
      '  0'                                                                            +  ' AS FLGESTORNADO, '       +
      '  0'                                                                            +  ' AS FLGABONADO, '         +
      '  ''0'''                                                                        +  ' AS FLGFORMACOB, '        +

      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataQuit)))         +  ' AS DATAEVENTO, '         +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataMorte)))        +  ' AS DATAMORTE, '          +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataAssinatura)))   +  ' AS DATASOLNOVO, '          +

      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))) +  ' AS DATAPREVISTA, '       +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))) +  ' AS DATAEFETIVA, '        +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))) +  ' AS DATAATUALIZA, '       +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos))) +  ' AS DATAVENCTO, '         +

      '  ' + QuotedStr( NullToSpace( FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuPos)))     +  ' AS COMPETENCIA, '        +
      '  ' + QuotedStr( NullToSpace( FormatDateTime('YYYYMM', rSaldosAntPos.dDataAtuPos)))     +  ' AS COBRANCA, '           +

      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevPos)                      +  ' AS VLRPREVISTO, '        +
      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevPos)                      +  ' AS VLREFETIVO, '         +
      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevPos)                      +  ' AS SALDODEV, '           +
      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevPos)                      +  ' AS SALDODEVPOS, '        +
      '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fTxJurosPos)                       +  ' AS TXJUROS, '            +

      '  ' + ConverteVirgulaParaPonto(fVlrProvPerda)                                   +  ' AS VLRPROVPERDA, '       +

      '  ' + IntToStr( iQuantAberto  )                                                 +  ' AS QUANTITEMABERTO, '    +
      '  ' + IntToStr( iNumParcPagas )                                                 +  ' AS NUMPARCPAGAS, '       +
      '  ' + IntToStr( iNumParcelas  )                                                 +  ' AS PRAZOANT, '           +
      '  ' + IntToStr( iNumParcRest  )                                                 +  ' AS PRAZOREST, '          +
	  // SOL194557  KTN 1862527 Otacilio
      ' 0'                                                                             +  ' AS FLGSUSPENSAO, -1 AS OPERACAO, -1 AS SITENVIO ' + 
      'FROM '                                                                                                        +
      '  DUAL ';

      // armazeno SQL montado no vetor
      vSql[i] := sSql;

      // incrementa a variável de índice do vetor
      inc(i);


      // Monta as linhas dos itens DE CONCESSÃO

      cdsItens.Close;
      cdsItens.Data := ItensEmprestimo( rContrato.IDContratoEmptmo, 0, -1, -1, -1, -1,
                              0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0 );

      cdsItens.First;
      bCabecalho := True;

      while not cdsItens.Eof do
      begin
        sCabecalho := '';
        if bCabecalho then
          bCabecalho := False;

        //array dinâmico
        SetLength( vSql, i + 1 );

        sSql := sCabecalho +
        'SELECT '                                                                                                   +
        '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   +
        '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  +
        '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       +
        '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        +
        '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          +
        '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          +
        '  ' + IntToStr(rContrato.IdPessoa)                                           +  ' AS IDPESSOA,  '          ;

        if bFinanciamento then sSQL := sSQL +
        '  1'                                                                         + ' AS FLGFINANCIAMENTO, '
        else sSQL := sSQL +
        '  0'                                                                         + ' AS FLGFINANCIAMENTO, ';

        sSQL := sSQL +
        //Pendência 22836 - 03/10/2006
        '  00'                                                                        +  ' AS FLGEXCEPCIONAL, '     +
        //Fim Pendência 22836

        '  ' + QuotedStr( NullToSpace( rContrato.SiglaIndexador))                     +  ' AS NOMEINDICE, '         +

        '  ' + ConverteVirgulaParaPonto(rContrato.fValMargem)                         +  ' AS MARGEM, '             +
        '  ' + ConverteVirgulaParaPonto(rContrato.fValReserva)                        +  ' AS RESERVA, '            +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao)))      +  ' AS DATAINSC, '           +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataCredito)))        +  ' AS DATACREDITO, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura)))     +  ' AS DATAASSIN, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc)))       +  ' AS DATAPRIMPARC, '       +

        '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             +
        '  ' + QuotedStr( NullToSpace( sEstado))                                      +  ' AS CODESTADO, '          +
        '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          +

        ' 0'                                                                          +  ' AS ORDENACAO, '           +
        ' 0' + IntToStr(Trunc(cdsItens.FieldByName('HMEDATAPREVISTA').AsDateTime))    +  ' AS DATAORDENACAO, '       +

        '  ' + cdsItens.FieldByName('IDITEMEMPTMO').AsString                          +  ' AS IDITEMEMPTMO, '       +
        '  ' + cdsItens.FieldByName('HMETIPOMOV').AsString                            +  ' AS EVENTOITEM, '         +
        '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         +
        '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             +
        '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             +
        ' 0'                                                                          +  ' AS SEQCALCULO, '         +

        '  ' + cdsItens.FieldByName('HMEPARCELA').AsString                            +  ' AS PARCATUAL, '          +
        ' 0' + cdsItens.FieldByName('HMENUMPARCELAS').AsString                        +  ' AS NUMPARCELAS, '        +

        '  ' + cdsItens.FieldByName('HMECENTRALIZA').AsString                         +  ' AS CENTRALIZA, '         +
        '  ' + cdsItens.FieldByName('HMEDESTACADO').AsString                          +  ' AS DESTACADO, '          +

        '  ' + cdsItens.FieldByName('FLGENVIO').AsString                              +  ' AS FLGENVIO, '           +
        '  ' + cdsItens.FieldByName('FLGBAIXADO').AsString                            +  ' AS FLGBAIXADO, '         +
        '  ' + cdsItens.FieldByName('FLGESTORNADO').AsString                          +  ' AS FLGESTORNADO, '       +
        '  ' + cdsItens.FieldByName('FLGABONADO').AsString                            +  ' AS FLGABONADO, '         +
        '  ' + QuotedStr( NullToSpace( cdsItens.FieldByName('HMEFORMACOBRANCA').AsString)) +  ' AS FLGFORMACOB, '   +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataQuit)))      +  ' AS DATAEVENTO, '         +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataMorte)))     +  ' AS DATAMORTE, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataAssinatura)))+  ' AS DATASOLNOVO, '        +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAPREVISTA').AsDateTime)))+  ' AS DATAPREVISTA, '    +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAEFETIVA').AsDateTime)))  +  ' AS DATAEFETIVA, '     +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAATUALIZA').AsDateTime))) +  ' AS DATAATUALIZA, '    +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAVENCTO').AsDateTime)))   +  ' AS DATAVENCTO, '      +

        '  ' + QuotedStr( NullToSpace( FormatFloat('0000', cdsItens.FieldByName('HMEANOCOMPETENCIA').AsFloat)            +
               FormatFloat('00', cdsItens.FieldByName('HMEMESCOMPETENCIA').AsFloat)))                       +  ' AS COMPETENCIA, ' +
        '  ' + QuotedStr( NullToSpace( FormatFloat('0000', cdsItens.FieldByName('HMEANOCOBRANCA').AsFloat)               +
               FormatFloat('00', cdsItens.FieldByName('HMEMESCOBRANCA').AsFloat)))                          +  ' AS COBRANCA, '    +

        '  ' + ConverteVirgulaParaPonto( cdsItens.FieldByName('HMEVLRPREVISTO').AsFloat)                   +  ' AS VLRPREVISTO, '        +
        '  ' + ConverteVirgulaParaPonto( cdsItens.FieldByName('HMEVLREFETIVO').AsFloat)                    +  ' AS VLREFETIVO, '         +
        '  ' + ConverteVirgulaParaPonto( cdsItens.FieldByName('HMESALDODEV').AsFloat)                      +  ' AS SALDODEV, '           +
        '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevPos)                                        +  ' AS SALDODEVPOS, '        +
        '  ' + ConverteVirgulaParaPonto( cdsItens.FieldByName('HMETXJUROS').AsFloat)                       +  ' AS TXJUROS, '            +

        '  ' + ConverteVirgulaParaPonto(fVlrProvPerda)                                   +  ' AS VLRPROVPERDA, '       +

        '  ' + IntToStr( iQuantAberto  )                                                 +  ' AS QUANTITEMABERTO, '    +
        '  ' + IntToStr( iNumParcPagas )                                                 +  ' AS NUMPARCPAGAS, '       +
        '  ' + IntToStr( iNumParcelas  )                                                 +  ' AS PRAZOANT, '           +
        '  ' + IntToStr( iNumParcRest  )                                                 +  ' AS PRAZOREST, '          +
		// SOL194557  KTN 1862527 Otacilio
        ' 0' + cdsItens.FieldByName('FLGSUSPENSAO').AsString                             +  ' AS FLGSUSPENSAO, -1 AS OPERACAO, -1 AS SITENVIO '        + 
        'FROM '                                                                                                        +
        '  DUAL ';

        // armazeno SQL montado no vetor
        vSql[i] := sSql;

        {  Existe uma ordem de sequência de cálculo e para cada item o
           resultado do item anteriormente calculado tem que ser passado no Sql
           que será submetido para a Regra.  É usado este laço para juntar TODOS
           os sqls, montando o SQL completo que será passado para Regra para
           cálculo do item }

        for j := 0 to High(vSql) do begin
           if j <= 0 then
              sSqlExec := vSql[j]
           else begin
              sSqlExec := sSqlExec + ' UNION '  + vSql[j];
           end;
        end;

        // incrementa a variável de índice do vetor
        inc(i);

        // Próximo item Aberto
        cdsItens.Next;

      end;

      if bFlgExcepcional then
      begin
        // Monta as linhas do item de seguro complementar (amortização)

        cdsItens.Data := ItensEmprestimo( rContrato.IDContratoEmptmo, 2, -1, -1, -1, -1,
                                0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0 );

        cdsItens.First;
        bCabecalho := True;

        while not cdsItens.Eof do
        begin
          sCabecalho := '';
          bCabecalho := False;

          //array dinâmico
          SetLength(vSql, i + 1);

          sSql := sCabecalho +
          'SELECT '                                                                                                   +
          '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   +
          '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  +
          '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       +
          '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        +
          '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          +
          '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          +
          '  ' + IntToStr(rContrato.IdPessoa)                                           +  ' AS IDPESSOA,  '          ;

          if bFinanciamento then sSQL := sSQL +
          '  1'                                                                         + ' AS FLGFINANCIAMENTO, '
          else sSQL := sSQL +
          '  0'                                                                         + ' AS FLGFINANCIAMENTO, ';

          sSQL := sSQL +
          //Pendência 22836 - 03/10/2006
          '  00'                                                                        +  ' AS FLGEXCEPCIONAL, '     +
          //Fim Pendência 22836

          '  ' + QuotedStr( NullToSpace( rContrato.SiglaIndexador))                     +  ' AS NOMEINDICE, '         +

          '  ' + ConverteVirgulaParaPonto(rContrato.fValMargem)                         +  ' AS MARGEM, '             +
          '  ' + ConverteVirgulaParaPonto(rContrato.fValReserva)                        +  ' AS RESERVA, '            +

          '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao)))  +  ' AS DATAINSC, '           +
          '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataCredito)))    +  ' AS DATACREDITO, '        +
          '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))) +  ' AS DATAASSIN, '          +
          '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc)))   +  ' AS DATAPRIMPARC, '       +

          '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             +
          '  ' + QuotedStr( NullToSpace( sEstado))                                      +  ' AS CODESTADO, '          +
          '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          +

          ' 0'                                                                          +  ' AS ORDENACAO, '           +
          ' 0' + IntToStr(Trunc(cdsItens.FieldByName('HMEDATAPREVISTA').AsDateTime))    +  ' AS DATAORDENACAO, '       +

          '  ' + cdsItens.FieldByName('IDITEMEMPTMO').AsString                          +  ' AS IDITEMEMPTMO, '       +
          '  ' + cdsItens.FieldByName('HMETIPOMOV').AsString                            +  ' AS EVENTOITEM, '         +
          '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         +
          '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             +
          '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             +
          ' 0'                                                                          +  ' AS SEQCALCULO, '         +

          '  ' + cdsItens.FieldByName('HMEPARCELA').AsString                            +  ' AS PARCATUAL, '          +
          ' 0' + cdsItens.FieldByName('HMENUMPARCELAS').AsString                        +  ' AS NUMPARCELAS, '        +

          '  ' + cdsItens.FieldByName('HMECENTRALIZA').AsString                         +  ' AS CENTRALIZA, '         +
          '  ' + cdsItens.FieldByName('HMEDESTACADO').AsString                          +  ' AS DESTACADO, '          +

          '  ' + cdsItens.FieldByName('FLGENVIO').AsString                              +  ' AS FLGENVIO, '           +
          '  ' + cdsItens.FieldByName('FLGBAIXADO').AsString                            +  ' AS FLGBAIXADO, '         +
          '  ' + cdsItens.FieldByName('FLGESTORNADO').AsString                          +  ' AS FLGESTORNADO, '       +
          '  ' + cdsItens.FieldByName('FLGABONADO').AsString                            +  ' AS FLGABONADO, '         +
          '  ' + QuotedStr( NullToSpace( cdsItens.FieldByName('HMEFORMACOBRANCA').AsString)) +  ' AS FLGFORMACOB, '   +

          '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataQuit)))      +  ' AS DATAEVENTO, '         +
          '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataMorte)))     +  ' AS DATAMORTE, '          +
          '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataAssinatura)))+  ' AS DATASOLNOVO, '        +

          '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAPREVISTA').AsDateTime)))+  ' AS DATAPREVISTA, '    +
          '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAEFETIVA').AsDateTime)))  +  ' AS DATAEFETIVA, '     +
          '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAATUALIZA').AsDateTime))) +  ' AS DATAATUALIZA, '    +
          '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAVENCTO').AsDateTime)))   +  ' AS DATAVENCTO, '      +

          '  ' + QuotedStr( NullToSpace( FormatFloat('0000', cdsItens.FieldByName('HMEANOCOMPETENCIA').AsFloat)            +
                 FormatFloat('00', cdsItens.FieldByName('HMEMESCOMPETENCIA').AsFloat)))                       +  ' AS COMPETENCIA, ' +
          '  ' + QuotedStr( NullToSpace( FormatFloat('0000', cdsItens.FieldByName('HMEANOCOBRANCA').AsFloat)               +
                 FormatFloat('00', cdsItens.FieldByName('HMEMESCOBRANCA').AsFloat)))                          +  ' AS COBRANCA, '    +

          '  ' + ConverteVirgulaParaPonto( cdsItens.FieldByName('HMEVLRPREVISTO').AsFloat)                   +  ' AS VLRPREVISTO, '        +
          '  ' + ConverteVirgulaParaPonto( cdsItens.FieldByName('HMEVLREFETIVO').AsFloat)                    +  ' AS VLREFETIVO, '         +
          '  ' + ConverteVirgulaParaPonto( cdsItens.FieldByName('HMESALDODEV').AsFloat)                      +  ' AS SALDODEV, '           +
          '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevPos)                                        +  ' AS SALDODEVPOS, '        +
          '  ' + ConverteVirgulaParaPonto( cdsItens.FieldByName('HMETXJUROS').AsFloat)                       +  ' AS TXJUROS, '            +

          '  ' + ConverteVirgulaParaPonto(fVlrProvPerda)                                   +  ' AS VLRPROVPERDA, '       +

          '  ' + IntToStr( iQuantAberto  )                                                 +  ' AS QUANTITEMABERTO, '    +
          '  ' + IntToStr( iNumParcPagas )                                                 +  ' AS NUMPARCPAGAS, '       +
          '  ' + IntToStr( iNumParcelas  )                                                 +  ' AS PRAZOANT, '           +
          '  ' + IntToStr( iNumParcRest  )                                                 +  ' AS PRAZOREST, '          +
		  // SOL194557  KTN 1862527 Otacilio
          ' 0' + cdsItens.FieldByName('FLGSUSPENSAO').AsString                             +  ' AS FLGSUSPENSAO, -1 AS OPERACAO, -1 AS SITENVIO '        + 
          'FROM '                                                                                                        +
          '  DUAL ';

          // armazeno SQL montado no vetor
          vSql[i] := sSql;

          {  Existe uma ordem de sequência de cálculo e para cada item o
             resultado do item anteriormente calculado tem que ser passado no Sql
             que será submetido para a Regra.  É usado este laço para juntar TODOS
             os sqls, montando o SQL completo que será passado para Regra para
             cálculo do item }

          for j := 0 to High(vSql) do begin
             if j <= 0 then
                sSqlExec := vSql[j]
             else begin
                sSqlExec := sSqlExec + ' UNION '  + vSql[j];
             end;
          end;

          // incrementa a variável de índice do vetor
          inc(i);

          // Próximo item Aberto
          cdsItens.Next;

        end; // while qryAux
      end;
      // FIM 07/01/2004

      // Monta as linhas dos itens PENDENTES
      cdsItens.Data := ItensEmprestimo( rContrato.IDContratoEmptmo, -1, -1, -1, 0, -1,
                              0, 0, 0, 0, 0, 0, 1, 0, 0, -1, iFlgAbonoDiverg );

      iQuantAberto := cdsItens.RecordCount;

      cdsItens.First;
      bCabecalho := True;

      while not cdsItens.Eof do
      begin
        sCabecalho := '';
        bCabecalho := False;

        //array dinâmico
        SetLength(vSql, i + 1);

        sSql := sCabecalho +
        'SELECT '                                                                                                   +
        '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   +
        '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  +
        '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       +
        '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        +
        '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          +
        '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          +
        '  ' + IntToStr(rContrato.IdPessoa)                                           +  ' AS IDPESSOA,  '          ;

        if bFinanciamento then sSQL := sSQL +
        '  1'                                                                         + ' AS FLGFINANCIAMENTO, '
        else sSQL := sSQL +
        '  0'                                                                         + ' AS FLGFINANCIAMENTO, ';

        sSQL := sSQL +
        //Pendência 22836 - 03/10/2006
        '  00'                                                                        +  ' AS FLGEXCEPCIONAL, '     +
        //Fim Pendência 22836

        '  ' + QuotedStr( NullToSpace( rContrato.SiglaIndexador))                     +  ' AS NOMEINDICE, '         +

        '  ' + ConverteVirgulaParaPonto(rContrato.fValMargem)                         +  ' AS MARGEM, '             +
        '  ' + ConverteVirgulaParaPonto(rContrato.fValReserva)                        +  ' AS RESERVA, '            +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao)))       +  ' AS DATAINSC, '           +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataCredito)))         +  ' AS DATACREDITO, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura)))      +  ' AS DATAASSIN, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc)))        +  ' AS DATAPRIMPARC, '       +

        '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             +
        '  ' + QuotedStr( NullToSpace( sEstado))                                      +  ' AS CODESTADO, '          +
        '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          +

        ' 0' + IntToStr(cdsItens.FieldByName('ORDENACAO').AsInteger)                  +  ' AS ORDENACAO, '          +
        ' 0' + IntToStr(Trunc(cdsItens.FieldByName('HMEDATAPREVISTA').AsDateTime))    +  ' AS DATAORDENACAO, '      +

        '  ' + cdsItens.FieldByName('IDITEMEMPTMO').AsString                          +  ' AS IDITEMEMPTMO, '       +
        '  ' + cdsItens.FieldByName('HMETIPOMOV').AsString                            +  ' AS EVENTOITEM, '         +
        '  ' + cdsItens.FieldByName('HMEORIGEM').AsString                             +  ' AS ORIGEMITEM, '         +
        '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             +
        '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             +
        ' 0'                                                                          +  ' AS SEQCALCULO, '         +

        '  ' + cdsItens.FieldByName('HMEPARCELA').AsString                            +  ' AS PARCATUAL, '          +
        ' 0' + cdsItens.FieldByName('HMENUMPARCELAS').AsString                        +  ' AS NUMPARCELAS, '        +

        '  ' + cdsItens.FieldByName('HMECENTRALIZA').AsString                         +  ' AS CENTRALIZA, '         +
        '  ' + cdsItens.FieldByName('HMEDESTACADO').AsString                          +  ' AS DESTACADO, '          +

        '  ' + cdsItens.FieldByName('FLGENVIO').AsString                              +  ' AS FLGENVIO, '           +
        '  ' + cdsItens.FieldByName('FLGBAIXADO').AsString                            +  ' AS FLGBAIXADO, '         +
        '  ' + cdsItens.FieldByName('FLGESTORNADO').AsString                          +  ' AS FLGESTORNADO, '       +
        '  ' + cdsItens.FieldByName('FLGABONADO').AsString                            +  ' AS FLGABONADO, '         +
        '  ' + QuotedStr( NullToSpace(  cdsItens.FieldByName('HMEFORMACOBRANCA').AsString)) +  ' AS FLGFORMACOB, '        +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataQuit)))      +  ' AS DATAEVENTO, '         +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataMorte)))     +  ' AS DATAMORTE, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataAssinatura)))+  ' AS DATASOLNOVO, '        +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAPREVISTA').AsDateTime)))    +  ' AS DATAPREVISTA, '    +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAEFETIVA').AsDateTime)))     +  ' AS DATAEFETIVA, '     +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAATUALIZA').AsDateTime)))    +  ' AS DATAATUALIZA, '    +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAVENCTO').AsDateTime)))      +  ' AS DATAVENCTO, '      +

        '  ' + QuotedStr( NullToSpace( FormatFloat('0000', cdsItens.FieldByName('HMEANOCOMPETENCIA').AsFloat)               +
               FormatFloat('00', cdsItens.FieldByName('HMEMESCOMPETENCIA').AsFloat)))                          +  ' AS COMPETENCIA, ' +
        '  ' + QuotedStr( NullToSpace( FormatFloat('0000', cdsItens.FieldByName('HMEANOCOBRANCA').AsFloat)                  +
               FormatFloat('00', cdsItens.FieldByName('HMEMESCOBRANCA').AsFloat)))                             +  ' AS COBRANCA, '    +

        '  ' + ConverteVirgulaParaPonto(cdsItens.FieldByName('HMEVLRPREVISTO').AsFloat)  +  ' AS VLRPREVISTO, '        +
        '  ' + ConverteVirgulaParaPonto(cdsItens.FieldByName('HMEVLREFETIVO').AsFloat)   +  ' AS VLREFETIVO, '         +
        '  ' + ConverteVirgulaParaPonto(cdsItens.FieldByName('HMESALDODEV').AsFloat)     +  ' AS SALDODEV, '           +
        '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevPos)                      +  ' AS SALDODEVPOS, '        +
        '  ' + ConverteVirgulaParaPonto(cdsItens.FieldByName('HMETXJUROS').AsFloat)      +  ' AS TXJUROS, '            +

        '  ' + ConverteVirgulaParaPonto(fVlrProvPerda)                                   +  ' AS VLRPROVPERDA, '       +

        '  ' + IntToStr( iQuantAberto  )                                                 +  ' AS QUANTITEMABERTO, '    +
        '  ' + IntToStr( iNumParcPagas )                                                 +  ' AS NUMPARCPAGAS, '       +
        '  ' + IntToStr( iNumParcelas  )                                                 +  ' AS PRAZOANT, '           +
        '  ' + IntToStr( iNumParcRest  )                                                 +  ' AS PRAZOREST, '          +
		// SOL194557  KTN 1862527 Otacilio
        ' 0' + cdsItens.FieldByName('FLGSUSPENSAO').AsString                             +  ' AS FLGSUSPENSAO, -1 AS OPERACAO, -1 AS SITENVIO '        + 
        'FROM '                                                                                                        +
        '  DUAL ';

        // armazeno SQL montado no vetor
        vSql[i] := sSql;

        {  Existe uma ordem de sequência de cálculo e para cada item o
           resultado do item anteriormente calculado tem que ser passado no Sql
           que será submetido para a Regra.  É usado este laço para juntar TODOS
           os sqls, montando o SQL completo que será passado para Regra para
           cálculo do item }

        for j := 0 to High(vSql) do begin
           if j <= 0 then
              sSqlExec := vSql[j]
           else begin
              sSqlExec := sSqlExec + ' UNION '  + vSql[j];
           end;
        end;

        // incrementa a variável de índice do vetor
        inc(i);

        // Próximo item Aberto
        cdsItens.Next;

      end; // while qryAux


      // Monta as linhas dos itens FUTUROS PAGOS

      cdsParcelasAVencer.Data := ParcelasAVencer( rContrato.IDContratoEmptmo, dDataQuit );

      cdsParcelasAVencer.First;
      bCabecalho := True;

      while not cdsParcelasAVencer.Eof do
      begin

        sCabecalho := '';
        bCabecalho := False;

        //array dinâmico
        SetLength(vSql, i + 1);

        sSql := sCabecalho +
        'SELECT '                                                                                                   +
        '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   +
        '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  +
        '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       +
        '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        +
        '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          +
        '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          +
        '  ' + IntToStr(rContrato.IdPessoa)                                           +  ' AS IDPESSOA,  '          ;

        if bFinanciamento then sSQL := sSQL +
        '  1'                                                                         + ' AS FLGFINANCIAMENTO, '
        else sSQL := sSQL +
        '  0'                                                                         + ' AS FLGFINANCIAMENTO, ';

        sSQL := sSQL +
        //Pendência 22836 - 03/10/2006
        '  00'                                                                        +  ' AS FLGEXCEPCIONAL, '     +
        //Fim Pendência 22836

        '  ' + QuotedStr( NullToSpace( rContrato.SiglaIndexador))                     +  ' AS NOMEINDICE, '         +

        '  ' + ConverteVirgulaParaPonto(rContrato.fValMargem)                         +  ' AS MARGEM, '             +
        '  ' + ConverteVirgulaParaPonto(rContrato.fValReserva)                        +  ' AS RESERVA, '            +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao))) +  ' AS DATAINSC, '           +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataCredito)))   +  ' AS DATACREDITO, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura)))+  ' AS DATAASSIN, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc)))  +  ' AS DATAPRIMPARC, '       +

        '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             +
        '  ' + QuotedStr( NullToSpace( sEstado))                                      +  ' AS CODESTADO, '          +
        '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          +

        ' 0' + IntToStr(cdsParcelasAVencer.FieldByName('ORDENACAO').AsInteger)               +  ' AS ORDENACAO, '     +
        ' 0' + IntToStr(Trunc(cdsParcelasAVencer.FieldByName('HMEDATAPREVISTA').AsDateTime)) +  ' AS DATAORDENACAO, ' +

        '  ' + cdsParcelasAVencer.FieldByName('IDITEMEMPTMO').AsString                +  ' AS IDITEMEMPTMO, '       +
        '  ' + cdsParcelasAVencer.FieldByName('HMETIPOMOV').AsString                  +  ' AS EVENTOITEM, '         +
        '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         +
        '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             +
        '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             +
        ' 0'                                                                          +  ' AS SEQCALCULO, '         +

        '  ' + cdsParcelasAVencer.FieldByName('HMEPARCELA').AsString                            +  ' AS PARCATUAL, '          +
        ' 0' + cdsParcelasAVencer.FieldByName('HMENUMPARCELAS').AsString                        +  ' AS NUMPARCELAS, '        +

        '  ' + cdsParcelasAVencer.FieldByName('HMECENTRALIZA').AsString                         +  ' AS CENTRALIZA, '         +
        '  ' + cdsParcelasAVencer.FieldByName('HMEDESTACADO').AsString                          +  ' AS DESTACADO, '          +

        '  ' + cdsParcelasAVencer.FieldByName('FLGENVIO').AsString                              +  ' AS FLGENVIO, '           +
        '  ' + cdsParcelasAVencer.FieldByName('FLGBAIXADO').AsString                            +  ' AS FLGBAIXADO, '         +
        '  ' + cdsParcelasAVencer.FieldByName('FLGESTORNADO').AsString                          +  ' AS FLGESTORNADO, '       +
        '  ' + cdsParcelasAVencer.FieldByName('FLGABONADO').AsString                            +  ' AS FLGABONADO, '         +
        '  ' + QuotedStr( NullToSpace(  cdsParcelasAVencer.FieldByName('HMEFORMACOBRANCA').AsString)) +  ' AS FLGFORMACOB, '        +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataQuit)))      +  ' AS DATAEVENTO, '         +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataMorte)))     +  ' AS DATAMORTE, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataAssinatura)))+  ' AS DATASOLNOVO, '        +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsParcelasAVencer.FieldByName('HMEDATAPREVISTA').AsDateTime)))    +  ' AS DATAPREVISTA, '    +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsParcelasAVencer.FieldByName('HMEDATAEFETIVA').AsDateTime)))     +  ' AS DATAEFETIVA, '     +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsParcelasAVencer.FieldByName('HMEDATAATUALIZA').AsDateTime)))    +  ' AS DATAATUALIZA, '    +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsParcelasAVencer.FieldByName('HMEDATAVENCTO').AsDateTime)))      +  ' AS DATAVENCTO, '      +

        '  ' + QuotedStr( NullToSpace( FormatFloat('0000', cdsParcelasAVencer.FieldByName('HMEANOCOMPETENCIA').AsFloat)               +
               FormatFloat('00', cdsParcelasAVencer.FieldByName('HMEMESCOMPETENCIA').AsFloat)))                          +  ' AS COMPETENCIA, ' +
        '  ' + QuotedStr( NullToSpace( FormatFloat('0000', cdsParcelasAVencer.FieldByName('HMEANOCOBRANCA').AsFloat)                  +
               FormatFloat('00', cdsParcelasAVencer.FieldByName('HMEMESCOBRANCA').AsFloat)))                             +  ' AS COBRANCA, '    +

        '  ' + ConverteVirgulaParaPonto(cdsParcelasAVencer.FieldByName('HMEVLRPREVISTO').AsFloat)  +  ' AS VLRPREVISTO, '        +
        '  ' + ConverteVirgulaParaPonto(cdsParcelasAVencer.FieldByName('HMEVLREFETIVO').AsFloat)   +  ' AS VLREFETIVO, '         +
        '  ' + ConverteVirgulaParaPonto(cdsParcelasAVencer.FieldByName('HMESALDODEV').AsFloat)     +  ' AS SALDODEV, '           +
        '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevPos)                                +  ' AS SALDODEVPOS, '        +
        '  ' + ConverteVirgulaParaPonto(cdsParcelasAVencer.FieldByName('HMETXJUROS').AsFloat)      +  ' AS TXJUROS, '            +

        '  ' + ConverteVirgulaParaPonto(fVlrProvPerda)                                   +  ' AS VLRPROVPERDA, '       +

        ' 0'                                                                                       +  ' AS QUANTITEMABERTO, '    +
        ' 0'                                                                                       +  ' AS NUMPARCPAGAS, '       +
        ' 0'                                                                                       +  ' AS PRAZOANT, '           +
        ' 0'                                                                                       +  ' AS PRAZOREST, '          +
		// SOL194557  KTN 1862527 Otacilio
        ' 0' + cdsParcelasAVencer.FieldByName('FLGSUSPENSAO').AsString                             +  ' AS FLGSUSPENSAO, -1 AS OPERACAO, -1 AS SITENVIO '        + 
        'FROM '                                                                                                        +
        '  DUAL ';

        // armazeno SQL montado no vetor
        vSql[i] := sSql;

        {  Existe uma ordem de sequência de cálculo e para cada item o
           resultado do item anteriormente calculado tem que ser passado no Sql
           que será submetido para a Regra.  É usado este laço para juntar TODOS
           os sqls, montando o SQL completo que será passado para Regra para
           cálculo do item }

        for j := 0 to High(vSql) do begin
           if j <= 0 then
              sSqlExec := vSql[j]
           else begin
              sSqlExec := sSqlExec + ' UNION '  + vSql[j];
           end;
        end;

        // incrementa a variável de índice do vetor
        inc(i);

        // Próximo item Aberto
        cdsParcelasAVencer.Next;

      end; // while qryAux


      // Monta as linhas dos itens DO MÊS

      cdsItens.Data := ItensEmprestimo( rContrato.IDContratoEmptmo, -1, -1, -1, 0, -1,
                              ExtraiAno( dDataQuit ), ExtraiMes( dDataQuit ),
                              0, 0, 0, 0, 0, 1, 3, -1, 0 );
      cdsItens.First;
      bCabecalho := True;

      while not cdsItens.Eof do
      begin
        sCabecalho := '';
        bCabecalho := False;

        // array dinâmico
        SetLength(vSql, i + 1);

        sSql := sCabecalho +
        'SELECT '                                                                                                   +
        '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   +
        '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  +
        '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       +
        '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        +
        '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          +
        '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          +
        '  ' + IntToStr(rContrato.IdPessoa)                                           +  ' AS IDPESSOA,  '          ;

        if bFinanciamento then sSQL := sSQL +
        '  1'                                                                         + ' AS FLGFINANCIAMENTO, '
        else sSQL := sSQL +
        '  0'                                                                         + ' AS FLGFINANCIAMENTO, ';

        sSQL := sSQL +
        //Pendência 22836 - 03/10/2006
        '  00'                                                                        +  ' AS FLGEXCEPCIONAL, '     +
        //Fim Pendência 22836

        '  ' + QuotedStr( NullToSpace( rContrato.SiglaIndexador) )                    +  ' AS NOMEINDICE, '         +

        '  ' + ConverteVirgulaParaPonto(rContrato.fValMargem)                         +  ' AS MARGEM, '             +
        '  ' + ConverteVirgulaParaPonto(rContrato.fValReserva)                        +  ' AS RESERVA, '            +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao)))  +  ' AS DATAINSC, '           +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataCredito)))    +  ' AS DATACREDITO, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura))) +  ' AS DATAASSIN, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc)))   +  ' AS DATAPRIMPARC, '       +

        '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             +
        '  ' + QuotedStr( NullToSpace( sEstado))                                                     +  ' AS CODESTADO, '          +
        '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          +

        ' 0' + IntToStr(cdsItens.FieldByName('ORDENACAO').AsInteger)                  +  ' AS ORDENACAO, '          +
        ' 0' + IntToStr(Trunc(cdsItens.FieldByName('HMEDATAPREVISTA').AsDateTime))    +  ' AS DATAORDENACAO, '      +

        '  ' + cdsItens.FieldByName('IDITEMEMPTMO').AsString                          +  ' AS IDITEMEMPTMO, '       +
        '  ' + cdsItens.FieldByName('HMETIPOMOV').AsString                            +  ' AS EVENTOITEM, '         +
        '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         +
        '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             +
        '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             +
        ' 0'                                                                          +  ' AS SEQCALCULO, '         +

        '  ' + cdsItens.FieldByName('HMEPARCELA').AsString                            +  ' AS PARCATUAL, '          +
        ' 0' + cdsItens.FieldByName('HMENUMPARCELAS').AsString                        +  ' AS NUMPARCELAS, '        +

        '  ' + cdsItens.FieldByName('HMECENTRALIZA').AsString                         +  ' AS CENTRALIZA, '         +
        '  ' + cdsItens.FieldByName('HMEDESTACADO').AsString                          +  ' AS DESTACADO, '          +

        '  ' + cdsItens.FieldByName('FLGENVIO').AsString                              +  ' AS FLGENVIO, '           +
        '  ' + cdsItens.FieldByName('FLGBAIXADO').AsString                            +  ' AS FLGBAIXADO, '         +
        '  ' + cdsItens.FieldByName('FLGESTORNADO').AsString                          +  ' AS FLGESTORNADO, '       +
        '  ' + cdsItens.FieldByName('FLGABONADO').AsString                            +  ' AS FLGABONADO, '         +
        '  ' + QuotedStr( NullToSpace( cdsItens.FieldByName('HMEFORMACOBRANCA').AsString)) +  ' AS FLGFORMACOB, '     +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataQuit)))      +  ' AS DATAEVENTO, '      +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataMorte)))     +  ' AS DATAMORTE, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataAssinatura)))+  ' AS DATASOLNOVO, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAPREVISTA').AsDateTime)))   +  ' AS DATAPREVISTA, '    +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAEFETIVA').AsDateTime)))    +  ' AS DATAEFETIVA, '     +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAATUALIZA').AsDateTime)))   +  ' AS DATAATUALIZA, '    +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAVENCTO').AsDateTime)))     +  ' AS DATAVENCTO, '      +

        '  ' + QuotedStr( NullToSpace( FormatFloat('0000', cdsItens.FieldByName('HMEANOCOMPETENCIA').AsFloat)              +
               FormatFloat('00', cdsItens.FieldByName('HMEMESCOMPETENCIA').AsFloat)))                         +  ' AS COMPETENCIA, '     +
        '  ' + QuotedStr( NullToSpace( FormatFloat('0000', cdsItens.FieldByName('HMEANOCOBRANCA').AsFloat)                 +
               FormatFloat('00', cdsItens.FieldByName('HMEMESCOBRANCA').AsFloat)))                            +  ' AS COBRANCA, '        +

        '  ' + ConverteVirgulaParaPonto(cdsItens.FieldByName('HMEVLRPREVISTO').AsFloat)  +  ' AS VLRPREVISTO, '        +
        '  ' + ConverteVirgulaParaPonto(cdsItens.FieldByName('HMEVLREFETIVO').AsFloat)   +  ' AS VLREFETIVO, '         +
        '  ' + ConverteVirgulaParaPonto(cdsItens.FieldByName('HMESALDODEV').AsFloat)     +  ' AS SALDODEV, '           +
        '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevPos)                      +  ' AS SALDODEVPOS, '        +
        '  ' + ConverteVirgulaParaPonto(cdsItens.FieldByName('HMETXJUROS').AsFloat)      +  ' AS TXJUROS, '            +

        '  ' + ConverteVirgulaParaPonto(fVlrProvPerda)                                   +  ' AS VLRPROVPERDA, '       +

        '  ' + IntToStr( iQuantAberto  )                                                 +  ' AS QUANTITEMABERTO, '    +
        '  ' + IntToStr( iNumParcPagas )                                                 +  ' AS NUMPARCPAGAS, '       +
        '  ' + IntToStr( iNumParcelas  )                                                 +  ' AS PRAZOANT, '           +
        '  ' + IntToStr( iNumParcRest  )                                                 +  ' AS PRAZOREST, '          +
		// SOL194557  KTN 1862527 Otacilio
        ' 0' + cdsItens.FieldByName('FLGSUSPENSAO').AsString                             +  ' AS FLGSUSPENSAO, -1 AS OPERACAO, -1 AS SITENVIO '        + 
        'FROM '                                                                                                     +
        '  DUAL ';

        // armazeno SQL montado no vetor
        vSql[i] := sSql;

        {  Existe uma ordem de sequência de cálculo e para cada item o
           resultado do item anteriormente calculado tem que ser passado no Sql
           que será submetido para a Regra.  É usado este laço para juntar TODOS
           os sqls, montando o SQL completo que será passado para Regra para
           cálculo do item }

        for j := 0 to High(vSql) do begin
           if j <= 0 then
              sSqlExec := vSql[j]
           else begin
              sSqlExec := sSqlExec +#13 + ' UNION '  + #13 + vSql[j];
           end;
        end;

        // incrementa a variável de índice do vetor
        inc(i);

        // Próximo item Aberto
        cdsItens.Next;

      end; // while qryAux
       
      // Monta as linhas dos itens de DE QUITAÇÃO

      cdsItensQuitacao.First;
      bCabecalho := True;

      while not cdsItensQuitacao.Eof do
      begin

        // array dinâmico
        SetLength(vSql, i + 1);

        sSql :=
        'SELECT '                                                                                                   +
        '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   +
        '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  +
        '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       +
        '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        +
        '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          +
        '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          +
        '  ' + IntToStr(rContrato.IdPessoa)                                           +  ' AS IDPESSOA,  '          ;

        if bFinanciamento then sSQL := sSQL +
        '  1'                                                                         + ' AS FLGFINANCIAMENTO, '
        else sSQL := sSQL +
        '  0'                                                                         + ' AS FLGFINANCIAMENTO, ';

        sSQL := sSQL +
        //Pendência 22836 - 03/10/2006
        '  00'                                                                        +  ' AS FLGEXCEPCIONAL, '     +
        //Fim Pendência 22836

        '  ' + QuotedStr( NullToSpace( rContrato.SiglaIndexador))                     +  ' AS NOMEINDICE, '         +

        '  ' + ConverteVirgulaParaPonto(rContrato.fValMargem)                         +  ' AS MARGEM, '             +
        '  ' + ConverteVirgulaParaPonto(rContrato.fValReserva)                        +  ' AS RESERVA, '            +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao)))       +  ' AS DATAINSC, '           +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataCredito)))         +  ' AS DATACREDITO, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura)))      +  ' AS DATAASSIN, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc)))        +  ' AS DATAPRIMPARC, '       +

        '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             +
        '  ' + QuotedStr( NullToSpace( sEstado))                                      +  ' AS CODESTADO, '          +
        '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          +

        ' 0' + IntToStr(cdsItensQuitacao.FieldByName('ORDENACAO').AsInteger)          +  ' AS ORDENACAO, '          +
        ' 0' + IntToStr(Trunc(dDataQuit))                                             +  ' AS DATAORDENACAO, '      +

        '  ' + cdsItensQuitacao.FieldByName('IDITEMEMPTMO').AsString                  +  ' AS IDITEMEMPTMO, '       +
        '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTOITEM, '         +
        '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         +
        '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             +
        '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             +
        '  ' + IntToStr(cdsItensQuitacao.FieldByName('ITCSEQCALCULO').AsInteger)      +  ' AS SEQCALCULO, '         +

        '  ' + IntToStr(rSaldosAntPos.iParcelaAnt)                                    +  ' AS PARCATUAL, '          +
        ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                  +  ' AS NUMPARCELAS, '        +

        '  ' + cdsItensQuitacao.FieldByName('FLGCENTRALIZA').AsString                 +  ' AS CENTRALIZA, '         +
        '  ' + cdsItensQuitacao.FieldByName('FLGDESTACADO').AsString                  +  ' AS DESTACADO, '          +

        '  0'                                                                         +  ' AS FLGENVIO, '           +
        '  0'                                                                         +  ' AS FLGBAIXADO, '         +
        '  0'                                                                         +  ' AS FLGESTORNADO, '       +
        '  0'                                                                         +  ' AS FLGABONADO, '         +
        '  ' + QuotedStr( NullToSpace( rContrato.FlgFormaRec))                        +  ' AS FLGFORMACOB, '        +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataQuit)))                     +  ' AS DATAEVENTO, '         +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataMorte)))                    +  ' AS DATAMORTE, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataAssinatura)))               +  ' AS DATASOLNOVO, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataQuit)))                     +  ' AS DATAPREVISTA, '       +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', 0)))                             +  ' AS DATAEFETIVA, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos)))     +  ' AS DATAATUALIZA, '       +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataQuit)))                     +  ' AS DATAVENCTO, '         +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('YYYYMM', dDataQuit)))                         +  ' AS COMPETENCIA, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('YYYYMM', dDataQuit)))                         +  ' AS COBRANCA, '           +

        '  0'                                                                         +  ' AS VLRPREVISTO, '        +
        '  0'                                                                         +  ' AS VLREFETIVO, '         +
        '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevAnt)                   +  ' AS SALDODEV, '           +
        '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevPos)                   +  ' AS SALDODEVPOS, '        +
        '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fTxJurosAnt)                    +  ' AS TXJUROS, '            +

        '  ' + ConverteVirgulaParaPonto(fVlrProvPerda)                                +  ' AS VLRPROVPERDA, '       +

        '  ' + IntToStr( iQuantAberto  )                                              +  ' AS QUANTITEMABERTO, '    +
        '  ' + IntToStr( iNumParcPagas )                                              +  ' AS NUMPARCPAGAS, '       +
        '  ' + IntToStr( iNumParcelas  )                                              +  ' AS PRAZOANT, '           +
        '  ' + IntToStr( iNumParcRest  )                                              +  ' AS PRAZOREST, '          +
		// SOL194557  KTN 1862527 Otacilio
        ' 0' + cdsItens.FieldByName('FLGSUSPENSAO').AsString                          +  ' AS FLGSUSPENSAO, -1 AS OPERACAO, -1 AS SITENVIO '        +
        'FROM '                                                                                                     +
        '  DUAL ';

        vSql[i] := sSql;

        {  Como no caso dos itens de concessão, existe uma ordem de sequência de
           cálculo e para cada item o resultado do item anteriormente calculado
           tem que ser passado no Sql que será submetido para a Regra.  É usado
           este laço para juntar TODOS os sqls, montando o SQL completo que será
           passado para Regra para cálculo do item }

        for j := 0 to High(vSql) do begin
           if j <= 0 then
              sSqlExec := vSql[j]
           else begin
              sSqlExec := sSqlExec + ' UNION '  + vSql[j];
           end;
        end;

        if bFlgExcepcional then
          sSqlExec := sSqlExec + ' ORDER BY ORDENACAO, DATAORDENACAO, SEQCALCULO, DATAPREVISTA '
        else
          sSqlExec := sSqlExec + ' ORDER BY SEQCALCULO, DATAPREVISTA ';

        { função que cria uma query e um objeto regra em tempo de execução,
           recebendo como parâmetro o Sql que será passado para a Regra, o número
           da regra, a mensagem de texto que será exibida caso haja erro e uma
           variável passada por referência que armazenará o Result da Regra.
           A função retornará se a Regra foi executada com êxito ou não }


        WebRegra.CdsDataSetIn.Close;
        WebRegra.CdsDataSetIn.Data := GetDataPacket( sSqlExec );


        WebRegra.MessageInfo := '';
        sValor := WebRegra.RegraString( cdsItensQuitacao.FieldByName('IDREGRACALC').AsString, iIdEmpresaProp );
        if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );


        { Tento Armazenar no Vetor que será o Result da função o VALOR do item.
           Caso não consiga, é porque a regra em vez de valor retornou FALSE }
        try
          //Não gravar item com valor ZERO
          if ( trim( UpperCase( sValor ) ) = 'NULO' ) then
          begin
            // Próximo item de Quitação
            cdsItensQuitacao.Next;

            // incrementa o Contador
            inc(iContador);

            // incrementa a variável de índice do vetor do SQL
            inc(i);

            Continue;
          end;
        except
          MessageInfo := 'Erro ao recuperar dívidas de empréstimos anteriores.';
        end;


        { *****************************************************************
          SUBSTITUIÇÃO no SQL do Itens que acabou de ser CALCULADO
          Depois de executada a Regra a variável sValor já tem o VALOR do
          item calculado, logo é atualizado este valor na linha de SQL do
          vetor vSql que acabou de ser executada pela regra.
          ***************************************************************** }
        sCabecalho := '';
        if bCabecalho then
        begin
           sCabecalho := '/* -------------- Itens de Quitação ---------------------------------------------- */ ' + #13;
           bCabecalho := False;
        end;

        sSql := sCabecalho +
        'SELECT '                                                                                                   +
        '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                          +  ' AS IDCONTRATOEMPTMO, '   +
        '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                                  +  ' AS IDTIPOCONTREMPTMO, '  +
        '  ' + IntToStr(rContrato.IDTipoEmptmo)                                       +  ' AS IDTIPOEMPTMO, '       +
        '  ' + IntToStr(rContrato.IDPlanoPrev)                                        +  ' AS IDPLANOPREV, '        +
        '  ' + IntToStr(rContrato.IDPatro)                                            +  ' AS IDPESSJUR, '          +
        '  ' + IntToStr(rContrato.IDSitPart)                                          +  ' AS IDSITPART, '          +
        '  ' + IntToStr(rContrato.IdPessoa)                                           +  ' AS IDPESSOA,  '          ;

        if bFinanciamento then sSQL := sSQL +
        '  1'                                                                         +  ' AS FLGFINANCIAMENTO, '
        else sSQL := sSQL +
        '  0'                                                                         +  ' AS FLGFINANCIAMENTO, ';

        sSQL := sSQL +
        //Pendência 22836 - 03/10/2006
        '  00'                                                                        +  ' AS FLGEXCEPCIONAL, '     +
        //Fim Pendência 22836

        '  ' + QuotedStr( NullToSpace( rContrato.SiglaIndexador) )                    +  ' AS NOMEINDICE, '         +

        '  ' + ConverteVirgulaParaPonto(rContrato.fValMargem)                         +  ' AS MARGEM, '             +
        '  ' + ConverteVirgulaParaPonto(rContrato.fValReserva)                        +  ' AS RESERVA, '            +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao)))       +  ' AS DATAINSC, '           +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataCredito)))         +  ' AS DATACREDITO, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura)))      +  ' AS DATAASSIN, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc)))        +  ' AS DATAPRIMPARC, '       +

        '  ' + IntToStr(iPais)                                                        +  ' AS IDPAIS, '             +
        '  ' + QuotedStr( NullToSpace( sEstado))                                      +  ' AS CODESTADO, '          +
        '  ' + IntToStr(iCidade)                                                      +  ' AS IDCIDADES, '          +

        '  ' + IntToStr(cdsItensQuitacao.FieldByName('ORDENACAO').AsInteger)          +  ' AS ORDENACAO, '          +
        ' 0' + IntToStr(Trunc(dDataQuit))                                             +  ' AS DATAORDENACAO, '      +

        '  ' + cdsItensQuitacao.FieldByName('IDITEMEMPTMO').AsString                  +  ' AS IDITEMEMPTMO, '       +
        '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTOITEM, '         +
        '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEMITEM, '         +
        '  ' + IntToStr(iEvento)                                                      +  ' AS EVENTO, '             +
        '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             +
        '  ' + IntToStr(cdsItensQuitacao.FieldByName('ITCSEQCALCULO').AsInteger)      +  ' AS SEQCALCULO, '         +

        '  ' + IntToStr(rSaldosAntPos.iParcelaAnt)                                    +  ' AS PARCATUAL, '          +
        ' 0' + IntToStr(rSaldosAntPos.iParcRestaAnt)                                  +  ' AS NUMPARCELAS, '        +

        '  ' + cdsItensQuitacao.FieldByName('FLGCENTRALIZA').AsString                 +  ' AS CENTRALIZA, '         +
        '  ' + cdsItensQuitacao.FieldByName('FLGDESTACADO').AsString                  +  ' AS DESTACADO, '          +

        '  0'                                                                         +  ' AS FLGENVIO, '           +
        '  0'                                                                         +  ' AS FLGBAIXADO, '         +
        '  0'                                                                         +  ' AS FLGESTORNADO, '       +
        '  0'                                                                         +  ' AS FLGABONADO, '         +
        '  ' + QuotedStr( NullToSpace( rContrato.FlgFormaRec))                        +  ' AS FLGFORMACOB, '        +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataQuit)))                     +  ' AS DATAEVENTO, '         +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataMorte)))                    +  ' AS DATAMORTE, '          +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataAssinatura)))               +  ' AS DATASOLNOVO, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataQuit)))                     +  ' AS DATAPREVISTA, '       +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', 0)))                             +  ' AS DATAEFETIVA, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', rSaldosAntPos.dDataAtuPos)))     +  ' AS DATAATUALIZA, '       +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('DD/MM/YYYY', dDataQuit)))                     +  ' AS DATAVENCTO, '         +

        '  ' + QuotedStr( NullToSpace( FormatDateTime('YYYYMM', dDataQuit)))                         +  ' AS COMPETENCIA, '        +
        '  ' + QuotedStr( NullToSpace( FormatDateTime('YYYYMM', dDataQuit)))                         +  ' AS COBRANCA, '           +

        // aqui ocorre a substituição do valor pelo valor calculado
        '  ' + sValor                                                                 +  ' AS VLRPREVISTO, '        +

        '  0'                                                                         +  ' AS VLREFETIVO, '         +
        '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevAnt)                   +  ' AS SALDODEV, '           +
        '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fSaldoDevPos)                   +  ' AS SALDODEVPOS, '        +
        '  ' + ConverteVirgulaParaPonto(rSaldosAntPos.fTxJurosAnt)                    +  ' AS TXJUROS, '            +

        '  ' + ConverteVirgulaParaPonto(fVlrProvPerda)                                +  ' AS VLRPROVPERDA, '       +

        '  ' + IntToStr( iQuantAberto  )                                              +  ' AS QUANTITEMABERTO, ' +
        '  ' + IntToStr( iNumParcPagas )                                              +  ' AS NUMPARCPAGAS, '    +
        '  ' + IntToStr( iNumParcelas  )                                              +  ' AS PRAZOANT, '        +
        '  ' + IntToStr( iNumParcRest  )                                              +  ' AS PRAZOREST, '       +
		// SOL194557  KTN 1862527 Otacilio
        ' 0' + cdsItens.FieldByName('FLGSUSPENSAO').AsString                          +  ' AS FLGSUSPENSAO, -1 AS OPERACAO, -1 AS SITENVIO '     +
        'FROM '                                                                                                     +
        '  DUAL ';

        //armazeno SQL montado no vetor
        vSql[i] := sSql;


        { GRAVAÇÃO no Vetor que será o Result da função }

        //Uso a procedure SetLength para criar mais um item dinâmicamente no array em memória.
        SetLength(vLista, k + 1);

        vLista[k].CodigoItem       := cdsItensQuitacao.FieldByName('IDItemEmptmo').AsInteger;
        vLista[k].Nome             := cdsItensQuitacao.FieldByName('IteDescricao').AsString;
        vLista[k].iEvento          := iEvento;
        vLista[k].Origem           := iOrigem;

        vLista[k].SeqCalculo       := cdsItensQuitacao.FieldByName('ITCSEQCALCULO').AsInteger;
        vLista[k].SeqCobranca      := 1;
        vLista[k].Prioridade       := cdsItensQuitacao.FieldByName('ITCPRIORIDADE').AsInteger;

        vLista[k].FlgCentraliza    := cdsItensQuitacao.FieldByName('FLGCENTRALIZA').AsInteger;
        vLista[k].FlgDestacado     := cdsItensQuitacao.FieldByName('FLGDESTACADO').AsInteger;
        vLista[k].IdItemCentraliza := cdsItensQuitacao.FieldByName('IDITEMCENTRALIZA').AsInteger;
        vLista[k].Rubrica          := cdsItensQuitacao.FieldByName('IDPROVENTON').AsInteger;

        vLista[k].AnoCompetencia   := ExtraiAno(dDataQuit);
        vLista[k].MesCompetencia   := ExtraiMes(dDataQuit);
        vLista[k].AnoCobranca      := ExtraiAno(dDataQuit);
        vLista[k].MesCobranca      := ExtraiMes(dDataQuit);

        vLista[k].DataPrevista     := dDataQuit;

        vLista[k].Valor            := StrToFloat( ConverteVirg( sValor ) );

        vLista[k].Parcela          := rSaldosAntPos.iParcelaAnt;
        vLista[k].ParcelaAlt       := rSaldosAntPos.iParcelaAltAnt;
        vLista[k].ParcResta        := 0;

        // calcula o novo saldo devedor
        if bFlgExcepcional and ( vLista[k].CodigoItem = 35 ) then
          fNovoSaldoDev := vLista[k].Valor;

        case cdsItensQuitacao.FieldByName('ITCTRATASALDODEV').AsInteger of
           // 0: Não Tratar
           1: fNovoSaldoDev := fNovoSaldoDev - vLista[k].Valor; //Abater
           2: fNovoSaldoDev := fNovoSaldoDev + vLista[k].Valor; //Incorporar
        end;

        vLista[k].SaldoDevedor     := fNovoSaldoDev;

        // Data de Atualização do Saldo Devedor
        vLista[k].DataUltAtualiza  := rSaldosAntPos.dDataAtuPos;

        vLista[k].TxJuros          := rSaldosAntPos.fTxJurosAnt;

        vLista[k].FormaCobranca    := rContrato.FlgFormaRec;

        vLista[k].FlgEnvio         := 0;
        vLista[k].FlgBaixado       := 0;
        vLista[k].FlgDivergPend    := -1;

        vLista[k].RecPag           := 'R';

        vLista[k].Regra            := cdsItensQuitacao.FieldByName('IDREGRACALC').AsInteger;

        vLista[k].FlgGravaZERO     := (cdsItensQuitacao.FieldByName('FLGGRAVAZERO').AsInteger = 1);

        cdsItensQuitacao.Next;
        inc(iContador);

        inc(i);  // incrementa a variável de índice do vetor do SQL
        inc(k);  // incrementa a variável de índice do vetor da Lista

      end; // while qryBuscaItens


      Result := True;

    except
      On E : Exception Do
      begin
        MessageInfo := E.Message;
        if bTransacao then Rollback;
        raise;
      end;
    end;

  finally
    cdsParametros.Free;
    cdsItensQuitacao.Free;
    cdsItens.Free;
    cdsParcelas.Free;
    cdsTipoContrato.Free;
    cdsParcelasAVencer.Free;
  end;

end; {CalculaItensQuitacao}



//Recupera itens de empréstimos
function TCtrlWebEmprestimo.BuscaItens( iIdTipoContrEmptmo, iItcEvento : integer ) : OleVariant;
var
  sSql : String;
begin
  sSql :=
   ' SELECT /*+RULE */ ' +
   '    RCT.IDITEMEMPTMO, ' +
   '    RCT.ITCRECPAG, ' +
   '    RCT.IDREGRACALC, ' +
   '    RCT.ITCPRIORIDADE, ' +
   '    RCT.IDPROVENTON, ' +
   '    DECODE(RCT.ITCEVENTO, -2, -2, -1, -1, 0, 0, 1, 2, 2, 6, 3, 9, 4, 7, 5, 1, 6, 3, 7, 4, 8, 5, 8) AS ORDENACAO, ' +
   '    RCT.ITCEVENTO, ' +
   '    RCT.ITCSEQCALCULO, ' +
   '    RCT.ITCTRATASALDODEV, ' +

   '    RCT.FLGCENTRALIZA, ' +
   '    RCT.FLGDESTACADO, ' +
   '    RCT.FLGGRAVAZERO, ' +

   '    TOTALGRUPO.IDITEMEMPTMO AS IDITEMCENTRALIZA, ' +

   '    IRC.ITEDESCRICAO ' +

   ' FROM ' +
   '    ITEMXTIPOCONTR RCT, ' +
   '    ITEMEMPTMO IRC, ' +

   '    ( ' +
   '    SELECT ' +
   '       IDITEMEMPTMO, ITCEVENTO ' +
   '    FROM ' +
   '       ITEMXTIPOCONTR ' +
   '    WHERE ' +
   '           ( IDTIPOCONTREMPTMO =' + IntToStr( iIdTipoContrEmptmo ) + ' ) ' +
   '       AND ( FLGCENTRALIZA     = 1 ) ' +
   '    ) TOTALGRUPO ' +

   ' WHERE ' +
   '        ( RCT.IDTIPOCONTREMPTMO =' + IntToStr( iIdTipoContrEmptmo ) + ' ) ' +
   '    AND ( RCT.IDITEMEMPTMO      = IRC.IDITEMEMPTMO ) ' +
   '    AND ( RCT.ITCEVENTO         = TOTALGRUPO.ITCEVENTO(+) ) ' +
   '    AND ' +
   '    ( ' +
   '    ((' + IntToStr( iItcEvento ) + ' = 0) AND ((RCT.ITCEVENTO =' + IntToStr( iItcEvento ) + ') OR (RCT.ITCEVENTO = 1 AND RCT.FLGCENTRALIZA = 1))) ' +
   '    OR ' +
   '    ((' + IntToStr( iItcEvento ) + ' <> 0) AND (RCT.ITCEVENTO =' + IntToStr( iItcEvento ) + ')) ' +
   '    ) ' +
   '    AND IRC.IDITEMEMPTMO > 0 ' +

   ' ORDER BY ' +
   '    RCT.ITCSEQCALCULO, RCT.ITCSEQCALCULO ' ;

  Result := GetDataPacket( sSql );

end; {BuscaItens}


//Verifica um documento
function TCtrlWebEmprestimo.VerificaDocumento( iCodDocumento: integer ): Integer;
var
  cdsDoc : TCMClientDataSet;
begin
  Result := 0;
  cdsDoc := TCMClientDataSet.Create( nil );
  try

    try

      cdsDoc.Data := GetDataPacket( ' select EMISBLOQ,      ' +
                                    '        STATUS         ' +
                                    ' from   DOCUMENTO      ' +
                                    ' where  CODDOCUMENTO = ' + IntToStr( iCodDocumento) );

      if not cdsDoc.isEmpty then
      begin
        if trim( cdsDoc.FieldByName('EMISBLOQ').AsString ) = 'S' then Result := -2;
        if trim( cdsDoc.FieldByName('STATUS').AsString )   = '2' then Result := -3;
      end;

    except
      Result := -1;
    end;

  finally
    cdsDoc.Close;
    cdsDoc.Free;
  end;

end; {VerificaDocumento}


//Remarca envio
function TCtrlWebEmprestimo.RemarcaEnvio( iIdContratoEmptmo : extended;
                                          sHmeFormaCobranca : string;
                                          iHmeAnoCobranca,   iHmeMesCobranca,
                                          iHmeParcela : integer ) : boolean;
var
  sSQL : string;
begin
  sSQL :=
   ' update HISTMOVEMPTMO                                        ' +
   ' set    FLGENVIO           = 0,                              ' +
   '        CODDOCUMENTO       = NULL                            ' +
   ' where  IDCONTRATOEMPTMO   = ' + FloatToStr(iIdContratoEmptmo) +
   '   and  FLGBAIXADO         = 0                               ' ;

  if sHmeFormaCobranca <> '' then
    sSQL := sSQL + '   and  HMEFORMACOBRANCA = ' + QuotedStr( sHmeFormaCobranca );

  if iHmeAnoCobranca > 0 then
    sSQL := sSQL + '   and  HMEANOCOBRANCA   = ' + IntToStr( iHmeAnoCobranca );

  if iHmeMesCobranca > 0 then
    sSQL := sSQL + '   and  HMEMESCOBRANCA   = ' + IntToStr( iHmeMesCobranca );

  if iHmeParcela > -1 then
    sSQL := sSQL + '   and  HMEPARCELA       = ' + IntToStr( iHmeParcela );

  Result := ExecSQL( sSQL );

end; {RemarcaEnvio}


function TCtrlWebEmprestimo.BuscaSaldosAntPos( iIdContratoEmptmo: extended;
                                               dData: TDateTime;
                                               iFlgSaldoDevAnt : integer;
                                               iFlgCalcDia : integer;
                                               bVerificaParcela : Boolean = False ) : TSaldosAntPos;
var
  sDiaSldDev     : string;
  cdsSaldoAntAtuDia,
  cdsSaldoParcelaAnt,
  cdsSaldoAnt : TCMClientDataSet;
  dDataSaldoDev  : TDateTime;
  dDataProcPos   : TDateTime;
begin

  Result.fSaldoDevAnt  := 0;
  Result.fTxJurosAnt   := 0;
  Result.iParcelaAnt   := 0;
  Result.iParcRestaAnt := 0;

  Result.fSaldoDevPos  := 0;
  Result.fTxJurosPos   := 0;
  Result.iParcelaPos   := 0;
  Result.iParcRestaPos := 0;


  sDiaSldDev := 'C';
  if not( iFlgSaldoDevAnt = 0 ) then
  begin
    case iFlgSaldoDevAnt of
       1 : sDiaSldDev := 'A';
    end;
  end;

  dDataSaldoDev := dData;
  if sDiaSldDev = 'A' then dDataSaldoDev := (dData - 1);


  cdsSaldoAnt        := TCMClientDataSet.Create( nil );
  cdsSaldoAntAtuDia  := TCMClientDataSet.Create( nil );
  cdsSaldoParcelaAnt := TCMClientDataSet.Create( nil );
  try

    if iFlgCalcDia = 1 then
    begin

      // Busca o saldo devedor em uma determinada data (exata)
      cdsSaldoAntAtuDia.Data := SaldoAntAtuDia( iIdContratoEmptmo, dData );

      if not( cdsSaldoAntAtuDia.IsEmpty ) then
      begin

        Result.fSaldoDevAnt  := cdsSaldoAntAtuDia.FieldByName('HMESALDODEV').AsCurrency;
        Result.fTxJurosAnt   := cdsSaldoAntAtuDia.FieldByName('HMETXJUROS').AsCurrency;
        Result.dDataAtuAnt   := cdsSaldoAntAtuDia.FieldByName('HMEDATAATUALIZA').AsDateTime;
        Result.iParcelaAnt   := cdsSaldoAntAtuDia.FieldByName('HMEPARCELA').AsInteger;


        if not(cdsSaldoAntAtuDia.FieldByName('HMEPARCELAALT').isNULL) then
        begin
          Result.iParcelaAltAnt := cdsSaldoAntAtuDia.FieldByName('HMEPARCELAALT').AsInteger;
        end;

        Result.iParcRestaAnt := cdsSaldoAntAtuDia.FieldByName('HMENUMPARCELAS').AsInteger;

        Result.fSaldoDevPos  := cdsSaldoAntAtuDia.FieldByName('HMESALDODEV').AsCurrency;
        Result.fTxJurosPos   := cdsSaldoAntAtuDia.FieldByName('HMETXJUROS').AsCurrency;
        Result.dDataAtuPos   := cdsSaldoAntAtuDia.FieldByName('HMEDATAATUALIZA').AsDateTime;
        Result.iParcelaPos   := cdsSaldoAntAtuDia.FieldByName('HMEPARCELA').AsInteger;
        Result.iParcRestaPos := cdsSaldoAntAtuDia.FieldByName('HMENUMPARCELAS').AsInteger;
      end;

      // Busca a parcela atual e as parcelas restantes
      // (Pode ser necessário caso o registro do saldo devedor corresponder a uma atualização
      //  diária, que terá sempre parcela ZERO)
      if bVerificaParcela then
      begin

        cdsSaldoParcelaAnt.Data := SaldoParcelaAnt( iIdContratoEmptmo, dData, 1 );

        if not ( cdsSaldoParcelaAnt.IsEmpty ) then
        begin
          Result.iParcelaAnt   := cdsSaldoParcelaAnt.FieldByName('HMEPARCELA').AsInteger;
          Result.iParcRestaAnt := cdsSaldoParcelaAnt.FieldByName('HMENUMPARCELAS').AsInteger;
        end;

        dDataProcPos := SomaAnos( dData, 10 );

        cdsSaldoParcelaAnt.Close;

        cdsSaldoParcelaAnt.Data := SaldoParcelaAnt( iIdContratoEmptmo, dDataProcPos, 1 );

        if not ( cdsSaldoParcelaAnt.IsEmpty ) then
        begin
          Result.iParcelaPos   := cdsSaldoParcelaAnt.FieldByName('HMEPARCELA').AsInteger;
          Result.iParcRestaPos := cdsSaldoParcelaAnt.FieldByName('HMENUMPARCELAS').AsInteger;
        end;
      end;

    end
    else  // if iFLGCALCDIA = 1
    begin

      //Busca dados anteriores à data de processamento
      cdsSaldoAnt.Close;
      cdsSaldoAnt.Data := SaldoAnt( iIdContratoEmptmo, dDataSaldoDev );
      if not cdsSaldoAnt.IsEmpty then
      begin

        Result.fSaldoDevAnt  := cdsSaldoAnt.FieldByName('HMESALDODEV').AsCurrency;
        Result.fTxJurosAnt   := cdsSaldoAnt.FieldByName('HMETXJUROS').AsCurrency;
        Result.iParcelaAnt   := cdsSaldoAnt.FieldByName('HMEPARCELA').AsInteger;
        Result.iParcRestaAnt := cdsSaldoAnt.FieldByName('HMENUMPARCELAS').AsInteger;
        Result.dDataAtuAnt   := cdsSaldoAnt.FieldByName('HMEDATAATUALIZA').AsDateTime;
      end;

      dDataProcPos := SomaAnos( dData, 10 );

      //Busca dados posteriores à data de processamento
      cdsSaldoAnt.Close;

      cdsSaldoAnt.Data := SaldoAnt( iIdContratoEmptmo, dDataProcPos );
      if not cdsSaldoAnt.IsEmpty then
      begin

        Result.fSaldoDevPos  := cdsSaldoAnt.FieldByName('HMESALDODEV').AsFloat;
        Result.fTxJurosPos   := cdsSaldoAnt.FieldByName('HMETXJUROS').AsFloat;
        Result.iParcelaPos   := cdsSaldoAnt.FieldByName('HMEPARCELA').AsInteger;
        Result.iParcRestaPos := cdsSaldoAnt.FieldByName('HMENUMPARCELAS').AsInteger;
        Result.dDataAtuPos   := cdsSaldoAnt.FieldByName('HMEDATAATUALIZA').AsDateTime;

      end;

    end;

  finally

    cdsSaldoAntAtuDia.Free;
    cdsSaldoParcelaAnt.Free;
    cdsSaldoAnt.Free;
  end;

end; {BuscaSaldosAntPos}


function TCtrlWebEmprestimo.SaldoAnt(iIdContratoEmptmo: extended; dHmeDataAtualiza: TDateTime): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' select    HMEDATAATUALIZA,                                                                    ' +
   '           HMESALDODEV,                                                                        ' +
   '           HMETXJUROS,                                                                         ' +
   '           HMEPARCELA,                                                                         ' +
   '           HMENUMPARCELAS                                                                      ' +
   ' from      HISTMOVEMPTMO hme,                                                                  ' +
   '           ( select                                                                            ' +
   '                       max( IDHISTMOVEMPTMO ) as IDHISTMOVEMPTMO                               ' +
   '             from      HISTMOVEMPTMO   hme,                                                    ' +
   '                       CONTRATOEMPTMO  con,                                                    ' +
   '                       ITEMXTIPOCONTR  itc,                                                    ' +
   '                       TIPOCONTREMPTMO tce                                                     ' +
   '             where     ( con.IDCONTRATOEMPTMO   =  ' + FloatToStr( iIdContratoEmptmo ) + ' )   ' +
   '               and     ( itc.ITCTRATASALDODEV   <> 0 )                                         ' +
   '               and     ( ( hme.FLGESTORNADO     =  0 ) or ( hme.FLGESTORNADO is null) )        ' +
   '               and     ( hme.HMEDATAATUALIZA    =  ( select max( h.hMEDATAATUALIZA ) as HMEDATAATUALIZA ' +
   '                                                     from   HISTMOVEMPTMO   h, ' +
   '                                                            CONTRATOEMPTMO  c, ' +
   '                                                            ITEMXTIPOCONTR  i  ' +
   '                                                     where  ( c.IDCONTRATOEMPTMO   =  ' + FloatToStr( iIdContratoEmptmo ) + ' ) ' +
   '                                                       and  ( h.HMEDATAATUALIZA    <= to_date( ''' + FormatDateTime('dd/mm/yyyy',
                                                                   dHmeDataAtualiza ) + ''', ''DD/MM/YYYY'') ) ' +
   '                                                       and  ( i.ITCTRATASALDODEV   <> 0 ) ' +
   '                                                       and  ( ( h.FLGESTORNADO     =  0 ) or ( h.FLGESTORNADO is null ) ) ' +
   '                                                       and  ( h.IDCONTRATOEMPTMO   =  c.IDCONTRATOEMPTMO ) ' +
   '                                                       and  ( c.IDTIPOCONTREMPTMO  =  i.IDTIPOCONTREMPTMO ) ' +
   '                                                       and  ( h.IDITEMEMPTMO       =  i.IDITEMEMPTMO ) ' +
   '                                                     ) )                                       ' +
   '               and     ( hme.IDCONTRATOEMPTMO   =  con.IDCONTRATOEMPTMO )                      ' +
   '               and     ( con.IDTIPOCONTREMPTMO  =  tce.IDTIPOCONTREMPTMO )                     ' +
   '               and     ( tce.IDTIPOCONTREMPTMO  =  itc.IDTIPOCONTREMPTMO )                     ' +
   '               and     ( hme.IDITEMEMPTMO       =  itc.IDITEMEMPTMO ) ) max                    ' +
   ' where     HME.IDHISTMOVEMPTMO = MAX.IDHISTMOVEMPTMO                                           ' ;

   if bGeraLogQuery then CMDebugToFile( 'Início Query Saldo Anterior.. ', sNomeArqLog );
   if bGeraLogQuery then CMDebugToFile( sSQL, sNomeArqLog );
   Result := GetDataPacket( sSQL );
   if bGeraLogQuery then CMDebugToFile( 'Término Query Saldo Anterior.. ', sNomeArqLog );

  Result := GetDataPacket( sSQL );
end; {SaldoAnt}


function TCtrlWebEmprestimo.SomaAnos(dDataIni: TDateTime; iAnos: integer): TDateTime;
begin
  Result := IncMonth( dDataIni, iAnos * 12 );
end; {SomaAnos}


//Itens de empréstimos
function TCtrlWebEmprestimo.ItensEmprestimo( iIdContratoEmptmo : extended; iHmeTipoMov,
  iHmeParcela, iFlgEnvio, iFlgBaixado, iFlgDivergPend, iHmeAnoCompetencia,
  iHmeMesCompetencia: integer; dHmeDataPrevista, dHmeDataEfetiva, dHmeDataVencto,
  dHmeDataAtualiza: TDateTime; iCentralizado, iAgrupado, iEventoExclusao,
  iIdItemEmptmo, iAbonoDiverg : integer): OleVariant;
var
  sSQL : String;
begin
  sSQL :=
   ' select    /*+INDEX(HME XIE29HISTMOVEMPTMO)*/                               ' +
   '           hme.IDHISTMOVEMPTMO,                                             ' +
   '           hme.IDITEMEMPTMO,                                                ' +
   '   DECODE(HME.HMETIPOMOV, -2, -2,                                           ' +
   '                          -1, -1,                                           ' +
   '                           0,  0,                                           ' +
   '                           1,  2,                                           ' +
   '                           2,  6,                                           ' +
   '                           3,  9,                                           ' +
   '                           4,  7,                                           ' +
   '                           5,  1,                                           ' +
   '                           6,  3,                                           ' +
   '                           7,  4,                                           ' +
   '                           8,  5,                                           ' +
   '                               8                                            ' +
   '         ) AS ORDENACAO,                                                    ' +
   '           hme.HMETIPOMOV,                                                  ' +
   '           hme.HMEORIGEM,                                                   ' +
   '           hme.HMEPARCELA,                                                  ' +
   '           hme.HMEPARCELAALT,                                               ' +
   '           hme.HMENUMPARCELAS,                                              ' +
   '           hme.HMECENTRALIZA,                                               ' +
   '           hme.HMEDESTACADO,                                                ' +
   '           hme.HMEDATA,                                                     ' +
   '           hme.HMEDATAPREVISTA,                                             ' +
   '           hme.HMEDATAEFETIVA,                                              ' +
   '           hme.HMEDATAATUALIZA,                                             ' +
   '           hme.HMEDATAVENCTO,                                               ' +
   '           hme.HMEANOCOMPETENCIA,                                           ' +
   '           hme.HMEMESCOMPETENCIA,                                           ' +
   '           hme.HMEANOCOBRANCA,                                              ' +
   '           hme.HMEMESCOBRANCA,                                              ' +
   '           hme.HMEVLRPREVISTO,                                              ' +
   '           hme.HMEVLREFETIVO,                                               ' +
   '           hme.HMESALDODEV,                                                 ' +
   '           hme.HMETXJUROS,                                                  ' +
   '           hme.HMEFORMACOBRANCA,                                            ' +
   '           nvl( hme.FLGENVIO,      1 ) as FLGENVIO,                         ' +
   '           nvl( hme.FLGBAIXADO,    1 ) as FLGBAIXADO,                       ' +
   '           nvl( hme.FLGESTORNADO,  0 ) as FLGESTORNADO,                     ' +
   '           nvl( hme.FLGQUITADO,    0 ) as FLGQUITADO,                       ' +
   '           nvl( hme.FLGABONADO,    0 ) as FLGABONADO,                       ' +
   '           nvl( hme.FLGDIVERGPEND, 0 ) as FLGDIVERGPEND,                    ' +
   '           decode( nvl( hme.FLGSUSPENSAO,  0 ), 0, 0,                       ' +
   '            nvl(nvl(hme.IDTIPOSUSPEMPTMO, CON.IDTIPOSUSPEMPTMO),            ' +
   '            nvl(hme.FLGSUSPENSAO, 0 ) ) ) as FLGSUSPENSAO,                  ' +
   '           ite.ITEDESCRICAO                                                 ' +
   ' from      HISTMOVEMPTMO  hme,                                              ' +
   '           CONTRATOEMPTMO con,                                              ' +
   '           ITEMEMPTMO     ite                                               ' +
   ' where     ( hme.IDCONTRATOEMPTMO = ' + FloatToStr( iIdContratoEmptmo )+' ) ' +
   '   and     ( ite.IDITEMEMPTMO     > 0                                     ) ' +
   '   and     ( hme.HMETIPOMOV       not in ( 5, 8 )                         ) ' +
   '   and     ( nvl( hme.FLGESTORNADO, 0 ) = 0                               ) ' +
   '   and     ( nvl( hme.FLGQUITADO,   0 ) = 0                               ) ' +
   '   and     ( hme.IDITEMEMPTMO           = ite.IDITEMEMPTMO                ) ' +
   '   and     ( hme.IDCONTRATOEMPTMO       = con.IDCONTRATOEMPTMO            ) ' ;

  if iIdItemEmptmo > -1 then
    sSQL := sSQL +
     '   and     ( ite.IDITEMEMPTMO      = ' + IntToStr( iIdItemEmptmo )      + ' ) ' ;

  sSQL := sSQL +
   '   and ( ( ' + IntToStr( iAbonoDiverg ) + ' = 1 ) or ( nvl( hme.FLGABONADO, 0 ) = 0 ) )';

  if iHmeTipoMov > -1 then
    sSQL := sSQL +
     '   and     ( hme.HMETIPOMOV        = ' + IntToStr( iHmeTipoMov )        + ' ) ' ;

  if iHmeParcela > -1 then
    sSQL := sSQL +
     '   and     ( hme.HMEPARCELA        = ' + IntToStr( iHmeParcela )        + ' ) ' ;

  if iFlgEnvio > -1 then
    sSQL := sSQL +
     '   and     ( hme.FLGENVIO          = ' + IntToStr( iFlgEnvio )          + ' ) ' ;

  if iFlgBaixado > -1 then
    sSQL := sSQL +
     '   and     ( hme.FLGBAIXADO        = ' + IntToStr( iFlgBaixado )        + ' ) ' ;

  if iFlgDivergPend > -1 then
    sSQL := sSQL +
     '   and     ( hme.FLGDIVERGPEND     = ' + IntToStr( iFlgDivergPend )     + ' ) ' ;

  if iHmeAnoCompetencia > 0 then
    sSQL := sSQL +
     '   and     ( hme.HMEANOCOMPETENCIA = ' + IntToStr( iHmeAnoCompetencia ) + ' ) ' ;

  if iHmeMesCompetencia > 0 then
    sSQL := sSQL +
     '   and     ( hme.HMEMESCOMPETENCIA = ' + IntToStr( iHmeMesCompetencia ) + ' ) ' ;

  if dHmeDataPrevista > 0 then
    sSQL := sSQL +
     '   and     ( hme.HMEDATAPREVISTA   = to_date(''' +
     FormatDateTime( 'dd/mm/yyyy', dHmeDataPrevista ) + ''', ''DD/MM/YYYY'' ) )';

  if dHmeDataEfetiva > 0 then
    sSQL := sSQL +
     '   and     ( hme.HMEDATAEFETIVA    = to_date(''' +
     FormatDateTime( 'dd/mm/yyyy', dHmeDataEfetiva ) + ''', ''DD/MM/YYYY'' ) )';

  if dHmeDataVencto > 0 then
    sSQL := sSQL +
     '   and     ( hme.HMEDATAVENCTO     = to_date(''' +
     FormatDateTime( 'dd/mm/yyyy', dHmeDataVencto ) + ''', ''DD/MM/YYYY'' ) )';

  if dHmeDataAtualiza > 0 then
    sSQL := sSQL +
     '   and     ( hme.HMEDATAATUALIZA   = to_date(''' +
     FormatDateTime( 'dd/mm/yyyy', dHmeDataAtualiza ) + ''', ''DD/MM/YYYY'' ) )';

  if iCentralizado > 0 then
    sSQL := sSQL +
     '   and     ( ( hme.HMECENTRALIZA = 1 ) or ( hme.HMEDESTACADO = 1 ) ) ' ;

  if iAgrupado > 0 then
    sSQL := sSQL +
     '   and     ( ( hme.HMECENTRALIZA = 0 ) or ( hme.HMEDESTACADO = 0 ) ) ' ;

  if iEventoExclusao > 0 then
    sSQL := sSQL +
     '   and     ( hme.HMETIPOMOV <> ' + IntToStr( iEventoExclusao ) + ' ) ' ;

  sSQL := sSQL +
   ' order by  HME.HMEANOCOMPETENCIA,                                          ' +
   '           HME.HMEMESCOMPETENCIA,                                          ' +
   '           HME.HMEPARCELA                                                  ' ;

   if bGeraLogQuery then CMDebugToFile( 'Início Query Itens Emprestimo.. ', sNomeArqLog );
   if bGeraLogQuery then CMDebugToFile( sSQL, sNomeArqLog );
  Result := GetDataPacket( sSQL );
   if bGeraLogQuery then CMDebugToFile( 'Término Query Itens Emprestimo.. ', sNomeArqLog );
end; {ItensEmprestimo}


//Função que retorna o Dia de uma determinada data
function TCtrlWebEmprestimo.ExtraiDia(dData: tDateTime): word;
var
  iAno, iMes, iDia: word;
begin
  DecodeDate(dData, iAno, iMes, iDia);
  Result := iDia;
end; {ExtraiDia}


//Função que retorna o Dia de uma determinada data
function TCtrlWebEmprestimo.ExtraiMes(dData: tDateTime): word;
var
  iAno, iMes, iDia: word;
begin
  DecodeDate(dData, iAno, iMes, iDia);
  Result := iMes;
end; {ExtraiMes}



//Função que retorna o Dia de uma determinada data
function TCtrlWebEmprestimo.ExtraiAno(dData: tDateTime): word;
var
  iAno, iMes, iDia: word;
begin
  DecodeDate(dData, iAno, iMes, iDia);
  Result := iAno;
end; {ExtraiAno}


constructor TCtrlWebEmprestimo.Create;
begin
  inherited;
  FWebRegra        := TCtrlWebRegra.Create;
  FReports         := TCtrlReports.Create;

  // Auto-Emprestimo
  sNomeArqLog      := '';
  bGeraLogProcesso := False;
  bGeraLogQuery    := False;

end;

destructor TCtrlWebEmprestimo.Destroy;
begin
  FWebRegra.Free;
  FReports.Free;
  inherited;
end;

procedure TCtrlWebEmprestimo.AfterInitialize;
begin
  inherited;
  FWebRegra.InitializeAs( Self );
  FReports.InitializeAs( Self );
end;

procedure TCtrlWebEmprestimo.SetWebRegra(const Value: TCtrlWebRegra);
begin
  FWebRegra := Value;
end;

//Indica se há uma transação em andamento
function TCtrlWebEmprestimo.InTransaction: boolean;
begin
  if DbConnectionType = cntBDE then
    Result := DataBase.InTransaction
  else
    Result := DbAdoConnection.InTransaction;
end;


//Converte '.' para ','
function TCtrlWebEmprestimo.ConverteVirg( sConverter : String ): String;
var
  iPosPonto : Integer;
begin
  iPosPonto := Pos('.', sConverter);

  if iPosPonto <> 0 then
    sConverter := Copy(sConverter, 1, iPosPonto - 1) + ',' +
                  Copy(sConverter, iPosPonto + 1, Length(sConverter));

  Result := sConverter;
end; {ConverteVirg}

function TCtrlWebEmprestimo.NumParcelas(iIdTipoContrEmptmo,
  iIdTipoEmptmo: integer) : OleVariant;
begin
  Result := GetDataPacket(
   ' select  TCEMINPARC,                                          ' +
   '         TCEMAXPARC                                           ' +
   ' from    TIPOCONTREMPTMO                                      ' +
   ' where   IDTIPOCONTREMPTMO = ' + IntToStr( iIdTipoContrEmptmo ) +
   '   and   IDTIPOEMPTMO      = ' + IntToStr( iIdTipoEmptmo      ) );
end;


//Recupera dados do participante para cálculo do salário base
function TCtrlWebEmprestimo.DadosSalPart( iIdPessoa : integer ) : OleVariant;
begin
  Result := GetDataPacket(
   ' select    nvl( PPP.SALPARTICIPACAO, 0 ) as SALPARTICIPACAO,        ' +
   '           nvl( PPP.SALMANTIDO, 0 )      as SALMANTIDO,             ' +
   '           nvl( PPP.SALAUXDOENCA, 0 )    as SALAUXDOENCA,           ' +
   '           nvl( BEN.VALORATUAL, 0 )      as VALORATUAL,             ' +
   '           ben.IDBENEFICIO,                                         ' +
   '           ben.IDSITBENEFICIO,                                      ' +
   '           ben.DATAFINAL,                                           ' +
   '           ben.DATAFINALPREVISTA,                                   ' +
   '           ben.IDTPPAGTOBENEFIC,                                    ' +
   '           elp.IDPESSJUR,                                           ' +
   '           ppp.IDPESSOA,                                            ' +
   '           pfi.DATANASC,                                            ' +
   '           pfi.SEXO,                                                ' +
   '           ppp.IDSITPART,                                           ' +
   '           sit.FLGINTERNO,                                          ' +
   '           elp.IDSITFUNC                                            ' +
   {Pendência 22836 - 03/10/2006}
   '          ,00 as FLGEXCEPCIONAL                                     ' +
   {Fim Pendência 22836}
   ' from      PESSOAFISICA pfi,                                        ' +
   '           ( select *                                               ' +
   '             from   PARTPREVPLAN                                    ' +
   '             where  SEQPROPOSTA   = 1                               ' +
   '               and  FLGDESATIVADO = 0 ) ppp,                        ' +
   '           ELEGPATRO    elp,                                        ' +
   '           SITPART      sit,                                        ' +
   '           ( select    bf.IDPESSOA,                                 ' +
   '                       bf.IDTITULAR,                                ' +
   '                       bf.VALORATUAL,                               ' +
   '                       bf.IDBENEFICIO,                              ' +
   '                       bf.IDSITBENEFICIO,                           ' +
   '                       bf.DATAFINAL,                                ' +
   '                       bf.DATAFINALPREVISTA                         ' +
   '             from      BENEFBFCIARIO bf                             ' +
   '             where     bf.IDTITULAR     = ' + IntToStr( iIdPessoa )   +
   '               and     ( ( bf.DATAFINAL > sysdate )                 ' +
   '                or       ( bf.DATAFINAL is null   ) ) ) ben         ' +
   ' where     ppp.IDPESSOA      = ' + IntToStr( iIdPessoa )              +
   '   and     ppp.IDPESSOA      = ben.IDTITULAR (+)                    ' +
   '   and     ppp.IDSITPART     = sit.IDSITPART                        ' +
   '   and     elp.IDPESSOA      = ppp.IDPESSOA                         ' +
   '   and     ppp.IDPESSOA      = pfi.IDPESSOA  (+)                    ' );
end; {DadosSalPart}


//Recupera regra correspondente ao item de menor sequência de cálculo
function TCtrlWebEmprestimo.RegraItemMenorSeq( iIdTipoContrEmptmo : integer ) : integer;
var
  cdsLocal : TCMClientDataSet;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try

    cdsLocal.Data := GetDataPacket(
     ' select IDREGRAVLRMAX as IDREGRACALC                         ' +
     ' from   TIPOCONTREMPTMO                                      ' +
     ' where  IDTIPOCONTREMPTMO = ' + IntToStr( iIdTipoContrEmptmo ) );

    if ( cdsLocal.IsEmpty ) or ( cdsLocal.FieldByName('IDREGRACALC').AsInteger <= 0 ) then
    begin
      cdsLocal.Close;

      cdsLocal.Data := GetDataPacket(
       ' select  IDREGRACALC                                                                           ' +
       '   from  ITEMXTIPOCONTR                                                                        ' +
       '  where  IDTIPOCONTREMPTMO = ' + IntToStr( iIdTipoContrEmptmo )                                  +
       '    and  ITCEVENTO         = 0                                                                 ' +
       '    and  ITCSEQCALCULO     = ( select min( seq.ITCSEQCALCULO )                                 ' +
       '                                 from ITEMXTIPOCONTR seq                                       ' +
       '                                where seq.IDTIPOCONTREMPTMO = ' + IntToStr( iIdTipoContrEmptmo ) +
       '                                  and seq.ITCEVENTO         = 0  )                             ' );

    end;

    Result := cdsLocal.FieldByName('IDREGRACALC').AsInteger;

    cdsLocal.Close;

  finally
    cdsLocal.Free;
  end;

end; {RegraItemMenorSeq}


//Gera simulação de parcelas do empréstimo
function TCtrlWebEmprestimo.SimulaEmprestimo( sParcelas : string;
                                              iIdTipoContrEmptmo,
                                              iIdEmpresaProp,
                                              iIdPais,
                                              iIdCidades,
                                              iTipoContrQuitAnt : integer;
                                              sCodEstado : String;
                                              fSalPart,
                                              fSalMantido,
                                              fSalAuxDoenca,
                                              fSalBenef,
                                              //Pendência 24902 - 20/12/2007
                                              //fSalarioBase,
                                              //fVlrMaxPermit : Currency;
                                              fSalarioBase : Currency;
                                              var fVlrMaxPermit : Currency;
                                              sMoeSigla : string;
                                              fVlrParcela,
                                              fVlrMargem,
                                              fValReserva,
                                              fTxJuros,
                                              fSaldoaQuitar,
                                              fVlrSolicitado,
                                              fVlrContratosAnt,
                                              fSaldoQuitacao : Currency;
                                              sAnoMesCompetencia : string;
                                              DataCredito,
                                              DataAssinatura,
                                              DataInscricao,
                                              dDataPrimParc : TDateTime;
                                              iIdSitPart,
                                              iIdPatro,
                                              iIdPlanoPrev,
                                              iIdTitular,
                                              iIdBenef : integer;
                                              bFlgExcepcional : boolean;
                                              iIdContratoEmptmoAnt : extended;
                                              iPrazoAnt            : integer;
                                              fValorSolicAnt       : Currency;
                                              dDataCreditoAnt      : TDateTime;
                                              iUltParcelaGerada,
                                              iPrazoAnterior,
                                              iNumParcPagas : integer;
                                              fVlrDevSeg,
                                              fVlrSeguroAnt,
                                              fVlrSeguroComplAnt : Currency;
                                              fVlrDividas : Currency;
                                              var vLista : TListaItem
                                              //Pendência 22248 - 01/08/2006
                                              ; iIDREGRAMARGEM, iTipoCliente : Integer;
                                              fTotalParcelas, fTotalPendencias : Currency;
                                              iMaxParcelas : Integer;
                                              sFLGINTERNO : String
                                              //Fim Pendência 22248
                                              ) : OleVariant;
var
  i, iParcela, iItem : Integer;

  rNovoContrato        : TDadosContrato;
  rConcessao           : TDadosConcessao;

  vListaSimulacao      : TListaItem;

  sSqlNomesCampos1,
  sSqlNomesCampos2,
  sSqlDados,
  sSqlCampos           : string;

  fVlParcela,
  fVlLiquido,
  fVlSolic : Currency;

  // AutoEmprestimo - 25/09/2007
  iItParcela,
  iItLiquido,
  iItSolic : Integer;


  aParcelas : array of string;

  //Pendência 24902 - 20/12/2007
  fVlrMax : Currency;

  //Pendência 27378 - 25/02/2008
  fVlrSolic : Currency;

begin

  sSqlNomesCampos1 := '';
  sSqlNomesCampos2 := '';
  sSqlDados       := '';
  fVlParcela      := 0;
  fVlLiquido      := 0;
  fVlSolic        := 0;

  // AutoEmprestimo - 25/09/2007
  iItParcela      := 0;
  iItLiquido      := 0;
  iItSolic        := 0;

  try

    //Construindo parcelas...
    while sParcelas <> '' do
    begin
      SetLength( aParcelas, length( aParcelas ) + 1 );
      aParcelas[High(aParcelas)] := RetiraPrimeiroElemento( sParcelas, ';' );
    end;

    //Início da montagem das parcelas.
    vLista := nil;

    //Pendência 24902 - 20/12/2007
    fVlrMaxPermit := 0;

    for i := 0 to High( aParcelas ) do
    begin
      iParcela := StrToInt( aParcelas[i] );

      //Pendência 27378 - 25/02/2008
      fVlrSolic := fVlrSolicitado;

      //Pendência 22248 - 03/08/2006
      if iTipoCliente = 19981 then begin

        //Início do cálculo da margem.
        fVlrMargem := Arredonda( BuscaMargem( iIdTitular,
                                              iIdBenef,
                                              iIdEmpresaProp,
                                              iIDREGRAMARGEM,
                                              fSalarioBase,
                                              fTotalParcelas,
                                              fTotalPendencias,
                                              bFlgExcepcional,
                                              Now, iParcela, False, 0, '' , iTipoCliente ), 2 );

        //Pendência 24902 - 20/12/2007
        //fVlrMaxPermit
        fVlrMax := Arredonda( BuscaVlrSolicMax( iIdEmpresaProp,
                                                      iIdTipoContrEmptmo,
                                                      iIdPatro,
                                                      iIdPlanoPrev,
                                                      iIdTitular,
                                                      iIdBenef,
                                                      iIdSitPart,
                                                      //iMaxParcelas,
                                                      iParcela,
                                                      sFLGINTERNO,
                                                      fVlrMargem,
                                                      fValReserva,
                                                      fTxJuros,
                                                      fSaldoaQuitar,
                                                      0,
                                                      fSaldoQuitacao,
                                                      fSalPart,
                                                      fSalMantido,
                                                      fSalAuxDoenca,
                                                      fSalBenef,
                                                      fSalarioBase,
                                                      0,
                                                      DataAssinatura,
                                                      DataCredito,
                                                      dDataPrimParc,
                                                      iTipoCliente,
                                                      '',
                                                      null), 2 );

        //Pendência 24902 - 20/12/2007
        if fVlrMax > fVlrMaxPermit then
           fVlrMaxPermit := fVlrMax;

        //Pendência 27378 - 25/02/2008
        if fVlrSolicitado > fVlrMaxPermit then
           fVlrSolic := fVlrMaxPermit;

        //if fVlrSolicitado > fVlrMaxPermit then
        //Result := Result + '<p class="CORPO" align="center">O valor solicitado ultrapassa o valor máximo de contratação.</p><BR><BR>'
        //CMDebugToFile('Fim do cálculo da margem.');
      end;
      //Fim Pendência 22248

      vListaSimulacao := nil;

      //Preenche os dados do contrato e da concessão
      LimpaRegistroContrato( rNovoContrato );
      rNovoContrato.IDContratoEmptmo  := -1;
      rNovoContrato.IDTipoContrEmptmo := iIdTipoContrEmptmo;
      rNovoContrato.SiglaIndexador    := sMoeSigla;
      rNovoContrato.NumParcelas       := iParcela;
      rNovoContrato.VlrParcela        := fVlrParcela;
      rNovoContrato.DataCredito       := DataCredito;
      rNovoContrato.DataAssinatura    := DataAssinatura;
      rNovoContrato.DataInscricao     := DataInscricao;
      rNovoContrato.DataPrimParc      := dDataPrimParc;
      rNovoContrato.IDPatro           := iIdPatro;
      rNovoContrato.IDPlanoPrev       := iIdPlanoPrev;
      rNovoContrato.IDBenef           := iIdBenef;
      rNovoContrato.IDPessoa          := iIdTitular;

      LimpaRegistroConcessao( rConcessao );
      rConcessao.IDContratoEmptmo     := iIdContratoEmptmoAnt;
      rConcessao.Prazo                := iPrazoAnt;
      rConcessao.ValorSolic           := fValorSolicAnt;
      rConcessao.DataCredito          := dDataCreditoAnt;
      rConcessao.SaldoQuitacao        := fSaldoQuitacao;

      CalculaItens( rNovoContrato,
                    rConcessao,
                    0,                         // Tipo do item - É parcela 0 na Concessão
                    0,                         // Origem - 0 na Inscrição
                    iIdPais, sCodEstado, iIdCidades,
                    0,                         // concessão
                    iIdSitPart,                // Débito - Folha ou Contas a Receber
                    rNovoContrato.FlgFormaPag,
                    fTxJuros,
                    0,                         // Na concessão o Saldo Devedor inicia com Zero e depois de calculado será o Valor Solicitado
                    //Pendência 27378 - 25/02/2008
                    //fVlrSolicitado,            // Valor Solicitado
                    fVlrSolic,
                    fSaldoaQuitar,             // Saldo de Empréstimo Anteriores
                    fVlrMargem,
                    fValReserva,
                    fSalPart, fSalMantido, fSalAuxDoenca, fSalBenef,
                    fSalarioBase,
                    fVlrMaxPermit,
                    iNumParcPagas,
                    iPrazoAnterior,
                    iUltParcelaGerada,
                    rNovoContrato.DataAssinatura,
                    rNovoContrato.DataAssinatura,
                    sAnoMesCompetencia,
                    iIdEmpresaProp,
                    vListaSimulacao,
                    fVlrDevSeg,
                    fVlrSeguroAnt,
                    fVlrSeguroComplAnt,
                    True,
                    fVlrContratosAnt,
                    fVlrDividas,
                    iTipoContrQuitAnt,
                    False,                           // bCriaObjetoRegra    : Boolean = False;
                    0,                               // dDataAtraso         : TDateTime = 0;
                    0,                               // fValorEmAberto      : Currency = 0;
                    0,                               // dDataAtrasoAnt      : TDateTime = 0;
                    0,                               // fValorEmAbertoAnt   : Currency = 0;
                    0,                               // fValorProvisao      : Currency = 0;
                    True                             // bGravaQueryRegra    : Boolean = True;
                   );

      //Varre os itens e cria os campos
      sSqlCampos := '';
      for iItem := 0 to High( vListaSimulacao ) do
      begin
        //Inclui o valor calculado no SQL de campos
        sSqlCampos := sSqlCampos + ', ' + QuotedStr( ConverteVirgulaParaPonto( vListaSimulacao[iItem].Valor ) );

        //Se é a primeira parcela, pega os nomes dos campos
        if iParcela = StrToInt( aParcelas[0] ) then
          sSqlNomesCampos2 := sSqlNomesCampos2 + ', ' + QuotedStr( vListaSimulacao[iItem].Nome ) + ' as x' + IntToStr( vListaSimulacao[iItem].CodigoItem );

        //Recupera valor solicitado, o valor da parcela e o valor líquido

        //Valor Solicitado
        if   (
             ( vListaSimulacao[iItem].iEvento       = 0 ) and
             ( vListaSimulacao[iItem].FlgCentraliza = 0 ) and
             ( iItem                                = 0 ) ) then begin
          fVlSolic := vListaSimulacao[iItem].Valor;
          iItSolic := vListaSimulacao[iItem].CodigoItem;
        end;

        //Parcela
        if   ( ( vListaSimulacao[iItem].iEvento     = 1 ) and
             ( vListaSimulacao[iItem].FlgCentraliza = 1 ) ) then begin
          fVlParcela := vListaSimulacao[iItem].Valor;
          iItParcela := vListaSimulacao[iItem].CodigoItem;
        end;

        //Valor Líquido
        if   ( ( vListaSimulacao[iItem].iEvento     = 0 ) and
             ( vListaSimulacao[iItem].FlgCentraliza = 1 ) ) then begin
          fVlLiquido := vListaSimulacao[iItem].Valor;
          iItLiquido := vListaSimulacao[iItem].CodigoItem;
        end;

        //Preenche a lista para uso posterior
        SetLength( vLista, length( vLista ) + 1 );
        vLista[High(vLista)].IDHistMovEmptmo     := vListaSimulacao[iItem].IDHistMovEmptmo;
        vLista[High(vLista)].CodigoItem          := vListaSimulacao[iItem].CodigoItem;
        vLista[High(vLista)].Regra               := vListaSimulacao[iItem].Regra;
        vLista[High(vLista)].Rubrica             := vListaSimulacao[iItem].Rubrica;
        vLista[High(vLista)].iEvento             := vListaSimulacao[iItem].iEvento;
        vLista[High(vLista)].FlgEnvio            := vListaSimulacao[iItem].FlgEnvio;
        vLista[High(vLista)].FlgBaixado          := vListaSimulacao[iItem].FlgBaixado;
        vLista[High(vLista)].Nome                := vListaSimulacao[iItem].Nome;
        vLista[High(vLista)].RecPag              := vListaSimulacao[iItem].RecPag;
        vLista[High(vLista)].FormaCobranca       := vListaSimulacao[iItem].FormaCobranca;
        vLista[High(vLista)].TipoFolha           := vListaSimulacao[iItem].TipoFolha;
        vLista[High(vLista)].Parcela             := vListaSimulacao[iItem].Parcela;
        vLista[High(vLista)].Origem              := vListaSimulacao[iItem].Origem;
        vLista[High(vLista)].Prioridade          := vListaSimulacao[iItem].Prioridade;
        vLista[High(vLista)].SeqCalculo          := vListaSimulacao[iItem].SeqCalculo;
        vLista[High(vLista)].SeqCobranca         := vListaSimulacao[iItem].SeqCobranca;
        vLista[High(vLista)].FlgCentraliza       := vListaSimulacao[iItem].FlgCentraliza;
        vLista[High(vLista)].FlgDivergPend       := vListaSimulacao[iItem].FlgDivergPend;
        vLista[High(vLista)].IDItemCentraliza    := vListaSimulacao[iItem].IDItemCentraliza;
        vLista[High(vLista)].AnoCompetencia      := vListaSimulacao[iItem].AnoCompetencia;
        vLista[High(vLista)].MesCompetencia      := vListaSimulacao[iItem].MesCompetencia;
        vLista[High(vLista)].AnoCobranca         := vListaSimulacao[iItem].AnoCobranca;
        vLista[High(vLista)].MesCobranca         := vListaSimulacao[iItem].MesCobranca;
        vLista[High(vLista)].DataPrevista        := vListaSimulacao[iItem].DataPrevista;
        vLista[High(vLista)].DataVencto          := vListaSimulacao[iItem].DataVencto;
        vLista[High(vLista)].DataEfetiva         := vListaSimulacao[iItem].DataEfetiva;
        vLista[High(vLista)].DataUltAtualiza     := vListaSimulacao[iItem].DataUltAtualiza;
        vLista[High(vLista)].DataReceb           := vListaSimulacao[iItem].DataReceb;
        vLista[High(vLista)].Valor               := vListaSimulacao[iItem].Valor;
        vLista[High(vLista)].SaldoDevedor        := vListaSimulacao[iItem].SaldoDevedor;
        vLista[High(vLista)].TxJuros             := vListaSimulacao[iItem].TxJuros;
        vLista[High(vLista)].TxJurosAnt          := vListaSimulacao[iItem].TxJurosAnt;
        vLista[High(vLista)].ParcResta           := vListaSimulacao[iItem].ParcResta;
        vLista[High(vLista)].FlgDestacado        := vListaSimulacao[iItem].FlgDestacado;
        vLista[High(vLista)].ValorEfetivo        := vListaSimulacao[iItem].ValorEfetivo;
        vLista[High(vLista)].FlgTipoDiverg       := vListaSimulacao[iItem].FlgTipoDiverg;
        vLista[High(vLista)].FlgGravaZERO        := vListaSimulacao[iItem].FlgGravaZERO;
        vLista[High(vLista)].ValorBase           := vListaSimulacao[iItem].ValorBase;

      end;


      sSqlDados := sSqlDados +
       ' union ' +
       ' select  ' +
       ConverteVirgulaParaPonto( fVlSolic   ) + ', ' +
       ConverteVirgulaParaPonto( fVlParcela ) + ', ' +
       ConverteVirgulaParaPonto( fVlLiquido ) + ', ' +
       IntToStr( iParcela                   ) +
       sSqlCampos                             +
       ' from DUAL ';

    end;

    //Nomes dos campos fixos
    sSqlNomesCampos1 :=
     ' select            ' +
     IntToStr(iItSolic)   + ' as VL_SOLIC,   ' +
     IntToStr(iItParcela) + ' as VL_PARCELA, ' +
     IntToStr(iItLiquido) + ' as VL_LIQUIDO, ' +
     ' -1 as QTDE_PARC   ' ;


    Result := GetDataPacket( sSqlNomesCampos1 + sSqlNomesCampos2 + ' from DUAL ' + sSqlDados );

  except
    On E : Exception Do
    begin
      MessageInfo := E.Message;
      Rollback;
      raise;
    end;
  end;

end; {SimulaEmprestimo}



//Prepara dataset da regra que verifica se a parcela pode ser concedida ou não
function TCtrlWebEmprestimo.DatasetVerificaPrazoConcessao( iNumParcela, iIdTitular, iIdBeneficiario : integer; bFlgExcepcional : boolean ): OleVariant;
var
  sSQL : string;
begin
  if bFlgExcepcional then
  begin

     sSQL :=
      'SELECT '                                                                           + #13 +
      '  ' + IntToStr(iIdBeneficiario)  + ' AS IDBENEF, '                                 + #13 +
      '  ' + IntToStr(iNumParcela)      + ' AS NUMPARCELAS, '                             + #13 +

      '  PPP.IDSITPART, PPP.IDPESSJUR, PPP.IDPESSOA, '                                    + #13 +

      '  PPP.IDSITPLANOPREV, PPP.INSCRICAONUMERO, '                                       + #13 +
      '  PPP.INSCRICAODATA, PPP.INSCRICAOTIPO, '                                          + #13 +
      '  PPP.SALPARTICIPACAO, PPP.SALMANTIDO, PPP.SALVINCULADO, '                         + #13 +
      '  PPP.FLGDEVEEMPRESTIMO, PPP.FLGDEVEASSISTENC, PPP.FLGDEVEPREVIDENC, '             + #13 +
      '  PPP.VALORINFINSS, PPP.DTINICIOINSC, PPP.SALPARTIC13, '                           + #13 +

      '  BEN.IDBENEFICIO, BEN.IDSITBENEFICIO, BEN.DATAFINAL, BEN.IDDEPENDENCIA, '         + #13 +
      '  BEN.IDRESPONSAVEL, BEN.CODTIPORECEBEDOR, BEN.DATAFIMRECEB, '                     + #13 +

      // 24/04/2006 - pendência 21945
      '  NVL(BEN.DATANASC, PFI.DATANASC) AS DATANASC , '                                  + #13 +
      // FIM pendência 21945

      '  BEN.NOMERESPONSAVEL, '                                                           + #13 +

      //Pendência 22836 - 03/10/2006
      '  00 AS FLGEXCEPCIONAL, '                                                          + #13 +
      //Fim Pendência 22836

      '  PFI.FLGBLOQUEIO, '                                                               + #13;

      if iIdTitular <> iIdBeneficiario then
      begin
         (* Beneficiário diferente do Titular *)
         sSQL := sSQL + QuotedStr('B') + ' AS FLGTIPOBEN '                                + #13;
      end
      else
      begin
         (* Beneficiário é o próprio Titular *)
         sSQL := sSQL + QuotedStr('T') + ' AS FLGTIPOBEN '                                + #13;
      end;

      sSQL := sSQL +
      'FROM '                                                                             + #13 +
      '  PESSOAFISICA PFI, '                                                              + #13 +
      '  PARTPREVPLAN PPP, '                                                              + #13 +
      '  ( '                                                                              + #13 +
      '  SELECT '                                                                         + #13 +
      '     BFC.IDTITULAR, BFC.IDPESSOA, BFC.IDBENEFICIO, '                               + #13 +
      '     BFC.IDSITBENEFICIO, BFC.DATAFINAL, BFC.IDDEPENDENCIA, '                       + #13 +
      '     BTP.IDRESPONNAOREC AS IDRESPONSAVEL, BTP.CODTIPORECEBEDOR, '                  + #13 +
      '     BTP.DATAFIMRECEB, PFI.DATANASC, '                                             + #13 +
      '     PES.NOME AS NOMERESPONSAVEL '                                                 + #13 +
      '  FROM '                                                                           + #13 +
      '     BENEFBFCIARIO   BFC, '                                                        + #13 +
      '     BFCIARIOTITPLAN BTP, '                                                        + #13 +
      '     PESSOAFISICA    PFI, '                                                        + #13 +
      '     PESSOA          PES  '                                                        + #13 +
      '  WHERE '                                                                          + #13 +
      '         IDSITBENEFICIO   IN (1,2,7) '                                             + #13 +
      '     AND BFC.IDTITULAR    = ' + IntToStr(iIdTitular)                               + #13 +
      '     AND BFC.IDPESSOA     = ' + IntToStr(iIdBeneficiario)                          + #13 +
      '     AND BFC.IDTITULAR    = BTP.IDTITULAR '                                        + #13 +
      '     AND BFC.IDBENEFICIO  = BTP.IDBENEFICIO '                                      + #13 +
      '     AND BFC.IDPESSOA     = PFI.IDPESSOA '                                         + #13 +
      '     AND BTP.IDRESPONNAOREC = PES.IDPESSOA(+)'                                     + #13 +
      '     AND BFC.IDPLANOPREV  = BTP.IDPLANOPREV ';

      if iIdTitular <> iIdBeneficiario then
      begin
         (* Beneficiário diferente do Titular *)
         sSQL := sSQL +
         '  AND ( DATAFINAL IS NULL    OR  '+
         '        DATAFINAL > TO_DATE' +
         '        (' + QuotedStr(DateToStr(Sysdate(Self))) + ',' + QuotedStr('DD/MM/YYYY') + ' ) ' +
         '      ) ';
      end;

      sSQL := sSQL +
      '  ) BEN '                                                                 + #13 +
      'WHERE '                                                                   + #13 +
      '      ( PPP.IDPESSOA      = ' + IntToStr(iIdTitular) + ' ) '              + #13 +
      '  AND ( PPP.IDPESSOA      = PFI.IDPESSOA ) '                              + #13 +
      '  AND ( PPP.IDPESSOA      = BEN.IDTITULAR(+) ) '                          + #13 +

      '  AND PPP.FLGDESATIVADO   = 0 '                                           + #13;

  end
  else
  begin
    sSQL := 'SELECT ' + IntToStr(iNumParcela) + ' AS PRAZO FROM DUAL';
  end;

  Result := GetDataPacket( sSQL );

end;

//Calcula salário base
function TCtrlWebEmprestimo.BuscaSalarioBase( iIdPessoa, iIdBenef, iIdEmpresa,
 iIdRegra : integer; bFlgExcepcional : boolean; dDataSolic : TDateTime; iLote,
 iTipoCliente : integer ) : Currency;
var
  cdsDados : TCMClientDataSet;
  iSequencial : integer;
  sSqlIni, sSqlRegra : string;
  sResult : string;
begin
  Result := 0;

  cdsDados := TCMClientDataSet.Create( nil );
  try

    sSqlIni :=
     'SELECT '                                                                              + #13 +
     '  NVL(PPP.SALPARTICIPACAO, 0) AS SALPARTICIPACAO, '                                   + #13 +
     '  NVL(PPP.SALMANTIDO, 0) AS SALMANTIDO, '                                             + #13 +
     '  NVL(PPP.SALAUXDOENCA, 0) AS SALAUXDOENCA, '                                         + #13 +
     '  NVL(BEN.VALORATUAL, 0) AS VALORATUAL, '                                             + #13 +
     '  BEN.IDBENEFICIO, BEN.IDSITBENEFICIO, BEN.DATAFINAL, BEN.DATAFINALPREVISTA, '        + #13 +
     '  ELP.IDPESSJUR, NVL(ELP.FLGDIRETOR, 0) AS FLGDIRETOR, ELP.IDSITFUNC, '               + #13 +
     '  PPP.IDPESSOA, PPP.IDSITPART, '                                                      + #13 +
     '  DECODE(BEN.IDPLANOPREV, NULL, PPP.IDPLANOPREV, BEN.IDPLANOPREV) AS IDPLANOPREV, '   + #13 +
     '  PFI.DATANASC, PFI.SEXO, '                                                           + #13 +
     '  SIT.FLGINTERNO '                                                                    + #13 +
     'FROM '                                                                                + #13 +
     '  PESSOAFISICA PFI, '                                                                 + #13 +
     '  PARTPREVPLAN PPP, '                                                                 + #13 +
     '  ELEGPATRO    ELP, '                                                                 + #13 +
     '  SITPART      SIT, '                                                                 + #13 +
     '  ( '                                                                                 + #13 +
     '  SELECT '                                                                            + #13 +
     '     BFC.IDPESSOA, BFC.IDTITULAR, '                                                   + #13 +
     '     BFC.VALORATUAL, BFC.IDPLANOPREV, '                                               + #13 +
     '     BFC.IDBENEFICIO, BFC.IDSITBENEFICIO, BFC.DATAFINAL, BFC.DATAFINALPREVISTA '      + #13 +
     '  FROM '                                                                              + #13 +
     '     BENEFBFCIARIO BFC '                                                              + #13 +
     '  WHERE '                                                                             + #13 +
     '         ( BFC.IDTITULAR  = ' + IntToStr(iIdPessoa) + ' ) '                           + #13 +
     '     AND ( BFC.IDPESSOA   = ' + IntToStr(iIdBenef) + ' ) '                            + #13 +
     '     AND ( (BFC.DATAFINAL > TO_DATE(' + QuotedStr(DateToStr(Sysdate(Self))) + ','  +
                                                QuotedStr('DD/MM/YYYY') + ')) '   +
                 'OR (BFC.DATAFINAL IS NULL) )'                                             + #13 +
     '  ) BEN '                                                                             + #13 +
     'WHERE '                                                                               + #13 +
     '      ( PPP.IDPESSOA      = ' + IntToStr(iIdPessoa) + ' ) '                             + #13 +
     '  AND ( PPP.IDPESSOA      = BEN.IDTITULAR(+) ) '                                      + #13 +
     '  AND ( PPP.IDSITPART     = SIT.IDSITPART ) '                                         + #13 +
     '  AND ( ELP.IDPESSOA      = PPP.IDPESSOA ) '                                          + #13 +
     '  AND ( PPP.IDPESSOA      = PFI.IDPESSOA(+) ) '                                       + #13 +

     '  AND PPP.FLGDESATIVADO   = 0 '                                                       + #13;

   //if bFlgExcepcional then
   if iTipoCliente <> 19981 then
      sSqlIni := sSqlIni +
       '  and ( elp.IDPESSJUR     = ppp.IDPESSJUR          )                            ' ;

   cdsDados.Data := GetDataPacket( sSqlIni );

    if cdsDados.IsEmpty then
      exit;

    iSequencial := 0;
    sSqlRegra := '';

    cdsDados.First;
    while not cdsDados.Eof do
    begin

      inc( iSequencial );

      sSqlRegra := sSqlRegra +
        'SELECT '                                                                                                                                 + #13 +
        '  ' + IntToStr(iSequencial)                                                                                   + ' AS SEQUENCIAL, '       + #13 +
        '  ' + ConverteVirgulaParaPonto(cdsDados.FieldByName('SALPARTICIPACAO').AsCurrency)                            + ' AS SALPARTICIPACAO, '  + #13 +
        '  ' + ConverteVirgulaParaPonto(cdsDados.FieldByName('SALMANTIDO').AsCurrency)                                 + ' AS SALMANTIDO, '       + #13 +
        '  ' + ConverteVirgulaParaPonto(cdsDados.FieldByName('SALAUXDOENCA').AsCurrency)                               + ' AS SALAUXDOENCA, '     + #13 +

        '  ' + ConverteVirgulaParaPonto( cdsDados.FieldByName('VALORATUAL').AsCurrency)                                + ' AS VALORATUAL, '       + #13 +

        '  ' + IntToStr( cdsDados.FieldByName('IDBENEFICIO').AsInteger)                                                + ' AS IDBENEFICIO, '      + #13 +
        '  ' + IntToStr( cdsDados.FieldByName('IDSITBENEFICIO').AsInteger)                                             + ' AS IDSITBENEFICIO, '   + #13 +
        '  ' + IntToStr( cdsDados.FieldByName('IDSITPART').AsInteger)                                                  + ' AS IDSITPART, '        + #13 +
        '  ' + IntToStr( cdsDados.FieldByName('IDPESSJUR').AsInteger)                                                  + ' AS IDPESSJUR, '        + #13 +
        '  ' + IntToStr(iIdBenef)                                                                                      + ' AS IDPESSOA, '         + #13 +
        '  ' + IntToStr(iIdPessoa)                                                                                     + ' AS IDTITULAR, '        + #13 +

        '  ' + IntToStr( cdsDados.FieldByName('IDPLANOPREV').AsInteger)                                                + ' AS IDPLANOPREV, '      + #13 +
        '  ' + IntToStr( cdsDados.FieldByName('IDSITFUNC').AsInteger)                                                  + ' AS IDSITFUNC, '        + #13 +
        '  ' + IntToStr( cdsDados.FieldByName('FLGDIRETOR').AsInteger)                                                 + ' AS FLGEXDIRETOR, '     + #13 +

        '  ' + QuotedStr( NullToSpace( cdsDados.FieldByName('FLGINTERNO').AsString ) )                                 + ' AS FLGINTERNO, '       + #13 +
        '  ' + QuotedStr( NullToSpace( FormatDateTime( 'DD/MM/YYYY', dDataSolic ) ) )                                  + ' AS DATASOLIC, '        + #13 +

        ' 0' + IntToStr( iLote )                                                                                       + ' AS FLGLOTE, '          + #13 +

        '  ' + QuotedStr( NullToSpace( FormataDataHora( 'dd/MM/yyyy', cdsDados.FieldByName('DATANASC').AsString ) ) )  + ' AS DATANASC, '         + #13 +
        ' 1'                                                                                                           + ' AS SEQPROPOSTA, '      + #13 +
        '  ' + QuotedStr( NullToSpace( cdsDados.FieldByName('SEXO').AsString ) )                                       + ' AS SEXO '              + #13 +
        'FROM DUAL ';

      if bFlgExcepcional then Break;

      cdsDados.Next;

      if not ( cdsDados.Eof ) then sSqlRegra := sSqlRegra + ' union ';

    end;

    WebRegra.CdsDataSetIn.Close;
    WebRegra.CdsDataSetIn.Data := GetDataPacket( sSqlRegra );

    if WebRegra.CdsDataSetIn.IsEmpty then
      Result := 0
    else
    begin
      WebRegra.MessageInfo := '';
      sResult := WebRegra.RegraString( IntToStr( iIdRegra ), iIdEmpresa );
      if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );

      if trim( sResult ) <> '' then
        Result := StrToFloat( ConvertePontoParaVirgulaStr( sResult ) );
    end;

  finally
    cdsDados.Free;
  end;
end;


//Calcula margem consignável
//Pendência 22248 - 03/08/2006 - Inclusão do parâmetro iPrazo
function TCtrlWebEmprestimo.BuscaMargem( iIdTitular, iIdBenef, iIdEmpresa, iIdRegra: integer;
                                         fSalarioBase, fParcelas, fPendencias : currency;
                                         bFlgExcepcional : boolean;
                                         dDataSolic : TDateTime; iPrazo: Integer;
                                         bFinanciamento : boolean; iLote : integer;
                                         sContrAQuitar : string;
                                         iTipoCliente : Integer ) : currency;
var
  cdsDados,
  cdsDependIRRF : TCMClientDataSet;
  iDependIRRF, i,
  iSequencial : integer;
  sSqlIni, sSqlRegra : string;
  sResult : string;
  sContrQuitacao: string;
  iQuita : Integer;
  iContador : Integer;
  aContratosAQuitar : array of string;
begin
  Result := 0;
  iDependIRRF := 0;

  cdsDados      := TCMClientDataSet.Create( nil );
  cdsDependIRRF := TCMClientDataSet.Create( nil );
  try

    sSqlIni :=
   'SELECT '                                                                                 + #13 +
   '  NVL(PPP.SALPARTICIPACAO, 0) AS SALPARTICIPACAO, '                                      + #13 +
   '  NVL(PPP.SALMANTIDO, 0) AS SALMANTIDO, '                                                + #13 +
   '  NVL(PPP.SALAUXDOENCA, 0) AS SALAUXDOENCA, '                                            + #13 +
   '  NVL(BEN.VALORATUAL, 0) AS VALORATUAL, '                                                + #13 +
   '  BEN.IDBENEFICIO, BEN.IDSITBENEFICIO, BEN.DATAFINAL, BEN.DATAFINALPREVISTA, '           + #13 +
   '  BEN.IDTPPAGTOBENEFIC, ELP.IDSITFUNC, '                                                 + #13 +
   '  DECODE(ELP.IDPESSJURCEDIDO, NULL, ELP.IDPESSJUR, ELP.IDPESSJURCEDIDO) AS IDPESSJUR, '  + #13 +
   '  PPP.IDPESSOA, PFI.DATANASC, PFI.SEXO, '                                                + #13 +
   '  PPP.IDSITPART, SIT.FLGINTERNO, '                                                       + #13 +
   '  DECODE(BEN.IDPLANOPREV, NULL, PPP.IDPLANOPREV, BEN.IDPLANOPREV) AS IDPLANOPREV, '      + #13 +
   '  PPP.IDSITPLANOPREV '                                                                   + #13 +
   'FROM '                                                                                   + #13 +
   '  PESSOAFISICA PFI, '                                                                    + #13 +
   '  PARTPREVPLAN PPP, '                                                                    + #13 +
   '  ELEGPATRO    ELP, '                                                                    + #13 +
   '  SITPART      SIT, '                                                                    + #13 +
   '  ( '                                                                                    + #13 +
   '  SELECT '                                                                               + #13 +
   '     BFC.IDPESSOA, BFC.IDTITULAR, '                                                      + #13 +
   '     BFC.VALORATUAL, BFC.IDPLANOPREV, '                                                  + #13 +
   '     BFC.IDTPPAGTOBENEFIC, '                                                             + #13 +
   '     BFC.IDBENEFICIO, BFC.IDSITBENEFICIO, BFC.DATAFINAL, BFC.DATAFINALPREVISTA '         + #13 +
   '  FROM '                                                                                 + #13 +
   '     BENEFBFCIARIO BFC '                                                                 + #13 +
   '  WHERE '                                                                                + #13 +
   '         ( BFC.IDTITULAR  = ' + IntToStr(iIdTitular) + ' ) '                             + #13 +
   '     AND ( BFC.IDPESSOA   = ' + IntToStr(iIdBenef) + ' ) '                               + #13 +
   '     AND ( (BFC.DATAFINAL > TO_DATE(' + QuotedStr(DateToStr(Sysdate(Self))) + ','  +
                                              QuotedStr('DD/MM/YYYY') + ')) '   +
               'OR (BFC.DATAFINAL IS NULL) )'                                                + #13 +
   '  ) BEN '                                                                                + #13 +
   'WHERE '                                                                                  + #13 +
   '      ( PPP.IDPESSOA      = ' + IntToStr(iIdTitular) + ' ) '                             + #13 +
   '  AND ( PPP.IDPESSOA      = BEN.IDTITULAR(+) ) '                                         + #13 +
   '  AND ( ELP.IDPESSOA      = PPP.IDPESSOA ) '                                             + #13 +

   '  AND ( PPP.IDPESSOA      = PFI.IDPESSOA(+) ) '                                          + #13 +

   '  AND ( PPP.IDSITPART     = SIT.IDSITPART ) '                                            + #13 +

   '  AND PPP.FLGDESATIVADO   = 0 '                                                          + #13;


   if bFlgExcepcional then
   begin

     sSqlIni := sSqlIni +
      '  AND ( ELP.IDPESSJUR      = PPP.IDPESSJUR ) '                                        + #13;

      // 11/01/2004 - Replicado em 23/03/2004
      // Contagem do nº de dependentes para IRRF (DepenTit, FlgImpostor) e passagem do resultado
      // para as regras (DEPENDIRRF)
      cdsDependIRRF.Data := GetDataPacket(
       ' SELECT ' +
       '    NVL(COUNT(*), 0) AS QUANT ' +
       ' FROM ' +
       '    DEPENTIT ' +
       ' WHERE ' +
       '        FLGCONTAIMPOSTOR = 1 ' +
       '    AND IDTITULAR        = ' + IntToStr( iIdTitular ) +
       '    AND FIMIMPOSTOR      < ' + QuotedStr( FormatDateTime('DD/MM/YYYY', dDataSolic ) ) );

      iDependIRRF := cdsDependIRRF.FieldByName('QUANT').AsInteger;

      cdsDependIRRF.Close;
      // FIM 11/01/2004
   end;

    if bGeraLogQuery then CMDebugToFile( 'Início Query Busca Margem.. ', sNomeArqLog );
    if bGeraLogQuery then CMDebugToFile( sSqlIni, sNomeArqLog );
    cdsDados.Data := GetDataPacket( sSqlIni );
    if bGeraLogQuery then CMDebugToFile( 'Termino Query Busca Margem.. ', sNomeArqLog );

    if cdsDados.IsEmpty then
      exit;

    iSequencial := 0;
    sSqlRegra := '';

    cdsDados.First;
    while not cdsDados.Eof do
    begin

      inc( iSequencial );

      sSqlRegra := sSqlRegra +
        'SELECT '                                                                                                         + #13 +
        ' 0'                                                                                   + ' AS TIPO, '             + #13 +
        '  ' + IntToStr(iSequencial)                                                           + ' AS SEQUENCIAL, '       + #13 +
        '  ' + ConverteVirgulaParaPonto(cdsDados.FieldByName('SALPARTICIPACAO').AsCurrency)    + ' AS SALPARTICIPACAO, '  + #13 +
        '  ' + ConverteVirgulaParaPonto(cdsDados.FieldByName('SALMANTIDO').AsCurrency)         + ' AS SALMANTIDO, '       + #13 +
        '  ' + ConverteVirgulaParaPonto(cdsDados.FieldByName('SALAUXDOENCA').AsCurrency)       + ' AS SALAUXDOENCA, '     + #13;

        if bFinanciamento then sSQLRegra := sSQLRegra +
        '  1'                                                                                  + ' AS FLGFINANCIAMENTO, ' + #13
        else sSQLRegra := sSQLRegra +
        '  0'                                                                                  + ' AS FLGFINANCIAMENTO, ' + #13;

        sSQLRegra := sSQLRegra +
                    //Pendência 22836 - 03/10/2006
                    '  00'                                                                     + ' AS FLGEXCEPCIONAL, '   + #13 +
                    //Fim Pendência 22836
                    ConverteVirgulaParaPonto( fSalarioBase )                                   + ' AS SALARIOBASE,     '  + #13 +
                    ConverteVirgulaParaPonto( fParcelas    )                                   + ' AS TOT_PARCELAS,    '  + #13 +
                    ConverteVirgulaParaPonto( fPendencias  )                                   + ' AS PENDENCIAS,      '  + #13 +

        //Pendência 22248 - 03/08/2006
        '  ' + IntToStr(iPrazo)                                                                + ' AS NUMPARCELAS, '      + #13 +
        //Fim Pendência 22248

        '  ' + ConverteVirgulaParaPonto( cdsDados.FieldByName('VALORATUAL').AsCurrency )       + ' AS VALORATUAL, '       + #13 +

        '  ' + IntToStr( cdsDados.FieldByName('IDBENEFICIO').AsInteger)                        + ' AS IDBENEFICIO, '      + #13 +
        '  ' + IntToStr( cdsDados.FieldByName('IDSITBENEFICIO').AsInteger)                     + ' AS IDSITBENEFICIO, '   + #13 +
        '  ' + IntToStr( cdsDados.FieldByName('IDSITPART').AsInteger)                          + ' AS IDSITPART, '        + #13 +
        '  ' + IntToStr( cdsDados.FieldByName('IDPESSJUR').AsInteger)                          + ' AS IDPESSJUR, '        + #13 +
        '  ' + IntToStr( cdsDados.FieldByName('IDPLANOPREV').AsInteger)                        + ' AS IDPLANOPREV, '      + #13 +
        '  ' + IntToStr( cdsDados.FieldByName('IDSITPART').AsInteger)                          + ' AS IDSITPART, '        + #13 +
        '  ' + IntToStr( cdsDados.FieldByName('IDSITFUNC').AsInteger)                          + ' AS IDSITFUNC, '        + #13 +
        '  ' + IntToStr( cdsDados.FieldByName('IDSITPLANOPREV').AsInteger)                     + ' AS IDSITPLANOPREV, '   + #13 +

        '  ' + IntToStr(iIdTitular)                                                            + ' AS IDTITULAR, '        + #13 +
        '  ' + IntToStr(iIdBenef)                                                              + ' AS IDPESSOA, '         + #13 +

        '  ' + QuotedStr(NullToSpace(cdsDados.FieldByName('FLGINTERNO').AsString))             + ' AS FLGINTERNO, '       + #13 +

        '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataSolic))                             + ' AS DATASOLIC, '        + #13 +

        ' 0' + IntToStr( iLote )                                                               + ' AS FLGLOTE, '          + #13 +

        '  ' + QuotedStr( NullToSpace( cdsDados.FieldByName('DATANASC').AsString ) )           + ' AS DATANASC, '         + #13 +
        ' 0' + IntToStr(iDependIRRF)                                                           + ' AS DEPENDIRRF, '       + #13 +
        //Pendência 23423 - 23/02/2007 - Padrão 15
        '  460'                                                                                + ' AS IDMODULO, '         + #13 +
        //Fim Pendência 23423
        '  ' + QuotedStr( NullToSpace( cdsDados.FieldByName('SEXO').AsString ) )               + ' AS SEXO, '             + #13 +
        ' 0'                                                                                   + ' AS IDCONTRATOEMPTMO, ' + #13 +
        ' 0'                                                                                   + ' AS IDTIPOCONTREMPTMO, '+ #13 +
        ' 0'                                                                                   + ' AS FLGQUITA '          + #13 +
        'FROM DUAL ';

      cdsDados.Next;

      if not ( cdsDados.Eof ) then sSqlRegra := sSqlRegra + ' union ';

    end;

    //MARGEM - primeira etapa.

    if iTipoCliente = 19991 then
    begin

      sSqlIni :=
      'SELECT' + #13 +
      '   CON.IDCONTRATOEMPTMO , CON.IDTIPOCONTREMPTMO,' + #13 +
      '   DECODE(VLP.HMEVLRPREVISTO,0,CON.VLRPARCELA,NVL(VLP.HMEVLRPREVISTO,CON.VLRPARCELA)) AS VLRULTPARCELA' + #13 +
      'FROM' + #13 +
      '   CONTRATOEMPTMO  CON,' + #13 +
      '  ( SELECT' + #13 +
      '        H.IDCONTRATOEMPTMO, NVL(H.HMEVLRPREVISTO,0) AS HMEVLRPREVISTO' + #13 +
      '    FROM' + #13 +
      '        HISTMOVEMPTMO H, CONTRATOEMPTMO C' + #13 +
      '    WHERE' + #13 +
      '          ( C.IDPESSOA           = ' + IntToStr(iIDTitular) + ' ) ' + #13 +
      '      AND ( C.IDBENEF            = ' + IntToStr(iIDBenef) + ' ) ' + #13 +
      '      AND ( H.HMETIPOMOV         = 1 )' + #13 +
      '      AND ( H.HMECENTRALIZA      = 1 )' + #13 +
      '      AND ( (H.FLGESTORNADO      IS NULL) OR (H.FLGESTORNADO = 0) )' + #13 +
      '      AND ( H.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO )' + #13 +
      '      AND H.HMEPARCELA = (SELECT' + #13 +
      '                              MAX(HME.HMEPARCELA)' + #13 +
      '                          FROM' + #13 +
      '                              HISTMOVEMPTMO HME, CONTRATOEMPTMO CON' + #13 +
      '                          WHERE' + #13 +
      '                                ( CON.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO )' + #13 +
      '                            AND ( HME.HMETIPOMOV         = 1 )' + #13 +
      '                            AND ( (HME.FLGESTORNADO      IS NULL) OR (HME.FLGESTORNADO = 0) )' + #13 +
      '                            AND ( HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO ) )' + #13 +
      '  ) VLP' + #13 +
      'WHERE' + #13 +
      '       ( CON.IDPESSOA            = ' + IntToStr(iIDTitular) + ' ) ' + #13 +
      '   AND ( CON.IDBENEF             = ' + IntToStr(iIDBenef) + ' ) ' + #13 +
      '   AND ( CON.FLGSITUACAO         = ''A'' )' + #13 +
      '   AND ( CON.IDCONTRATOEMPTMO    = VLP.IDCONTRATOEMPTMO(+) )' + #13 +
      'ORDER BY' + #13 +
      '   CON.IDCONTRATOEMPTMO' + #13;

      //MARGEM - parte 2.

      cdsDados.Data := GetDataPacket( sSqlIni );

      aContratosAQuitar := nil;
      sContrQuitacao := sContrAQuitar;
      while sContrQuitacao <> '' do
      begin
        SetLength(aContratosAQuitar,Length(aContratosAQuitar)+1);
        aContratosAQuitar[High(aContratosAQuitar)] := RetiraPrimeiroElemento( sContrQuitacao, ';' );
      end;


      if not cdsDados.IsEmpty then
      begin
         if sSQLRegra <> '' then sSQLRegra := sSQLRegra + 'UNION ' + #13;

         while not cdsDados.eof do
         begin
            // Verifica contratos selecionados para quitação
            iQuita := 0;
            for i:= 0 to Length(aContratosAQuitar) - 1 do
            begin
               if cdsDados.FieldByName('IDCONTRATOEMPTMO').AsString = aContratosAQuitar[i] then iQuita := 1;
            end;

            Inc(iSequencial);

            // Prepara nova SQL, para a Regra
            sSQLRegra := sSQLRegra +
            'SELECT '                                                                                    + #13 +
            ' 1'                                                              + ' AS TIPO, '             + #13 +
            '  ' + IntToStr(iSequencial)                                      + ' AS SEQUENCIAL, '       + #13 +
            ' 0'                                                              + ' AS SALPARTICIPACAO, '  + #13 +
            ' 0'                                                              + ' AS SALMANTIDO, '       + #13 +
            ' 0'                                                              + ' AS SALAUXDOENCA, '     + #13 +
            ' 0'                                                              + ' AS FLGFINANCIAMENTO, ' + #13 +
            ' 0'                                                              + ' AS FLGEXCEPCIONAL, '   + #13 +

            ' 0'                                                              + ' AS SALARIOBASE, '      + #13 +
            ' 0' + ConverteVirgulaParaPonto(cdsDados.FieldByName('VLRULTPARCELA').AsFloat)  + ' AS TOT_PARCELAS, '     + #13 +
            ' 0'                                                              + ' AS PENDENCIAS, '       + #13 +

            '  ' + IntToStr(iPrazo)                                           + ' AS NUMPARCELAS, '      + #13 +

            ' 0'                                                              + ' AS VALORATUAL, '       + #13 +

            '-1'                                                              + ' AS IDBENEFICIO, '      + #13 +
            '-1'                                                              + ' AS IDSITBENEFICIO, '   + #13 +
            '-1'                                                              + ' AS IDSITPART, '        + #13 +
            '-1'                                                              + ' AS IDPESSJUR, '        + #13 +
            '-1'                                                              + ' AS IDPLANOPREV, '      + #13 +
            '-1'                                                              + ' AS IDSITPART, '        + #13 +
            '-1'                                                              + ' AS IDSITFUNC, '        + #13 +
            '-1'                                                              + ' AS IDSITPLANOPREV, '   + #13 +

            '  ' + IntToStr(iIDTitular)                                       + ' AS IDTITULAR, '        + #13 +
            '  ' + IntToStr(iIDBenef)                                         + ' AS IDPESSOA, '         + #13 +

            ' ''X'''                                                          + ' AS FLGINTERNO, '       + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataSolic))        + ' AS DATASOLIC, '        + #13 +

            ' 0'                                                              + ' AS FLGLOTE, '          + #13 +

            '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',HoraServidor))       + ' AS DATANASC, ' + #13 +
            ' 0'                                                              + ' AS DEPENDIRRF, '       + #13 +
            ' 460'                                                            + ' AS IDMODULO, '         + #13 +
            ' ''X'''                                                          + ' AS SEXO, '             + #13 +

            ' 0' + cdsDados.FieldByName('IDCONTRATOEMPTMO').AsString          + ' AS IDCONTRATOEMPTMO, '   + #13 +
            ' 0' + cdsDados.FieldByName('IDTIPOCONTREMPTMO').AsString         + ' AS IDTIPOCONTREMPTMO, '  + #13 +
            '  ' + IntToStr(iQuita)                                           + ' AS FLGQUITA '            + #13 +

            'FROM DUAL ';

            cdsDados.Next;

            if not(cdsDados.EOF) then sSQLRegra := sSQLRegra + 'UNION ' + #13;
         end;
      end;

    end;

    WebRegra.CdsDataSetIn.Close;
    WebRegra.CdsDataSetIn.Data := GetDataPacket( sSqlRegra );

    if WebRegra.CdsDataSetIn.IsEmpty then
      Result := 0
    else
    begin
      WebRegra.MessageInfo := '';
      sResult := WebRegra.RegraString( IntToStr( iIdRegra ), iIdEmpresa );
      if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );

      if trim( sResult ) <> '' then
        Result := StrToFloat( ConvertePontoParaVirgulaStr( sResult ) );
    end;

  finally
    cdsDados.Free;
    cdsDependIRRF.Free;
  end;
end; {BuscaMargem}


function TCtrlWebEmprestimo.ItemXTipoContrato(iIdTipoContrEmptmo, iIdItemEmptmo: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select  IDTIPOCONTREMPTMO,  ' +
   '         IDITEMEMPTMO,       ' +
   '         ITCRECPAG,          ' +
   '         IDREGRACALC,        ' +
   '         IDREGRADEVOL,       ' +
   '         IDREGRADIARIA,      ' +
   '         ITCEVENTO,          ' +
   '         FLGCENTRALIZA,      ' +
   '         FLGDESTACADO,       ' +
   '         ITCSEQCALCULO,      ' +
   '         ITCPRIORIDADE,      ' +
   '         ITCTRATASALDODEV,   ' +
   '         FLGTEMPORARIO,      ' +
   '         ITCPERIODICIDADE,   ' +
   '         ITCNUMVEZES,        ' +
   '         IDPROVENTON,        ' +
   '         IDPROVENTOA,        ' +
   '         IDPROVENTOD,        ' +
   '         PLANO,              ' +
   '         CONTABAIXA,         ' +
   '         CODTIPDOC,          ' +
   '         TIPCODIGO,          ' +
   '         IDPROVENTOS,        ' +
   '         FLGGRAVAZERO        ' +
   ' from    ITEMXTIPOCONTR      ' +
   ' where   IDTIPOCONTREMPTMO = ' + IntToStr( iIdTipoContrEmptmo ) +
   '   and   IDITEMEMPTMO      = ' + IntToStr( iIdItemEmptmo      ) ) ;
end; {ItemXTipoContrato}


//Recupera os dados do contrato de inscrição em empréstimo
function TCtrlWebEmprestimo.RelatorioInscricao( iIdDataView, iOrigemCMDV : integer; iIdInscricaoEmptmo: extended ): OleVariant;
var
  cdsLocal : TCMClientDataSet;
  sSQL : string;
begin

  cdsLocal := TCMClientDataSet.Create( nil );
  try

    cdsLocal.Data := Reports.SelecionaDataView( iIdDataView, iOrigemCMDV );

    if cdsLocal.IsEmpty then
      raise Exception.Create('Não foi possível encontrar a consulta especificada.');

    sSQL := trim( cdsLocal.FieldByName('TEMPLATE').AsString );

    cdsLocal.Close;

    if sSQL = '' then
      raise Exception.Create('Erro ao montar consulta.');

    sSQL := sSQL + ' and  ins.IDINSCRICAOEMPTMO = ' + FloatToStr( iIdInscricaoEmptmo );

    Result := GetDataPacket( sSQL );

  finally
    cdsLocal.Free;
  end;

end; {RelatorioInscricao}


//Recupera os dados do contrato de concessão de empréstimo
function TCtrlWebEmprestimo.RelatorioConcessao( iIdDataView, iOrigemCMDV : integer; iIdContratoEmptmo: extended ) : OleVariant;
var
  cdsLocal : TCMClientDataSet;
  sSQL : string;
begin

  cdsLocal := TCMClientDataSet.Create( nil );
  try

    cdsLocal.Data := Reports.SelecionaDataView( iIdDataView, iOrigemCMDV );

    if cdsLocal.IsEmpty then
      raise Exception.Create('Não foi possível encontrar a consulta especificada.');

    sSQL := trim( cdsLocal.FieldByName('TEMPLATE').AsString );

    cdsLocal.Close;

    if sSQL = '' then
      raise Exception.Create('Erro ao montar consulta.');

    sSQL := sSQL + ' and  con.IDCONTRATOEMPTMO = ' + FloatToStr( iIdContratoEmptmo );

    Result := GetDataPacket( sSQL );

  finally
    cdsLocal.Free;
  end;

end; {RelatorioConcessao}



procedure TCtrlWebEmprestimo.SetReports(const Value: TCtrlReports);
begin
  FReports := Value;
end;


//Totaliza contratos em aberto
function TCtrlWebEmprestimo.TotalizaAbertos(iIdContratoEmptmo: extended): OleVariant;
begin
  Result := GetDataPacket(
   ' select  count( hme.IDITEMEMPTMO ) as QUANT_ABERTO,                          ' +
   '         sum( nvl( hme.HMEVLRPREVISTO, 0 ) ) as VALOR_TOTAL_ABERTO           ' +
   ' from    HISTMOVEMPTMO hme                                                   ' +
   ' where   ( hme.IDCONTRATOEMPTMO  = ' + FloatToStr( iIdContratoEmptmo ) + ' ) ' +
   '   and   ( hme.FLGBAIXADO        = 0                                       ) ' +
   '   and   ( hme.HMEVLREFETIVO     is null                                   ) ' +
   '   and   ( hme.HMEDATAEFETIVA    is null                                   ) ' +
   '   and   ( hme.HMETIPOMOV        between 1 and 4                           ) ' +
   '   and   ( ( hme.HMECENTRALIZA   = 1     ) or ( hme.HMEDESTACADO = 1)      ) ' +
   '   and   ( ( hme.FLGQUITADO      is null ) or ( hme.FLGQUITADO   = 0)      ) ' +
   '   and   ( ( hme.FLGABONADO      is null ) or ( hme.FLGABONADO   = 0)      ) ' +
   '   and   ( ( hme.FLGESTORNADO    is null ) or ( hme.FLGESTORNADO = 0)      ) ' );
end;

//Todos os dados do contrato
function TCtrlWebEmprestimo.TodosDadosContratos( iIdContratoEmptmo: extended ): OLEVariant;
begin
  Result := GetDataPacket(
  ' SELECT INS.IDINSCRICAOEMPTMO AS INSCRICAO,                                                             ' +
  '   INS.FLGINTERNET,                                                                                     ' +
  '   PPP.INSCRICAONUMERO,                                                                                 ' +
  '   DECODE(CNT.FLGSITUACAO,''A'', ''Contrato Ativo'',                                                    ' +
  '                          ''C'', ''Contrato Cancelado'',                                                ' +
  '                          ''E'', ''Contrato Encerrado'',                                                ' +
  '                          ''Q'', ''Contrato Quitado'',                                                  ' +
  '                          ''R'', ''Contrato Refinanciado'',                                             ' +
  '                          ''S'', ''Contrato Suspenso'',                                                 ' +
  '                          ''K'', ''Contrato Pendente de Quitação'') AS DESCSITCONTRATO,                 ' +
  '   DECODE(CNT.FLGFORMAPAG,''C'', ''Contas a Pagar'',                                                    ' +
  '                          ''F'', ''Folha de Pagamento'') AS DESCFLGFORMAPAG,                            ' +
  '   DECODE(CNT.FLGFORMAREC,''C'', ''Contas a Receber'',                                                  ' +
  '                          ''F'', ''Folha de Pagamento'') AS DESCFLGFORMAREC,                            ' +
  '   FRP.DESCRICAO AS DESCCODFORMAPAG,                                                                    ' +
  '   PFP.DESCRICAO AS DESCPORTFORMAPAG,                                                                   ' +
  '   PFR.DESCRICAO AS DESCPORTFORMAREC,                                                                   ' +
  '   SIT.IDSITPART,                                                                                       ' +
  '   SIT.DESCRICAO AS SITUACAO,                                                                           ' +
  '   SIT.FLGINTERNO,                                                                                      ' +
  '   PLV.NOME      AS PLANOPREV,                                                                          ' +
  '   JUR.NOME      AS PATRO,                                                                              ' +
  '   ELP.MATRICULA,                                                                                       ' +
  '   TIT.NOME      AS TITULAR,                                                                            ' +
  '   BEN.NOME      AS BENEFICIARIO,                                                                       ' +
  '   TIP.TCEDESCRICAO, TIP.IDTIPOEMPTMO,                                                                  ' +
  '   TEM.DESCTIPOEMPTMO,                                                                                  ' +
  '   INS.DATAINSC,                                                                                        ' +
  '   BAN.NOME AS BANCO,                                                                                   ' +
  '   CTB.CONTACORRENTE, AGB.NUMAGENCIA,                                                                   ' +
  '   CNT.IDCONTRATOEMPTMO , CNT.IDCONTRQUITACAO, CNT.IDPESSOA       , CNT.IDVERBA     ,                   ' +
  '   CNT.IDTIPOCONTREMPTMO, CNT.IDPLANOPREV    , CNT.IDPATRO        , CNT.NUMPARCELAS ,                   ' +
  '   CNT.IDINSCRICAOEMPTMO, CNT.IDBENEF        , CNT.IDCBANCARIA    ,                                     ' +
  '   CNT.CODFORMAPAG      , CNT.PORTFORMAPAG   , CNT.PORTFORMAREC   , CNT.DATACANC    ,                   ' +
  '   CNT.DATACREDITO      , CNT.DATASITUACAO   , CNT.DATAASSINATURA , CNT.DATAPRIMPARC,                   ' +
  '   CNT.VLRCONTRATO      , CNT.VLRPARCELA     , CNT.TXJUROS        , CNT.FLGSITUACAO ,                   ' +
  '   CNT.FLGFORMAREC      , CNT.FLGFORMAPAG    , CNT.VLRSALBASE     , CNT.VLRMARGEM   , CNT.VLRMAXPERMIT, ' +
  '   CNT.MOECODIGO        , CNT.IDTIPOSUSPEMPTMO, CNT.DATAINICIOSUSP, CNT.DATAFIMSUSP,                    ' +
  '   CNT.ANOSUSPENSAO     , CNT.MESSUSPENSAO    ,                                                         ' +
  '   MOE.MOESIGLA         ,                                                                               ' +
  '   TSE.TSEDESCRICAO                                                                                     ' +
  ' FROM                                                                                                   ' +
  '    PESSOA          JUR,                                                                                ' +
  '    PESSOA          TIT,                                                                                ' +
  '    PESSOA          BEN,                                                                                ' +
  '    PESSOA          BAN,                                                                                ' +
  '    INSCRICAOEMPTMO INS,                                                                                ' +
  '    CONTRATOEMPTMO  CNT,                                                                                ' +
  '    (SELECT * FROM PARTPREVPLAN WHERE SEQPROPOSTA = 1 AND FLGDESATIVADO = 0) PPP,                       ' +
  '    ELEGPATRO       ELP,                                                                                ' +
  '    MOEDA           MOE,                                                                                ' +
  '    AGENCIABANCARIA AGB,                                                                                ' +
  '    CONTABANCARIA   CTB,                                                                                ' +
  '    TIPOCONTREMPTMO TIP,                                                                                ' +
  '    TIPOEMPTMO      TEM,                                                                                ' +
  '    SITPART         SIT,                                                                                ' +
  '    PLANPREV        PLV,                                                                                ' +
  '    FORMARECPAG     FRP,                                                                                ' +
  '    PORTADORFORMA   PFP,                                                                                ' +
  '    PORTADORFORMA   PFR,                                                                                ' +
  '    TIPOSUSPEMPTMO  TSE                                                                                 ' +
  ' WHERE  CNT.IDCONTRATOEMPTMO   = ' + FloatToStr( iIdContratoEmptmo )                                      +
  '    AND CNT.IDPESSOA           = PPP.IDPESSOA                                                           ' +
  '    AND SIT.IDSITPART          = PPP.IDSITPART                                                          ' +
  '    AND PLV.IDPLANOPREV        = PPP.IDPLANOPREV                                                        ' +
  '    AND CNT.IDPATRO            = JUR.IDPESSOA                                                           ' +
  '    AND CNT.IDPESSOA           = ELP.IDPESSOA                                                           ' +
  '    AND CNT.IDPATRO            = ELP.IDPESSJUR                                                          ' +
  '    AND CNT.IDPESSOA           = TIT.IDPESSOA                                                           ' +
  '    AND CNT.IDBENEF            = BEN.IDPESSOA                                                           ' +
  '    AND CNT.IDTIPOCONTREMPTMO  = TIP.IDTIPOCONTREMPTMO                                                  ' +
  '    AND TIP.IDTIPOEMPTMO       = TEM.IDTIPOEMPTMO                                                       ' +
  '    AND CNT.IDINSCRICAOEMPTMO  = INS.IDINSCRICAOEMPTMO(+)                                               ' +
  '    AND CNT.IDCBANCARIA        = CTB.IDCBANCARIA(+)                                                     ' +
  '    AND CTB.IDAGENCIA          = AGB.IDPESSOA(+)                                                        ' +
  '    AND AGB.IDBANCO            = BAN.IDPESSOA(+)                                                        ' +
  '    AND CNT.CODFORMAPAG        = FRP.CODFORMA(+)                                                        ' +
  '    AND CNT.PORTFORMAPAG       = PFP.CODPORTFORMA(+)                                                    ' +
  '    AND CNT.PORTFORMAREC       = PFR.CODPORTFORMA(+)                                                    ' +
  '    AND CNT.MOECODIGO          = MOE.MOECODIGO(+)                                                       ' +
  '    AND CNT.IDTIPOSUSPEMPTMO   = TSE.IDTIPOSUSPEMPTMO(+)                                                ' );
end; {TodosDadosContratos}

function TCtrlWebEmprestimo.HoraServidor: TDateTime;
begin
  Result := SysDate( Self );
end;

function TCtrlWebEmprestimo.LookTipoContrato(iIdEmpresaProp, iIdTipoEmptmo,
  iIdTipoContrEmptmo: integer): OLEVariant;
begin
  Result := GetDataPacket(
    ' SELECT ' +
    '    TCE.IDTIPOCONTREMPTMO, ' +
    '    TCE.TCEDESCRICAO, ' +

    '    TCE.IDREGRAELEG, ' +
    '    TCE.IDREGRARESERVA, ' +
    '    TCE.IDREGRAMARGEM, ' +
    '    TCE.IDREGRALIMITES, ' +

    '    TCE.IDREGRAJURCONC, ' +
    '    TCE.IDREGRAJURANTCONC, ' +
    '    TCE.IDREGRAPRAZOSCONC, ' +

    '    TCE.IDREGRASUSPCOBR, ' +
    '    TCE.IDREGRASLDDIA, ' +

    '    TCE.IDREGRASALBAS, ' +
    '    TCE.IDREGRADATACRED, ' +
    '    TCE.IDREGRAQUITADO, ' +

    '    TCE.FLGSITUACAO, ' +

    '    TCE.FLGSUSPENSAO, ' +
    '    TCE.FLGSEGURO, ' +

    '    TCE.TCEMAXCONTRATO, ' +
    '    TCE.TCEMAXINSCR, ' +
    '    TCE.TCEMAXPARC, ' +
    '    TCE.TCEMINPARC, ' +
    '    TCE.TCEMINQUIT, ' +
    '    TCE.TCEMINRENOVA, ' +

    '    TCE.IDREPORTS, ' +

    '    TCE.TCETRATAPARCATRAS, ' +
    '    TCE.TCETRATAPARCPARC, ' +

    '    TCE.MOECODIGO, ' +
    '    TCE.FLGCOBRJUDIC, ' +
    '    TCE.TCEMAXMESDEB, ' +
    '    TCE.NUMPARCDESCONTO, ' +

    '    TEP.IDTIPOEMPTMO, ' +
    '    TEP.DESCTIPOEMPTMO, ' +
    '    TCE.IDREGRAVLRMAX, ' +
    '    TCE.IDREGRAPRAZOMAX ' +

    ' FROM ' +
    '    TIPOCONTREMPTMO TCE, ' +
    '    TIPOEMPTMO      TEP ' +
    ' ' +
    ' WHERE ' +
    '        ( TEP.IDEMPRESAPROP    = ' + IntToStr( iIdEmpresaProp ) + ' ) ' +
    '    AND ( (' + IntToStr( iIdTipoEmptmo ) + '      IS NULL) OR (TCE.IDTIPOEMPTMO      =' + IntToStr( iIdTipoEmptmo ) + ') ) ' +
    '    AND ( (' + IntToStr( iIdTipoContrEmptmo ) + ' IS NULL) OR (TCE.IDTIPOCONTREMPTMO =' + IntToStr( iIdTipoContrEmptmo ) + ') ) ' +
    '    AND ( TCE.IDTIPOEMPTMO     = TEP.IDTIPOEMPTMO ) ' +
    '    AND ( FLGSITUACAO          = ''A'' ) ' +

    ' ORDER BY ' +
    '    TCE.TCEDESCRICAO ' );
end;


//Executa regra que retorna a data de crédito do empréstimo
function TCtrlWebEmprestimo.RegraDataCredito( sRuleName,
                                              sTipoData,
                                              sFlgInterno,
                                              sTipoCobranca,
                                              sHoraEncerra : String;
                                              bChkExcepcional : boolean;
                                              iIdPatro,
                                              iIdPlanoPrev,
                                              iPais,
                                              iCidade : integer;
                                              sUF : String;
                                              dDtInscricao : TDateTime;
                                              iIdEmpresaProp : integer ) : TDateTime;
var
  sSitFundacao,
  sDiasCredito,
  sSQL,
  sHoraEnc,
  sHoraConcessao,
  sExcepcional,
  sResultado : String;

  cdsLocal : TCMClientDataSet;
begin
  Result := 0;

  sSitFundacao := sFlgInterno;

  cdsLocal := TCMClientDataSet.Create( nil );
  try

    if sTipoCobranca = 'F' then
    begin
      sSQL :=
       'SELECT '                                             +
       '  DIASAPOSC '                                        +
       'FROM '                                               +
       '  DATASPATROEMPTMO '                                 +
       'WHERE '                                              +
       '      ( IDPESSJUR   = ' + IntToStr( iIdPatro ) + ' ) ' +
       '  AND ( IDPLANOPREV = ' + IntToStr( iIdPlanoPrev ) + ' ) ' +
       '  AND ( SITFUNDACAO = ''PT'' )';

       cdsLocal.Data := GetDataPacket( sSQL );

       if cdsLocal.IsEmpty then exit;

       if sTipoData = 'C' then sDiasCredito := cdsLocal.FieldByName('DIASAPOSC').AsString;

    (* se FormaCobranca *)
    end
    else if sTipoCobranca = 'C' then
    begin
       if sSitFundacao = 'CA' then sSitFundacao := 'PT';

       // Filtra DATASPATROEMPTMO
       sSQL :=
       'SELECT '                                             +
       '  DIASAPOSC '                                        +
       'FROM '                                               +
       '  DATASPATROEMPTMO '                                 +
       'WHERE '                                              +
       '      ( IDPESSJUR   = ' + IntToStr( iIdPatro ) + ' ) ' +
       '  AND ( IDPLANOPREV = ' + IntToStr( iIdPlanoPrev ) + ' ) ' +
       '  AND ( SITFUNDACAO = ' + QuotedStr( sSitFundacao ) + ' )';

       cdsLocal.Data := GetDataPacket( sSQL );

       if cdsLocal.IsEmpty then exit;

       if sTipoData = 'C' then sDiasCredito := cdsLocal.FieldByName('DIASAPOSC').AsString;

    end; (* if FormaCobranca *)

    sHoraEnc := StringReplace( sHoraEncerra, ':', '', [rfReplaceAll] );

    cdsLocal.Data := GetDataPacket( ' select TO_CHAR(SYSDATE,''DD/MM/YYYY HH24:MI:SS'') as AGORA from DUAL ' );
    sHoraConcessao := StringReplace( Copy( cdsLocal.FieldByName('AGORA').AsString, 12, 5), ':', '', [rfReplaceAll] );

    if bChkExcepcional then
      sExcepcional := '1'
    else
      sExcepcional := '0';

    if sHoraEnc = '' then sHoraEnc := '23:59';

    sSQL :=
     'SELECT '                                                                                  +
     '  ' + QuotedStr( FormatDateTime('DD/MM/YYYY', dDtInscricao ) ) + ' AS DATAINSC, '         +
     '  ' + sDiasCredito                                             + ' AS NDIASCREDITO, '     +
     '  ' + sHoraEnc                                                 + ' AS HORAENCERRA, '      +
     '  ' + sHoraConcessao                                           + ' AS HORACONCESSAO, '    +
     '  ' + IntToStr( iPais )                                        + ' AS IDPAIS, '           +
     '  ' + IntToStr( iCidade )                                      + ' AS IDCIDADES, '        +
     '  ' + QuotedStr( sUF )                                         + ' AS CODESTADO, '        +
     '  ' + sExcepcional                                             + ' AS EXCEPCIONAL, '      +
     //Pendência 22836 - 03/10/2006
     '  00'                                                          + ' AS FLGEXCEPCIONAL, '   +
     //Fim Pendência 22836
     '  0                                                                AS FLGINTERNET '       +
     'FROM '                                                                                    +
     '  DUAL';

    WebRegra.CdsDataSetIn.Close;

    WebRegra.CdsDataSetIn.Data := GetDataPacket( sSQL );

    WebRegra.MessageInfo := '';
    sResultado := WebRegra.RegraString( sRuleName, iIdEmpresaProp );
    if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );

    if ( sResultado <> '' ) and ( sResultado <> 'NULO' ) then
    begin
      try
        Result := StrToDate( sResultado );
      except
        Result := 0;
      end;
    end
    else
       Result := 0;

  finally
    cdsLocal.Free;
  end;

end; {RegraDataCredito}


function TCtrlWebEmprestimo.VerificaElegibilidade(sRuleName: String;
  iIdTitular, iIdBeneficiario,
  //Pendência 23312 - 20/09/2006
  iIdPlanoPrev,
  //Fim Pendência 23312
  iMesesRenovacao, iParcPagas, iIdEmpresaProp: integer;
  bFlgExcepcional : boolean; sNomeEmpresa : string; var dDataFinal: TDateTime ): boolean;
var
  sParticipante,
  sSQL : string;
  iSitDependente,
  iIdCBancaria : Integer;
  cdsLocal : TCMClientDataset;
  //Pendência 23312 - 20/09/2006
  iIdPlanoPrevContab  : integer;
  //Fim Pendência 23312
begin
  iSitDependente := 0;
  iIdCBancaria   := 0;

  cdsLocal := TCMClientDataset.Create( nil );
  try
    cdsLocal.Data := GetDataPacket(
      'SELECT NVL(IDSITDEPENDENTE,0) AS IDSITDEPENDENTE ' + #13 +
      'FROM   DEPENDENTE '                                + #13 +
      'WHERE  IDPESSOA = ' + IntToStr(iIdBeneficiario)    + #13 );

    if not cdsLocal.IsEmpty then
    begin
       iSitDependente := iSitDependente + StrToIntDef( trim( cdsLocal.FieldByName('IDSITDEPENDENTE').AsString ), 0 );
    end;

    //Recupera conta bancária (ordenada para pegar a preferencial ou qualquer outra, se não houver preferencial)
    cdsLocal.Data := GetDataPacket(
      'SELECT   IDCBANCARIA '                            + #13 +
      'FROM     CONTABANCARIA '                          + #13 +
      'WHERE    IDPESSOA = ' + IntToStr(iIdBeneficiario) + #13 +
      'ORDER BY NVL( FLGCONTAPREF, -1 ) DESC             ' );

    if not cdsLocal.IsEmpty then
      iIdCBancaria := cdsLocal.FieldByName('IDCBANCARIA').AsInteger;

  finally
    cdsLocal.Free;
  end;

  //Pendência 23312 - 20/09/2006
  iIdPlanoPrevContab := {WebEmprestimo.}AcertaPlanoOrigem(-1,
                                                        iIdBeneficiario,
                                                        iIdPlanoPrev,
                                                        bFlgExcepcional,
                                                        False);

  if iIdPlanoPrevContab <= 0 then
     iIdPlanoPrevContab := iIdPlanoPrev;
  //Fim Pendência 23312

  sSQL :=
      'SELECT '                                                                     + #13 +
      '  ' + IntToStr(iIdBeneficiario)            + ' AS IDBENEF, '                 + #13 +
      '  ' + IntToStr(iIdTitular)                 + ' AS IDTITULAR, '               + #13 +
      '  ' + IntToStr(iIdBeneficiario)            + ' AS IDPESSOA, '                + #13 +
      '  ' + IntToStr(iMesesRenovacao)            + ' AS MESESRENOVACAO, '          + #13 +
      '  ' + IntToStr(iParcPagas)                 + ' AS PARCPAGAS, '               + #13 +
      '  ' + FormatDateTime('DD/MM/YYYY', SysDate( Self ) ) + ' AS DATAREF, '       + #13 +

      '  ' + IntToStr(iSitDependente)             + ' AS IDSITDEPENDENTE, '         + #13 +

      '  ' + IntToStr(iIdCBancaria)               + ' AS IDCBANCARIA, '             + #13 +

      //Pendência 23312 - 20/09/2006
      '  ' + IntToStr(iIdPlanoPrev)               + ' AS IDPLANOPREV, '             + #13 +
      '  ' + IntToStr(iIdPlanoPrevContab)         + ' AS IDPLANOPREVCONTAB, '       + #13 +
      //Fim Pendência 23312

      //Pendência 22836 - 03/10/2006
      '  00'                                      + ' AS FLGEXCEPCIONAL, '          + #13 +
      //Fim Pendência 22836

      '  PPP.IDSITPART, PPP.IDPESSJUR, PPP.IDPESSOA, ELP.IDSITFUNC,'                + #13 +

      '  PPP.IDSITPLANOPREV, PPP.INSCRICAONUMERO, ELP.DATAADMISSAO, '               + #13 +
      '  PPP.INSCRICAODATA, PPP.INSCRICAOTIPO, '                                    + #13 +
      '  PPP.SALPARTICIPACAO, PPP.SALMANTIDO, PPP.SALVINCULADO, '                   + #13 +
      '  PPP.FLGDEVEEMPRESTIMO, PPP.FLGDEVEASSISTENC, PPP.FLGDEVEPREVIDENC, '       + #13 +
      '  PPP.VALORINFINSS, PPP.DTINICIOINSC, PPP.SALPARTIC13, '                     + #13 +

      '  BEN.IDBENEFICIO, BEN.IDSITBENEFICIO, BEN.DATAFINAL, BEN.IDDEPENDENCIA, '   + #13 +
      '  BEN.IDRESPONSAVEL, BEN.CODTIPORECEBEDOR, BEN.DATAFIMRECEB, '               + #13 +

      // 24/04/2006 - pendência 21945
      '  NVL(BEN.DATANASC, PFI.DATANASC) AS DATANASC , '                                  + #13 +
      // FIM pendência 21945

      '  BEN.NOMERESPONSAVEL, '                                                     + #13 +
      '  SIT.FLGINTERNO, SIT.DESCRICAO, '                                           + #13 +

      '  PFI.FLGBLOQUEIO, '                                                         + #13 +
      '  ''1'' as FLGAUTOATEND, '                                                   + #13 ;

      if iIdTitular <> iIdBeneficiario then
      begin
         // Beneficiário diferente do Titular
         sParticipante := 'Beneficiário ';
         sSQL := sSQL + QuotedStr('B') + ' AS FLGTIPOBEN '                          + #13;
      end
      else
      begin
         // Beneficiário é o próprio Titular
         sParticipante := 'Participante ';
         sSQL := sSQL + QuotedStr('T') + ' AS FLGTIPOBEN '                          + #13;
      end;

      sSQL := sSQL +
      'FROM '                                                                       + #13 +
      '  PESSOAFISICA PFI, '                                                        + #13 +
      '  ELEGPATRO    ELP, '                                                        + #13 +
      '  SITPART      SIT, '                                                        + #13 +
      '  PARTPREVPLAN PPP, '                                                        + #13 +

      '  ( '                                                                        + #13 +
      '  SELECT '                                                                   + #13 +
      '     BFC.IDTITULAR, BFC.IDPESSOA, BFC.IDBENEFICIO, '                         + #13 +
      '     BFC.IDSITBENEFICIO, BFC.DATAFINAL, BFC.IDDEPENDENCIA, '                 + #13 +
      '     BTP.IDRESPONNAOREC AS IDRESPONSAVEL, BTP.CODTIPORECEBEDOR, '            + #13 +
      '     BTP.DATAFIMRECEB, PFI.DATANASC, '                                       + #13 +
      '     PES.NOME AS NOMERESPONSAVEL '                                           + #13 +
      '  FROM '                                                                     + #13 +
      '     BENEFBFCIARIO   BFC, '                                                  + #13 +
      '     BFCIARIOTITPLAN BTP, '                                                  + #13 +
      '     PESSOAFISICA    PFI, '                                                  + #13 +
      '     PESSOA          PES  '                                                  + #13 +
      '  WHERE '                                                                    + #13 +
      '         IDSITBENEFICIO   IN (1,2,7) '                                       + #13 +
      '     AND BFC.IDTITULAR    = ' + IntToStr(iIdTitular)                         + #13 +
      '     AND BFC.IDPESSOA     = ' + IntToStr(iIdBeneficiario)                    + #13 +
      '     AND BFC.IDTITULAR    = BTP.IDTITULAR '                                  + #13 +
      '     AND BFC.IDBENEFICIO  = BTP.IDBENEFICIO '                                + #13 +
      '     AND BFC.IDPESSOA     = PFI.IDPESSOA '                                   + #13 +
      '     AND BTP.IDRESPONNAOREC = PES.IDPESSOA(+)'                               + #13 +
      '     AND BFC.IDPLANOPREV  = BTP.IDPLANOPREV ';

      if iIdTitular <> iIdBeneficiario then
      begin
         // Beneficiário diferente do Titular
         sSQL := sSQL +
         '  AND ( DATAFINAL IS NULL    OR  '+
         '        DATAFINAL > TO_DATE' +
         '        (' + QuotedStr(DateToStr(Sysdate(Self))) + ',' + QuotedStr('DD/MM/YYYY') + ' ) ' +
         '      ) ';
      end;

      sSQL := sSQL +
      '  ) BEN '                                                                 + #13 +
      'WHERE '                                                                   + #13 +
      '      ( PPP.IDPESSOA      = ' + IntToStr(iIdTitular) + ' ) '              + #13 +
      '  AND ( PPP.IDPESSOA      = PFI.IDPESSOA ) '                              + #13 +
      '  AND ( ELP.IDPESSOA      = PPP.IDPESSOA ) '                              + #13 +
      '  AND ( ELP.IDPESSJUR     = PPP.IDPESSJUR ) '                             + #13 +
      '  AND ( SIT.IDSITPART     = PPP.IDSITPART ) '                             + #13 +
      '  AND ( PPP.IDPESSOA      = BEN.IDTITULAR(+) ) '                          + #13 +

      '  AND PPP.FLGDESATIVADO   = 0 '                                           + #13 ;

  WebRegra.CdsDataSetIn.Close;

  if bGeraLogQuery then CMDebugToFile( 'Início Query Elegibilidade.. ', sNomeArqLog );
  if bGeraLogQuery then CMDebugToFile( sSQL, sNomeArqLog );
  WebRegra.CdsDataSetIn.Data := GetDataPacket( sSQL );
  if bGeraLogQuery then CMDebugToFile( 'Término Query Elegibilidade.. ', sNomeArqLog );

  if WebRegra.CdsDataSetIn.IsEmpty then
  begin
    Result := False;
    MessageInfo := sParticipante + 'não atende à Regra de Elegibilidade.';
    exit;
  end;

  //Variável que é passada como referência que retornará a data final do benefício
  dDataFinal := WebRegra.CdsDataSetIn.FieldByName('DATAFINAL').AsDateTime;

  WebRegra.MessageInfo := '';
  Result := WebRegra.RegraBooleana( sRuleName, iIdEmpresaProp );
  if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );

end; {VerificaElegibilidade}


//Pendência 26775 - 26/12/2007
function TCtrlWebEmprestimo.IdentificaPlanoCobranca( iIdRegra : Int64;
                                                     iIdPessoa,
                                                     iIDPlanoPrev,
                                                     iIdEmpresaProp : integer
                                                   ) : Int64;
var
  cdsAux         : TCMClientDataSet;
  sSQL           : String;
  sValor         : String;
begin

   sSQL :=
      'select PPP.IDPESSOA, '       +
            ' PPP.IDPESSJUR, '      +
            ' PPP.IDPLANOPREV, '    +
            ' PPP.IDSITPART, '      +
            ' PPP.IDSITPLANOPREV, ' +
            ' STP.FLGINTERNO, '     +
            ' PPP.FLGDESATIVADO, '  +
            ' PPP.INSCRICAODATA '   +
       ' from PARTPREVPLAN PPP, '   +
            ' SITPART STP '         +
      ' where PPP.IDPESSOA = ' + IntToStr( iIdPessoa ) +
      ' and   STP.IDSITPART = PPP.IDSITPART '          +
      ' order by PPP.INSCRICAODATA ';

   try
      WebRegra.CdsDataSetIn.Close;

      WebRegra.CdsDataSetIn.Data := GetDataPacket( sSQL );

      WebRegra.MessageInfo := '';
      sValor := WebRegra.RegraString( IntToStr( iIdRegra ), iIdEmpresaProp );
      if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );

      if UpperCase( sValor ) = 'NULO' then
         Result := -1
      else
         Result := StrToInt( sValor );
   except
      Result := -1;
   end;

end; {IdentificaPlanoCobranca}
//Fim Pendência 26775


function TCtrlWebEmprestimo.BuscaLimites( const iIdPessoa, iIdBenef,
  iIdTipoEmptmo, iIdTipoContrEmptmo : Integer; const fVlrContrato,
  fVlrParcCalc : Currency; const iPrazo : Integer;const iOrigem: Integer;
  const iIdSitPart, iIdRegra: Int64; const dDataFinalBeneficio: TDateTime;
  const fMargem, fReserva, fSaldoEPAnt, fVlrParcelas, fVlrPendencias: Currency;
  const dDataSolic: TDateTime; const fVlrLiquidoEP: Currency;
  const iIdEmpresaProp : integer; const fVlrSalBase : Currency): Boolean;
var
  cdsAux         : TCMClientDataSet;
  sSQL           : String;
  sLimite        : String;
  sDataCredito   : String;
  iNumParcelas   : Integer;
  iNumParcPagas  : Integer;
  iParcAtual     : Integer;
begin
   (* função que verifica se o participante atende Limites de concessão
      e limites de Quantidade e Prazos do Contrato/Empréstimo *)

   (* Cria e Abre a Query Auxiliar *)
   cdsAux               := TCMClientDataSet.Create( nil );

   sSQL :=
   'SELECT '                                                            + #13 +
   '  COUNT(*) AS TOTCONTRATIVOS '                                      + #13 +
   'FROM '                                                              + #13 +
   '  CONTRATOEMPTMO '                                                  + #13 +
   'WHERE '                                                             + #13 +
   '      ( FLGSITUACAO  NOT IN (''C'', ''Q'') ) '                      + #13 +
   '  AND ( IDPESSOA     = ' + IntToStr( iIdPessoa ) + ' ) '     + #13 +
   '  AND ( IDBENEF      = ' + IntToStr( iIdBenef  )  + ' ) ';

   try
      try
         cdsAux.Data := GetDataPacket( sSQL );

         (* Verifico qual a quantidade total de contratos ATIVOS do participante
             caso ele não tenha nenhum, logo ele pode fazer a inscrição e
             não há necessidade de executar a regra *)
         if cdsAux.FieldByName('TOTCONTRATIVOS').AsInteger <= 0 then
         begin
            Result := True;
            Exit;
         end;

         sSQL :=
         'SELECT '                                                                        + #13 +
         '  CNT.IDCONTRATOEMPTMO, '                                                       + #13 +
         '  CNT.DATACREDITO, '                                                            + #13 +
         '  CNT.NUMPARCELAS, '                                                            + #13 +
         '  COUNT(PAG.HMEPARCELA) AS NUMPARCPAGAS, '                                      + #13 +
         '  MAX.HMEPARCELA '                                                              + #13 +

         'FROM '                                                                          + #13 +
         '  CONTRATOEMPTMO  CNT, '                                                        + #13 +
         '  TIPOCONTREMPTMO TIP, '                                                        + #13 +

         '  ( '                                                                           + #13 +
         '  SELECT '                                                                      + #13 +
         '     H.IDCONTRATOEMPTMO, '                                                      + #13 +
         '     MAX(H.HMEPARCELA) AS HMEPARCELA '                                          + #13 +
         '  FROM '                                                                        + #13 +
         '     HISTMOVEMPTMO  H, '                                                        + #13 +
         '     CONTRATOEMPTMO C '                                                         + #13 +
         '  WHERE '                                                                       + #13 +
         '         ( C.IDPESSOA         = ' + IntToStr( iIdPessoa ) + ' ) '               + #13 +
         '     AND ( C.IDBENEF          = ' + IntToStr( iIdBenef ) + ' ) '                + #13 +
         '     AND ( H.HMECENTRALIZA    = 1 OR H.HMEDESTACADO = 1 ) '                     + #13 +
         '     AND ( H.FLGESTORNADO IS NULL OR H.FLGESTORNADO = 0 ) '                     + #13 +
         '     AND ( H.FLGABONADO   IS NULL OR H.FLGABONADO   = 0 ) '                     + #13 +
         '     AND ( H.HMETIPOMOV = 1 )  '                                                + #13 +
         '     AND ( C.FLGSITUACAO      NOT IN (''C'',''Q'') ) '                          + #13 +
         '     AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO ) '                          + #13 +
         '  GROUP BY '                                                                    + #13 +
         '     H.IDCONTRATOEMPTMO '                                                       + #13 +
         '  ) MAX, '                                                                      + #13 +

         '  ( '                                                                           + #13 +
         '  SELECT '                                                                      + #13 +
         '     H.IDCONTRATOEMPTMO, H.HMEPARCELA, '                                        + #13 +
         '     SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, H.HMEVLRPREVISTO, 0), 2)) - '        +
              'SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) AS TOTAL '                          + #13 +
         '  FROM '                                                                        + #13 +
         '     HISTMOVEMPTMO H, '                                                         + #13 +
         '     CONTRATOEMPTMO C '                                                         + #13 +
         '  WHERE '                                                                       + #13 +
         '         ( C.IDPESSOA         = ' + IntToStr( iIdPessoa ) + ' ) '               + #13 +
         '     AND ( C.IDBENEF          = ' + IntToStr( iIdBenef ) + ' ) '                + #13 +
         '     AND ( H.HMECENTRALIZA    = 1 OR H.HMEDESTACADO = 1 ) '                     + #13 +
         '     AND ( H.FLGESTORNADO IS NULL OR H.FLGESTORNADO = 0 ) '                     + #13 +
         '     AND ( H.FLGABONADO IS NULL OR H.FLGABONADO = 0 )  '                        + #13 +
         '     AND ( H.HMETIPOMOV = 1 )  '                                                + #13 +
         '     AND ( C.FLGSITUACAO      NOT IN (''C'',''Q'') ) '                          + #13 +
         '     AND ( H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO ) '                          + #13 +
         '  GROUP BY '                                                                    + #13 +
         '     H.IDCONTRATOEMPTMO, H.HMEPARCELA '                                         + #13 +
         '  HAVING '                                                                      + #13 +
         '         ( SUM(ROUND(DECODE(H.HMESEQCOBRANCA, 1, HMEVLRPREVISTO, 0), 2)) - '    +
                    'SUM(ROUND(NVL(H.HMEVLREFETIVO, 0), 2)) = 0 ) '                       + #13 +
         '     AND ( H.HMEPARCELA <> 0 ) '                                                + #13 +
         '  ) PAG '                                                                       + #13 +

         'WHERE '                                                                         + #13 +
         '      ( CNT.IDPESSOA           = ' + IntToStr( iIdPessoa ) + ' ) '              + #13 +
         '  AND ( CNT.IDBENEF            = ' + IntToStr( iIdBenef ) + ' ) '               + #13 +
         '  AND ( TIP.IDTIPOEMPTMO       = ' + IntToStr( iIdTipoEmptmo ) + ' ) '          + #13 +
         '  AND ( CNT.FLGSITUACAO        NOT IN (''C'',''Q'') ) '                         + #13 +
         '  AND ( CNT.IDCONTRATOEMPTMO   = PAG.IDCONTRATOEMPTMO(+) ) '                    + #13 +
         '  AND ( CNT.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO(+) ) '                    + #13 +
         '  AND ( CNT.IDTIPOCONTREMPTMO  = TIP.IDTIPOCONTREMPTMO ) '                      + #13 +

         'GROUP BY '                                                                      + #13 +
         '  CNT.IDCONTRATOEMPTMO, CNT.DATACREDITO, CNT.NUMPARCELAS, MAX.HMEPARCELA ';

         cdsAux.Close;
         cdsAux.Data := GetDataPacket( sSQL );

         //Linha incluída para retirar hint
         iParcAtual := 0;

         (* se a query estiver vazia, passa os valores zerados *)
         if cdsAux.isEmpty then
         begin
            iNumParcPagas  := 0;
            iNumParcelas   := 0;
            sDataCredito   := 'NULL';
         end
         else
         begin
            if cdsAux.FieldByName('NUMPARCPAGAS').IsNull then
            begin
               iNumParcPagas := 0;
            end
            else
            begin
               iNumParcPagas := cdsAux.FieldByName('NUMPARCPAGAS').AsInteger;
            end;

            if cdsAux.FieldByName('NUMPARCELAS').IsNull then
            begin
               iNumParcelas := 0;
            end
            else
            begin
               iNumParcelas := cdsAux.FieldByName('NUMPARCELAS').AsInteger;
            end;

            if cdsAux.FieldByName('DATACREDITO').IsNull then
            begin
               sDataCredito := 'NULL';
            end
            else
            begin
               sDataCredito := FormatDateTime('DD/MM/YYYY', cdsAux.FieldByName('DATACREDITO').AsDateTime);
            end;

            if cdsAux.FieldByName('HMEPARCELA').IsNull then
            begin
               iParcAtual  := 0;
            end
            else
            begin
               iParcAtual  := cdsAux.FieldByName('HMEPARCELA').AsInteger;
            end;

         end; (* if cdsAux.isEmpty *)

         sSQL :=
         'SELECT ' +
         ' ' + IntToStr( iIdPessoa )                     + ' AS IDPESSOA, '         + #13 +
         ' ' + IntToStr( iIdBenef )                      + ' AS IDBENEF, '          + #13 +
         ' ' + IntToStr( iIdTipoContrEmptmo )            + ' AS IDTIPOCONTREMPTMO,' + #13 +
         ' ' + IntToStr( iIdTipoEmptmo )                 + ' AS IDTIPOEMPTMO,'      + #13 +
         ' ' + IntToStr( iOrigem)                        + ' AS HMEORIGEM,'         + #13 +
         ' ' + IntToStr( iIdSitPart)                     + ' AS IDSITPART,'         + #13 +
         ' ' + ConverteVirgulaParaPonto( fMargem)        + ' AS MARGEM,'            + #13 +
         ' ' + ConverteVirgulaParaPonto( fReserva)       + ' AS RESERVA,'           + #13 +
         ' ' + ConverteVirgulaParaPonto( fVlrContrato )  + ' AS VALORSOLIC,'        + #13 +
         ' ' + ConverteVirgulaParaPonto( fVlrParcCalc )  + ' AS VALPARCCALC,'       + #13 +
         ' ' + IntToStr( iPrazo )                        + ' AS PRAZO,'             + #13 +
         ' ' + ConverteVirgulaParaPonto(fSaldoEPAnt)     + ' AS SALDOEPANT,'        + #13 +
         ' ' + ConverteVirgulaParaPonto(fVlrParcelas)    + ' AS VLRPARCELAS, '      + #13 +
         ' ' + ConverteVirgulaParaPonto(fVlrPendencias)  + ' AS VLRPENDENCIAS, '    + #13 +
         ' ' + IntToStr(iNumParcPagas)                   + ' AS NUMPARCPAGAS,'      + #13 +
         ' ' + IntToStr(iParcAtual)                      + ' AS PARCATUAL, '        + #13 +
         ' ' + IntToStr(iNumParcelas)                    + ' AS PRAZOANT, '         + #13 +
         ' ' + QuotedStr(DateToStr(dDataSolic))          + ' AS DATASOLIC, '        + #13 +
         ' ' + QuotedStr(DateToStr(dDataFinalBeneficio)) + ' AS DATAFINAL, '        + #13 +
         ' ' + ConverteVirgulaParaPonto(fVlrLiquidoEP)   + ' AS VLRLIQUIDO, '       + #13 +
         ' ' + QuotedStr(sDataCredito)                   + ' AS DTCREDITOANT, '     + #13 +
         //Pendência 22836 - 03/10/2006
         ' 00'                                           + ' AS FLGEXCEPCIONAL, '   + #13 +
         //Fim Pendência 22836
         ' ' + ConverteVirgulaParaPonto(fVlrSalBase)     + ' AS SALARIOBASE '       + #13 +
         ' FROM DUAL';

        WebRegra.CdsDataSetIn.Close;

        WebRegra.CdsDataSetIn.Data := GetDataPacket( sSQL );

        WebRegra.MessageInfo := '';
        sLimite := WebRegra.RegraString( IntToStr( iIdRegra ), iIdEmpresaProp );
        if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );

        Result := False;
        if UpperCase( sLimite ) = 'TRUE' then Result := True;

      except
         Result := False;
      end;
   finally
      cdsAux.Free;
   end;
end;

function TCtrlWebEmprestimo.CalculaEPAnterior( ContratosAnt : OLEVariant;
                                               iIdEmpresaProp : integer;
                                               iIdTipoEmptmo,
                                               iIdTipoContrEmptmo,
                                               iIDITEMDEVSEGQUIT,
                                               iIDITEMPROVPERDA : integer;
                                               dDtCredito : TDateTime;
                                               bFlgExcepcional : boolean;
                                               iTEPMAXCONTRATO : integer;
                                               //Pendência 26916 - 21/12/2007
                                               iTCEMAXCONTRATO : integer;
                                               //Fim Pendência 26916
                                               iFlgAbonoDiverg : integer;
                                               iTipoCliente    : integer;
                                               var bContratoValido : boolean;
                                               var iQtdEPQuitado : integer;
                                               var cSaldoAQuitar : Currency;
                                               var cTotalParcelas : Currency;
                                               var cTotalPendencias : Currency;
                                               var cQuitacao : Currency ) : OLEVariant;
var
  SavePlace       : TBookmark;
  iContador       : Integer;

  fVlrEmAberto,
  fVlrTotalAberto,
  fSaldoAQuitar,
  fQuitacao,
  fTotalParcelas,
  fQuitacaoDividas,
  fTotalPendencias : currency;

  fSaldoQuitIni, fSaldoQuitFim : Currency;

  cdsContratosAnteriores : TCMClientDataSet;

  //Pendência 26916 - 21/12/2007
  iQtdIDTIPOEMPTMO,
  iQtdIDTIPOCONTREMPTMO : Integer;
  //Fim Pendência 26916
begin
  iQtdEPQuitado := 0;

  cdsContratosAnteriores := TCMClientDataSet.Create( nil );
  try

    fVlrTotalAberto  := 0;
    fSaldoAQuitar    := 0;
    fTotalParcelas   := 0;
    fTotalPendencias := 0;
    fQuitacao        := 0;
    fQuitacaoDividas := 0;

    cdsContratosAnteriores.Data := ContratosAnt;
    cdsContratosAnteriores.Data := CopyClientDataSet( cdsContratosAnteriores );
    cdsContratosAnteriores.First;

   //Pendência 26916 - 21/12/2007
   // Calcula quantidade de contratos anteriores pelo tipo de empréstimo e
   // tipo de contrato de empréstimo selecionados e marca os obrigatoriamente
   // quitáveis
   iQtdIDTIPOEMPTMO      := 0;
   iQtdIDTIPOCONTREMPTMO := 0;

   cdsContratosAnteriores.First;

   while not cdsContratosAnteriores.EOF do
    begin

      SavePlace := cdsContratosAnteriores.GetBookmark;

      CalculaQuitacaoContratoAnterior( cdsContratosAnteriores,
                                       iIdEmpresaProp,
                                       iIdTipoEmptmo,
                                       iIdTipoContrEmptmo,
                                       iIDITEMDEVSEGQUIT,
                                       iIDITEMPROVPERDA,
                                       dDtCredito,
                                       bFlgExcepcional,
                                       iFlgAbonoDiverg,
                                       iTipoCliente,
                                       SavePlace,
                                       fVlrTotalAberto );

      if cdsContratosAnteriores.FieldByName('IDTIPOEMPTMO').AsInteger = iIdTipoEmptmo then
         iQtdIDTIPOEMPTMO := iQtdIDTIPOEMPTMO + 1;

      if cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger = iIdTipoContrEmptmo then
         iQtdIDTIPOCONTREMPTMO := iQtdIDTIPOCONTREMPTMO + 1;

      if cdsContratosAnteriores.FieldByName('FLGOBRIGATORIO').AsInteger = 1 then begin
         cdsContratosAnteriores.Edit;
         cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger := 1;
         cdsContratosAnteriores.Post;         
      end;

      cdsContratosAnteriores.GotoBookmark( SavePlace );

        if bFlgExcepcional then
        begin
          if not PermiteQuitacao( iIdTipoContrEmptmo, cdsContratosAnteriores.FieldByname('IDTIPOCONTREMPTMO').AsInteger ) then
            raise Exception.Create( 'Há contrato(s) concedido(s) que não pode(m) ser quitado(s) pelo tipo do contrato selecionado.' );
        end;

      fTotalParcelas    := fTotalParcelas   + cdsContratosAnteriores.FieldByName('VLRPARCELA').AsCurrency;
      fTotalPendencias  := fTotalPendencias + cdsContratosAnteriores.FieldByName('VLREMABERTO').AsCurrency;
      fQuitacao         := fQuitacao        + cdsContratosAnteriores.FieldByName('VLRATUAL').AsCurrency;

      cdsContratosAnteriores.Next;

   end;

   cdsContratosAnteriores.First;

   // Verifica se o contrato atual não ultrapassa o limite de contratos
   // permitidos para o tipo de contrato selecionado
   while not(cdsContratosAnteriores.EOF) do
   begin

      SavePlace := cdsContratosAnteriores.GetBookmark;

      //Pendência 26916 - 21/12/2007
      if ( iTCEMAXCONTRATO <= iQtdIDTIPOCONTREMPTMO ) and
         ( cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger = iIdTipoContrEmptmo ) and
         ( cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger <> 1 ) then
      begin
         cdsContratosAnteriores.Edit;
         cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger := 1;
         cdsContratosAnteriores.Post;         
         iQtdIDTIPOCONTREMPTMO := iQtdIDTIPOCONTREMPTMO - 1;
         iQtdIDTIPOEMPTMO      := iQtdIDTIPOEMPTMO - 1;
      end;

      cdsContratosAnteriores.GotoBookmark( SavePlace );

      // Pendência 27194 - 11/01/2008
      if cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 then
         fSaldoaQuitar := fSaldoaQuitar + cdsContratosAnteriores.FieldByName('VLRATUAL').AsFloat;
      // Fim Pendência 27194

      cdsContratosAnteriores.Next;

   end;

   // Verifica se o contrato atual não ultrapassa o limite de contratos
   // permitidos para o tipo de empréstimo selecionado
   if ( iTEPMAXCONTRATO <= iQtdIDTIPOEMPTMO ) then
   begin

      // Pendência 27194 - 11/01/2008
      fSaldoAQuitar    := 0;
      // Fim Pendência 27194

      cdsContratosAnteriores.First;

      while not(cdsContratosAnteriores.EOF) do
      begin

         SavePlace := cdsContratosAnteriores.GetBookmark;

         if ( iTEPMAXCONTRATO <= iQtdIDTIPOEMPTMO ) and
            ( cdsContratosAnteriores.FieldByName('IDTIPOEMPTMO').AsInteger = iIdTipoEmptmo ) and
            ( cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger <> iIdTipoContrEmptmo ) and
            ( cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger <> 1 ) then
         begin
            cdsContratosAnteriores.Edit;
            cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger := 1;
            cdsContratosAnteriores.Post;            
            iQtdIDTIPOEMPTMO := iQtdIDTIPOEMPTMO - 1;
         end;

         cdsContratosAnteriores.GotoBookmark(SavePlace);

         // Pendência 27194 - 08/01/2008
         if cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 then
            fSaldoaQuitar := fSaldoaQuitar + cdsContratosAnteriores.FieldByName('VLRATUAL').AsFloat;
         // Fim Pendência 27194

      cdsContratosAnteriores.Next;

    end;

   end;
   //Fim Pendência 26916

    cSaldoAQuitar    := fSaldoAQuitar;
    cTotalParcelas   := fTotalParcelas;
    cTotalPendencias := fTotalPendencias;
    cQuitacao        := fQuitacao;

    Result := cdsContratosAnteriores.Data;

  finally
    cdsContratosAnteriores.Free;
  end;

end;



function TCtrlWebEmprestimo.ExistemItensEmAberto_uCalc( iIdContratoEmptmo: extended;
                                                        bData : boolean;
                                                        dData : TDateTime;
                                                        bMes  : Boolean;
                                                        iAno  : Integer;
                                                        iMes  : Integer ): boolean;
var
  cdsItensEmAberto : TCMClientDataSet;
  iFiltroData, iFiltroMes : integer;
  dDataVencto : TDateTime;
  iMesCobranca, iAnoCobranca : integer;
begin
  cdsItensEmAberto := TCMClientDataSet.Create( nil );
  try

    Result := False;

    iFiltroData  := 0;
    iFiltroMes   := 0;
    dDataVencto  := 0;
    iMesCobranca := 0;
    iAnoCobranca := 0;

    if bData then
    begin
      iFiltroData := 1;
      dDataVencto := dData;
    end;

    if bMes then
    begin
      iFiltroMes   := 1;
      iMesCobranca := iMes;
      iAnoCobranca := iAno;
    end;

    cdsItensEmAberto.Data := ItensEmAberto_uCalc( iIdContratoEmptmo,
                                                  iFiltroData,
                                                  iFiltroMes,
                                                  dDataVencto,
                                                  iAnoCobranca,
                                                  iMesCobranca );

    Result := not cdsItensEmAberto.IsEmpty;

    cdsItensEmAberto.Close;
  finally
    cdsItensEmAberto.Free;
  end;
end;


function TCtrlWebEmprestimo.ExistemItensEmAberto_fCad( dDataInscricao : TDateTime;
                                                       vContratosAnteriores : OLEVariant;
                                                       var fVlrEmAberto: Currency ): boolean;
var
  cdsItensEmAberto, cdsContrAnt : TCMClientDataSet;
  sAno, sMes        : String;
  iAno, iMes, iDia  : Word;
begin
  Result := False;

  cdsItensEmAberto := TCMClientDataSet.Create( nil );
  cdsContrAnt      := TCMClientDataSet.Create( nil );
  try

    DecodeDate( dDataInscricao, iAno, iMes, iDia );

    sAno := FormatFloat('0000',iAno);
    //Pendência 27216 - 09/01/2008
    //IntToStr(iMes);
    sMes := FormatFloat('00',iMes);
    //Fim Pendência 27216

    fVlrEmAberto := 0;
    cdsContrAnt.Data := vContratosAnteriores;
    cdsContrAnt.First;

        while not cdsContrAnt.Eof do begin

       cdsItensEmAberto.Data := ItensEmAberto_fCad( cdsContrAnt.FieldByName('IDCONTRATOEMPTMO').AsFloat, sAno + sMes );

       if not cdsItensEmAberto.IsEmpty then Result := True;

       if not cdsItensEmAberto.IsEmpty then
       begin
         cdsItensEmAberto.First;
         while not cdsItensEmAberto.Eof do
         begin
           fVlrEmAberto := fVlrEmAberto + cdsItensEmAberto.FieldByName('HMEVLRPREVISTO').AsCurrency ;
           cdsItensEmAberto.Next;
         end;
       end;
       cdsContrAnt.Next;
    end;
    cdsItensEmAberto.Close;
  finally
    cdsItensEmAberto.Free;
  end;
end;


function TCtrlWebEmprestimo.SaldoAntAtuDia(iIDCONTRATOEMPTMO: extended; dHMEDATAATUALIZA: TDateTime): OLEVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' SELECT /*+LEADING(HME) */ ' +
   '    HMEDATAATUALIZA, ' +
   '    HMESALDODEV, ' +
   '    HMETXJUROS, ' +
   '    HMEPARCELA, ' +
   '    HMEPARCELAALT, ' +
   '    HMENUMPARCELAS ' +
   ' FROM ' +
   '    ( ' +
   '    SELECT /*+INDEX(HME XIE29HISTMOVEMPTMO) */ ' +
   '       HME.HMEDATAATUALIZA, ' +
   '       HME.HMESALDODEV, ' +
   '       HME.HMETXJUROS, ' +
   '       HME.HMEPARCELA, ' +
   '       HME.HMEPARCELAALT, ' +
   '       HME.HMENUMPARCELAS, ' +
   '       HME.IDCONTRATOEMPTMO ' +
   '    FROM ' +
   '       HISTMOVEMPTMO HME, ' +
   '       ( ' +
   '       SELECT /*+INDEX(HME XIE29HISTMOVEMPTMO) */ ' +
   '          MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO ' +
   '       FROM ' +
   '          HISTMOVEMPTMO   HME ' +
   '       WHERE ' +
   '              ( HME.IDCONTRATOEMPTMO     = ' + FloatToStr( iIDCONTRATOEMPTMO ) + ' ) ' +
   '          AND ( HME.HMETIPOMOV           IN (1, 2, 3, 6, 8) ) ' +
   '          AND ( NVL(HME.FLGESTORNADO, 0) = 0 ) ' +
   '          AND ( HME.HMEDATAATUALIZA      = to_date( ''' + FormatDateTime( 'dd/mm/yyyy', dHMEDATAATUALIZA ) + ''', ''DD/MM/YYYY'') ) ' +
   '       GROUP BY ' +
   '          HME.IDCONTRATOEMPTMO ' +
   '       ) MAXIMO, ' +
   '       ( ' +
   '       SELECT /*+INDEX(HME XIE29HISTMOVEMPTMO) */ ' +
   '          MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO ' +
   '       FROM ' +
   '          HISTMOVEMPTMO   HME ' +
   '       WHERE ' +
   '              ( HME.IDCONTRATOEMPTMO     =' + FloatToStr( iIDCONTRATOEMPTMO ) + ' ) ' +
   '          AND ( HME.HMETIPOMOV           IN (0, 5) ) ' +
   '          AND ( NVL(HME.FLGESTORNADO, 0) = 0 ) ' +
   '          AND ( HME.HMEDATAATUALIZA      = to_date( ''' + FormatDateTime( 'dd/mm/yyyy', dHMEDATAATUALIZA ) + ''', ''DD/MM/YYYY'') ) ' +
   '       GROUP BY ' +
   '          HME.IDCONTRATOEMPTMO ' +
   '       ) MAXDIA ' +
   '    WHERE ' +
   '           HME.IDCONTRATOEMPTMO          = ' + FloatToStr( iIDCONTRATOEMPTMO ) +
   '       AND HME.IDCONTRATOEMPTMO          = MAXIMO.IDCONTRATOEMPTMO(+) ' +
   '       AND HME.IDCONTRATOEMPTMO          = MAXDIA.IDCONTRATOEMPTMO(+) ' +
   '       AND (HME.IDHISTMOVEMPTMO          = MAXIMO.IDHISTMOVEMPTMO OR HME.IDHISTMOVEMPTMO = MAXDIA.IDHISTMOVEMPTMO) ' +
   '    ORDER BY ' +
   '       DECODE(HMETIPOMOV, 0, 0, 1, 2, 2, 6, 3, 9, 4, 7, 5, 1, 6, 3, 7, 4, 8, 5, 8) DESC ' +
   '    ) ' +
   ' WHERE ' +
   '    ROWNUM = 1 ';

  Result := GetDataPacket( sSQL );
end;

function TCtrlWebEmprestimo.SaldoParcelaAnt(iIDCONTRATOEMPTMO: extended; dHMEDATAATUALIZA: TDateTime; iALTERAPARCELA : integer): OLEVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' SELECT /*+INDEX(HME XPKHISTMOVEMPTMO) */ ' +
   '   HST.HMEDATAATUALIZA, ' +
   '   HST.HMESALDODEV, ' +
   '   HST.HMETXJUROS, ' +
   '   HST.HMEPARCELA, ' +
   '   HST.HMENUMPARCELAS ' +
   ' FROM ' +
   '    HISTMOVEMPTMO HST, ' +
   ' ' +
   '    ( ' +
   '    SELECT /*+INDEX(HME XIE29HISTMOVEMPTMO) */ ' +
   '       MAX(HME.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO ' +
   '    FROM ' +
   '       HISTMOVEMPTMO   HME ' +
   '    WHERE ' +
   '           ( HME.IDCONTRATOEMPTMO   = ' + FloatToStr( iIDCONTRATOEMPTMO ) + ' ) ' +
   '       AND ( HME.HMETIPOMOV        <> 5 ) ' +
   iff( iAlteraParcela <> 1, '', ' AND ( HME.HMETIPOMOV in (1, 2, 3) ) ' ) +
   '       AND ( (HME.FLGESTORNADO      = 0) OR (HME.FLGESTORNADO IS NULL) ) ' +
   '       AND ( HME.HMEDATAATUALIZA    = ' +
   '             ( ' +
   '             SELECT /*+INDEX(H XIE29HISTMOVEMPTMO) */ ' +
   '                MAX(H.HMEDATAATUALIZA) AS HMEDATAATUALIZA ' +
   '             FROM ' +
   '                HISTMOVEMPTMO   H ' +
   '             WHERE ' +
   '                    ( H.IDCONTRATOEMPTMO   = ' + FloatToStr( iIDCONTRATOEMPTMO ) + ' ) ' +
   '                AND ( H.HMETIPOMOV        <> 5 ) ' +
   iff( iAlteraParcela <> 1, '', ' AND ( HME.HMETIPOMOV in (1, 2, 3) ) ' ) +
   '                AND ( H.HMEDATAATUALIZA   <= to_date( ''' + FormatDateTime( 'dd/mm/yyyy', dHMEDATAATUALIZA ) + ''', ''DD/MM/YYYY'') ) ' +
   '                AND ( (H.FLGESTORNADO      = 0) OR (H.FLGESTORNADO IS NULL) ) ' +
   '             ) ' +
   '           ) ' +
   '    ) MAX ' +
   ' WHERE ' +
   '    ( HST.IDHISTMOVEMPTMO = MAX.IDHISTMOVEMPTMO ) ';

  Result := GetDataPacket( sSQL );
end; {SaldoParcelaAnt}


function TCtrlWebEmprestimo.ParcelasAVencer(iIdContratoEmptmo: extended; dHmeDataPrevista: TDateTime): OleVariant;
var
  sSQL : String;
begin
  sSQL :=
   ' SELECT ' +
   '     HME.IDHISTMOVEMPTMO, ' +
   '     HME.IDITEMEMPTMO, ' +
   '    DECODE(HME.HMETIPOMOV, -2, -2, ' +
   '                           -1, -1, ' +
   '                            0,  0, ' +
   '                            1,  2, ' +
   '                            2,  6, ' +
   '                            3,  9, ' +
   '                            4,  7, ' +
   '                            5,  1, ' +
   '                            6,  3, ' +
   '                            7,  4, ' +
   '                            8,  5, ' +
   '                                8  ' +
   '          ) AS ORDENACAO, ' +
   '     HME.HMETIPOMOV, ' +
   '     HME.HMEORIGEM, ' +
   '     HME.HMEVLRPREVISTO, ' +
   '     NVL(HME.HMEVLREFETIVO,0) AS HMEVLREFETIVO, ' +
   '     HME.HMEPARCELA, ' +
   '     HME.HMENUMPARCELAS, ' +
   '     HME.HMEDATAVENCTO, ' +
   '     HME.HMEDATAPREVISTA, ' +
   '     HME.HMEDATAEFETIVA, ' +
   '     HME.HMEDATAATUALIZA, ' +
   '     HME.HMECENTRALIZA, ' +
   '     HME.HMEDESTACADO, ' +
   '     NVL(HME.FLGENVIO,1) AS FLGENVIO, ' +
   '     NVL(HME.FLGBAIXADO,1) AS FLGBAIXADO, ' +
   '     NVL(HME.FLGESTORNADO,0) AS FLGESTORNADO, ' +
   '     NVL(HME.FLGQUITADO, 0)     AS FLGQUITADO, ' +
   '     NVL(HME.FLGABONADO,0) AS FLGABONADO, ' +
   '     NVL(HME.FLGDIVERGPEND, 0)  AS FLGDIVERGPEND, ' +
   '     DECODE(NVL(HME.FLGSUSPENSAO, 0), 0, 0, NVL(NVL(HME.IDTIPOSUSPEMPTMO, CON.IDTIPOSUSPEMPTMO), NVL(HME.FLGSUSPENSAO, 0))) AS FLGSUSPENSAO, ' +
   '     HME.HMEFORMACOBRANCA, ' +
   '     HME.HMEANOCOMPETENCIA, ' +
   '     HME.HMEMESCOMPETENCIA, ' +
   '     HME.HMEANOCOBRANCA, ' +
   '     HME.HMEMESCOBRANCA, ' +
   '     HME.HMESALDODEV, ' +
   '     HME.HMETXJUROS ' +
   ' FROM ' +
   '     HISTMOVEMPTMO HME, ' +
   '     CONTRATOEMPTMO CON ' +
   ' WHERE ' +
   '          HME.IDCONTRATOEMPTMO = ' + FloatToStr( iIdContratoEmptmo )+'   ' +
   '    AND   HME.HMEDATAPREVISTA  >= to_date(''' +
     FormatDateTime( 'dd/mm/yyyy', dHmeDataPrevista ) + ''', ''DD/MM/YYYY'' )' +
   '    AND   HME.HMETIPOMOV       in ( 1, 6, 7 ) ' +
   '    AND   HME.FLGBAIXADO       IS NULL   ' +
   '    AND   HME.HMEDATAEFETIVA   IS NOT NULL   ' +
   '    AND   HME.HMEVLREFETIVO    IS NOT NULL   ' +
   '    AND   HME.HMEVLRPREVISTO   > 0   ' +
   '    AND   (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)   ' +
   '    AND   (HME.FLGQUITADO      IS NULL OR HME.FLGQUITADO = 0)   ' +
   '    AND   (HME.FLGABONADO      IS NULL OR HME.FLGABONADO = 0)   ' +
   '    AND   (HME.FLGESTORNADO    IS NULL OR HME.FLGESTORNADO = 0) ' +
   '    AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO ';

  sSQL := sSQL +
   ' ORDER BY ' +
   '    HME.IDHISTMOVEMPTMO ';

  Result := GetDataPacket( sSQL );
end; {ParcelasAVencer}


//Procedure que abre a query que busca os Contratos Ativos do Participante
function TCtrlWebEmprestimo.OutrasDividas(iIdBenef: integer;
  dDataCred: TDateTime): OLEVariant;
begin
  Result := GetDataPacket(
   ' SELECT ' +
   '     0 AS FLGESCOLHA, ' +
   '     1                AS CODTIPO, ' +
   '     ''Previdenciária'' AS TIPO, ' +
   '     MESREFERENCIA AS ORDEM, ' +
   '     DECODE(SUBSTR(MESREFERENCIA,6,12),''01'', ''Janeiro/''  || SUBSTR(MESREFERENCIA,1,4), ' +
   '                                       ''02'', ''Fevereiro/''|| SUBSTR(MESREFERENCIA,1,4), ' +
   '                                       ''03'', ''Março/''    || SUBSTR(MESREFERENCIA,1,4), ' +
   '                                       ''04'', ''Abril/''    || SUBSTR(MESREFERENCIA,1,4), ' +
   '                                       ''05'', ''Maio/''    || SUBSTR(MESREFERENCIA,1,4), ' +
   '                                       ''06'', ''Junho/''    || SUBSTR(MESREFERENCIA,1,4), ' +
   '                                       ''07'', ''Julho/''    || SUBSTR(MESREFERENCIA,1,4), ' +
   '                                       ''08'', ''Agosto/''   || SUBSTR(MESREFERENCIA,1,4), ' +
   '                                       ''09'', ''Setembro/'' || SUBSTR(MESREFERENCIA,1,4), ' +
   '                                       ''10'', ''Outubro/''  || SUBSTR(MESREFERENCIA,1,4), ' +
   '                                       ''11'', ''Novembro/'' || SUBSTR(MESREFERENCIA,1,4), ' +
   '                                       ''12'', ''Dezembro/'' || SUBSTR(MESREFERENCIA,1,4), ' +
   '                                       ''13'',''Contrib. sobre 13º Sal/'' || SUBSTR(MESREFERENCIA,1,4), ' +
   '                                             SUBSTR(MESREFERENCIA,6,12) || ''/'' || SUBSTR(MESREFERENCIA,1,4)) AS MESREFERENCIA, ' +
   ' ' +
   '     DECODE(SUBSTR(MESCOBRANCA,6,12),''01'', ''Janeiro/''  || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''02'', ''Fevereiro/''|| SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''03'', ''Março/''    || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''04'', ''Abril/''    || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''05'', ''Maio/''    || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''06'', ''Junho/''    || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''07'', ''Julho/''    || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''08'', ''Agosto/''   || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''09'', ''Setembro/'' || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''10'', ''Outubro/''  || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''11'', ''Novembro/'' || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''12'', ''Dezembro/'' || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''13'',''Contrib. sobre 13º Sal/'' || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                           SUBSTR(MESCOBRANCA,6,12) || ''/'' || SUBSTR(MESCOBRANCA,1,4)) AS MESCOBRANCA, ' +
   '     DATAPREVISAORECE, ' +
   '     0 AS NUMPARCELA, ' +
   '     SUM(DECODE(FLGDEVOLUCAO,1,-VALORESPERADO,VALORESPERADO)) AS VALORCALCULADO ' +
   ' FROM ' +
   '     HSTCONTRIBPREV ' +
   ' WHERE ' +
   '     IDPESSOA = ' + IntToStr( iIdBenef ) +
   ' AND (VALORRECEBIDO IS NULL OR VALORRECEBIDO = 0) ' +
   ' AND DATAPREVISAORECE < to_date( ' + QuotedStr( DateToStr( dDataCred ) ) + ',' + QuotedStr( 'DD/MM/YYYY' ) + ' ) ' +
   ' GROUP BY ' +
   '     MESREFERENCIA, ' +
   '     MESCOBRANCA, ' +
   '     DATAPREVISAORECE ' +
   ' ' +
   ' UNION ' +
   ' ' +
   ' SELECT ' +
   '     0 AS FLGESCOLHA, ' +
   '     2                AS CODTIPO, ' +
   '     ''Assistencial  '' AS TIPO, ' +
   '     MES AS ORDEM, ' +
   '     DECODE(SUBSTR(MES,6,12),''01'', ''Janeiro/''  || SUBSTR(MES,1,4), ' +
   '                             ''02'', ''Fevereiro/''|| SUBSTR(MES,1,4), ' +
   '                             ''03'', ''Março/''    || SUBSTR(MES,1,4), ' +
   '                             ''04'', ''Abril/''    || SUBSTR(MES,1,4), ' +
   '                             ''05'', ''Maio/''     || SUBSTR(MES,1,4), ' +
   '                             ''06'', ''Junho/''    || SUBSTR(MES,1,4), ' +
   '                             ''07'', ''Julho/''    || SUBSTR(MES,1,4), ' +
   '                             ''08'', ''Agosto/''   || SUBSTR(MES,1,4), ' +
   '                             ''09'', ''Setembro/'' || SUBSTR(MES,1,4), ' +
   '                             ''10'', ''Outubro/''  || SUBSTR(MES,1,4), ' +
   '                             ''11'', ''Novembro/'' || SUBSTR(MES,1,4), ' +
   '                             ''12'', ''Dezembro/'' || SUBSTR(MES,1,4), ' +
   '                             ''13'',''Contrib. sobre 13º Sal/'' || SUBSTR(MES,1,4), ' +
   '                                           SUBSTR(MES,6,12) || ''/'' || SUBSTR(MES,1,4)) AS MESREFERENCIA, ' +
   ' ' +
   '     DECODE(SUBSTR(MESCOBRANCA,6,12),''01'', ''Janeiro/''  || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''02'', ''Fevereiro/''|| SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''03'', ''Março/''    || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''04'', ''Abril/''    || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''05'', ''Maio/''     || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''06'', ''Junho/''    || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''07'', ''Julho/''    || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''08'', ''Agosto/''   || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''09'', ''Setembro/'' || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''10'', ''Outubro/''  || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''11'', ''Novembro/'' || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''12'', ''Dezembro/'' || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                     ''13'',''Contrib. sobre 13º Sal/'' || SUBSTR(MESCOBRANCA,1,4), ' +
   '                                           SUBSTR(MESCOBRANCA,6,12) || ''/'' || SUBSTR(MESCOBRANCA,1,4)) AS MESCOBRANCA, ' +
   '     DATAPREVISAO AS DATAPREVISAORECE, ' +
   '     0 AS NUMPARCELA, ' +
   '     SUM(VALORESPERADO) AS VALORCALCULADO ' +
   ' FROM ' +
   '     HSTCONTRIBASS ' +
   ' WHERE ' +
   '     IDTITULAR = ' + IntToStr( iIdBenef ) +
   ' AND (VALORRECEBIDO IS NULL OR VALORRECEBIDO = 0) ' +
   ' AND DATAPREVISAO < to_date( ' + QuotedStr( DateToStr( dDataCred ) ) + ',' + QuotedStr( 'DD/MM/YYYY' ) + ' ) ' +
   ' GROUP BY ' +
   '     MES, ' +
   '     MESCOBRANCA, ' +
   '     DATAPREVISAO ' +
   ' ' +
   ' UNION ' +
   ' ' +
   ' SELECT ' +
   '     0 AS FLGESCOLHA, ' +
   '     3                AS CODTIPO, ' +
   '     ''Fin. Habitac. '' AS TIPO, ' +
   '     REFERENCIA AS ORDEM, ' +
   '     DECODE(SUBSTR(REFERENCIA,6,12),''01'', ''Janeiro/''  || SUBSTR(REFERENCIA,1,4), ' +
   '                             ''02'', ''Fevereiro/''|| SUBSTR(REFERENCIA,1,4), ' +
   '                             ''03'', ''Março/''    || SUBSTR(REFERENCIA,1,4), ' +
   '                             ''04'', ''Abril/''    || SUBSTR(REFERENCIA,1,4), ' +
   '                             ''05'', ''Maio/''     || SUBSTR(REFERENCIA,1,4), ' +
   '                             ''06'', ''Junho/''    || SUBSTR(REFERENCIA,1,4), ' +
   '                             ''07'', ''Julho/''    || SUBSTR(REFERENCIA,1,4), ' +
   '                             ''08'', ''Agosto/''   || SUBSTR(REFERENCIA,1,4), ' +
   '                             ''09'', ''Setembro/'' || SUBSTR(REFERENCIA,1,4), ' +
   '                             ''10'', ''Outubro/''  || SUBSTR(REFERENCIA,1,4), ' +
   '                             ''11'', ''Novembro/'' || SUBSTR(REFERENCIA,1,4), ' +
   '                             ''12'', ''Dezembro/'' || SUBSTR(REFERENCIA,1,4), ' +
   '                             ''13'',''Contrib. sobre 13º Sal/'' || SUBSTR(REFERENCIA,1,4), ' +
   '                                           SUBSTR(REFERENCIA,6,12) || ''/'' || SUBSTR(REFERENCIA,1,4)) AS MESREFERENCIA, ' +
   ' ' +
   '     DECODE(SUBSTR(COBRANCA,6,12),''01'', ''Janeiro/''  || SUBSTR(COBRANCA,1,4), ' +
   '                                     ''02'', ''Fevereiro/''|| SUBSTR(COBRANCA,1,4), ' +
   '                                     ''03'', ''Março/''    || SUBSTR(COBRANCA,1,4), ' +
   '                                     ''04'', ''Abril/''    || SUBSTR(COBRANCA,1,4), ' +
   '                                     ''05'', ''Maio/''     || SUBSTR(COBRANCA,1,4), ' +
   '                                     ''06'', ''Junho/''    || SUBSTR(COBRANCA,1,4), ' +
   '                                     ''07'', ''Julho/''    || SUBSTR(COBRANCA,1,4), ' +
   '                                     ''08'', ''Agosto/''   || SUBSTR(COBRANCA,1,4), ' +
   '                                     ''09'', ''Setembro/'' || SUBSTR(COBRANCA,1,4), ' +
   '                                     ''10'', ''Outubro/''  || SUBSTR(COBRANCA,1,4), ' +
   '                                     ''11'', ''Novembro/'' || SUBSTR(COBRANCA,1,4), ' +
   '                                     ''12'', ''Dezembro/'' || SUBSTR(COBRANCA,1,4), ' +
   '                                     ''13'',''Contrib. sobre 13º Sal/'' || SUBSTR(COBRANCA,1,4), ' +
   '                                           SUBSTR(COBRANCA,6,12) || ''/'' || SUBSTR(COBRANCA,1,4)) AS MESCOBRANCA, ' +
   '     DATAVENCTO AS DATAPREVISAORECE, ' +
   '     NUMPARCELA, ' +
   '     SUM(VLRPARCELA+MULTAEP+JUROSEP+CORRECAOEP+SEGUROEP+MULTASEGEP+JUROSSEGEP+CORRECAOSEGEP-DESCONTOEP) AS VALORCALCULADO ' +
   ' FROM ' +
   '     EPHISTSIAFI ' +
   ' WHERE ' +
   '     IDPESSOA = ' + IntToStr( iIdBenef ) +
   ' AND (VLRPARCELAPG IS NULL OR VLRPARCELAPG = 0) ' +
   ' AND DATAVENCTO < to_date( ' + QuotedStr( DateToStr( dDataCred ) ) + ',' + QuotedStr( 'DD/MM/YYYY' ) + ' ) ' +
   ' GROUP BY ' +
   '     NUMPARCELA, ' +
   '     REFERENCIA, ' +
   '     COBRANCA, ' +
   '     DATAVENCTO ' );
end; {OutrasDividas}

//Retorna o nome da empresa passada como parâmetro
function TCtrlWebEmprestimo.NomeEmpresa(iIdEmpresaProp: integer): string;
var
  cdsLocal : TCMClientDataSet;
begin

  cdsLocal := TCMClientDataSet.Create( nil );
  try
    cdsLocal.Data := GetDataPacket(
                      ' select NOMEEMPRESA ' +
                      ' from   EMPRESAPROP ' +
                      ' where  IDPESSOA =  ' + IntToStr( iIdEmpresaProp ) );

    if not cdsLocal.IsEmpty then
      Result := trim( cdsLocal.FieldByName('NOMEEMPRESA').AsString );

  finally
    cdsLocal.Free;
  end;

end; {NomeEmpresa}

//Valida a inscrição
function TCtrlWebEmprestimo.ValidaInscricao(const iTitular, iTipoEmptmo,
  iInscricao, iIdEmpresaProp: Integer ): Boolean;
var
  sSQL     : String;
  cdsAux   : TCMClientDataSet;
begin
   // função que verifica para um determinado tipo de empréstimo, se o participante
   //   excedeu o limite de inscrições.  Só serão levadas em consideração as inscrições
   //   'Ativa' com o FLGSITUACAO 'A'
  cdsAux := TCMClientDataSet.Create( nil );
  try

    // Tipo de Empréstimo
    sSQL :=
     'SELECT '                                                                     + #13 +
     '  TEP.TEPMAXINSCR, '                                                         + #13 +
     '  COUNT(INS.IDINSCRICAOEMPTMO) AS NUMINSC '                                  + #13 +
     'FROM '                                                                       + #13 +
     '  INSCRICAOEMPTMO INS, '                                                     + #13 +
     '  CONTRATOEMPTMO CON, '                                                      + #13 +
     '  TIPOCONTREMPTMO TCE, '                                                     + #13 +
     '  TIPOEMPTMO TEP '                                                           + #13 +
     'WHERE '                                                                      + #13 +
     '      ( TEP.IDEMPRESAPROP     = ' + IntToStr(iIdEmpresaProp) + ' ) '         + #13 +
     '  AND ( INS.IDPESSOA          = ' + IntToStr(iTitular) + ' ) '               + #13 +
     '  AND ( INS.IDINSCRICAOEMPTMO <> ' + FormatFloat('#0', iInscricao) + ' ) '   + #13 +
     '  AND ( INS.FLGSITUACAO       <> ''C'' ) '                                   + #13 +
     '  AND ( TCE.IDTIPOEMPTMO      = ' + IntToStr(iTipoEmptmo) + ' ) '            + #13 +
     '  AND ( CON.IDINSCRICAOEMPTMO IS NULL ) '                                    + #13 +
     '  AND ( INS.IDINSCRICAOEMPTMO = CON.IDINSCRICAOEMPTMO(+) ) '                 + #13 +
     '  AND ( TCE.IDTIPOCONTREMPTMO = INS.IDTIPOCONTREMPTMO ) '                    + #13 +
     '  AND ( TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ) '                         + #13 +
     'GROUP BY '                                                                   + #13 +
     '  TEP.TEPMAXINSCR ';

    // -------------------------------------------------------------------------------------------

    try
      cdsAux.Data := GetDataPacket( sSQL );
    except
      MessageInfo := 'Erro ao tentar localizar o número máximo e a quantidade de inscrições por participante.';
      Result := False;
      exit;
    end;  // try..except

    if not( cdsAux.IsEmpty ) then
    begin

      // Verifica se o participante poderá realizar mais uma inscrição.
      if cdsAux.FieldByName('NUMINSC').AsInteger >= cdsAux.FieldByName('TEPMAXINSCR').AsInteger then
      begin
        MessageInfo := 'Participante excedeu o limite de inscrições para este tipo de empréstimo.';
        Result := False;
        exit;
      end;

    end;  // if not cdsAux.IsEmpty

    //    Tipo de Contrato
    sSQL :=
    'SELECT '                                                                     + #13 +
    '  TCE.TCEMAXINSCR, '                                                         + #13 +
    '  COUNT(INS.IDINSCRICAOEMPTMO) AS NUMINSC '                                  + #13 +
    'FROM '                                                                       + #13 +
    '  INSCRICAOEMPTMO INS, '                                                     + #13 +
    '  CONTRATOEMPTMO  CON, '                                                     + #13 +
    '  TIPOCONTREMPTMO TCE, '                                                     + #13 +
    '  TIPOEMPTMO      TEP  '                                                     + #13 +
    'WHERE '                                                                      + #13 +
    '      ( TEP.IDEMPRESAPROP     = ' + IntToStr(iIdEmpresaProp) + ' ) '         + #13 +
    '  AND ( INS.IDPESSOA          = ' + IntToStr(iTitular) + ' ) '               + #13 +
    '  AND ( INS.IDINSCRICAOEMPTMO <> ' + FormatFloat('#0', iInscricao) + ' ) '   + #13 +
    '  AND ( INS.FLGSITUACAO       <> ''C'' ) '                                   + #13 +
    '  AND ( TCE.IDTIPOEMPTMO      = ' + IntToStr(iTipoEmptmo) + ' ) '            + #13 +
    '  AND ( CON.IDINSCRICAOEMPTMO IS NULL ) '                                    + #13 +
    '  AND ( INS.IDINSCRICAOEMPTMO = CON.IDINSCRICAOEMPTMO(+) ) '                 + #13 +
    '  AND ( TCE.IDTIPOCONTREMPTMO = INS.IDTIPOCONTREMPTMO ) '                    + #13 +
    '  AND ( TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ) '                         + #13 +
    'GROUP BY '                                                                   + #13 +
    '  TCE.TCEMAXINSCR ';


    try
      cdsAux.Data := GetDataPacket( sSQL );
    except
      MessageInfo := 'Erro ao tentar localizar o número máximo e a quantidade de inscrições por participante.';
      Result := False;
      exit;
    end;  // try..except


    if not( cdsAux.IsEmpty ) then
    begin

       // Verifica se o participante poderá realizar mais uma inscrição.
      if cdsAux.FieldByName('NUMINSC').AsInteger >= cdsAux.FieldByName('TCEMAXINSCR').AsInteger then
      begin
        MessageInfo := 'Participante excedeu o limite de inscrições para este tipo de empréstimo.';
        Result := False;
        exit;
      end;

    end;

    Result := True;

  finally
    cdsAux.Free;
  end;

end; {ValidaInscricao}

//Valida contrato
function TCtrlWebEmprestimo.ValidaContrato(const IDTitular       : Integer;
                                           const IDMutuario      : Integer;
                                           const IDTipoEmptmo    : Integer;
                                           const IDTipoContr     : Integer;
                                           const iQuantQuitado   : Integer;
                                           const iIdEmpresaProp  : Integer;
                                           const bFlgExcepcional : boolean;
                                           var   sMensagens      : string ) : Boolean;
var
  sSQL     : String;
  cdsAux   : TCMClientDataSet;
begin

  // função que verifica para um determinado tipo de empréstimo, se o participante
  //   excedeu o limite de contratos.  Só serão levados em consideração os contratos
  //   com o FLGSITUACAO = 'A', 'E', OU 'K')

  cdsAux := TCMClientDataSet.Create( nil );
  try

    sMensagens := '';

    //    Tipo de Empréstimo

    sSQL :=
    'SELECT '                                                                  + #13 +
    '  TEP.TEPMAXCONTRATO, COUNT(CON.IDCONTRATOEMPTMO) AS NUMCONTRATO '        + #13 +
    'FROM '                                                                    + #13 +
    '  CONTRATOEMPTMO  CON, '                                                  + #13 +
    '  TIPOCONTREMPTMO TCE, '                                                  + #13 +
    '  TIPOEMPTMO      TEP  '                                                  + #13 +
    'WHERE '                                                                   + #13 +
    '      ( TCE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO ) '                 + #13 +
    '  AND ( TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ) '                      + #13 +
    '  AND ( TEP.IDEMPRESAPROP     = ' + IntToStr(iIdEmpresaProp) + ' ) '      + #13 +
    '  AND ( CON.FLGSITUACAO       NOT IN (''C'',  ''Q'') ) '                  + #13 +
    '  AND ( CON.IDBENEF           = ' + IntToStr(IDMutuario) + ' ) '          + #13 +
    '  AND ( CON.IDPESSOA          = ' + IntToStr(IDTitular) + ' ) '           + #13 +
    '  AND ( TCE.IDTIPOCONTREMPTMO = ' + IntToStr(IDTipoContr) + ' ) '         + #13;

    if bFlgExcepcional then sSQL := sSQL +
    '  AND ( CON.IDTIPOCONTREMPTMO IN '                                        + #13 +
    '        ( '                                                               + #13 +
    '        SELECT '                                                          + #13 +
    '           IDTIPOCONTRQUIT '                                              + #13 +
    '        FROM '                                                            + #13 +
    '           TIPOCONTRXQUIT '                                               + #13 +
    '        WHERE '                                                           + #13 +
    '           IDTIPOCONTREMPTMO  = ' + IntToStr(IDTipoContr)                 + #13 +
    '        ) '                                                               + #13 +
    '      ) '                                                                 + #13;

    sSQL := sSQL +
    'GROUP BY '                                                                + #13 +
    '  TEP.TEPMAXCONTRATO ';


    try
      cdsAux.Data := GetDataPacket( sSQL );
    except
      MessageInfo := 'Erro ao tentar localizar o número máximo e a quantidade de contratos por participante.';
      Result := False;
      exit;
    end;  // try..except


    if not( cdsAux.IsEmpty ) then
      if ( cdsAux.FieldByName('NUMCONTRATO').AsInteger - iQuantQuitado ) >= cdsAux.FieldByName('TEPMAXCONTRATO').AsInteger then
        sMensagens :=
         //'Participante não poderá contratar este tipo de empréstimo antes de quitar o(s) contrato(s) anterior(es).';
         'Este empréstimo quitará parcelas de contratos anteriores.';


    //    Tipo de Contrato
    sSQL :=
    'SELECT '                                                                  + #13 +
    '  TCE.TCEMAXCONTRATO, COUNT(CON.IDCONTRATOEMPTMO) AS NUMCONTRATO '        + #13 +
    'FROM '                                                                    + #13 +
    '  CONTRATOEMPTMO  CON, '                                                  + #13 +
    '  TIPOCONTREMPTMO TCE, '                                                  + #13 +
    '  TIPOEMPTMO      TEP  '                                                  + #13 +
    'WHERE '                                                                   + #13 +
    '      ( TCE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO ) '                 + #13 +
    '  AND ( TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ) '                      + #13 +
    '  AND ( TEP.IDEMPRESAPROP     = ' + IntToStr(iIdEmpresaProp) + ' ) '      + #13 +
    '  AND ( CON.FLGSITUACAO       NOT IN (''C'',  ''Q'') ) '                  + #13 +
    '  AND ( CON.IDBENEF           = ' + IntToStr(IDMutuario) + ' ) '          + #13 +
    '  AND ( CON.IDPESSOA          = ' + IntToStr(IDTitular) + ' ) '           + #13 +
    '  AND ( TEP.IDTIPOEMPTMO      = ' + IntToStr(IDTipoEmptmo) + ' ) '        + #13;

    if bFlgExcepcional then sSQL := sSQL +
    '  AND ( CON.IDTIPOCONTREMPTMO IN '                                        + #13 +
    '        ( '                                                               + #13 +
    '        SELECT '                                                          + #13 +
    '           IDTIPOCONTRQUIT '                                              + #13 +
    '        FROM '                                                            + #13 +
    '           TIPOCONTRXQUIT '                                               + #13 +
    '        WHERE '                                                           + #13 +
    '           IDTIPOCONTREMPTMO  = ' + IntToStr(IDTipoContr)                 + #13 +
    '        ) '                                                               + #13 +
    '      ) '                                                                 + #13;

    sSQL := sSQL +
    'GROUP BY '                                                                + #13 +
    '  TCE.TCEMAXCONTRATO ';


    try
      cdsAux.Data := GetDataPacket( sSQL );
    except
      MessageInfo := 'Erro ao tentar localizar o número máximo e a quantidade de contratos por participante.';
      Result := False;
      exit;
    end;  // try..except


    if not( cdsAux.IsEmpty ) then
      if ( cdsAux.FieldByName('NUMCONTRATO').AsInteger - iQuantQuitado ) >= cdsAux.FieldByName('TCEMAXCONTRATO').AsInteger then
        sMensagens :=
         //'Participante não poderá contratar este tipo de empréstimo antes de quitar o(s) contrato(s) anterior(es).';
         'Este empréstimo quitará parcelas de contratos anteriores.';


    Result := True;

  finally
    cdsAux.Free;
  end;

end; {ValidaContrato}


//Pendência 27857 - 07/05/2008
//Valida contrato
function TCtrlWebEmprestimo.ValidaContratoEmQuitacao(const IDTitular       : Integer;
                                                     const IDMutuario      : Integer;
                                                     const IDTipoEmptmo    : Integer;
                                                     const IDTipoContr     : Integer;
                                                     const iQuantQuitado   : Integer;
                                                     const iIdEmpresaProp  : Integer;
                                                     const bFlgExcepcional : boolean;
                                                     var   sMensagens      : string ) : Boolean;
var
  sSQL     : String;
  cdsAux   : TCMClientDataSet;
begin

   // função que verifica para um determinado tipo de empréstimo, se o participante
   // possui contrato em quitação (FLGSITUACAO = 'K')

  cdsAux := TCMClientDataSet.Create( nil );
  try

    sMensagens := '';

    // -------------------------------------------------------------------------------------------
    //    Tipo de Empréstimo
    // -------------------------------------------------------------------------------------------

    sSQL :=
    'SELECT '                                                                  + #13 +
    '  TEP.TEPMAXCONTRATO, COUNT(CON.IDCONTRATOEMPTMO) AS NUMCONTRATO '        + #13 +
    'FROM '                                                                    + #13 +
    '  CONTRATOEMPTMO  CON, '                                                  + #13 +
    '  TIPOCONTREMPTMO TCE, '                                                  + #13 +
    '  TIPOEMPTMO      TEP  '                                                  + #13 +
    'WHERE '                                                                   + #13 +
    '      ( TCE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO ) '                 + #13 +
    '  AND ( TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ) '                      + #13 +
    '  AND ( TEP.IDEMPRESAPROP     = ' + IntToStr(iIdEmpresaProp) + ' ) '   + #13 +
    '  AND ( CON.FLGSITUACAO       = ''K'' ) '                                 + #13 +
    '  AND ( CON.IDBENEF           = ' + IntToStr(IDMutuario) + ' ) '          + #13 +
    '  AND ( CON.IDPESSOA          = ' + IntToStr(IDTitular) + ' ) '           + #13 +
    '  AND ( TEP.IDTIPOEMPTMO      = ' + IntToStr(IDTipoEmptmo) + ' ) '        + #13;

    if bFlgExcepcional then sSQL := sSQL +
    '  AND ( CON.IDTIPOCONTREMPTMO IN '                                        + #13 +
    '        ( '                                                               + #13 +
    '        SELECT '                                                          + #13 +
    '           IDTIPOCONTRQUIT '                                              + #13 +
    '        FROM '                                                            + #13 +
    '           TIPOCONTRXQUIT '                                               + #13 +
    '        WHERE '                                                           + #13 +
    '           IDTIPOCONTREMPTMO  = ' + IntToStr(IDTipoContr)                 + #13 +
    '        ) '                                                               + #13 +
    '      ) '                                                                 + #13;

    sSQL := sSQL +
    'GROUP BY '                                                                + #13 +
    '  TEP.TEPMAXCONTRATO ';

    // -------------------------------------------------------------------------------------------

    try
      cdsAux.Data := GetDataPacket( sSQL );
    except
      MessageInfo := 'Erro ao tentar localizar quantidade de Contratos em Quitação por participante.';
      Result := False;
      exit;
    end;  // try..except

    // -------------------------------------------------------------------------------------------

    if not( cdsAux.IsEmpty ) then
      if ( cdsAux.FieldByName('NUMCONTRATO').AsInteger > 0 ) then begin
        sMensagens := 'Participante NÃO poderá contratar empréstimo pois há contrato(s) anterior(es) em quitação.';
        Result := False;
        exit;
      end;

    // -------------------------------------------------------------------------------------------
    //    Tipo de Contrato
    // -------------------------------------------------------------------------------------------

    sSQL :=
    'SELECT '                                                                  + #13 +
    '  TCE.TCEMAXCONTRATO, COUNT(CON.IDCONTRATOEMPTMO) AS NUMCONTRATO '        + #13 +
    'FROM '                                                                    + #13 +
    '  CONTRATOEMPTMO  CON, '                                                  + #13 +
    '  TIPOCONTREMPTMO TCE, '                                                  + #13 +
    '  TIPOEMPTMO      TEP  '                                                  + #13 +
    'WHERE '                                                                   + #13 +
    '      ( TCE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO ) '                 + #13 +
    '  AND ( TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ) '                      + #13 +
    '  AND ( TEP.IDEMPRESAPROP     = ' + IntToStr(iIdEmpresaProp) + ' ) '      + #13 +
    '  AND ( CON.FLGSITUACAO       = ''K'' ) '                                 + #13 +
    '  AND ( CON.IDBENEF           = ' + IntToStr(IDMutuario) + ' ) '          + #13 +
    '  AND ( CON.IDPESSOA          = ' + IntToStr(IDTitular) + ' ) '           + #13 +
    '  AND ( TCE.IDTIPOCONTREMPTMO = ' + IntToStr(IDTipoContr) + ' ) '         + #13;

    if bFlgExcepcional then sSQL := sSQL +
    '  AND ( CON.IDTIPOCONTREMPTMO IN '                                        + #13 +
    '        ( '                                                               + #13 +
    '        SELECT '                                                          + #13 +
    '           IDTIPOCONTRQUIT '                                              + #13 +
    '        FROM '                                                            + #13 +
    '           TIPOCONTRXQUIT '                                               + #13 +
    '        WHERE '                                                           + #13 +
    '           IDTIPOCONTREMPTMO  = ' + IntToStr(IDTipoContr)                 + #13 +
    '        ) '                                                               + #13 +
    '      ) '                                                                 + #13;

    sSQL := sSQL +
    'GROUP BY '                                                                + #13 +
    '  TCE.TCEMAXCONTRATO ';

    // -------------------------------------------------------------------------------------------

    try
      cdsAux.Data := GetDataPacket( sSQL );
    except
      MessageInfo := 'Erro ao tentar localizar quantidade de Contratos em Quitação por participante.';
      Result := False;
      exit;
    end;  // try..except

    // -------------------------------------------------------------------------------------------

    if not( cdsAux.IsEmpty ) then
      if ( cdsAux.FieldByName('NUMCONTRATO').AsInteger > 0 ) then begin
        sMensagens := 'Participante NÃO poderá contratar empréstimo pois há contrato(s) anterior(es) em quitação.';
        Result := False;
        exit;
      end;

    // -------------------------------------------------------------------------------------------
    // -------------------------------------------------------------------------------------------

    Result := True;

  finally
    cdsAux.Free;
  end;

end; {ValidaContratoEmQuitacao}
//Fim Pendência 27857


function TCtrlWebEmprestimo.VerificaConcessaoNaoEfetivada( iIdTitular,
                                                           iIdMutuario,
                                                           iIdTipoContr : integer;
                                                           bFlgExcepcional : boolean;
                                                           iTipoVerifica : Integer ) : boolean;
var
  sSQL     : String;
  cdsAux   : TCMClientDataset;
begin
  try

    cdsAux := TCMClientDataSet.Create( nil );

    if iTipoVerifica = 0 then  // Não faz nenhum tipo de verificação
    begin
       Result := True;
       Exit;
    end;

    if iTipoVerifica = 1 then // Verifica somente do mesmo tipo de contrato
    begin
       sSQL :=
       'SELECT '                                                         + #13 +
       '  CNT.IDCONTRATOEMPTMO '                                         + #13 +
       'FROM '                                                           + #13 +
       '  CONTRATOEMPTMO CNT, '                                          + #13 +
       '  HISTMOVEMPTMO  HME  '                                          + #13 +
       'WHERE '                                                          + #13 +
       '      CNT.IDPESSOA          = ' + IntToStr(iIDTitular)           + #13 +
       '  AND CNT.IDBENEF           = ' + IntToStr(iIDMutuario)          + #13 +
       '  AND CNT.IDTIPOCONTREMPTMO = ' + IntToStr(iIDTipoContr)         + #13 +
       '  AND NVL(FLGESTORNADO, 0)  = 0 '                                + #13 +
       '  AND CNT.FLGSITUACAO       IN (''A'', ''P'') '                  + #13 +
       '  AND HME.HMETIPOMOV        = 0 '                                + #13 +
       '  AND HME.HMECENTRALIZA     = 1 '                                + #13 +
       '  AND HME.FLGBAIXADO        = 0 '                                + #13 +
       '  AND CNT.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO '             + #13;
    end;

    if iTipoVerifica = 2 then // Verifica todos os tipos de contrato
    begin
    sSQL :=
     'SELECT '                                                         + #13 +
     '  CNT.IDCONTRATOEMPTMO '                                         + #13 +
     'FROM '                                                           + #13 +
     '  CONTRATOEMPTMO CNT, '                                          + #13 +
     '  HISTMOVEMPTMO  HME  '                                          + #13 +
     'WHERE '                                                          + #13 +
     '      CNT.IDPESSOA          = ' + IntToStr(iIdTitular)           + #13 +
     '  AND CNT.IDBENEF           = ' + IntToStr(iIdMutuario)          + #13;

       // ----------------------------------------------------------------------------------------------
       //Pendência 24861 - 28/03/2007 - Alberto - Inclusão dos códigos 19 e 20
     if (
          (bFlgExcepcional) and
          (iIDTipoContr in [11, 12, 13, 14, 15, 16, 19, 20])
        ) then sSQL := sSQL +
     '  AND CNT.IDTIPOCONTREMPTMO = ' + IntToStr(iIdTipoContr)         + #13
     else sSQL := sSQL +
       '  AND CNT.IDTIPOCONTREMPTMO NOT IN (11, 12, 13, 14, 15, 16, 19, 20) ' + #13;
       //Fim Pendência 24861 - 28/03/2007
       // ----------------------------------------------------------------------------------------------

     sSQL := sSQL +
     '  AND NVL(FLGESTORNADO, 0)  = 0 '                                + #13 +
     '  AND CNT.FLGSITUACAO       IN (''A'', ''P'') '                  + #13 +
     '  AND HME.HMETIPOMOV        = 0 '                                + #13 +
     '  AND HME.HMECENTRALIZA     = 1 '                                + #13 +
     '  AND HME.FLGBAIXADO        = 0 '                                + #13 +
     '  AND CNT.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO ';
    end;
    // Fim Marchetti - Pendencia 23407

    try
      cdsAux.Data := GetDataPacket( sSQL );
    except
      MessageInfo := 'Erro ao tentar localizar contratos anteriores não efetivados.';
      Result := False;
      exit;
    end;  // try..except

    if not( cdsAux.IsEmpty ) then
    begin
      MessageInfo := 'Participante não poderá solicitar outro empréstimo pois possui empréstimo anterior não efetivado.';
      Result := False;
      Exit;
    end;  // if not qryAux.IsEmpty

    Result := True;

  finally
    cdsAux.Free;
  end;

end; {VerificaConcessaoNaoEfetivada}


function TCtrlWebEmprestimo.InscricoesAtivas(iIdPessoa, iIdTipoContrEmptmo: integer): integer;
var
  cdsLocal : TCMClientDataSet;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try
    cdsLocal.Data := GetDataPacket( ' select COUNT(*) as QTDE          ' +
                                    ' from   INSCRICAOEMPTMO           ' +
                                    ' where  FLGSITUACAO       = ''A'' ' +
                                    '   and  IDPESSOA          = ' + IntToStr( iIdPessoa          ) +
                                    '   and  IDTIPOCONTREMPTMO = ' + IntToStr( iIdTipoContrEmptmo ) );
    Result := cdsLocal.FieldByName('QTDE').AsInteger;
  finally
    cdsLocal.Free;
  end;
end; {InscricoesAtivas}


function TCtrlWebEmprestimo.SaldoQuitacao(iIdContratoEmptmo, iIdItemEmptmo: integer): OLEVariant;
begin
   Result := GetDataPacket(
    ' SELECT ' +
    '    HME.HMEVLRPREVISTO ' +
    ' FROM ' +
    '    HISTMOVEMPTMO HME ' +
    ' WHERE ' +
    '        HME.IDCONTRATOEMPTMO = ' + IntToStr( iIdContratoEmptmo ) +
    '    AND HME.IDITEMEMPTMO     = ' + IntToStr( iIdItemEmptmo ) );
end;

function TCtrlWebEmprestimo.RegraData1aParc(sRuleName: string;
  iIdTipoContrEmprmo: integer; dDataCredito: TDateTime; iIdEmpresaProp : integer ): TDateTime;
var
  sSQL,
  sResultado : string;
  cdsLocal : TCMClientDataSet;
begin

  Result := 0;

  sSQL :=
   ' SELECT ' +
   '  0' + IntToStr( iIdTipoContrEmprmo )  + ' AS IDTIPOCONTREMPTMO, ' +
   '   ' + QuotedStr( FormatDateTime('dd/mm/yyyy', dDataCredito ) ) + ' AS DATACREDITO ' +
   ' FROM ' +
   '   DUAL ';

  WebRegra.CdsDataSetIn.Close;

  WebRegra.CdsDataSetIn.Data := GetDataPacket( sSQL );

  WebRegra.MessageInfo := '';
  sResultado := WebRegra.RegraString( sRuleName, iIdEmpresaProp );
  if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );

  if ( sResultado <> '' ) and ( sResultado <> 'NULO' ) then
  begin
    try
      Result := StrToDate( sResultado );
    except
      Result := 0;
    end;
  end
  else
     Result := 0;

end; {RegraData1aParc}


function TCtrlWebEmprestimo.CalculaQuitacaoContratoAnterior( cdsContratosAnteriores: TCMClientdataset;
                                                             iIdEmpresaProp : integer;
                                                             iIdTipoEmptmo,
                                                             iIdTipoContrEmptmo,
                                                             iIDITEMDEVSEGQUIT,
                                                             iIDITEMPROVPERDA : integer;
                                                             dDtCredito : TDateTime;
                                                             bFlgExcepcional : boolean;
                                                             iFlgAbonoDiverg : integer;
                                                             iTipoCliente    : integer;
                                                             SavePlace         : TBookmark;
                                                             var fVlrTotalAberto : Currency ) : OLEVariant;
var
  fVlrEmAberto : Currency;
  rContratoAnterior : TDadosContrato;
  vListaQuitacao : TListaItem;
  i : integer;
begin
  LimpaRegistroContrato(rContratoAnterior);

  rContratoAnterior.IDContratoEmptmo  := cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat;
  rContratoAnterior.IDInscricaoEmptmo := cdsContratosAnteriores.FieldByName('IDINSCRICAOEMPTMO').AsFloat;

  rContratoAnterior.NumParcelas       := cdsContratosAnteriores.FieldByName('NUMPARCELAS').AsInteger;

  rContratoAnterior.IDTipoContrEmptmo := cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
  rContratoAnterior.FlgFormaRec       := cdsContratosAnteriores.FieldByName('FLGFORMAREC').AsString;
  rContratoAnterior.Indexador         := cdsContratosAnteriores.FieldByName('MOECODIGO').AsInteger;
  rContratoAnterior.SiglaIndexador    := cdsContratosAnteriores.FieldByName('MOESIGLA').AsString;
  rContratoAnterior.IdPessoa          := cdsContratosAnteriores.FieldByName('IDPESSOA').AsInteger;
  rContratoAnterior.IdBenef           := cdsContratosAnteriores.FieldByName('IDBENEF').AsInteger;
  rContratoAnterior.IdPlanoPrev       := cdsContratosAnteriores.FieldByName('IDPLANOPREV').AsInteger;
  rContratoAnterior.IdPatro           := cdsContratosAnteriores.FieldByName('IDPATRO').AsInteger;
  rContratoAnterior.IdSitPart         := cdsContratosAnteriores.FieldByName('IDSITPART').AsInteger;
  rContratoAnterior.DataCredito       := cdsContratosAnteriores.FieldByName('DATACREDITO').AsDateTime;
  rContratoAnterior.DataAssinatura    := cdsContratosAnteriores.FieldByName('DATAASSINATURA').AsDateTime;
  rContratoAnterior.DataPrimParc      := cdsContratosAnteriores.FieldByName('DATAPRIMPARC').AsDateTime;
  rContratoAnterior.IDTipoEmptmo      := cdsContratosAnteriores.FieldByName('IDTIPOEMPTMO').AsInteger;

  ExistemItensEmAberto_fCad( HoraServidor, cdsContratosAnteriores.Data, fVlrEmAberto );

  fVlrTotalAberto := fVlrTotalAberto + fVlrEmAberto;


  if CalculaItensQuitacao( rContratoAnterior,
                           iIdEmpresaProp,
                           iIdTipoEmptmo,
                           iIdTipoContrEmptmo,
                           0,
                           iIDITEMPROVPERDA,
                           dDtCredito,
                           -1,
                           Now,
                           bFlgExcepcional,
                           False,
                           iFlgAbonoDiverg,
                           iTipoCliente, 
                           vListaQuitacao ) then
  begin
    for i := 0 to High(vListaQuitacao) do
    begin
      if vListaQuitacao[i].FlgCentraliza = 1 then
      begin
        SavePlace := cdsContratosAnteriores.GetBookmark;

        cdsContratosAnteriores.Edit;
        cdsContratosAnteriores.FieldByName('VLRATUAL').AsCurrency := vListaQuitacao[i].Valor;
        cdsContratosAnteriores.Post;
        cdsContratosAnteriores.GotoBookmark( SavePlace );
      end;

      if vListaQuitacao[i].CodigoItem = iIDITEMDEVSEGQUIT then
      begin
        SavePlace := cdsContratosAnteriores.GetBookmark;

        cdsContratosAnteriores.Edit;
        cdsContratosAnteriores.FieldByName('VLRDEVSEG').AsCurrency := vListaQuitacao[i].Valor;
        cdsContratosAnteriores.Post;
        cdsContratosAnteriores.GotoBookmark(SavePlace);
      end;

    end; // for

  end;

end;

function TCtrlWebEmprestimo.PegaSeguroAnt( iIdContratoEmptmo: Extended; iIDITEMSEGCONC : integer): Currency;
var
  cdsLocal : TCMClientDataset;
begin
  cdsLocal := TCMClientDataset.Create( nil );
  try
    cdsLocal.Data := GetDataPacket(
     ' SELECT ' +
     '    SUM(HMEVLRPREVISTO) AS HMEVLRPREVISTO ' +
     ' FROM ' +
     '    HISTMOVEMPTMO HME ' +
     ' WHERE ' +
     '        HME.IDITEMEMPTMO         = ' + IntToStr( iIDITEMSEGCONC ) +
     '    AND HME.IDCONTRATOEMPTMO     = ' + FloatToStr( iIdContratoEmptmo ) +
     '    AND NVL(HME.FLGESTORNADO, 0) = 0 ' );

    Result := cdsLocal.FieldByName('HMEVLRPREVISTO').AsCurrency;

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlWebEmprestimo.PegaSeguroComplAnt( iIdContratoEmptmo : Extended; iIDITEMSEGCOMPL: integer): Currency;
var
  cdsLocal : TCMClientDataset;
begin
  cdsLocal := TCMClientDataset.Create( nil );
  try
    cdsLocal.Data := GetDataPacket(
     ' SELECT ' +
     '    SUM(HMEVLRPREVISTO) AS HMEVLRPREVISTO ' +
     ' FROM ' +
     '    HISTMOVEMPTMO HME ' +
     ' WHERE ' +
     '        HME.IDITEMEMPTMO         = ' + IntToStr( iIDITEMSEGCOMPL ) +
     '    AND HME.IDCONTRATOEMPTMO     = ' + FloatToStr( iIdContratoEmptmo ) +
     '    AND NVL(HME.FLGESTORNADO, 0) = 0 ' );

    Result := cdsLocal.FieldByName('HMEVLRPREVISTO').AsCurrency;

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlWebEmprestimo.ContratosAnteriores2(iIdPessoa, iIdBenef: integer): OleVariant;
begin
  Result := GetDataPacket(
   ' SELECT ' +
   '    CON.IDCONTRATOEMPTMO, CON.IDTIPOCONTREMPTMO ' +
   ' FROM ' +
   '    CONTRATOEMPTMO CON ' +
   ' WHERE ' +
   '        CON.IDPESSOA     = ' + IntToStr( iIdPessoa ) +
   '    AND CON.IDBENEF      = ' + IntToStr( iIdBenef ) +
   '    AND CON.FLGSITUACAO  NOT IN (''C'', ''Q'') ' );
end;

function TCtrlWebEmprestimo.PossuiAtualizacaoDiaria( iIdContratoEmptmo: extended; dData: TDateTime): Boolean;
var
  cdsLocal : TCMClientDataset;
begin
  cdsLocal := TCMClientDataset.Create( nil );
  try
    cdsLocal.Data := GetDataPacket(
     ' SELECT ' +
     '    DISTINCT HMEDATAATUALIZA ' +
     ' FROM ' +
     '    HISTMOVEMPTMO  HME ' +
     ' WHERE ' +
     '        HME.IDCONTRATOEMPTMO      = ' + ConverteVirgulaParaPonto( iIdContratoEmptmo ) +
     '    AND HME.HMETIPOMOV            = 5 ' +
     '    AND NVL(HME.FLGESTORNADO, 0)  = 0 ' +
     '    AND HME.HMEDATAATUALIZA       = to_date( ''' + FormatDateTime( 'dd/mm/yyyy', dData ) + ''', ''DD/MM/YYYY'') ' );

    Result := not cdsLocal.IsEmpty;
  finally
    cdsLocal.Free;
  end;
end;


function TCtrlWebEmprestimo.PossuiAssinatura(iIdPessoa, iIdBenef, iIdTipoContrEmptmo: integer; var sMensagem : string): boolean;
var
  cdsLookAssinatura,
  cdsLookPossuiAssinatura,
  cdsLookMaxContratoPadraoObrig,
  cdsContratoPadraoAtivo : TCMClientDataset;

  iIdContratoPadraoObrig  : Int64;
  iIdContratoPadraoAtivo  : Int64;
  iIdPlanoPrev            : Int64;
  iTipoAlt                : Int64;
begin
  Result := True;

  iTipoAlt := 0;

  cdsLookAssinatura             := TCMClientDataset.Create( nil );
  cdsLookPossuiAssinatura       := TCMClientDataset.Create( nil );
  cdsLookMaxContratoPadraoObrig := TCMClientDataset.Create( nil );
  cdsContratoPadraoAtivo        := TCMClientDataset.Create( nil );
  try

    cdsLookAssinatura.Data := LookAssinatura( iIdPessoa, iIdBenef, 0 );

    if cdsLookAssinatura.IsEmpty then
    begin
      sMensagem := 'Mutuário não possui nenhuma assinatura de contrato.';
      Result := False;
      exit;
    end;

    cdsLookAssinatura.Close;
    cdsLookAssinatura.Data := LookAssinatura( iIdPessoa, iIdBenef, iIdTipoContrEmptmo );

    if not cdsLookAssinatura.IsEmpty then
    begin
      if cdsLookAssinatura.FieldByName('FLGBLOQUEIO').AsInteger <> 0 then
        raise Exception.Create( 'Mutuário está com concessão bloqueada.' );
    end;

   // ----------------------------------------------------------------------------------------------

    if cdsLookAssinatura.IsEmpty then
    //Pendência 22914 - 16/08/2006
    begin
      sMensagem := 'Mutuário não possui assinatura para esse tipo de contrato.';
      Result := False;
      exit;
    end;
    //Fim Pendência 22914

    // Verifica a existencia de contrato obrigatório a ser assinado no periodo
    iIdContratoPadraoObrig := -1;

    cdsLookMaxContratoPadraoObrig.Data := LookMaxContratoPadraoObrig( iIdTipoContrEmptmo );

    if not( cdsLookMaxContratoPadraoObrig.IsEmpty ) then
      iIdContratoPadraoObrig := cdsLookMaxContratoPadraoObrig.FieldByName('IDCONTRATOPADRAO').AsInteger;

    //Pesquisa o ultimo contrato ativo
    cdsContratoPadraoAtivo.Data := ContratoPadraoAtivo(iIdTipoContrEmptmo );

    iIdContratoPadraoAtivo := cdsContratoPadraoAtivo.FieldByName('IDCONTRATOPADRAO').AsInteger;

    // Verifica se mutuário possui assinatura do contrato obrigatório
    cdsLookPossuiAssinatura.Close;
    cdsLookPossuiAssinatura.Data := LookPossuiAssinatura( iIdPessoa, iIdBenef, iIdContratoPadraoObrig );

    if cdsLookAssinatura.IsEmpty then
    begin
      // Verifica se mutuário possui assinatura do contrato ativo
      cdsLookPossuiAssinatura.Close;
      cdsLookPossuiAssinatura.Data := LookPossuiAssinatura( iIdPessoa, iIdBenef, iIdContratoPadraoAtivo );

      if cdsLookPossuiAssinatura.IsEmpty then
      begin
         cdsLookAssinatura.Last;

         // Verifica se a ultima assinatura do mutuário é inferior ao obrigatorio
         if cdsLookAssinatura.FieldByName('CTPDATAINICIO').AsDateTime < cdsLookMaxContratoPadraoObrig.FieldByName('CTPDATAINICIO').AsDateTime then
         begin
           sMensagem := 'Mutuário necessita de nova assinatura de contrato.';
           Result := False;
           exit;
         end;

      end;
    end;

  finally
    cdsLookAssinatura.Free;
    cdsLookPossuiAssinatura.Free;
    cdsLookMaxContratoPadraoObrig.Free;
    cdsContratoPadraoAtivo.Free;
  end

end;


function TCtrlWebEmprestimo.LookAssinatura(iIdPessoa, iIdBenef, iIdTipoContrEmptmo: integer): OLEVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' SELECT ' +
   '    ACP.IDPESSOA, ACP.IDBENEF, ' +
   '    ACP.IDCONTRATOPADRAO, ' +
   '    ACP.ACPDATAASSINAT, ' +
   '    CTP.CTPDATAINICIO, ' +
   '    SIT.FLGINTERNO, ' +
   '    PPP.IDPLANOPREV, ' +
   '    NVL(ACP.FLGBLOQUEIO, 0) AS FLGBLOQUEIO, ' +
   '    NVL(CTP.CTPOBRIGATORIO, 0) AS CTPOBRIGATORIO ' +

   ' FROM ' +
   '    ASSINCONTRPADRAO    ACP, ' +
   '    CONTRATOPADRAO      CTP, ' +
   '    CONTRPADRXTIPOCONTR CPT, ' +
   '    PARTPREVPLAN        PPP, ' +
   '    TIPOCONTREMPTMO     TCE, ' +
   '    SITPART             SIT, ' +
   '    DEPENTIT            DEP ' +

   ' WHERE ' +
   '        ACP.IDPESSOA          = ' + IntToStr( iIdPessoa ) +
   '    AND ACP.IDBENEF           = ' + IntToStr( iIdBenef ) ;

  if iIdTipoContrEmptmo > 0 then
    sSQL := sSQL +
     '    AND ( CPT.IDTIPOCONTREMPTMO = ' + IntToStr( iIdTipoContrEmptmo ) + ' ) ';

  sSQL := sSQL +
   '    AND ACP.IDCONTRATOPADRAO  = CTP.IDCONTRATOPADRAO ' +
   '    AND CTP.IDCONTRATOPADRAO  = CPT.IDCONTRATOPADRAO ' +
   '    AND TCE.IDTIPOCONTREMPTMO = CPT.IDTIPOCONTREMPTMO(+) ' +
   '    AND ACP.IDPESSOA          = DEP.IDTITULAR ' +
   '    AND ACP.IDBENEF           = DEP.IDPESSOA ' +
   '    AND PPP.IDSITPART         = SIT.IDSITPART ' +
   '    AND ACP.IDPESSOA          = PPP.IDPESSOA ' +
   '    AND PPP.FLGDESATIVADO     = 0 ' +

   ' ORDER BY ' +
   '    CTP.CTPDATAINICIO, PPP.IDPLANOPREV ' ;

  if bGeraLogQuery then CMDebugToFile( 'Início Query Verifica Assinatura.. ', sNomeArqLog );
  if bGeraLogQuery then CMDebugToFile( sSQL, sNomeArqLog );
  Result := GetDataPacket( sSQL );
  if bGeraLogQuery then CMDebugToFile( 'Termino Query Verifica Assinatura.. ', sNomeArqLog );

end;

function TCtrlWebEmprestimo.LookMaxContratoPadraoObrig(iIdTipoContrEmptmo: integer): OLEVariant;
begin
  Result := GetDataPacket(
   ' SELECT ' +
   '    CTP.IDCONTRATOPADRAO, CTP.CTPDATAINICIO ' +
   ' FROM ' +
   '    CONTRATOPADRAO CTP, ' +
   '    CONTRPADRXTIPOCONTR CPT ' +
   ' WHERE ' +
   '     CPT.IDTIPOCONTREMPTMO = ' + IntToStr( iIdTipoContrEmptmo ) +
   ' AND CTP.IDCONTRATOPADRAO  = CPT.IDCONTRATOPADRAO ' +
   ' AND CTP.CTPDATAINICIO = (SELECT MAX(CTPDATAINICIO) AS CTPDATAINICIO ' +
   '                          FROM   CONTRATOPADRAO ' +
   '                          WHERE  IDTIPOCONTREMPTMO = ' + IntToStr( iIdTipoContrEmptmo ) +
   '                          AND    CTPDATAINICIO <= SYSDATE ' +
   '                          AND    CTPOBRIGATORIO = 1) ' );
end;

function TCtrlWebEmprestimo.ContratoPadraoAtivo(iIdTipoContrEmptmo: integer): OLEVariant;
begin
  Result := GetDataPacket(
   ' SELECT ' +
   '    CTP.IDCONTRATOPADRAO ' +
   ' FROM ' +
   '    CONTRATOPADRAO CTP ' +
   ' WHERE ' +
   '     CTP.IDTIPOCONTREMPTMO = ' + IntToStr( iIdTipoContrEmptmo ) +
   ' AND CTP.CTPDATAINICIO = (SELECT MAX(CTPDATAINICIO) AS CTPDATAINICIO ' +
   '                          FROM   CONTRATOPADRAO ' +
   '                          WHERE  IDTIPOCONTREMPTMO = ' + IntToStr( iIdTipoContrEmptmo ) +
   '                          AND    CTPDATAINICIO <= SYSDATE ) ' );
end;

function TCtrlWebEmprestimo.LookPossuiAssinatura(iIdPessoa, iIdBenef, iIdTipoContrEmptmo: integer): OLEVariant;
begin
  Result := GetDataPacket(
   ' SELECT ' +
   '    ACP.IDPESSOA, ACP.IDBENEF, ' +
   '    ACP.IDCONTRATOPADRAO, ' +
   '    ACP.ACPDATAASSINAT, ' +
   '    ACP.IDCONTRATOPADRAO, ' +
   '    CTP.CTPDATAINICIO, ' +
   '    NVL(CTP.CTPOBRIGATORIO,0) AS CTPOBRIGATORIO ' +
   ' FROM ' +
   '    ASSINCONTRPADRAO ACP, ' +
   '    CONTRATOPADRAO   CTP ' +
   ' WHERE ' +
   '        ACP.IDPESSOA          = ' + IntToStr( iIdPessoa ) +
   '    AND ACP.IDBENEF           = ' + IntToStr( iIdBenef ) +
   '    AND ACP.IDCONTRATOPADRAO  = ' + IntToStr( iIdTipoContrEmptmo ) +
   '    AND ACP.IDCONTRATOPADRAO  = CTP.IDCONTRATOPADRAO  ' );
end;

function TCtrlWebEmprestimo.PossuiSuspensaoConcessao( iIdPessoa: integer; dData : TDateTime ): Boolean;
var
  cdsLocal : TCMClientDataset;
begin
  cdsLocal := TCMClientDataset.Create( nil );
  try
    cdsLocal.Data := GetDataPacket(
     ' SELECT ' +
     '   SUC.IDPESSOA, ' +
     '   PES.NOME, ' +
     '   SUC.SUCDATAINICIO, ' +
     '   SUC.SUCDATAFINAL, ' +
     '   SUC.SUCMOTIVOSUSP ' +
     ' FROM ' +
     '   PESSOA PES, SUSPCONCESSAO SUC ' +
     ' WHERE ' +
     '       SUC.IDPESSOA         = ' + IntToStr( iIdPessoa ) +
     '   AND SUC.SUCDATAINICIO   <= to_date( ''' + FormatDateTime('dd/mm/yyyy', dData ) + ''', ''DD/MM/YYYY'' ) ' +
     '   AND ( (SUC.SUCDATAFINAL >= to_date( ''' + FormatDateTime('dd/mm/yyyy', dData ) + ''', ''DD/MM/YYYY'' ) ) OR (SUCDATAFINAL IS NULL) ) ' +
     '   AND PES.IDPESSOA        = SUC.IDPESSOA ' );

    Result := not cdsLocal.IsEmpty;

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlWebEmprestimo.VerificaConcessaoIgualPosterior(iIdTitular, iIdMutuario: integer; dDataCredito: TDateTime; bPosterior : boolean ): Boolean;
var
  cdsLocal : TCMClientDataset;
  sSQL, sData : string;
begin
  cdsLocal := TCMClientDataset.Create( nil );
  try
    sData := QuotedStr(FormatDateTime('dd/mm/yyyy', dDataCredito));

    sSQL :=
    'SELECT '                                                               + #13 +
    '  CNT.IDCONTRATOEMPTMO '                                               + #13 +
    'FROM '                                                                 + #13 +
    '  CONTRATOEMPTMO CNT, '                                                + #13 +
    '  HISTMOVEMPTMO  HME  '                                                + #13 +
    'WHERE '                                                                + #13 +
    '      CNT.IDPESSOA          = ' + IntToStr(iIdTitular)                 + #13 +
    '  AND CNT.IDBENEF           = ' + IntToStr(iIdMutuario)                + #13 +
    '  AND NVL(FLGESTORNADO, 0)  = 0 '                                      + #13 +
    '  AND CNT.FLGSITUACAO       NOT IN (''C'', ''Q'') '                    + #13 +
    '  AND HME.HMETIPOMOV        = 0 '                                      + #13 +
    '  AND HME.HMECENTRALIZA     = 1 '                                      + #13 ;

    if bPosterior then sSQL := sSQL +
      '  AND HME.HMEDATAPREVISTA > TO_DATE( ' + sData + ',''DD/MM/YYYY'') ' + #13
    else sSQL := sSQL +
      '  AND HME.HMEDATAPREVISTA = TO_DATE( ' + sData + ',''DD/MM/YYYY'') ' + #13;

    sSQL := sSQL +
      '  AND CNT.IDCONTRATOEMPTMO  = HME.IDCONTRATOEMPTMO ';

    cdsLocal.Data := GetDataPacket( sSQL );

    Result := cdsLocal.IsEmpty; 

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlWebEmprestimo.LookTipoSusp( iIdTipoContrEmptmo : integer; bFlgFerias : boolean ) : OLEVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' SELECT ' +
   '     TSE.IDTIPOSUSPEMPTMO, ' +
   '     TSE.IDREGRAENVIOPARC, ' +
   '     TSE.IDREGRARECALCIOF, ' +
   '     TSE.IDREGRARECALCSEG, ' +
   '     TSE.IDREGRAVALIDSUSP, ' +
   '     TSE.TSEDESCRICAO, ' +
   '     TSE.TSEMESES, ' +
   '     TSE.TSEINICIOSUSP, ' +
   '     TSE.TSEFINALSUSP, ' +
   '     TSE.IDRUBRICAADFERIAS, ' +
   '     TSE.FLGGERAPARCELAS, ' +
   '     TSE.FLGATUALSALDOPARC, ' +
   '     TSE.FLGSUSPCONCESSAO, ' +
   '     TSE.FLGCOBRAENCARGOS, ' +
   '     TSE.FLGDEDUZPARCREST, ' +
   '     TSE.FLGATUALSALDOENV, ' +
   '     TSE.FLGFERIAS, ' +
   '     TSE.FLGCOBRJUDICIAL ' +
   ' FROM ' +
   '     TIPOSUSPEMPTMO TSE, ' +
   '     TIPOCONTRXSUSP TCS ' +
   ' WHERE ' ;

  if iIdTipoContrEmptmo > 0 then
    sSQL := sSQL +
     '     TCS.IDTIPOCONTREMPTMO = ' + IntToStr( iIdTipoContrEmptmo ) + ' AND ';

  if bFlgFerias then
    sSQL := sSQL +
     '     NVL(TSE.FLGFERIAS, 0) = 1 AND ';

  sSQL := sSQL +
   '  TSE.IDTIPOSUSPEMPTMO = TCS.IDTIPOSUSPEMPTMO ';

  Result := GetDataPacket( sSQL );
end;

function TCtrlWebEmprestimo.ValidaSuspensao(iIdRegraValidSusp: Int64;
  iIdContratoEmptmo: Extended; iIdPessoa, iIdBenef, iIdPatro: Int64;
  sFlgInterno: String; iIdTipoSuspEmptmo: Int64; nTseMeses: Integer;
  dTseInicioSusp, dTseFinalSusp: TDateTime; iFlgFerias, iNumParcAberto,
  iNumParcPagas: Integer; dDataInicioAnt, dDataAtualiza: TDateTime;
  iIdSuspensaoAtual: Int64; iIdEmpresaProp : integer; iExcepcional: Integer;
  iIDPessjurCedido : Integer; iLote : Integer): TDateTime;
var
  sSQL              : String;
  sResultado        : String;
  cdsAux            : TCMClientDataset;
  iIdResponsavel    : Int64;
  sCodTipoRecebedor : String;
  dDataFimReceb     : TDateTime;
begin

  Result := -1;

  (* Cria a Query Auxiliar *)
  cdsAux := TCMClientDataset.Create( nil );
  try
    dDataFimReceb := 0;
    iIdResponsavel := 0;

    sSQL :=
     '  SELECT '                                                                         + #13 +
     '     BTP.IDRESPONNAOREC AS IDRESPONSAVEL, '                                        + #13 +
     '     BTP.CODTIPORECEBEDOR, '                                                       + #13 +
     '     BTP.DATAFIMRECEB '                                                            + #13 +
     '  FROM '                                                                           + #13 +
     '     BENEFBFCIARIO BFC, '                                                          + #13 +
     '     BFCIARIOTITPLAN BTP '                                                         + #13 +
     '  WHERE '                                                                          + #13 +
     '         IDSITBENEFICIO   IN (1,2,7) '                                             + #13 +
     '     AND BFC.IDPESSOA     = ' + IntToStr(iIdPessoa)                                + #13 +
     '     AND BFC.IDTITULAR    = BTP.IDTITULAR '                                        + #13 +
     '     AND BFC.IDBENEFICIO  = BTP.IDBENEFICIO '                                      + #13 +
     '     AND BFC.IDPLANOPREV  = BTP.IDPLANOPREV '                                      + #13 +
     '  AND ( DATAFINAL IS NULL    OR  '+
     '        DATAFINAL > TO_DATE' +
     '        (' + QuotedStr(DateToStr(dTseInicioSusp)) + ',' + QuotedStr('DD/MM/YYYY') + ' ) ' +
     '      ) ';

    cdsAux.Data := GetDataPacket( sSQL );

    if not(cdsAux.IsEmpty) then
    begin
      iIdResponsavel    := cdsAux.FieldByName('IDRESPONSAVEL').AsInteger;
      sCodTipoRecebedor := cdsAux.FieldByName('CODTIPORECEBEDOR').AsString;
      dDataFimReceb     := cdsAux.FieldByName('DATAFIMRECEB').AsDateTime;
    end;

  finally
    cdsAux.Free;
  end;

  Result := 0;
  sSQL :=
  'SELECT '                                                                                 + #13 +
  ' ' + FormatFloat('#0', iIdContratoEmptmo)                     + ' AS IDCONTRATOEMPTMO, ' + #13 +
  ' ' + IntToStr(iIdPessoa)                                      + ' AS IDPESSOA, '         + #13 +
  ' ' + IntToStr(iIDBenef)                                       + ' AS IDBENEF, '          + #13 +
  ' ' + IntToStr(iIDPatro)                                       + ' AS IDPESSJUR, '        + #13 +
  ' ' + IntToStr(iIDPatro)                                       + ' AS IDPATRO, '          + #13 +
  ' ' + QuotedStr(sFlgInterno)                                   + ' AS FLGINTERNO, '       + #13 +
  ' ' + IntToStr(iIdTipoSuspEmptmo)                              + ' AS IDTIPOSUSPEMPTMO, ' + #13 +
  ' ' + IntToStr(nTseMeses)                                      + ' AS TSEMESES, '         + #13 +
  ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dTseInicioSusp))  + ' AS TSEINICIOSUSP, '    + #13 +
  ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dTseFinalSusp))   + ' AS TSEFINALSUSP, '     + #13 +
  ' ' + IntToStr(iFlgFerias)                                     + ' AS FLGFERIAS, '        + #13 +
  ' ' + IntToStr(iNumParcAberto)                                 + ' AS NUMPARCABERTO, '    + #13 +
  ' ' + IntToStr(iNumParcPagas)                                  + ' AS NUMPARCPAGAS, '     + #13 +
  ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInicioAnt))  + ' AS DDATAINICIOANT, '   + #13 +
  ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataAtualiza))   + ' AS DATAATUALIZA, '     + #13 +
  ' ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataFimReceb))   + ' AS DATAFIMRECEB, '     + #13 +
  ' ' + IntToStr(iIdResponsavel)                                 + ' AS IIDRESPONSAVEL, '   + #13 +
  ' ' + QuotedStr(sCodTipoRecebedor)                             + ' AS CODTIPORECEBEDOR, ' + #13 +
  ' ' + IntToStr(iIdSuspensaoAtual)                              + ' AS IDTIPOSUSPATUAL, '  + #13 +
  '0' + IntToStr(iExcepcional)                                   + ' AS FLGEXCEPCIONAL, '   + #13 +
  '0' + IntToStr(iIDPessjurCedido)                               + ' AS IDPESSJURCEDIDO, '  + #13 +
  '0' + IntToStr(iLote)                                          + ' AS FLGLOTE '           + #13 +
  'FROM '                                                                                   + #13 +
  '  DUAL ';

  WebRegra.CdsDataSetIn.Close;

  WebRegra.CdsDataSetIn.Data := GetDataPacket( sSQL );

  WebRegra.MessageInfo := '';
  sResultado := WebRegra.RegraString( IntToStr( iIdRegraValidSusp ), iIdEmpresaProp );
  if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );

  if sResultado <> '' then
    Result := StrToDate(sResultado)
  else
    Result := StrToDate( '31/12/1899' );
end;


function TCtrlWebEmprestimo.Avalistas: OLEVariant;
begin
  Result := GetDataPacket(
   ' select   a.IDAVALISTA,             ' +
   '          p.NOME                    ' +
   ' from     AVALISTA a,               ' +
   '          PESSOA   p                ' +
   ' where    a.IDAVALISTA = p.IDPESSOA ' +
   ' order by p.NOME                    ' );
end;

function TCtrlWebEmprestimo.VerificaObrigatoriedadeAvalista( iIDBENEF, iIDREGRAAVAL, iIdEmpresaProp : integer ) : boolean;
var
  cdsLocal   : TCMClientDataset;
  sResultado : String;
  sSql       : String;
begin
  cdsLocal := TCMClientDataset.Create( nil );
  try
    Result := True;

    sSql   :=
     'SELECT '                                                                           + #13 +
     '  PPP.IDPESSOA, SIT.FLGINTERNO, ELP.IDSITFUNC '                                    + #13 +
     'FROM '                                                                             + #13 +
     '  PESSOAFISICA PFI, '                                                              + #13 +
     '  PARTPREVPLAN PPP, '                                                              + #13 +
     '  ELEGPATRO    ELP, '                                                              + #13 +
     '  SITPART      SIT, '                                                              + #13 +
     '  ( '                                                                              + #13 +
     '  SELECT '                                                                         + #13 +
     '     BF.IDPESSOA, BF.IDTITULAR, '                                                  + #13 +
     '     BF.VALORATUAL, '                                                              + #13 +
     '     BF.IDBENEFICIO, BF.IDSITBENEFICIO, BF.DATAFINAL, BF.DATAFINALPREVISTA '       + #13 +
     '  FROM '                                                                           + #13 +
     '     BENEFBFCIARIO BF '                                                            + #13 +
     '  WHERE '                                                                          + #13 +
     '         ( BF.IDTITULAR  = ' + IntToStr( iIDBENEF ) + ' ) '                         + #13 +
     '     AND ( (BF.DATAFINAL > TO_DATE(' + QuotedStr(DateToStr(Sysdate(Self))) + ','  +
                                                QuotedStr('DD/MM/YYYY') + ')) '   +
                 'OR (BF.DATAFINAL IS NULL) )'                                           + #13 +
     '  ) BEN '                                                                          + #13 +
     'WHERE '                                                                            + #13 +
     '      ( PPP.IDPESSOA      = ' + IntToStr( iIDBENEF ) + ' ) '                        + #13 +
     '  AND ( PPP.IDPESSOA      = BEN.IDTITULAR(+) ) '                                   + #13 +
     '  AND ( PPP.IDSITPART     = SIT.IDSITPART ) '                                      + #13 +
     '  AND ( ELP.IDPESSOA      = PPP.IDPESSOA ) '                                       + #13 +
     '  AND ( ELP.IDPESSJUR     = PPP.IDPESSJUR ) '                                      + #13 +     
     '  AND ( PPP.IDPESSOA      = PFI.IDPESSOA(+) ) '                                    + #13 +

     '  AND PPP.FLGDESATIVADO   = 0 '                                                    + #13;

    cdsLocal.Data := GetDataPacket( sSQL );
    while not cdsLocal.EOF do
    begin
      sSql :=
       'SELECT '                                                                        + #13 +
       ' ' + cdsLocal.FieldByName('IDPESSOA').AsString   + ' AS IDPESSOA,             ' + #13 +
       ' ' + cdsLocal.FieldByname('IDSITFUNC').AsString  + ' AS IDSITFUNC,            ' + #13 +
       ' ' + QuotedStr(cdsLocal.FieldByName('FLGINTERNO').AsString) + ' AS FLGINTERNO ' + #13 +
       'FROM DUAL '                                                                     + #13;

      cdsLocal.Next;
      if not(cdsLocal.EOF) then sSQl := sSql + 'UNION ' + #13;
    end;

    if iIDREGRAAVAL > 0 then
    begin
      WebRegra.CdsDataSetIn.Close;
      WebRegra.CdsDataSetIn.Data := GetDataPacket( sSQL );

      WebRegra.MessageInfo := '';
      Result := WebRegra.RegraBooleana( IntToStr( iIDREGRAAVAL ), iIdEmpresaProp );
      if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );
    end;

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlWebEmprestimo.DadosAvalista( iIdAvalista : integer ) : OLEVariant;
begin
  Result := GetDataPacket (
  ' SELECT CA.IDINSCRICAOEMPTMO, ' +
  '        CA.IDAVALISTA, ' +
  '        P.NOME, ' +
  '        A.RENDACOMP, ' +
  '        A.MARGEMCONSIG ' +
  ' FROM   CONTRATOXAVALISTA CA, ' +
  '        PESSOA P, ' +
  '        AVALISTA A ' +
  ' WHERE  A.IDAVALISTA = P.IDPESSOA ' +
  '   AND  CA.IDAVALISTA = A.IDAVALISTA ' +
  '   AND  A.IDAVALISTA = ' + IntToStr( iIdAvalista ) );
end;

function TCtrlWebEmprestimo.ContrataEmptmo(  NovoContrato           : TDadosContrato;
                                             vLista                 : TListaItem;
                                             oContratosAnteriores   : OLEVariant;
                                             iFLGCALCDIA            : integer;
                                             iFLGSALDODEVANT        : integer;
                                             iTEPMAXCONTRATO        : integer;
                                             dDataCred              : TDateTime;
                                             fVlrLiquidoEP          : Currency;
                                             fSaldoAQuitar          : Currency;
                                             iIdEmpresaProp         : integer;
                                             iIdTipoEmptmo          : integer;
                                             iIdTipoContrEmptmo     : integer;
                                             iFLGUSAFIARIO          : integer;
                                             iFLGESTORNOPOSQUIT     : integer;
                                             iFLGQUITAPARCMORTE     : integer;
                                             iFLGDATAATUSLD         : integer;
                                             iIDITEMPROVPERDA       : integer;
                                             iIdUsuario             : integer;
                                             iIdModulo              : integer;
                                             sVersao                : string;
                                             sFLGFORMAPAG           : string;
                                             sFLGFORMAREC           : string;
                                             sCODFORMAPAGTO         : string;
                                             sPORTFORMAPAGTO        : string;
                                             sPORTFORMARECTO        : string;
                                             sContaBancariaPag      : string;
                                             sContaBancariaRec      : string;
                                             iIdAvalista            : integer;
                                             sBeneficiarios         : string;
                                             bFlgExcepcional        : boolean;
                                             iFlgAbonoDiverg        : integer;
                                             iTipoCliente           : integer;
                                             iQtdeItensEmptmo       : integer;
                                             iQtdeParcelasEmAberto  : integer;
                                             iIdUltHistMovEmptmo    : extended;
                                             oItens                 : OLEVariant;
                                             var iIdInscricaoEmptmo : extended ) : extended;
var
  iIdContratoEmptmo,
  _iIdInscricaoEmptmo,
  iIdHistMovEmptmo : extended;
  iContador : integer;
  dDataUltAtualiza : TDateTime;
  cdsItens : TCMClientDataset;
  i_QtdeItensEmptmo,
  i_QtdeParcelasEmAberto : integer;
  //Pendência 27385 - 08/02/2008
  cdsAux : TCMClientDataset;
  //Fim Pendência 27385
begin
  iIdContratoEmptmo    := -1;
  _iIdInscricaoEmptmo  := -1;
  iIdHistMovEmptmo     := -1;
  Result               := -1;

  if not InTransaction then
  StartTransaction;

  try
    try
      MessageInfo := '';

      //Pendência 27385 - 08/02/2008
      cdsAux := TCMClientDataset.Create( nil );
      //Fim Pendência 27385

      //Inscreve o empréstimo
      cdsItens := TCMClientDataset.Create( nil );
      cdsItens.Data := oItens;

      _iIdInscricaoEmptmo := InscreveEmptmo( iIdTipoContrEmptmo,
                                             iIdTipoEmptmo,
                                             NovoContrato.IdPatro,
                                             NovoContrato.IdPlanoPrev,
                                             NovoContrato.IdPessoa,
                                             NovoContrato.IdBenef,
                                             NovoContrato.NumParcelas,
                                             iIdEmpresaProp,
                                             sFLGFORMAPAG,
                                             sFLGFORMAREC,
                                             sCODFORMAPAGTO,
                                             sPORTFORMAPAGTO,
                                             sPORTFORMARECTO,
                                             sContaBancariaPag,
                                             sContaBancariaRec,
                                             IntToStr( NovoContrato.Indexador ),
                                             NovoContrato.DataCredito,
                                             NovoContrato.VlrContrato,
                                             NovoContrato.VlrSalBase,
                                             NovoContrato.VlrMargem,
                                             NovoContrato.VlrMaxPermit,
                                             NovoContrato.TxJuros,
                                             iIdAvalista,
                                             sBeneficiarios,
                                             False,
                                             cdsItens.Data );

      if _iIdInscricaoEmptmo > 0 then
      begin

        NovoContrato.IDInscricaoEmptmo := _iIdInscricaoEmptmo;

        iIdContratoEmptmo := GravaContrato( NovoContrato );


        if iIdContratoEmptmo > 0 then
        begin

          if AtualizaContratosAnteriores( oContratosAnteriores,
                                          iIdContratoEmptmo,
                                          iFLGCALCDIA,
                                          iFLGSALDODEVANT,
                                          iTEPMAXCONTRATO,
                                          dDataCred,
                                          fSaldoAQuitar,
                                          iIdEmpresaProp,
                                          iIdTipoEmptmo,
                                          iIdTipoContrEmptmo,
                                          iFLGUSAFIARIO,
                                          iFLGESTORNOPOSQUIT,
                                          iFLGQUITAPARCMORTE,
                                          iIDITEMPROVPERDA,
                                          iIdUsuario,
                                          iIdModulo,
                                          sVersao,
                                          bFlgExcepcional,
                                          iTipoCliente,
                                          iFlgAbonoDiverg ) then
          begin

            // Se for uma renovação com valor líquido de concessão ZERO,
            // baixa automaticamente o valor concedido
            if fVlrLiquidoEP = 0 then
            begin
              for iContador := 0 to High(vLista) do
              begin
                 if (vLista[iContador].FlgCentraliza = 1) then
                 begin
                    vLista[iContador].ValorEfetivo  := 0;
                    vLista[iContador].DataEfetiva   := NovoContrato.DataCredito;
                    vLista[iContador].FlgBaixado    := -1;
                    vLista[iContador].FormaCobranca := '';
                 end;
              end;
            end;

            dDataUltAtualiza := 0;

            case iFLGDATAATUSLD of
              0: dDataUltAtualiza := dDataCred;
              1: dDataUltAtualiza := NovoContrato.DataPrimParc;
              2: dDataUltAtualiza := DiasUteis.SomaMeses( NovoContrato.DataPrimParc, - 1 );
            end;

            // Gravação do Histórico dos Itens do Contrato
            if GravaMovEmptmo( NovoContrato,
                               vLista,
                               0,                                                  // Evento 0 - Concessão *)
                               0,                                                  // Será Parcela de número 0 - Zero *)
                               DiasUteis.ExtraiAno( NovoContrato.DataCredito ),    // Ano Competência - Ano da Data de Crédito do Novo Contrato
                               DiasUteis.ExtraiMes( NovoContrato.DataCredito ),    // Mês Competência - Mês da Data de Crédito do Novo Contrato
                               DiasUteis.ExtraiAno( NovoContrato.DataCredito ),    // Ano Cobrança - Ano da Data de Crédito do Novo Contrato
                               DiasUteis.ExtraiMes( NovoContrato.DataCredito ),    // Mês Cobranca - Mês da Data de Crédito do Novo Contrato
                               NovoContrato.NumParcelas,                           // Parcelas Remanescentes
                               NovoContrato.DataCredito,                           // DataPrevista -> Data do Crédito
                               dDataUltAtualiza,
                               '',
                               '',
                               True,
                               iFLGUSAFIARIO,
                               iIdUsuario,
                               iIdModulo,
                               sVersao,
                               iIdHistMovEmptmo ) then
            begin

              if AtualizaFlgSituacao( NovoContrato.IDInscricaoEmptmo, 'INSCRICAOEMPTMO', 'E' ) then
              begin

                MessageInfo := '';

                //Pendência 27385 - 08/02/2008
                //Verifica existência do contrato na base
                cdsAux.Data := BuscaContratoEmptmo(iIdContratoEmptmo);

                if cdsAux.IsEmpty then
                   raise Exception.Create( 'O contrato não foi gravado.' );

                cdsAux.Close;

                //Verifica existência de itens do contrato na base
                cdsAux.Data := BuscaHistMovEmptmo(iIdContratoEmptmo);

                if ( cdsAux.FindField('QUANT') = nil) or
                   ( cdsAux.FieldByName('QUANT').AsInteger <= 0 ) then
                   raise Exception.Create( 'Os itens do contrato não foram gravados.' );

                if ( cdsAux.FieldByName('QUANT').AsInteger < 2 ) then
                   raise Exception.Create( 'Os itens do contrato não foram gravados corretamente.' );

                cdsAux.Close;

                //Verifica existência do item centralizador
                cdsAux.Data := BuscaQuantHistMovEmptmo(iIdContratoEmptmo, iIdTipoContrEmptmo);

                if ( cdsAux.FindField('QUANT') = nil) or
                   ( cdsAux.FieldByName('QUANT').AsInteger <= 0 ) then
                   raise Exception.Create( 'O item centralizador do contrato não foi gravado.' );

                if ( cdsAux.FieldByName('QUANT').AsInteger > 1 ) then
                   raise Exception.Create( 'O item centralizador do contrato foi gravado em duplicidade.' );

               //Fim Pendência 27385

                //Valida se a quantidade de itens de empréstimo e a quantidade de parcelas em abero não mudou
                i_QtdeItensEmptmo      := QtdeItensEmptmo( NovoContrato.IDPessoa, NovoContrato.IDBenef, iIdContratoEmptmo, iIdUltHistMovEmptmo );
                i_QtdeParcelasEmAberto := QtdeParcelasEmAberto( NovoContrato.IDPessoa, NovoContrato.IDBenef, NovoContrato.DataInscricao, iIdContratoEmptmo );

                //Pendência 23499 - 07/10/2006
                if ( i_QtdeItensEmptmo      <> iQtdeItensEmptmo      ) or
                   ( i_QtdeParcelasEmAberto <> iQtdeParcelasEmAberto ) then
                  raise Exception.Create( 'Esta concessão já foi efetivada, ou houve alterações nos dados do(s) contrato(s) anterior(es).' );
                //Fim Pendência 23499

                //Pendência 26118
                if BuscaContratacaoRealizada(IntToStr(NovoContrato.IDPessoa), FloatToStr(iIdContratoEmptmo)) = True then
                  raise Exception.Create('Essa concessão já foi efetivada, não sendo possível concedê-la novamente.' );
                //Fim Pendência 26118

                Commit;

                iIdInscricaoEmptmo := _iIdInscricaoEmptmo;
                Result := iIdContratoEmptmo;

              end {if AtualizaFlgSituacao( NovoContrato.IDInscricaoEmptmo, 'INSCRICAOEMPTMO', 'E' ) then}
              else
                raise Exception.Create( 'Não foi possível atualizar a situação deste contrato.' );

            end {if GravaMovEmptmo(}
            else
              raise Exception.Create( 'Não foi possível gravar o histórico dos itens deste empréstimo.' );

          end {AtualizaContratosAnteriores(}
          else
            raise Exception.Create( 'Não foi possível atualizar os contratos anteriores.' );

        end {if iIdContratoEmptmo > 0 then}
        else
          raise Exception.Create( 'Não foi possível gravar o contrato.' );

      end {if _iIdInscricaoEmptmo > 0 then}
      else
        raise Exception.Create( 'Não foi possível gravar a inscrição deste contrato.' );

      if ( Result <= 0 ) or ( iIdInscricaoEmptmo <= 0 ) then
        raise Exception.Create( 'Erro ao contratar empréstimo. Favor entrar em contato com a Fundação.' );

    except
      On E : Exception Do
      begin
        //Pendência 27385 - 08/02/2008
        cdsAux.Free;
        //Fim Pendência 27385
        MessageInfo := E.Message + '<BR><BR><b>' + MessageInfo + '</b>';
        Result := -1;
        Rollback;
        raise;
      end;
    end;
  finally
    cdsItens.Free;
    cdsAux.Free;
  end; 
end;


function TCtrlWebEmprestimo.GravaContrato( NovoContrato : TDadosContrato ) : extended;
var
  sCampos, sValores, sSQL : string;
begin
  Result := -1;

  sCampos  := '';
  sValores := '';

  if NovoContrato.IDContratoEmptmo  >  0 then begin sCampos := sCampos + 'IDCONTRATOEMPTMO  , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.IDContratoEmptmo ) + ', '; end;
  if NovoContrato.IDContrQuitacao   > -1 then begin sCampos := sCampos + 'IDCONTRQUITACAO   , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.IDContrQuitacao ) + ', '; end;
  if NovoContrato.IDPessoa          > -1 then begin sCampos := sCampos + 'IDPESSOA          , '; sValores := sValores + IntToStr( NovoContrato.IDPessoa ) + ', '; end;
  if NovoContrato.IDResponsavel     > -1 then begin sCampos := sCampos + 'IDRESPONSAVEL     , '; sValores := sValores + IntToStr( NovoContrato.IDResponsavel ) + ', '; end;
  if NovoContrato.IDTipoContrEmptmo > -1 then begin sCampos := sCampos + 'IDTIPOCONTREMPTMO , '; sValores := sValores + IntToStr( NovoContrato.IDTipoContrEmptmo ) + ', '; end;
  if NovoContrato.IDPlanoPrev       > -1 then begin sCampos := sCampos + 'IDPLANOPREV       , '; sValores := sValores + IntToStr( NovoContrato.IDPlanoPrev ) + ', '; end;
  if NovoContrato.IDPlanoOrigem     > -1 then begin sCampos := sCampos + 'IDPLANOORIGEM     , '; sValores := sValores + IntToStr( NovoContrato.IDPlanoOrigem ) + ', '; end;
  if NovoContrato.IDPatro           > -1 then begin sCampos := sCampos + 'IDPATRO           , '; sValores := sValores + IntToStr( NovoContrato.IDPatro ) + ', '; end;
  if NovoContrato.IDInscricaoEmptmo > -1 then begin sCampos := sCampos + 'IDINSCRICAOEMPTMO , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.IDInscricaoEmptmo ) + ', '; end;
  if NovoContrato.IDCodAutoEmp      >  0 then begin sCampos := sCampos + 'CODAUTOEMP        , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.IDCodAutoEmp ) + ', '; end;
  if NovoContrato.IDVerba           > -1 then begin sCampos := sCampos + 'IDVERBA           , '; sValores := sValores + IntToStr( NovoContrato.IDVerba ) + ', '; end;
  if NovoContrato.IDBenef           > -1 then begin sCampos := sCampos + 'IDBENEF           , '; sValores := sValores + IntToStr( NovoContrato.IDBenef ) + ', '; end;
  if NovoContrato.IDCBancaria       > -1 then begin sCampos := sCampos + 'IDCBANCARIA       , '; sValores := sValores + IntToStr( NovoContrato.IDCBancaria ) + ', '; end;
  if NovoContrato.IDCBancariaDeb    > -1 then begin sCampos := sCampos + 'IDCBANCARIADEB    , '; sValores := sValores + IntToStr( NovoContrato.IDCBancariaDeb ) + ', '; end;
  if NovoContrato.IDFornCred        > -1 then begin sCampos := sCampos + 'IDFORNCRED        , '; sValores := sValores + IntToStr( NovoContrato.IDFornCred ) + ', '; end;
  if NovoContrato.CodFormaPag       > -1 then begin sCampos := sCampos + 'CODFORMAPAG       , '; sValores := sValores + IntToStr( NovoContrato.CodFormaPag ) + ', '; end;
  if NovoContrato.PortFormaPag      > -1 then begin sCampos := sCampos + 'PORTFORMAPAG      , '; sValores := sValores + IntToStr( NovoContrato.PortFormaPag ) + ', '; end;
  if NovoContrato.PortFormaRec      > -1 then begin sCampos := sCampos + 'PORTFORMAREC      , '; sValores := sValores + IntToStr( NovoContrato.PortFormaRec ) + ', '; end;
  if NovoContrato.NumParcelas       > -1 then begin sCampos := sCampos + 'NUMPARCELAS       , '; sValores := sValores + IntToStr( NovoContrato.NumParcelas ) + ', '; end;
  if NovoContrato.DataCredito       >  0 then begin sCampos := sCampos + 'DATACREDITO       , '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', NovoContrato.DataCredito) + ''', ''DD/MM/YYYY'')' + ', '; end;
  if NovoContrato.DataSituacao      >  0 then begin sCampos := sCampos + 'DATASITUACAO      , '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', NovoContrato.DataSituacao) + ''', ''DD/MM/YYYY'')' + ', '; end;
  if NovoContrato.DataAssinatura    >  0 then begin sCampos := sCampos + 'DATAASSINATURA    , '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', NovoContrato.DataAssinatura) + ''', ''DD/MM/YYYY'')' + ', '; end;
  if NovoContrato.DataPrimParc      >  0 then begin sCampos := sCampos + 'DATAPRIMPARC      , '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', NovoContrato.DataPrimParc) + ''', ''DD/MM/YYYY'')' + ', '; end;
  if NovoContrato.DataCanc          >  0 then begin sCampos := sCampos + 'DATACANC          , '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', NovoContrato.DataCanc) + ''', ''DD/MM/YYYY'')' + ', '; end;
  if NovoContrato.VlrContrato      <>  0 then begin sCampos := sCampos + 'VLRCONTRATO       , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.VlrContrato ) + ', '; end;
  if NovoContrato.VlrParcela       <>  0 then begin sCampos := sCampos + 'VLRPARCELA        , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.VlrParcela ) + ', '; end;
  if NovoContrato.Txjuros          <>  0 then begin sCampos := sCampos + 'TXJUROS           , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.Txjuros ) + ', '; end;
  if NovoContrato.FlgSituacao      <> '' then begin sCampos := sCampos + 'FLGSITUACAO       , '; sValores := sValores + QuotedStr( NovoContrato.FlgSituacao ) + ', '; end;
  if NovoContrato.flgFormaRec      <> '' then begin sCampos := sCampos + 'FLGFORMAREC       , '; sValores := sValores + QuotedStr( NovoContrato.flgFormaRec ) + ', '; end;
  if NovoContrato.FlgFormaPag      <> '' then begin sCampos := sCampos + 'FLGFORMAPAG       , '; sValores := sValores + QuotedStr( NovoContrato.FlgFormaPag ) + ', '; end;
  if NovoContrato.VlrSalBase       <>  0 then begin sCampos := sCampos + 'VLRSALBASE        , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.VlrSalBase ) + ', '; end;
  if NovoContrato.VlrMargem        <>  0 then begin sCampos := sCampos + 'VLRMARGEM         , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.VlrMargem ) + ', '; end;
  if NovoContrato.VlrMaxPermit     <>  0 then begin sCampos := sCampos + 'VLRMAXPERMIT      , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.VlrMaxPermit ) + ', '; end;
  if NovoContrato.Indexador        <>  0 then begin sCampos := sCampos + 'MOECODIGO         , '; sValores := sValores + IntToStr( NovoContrato.Indexador ) + ', '; end;
  if NovoContrato.VlrParcelaMes    <>  0 then begin sCampos := sCampos + 'VLRPARCELAMES     , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.VlrParcelaMes ) + ', '; end;
  if NovoContrato.VlrParcelaAtraso <>  0 then begin sCampos := sCampos + 'VLRPARCATRASO     , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.VlrParcelaAtraso ) + ', '; end;
  if NovoContrato.VlrDebito        <>  0 then begin sCampos := sCampos + 'VLRDEBITO         , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.VlrDebito ) + ', '; end;
  if NovoContrato.VlrReserva       <>  0 then begin sCampos := sCampos + 'VLRRESERVA        , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.VlrReserva ) + ', '; end;
  if NovoContrato.VlrPendencia     <>  0 then begin sCampos := sCampos + 'VLRPENDENCIA      , '; sValores := sValores + ConverteVirgulaParaPonto( NovoContrato.VlrPendencia ) + ', '; end;
  if NovoContrato.DataSaldoDev      >  0 then begin sCampos := sCampos + 'DATASALDODEV      , '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', NovoContrato.DataSaldoDev) + ''', ''DD/MM/YYYY'')' + ', '; end;
  if NovoContrato.DataPendencia     >  0 then begin sCampos := sCampos + 'DATAPENDENCIA     , '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', NovoContrato.DataPendencia) + ''', ''DD/MM/YYYY'')' + ', '; end;
  if NovoContrato.IDTipoSuspEmptmo > -1  then begin sCampos := sCampos + 'IDTIPOSUSPEMPTMO  , '; sValores := sValores + IntToStr( NovoContrato.IDTipoSuspEmptmo ) + ', '; end;
  if NovoContrato.DataInicioSusp   > 0   then begin sCampos := sCampos + 'DATAINICIOSUSP    , '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', NovoContrato.DataInicioSusp) + ''', ''DD/MM/YYYY'')' + ', '; end;
  if NovoContrato.DataFimSusp      > 0   then begin sCampos := sCampos + 'DATAFIMSUSP       , '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', NovoContrato.DataFimSusp) + ''', ''DD/MM/YYYY'')' + ', '; end;
  if NovoContrato.AnoSuspensao     > 0   then begin sCampos := sCampos + 'ANOSUSPENSAO      , '; sValores := sValores + IntToStr( NovoContrato.AnoSuspensao ) + ', '; end;
  if NovoContrato.MesSuspensao     > 0   then begin sCampos := sCampos + 'MESSUSPENSAO      , '; sValores := sValores + IntToStr( NovoContrato.MesSuspensao ) + ', '; end;

  if NovoContrato.NumParcDesconto  > -1  then begin sCampos := sCampos + 'NUMPARCDESCONTO   , '; sValores := sValores + IntToStr( NovoContrato.NumParcDesconto ) + ', '; end;

  //Pendência 25908 - 19/07/2007
  NovoContrato.FlgExcepcional := 0;
  //Auto-atendimento sempre marca concessão/inscrição via internet
                                                    sCampos := sCampos + 'FLGINTERNET       , '; sValores := sValores + '1, ';
  //Fim Pendência 25908

  if NovoContrato.FlgExcepcional   = 1   then begin sCampos := sCampos + 'FLGEXCEPCIONAL         , '; sValores := sValores + '1, '; end;
  if NovoContrato.FlgFinanciamento = 1   then begin sCampos := sCampos + 'FLGFINANCIAMENTO       , '; sValores := sValores + '1, '; end;

  //Pendência 26775 - 26/12/2007
  if NovoContrato.IDPlanoCob       > -1  then begin sCampos := sCampos + 'IDPLANOCOB        , '; sValores := sValores + IntToStr( NovoContrato.IDPlanoCob ) + ', '; end;

  sCampos  := Copy( sCampos,  1, length( sCampos  ) - 2 );
  sValores := Copy( sValores, 1, length( sValores ) - 2 );

  sSQL := ' INSERT INTO CONTRATOEMPTMO ( ' + sCampos + ' ) VALUES ( ' + sValores + ' ) ';

  if ExecSQL ( sSQL ) then
    Result := NovoContrato.IDContratoEmptmo;

end;

function TCtrlWebEmprestimo.SeqContrato: extended;
var
  cdsLocal : TCmClientDataset;
begin
  cdsLocal := TCmClientDataset.Create( nil );
  try

    cdsLocal.Data := GetDataPacket( ' SELECT SEQCONTRATOEMPTMO.NEXTVAL AS SEQCONTRATOEMPTMO FROM DUAL ' );

    Result := cdsLocal.FieldByName('SEQCONTRATOEMPTMO').AsFloat;

  finally
    cdsLocal.Free;
  end;

end;

function TCtrlWebEmprestimo.Responsavel(iIdTitular, iIdBenef: integer): OLEVariant;
begin
  Result := GetDataPacket(
   ' SELECT ' +
   '      BTP.IDRESPONNAOREC AS IDRESPONSAVEL, ' +
   '      PES.NOME AS NOMERESPONSAVEL ' +
   ' FROM ' +
   '     BENEFBFCIARIO BFC, BFCIARIOTITPLAN BTP, PESSOA PES ' +
   ' WHERE ' +
   '     IDSITBENEFICIO   IN (1,2,7) ' +
   ' AND BFC.IDTITULAR    = ' + IntToStr( iIdTitular ) +
   ' AND BFC.IDPESSOA     = ' + IntToStr( iIdBenef ) +
   ' AND BFC.IDTITULAR    = BTP.IDTITULAR ' +
   ' AND BFC.IDPESSOA     = BTP.IDPESSOA ' +
   ' AND BFC.IDBENEFICIO  = BTP.IDBENEFICIO ' +
   ' AND BTP.IDRESPONNAOREC = PES.IDPESSOA ' +
   ' AND BFC.IDPLANOPREV  = BTP.IDPLANOPREV ' +
   ' AND ( DATAFIMRECEB IS NULL OR DATAFIMRECEB > SysDate ) ' );
end;


function TCtrlWebEmprestimo.VerificaSuspensao( iIdRegraValidSusp       : Int64;
                                               iIdPessoa               : Int64;
                                               iIdBenef                : Int64;
                                               iIdPatro                : Int64;
                                               sFlgInterno             : String;
                                               nTseMeses               : Integer;
                                               dTseInicioSusp          : TDateTime;
                                               dTseFinalSusp           : TDateTime;
                                               iFlgFerias              : Integer;
                                               iIdEmpresaProp          : integer;
                                               iIdTipoContrEmptmo      : Integer;
                                               iTipoSuspAnterior       : Integer;
                                               dDtCredito              : TDateTime;
                                               dDataSuspAnterior       : TDateTime;
                                               var iIdTipoSuspEmptmo   : integer;
                                               var dDataFinalSuspensao : TDateTime ) : Boolean;
var
  bSuspendeAuto     : Boolean;
  bExisteSuspensao  : Boolean;
  cdsLookTipoSusp   : TCmClientDataset;

  function DtFimSusp: TDateTime;
  var
    dData : TDateTime;
  begin
    dData := StrToDate('31/12/1899');

    dData := ValidaSuspensao( iIdRegraValidSusp,
                              -1,
                              iIdPessoa,
                              iIdBenef,
                              iIdPatro,
                              sFlgInterno,
                              iIdTipoSuspEmptmo,
                              nTseMeses,
                              dTseInicioSusp,
                              dTseFinalSusp,
                              iFlgFerias,
                              0,
                              0,
                              -1,
                              -1,
                              0,
                              iIdEmpresaProp,
                              0 );

    if dData > dDataSuspAnterior then dData := dDataSuspAnterior;

    Result := dData;
  end;


  function TestaSuspensao: Boolean;
  var
    _dDataFinalSuspensao : TDateTime;
  begin
    _dDataFinalSuspensao := DtFimSusp;

    if _dDataFinalSuspensao < dDtCredito then
      Result := False
    else
    begin
      Result := True;
      dDataFinalSuspensao := _dDataFinalSuspensao;
    end;
  end;

begin

  Result := False;
  bSuspendeAuto := False;
  bExisteSuspensao := False;

  cdsLookTipoSusp   := TCmClientDataset.Create( nil );
  try

    with cdsLookTipoSusp do
    begin
      Data := LookTipoSusp( iIdTipoContrEmptmo, False );

      if not(IsEmpty) then
      begin
         while not(EOF) do
         begin
            if FieldByName('FLGSUSPCONCESSAO').AsInteger = 1 then
            begin
               bSuspendeAuto := True;
               Break;
            end;

            // aproveitamento de suspensao
            if (FieldByName('IDTIPOSUSPEMPTMO').AsInteger = iTipoSuspAnterior) and (iTipoSuspAnterior > 0) then
            begin
               bExisteSuspensao := True;
               Break;
            end;

            Next;
         end;  // while not(EOF)

         if bSuspendeAuto then
         begin
            iIDTIPOSUSPEMPTMO := FieldByName('IDTIPOSUSPEMPTMO').AsInteger;
         end;

         if bExisteSuspensao then
         begin
            iIDTIPOSUSPEMPTMO := FieldByName('IDTIPOSUSPEMPTMO').AsInteger;
            if not( TestaSuspensao ) then
            begin
              iIDTIPOSUSPEMPTMO := 0;
              dDataFinalSuspensao := 0;
            end;
         end;

      end;
    end;
  finally
    cdsLookTipoSusp.Free;
  end;

end;

function TCtrlWebEmprestimo.AtualizaContratosAnteriores(  oContratosAnteriores : OLEVariant;
                                                          iIdContratoEmptmo    : extended;
                                                          iFLGCALCDIA          : integer;
                                                          iFLGSALDODEVANT      : integer;
                                                          iTEPMAXCONTRATO      : integer;
                                                          dDataCred            : TDateTime;
                                                          fSaldoAQuitar        : Currency;
                                                          iIdEmpresaProp       : integer;
                                                          iIdTipoEmptmo        : integer;
                                                          iIdTipoContrEmptmo   : integer;
                                                          iFLGUSAFIARIO        : integer;
                                                          iFLGESTORNOPOSQUIT   : integer;
                                                          iFLGQUITAPARCMORTE   : integer;
                                                          iIDITEMPROVPERDA     : integer;
                                                          iIdUsuario           : integer;
                                                          iIdModulo            : integer;
                                                          sVersao              : string;
                                                          bFlgExcepcional      : boolean;
                                                          iFlgAbonoDiverg      : integer;
                                                          iTipoCliente         : integer ) : boolean;
var
  cdsContratosAnteriores : TCMClientDataset;
  rContratoAnterior      : TDadosContrato;
  rSaldosAntPos          : TSaldosAntPos;
  vListaQuitacao         : TListaItem;
  i                      : integer;
  iIdHistMovEmptmo       : extended;
  sSQL                   : string;

  dData : TDateTime;
  rSaldo : TSaldoDevAnt;

  ADOStoredProc          : TADOStoredProc;
  wwStoredProc           : TwwStoredProc;
begin
  Result := False;

  cdsContratosAnteriores := TCMClientDataset.Create( nil );
  try

    cdsContratosAnteriores.Data := oContratosAnteriores;

    if cdsContratosAnteriores.IsEmpty then
    begin
      Result := True;
      exit;
    end;

    Result := False;

    cdsContratosAnteriores.First;
    while not( cdsContratosAnteriores.EOF) do
    begin

      if cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 then
      begin
        if iFLGCALCDIA = 1 then
        begin
          if not( PossuiAtualizacaoDiaria( cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat, dDataCred ) ) then
          begin
            dData  := UltimaDataAtualizacao( cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat );
            rSaldo := SaldoDevAnt( cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat, dData, -1, -1, iFLGSALDODEVANT, iFLGCALCDIA, False );

            if rSaldo.fSaldoDevAnt <> 0 then
            begin
              Result := False;
              raise Exception.Create( 'Contrato anterior não possui atualização diária para a data do crédito.' );
            end;
          end;
        end;
      end;

      // Grava informações no contrato anterior
      // (basicamente, para o relatório de impressão de contrato da FCRT)

      ExecSQL( ' UPDATE CONTRATOEMPTMO CON     ' +
               ' SET    CON.VLRSALDODEV      = ' + ConverteVirgulaParaPonto( cdsContratosAnteriores.FieldByName('HMESALDODEV').AsCurrency ) + ', ' +
               '        CON.VLRPENDENCIA     = ' + ConverteVirgulaParaPonto( cdsContratosAnteriores.FieldByName('VLREMABERTO').AsCurrency ) + ', ' +
               '        CON.DATASALDODEV     = to_date( ''' + FormatDateTime('dd/mm/yyyy', dDataCred ) + ''', ''DD/MM/YYYY'')             ' + ', ' +
               '        CON.DATAPENDENCIA    = to_date( ''' + FormatDateTime('dd/mm/yyyy', dDataCred ) + ''', ''DD/MM/YYYY'')             ' + 
               ' WHERE  CON.IDCONTRATOEMPTMO = ' + cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsString            ) ;

      // Verificar se existe EP anterior.
      // Caso positivo quitar EP Anterior

      if fSaldoAQuitar > 0 then
      begin

         if cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 then
         begin

            // -------------------------------------------------------------------------------
            // HISTÓRICO  DO  EMPRÉSTIMO  ANTERIOR
            // -------------------------------------------------------------------------------

            LimpaRegistroContrato(rContratoAnterior);

            rContratoAnterior.IDContratoEmptmo  := cdsContratosAnteriores.FieldByName('IDCONTRATOEMPTMO').AsFloat;
            rContratoAnterior.IDInscricaoEmptmo := cdsContratosAnteriores.FieldByName('IDINSCRICAOEMPTMO').AsFloat;
            rContratoAnterior.IDTipoContrEmptmo := cdsContratosAnteriores.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
            rContratoAnterior.FlgFormaRec       := cdsContratosAnteriores.FieldByName('FLGFORMAREC').AsString;
            rContratoAnterior.Indexador         := cdsContratosAnteriores.FieldByName('MOECODIGO').AsInteger;
            rContratoAnterior.SiglaIndexador    := cdsContratosAnteriores.FieldByName('MOESIGLA').AsString;
            rContratoAnterior.IdPessoa          := cdsContratosAnteriores.FieldByName('IDPESSOA').AsInteger;
            rContratoAnterior.IdPlanoPrev       := cdsContratosAnteriores.FieldByName('IDPLANOPREV').AsInteger;
            rContratoAnterior.IdPatro           := cdsContratosAnteriores.FieldByName('IDPATRO').AsInteger;
            rContratoAnterior.IdSitPart         := cdsContratosAnteriores.FieldByName('IDSITPART').AsInteger;
            rContratoAnterior.IdBenef           := cdsContratosAnteriores.FieldByName('IDBENEF').AsInteger;
            rContratoAnterior.DataCredito       := cdsContratosAnteriores.FieldByName('DATACREDITO').AsDateTime;
            rContratoAnterior.DataAssinatura    := cdsContratosAnteriores.FieldByName('DATAASSINATURA').AsDateTime;
            rContratoAnterior.DataPrimParc      := cdsContratosAnteriores.FieldByName('DATAPRIMPARC').AsDateTime;
            rContratoAnterior.IDTipoEmptmo      := cdsContratosAnteriores.FieldByName('IDTIPOEMPTMO').AsInteger;


            // -------------------------------------------------------------------------------
            // -------------------------------------------------------------------------------
            // Procura a última data de atualização após a data de quitação do contrato
            // anterior (data do crédito), para ser passada como data de atualização dos
            // registros de quitação do contrato anterior
            rSaldosAntPos := BuscaSaldosAntPos( rContratoAnterior.IDContratoEmptmo,
                                                dDataCred,
                                                iFLGSALDODEVANT,
                                                iFLGCALCDIA );

            // -------------------------------------------------------------------------------
            // -------------------------------------------------------------------------------

            if not( CalculaItensQuitacao( rContratoAnterior,
                                          iIdEmpresaProp,
                                          iIdTipoEmptmo,
                                          iIdTipoContrEmptmo,
                                          0,                      // Origem
                                          iIDITEMPROVPERDA,
                                          dDataCred,
                                          -1,                     // 14/06/2004 - pendência 16984
                                          SysDate( Self ),
                                          bFlgExcepcional,
                                          False,
                                          iFlgAbonoDiverg,
                                          iTipoCliente,
                                          vListaQuitacao ) ) then
            begin
              Result := False;
              raise Exception.Create( 'Erro no cálculo de quitação de contratos anteriores.' );
            end;

            // marca como baixados os itens quitados pela renovação
            for i := 0 to High(vListaQuitacao) do
            begin
               if (vListaQuitacao[i].FlgCentraliza = 1) then
               begin
               
                  vListaQuitacao[i].ValorEfetivo := vListaQuitacao[i].Valor;

                  vListaQuitacao[i].DataEfetiva   := dDataCred;
                  vListaQuitacao[i].FlgBaixado    := -1;
                  vListaQuitacao[i].FlgEnvio      := -1;
                  vListaQuitacao[i].FormaCobranca := '';
               end;
            end;

            // Gravação do Histórido dos Itens de Quitação do EP Anterior
            if not( GravaMovEmptmo( rContratoAnterior,
                                    vListaQuitacao,
                                    3,                                                        // Evento 3 - Quitação
                                    cdsContratosAnteriores.FieldByName('ULT_PARC').AsInteger, // Última parcela do ContratoAnterior
                                    DiasUteis.ExtraiAno(dDataCred),                           // Ano Competência - Ano da Data de Crédito do Novo Contrato
                                    DiasUteis.ExtraiMes(dDataCred),                           // Mês Competência - Mês da Data de Crédito do Novo Contrato
                                    DiasUteis.ExtraiAno(dDataCred),                           // Ano Cobrança - Ano da Data de Crédito do Novo Contrato
                                    DiasUteis.ExtraiMes(dDataCred),                           // Mês Cobranca - Mês da Data de Crédito do Novo Contrato
                                    0,
                                    dDataCred,                                                // DataPrevista -> Data de de Crédito do Novo Contrato
                                    rSaldosAntPos.dDataAtuPos,                                // dDataUltAtualiza do Contrato anterior -> ver obs acima
                                    '',                                                       // forma de envio: já está sendo definida pelo contrato
                                    '',
                                    True,
                                    iFLGUSAFIARIO,
                                    iIdUsuario,
                                    iIdModulo,
                                    sVersao,
                                    iIdHistMovEmptmo ) ) then
            begin
              Result := False;
              raise Exception.Create( 'Erro na gravação do histórico dos itens do empréstimo Anterior.' );
            end;

           // --------------------------------------------------------------------------------
           // Estorna os itens posteriores à data da quitação
           // --------------------------------------------------------------------------------
           if iFLGESTORNOPOSQUIT = 1 then
           begin
             ExecSQL(
              'UPDATE ' +
              '   HISTMOVEMPTMO HME ' +
              'SET ' +
              '   HME.FLGESTORNADO      = 1, ' +
              '   HME.HMEDATAESTORNO    = to_date( ''' + FormatDateTime('dd/mm/yyyy', dDataCred ) + ''', ''DD/MM/YYYY''), ' +
              //Pendência 28159 - 11/06/2008
              //'   HME.IDUSUARIOESTORNO  = ' + IntToStr( iIdUsuario ) + ' , ' +
              //Fim Pendência 28159
              '   HME.HMEOBSERVACAO     = HME.HMEOBSERVACAO || '' - Estorno de item posterior a quitacao'' ' +
              'WHERE ' +
              '       HME.IDCONTRATOEMPTMO         = ' + ConverteVirgulaParaPonto( rContratoAnterior.IDContratoEmptmo ) +
              '   AND ( HMETIPOMOV        = 1 ) ' +

              '   AND NVL(HME.FLGESTORNADO, 0)     = 0 ' +
              '   AND NVL(HME.FLGABONADO, 0)       = 0 ' +
              '   AND NVL(HME.FLGQUITADO, 0)       = 0 ' +

              '   AND HME.HMEVLREFETIVO            IS NULL ' +
              '   AND HME.HMEDATAEFETIVA           IS NULL ' +
              '   AND HME.FLGBAIXADO               = 0 ' +

              '   AND ( (FLGENVIO = 0 OR NVL(FLGSUSPENSAO, 0) = 1) )' +

              '    AND ( (HMEDATAPREVISTA  BETWEEN to_date( ''' + FormatDateTime('dd/mm/yyyy', dDataCred + 1 ) + ''', ''DD/MM/YYYY'') AND ' +
              '                                    to_date( ''' + FormatDateTime('dd/mm/yyyy', DiasUteis.SomaAnos(dDataCred,10) ) + ''', ''DD/MM/YYYY'') ) ) ' +
              '   AND NOT EXISTS ( ' +
              '                  SELECT 1 ' +
              '                  FROM ' +
              '                     HISTMOVEMPTMO H2 ' +
              '                  WHERE ' +
              '                         H2.HMETIPOMOV           = HME.HMETIPOMOV ' +
              '                     AND (H2.HMECENTRALIZA       = 1 OR H2.HMEDESTACADO = 1) ' +
              '                     AND NVL(H2.FLGESTORNADO, 0) = 0 ' +
              '                     AND ( ' +
              '                         H2.HMEVLREFETIVO        IS NOT NULL OR ' +
              '                         H2.FLGBAIXADO           IS NULL OR ' +
              '                         H2.FLGABONADO           = 1 OR ' +
              '                         H2.FLGQUITADO           = 1 ' +
              '                         ) ' +
              '                     AND H2.HMEPARCELA           = HME.HMEPARCELA ' +
              '                     AND H2.HMEANOCOMPETENCIA    = HME.HMEANOCOMPETENCIA ' +
              '                     AND H2.HMEMESCOMPETENCIA    = HME.HMEMESCOMPETENCIA ' +
              '                     AND H2.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO  ' +
              '                  ) ' +
              '   AND ( ' +
              '         ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO = 1 )' +
              '         OR ' +
              '         ( HME.HMECENTRALIZA    = 0 AND NOT EXISTS ( ' +
              '                    SELECT 1 ' +
              '                    FROM ' +
              '                       HISTMOVEMPTMO H2 ' +
              '                    WHERE ' +
              '                           H2.HMETIPOMOV           = HME.HMETIPOMOV ' +
              '                       AND (H2.HMECENTRALIZA       = 1 OR H2.HMEDESTACADO = 1 ) ' +
              '                       AND H2.FLGENVIO             IS NULL ' +
              '                       AND NVL(H2.FLGSUSPENSAO, 0) = 1 ' +
              '                       AND H2.HMEPARCELA           = HME.HMEPARCELA ' +
              '                       AND H2.HMEANOCOMPETENCIA    = HME.HMEANOCOMPETENCIA ' +
              '                       AND H2.HMEMESCOMPETENCIA    = HME.HMEMESCOMPETENCIA ' +
              '                       AND H2.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO ' +
              '                    ) ' +
              '         ) ' +
              //Pendência 22718 - 10/06/2008
              //'       ) ' );
              '       ) ' +
              '   AND ( ' +
              '         ( ' +
              '         EXISTS ( ' +
              '                SELECT 1 ' +
              '                FROM ' +
              '                   ITEMXTIPOCONTR IT, ' +
              '                   CONTRATOEMPTMO CO ' +
              '                WHERE ' +
              '                       CO.IDCONTRATOEMPTMO      = HME.IDCONTRATOEMPTMO ' +
              '                   AND IT.IDTIPOCONTREMPTMO     = CO.IDTIPOCONTREMPTMO ' +
              '                   AND IT.IDITEMEMPTMO          = HME.IDITEMEMPTMO ' +
              '                   AND nvl(FLGESTORNOPOSQUIT,0) = 1 ' +
              '                ) ' +
              '         ) ' +
              '       ) ' );
           end;
           // --------------------------------------------------------------------------------

            // marca os itens em aberto dos contratos anteriores como "quitados"
            MarcaItensQuitados( rContratoAnterior.IDContratoEmptmo,
                                dDataCred,
                                0, // origem
                                iFLGQUITAPARCMORTE,
                                iIdEmpresaProp );

            // -------------------------------------------------------------------------------

            if bFLGEXCEPCIONAL then
            begin
               if iFLGCALCDIA = 1 then
               begin

                 //Execução de Stored Procedure
                 if DbConnectionType = cntADO then
                 begin

                   ADOStoredProc := TADOStoredProc.Create( nil );
                   try
                     ADOStoredProc.Name          := 'spUpdateEstornado';
                     ADOStoredProc.Connection    := DbAdoConnection;
                     ADOStoredProc.ProcedureName := 'CM.SP_EMP_ATUALIZAFLGESTORNO';
                     ADOStoredProc.Parameters.CreateParameter( 'IIDCONTRATOEMPTMO' , ftFloat, pdInput, 0, rContratoAnterior.IDContratoEmptmo );
                     ADOStoredProc.Parameters.CreateParameter( 'DDATAINI'          ,  ftDate, pdInput, 0, dDataCred + 1                      );
                     ADOStoredProc.Parameters.CreateParameter( 'DDATAFIM'          ,  ftDate, pdInput, 0, dDataCred + 180                    );
                     ADOStoredProc.Parameters.CreateParameter( 'IHMETIPOMOV'       , ftFloat, pdInput, 0, 5                                  );
                     ADOStoredProc.Prepared      := True;
                     ADOStoredProc.ExecProc;
                   finally
                     ADOStoredProc.Free;
                   end;

                 end
                 else
                 begin

                   wwStoredProc := TwwStoredProc.Create( nil );
                   try
                     wwStoredProc.Name           := 'spUpdateEstornado';
                     wwStoredProc.DatabaseName   := DataBase.DatabaseName;
                     wwStoredProc.StoredProcName := 'CM.SP_EMP_ATUALIZAFLGESTORNO';
                     wwStoredProc.Params.CreateParam( ftFloat, 'IIDCONTRATOEMPTMO' , ptInput).AsFloat    := rContratoAnterior.IDContratoEmptmo ;
                     wwStoredProc.Params.CreateParam(  ftDate, 'DDATAINI'          , ptInput).AsDateTime := dDataCred + 1                      ;
                     wwStoredProc.Params.CreateParam(  ftDate, 'DDATAFIM'          , ptInput).AsDateTime := dDataCred + 180                    ;
                     wwStoredProc.Params.CreateParam( ftFloat, 'IHMETIPOMOV'       , ptInput).AsFloat    := 5                                  ;
                     wwStoredProc.Prepare;
                     wwStoredProc.ExecProc;
                   finally
                     wwStoredProc.Free;
                   end;

                 end;
               end;

               ExecutaAjusteSaldo( rContratoAnterior.IDContratoEmptmo,
                                   dDataCred - 1,
                                   -1, // O saldo deve ser buscado
                                   iFLGSALDODEVANT,
                                   iFLGCALCDIA
                                   );

            end;

            // -------------------------------------------------------------------------------

            // -------------------------------------------------------------------------------
            // Atualiza a Situação do EP Anterior: FLGSITUACAO = 'Q' ou 'K'
            AcertaSituacaoContratual( rContratoAnterior.IDContratoEmptmo, iFLGCALCDIA );
            // -------------------------------------------------------------------------------

            //Grava o Contrato responsável pela Quitação
            ExecSQL(
             ' UPDATE ' +
             '    CONTRATOEMPTMO ' +
             ' SET ' +
             '    IDCONTRQUITACAO = ' + ConverteVirgulaParaPonto( iIdContratoEmptmo ) +
             ' WHERE ' +
             '    IDCONTRATOEMPTMO = ' + ConverteVirgulaParaPonto( rContratoAnterior.IDContratoEmptmo ) );

         end;

      end;

      cdsContratosAnteriores.Next;

    end;

    Result := True;

  finally
    cdsContratosAnteriores.Free;
  end;

end;

function TCtrlWebEmprestimo.GravaMovEmptmo( rContrato               : TDadosContrato;
                                            vLista                  : TListaItem;
                                            iEvento                 : Integer;
                                            iParcela                : Integer;
                                            iAnoCompetencia         : Integer;
                                            iMesCompetencia         : Integer;
                                            iAnoCobranca            : Integer;
                                            iMesCobranca            : Integer;
                                            iParcelasRemanescentes  : Integer;
                                            dDataPrevista           : TDateTime;
                                            dDataUltAtualiza        : TDateTime;
                                            sFormaEnvio             : String;
                                            sTipoFolha              : String;
                                            bFLGEXCEPCIONAL         : Boolean;
                                            iFLGUSAFIARIO           : integer;
                                            iIdUsuario              : integer;
                                            iIdModulo               : integer;
                                            sVersao                 : string;
                                            var iIdHistMovEmptmo    : Extended ) : Boolean;
var
  i        : Integer;
  sFiario  : String;
begin
  Result := False;

  // -------------------------------------------------------------------------------------------

  for i := 0 to High(vLista) do
  begin

     // Verifica qual tipo de item para decidir se grava ou não
     if ( vLista[i].iEvento = iEvento ) then
     begin
        if iParcela > -1        then vLista[i].Parcela          := iParcela;
        if vLista[i].ParcelaAlt = -1  then vLista[i].ParcelaAlt := vLista[i].Parcela;
        if iAnoCompetencia > -1 then vLista[i].AnoCompetencia   := iAnoCompetencia;
        if iMesCompetencia > -1 then vLista[i].MesCompetencia   := iMesCompetencia;

        vLista[i].AnoCobranca      := iAnoCobranca;
        vLista[i].MesCobranca      := iMesCobranca;
        vLista[i].DataPrevista     := dDataPrevista;
        vLista[i].DataUltAtualiza  := dDataUltAtualiza;

        vLista[i].FlgEnvio      := 0;

        // não se enviam itens de atualização diária do Saldo Devedor
              if (iEvento = 5) or (iEvento = 8) then vLista[i].FlgEnvio := -1;

        // -------------------------------------------------------------------------------------
        if sFormaEnvio <> '' then vLista[i].FormaCobranca := sFormaEnvio;

        if vLista[i].FormaCobranca = 'F' then
        begin
           if sTipoFolha <> '' then
           begin
              vLista[i].TipoFolha     := sTipoFolha;
           end
           else
           begin
              vLista[i].TipoFolha     := 'P';
           end;

           if bFLGEXCEPCIONAL then if vLista[i].Origem <> 10 then vLista[i].TipoFolha := '';

        end;
        // -------------------------------------------------------------------------------------

        if iParcelasRemanescentes > -1 then vLista[i].ParcResta  := iParcelasRemanescentes;

        (* função que grava as informações pertinentes a um contrato no histórico de movimento
           de Empréstimo (tabela HISTMOVEMPTMO), tendo como saída True se a operação foi
           bem sucedida e False caso negativo *)
        if not( InsertMovEmptmo( vLista[i], rContrato, sVersao, iIDHistMovEmptmo ) ) then exit;

        vLista[i].IDHistMovEmptmo := iIDHistMovEmptmo;

     end; (* if FlgCobralib *)

  end; (* for *)


  // -------------------------------------------------------------------------------------------
  // -------------------------------------------------------------------------------------------
  // Fiário
  case iEvento of
     0: sFiario := 'Concessão de Empréstimo';
     2: sFiario := 'Amortização de Empréstimo';
     3: sFiario := 'Quitação de Empréstimo';
  end;

  // se for inserção, incluir o Fiário
  if ( iFLGUSAFIARIO = 1 ) and (iEvento in [0, 2, 3]) then
  begin

    Result := ExecSQL(
     ' INSERT INTO FIARIO ( IDPESSOA, IDTITULAR, IDUSUARIO, IDMODULO, IDRUBS, IDGRUPO, DATAINCLUSAO, DESCRICAO ) ' +
     ' VALUES ( ' +
     IntToStr( rContrato.IDBenef  )                                                    + ', ' +
     IntToStr( rContrato.IDPessoa )                                                    + ', ' +
     IntToStr( iIdUsuario         )                                                    + ', ' +
     IntToStr( iIdModulo          )                                                    + ', ' +
     '0'                                                                               + ', ' +
     '1'                                                                               + ', ' +
     'to_date( ''' + FormatDateTime('dd/mm/yyyy', SysDate( Self ) ) + ''', ''DD/MM/YYYY''), ' +
     sFiario + ' )                                                                          ' );

  end
  else
  begin
     Result := True;
  end;
  // -------------------------------------------------------------------------------------------
  // -------------------------------------------------------------------------------------------

end;

function TCtrlWebEmprestimo.InsertMovEmptmo( ItemContrato: TItemRecDep;
                                             rContrato: TDadosContrato;
                                             sVersao: string;
                                             var iIdHistMovEmptmo: Extended ): Boolean;
var
  sMsgErro : String;
  sCampos, sValores, sSQL : string;
  _iIdHistMovEmptmo : extended;
begin
  Result := False;

  iIdHistMovEmptmo := 0;

  if ( ItemContrato.Valor = 0 ) and
     ( ItemContrato.ValorEfetivo = 0 ) and
     not( ItemContrato.FlgGravaZERO ) then
  begin
    Result := True;
    Exit;
  end;

  // ----------------------------------------------------------------------------------------------
  //    FIM Verificação de inserção de valor ZERO
  // ----------------------------------------------------------------------------------------------

  sCampos  := '';
  sValores := '';

  _iIdHistMovEmptmo := LeUltRegistro( 'HISTMOVEMPTMO' );

  sCampos := sCampos + 'IDHISTMOVEMPTMO, ';
  sValores := sValores + ConverteVirgulaParaPonto( _iIdHistMovEmptmo ) + ', ';

  // -------------------------------------------------------------------------------------------
  // -------------------------------------------------------------------------------------------
  // -------------------------------------------------------------------------------------------
  if rContrato.IDContratoEmptmo > 0      then begin sCampos := sCampos + 'IDCONTRATOEMPTMO, '; sValores := sValores + ConverteVirgulaParaPonto( rContrato.IDContratoEmptmo ) + ', '; end;

  // -------------------------------------------------------------------------------------------
  if ItemContrato.ParcelaAlt > -1        then begin sCampos := sCampos + 'HMEPARCELAALT, '; sValores := sValores + IntToStr( ItemContrato.ParcelaAlt ) + ', '; end;
  if ItemContrato.Parcela > -1           then begin sCampos := sCampos + 'HMEPARCELA, '; sValores := sValores + IntToStr( ItemContrato.Parcela ) + ', '; end;
  if ItemContrato.ParcResta > -1         then begin sCampos := sCampos + 'HMENUMPARCELAS, '; sValores := sValores + IntToStr( ItemContrato.ParcResta ) + ', '; end;
  // -------------------------------------------------------------------------------------------
  if ItemContrato.iEvento > -1           then begin sCampos := sCampos + 'HMETIPOMOV, '; sValores := sValores + IntToStr( ItemContrato.iEvento ) + ', '; end;
  if ItemContrato.Origem > -1            then begin sCampos := sCampos + 'HMEORIGEM, '; sValores := sValores + IntToStr( ItemContrato.Origem ) + ', '; end;
  // -------------------------------------------------------------------------------------------
  if ItemContrato.CodigoItem <> -1       then begin sCampos := sCampos + 'IDITEMEMPTMO, '; sValores := sValores + IntToStr( ItemContrato.CodigoItem ) + ', '; end;
  //Pendência 22885 - 21/07/2006
  if ItemContrato.RecPag <> ''           then begin sCampos := sCampos + 'HMERECPAG, '; sValores := sValores + QuotedStr( trim( ItemContrato.RecPag ) ) + ', '; end;
  //Fim Pendência 22885
  // -------------------------------------------------------------------------------------------

  if ItemContrato.FormaCobranca <> ''    then begin sCampos := sCampos + 'HMEFORMACOBRANCA, '; sValores := sValores + QuotedStr( ItemContrato.FormaCobranca ) + ', '; end;

  // só grava HMETIPOFOLHA se a forma de cobrança for Folha
  if ItemContrato.FormaCobranca = 'F' then
     if ItemContrato.TipoFolha     <> '' then begin sCampos := sCampos + 'HMETIPOFOLHA, '; sValores := sValores + QuotedStr( ItemContrato.TipoFolha ) + ', '; end;
  // -------------------------------------------------------------------------------------------
  if ItemContrato.FlgCentraliza > -1     then begin sCampos := sCampos + 'HMECENTRALIZA, '; sValores := sValores + IntToStr( ItemContrato.FlgCentraliza ) + ', '; end;
  if ItemContrato.FlgDestacado > -1      then begin sCampos := sCampos + 'HMEDESTACADO, '; sValores := sValores + IntToStr( ItemContrato.FlgDestacado ) + ', '; end;
  if ItemContrato.IdItemCentraliza > 0   then begin sCampos := sCampos + 'IDITEMCENTRALIZA, '; sValores := sValores + IntToStr( ItemContrato.IdItemCentraliza ) + ', '; end;
  // -------------------------------------------------------------------------------------------
  // Nesse momento, grava tanto na HmeDataPrevista quanto na HmeDataVencto
  if ItemContrato.DataPrevista <> 0      then
  begin
                                                    sCampos := sCampos + 'HMEDATAPREVISTA, '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', ItemContrato.DataPrevista ) + ''', ''DD/MM/YYYY'')' + ', ';
                                                    sCampos := sCampos + 'HMEDATAVENCTO, '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', ItemContrato.DataPrevista ) + ''', ''DD/MM/YYYY'')' + ', ';
  end;

  // Porém, se a data de vencimento estiver preenchida, é a que vale
  if ItemContrato.DataVencto    > 0      then begin sCampos := sCampos + 'HMEDATAVENCTO, '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', ItemContrato.DataVencto ) + ''', ''DD/MM/YYYY'')' + ', '; end;
  if ItemContrato.DataEfetiva  > 0       then begin sCampos := sCampos + 'HMEDATAEFETIVA, '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', ItemContrato.DataEfetiva ) + ''', ''DD/MM/YYYY'')' + ', '; end;
  if ItemContrato.DataReceb  > 0         then begin sCampos := sCampos + 'HMEDATARECEB, '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', ItemContrato.DataReceb ) + ''', ''DD/MM/YYYY'')' + ', '; end;
  // -------------------------------------------------------------------------------------------
  if ItemContrato.DataUltAtualiza  > 0   then begin sCampos := sCampos + 'HMEDATAATUALIZA, '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', ItemContrato.DataUltAtualiza ) + ''', ''DD/MM/YYYY'')' + ', '; end;
                                                    // HMEDATA -> Data do Processamento
                                                    sCampos := sCampos + 'HMEDATA, '; sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', trunc( Sysdate( Self ) ) ) + ''', ''DD/MM/YYYY'')' + ', ';
  // -------------------------------------------------------------------------------------------
  if ItemContrato.AnoCompetencia > -1    then begin sCampos := sCampos + 'HMEANOCOMPETENCIA, '; sValores := sValores + IntToStr( ItemContrato.AnoCompetencia ) + ', '; end;
  if ItemContrato.MesCompetencia > -1    then begin sCampos := sCampos + 'HMEMESCOMPETENCIA, '; sValores := sValores + IntToStr( ItemContrato.MesCompetencia ) + ', '; end;
  if ItemContrato.AnoCobranca > -1       then begin sCampos := sCampos + 'HMEANOCOBRANCA, '; sValores := sValores + IntToStr( ItemContrato.AnoCobranca ) + ', '; end;
  if ItemContrato.MesCobranca > -1       then begin sCampos := sCampos + 'HMEMESCOBRANCA, '; sValores := sValores + IntToStr( ItemContrato.MesCobranca ) + ', '; end;
  // -------------------------------------------------------------------------------------------
  (* if ItemContrato.SaldoDevedor <> 0 then *)      sCampos := sCampos + 'HMESALDODEV, '; sValores := sValores + ConverteVirgulaParaPonto( ItemContrato.SaldoDevedor ) + ', ';
  (* if ItemContrato.TxJuros <> 0      then *)      sCampos := sCampos + 'HMETXJUROS, '; sValores := sValores + ConverteVirgulaParaPonto( ItemContrato.TxJuros ) + ', ';
  // -------------------------------------------------------------------------------------------
  (* if ItemContrato.Valor <> 0        then *)      sCampos := sCampos + 'HMEVLRPREVISTO, '; sValores := sValores + ConverteVirgulaParaPonto( ItemContrato.Valor ) + ', ';
  if ItemContrato.ValorEfetivo <> 0      then begin sCampos := sCampos + 'HMEVLREFETIVO, '; sValores := sValores + ConverteVirgulaParaPonto( ItemContrato.ValorEfetivo ) + ', '; end;

  // grava valor efetivo ZERO apenas se o valor previsto também for ZERO
  if (ItemContrato.ValorEfetivo = 0) and (ItemContrato.Valor = 0) then
  begin
                                                    sCampos := sCampos + 'HMEVLREFETIVO, '; sValores := sValores + '0' + ', ';
  end;

  if ItemContrato.ValorBase <> 0         then begin sCampos := sCampos + 'HMEVLRBASE, '; sValores := sValores + ConverteVirgulaParaPonto( ItemContrato.ValorBase ) + ', '; end;
  // -------------------------------------------------------------------------------------------
  if ItemContrato.Regra > 0              then begin sCampos := sCampos + 'IDREGRA, '; sValores := sValores + IntToStr( ItemContrato.Regra ) + ', '; end
  else                                        begin sCampos := sCampos + 'IDREGRA, '; sValores := svalores + 'null' + ', '; end;

  // IDRUBRICA -> Será o IDProvento NORMAL do Item a ser gravado
  if ItemContrato.Rubrica > 0            then begin sCampos := sCampos + 'IDRUBRICA, '; sValores := sValores + IntToStr( ItemContrato.Rubrica ) + ', '; end
  else                                        begin sCampos := sCampos + 'IDRUBRICA, '; sValores:= sValores + 'null' + ', '; end;

  if ItemContrato.SeqCobranca > -1       then begin sCampos := sCampos + 'HMESEQCOBRANCA, '; sValores := sValores + IntToStr( ItemContrato.SeqCobranca ) + ', '; end;

  if ItemContrato.FlgEnvio > -1          then begin sCampos := sCampos + 'FLGENVIO, '; sValores := sValores + IntToStr( ItemContrato.FlgEnvio ) + ', '; end;
  if ItemContrato.FlgBaixado > -1        then begin sCampos := sCampos + 'FLGBAIXADO, '; sValores := sValores + IntToStr( ItemContrato.FlgBaixado ) + ', '; end;
  if ItemContrato.FlgDivergPend > -1     then begin sCampos := sCampos + 'FLGDIVERGPEND, '; sValores := sValores + IntToStr( ItemContrato.FlgDivergPend ) + ', '; end;

  if ItemContrato.Prioridade > -1        then begin sCampos := sCampos + 'HMEPRIORIDADE, '; sValores := sValores + IntToStr( ItemContrato.Prioridade ) + ', '; end;

  if ItemContrato.FlgTipoDiverg > -1     then begin sCampos := sCampos + 'FLGTIPODIVERG, '; sValores := sValores + IntToStr( ItemContrato.FlgTipoDiverg ) + ', '; end;
  // -------------------------------------------------------------------------------------------
                                                    sCampos := sCampos + 'VERSAO, '; sValores := sValores + QuotedStr( sVersao ) + ', ';

  //Pendência 23259 - 23/01/2007
  if rContrato.IDPatro > 0               then begin sCampos := sCampos + 'IDPATRO, '; sValores := sValores + IntToStr( rContrato.IDPatro ) + ', '; end;
  if rContrato.IDPlanoOrigem > 0         then begin sCampos := sCampos + 'IDPLANOPREVCONTAB, '; sValores := sValores + IntToStr( rContrato.IDPlanoOrigem ) + ', '; end;
  //Fim Pendência 23259

  // -------------------------------------------------------------------------------------------
  // -------------------------------------------------------------------------------------------
  // -------------------------------------------------------------------------------------------

  sCampos  := Copy( sCampos,  1, length( sCampos  ) - 2 );
  sValores := Copy( sValores, 1, length( sValores ) - 2 );

  sSQL := ' INSERT INTO HISTMOVEMPTMO ( ' + sCampos + ' ) VALUES ( ' + sValores + ' ) ';

  if ExecSQL( sSQL ) then
  begin
    iIdHistMovEmptmo := _iIdHistMovEmptmo;
    Result := True;
  end;

end;


function TCtrlWebEmprestimo.LeUltRegistro( sTabela : string ): extended;
var
  cdsLocal : TCmClientDataset;
begin
  cdsLocal := TCmClientDataset.Create( nil );
  try
    cdsLocal.Data := GetDataPacket( ' SELECT SEQ' + sTabela + '.NEXTVAL AS SEQ FROM DUAL ' );
    Result := cdsLocal.FieldByName('SEQ').AsFloat;
  finally
    cdsLocal.Free;
  end;
end;


function TCtrlWebEmprestimo.MarcaItensQuitados( IDContratoEmptmo: Extended;
                                                dDataQuit: TDateTime;
                                                iOrigem: Integer;
                                                iFLGQUITAPARCMORTE : integer;
                                                iIdEmpresaProp     : integer ): Integer;
var
  cdsAux,
  cdsItens,
  cdsItemQuitado : TCMClientDataset;
  bRegra         : Boolean;
  sSQL           : String;
  sResultRegra   : String;
  iRegra         : Integer;
  iNumParcPagas  : Integer;
  iNumParcelas   : Integer;
  iNumParcRest   : Integer;
  iQuantAberto   : Integer;
begin
  bRegra := False;
  Result := 0;

  cdsAux         := TCMClientDataset.Create( nil );
  cdsItens       := TCMClientDataset.Create( nil );
  cdsItemQuitado := TCMClientDataset.Create( nil );
  try
    try

       // pelo contrato, procura a regra que será usada para determinar
       // quais itens serão marcados como "quitados"
       sSQL :=
       'SELECT '                                                                  + #13 +
       '   TCE.IDREGRAQUITADO '                                                   + #13 +
       'FROM '                                                                    + #13 +
       '   CONTRATOEMPTMO  CON, '                                                 + #13 +
       '   TIPOCONTREMPTMO TCE '                                                  + #13 +
       'WHERE '                                                                   + #13 +
       '       IDCONTRATOEMPTMO      = ' + FormatFloat('#0', IDContratoEmptmo)    + #13 +
       '   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO ';

       cdsAux.Data := GetDataPacket( sSQL );

       // verifica a regra que será usada para determinar quais itens serão marcados como "quitados"
       if not(cdsAux.IsEmpty) and
          not(cdsAux.FieldByName('IDREGRAQUITADO').isNULL) and
             (cdsAux.FieldByName('IDREGRAQUITADO').AsInteger > 0) then
       begin
         bRegra := True;
       end;
    except
       //
    end;

    if not(bRegra) then
    begin
       if not( (iOrigem = 8) and ( iFLGQUITAPARCMORTE = 1) ) then
       begin

         cdsItemQuitado.Data := GetDataPacket(
          ' select HME.IDCONTRATOEMPTMO from HISTMOVEMPTMO HME where ' +
          '     HME.IDCONTRATOEMPTMO   = ' + ConverteVirgulaParaPonto( IDContratoEmptmo ) +
          ' AND HME.HMETIPOMOV         <> 3 ' +
          ' AND HME.FLGBAIXADO         = 0 ' +
          ' AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) ' +
          ' AND ( (HME.FLGABONADO      = 0) OR (HME.FLGABONADO IS NULL) ) ' +
          ' AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) ' );

         if not cdsItemQuitado.IsEmpty then
         begin
           try

             ExecSQL(
              ' UPDATE ' +
              '    HISTMOVEMPTMO HME ' +
              ' SET ' +
              '    HME.FLGQUITADO             = 1, ' +
              '    HME.FLGDIVERGPEND          = NULL,  ' +
              '    HME.HMEDATAQUITABONO       = to_date( ''' + FormatDateTime('dd/mm/yyyy', dDataQuit ) + ''', ''DD/MM/YYYY'') ' +
              ' WHERE ' +
              '     HME.IDCONTRATOEMPTMO   = ' + ConverteVirgulaParaPonto( IDContratoEmptmo ) +
              '    AND HME.HMETIPOMOV         <> 3 ' +
              '    AND HME.FLGBAIXADO         = 0 ' +
              '    AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) ' +
              '    AND ( (HME.FLGABONADO      = 0) OR (HME.FLGABONADO IS NULL) ) ' +
              '    AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) ' );

             Result := cdsItemQuitado.RecordCount;
           except
             Result := -2;
           end;
         end;
       end;
    end
    else // if not(bRegra)
    begin

       // Verifica quais itens devem ser marcados como "quitados" de acordo com a Regra
       iRegra := cdsAux.FieldByName('IDREGRAQUITADO').AsInteger;

       // ----------------------------------------------------------------------------------------
       // ----------------------------------------------------------------------------------------
       // ----------------------------------------------------------------------------------------

       // Conta
       sSQL :=
       'SELECT '                                                                              + #13 +
       '  CON.NUMPARCELAS, '                                                                  + #13 +
       '  HME.HMENUMPARCELAS, '                                                               + #13 +
       '  COUNT(PAG.HMEPARCELA) AS NUMPARCPAGAS '                                             + #13 +
       'FROM '                                                                                + #13 +
       '  HISTMOVEMPTMO   HME, '                                                              + #13 +
       '  CONTRATOEMPTMO  CON, '                                                              + #13 +
       '  TIPOCONTREMPTMO TIP, '                                                              + #13 +
       '  ( '                                                                                 + #13 +
       '  SELECT '                                                                            + #13 +
       '     HME.IDCONTRATOEMPTMO, HME.HMEPARCELA, '                                          + #13 +

       '     SUM(ROUND(DECODE(HME.HMESEQCOBRANCA, 1, HME.HMEVLRPREVISTO, 0), 2)) - '          +
            'SUM(ROUND(NVL(HME.HMEVLREFETIVO, 0), 2)) AS TOTAL '                              + #13 +

       '  FROM '                                                                              + #13 +
       '     HISTMOVEMPTMO  HME, '                                                            + #13 +
       '     CONTRATOEMPTMO CON '                                                             + #13 +
       '  WHERE '                                                                             + #13 +
       '         ( CON.IDCONTRATOEMPTMO = ' + FormatFloat('#0', IDContratoEmptmo) + ' ) '     + #13 +
       '     AND ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO = 1 ) '                     + #13 +
       '     AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '                          + #13 +
       '  GROUP BY '                                                                          + #13 +
       '     HME.IDCONTRATOEMPTMO, HME.HMEPARCELA '                                           + #13 +

       '  HAVING '                                                                            + #13 +
       '         ( SUM(ROUND(DECODE(HME.HMESEQCOBRANCA, 1, HME.HMEVLRPREVISTO, 0), 2)) - '          +
                  'SUM(ROUND(NVL(HME.HMEVLREFETIVO, 0), 2)) = 0 ) '                           + #13 +
       '     AND ( HME.HMEPARCELA <> 0 ) '                                                    + #13 +
       '  ) PAG, '                                                                            + #13 +

       '  ( '                                                                                 + #13 +
       '  SELECT '                                                                            + #13 +
       '     MAX(IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO '                                        + #13 +
       '  FROM '                                                                              + #13 +
       '     HISTMOVEMPTMO '                                                                  + #13 +
       '  WHERE '                                                                             + #13 +
       '         ( IDCONTRATOEMPTMO     = ' + FormatFloat('#0', IDContratoEmptmo) + ' ) '     + #13 +
       '     AND ( HMECENTRALIZA        = 1 OR HMEDESTACADO = 1 ) '                           + #13 +
       '  ) HST '                                                                             + #13 +

       'WHERE '                                                                               + #13 +
       '      ( CON.IDCONTRATOEMPTMO = ' + FormatFloat('#0', IDContratoEmptmo) + ' ) '        + #13 +
       '  AND ( CON.IDCONTRATOEMPTMO    = PAG.IDCONTRATOEMPTMO(+) ) '                         + #13 +
       '  AND ( CON.IDTIPOCONTREMPTMO   = TIP.IDTIPOCONTREMPTMO ) '                           + #13 +
       '  AND ( HME.IDHISTMOVEMPTMO     = HST.IDHISTMOVEMPTMO ) '                             + #13 +

       'GROUP BY '                                                                            + #13 +
       '  CON.NUMPARCELAS, HME.HMENUMPARCELAS ';


       cdsAux.Close;
       cdsAux.Data := GetDataPacket( sSQL );

       // se a query estiver vazia, passa os valores zerados
       iNumParcPagas  := 0;
       iNumParcelas   := 0;
       iNumParcRest   := 0;

       if not(cdsAux.isEmpty) then
       begin
          if not(cdsAux.FieldByName('NUMPARCPAGAS').IsNull) then   iNumParcPagas  := cdsAux.FieldByName('NUMPARCPAGAS').AsInteger;
          if not(cdsAux.FieldByName('NUMPARCELAS').IsNull) then    iNumParcelas   := cdsAux.FieldByName('NUMPARCELAS').AsInteger;
          if not(cdsAux.FieldByName('HMENUMPARCELAS').IsNull) then iNumParcRest   := cdsAux.FieldByName('HMENUMPARCELAS').AsInteger;
       end;
       // ----------------------------------------------------------------------------------------

       cdsAux.Close;


       // ----------------------------------------------------------------------------------------
       //    Monta as linhas dos itens PENDENTES
       // ----------------------------------------------------------------------------------------
       cdsItens.Data := ItensEmprestimo( IDContratoEmptmo,
                                         -1,
                                         -1,
                                         -1,
                                         0,
                                         -1,
                                         -1,
                                         -1,
                                         0,
                                         0,
                                         0,
                                         0,
                                         1,
                                         -1,
                                         3,
                                         -1,
                                         0 );

       iQuantAberto := cdsItens.RecordCount;
       cdsItens.First;

       while not(cdsItens.EOF) do
       begin
          sSQL :=
          'SELECT '                                                                                                   + #13 +
          '  ' + FormatFloat('#0', IDContratoEmptmo)                                    +  ' AS IDCONTRATOEMPTMO, '   + #13 +

          '  ' + IntToStr(cdsItens.FieldByName('IDITEMEMPTMO').AsInteger)               +  ' AS IDITEMEMPTMO, '       + '     /* ' + cdsItens.FieldByName('ITEDESCRICAO').AsString + ' */' + #13 +
          '  ' + IntToStr(cdsItens.FieldByName('HMETIPOMOV').AsInteger)                 +  ' AS EVENTOITEM, '         + #13 +
          '  ' + IntToStr(3)                                                            +  ' AS EVENTO, '             + #13 +
          '  ' + IntToStr(iOrigem)                                                      +  ' AS ORIGEM, '             + #13 +

          '  ' + IntToStr(cdsItens.FieldByName('HMEPARCELA').AsInteger)                 +  ' AS PARCATUAL, '          + #13 +
          ' 0' + IntToStr(cdsItens.FieldByName('HMENUMPARCELAS').AsInteger)             +  ' AS NUMPARCELAS, '        + #13 +

          '  ' + IntToStr(cdsItens.FieldByName('FLGENVIO').AsInteger)                   +  ' AS FLGENVIO, '           + #13 +
          '  ' + QuotedStr(cdsItens.FieldByName('HMEFORMACOBRANCA').AsString)           +  ' AS FLGFORMACOB, '        + #13 +

          '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataQuit))                                           +  ' AS DATAEVENTO, '     + #13 +
          '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAPREVISTA').AsDateTime))  +  ' AS DATAPREVISTA, '   + #13 +
          '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAEFETIVA').AsDateTime))   +  ' AS DATAEFETIVA, '    + #13 +
          '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAATUALIZA').AsDateTime))  +  ' AS DATAATUALIZA, '   + #13 +
          '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', cdsItens.FieldByName('HMEDATAVENCTO').AsDateTime))    +  ' AS DATAVENCTO, '     + #13 +

          '  ' + QuotedStr(FormatFloat('0000', cdsItens.FieldByName('HMEANOCOMPETENCIA').AsFloat)             +
                 FormatFloat('00', cdsItens.FieldByName('HMEMESCOMPETENCIA').AsFloat))                        +  ' AS COMPETENCIA, '    + #13 +
          '  ' + QuotedStr(FormatFloat('0000', cdsItens.FieldByName('HMEANOCOBRANCA').AsFloat)                +
                 FormatFloat('00', cdsItens.FieldByName('HMEMESCOBRANCA').AsFloat))                           +  ' AS COBRANCA, '       + #13 +

          '  ' + ConverteVirgulaParaPonto(cdsItens.FieldByName('HMEVLRPREVISTO').AsFloat)   +  ' AS VLRPREVISTO, '        + #13 +
          '  ' + ConverteVirgulaParaPonto(cdsItens.FieldByName('HMEVLREFETIVO').AsFloat)    +  ' AS VLREFETIVO, '         + #13 +
          '  ' + ConverteVirgulaParaPonto(cdsItens.FieldByName('HMESALDODEV').AsFloat)      +  ' AS SALDODEV, '           + #13 +
          '  ' + ConverteVirgulaParaPonto(cdsItens.FieldByName('HMETXJUROS').AsFloat)       +  ' AS TXJUROS, '            + #13 +

          '  ' + IntToStr(iQuantAberto)                                                     +  ' AS QUANTITEMABERTO,'     + #13 +
          '  ' + IntToStr(iNumParcPagas)                                                    +  ' AS NUMPARCPAGAS,'        + #13 +
          '  ' + IntToStr(iNumParcelas)                                                     +  ' AS PRAZOANT,'            + #13 +
          '  ' + IntToStr(iNumParcRest)                                                     +  ' AS PRAZOREST, '          + #13 +

          //Pendência 22836 - 03/10/2006 
          '  00'                                                                            +  ' AS FLGEXCEPCIONAL, '     + #13 +
          //Fim Pendência 22836

          ' 0' + IntToStr(cdsItens.FieldByName('FLGSUSPENSAO').AsInteger)                   +  ' AS FLGSUSPENSAO '        + #13 +
          'FROM '                                                                                            +
          '  DUAL ';

          sResultRegra := '';


          WebRegra.CdsDataSetIn.Close;
          WebRegra.CdsDataSetIn.Data := GetDataPacket( sSQL );


          WebRegra.MessageInfo := '';
          if not WebRegra.RegraBooleana( IntToStr( iRegra ), iIdEmpresaProp ) then
          begin
             if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );
             // Regra Executada com ERRO
             Result := -2;
             Exit;
          end
          else
          begin
            if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );

            try

              ExecSQL(
                ' UPDATE ' +
                '    HISTMOVEMPTMO HME ' +
                ' SET ' +
                '    HME.FLGQUITADO             = 1, ' +
                '    HME.FLGDIVERGPEND          = NULL,  ' +
                '    HME.HMEDATAQUITABONO       = to_date( ''' + FormatDateTime('dd/mm/yyyy', dDataQuit ) + ''', ''DD/MM/YYYY'') ' +
                ' WHERE ' +
                '     HME.IDCONTRATOEMPTMO   = ' + ConverteVirgulaParaPonto( IDContratoEmptmo ) +
                '    AND ( HME.IDHISTMOVEMPTMO = ' + ConverteVirgulaParaPonto( cdsItens.FieldByName('IDHISTMOVEMPTMO').AsFloat ) + ' ) ' +
                '    AND HME.HMETIPOMOV         <> 3 ' +
                '    AND HME.FLGBAIXADO         = 0 ' +
                '    AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL) ) ' +
                '    AND ( (HME.FLGABONADO      = 0) OR (HME.FLGABONADO IS NULL) ) ' +
                '    AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ) ' );

            except
              Result := -2;
              exit;
            end;

          end;

          // Próximo item Aberto
          cdsItens.Next;
          // -------------------------------------------------------------------------------------
       end; // while not(dtmCalcEmptmo.qryItens.EOF)

       Result := iQuantAberto;

       // ----------------------------------------------------------------------------------------
       // ----------------------------------------------------------------------------------------
       // ----------------------------------------------------------------------------------------
       // ----------------------------------------------------------------------------------------


    end; // if not(bRegra)

  finally
    cdsAux.Free;
    cdsItens.Free;
    cdsItemQuitado.Free;
  end;

end;

procedure TCtrlWebEmprestimo.ExecutaAjusteSaldo( IDContrato: Extended; dDataAtualiza: TDateTime; fSaldoDev: Currency;
  iFLGSALDODEVANT   : Integer; iFLGCALCDIA : Integer);
var
  rSaldoDev         : TSaldoDevAnt;
  fSaldoConsiderado : Currency;
  ADOStoredProc     : TADOStoredProc;
  wwStoredProc      : TwwStoredProc;
begin
  // Verifica se o saldo devedor anterior já foi passado
  // Se não foi, busca o saldo devedor na data anterior

  fSaldoConsiderado := fSaldoDev;

  if fSaldoDev = -1 then
  begin
    rSaldoDev := SaldoDevAnt( IDContrato,
                              dDataAtualiza - 1,
                              -1,
                              -1,
                              iFLGSALDODEVANT,
                              iFLGCALCDIA,
                            );

     fSaldoConsiderado := rSaldoDev.fSaldoDevAnt;
  end;

  //Execução de Stored Procedure
  if DbConnectionType = cntADO then
  begin
    ADOStoredProc := TADOStoredProc.Create( nil );
    try
      ADOStoredProc.Name          := 'spAtualizaSaldo';
      ADOStoredProc.Connection    := DbAdoConnection;
      ADOStoredProc.ProcedureName := 'CM.SP_EMP_ATUALIZASALDODEV';
      ADOStoredProc.Parameters.CreateParameter( 'IIDCONTRATOEMPTMO' , ftFloat, pdInput, 0, IDContrato        );
      ADOStoredProc.Parameters.CreateParameter( 'DDATAATUALIZA'     ,  ftDate, pdInput, 0, dDataAtualiza     );
      ADOStoredProc.Parameters.CreateParameter( 'FSALDODEV'         , ftFloat, pdInput, 0, fSaldoConsiderado );
      ADOStoredProc.Prepared      := True;
      ADOStoredProc.ExecProc;
    finally
      ADOStoredProc.Free;
    end;
  end
  else
  begin
    wwStoredProc := TwwStoredProc.Create( nil );
    try
      wwStoredProc.Name           := 'spAtualizaSaldo';
      wwStoredProc.DatabaseName   := DataBase.DatabaseName;
      wwStoredProc.StoredProcName := 'CM.SP_EMP_ATUALIZASALDODEV';
      wwStoredProc.Params.CreateParam( ftFloat, 'IIDCONTRATOEMPTMO' , ptInput).AsFloat    := IDContrato        ;
      wwStoredProc.Params.CreateParam(  ftDate, 'DDATAATUALIZA'     , ptInput).AsDateTime := dDataAtualiza     ;
      wwStoredProc.Params.CreateParam( ftFloat, 'FSALDODEV'         , ptInput).AsFloat    := fSaldoConsiderado ;
      wwStoredProc.Prepare;
      wwStoredProc.ExecProc;
    finally
      wwStoredProc.Free;
    end;
  end;

end;

function TCtrlWebEmprestimo.SaldoDevAnt(IDContrato: Extended;
  dData: TDateTime; iAnoCompetencia, iMesCompetencia: Integer; iFLGSALDODEVANT : Integer;
  iFLGCALCDIA : Integer; bVerificaParcela: Boolean): TSaldoDevAnt;
var
  sDiaSldDev     : String;
  dDataSaldoDev  : TDateTime;
  cdsSaldoAntAtuDia,
  cdsSaldoParcelaAnt,
  cdsSaldoAnt : TCMClientDataset;
begin

  Result.fTxJurosAnt   := 0;
  Result.fSaldoDevAnt  := 0;
  Result.iParcelaAnt   := 0;
  Result.iParcRestaAnt := 0;

  // ----------------------------------------------------------------------------------------------

  sDiaSldDev := 'C';
  case iFLGSALDODEVANT of
    1: sDiaSldDev := 'A';
  end;

  dDataSaldoDev := dData;
  if sDiaSldDev = 'A' then dDataSaldoDev := (dData - 1);

  // ----------------------------------------------------------------------------------------------
  cdsSaldoAntAtuDia  := TCMClientDataset.Create( nil );
  cdsSaldoParcelaAnt := TCMClientDataset.Create( nil );
  cdsSaldoAnt        := TCMClientDataset.Create( nil );
  try

     if iFLGCALCDIA = 1 then
     begin
        // ----------------------------------------------------------------------------------------
        if ( (iAnoCompetencia > 0) and (iMesCompetencia > 0) ) then
        begin
           dDataSaldoDev := EncodeDate(iAnoCompetencia, iMesCompetencia, 1) - 1;
        end
        else
        begin
           dDataSaldoDev := dData;
           if sDiaSldDev = 'A' then dDataSaldoDev := dData - 1;
        end;
        // ----------------------------------------------------------------------------------------

        // ----------------------------------------------------------------------------------------
        //    Busca o saldo devedor em uma determinada data (exata)
        // ----------------------------------------------------------------------------------------
        cdsSaldoAntAtuDia.Data := SaldoAntAtuDia( IDContrato, dDataSaldoDev );
        if not( cdsSaldoAntAtuDia.isEmpty ) then
        begin
          Result.fSaldoDevAnt  := cdsSaldoAntAtuDia.FieldByName('HMESALDODEV').AsCurrency;
          Result.fTxJurosAnt   := cdsSaldoAntAtuDia.FieldByName('HMETXJUROS').AsCurrency;
          Result.dDataAtuAnt   := cdsSaldoAntAtuDia.FieldByName('HMEDATAATUALIZA').AsDateTime;
          Result.iParcelaAnt   := cdsSaldoAntAtuDia.FieldByName('HMEPARCELA').AsInteger;

          if not(cdsSaldoAntAtuDia.FieldByName('HMEPARCELAALT').isNULL) then
          begin
            Result.iParcelaAltAnt := cdsSaldoAntAtuDia.FieldByName('HMEPARCELAALT').AsInteger;
          end;

          Result.iParcRestaAnt := cdsSaldoAntAtuDia.FieldByName('HMENUMPARCELAS').AsInteger;
        end;

        // ----------------------------------------------------------------------------------------
        //
        // ----------------------------------------------------------------------------------------

        // ----------------------------------------------------------------------------------------
        //    Busca a parcela atual e as parcelas restantes
        //    (Pode ser necessário caso o registro do saldo devedor corresponder a uma atualização
        //     diária, que terá sempre parcela ZERO)
        // ----------------------------------------------------------------------------------------
        if bVerificaParcela then
        begin
          cdsSaldoParcelaAnt.Data := SaldoParcelaAnt( IDContrato, dDataSaldoDev, 0 );
          if not(cdsSaldoParcelaAnt.isEmpty) then
          begin
            Result.iParcelaAnt   := cdsSaldoParcelaAnt.FieldByName('HMEPARCELA').AsInteger;

            if not(cdsSaldoAntAtuDia.FieldByName('HMEPARCELAALT').isNULL) then
            begin
              Result.iParcelaAltAnt   := cdsSaldoAntAtuDia.FieldByName('HMEPARCELAALT').AsInteger;
            end;

            Result.iParcRestaAnt := cdsSaldoParcelaAnt.FieldByName('HMENUMPARCELAS').AsInteger;
          end;
        end;
        // ----------------------------------------------------------------------------------------
        //
        // ----------------------------------------------------------------------------------------
     end
     else  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1
     begin
        // ----------------------------------------------------------------------------------------
        if ( (iAnoCompetencia > 0) and (iMesCompetencia > 0) ) then
        begin
           dDataSaldoDev := EncodeDate(iAnoCompetencia, iMesCompetencia, 1) - 1;
        end
        else
        begin
           dDataSaldoDev := dData;
           if sDiaSldDev = 'A' then dDataSaldoDev := dData - 1;
        end;
        // ----------------------------------------------------------------------------------------

        // ----------------------------------------------------------------------------------------
        //    Busca o ÚLTIMO saldo devedor ANTES de uma determinada data
        // ----------------------------------------------------------------------------------------
        cdsSaldoAnt.Data := SaldoAnt( IDContrato, dDataSaldoDev );
        if not(cdsSaldoAnt.isEmpty) then
        begin
          Result.fSaldoDevAnt  := cdsSaldoAnt.FieldByName('HMESALDODEV').AsCurrency;
          Result.fTxJurosAnt   := cdsSaldoAnt.FieldByName('HMETXJUROS').AsCurrency;
          Result.dDataAtuAnt   := cdsSaldoAnt.FieldByName('HMEDATAATUALIZA').AsDateTime;
          Result.iParcelaAnt   := cdsSaldoAnt.FieldByName('HMEPARCELA').AsInteger;
          Result.iParcRestaAnt := cdsSaldoAnt.FieldByName('HMENUMPARCELAS').AsInteger;
        end;
        // ----------------------------------------------------------------------------------------
        //
        // ----------------------------------------------------------------------------------------
     end;

  finally
    cdsSaldoAntAtuDia.Free;
    cdsSaldoParcelaAnt.Free;
    cdsSaldoAnt.Free;
  end;
end;

procedure TCtrlWebEmprestimo.AcertaSituacaoContratual( IDContratoEmptmo: Extended; iFLGCALCDIA : integer );
var
  bExisteSaldo   : Boolean;
  bExisteAberto  : Boolean;
  bExisteQuitacao: Boolean;
  sSituacao      : String;
  sNovaSituacao  : String;
  dDataAcertoSit : TDateTime;
  fAux           : Currency;
  sSQL           : string;
begin

  // ----------------------------------------------------------------------------------------------
  //    Acerto da situação do Contrato
  // ----------------------------------------------------------------------------------------------

  // ----------------------------------------------------------------------------------------------
  bExisteQuitacao   := ExisteQuitacao( IDContratoEmptmo );
  bExisteSaldo      := ExisteSaldoDevedor(IDContratoEmptmo, iFLGCALCDIA );
  dDataAcertoSit    := UltimaDataAtualizacao(IDContratoEmptmo);
  bExisteAberto     := ExistemItensEmAberto_uCalc( IDContratoEmptmo, False, 0, False, 0, 0 );
  // ----------------------------------------------------------------------------------------------


  if bExisteSaldo then
  begin
     if bExisteQuitacao then
     begin
        if not(bExisteAberto) then
        begin
           // se não houver saldo devedor, E não houver itens em aberto,
           // o Contrato está (Q)uitado
           sNovaSituacao := 'Q';
        end
        else
        begin
           // se houver saldo devedor, o Contrato precisa ser (A)tivo
           sNovaSituacao := 'K';
        end;
     end
     else  // if bExisteQuitacao
     begin
        // se houver saldo devedor, o Contrato precisa ser (A)tivo
        sNovaSituacao := 'A';
     end;
  end
  else  // if bExisteSaldo
  begin
     if bExisteQuitacao then
     begin
        if not(bExisteAberto) then
        begin
           // se não houver saldo devedor, E não houver itens em aberto,
           // o Contrato está (Q)uitado
           sNovaSituacao := 'Q';
        end
        else
        begin
           // se houver saldo devedor, o Contrato precisa ser (A)tivo
           sNovaSituacao := 'K';
        end;
     end
     else  // if bExisteQuitacao
     begin
        if not(bExisteAberto) then
        begin
           // se não houver saldo devedor, E não houver itens em aberto,
           // o Contrato está (Q)uitado
           sNovaSituacao := 'Q';
        end
        else  // if not(bExisteAberto)
        begin
           sNovaSituacao := 'E';
        end;  // if not(bExisteAberto)
     end;  // if bExisteQuitacao
  end;  // if bExisteSaldo

  if sNovaSituacao <> '' then
  begin

    sSQL :=
     ' UPDATE ' +
     '    CONTRATOEMPTMO CON ' +
     ' SET ' +
     '    CON.FLGSITUACAO   = ' + QuotedStr( sNovaSituacao ) + ', ' +
     '    CON.DATASITUACAO  = to_date( ''' + FormatDateTime('dd/mm/yyyy', SysDate( Self ) ) + ''', ''DD/MM/YYYY'') ';

    if sNovaSituacao[1] in ['C', 'E', 'K', 'Q'] then
      sSQL := sSQL + ', CON.DATACANC  = to_date( ''' + FormatDateTime('dd/mm/yyyy', dDataAcertoSit ) + ''', ''DD/MM/YYYY'') ';

    sSQL := sSQL +
     ' WHERE ' +
     '    CON.IDCONTRATOEMPTMO = ' + ConverteVirgulaParaPonto( IDContratoEmptmo );

    ExecSQL( sSQL );
  end;
  // ----------------------------------------------------------------------------------------------
  //    FIM Acerto da situação do Contrato
  // ----------------------------------------------------------------------------------------------

end;

function TCtrlWebEmprestimo.ExisteQuitacao(IDContrato: Extended): Boolean;
var
  cdsLocal : TCMClientDataset;
begin
  Result := False;

  cdsLocal := TCmClientDataset.Create( nil );
  try
    cdsLocal.Data := GetDataPacket(
     ' SELECT ' +
     '    IDHISTMOVEMPTMO ' +
     ' FROM ' +
     '    HISTMOVEMPTMO HME ' +
     ' WHERE ' +
     '        HME.IDCONTRATOEMPTMO      = ' + ConverteVirgulaParaPonto( IDContrato ) +
     '    AND HME.HMETIPOMOV            = 3 ' +
     '    AND (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACADO = 1) ' +
     '    AND NVL(HME.FLGESTORNADO, 0)  = 0 ' +
     '    AND (HME.HMEVLREFETIVO        IS NULL OR HME.HMEVLREFETIVO = HME.HMEVLRPREVISTO) ' );

    Result := not cdsLocal.IsEmpty;

  finally
    cdsLocal.Free;
  end
end;

function TCtrlWebEmprestimo.ExisteSaldoDevedor( IDContrato: Extended; iFLGCALCDIA : integer ): Boolean;
var
  dDataSaldo : TDateTime;
  cdsSaldoAnt,
  cdsSaldoAntAtuDia : TCMClientDataset;
begin
  Result := False;

  cdsSaldoAnt       := TCMClientDataset.Create( nil );
  cdsSaldoAntAtuDia := TCMClientDataset.Create( nil );
  try
    if iFLGCALCDIA = 1 then
    begin
      dDataSaldo := UltimaDataAtualizacao(IDContrato);

      cdsSaldoAntAtuDia.Data := SaldoAntAtuDia( IDContrato, dDataSaldo );

      if not( cdsSaldoAntAtuDia.IsEmpty) and
            ( cdsSaldoAntAtuDia.FieldByName('HMESALDODEV').AsCurrency > 0 ) then
      begin
        Result := True;
      end;

    end
    else
    begin
      cdsSaldoAnt.Data := SaldoAnt( IDContrato, DiasUteis.SomaAnos( Sysdate( Self ), 10 ) );
      if not( cdsSaldoAnt.IsEmpty) and
            ( cdsSaldoAnt.FieldByName('HMESALDODEV').AsCurrency > 0 ) then
      begin
        Result := True;
      end;

    end;  // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1

  finally
    cdsSaldoAnt.Free;
    cdsSaldoAntAtuDia.Free;
  end
end;

function TCtrlWebEmprestimo.UltimaDataAtualizacao( IDContrato: Extended): TDateTime;
var
  cdsLocal : TCMClientDataset;
begin
  cdsLocal := TCmClientDataset.Create( nil );
  try
    cdsLocal.Data := GetDataPacket(
     ' SELECT /*+INDEX(CON XPKCONTRATOEMPTMO) INDEX(HME XIE29HISTMOVEMPTMO) */ ' +
     '    MAX(HMEDATAATUALIZA) AS HMEDATAATUALIZA ' +
     ' FROM ' +
     '    HISTMOVEMPTMO   HME, ' +
     '    CONTRATOEMPTMO  CON, ' +
     '    ITEMXTIPOCONTR  ITC, ' +
     '    TIPOCONTREMPTMO TCE ' +
     ' WHERE ' +
     '        CON.IDCONTRATOEMPTMO     = ' + ConverteVirgulaParaPonto( IDContrato ) +
     '    AND ITC.ITCTRATASALDODEV    <> 0 ' +
     '    AND NVL(HME.FLGESTORNADO, 0) = 0 ' +
     '    AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO ' +
     '    AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO ' +
     '    AND TCE.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO ' +
     '    AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO ' );

    Result := cdsLocal.FieldByName('HMEDATAATUALIZA').AsDateTime;

  finally
    cdsLocal.Free;
  end
end;

function TCtrlWebEmprestimo.SituacaoContrato( IDContratoEmptmo: Extended): string;
var
  cdsLocal : TCMClientDataset;
begin
  cdsLocal := TCmClientDataset.Create( nil );
  try
    cdsLocal.Data := GetDataPacket(
      ' SELECT ' +
      '    CON.FLGSITUACAO ' +
      ' FROM ' +
      '    CONTRATOEMPTMO CON ' +
      ' WHERE ' +
      '    CON.IDCONTRATOEMPTMO = ' + ConverteVirgulaParaPonto( IDContratoEmptmo ) );

    Result := cdsLocal.FieldByName('FLGSITUACAO').AsString;

  finally
    cdsLocal.Free;
  end
end;

function TCtrlWebEmprestimo.CalculaItens( const rContrato           : TDadosContrato;
                                          const rConcessao          : TDadosConcessao;
                                          const iEvento             : Integer;
                                          const iOrigem             : Integer;
                                          const iPais               : Integer;
                                          const sEstado             : String;
                                          const iCidade             : Integer;
                                          const iParcela            : Integer;
                                          const iIdSitPart          : Int64;
                                          const sFormaCobranca      : String;
                                          const fTxJuros, fSaldoDev, fVlrSolic, fSaldoEPAnt, fMargem,
                                                fReserva, fSalPart, fSalMantido, fSalAuxDoenca,
                                                fSalBenef, fSalarioBase, fVlrMaxPermit : Currency;
                                          const iNumParcPagas       : Integer;
                                          const iPrazoAnterior      : Integer;
                                          const iUltParcelaGerada   : Integer;
                                          const dDataRef            : TDateTime;
                                          const dDataAtualiza       : TDateTime;
                                          const sAnoMesCompetencia  : String;
                                          const iIdEmpresaProp      : integer;
                                          var   vLista              : TListaItem;
                                          const fVlrDevolSeguro     : Currency = 0;
                                          const fVlrSegAnt          : Currency = 0;
                                          const fVlrSegComplAnt     : Currency = 0;
                                          const bAlteraSaldoDev     : Boolean = True;
                                          const fVlrContratosAnt    : Currency = 0;
                                          const fVlrDividas         : Currency = 0;
                                          const iTipoContrQuitAnt   : Integer = -1;
                                          const bCriaObjetoRegra    : Boolean = False;
                                          const dDataAtraso         : TDateTime = 0;
                                          const fValorEmAberto      : Currency = 0;
                                          const dDataAtrasoAnt      : TDateTime = 0;
                                          const fValorEmAbertoAnt   : Currency = 0;
                                          const fValorProvisao      : Currency = 0;
                                          const bGravaQueryRegra    : Boolean = True;
                                          const iFinanciamento      : Integer = 0
                                         ) : Boolean;
var
   vSQL                    : array of String;
   i, j                    : Integer;
   sSQL, sSQLExec, sValor  : String;
   fNovoSaldoDev           : Currency;
   cdsAux,
   cdsBuscaItens           : TCMClientDataset;
   sFlgInterno             : String;
   rSaldoDevAtu            : TSaldoDevAnt;
   sDataNasc               : String;
begin

  // função que calcula (utilizando a Regra pertinente) e armazena num vetor
  //   de Registros informações como o Nome do item, seu valor e o RECPAG, isto
  //   é se o item é de Recebimento ou Pagamento - PARA PRESTAÇÕES

  Result := True;

  // variável que armazena o saldo devedor resultante do tratamento dos itens,
  //   isto é, depois do valor do item ser abatido ou incorporado
  fNovoSaldoDev := fSaldoDev;


  cdsAux        := TCMClientDataset.Create( nil );
  cdsBuscaItens := TCMClientDataset.Create( nil );
  try

    try

       //Pendencia 19196
       // Recuperar o campo DATANASC da tabela PESSOAFISICA e passar para a regra
       sSQL :=
       'SELECT '                           + #13 +
       '  DATANASC '                       + #13 +
       'FROM '                             + #13 +
       '  PESSOAFISICA '                   + #13 +
       'WHERE '                            + #13 +
       '  IDPESSOA = '  + IntToStr(rContrato.IDBenef);

       cdsAux.Data := GetDataPacket( sSQL );

       sDataNasc := FormatDateTime('dd/mm/yyyy',cdsAux.FieldByname('DATANASC').AsDateTime);
       // Fim - Pendencia 19196


       cdsAux.Close;

       sSQL :=
       'SELECT '                           +
       '  FLGINTERNO '                     +
       'FROM '                             +
       '  SITPART '                        +
       'WHERE '                            +
       '  IDSITPART = '  + IntToStr(iIdSitPart);

       cdsAux.Data := GetDataPacket( sSQL );

       sFlgInterno := cdsAux.FieldByName('FLGINTERNO').AsString;

       cdsBuscaItens.Data := BuscaItens( rContrato.IDTipoContrEmptmo, iEvento );
       cdsBuscaItens.First;

       sValor   := '0';
       sSQL     := '';
       i        := 0;

       // Laço que calcula todos os itens
       while not( cdsBuscaItens.EOF ) do
       begin

          SetLength(vSQL, i + 1); // array dinâmico

          sSQL :=
          'SELECT '                                                                                             +

          '  ' + IntToStr(iEvento)                                                   + ' AS HMETIPOMOV, '       +

          '  ' + IntToStr(iOrigem)                                                   + ' AS HMEORIGEM, '        +
          '  ' + IntToStr(iOrigem)                                                   + ' AS ORIGEM, '           +
          '  ' + IntToStr(iEvento)                                                   + ' AS EVENTO, '           +

          '  ' + IntToStr(iPais)                                                     + ' AS IDPAIS, '           +
          '  ' + QuotedStr(NullToSpace(sEstado))                                     + ' AS CODESTADO, '        +
          '  ' + IntToStr(iCidade)                                                   + ' AS IDCIDADES, '        +

          '  ' + ConverteVirgulaParaPonto(fSalPart)                                  + ' AS SALPARTICIPACAO, '  +
          '  ' + ConverteVirgulaParaPonto(fSalMantido)                               + ' AS SALMANTIDO, '       +
          '  ' + ConverteVirgulaParaPonto(fSalAuxDoenca)                             + ' AS SALAUXDOENCA, '     +
          '  ' + ConverteVirgulaParaPonto(fSalBenef)                                 + ' AS SALBENEF, '         +
          '  ' + ConverteVirgulaParaPonto(fSalarioBase)                              + ' AS SALARIOBASE, '      +
          '  ' + ConverteVirgulaParaPonto(fVlrMaxPermit)                             + ' AS VLRMAXPERMIT, '     +

          '  ' + QuotedStr(NullToSpace(rContrato.SiglaIndexador))                    + ' AS NOMEINDICE, '       +

          '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                       + ' AS IDCONTRATOEMPTMO, ' +
          '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                               + ' AS IDTIPOCONTREMPTMO, ' +
          ' 0' + IntToStr(rContrato.NumParcelas)                                     + ' AS NUMPARCELAS, '      +
          '  ' + ConverteVirgulaParaPonto(rContrato.VlrParcela)                                  + ' AS VLRPRIMPARC, '      +
          '  ' + IntToStr(iParcela)                                                  + ' AS PARCATUAL, '        +
          '  ' + ConverteVirgulaParaPonto(fMargem)                                   + ' AS MARGEM, '           +
          '  ' + ConverteVirgulaParaPonto(fReserva)                                  + ' AS RESERVA, '          +
          '  ' + ConverteVirgulaParaPonto(fTxJuros)                                  + ' AS TXJUROS, '          +
          '  ' + ConverteVirgulaParaPonto(fVlrSolic)                                 + ' AS VALORSOLIC, '       +
          '  ' + ConverteVirgulaParaPonto(fNovoSaldoDev)                             + ' AS SALDODEV, '         +
          '  ' + ConverteVirgulaParaPonto(fSaldoDev)                                 + ' AS SALDODEVANT, '      +
          '  ' + ConverteVirgulaParaPonto(fSaldoEPAnt)                               + ' AS SALDOEPANT, '       +
          '  ' + ConverteVirgulaParaPonto(fVlrContratosAnt)                          + ' AS VLRCONTRATOSANT, '  +
          '  ' + ConverteVirgulaParaPonto(fVlrDividas)                               + ' AS VLRDIVIDAS, '       +
          '  ' + IntToStr(iNumParcPagas)                                             + ' AS NUMPARCPAGAS, '     +
          '  ' + IntToStr(iPrazoAnterior)                                            + ' AS PRAZOANTERIOR, '    +
          '  ' + IntToStr(iUltParcelaGerada)                                         + ' AS ULTPARCGERADA, '    +

          '  ' + IntToStr(cdsBuscaItens.FieldByName('IDITEMEMPTMO').AsInteger)       + ' AS IDITEMEMPTMO, '     +

          '  0'                                                                      + ' AS VALRECCRED, '       +
          '  ' + IntToStr(cdsBuscaItens.FieldByName('ITCSEQCALCULO').AsInteger)      + ' AS SEQCALCULO, '       +
          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY',dDataRef)))       + ' AS DATAREF, '          +
          '  ' + QuotedStr(NullToSpace(sAnoMesCompetencia))                          + ' AS COMPETENCIA, '      +

          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito)))      + ' AS DATACREDITO, '      +
          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura)))   + ' AS DATAASSIN, '        +
          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao)))    + ' AS DATAINSC, '         +
          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY', dDataAtualiza)))              + ' AS DATAULTATUALIZA, '  +
          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc)))     + ' AS DATAPRIMPARC, '     +

          '  ' + IntToStr(iIdSitPart)                                                + ' AS IDSITPART, '        +
          '  ' + IntToStr(rContrato.IDPatro)                                         + ' AS IDPESSJUR, '        + 
          '  ' + IntToStr(rContrato.IDPlanoPrev)                                     + ' AS IDPLANOPREV, '      + 
          '  ' + IntToStr(rContrato.IDBenef)                                         + ' AS IDPESSOA, '         + 
          '  ' + IntToStr(rContrato.IDPessoa)                                        + ' AS IDTITULAR, '        + 
          '  ' + FormatFloat('#0', rConcessao.IDContratoEmptmo)                      + ' AS IDCONTRATOANT, '    + 
          '  ' + IntToStr(rConcessao.Prazo)                                          + ' AS PRAZOANT, '         +
          '  ' + ConverteVirgulaParaPonto(rConcessao.ValorSolic)                                 + ' AS VALORSOLICANT, '    +
          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY', rConcessao.DataCredito)))    + ' AS DATACREDITOANT, '   + 

          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY',dDataAtraso)))                + ' AS DATAATRASO, '       +
          '  ' + ConverteVirgulaParaPonto(fValorEmAberto)                                        + ' AS VALOREMABERTO, '    +

          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY',dDataAtrasoAnt)))              + ' AS DATAATRASOANT, '    + 
          '  ' + ConverteVirgulaParaPonto(fValorProvisao)                            + ' AS VALORPROVISAO, '    +
          '  ' + ConverteVirgulaParaPonto(fValorEmAbertoAnt)                         + ' AS VALOREMABERTOANT, ' + 
          '  ' + ConverteVirgulaParaPonto(rConcessao.SaldoQuitacao)                  + ' AS SALDOQUITACAO, '    + 
          ' 1' +                                                                       ' AS SEQPROPOSTA, '      + 
          '  ' + QuotedStr(NullToSpace(sFlgInterno))                                              + ' AS FLGINTERNO, '       + 

          '  ' + IntToStr(iFinanciamento)                                            + ' AS FLGFINANCIAMENTO, ' + 

          //Pendência 22836 - 03/10/2006
          '  00'                                                                     + ' AS FLGEXCEPCIONAL, '   +
          //Fim Pendência 22836

          '  ' + IntToStr(iTipoContrQuitAnt)                                         + ' AS IDTIPOANT, '        +
          '  ' + ConverteVirgulaParaPonto(fVlrDevolSeguro)                           + ' AS VLRDEVOLSEG, '      +
          '  ' + ConverteVirgulaParaPonto(fVlrSegAnt)                                + ' AS VLRSEGANT, '        +
          '  ' + ConverteVirgulaParaPonto(fVlrSegComplAnt)                           + ' AS VLRSEGCOMPLANT, '   +

          // Pendencia 19196
          '  ' + QuotedStr(sDataNasc)                                                + ' AS DATANASC '          +
          // Pendencia 19196

          'FROM '                                                                                   +
          '  DUAL '                                                                                 +
          'ORDER BY'                                                                                +
          '  HMETIPOMOV, SEQCALCULO ';

          vSQL[i] := sSQL;

          for j := 0 to High(vSQL) do
          begin
             if j <= 0 then begin
                sSQLExec := vSQL[j];
             end
             else
             begin
                sSQLExec := Copy(sSQLExec, 0, Length(sSQLExec) - 33 ) + ' UNION ';
                sSQLExec := sSQLExec + vSQL[j];
             end;
          end;

          WebRegra.CdsDataSetIn.Close;
          WebRegra.CdsDataSetIn.Data := GetDataPacket( sSQLExec );

          WebRegra.MessageInfo := '';
          sValor := WebRegra.RegraString( cdsBuscaItens.FieldByName('IDREGRACALC').AsString, iIdEmpresaProp );
          if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );

          if (sValor = 'NULO') then
          begin
              cdsBuscaItens.Next;

              (* incrementa a variável de índice do vetor do SQL *)
              inc(i);

              Continue;
          end
          else
          begin
             SetLength(vLista, i + 1);

             //Incluído para identificar a parcela.
             vLista[i].Parcela          := rContrato.NumParcelas;

             vLista[i].CodigoItem       := cdsBuscaItens.FieldByName('IDITEMEMPTMO').AsInteger;
             vLista[i].Nome             := cdsBuscaItens.FieldByName('ITEDESCRICAO').AsString;
             vLista[i].iEvento          := cdsBuscaItens.FieldByName('ITCEVENTO').AsInteger;
             vLista[i].Origem           := iOrigem;

             vLista[i].SeqCalculo       := cdsBuscaItens.FieldByName('ITCSEQCALCULO').AsInteger;
             vLista[i].SeqCobranca      := 1;
             vLista[i].Prioridade       := cdsBuscaItens.FieldByName('ITCPRIORIDADE').AsInteger;

             vLista[i].FlgCentraliza    := cdsBuscaItens.FieldByName('FLGCENTRALIZA').AsInteger;
             vLista[i].FlgDestacado     := cdsBuscaItens.FieldByName('FLGDESTACADO').AsInteger;
             vLista[i].IdItemCentraliza := cdsBuscaItens.FieldByName('IDITEMCENTRALIZA').AsInteger;

             vLista[i].RecPag           := cdsBuscaItens.FieldByName('ITCRECPAG').AsString;

             vLista[i].Regra            := cdsBuscaItens.FieldByName('IDREGRACALC').AsInteger;

             vLista[i].FlgGravaZERO     := (cdsBuscaItens.FieldByName('FLGGRAVAZERO').AsInteger = 1);

             if (sValor <> 'NULO') then
             begin
                vLista[i].Valor    := StrToFloat(ConverteVirg(sValor))
             end
             else
             begin
                vLista[i].Valor    := 0;
             end;
          end;

          // calcula o novo saldo devedor
          case cdsBuscaItens.FieldByName('ITCTRATASALDODEV').AsInteger of
             0: begin (* Não Tratar *) end;
             1: fNovoSaldoDev := fNovoSaldoDev - vLista[i].Valor; (* Abater *)
             2: fNovoSaldoDev := fNovoSaldoDev + vLista[i].Valor; (* Incorporar *)
          end;

          if bAlteraSaldoDev then
          begin
             vLista[i].SaldoDevedor     := fNovoSaldoDev;
          end
          else
          begin
             vLista[i].SaldoDevedor     := fSaldoDev;
          end;

          vLista[i].TxJuros          := fTxJuros;

          vLista[i].FormaCobranca    := sFormaCobranca;

          vLista[i].FlgEnvio         := 0;
          vLista[i].FlgBaixado       := 0;
          vLista[i].FlgDivergPend    := -1;

          (* Armazeno no Vetor que será o Result da função a PRIORIDADE do item *)

          (* Armazeno no Vetor que será o Result da função a RUBRICA do item *)
          if not cdsBuscaItens.FieldByName('IDPROVENTON').IsNull then
             vLista[i].Rubrica          := cdsBuscaItens.FieldByName('IDPROVENTON').AsInteger
          else
             vLista[i].Rubrica          := -1;

          (* Depois de executada a Regra a variável sValor já tem o VALOR do item
             calculado, logo é atualizado este valor na linha de SQL do vetor vSQL
             que acabou de ser executada pela regra.  Antes da execução o valor é
             passado como ZERO *)

          sSQL :=
          'SELECT '                                                                                 +

          '  ' + IntToStr(iEvento)                                                   + ' AS HMETIPOMOV, '       +
          '  ' + IntToStr(iOrigem)                                                   + ' AS HMEORIGEM, '        +
          '  ' + IntToStr(iOrigem)                                                   + ' AS ORIGEM, '           +
          '  ' + IntToStr(iEvento)                                                   + ' AS EVENTO, '           +

          '  ' + IntToStr(iPais)                                                     + ' AS IDPAIS, '           +
          '  ' + QuotedStr(NullToSpace(sEstado))                                                  + ' AS CODESTADO, '        +
          '  ' + IntToStr(iCidade)                                                   + ' AS IDCIDADES, '        +

          '  ' + ConverteVirgulaParaPonto(fSalPart)                                              + ' AS SALPARTICIPACAO, '  +
          '  ' + ConverteVirgulaParaPonto(fSalMantido)                                           + ' AS SALMANTIDO, '       +
          '  ' + ConverteVirgulaParaPonto(fSalAuxDoenca)                                         + ' AS SALAUXDOENCA, '     +
          '  ' + ConverteVirgulaParaPonto(fSalBenef)                                             + ' AS SALBENEF, '         +
          '  ' + ConverteVirgulaParaPonto(fSalarioBase)                                          + ' AS SALARIOBASE, '      +
          '  ' + ConverteVirgulaParaPonto(fVlrMaxPermit)                                         + ' AS VLRMAXPERMIT, '     +

          '  ' + QuotedStr(NullToSpace(rContrato.SiglaIndexador))                                 + ' AS NOMEINDICE, '       + 

          '  ' + FormatFloat('#0', rContrato.IDContratoEmptmo)                       + ' AS IDCONTRATOEMPTMO, ' + 
          '  ' + IntToStr(rContrato.IDTipoContrEmptmo)                               + ' AS IDTIPOCONTREMPTMO, ' +
          ' 0' + IntToStr(rContrato.NumParcelas)                                     + ' AS NUMPARCELAS, '      +
          '  ' + ConverteVirgulaParaPonto(rContrato.VlrParcela)                                  + ' AS VLRPRIMPARC, '      +
          '  ' + IntToStr(iParcela)                                                  + ' AS PARCATUAL, '        +
          '  ' + ConverteVirgulaParaPonto(fMargem)                                               + ' AS MARGEM, '           +
          '  ' + ConverteVirgulaParaPonto(fReserva)                                              + ' AS RESERVA, '          +
          '  ' + ConverteVirgulaParaPonto(fTxJuros)                                              + ' AS TXJUROS, '          +
          '  ' + ConverteVirgulaParaPonto(fVlrSolic)                                             + ' AS VALORSOLIC, '       +
          '  ' + ConverteVirgulaParaPonto(fNovoSaldoDev)                                         + ' AS SALDODEV, '         +
          '  ' + ConverteVirgulaParaPonto(fSaldoDev)                                             + ' AS SALDODEVANT, '      +
          '  ' + ConverteVirgulaParaPonto(fSaldoEPAnt)                                           + ' AS SALDOEPANT, '       +
          '  ' + ConverteVirgulaParaPonto(fVlrContratosAnt)                                      + ' AS VLRCONTRATOSANT, '  +
          '  ' + ConverteVirgulaParaPonto(fVlrDividas)                                           + ' AS VLRDIVIDAS, '       +
          '  ' + IntToStr(iPrazoAnterior)                                            + ' AS PRAZOANTERIOR, '    + 
          '  ' + IntToStr(iUltParcelaGerada)                                         + ' AS ULTPARCGERADA, '    + 
          '  ' + IntToStr(iNumParcPagas)                                             + ' AS NUMPARCPAGAS, '     + 

          '  ' + IntToStr(cdsBuscaItens.FieldByName('IDITEMEMPTMO').AsInteger)       + ' AS IDITEMEMPTMO, '     +

          (* sValor é o valor retornado pela regra do item Anterior *)
          '  ' + sValor                                                              + ' AS VALRECCRED, '       + 
          '  ' + IntToStr(cdsBuscaItens.FieldByName('ITCSEQCALCULO').AsInteger)      + ' AS SEQCALCULO, '       + 
          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY', dDataRef)))                   + ' AS DATAREF, '          +
          '  ' + QuotedStr(NullToSpace(sAnoMesCompetencia))                                       + ' AS COMPETENCIA, '      +

          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY', rContrato.DataCredito)))      + ' AS DATACREDITO, '      +
          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY', rContrato.DataAssinatura)))   + ' AS DATAASSIN, '        +
          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY', rContrato.DataInscricao)))    + ' AS DATAINSC, '         +
          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY', dDataAtualiza)))              + ' AS DATAULTATUALIZA, '  +
          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY', rContrato.DataPrimParc)))     + ' AS DATAPRIMPARC, '     +

          '  ' + IntToStr(iIdSitPart)                                                + ' AS IDSITPART, '        + 
          '  ' + IntToStr(rContrato.IDPatro)                                         + ' AS IDPESSJUR, '        + 
          '  ' + IntToStr(rContrato.IDPlanoPrev)                                     + ' AS IDPLANOPREV, '      +
          '  ' + IntToStr(rContrato.IDBenef)                                         + ' AS IDPESSOA, '         + 
          '  ' + IntToStr(rContrato.IDPessoa)                                        + ' AS IDTITULAR, '        + 
          '  ' + FormatFloat('#0', rConcessao.IDContratoEmptmo)                      + ' AS IDCONTRATOANT, '    + 
          '  ' + IntToStr(rConcessao.Prazo)                                          + ' AS PRAZOANT, '         +
          '  ' + ConverteVirgulaParaPonto(rConcessao.ValorSolic)                                 + ' AS VALORSOLICANT, '    +
          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY', rConcessao.DataCredito)))     + ' AS DATACREDITOANT, '   + 

          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY',dDataAtraso)))                 + ' AS DATAATRASO, '       + 
          '  ' + ConverteVirgulaParaPonto(fValorEmAberto)                                        + ' AS VALOREMABE, '   +

          '  ' + QuotedStr(NullToSpace(FormatDateTime('DD/MM/YYYY',dDataAtrasoAnt)))              + ' AS DATAATRASOANT, '    +
          '  ' + ConverteVirgulaParaPonto(fValorProvisao)                                        + ' AS VALORPROVISAO, '    +
          '  ' + ConverteVirgulaParaPonto(fValorEmAbertoAnt)                                     + ' AS VALOREMABERTOANT , ' +
          '  ' + ConverteVirgulaParaPonto(rConcessao.SaldoQuitacao)                              + ' AS SALDOQUITACAO, '    +
          ' 1' +                                                                       ' AS SEQPROPOSTA, '      +
          '  ' + QuotedStr(NullToSpace(sFlgInterno))                                              + ' AS FLGINTERNO, '       +

          '  ' + IntToStr(iFinanciamento)                                            + ' AS FLGFINANCIAMENTO, ' +

          //Pendência 22836 - 03/10/2006
          '  00'                                                                     + ' AS FLGEXCEPCIONAL, '   +
          //Fim Pendência 22836

          '  ' + IntToStr(iTipoContrQuitAnt)                                         + ' AS IDTIPOANT, '        +
          '  ' + ConverteVirgulaParaPonto(fVlrDevolSeguro)                                       + ' AS VLRDEVOLSEG, '      +
          '  ' + ConverteVirgulaParaPonto(fVlrSegAnt)                                            + ' AS VLRSEGANT, '        +
          '  ' + ConverteVirgulaParaPonto(fVlrSegComplAnt)                                       + ' AS VLRSEGCOMPLANT, '   +

          // Pendencia 19196
          '  ' + QuotedStr(sDataNasc)                                                + ' AS DATANASC '          +
          // Pendencia 19196

          'FROM '                                                                                               +
          '  DUAL '                                                                                             +
          'ORDER BY'                                                                                            +
          '  HMETIPOMOV, SEQCALCULO';


          vSQL[i] := sSQL;

          (* incrementa a variável de índice do vetor *)
          inc(i);

          cdsBuscaItens.Next;

       end; (* while *)

   except
     Result := False;
     raise;
   end;

  finally
    cdsAux.Free;
    cdsBuscaItens.Free;
  end;

end;

function TCtrlWebEmprestimo.ListaItemToDataPacket(vLista: TListaItem): OLEVariant;
var
  i : integer;
  sSQL : string;
begin

  sSQL := '';
  for i := 0 to High( vLista ) do
  begin

    if sSQL <> '' then sSQL := sSQL + ' union ';

    sSQL := sSQL +
     ' select                                                                                                                                ' +
       ConverteVirgulaParaPonto(                 vLista[i].IDHistMovEmptmo                     ) + ' as IDHistMovEmptmo                    , ' +
       IntToStr(                                 vLista[i].CodigoItem                          ) + ' as CodigoItem                         , ' +
       IntToStr(                                 vLista[i].Regra                               ) + ' as Regra                              , ' +
       IntToStr(                                 vLista[i].Rubrica                             ) + ' as Rubrica                            , ' +
       IntToStr(                                 vLista[i].iEvento                             ) + ' as iEvento                            , ' +
       IntToStr(                                 vLista[i].FlgEnvio                            ) + ' as FlgEnvio                           , ' +
       IntToStr(                                 vLista[i].FlgBaixado                          ) + ' as FlgBaixado                         , ' +
       QuotedStr( NullToSpace(                   vLista[i].Nome                              ) ) + ' as Nome                               , ' +
       QuotedStr( NullToSpace(                   vLista[i].RecPag                            ) ) + ' as RecPag                             , ' +
       QuotedStr( NullToSpace(                   vLista[i].FormaCobranca                     ) ) + ' as FormaCobranca                      , ' +
       QuotedStr( NullToSpace(                   vLista[i].TipoFolha                         ) ) + ' as TipoFolha                          , ' +
       IntToStr(                                 vLista[i].Parcela                             ) + ' as Parcela                            , ' +
       IntToStr(                                 vLista[i].Origem                              ) + ' as Origem                             , ' +
       IntToStr(                                 vLista[i].Prioridade                          ) + ' as Prioridade                         , ' +
       IntToStr(                                 vLista[i].SeqCalculo                          ) + ' as SeqCalculo                         , ' +
       IntToStr(                                 vLista[i].SeqCobranca                         ) + ' as SeqCobranca                        , ' +
       IntToStr(                                 vLista[i].FlgCentraliza                       ) + ' as FlgCentraliza                      , ' +
       IntToStr(                                 vLista[i].FlgDivergPend                       ) + ' as FlgDivergPend                      , ' +
       IntToStr(                                 vLista[i].IDItemCentraliza                    ) + ' as IDItemCentraliza                   , ' +
       IntToStr(                                 vLista[i].AnoCompetencia                      ) + ' as AnoCompetencia                     , ' +
       IntToStr(                                 vLista[i].MesCompetencia                      ) + ' as MesCompetencia                     , ' +
       IntToStr(                                 vLista[i].AnoCobranca                         ) + ' as AnoCobranca                        , ' +
       IntToStr(                                 vLista[i].MesCobranca                         ) + ' as MesCobranca                        , ' +
       'to_date('''+FormatDateTime('dd/mm/yyyy', vLista[i].DataPrevista   )+''',''DD/MM/YYYY'')' + ' as DataPrevista                       , ' +
       'to_date('''+FormatDateTime('dd/mm/yyyy', vLista[i].DataVencto     )+''',''DD/MM/YYYY'')' + ' as DataVencto                         , ' +
       'to_date('''+FormatDateTime('dd/mm/yyyy', vLista[i].DataEfetiva    )+''',''DD/MM/YYYY'')' + ' as DataEfetiva                        , ' +
       'to_date('''+FormatDateTime('dd/mm/yyyy', vLista[i].DataUltAtualiza)+''',''DD/MM/YYYY'')' + ' as DataUltAtualiza                    , ' +
       'to_date('''+FormatDateTime('dd/mm/yyyy', vLista[i].DataReceb      )+''',''DD/MM/YYYY'')' + ' as DataReceb                          , ' +
       ConverteVirgulaParaPonto(                 vLista[i].Valor                               ) + ' as Valor                              , ' +
       ConverteVirgulaParaPonto(                 vLista[i].SaldoDevedor                        ) + ' as SaldoDevedor                       , ' +
       ConverteVirgulaParaPonto(                 vLista[i].TxJuros                             ) + ' as TxJuros                            , ' +
       ConverteVirgulaParaPonto(                 vLista[i].TxJurosAnt                          ) + ' as TxJurosAnt                         , ' +
       IntToStr(                                 vLista[i].ParcResta                           ) + ' as ParcResta                          , ' +
       IntToStr(                                 vLista[i].FlgDestacado                        ) + ' as FlgDestacado                       , ' +
       ConverteVirgulaParaPonto(                 vLista[i].ValorEfetivo                        ) + ' as ValorEfetivo                       , ' +
       IntToStr(                                 vLista[i].FlgTipoDiverg                       ) + ' as FlgTipoDiverg                      , ' +
       iff(                                      vLista[i].FlgGravaZERO, '1', '0'              ) + ' as FlgGravaZERO                       , ' +
       ConverteVirgulaParaPonto(                 vLista[i].ValorBase                           ) + ' as ValorBase                            ' +
     ' from DUAL                                                                                                                             ' ;

  end;

  Result := GetDataPacket( sSQL );

end;

procedure TCtrlWebEmprestimo.DataPacketToListaItem( oData          : OLEVariant;
                                                    iNumParcelas   : integer;
                                                    sFormaCobranca : string;
                                                    var vLista     : TListaItem);
var
  cdsLocal : TCMClientDataset;
begin
  cdsLocal := TCMClientDataset.Create( nil );
  try
    cdsLocal.Data := oData;

    cdsLocal.First;
    while not cdsLocal.Eof do
    begin

      if cdsLocal.FieldByName('Parcela').AsInteger = iNumParcelas then
      begin
        SetLength( vLista, length( vLista ) + 1 );
        vLista[High(vLista)].IDHistMovEmptmo  := cdsLocal.FieldByName('IDHistMovEmptmo').AsCurrency;
        vLista[High(vLista)].CodigoItem       := cdsLocal.FieldByName('CodigoItem').AsInteger;
        vLista[High(vLista)].Regra            := cdsLocal.FieldByName('Regra').AsInteger;
        vLista[High(vLista)].Rubrica          := cdsLocal.FieldByName('Rubrica').AsInteger;
        vLista[High(vLista)].iEvento          := cdsLocal.FieldByName('iEvento').AsInteger;
        vLista[High(vLista)].FlgEnvio         := cdsLocal.FieldByName('FlgEnvio').AsInteger;
        vLista[High(vLista)].FlgBaixado       := cdsLocal.FieldByName('FlgBaixado').AsInteger;
        vLista[High(vLista)].Nome             := cdsLocal.FieldByName('Nome').AsString;
        vLista[High(vLista)].RecPag           := cdsLocal.FieldByName('RecPag').AsString;
        vLista[High(vLista)].FormaCobranca    := sFormaCobranca;
        vLista[High(vLista)].TipoFolha        := cdsLocal.FieldByName('TipoFolha').AsString;
        vLista[High(vLista)].Parcela          := cdsLocal.FieldByName('Parcela').AsInteger;
        vLista[High(vLista)].Origem           := cdsLocal.FieldByName('Origem').AsInteger;
        vLista[High(vLista)].Prioridade       := cdsLocal.FieldByName('Prioridade').AsInteger;
        vLista[High(vLista)].SeqCalculo       := cdsLocal.FieldByName('SeqCalculo').AsInteger;
        vLista[High(vLista)].SeqCobranca      := cdsLocal.FieldByName('SeqCobranca').AsInteger;
        vLista[High(vLista)].FlgCentraliza    := cdsLocal.FieldByName('FlgCentraliza').AsInteger;
        vLista[High(vLista)].FlgDivergPend    := cdsLocal.FieldByName('FlgDivergPend').AsInteger;
        vLista[High(vLista)].IDItemCentraliza := cdsLocal.FieldByName('IDItemCentraliza').AsInteger;
        vLista[High(vLista)].AnoCompetencia   := cdsLocal.FieldByName('AnoCompetencia').AsInteger;
        vLista[High(vLista)].MesCompetencia   := cdsLocal.FieldByName('MesCompetencia').AsInteger;
        vLista[High(vLista)].AnoCobranca      := cdsLocal.FieldByName('AnoCobranca').AsInteger;
        vLista[High(vLista)].MesCobranca      := cdsLocal.FieldByName('MesCobranca').AsInteger;
        vLista[High(vLista)].DataPrevista     := cdsLocal.FieldByName('DataPrevista').AsDateTime;
        vLista[High(vLista)].DataVencto       := cdsLocal.FieldByName('DataVencto').AsDateTime;
        vLista[High(vLista)].DataEfetiva      := cdsLocal.FieldByName('DataEfetiva').AsDateTime;
        vLista[High(vLista)].DataUltAtualiza  := cdsLocal.FieldByName('DataUltAtualiza').AsDateTime;
        vLista[High(vLista)].DataReceb        := cdsLocal.FieldByName('DataReceb').AsDateTime;
        vLista[High(vLista)].Valor            := cdsLocal.FieldByName('Valor').AsCurrency;
        vLista[High(vLista)].SaldoDevedor     := cdsLocal.FieldByName('SaldoDevedor').AsCurrency;
        vLista[High(vLista)].TxJuros          := cdsLocal.FieldByName('TxJuros').AsCurrency;
        vLista[High(vLista)].TxJurosAnt       := cdsLocal.FieldByName('TxJurosAnt').AsCurrency;
        vLista[High(vLista)].ParcResta        := cdsLocal.FieldByName('ParcResta').AsInteger;
        vLista[High(vLista)].FlgDestacado     := cdsLocal.FieldByName('FlgDestacado').AsInteger;
        vLista[High(vLista)].ValorEfetivo     := cdsLocal.FieldByName('ValorEfetivo').AsCurrency;
        vLista[High(vLista)].FlgTipoDiverg    := cdsLocal.FieldByName('FlgTipoDiverg').AsInteger;
        vLista[High(vLista)].FlgGravaZERO     := ( cdsLocal.FieldByName('FlgGravaZERO').AsInteger = 1 );
        vLista[High(vLista)].ValorBase        := cdsLocal.FieldByName('ValorBase').AsCurrency;
      end;

      cdsLocal.Next;
    end;

  finally
    cdsLocal.Free;
  end;      
end;

function TCtrlWebEmprestimo.AtualizaFlgSituacao(ID: Extended;
  sTabela: String; cSituacao: Char): Boolean;
var
  sSQL     : String;
begin
  (* função que Atualiza a Situação (FLGSITUACAO):

   **********************************************************************
   *  da Tabela Inscrição para                                          *
   *                                                                    *
   *  'A' -> 'Ativa'                  -> Disponível                     *
   *  'C' -> 'Cancelada'              -> Cancelada pelo usuário         *
   *  'E' -> 'Contrato Associado'     -> Já utilizada em contrato       *
   *  'R' -> 'Rejeitada'              -> Rejeitada                      *
   *  'Q' -> 'Encerrada/Ctr. Quitado' -> Encerrada ou Contrato Quitado  *
   **********************************************************************
   *  da Tabela Contrato para                                           *
   *                                                                    *
   *  'A' -> 'Ativo'             -> Em curso normal                     *
   *  'C' -> 'Cancelado'         -> por opção do usuário                *
   *  'E' -> 'Encerrado'         -> por quitacao no prazo normal        *
   *  'R' -> 'Refinanciado'      -> Refinanciado                        *
   *  'Q' -> 'Quitado'           -> por quitacao solicitada             *
   *  'S' -> 'Suspenso'          -> Inadimplencia                       *
   *  'K' -> 'Pend. de Quitação' -> Envio p/ cobrança                   *
   **********************************************************************)

  (* Cria e Abre a Query Auxiliar *)

  Result := False;

  sSQL :=
  'UPDATE '                                    + #13 +
  '  ' + sTabela + ' '                         + #13 +
  'SET '                                       + #13 +
  '  FLGSITUACAO = ' + QuotedStr(cSituacao)    + #13 +
  'WHERE '                                     + #13 +
  '  ID' + sTabela + ' = ' + FormatFloat('#0', ID);

  try
    ExecSQL( sSQL );
    Result := True;
  except
    on E:Exception do
    begin
      MessageInfo := E.Message;
      Result := False;
    end;
  end;

end;

function TCtrlWebEmprestimo.InscreveEmptmo( iIdTipoContrEmptmo,
                                            iIdTipoEmptmo,
                                            iIdPatro,
                                            iIdPlanoPrev,
                                            iIdTitular,
                                            iIdBenef,
                                            iParcelas,
                                            iIdEmpresaProp : integer;
                                            sFLGFORMAPAG,
                                            sFLGFORMAREC,
                                            sCODFORMAPAGTO,
                                            sPORTFORMAPAGTO,
                                            sPORTFORMARECTO,
                                            sContaBancariaPag,
                                            sContaBancariaRec,
                                            sMoeCodigo : string;
                                            dDtCredito :TDateTime;
                                            fVlrSolicitado,
                                            fVLRSALBASE,
                                            fMargem,
                                            fVlrMaxPermit,
                                            fTxJuros : Currency;
                                            iIdAvalista : integer;
                                            sBeneficiarios : string;
                                            bTransacao : boolean;
                                            oItens : OLEVariant ) : extended;
var
  cdsLocal,
  cdsAux : TCMClientDataset;
  iIdInscricaoEmptmo,
  iIdHistMovInsc,
  iIdBenefSeguro : extended;
  iIdItemEmptmo,
  iIdRegraCalc : integer;
  bOk : boolean;
  sTodosBenef, sBenef, sNomeBenef, sPercBenef, sDDDBenef, sTelBenef : string;
begin

  Result := -1;

  cdsLocal := TCMClientDataset.Create( nil );
  cdsAux   := TCMClientDataset.Create( nil );
  try

    if bTransacao then StartTransaction;
    try

      //Valida inscrição
      if not ValidaInscricao( iIdTitular,
                              iIdTipoEmptmo,
                              0,
                              iIdEmpresaProp ) then
        raise Exception.Create('Não foi possível realizar esta inscrição.');

      //Cria o ID da inscrição
      iIdInscricaoEmptmo := LeUltRegistro( 'INSCRICAOEMPTMO' );

      //Insere a inscrição
      if ExecSQL(
           ' insert into INSCRICAOEMPTMO ' +
           ' ( ' +
           ' IDINSCRICAOEMPTMO, ' +
           ' IDTIPOCONTREMPTMO, ' +
           ' IDPESSOA, ' +
           ' IDPATRO, ' +
           ' IDPLANOPREV, ' +
           ' IDBENEF, ' +
           ' FLGSITUACAO, ' +
           ' FLGFORMAPAG, ' +
           ' IDCBANCARIA, ' +
           ' FLGFORMAREC, ' +
           ' IDCBANCARIADEB, ' +
           ' CODFORMAPAG, ' +
           ' PORTFORMAPAG, ' +
           ' PORTFORMAREC, ' +
           ' NUMPARCELAS, ' +
           ' MOECODIGO, ' +
           ' FLGINTERNET, ' +
           ' DATACREDITO, ' +
           ' VLRSOLIC, ' +
           ' VLRSALBASE, ' +
           ' VLRMARGEM, ' +
           ' VLRMAXPERMIT, ' +
           ' DATAINSC, ' +
           ' TXJUROS ' +
           ' ) values ( ' +
           ConverteVirgulaParaPonto( iIdInscricaoEmptmo ) + ', ' +
           ConverteVirgulaParaPonto( iIdTipoContrEmptmo ) + ', ' +
           IntToStr( iIdTitular ) + ', ' +
           IntToStr( iIdPatro ) + ', ' +
           IntToStr( iIdPlanoPrev ) + ', ' +
           IntToStr( iIdBenef ) + ', ' +
           QuotedStr( 'A' ) + ', ' +
           QuotedStr( sFLGFORMAPAG ) + ', ' +
           QuotedStr( sContaBancariaPag ) + ', ' +
           QuotedStr( sFLGFORMAREC ) + ', ' +
           QuotedStr( sContaBancariaRec ) + ', ' +
           QuotedStr( sCODFORMAPAGTO ) + ', ' +
           QuotedStr( sPORTFORMAPAGTO ) + ', ' +
           QuotedStr( sPORTFORMARECTO ) + ', ' +
           IntToStr( iParcelas ) + ', ' +
           QuotedStr( sMoeCodigo ) + ', ' +
           QuotedStr( '1' ) + ', ' +
           ' to_date( ''' + FormatDateTime( 'dd/mm/yyyy', dDtCredito ) + ''', ''DD/MM/YYYY'' ) ' + ', ' +
           ConverteVirgulaParaPonto( fVlrSolicitado ) + ', ' +
           ConverteVirgulaParaPonto( fVLRSALBASE ) + ', ' +
           ConverteVirgulaParaPonto( fMargem ) + ', ' +
           ConverteVirgulaParaPonto( fVlrMaxPermit ) + ', ' +
           ' sysdate, ' +
           ConverteVirgulaParaPonto( fTxJuros ) +
           ' ) ' ) then
      begin

        //---------- Início da Inclusão dos Itens
        //Prepara o dataset
        cdsLocal.Data := oItens;

        bOk := True;

        //Loop dos itens
        cdsLocal.First;
        while ( not cdsLocal.Eof ) and bOk do
        begin
          iIdHistMovInsc := LeUltRegistro( 'HISTMOVINSCRICAO' );

          bOk := ExecSQL(
                   ' insert into HISTMOVINSCRICAO ' +
                   ' ( ' +
                   ' IDHISTMOVINSC, ' +
                   ' IDREGRA, ' +
                   ' IDINSCRICAOEMPTMO, ' +
                   ' IDITEMEMPTMO, ' +
                   ' HMICENTRALIZA, ' +
                   ' HMIDESTACADO, ' +
                   ' HMIVLRPREVISTO ' +
                   ' ) values ( ' +
                   ConverteVirgulaParaPonto( iIdHistMovInsc ) + ', ' +
                   cdsLocal.FieldByName('IDREGRA').AsString + ', ' +
                   ConverteVirgulaParaPonto( iIdInscricaoEmptmo ) + ', ' +
                   cdsLocal.FieldByName('IDITEMEMPTMO').AsString + ', ' +
                   ' null, ' +
                   ' null, ' +
                   ConverteVirgulaParaPonto( cdsLocal.FieldByName('HMIVLRPREVISTO').AsFloat ) +
                   ' ) ' );

          cdsLocal.Next;
        end;

        //---------- Término da Inclusão dos Itens

        if bOk then
        begin

          if iIdAvalista > 0 then
            bOk :=  ExecSQL(
                     ' insert into CONTRATOXAVALISTA ' +
                     ' ( ' +
                     ' IDINSCRICAOEMPTMO, ' +
                     ' IDAVALISTA ' +
                     ' )  values ( ' +
                     ' ( ' +
                     ConverteVirgulaParaPonto( iIdInscricaoEmptmo ) + ', ' +
                     IntToStr( iIdAvalista ) +
                     ' ) ' );

          if bOk then
          begin

            sTodosBenef := trim( sBeneficiarios );

            while ( sTodosBenef <> '' ) and bOk do
            begin
              iIdBenefSeguro := LeUltRegistro( 'CONTRATOXBENEFSEG' );

              sBenef     := RetiraPrimeiroElemento( sTodosBenef, ';' );
              sNomeBenef := RetiraPrimeiroElemento( sBenef, '%' );
              sPercBenef := RetiraPrimeiroElemento( sBenef, '%' );
              sDDDBenef  := RetiraPrimeiroElemento( sBenef, '%' );
              sTelBenef  := sBenef;

              bOk :=  ExecSQL(
               ' insert into CONTRATOXBENEFSEG ' +
               ' ( ' +
               ' IDINSCRICAOEMPTMO, ' +
               ' IDBENEFSEGURO, ' +
               ' PERCINDENIZACAO, ' +
               ' NOME, ' +
               ' OBS ' +
               ' )  values ( ' +
               ConverteVirgulaParaPonto( iIdInscricaoEmptmo ) + ', ' +
               ConverteVirgulaParaPonto( iIdBenefSeguro ) + ', ' +
               sPercBenef + ', ' +
               QuotedStr( sNomeBenef ) + ', ' +
               QuotedStr( 'tel. ' +
                          StrPadLeft( sDDDBenef,  5, ' ' ) +
                          StrPadLeft( sTelBenef,  9, ' ' ) + ' / ' ) +
               ' ) ' );

            end;


            if bOk then
            begin

              if bTransacao then Commit;

              Result := iIdInscricaoEmptmo;

            end; {if bOk then}

          end; {if bOk then}

        end; {if bOk then}

      end; { if ExecSQL( ' insert into INSCRICAOEMPTMO ' }

    except
      if bTransacao then Rollback;
      raise;
    end;

  finally
    cdsLocal.Free;
    cdsAux.Free;
  end;

end;

function TCtrlWebEmprestimo.Beneficiarios( iIdInscricaoEmptmo : extended ) : OLEVariant;
begin
  Result := GetDataPacket(
   ' select NOME,               ' +
   '        PERCINDENIZACAO,    ' +
   '        OBS                 ' +   
   ' from   CONTRATOXBENEFSEG   ' +
   ' where  IDINSCRICAOEMPTMO = ' + ConverteVirgulaParaPonto( iIdInscricaoEmptmo ) );
end;

function TCtrlWebEmprestimo.VerificaContratoAtivo(IDTitular, IDMutuario: Int64; IDTipoContr: Integer; IDContrato  : Extended ): Boolean;
var
  sSQL     : String;
  cdsAux   : TCMClientDataset;
begin
  cdsAux               := TCMClientDataset.Create( nil );
  try
    sSQL :=
    'SELECT '                                                         + #13 +
    '  CNT.IDCONTRATOEMPTMO '                                         + #13 +
    'FROM '                                                           + #13 +
    '  CONTRATOEMPTMO CNT '                                           + #13 +
    'WHERE '                                                          + #13 +
    '      CNT.IDPESSOA          = ' + IntToStr(IDTitular)            + #13 +
    '  AND CNT.IDBENEF           = ' + IntToStr(IDMutuario)           + #13 +
    '  AND CNT.IDTIPOCONTREMPTMO = ' + IntToStr(IDTipoContr)          + #13 +
    '  AND CNT.IDCONTRATOEMPTMO <> ' + FormatFloat('#0', IDContrato)  + #13 +
    '  AND CNT.FLGSITUACAO       NOT IN (''C'', ''K'', ''Q'') ';

    cdsAux.Data := GetDataPacket( sSQL );

    // -------------------------------------------------------------------------------------------

    if not( cdsAux.IsEmpty ) then
    begin
      Result := False;
      raise Exception.Create(' Participante não poderá solicitar outro empréstimo pois possui outro do mesmo tipo já ativo.' );
    end;

    Result := True;

  finally
    cdsAux.Free;
  end;
end;

function TCtrlWebEmprestimo.TotalizaProvPerda( IDContratoEmptmo, iIDITEMPROVPERDA : Extended ) : Currency;
var
  cdsLocal : TCMClientDataset;
begin
  cdsLocal := TCMClientDataset.Create( nil );
  try
    cdsLocal.Data := GetDataPacket(
     ' SELECT ' +
     '    SUM(HME.HMEVLRPREVISTO) AS VLR_TOTAL ' +
     ' FROM ' +
     '    HISTMOVEMPTMO HME ' +
     ' WHERE ' +
     '        HME.IDCONTRATOEMPTMO      = ' + ConverteVirgulaParaPonto( IDContratoEmptmo ) +
     '    AND HME.IDITEMEMPTMO          = ' + ConverteVirgulaParaPonto( iIDITEMPROVPERDA ) +
     '    AND NVL(HME.FLGESTORNADO, 0)  = 0 ' +
     '    AND NVL(HME.FLGABONADO,   0)  = 0 ' +
     '    AND NVL(HME.FLGQUITADO,   0)  = 0 ' );

    Result := cdsLocal.FieldByName('VLR_TOTAL').AsCurrency;

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlWebEmprestimo.ItensEmAberto_fCad( iIdContratoEmptmo : extended;
                                                sAnoMesCobranca   : string    ): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' SELECT /*+INDEX(HME XIE29HISTMOVEMPTMO) */ ' +
   '    HME.IDHISTMOVEMPTMO, HME.HMEVLRPREVISTO ' +
   ' FROM ' +
   '     HISTMOVEMPTMO HME ' +
   '  WHERE ' +
   '         ( HME.IDCONTRATOEMPTMO = ' + FloatToStr( iIdContratoEmptmo ) + ' ) ' +
   '     AND ( HME.HMETIPOMOV       NOT IN (0, 5, 8) ) ' +
   '     AND ( HME.HMEVLREFETIVO    IS NULL ) ' +
   '     AND ( HME.HMEDATAEFETIVA   IS NULL ) ' +
   '     AND ( HME.FLGBAIXADO = 0 ) ' +
   '     AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO     = 1) ) ' +
   '     AND NVL(HME.FLGESTORNADO, 0)  = 0 ' +
   '     AND NVL(HME.FLGSUSPENSAO, 0)  = 0 ' +
   '     AND NVL(HME.FLGQUITADO, 0)    = 0 ' +
   '     AND NVL(HME.FLGABONADO, 0)    = 0 ' +
   '     AND ( (RTRIM(LTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) || ' +
   '           (RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00''))))  < ' + QuotedStr( sAnoMesCobranca ) + ' )';

  Result := GetDataPacket( sSQL );   
end;

function TCtrlWebEmprestimo.TipoContrEmptmo: OLEVariant;
begin
  Result := GetDataPacket( ' select * from tipocontremptmo ' );
end;

function TCtrlWebEmprestimo.TipoEmptmo: OLEVariant;
begin
  Result := GetDataPacket( ' select * from tipoemptmo ' );
end;


function TCtrlWebEmprestimo.PermiteQuitacao(const IDTipoContr, IDTipoQuit: Integer): boolean;
var
  cdsLocal : TCMClientDataset;
begin
  cdsLocal := TCMClientDataset.Create( nil );
  try
    cdsLocal.Data := GetDataPacket(
                      ' SELECT ' +
                      '    COUNT(*) AS QUANTIDADE ' +
                      ' FROM ' +
                      '    TIPOCONTRXQUIT ' +
                      ' WHERE ' +
                      '        IDTIPOCONTREMPTMO = ' + IntToStr( IDTipoContr ) +
                      '    AND IDTIPOCONTRQUIT   = ' + IntToStr( IDTipoQuit ) );

    Result := ( cdsLocal.FieldByName('QUANTIDADE').AsInteger > 0 );

  finally
    cdsLocal.Free;
  end;
end;


procedure TCtrlWebEmprestimo.VerificaQuitacao( cdsContratosAnteriores : TCMClientDataset;
                                               iTEPMAXCONTRATO : integer;
                                               bFlgExcepcional : boolean;
                                               var bContratoValido : boolean;
                                               var iQtdEPQuitado : integer;
                                               var fSaldoaQuitar : Currency );
var
   vDividasAnteriores   : array of Extended;
   i,j, indice, iTotalNotNull, iTotalContratos : Integer;
   iRecno : TBookMark;
   bPertenceVetor, bPosicao : Boolean;
begin
   indice         := 0;
   bPosicao       := False;
   bPertenceVetor := False;

  // Só faz se houver Contratos anteriores NÃO Quitados
  if not(cdsContratosAnteriores.IsEmpty) then
  begin

    SetLength( vDividasAnteriores, iTEPMAXCONTRATO );

    // Laço que varre o vetor que armazena o Id do Contrato que será quitado
    for i := 0 to High(vDividasAnteriores) do
    begin

      // Verifica se existe ID armazenado no elemento i do Vetor e se
      //   já foi encontrado a Posição vazia onde será armazenado o ID
      if ( (vDividasAnteriores[i] <= 0) and not(bPosicao) ) then
      begin
         // variável que quarda o índice do Vetor que será usado para armazenar o ID *)
         indice := i;

         // variável que armazena se foi encontrada ou não uma Posição vazia no Vetor *)
         bPosicao := True;
      end;

      // Verifica se o elemento i tem armazenado o ID do contrato selecionado
      //   pelo usuário no Grid de Dívidas Anteriores
      if vDividasAnteriores[i] = cdsContratosAnteriores.FieldByName('IDContratoEmptmo').AsFloat then
      begin
         // o ID do Contrato selecionado já pertence ao Vetor
         bPertenceVetor := True;

         // guarda a posição do vetor onde ele está armazenado
         indice := i;

         // Encontrado o elemento no vetor, deve sair do Laço(For)
         Break;
      end
      else
      begin
         // o ID do Contrato selecionado Não está armazenado no elemento
         //   i do Vetor
         bPertenceVetor := False;
      end;  // if vDividasAnteriores[i] = iIdContrato
    end;  // for i


    if ( cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger = 1 ) then
    begin

       vDividasAnteriores[indice] := cdsContratosAnteriores.FieldByName('IDContratoEmptmo').AsFloat;

       cdsContratosAnteriores.Edit;
       cdsContratosAnteriores.FieldByName('FLGESCOLHA').AsInteger := 1;
       cdsContratosAnteriores.Post;

       // ----------------------------------------------------------------------------------
       // 12/12/2005 - pendência 20511
       if bFlgExcepcional then
       begin
          if cdsContratosAnteriores.FieldByName('VLRATUAL').AsFloat > 0 then
          begin
             fSaldoaQuitar := fSaldoaQuitar + cdsContratosAnteriores.FieldByName('VLRATUAL').AsFloat;
          end;
       end
       else
       begin
          // Atualiza o Saldo a Quitar adicionando o Valor atualizado do Saldo Devedor do Contrato Selecionado
          fSaldoaQuitar := fSaldoaQuitar + cdsContratosAnteriores.FieldByName('VLRATUAL').AsFloat;
       end;
       // FIM pendência 20511
       // ----------------------------------------------------------------------------------

       // Incremento a variável Totalizadora de Contratos Quitados
       inc(iQtdEPQuitado);

    end;

    iTotalContratos := cdsContratosAnteriores.RecordCount - iQtdEPQuitado;

    // adiciona 1(o contrato atual que está sendo realizado) a variável, resultando
    //   no total de contratos que o participante terá ao final desta operação
    iTotalContratos := iTotalContratos + 1;

    // verifica se o total de contratos que o participante terá ao final da operação
    //   não excede o total Máximo permitido por Tipo de Contrato.  Caso positivo
    //   validar o Contrato para gravação *)
    if ( iTotalContratos <= iTEPMAXCONTRATO ) then
    begin
      bContratoValido := True;
    end
    else
    begin
      bContratoValido := False;
    end;  // if ( iTotalContratos <= qryTipoContratoTEPMAXCONTRATO.AsInteger )

    iTotalNotNull := 0;

    // Laço que varre o vetor e verifica quantos elementos NÃO são nulos *)
    for j := 0 to High(vDividasAnteriores) do
    begin
      if vDividasAnteriores[j] <> 0 then inc(iTotalNotNull);
    end;

  end;  // if not(qryContratosAnteriores.IsEmpty)

end;

function TCtrlWebEmprestimo.QtdeItensEmptmo( iIdTitular, iIdBenef : integer; iIDCONTRATOEMPTMO : extended = 0; iIdUltHistMovEmptmo : extended = 0 ) : integer;
var
  cdsLocal : TCMClientDataset;
  sSQL : string;
begin
  cdsLocal := TCMClientDataset.Create( nil );
  try
    sSQL :=
     ' select count (*) as QTDE                                    ' +
     '   from HISTMOVEMPTMO  h,                                    ' +
     '        CONTRATOEMPTMO c                                     ' +
     '  where c.IDCONTRATOEMPTMO = h.IDCONTRATOEMPTMO              ' +
     '    and c.IDPESSOA                = ' + IntToStr( iIdTitular ) +
     '    and c.IDBENEF                 = ' + IntToStr( iIdBenef   ) ;

    if iIDCONTRATOEMPTMO > 0  then
      sSQL := sSQL +
      ' and h.IDHISTMOVEMPTMO not in (                                                                                 ' +
      '     select h2.IDHISTMOVEMPTMO                                                                                  ' +
      '     from   HISTMOVEMPTMO  h2,                                                                                  ' +
      '            CONTRATOEMPTMO c2                                                                                   ' +
      '      where c2.IDCONTRATOEMPTMO = h2.IDCONTRATOEMPTMO                                                           ' +
      '        and h2.HMEORIGEM        = 0                                                                             ' +
      '        and c2.IDPESSOA         = ' + IntToStr( iIdTitular )                                                      +
      '        and c2.IDBENEF          = ' + IntToStr( iIdBenef   )                                                      +
      '        and ( ( ( h2.HMETIPOMOV = 3 ) and ( c2.IDCONTRQUITACAO  = ' + FloatToStr( iIDCONTRATOEMPTMO ) + ' ) )   ' +
      '         or (   ( h2.HMETIPOMOV = 0 ) and ( c2.IDCONTRATOEMPTMO = ' + FloatToStr( iIDCONTRATOEMPTMO ) + ' ) ) ) ' +
      '        and h2.IDHISTMOVEMPTMO  > ' + FloatToStr( iIdUltHistMovEmptmo ) + ' ) ';

    cdsLocal.Data := GetDataPacket( sSQL );

    Result := cdsLocal.FieldByName('QTDE').AsInteger;

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlWebEmprestimo.QtdeParcelasEmAberto( iIdTitular, iIdBenef : integer; dData : TDateTime; iIDCONTRATOEMPTMO : extended = 0 ): integer;
var
  cdsLocal : TCMClientDataset;
  iAno, iMes, iDia : word;
  sAno, sMes, sAnoMes : string;
  sSQL : string;
begin
  DecodeDate( dData, iAno, iMes, iDia );
  sAno := FormatFloat('0000',iAno);
  sMes := IntToStr(iMes);
  sAnoMes := sAno + sMes;

  cdsLocal := TCMClientDataset.Create( nil );
  try
    sSQL :=
     ' SELECT count(*) as QTDE ' +
     ' FROM ' +
     '    HISTMOVEMPTMO HME, ' +
     '    CONTRATOEMPTMO CTE ' +
     ' WHERE ' +
     '         ( HME.HMETIPOMOV       NOT IN (0, 5, 8) ) ' +
     '    AND  ( HME.HMEVLREFETIVO    IS NULL OR HME.HMEDATAEFETIVA IS NULL OR HME.FLGBAIXADO = 0) ' +
     '    AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO     = 1) ) ' +
     '    AND NVL(HME.FLGESTORNADO, 0)  = 0 ' +
     '    AND NVL(HME.FLGSUSPENSAO, 0)  = 0 ' +
     '    AND NVL(HME.FLGQUITADO, 0)    = 0 ' +
     '    AND NVL(HME.FLGABONADO, 0)    = 0 ' +
     '    AND CTE.IDCONTRATOEMPTMO      = HME.IDCONTRATOEMPTMO ' +
     '    AND ( (RTRIM(LTRIM(HME.HMEANOCOBRANCA))) || (RTRIM(LTRIM(HME.HMEMESCOBRANCA))) ) < ' + QuotedStr( sAnoMes ) +
     '    AND CTE.IDPESSOA = ' + IntToStr( iIdTitular ) +
     '    AND CTE.IDBENEF = ' + IntToStr( iIdBenef );

    if iIDCONTRATOEMPTMO > 0  then
      sSQL := sSQL + ' and CTE.IDCONTRATOEMPTMO <> ' + FloatToStr( iIDCONTRATOEMPTMO );

    cdsLocal.Data := GetDataPacket( sSQL );

    Result := cdsLocal.FieldByName('QTDE').AsInteger;

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlWebEmprestimo.UltIDHISTMOVEMPTMO: extended;
var
  cdsLocal : TCMClientDataset;
  sSQL : string;
begin
  cdsLocal := TCMClientDataset.Create( nil );
  try
    sSQL := ' select max( IDHISTMOVEMPTMO ) as ULT ' +
            '   from HISTMOVEMPTMO                 ' ;

    cdsLocal.Data := GetDataPacket( sSQL );

    Result := cdsLocal.FieldByName('ULT').AsFloat;

  finally
    cdsLocal.Free;
  end;

end;

function TCtrlWebEmprestimo.AcertaPlanoOrigem(IDContratoEmptmo,
  IDPessoa: Extended; IDPlanoPrev: Integer; bFlgExcepcional : Boolean; bUpdate: Boolean): Integer;
var
   IDMutuario     : Extended;
   IDPlanoContab  : Integer;
   cdsBenefBFCiario : TCmClientDataset;
   cdsAcertaPlano   : TCmClientDataset;
begin
  cdsBenefBFCiario := TCmClientDataset.Create( nil );
  cdsAcertaPlano   := TCmClientDataset.Create( nil );
  try

   IDMutuario := IDPessoa;

   IDPlanoContab := -1;

   //Pendências 23311 e 23312  - 25/09/2006
   if bFlgExcepcional then begin
      cdsAcertaPlano.Data := BuscaPlanoPrevOrigemFUNCEF( IDMutuario );
      if not(cdsAcertaPlano.IsEmpty) and not(cdsAcertaPlano.FieldByName('IDPLANOPREV').IsNull) then
        IDPlanoContab := cdsAcertaPlano.FieldByName('IDPLANOPREV').AsInteger
      else
        IDPlanoContab := -1;
   end;

   if IDPlanoContab = -1 then begin

      // Busca o plano contábil "correto" do mutuário na BenefBFCiario
      cdsBenefBFCiario.Data := BenefBFCiario( IDMutuario, IDPlanoPrev );

      if not(cdsBenefBFCiario.IsEmpty) and not(cdsBenefBFCiario.FieldByName('IDPLANPREVCONTAB').IsNull) then
      begin
         IDPlanoContab := cdsBenefBFCiario.FieldByName('IDPLANPREVCONTAB').AsInteger;
      end
      else
      begin
         IDPlanoContab := -1;
      end;

   end;

   Result := IDPlanoContab;

   // Faz update no contrato (IDPLANOORIGEM) com o plano contábil encontrado na BenefBFCiario
   if (bUpdate) and (IDPlanoContab > 0) then
   begin
      try
        ExecSQL(
         ' UPDATE ' +
         '   CONTRATOEMPTMO ' +
         ' SET ' +
         '   IDPLANOORIGEM    = ' + FloatToStr( IDPlanoContab ) +
         ' WHERE ' +
         '   IDCONTRATOEMPTMO = ' + FloatToStr( IDContratoEmptmo ) );
      except
         Result := -1;
      end;
   end;

  finally
    cdsBenefBFCiario.Free;
    cdsAcertaPlano.Free;
  end;
end;

function TCtrlWebEmprestimo.BenefBFCiario(iIdPessoa, iIdPlanoPrev: extended): OLEVariant;
begin
  Result := GetDataPacket(
   ' SELECT ' +
   '   IDPESSOA, ' +
   '   IDTITULAR, ' +
   '   IDPLANOORIGEM, ' +
   '   IDPLANOPREV, ' +
   '   IDPLANPREVCONTAB ' +
   ' FROM ' +
   '   BENEFBFCIARIO ' +
   ' WHERE ' +
   '       IDPESSOA    = ' + FloatToStr( iIdPessoa ) +
   '   AND IDPLANOPREV = ' + FloatToStr( iIdPlanoPrev ) );
end;

function TCtrlWebEmprestimo.PrimeiraRenovacao2006( iIdPessoa, iIdBenef, iIdTipoContrEmptmo : integer ) : boolean;
var
  cdsTemp        : TCMClientDataset;
  sSQL           : String;
begin
  Result := False;

  cdsTemp := TCMClientDataset.Create( nil );

  try
    sSQL :=
    'SELECT '                                                                                       + #13 +
    '   COUNT(IDCONTRATOEMPTMO) AS QUANT '                                                          + #13 +
    'FROM '                                                                                         + #13 +
    '   CONTRATOEMPTMO CON '                                                                        + #13 +
    'WHERE '                                                                                        + #13 +
    '       CON.FLGSITUACAO      <> (''C'') '                                                       + #13 +
    '   AND CON.DATACREDITO       > TO_DATE(''03/01/2006'', ''DD/MM/YYYY'') '                       + #13 +
    '   AND CON.IDPESSOA          = ' + FormatFloat('#0', iIdPessoa )                      + #13 +
    '   AND CON.IDBENEF           = ' + FormatFloat('#0', iIdBenef )                       + #13 +
    '   AND CON.IDTIPOCONTREMPTMO = ' + FormatFloat('#0', iIdTipoContrEmptmo );

    cdsTemp.Data := GetDataPacket( sSQL );

    Result := ( cdsTemp.FieldByName('QUANT').AsInteger = 0 );
  finally
    cdsTemp.Free;
  end;

end;

//Recupera valor máximo do empréstimo
function TCtrlWebEmprestimo.BuscaVlrSolicMax( iIdEmpresaProp,
                           iIdTipoContrEmptmo,
                           iIdPatro,
                           iIdPlanoPrev,
                           iIdPessoa,
                           iIdBenef,
                           iIdSitPart,
                           iNumParcelas : integer;
                           sFlgInterno : string;
                           fMargem,
                           fReserva,
                           fTxJuros,
                           fSaldoEPAnt,
                           fVlrContrato,
                           fVlrContratosAnt,
                           fSalParticipacao,
                           fSalMantido,
                           fSalAuxDoenca,
                           fSalBenef,
                           fSalarioBase : Currency;
                           //Pendência 26950 - 30/11/2007
                           iLote : integer;
                           dDataAssinatura,
                           dDataCredito,
                           dDataPrimParc : TDateTime;
                           iTipoCliente : Integer;
                           sContrAQuitar : string;
                           dContratosAnteriores: OleVariant ) : Currency;
                           //Fim Pendência 26950
var
  sResultado : string;
  iIdRegraCalc : integer;
  cdsTodosContratos  : TCMClientDataSet;
begin
  cdsTodosContratos := TCMClientDataSet.Create( nil );
  iIdRegraCalc := RegraItemMenorSeq( iIdTipoContrEmptmo );

  try
     cdsTodosContratos.Data := ContratosAnteriores( iIdPessoa,
                                                    iIdBenef,
                                                    -1,
                                                    iIdTipoContrEmptmo,
                                                    dDataCredito,
                                                    dDataCredito,
                                                    '','' );

  WebRegra.DatasetVlrSolicMax( iIdPatro,
                               iIdPlanoPrev,
                               iIdTipoContrEmptmo,
                               iIdPessoa,
                               iIdBenef,
                               iIdSitPart,
                               iNumParcelas,
                               sFlgInterno,
                               fMargem,
                               fReserva,
                               fTxJuros,
                               fSaldoEPAnt,
                               fVlrContrato,
                               fVlrContratosAnt,
                               fSalParticipacao,
                               fSalMantido,
                               fSalAuxDoenca,
                               fSalBenef,
                               fSalarioBase,
                                  //Pendência 26950 e 26951 - 30/11/2007
                                  iLote,
                                  dDataAssinatura,
                                  dDataCredito,
                                  dDataPrimParc,
                                  iTipoCliente,
                                  sContrAQuitar,
                                  dContratosAnteriores,
                                  cdsTodosContratos.Data );
                                  //Fim Pendência 26950 e 26951

  WebRegra.MessageInfo := '';
  sResultado := trim( UpperCase( WebRegra.RegraString(
                IntToStr( iIdRegraCalc ), iIdEmpresaProp ) ) );
  if WebRegra.MessageInfo <> '' then raise Exception.Create( WebRegra.MessageInfo );

  if ( sResultado <> '' ) and ( sResultado <> 'NULO' )then
    Result := StrToFloat( ConvertePontoParaVirgulaStr( sResultado ) )
  else
    Result := 0;
  finally
     cdsTodosContratos.Free;
  end;
end {BuscaVlrSolicMax};

//Pendência 23733 - 19/12/2006
function TCtrlWebEmprestimo.ValidaTipoContratoEmprestimo(ContratosAnt : OLEVariant;
                                                         iIdEmpresaProp,
                                                         iIDTITULAR,
                                                         iIDBENEF,
                                                         iIDTIPOCONTREMPTMO,
                                                         iIDREGRATIPOCONTR : Integer
                                                        ) : Boolean;
var
   iContador  : Integer;
   sSQL,
   sResultado : String;

   cdsContratosAnteriores : TCMClientDataSet;
begin

   cdsContratosAnteriores := TCMClientDataSet.Create( nil );

   cdsContratosAnteriores.Data := ContratosAnt;
   cdsContratosAnteriores.Data := CopyClientDataSet( cdsContratosAnteriores );
   cdsContratosAnteriores.First;

   iContador := 0;

   // Monta cabeçalho cds

   sSQL :=
   'SELECT '                                                   + #13 +
   IntToStr(iContador)              + ' AS TIPO, '             + #13 +
   '-1'                             + ' AS IDCONTRATOEMPTMO,'  + #13 +
   IntToStr(iIDTITULAR)             + ' AS IDTITULAR, '        + #13 +
   IntToStr(iIDBENEF)               + ' AS IDBENEF, '          + #13 +
   IntToStr(iIDTIPOCONTREMPTMO)     + ' AS IDTIPOCONTREMPTMO ' + #13 +
   'FROM DUAL '                                                   + #13;

   while not( cdsContratosAnteriores.EOF ) do
   begin

      // Monta cds

      Inc(iContador);

      with cdsContratosAnteriores do
        sSQL := sSQL + 'UNION ' + #13 +
        'SELECT '                                                                         + #13 +
        IntToStr(iContador)                       + ' AS TIPO, '             + #13 +
        FieldByName('IDCONTRATOEMPTMO').AsString  + ' AS IDCONTRATOEMPTMO,'  + #13 +
        IntToStr(iIDTITULAR)                      + ' AS IDTITULAR, '        + #13 +
        IntToStr(iIDBENEF)                        + ' AS IDBENEF, '          + #13 +
        FieldByName('IDTIPOCONTREMPTMO').AsString + ' AS IDTIPOCONTREMPTMO ' + #13 +
        'FROM DUAL '                                                                      + #13;

      cdsContratosAnteriores.Next;

   end;

   // Chama regra

   WebRegra.CdsDataSetIn.Close;
   WebRegra.CdsDataSetIn.Data := WebRegra.GetDataPacket( sSQL );

   // Retorna resultado booleano

   WebRegra.MessageInfo := '';
   Result := WebRegra.RegraBooleana( IntToStr( iIDREGRATIPOCONTR ), iIdEmpresaProp );

end; {ValidaTipoContratoEmprestimo}
//Fim Pendência 23733



function TCtrlWebEmprestimo.InsertAssinaturaContr(iIdTitular,
                                                  iIdBenef,
                                                  iIdContratoPadrao: Integer;
                                                  sObservacao: string;
                                                  //Pendência 27300 - 28/01/2008
                                                  sNumComprova: string;
                                                  //Fim Pendência 27300
                                                  dDataAssinatura: TDateTime): Boolean;
var
  sCampos, sValores, sSQL : string;
  bTransacao : Boolean;
  cdsTemp : TCMClientDataSet;
begin
   try
      try
         Result   := True;
         sCampos  := '';
         sValores := '';

         // Valida assinatura
         cdsTemp      := TCMClientDataSet.Create( nil );
         cdsTemp.Data := GetDataPacket( 'SELECT IDCONTRATOPADRAO FROM CONTRATOPADRAO WHERE IDCONTRATOPADRAO = ' + IntToStr(iIdContratoPadrao) );
         if cdsTemp.IsEmpty then
            raise Exception.Create( 'Identificador de Contrato Padrão inexistente' );

         sSql := 'SELECT * FROM ASSINCONTRPADRAO ' +#13+
                 ' WHERE IDCONTRATOPADRAO = ' + IntToStr( iIdContratoPadrao ) +#13+
                 '   AND IDPESSOA         = ' + IntToStr( iIdTitular ) +#13+
                 '   AND IDBENEF          = ' + IntToStr( iIdBenef ) +#13+
                 '   AND ACPDATAASSINAT   = to_date( ''' + FormatDateTime('dd/mm/yyyy', dDataAssinatura ) + ''', ''DD/MM/YYYY'')';
         cdsTemp.Data := GetDataPacket( sSql );
         if not cdsTemp.IsEmpty then
            raise Exception.Create( 'Assinatura já existente para o mutuário na data informada' );

         //Pendência 27300 - 28/01/2008
         if (sNumComprova <> '') then
         begin
            sSql := 'SELECT * FROM ASSINCONTRPADRAO ' +#13+
                    ' WHERE NUMCOMPROVA = ' + QuotedStr( trim( sNumComprova ) ) + #13;
            cdsTemp.Data := GetDataPacket( sSql );
            if not cdsTemp.IsEmpty then
               raise Exception.Create( 'Assinatura já existente para o número de comprova informado' );
         end;
         //Fim Pendência 27300

         // -------------------------------------------------------------------------------------------
         if iIdTitular > 0         then begin sCampos := sCampos + 'IDPESSOA, ';         sValores := sValores + ConverteVirgulaParaPonto( iIdTitular ) + ', '; end;
         if iIdBenef   > 0         then begin sCampos := sCampos + 'IDBENEF, ';          sValores := sValores + ConverteVirgulaParaPonto( iIdBenef ) + ', '; end;
         if iIdContratoPadrao > 0  then begin sCampos := sCampos + 'IDCONTRATOPADRAO, '; sValores := sValores + ConverteVirgulaParaPonto( iIdContratoPadrao ) + ', '; end;
         if dDataAssinatura > 0    then begin sCampos := sCampos + 'ACPDATAASSINAT, ';   sValores := sValores + 'to_date( ''' + FormatDateTime('dd/mm/yyyy', dDataAssinatura ) + ''', ''DD/MM/YYYY'')' + ', '; end;
         if sObservacao <> ''      then begin sCampos := sCampos + 'OBS, ';              sValores := sValores + QuotedStr( trim( sObservacao ) ) + ', '; end;
         //Pendência 27300 - 28/01/2008
         if sNumComprova <> ''     then begin sCampos := sCampos + 'NUMCOMPROVA, ';      sValores := sValores + QuotedStr( trim( sNumComprova ) ) + ', '; end;
         //Fim Pendência 27300
         // -------------------------------------------------------------------------------------------

         sCampos  := Copy( sCampos,  1, length( sCampos  ) - 2 );
         sValores := Copy( sValores, 1, length( sValores ) - 2 );

         //Início da Transacao
         bTransacao := False;
         if not InTransaction then
         begin
           bTransacao := True;
           StartTransaction;
         end;

         sSQL := ' INSERT INTO ASSINCONTRPADRAO ( ' + sCampos + ' ) VALUES ( ' + sValores + ' ) ';

         if not ExecSQL( sSQL ) then
            raise Exception.Create( 'Não foi possível inserir o registro de assinatura do contrato padrão' );

         if bTransacao then Commit;
      except
         On E : Exception do begin
            Result := False;
            if bTransacao then Rollback;
            MessageInfo := E.Message;
            raise;
         end;
      end;
   finally
      FreeAndNil( cdsTemp );
   end;
end;


//Pendência 27300 - 28/01/2008
function TCtrlWebEmprestimo.DeleteAssinaturaContr(sNumComprova: string): Boolean;
var
  sSQL : string;
  bTransacao : Boolean;
  cdsTemp : TCMClientDataSet;
  iIdBenef: Integer;
begin
   try
      try
         Result   := True;

         // Valida assinatura
         sSQL         := 'SELECT IDPESSOA, IDBENEF, IDCONTRATOPADRAO, ACPDATAASSINAT ' +
                         ' FROM ASSINCONTRPADRAO WHERE NUMCOMPROVA = ' + QuotedStr( trim( sNumComprova ) );
         cdsTemp      := TCMClientDataSet.Create( nil );
         cdsTemp.Data := GetDataPacket( sSql );

         if cdsTemp.IsEmpty then
            raise Exception.Create( 'Número do comprova inexistente nas assinaturas de Contrato Padrão' );

         sSQL := 'SELECT * FROM CONTRATOEMPTMO CON, CONTRPADRXTIPOCONTR CPD ' +#13+
                 ' WHERE CON.IDTIPOCONTREMPTMO = CPD.IDTIPOCONTREMPTMO ' +#13+
                 '   AND CPD.IDCONTRATOPADRAO  = ' + cdstemp.FieldByName('IDCONTRATOPADRAO').AsString +#13+
                 '   AND CON.IDPESSOA          = ' + cdstemp.FieldByName('IDPESSOA').AsString +#13+
                 '   AND CON.IDBENEF           = ' + cdstemp.FieldByName('IDBENEF').AsString +#13+
                 '   AND CON.FLGSITUACAO      <> ''C'' ' +#13+
                 '   AND CON.DATACREDITO      >= to_date( ''' +
                 FormatDateTime('dd/mm/yyyy', cdstemp.FieldByName('ACPDATAASSINAT').AsDateTime ) + ''', ''DD/MM/YYYY'')';

         cdsTemp.Data := GetDataPacket( sSql );
         if not cdsTemp.IsEmpty then
            raise Exception.Create( 'Número do comprova com concessões ativas após data de assinatura do contrato padrão.' );

         //Início da Transacao
         bTransacao := False;
         if not InTransaction then
         begin
           bTransacao := True;
           StartTransaction;
         end;

         sSQL := ' DELETE FROM ASSINCONTRPADRAO WHERE NUMCOMPROVA = ' + QuotedStr( trim( sNumComprova ) );

         if not ExecSQL( sSQL ) then
            raise Exception.Create( 'Não foi possível excluir o registro de assinatura do contrato padrão' );

         if bTransacao then Commit;

      except
         On E : Exception do begin
            Result := False;
            if bTransacao then Rollback;
            MessageInfo := E.Message;
            raise;
         end;
      end;
   finally
      FreeAndNil( cdsTemp );
   end;

end;
//Fim Pendência 27300



function TCtrlWebEmprestimo.BuscaCarenciaPorContratosQuitaveis(const iIdTipoContratoEmptmo: integer): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT TCE.IDTIPOCONTREMPTMO, TCE.TCEDESCRICAO, NVL(TCE.TCEMINRENOVA,0) AS TCEMINRENOVA '+#13+
           '  FROM TIPOCONTREMPTMO TCE, '+#13+
           '       TIPOCONTRXQUIT TCQ   '+#13+
           ' WHERE TCE.IDTIPOCONTREMPTMO = TCQ.IDTIPOCONTREMPTMO    '+#13+
           '   AND TCQ.IDTIPOCONTRQUIT IN (SELECT IDTIPOCONTREMPTMO '+#13+
           '                              FROM   TIPOCONTREMPTMO    '+#13+
           '                              WHERE  IDTIPOCONTREMPTMO = '+ FloatToStr(iIdTipoContratoEmptmo) +#13+
           '                               ) '+#13+
           ' UNION '+#13+
           'SELECT TCE.IDTIPOCONTREMPTMO, TCE.TCEDESCRICAO, NVL(TCE.TCEMINRENOVA,0) AS TCEMINRENOVA '+#13+
           '  FROM TIPOCONTREMPTMO TCE '+#13+
           ' WHERE TCE.IDTIPOCONTREMPTMO = '+ FloatToStr(iIdTipoContratoEmptmo);

   Result := GetDataPacket( sSql );
end;

function TCtrlWebEmprestimo.BuscaPlanoPrevOrigemFUNCEF(const iIdMutuario: Extended): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT   CTB.IDPLANOPREV     ' +#13+
           '  FROM     PARTPREVPLAN ATU, ' +#13+
           '           PARTPREVPLAN ANT, ' +#13+
           '           PLANPREVCONTABIL CTB      ' +#13+
           '  WHERE    ATU.IDPESSOA = ' + FloatToStr(iIdMutuario) +#13+
           '  AND      ATU.IDPLANOPREV = 74 ' +#13+
           '  AND      CTB.IDPLANOPREVPREV = ANT.IDPLANOPREV ' +#13+
           '  AND      CTB.IDPLANOPREV = 28 ' +#13+
           '  AND      ANT.IDPESSOA = ATU.IDPESSOA ' +#13+
           '  AND      ANT.INSCRICAODATA = ' +#13+
           '           (SELECT MAX(INSCRICAODATA) ' +#13+
           '            FROM   PARTPREVPLAN ' +#13+
           '            WHERE  IDPESSOA = ATU.IDPESSOA ' +#13+
           '            AND    IDPLANOPREV = 2 ' +#13+
           '            AND    IDSITPLANOPREV = 25 ' +#13+
           '            AND    FLGDESATIVADO = 1 ' +#13+
           '            AND    INSCRICAODATA < ATU.INSCRICAODATA) ';
   Result := GetDataPacket( sSql );
end;


//Pendência 27385 - 08/02/2008
//Verifica existência do contrato na base
function TCtrlWebEmprestimo.BuscaContratoEmptmo(const iIdContratoEmptmo: Double): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT IDCONTRATOEMPTMO '+#13+
           '  FROM CONTRATOEMPTMO '+#13+
           ' WHERE IDCONTRATOEMPTMO = '+ FloatToStr(iIdContratoEmptmo);
   Result := GetDataPacket( sSql );

end;


//Verifica existência de itens do contrato na base
function TCtrlWebEmprestimo.BuscaHistMovEmptmo(const iIdContratoEmptmo: Double): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT COUNT(IDCONTRATOEMPTMO) AS QUANT '+#13+
           '  FROM HISTMOVEMPTMO '+#13+
           ' WHERE IDCONTRATOEMPTMO =  '+ FloatToStr(iIdContratoEmptmo);
   Result := GetDataPacket( sSql );

end;


//Verifica existência do item centralizador
function TCtrlWebEmprestimo.BuscaQuantHistMovEmptmo(const iIdContratoEmptmo, iIdTipoContrEmptmo: Double): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT COUNT(HME.IDITEMEMPTMO) AS QUANT '                                             + #13 +
           'FROM   HISTMOVEMPTMO HME '                                                            + #13 +
           'WHERE '                                                                               + #13 +
           '       HME.IDCONTRATOEMPTMO = ' + FloatToStr(iIdContratoEmptmo)                       + #13 +
           '   AND HME.IDITEMEMPTMO     = ( '                                                     + #13 +
           '                              SELECT IDITEMEMPTMO '                                   + #13 +
           '                               FROM  ITEMXTIPOCONTR '                                 + #13 +
           '                               WHERE IDTIPOCONTREMPTMO     = ' + FloatToStr(iIdTipoContrEmptmo) + #13 +
           '                                 AND ITCEVENTO             = 0 '                      + #13 +
           '                                 AND NVL(FLGCENTRALIZA, 0) = 1 ) '                    + #13;
   Result := GetDataPacket( sSql );

end;
//Fim Pendência 27385

//Pendência 26118
function TCtrlWebEmprestimo.BuscaContratacaoRealizada(sIDPessoa,
  sIDContratoEmptmo: string): boolean;
var
  cdsBuscaDataContratacao : TCmClientDataSet;
  sSQL : string;
begin
  cdsBuscaDataContratacao := TCmClientDataSet.Create(nil);
  try
    sSQL := 'SELECT *              ' + #13 +
            '  FROM CONTRATOEMPTMO ' + #13 +
            ' WHERE IDPESSOA = ' + sIDPessoa + #13 +
            '   AND IDCONTRATOEMPTMO <> ' + sIDContratoEmptmo + #13 +
            '   AND TO_CHAR(TRGDTINCLUSAO,''DD/MM/YYYY HH:MM'') = TO_CHAR(SYSDATE,''DD/MM/YYYY HH:MM'')' + #13;

    cdsBuscaDataContratacao.Data := GetDataPacket(sSQL);
    
    if cdsBuscaDataContratacao.RecordCount <= 0 then
      Result := False
    else
      Result := True;
  finally
    cdsBuscaDataContratacao.Free;
  end;
end;
//Fim Pendência 26118

//BRUNO AZEVEDO SOL 131352 KINTANA 747109
function TCtrlWebEmprestimo.ConsultaContratoPessoa( iIdPessoa, iIdTitular : integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select   cnt.IDCONTRATOEMPTMO,                                                       ' +
   '          tip.TCEDESCRICAO,                                                           ' +
   '          decode(cnt.FLGSITUACAO,''A'',''Ativo'',                                     ' +
   '                                 ''J'',''Em cobrança judicial'',                      ' +
   '                                 ''K'',''Em processo de quitação'',                   ' +
   '                                 ''Q'',''Quitado'',                                   ' +
   '                                 ''C'',''Cancelado'',                                 ' +
   '                                 ''S'',''Suspenso'',                                  ' +
   '                                 ''R'',''Refinanciado'',                              ' +
   '                                 ''P'',''Pendente de Liberação'') AS SITUACAO,        ' +
   '          TO_CHAR(CNT.DATACREDITO,''DD/MM/YYYY'') AS DATACREDITO                      ' +
   ' from     INSCRICAOEMPTMO ins,                                                        ' +
   '          CONTRATOEMPTMO  cnt,                                                        ' +
   '          TIPOCONTREMPTMO tip,                                                        ' +
   '          TIPOEMPTMO      tem                                                         ' +
   ' where                                                                                ' +
   '          cnt.IDPESSOA        = ' + IntToStr( iIdTitular ) + '                        ' +
   '   and    cnt.IDBENEF         = ' + IntToStr( iIdPessoa ) + '                         ' +
   '   and    cnt.IDTIPOCONTREMPTMO  = tip.IDTIPOCONTREMPTMO                              ' +
   '   and    tip.IDTIPOEMPTMO       = tem.IDTIPOEMPTMO                                   ' +
   '   and    cnt.IDINSCRICAOEMPTMO  = ins.IDINSCRICAOEMPTMO (+)                          ' +
   ' order by cnt.FLGSITUACAO, cnt.IDCONTRATOEMPTMO desc, cnt.DATACREDITO desc            ' );
end;

function TCtrlWebEmprestimo.ConsultaTipoContratoPessoa( iIdPessoa : integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select   distinct tip.TCEDESCRICAO, tip.IDTIPOCONTREMPTMO                            ' +
   ' from     INSCRICAOEMPTMO ins,                                                        ' +
   '          CONTRATOEMPTMO  cnt,                                                        ' +
   '          TIPOCONTREMPTMO tip,                                                        ' +
   '          TIPOEMPTMO      tem                                                         ' +
   ' where                                                                                ' +
   '          ( ( cnt.IDPESSOA           = ' + IntToStr( iIdPessoa ) + ' )                ' +
   '          or ( cnt.IDBENEF         = ' + IntToStr( iIdPessoa ) + ' ) )                ' +
   '   and    cnt.IDTIPOCONTREMPTMO  = tip.IDTIPOCONTREMPTMO                              ' +
   '   and    tip.IDTIPOEMPTMO       = tem.IDTIPOEMPTMO                                   ' +
   '   and    cnt.IDINSCRICAOEMPTMO  = ins.IDINSCRICAOEMPTMO (+)                          ' );
end;
//BRUNO AZEVEDO SOL 131352 KINTANA 747109


//BRUNO AZEVEDO SOL 140310 KINTANA 877933
function TCtrlWebEmprestimo.UltimaAtualizacaoDiaria( iIdContratoEmptmo : Extended ): OleVariant;
begin
  Result := GetDataPacket(
   ' SELECT MAX(H.HMEDATAPREVISTA) AS DATA FROM HISTMOVEMPTMO H ' +
   ' WHERE H.IDCONTRATOEMPTMO = ' + FloatToStr(iIdContratoEmptmo) +
   ' AND H.HMETIPOMOV = 5                               ' +
   ' AND NVL(H.FLGESTORNADO,0) = 0                      ' );
end;

function TCtrlWebEmprestimo.ChecaAtualizacaoDiaria( iIdContratoEmptmo : Extended; Data: String): OleVariant;
begin
  Result := GetDataPacket(
   ' SELECT HMEDATAPREVISTA AS DATA FROM HISTMOVEMPTMO H ' +
   ' WHERE H.IDCONTRATOEMPTMO = ' + FloatToStr(iIdContratoEmptmo) +
   ' AND H.HMEDATAPREVISTA = TO_DATE(''' + Data + ''', ''DD/MM/YYYY'')' +  //BRUNO AZEVEDO SOL 146488 KINTANA 997592
   ' AND H.HMETIPOMOV = 5                               ' +
   ' AND NVL(H.FLGESTORNADO,0) = 0                      ' );
end;
//BRUNO AZEVEDO SOL 140310 KINTANA 877933

//BRUNO AZEVEDO SOL 140310 KINTANA 877933
function TCtrlWebEmprestimo.Saldo(fSaldo: Extended): OleVariant;
begin
  Result := GetDataPacket(
   ' SELECT TRIM(TO_CHAR(' + StringReplace(FloatToStr(fSaldo),',','.',[]) + ',''999g999g990d00'')) AS SALDO FROM DUAL ' );
end;
//BRUNO AZEVEDO SOL 140310 KINTANA 877933

end.


