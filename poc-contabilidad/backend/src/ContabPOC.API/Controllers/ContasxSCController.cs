using ContabPOC.Application.Commands.ContasxSC.Associate;
using ContabPOC.Application.Commands.ContasxSC.Disassociate;
using ContabPOC.Application.DTOs.ContasxSCDto;
using ContabPOC.Application.Queries.ContasxSC.GetContasxSC;
using FuncefEssenciais.Application;
using Microsoft.AspNetCore.Mvc;

namespace ContabPOC.API.Controllers;

/// <summary>
/// Controller para operações de relação Conta × Sub-Conta
/// Migração de: FCadContasContabMT.pas → CdsContasxSC (grid direito)
///   ListContasxSC: SELECT ... FROM CONTASXSUBC WHERE ...
///
/// Endpoints:
///   GET    /api/contasxsc?idEmpresa=1&plano=1&placConta=1.1.1.01  → lista associados
///   POST   /api/contasxsc/associate                                 → btnVaiUm2/btnVaiTodos2
///   POST   /api/contasxsc/disassociate                              → btnVoltaUm2/btnVoltaTodos2
/// </summary>
[Route("api/[controller]")]
[ApiController]
public class ContasxSCController : ControllerBase
{
    private readonly IMediator _mediator;

    public ContasxSCController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Obtém a lista de sub-contas já associadas à conta
    /// Delphi: CdsContasxSC.Data := CtrlContaContabil.ListContasxSC(...)
    /// </summary>
    [HttpGet]
    [ProducesResponseType(StatusCodes.Status200OK)]
    public async Task<IActionResult> GetContasxSC(
        [FromQuery] int idEmpresa,
        [FromQuery] int plano,
        [FromQuery] string placConta,
        CancellationToken cancellationToken = default)
    {
        var query = new GetContasxSCQuery
        {
            IdEmpresa = idEmpresa,
            Plano = plano,
            PlacConta = placConta
        };

        var result = await _mediator.Receive(query, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Sub-contas associadas obtidas com sucesso",
            qtdRegistros = result.Count()
        });
    }

    /// <summary>
    /// Associa sub-contas a uma conta contábil
    /// Delphi: btnVaiUm2Click (uma SC) / btnVaiTodos2Click (todas SCs)
    /// </summary>
    [HttpPost("associate")]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> Associate(
        [FromBody] AssociateContasxSCCommand command,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Send(command, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Sub-conta(s) associada(s) com sucesso"
        });
    }

    /// <summary>
    /// Desassocia sub-contas de uma conta contábil
    /// Delphi: btnVoltaUm2Click (uma SC) / btnVoltaTodos2Click (todas SCs)
    /// </summary>
    [HttpPost("disassociate")]
    [ProducesResponseType(StatusCodes.Status200OK)]
    public async Task<IActionResult> Disassociate(
        [FromBody] DisassociateContasxSCCommand command,
        CancellationToken cancellationToken = default)
    {
        var result = await _mediator.Send(command, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Sub-conta(s) desassociada(s) com sucesso"
        });
    }
}
