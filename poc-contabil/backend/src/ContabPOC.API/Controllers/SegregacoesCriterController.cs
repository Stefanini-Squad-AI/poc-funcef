using ContabPOC.Application.DTOs.SegregacaoCriterDto;
using ContabPOC.Application.Queries.SegregacaoCriter.GetSegregacoesCriter;
using FuncefEssenciais.Application;
using Microsoft.AspNetCore.Mvc;

namespace ContabPOC.API.Controllers;

/// <summary>
/// Controller para operações de critérios de segregação de recursos
/// Migração de: FCadContasContabMT.pas → cdsSegregaCriter
///   dblkSegregacao (TwwDBLookupCombo) → GET /api/segregacoescriter
///   cdsSegregaCriter.Data := CtrlSegregacao.ListaSegregaCriter
/// </summary>
[Route("api/[controller]")]
[ApiController]
public class SegregacoesCriterController : ControllerBase
{
    private readonly IMediator _mediator;

    public SegregacoesCriterController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Obtém a lista de critérios de segregação para preenchimento do dropdown
    /// Delphi: cdsSegregaCriter.Data := CtrlSegregacao.ListaSegregaCriter
    /// </summary>
    [HttpGet]
    [ProducesResponseType(StatusCodes.Status200OK)]
    public async Task<IActionResult> GetSegregacoesCriter(
        CancellationToken cancellationToken = default)
    {
        var query = new GetSegregacoesCriterQuery();

        var result = await _mediator.Receive(query, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Critérios de segregação obtidos com sucesso",
            qtdRegistros = result.Count()
        });
    }
}
