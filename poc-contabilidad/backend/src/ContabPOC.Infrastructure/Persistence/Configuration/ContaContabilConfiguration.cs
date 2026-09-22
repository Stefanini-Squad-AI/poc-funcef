using ContabPOC.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace ContabPOC.Infrastructure.Persistence.Configuration;

public class ContaContabilConfiguration : IEntityTypeConfiguration<ContaContabil>
{
    public void Configure(EntityTypeBuilder<ContaContabil> builder)
    {
        builder.ToTable("PLANOCONTA");

        // PK compuesta
        builder.HasKey(c => new { c.Plano, c.Codigo });

        // ===== PK y datos básicos =====
        builder.Property(c => c.Plano)
            .HasColumnName("PLANO");

        builder.Property(c => c.Codigo)
            .HasColumnName("PLACONTA")
            .HasMaxLength(20)
            .IsRequired();

        builder.Property(c => c.Descricao)
            .HasColumnName("PLANOME")
            .HasMaxLength(200)
            .IsRequired();

        builder.Property(c => c.DescricaoIdioma)
            .HasColumnName("PLANOMEOUTLING")
            .HasMaxLength(200);

        builder.Property(c => c.Tipo)
            .HasColumnName("PLATIPO")
            .HasMaxLength(1)
            .IsRequired();

        builder.Property(c => c.Inativa)
            .HasColumnName("PLAINATIVA")
            .HasConversion(v => v ? "I" : "A", v => v == "I")
            .HasMaxLength(1)
            .IsRequired();

        builder.Property(c => c.Grupo)
            .HasColumnName("PLAGRUPO")
            .HasMaxLength(1)
            .IsRequired();

        builder.Property(c => c.Nivel)
            .HasColumnName("PLAGRAU")
            .IsRequired();

        builder.Property(c => c.PermiteAlteracao)
            .HasColumnName("PLAALTERA")
            .HasConversion(v => v ? "S" : "N", v => v == "S")
            .HasMaxLength(1)
            .IsRequired();

        builder.Property(c => c.CodigoReduzido)
            .HasColumnName("PLAREDUZ")
            .IsRequired();

        builder.Property(c => c.Natureza)
            .HasColumnName("PLANATUREZA")
            .HasMaxLength(1);

        builder.Property(c => c.ContaCorrespondente)
            .HasColumnName("PLACONCORRESP")
            .HasMaxLength(20);

        // ===== Checkboxes (S/N conversions) =====
        builder.Property(c => c.OrdemAlfabetica)
            .HasColumnName("PLAORDALF")
            .HasConversion(BoolConverter)
            .HasMaxLength(1);

        builder.Property(c => c.AceitaCentroCusto)
            .HasColumnName("PLACCUST")
            .HasConversion(BoolConverter)
            .HasMaxLength(1);

        builder.Property(c => c.Conciliavel)
            .HasColumnName("PLACONCILIA")
            .HasConversion(BoolConverter)
            .HasMaxLength(1);

        builder.Property(c => c.SumarizaLancamentos)
            .HasColumnName("PLASUMARIZA")
            .HasConversion(BoolConverter)
            .HasMaxLength(1);

        builder.Property(c => c.ObrigaSubconta)
            .HasColumnName("PLASUBCONTA")
            .HasConversion(BoolConverter)
            .HasMaxLength(1);

        builder.Property(c => c.ContaPadraoSecretaria)
            .HasColumnName("PLASECRETARIA")
            .HasConversion(BoolConverter)
            .HasMaxLength(1);

        builder.Property(c => c.ImprimeRelEvolucao)
            .HasColumnName("PLAIMPRELATEVOL")
            .HasConversion(BoolConverter)
            .HasMaxLength(1);

        builder.Property(c => c.AceitaMutacoes)
            .HasColumnName("PLAMUTACOES")
            .HasConversion(BoolConverter)
            .HasMaxLength(1);

        builder.Property(c => c.UsoExclusivoPga)
            .HasColumnName("FLGUSOEXCPGA")
            .HasConversion(BoolConverter)
            .HasMaxLength(1);

        builder.Property(c => c.EstatisticaComLancamento)
            .HasColumnName("FLGESTATCOMLANC")
            .HasConversion(BoolConverter)
            .HasMaxLength(1);

        // ===== Bloqueio =====
        builder.Property(c => c.Bloqueada)
            .HasColumnName("PLABLOQUE")
            .HasConversion(BoolConverter)
            .HasMaxLength(1);

        builder.Property(c => c.DataBloqueio)
            .HasColumnName("PLABLOQUEDATA");

        // ===== Rateio (PLARATEIOAP: N/S/R — sin conversión bool) =====
        builder.Property(c => c.AceitaRateio)
            .HasColumnName("PLARATEIOAP")
            .HasMaxLength(1);

        // ===== Conversão de Moeda =====
        builder.Property(c => c.ConversaoOficial)
            .HasColumnName("PLATIPCONVOFICIAL")
            .HasMaxLength(1);

        builder.Property(c => c.ConversaoGerencial)
            .HasColumnName("PLATIPCONVGER")
            .HasMaxLength(1);

        builder.Property(c => c.ConversaoGerencial2)
            .HasColumnName("PLATIPCONVGEREN1")
            .HasMaxLength(1);

        builder.Property(c => c.ConversaoGerencial3)
            .HasColumnName("PLATIPCONVGEREN2")
            .HasMaxLength(1);

        // ===== Sub-grupos =====
        builder.Property(c => c.SubGrupo1)
            .HasColumnName("IDSUBGRUPO1");

        builder.Property(c => c.SubGrupo2)
            .HasColumnName("IDSUBGRUPO2");

        builder.Property(c => c.SubGrupo3)
            .HasColumnName("IDSUBGRUPO3");

        builder.Property(c => c.SubGrupo4)
            .HasColumnName("IDSUBGRUPO4");

        // ===== Moeda e Juros =====
        builder.Property(c => c.MoedaId)
            .HasColumnName("IDMOEDA");

        builder.Property(c => c.ContrapartidaJuros)
            .HasColumnName("PLACONTRAPARTIDAJUROS")
            .HasMaxLength(20);

        builder.Property(c => c.TaxaJuros)
            .HasColumnName("PLATAXAJUROS")
            .HasPrecision(5, 2);

        // ===== Contas de Relación =====
        builder.Property(c => c.Contrapartida)
            .HasColumnName("PLACONTRAPARTIDA")
            .HasMaxLength(20);

        builder.Property(c => c.ContaSegregacao)
            .HasColumnName("PLACONTASEGREG")
            .HasMaxLength(20);

        builder.Property(c => c.ContaSegregacaoFdoAdmCred)
            .HasColumnName("PLACONTASEGREGFDOADCRED")
            .HasMaxLength(20);

        builder.Property(c => c.ContaSegregacaoFdoAdmDeb)
            .HasColumnName("PLACONTASEGREGFDOADDEB")
            .HasMaxLength(20);

        builder.Property(c => c.ContaAglutinacao)
            .HasColumnName("PLACONTAAGLUTINACAO")
            .HasMaxLength(20);

        builder.Property(c => c.ContaExtracontabil)
            .HasColumnName("PLAEXTRACONTABIL")
            .HasMaxLength(20);

        // ===== Segregação e Rateio =====
        builder.Property(c => c.SegregacaoCriterId)
            .HasColumnName("IDSEGREGACRITER");

        builder.Property(c => c.ProgramaId)
            .HasColumnName("IDPROGRAMA");

        builder.Property(c => c.RateioPlanoAdmId)
            .HasColumnName("IDRATADMPLANPATRO");

        // ===== Observações =====
        builder.Property(c => c.Observacoes)
            .HasColumnName("OBSERVACAO")
            .HasMaxLength(4000);

        // ===== Auditoría =====
        builder.Property(c => c.UsuarioInclusao)
            .HasColumnName("IDUSUARIOINCLUSAO");

        builder.Property(c => c.CreatedAt)
            .HasColumnName("DTINCLUSAO")
            .HasDefaultValueSql("SYSDATE");

        builder.Property(c => c.UpdatedAt)
            .HasColumnName("DTALTERACAO");

        // ===== Índices =====
        builder.HasIndex(c => c.Descricao);
        builder.HasIndex(c => c.CodigoReduzido).IsUnique();
        builder.HasIndex(c => c.Tipo);
        builder.HasIndex(c => c.Inativa);
        builder.HasIndex(c => c.Grupo);
        builder.HasIndex(c => c.Nivel);
    }

    /// <summary>
    /// Conversor reutilizable para bool? → "S"/"N"/null
    /// </summary>
    private static readonly ValueConverter<bool?, string?> BoolConverter =
        new(
            v => v.HasValue ? (v.Value ? "S" : "N") : null,
            v => v == "S" ? true : (v == "N" ? false : null)
        );
}
