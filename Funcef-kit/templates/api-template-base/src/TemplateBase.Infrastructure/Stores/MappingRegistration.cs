using FuncefORM.Extensions;
using Microsoft.Extensions.DependencyInjection;

namespace TemplateBase.Infrastructure.Stores;

/// <summary>
/// Registro do <strong>object mapper</strong> (FUNCEF.ORM) — mapeamento entidade ↔ DTO.
/// </summary>
/// <remarks>
/// <para>
/// Habilita <c>MapTo&lt;TOrigem, TDestino&gt;()</c> e os atributos <c>[MapFrom]</c>/<c>[NestedMap]</c>
/// usados pelos DTOs da Application. Sem este registro, os handlers lançam ao mapear.
/// </para>
/// <para>Opções:</para>
/// <list type="bullet">
///   <item><description>
///     <c>MaxDepth = 10</c> — limite de profundidade em grafos aninhados; protege contra recursão
///     infinita em referências circulares de entidade.
///   </description></item>
///   <item><description>
///     <c>ThrowOnError = false</c> — propriedade que não casa fica com o valor default em vez de
///     abortar o mapeamento inteiro. Deliberado: um DTO com campo novo ainda não mapeado degrada
///     (campo nulo) em vez de derrubar o endpoint. Em contrapartida, erro de mapeamento é silencioso —
///     cubra o mapeamento com teste (ver <c>tests/Application/DTOs</c>).
///   </description></item>
/// </list>
/// <para>Sem dependência de ordem: último módulo da cadeia, não é consumido no registro.</para>
/// </remarks>
internal static class MappingRegistration
{
    internal static IServiceCollection AddMapping(this IServiceCollection services)
    {
        services.AddObjectMapper(options =>
        {
            options.MaxDepth = 10;
            options.ThrowOnError = false;
        });

        return services;
    }
}
