using ContabPOC.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ContabPOC.Infrastructure.Persistence.Configuration;

/// <summary>
/// Configuração EF Core para a entidade ContasxSC
/// Tabela Oracle: CONTASXSUBC
/// Migração de: FCadContasContabMT.pas → CdsContasxSC
///   PK compuesta: (IDPESSOA, PLANO, PLACONTA, CODSUBCONTA)
/// </summary>
public class ContasxSCConfiguration : IEntityTypeConfiguration<ContasxSC>
{
    public void Configure(EntityTypeBuilder<ContasxSC> builder)
    {
        builder.ToTable("CONTASXSUBC");

        builder.HasKey(c => new { c.IdPessoa, c.Plano, c.PlacConta, c.CodSubConta });

        builder.Property(c => c.IdPessoa)
            .HasColumnName("IDPESSOA")
            .IsRequired();

        builder.Property(c => c.IdUsuario)
            .HasColumnName("IDUSUARIO")
            .HasDefaultValue(0);

        builder.Property(c => c.Plano)
            .HasColumnName("PLANO")
            .IsRequired();

        builder.Property(c => c.PlacConta)
            .HasColumnName("PLACONTA")
            .HasMaxLength(20)
            .IsRequired();

        builder.Property(c => c.CodSubConta)
            .HasColumnName("CODSUBCONTA")
            .IsRequired();

        builder.Property(c => c.NomeSubConta)
            .HasColumnName("NOMESUBCONTA")
            .HasMaxLength(60)
            .IsRequired();

        builder.Property(c => c.DtInclusao)
            .HasColumnName("DTINCLUSAO")
            .HasDefaultValueSql("SYSDATE");
    }
}
