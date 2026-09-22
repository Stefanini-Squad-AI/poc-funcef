using ContabPOC.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ContabPOC.Infrastructure.Persistence.Configuration;

/// <summary>
/// Configuração EF Core para a entidade ContasxCC
/// Tabela Oracle: CONTASXCC
/// Migração de: FCadContasContabMT.pas → CdsContasxCC
///   PK: IDCONTACC (sequence SEQ_CONTASXCC)
/// </summary>
public class ContasxCCConfiguration : IEntityTypeConfiguration<ContasxCC>
{
    public void Configure(EntityTypeBuilder<ContasxCC> builder)
    {
        builder.ToTable("CONTASXCC");

        builder.HasKey(c => c.IdContaCc);

        builder.Property(c => c.IdContaCc)
            .HasColumnName("IDCONTACC")
            .ValueGeneratedOnAdd()
            .IsRequired();

        builder.Property(c => c.Plano)
            .HasColumnName("PLANO")
            .IsRequired();

        builder.Property(c => c.PlacConta)
            .HasColumnName("PLACONTA")
            .HasMaxLength(20)
            .IsRequired();

        builder.Property(c => c.CodCentroCusto)
            .HasColumnName("CODCENTROCUSTO")
            .HasMaxLength(20)
            .IsRequired();

        builder.Property(c => c.DtInclusao)
            .HasColumnName("DTINCLUSAO")
            .HasDefaultValueSql("SYSDATE");

        builder.Property(c => c.IdEmpresa)
            .HasColumnName("IDEMPRESA")
            .HasDefaultValue(1)
            .IsRequired();

        builder.Property(c => c.IdUsuarioInclusao)
            .HasColumnName("IDUSUARIOINCLUSAO")
            .HasDefaultValue(0);
    }
}
