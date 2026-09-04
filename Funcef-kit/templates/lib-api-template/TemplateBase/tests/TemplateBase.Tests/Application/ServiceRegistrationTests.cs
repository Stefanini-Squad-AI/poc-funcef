// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FluentValidation;
using FuncefEssenciais.Application;
using FuncefEssenciais.Application.Commands;
using FuncefEssenciais.Application.Queries;
using FuncefORM.Data;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TemplateBase.Application;
using TemplateBase.Application.Commands.Cliente.Create;
using TemplateBase.Application.Commands.Cliente.CreateComOrdemDapper;
using TemplateBase.Application.Commands.Cliente.CreateComOrdemEf;
using TemplateBase.Application.Commands.Cliente.Delete;
using TemplateBase.Application.Commands.Cliente.Update;
using TemplateBase.Application.Commands.Ordem.Create;
using TemplateBase.Application.Commands.Ordem.Delete;
using TemplateBase.Application.Commands.Ordem.Update;
using TemplateBase.Application.Commands.Ordem.UpdateStatus;
using TemplateBase.Application.DTOs.ClienteDto.Response;
using TemplateBase.Application.DTOs.ClienteDto.Resume;
using TemplateBase.Application.DTOs.OrdemDto.Response;
using TemplateBase.Application.DTOs.OrdemDto.Resume;
using TemplateBase.Application.Queries.Cliente.GetById;
using TemplateBase.Application.Queries.Cliente.GetPaged;
using TemplateBase.Application.Queries.Ordem.GetById;
using TemplateBase.Application.Queries.Ordem.GetByCliente;
using TemplateBase.Application.Queries.Ordem.GetPaged;
using TemplateBase.Application.Services;

namespace TemplateBase.Tests.Application;

/// <summary>
/// Testes de verificação do registro de serviços da camada Application no container de DI.
/// </summary>
[TestClass]
public class ServiceRegistrationTests
{
    private IServiceCollection _services = null!;

    [TestInitialize]
    public void Setup()
    {
        // Configuração COM o banco secundário habilitado: cobre também os services condicionais.
        _services = BuildServices(sqlServerHabilitado: true);
    }

    /// <summary>
    /// Monta o container da Application com ou sem a seção <c>SqlServer</c>, para exercitar o
    /// registro condicional dos services que dependem do banco secundário.
    /// </summary>
    private static IServiceCollection BuildServices(bool sqlServerHabilitado)
    {
        var settings = new Dictionary<string, string?>();

        if (sqlServerHabilitado)
        {
            settings["SqlServer:DirectConnectionString"] = "Server=(local);Database=TESTE;";
        }

        var configuration = new ConfigurationBuilder()
            .AddInMemoryCollection(settings)
            .Build();

        var services = new ServiceCollection();
        services.AddApplication(configuration);

        return services;
    }

    #region Mediator

    [TestMethod]
    public void DeveRegistrar_IMediator()
    {
        Assert.IsTrue(ContemRegistro<IMediator>());
    }

    #endregion

    #region Command Handlers

    [TestMethod]
    public void DeveRegistrar_CreateClienteHandler()
    {
        Assert.IsTrue(ContemRegistro<ICommandHandler<CreateClienteCommand, ClienteResponse>>());
    }

    [TestMethod]
    public void DeveRegistrar_UpdateClienteHandler()
    {
        Assert.IsTrue(ContemRegistro<ICommandHandler<UpdateClienteCommand, ClienteResponse>>());
    }

    [TestMethod]
    public void DeveRegistrar_DeleteClienteHandler()
    {
        Assert.IsTrue(ContemRegistro<ICommandHandler<DeleteClienteCommand>>());
    }

    [TestMethod]
    public void DeveRegistrar_CreateClienteComOrdemEfHandler()
    {
        Assert.IsTrue(ContemRegistro<ICommandHandler<CreateClienteComOrdemEfCommand, ClienteComOrdemResponse>>());
    }

