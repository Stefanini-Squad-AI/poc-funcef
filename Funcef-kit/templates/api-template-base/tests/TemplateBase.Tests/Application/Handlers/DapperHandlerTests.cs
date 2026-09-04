using Funcef.Abstractions.Telemetry;
using FuncefORM.Contracts;
using NSubstitute;
using NSubstitute.ExceptionExtensions;
using TemplateBase.Application.Commands.Cliente.CreateComOrdemDapper;
using TemplateBase.Application.DTOs.ClienteDto.Request;
using FuncefEssenciais.Exceptions;
using TemplateBase.Application.Services;

namespace TemplateBase.Tests.Application.Handlers;

[TestClass]
public class CreateClienteComOrdemDapperHandlerTests
{
    private IUnitOfWork _unitOfWork = null!;
    private IClienteService _clienteService = null!;
    private IOrdemService _ordemService = null!;
    private ITelemetry _telemetry = null!;
    private CreateClienteComOrdemDapperHandler _handler = null!;

    [TestInitialize]
    public void Setup()
    {
        _unitOfWork = Substitute.For<IUnitOfWork>();
        _clienteService = Substitute.For<IClienteService>();
        _ordemService = Substitute.For<IOrdemService>();
        _telemetry = Substitute.For<ITelemetry>();
        _handler = new CreateClienteComOrdemDapperHandler(_clienteService, _ordemService, _unitOfWork, _telemetry);
    }

    [TestMethod]
    public async Task Handle_ComDadosValidos_DeveCriarClienteEOrdemComDapper()
    {
        var command = new CreateClienteComOrdemDapperCommand
        {
            Request = new ClienteComOrdemRequest
            {
                NomeCliente = "João",
                EmailCliente = "joao@email.com",
                ValorOrdem = 250m,
                ObservacoesOrdem = "Urgente"
            }
        };

        _clienteService.CreateWithDapperAsync(
            Arg.Any<ClienteComOrdemRequest>(), Arg.Any<DateTime>(), Arg.Any<CancellationToken>())
            .Returns(1001L);
        _ordemService.CreateWithDapperAsync(
            Arg.Any<long>(), Arg.Any<decimal>(), Arg.Any<string?>(), Arg.Any<DateTime>(), Arg.Any<CancellationToken>())
            .Returns(2001L);

        var result = await _handler.Handle(command, CancellationToken.None);

        Assert.IsNotNull(result);
        Assert.AreEqual("João", result.NomeCliente);
        Assert.AreEqual("joao@email.com", result.EmailCliente);
        Assert.AreEqual(250m, result.ValorOrdem);
        Assert.AreEqual("Pendente", result.StatusOrdem);
        Assert.AreEqual(1001L, result.ClienteId);
        Assert.AreEqual(2001L, result.OrdemId);

        await _unitOfWork.Received(1).BeginAsync(Arg.Any<CancellationToken>());
        await _unitOfWork.Received(1).CommitAsync(Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task Handle_ComErroNoBegin_DevePropagar()
    {
        var command = new CreateClienteComOrdemDapperCommand
        {
            Request = new ClienteComOrdemRequest { NomeCliente = "João", ValorOrdem = 100m }
        };

        _unitOfWork.BeginAsync(Arg.Any<CancellationToken>())
            .ThrowsAsync(new InvalidOperationException("Conexão indisponível"));

        await Assert.ThrowsExactlyAsync<InvalidOperationException>(
            () => _handler.Handle(command, CancellationToken.None));

        await _unitOfWork.DidNotReceive().RollbackAsync(Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task Handle_ComConflictException_DeveExecutarRollbackEPropagar()
    {
        var command = new CreateClienteComOrdemDapperCommand
        {
            Request = new ClienteComOrdemRequest { NomeCliente = "Teste", ValorOrdem = 50m }
        };

        _clienteService.CreateWithDapperAsync(
            Arg.Any<ClienteComOrdemRequest>(), Arg.Any<DateTime>(), Arg.Any<CancellationToken>())
            .ThrowsAsync(new ConflictException("Cliente", "Erro de negócio"));

        await Assert.ThrowsExactlyAsync<ConflictException>(
            () => _handler.Handle(command, CancellationToken.None));

        await _unitOfWork.Received(1).RollbackAsync(Arg.Any<CancellationToken>());
    }
}
