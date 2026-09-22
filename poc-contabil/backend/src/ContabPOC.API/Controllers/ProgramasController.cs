using ContabPOC.Application.DTOs.ProgramaDto;
using ContabPOC.Application.Queries.Programa.GetProgramas;
using FuncefEssenciais.Application;
using Microsoft.AspNetCore.Mvc;

namespace ContabPOC.API.Controllers;

/// <summary>
/// Controller para operações de programas do critério
/// Migração de: FCadContasContabMT.pas → SqlPrograma (line 1821)
///   cboPrograma (TwwDBIncrementalSearch) → GET /api/programas
///   SqlPrograma: SELECT IDPROGRAMA, DESCPROGRAMA FROM PROGRAMA ORDER BY 2
/// </summary>
[Route("api/[controller]")]
[ApiController]
public class ProgramasController : ControllerBase
{
    private readonly IMediator _mediator;

    public ProgramasController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Obtém a lista de programas para preenchimento do dropdown
    /// Delphi: SqlPrograma.Prepare; SqlPrograma.Open;
    /// </summary>
    [HttpGet]
    [ProducesResponseType(StatusCodes.Status200OK)]
    public async Task<IActionResult> GetProgramas(
        CancellationToken cancellationToken = default)
    {
        var query = new GetProgramasQuery();

        var result = await _mediator.Receive(query, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Programas obtidos com sucesso",
            qtdRegistros = result.Count()
        });
    }
}
