using FuncefEssenciais.Application;
using Funcef.Abstractions.Telemetry;
using Microsoft.AspNetCore.Mvc;
using NSubstitute;
using TemplateBase.API.Controllers;
using TemplateBase.Application.Commands.Cliente.Create;
using TemplateBase.Application.Commands.Cliente.Delete;
using TemplateBase.Application.Commands.Cliente.Update;
using TemplateBase.Application.DTOs.ClienteDto.Request;
using TemplateBase.Application.DTOs.ClienteDto.Response;
using TemplateBase.Application.DTOs.ClienteDto.Resume;
using TemplateBase.Application.Queries.Cliente.GetById;
using TemplateBase.Application.Queries.Cliente.GetPaged;
using FuncefEssenciais.Application.Commands;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Data;

namespace TemplateBase.Tests.API.Controllers;

[TestClass]
public class ClientesControllerTests
{
    private ITelemetry _telemetry = null!;
    private IMediator _mediator = null!;
    private ClientesController _controller = null!;

    [TestInitialize]
    public void Setup()
    {
        _telemetry = Substitute.For<ITelemetry>();
        _mediator = Substitute.For<IMediator>();
        _controller = new ClientesController(_telemetry, _mediator);
    }

    #region GetAll

    [TestMethod]
    public async Task GetAll_Sucesso_DeveRetornarOk()
    {
        var pagedResult = new PaginatedResult<ClienteResume>(
            new List<ClienteResume>(), 1, 10, 0, 0);

        _mediator.Receive(Arg.Any<GetClientePagedQuery>(), Arg.Any<CancellationToken>())
            .Returns(pagedResult);

        var result = await _controller.GetAll();

        Assert.IsInstanceOfType(result, typeof(OkObjectResult));
    }

    #endregion

    #region Get

    [TestMethod]
    public async Task Get_ClienteExistente_DeveRetornarOk()
    {
        var clienteResponse = new ClienteResponse { Id = 1001L, Nome = "João" };

        _mediator.Receive(Arg.Any<GetClienteByIdQuery>(), Arg.Any<CancellationToken>())
            .Returns(clienteResponse);

        var result = await _controller.Get(1002L);

        Assert.IsInstanceOfType(result, typeof(OkObjectResult));
    }

    #endregion

    #region Create

    [TestMethod]
    public async Task Create_ComSucesso_DeveRetornarCreated()
    {
        var clienteResponse = new ClienteResponse { Id = 1003L, Nome = "João" };

        _mediator.Send(Arg.Any<CreateClienteCommand>(), Arg.Any<CancellationToken>())
            .Returns(clienteResponse);

        var result = await _controller.Create(new ClienteRequest { Nome = "João" });

        Assert.IsInstanceOfType(result, typeof(ObjectResult));
        var objectResult = (ObjectResult)result;
        Assert.AreEqual(201, objectResult.StatusCode);
    }

    #endregion

    #region Update

    [TestMethod]
    public async Task Update_ComSucesso_DeveRetornarOk()
    {
        var clienteResponse = new ClienteResponse { Id = 1004L, Nome = "João Atualizado" };

        _mediator.Send(Arg.Any<UpdateClienteCommand>(), Arg.Any<CancellationToken>())
            .Returns(clienteResponse);

        var result = await _controller.Update(1005L, new ClienteRequest { Nome = "João Atualizado" });

        Assert.IsInstanceOfType(result, typeof(OkObjectResult));
    }

    #endregion

    #region Delete

    [TestMethod]
    public async Task Delete_ComSucesso_DeveRetornarNoContent()
    {
        var result = await _controller.Delete(1006L);

        var objectResult = result as ObjectResult;
        Assert.IsNotNull(objectResult);
        Assert.AreEqual(204, objectResult.StatusCode);
        await _mediator.Received(1).Send(Arg.Any<DeleteClienteCommand>(), Arg.Any<CancellationToken>());
    }

    #endregion
}
