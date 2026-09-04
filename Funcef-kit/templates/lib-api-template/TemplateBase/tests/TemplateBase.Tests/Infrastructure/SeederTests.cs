// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using Microsoft.EntityFrameworkCore;
using TemplateBase.Domain.Entities;
using TemplateBase.Infrastructure.Persistence.Context;
using TemplateBase.Infrastructure.Persistence.Seeders;

namespace TemplateBase.Tests.Infrastructure;

#region ClienteSeeder

[TestClass]
public class ClienteSeederTests
{
    private ClienteSeeder _seeder = null!;

    [TestInitialize]
    public void Setup() => _seeder = new ClienteSeeder();

    [TestMethod]
    public void Order_DeveSerUm()
    {
        Assert.AreEqual(1, _seeder.Order);
    }

    [TestMethod]
    public void GetSeedData_DeveRetornarDoisClientes()
    {
        var data = _seeder.GetSeedData().ToList();

        Assert.AreEqual(2, data.Count);
    }

    [TestMethod]
    public void GetSeedData_PrimeiroCliente_DeveEstarCorreto()
    {
        var clientes = _seeder.GetSeedData().ToList();
        var primeiro = clientes[0];

        // A PK CLIENTE_ID é identity (gerada pelo banco); no seed data ela permanece default (0).
        Assert.AreEqual(0L, primeiro.Id);
        Assert.AreEqual("Cliente Exemplo", primeiro.Nome);
        Assert.AreEqual("cliente@exemplo.com.br", primeiro.Email);
    }

    [TestMethod]
    public void GetSeedData_SegundoCliente_DeveEstarCorreto()
    {
        var clientes = _seeder.GetSeedData().ToList();
        var segundo = clientes[1];

        Assert.AreEqual(0L, segundo.Id);
        Assert.AreEqual("Empresa Teste LTDA", segundo.Nome);
        Assert.AreEqual("contato@empresateste.com.br", segundo.Email);
    }

    [TestMethod]
    public void GetSeedData_Ids_NaoDevemSerDefinidos_GeradosPeloBanco()
    {
        // Sob coluna identity, o Id NÃO é definido no seed data — o banco o gera na inserção.
        var clientes = _seeder.GetSeedData().ToList();

        foreach (var cliente in clientes)
        {
            Assert.AreEqual(0L, cliente.Id, "Id deve permanecer default; é gerado pelo banco (identity)");
        }
    }

    [TestMethod]
    public void GetSeedData_DeveGerarEmailsUnicos()
    {
        var clientes = _seeder.GetSeedData().ToList();

        Assert.AreNotEqual(clientes[0].Email, clientes[1].Email);
    }

    [TestMethod]
    public void GetSeedData_DataCriacao_DeveSerPreenchida()
    {
        var clientes = _seeder.GetSeedData().ToList();

        foreach (var cliente in clientes)
        {
            Assert.AreNotEqual(default(DateTime), cliente.DataCriacao);
        }
    }

    [TestMethod]
    public void GetSeedData_Nomes_NaoDevemSerVazios()
    {
        var clientes = _seeder.GetSeedData().ToList();

        foreach (var cliente in clientes)
        {
            Assert.IsFalse(string.IsNullOrWhiteSpace(cliente.Nome),
                $"Nome do cliente '{cliente.Email}' não deve ser vazio");
        }
    }

    [TestMethod]
    public void GetSeedData_Emails_NaoDevemSerVazios()
    {
        var clientes = _seeder.GetSeedData().ToList();

        foreach (var cliente in clientes)
        {
            Assert.IsFalse(string.IsNullOrWhiteSpace(cliente.Email),
                "Email do cliente não deve ser vazio");
        }
    }

    [TestMethod]
    public void GetSeedData_Emails_DevemConterArroba()
    {
        var clientes = _seeder.GetSeedData().ToList();

        foreach (var cliente in clientes)
        {
            Assert.IsTrue(cliente.Email!.Contains('@'),
                $"Email '{cliente.Email}' deve conter @");
        }
    }

    [TestMethod]
    public void GetSeedData_DeveSerDeterministico()
    {
        var emails1 = _seeder.GetSeedData().Select(c => c.Email).ToList();
        var emails2 = _seeder.GetSeedData().Select(c => c.Email).ToList();

        CollectionAssert.AreEqual(emails1, emails2);
    }

