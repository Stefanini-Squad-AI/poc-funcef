using NSubstitute;
using TemplateBase.Application.Queries.Cliente.GetPaged;
using TemplateBase.Application.Queries.Ordem.GetByCliente;
using TemplateBase.Application.Queries.Ordem.GetPaged;
using TemplateBase.Application.Services;

namespace TemplateBase.Tests.Application.Handlers;

/// <summary>
/// Testes de construção e instanciação dos handlers paginados.
/// Os handlers GetPaged e GetByCliente utilizam métodos herdados de Repository (não-virtuais),
/// cujo comportamento é testado em testes de integração com banco de dados real.
/// Aqui validamos apenas a construção e injeção de dependências.
/// </summary>

#region GetClientePagedHandler

[TestClass]
public class ClienteGetPagedHandlerTests
{
    [TestMethod]
    public void DeveInstanciarHandler_ComServiceInjetado()
    {
        var service = Substitute.For<IClienteService>();

        var handler = new GetClientePagedHandler(service);

        Assert.IsNotNull(handler);
    }
}

#endregion

#region GetOrdemPagedHandler

[TestClass]
public class OrdemGetPagedHandlerTests
{
    [TestMethod]
    public void DeveInstanciarHandler_ComServiceInjetado()
    {
        var service = Substitute.For<IOrdemService>();

        var handler = new GetOrdemPagedHandler(service);

        Assert.IsNotNull(handler);
    }
}

#endregion

#region GetOrdensByClienteHandler

[TestClass]
public class OrdemGetByClienteHandlerTests
{
    [TestMethod]
    public void DeveInstanciarHandler_ComServicesInjetados()
    {
        var ordemService = Substitute.For<IOrdemService>();
        var clienteService = Substitute.For<IClienteService>();

        var handler = new GetOrdensByClienteHandler(ordemService, clienteService);

        Assert.IsNotNull(handler);
    }
}

#endregion
