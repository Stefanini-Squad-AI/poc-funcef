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
using TemplateBase.Application.Commands.Ordem.Create;
using TemplateBase.Application.Commands.Ordem.Delete;
using TemplateBase.Application.Commands.Ordem.Update;
using TemplateBase.Application.Commands.Ordem.UpdateStatus;
using TemplateBase.Application.DTOs.OrdemDto.Request;
using TemplateBase.Application.DTOs.OrdemDto.Response;
using TemplateBase.Application.DTOs.OrdemDto.Resume;
using TemplateBase.Application.Queries.Ordem.GetById;
using TemplateBase.Application.Queries.Ordem.GetByCliente;
using TemplateBase.Application.Queries.Ordem.GetPaged;

namespace TemplateBase.API.Controllers;

/// <summary>
/// Controller para gerenciamento de ordens.
/// </summary>
[Route("[controller]")]
[ApiController]
public class OrdensController : BaseController
{
    private readonly IMediator _mediator;

    /// <summary>
    /// Inicializa o controller com telemetria e mediator.
    /// </summary>
    public OrdensController(ITelemetry telemetry, IMediator mediator) : base(telemetry)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Lista todas as ordens com paginação e filtros.
    /// </summary>
    /// <param name="pagina">Número da página.</param>
    /// <param name="tamanhoPagina">Tamanho da página.</param>
    /// <param name="status">Filtro por status.</param>
    /// <param name="dataInicio">Filtro por data inicial.</param>
    /// <param name="dataFim">Filtro por data final.</param>
    /// <param name="clienteId">Filtro por cliente.</param>
    /// <param name="ordenarPor">Campo para ordenação.</param>
    /// <param name="direcaoOrdenacao">Direção da ordenação (asc/desc).</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Lista paginada de ordens.</returns>
    [HttpGet]
    [FuncefAuthorize(Acao = "Funcef.Template/ordens/read")]
    [ProducesResponseType(typeof(PaginatedResult<OrdemResume>), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> GetAll(
        [FromQuery] int pagina = 1,
        [FromQuery] int tamanhoPagina = 10,
        [FromQuery] string? status = null,
        [FromQuery] DateTime? dataInicio = null,
        [FromQuery] DateTime? dataFim = null,
        [FromQuery] long? clienteId = null,
        [FromQuery] string? ordenarPor = null,
        [FromQuery] string direcaoOrdenacao = "desc",
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Receive(new GetOrdemPagedQuery
        {
            Pagina = pagina,
            TamanhoPagina = tamanhoPagina,
            Status = status,
            DataInicio = dataInicio,
            DataFim = dataFim,
            ClienteId = clienteId,
            OrdenarPor = ordenarPor,
            DirecaoOrdenacao = direcaoOrdenacao
        }, cancellationToken);

        return ApiOk(result);
    }

    /// <summary>
    /// Obtém uma ordem por ID.
    /// </summary>
    /// <param name="id">Identificador da ordem.</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Ordem encontrada.</returns>
    [HttpGet("{id:long}")]
    [FuncefAuthorize(Acao = "Funcef.Template/ordens/read")]
    [ProducesResponseType(typeof(OrdemResponse), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Get(
        long id,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Receive(
            new GetOrdemByIdQuery { Id = id },
            cancellationToken);

        return ApiOk(result);
    }

    /// <summary>
    /// Obtém o histórico de status de uma ordem (MongoDB via FUNCEF.NoSql).
    /// </summary>
    /// <param name="id">Identificador da ordem.</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Eventos de status da ordem, do mais recente para o mais antigo.</returns>
    [HttpGet("{id:long}/historico")]
    [FuncefAuthorize(Acao = "Funcef.Template/ordens/read")]
    [ProducesResponseType(typeof(List<TemplateBase.Application.Documents.OrdemHistoricoDocumento>), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<IActionResult> GetHistorico(
        long id,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Receive(
            new TemplateBase.Application.Queries.Ordem.GetHistorico.GetOrdemHistoricoQuery { OrdemId = id },
            cancellationToken);

        return ApiOk(result);
    }

    /// <summary>
    /// Obtém ordens de um cliente específico.
    /// </summary>
    /// <param name="clienteId">Identificador do cliente.</param>
    /// <param name="pagina">Número da página.</param>
    /// <param name="tamanhoPagina">Tamanho da página.</param>
    /// <param name="status">Filtro por status.</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Lista paginada de ordens do cliente.</returns>
    [HttpGet("cliente/{clienteId:long}")]
    [FuncefAuthorize(Acao = "Funcef.Template/ordens/read")]
    [ProducesResponseType(typeof(PaginatedResult<OrdemResume>), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<IActionResult> GetByCliente(
        long clienteId,
        [FromQuery] int pagina = 1,
        [FromQuery] int tamanhoPagina = 10,
        [FromQuery] string? status = null,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Receive(new GetOrdensByClienteQuery
        {
            ClienteId = clienteId,
            Pagina = pagina,
            TamanhoPagina = tamanhoPagina,
            Status = status
        }, cancellationToken);

        return ApiOk(result);
    }

    /// <summary>
    /// Cria uma nova ordem.
    /// </summary>
    /// <param name="request">Dados da ordem.</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Ordem criada.</returns>
    [HttpPost]
    [FuncefAuthorize(Acao = "Funcef.Template/ordens/write")]
    [ProducesResponseType(typeof(OrdemResponse), StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Create(
        [FromBody] CreateOrdemRequest request,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Send(
            new CreateOrdemCommand { Request = request },
            cancellationToken);

        return ApiCreated(result);
    }

    /// <summary>
    /// Atualiza uma ordem existente.
    /// </summary>
    /// <param name="id">Identificador da ordem.</param>
    /// <param name="request">Dados para atualização.</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Ordem atualizada.</returns>
    [HttpPut("{id:long}")]
    [FuncefAuthorize(Acao = "Funcef.Template/ordens/write")]
    [ProducesResponseType(typeof(OrdemResponse), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status409Conflict)]
    public async Task<IActionResult> Update(
        long id,
        [FromBody] UpdateOrdemRequest request,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Send(
            new UpdateOrdemCommand { Id = id, Request = request },
            cancellationToken);

        return ApiOk(result);
    }

    /// <summary>
    /// Atualiza apenas o status de uma ordem.
    /// </summary>
    /// <param name="id">Identificador da ordem.</param>
    /// <param name="request">Novo status.</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Ordem com status atualizado.</returns>
    [HttpPatch("{id:long}/status")]
    [FuncefAuthorize(Acao = "Funcef.Template/ordens/write")]
    [ProducesResponseType(typeof(OrdemResponse), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status409Conflict)]
    public async Task<IActionResult> UpdateStatus(
        long id,
        [FromBody] UpdateOrdemStatusRequest request,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Send(
            new UpdateOrdemStatusCommand { Id = id, Request = request },
            cancellationToken);

        return ApiOk(result);
    }

    /// <summary>
    /// Exclui uma ordem.
    /// </summary>
    /// <param name="id">Identificador da ordem.</param>
    /// <param name="cancellationToken">Token de cancelamento.</param>
    /// <returns>Resultado da operação.</returns>
    [HttpDelete("{id:long}")]
    [FuncefAuthorize(Acao = "Funcef.Template/ordens/write")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status409Conflict)]
    public async Task<IActionResult> Delete(
        long id,
        CancellationToken cancellationToken = default)
    {
        await _mediator.Send(new DeleteOrdemCommand { Id = id }, cancellationToken);
        return ApiNoContent();
    }
}
