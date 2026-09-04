// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using System.Linq.Expressions;
using Funcef.Abstractions.Pagination;
using FuncefORM.Data;
using TemplateBase.Application.DTOs.ClienteDto.Request;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Application.Services;

/// <summary>
/// Contrato para o serviço de negócio de clientes.
/// </summary>
public interface IClienteService
{
    Task<Cliente> CreateAsync(ClienteRequest request, CancellationToken cancellationToken = default);
    Task<Cliente> UpdateAsync(long id, ClienteRequest request, CancellationToken cancellationToken = default);
    Task ValidateAndDeleteAsync(long id, CancellationToken cancellationToken = default);
    Task<long> CreateWithDapperAsync(ClienteComOrdemRequest request, DateTime dataAtual, CancellationToken cancellationToken = default);
    Task<Cliente?> GetByIdAsync(long id, CancellationToken cancellationToken = default);
    Task<Cliente?> GetByIdWithAutoIncludesAsync(long id, CancellationToken cancellationToken = default);
    Task<PaginatedResult<Cliente>> GetPagedAsync(PagedRequest request, Expression<Func<Cliente, bool>>? predicate = null, CancellationToken cancellationToken = default);
    Task<bool> ExistsAsync(Expression<Func<Cliente, bool>> predicate, CancellationToken cancellationToken = default);
}
