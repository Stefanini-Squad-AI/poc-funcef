// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using System.Reflection;
using Microsoft.EntityFrameworkCore;
using TemplateBase.Domain.Entities;
using TemplateBase.Infrastructure.Persistence.Context;

namespace TemplateBase.Tests.Infrastructure;

/// <summary>
/// Testes unitários para o AppDbContext.
/// Validam a configuração do modelo, DbSets e regras de Fluent API.
/// </summary>
[TestClass]
public class AppDbContextTests
{
    private static DbContextOptions<AppDbContext> CreateOptions(string dbName)
    {
        return new DbContextOptionsBuilder<AppDbContext>()
            .UseInMemoryDatabase(dbName)
            .Options;
    }

    #region Construtor e DbSets

    [TestMethod]
    public void Constructor_DeveCriarContexto_ComSucesso()
    {
        // Arrange & Act
        using var context = new AppDbContext(CreateOptions(nameof(Constructor_DeveCriarContexto_ComSucesso)));

        // Assert
        Assert.IsNotNull(context);
    }

    [TestMethod]
    public void DbSet_Clientes_DeveExistir()
    {
        // Arrange & Act
        using var context = new AppDbContext(CreateOptions(nameof(DbSet_Clientes_DeveExistir)));

        // Assert
        Assert.IsNotNull(context.Clientes);
    }

    [TestMethod]
    public void DbSet_Ordens_DeveExistir()
    {
        // Arrange & Act
        using var context = new AppDbContext(CreateOptions(nameof(DbSet_Ordens_DeveExistir)));

        // Assert
        Assert.IsNotNull(context.Ordens);
    }

    #endregion

    #region Modelo - Entidades

    [TestMethod]
    public void Model_DeveConterEntidadeCliente()
    {
        // Arrange
        using var context = new AppDbContext(CreateOptions(nameof(Model_DeveConterEntidadeCliente)));

        // Act
        var entityType = context.Model.FindEntityType(typeof(Cliente));

        // Assert
        Assert.IsNotNull(entityType, "O modelo deve conter a entidade Cliente");
    }

    [TestMethod]
    public void Model_DeveConterEntidadeOrdem()
    {
        // Arrange
        using var context = new AppDbContext(CreateOptions(nameof(Model_DeveConterEntidadeOrdem)));

        // Act
        var entityType = context.Model.FindEntityType(typeof(Ordem));

        // Assert
        Assert.IsNotNull(entityType, "O modelo deve conter a entidade Ordem");
    }

    #endregion

    #region Modelo - Propriedades do Cliente

