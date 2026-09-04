using System.Linq.Expressions;
using FuncefEssenciais.Exceptions;
using FuncefORM.Contracts;
using NSubstitute;
using TemplateBase.Application.DTOs.ClienteDto.Request;
using TemplateBase.Application.Services;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Tests.Integration.Services;

[TestClass]
public class ClienteServiceIntegrationTests
{
    private IRepository<Cliente> _clienteRepo = null!;
    private IRepository<Ordem> _ordemRepo = null!;
    private ClienteService _service = null!;

    public TestContext TestContext { get; set; } = null!;

    [TestInitialize]
    public void Setup()
    {
        _clienteRepo = Substitute.For<IRepository<Cliente>>();
        _ordemRepo = Substitute.For<IRepository<Ordem>>();
        _service = new ClienteService(_clienteRepo, _ordemRepo);
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
    public async Task CreateAsync_ComDadosValidos_DeveCriarCliente()
    {
        var request = new ClienteRequest { Nome = "João Silva", Email = "joao@email.com" };
        _clienteRepo.ExistsAsync(Arg.Any<Expression<Func<Cliente, bool>>>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(false);

        var result = await _service.CreateAsync(request, TestContext.CancellationToken);

        Assert.IsNotNull(result);
        Assert.AreEqual("João Silva", result.Nome);
        Assert.AreEqual("joao@email.com", result.Email);
        // O serviço não define o Id: a coluna CLIENTE_ID é identity e o banco o gera na inserção.
        Assert.AreEqual(0L, result.Id);
        await _clienteRepo.Received(1).AddAsync(Arg.Is<Cliente>(c => c != null && c.Nome == "João Silva"), Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task CreateAsync_SemEmail_DeveCriarSemVerificacaoDeUnicidade()
    {
        var request = new ClienteRequest { Nome = "Maria", Email = null };

        var result = await _service.CreateAsync(request, TestContext.CancellationToken);

        Assert.IsNotNull(result);
        Assert.AreEqual("Maria", result.Nome);
        Assert.IsNull(result.Email);
        await _clienteRepo.DidNotReceive().ExistsAsync(Arg.Any<Expression<Func<Cliente, bool>>>(), Arg.Any<bool>(), Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task CreateAsync_EmailDuplicado_DeveLancarConflict()
    {
        var request = new ClienteRequest { Nome = "João", Email = "existente@email.com" };
        _clienteRepo.ExistsAsync(Arg.Any<Expression<Func<Cliente, bool>>>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(true);

        var ex = await AssertThrowsAsync<ConflictException>(() => _service.CreateAsync(request, TestContext.CancellationToken));

        Assert.AreEqual("Cliente", ex.NomeRecurso);
        await _clienteRepo.DidNotReceive().AddAsync(Arg.Any<Cliente>(), Arg.Any<CancellationToken>());
    }

    #endregion

    #region UpdateAsync

    [TestMethod]
    public async Task UpdateAsync_ClienteExistente_DeveAtualizar()
    {
        var id = 1001L;
        var clienteExistente = new Cliente { Id = id, Nome = "Antigo", Email = "antigo@email.com" };
        var request = new ClienteRequest { Nome = "Novo", Email = "novo@email.com" };

        _clienteRepo.GetByIdAsync(id, Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(clienteExistente);
        _clienteRepo.GetFirstAsync(Arg.Any<Expression<Func<Cliente, bool>>>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns((Cliente?)null);

        var result = await _service.UpdateAsync(id, request, TestContext.CancellationToken);

        Assert.AreEqual("Novo", result.Nome);
        Assert.AreEqual("novo@email.com", result.Email);
        await _clienteRepo.Received(1).UpdateAsync(clienteExistente, Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task UpdateAsync_ClienteInexistente_DeveLancarNotFound()
    {
        var id = 1002L;
        _clienteRepo.GetByIdAsync(id, Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns((Cliente?)null);

        await AssertThrowsAsync<NotFoundException>(
            () => _service.UpdateAsync(id, new ClienteRequest { Nome = "Teste" }, TestContext.CancellationToken));
    }

    [TestMethod]
    public async Task UpdateAsync_EmailDuplicadoOutroCliente_DeveLancarConflict()
    {
        var id = 1003L;
        var outroId = 1004L;
        var clienteExistente = new Cliente { Id = id, Nome = "João", Email = "joao@email.com" };
        var outroCliente = new Cliente { Id = outroId, Nome = "Outro", Email = "usado@email.com" };

        _clienteRepo.GetByIdAsync(id, Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(clienteExistente);
        _clienteRepo.GetFirstAsync(Arg.Any<Expression<Func<Cliente, bool>>>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(outroCliente);

        var ex = await AssertThrowsAsync<ConflictException>(
            () => _service.UpdateAsync(id, new ClienteRequest { Nome = "João", Email = "usado@email.com" }, TestContext.CancellationToken));

        Assert.AreEqual("Cliente", ex.NomeRecurso);
    }

    #endregion

    #region ValidateAndDeleteAsync

    [TestMethod]
    public async Task ValidateAndDeleteAsync_ClienteSemOrdens_DeveExcluir()
    {
        var id = 1005L;
        var cliente = new Cliente { Id = id, Nome = "João" };

        _clienteRepo.GetByIdAsync(id, Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(cliente);
        _ordemRepo.ExistsAsync(Arg.Any<Expression<Func<Ordem, bool>>>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(false);

        await _service.ValidateAndDeleteAsync(id, TestContext.CancellationToken);

        await _clienteRepo.Received(1).DeleteAsync(cliente, Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task ValidateAndDeleteAsync_ClienteComOrdens_DeveLancarConflict()
    {
        var id = 1006L;
        var cliente = new Cliente { Id = id, Nome = "João" };

        _clienteRepo.GetByIdAsync(id, Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(cliente);
        _ordemRepo.ExistsAsync(Arg.Any<Expression<Func<Ordem, bool>>>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(true);

        await AssertThrowsAsync<ConflictException>(() => _service.ValidateAndDeleteAsync(id, TestContext.CancellationToken));

        await _clienteRepo.DidNotReceive().DeleteAsync(Arg.Any<Cliente>(), Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task ValidateAndDeleteAsync_ClienteInexistente_DeveLancarNotFound()
    {
        var id = 1007L;
        _clienteRepo.GetByIdAsync(id, Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns((Cliente?)null);

        await AssertThrowsAsync<NotFoundException>(() => _service.ValidateAndDeleteAsync(id, TestContext.CancellationToken));
    }

    #endregion

    #region Delegation Methods

    [TestMethod]
    public async Task GetByIdAsync_DeveDelegarParaRepository()
    {
        var id = 1008L;
        var expected = new Cliente { Id = id, Nome = "Test" };
        _clienteRepo.GetByIdAsync(id, Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(expected);

        var result = await _service.GetByIdAsync(id, TestContext.CancellationToken);

        Assert.AreSame(expected, result);
    }

    [TestMethod]
    public async Task ExistsAsync_DeveDelegarParaRepository()
    {
        _clienteRepo.ExistsAsync(Arg.Any<Expression<Func<Cliente, bool>>>(), Arg.Any<bool>(), Arg.Any<CancellationToken>())
            .Returns(true);

        var result = await _service.ExistsAsync(c => c.Nome == "Test", TestContext.CancellationToken);

        Assert.IsTrue(result);
    }

    #endregion
}
