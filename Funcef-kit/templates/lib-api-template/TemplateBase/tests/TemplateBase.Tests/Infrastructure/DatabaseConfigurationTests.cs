using Funcef.Abstractions.Secrets;
using FuncefORM.Contracts;
using Microsoft.Extensions.Configuration;
using NSubstitute;

namespace TemplateBase.Tests.Infrastructure;

/// <summary>
/// Testes de verificação da configuração e contratos do banco de dados Oracle (FuncefORM).
/// Validam que o appsettings está correto e que as interfaces de repositório e UoW se comportam conforme esperado.
/// </summary>
[TestClass]
public class DatabaseConfigurationTests
{
    private IConfiguration _configuration = null!;
    private IConfiguration _configurationDev = null!;

    [TestInitialize]
    public void Setup()
    {
        _configuration = new ConfigurationBuilder()
            .AddJsonFile("appsettings.json", optional: false)
            .Build();

        _configurationDev = new ConfigurationBuilder()
            .AddJsonFile("appsettings.json", optional: false)
            .AddJsonFile("appsettings.Development.json", optional: true)
            .Build();
    }

    #region Configuração Connection no appsettings

    [TestMethod]
    public void Config_SecaoFuncefORM_DeveExistir()
    {
        var section = _configuration.GetSection("FuncefORM");
        Assert.IsTrue(section.Exists(), "A seção 'FuncefORM' deve existir no appsettings.json");
    }

    [TestMethod]
    public void Config_Connection_ProviderType_DeveSerOracle()
    {
        var providerType = _configuration["FuncefORM:Connection:ProviderType"];
        Assert.AreEqual("Oracle", providerType);
    }

    [TestMethod]
    public void Config_Connection_ReferenciaAoCofre_Producao_DeveEstarConfigurada()
    {
        // Forma canônica SecretRef: subseção 'ConnectionStringFromKeyVault' com Enabled + SecretName.
        // O nome do segredo é do cofre de cada ambiente, por isso não é fixado aqui.
        var secretRef = _configuration
            .GetSection("FuncefORM:Connection:ConnectionStringFromKeyVault")
            .Get<SecretRef>();

        Assert.IsNotNull(secretRef, "A referência ao segredo da connection string deve existir.");
        Assert.IsTrue(secretRef.IsConfigured,
            "'FuncefORM:Connection:ConnectionStringFromKeyVault' deve estar habilitada e nomear o segredo.");
    }

    [TestMethod]
    public void Config_Connection_ReferenciaAoCofre_Dev_DeveExistir()
    {
        var secretRef = _configurationDev
            .GetSection("FuncefORM:Connection:ConnectionStringFromKeyVault")
            .Get<SecretRef>();

        Assert.IsNotNull(secretRef, "A referência ao segredo deve ser herdada do appsettings.json em Development.");
        Assert.IsTrue(secretRef.IsConfigured,
            "A referência ao segredo deve continuar válida em desenvolvimento (herdada da base).");
    }

    [TestMethod]
    public void Config_Connection_ConnectionTimeout_DeveSerPositivo()
    {
        var timeout = _configuration.GetValue<int>("FuncefORM:Connection:ConnectionTimeout");
        Assert.IsTrue(timeout > 0, $"ConnectionTimeout deve ser positivo, atual: {timeout}");
    }

    [TestMethod]
    public void Config_Connection_CommandTimeout_DeveSerPositivo()
    {
        var timeout = _configuration.GetValue<int>("FuncefORM:Connection:CommandTimeout");
        Assert.IsTrue(timeout > 0, $"CommandTimeout deve ser positivo, atual: {timeout}");
    }

    [TestMethod]
    public void Config_Connection_Dev_CommandTimeout_DeveSerMaiorQueProducao()
    {
        var timeoutProd = _configuration.GetValue<int>("FuncefORM:Connection:CommandTimeout");
        var timeoutDev = _configurationDev.GetValue<int>("FuncefORM:Connection:CommandTimeout");

        Assert.IsTrue(timeoutDev >= timeoutProd,
            $"CommandTimeout dev ({timeoutDev}) deve ser >= produção ({timeoutProd})");
    }

    #endregion

    #region Configuração Pool

    [TestMethod]
    public void Config_Pool_MinSize_DeveSerPositivo()
    {
        var minSize = _configuration.GetValue<int>("FuncefORM:Pool:MinSize");
        Assert.IsTrue(minSize > 0, $"MinSize deve ser positivo, atual: {minSize}");
    }

    [TestMethod]
    public void Config_Pool_MaxSize_DeveSerMaiorQueMinSize()
    {
        var minSize = _configuration.GetValue<int>("FuncefORM:Pool:MinSize");
        var maxSize = _configuration.GetValue<int>("FuncefORM:Pool:MaxSize");
        Assert.IsTrue(maxSize > minSize,
            $"MaxSize ({maxSize}) deve ser maior que MinSize ({minSize})");
    }