    [TestMethod]
    public void Model_Cliente_DeveConterPropriedadeId()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Cliente_DeveConterPropriedadeId)));
        var entityType = context.Model.FindEntityType(typeof(Cliente))!;

        var prop = entityType.FindProperty(nameof(Cliente.Id));

        Assert.IsNotNull(prop);
    }

    [TestMethod]
    public void Model_Cliente_DeveConterPropriedadeNome()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Cliente_DeveConterPropriedadeNome)));
        var entityType = context.Model.FindEntityType(typeof(Cliente))!;

        var prop = entityType.FindProperty(nameof(Cliente.Nome));

        Assert.IsNotNull(prop);
        Assert.AreEqual(100, prop.GetMaxLength());
    }

    [TestMethod]
    public void Model_Cliente_DeveConterPropriedadeEmail()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Cliente_DeveConterPropriedadeEmail)));
        var entityType = context.Model.FindEntityType(typeof(Cliente))!;

        var prop = entityType.FindProperty(nameof(Cliente.Email));

        Assert.IsNotNull(prop);
        Assert.IsTrue(prop.IsNullable);
        Assert.AreEqual(150, prop.GetMaxLength());
    }

    [TestMethod]
    public void Model_Cliente_DeveConterPropriedadeDataCriacao()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Cliente_DeveConterPropriedadeDataCriacao)));
        var entityType = context.Model.FindEntityType(typeof(Cliente))!;

        var prop = entityType.FindProperty(nameof(Cliente.DataCriacao));

        Assert.IsNotNull(prop);
        Assert.IsFalse(prop.IsNullable);
    }

    [TestMethod]
    public void Model_Cliente_ChavePrimaria_DeveSerIdLong()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Cliente_ChavePrimaria_DeveSerIdLong)));
        var entityType = context.Model.FindEntityType(typeof(Cliente))!;

        var pk = entityType.FindPrimaryKey();

        Assert.IsNotNull(pk);
        Assert.AreEqual(1, pk.Properties.Count);
        Assert.AreEqual(nameof(Cliente.Id), pk.Properties[0].Name);
    }

    #endregion

    #region Modelo - Propriedades da Ordem

    [TestMethod]
    public void Model_Ordem_DeveConterPropriedadeClienteId()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Ordem_DeveConterPropriedadeClienteId)));
        var entityType = context.Model.FindEntityType(typeof(Ordem))!;

        var prop = entityType.FindProperty(nameof(Ordem.ClienteId));

        Assert.IsNotNull(prop);
        Assert.IsFalse(prop.IsNullable);
    }

    [TestMethod]
    public void Model_Ordem_DeveConterPropriedadeValor()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Ordem_DeveConterPropriedadeValor)));
        var entityType = context.Model.FindEntityType(typeof(Ordem))!;

        var prop = entityType.FindProperty(nameof(Ordem.Valor));

        Assert.IsNotNull(prop);
        Assert.IsFalse(prop.IsNullable);
    }

    [TestMethod]
    public void Model_Ordem_DeveConterPropriedadeStatus()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Ordem_DeveConterPropriedadeStatus)));
        var entityType = context.Model.FindEntityType(typeof(Ordem))!;

        var prop = entityType.FindProperty(nameof(Ordem.Status));

        Assert.IsNotNull(prop);
        Assert.AreEqual(20, prop.GetMaxLength());
    }

    [TestMethod]
    public void Model_Ordem_DeveConterPropriedadeObservacoes()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Ordem_DeveConterPropriedadeObservacoes)));
        var entityType = context.Model.FindEntityType(typeof(Ordem))!;

        var prop = entityType.FindProperty(nameof(Ordem.Observacoes));

        Assert.IsNotNull(prop);
        Assert.IsTrue(prop.IsNullable);
        Assert.AreEqual(500, prop.GetMaxLength());
    }

    [TestMethod]
    public void Model_Ordem_DeveConterPropriedadeDataPedido()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Ordem_DeveConterPropriedadeDataPedido)));
        var entityType = context.Model.FindEntityType(typeof(Ordem))!;

        var prop = entityType.FindProperty(nameof(Ordem.DataPedido));

        Assert.IsNotNull(prop);
        Assert.IsFalse(prop.IsNullable);
    }

    [TestMethod]
    public void Model_Ordem_ChavePrimaria_DeveSerIdLong()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Ordem_ChavePrimaria_DeveSerIdLong)));
        var entityType = context.Model.FindEntityType(typeof(Ordem))!;

        var pk = entityType.FindPrimaryKey();

        Assert.IsNotNull(pk);
        Assert.AreEqual(1, pk.Properties.Count);
        Assert.AreEqual(nameof(Ordem.Id), pk.Properties[0].Name);
    }

    #endregion

    #region Modelo - Relacionamentos

    [TestMethod]
    public void Model_Ordem_DeveTerRelacionamento_ComCliente()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Ordem_DeveTerRelacionamento_ComCliente)));
        var entityType = context.Model.FindEntityType(typeof(Ordem))!;

        var fk = entityType.GetForeignKeys().FirstOrDefault(f =>
            f.PrincipalEntityType.ClrType == typeof(Cliente));

        Assert.IsNotNull(fk, "Ordem deve ter FK para Cliente");
    }

    [TestMethod]
    public void Model_Ordem_FK_DeveSerRestrict()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Ordem_FK_DeveSerRestrict)));
        var entityType = context.Model.FindEntityType(typeof(Ordem))!;

        var fk = entityType.GetForeignKeys().FirstOrDefault(f =>
            f.PrincipalEntityType.ClrType == typeof(Cliente));

        Assert.IsNotNull(fk);
        Assert.AreEqual(DeleteBehavior.Restrict, fk.DeleteBehavior);
    }

    [TestMethod]
    public void Model_Ordem_FK_DeveReferenciarClienteId()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Ordem_FK_DeveReferenciarClienteId)));
        var entityType = context.Model.FindEntityType(typeof(Ordem))!;

        var fk = entityType.GetForeignKeys().FirstOrDefault(f =>
            f.PrincipalEntityType.ClrType == typeof(Cliente));

        Assert.IsNotNull(fk);
        Assert.AreEqual(1, fk.Properties.Count);
        Assert.AreEqual(nameof(Ordem.ClienteId), fk.Properties[0].Name);
    }

    [TestMethod]
    public void Model_Cliente_DeveTerNavegacao_Ordens()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Cliente_DeveTerNavegacao_Ordens)));
        var entityType = context.Model.FindEntityType(typeof(Cliente))!;

        var nav = entityType.FindNavigation(nameof(Cliente.Ordens));

        Assert.IsNotNull(nav, "Cliente deve ter navegação para Ordens");
        Assert.IsTrue(nav.IsCollection);
    }

    [TestMethod]
    public void Model_Ordem_DeveTerNavegacao_Cliente()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Ordem_DeveTerNavegacao_Cliente)));
        var entityType = context.Model.FindEntityType(typeof(Ordem))!;

        var nav = entityType.FindNavigation(nameof(Ordem.Cliente));

        Assert.IsNotNull(nav, "Ordem deve ter navegação para Cliente");
        Assert.IsFalse(nav.IsCollection);
    }

    #endregion

    #region Modelo - Índices

    [TestMethod]
    public void Model_Cliente_DeveConterIndice_NoEmail()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Cliente_DeveConterIndice_NoEmail)));
        var entityType = context.Model.FindEntityType(typeof(Cliente))!;

        var emailProp = entityType.FindProperty(nameof(Cliente.Email))!;
        var indices = entityType.GetIndexes()
            .Where(i => i.Properties.Any(p => p.Name == nameof(Cliente.Email)))
            .ToList();

        Assert.IsTrue(indices.Count > 0, "Deve existir pelo menos um índice na propriedade Email");
        Assert.IsTrue(indices.Any(i => i.IsUnique), "O índice no Email deve ser único");
    }

    [TestMethod]
    public void Model_Ordem_DeveConterIndice_NoClienteId()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Ordem_DeveConterIndice_NoClienteId)));
        var entityType = context.Model.FindEntityType(typeof(Ordem))!;

        var indices = entityType.GetIndexes()
            .Where(i => i.Properties.Any(p => p.Name == nameof(Ordem.ClienteId)))
            .ToList();

        Assert.IsTrue(indices.Count > 0, "Deve existir índice na propriedade ClienteId");
    }

    [TestMethod]
    public void Model_Ordem_DeveConterIndice_NoStatus()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Ordem_DeveConterIndice_NoStatus)));
        var entityType = context.Model.FindEntityType(typeof(Ordem))!;

        var indices = entityType.GetIndexes()
            .Where(i => i.Properties.Any(p => p.Name == nameof(Ordem.Status)))
            .ToList();

        Assert.IsTrue(indices.Count > 0, "Deve existir índice na propriedade Status");
    }

    [TestMethod]
    public void Model_Ordem_DeveConterIndice_NoDataPedido()
    {
        using var context = new AppDbContext(CreateOptions(nameof(Model_Ordem_DeveConterIndice_NoDataPedido)));
        var entityType = context.Model.FindEntityType(typeof(Ordem))!;

        var indices = entityType.GetIndexes()
            .Where(i => i.Properties.Any(p => p.Name == nameof(Ordem.DataPedido)))
            .ToList();

        Assert.IsTrue(indices.Count > 0, "Deve existir índice na propriedade DataPedido");
    }

    #endregion

    #region Operações CRUD InMemory

    [TestMethod]
    public async Task DeveAdicionarCliente_EConsultar()
    {
        // Arrange
        var options = CreateOptions(nameof(DeveAdicionarCliente_EConsultar));
        var clienteId = 1001L;

        // Act
        using (var context = new AppDbContext(options))
        {
            context.Clientes.Add(new Cliente
            {
                Id = clienteId,
                Nome = "Teste CRUD",
                Email = "crud@teste.com",
                DataCriacao = DateTime.UtcNow
            });
            await context.SaveChangesAsync();
        }

        // Assert
        using (var context = new AppDbContext(options))
        {
            var cliente = await context.Clientes.FindAsync(clienteId);
            Assert.IsNotNull(cliente);
            Assert.AreEqual("Teste CRUD", cliente.Nome);
            Assert.AreEqual("crud@teste.com", cliente.Email);
        }
    }

    [TestMethod]
    public async Task DeveAdicionarOrdem_ComCliente()
    {
        // Arrange
        var options = CreateOptions(nameof(DeveAdicionarOrdem_ComCliente));
        var clienteId = 1002L;
        var ordemId = 1003L;

        // Act
        using (var context = new AppDbContext(options))
        {
            context.Clientes.Add(new Cliente
            {
                Id = clienteId,
                Nome = "Cliente Ordem",
                DataCriacao = DateTime.UtcNow
            });
            context.Ordens.Add(new Ordem
            {
                Id = ordemId,
                ClienteId = clienteId,
                Valor = 250m,
                Status = "Pendente",
                DataPedido = DateTime.UtcNow
            });
            await context.SaveChangesAsync();
        }

        // Assert
        using (var context = new AppDbContext(options))
        {
            var ordem = await context.Ordens.FindAsync(ordemId);
            Assert.IsNotNull(ordem);
            Assert.AreEqual(clienteId, ordem.ClienteId);
            Assert.AreEqual(250m, ordem.Valor);
        }
    }

    [TestMethod]
    public async Task DeveAtualizarCliente()
    {
        // Arrange
        var options = CreateOptions(nameof(DeveAtualizarCliente));
        var clienteId = 1004L;

        using (var context = new AppDbContext(options))
        {
            context.Clientes.Add(new Cliente
            {
                Id = clienteId,
                Nome = "Antes",
                DataCriacao = DateTime.UtcNow
            });
            await context.SaveChangesAsync();
        }

        // Act
        using (var context = new AppDbContext(options))
        {
            var cliente = await context.Clientes.FindAsync(clienteId);
            cliente!.Nome = "Depois";
            await context.SaveChangesAsync();
        }

        // Assert
        using (var context = new AppDbContext(options))
        {
            var cliente = await context.Clientes.FindAsync(clienteId);
            Assert.AreEqual("Depois", cliente!.Nome);
        }
    }

    [TestMethod]
    public async Task DeveRemoverCliente()
    {
        // Arrange
        var options = CreateOptions(nameof(DeveRemoverCliente));
        var clienteId = 1005L;

        using (var context = new AppDbContext(options))
        {
            context.Clientes.Add(new Cliente
            {
                Id = clienteId,
                Nome = "Para Remover",
                DataCriacao = DateTime.UtcNow
            });
            await context.SaveChangesAsync();
        }

        // Act
        using (var context = new AppDbContext(options))
        {
            var cliente = await context.Clientes.FindAsync(clienteId);
            context.Clientes.Remove(cliente!);
            await context.SaveChangesAsync();
        }

        // Assert
        using (var context = new AppDbContext(options))
        {
            var cliente = await context.Clientes.FindAsync(clienteId);
            Assert.IsNull(cliente);
        }
    }

    [TestMethod]
    public async Task DeveConsultarOrdensPorCliente()
    {
        // Arrange
        var options = CreateOptions(nameof(DeveConsultarOrdensPorCliente));
        var clienteId = 1006L;

        using (var context = new AppDbContext(options))
        {
            context.Clientes.Add(new Cliente
            {
                Id = clienteId,
                Nome = "Multi Ordens",
                DataCriacao = DateTime.UtcNow
            });
            context.Ordens.AddRange(
                new Ordem { Id = 1007L, ClienteId = clienteId, Valor = 100m, DataPedido = DateTime.UtcNow },
                new Ordem { Id = 1008L, ClienteId = clienteId, Valor = 200m, DataPedido = DateTime.UtcNow },
                new Ordem { Id = 1009L, ClienteId = clienteId, Valor = 300m, DataPedido = DateTime.UtcNow }
            );
            await context.SaveChangesAsync();
        }

        // Assert
        using (var context = new AppDbContext(options))
        {
            var ordens = await context.Ordens
                .Where(o => o.ClienteId == clienteId)
                .ToListAsync();
            Assert.AreEqual(3, ordens.Count);
        }
    }

    #endregion

    #region Reflexão - Verificação da Classe

    [TestMethod]
    public void AppDbContext_DeveHerdarDeBaseDbContext()
    {
        var baseType = typeof(AppDbContext).BaseType;

        Assert.IsNotNull(baseType);
        Assert.AreEqual("BaseDbContext", baseType.Name);
    }

    [TestMethod]
    public void AppDbContext_DeveConterDbSetClientes()
    {
        var prop = typeof(AppDbContext).GetProperty("Clientes");

        Assert.IsNotNull(prop);
        Assert.AreEqual(typeof(DbSet<Cliente>), prop.PropertyType);
    }

    [TestMethod]
    public void AppDbContext_DeveConterDbSetOrdens()
    {
        var prop = typeof(AppDbContext).GetProperty("Ordens");

        Assert.IsNotNull(prop);
        Assert.AreEqual(typeof(DbSet<Ordem>), prop.PropertyType);
    }

    [TestMethod]
    public void AppDbContext_Constructor_DeveAceitarDbContextOptions()
    {
        var constructors = typeof(AppDbContext).GetConstructors();

        Assert.AreEqual(1, constructors.Length);

        var parameters = constructors[0].GetParameters();
        Assert.AreEqual(1, parameters.Length);
        Assert.AreEqual(typeof(DbContextOptions<AppDbContext>), parameters[0].ParameterType);
    }

    [TestMethod]
    public void AppDbContext_OnModelCreating_DeveSerProtectedOverride()
    {
        var method = typeof(AppDbContext).GetMethod(
            "OnModelCreating",
            BindingFlags.NonPublic | BindingFlags.Instance);

        Assert.IsNotNull(method);
        Assert.IsTrue(method.IsFamily);
        Assert.IsTrue(method.IsVirtual);
    }

    #endregion
}
