using System.Reflection;
using TemplateBase.Application.DTOs.ClienteDto.Resume;
using TemplateBase.Application.DTOs.OrdemDto.Request;
using TemplateBase.Application.DTOs.OrdemDto.Response;

namespace TemplateBase.Tests.Application.DTOs;

#region CreateOrdemRequest

[TestClass]
public class CreateOrdemRequestTests
{
    [TestMethod]
    public void DeveInicializar_ComValoresPadrao()
    {
        var request = new CreateOrdemRequest();

        Assert.AreEqual(0L, request.ClienteId);
        Assert.AreEqual(0m, request.Valor);
        Assert.IsNull(request.Observacoes);
    }

    [TestMethod]
    public void DeveAtribuirPropriedades_Corretamente()
    {
        var clienteId = 1001L;

        var request = new CreateOrdemRequest
        {
            ClienteId = clienteId,
            Valor = 350.99m,
            Observacoes = "Entrega urgente"
        };

        Assert.AreEqual(clienteId, request.ClienteId);
        Assert.AreEqual(350.99m, request.Valor);
        Assert.AreEqual("Entrega urgente", request.Observacoes);
    }

    [TestMethod]
    public void DevePermitirObservacoes_Nulas()
    {
        var request = new CreateOrdemRequest
        {
            ClienteId = 1002L,
            Valor = 100m,
            Observacoes = null
        };

        Assert.IsNull(request.Observacoes);
    }

    [TestMethod]
    public void DeveAceitarValoresDecimais_ComPrecisao()
    {
        var request = new CreateOrdemRequest
        {
            ClienteId = 1003L,
            Valor = 99999999.99m
        };

        Assert.AreEqual(99999999.99m, request.Valor);
    }

    [TestMethod]
    public void DeveModificarClienteId_AposCriacao()
    {
        var request = new CreateOrdemRequest { ClienteId = 1004L };
        var novoId = 1005L;

        request.ClienteId = novoId;

        Assert.AreEqual(novoId, request.ClienteId);
    }

    [TestMethod]
    public void DeveModificarValor_AposCriacao()
    {
        var request = new CreateOrdemRequest { Valor = 100m };

        request.Valor = 500m;

        Assert.AreEqual(500m, request.Valor);
    }

    [TestMethod]
    public void DeveModificarObservacoes_AposCriacao()
    {
        var request = new CreateOrdemRequest { Observacoes = "Original" };

        request.Observacoes = "Atualizado";

        Assert.AreEqual("Atualizado", request.Observacoes);
    }

    [TestMethod]
    public void DeveModificarObservacoes_DeNuloParaValor()
    {
        var request = new CreateOrdemRequest();
        Assert.IsNull(request.Observacoes);

        request.Observacoes = "Nova observação";

        Assert.AreEqual("Nova observação", request.Observacoes);
    }

    [TestMethod]
    public void DeveModificarObservacoes_DeValorParaNulo()
    {
        var request = new CreateOrdemRequest { Observacoes = "Existente" };

        request.Observacoes = null;

        Assert.IsNull(request.Observacoes);
    }

    [TestMethod]
    public void Valor_DeveAceitarMinimoPermitido()
    {
        var request = new CreateOrdemRequest { Valor = 0.01m };

        Assert.AreEqual(0.01m, request.Valor);
    }

    [TestMethod]
    public void Observacoes_DeveAceitarTextoLongo()
    {
        var textoLongo = new string('Z', 500);
        var request = new CreateOrdemRequest { Observacoes = textoLongo };

        Assert.AreEqual(500, request.Observacoes!.Length);
    }

    [TestMethod]
    public void Observacoes_DeveAceitarStringVazia()
    {
        var request = new CreateOrdemRequest { Observacoes = "" };

        Assert.AreEqual("", request.Observacoes);
    }
}

#endregion

#region UpdateOrdemRequest