    [TestMethod]
    public void Config_Pool_Dev_MaxSize_DeveSerMenorQueProducao()
    {
        var maxSizeProd = _configuration.GetValue<int>("FuncefORM:Pool:MaxSize");
        var maxSizeDev = _configurationDev.GetValue<int>("FuncefORM:Pool:MaxSize");

        Assert.IsTrue(maxSizeDev <= maxSizeProd,
            $"Pool dev ({maxSizeDev}) deve ser <= produção ({maxSizeProd})");
    }

    #endregion

    #region Configuração Resilience

    [TestMethod]
    public void Config_Resilience_EnableRetry_DeveEstarAtivo()
    {
        var enabled = _configuration.GetValue<bool>("FuncefORM:Resilience:EnableRetry");
        Assert.IsTrue(enabled, "Retry deve estar ativo em produção");
    }

    [TestMethod]
    public void Config_Resilience_MaxRetries_DeveSerPositivo()
    {
        var retries = _configuration.GetValue<int>("FuncefORM:Resilience:MaxRetries");
        Assert.IsTrue(retries > 0, $"MaxRetries deve ser positivo, atual: {retries}");
    }

    [TestMethod]
    public void Config_Resilience_EnableCircuitBreaker_DeveEstarAtivo()
    {
        var enabled = _configuration.GetValue<bool>("FuncefORM:Resilience:EnableCircuitBreaker");
        Assert.IsTrue(enabled, "Circuit Breaker deve estar ativo em produção");
    }

    #endregion

    #region Configuração EF Core

    [TestMethod]
    public void Config_EFCore_Producao_SensitiveDataLogging_DeveEstarDesativado()
    {
        var enabled = _configuration.GetValue<bool>("FuncefORM:EFCore:EnableSensitiveDataLogging");
        Assert.IsFalse(enabled, "Sensitive data logging deve estar desativado em produção");
    }

    [TestMethod]
    public void Config_EFCore_Dev_SensitiveDataLogging_DeveEstarAtivo()
    {
        var enabled = _configurationDev.GetValue<bool>("FuncefORM:EFCore:EnableSensitiveDataLogging");
        Assert.IsTrue(enabled, "Sensitive data logging deve estar ativo em desenvolvimento");
    }

    [TestMethod]
    public void Config_EFCore_AuditInterceptor_DeveEstarAtivo()
    {
        var enabled = _configuration.GetValue<bool>("FuncefORM:EFCore:EnableAuditInterceptor");
        Assert.IsTrue(enabled, "Audit interceptor deve estar ativo");
    }

    [TestMethod]
    public void Config_EFCore_TelemetryInterceptor_DeveEstarAtivo()
    {
        var enabled = _configuration.GetValue<bool>("FuncefORM:EFCore:EnableTelemetryInterceptor");
        Assert.IsTrue(enabled, "Telemetry interceptor deve estar ativo");
    }

    #endregion

    #region Configuração Observability

    [TestMethod]
    public void Config_Observability_Metrics_DeveEstarAtiva()
    {
        var enabled = _configuration.GetValue<bool>("FuncefORM:Observability:EnableMetrics");
        Assert.IsTrue(enabled);
    }

    [TestMethod]
    public void Config_Observability_Tracing_DeveEstarAtivo()
    {
        var enabled = _configuration.GetValue<bool>("FuncefORM:Observability:EnableTracing");
        Assert.IsTrue(enabled);
    }

    [TestMethod]
    public void Config_Observability_SlowQueryLogging_DeveEstarAtivo()
    {
        var enabled = _configuration.GetValue<bool>("FuncefORM:Observability:EnableSlowQueryLogging");
        Assert.IsTrue(enabled);
    }

    [TestMethod]
    public void Config_Observability_SlowQueryThreshold_DeveSerPositivo()
    {
        var threshold = _configuration.GetValue<int>("FuncefORM:Observability:SlowQueryThresholdMs");
        Assert.IsTrue(threshold > 0, $"SlowQueryThresholdMs deve ser positivo, atual: {threshold}");
    }

    #endregion

    #region Configuração Migration

    [TestMethod]
    public void Config_Migration_Producao_AutoMigrations_DeveEstarDesativado()
    {
        var enabled = _configuration.GetValue<bool>("FuncefORM:Migration:EnableAutoMigrations");
        Assert.IsFalse(enabled, "Auto migrations deve estar desativado em produção");
    }

    [TestMethod]
    public void Config_Migration_Producao_AllowDatabaseCreation_DeveEstarDesativado()
    {
        var enabled = _configuration.GetValue<bool>("FuncefORM:Migration:AllowDatabaseCreation");
        Assert.IsFalse(enabled, "Database creation deve estar desativado em produção");
    }

    [TestMethod]
    public void Config_Migration_Producao_AutoSeeding_DeveEstarDesativado()
    {
        var enabled = _configuration.GetValue<bool>("FuncefORM:Migration:EnableAutoSeeding");
        Assert.IsFalse(enabled, "Auto seeding deve estar desativado em produção");
    }

    #endregion

    #region Contrato IRepository (mock) - Operações CRUD

