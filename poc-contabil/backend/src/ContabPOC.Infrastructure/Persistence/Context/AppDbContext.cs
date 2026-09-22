using ContabPOC.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace ContabPOC.Infrastructure.Persistence.Context;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }

    public DbSet<ContaContabil> ContasContabeis => Set<ContaContabil>();

    public DbSet<PlanoContabil> PlanosContabeis => Set<PlanoContabil>();

    public DbSet<RateioPlanoPatro> RateiosPlanoPatro => Set<RateioPlanoPatro>();

    public DbSet<SegregacaoCriter> SegregacoesCriter => Set<SegregacaoCriter>();

    public DbSet<Programa> Programas => Set<Programa>();

    public DbSet<ParamGlobal> ParamGlobal => Set<ParamGlobal>();

    public DbSet<SubGrupo> SubGrupos => Set<SubGrupo>();

    public DbSet<Moeda> Moedas => Set<Moeda>();

    public DbSet<ParamContab> ParamContab => Set<ParamContab>();

    public DbSet<CentroCusto> CentrosCusto => Set<CentroCusto>();

    public DbSet<ContasxCC> ContasxCC => Set<ContasxCC>();

    public DbSet<SubConta> SubContas => Set<SubConta>();

    public DbSet<ContasxSC> ContasxSC => Set<ContasxSC>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.ApplyConfigurationsFromAssembly(typeof(AppDbContext).Assembly);
    }
}
