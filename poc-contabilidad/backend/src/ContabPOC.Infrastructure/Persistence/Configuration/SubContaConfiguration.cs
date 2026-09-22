using ContabPOC.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ContabPOC.Infrastructure.Persistence.Configuration;

/// <summary>
/// Configuração EF Core para a entidade SubConta
/// Tabela Oracle: SUBCONTA
/// Migração de: FCadSubContaMT.pas / FCadContasContabMT.pas → TabSheet5
///   PK compuesta: (IDPESSOA, CODSUBCONTA)
/// </summary>
public class SubContaConfiguration : IEntityTypeConfiguration<SubConta>
{
    public void Configure(EntityTypeBuilder<SubConta> builder)
    {
        builder.ToTable("SUBCONTA");

        builder.HasKey(s => new { s.IdPessoa, s.CodSubConta });

        builder.Property(s => s.IdPessoa)
            .HasColumnName("IDPESSOA")
            .IsRequired();

        builder.Property(s => s.CodSubConta)
            .HasColumnName("CODSUBCONTA")
            .IsRequired();

        builder.Property(s => s.NomeSubConta)
            .HasColumnName("NOMESUBCONTA")
            .HasMaxLength(60)
            .IsRequired();

        builder.Property(s => s.Ativo)
            .HasColumnName("ATIVO")
            .HasMaxLength(1)
            .HasDefaultValue("S")
            .IsRequired();
    }
}
