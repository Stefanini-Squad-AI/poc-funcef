using ContabPOC.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ContabPOC.Infrastructure.Persistence.Configuration;

/// <summary>
/// Configuração EF Core para a entidade CentroCusto
/// Tabela Oracle: CENTCUST
/// Migração de: FCadContasContabMT.pas → TabSheet4 (Centro de Custo)
///   PK compuesta: (IDPESSOA, CODCENTROCUSTO)
/// </summary>
public class CentroCustoConfiguration : IEntityTypeConfiguration<CentroCusto>
{
    public void Configure(EntityTypeBuilder<CentroCusto> builder)
    {
        builder.ToTable("CENTCUST");

        builder.HasKey(c => new { c.IdPessoa, c.CodCentroCusto });

        builder.Property(c => c.IdPessoa)
            .HasColumnName("IDPESSOA")
            .IsRequired();

        builder.Property(c => c.CodCentroCusto)
            .HasColumnName("CODCENTROCUSTO")
            .HasMaxLength(20)
            .IsRequired();

        builder.Property(c => c.Nome)
            .HasColumnName("NOME")
            .HasMaxLength(100)
            .IsRequired();

        builder.Property(c => c.StatusGrupoCdc)
            .HasColumnName("STATUSGRUPOCDC")
            .HasMaxLength(1)
            .IsRequired();

        builder.Property(c => c.CodExterno)
            .HasColumnName("CODEXTERNO")
            .HasMaxLength(20);

        builder.Property(c => c.Ativo)
            .HasColumnName("ATIVO")
            .HasMaxLength(1)
            .IsRequired();

        builder.Property(c => c.IdPlanCentCust)
            .HasColumnName("IDPLANCENTCUST");
    }
}
