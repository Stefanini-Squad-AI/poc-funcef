using TemplateBase.Domain.Entities;

namespace TemplateBase.Tests.Domain;

/// <summary>
/// Testes unitários para a entidade Cliente.
/// </summary>
[TestClass]
public class ClienteTests
{
    #region Valores Padrão

    [TestMethod]
    public void Cliente_DeveCriar_ComValoresPadrao()
    {
        // Arrange & Act
        var cliente = new Cliente();

        // Assert
        Assert.AreEqual(0L, cliente.Id);
        Assert.AreEqual(string.Empty, cliente.Nome);
        Assert.IsNull(cliente.Email);
        Assert.IsNotNull(cliente.Ordens);
        Assert.IsFalse(cliente.Ordens.Any());
    }

    [TestMethod]
    public void Cliente_DataCriacao_Padrao_DeveSerProximoDeUtcNow()
    {
        // Arrange
        var antes = DateTime.UtcNow;

        // Act
        var cliente = new Cliente();
        var depois = DateTime.UtcNow;

        // Assert
        Assert.IsTrue(cliente.DataCriacao >= antes.AddSeconds(-1));
        Assert.IsTrue(cliente.DataCriacao <= depois.AddSeconds(1));
    }

    [TestMethod]
    public void Cliente_Id_DevePadrao_SerZero()
    {
        // Arrange & Act
        var cliente = new Cliente();

        // Assert
        Assert.AreEqual(0L, cliente.Id);
    }

    [TestMethod]
    public void Cliente_Nome_DevePadrao_SerStringEmpty()
    {
        // Arrange & Act
        var cliente = new Cliente();

        // Assert
        Assert.AreEqual(string.Empty, cliente.Nome);
    }

    #endregion

    #region Atribuição de Propriedades

    [TestMethod]
    public void Cliente_DeveAtribuirPropriedades_Corretamente()
    {
        // Arrange
        var id = 1001L;
        var nome = "João Silva";
        var email = "joao@email.com";
        var dataCriacao = DateTime.UtcNow;

        // Act
        var cliente = new Cliente
        {
            Id = id,
            Nome = nome,
            Email = email,
            DataCriacao = dataCriacao
        };

        // Assert
        Assert.AreEqual(id, cliente.Id);
        Assert.AreEqual(nome, cliente.Nome);
        Assert.AreEqual(email, cliente.Email);
        Assert.AreEqual(dataCriacao, cliente.DataCriacao);
    }

    [TestMethod]
    public void Cliente_DevePermitirEmail_Nulo()
    {
        // Arrange & Act
        var cliente = new Cliente
        {
            Id = 1002L,
            Nome = "Teste",
            Email = null
        };

        // Assert
        Assert.IsNull(cliente.Email);
    }

    [TestMethod]
    public void Cliente_Email_DeveAceitarStringVazia()
    {
        // Arrange & Act
        var cliente = new Cliente { Email = "" };

        // Assert
        Assert.AreEqual("", cliente.Email);
    }

    [TestMethod]
    public void Cliente_Email_DeveAceitarFormatoComplexo()
    {
        // Arrange & Act
        var cliente = new Cliente
        {
            Email = "email.valido+tag@subdominio.empresa.com.br"
        };

        // Assert
        Assert.AreEqual("email.valido+tag@subdominio.empresa.com.br", cliente.Email);
    }

    [TestMethod]
    public void Cliente_Nome_DeveAceitarTextoComMaxLength()
    {
        // Arrange
        var nomeLongo = new string('A', 100);

        // Act
        var cliente = new Cliente { Nome = nomeLongo };

        // Assert
        Assert.AreEqual(100, cliente.Nome.Length);
    }

    #endregion

    #region Modificação Pós-Criação

    [TestMethod]
    public void Cliente_DeveModificarId_AposCriacao()
    {
        // Arrange
        var cliente = new Cliente();
        var novoId = 1003L;

        // Act
        cliente.Id = novoId;

        // Assert
        Assert.AreEqual(novoId, cliente.Id);
    }

    [TestMethod]
    public void Cliente_DeveModificarNome_AposCriacao()
    {
        // Arrange
        var cliente = new Cliente { Nome = "Original" };

        // Act
        cliente.Nome = "Modificado";

        // Assert
        Assert.AreEqual("Modificado", cliente.Nome);
    }

