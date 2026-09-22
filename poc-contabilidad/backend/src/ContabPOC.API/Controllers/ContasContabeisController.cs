using ContabPOC.Application.Commands.ContaContabil.Create;
using ContabPOC.Application.Commands.ContaContabil.Delete;
using ContabPOC.Application.Commands.ContaContabil.Update;
using ContabPOC.Application.DTOs.ContaContabilDto;
using ContabPOC.Application.Queries.ContaContabil.GetById;
using ContabPOC.Application.Queries.ContaContabil.GetTree;
using FuncefEssenciais.Application;
using Microsoft.AspNetCore.Mvc;

namespace ContabPOC.API.Controllers;

/// <summary>
/// Controller para operações de conta contábil
/// Migração de: FCadContasContabMT.pas (TfrmCadContasContabMT)
/// 
/// Mapeamento de eventos Delphi → Endpoints:
///   CmeCadastroFind     → GET    /api/contascontabeis/{plano}/{codigo}
///   CmeCadastroInsert   → POST   /api/contascontabeis
///   CmeCadastroEdit     → PUT    /api/contascontabeis/{plano}/{codigo}
///   CmeCadastroDelete   → DELETE /api/contascontabeis/{plano}/{codigo}
///   pgCtrlChange/Tree   → GET    /api/contascontabeis/tree
/// </summary>
[Route("api/[controller]")]
[ApiController]
public class ContasContabeisController : ControllerBase
{
    private readonly IMediator _mediator;

    public ContasContabeisController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Obtém a árvore hierárquica de contas contábeis
    /// Delphi: pgCtrlChange → TabSheet2 → treePlano.MontaArvore
    /// </summary>
    [HttpGet("tree")]
    [ProducesResponseType(StatusCodes.Status200OK)]
    public async Task<IActionResult> GetTree(
        [FromQuery] bool incluirInativas = false,
        [FromQuery] int? plano = null,
        CancellationToken cancellationToken = default)
    {
        var query = new GetContaContabilTreeQuery
        {
            IncluirInativas = incluirInativas,
            Plano = plano ?? 1
        };

        var result = await _mediator.Receive(query, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Árvore de contas obtida com sucesso",
            qtdRegistros = result.Count()
        });
    }

    /// <summary>
    /// Obtém uma conta contábil específica por PK (Plano + Codigo)
    /// Delphi: CmeCadastroFind → CtrlPlanoConta.ListCdsPlanoContas(plano, conta)
    /// </summary>
    [HttpGet("{plano:int}/{codigo}")]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<IActionResult> GetById(
        int plano,
        string codigo,
        CancellationToken cancellationToken = default)
    {
        var query = new GetContaContabilByIdQuery
        {
            Plano = plano,
            Codigo = codigo
        };

        var result = await _mediator.Receive(query, cancellationToken);

        if (result == null)
            return NotFound(new { mensagem = $"Conta {plano}/{codigo} não encontrada." });

        return Ok(new
        {
            resultado = result,
            mensagem = "Conta obtida com sucesso",
            qtdRegistros = 1
        });
    }

    /// <summary>
    /// Cria uma nova conta contábil
    /// Delphi: CmeCadastroInsert + CmeCadastroApplyInsert → CtrlPlanoConta.Gravar
    /// </summary>
    [HttpPost]
    [ProducesResponseType(StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> Create(
        [FromBody] ContaContabilRequest request,
        CancellationToken cancellationToken = default)
    {
        var command = new CreateContaContabilCommand { Request = request };

        var result = await _mediator.Send(command, cancellationToken);

        return CreatedAtAction(
            nameof(GetById),
            new { plano = result.Plano, codigo = result.Codigo },
            new
            {
                resultado = result,
                mensagem = "Conta contábil criada com sucesso",
                qtdRegistros = 1
            });
    }

    /// <summary>
    /// Atualiza uma conta contábil existente
    /// Delphi: CmeCadastroEdit + CmeCadastroApplyEdit → CtrlPlanoConta.Gravar
    /// </summary>
    [HttpPut("{plano:int}/{codigo}")]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> Update(
        int plano,
        string codigo,
        [FromBody] ContaContabilRequest request,
        CancellationToken cancellationToken = default)
    {
        var command = new UpdateContaContabilCommand
        {
            Plano = plano,
            Codigo = codigo,
            Request = request
        };

        var result = await _mediator.Send(command, cancellationToken);

        return Ok(new
        {
            resultado = result,
            mensagem = "Conta contábil atualizada com sucesso",
            qtdRegistros = 1
        });
    }

    /// <summary>
    /// Exclui uma conta contábil
    /// Delphi: CmeCadastroDelete + CmeCadastroApplyDelete → CtrlPlanoConta.Apagar
    /// Regras: verifica lançamentos, filhos, apaga saldo e relacionamentos
    /// </summary>
    [HttpDelete("{plano:int}/{codigo}")]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status409Conflict)]
    public async Task<IActionResult> Delete(
        int plano,
        string codigo,
        CancellationToken cancellationToken = default)
    {
        var command = new DeleteContaContabilCommand
        {
            Plano = plano,
            Codigo = codigo
        };

        try
        {
            var result = await _mediator.Send(command, cancellationToken);

            return Ok(new
            {
                resultado = result,
                mensagem = "Conta contábil excluída com sucesso",
                qtdRegistros = 0
            });
        }
        catch (KeyNotFoundException ex)
        {
            return NotFound(new { mensagem = ex.Message });
        }
        catch (InvalidOperationException ex)
        {
            // Conta possui filhos ou lançamentos — exclusão cancelada (409 Conflict)
            return Conflict(new { mensagem = ex.Message });
        }
    }
}
