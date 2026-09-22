namespace ContabPOC.Application.DTOs.ContaContabilDto;

/// <summary>
/// DTO de requisição para criar/atualizar conta contábil
/// Migração de: FCadContasContabMT.pas → CmeCadastroInsert/ApplyInsert/ApplyEdit
/// Campos com defaults delphi: CmeCadastroInsert (líneas 809-829)
/// </summary>
public record ContaContabilRequest
{
    // PK
    public int Plano { get; init; } = 1;
    public string Codigo { get; init; } = string.Empty;

    // Datos básicos
    public string Descricao { get; init; } = string.Empty;
    public string? DescricaoIdioma { get; init; }
    public string Tipo { get; init; } = "S";        // Delphi default: 'S' (Sintética)
    public string Grupo { get; init; } = "A";        // Delphi: cmbGrp
    public int Nivel { get; init; } = 1;
    public int CodigoReduzido { get; init; }
    public string? Natureza { get; init; }           // Delphi default: 'D' (Devedora)
    public string? ContaCorrespondente { get; init; }

    // Checkboxes (defaults de CmeCadastroInsert líneas 813-829)
    public bool? OrdemAlfabetica { get; init; }      // default: false (N)
    public bool? AceitaCentroCusto { get; init; }    // default: false (N)
    public bool PermiteAlteracao { get; init; } = true; // default: true (S)
    public bool Inativa { get; init; }               // default: false (A)
    public bool? Conciliavel { get; init; }          // default: false (N)
    public bool? SumarizaLancamentos { get; init; }  // default: false (N)
    public bool? ObrigaSubconta { get; init; }       // default: false (N)
    public bool? ContaPadraoSecretaria { get; init; } // default: false (N)
    public bool? ImprimeRelEvolucao { get; init; }   // default: true (S)
    public bool? AceitaMutacoes { get; init; }       // default: false (N)
    public bool? UsoExclusivoPga { get; init; }      // default: false (I) — fuera do GroupBox4 Parâmetros
    public bool? EstatisticaComLancamento { get; init; } // default: false (N) — Delphi: dblcComLancamento → FLGESTATCOMLANC

    // Bloqueio
    public bool? Bloqueada { get; init; }            // default: false (N)
    public DateTime? DataBloqueio { get; init; }

    // Rateio (Delphi: PLARATEIOAP — rdgRateio con 3 valores: N=Conta para Rateio, S=Conta Base, R=Não Processada)
    public string? AceitaRateio { get; init; }        // default: 'N'

    // Conversão de Moeda
    public string? ConversaoOficial { get; init; }   // default: 'N'
    public string? ConversaoGerencial { get; init; }  // default: 'N'
    public string? ConversaoGerencial2 { get; init; } // default: 'N'
    public string? ConversaoGerencial3 { get; init; } // default: 'N'

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
}
