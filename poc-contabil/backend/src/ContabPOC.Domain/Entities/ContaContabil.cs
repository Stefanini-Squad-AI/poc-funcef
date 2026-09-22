using FuncefORM.Audit.Attributes;

namespace ContabPOC.Domain.Entities;

/// <summary>
/// Entidade que representa uma conta contábil no plano de contas
/// Migração de: CONTAB/FontesMT/FCadContasContabMT.pas (TfrmCadContasContabMT)
/// Tabela: PLANOCONTA (PK compuesta: PLANO + PLACONTA)
/// 
/// Mapeamento de campos Delphi → Oracle → .NET:
///   dbeCodigo (PLACONTA)        → Codigo
///   dbeGrau (PLAGRAU)           → Nivel
///   grpTipo (PLATIPO)           → Tipo (S=Sintética, A=Analítica)
///   cmbGrp (PLAGRUPO)           → Grupo (A/P/R/D/C/O/E/S)
///   dbeCodReduz (PLAREDUZ)      → CodigoReduzido
///   grpNatureza (PLANATUREZA)   → Natureza (D/C/N)
///   dbeDescPort (PLANOME)       → Descricao
///   dbeDescOIdi (PLANOMEOUTLING) → DescricaoIdioma
///   dbeCorresp (PLACONCORRESP)  → ContaCorrespondente
///   chkOrdAlf (PLAORDALF)       → OrdemAlfabetica
///   chkCentCust (PLACCUST)      → AceitaCentroCusto
///   chkAltera (PLAALTERA)       → PermiteAlteracao
///   chkInativa (PLAINATIVA)     → Inativa
///   chkConcilia (PLACONCILIA)   → Conciliavel
///   chkSumariza (PLASUMARIZA)   → SumarizaLancamentos
///   chkSubconta (PLASUBCONTA)   → ObrigaSubconta
///   chkBloqueia (PLABLOQUE)     → Bloqueada
///   dteBloqueada (PLABLOQUEDATA) → DataBloqueio
///   chkContaPadrao (PLASECRETARIA) → ContaPadraoSecretaria
///   dbImprimeRelatEvolu (PLAIMPRELATEVOL) → ImprimeRelEvolucao
///   rdgRateio (PLARATEIOAP)     → AceitaRateio
///   chkPL (PLAMUTACOES)         → AceitaMutacoes
///   cmContraPartida (PLACONTRAPARTIDA) → Contrapartida
///   cmContaSegreg (PLACONTASEGREG) → ContaSegregacao
///   edtContaExtracontab (PLAEXTRACONTABIL) → ContaExtracontabil
///   dbcmbTipOfi (PLATIPCONVOFICIAL) → ConversaoOficial
///   dbcmbTipGer (PLATIPCONVGER) → ConversaoGerencial
///   dbcmbTipGer2 (PLATIPCONVGEREN1) → ConversaoGerencial2
///   dbcmbTipGer3 (PLATIPCONVGEREN2) → ConversaoGerencial3
///   chkUsoExcPga (FLGUSOEXCPGA) → UsoExclusivoPga
///   dblkSubGrupo1..4 (IDSUBGRUPO1..4) → SubGrupo1..4
///   dblkMoeda (IDMOEDA)         → MoedaId
///   cmContraPartidaJuros (PLACONTRAPARTIDAJUROS) → ContrapartidaJuros
///   dbrePercTxJuros (PLATAXAJUROS) → TaxaJuros
///   dblkSegregacao (IDSEGREGACRITER) → SegregacaoCriterId
///   cboPrograma (IDPROGRAMA)    → ProgramaId
///   dblkRateioPlanoPatro (IDRATADMPLANPATRO) → RateioPlanoAdmId
///   CMContaSegregFDOAdmCred (PLACONTASEGREGFDOADCRED) → ContaSegregacaoFdoAdmCred
///   CMContaSegregFDOADMDeb (PLACONTASEGREGFDOADDEB) → ContaSegregacaoFdoAdmDeb
///   CMContaAglutinacao (PLACONTAAGLUTINACAO) → ContaAglutinacao
///   DBMemoObs (OBSERVACAO)      → Observacoes
/// </summary>
[Auditable]
public class ContaContabil
{
    // ===== PK Compuesta =====
    /// <summary>
    /// Número do plano de contas (FK para PLANO.IDPLANO)
    /// Delphi: dblkPlanoContabil.LookupValue
    /// </summary>
    public int Plano { get; set; }

    /// <summary>
    /// Código da conta no formato da máscara (ex: 1.01.01.001)
    /// Delphi: dbeCodigo → PLACONTA
    /// </summary>
    public string Codigo { get; set; } = string.Empty;

    // ===== Datos Básicos (TabSheet1 - Informações Gerais) =====
    /// <summary>
    /// Descrição/nome da conta
    /// Delphi: dbeDescPort → PLANOME
    /// </summary>
    public string Descricao { get; set; } = string.Empty;

    /// <summary>
    /// Descrição em outro idioma (opcional)
    /// Delphi: dbeDescOIdi → PLANOMEOUTLING
    /// </summary>
    public string? DescricaoIdioma { get; set; }

