using ContabPOC.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ContabPOC.Infrastructure.Persistence.Configuration;

/// <summary>
/// Configuração EF Core para a entidade Moeda
/// Tabela Oracle: MOEDA
/// Migração de: FCadContasContabMT.pas → CdsMoeda
///   dblkMoeda (TwwDBLookupCombo) → LookupTable = CdsMoeda
///   SELECT MOECODIGO, MOEDESC, MOESIGLA FROM MOEDA ORDER BY 2
/// </summary>
public class MoedaConfiguration : IEntityTypeConfiguration<Moeda>
{
    public void Configure(EntityTypeBuilder<Moeda> builder)
    {
        builder.ToTable("MOEDA");

        builder.HasKey(m => m.Id);

        builder.Property(m => m.Id)
            .HasColumnName("MOECODIGO")
            .IsRequired();

        builder.Property(m => m.Descricao)
            .HasColumnName("MOEDESC")
            .HasMaxLength(50)
            .IsRequired();

        builder.Property(m => m.Sigla)
            .HasColumnName("MOESIGLA")
            .HasMaxLength(10);

        builder.HasIndex(m => m.Descricao);
    }
}
