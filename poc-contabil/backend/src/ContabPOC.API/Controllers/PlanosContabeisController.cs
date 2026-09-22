using ContabPOC.Application.DTOs.PlanoContabilDto;
using ContabPOC.Application.Queries.PlanoContabil.GetPlanosContabeis;
using FuncefEssenciais.Application;
using Microsoft.AspNetCore.Mvc;

namespace ContabPOC.API.Controllers;

/// <summary>
/// Controller para operações de planos contábeis
/// Migração de: uCtrlContaContabil.pas → ListPlanosContas
///   dblkPlanoContabil (TCMDBLookupCombo) → GET /api/planoscontabeis
/// </summary>
[Route("api/[controller]")]
[ApiController]
public class PlanosContabeisController : ControllerBase
{
    private readonly IMediator _mediator;

    public PlanosContabeisController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Obtém a lista de planos contábeis para preenchimento do dropdown
    /// Delphi: CdsPlanoContabil.Data := CtrlContaContabil.ListPlanosContas(Sistema.IdEmpresa)
    /// </summary>
    [HttpGet]
    [ProducesResponseType(StatusCodes.Status200OK)]
    public async Task<IActionResult> GetPlanos(
        [FromQuery] bool incluirInativos = false,
        CancellationToken cancellationToken = default)
    {
        var query = new GetPlanosContabeisQuery
        {
            IncluirInativos = incluirInativos
        };

        var result = await _mediator.Receive(query, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Planos contábeis obtidos com sucesso",
            qtdRegistros = result.Count()
        });
    }
}
