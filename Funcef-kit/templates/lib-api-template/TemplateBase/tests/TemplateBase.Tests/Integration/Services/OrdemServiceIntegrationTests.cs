// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using System.Linq.Expressions;
using FuncefEssenciais.Exceptions;
using FuncefORM.Contracts;
using NSubstitute;
using TemplateBase.Application.DTOs.OrdemDto.Request;
using TemplateBase.Application.Services;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Tests.Integration.Services;

[TestClass]
public class OrdemServiceIntegrationTests
{
    private IRepository<Ordem> _ordemRepo = null!;
    private IRepository<Cliente> _clienteRepo = null!;
    private OrdemService _service = null!;

    [TestInitialize]
    public void Setup()
    {
        _ordemRepo = Substitute.For<IRepository<Ordem>>();
        _clienteRepo = Substitute.For<IRepository<Cliente>>();
        _service = new OrdemService(_ordemRepo, _clienteRepo);
    }

    private static async Task<T> AssertThrowsAsync<T>(Func<Task> action) where T : Exception
    {
        try
        {
            await action();
            Assert.Fail($"Esperava exceção {typeof(T).Name}");
            return null!;
        }
        catch (T ex)
        {
            return ex;
        }
    }

    #region CreateAsync

    [TestMethod]
    public async Task CreateAsync_ClienteExistente_DeveCriarOrdem()
    {
        var clienteId = 1001L;
        var cliente = new Cliente { Id = clienteId, Nome = "João" };
        var request = new CreateOrdemRequest { ClienteId = clienteId, Valor = 250m };

        _clienteRepo.GetByIdAsync(clienteId, Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(cliente);

        var result = await _service.CreateAsync(request);

        Assert.IsNotNull(result);
        Assert.AreEqual("Pendente", result.Status);
        Assert.AreEqual(clienteId, result.ClienteId);
        Assert.AreSame(cliente, result.Cliente);
        // O serviço não define o Id: a coluna ORDEM_ID é identity e o banco o gera na inserção.
        Assert.AreEqual(0L, result.Id);
        await _ordemRepo.Received(1).AddAsync(Arg.Any<Ordem>(), Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task CreateAsync_ClienteInexistente_DeveLancarNotFound()
    {
        var clienteId = 1002L;
        _clienteRepo.GetByIdAsync(clienteId, Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns((Cliente?)null);

        await AssertThrowsAsync<NotFoundException>(
            () => _service.CreateAsync(new CreateOrdemRequest { ClienteId = clienteId, Valor = 100m }));

        await _ordemRepo.DidNotReceive().AddAsync(Arg.Any<Ordem>(), Arg.Any<CancellationToken>());
    }

    #endregion

    #region UpdateAsync

    [TestMethod]
    public async Task UpdateAsync_OrdemExistente_DeveAtualizar()
    {
        var id = 1003L;
        var ordem = new Ordem { Id = id, Valor = 100m, Status = "Pendente" };
        var request = new UpdateOrdemRequest { Valor = 200m, Status = "Processando", Observacoes = "Atualizado" };

        _ordemRepo.GetByIdWithAutoIncludesAsync(id, Arg.Any<string[]?>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(ordem);

        var result = await _service.UpdateAsync(id, request);

        Assert.AreEqual(200m, result.Ordem.Valor);
        Assert.AreEqual("Processando", result.Ordem.Status);
        Assert.AreEqual("Atualizado", result.Ordem.Observacoes);
        // O status anterior retorna junto para o Handler registrar o histórico após o commit.
        Assert.AreEqual("Pendente", result.StatusAnterior);
    }

    [TestMethod]
    public async Task UpdateAsync_OrdemInexistente_DeveLancarNotFound()
    {
        _ordemRepo.GetByIdWithAutoIncludesAsync(Arg.Any<long>(), Arg.Any<string[]?>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns((Ordem?)null);

        await AssertThrowsAsync<NotFoundException>(
            () => _service.UpdateAsync(1004L, new UpdateOrdemRequest { Valor = 100m, Status = "Pendente" }));
    }

    [TestMethod]
    public async Task UpdateAsync_StatusInvalido_DeveLancarBusinessException()
    {
        var id = 1005L;
        var ordem = new Ordem { Id = id, Valor = 100m, Status = "Pendente" };

        _ordemRepo.GetByIdWithAutoIncludesAsync(id, Arg.Any<string[]?>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(ordem);

        var ex = await AssertThrowsAsync<BusinessException>(
            () => _service.UpdateAsync(id, new UpdateOrdemRequest { Valor = 100m, Status = "Invalido" }));

        Assert.AreEqual("INVALID_STATUS", ex.ErrorCode);
    }

    [TestMethod]
    public async Task UpdateAsync_TransicaoDeStatusProibida_DeveLancarConflict()
    {
        var id = 1006L;
        var ordem = new Ordem { Id = id, Valor = 100m, Status = "Concluido" };

        _ordemRepo.GetByIdWithAutoIncludesAsync(id, Arg.Any<string[]?>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(ordem);

        await AssertThrowsAsync<ConflictException>(
            () => _service.UpdateAsync(id, new UpdateOrdemRequest { Valor = 100m, Status = "Pendente" }));
    }

    #endregion

    #region UpdateStatusAsync

    [TestMethod]
    public async Task UpdateStatusAsync_StatusValido_DeveAtualizar()
    {
        var id = 1007L;
        var ordem = new Ordem { Id = id, Status = "Pendente" };

        _ordemRepo.GetByIdWithAutoIncludesAsync(id, Arg.Any<string[]?>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(ordem);

        var result = await _service.UpdateStatusAsync(id, new UpdateOrdemStatusRequest { Status = "Processando" });

        Assert.AreEqual("Processando", result.Ordem.Status);
        Assert.AreEqual("Pendente", result.StatusAnterior);
    }

    [TestMethod]
    public async Task UpdateStatusAsync_OrdemConcluida_DeveLancarConflict()
    {
        var id = 1008L;
        var ordem = new Ordem { Id = id, Status = "Concluido" };

        _ordemRepo.GetByIdWithAutoIncludesAsync(id, Arg.Any<string[]?>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(ordem);

        await AssertThrowsAsync<ConflictException>(
            () => _service.UpdateStatusAsync(id, new UpdateOrdemStatusRequest { Status = "Cancelado" }));
    }

    #endregion

    #region ValidateAndDeleteAsync

    [TestMethod]
    public async Task ValidateAndDeleteAsync_OrdemPendente_DeveExcluir()
    {
        var id = 1009L;
        var ordem = new Ordem { Id = id, Status = "Pendente" };

        _ordemRepo.GetByIdAsync(id, Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(ordem);

        await _service.ValidateAndDeleteAsync(id);

        await _ordemRepo.Received(1).DeleteAsync(ordem, Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task ValidateAndDeleteAsync_OrdemConcluida_DeveLancarConflict()
    {
        var id = 1010L;
        var ordem = new Ordem { Id = id, Status = "Concluido" };

        _ordemRepo.GetByIdAsync(id, Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(ordem);

        await AssertThrowsAsync<ConflictException>(() => _service.ValidateAndDeleteAsync(id));

        await _ordemRepo.DidNotReceive().DeleteAsync(Arg.Any<Ordem>(), Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task ValidateAndDeleteAsync_OrdemProcessando_DeveLancarConflict()
    {
        var id = 1011L;
        var ordem = new Ordem { Id = id, Status = "Processando" };

        _ordemRepo.GetByIdAsync(id, Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(ordem);

        await AssertThrowsAsync<ConflictException>(() => _service.ValidateAndDeleteAsync(id));
    }

    [TestMethod]
    public async Task ValidateAndDeleteAsync_OrdemCancelada_DeveExcluir()
    {
        var id = 1012L;
        var ordem = new Ordem { Id = id, Status = "Cancelado" };

        _ordemRepo.GetByIdAsync(id, Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(ordem);

        await _service.ValidateAndDeleteAsync(id);

        await _ordemRepo.Received(1).DeleteAsync(ordem, Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task ValidateAndDeleteAsync_OrdemInexistente_DeveLancarNotFound()
    {
        _ordemRepo.GetByIdAsync(Arg.Any<long>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns((Ordem?)null);

        await AssertThrowsAsync<NotFoundException>(() => _service.ValidateAndDeleteAsync(1013L));
    }

    #endregion

    #region Delegation Methods

    [TestMethod]
    public async Task GetByIdAsync_DeveDelegarParaRepository()
    {
        var id = 1014L;
        var expected = new Ordem { Id = id, Status = "Pendente" };
        _ordemRepo.GetByIdAsync(id, Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(expected);

        var result = await _service.GetByIdAsync(id);

        Assert.AreSame(expected, result);
    }

    [TestMethod]
    public async Task ExistsAsync_DeveDelegarParaRepository()
    {
        _ordemRepo.ExistsAsync(Arg.Any<Expression<Func<Ordem, bool>>>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(true);

        var result = await _service.ExistsAsync(o => o.Status == "Pendente");

        Assert.IsTrue(result);
    }

    #endregion
}