    [TestMethod]
    public void Cliente_DeveModificarEmail_AposCriacao()
    {
        // Arrange
        var cliente = new Cliente { Email = "original@email.com" };

        // Act
        cliente.Email = "novo@email.com";

        // Assert
        Assert.AreEqual("novo@email.com", cliente.Email);
    }

    [TestMethod]
    public void Cliente_DeveModificarEmail_ParaNulo()
    {
        // Arrange
        var cliente = new Cliente { Email = "original@email.com" };

        // Act
        cliente.Email = null;

        // Assert
        Assert.IsNull(cliente.Email);
    }

    [TestMethod]
    public void Cliente_DeveModificarDataCriacao_AposCriacao()
    {
        // Arrange
        var cliente = new Cliente();
        var novaData = new DateTime(2020, 1, 1, 0, 0, 0, DateTimeKind.Utc);

        // Act
        cliente.DataCriacao = novaData;

        // Assert
        Assert.AreEqual(novaData, cliente.DataCriacao);
    }

    #endregion

    #region Coleção Ordens

    [TestMethod]
    public void Cliente_DeveInicializar_ColecaoOrdens()
    {
        // Arrange & Act
        var cliente = new Cliente();

        // Assert
        Assert.IsNotNull(cliente.Ordens);
        Assert.IsInstanceOfType(cliente.Ordens, typeof(ICollection<Ordem>));
    }

    [TestMethod]
    public void Cliente_DeveAdicionarOrdens_NaColecao()
    {
        // Arrange
        var cliente = new Cliente { Id = 1004L, Nome = "Teste" };
        var ordem1 = new Ordem { Id = 1005L, ClienteId = cliente.Id, Valor = 100m };
        var ordem2 = new Ordem { Id = 1006L, ClienteId = cliente.Id, Valor = 200m };

        // Act
        cliente.Ordens.Add(ordem1);
        cliente.Ordens.Add(ordem2);

        // Assert
        Assert.AreEqual(2, cliente.Ordens.Count);
    }

    [TestMethod]
    public void Cliente_DeveRemoverOrdem_DaColecao()
    {
        // Arrange
        var cliente = new Cliente { Id = 1007L, Nome = "Teste" };
        var ordem = new Ordem { Id = 1008L, ClienteId = cliente.Id, Valor = 100m };
        cliente.Ordens.Add(ordem);

        // Act
        cliente.Ordens.Remove(ordem);

        // Assert
        Assert.AreEqual(0, cliente.Ordens.Count);
    }

    [TestMethod]
    public void Cliente_DeveSubstituirColecaoOrdens()
    {
        // Arrange
        var cliente = new Cliente();
        var novaLista = new List<Ordem>
        {
            new() { Id = 1009L, Valor = 50m },
            new() { Id = 1010L, Valor = 150m }
        };

        // Act
        cliente.Ordens = novaLista;

        // Assert
        Assert.AreEqual(2, cliente.Ordens.Count);
        Assert.AreSame(novaLista, cliente.Ordens);
    }

    [TestMethod]
    public void Cliente_Ordens_DevePossuirContagem_AposMultiplasAdicoes()
    {
        // Arrange
        var cliente = new Cliente { Id = 1011L, Nome = "Teste" };

        // Act
        for (int i = 0; i < 5; i++)
        {
            cliente.Ordens.Add(new Ordem
            {
                Id = 1012L,
                ClienteId = cliente.Id,
                Valor = (i + 1) * 100m
            });
        }

        // Assert
        Assert.AreEqual(5, cliente.Ordens.Count);
    }

    [TestMethod]
    public void Cliente_Ordens_DeveConterOrdemAdicionada()
    {
        // Arrange
        var cliente = new Cliente { Id = 1013L, Nome = "Teste" };
        var ordem = new Ordem { Id = 1014L, ClienteId = cliente.Id, Valor = 300m };

        // Act
        cliente.Ordens.Add(ordem);

        // Assert
        Assert.IsTrue(cliente.Ordens.Contains(ordem));
    }

    [TestMethod]
    public void Cliente_Ordens_LimparColecao_DeveEsvaziar()
    {
        // Arrange
        var cliente = new Cliente { Id = 1015L, Nome = "Teste" };
        cliente.Ordens.Add(new Ordem { Id = 1016L, Valor = 100m });
        cliente.Ordens.Add(new Ordem { Id = 1017L, Valor = 200m });

        // Act
        cliente.Ordens.Clear();

        // Assert
        Assert.AreEqual(0, cliente.Ordens.Count);
    }

    #endregion
}
