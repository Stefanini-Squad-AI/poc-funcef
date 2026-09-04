using TemplateBase.Domain.Entities;

namespace TemplateBase.Tests.Domain;

/// <summary>
/// Testes unitários para a entidade Ordem.
/// </summary>
[TestClass]
public class OrdemTests
{
    #region Valores Padrão

    [TestMethod]
    public void Ordem_DeveCriar_ComValoresPadrao()
    {
        // Arrange & Act
        var ordem = new Ordem();

        // Assert
        Assert.AreEqual(0L, ordem.Id);
        Assert.AreEqual(0L, ordem.ClienteId);
        Assert.AreEqual(0m, ordem.Valor);
        Assert.AreEqual("Pendente", ordem.Status);
        Assert.IsNull(ordem.Observacoes);
        Assert.IsNull(ordem.Cliente);
    }

    [TestMethod]
    public void Ordem_StatusPadrao_DeveSerPendente()
    {
        // Arrange & Act
        var ordem = new Ordem();

        // Assert
        Assert.AreEqual("Pendente", ordem.Status);
    }

    [TestMethod]
    public void Ordem_DataPedido_Padrao_DeveSerProximoDeUtcNow()
    {
        // Arrange
        var antes = DateTime.UtcNow;

        // Act
        var ordem = new Ordem();
        var depois = DateTime.UtcNow;

        // Assert
        Assert.IsTrue(ordem.DataPedido >= antes.AddSeconds(-1));
        Assert.IsTrue(ordem.DataPedido <= depois.AddSeconds(1));
    }

    [TestMethod]
    public void Ordem_Id_DevePadrao_SerZero()
    {
        // Arrange & Act
        var ordem = new Ordem();

        // Assert
        Assert.AreEqual(0L, ordem.Id);
    }

    [TestMethod]
    public void Ordem_ClienteId_DevePadrao_SerZero()
    {
        // Arrange & Act
        var ordem = new Ordem();

        // Assert
        Assert.AreEqual(0L, ordem.ClienteId);
    }

    [TestMethod]
    public void Ordem_Valor_DevePadrao_SerZero()
    {
        // Arrange & Act
        var ordem = new Ordem();

        // Assert
        Assert.AreEqual(0m, ordem.Valor);
    }

    #endregion

    #region Atribuição de Propriedades

    [TestMethod]
    public void Ordem_DeveAtribuirPropriedades_Corretamente()
    {
        // Arrange
        var id = 1001L;
        var clienteId = 1002L;
        var valor = 150.50m;
        var status = "Processando";
        var observacoes = "Entrega expressa";
        var dataPedido = DateTime.UtcNow;

        // Act
        var ordem = new Ordem
        {
            Id = id,
            ClienteId = clienteId,
            Valor = valor,
            Status = status,
            Observacoes = observacoes,
            DataPedido = dataPedido
        };

        // Assert
        Assert.AreEqual(id, ordem.Id);
        Assert.AreEqual(clienteId, ordem.ClienteId);
        Assert.AreEqual(valor, ordem.Valor);
        Assert.AreEqual(status, ordem.Status);
        Assert.AreEqual(observacoes, ordem.Observacoes);
        Assert.AreEqual(dataPedido, ordem.DataPedido);
    }

    [TestMethod]
    public void Ordem_DevePermitirObservacoes_Nulas()
    {
        // Arrange & Act
        var ordem = new Ordem
        {
            Id = 1003L,
            ClienteId = 1004L,
            Valor = 100m,
            Observacoes = null
        };

        // Assert
        Assert.IsNull(ordem.Observacoes);
    }

    [TestMethod]
    public void Ordem_Observacoes_DeveAceitarStringVazia()
    {
        // Arrange & Act
        var ordem = new Ordem { Observacoes = "" };

        // Assert
        Assert.AreEqual("", ordem.Observacoes);
    }

    [TestMethod]
    public void Ordem_Observacoes_DeveAceitarTextoComMaxLength()
    {
        // Arrange
        var textoLongo = new string('A', 500);

        // Act
        var ordem = new Ordem { Observacoes = textoLongo };

        // Assert
        Assert.AreEqual(500, ordem.Observacoes!.Length);
    }

    [TestMethod]
    public void Ordem_Observacoes_DeveAceitarCaracteresEspeciais()
    {
        // Arrange & Act
        var ordem = new Ordem { Observacoes = "Observação com ãéíóú e símbolos: @#$%" };

        // Assert
        Assert.AreEqual("Observação com ãéíóú e símbolos: @#$%", ordem.Observacoes);
    }

    [TestMethod]
    public void Ordem_Valor_DeveAceitarMaximoPermitido()
    {
        // Arrange & Act
        var ordem = new Ordem { Valor = 99999999.99m };

        // Assert
        Assert.AreEqual(99999999.99m, ordem.Valor);
    }

    [TestMethod]
    public void Ordem_Valor_DeveAceitarMinimoPermitido()
    {
        // Arrange & Act
        var ordem = new Ordem { Valor = 0.01m };

        // Assert
        Assert.AreEqual(0.01m, ordem.Valor);
    }

