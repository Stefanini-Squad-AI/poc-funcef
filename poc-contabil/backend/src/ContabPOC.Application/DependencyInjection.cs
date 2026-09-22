using System.Reflection;
using FuncefEssenciais.Application.Extensions;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace ContabPOC.Application;

public static class DependencyInjection
{
    public static IServiceCollection AddApplication(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        var assembly = Assembly.GetExecutingAssembly();

        // Mediator + FluentValidation + Pipeline Behaviors (vem do FUNCEF.Essenciais)
        services.AddMediator(assembly);

        return services;
    }
}
