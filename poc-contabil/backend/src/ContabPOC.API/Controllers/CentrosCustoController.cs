using ContabPOC.Application.DTOs.CentroCustoDto;
using ContabPOC.Application.Queries.CentroCusto.GetCentrosCusto;
using FuncefEssenciais.Application;
using Microsoft.AspNetCore.Mvc;

namespace ContabPOC.API.Controllers;

/// <summary>
/// Controller para operações de Centros de Custo disponíveis (não associados)
/// Migração de: FCadContasContabMT.pas → CdsCCusto (grid esquerdo)
///   ListCCustoCadContas: SELECT ... FROM CENTCUST C WHERE NOT EXISTS (...)
///   GET /api/centroscusto?idEmpresa=1&plano=1&placConta=1.1.1.01
/// </summary>
[Route("api/[controller]")]
[ApiController]
public class CentrosCustoController : ControllerBase
{
    private readonly IMediator _mediator;

    public CentrosCustoController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Obtém a lista de centros de custo disponíveis (não associados à conta)
    /// Delphi: CdsCCusto.Data := CtrlPlanoConta.ListCCustoCadContas(...)
    /// </summary>
    [HttpGet]
    [ProducesResponseType(StatusCodes.Status200OK)]
    public async Task<IActionResult> GetCentrosCusto(
        [FromQuery] int idEmpresa,
        [FromQuery] int plano,
        [FromQuery] string placConta,
        CancellationToken cancellationToken = default)
    {
        var query = new GetCentrosCustoQuery
        {
            IdEmpresa = idEmpresa,
            Plano = plano,
            PlacConta = placConta
        };

        var result = await _mediator.Receive(query, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Centros de custo disponíveis obtidos com sucesso",
            qtdRegistros = result.Count()
        });
    }
}
