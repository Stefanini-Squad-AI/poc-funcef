using System.Globalization;
using System.Reflection;
using TemplateBase.Application.DTOs.OrdemDto.Resume;

namespace TemplateBase.Tests.Application.DTOs;

[TestClass]
public class OrdemResumeTests
{
    #region Valores Padrão

    [TestMethod]
    public void DeveInicializar_ComValoresPadrao()
    {
        var resume = new OrdemResume();

        Assert.AreEqual(0L, resume.Id);
        Assert.AreEqual(0L, resume.ClienteId);
        Assert.AreEqual(0m, resume.Valor);
        Assert.AreEqual(string.Empty, resume.Status);
    }

    #endregion

    #region Atribuição de Propriedades

    [TestMethod]
    public void DeveAtribuirPropriedades_Corretamente()
    {
        var id = 1001L;
        var clienteId = 1002L;
        var data = new DateTime(2026, 6, 15);

        var resume = new OrdemResume
        {
            Id = id,
            ClienteId = clienteId,
            Valor = 999.99m,
            Status = "Enviado",
            DataPedido = data
        };

        Assert.AreEqual(id, resume.Id);
        Assert.AreEqual(clienteId, resume.ClienteId);
        Assert.AreEqual(999.99m, resume.Valor);
        Assert.AreEqual("Enviado", resume.Status);
        Assert.AreEqual(data, resume.DataPedido);
        Assert.AreEqual("15/06/2026", resume.DataPedidoFormatada);
    }

    [TestMethod]
    public void DeveModificarId_AposCriacao()
    {
        var resume = new OrdemResume();
        var novoId = 1003L;

        resume.Id = novoId;

        Assert.AreEqual(novoId, resume.Id);
    }

    [TestMethod]
    public void DeveModificarClienteId_AposCriacao()
    {
        var resume = new OrdemResume();
        var novoId = 1004L;

        resume.ClienteId = novoId;

        Assert.AreEqual(novoId, resume.ClienteId);
    }

    [TestMethod]
    public void DeveModificarValor_AposCriacao()
    {
        var resume = new OrdemResume { Valor = 100m };

        resume.Valor = 500m;

        Assert.AreEqual(500m, resume.Valor);
    }

    [TestMethod]
    public void DeveModificarStatus_AposCriacao()
    {
        var resume = new OrdemResume { Status = "Pendente" };

        resume.Status = "Concluido";

        Assert.AreEqual("Concluido", resume.Status);
    }

    [TestMethod]
    public void DeveModificarDataPedido_AposCriacao()
    {
        var resume = new OrdemResume();
        var novaData = new DateTime(2025, 3, 20);

        resume.DataPedido = novaData;

        Assert.AreEqual(novaData, resume.DataPedido);
    }

    #endregion

    #region DataPedidoFormatada

    [TestMethod]
    public void DataPedidoFormatada_DeveFormatarComoDdMmAaaa()
    {
        var resume = new OrdemResume
        {
            DataPedido = new DateTime(2026, 2, 21, 14, 30, 0)
        };

        Assert.AreEqual("21/02/2026", resume.DataPedidoFormatada);
    }

    [TestMethod]
    public void DataPedidoFormatada_PrimeiroDiaDoAno_DeveFormatarCorretamente()
    {
        var resume = new OrdemResume
        {
            DataPedido = new DateTime(2026, 1, 1)
        };

        Assert.AreEqual("01/01/2026", resume.DataPedidoFormatada);
    }

    [TestMethod]
    public void DataPedidoFormatada_UltimoDiaDoAno_DeveFormatarCorretamente()
    {
        var resume = new OrdemResume
        {
            DataPedido = new DateTime(2026, 12, 31)
        };

        Assert.AreEqual("31/12/2026", resume.DataPedidoFormatada);
    }

    [TestMethod]
    public void DataPedidoFormatada_AnoBissexto_DeveFormatarCorretamente()
    {
        var resume = new OrdemResume
        {
            DataPedido = new DateTime(2024, 2, 29)
        };

        Assert.AreEqual("29/02/2024", resume.DataPedidoFormatada);
    }

    [TestMethod]
    public void DataPedidoFormatada_DataDefault_DeveFormatarCorretamente()
    {
        var resume = new OrdemResume();

        var esperado = default(DateTime).ToString("dd/MM/yyyy");
        Assert.AreEqual(esperado, resume.DataPedidoFormatada);
    }

    [TestMethod]
    public void DataPedidoFormatada_DeveRefletirModificacao()
    {
        var resume = new OrdemResume
        {
            DataPedido = new DateTime(2026, 1, 1)
        };
        Assert.AreEqual("01/01/2026", resume.DataPedidoFormatada);

        resume.DataPedido = new DateTime(2026, 6, 15);

        Assert.AreEqual("15/06/2026", resume.DataPedidoFormatada);
    }

