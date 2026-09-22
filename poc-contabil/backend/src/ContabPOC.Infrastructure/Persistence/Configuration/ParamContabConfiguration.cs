using ContabPOC.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ContabPOC.Infrastructure.Persistence.Configuration;

/// <summary>
/// Configuração EF Core para a entidade ParamContab
/// Tabela Oracle: PARAMCONTAB
/// Migração de: uDbParamcontab.pas / uCtrlContab.pas
/// Colunas com prefixo PAC (Parâmetros Contábeis)
/// </summary>
public class ParamContabConfiguration : IEntityTypeConfiguration<ParamContab>
{
    public void Configure(EntityTypeBuilder<ParamContab> builder)
    {
        builder.ToTable("PARAMCONTAB");

        builder.HasKey(p => p.IdPessoa);

        builder.Property(p => p.IdPessoa)
            .HasColumnName("IDPESSOA")
            .IsRequired();

        builder.Property(p => p.MoedaOficial)
            .HasColumnName("PACMOEDAOFICIAL")
            .HasDefaultValue(0);

        builder.Property(p => p.MoedaGerencial)
            .HasColumnName("PACMOEDAGERENCIAL")
            .HasDefaultValue(0);

        builder.Property(p => p.MoedaGeren1)
            .HasColumnName("PACMOEDAGEREN1")
            .HasDefaultValue(0);

        builder.Property(p => p.MoedaGeren2)
            .HasColumnName("PACMOEDAGEREN2")
            .HasDefaultValue(0);

        // Contadores de PLAREDUZ por grupo (legacy: uDbParamcontab.pas)
        builder.Property(p => p.PacReduzA)
            .HasColumnName("PACREDUZA")
            .HasDefaultValue(0);

        builder.Property(p => p.PacReduzP)
            .HasColumnName("PACREDUZP")
            .HasDefaultValue(0);

        builder.Property(p => p.PacReduzR)
            .HasColumnName("PACREDUZR")
            .HasDefaultValue(0);

        builder.Property(p => p.PacReduzD)
            .HasColumnName("PACREDUZD")
            .HasDefaultValue(0);

        builder.Property(p => p.PacReduzC)
            .HasColumnName("PACREDUZC")
            .HasDefaultValue(0);

        builder.Property(p => p.PacReduzE)
            .HasColumnName("PACREDUZE")
            .HasDefaultValue(0);

        builder.Property(p => p.PacReduzO)
            .HasColumnName("PACREDUZO")
            .HasDefaultValue(0);
    }
}
