using ContabPOC.Application.DTOs.SubGrupoDto;
using ContabPOC.Application.Queries.SubGrupo.GetSubGrupos;
using FuncefEssenciais.Application;
using Microsoft.AspNetCore.Mvc;

namespace ContabPOC.API.Controllers;

/// <summary>
/// Controller para operações de sub-grupos contábeis
/// Migração de: FCadContasContabMT.pas → CdsSubGrupo
///   dblkSubGrupo1..4 (TwwDBLookupCombo) → GET /api/subgrupos
///   SELECT CODSUBGRP, DESCSUBGRP FROM SUBGRUPO ORDER BY 2
/// </summary>
[Route("api/[controller]")]
[ApiController]
public class SubGruposController : ControllerBase
{
    private readonly IMediator _mediator;

    public SubGruposController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Obtém a lista de sub-grupos para preenchimento dos dropdowns
    /// Delphi: CdsSubGrupo.Open;
    /// </summary>
    [HttpGet]
    [ProducesResponseType(StatusCodes.Status200OK)]
    public async Task<IActionResult> GetSubGrupos(
        CancellationToken cancellationToken = default)
    {
        var query = new GetSubGruposQuery();

        var result = await _mediator.Receive(query, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Sub-grupos obtidos com sucesso",
            qtdRegistros = result.Count()
        });
    }
}
