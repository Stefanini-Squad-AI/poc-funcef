// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using System.Linq.Expressions;
using Funcef.Abstractions.Pagination;
using FuncefORM.Data;
using TemplateBase.Application.DTOs.OrdemDto.Request;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Application.Services;

/// <summary>
/// Resultado de uma atualização de ordem: a entidade já alterada e o status anterior à mudança.
/// </summary>
/// <remarks>
/// O status anterior permite ao Handler registrar o histórico (MongoDB) <em>após</em> o commit
/// da transação relacional. Gravar o histórico antes do commit deixaria no MongoDB um registro
/// de mudança que nunca aconteceu no Oracle caso o <c>SaveChangesAsync</c> falhasse.
/// </remarks>
public sealed record OrdemAtualizada(Ordem Ordem, string? StatusAnterior);

/// <summary>
/// Contrato para o serviço de negócio de ordens.
/// </summary>
public interface IOrdemService
{
    Task<Ordem> CreateAsync(CreateOrdemRequest request, CancellationToken cancellationToken = default);
    Task<OrdemAtualizada> UpdateAsync(long id, UpdateOrdemRequest request, CancellationToken cancellationToken = default);
    Task<OrdemAtualizada> UpdateStatusAsync(long id, UpdateOrdemStatusRequest request, CancellationToken cancellationToken = default);
    Task ValidateAndDeleteAsync(long id, CancellationToken cancellationToken = default);
    Task<long> CreateWithDapperAsync(long clienteId, decimal valor, string? observacoes, DateTime dataAtual, CancellationToken cancellationToken = default);
    Task<Ordem?> GetByIdAsync(long id, CancellationToken cancellationToken = default);
    Task<Ordem?> GetByIdWithAutoIncludesAsync(long id, CancellationToken cancellationToken = default);
    Task<PaginatedResult<Ordem>> GetPagedAsync(PagedRequest request, Expression<Func<Ordem, bool>>? predicate = null, CancellationToken cancellationToken = default);
    Task<bool> ExistsAsync(Expression<Func<Ordem, bool>> predicate, CancellationToken cancellationToken = default);
}
