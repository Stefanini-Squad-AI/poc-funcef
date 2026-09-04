// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Commands;
using Funcef.Abstractions.Telemetry;
using FuncefORM.Contracts;
using TemplateBase.Application.DTOs.ClienteDto.Request;
using TemplateBase.Application.DTOs.ClienteDto.Response;
using TemplateBase.Application.DTOs.OrdemDto.Request;
using TemplateBase.Application.Services;

namespace TemplateBase.Application.Commands.Cliente.CreateComOrdemEf;

/// <summary>
/// Handler responsável pela criação de cliente e ordem em transação única via EF Core.
/// </summary>
public class CreateClienteComOrdemEfHandler : ICommandHandler<CreateClienteComOrdemEfCommand, ClienteComOrdemResponse>
{
    private readonly IClienteService _clienteService;
    private readonly IOrdemService _ordemService;
    private readonly IUnitOfWork _unitOfWork;
    private readonly ITelemetry _telemetry;

    public CreateClienteComOrdemEfHandler(
        IClienteService clienteService,
        IOrdemService ordemService,
        IUnitOfWork unitOfWork,
        ITelemetry telemetry)
    {
        _clienteService = clienteService;
        _ordemService = ordemService;
        _unitOfWork = unitOfWork;
        _telemetry = telemetry;
    }

    public async Task<ClienteComOrdemResponse> Handle(
        CreateClienteComOrdemEfCommand command,
        CancellationToken cancellationToken)
    {
        _telemetry.LogInformation("Iniciando criação de cliente e ordem em transação EF Core");

        await _unitOfWork.BeginAsync(cancellationToken);

        try
        {
            var clienteRequest = new ClienteRequest
            {
                Nome = command.Request.NomeCliente,
                Email = command.Request.EmailCliente
            };
            var cliente = await _clienteService.CreateAsync(clienteRequest, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);

            var ordemRequest = new CreateOrdemRequest
            {
                ClienteId = cliente.Id,
                Valor = command.Request.ValorOrdem,
                Observacoes = command.Request.ObservacoesOrdem
            };
            var ordem = await _ordemService.CreateAsync(ordemRequest, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            _telemetry.LogInformation(
                $"Transação EF confirmada - Cliente {cliente.Id} e Ordem {ordem.Id} criados");

            return new ClienteComOrdemResponse
            {
                ClienteId = cliente.Id,
                NomeCliente = cliente.Nome,
                EmailCliente = cliente.Email,
                OrdemId = ordem.Id,
                ValorOrdem = ordem.Valor,
                StatusOrdem = ordem.Status,
                DataPedido = ordem.DataPedido
            };
        }
        catch
        {
            await SafeRollbackAsync();
            throw;
        }
    }

    private async Task SafeRollbackAsync()
    {
        try
        {
            // CancellationToken.None deliberado: se a exceção original foi um cancelamento do
            // request, o token já está cancelado e RollbackAsync(token) lançaria imediatamente —
            // a transação ficaria aberta segurando locks no Oracle até o dispose do escopo.
            // Ação compensatória não pode ser cancelada pelo mesmo token que causou a falha.
            await _unitOfWork.RollbackAsync(CancellationToken.None);
            _telemetry.LogWarning("Rollback EF executado com sucesso");
        }
        catch (Exception rollbackEx)
        {
            _telemetry.LogError("Erro ao executar rollback EF", rollbackEx);
        }
    }
}
