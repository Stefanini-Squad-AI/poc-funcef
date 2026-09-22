using ContabPOC.Application.DTOs.RateioPlanoPatroDto;
using ContabPOC.Application.Queries.RateioPlanoPatro.GetRateiosPlanoPatro;
using FuncefEssenciais.Application;
using Microsoft.AspNetCore.Mvc;

namespace ContabPOC.API.Controllers;

/// <summary>
/// Controller para operações de rateios administrativos por plano/patrocinadora
/// Migração de: FCadContasContabMT.pas → cdsRateioPlanoPatro
///   dblkRateioPlanoPatro (TwwDBLookupCombo) → GET /api/rateiosplanopatro
/// </summary>
[Route("api/[controller]")]
[ApiController]
public class RateiosPlanoPatroController : ControllerBase
{
    private readonly IMediator _mediator;

    public RateiosPlanoPatroController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Obtém a lista de rateios administrativos para preenchimento do dropdown
    /// Delphi: cdsRateioPlanoPatro.Data := CtrlProcessaTotalPrev.ListaRatAdm
    /// </summary>
    [HttpGet]
    [ProducesResponseType(StatusCodes.Status200OK)]
    public async Task<IActionResult> GetRateios(
        [FromQuery] bool incluirInativos = false,
        CancellationToken cancellationToken = default)
    {
        var query = new GetRateiosPlanoPatroQuery
        {
            IncluirInativos = incluirInativos
        };

        var result = await _mediator.Receive(query, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Rateios obtidos com sucesso",
            qtdRegistros = result.Count()
        });
    }
}
