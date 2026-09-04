// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application;
using Funcef.Abstractions.Telemetry;
using Microsoft.AspNetCore.Mvc;
using NSubstitute;
using TemplateBase.API.Controllers;
using TemplateBase.Application.Commands.Ordem.Create;
using TemplateBase.Application.Commands.Ordem.Delete;
using TemplateBase.Application.Commands.Ordem.Update;
using TemplateBase.Application.Commands.Ordem.UpdateStatus;
using TemplateBase.Application.DTOs.OrdemDto.Request;
using TemplateBase.Application.DTOs.OrdemDto.Response;
using TemplateBase.Application.DTOs.OrdemDto.Resume;
using TemplateBase.Application.Queries.Ordem.GetById;
using TemplateBase.Application.Queries.Ordem.GetByCliente;
using TemplateBase.Application.Queries.Ordem.GetPaged;
using FuncefEssenciais.Application.Commands;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Data;

namespace TemplateBase.Tests.API.Controllers;

[TestClass]
public class OrdensControllerTests
{
    private ITelemetry _telemetry = null!;
    private IMediator _mediator = null!;
    private OrdensController _controller = null!;

    [TestInitialize]
    public void Setup()
    {
        _telemetry = Substitute.For<ITelemetry>();
        _mediator = Substitute.For<IMediator>();
        _controller = new OrdensController(_telemetry, _mediator);
    }

    #region GetAll

    [TestMethod]
    public async Task GetAll_Sucesso_DeveRetornarOk()
    {
        var pagedResult = new PaginatedResult<OrdemResume>(
            new List<OrdemResume>(), 1, 10, 0, 0);

        _mediator.Receive(Arg.Any<GetOrdemPagedQuery>(), Arg.Any<CancellationToken>())
            .Returns(pagedResult);

        var result = await _controller.GetAll();

        Assert.IsInstanceOfType(result, typeof(OkObjectResult));
    }

    #endregion

    #region Get

    [TestMethod]
    public async Task Get_OrdemExistente_DeveRetornarOk()
    {
        var ordemResponse = new OrdemResponse
        {
            Id = 1001L,
            ClienteId = 1002L,
            Valor = 100m,
            Status = "Pendente"
        };

        _mediator.Receive(Arg.Any<GetOrdemByIdQuery>(), Arg.Any<CancellationToken>())
            .Returns(ordemResponse);

        var result = await _controller.Get(1003L);

        Assert.IsInstanceOfType(result, typeof(OkObjectResult));
    }

    #endregion

    #region Create

    [TestMethod]
    public async Task Create_ComSucesso_DeveRetornarCreated()
    {
        var ordemResponse = new OrdemResponse
        {
            Id = 1004L,
            ClienteId = 1005L,
            Valor = 200m,
            Status = "Pendente"
        };

        _mediator.Send(Arg.Any<CreateOrdemCommand>(), Arg.Any<CancellationToken>())
            .Returns(ordemResponse);

        var result = await _controller.Create(new CreateOrdemRequest
        {
            ClienteId = 1006L,
            Valor = 200m
        });

        Assert.IsInstanceOfType(result, typeof(ObjectResult));
        var objectResult = (ObjectResult)result;
        Assert.AreEqual(201, objectResult.StatusCode);
    }

    #endregion

    #region Update

    [TestMethod]
    public async Task Update_ComSucesso_DeveRetornarOk()
    {
        var ordemResponse = new OrdemResponse
        {
            Id = 1007L,
            Valor = 300m,
            Status = "Processando"
        };

        _mediator.Send(Arg.Any<UpdateOrdemCommand>(), Arg.Any<CancellationToken>())
            .Returns(ordemResponse);

        var result = await _controller.Update(1008L, new UpdateOrdemRequest
        {
            Valor = 300m,
            Status = "Processando"
        });

        Assert.IsInstanceOfType(result, typeof(OkObjectResult));
    }

    #endregion

    #region UpdateStatus

    [TestMethod]
    public async Task UpdateStatus_ComSucesso_DeveRetornarOk()
    {
        var ordemResponse = new OrdemResponse { Id = 1009L, Status = "Concluido" };

        _mediator.Send(Arg.Any<UpdateOrdemStatusCommand>(), Arg.Any<CancellationToken>())
            .Returns(ordemResponse);

        var result = await _controller.UpdateStatus(1010L, new UpdateOrdemStatusRequest { Status = "Concluido" });

        Assert.IsInstanceOfType(result, typeof(OkObjectResult));
    }

    #endregion

    #region Delete

    [TestMethod]
    public async Task Delete_ComSucesso_DeveRetornarNoContent()
    {
        var result = await _controller.Delete(1011L);

        var objectResult = result as ObjectResult;
        Assert.IsNotNull(objectResult);
        Assert.AreEqual(204, objectResult.StatusCode);
        await _mediator.Received(1).Send(Arg.Any<DeleteOrdemCommand>(), Arg.Any<CancellationToken>());
    }

    #endregion
}