    [TestMethod]
    public void Ordem_Status_DeveAceitarQualquerTexto()
    {
        // Arrange & Act
        var ordem = new Ordem { Status = "StatusCustomizado" };

        // Assert
        Assert.AreEqual("StatusCustomizado", ordem.Status);
    }

    [TestMethod]
    public void Ordem_Status_DeveAceitarMaxLength()
    {
        // Arrange
        var statusLongo = new string('X', 20);

        // Act
        var ordem = new Ordem { Status = statusLongo };

        // Assert
        Assert.AreEqual(20, ordem.Status.Length);
    }

    #endregion

    #region Modificação Pós-Criação

    [TestMethod]
    public void Ordem_DeveModificarId_AposCriacao()
    {
        // Arrange
        var ordem = new Ordem();
        var novoId = 1005L;

        // Act
        ordem.Id = novoId;

        // Assert
        Assert.AreEqual(novoId, ordem.Id);
    }

    [TestMethod]
    public void Ordem_DeveModificarClienteId_AposCriacao()
    {
        // Arrange
        var ordem = new Ordem { ClienteId = 1006L };
        var novoClienteId = 1007L;

        // Act
        ordem.ClienteId = novoClienteId;

        // Assert
        Assert.AreEqual(novoClienteId, ordem.ClienteId);
    }

    [TestMethod]
    public void Ordem_DeveModificarValor_AposCriacao()
    {
        // Arrange
        var ordem = new Ordem { Valor = 100m };

        // Act
        ordem.Valor = 200m;

        // Assert
        Assert.AreEqual(200m, ordem.Valor);
    }

    [TestMethod]
    public void Ordem_DeveModificarStatus_AposCriacao()
    {
        // Arrange
        var ordem = new Ordem();
        Assert.AreEqual("Pendente", ordem.Status);

        // Act
        ordem.Status = "Processando";

        // Assert
        Assert.AreEqual("Processando", ordem.Status);
    }

    [TestMethod]
    public void Ordem_DeveModificarObservacoes_AposCriacao()
    {
        // Arrange
        var ordem = new Ordem { Observacoes = "Original" };

        // Act
        ordem.Observacoes = "Modificado";

        // Assert
        Assert.AreEqual("Modificado", ordem.Observacoes);
    }

    [TestMethod]
    public void Ordem_DeveModificarObservacoes_ParaNulo()
    {
        // Arrange
        var ordem = new Ordem { Observacoes = "Existente" };

        // Act
        ordem.Observacoes = null;

        // Assert
        Assert.IsNull(ordem.Observacoes);
    }

    [TestMethod]
    public void Ordem_DeveModificarDataPedido_AposCriacao()
    {
        // Arrange
        var ordem = new Ordem();
        var novaData = new DateTime(2025, 6, 15, 0, 0, 0, DateTimeKind.Utc);

        // Act
        ordem.DataPedido = novaData;

        // Assert
        Assert.AreEqual(novaData, ordem.DataPedido);
    }

    #endregion

    #region Navegação Cliente

    [TestMethod]
    public void Ordem_DeveAssociarCliente()
    {
        // Arrange
        var cliente = new Cliente
        {
            Id = 1008L,
            Nome = "Cliente Teste"
        };

        // Act
        var ordem = new Ordem
        {
            Id = 1009L,
            ClienteId = cliente.Id,
            Valor = 200m,
            Cliente = cliente
        };

        // Assert
        Assert.IsNotNull(ordem.Cliente);
        Assert.AreEqual(cliente.Id, ordem.ClienteId);
        Assert.AreEqual(cliente.Nome, ordem.Cliente.Nome);
    }

    [TestMethod]
    public void Ordem_DeveDefinirELimparCliente()
    {
        // Arrange
        var cliente = new Cliente { Id = 1010L, Nome = "Teste" };
        var ordem = new Ordem { Cliente = cliente };
        Assert.IsNotNull(ordem.Cliente);

        // Act
        ordem.Cliente = null;

        // Assert
        Assert.IsNull(ordem.Cliente);
    }

    [TestMethod]
    public void Ordem_DeveAtribuirCliente_ComOrdensBidirecionais()
    {
        // Arrange
        var cliente = new Cliente { Id = 1011L, Nome = "Cliente Completo" };

        // Act
        var ordem = new Ordem
        {
            Id = 1012L,
            ClienteId = cliente.Id,
            Valor = 500m,
            Cliente = cliente
        };
        cliente.Ordens.Add(ordem);

        // Assert
        Assert.AreSame(cliente, ordem.Cliente);
        Assert.IsTrue(cliente.Ordens.Contains(ordem));
        Assert.AreEqual(1, cliente.Ordens.Count);
    }

    [TestMethod]
    public void Ordem_DevePermitirTrocarCliente()
    {
        // Arrange
        var cliente1 = new Cliente { Id = 1013L, Nome = "Cliente 1" };
        var cliente2 = new Cliente { Id = 1014L, Nome = "Cliente 2" };
        var ordem = new Ordem
        {
            ClienteId = cliente1.Id,
            Cliente = cliente1
        };

        // Act
        ordem.ClienteId = cliente2.Id;
        ordem.Cliente = cliente2;

        // Assert
        Assert.AreEqual(cliente2.Id, ordem.ClienteId);
        Assert.AreSame(cliente2, ordem.Cliente);
    }

    #endregion
}
