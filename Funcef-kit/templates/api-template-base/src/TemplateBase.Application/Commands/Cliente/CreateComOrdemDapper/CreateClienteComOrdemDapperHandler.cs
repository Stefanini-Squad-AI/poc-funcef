// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Commands;
using Funcef.Abstractions.Telemetry;
using FuncefORM.Contracts;
using TemplateBase.Application.DTOs.ClienteDto.Response;
using TemplateBase.Application.Services;

namespace TemplateBase.Application.Commands.Cliente.CreateComOrdemDapper;

/// <summary>
/// Handler responsável pela criação de cliente e ordem em transação única via Dapper.
/// </summary>
public class CreateClienteComOrdemDapperHandler : ICommandHandler<CreateClienteComOrdemDapperCommand, ClienteComOrdemResponse>
{
    private readonly IClienteService _clienteService;
    private readonly IOrdemService _ordemService;
    private readonly IUnitOfWork _unitOfWork;
    private readonly ITelemetry _telemetry;

    public CreateClienteComOrdemDapperHandler(
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
        CreateClienteComOrdemDapperCommand command,
        CancellationToken cancellationToken)
    {
        _telemetry.LogInformation("Iniciando criação de cliente e ordem com Dapper em transação");

        var dataAtual = DateTime.UtcNow;

        await _unitOfWork.BeginAsync(cancellationToken);

        try
        {
            // Os Ids são gerados pelo banco (colunas identity) e retornados via RETURNING INTO.
            var clienteId = await _clienteService.CreateWithDapperAsync(command.Request, dataAtual, cancellationToken);
            var ordemId = await _ordemService.CreateWithDapperAsync(
                clienteId, command.Request.ValorOrdem,
                command.Request.ObservacoesOrdem, dataAtual, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            _telemetry.LogInformation(
                $"Transação Dapper confirmada - Cliente {clienteId} e Ordem {ordemId} criados");

            return new ClienteComOrdemResponse
            {
                ClienteId = clienteId,
                NomeCliente = command.Request.NomeCliente,
                EmailCliente = command.Request.EmailCliente,
                OrdemId = ordemId,
                ValorOrdem = command.Request.ValorOrdem,
                StatusOrdem = Domain.Entities.StatusOrdem.Pendente,
                DataPedido = dataAtual
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
            _telemetry.LogWarning("Rollback Dapper executado com sucesso");
        }
        catch (Exception rollbackEx)
        {
            _telemetry.LogError("Erro ao executar rollback Dapper", rollbackEx);
        }
    }
}
