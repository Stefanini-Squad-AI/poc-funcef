using ContabPOC.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ContabPOC.Infrastructure.Persistence.Configuration;

/// <summary>
/// Configuração EF Core para a entidade ParamGlobal
/// Tabela Oracle: PARAMGLOBAL
/// Migração de: uDbParamGlobal.pas / uCtrlParamIntegra.pas
/// </summary>
public class ParamGlobalConfiguration : IEntityTypeConfiguration<ParamGlobal>
{
    public void Configure(EntityTypeBuilder<ParamGlobal> builder)
    {
        builder.ToTable("PARAMGLOBAL");

        builder.HasKey(p => p.IdPessoa);

        builder.Property(p => p.IdPessoa)
            .HasColumnName("IDPESSOA")
            .IsRequired();

        builder.Property(p => p.SegregaVirtual)
            .HasColumnName("FLGSEGREGAVIRTUAL")
            .HasMaxLength(1)
            .IsRequired();

        builder.Property(p => p.SegregaOrAdm)
            .HasColumnName("FLGSEGREGAORADM")
            .HasMaxLength(1)
            .IsRequired();

        builder.Property(p => p.SegregaOrComum)
            .HasColumnName("FLGSEGREGAORCOMUM")
            .HasMaxLength(1)
            .IsRequired();

        builder.Property(p => p.IdPlanoPrevAdm)
            .HasColumnName("IDPLANOPREVADM");

        builder.Property(p => p.IdPatro)
            .HasColumnName("IDPATRO");

        builder.Property(p => p.IdPlanoPrev)
            .HasColumnName("IDPLANOPREV");

        builder.Property(p => p.ObrigaCC)
            .HasColumnName("FLGOBRIGACC")
            .HasMaxLength(1)
            .IsRequired();

        builder.Property(p => p.IdPlanCentCust)
            .HasColumnName("IDPLANCENTCUST");

        builder.Property(p => p.IdPlanCRespon)
            .HasColumnName("IDPLANCRESPON");
    }
}