[TestClass]
public class UpdateOrdemRequestTests
{
    [TestMethod]
    public void DeveInicializar_ComValoresPadrao()
    {
        var request = new UpdateOrdemRequest();

        Assert.AreEqual(0m, request.Valor);
        Assert.AreEqual(string.Empty, request.Status);
        Assert.IsNull(request.Observacoes);
    }

    [TestMethod]
    public void DeveAtribuirPropriedades_Corretamente()
    {
        var request = new UpdateOrdemRequest
        {
            Valor = 200.50m,
            Status = "Processando",
            Observacoes = "Prioridade alta"
        };

        Assert.AreEqual(200.50m, request.Valor);
        Assert.AreEqual("Processando", request.Status);
        Assert.AreEqual("Prioridade alta", request.Observacoes);
    }

    [TestMethod]
    public void DevePermitirObservacoes_Nulas()
    {
        var request = new UpdateOrdemRequest
        {
            Valor = 100m,
            Status = "Pendente",
            Observacoes = null
        };

        Assert.IsNull(request.Observacoes);
    }

    [TestMethod]
    [DataRow("Pendente")]
    [DataRow("Processando")]
    [DataRow("Enviado")]
    [DataRow("Concluido")]
    [DataRow("Cancelado")]
    public void DeveAceitarTodosStatusValidos(string status)
    {
        var request = new UpdateOrdemRequest
        {
            Valor = 100m,
            Status = status
        };

        Assert.AreEqual(status, request.Status);
    }

    [TestMethod]
    public void DeveModificarValor_AposCriacao()
    {
        var request = new UpdateOrdemRequest { Valor = 100m };

        request.Valor = 999m;

        Assert.AreEqual(999m, request.Valor);
    }

    [TestMethod]
    public void DeveModificarStatus_AposCriacao()
    {
        var request = new UpdateOrdemRequest { Status = "Pendente" };

        request.Status = "Concluido";

        Assert.AreEqual("Concluido", request.Status);
    }

    [TestMethod]
    public void DeveModificarObservacoes_AposCriacao()
    {
        var request = new UpdateOrdemRequest { Observacoes = "Antes" };

        request.Observacoes = "Depois";

        Assert.AreEqual("Depois", request.Observacoes);
    }

    [TestMethod]
    public void DeveModificarObservacoes_DeNuloParaValor()
    {
        var request = new UpdateOrdemRequest();

        request.Observacoes = "Nova obs";

        Assert.AreEqual("Nova obs", request.Observacoes);
    }

    [TestMethod]
    public void Valor_DeveAceitarMaximoPermitido()
    {
        var request = new UpdateOrdemRequest { Valor = 99999999.99m };

        Assert.AreEqual(99999999.99m, request.Valor);
    }

    [TestMethod]
    public void Observacoes_DeveAceitarStringVazia()
    {
        var request = new UpdateOrdemRequest { Observacoes = "" };

        Assert.AreEqual("", request.Observacoes);
    }
}

#endregion

#region UpdateOrdemStatusRequest

[TestClass]
public class UpdateOrdemStatusRequestTests
{
    [TestMethod]
    public void DeveInicializar_ComStatusVazio()
    {
        var request = new UpdateOrdemStatusRequest();

        Assert.AreEqual(string.Empty, request.Status);
    }

    [TestMethod]
    public void DeveAtribuirStatus_Corretamente()
    {
        var request = new UpdateOrdemStatusRequest { Status = "Enviado" };

        Assert.AreEqual("Enviado", request.Status);
    }

    [TestMethod]
    [DataRow("Pendente")]
    [DataRow("Processando")]
    [DataRow("Enviado")]
    [DataRow("Concluido")]
    [DataRow("Cancelado")]
    public void DeveAceitarTodosStatusValidos(string status)
    {
        var request = new UpdateOrdemStatusRequest { Status = status };

        Assert.AreEqual(status, request.Status);
    }

