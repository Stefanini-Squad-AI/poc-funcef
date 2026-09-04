// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application;
using FuncefORM.Data;
using FuncefEssenciais.Http.Controllers;
using Funcef.Abstractions.Telemetry;
using FuncefAutenticacao.Authorization;
using Microsoft.AspNetCore.Mvc;
using TemplateBase.Application.Commands.Cliente.Create;
using TemplateBase.Application.Commands.Cliente.CreateComOrdemDapper;
using TemplateBase.Application.Commands.Cliente.CreateComOrdemEf;
using TemplateBase.Application.Commands.Cliente.Delete;
using TemplateBase.Application.Commands.Cliente.Update;
using TemplateBase.Application.DTOs.ClienteDto.Request;
using TemplateBase.Application.DTOs.ClienteDto.Response;
using TemplateBase.Application.DTOs.ClienteDto.Resume;
using TemplateBase.Application.Queries.Cliente.GetById;
using TemplateBase.Application.Queries.Cliente.GetPaged;

namespace TemplateBase.API.Controllers;

/// <summary>
/// Controller para gerenciamento de clientes.
/// </summary>
/// <remarks>
/// Inicializa o controller com telemetria e mediator.
/// </remarks>
[Route("[controller]")]
[ApiController]
public class ClientesController(ITelemetry telemetry, IMediator mediator) : BaseController(telemetry)
{
    private readonly IMediator _mediator = mediator;

    /// <summary>
    /// Lista todos os clientes com paginação.
    /// </summary>
    /// <param name="pagina">Número da página.</param>
    /// <param name="tamanhoPagina">Tamanho da página.</param>
    /// <param name="termoBusca">Termo de busca por nome ou email.</param>
    /// <param name="ordenarPor">Campo para ordenação.</param>
    /// <param name="direcaoOrdenacao">Direção da ordenação (asc/desc).</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Lista paginada de clientes.</returns>
    [HttpGet]
    [FuncefAuthorize(Acao = "Funcef.Template/clientes/read")]
    [ProducesResponseType(typeof(PaginatedResult<ClienteResume>), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> GetAll(
        [FromQuery] int pagina = 1,
        [FromQuery] int tamanhoPagina = 10,
        [FromQuery] string? termoBusca = null,
        [FromQuery] string? ordenarPor = null,
        [FromQuery] string direcaoOrdenacao = "asc",
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Receive(new GetClientePagedQuery
        {
            Pagina = pagina,
            TamanhoPagina = tamanhoPagina,
            TermoBusca = termoBusca,
            OrdenarPor = ordenarPor,
            DirecaoOrdenacao = direcaoOrdenacao
        }, cancellationToken);

        return ApiOk(result);
    }

    /// <summary>
    /// Obtém um cliente por ID.
    /// </summary>
    /// <param name="id">Identificador do cliente.</param>
    /// <param name="incluirOrdens">Incluir ordens do cliente.</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Cliente encontrado.</returns>
    [HttpGet("{id:long}")]
    [FuncefAuthorize(Acao = "Funcef.Template/clientes/read")]
    [ProducesResponseType(typeof(ClienteResponse), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Get(
        long id,
        [FromQuery] bool incluirOrdens = false,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Receive(
            new GetClienteByIdQuery { Id = id, IncluirOrdens = incluirOrdens },
            cancellationToken);

        return ApiOk(result);
    }

    /// <summary>
    /// Cria um novo cliente.
    /// </summary>
    /// <param name="request">Dados do cliente.</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Cliente criado.</returns>
    [HttpPost]
    [FuncefAuthorize(Acao = "Funcef.Template/clientes/write")]
    [ProducesResponseType(typeof(ClienteResponse), StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    [ProducesResponseType(StatusCodes.Status409Conflict)]
    public async Task<IActionResult> Create(
        [FromBody] ClienteRequest request,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Send(
            new CreateClienteCommand { Request = request },
            cancellationToken);

        return ApiCreated(result);
    }

    /// <summary>
    /// Cria um cliente com sua primeira ordem em uma única transação (EF Core).
    /// </summary>
    /// <remarks>
    /// Utiliza transações explícitas com Begin/Commit/Rollback via EF Core.
    /// Use <c>/com-ordem-dapper</c> para a versão com Dapper (SQL direto).
    /// </remarks>
    /// <param name="request">Dados do cliente e da ordem.</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Cliente e ordem criados.</returns>
    [HttpPost("com-ordem")]
    [FuncefAuthorize(Acao = "Funcef.Template/clientes/write")]
    [ProducesResponseType(typeof(ClienteComOrdemResponse), StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    [ProducesResponseType(StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> CreateComOrdem(
        [FromBody] ClienteComOrdemRequest request,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Send(
            new CreateClienteComOrdemEfCommand { Request = request },
            cancellationToken);

        return ApiCreated(result);
    }

    /// <summary>
    /// Cria um cliente com sua primeira ordem em uma única transação (Dapper).
    /// </summary>
    /// <remarks>
    /// Utiliza transações explícitas com Dapper (SQL direto).
    /// Use <c>/com-ordem</c> para a versão com EF Core.
    /// </remarks>
    /// <param name="request">Dados do cliente e da ordem.</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Cliente e ordem criados.</returns>
    [HttpPost("com-ordem-dapper")]
    [FuncefAuthorize(Acao = "Funcef.Template/clientes/write")]
    [ProducesResponseType(typeof(ClienteComOrdemResponse), StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    [ProducesResponseType(StatusCodes.Status500InternalServerError)]
    public async Task<IActionResult> CreateComOrdemDapper(
        [FromBody] ClienteComOrdemRequest request,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Send(
            new CreateClienteComOrdemDapperCommand { Request = request },
            cancellationToken);

        return ApiCreated(result);
    }

    /// <summary>
    /// Atualiza um cliente existente.
    /// </summary>
    /// <param name="id">Identificador do cliente.</param>
    /// <param name="request">Dados para atualização.</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Cliente atualizado.</returns>
    [HttpPut("{id:long}")]
    [FuncefAuthorize(Acao = "Funcef.Template/clientes/write")]
    [ProducesResponseType(typeof(ClienteResponse), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status409Conflict)]
    public async Task<IActionResult> Update(
        long id,
        [FromBody] ClienteRequest request,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Send(
            new UpdateClienteCommand { Id = id, Request = request },
            cancellationToken);

        return ApiOk(result);
    }

    /// <summary>
    /// Exclui um cliente.
    /// </summary>
    /// <param name="id">Identificador do cliente.</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Resultado da operação.</returns>
    [HttpDelete("{id:long}")]
    [FuncefAuthorize(Acao = "Funcef.Template/clientes/write")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status409Conflict)]
    public async Task<IActionResult> Delete(
        long id,
        CancellationToken cancellationToken = default)
    {
        await _mediator.Send(new DeleteClienteCommand { Id = id }, cancellationToken);
        return ApiNoContent();
    }
}
