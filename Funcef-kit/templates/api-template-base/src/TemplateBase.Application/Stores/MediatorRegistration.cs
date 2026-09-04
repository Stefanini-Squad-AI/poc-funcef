using FuncefEssenciais.Application.Extensions;
using Microsoft.Extensions.DependencyInjection;

namespace TemplateBase.Application.Stores;

/// <summary>
/// Registro do Mediator CQRS: commands, queries, handlers, validators e pipeline behaviors.
/// </summary>
/// <remarks>
/// <para>
/// <c>AddMediatorWithDefaults</c> (FUNCEF.Essenciais) varre o assembly informado via Scrutor e
/// registra por convenção:
/// </para>
/// <list type="bullet">
///   <item><description><c>ICommandHandler&lt;TCommand&gt;</c> / <c>ICommandHandler&lt;TCommand, TResult&gt;</c></description></item>
///   <item><description><c>IQueryHandler&lt;TQuery, TResult&gt;</c></description></item>
///   <item><description><c>IValidator&lt;T&gt;</c> (FluentValidation)</description></item>
///   <item><description><c>ValidationBehavior</c> e demais behaviors do pipeline</description></item>
/// </list>
/// <para>
/// <strong>Não há registro manual de handler:</strong> um caso de uso novo (Command/Query + Handler
/// + Validator) passa a ser resolvido automaticamente pelo <c>IMediator</c> ao ser adicionado ao
/// assembly. Se um handler não é encontrado em runtime, verifique se ele implementa a interface
/// correta — não adicione um <c>AddScoped</c> avulso aqui.
/// </para>
/// </remarks>
internal static class MediatorRegistration
{
    /// <summary>
    /// Registra o Mediator e tudo que é descoberto por convenção no assembly da Application.
    /// </summary>
    internal static IServiceCollection AddMediator(this IServiceCollection services)
    {
        services.AddMediatorWithDefaults(typeof(MediatorRegistration).Assembly);

        return services;
    }
}
