using ContabPOC.Application.DTOs.MoedaDto;
using ContabPOC.Application.Queries.Moeda.GetMoedas;
using FuncefEssenciais.Application;
using Microsoft.AspNetCore.Mvc;

namespace ContabPOC.API.Controllers;

/// <summary>
/// Controller para operações de moedas
/// Migração de: FCadContasContabMT.pas → CdsMoeda
///   dblkMoeda (TwwDBLookupCombo) → GET /api/moedas
///   SELECT MOECODIGO, MOEDESC, MOESIGLA FROM MOEDA ORDER BY 2
/// </summary>
[Route("api/[controller]")]
[ApiController]
public class MoedasController : ControllerBase
{
    private readonly IMediator _mediator;

    public MoedasController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Obtém a lista de moedas para preenchimento do dropdown
    /// Delphi: CdsMoeda.Open;
    /// </summary>
    [HttpGet]
    [ProducesResponseType(StatusCodes.Status200OK)]
    public async Task<IActionResult> GetMoedas(
        CancellationToken cancellationToken = default)
    {
        var query = new GetMoedasQuery();

        var result = await _mediator.Receive(query, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Moedas obtidas com sucesso",
            qtdRegistros = result.Count()
        });
    }
}