    [TestMethod]
    public void GetSeedData_Nomes_DevemRespeitarMaxLength()
    {
        var clientes = _seeder.GetSeedData().ToList();

        foreach (var cliente in clientes)
        {
            Assert.IsTrue(cliente.Nome.Length <= 100,
                $"Nome '{cliente.Nome}' excede MaxLength de 100");
        }
    }

    [TestMethod]
    public void GetSeedData_Emails_DevemRespeitarMaxLength()
    {
        var clientes = _seeder.GetSeedData().ToList();

        foreach (var cliente in clientes)
        {
            Assert.IsTrue(cliente.Email!.Length <= 150,
                $"Email '{cliente.Email}' excede MaxLength de 150");
        }
    }

    [TestMethod]
    public void ClienteSeeder_DeveHerdarDeEntitySeederBase()
    {
        var baseType = typeof(ClienteSeeder).BaseType;

        Assert.IsNotNull(baseType);
        Assert.IsTrue(baseType.IsGenericType);
        Assert.AreEqual(typeof(Cliente), baseType.GetGenericArguments()[0]);
    }

    [TestMethod]
    public void GetSeedData_Ordens_DevemSerColecaoVazia()
    {
        var clientes = _seeder.GetSeedData().ToList();

        foreach (var cliente in clientes)
        {
            Assert.IsNotNull(cliente.Ordens);
            Assert.AreEqual(0, cliente.Ordens.Count);
        }
    }
}

#endregion

#region OrdemSeeder

[TestClass]
public class OrdemSeederTests
{
    private OrdemSeeder _seeder = null!;

    [TestInitialize]
    public void Setup() => _seeder = new OrdemSeeder();

    private static AppDbContext CreateContext(string dbName) =>
        new(new DbContextOptionsBuilder<AppDbContext>().UseInMemoryDatabase(dbName).Options);

    /// <summary>
    /// Cria um contexto InMemory com os dois clientes do ClienteSeeder já persistidos.
    /// Os Ids são gerados pelo provedor (identity), reproduzindo o cenário real de FK sob identity.
    /// </summary>
    private static async Task<AppDbContext> CreateContextComClientesAsync(string dbName)
    {
        var context = CreateContext(dbName);
        context.Clientes.AddRange(
            new Cliente { Nome = "Cliente Exemplo", Email = "cliente@exemplo.com.br", DataCriacao = DateTime.UtcNow },
            new Cliente { Nome = "Empresa Teste LTDA", Email = "contato@empresateste.com.br", DataCriacao = DateTime.UtcNow });
        await context.SaveChangesAsync();
        return context;
    }

    [TestMethod]
    public void Order_DeveSerDois()
    {
        Assert.AreEqual(2, _seeder.Order);
    }

    [TestMethod]
    public void Order_DeveSerMaiorQueClienteSeeder()
    {
        var clienteSeeder = new ClienteSeeder();

        Assert.IsTrue(_seeder.Order > clienteSeeder.Order,
            "OrdemSeeder deve executar após ClienteSeeder");
    }

    [TestMethod]
    public void OrdemSeeder_DeveHerdarDeEntitySeederBase()
    {
        var baseType = typeof(OrdemSeeder).BaseType;

        Assert.IsNotNull(baseType);
        Assert.IsTrue(baseType.IsGenericType);
        Assert.AreEqual(typeof(Ordem), baseType.GetGenericArguments()[0]);
    }

    [TestMethod]
    public void GetSeedData_DeveSerVazio_LogicaFicaNoSeedAsync()
    {
        // A FK CLIENTE_ID é resolvida em SeedAsync (via e-mail) porque o Id do pai só
        // existe após a inserção sob identity; por isso GetSeedData não retorna dados.
        Assert.AreEqual(0, _seeder.GetSeedData().Count());
    }

    [TestMethod]
    public async Task SeedAsync_DeveInserirTresOrdens()
    {
        using var context = await CreateContextComClientesAsync(nameof(SeedAsync_DeveInserirTresOrdens));

        await _seeder.SeedAsync(context, CancellationToken.None);

        Assert.AreEqual(3, await context.Ordens.CountAsync());
    }