    #endregion

    #region ValorFormatado

    [TestMethod]
    public void ValorFormatado_DeveFormatarComoMoedaBrasileira()
    {
        var resume = new OrdemResume { Valor = 1500.50m };

        var expected = (1500.50m).ToString("C", CultureInfo.GetCultureInfo("pt-BR"));
        Assert.AreEqual(expected, resume.ValorFormatado);
    }

    [TestMethod]
    public void ValorFormatado_ValorInteiro_DeveExibirDuasCasas()
    {
        var resume = new OrdemResume { Valor = 100m };

        var expected = (100m).ToString("C", CultureInfo.GetCultureInfo("pt-BR"));
        Assert.AreEqual(expected, resume.ValorFormatado);
    }

    [TestMethod]
    public void ValorFormatado_ValorMuitoPequeno_DeveFormatarCorretamente()
    {
        var resume = new OrdemResume { Valor = 0.01m };

        var expected = (0.01m).ToString("C", CultureInfo.GetCultureInfo("pt-BR"));
        Assert.AreEqual(expected, resume.ValorFormatado);
    }

    [TestMethod]
    public void ValorFormatado_ValorZero_DeveFormatarCorretamente()
    {
        var resume = new OrdemResume { Valor = 0m };

        var expected = (0m).ToString("C", CultureInfo.GetCultureInfo("pt-BR"));
        Assert.AreEqual(expected, resume.ValorFormatado);
    }

    [TestMethod]
    public void ValorFormatado_ValorGrande_DeveFormatarCorretamente()
    {
        var resume = new OrdemResume { Valor = 99999999.99m };

        var expected = (99999999.99m).ToString("C", CultureInfo.GetCultureInfo("pt-BR"));
        Assert.AreEqual(expected, resume.ValorFormatado);
    }

    [TestMethod]
    public void ValorFormatado_DeveRefletirModificacao()
    {
        var resume = new OrdemResume { Valor = 100m };
        var esperado1 = (100m).ToString("C", CultureInfo.GetCultureInfo("pt-BR"));
        Assert.AreEqual(esperado1, resume.ValorFormatado);

        resume.Valor = 500m;
        var esperado2 = (500m).ToString("C", CultureInfo.GetCultureInfo("pt-BR"));

        Assert.AreEqual(esperado2, resume.ValorFormatado);
    }

    [TestMethod]
    public void ValorFormatado_ValorComCentavos_DeveFormatarCorretamente()
    {
        var resume = new OrdemResume { Valor = 1234.56m };

        var expected = (1234.56m).ToString("C", CultureInfo.GetCultureInfo("pt-BR"));
        Assert.AreEqual(expected, resume.ValorFormatado);
    }

    #endregion

    #region Atributos de Mapeamento

    [TestMethod]
    public void PropriedadesMapeadas_DevemConterAtributoMapFrom()
    {
        var propsComMapFrom = new[] { "Id", "ClienteId", "Valor", "Status", "DataPedido" };

        foreach (var propName in propsComMapFrom)
        {
            var prop = typeof(OrdemResume).GetProperty(propName)!;
            var hasMapFrom = prop.GetCustomAttributes(true)
                .Any(a => a.GetType().Name == "MapFromAttribute");
            Assert.IsTrue(hasMapFrom, $"Propriedade {propName} deve ter [MapFrom]");
        }
    }

    [TestMethod]
    public void PropriedadesCalculadas_NaoDevemTerAtributoMapFrom()
    {
        var propsCalculadas = new[] { "DataPedidoFormatada", "ValorFormatado" };

        foreach (var propName in propsCalculadas)
        {
            var prop = typeof(OrdemResume).GetProperty(propName)!;
            var hasMapFrom = prop.GetCustomAttributes(true)
                .Any(a => a.GetType().Name == "MapFromAttribute");
            Assert.IsFalse(hasMapFrom, $"Propriedade calculada {propName} não deve ter [MapFrom]");
        }
    }

    [TestMethod]
    public void PropriedadesCalculadas_DevemSerSomenteLeitura()
    {
        var dataPedidoFormatada = typeof(OrdemResume).GetProperty("DataPedidoFormatada")!;
        var valorFormatado = typeof(OrdemResume).GetProperty("ValorFormatado")!;

        Assert.IsNull(dataPedidoFormatada.SetMethod, "DataPedidoFormatada deve ser somente leitura");
        Assert.IsNull(valorFormatado.SetMethod, "ValorFormatado deve ser somente leitura");
    }

    #endregion
}
