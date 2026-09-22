using ContabPOC.Application.DTOs.SubContaDto;
using ContabPOC.Application.Queries.SubConta.GetSubContas;
using FuncefEssenciais.Application;
using Microsoft.AspNetCore.Mvc;

namespace ContabPOC.API.Controllers;

/// <summary>
/// Controller para operações de Sub-Contas disponíveis (não associadas)
/// Migração de: FCadContasContabMT.pas → CdsSubConta (grid esquerdo)
///   ListSubContaCadContas: SELECT ... FROM SUBCONTA WHERE NOT EXISTS (CONTASXSUBC)
///   GET /api/subcontas?idEmpresa=1&plano=1&placConta=1.1.1.01
/// </summary>
[Route("api/[controller]")]
[ApiController]
public class SubContasController : ControllerBase
{
    private readonly IMediator _mediator;

    public SubContasController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Obtém a lista de sub-contas disponíveis (não associadas à conta)
    /// Delphi: CdsSubConta.Data := CtrlPlanoConta.ListSubContaCadContas(...)
    /// </summary>
    [HttpGet]
    [ProducesResponseType(StatusCodes.Status200OK)]
    public async Task<IActionResult> GetSubContas(
        [FromQuery] int idEmpresa,
        [FromQuery] int plano,
        [FromQuery] string placConta,
        CancellationToken cancellationToken = default)
    {
        var query = new GetSubContasQuery
        {
            IdEmpresa = idEmpresa,
            Plano = plano,
            PlacConta = placConta
        };

        var result = await _mediator.Receive(query, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Sub-contas disponíveis obtidas com sucesso",
            qtdRegistros = result.Count()
        });
    }
}
