using ContabPOC.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ContabPOC.Infrastructure.Persistence.Configuration;

/// <summary>
/// Configuração EF Core para a entidade SubGrupo
/// Tabela Oracle: SUBGRUPO
/// Migração de: FCadContasContabMT.pas → CdsSubGrupo
///   dblkSubGrupo1..4 (TwwDBLookupCombo) → LookupTable = CdsSubGrupo
///   SELECT CODSUBGRP, DESCSUBGRP FROM SUBGRUPO ORDER BY 2
/// </summary>
public class SubGrupoConfiguration : IEntityTypeConfiguration<SubGrupo>
{
    public void Configure(EntityTypeBuilder<SubGrupo> builder)
    {
        builder.ToTable("SUBGRUPO");

        builder.HasKey(s => s.Id);

        builder.Property(s => s.Id)
            .HasColumnName("CODSUBGRP")
            .IsRequired();

        builder.Property(s => s.Descricao)
            .HasColumnName("DESCSUBGRP")
            .HasMaxLength(100)
            .IsRequired();

        builder.HasIndex(s => s.Descricao);
    }
}
