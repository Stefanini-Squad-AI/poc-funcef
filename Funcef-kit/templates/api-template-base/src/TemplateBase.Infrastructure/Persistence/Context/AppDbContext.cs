using FuncefORM.EFCore;
using Microsoft.EntityFrameworkCore;
// ── EXEMPLO: using das entidades Cliente/Ordem — remova ou substitua ao trocar o domínio ──
using TemplateBase.Domain.Entities;
// ── FIM EXEMPLO ──

namespace TemplateBase.Infrastructure.Persistence.Context;

/// <summary>
/// DbContext principal da aplicação TemplateBase.
/// Herda de <see cref="BaseDbContext"/> do FuncefORM, que fornece automaticamente:
/// interceptor de auditoria, telemetria, detecção de slow queries e resiliência Oracle.
/// </summary>
public class AppDbContext : BaseDbContext
{
    // ── EXEMPLO: DbSet do domínio Cliente/Ordem — remova ou substitua ao trocar o domínio ──
    public DbSet<Cliente> Clientes { get; set; } = null!;

    public DbSet<Ordem> Ordens { get; set; } = null!;
    // ── FIM EXEMPLO ──

    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }

    /// <summary>
    /// Configuração do modelo.
    /// PADRÃO DO PROJETO: Data Annotations nas entidades ([ForeignKey], [AutoInclude])
    /// Fluent API apenas para configurações avançadas (índices compostos, constraints especiais)
    /// </summary>
    /// <param name="modelBuilder">Builder do modelo.</param>
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        // ── EXEMPLO: Fluent API das entidades Cliente/Ordem — remova ou substitua ao trocar o domínio ──
        modelBuilder.Entity<Cliente>(entity =>
        {
            // Espelha a UK_CLIENTES_EMAIL do DDL (scripts/banco-dados). No Oracle a UNIQUE
            // constraint já ignora NULLs — não há índice filtrado como no SQL Server.
            entity.HasIndex(e => e.Email)
                .IsUnique()
                .HasDatabaseName("UK_CLIENTES_EMAIL");
        });

        modelBuilder.Entity<Ordem>(entity =>
        {
            entity.HasOne(e => e.Cliente)
                .WithMany(c => c.Ordens)
                .HasForeignKey(e => e.ClienteId)
                .OnDelete(DeleteBehavior.Restrict);
        });
        // ── FIM EXEMPLO ──
    }
}
