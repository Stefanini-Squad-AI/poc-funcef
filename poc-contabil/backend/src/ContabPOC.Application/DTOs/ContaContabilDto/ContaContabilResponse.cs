namespace ContabPOC.Application.DTOs.ContaContabilDto;

/// <summary>
/// DTO de resposta para conta contábil
/// Migração de: FCadContasContabMT.pas → Cds (ClientDataSet)
/// </summary>
public record ContaContabilResponse
{
    // PK
    public int Plano { get; init; }
    public string Codigo { get; init; } = string.Empty;

    // Datos básicos
    public string Descricao { get; init; } = string.Empty;
    public string? DescricaoIdioma { get; init; }
    public string Tipo { get; init; } = string.Empty;
    public string Grupo { get; init; } = string.Empty;
    public int Nivel { get; init; }
    public int CodigoReduzido { get; init; }
    public string? Natureza { get; init; }
    public string? ContaCorrespondente { get; init; }

    // Checkboxes
    public bool? OrdemAlfabetica { get; init; }
    public bool? AceitaCentroCusto { get; init; }
    public bool PermiteAlteracao { get; init; }
    public bool Inativa { get; init; }
    public bool? Conciliavel { get; init; }
    public bool? SumarizaLancamentos { get; init; }
    public bool? ObrigaSubconta { get; init; }
    public bool? ContaPadraoSecretaria { get; init; }
    public bool? ImprimeRelEvolucao { get; init; }
    public bool? AceitaMutacoes { get; init; }
    public bool? UsoExclusivoPga { get; init; }
    public bool? EstatisticaComLancamento { get; init; }

    // Bloqueio
    public bool? Bloqueada { get; init; }
    public DateTime? DataBloqueio { get; init; }

    // Rateio (Delphi: PLARATEIOAP — N/S/R)
    public string? AceitaRateio { get; init; }

    // Conversão de Moeda
    public string? ConversaoOficial { get; init; }
    public string? ConversaoGerencial { get; init; }
    public string? ConversaoGerencial2 { get; init; }
    public string? ConversaoGerencial3 { get; init; }

    // Sub-grupos
    public int? SubGrupo1 { get; init; }
    public int? SubGrupo2 { get; init; }
    public int? SubGrupo3 { get; init; }
    public int? SubGrupo4 { get; init; }

    // Moeda e Juros
    public int? MoedaId { get; init; }
    public string? ContrapartidaJuros { get; init; }
    public decimal? TaxaJuros { get; init; }

    // Contas de Relación
    public string? Contrapartida { get; init; }
    public string? ContaSegregacao { get; init; }
    public string? ContaSegregacaoFdoAdmCred { get; init; }
    public string? ContaSegregacaoFdoAdmDeb { get; init; }
    public string? ContaAglutinacao { get; init; }
    public string? ContaExtracontabil { get; init; }

    // Segregação e Rateio
    public int? SegregacaoCriterId { get; init; }
    public int? ProgramaId { get; init; }
    public int? RateioPlanoAdmId { get; init; }

    // Observações
    public string? Observacoes { get; init; }

    // Auditoría
    public int? UsuarioInclusao { get; init; }
    public DateTime CreatedAt { get; init; }
    public DateTime? UpdatedAt { get; init; }
}