    [TestMethod]
    public void DeveRegistrar_CreateClienteComOrdemDapperHandler()
    {
        Assert.IsTrue(ContemRegistro<ICommandHandler<CreateClienteComOrdemDapperCommand, ClienteComOrdemResponse>>());
    }

    [TestMethod]
    public void DeveRegistrar_CreateOrdemHandler()
    {
        Assert.IsTrue(ContemRegistro<ICommandHandler<CreateOrdemCommand, OrdemResponse>>());
    }

    [TestMethod]
    public void DeveRegistrar_UpdateOrdemHandler()
    {
        Assert.IsTrue(ContemRegistro<ICommandHandler<UpdateOrdemCommand, OrdemResponse>>());
    }

    [TestMethod]
    public void DeveRegistrar_UpdateOrdemStatusHandler()
    {
        Assert.IsTrue(ContemRegistro<ICommandHandler<UpdateOrdemStatusCommand, OrdemResponse>>());
    }

    [TestMethod]
    public void DeveRegistrar_DeleteOrdemHandler()
    {
        Assert.IsTrue(ContemRegistro<ICommandHandler<DeleteOrdemCommand>>());
    }

    #endregion

    #region Query Handlers

    [TestMethod]
    public void DeveRegistrar_GetClienteByIdHandler()
    {
        Assert.IsTrue(ContemRegistro<IQueryHandler<GetClienteByIdQuery, ClienteResponse>>());
    }

    [TestMethod]
    public void DeveRegistrar_GetClientePagedHandler()
    {
        Assert.IsTrue(ContemRegistro<IQueryHandler<GetClientePagedQuery, PaginatedResult<ClienteResume>>>());
    }

    [TestMethod]
    public void DeveRegistrar_GetOrdemByIdHandler()
    {
        Assert.IsTrue(ContemRegistro<IQueryHandler<GetOrdemByIdQuery, OrdemResponse>>());
    }

    [TestMethod]
    public void DeveRegistrar_GetOrdemPagedHandler()
    {
        Assert.IsTrue(ContemRegistro<IQueryHandler<GetOrdemPagedQuery, PaginatedResult<OrdemResume>>>());
    }

    [TestMethod]
    public void DeveRegistrar_GetOrdensByClienteHandler()
    {
        Assert.IsTrue(ContemRegistro<IQueryHandler<GetOrdensByClienteQuery, PaginatedResult<OrdemResume>>>());
    }

    #endregion

    #region Services

    [TestMethod]
    public void DeveRegistrar_ClienteService()
    {
        Assert.IsTrue(ContemRegistro<IClienteService>());
    }

    [TestMethod]
    public void DeveRegistrar_OrdemService()
    {
        Assert.IsTrue(ContemRegistro<IOrdemService>());
    }

    #endregion

    #region Services condicionais (dependem de infraestrutura opcional)

    [TestMethod]
    public void Application_NaoDeveRegistrar_OrdemHistoricoService()
    {
        // IOrdemHistoricoService é implementado na Infrastructure (depende de IDocumentStore<T> do
        // FUNCEF.NoSql), então quem o registra é DocumentsRegistration, condicionado a
        // NoSql:MongoDocuments. A Application não pode referenciar a Infrastructure.
        Assert.IsFalse(ContemRegistro<IOrdemHistoricoService>(),
            "IOrdemHistoricoService é registrado pela Infrastructure, não pela Application.");
    }

    #endregion

    #region Validators

    [TestMethod]
    public void DeveRegistrar_Validators()
    {
        var count = _services.Count(s =>
            s.ServiceType.IsGenericType &&
            s.ServiceType.GetGenericTypeDefinition() == typeof(IValidator<>));

        Assert.IsTrue(count >= 9, $"Devem ser registrados pelo menos 9 validators, encontrados: {count}");
    }

    #endregion

    private bool ContemRegistro<T>()
    {
        return _services.Any(s => s.ServiceType == typeof(T));
    }
}
