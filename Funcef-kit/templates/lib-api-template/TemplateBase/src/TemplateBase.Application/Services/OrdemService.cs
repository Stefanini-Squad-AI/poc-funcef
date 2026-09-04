// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using System.Data;
using System.Linq.Expressions;
using Dapper;
using FuncefEssenciais.Exceptions;
using Funcef.Abstractions.Pagination;
using FuncefORM.Contracts;
using FuncefORM.Data;
using TemplateBase.Application.DTOs.OrdemDto.Request;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Application.Services;

/// <summary>
/// Serviço de negócio para operações sobre ordens.
/// Encapsula validações e regras de domínio, delegando acesso a dados ao <see cref="IRepository{TEntity}"/>.
/// </summary>
public class OrdemService : IOrdemService
{
    private readonly IRepository<Ordem> _repository;
    private readonly IRepository<Cliente> _clienteRepository;

    public OrdemService(
        IRepository<Ordem> repository,
        IRepository<Cliente> clienteRepository)
    {
        _repository = repository;
        _clienteRepository = clienteRepository;
    }

    /// <summary>
    /// Cria uma nova ordem após validar existência do cliente.
    /// </summary>
    /// <remarks>
    /// As invariantes (valor válido, status inicial <c>Pendente</c>, colunas de controle) são
    /// garantidas pela factory <c>Ordem.Criar</c> — DDD. O serviço fica com a regra que envolve
    /// OUTRO agregado: a existência do cliente.
    /// </remarks>
    public virtual async Task<Ordem> CreateAsync(CreateOrdemRequest request, CancellationToken cancellationToken = default)
    {
        var cliente = await _clienteRepository.GetByIdAsync(request.ClienteId, cancellationToken: cancellationToken)
            ?? throw NotFoundException.ForResource("Cliente", request.ClienteId);

        var entity = Ordem.Criar(cliente, request.Valor, request.Observacoes);

        await _repository.AddAsync(entity, cancellationToken);
        return entity;
    }

    /// <summary>
    /// Atualiza uma ordem existente após validar status.
    /// </summary>
    /// <returns>
    /// A ordem atualizada e o status anterior — o Handler usa o status anterior para registrar
    /// o histórico (MongoDB) após o commit da transação relacional.
    /// </returns>
    public virtual async Task<OrdemAtualizada> UpdateAsync(long id, UpdateOrdemRequest request, CancellationToken cancellationToken = default)
    {
        var ordem = await _repository.GetByIdWithAutoIncludesAsync(id, cancellationToken: cancellationToken)
            ?? throw NotFoundException.ForResource("Ordem", id);

        var statusAnterior = ordem.Status;

        // Invariantes e máquina de estados aplicadas pela própria entidade (DDD).
        ordem.Atualizar(request.Valor, request.Status, request.Observacoes);

        await _repository.UpdateAsync(ordem, cancellationToken);
        return new OrdemAtualizada(ordem, statusAnterior);
    }

    /// <summary>
    /// Atualiza exclusivamente o status de uma ordem.
    /// </summary>
    /// <returns>
    /// A ordem atualizada e o status anterior — o Handler usa o status anterior para registrar
    /// o histórico (MongoDB) após o commit da transação relacional.
    /// </returns>
    public virtual async Task<OrdemAtualizada> UpdateStatusAsync(long id, UpdateOrdemStatusRequest request, CancellationToken cancellationToken = default)
    {
        var ordem = await _repository.GetByIdWithAutoIncludesAsync(id, cancellationToken: cancellationToken)
            ?? throw NotFoundException.ForResource("Ordem", id);

        var statusAnterior = ordem.Status;

        // Transição validada pela máquina de estados da entidade (StatusOrdem).
        ordem.AlterarStatus(request.Status);

        await _repository.UpdateAsync(ordem, cancellationToken);
        return new OrdemAtualizada(ordem, statusAnterior);
    }

    /// <summary>
    /// Valida regras de exclusão e remove a ordem.
    /// </summary>
    public virtual async Task ValidateAndDeleteAsync(long id, CancellationToken cancellationToken = default)
    {
        var ordem = await _repository.GetByIdAsync(id, cancellationToken: cancellationToken)
            ?? throw NotFoundException.ForResource("Ordem", id);

        // Regra de exclusão vive na entidade (StatusOrdem.ProtegidosContraExclusao).
        ordem.ValidarExclusao();

        await _repository.DeleteAsync(ordem, cancellationToken);
    }

    /// <summary>
    /// Cria uma ordem via Dapper (SQL direto) para uso em transações explícitas.
    /// A coluna ORDEM_ID é identity: usa <c>RETURNING</c> para obter o Id gerado pelo banco.
    /// </summary>
    /// <remarks>
    /// ATENÇÃO — auditoria: o INSERT via Dapper NÃO passa pelo interceptor de <c>SaveChanges</c>
    /// do EF Core, portanto o registro criado por este caminho NÃO entra na trilha de auditoria
    /// <c>[Auditable]</c> (Oracle Lakehouse). Se a entidade exigir trilha de auditoria completa,
    /// use o fluxo EF ou registre a auditoria explicitamente.
    /// </remarks>
    /// <returns>O identificador (ORDEM_ID) gerado pelo banco.</returns>
    public virtual async Task<long> CreateWithDapperAsync(
        long clienteId,
        decimal valor,
        string? observacoes,
        DateTime dataAtual,
        CancellationToken cancellationToken = default)
    {
        const string sql = @"
            INSERT INTO TEMPLATETESTE.TB_ORDENS (CLIENTE_ID, VALOR, STATUS, OBSERVACOES, DATA_PEDIDO, DATA_INCLUSAO_ALTERACAO)
            VALUES (:ClienteId, :Valor, :Status, :Observacoes, :DataPedido, :DataInclusaoAlteracao)
            RETURNING ORDEM_ID INTO :Id";

        var parameters = new DynamicParameters();
        parameters.Add("ClienteId", clienteId, DbType.Int64);
        parameters.Add("Valor", valor, DbType.Decimal);
        parameters.Add("Status", StatusOrdem.Pendente, DbType.String);
        parameters.Add("Observacoes", observacoes, DbType.String);
        parameters.Add("DataPedido", dataAtual, DbType.DateTime);
        parameters.Add("DataInclusaoAlteracao", dataAtual, DbType.DateTime);
        parameters.Add("Id", dbType: DbType.Int64, direction: ParameterDirection.Output);

        await _repository.ExecuteAsync(sql, parameters, cancellationToken);
        return parameters.Get<long>("Id");
    }

    public virtual Task<Ordem?> GetByIdAsync(long id, CancellationToken cancellationToken = default)
        => _repository.GetByIdAsync(id, cancellationToken: cancellationToken);

    public virtual Task<Ordem?> GetByIdWithAutoIncludesAsync(long id, CancellationToken cancellationToken = default)
        => _repository.GetByIdWithAutoIncludesAsync(id, cancellationToken: cancellationToken);

    public virtual Task<PaginatedResult<Ordem>> GetPagedAsync(
        PagedRequest request,
        Expression<Func<Ordem, bool>>? predicate = null,
        CancellationToken cancellationToken = default)
        => _repository.GetPagedAsync(request, predicate, cancellationToken: cancellationToken);

    public virtual Task<bool> ExistsAsync(
        Expression<Func<Ordem, bool>> predicate,
        CancellationToken cancellationToken = default)
        => _repository.ExistsAsync(predicate, cancellationToken: cancellationToken);

}