    [TestMethod]
    public async Task SeedAsync_DeveVincularOrdensAClientesExistentes()
    {
        using var context = await CreateContextComClientesAsync(nameof(SeedAsync_DeveVincularOrdensAClientesExistentes));
        var clienteIds = await context.Clientes.Select(c => c.Id).ToListAsync();

        await _seeder.SeedAsync(context, CancellationToken.None);

        var ordens = await context.Ordens.ToListAsync();
        foreach (var ordem in ordens)
        {
            Assert.IsTrue(ordem.ClienteId > 0, "FK deve apontar para um Id de cliente gerado pelo banco");
            Assert.IsTrue(clienteIds.Contains(ordem.ClienteId),
                $"Ordem {ordem.Id} referencia ClienteId {ordem.ClienteId} inexistente");
        }
    }

    [TestMethod]
    public async Task SeedAsync_ClienteExemplo_DeveTerDuasOrdens_EmpresaUma()
    {
        using var context = await CreateContextComClientesAsync(nameof(SeedAsync_ClienteExemplo_DeveTerDuasOrdens_EmpresaUma));

        await _seeder.SeedAsync(context, CancellationToken.None);

        var exemploId = (await context.Clientes.FirstAsync(c => c.Email == "cliente@exemplo.com.br")).Id;
        var empresaId = (await context.Clientes.FirstAsync(c => c.Email == "contato@empresateste.com.br")).Id;

        Assert.AreEqual(2, await context.Ordens.CountAsync(o => o.ClienteId == exemploId));
        Assert.AreEqual(1, await context.Ordens.CountAsync(o => o.ClienteId == empresaId));
    }

    [TestMethod]
    public async Task SeedAsync_DeveConterStatusDiversos()
    {
        using var context = await CreateContextComClientesAsync(nameof(SeedAsync_DeveConterStatusDiversos));

        await _seeder.SeedAsync(context, CancellationToken.None);

        var statuses = await context.Ordens.Select(o => o.Status).Distinct().ToListAsync();
        Assert.IsTrue(statuses.Count >= 2, "Deve conter pelo menos 2 status diferentes");
        CollectionAssert.Contains(statuses, "Pendente");
    }

    [TestMethod]
    public async Task SeedAsync_ValoresDevemRespeitarRange()
    {
        using var context = await CreateContextComClientesAsync(nameof(SeedAsync_ValoresDevemRespeitarRange));

        await _seeder.SeedAsync(context, CancellationToken.None);

        foreach (var ordem in await context.Ordens.ToListAsync())
        {
            Assert.IsTrue(ordem.Valor >= 0.01m, $"Valor {ordem.Valor} deve ser >= 0.01");
            Assert.IsTrue(ordem.Valor <= 99999999.99m, $"Valor {ordem.Valor} deve ser <= 99999999.99");
        }
    }

    [TestMethod]
    public async Task SeedAsync_DadosDasOrdens_DevemEstarCorretos()
    {
        using var context = await CreateContextComClientesAsync(nameof(SeedAsync_DadosDasOrdens_DevemEstarCorretos));

        await _seeder.SeedAsync(context, CancellationToken.None);

        var pendente = await context.Ordens.SingleAsync(o => o.Status == "Pendente");
        Assert.AreEqual(150.00m, pendente.Valor);
        Assert.AreEqual("Primeira ordem de exemplo", pendente.Observacoes);

        var corporativa = await context.Ordens.SingleAsync(o => o.Status == "Processando");
        Assert.AreEqual(1500.00m, corporativa.Valor);
        Assert.AreEqual("Ordem corporativa", corporativa.Observacoes);
    }

    [TestMethod]
    public async Task SeedAsync_ExecutadoDuasVezes_NaoDeveDuplicar()
    {
        using var context = await CreateContextComClientesAsync(nameof(SeedAsync_ExecutadoDuasVezes_NaoDeveDuplicar));

        await _seeder.SeedAsync(context, CancellationToken.None);
        await _seeder.SeedAsync(context, CancellationToken.None);

        Assert.AreEqual(3, await context.Ordens.CountAsync(), "Seed deve ser idempotente");
    }
}

#endregion