    [TestMethod]
    public void DeveModificarStatus_AposCriacao()
    {
        var request = new UpdateOrdemStatusRequest { Status = "Pendente" };

        request.Status = "Cancelado";

        Assert.AreEqual("Cancelado", request.Status);
    }

    [TestMethod]
    public void Status_DeveAceitarTextoLongo()
    {
        var statusLongo = new string('S', 50);
        var request = new UpdateOrdemStatusRequest { Status = statusLongo };

        Assert.AreEqual(50, request.Status.Length);
    }

    [TestMethod]
    public void Status_DeveAceitarStringVazia()
    {
        var request = new UpdateOrdemStatusRequest { Status = "" };

        Assert.AreEqual("", request.Status);
    }
}

#endregion

#region OrdemResponse

[TestClass]
public class OrdemResponseTests
{
    [TestMethod]
    public void DeveInicializar_ComValoresPadrao()
    {
        var response = new OrdemResponse();

        Assert.AreEqual(0L, response.Id);
        Assert.AreEqual(0L, response.ClienteId);
        Assert.AreEqual(0m, response.Valor);
        Assert.AreEqual(string.Empty, response.Status);
        Assert.AreEqual(default(DateTime), response.DataPedido);
        Assert.IsNull(response.Observacoes);
        Assert.IsNull(response.NomeCliente);
        Assert.IsNull(response.Cliente);
    }

    [TestMethod]
    public void DeveAtribuirPropriedades_Corretamente()
    {
        var id = 1006L;
        var clienteId = 1007L;
        var data = new DateTime(2026, 4, 10, 9, 15, 0);

        var response = new OrdemResponse
        {
            Id = id,
            ClienteId = clienteId,
            Valor = 750.00m,
            Status = "Enviado",
            DataPedido = data,
            Observacoes = "Frágil",
            NomeCliente = "João Silva"
        };

        Assert.AreEqual(id, response.Id);
        Assert.AreEqual(clienteId, response.ClienteId);
        Assert.AreEqual(750.00m, response.Valor);
        Assert.AreEqual("Enviado", response.Status);
        Assert.AreEqual(data, response.DataPedido);
        Assert.AreEqual("Frágil", response.Observacoes);
        Assert.AreEqual("João Silva", response.NomeCliente);
    }

    [TestMethod]
    public void DevePermitirCliente_Nulo()
    {
        var response = new OrdemResponse
        {
            Id = 1008L,
            ClienteId = 1009L,
            Valor = 100m,
            Status = "Pendente",
            Cliente = null
        };

        Assert.IsNull(response.Cliente);
        Assert.IsNull(response.NomeCliente);
    }

    [TestMethod]
    public void DevePermitirCliente_ComDados()
    {
        var clienteId = 1010L;
        var clienteResume = new ClienteResume
        {
            Id = clienteId,
            Nome = "Ana Costa",
            Email = "ana@email.com",
            DataCriacao = DateTime.UtcNow
        };

        var response = new OrdemResponse
        {
            Id = 1011L,
            ClienteId = clienteId,
            Valor = 300m,
            Status = "Processando",
            NomeCliente = "Ana Costa",
            Cliente = clienteResume
        };

        Assert.IsNotNull(response.Cliente);
        Assert.AreEqual(clienteId, response.Cliente.Id);
        Assert.AreEqual("Ana Costa", response.Cliente.Nome);
        Assert.AreEqual("Ana Costa", response.NomeCliente);
    }

    [TestMethod]
    public void DevePermitirObservacoes_Nulas()
    {
        var response = new OrdemResponse
        {
            Id = 1012L,
            Valor = 100m,
            Observacoes = null
        };

        Assert.IsNull(response.Observacoes);
    }

    [TestMethod]
    public void ClienteId_DeveSerConsistente_ComClienteResume()
    {
        var clienteId = 1013L;

        var response = new OrdemResponse
        {
            ClienteId = clienteId,
            Cliente = new ClienteResume { Id = clienteId, Nome = "Teste" }
        };

        Assert.AreEqual(response.ClienteId, response.Cliente!.Id);
    }

