using ContabPOC.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ContabPOC.Infrastructure.Persistence.Configuration;

/// <summary>
/// Configuração EF Core para a entidade SegregacaoCriter
/// Tabela Oracle: SEGREGACRITER
/// Migração de: fCadCriterioSegregacao.dfm (MontaSelect: Tabelas='SEGREGACRITER')
/// </summary>
public class SegregacaoCriterConfiguration : IEntityTypeConfiguration<SegregacaoCriter>
{
    public void Configure(EntityTypeBuilder<SegregacaoCriter> builder)
    {
        builder.ToTable("SEGREGACRITER");

        builder.HasKey(s => s.Id);

        builder.Property(s => s.Id)
            .HasColumnName("IDSEGREGACRITER")
            .IsRequired();

        builder.Property(s => s.Descricao)
            .HasColumnName("DESCRICAO")
            .HasMaxLength(60)
            .IsRequired();

        builder.Property(s => s.Ordem)
            .HasColumnName("ORDEM");

        builder.Property(s => s.TipoSegrega)
            .HasColumnName("FLGTIPOSEGREGA")
            .HasMaxLength(1);

        builder.Property(s => s.TipoCotacao)
            .HasColumnName("FLGTIPOCOTACAO")
            .HasMaxLength(1);

        builder.HasIndex(s => s.Descricao);
    }
}