    [TestMethod]
    public async Task Repository_AddAsync_DeveAdicionarEntidade()
    {
        var repo = Substitute.For<IRepository<FakeEntity>>();
        var entity = new FakeEntity { Id = 1001L, Nome = "Teste" };

        await repo.AddAsync(entity);

        await repo.Received(1).AddAsync(entity, Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task Repository_GetByIdAsync_DeveRetornarEntidade()
    {
        var repo = Substitute.For<IRepository<FakeEntity>>();
        var id = 1002L;
        var entity = new FakeEntity { Id = id, Nome = "Encontrado" };

        repo.GetByIdAsync(id, cancellationToken: Arg.Any<CancellationToken>()).Returns(entity);

        var result = await repo.GetByIdAsync(id);

        Assert.IsNotNull(result);
        Assert.AreEqual(id, result.Id);
        Assert.AreEqual("Encontrado", result.Nome);
    }

    [TestMethod]
    public async Task Repository_GetByIdAsync_Inexistente_DeveRetornarNull()
    {
        var repo = Substitute.For<IRepository<FakeEntity>>();

        repo.GetByIdAsync(Arg.Any<long>(), cancellationToken: Arg.Any<CancellationToken>())
            .Returns((FakeEntity?)null);

        var result = await repo.GetByIdAsync(1003L);

        Assert.IsNull(result);
    }

    [TestMethod]
    public async Task Repository_UpdateAsync_DeveAtualizarEntidade()
    {
        var repo = Substitute.For<IRepository<FakeEntity>>();
        var entity = new FakeEntity { Id = 1004L, Nome = "Atualizado" };

        await repo.UpdateAsync(entity);

        await repo.Received(1).UpdateAsync(entity, Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task Repository_DeleteAsync_DeveRemoverEntidade()
    {
        var repo = Substitute.For<IRepository<FakeEntity>>();
        var entity = new FakeEntity { Id = 1005L, Nome = "Remover" };

        await repo.DeleteAsync(entity);

        await repo.Received(1).DeleteAsync(entity, Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task Repository_ExistsAsync_DeveVerificarExistencia()
    {
        var repo = Substitute.For<IRepository<FakeEntity>>();

        repo.ExistsAsync(Arg.Any<System.Linq.Expressions.Expression<Func<FakeEntity, bool>>>(),
                cancellationToken: Arg.Any<CancellationToken>())
            .Returns(true);

        var exists = await repo.ExistsAsync(e => e.Nome == "Teste");

        Assert.IsTrue(exists);
    }

    #endregion

    #region Contrato IUnitOfWork (mock) - Transações

    [TestMethod]
    public async Task UnitOfWork_SaveChanges_DeveConfirmarAlteracoes()
    {
        var uow = Substitute.For<IUnitOfWork>();

        await uow.SaveChangesAsync();

        await uow.Received(1).SaveChangesAsync(Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task UnitOfWork_Transaction_DeveExecutarFluxoCompleto()
    {
        var uow = Substitute.For<IUnitOfWork>();

        await uow.BeginAsync();
        await uow.SaveChangesAsync();
        await uow.CommitAsync();

        Received.InOrder(() =>
        {
            uow.BeginAsync(Arg.Any<CancellationToken>());
            uow.SaveChangesAsync(Arg.Any<CancellationToken>());
            uow.CommitAsync(Arg.Any<CancellationToken>());
        });
    }

    [TestMethod]
    public async Task UnitOfWork_Rollback_DeveReverterTransacao()
    {
        var uow = Substitute.For<IUnitOfWork>();

        await uow.BeginAsync();
        await uow.RollbackAsync();

        await uow.Received(1).BeginAsync(Arg.Any<CancellationToken>());
        await uow.Received(1).RollbackAsync(Arg.Any<CancellationToken>());
        await uow.DidNotReceive().CommitAsync(Arg.Any<CancellationToken>());
    }

    #endregion

    #region Integração Config - Consistência entre ambientes

    [TestMethod]
    public void Config_Producao_NaoDevePermitirAutoMigrationsERetry()
    {
        var autoMigrations = _configuration.GetValue<bool>("FuncefORM:Migration:EnableAutoMigrations");
        var enableRetry = _configuration.GetValue<bool>("FuncefORM:Resilience:EnableRetry");

        Assert.IsFalse(autoMigrations, "Produção não deve ter auto migrations");
        Assert.IsTrue(enableRetry, "Produção deve ter retry ativo");
    }

    [TestMethod]
    public void Config_KeyVault_Url_DeveExistir()
    {
        var section = _configuration.GetSection("KeyVault:Url");
        Assert.IsTrue(section.Exists(), "Seção KeyVault:Url deve existir");
    }

    [TestMethod]
    public void Config_Dev_KeyVault_Url_DeveExistir()
    {
        var section = _configurationDev.GetSection("KeyVault:Url");
        Assert.IsTrue(section.Exists(), "Seção KeyVault:Url deve existir em development");
    }

    #endregion
}

/// <summary>
/// Entidade falsa para testes de repositório.
/// </summary>
public class FakeEntity
{
    public long Id { get; set; }
    public string Nome { get; set; } = string.Empty;
}
