using ContabPOC.Application.Commands.ContasxCC.Associate;
using ContabPOC.Application.Commands.ContasxCC.Disassociate;
using ContabPOC.Application.DTOs.ContasxCCDto;
using ContabPOC.Application.Queries.ContasxCC.GetContasxCC;
using FuncefEssenciais.Application;
using Microsoft.AspNetCore.Mvc;

namespace ContabPOC.API.Controllers;

/// <summary>
/// Controller para operações de relação Conta × Centro de Custo
/// Migração de: FCadContasContabMT.pas → CdsContasxCC (grid direito)
///   ListContasxCC: SELECT ... FROM CENTCUST C, CONTASXCC CC WHERE ...
///
/// Endpoints:
///   GET    /api/contasxcc?idEmpresa=1&plano=1&placConta=1.1.1.01  → lista associados
///   POST   /api/contasxcc/associate                                 → btnVaiUm/btnVaiTodos
///   POST   /api/contasxcc/disassociate                              → btnVoltaUm/btnVoltaTodos
/// </summary>
[Route("api/[controller]")]
[ApiController]
public class ContasxCCController : ControllerBase
{
    private readonly IMediator _mediator;

    public ContasxCCController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Obtém a lista de centros de custo já associados à conta
    /// Delphi: CdsContasxCC.Data := CtrlContaContabil.ListContasxCC(...)
    /// </summary>
    [HttpGet]
    [ProducesResponseType(StatusCodes.Status200OK)]
    public async Task<IActionResult> GetContasxCC(
        [FromQuery] int idEmpresa,
        [FromQuery] int plano,
        [FromQuery] string placConta,
        CancellationToken cancellationToken = default)
    {
        var query = new GetContasxCCQuery
        {
            IdEmpresa = idEmpresa,
            Plano = plano,
            PlacConta = placConta
        };

        var result = await _mediator.Receive(query, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Centros de custo associados obtidos com sucesso",
            qtdRegistros = result.Count()
        });
    }

    /// <summary>
    /// Associa centros de custo a uma conta contábil
    /// Delphi: btnVaiUmClick (um CC) / btnVaiTodosClick (todos CCs analíticos)
    /// Regra: Sintéticos (STATUSGRUPOCDC='S') não podem ser relacionados
    /// </summary>
    [HttpPost("associate")]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> Associate(
        [FromBody] AssociateContasxCCCommand command,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Send(command, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Centro(s) de custo associado(s) com sucesso"
        });
    }

    /// <summary>
    /// Desassocia centros de custo de uma conta contábil
    /// Delphi: btnVoltaUmClick (um CC) / btnVoltaTodosClick (todos CCs)
    /// </summary>
    [HttpPost("disassociate")]
    [ProducesResponseType(StatusCodes.Status200OK)]
    public async Task<IActionResult> Disassociate(
        [FromBody] DisassociateContasxCCCommand command,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Send(command, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Centro(s) de custo desassociado(s) com sucesso"
        });
    }
}
