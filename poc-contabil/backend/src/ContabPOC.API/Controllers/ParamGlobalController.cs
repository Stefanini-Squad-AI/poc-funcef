using ContabPOC.Application.DTOs.ParamGlobalDto;
using ContabPOC.Application.Queries.ParamGlobal.GetParamGlobal;
using FuncefEssenciais.Application;
using Microsoft.AspNetCore.Mvc;

namespace ContabPOC.API.Controllers;

/// <summary>
/// Controller para parâmetros globais por empresa
/// Migração de: uCtrlParamIntegra.pas → GetParams(IdEmpresa)
///   SELECT * FROM PARAMGLOBAL WHERE IDPESSOA = Sistema.IdEmpresa
///   FSegregaVirtual := (FLGSEGREGAVIRTUAL = 'S')
/// </summary>
[Route("api/[controller]")]
[ApiController]
public class ParamGlobalController : ControllerBase
{
    private readonly IMediator _mediator;

    public ParamGlobalController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Obtém os parâmetros globais de uma empresa
    /// Delphi: CtrlSegregacao.GetParams(Sistema.IdEmpresa)
    ///   → SELECT * FROM PARAMGLOBAL WHERE IDPESSOA = IdEmpresa
    /// </summary>
    /// <param name="idEmpresa">ID da empresa (Delphi: Sistema.IdEmpresa)</param>
    [HttpGet("{idEmpresa:int}")]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<IActionResult> GetParamGlobal(
        int idEmpresa,
        CancellationToken cancellationToken = default)
    {
        var query = new GetParamGlobalQuery { IdEmpresa = idEmpresa };

        var result = await _mediator.Receive(query, cancellationToken);

        if (result is null)
        {
            return NotFound(new
            {
                mensagem = $"Parâmetros globais não encontrados para a empresa {idEmpresa}",
                resultado = (ParamGlobalResponse?)null
            });
        }

        return Ok(new
        {
            resultado = result,
            mensagem = "Parâmetros globais obtidos com sucesso"
        });
    }
}
