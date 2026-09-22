using ContabPOC.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ContabPOC.Infrastructure.Persistence.Configuration;

/// <summary>
/// Configuração EF Core para a entidade Programa
/// Tabela Oracle: PROGRAMA
/// Migração de: FCadContasContabMT.pas → SqlPrograma (line 1821)
///   SELECT IDPROGRAMA, DESCPROGRAMA FROM PROGRAMA ORDER BY 2
/// </summary>
public class ProgramaConfiguration : IEntityTypeConfiguration<Programa>
{
    public void Configure(EntityTypeBuilder<Programa> builder)
    {
        builder.ToTable("PROGRAMA");

        builder.HasKey(p => p.Id);

        builder.Property(p => p.Id)
            .HasColumnName("IDPROGRAMA")
            .IsRequired();

        builder.Property(p => p.Descricao)
            .HasColumnName("DESCPROGRAMA")
            .HasMaxLength(100)
            .IsRequired();

        builder.HasIndex(p => p.Descricao);
    }
}