    [TestMethod]
    public void DeveModificarId_AposCriacao()
    {
        var response = new OrdemResponse();
        var novoId = 1014L;

        response.Id = novoId;

        Assert.AreEqual(novoId, response.Id);
    }

    [TestMethod]
    public void DeveModificarClienteId_AposCriacao()
    {
        var response = new OrdemResponse();
        var novoId = 1015L;

        response.ClienteId = novoId;

        Assert.AreEqual(novoId, response.ClienteId);
    }

    [TestMethod]
    public void DeveModificarValor_AposCriacao()
    {
        var response = new OrdemResponse { Valor = 100m };

        response.Valor = 999m;

        Assert.AreEqual(999m, response.Valor);
    }

    [TestMethod]
    public void DeveModificarStatus_AposCriacao()
    {
        var response = new OrdemResponse { Status = "Pendente" };

        response.Status = "Concluido";

        Assert.AreEqual("Concluido", response.Status);
    }

    [TestMethod]
    public void DeveModificarDataPedido_AposCriacao()
    {
        var response = new OrdemResponse();
        var novaData = new DateTime(2026, 12, 25);

        response.DataPedido = novaData;

        Assert.AreEqual(novaData, response.DataPedido);
    }

    [TestMethod]
    public void DeveModificarObservacoes_AposCriacao()
    {
        var response = new OrdemResponse { Observacoes = "Antes" };

        response.Observacoes = "Depois";

        Assert.AreEqual("Depois", response.Observacoes);
    }

    [TestMethod]
    public void DeveModificarNomeCliente_AposCriacao()
    {
        var response = new OrdemResponse { NomeCliente = "Original" };

        response.NomeCliente = "Atualizado";

        Assert.AreEqual("Atualizado", response.NomeCliente);
    }

    [TestMethod]
    public void DeveModificarCliente_AposCriacao()
    {
        var response = new OrdemResponse();
        Assert.IsNull(response.Cliente);

        var clienteResume = new ClienteResume { Id = 1016L, Nome = "Novo" };
        response.Cliente = clienteResume;

        Assert.IsNotNull(response.Cliente);
        Assert.AreEqual("Novo", response.Cliente.Nome);
    }

    [TestMethod]
    public void DeveModificarCliente_ParaNulo()
    {
        var response = new OrdemResponse
        {
            Cliente = new ClienteResume { Id = 1017L, Nome = "Existente" }
        };

        response.Cliente = null;

        Assert.IsNull(response.Cliente);
    }

    [TestMethod]
    public void Observacoes_DeveAceitarStringVazia()
    {
        var response = new OrdemResponse { Observacoes = "" };

        Assert.AreEqual("", response.Observacoes);
    }

    [TestMethod]
    public void NomeCliente_DeveAceitarStringVazia()
    {
        var response = new OrdemResponse { NomeCliente = "" };

        Assert.AreEqual("", response.NomeCliente);
    }

    [TestMethod]
    public void Propriedade_Cliente_DeveConterAtributoNestedMap()
    {
        var prop = typeof(OrdemResponse).GetProperty("Cliente")!;
        var attrs = prop.GetCustomAttributes(true);

        Assert.IsTrue(attrs.Any(a => a.GetType().Name == "NestedMapAttribute"));
    }

    [TestMethod]
    public void PropriedadesMapeadas_DevemConterAtributoMapFrom()
    {
        var propsComMapFrom = new[] { "Id", "ClienteId", "Valor", "Status", "DataPedido", "Observacoes", "NomeCliente" };

        foreach (var propName in propsComMapFrom)
        {
            var prop = typeof(OrdemResponse).GetProperty(propName)!;
            var hasMapFrom = prop.GetCustomAttributes(true)
                .Any(a => a.GetType().Name == "MapFromAttribute");
            Assert.IsTrue(hasMapFrom, $"Propriedade {propName} deve ter [MapFrom]");
        }
    }
}

#endregion