    /// <summary>
    /// Tipo: S=Sintética (agrupadora), A=Analítica (detalhada)
    /// Delphi: grpTipo → PLATIPO
    /// </summary>
    public string Tipo { get; set; } = "S";

    /// <summary>
    /// Grupo: A=Ativo, P=Pasivo, R=Receita, D=Despesa, C=Custo, 
    /// O=Outros, E=Estatística, S=Patrimônio Social
    /// Delphi: cmbGrp → PLAGRUPO
    /// </summary>
    public string Grupo { get; set; } = "A";

    /// <summary>
    /// Nível hierárquico (grau) da conta
    /// Delphi: dbeGrau → PLAGRAU
    /// </summary>
    public int Nivel { get; set; }

    /// <summary>
    /// Código reduzido - sequencial único
    /// Delphi: dbeCodReduz → PLAREDUZ
    /// </summary>
    public int CodigoReduzido { get; set; }

    /// <summary>
    /// Natureza: D=Devedora, C=Credora, N=Neutra
    /// Delphi: grpNatureza → PLANATUREZA
    /// </summary>
    public string? Natureza { get; set; }

    /// <summary>
    /// Conta correspondente (código)
    /// Delphi: dbeCorresp → PLACONCORRESP
    /// </summary>
    public string? ContaCorrespondente { get; set; }

    // ===== Checkboxes (TabSheet1 - GroupBox4) =====
    /// <summary>
    /// Ordem alfabética - S/N
    /// Delphi: chkOrdAlf → PLAORDALF
    /// </summary>
    public bool? OrdemAlfabetica { get; set; }

    /// <summary>
    /// Aceita centro de custo - S/N
    /// Delphi: chkCentCust → PLACCUST
    /// </summary>
    public bool? AceitaCentroCusto { get; set; }

    /// <summary>
    /// Permite alteração da conta - S/N
    /// Delphi: chkAltera → PLAALTERA
    /// </summary>
    public bool PermiteAlteracao { get; set; } = true;

    /// <summary>
    /// Conta inativa - A=Ativa, I=Inativa
    /// Delphi: chkInativa → PLAINATIVA
    /// </summary>
    public bool Inativa { get; set; }

    /// <summary>
    /// Conciliável - S/N
    /// Delphi: chkConcilia → PLACONCILIA
    /// </summary>
    public bool? Conciliavel { get; set; }

    /// <summary>
    /// Sumariza lançamentos - S/N
    /// Delphi: chkSumariza → PLASUMARIZA
    /// </summary>
    public bool? SumarizaLancamentos { get; set; }

    /// <summary>
    /// Obriga subconta - S/N
    /// Delphi: chkSubconta → PLASUBCONTA
    /// </summary>
    public bool? ObrigaSubconta { get; set; }

    /// <summary>
    /// Conta padrão da secretaria - S/N
    /// Delphi: chkContaPadrao → PLASECRETARIA
    /// </summary>
    public bool? ContaPadraoSecretaria { get; set; }

    /// <summary>
    /// Imprime relatório de evolução - S/N
    /// Delphi: dbImprimeRelatEvolu → PLAIMPRELATEVOL
    /// </summary>
    public bool? ImprimeRelEvolucao { get; set; }

    /// <summary>
    /// Aceita mutações - S/N
    /// Delphi: chkPL → PLAMUTACOES
    /// </summary>
    public bool? AceitaMutacoes { get; set; }

    /// <summary>
    /// Uso exclusivo PGA - I/A
    /// Delphi: chkUsoExcPga → FLGUSOEXCPGA (ValueChecked=I, ValueUnchecked=A)
    /// </summary>
    public bool? UsoExclusivoPga { get; set; }

    /// <summary>
    /// Conta estatística com movimento - S/N
    /// Delphi: dblcComLancamento → FLGESTATCOMLANC
    /// </summary>
    public bool? EstatisticaComLancamento { get; set; }

    // ===== Bloqueio =====
    /// <summary>
    /// Conta bloqueada - S/N
    /// Delphi: chkBloqueia → PLABLOQUE
    /// </summary>
    public bool? Bloqueada { get; set; }

    /// <summary>
    /// Data de bloqueio
    /// Delphi: dteBloqueada → PLABLOQUEDATA
    /// </summary>
    public DateTime? DataBloqueio { get; set; }

    // ===== Rateio =====
    /// <summary>
    /// Aceita rateio - S/N
    /// Delphi: rdgRateio → PLARATEIOAP
    /// </summary>
    public string? AceitaRateio { get; set; }

    // ===== Conversão de Moeda (TabSheet3) =====
    /// <summary>
    /// Conversão moeda oficial - S/N
    /// Delphi: dbcmbTipOfi → PLATIPCONVOFICIAL
    /// </summary>
    public string? ConversaoOficial { get; set; }

    /// <summary>
    /// Conversão moeda gerencial 1 - S/N
    /// Delphi: dbcmbTipGer → PLATIPCONVGER
    /// </summary>
    public string? ConversaoGerencial { get; set; }

