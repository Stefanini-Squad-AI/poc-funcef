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
using TemplateBase.Application.DTOs.ClienteDto.Request;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Application.Services;

/// <summary>
/// Serviço de negócio para operações sobre clientes.
/// Encapsula validações e regras de domínio, delegando acesso a dados ao <see cref="IRepository{TEntity}"/>.
/// </summary>
public class ClienteService : IClienteService
{
    private readonly IRepository<Cliente> _repository;
    private readonly IRepository<Ordem> _ordemRepository;

    public ClienteService(
        IRepository<Cliente> repository,
        IRepository<Ordem> ordemRepository)
    {
        _repository = repository;
        _ordemRepository = ordemRepository;
    }

    /// <summary>
    /// Cria um novo cliente após validar unicidade de e-mail.
    /// </summary>
    /// <remarks>
    /// As invariantes da entidade (nome obrigatório, limites de tamanho) são garantidas pela
    /// factory <c>Cliente.Criar</c> — DDD. O serviço fica com a regra que envolve OUTROS
    /// registros: unicidade de e-mail (que só o banco garante de verdade, via
    /// <c>UK_CLIENTES_EMAIL</c>; a checagem aqui é a resposta 409 amigável).
    /// </remarks>
    public virtual async Task<Cliente> CreateAsync(ClienteRequest request, CancellationToken cancellationToken = default)
    {
        if (!string.IsNullOrEmpty(request.Email)
            && await _repository.ExistsAsync(c => c.Email == request.Email, cancellationToken: cancellationToken))
        {
            throw new ConflictException("Cliente", "Já existe um cliente com este email");
        }

        var entity = Cliente.Criar(request.Nome, request.Email);

        await _repository.AddAsync(entity, cancellationToken);
        return entity;
    }

    /// <summary>
    /// Atualiza um cliente existente após validar existência e unicidade de e-mail.
    /// </summary>
    public virtual async Task<Cliente> UpdateAsync(long id, ClienteRequest request, CancellationToken cancellationToken = default)
    {
        var cliente = await _repository.GetByIdAsync(id, cancellationToken: cancellationToken)
            ?? throw NotFoundException.ForResource("Cliente", id);

        if (!string.IsNullOrEmpty(request.Email))
        {
            var clienteExistente = await _repository.GetFirstAsync(
                c => c.Email == request.Email && c.Id != id, cancellationToken: cancellationToken);

            if (clienteExistente != null)
                throw new ConflictException("Cliente", "Já existe outro cliente com este email");
        }

        cliente.AtualizarDados(request.Nome, request.Email);

        await _repository.UpdateAsync(cliente, cancellationToken);
        return cliente;
    }

    /// <summary>
    /// Valida regras de exclusão e remove o cliente.
    /// </summary>
    public virtual async Task ValidateAndDeleteAsync(long id, CancellationToken cancellationToken = default)
    {
        var cliente = await _repository.GetByIdAsync(id, cancellationToken: cancellationToken)
            ?? throw NotFoundException.ForResource("Cliente", id);

        var temOrdens = await _ordemRepository.ExistsAsync(
            o => o.ClienteId == id, cancellationToken: cancellationToken);

        if (temOrdens)
            throw new ConflictException("Cliente", "Não é possível excluir cliente que possui ordens");

        await _repository.DeleteAsync(cliente, cancellationToken);
    }

    /// <summary>
    /// Cria um cliente via Dapper (SQL direto) para uso em transações explícitas.
    /// A coluna CLIENTE_ID é identity: usa <c>RETURNING</c> para obter o Id gerado pelo banco.
    /// </summary>
    /// <remarks>
    /// <para>
    /// Aplica a MESMA regra de unicidade de e-mail de <see cref="CreateAsync"/> — os fluxos de
    /// criação (EF e Dapper) devem ser equivalentes em regra de negócio, senão o comportamento
    /// do sistema passa a depender de qual endpoint foi chamado.
    /// </para>
    /// <para>
    /// ATENÇÃO — auditoria: o INSERT via Dapper NÃO passa pelo interceptor de <c>SaveChanges</c>
    /// do EF Core, portanto o registro criado por este caminho NÃO entra na trilha de auditoria
    /// <c>[Auditable]</c> (Oracle Lakehouse). Se a entidade exigir trilha de auditoria completa,
    /// use o fluxo EF ou registre a auditoria explicitamente.
    /// </para>
    /// </remarks>
    /// <returns>O identificador (CLIENTE_ID) gerado pelo banco.</returns>
    public virtual async Task<long> CreateWithDapperAsync(
        ClienteComOrdemRequest request,
        DateTime dataAtual,
        CancellationToken cancellationToken = default)
    {
        if (!string.IsNullOrEmpty(request.EmailCliente)
            && await _repository.ExistsAsync(c => c.Email == request.EmailCliente, cancellationToken: cancellationToken))
        {
            throw new ConflictException("Cliente", "Já existe um cliente com este email");
        }

        const string sql = @"
            INSERT INTO TEMPLATETESTE.TB_CLIENTES (NOME, EMAIL, DATA_CRIACAO, DATA_INCLUSAO_ALTERACAO)
            VALUES (:Nome, :Email, :DataCriacao, :DataInclusaoAlteracao)
            RETURNING CLIENTE_ID INTO :Id";

        var parameters = new DynamicParameters();
        parameters.Add("Nome", request.NomeCliente, DbType.String);
        parameters.Add("Email", request.EmailCliente, DbType.String);
        parameters.Add("DataCriacao", dataAtual, DbType.DateTime);
        parameters.Add("DataInclusaoAlteracao", dataAtual, DbType.DateTime);
        parameters.Add("Id", dbType: DbType.Int64, direction: ParameterDirection.Output);

        await _repository.ExecuteAsync(sql, parameters, cancellationToken);
        return parameters.Get<long>("Id");
    }

    public virtual Task<Cliente?> GetByIdAsync(long id, CancellationToken cancellationToken = default)
        => _repository.GetByIdAsync(id, cancellationToken: cancellationToken);

    public virtual Task<Cliente?> GetByIdWithAutoIncludesAsync(long id, CancellationToken cancellationToken = default)
        => _repository.GetByIdWithAutoIncludesAsync(id, cancellationToken: cancellationToken);

    public virtual Task<PaginatedResult<Cliente>> GetPagedAsync(
        PagedRequest request,
        Expression<Func<Cliente, bool>>? predicate = null,
        CancellationToken cancellationToken = default)
        => _repository.GetPagedAsync(request, predicate, cancellationToken: cancellationToken);

    public virtual Task<bool> ExistsAsync(
        Expression<Func<Cliente, bool>> predicate,
        CancellationToken cancellationToken = default)
        => _repository.ExistsAsync(predicate, cancellationToken: cancellationToken);
}
