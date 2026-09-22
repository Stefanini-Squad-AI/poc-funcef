using ContabPOC.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ContabPOC.Infrastructure.Persistence.Configuration;

/// <summary>
/// Configuração EF Core para a entidade PlanoContabil
/// Tabela Oracle: PLANO
/// </summary>
public class PlanoContabilConfiguration : IEntityTypeConfiguration<PlanoContabil>
{
    public void Configure(EntityTypeBuilder<PlanoContabil> builder)
    {
        builder.ToTable("PLANO");

        builder.HasKey(p => p.Id);

        builder.Property(p => p.Id)
            .HasColumnName("IDPLANO")
            .IsRequired();

        builder.Property(p => p.Nome)
            .HasColumnName("NOME")
            .HasMaxLength(100)
            .IsRequired();

        builder.Property(p => p.Mascara)
            .HasColumnName("MASCARA")
            .HasMaxLength(50);

        builder.Property(p => p.Ativo)
            .HasColumnName("ATIVO")
            .HasMaxLength(1)
            .IsRequired()
            .HasDefaultValue("S");

        builder.Property(p => p.DtInclusao)
            .HasColumnName("DTINCLUSAO");

        builder.Property(p => p.DtAlteracao)
            .HasColumnName("DTALTERACAO");
    }
}
