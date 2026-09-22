using ContabPOC.Application.DTOs.ParamContabDto;
using ContabPOC.Application.Queries.ParamContab.GetParamContab;
using FuncefEssenciais.Application;
using Microsoft.AspNetCore.Mvc;

namespace ContabPOC.API.Controllers;

/// <summary>
/// Controller para parâmetros contábeis por empresa
/// Migração de: uCtrlContab.pas → TCtrlContab
///   SELECT PACMOEDAOFICIAL, PACMOEDAGERENCIAL, PACMOEDAGEREN1, PACMOEDAGEREN2
///   FROM PARAMCONTAB WHERE IDPESSOA = Sistema.IdEmpresa
/// </summary>
[Route("api/[controller]")]
[ApiController]
public class ParamContabController : ControllerBase
{
    private readonly IMediator _mediator;

    public ParamContabController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Obtém os parâmetros contábeis de uma empresa
    /// Delphi: CtrlContab (TCtrlContab)
    ///   → SELECT PACMOEDAOFICIAL, PACMOEDAGERENCIAL, PACMOEDAGEREN1, PACMOEDAGEREN2
    ///     FROM PARAMCONTAB WHERE IDPESSOA = IdEmpresa
    /// </summary>
    /// <param name="idEmpresa">ID da empresa (Delphi: Sistema.IdEmpresa)</param>
    [HttpGet("{idEmpresa:int}")]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<IActionResult> GetParamContab(
        int idEmpresa,
        CancellationToken cancellationToken = default)
    {
        var query = new GetParamContabQuery { IdEmpresa = idEmpresa };

        var result = await _mediator.Receive(query, cancellationToken);

        if (result is null)
        {
            return NotFound(new
            {
                mensagem = $"Parâmetros contábeis não encontrados para a empresa {idEmpresa}",
                resultado = (ParamContabResponse?)null
            });
        }

        return Ok(new
        {
            resultado = result,
            mensagem = "Parâmetros contábeis obtidos com sucesso"
        });
    }
}
