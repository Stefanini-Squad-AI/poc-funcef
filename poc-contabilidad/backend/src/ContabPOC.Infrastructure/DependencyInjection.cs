using ContabPOC.Infrastructure.Persistence.Context;
using FuncefORM.Contracts;
using FuncefORM.Data;
using FuncefORM.Extensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace ContabPOC.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        // DbContext Oracle
        services.AddDbContext<AppDbContext>(options =>
        {
            var connectionString = configuration.GetConnectionString("OracleConnection");
            options.UseOracle(connectionString);
        });

        // FUNCEF ORM (configuração geral: audit, observability, etc.)
        services.AddFuncefORM(configuration, "FuncefORM");

        // Registrar IUnitOfWork e associar com AppDbContext
        services.AddScoped<IUnitOfWork>(sp =>
        {
            var unitOfWork = sp.GetRequiredService<UnitOfWork>();
            var dbContext = sp.GetRequiredService<AppDbContext>();
            unitOfWork.SetDbContext(dbContext);
            return unitOfWork;
        });
        services.AddScoped<UnitOfWork>();

        // Repositories customizados serão registrados aquí
        // services.AddScoped<IContaContabilRepository, ContaContabilRepository>();

        return services;
    }

    public static IServiceCollection AddInfrastructureDevelopment(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        // Configurações específicas de desenvolvimento
        // Ex: Seeders, dados de teste, etc.
        
        return services;
    }
}
