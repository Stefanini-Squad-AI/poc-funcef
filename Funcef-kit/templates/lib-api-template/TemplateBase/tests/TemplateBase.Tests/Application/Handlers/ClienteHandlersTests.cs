// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Exceptions;
using FuncefORM.Contracts;
using NSubstitute;
using NSubstitute.ExceptionExtensions;
using TemplateBase.Application.Commands.Cliente.Create;
using TemplateBase.Application.Commands.Cliente.Delete;
using TemplateBase.Application.Commands.Cliente.Update;
using TemplateBase.Application.DTOs.ClienteDto.Request;
using TemplateBase.Application.Services;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Tests.Application.Handlers;

#region CreateClienteHandler

[TestClass]
public class CreateClienteHandlerTests
{
    private IClienteService _service = null!;
    private IUnitOfWork _unitOfWork = null!;
    private CreateClienteHandler _handler = null!;

    [TestInitialize]
    public void Setup()
    {
        _service = Substitute.For<IClienteService>();
        _unitOfWork = Substitute.For<IUnitOfWork>();
        _handler = new CreateClienteHandler(_service, _unitOfWork);
    }

    [TestMethod]
    public async Task Handle_ComDadosValidos_DeveCriarCliente()
    {
        var command = new CreateClienteCommand
        {
            Request = new ClienteRequest { Nome = "João Silva", Email = "joao@email.com" }
        };
        var clienteEntity = new Cliente { Id = 1001L, Nome = "João Silva", Email = "joao@email.com" };
        _service.CreateAsync(Arg.Any<ClienteRequest>(), Arg.Any<CancellationToken>())
            .Returns(clienteEntity);

        var result = await _handler.Handle(command, CancellationToken.None);

        Assert.IsNotNull(result);
        Assert.AreEqual("João Silva", result.Nome);
        await _service.Received(1).CreateAsync(Arg.Any<ClienteRequest>(), Arg.Any<CancellationToken>());
        await _unitOfWork.Received(1).SaveChangesAsync(Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task Handle_EmailDuplicado_DevePropagarConflictException()
    {
        var command = new CreateClienteCommand
        {
            Request = new ClienteRequest { Nome = "João", Email = "existente@email.com" }
        };
        _service.CreateAsync(Arg.Any<ClienteRequest>(), Arg.Any<CancellationToken>())
            .ThrowsAsync(new ConflictException("Cliente", "Já existe um cliente com este email"));

        await Assert.ThrowsExactlyAsync<ConflictException>(
            () => _handler.Handle(command, CancellationToken.None));

        await _unitOfWork.DidNotReceive().SaveChangesAsync(Arg.Any<CancellationToken>());
    }
}

#endregion

#region UpdateClienteHandler

[TestClass]
public class UpdateClienteHandlerTests
{
    private IClienteService _service = null!;
    private IUnitOfWork _unitOfWork = null!;
    private UpdateClienteHandler _handler = null!;

    [TestInitialize]
    public void Setup()
    {
        _service = Substitute.For<IClienteService>();
        _unitOfWork = Substitute.For<IUnitOfWork>();
        _handler = new UpdateClienteHandler(_service, _unitOfWork);
    }

    [TestMethod]
    public async Task Handle_ComDadosValidos_DeveAtualizarCliente()
    {
        var id = 1002L;
        var command = new UpdateClienteCommand
        {
            Id = id,
            Request = new ClienteRequest { Nome = "João Atualizado", Email = "novo@email.com" }
        };
        var clienteEntity = new Cliente { Id = id, Nome = "João Atualizado", Email = "novo@email.com" };
        _service.UpdateAsync(id, Arg.Any<ClienteRequest>(), Arg.Any<CancellationToken>())
            .Returns(clienteEntity);

        var result = await _handler.Handle(command, CancellationToken.None);

        Assert.IsNotNull(result);
        Assert.AreEqual("João Atualizado", result.Nome);
        await _unitOfWork.Received(1).SaveChangesAsync(Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task Handle_ClienteInexistente_DevePropagarNotFoundException()
    {
        var command = new UpdateClienteCommand
        {
            Id = 1003L,
            Request = new ClienteRequest { Nome = "João" }
        };
        _service.UpdateAsync(Arg.Any<long>(), Arg.Any<ClienteRequest>(), Arg.Any<CancellationToken>())
            .ThrowsAsync(NotFoundException.ForResource("Cliente", command.Id));

        await Assert.ThrowsExactlyAsync<NotFoundException>(
            () => _handler.Handle(command, CancellationToken.None));
    }
}

#endregion

#region DeleteClienteHandler

[TestClass]
public class DeleteClienteHandlerTests
{
    private IClienteService _service = null!;
    private IUnitOfWork _unitOfWork = null!;
    private DeleteClienteHandler _handler = null!;

    [TestInitialize]
    public void Setup()
    {
        _service = Substitute.For<IClienteService>();
        _unitOfWork = Substitute.For<IUnitOfWork>();
        _handler = new DeleteClienteHandler(_service, _unitOfWork);
    }

    [TestMethod]
    public async Task Handle_ClienteSemOrdens_DeveExcluir()
    {
        var id = 1004L;
        var command = new DeleteClienteCommand { Id = id };

        await _handler.Handle(command, CancellationToken.None);

        await _service.Received(1).ValidateAndDeleteAsync(id, Arg.Any<CancellationToken>());
        await _unitOfWork.Received(1).SaveChangesAsync(Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task Handle_ClienteComOrdens_DevePropagarConflictException()
    {
        var command = new DeleteClienteCommand { Id = 1005L };
        _service.ValidateAndDeleteAsync(Arg.Any<long>(), Arg.Any<CancellationToken>())
            .ThrowsAsync(new ConflictException("Cliente", "Não é possível excluir cliente que possui ordens"));

        await Assert.ThrowsExactlyAsync<ConflictException>(
            () => _handler.Handle(command, CancellationToken.None));

        await _unitOfWork.DidNotReceive().SaveChangesAsync(Arg.Any<CancellationToken>());
    }
}

#endregion
