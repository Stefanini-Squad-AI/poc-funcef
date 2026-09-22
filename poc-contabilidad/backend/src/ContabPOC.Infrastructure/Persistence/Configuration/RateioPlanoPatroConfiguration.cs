using ContabPOC.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ContabPOC.Infrastructure.Persistence.Configuration;

/// <summary>
/// Configuração EF Core para a entidade RateioPlanoPatro
/// Tabela Oracle: RATADMPLANPATRO
/// Migração de: FCadRatAdmPlanoPatroMT.pas
/// </summary>
public class RateioPlanoPatroConfiguration : IEntityTypeConfiguration<RateioPlanoPatro>
{
    public void Configure(EntityTypeBuilder<RateioPlanoPatro> builder)
    {
        builder.ToTable("RATADMPLANPATRO");

        builder.HasKey(r => r.Id);

        builder.Property(r => r.Id)
            .HasColumnName("IDRATADMPLANPATRO")
            .IsRequired();

        builder.Property(r => r.Descricao)
            .HasColumnName("DESCRICAO")
            .HasMaxLength(200)
            .IsRequired();

        builder.Property(r => r.PlanoPrevId)
            .HasColumnName("IDPLANOPREV");

        builder.Property(r => r.PatroId)
            .HasColumnName("IDPATRO");

        builder.Property(r => r.Ativo)
            .HasColumnName("ATIVO")
            .HasMaxLength(1)
            .IsRequired();

        builder.Property(r => r.CreatedAt)
            .HasColumnName("DTINCLUSAO")
            .HasDefaultValueSql("SYSDATE");

        builder.Property(r => r.UpdatedAt)
            .HasColumnName("DTALTERACAO");

        // Índices
        builder.HasIndex(r => r.Descricao);
    }
}