    /// <summary>
    /// Conversão moeda gerencial 2 - S/N
    /// Delphi: dbcmbTipGer2 → PLATIPCONVGEREN1
    /// </summary>
    public string? ConversaoGerencial2 { get; set; }

    /// <summary>
    /// Conversão moeda gerencial 3 - S/N
    /// Delphi: dbcmbTipGer3 → PLATIPCONVGEREN2
    /// </summary>
    public string? ConversaoGerencial3 { get; set; }

    // ===== Sub-grupos (TabSheet3 - GroupBox1) =====
    /// <summary>
    /// Sub-grupo 1
    /// Delphi: dblkSubGrupo1 → IDSUBGRUPO1
    /// </summary>
    public int? SubGrupo1 { get; set; }

    /// <summary>
    /// Sub-grupo 2
    /// Delphi: dblkSubGrupo2 → IDSUBGRUPO2
    /// </summary>
    public int? SubGrupo2 { get; set; }

    /// <summary>
    /// Sub-grupo 3
    /// Delphi: dblkSubGrupo3 → IDSUBGRUPO3
    /// </summary>
    public int? SubGrupo3 { get; set; }

    /// <summary>
    /// Sub-grupo 4
    /// Delphi: dblkSubGrupo4 → IDSUBGRUPO4
    /// </summary>
    public int? SubGrupo4 { get; set; }

    // ===== Moeda e Juros (TabSheet3 - GroupBox5/gbMoedaHist/gbTxJuros) =====
    /// <summary>
    /// ID da moeda
    /// Delphi: dblkMoeda → IDMOEDA
    /// </summary>
    public int? MoedaId { get; set; }

    /// <summary>
    /// Contrapartida para juros
    /// Delphi: cmContraPartidaJuros → PLACONTRAPARTIDAJUROS
    /// </summary>
    public string? ContrapartidaJuros { get; set; }

    /// <summary>
    /// Taxa de juros (%)
    /// Delphi: dbrePercTxJuros → PLATAXAJUROS
    /// </summary>
    public decimal? TaxaJuros { get; set; }

    // ===== Contas de Relação =====
    /// <summary>
    /// Contrapartida (código)
    /// Delphi: cmContraPartida → PLACONTRAPARTIDA
    /// </summary>
    public string? Contrapartida { get; set; }

    /// <summary>
    /// Conta de segregação (código)
    /// Delphi: cmContaSegreg → PLACONTASEGREG
    /// </summary>
    public string? ContaSegregacao { get; set; }

    /// <summary>
    /// Conta de segregação FDO Adm Crédito
    /// Delphi: CMContaSegregFDOAdmCred → PLACONTASEGREGFDOADCRED
    /// </summary>
    public string? ContaSegregacaoFdoAdmCred { get; set; }

    /// <summary>
    /// Conta de segregação FDO Adm Débito
    /// Delphi: CMContaSegregFDOADMDeb → PLACONTASEGREGFDOADDEB
    /// </summary>
    public string? ContaSegregacaoFdoAdmDeb { get; set; }

    /// <summary>
    /// Conta para aglutinação
    /// Delphi: CMContaAglutinacao → PLACONTAAGLUTINACAO
    /// </summary>
    public string? ContaAglutinacao { get; set; }

    /// <summary>
    /// Conta extracontábil
    /// Delphi: edtContaExtracontab → PLAEXTRACONTABIL
    /// </summary>
    public string? ContaExtracontabil { get; set; }

    // ===== Segregação e Rateio =====
    /// <summary>
    /// ID do critério de segregação
    /// Delphi: dblkSegregacao → IDSEGREGACRITER
    /// </summary>
    public int? SegregacaoCriterId { get; set; }

    /// <summary>
    /// ID do programa
    /// Delphi: cboPrograma → IDPROGRAMA
    /// </summary>
    public int? ProgramaId { get; set; }

    /// <summary>
    /// ID do rateio por plano/patrocinadora
    /// Delphi: dblkRateioPlanoPatro → IDRATADMPLANPATRO
    /// Tabela: RATADMPLANPATRO (FCadRatAdmPlanoPatroMT.pas)
    /// </summary>
    public int? RateioPlanoAdmId { get; set; }

    // ===== Observações (TabSheet6) =====
    /// <summary>
    /// Observações gerais
    /// Delphi: DBMemoObs → OBSERVACAO
    /// </summary>
    public string? Observacoes { get; set; }

    // ===== Auditoría =====
    /// <summary>
    /// Usuário de inclusão
    /// Delphi: Cds.FieldByName('IDUSUARIOINCLUSAO') → IDUSUARIOINCLUSAO
    /// </summary>
    public int? UsuarioInclusao { get; set; }

    /// <summary>
    /// Data de inclusão
    /// Delphi: DTINCLUSAO
    /// </summary>
    public DateTime CreatedAt { get; set; }

    /// <summary>
    /// Data de alteração
    /// Delphi: DTALTERACAO
    /// </summary>
    public DateTime? UpdatedAt { get; set; }
}
