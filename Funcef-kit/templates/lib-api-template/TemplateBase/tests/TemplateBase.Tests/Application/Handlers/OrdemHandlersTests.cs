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
using TemplateBase.Application.Commands.Ordem.Create;
using TemplateBase.Application.Commands.Ordem.Delete;
using TemplateBase.Application.Commands.Ordem.Update;
using TemplateBase.Application.Commands.Ordem.UpdateStatus;
using TemplateBase.Application.DTOs.OrdemDto.Request;
using TemplateBase.Application.Services;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Tests.Application.Handlers;

#region CreateOrdemHandler

[TestClass]
public class CreateOrdemHandlerTests
{
    private IOrdemService _service = null!;
    private IUnitOfWork _unitOfWork = null!;
    private CreateOrdemHandler _handler = null!;

    [TestInitialize]
    public void Setup()
    {
        _service = Substitute.For<IOrdemService>();
        _unitOfWork = Substitute.For<IUnitOfWork>();
        _handler = new CreateOrdemHandler(_service, _unitOfWork);
    }

    [TestMethod]
    public async Task Handle_ComClienteExistente_DeveCriarOrdem()
    {
        var clienteId = 1001L;
        var command = new CreateOrdemCommand
        {
            Request = new CreateOrdemRequest { ClienteId = clienteId, Valor = 200m, Observacoes = "Teste" }
        };
        var ordemEntity = new Ordem
        {
            Id = 1002L,
            ClienteId = clienteId,
            Valor = 200m,
            Status = "Pendente",
            Cliente = new Cliente { Id = clienteId, Nome = "João" }
        };
        _service.CreateAsync(Arg.Any<CreateOrdemRequest>(), Arg.Any<CancellationToken>())
            .Returns(ordemEntity);

        var result = await _handler.Handle(command, CancellationToken.None);

        Assert.IsNotNull(result);
        Assert.AreEqual(clienteId, result.ClienteId);
        await _service.Received(1).CreateAsync(Arg.Any<CreateOrdemRequest>(), Arg.Any<CancellationToken>());
        await _unitOfWork.Received(1).SaveChangesAsync(Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task Handle_ClienteInexistente_DevePropagarNotFoundException()
    {
        var command = new CreateOrdemCommand
        {
            Request = new CreateOrdemRequest { ClienteId = 1003L, Valor = 100m }
        };
        _service.CreateAsync(Arg.Any<CreateOrdemRequest>(), Arg.Any<CancellationToken>())
            .ThrowsAsync(NotFoundException.ForResource("Cliente", command.Request.ClienteId));

        await Assert.ThrowsExactlyAsync<NotFoundException>(
            () => _handler.Handle(command, CancellationToken.None));

        await _unitOfWork.DidNotReceive().SaveChangesAsync(Arg.Any<CancellationToken>());
    }
}

#endregion

#region UpdateOrdemHandler

[TestClass]
public class UpdateOrdemHandlerTests
{
    private IOrdemService _service = null!;
    private IUnitOfWork _unitOfWork = null!;
    private UpdateOrdemHandler _handler = null!;

    [TestInitialize]
    public void Setup()
    {
        _service = Substitute.For<IOrdemService>();
        _unitOfWork = Substitute.For<IUnitOfWork>();
        _handler = new UpdateOrdemHandler(_service, _unitOfWork);
    }

    [TestMethod]
    public async Task Handle_ComDadosValidos_DeveAtualizar()
    {
        var id = 1004L;
        var command = new UpdateOrdemCommand
        {
            Id = id,
            Request = new UpdateOrdemRequest { Valor = 300m, Status = "Processando", Observacoes = "Atualizado" }
        };
        var ordemEntity = new Ordem
        {
            Id = id,
            Valor = 300m,
            Status = "Processando",
            ClienteId = 1005L,
            Cliente = new Cliente { Id = 1006L, Nome = "João" }
        };
        _service.UpdateAsync(id, Arg.Any<UpdateOrdemRequest>(), Arg.Any<CancellationToken>())
            .Returns(new OrdemAtualizada(ordemEntity, "Pendente"));

        var result = await _handler.Handle(command, CancellationToken.None);

        Assert.IsNotNull(result);
        Assert.AreEqual("Processando", result.Status);
        await _unitOfWork.Received(1).SaveChangesAsync(Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task Handle_StatusInvalido_DevePropagarBusinessException()
    {
        var command = new UpdateOrdemCommand
        {
            Id = 1007L,
            Request = new UpdateOrdemRequest { Valor = 100m, Status = "Inexistente" }
        };
        _service.UpdateAsync(Arg.Any<long>(), Arg.Any<UpdateOrdemRequest>(), Arg.Any<CancellationToken>())
            .ThrowsAsync(new BusinessException("INVALID_STATUS", "Status inválido"));

        await Assert.ThrowsExactlyAsync<BusinessException>(
            () => _handler.Handle(command, CancellationToken.None));
    }
}

#endregion

#region UpdateOrdemStatusHandler

[TestClass]
public class UpdateOrdemStatusHandlerTests
{
    private IOrdemService _service = null!;
    private IUnitOfWork _unitOfWork = null!;
    private UpdateOrdemStatusHandler _handler = null!;

    [TestInitialize]
    public void Setup()
    {
        _service = Substitute.For<IOrdemService>();
        _unitOfWork = Substitute.For<IUnitOfWork>();
        _handler = new UpdateOrdemStatusHandler(_service, _unitOfWork);
    }

    [TestMethod]
    public async Task Handle_ComStatusValido_DeveAtualizar()
    {
        var id = 1008L;
        var command = new UpdateOrdemStatusCommand
        {
            Id = id,
            Request = new UpdateOrdemStatusRequest { Status = "Processando" }
        };
        var ordemEntity = new Ordem
        {
            Id = id,
            Status = "Processando",
            ClienteId = 1009L,
            Cliente = new Cliente { Id = 1010L, Nome = "João" }
        };
        _service.UpdateStatusAsync(id, Arg.Any<UpdateOrdemStatusRequest>(), Arg.Any<CancellationToken>())
            .Returns(new OrdemAtualizada(ordemEntity, "Pendente"));

        var result = await _handler.Handle(command, CancellationToken.None);

        Assert.IsNotNull(result);
        Assert.AreEqual("Processando", result.Status);
        await _unitOfWork.Received(1).SaveChangesAsync(Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task Handle_OrdemInexistente_DevePropagarNotFoundException()
    {
        var command = new UpdateOrdemStatusCommand
        {
            Id = 1011L,
            Request = new UpdateOrdemStatusRequest { Status = "Processando" }
        };
        _service.UpdateStatusAsync(Arg.Any<long>(), Arg.Any<UpdateOrdemStatusRequest>(), Arg.Any<CancellationToken>())
            .ThrowsAsync(NotFoundException.ForResource("Ordem", command.Id));

        await Assert.ThrowsExactlyAsync<NotFoundException>(
            () => _handler.Handle(command, CancellationToken.None));
    }
}

#endregion

#region DeleteOrdemHandler

[TestClass]
public class DeleteOrdemHandlerTests
{
    private IOrdemService _service = null!;
    private IUnitOfWork _unitOfWork = null!;
    private DeleteOrdemHandler _handler = null!;

    [TestInitialize]
    public void Setup()
    {
        _service = Substitute.For<IOrdemService>();
        _unitOfWork = Substitute.For<IUnitOfWork>();
        _handler = new DeleteOrdemHandler(_service, _unitOfWork);
    }

    [TestMethod]
    public async Task Handle_OrdemPendente_DeveExcluir()
    {
        var id = 1012L;
        var command = new DeleteOrdemCommand { Id = id };

        await _handler.Handle(command, CancellationToken.None);

        await _service.Received(1).ValidateAndDeleteAsync(id, Arg.Any<CancellationToken>());
        await _unitOfWork.Received(1).SaveChangesAsync(Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task Handle_OrdemComStatusProtegido_DevePropagarConflictException()
    {
        var command = new DeleteOrdemCommand { Id = 1013L };
        _service.ValidateAndDeleteAsync(Arg.Any<long>(), Arg.Any<CancellationToken>())
            .ThrowsAsync(new ConflictException("Ordem", "Não é possível excluir ordem com status protegido"));

        await Assert.ThrowsExactlyAsync<ConflictException>(
            () => _handler.Handle(command, CancellationToken.None));

        await _unitOfWork.DidNotReceive().SaveChangesAsync(Arg.Any<CancellationToken>());
    }
}

#endregion
