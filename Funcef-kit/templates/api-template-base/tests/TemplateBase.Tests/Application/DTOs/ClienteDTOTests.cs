using System.Reflection;
using TemplateBase.Application.DTOs.ClienteDto.Request;
using TemplateBase.Application.DTOs.ClienteDto.Response;
using TemplateBase.Application.DTOs.ClienteDto.Resume;
using TemplateBase.Application.DTOs.OrdemDto.Resume;

namespace TemplateBase.Tests.Application.DTOs;

#region ClienteRequest

[TestClass]
public class ClienteRequestTests
{
    [TestMethod]
    public void DeveInicializar_ComValoresPadrao()
    {
        var request = new ClienteRequest();

        Assert.AreEqual(string.Empty, request.Nome);
        Assert.IsNull(request.Email);
    }

    [TestMethod]
    public void DeveAtribuirPropriedades_Corretamente()
    {
        var request = new ClienteRequest
        {
            Nome = "João Silva",
            Email = "joao@email.com"
        };

        Assert.AreEqual("João Silva", request.Nome);
        Assert.AreEqual("joao@email.com", request.Email);
    }

    [TestMethod]
    public void DevePermitirEmail_Nulo()
    {
        var request = new ClienteRequest
        {
            Nome = "Maria",
            Email = null
        };

        Assert.IsNull(request.Email);
    }

    [TestMethod]
    public void DevePermitirNome_Vazio()
    {
        var request = new ClienteRequest { Nome = "" };

        Assert.AreEqual("", request.Nome);
    }

    [TestMethod]
    public void DeveModificarNome_AposCriacao()
    {
        var request = new ClienteRequest { Nome = "Original" };

        request.Nome = "Modificado";

        Assert.AreEqual("Modificado", request.Nome);
    }

    [TestMethod]
    public void DeveModificarEmail_AposCriacao()
    {
        var request = new ClienteRequest { Email = "a@b.com" };

        request.Email = "c@d.com";

        Assert.AreEqual("c@d.com", request.Email);
    }

    [TestMethod]
    public void DeveModificarEmail_DeNuloParaValor()
    {
        var request = new ClienteRequest();
        Assert.IsNull(request.Email);

        request.Email = "novo@email.com";

        Assert.AreEqual("novo@email.com", request.Email);
    }

    [TestMethod]
    public void DeveModificarEmail_DeValorParaNulo()
    {
        var request = new ClienteRequest { Email = "existente@email.com" };

        request.Email = null;

        Assert.IsNull(request.Email);
    }

    [TestMethod]
    public void Nome_DeveAceitarTextoLongo()
    {
        var nomeLongo = new string('A', 200);
        var request = new ClienteRequest { Nome = nomeLongo };

        Assert.AreEqual(200, request.Nome.Length);
    }

    [TestMethod]
    public void Email_DeveAceitarFormatoComplexo()
    {
        var request = new ClienteRequest { Email = "user+tag@sub.domain.com.br" };

        Assert.AreEqual("user+tag@sub.domain.com.br", request.Email);
    }
}

#endregion

#region ClienteComOrdemRequest

[TestClass]
public class ClienteComOrdemRequestTests
{
    [TestMethod]
    public void DeveInicializar_ComValoresPadrao()
    {
        var request = new ClienteComOrdemRequest();

        Assert.AreEqual(string.Empty, request.NomeCliente);
        Assert.IsNull(request.EmailCliente);
        Assert.AreEqual(0m, request.ValorOrdem);
        Assert.IsNull(request.ObservacoesOrdem);
    }

    [TestMethod]
    public void DeveAtribuirPropriedades_Corretamente()
    {
        var request = new ClienteComOrdemRequest
        {
            NomeCliente = "João Silva",
            EmailCliente = "joao@email.com",
            ValorOrdem = 250.75m,
            ObservacoesOrdem = "Entrega expressa"
        };

        Assert.AreEqual("João Silva", request.NomeCliente);
        Assert.AreEqual("joao@email.com", request.EmailCliente);
        Assert.AreEqual(250.75m, request.ValorOrdem);
        Assert.AreEqual("Entrega expressa", request.ObservacoesOrdem);
    }

    [TestMethod]
    public void DevePermitirCamposOpcionais_Nulos()
    {
        var request = new ClienteComOrdemRequest
        {
            NomeCliente = "Maria",
            ValorOrdem = 100m,
            EmailCliente = null,
            ObservacoesOrdem = null
        };

        Assert.IsNull(request.EmailCliente);
        Assert.IsNull(request.ObservacoesOrdem);
    }

    [TestMethod]
    public void DeveModificarNomeCliente_AposCriacao()
    {
        var request = new ClienteComOrdemRequest { NomeCliente = "Original" };

        request.NomeCliente = "Modificado";

        Assert.AreEqual("Modificado", request.NomeCliente);
    }

    [TestMethod]
    public void DeveModificarValorOrdem_AposCriacao()
    {
        var request = new ClienteComOrdemRequest { ValorOrdem = 100m };

        request.ValorOrdem = 999.99m;

        Assert.AreEqual(999.99m, request.ValorOrdem);
    }

    [TestMethod]
    public void DeveModificarEmailCliente_AposCriacao()
    {
        var request = new ClienteComOrdemRequest { EmailCliente = "old@email.com" };

        request.EmailCliente = "new@email.com";

        Assert.AreEqual("new@email.com", request.EmailCliente);
    }

    [TestMethod]
    public void DeveModificarObservacoesOrdem_AposCriacao()
    {
        var request = new ClienteComOrdemRequest { ObservacoesOrdem = "Original" };

        request.ObservacoesOrdem = "Atualizado";

        Assert.AreEqual("Atualizado", request.ObservacoesOrdem);
    }

    [TestMethod]
    public void ValorOrdem_DeveAceitarValorMaximo()
    {
        var request = new ClienteComOrdemRequest { ValorOrdem = 99999999.99m };

        Assert.AreEqual(99999999.99m, request.ValorOrdem);
    }

    [TestMethod]
    public void ValorOrdem_DeveAceitarValorMinimo()
    {
        var request = new ClienteComOrdemRequest { ValorOrdem = 0.01m };

        Assert.AreEqual(0.01m, request.ValorOrdem);
    }
}

#endregion

#region ClienteResponse

[TestClass]
public class ClienteResponseTests
{
    [TestMethod]
    public void DeveInicializar_ComValoresPadrao()
    {
        var response = new ClienteResponse();

        Assert.AreEqual(0L, response.Id);
        Assert.AreEqual(string.Empty, response.Nome);
        Assert.IsNull(response.Email);
        Assert.AreEqual(default(DateTime), response.DataCriacao);
        Assert.IsNull(response.Ordens);
    }

    [TestMethod]
    public void DeveAtribuirPropriedades_Corretamente()
    {
        var id = 1001L;
        var data = new DateTime(2026, 1, 15, 10, 30, 0);

        var response = new ClienteResponse
        {
            Id = id,
            Nome = "João Silva",
            Email = "joao@email.com",
            DataCriacao = data,
            Ordens = new List<OrdemResume>()
        };

        Assert.AreEqual(id, response.Id);
        Assert.AreEqual("João Silva", response.Nome);
        Assert.AreEqual("joao@email.com", response.Email);
        Assert.AreEqual(data, response.DataCriacao);
        Assert.IsNotNull(response.Ordens);
    }

    [TestMethod]
    public void DevePermitirOrdens_Nulas()
    {
        var response = new ClienteResponse
        {
            Id = 1002L,
            Nome = "Teste",
            Ordens = null
        };

        Assert.IsNull(response.Ordens);
    }

    [TestMethod]
    public void DevePermitirOrdens_ComItens()
    {
        var ordens = new List<OrdemResume>
        {
            new() { Id = 1003L, Valor = 100m, Status = "Pendente" },
            new() { Id = 1004L, Valor = 200m, Status = "Concluido" }
        };

        var response = new ClienteResponse
        {
            Id = 1005L,
            Nome = "João",
            Ordens = ordens
        };

        Assert.AreEqual(2, response.Ordens!.Count);
        Assert.AreEqual(100m, response.Ordens[0].Valor);
        Assert.AreEqual("Concluido", response.Ordens[1].Status);
    }

    [TestMethod]
    public void DevePermitirEmail_Nulo()
    {
        var response = new ClienteResponse
        {
            Id = 1006L,
            Nome = "Maria",
            Email = null
        };

        Assert.IsNull(response.Email);
    }

    [TestMethod]
    public void DevePermitirOrdens_ListaVazia()
    {
        var response = new ClienteResponse
        {
            Id = 1007L,
            Nome = "Teste",
            Ordens = new List<OrdemResume>()
        };

        Assert.IsNotNull(response.Ordens);
        Assert.AreEqual(0, response.Ordens.Count);
    }

    [TestMethod]
    public void DeveModificarId_AposCriacao()
    {
        var response = new ClienteResponse();
        var novoId = 1008L;

        response.Id = novoId;

        Assert.AreEqual(novoId, response.Id);
    }

    [TestMethod]
    public void DeveModificarNome_AposCriacao()
    {
        var response = new ClienteResponse { Nome = "Original" };

        response.Nome = "Modificado";

        Assert.AreEqual("Modificado", response.Nome);
    }

    [TestMethod]
    public void DeveModificarEmail_AposCriacao()
    {
        var response = new ClienteResponse { Email = "old@email.com" };

        response.Email = "new@email.com";

        Assert.AreEqual("new@email.com", response.Email);
    }

    [TestMethod]
    public void DeveModificarDataCriacao_AposCriacao()
    {
        var response = new ClienteResponse();
        var novaData = new DateTime(2026, 6, 15);

        response.DataCriacao = novaData;

        Assert.AreEqual(novaData, response.DataCriacao);
    }

    [TestMethod]
    public void DeveModificarOrdens_AposCriacao()
    {
        var response = new ClienteResponse();
        Assert.IsNull(response.Ordens);

        var ordens = new List<OrdemResume>
        {
            new() { Id = 1009L, Valor = 500m, Status = "Pendente" }
        };
        response.Ordens = ordens;

        Assert.IsNotNull(response.Ordens);
        Assert.AreEqual(1, response.Ordens.Count);
    }

    [TestMethod]
    public void Propriedade_Id_DeveConterAtributoMapFrom()
    {
        var prop = typeof(ClienteResponse).GetProperty("Id")!;
        var attrs = prop.GetCustomAttributes(true);

        Assert.IsTrue(attrs.Any(a => a.GetType().Name == "MapFromAttribute"));
    }

    [TestMethod]
    public void Propriedade_Ordens_DeveConterAtributoNestedMap()
    {
        var prop = typeof(ClienteResponse).GetProperty("Ordens")!;
        var attrs = prop.GetCustomAttributes(true);

        Assert.IsTrue(attrs.Any(a => a.GetType().Name == "NestedMapAttribute"));
    }
}

#endregion

#region ClienteComOrdemResponse

[TestClass]
public class ClienteComOrdemResponseTests
{
    [TestMethod]
    public void DeveInicializar_ComValoresPadrao()
    {
        var response = new ClienteComOrdemResponse();

        Assert.AreEqual(0L, response.ClienteId);
        Assert.AreEqual(string.Empty, response.NomeCliente);
        Assert.IsNull(response.EmailCliente);
        Assert.AreEqual(0L, response.OrdemId);
        Assert.AreEqual(0m, response.ValorOrdem);
        Assert.AreEqual(string.Empty, response.StatusOrdem);
        Assert.AreEqual(default(DateTime), response.DataPedido);
    }

    [TestMethod]
    public void DeveAtribuirPropriedades_Corretamente()
    {
        var clienteId = 1010L;
        var ordemId = 1011L;
        var data = new DateTime(2026, 3, 10, 14, 0, 0);

        var response = new ClienteComOrdemResponse
        {
            ClienteId = clienteId,
            NomeCliente = "João Silva",
            EmailCliente = "joao@email.com",
            OrdemId = ordemId,
            ValorOrdem = 500.00m,
            StatusOrdem = "Pendente",
            DataPedido = data
        };

        Assert.AreEqual(clienteId, response.ClienteId);
        Assert.AreEqual("João Silva", response.NomeCliente);
        Assert.AreEqual("joao@email.com", response.EmailCliente);
        Assert.AreEqual(ordemId, response.OrdemId);
        Assert.AreEqual(500.00m, response.ValorOrdem);
        Assert.AreEqual("Pendente", response.StatusOrdem);
        Assert.AreEqual(data, response.DataPedido);
    }

    [TestMethod]
    public void DevePermitirEmail_Nulo()
    {
        var response = new ClienteComOrdemResponse
        {
            ClienteId = 1012L,
            NomeCliente = "Maria",
            EmailCliente = null,
            OrdemId = 1013L,
            ValorOrdem = 100m,
            StatusOrdem = "Pendente"
        };

        Assert.IsNull(response.EmailCliente);
    }

    [TestMethod]
    public void ClienteId_E_OrdemId_DevemSerDiferentes()
    {
        var response = new ClienteComOrdemResponse
        {
            ClienteId = 1014L,
            OrdemId = 1015L
        };

        Assert.AreNotEqual(response.ClienteId, response.OrdemId);
    }

    [TestMethod]
    public void DeveModificarClienteId_AposCriacao()
    {
        var response = new ClienteComOrdemResponse();
        var novoId = 1016L;

        response.ClienteId = novoId;

        Assert.AreEqual(novoId, response.ClienteId);
    }

    [TestMethod]
    public void DeveModificarOrdemId_AposCriacao()
    {
        var response = new ClienteComOrdemResponse();
        var novoId = 1017L;

        response.OrdemId = novoId;

        Assert.AreEqual(novoId, response.OrdemId);
    }

    [TestMethod]
    public void DeveModificarNomeCliente_AposCriacao()
    {
        var response = new ClienteComOrdemResponse { NomeCliente = "Original" };

        response.NomeCliente = "Atualizado";

        Assert.AreEqual("Atualizado", response.NomeCliente);
    }

    [TestMethod]
    public void DeveModificarStatusOrdem_AposCriacao()
    {
        var response = new ClienteComOrdemResponse { StatusOrdem = "Pendente" };

        response.StatusOrdem = "Concluido";

        Assert.AreEqual("Concluido", response.StatusOrdem);
    }

    [TestMethod]
    public void DeveModificarValorOrdem_AposCriacao()
    {
        var response = new ClienteComOrdemResponse { ValorOrdem = 100m };

        response.ValorOrdem = 999.99m;

        Assert.AreEqual(999.99m, response.ValorOrdem);
    }

    [TestMethod]
    public void DeveModificarDataPedido_AposCriacao()
    {
        var response = new ClienteComOrdemResponse();
        var novaData = new DateTime(2026, 12, 31);

        response.DataPedido = novaData;

        Assert.AreEqual(novaData, response.DataPedido);
    }

    [TestMethod]
    public void DeveModificarEmailCliente_AposCriacao()
    {
        var response = new ClienteComOrdemResponse { EmailCliente = "old@email.com" };

        response.EmailCliente = "new@email.com";

        Assert.AreEqual("new@email.com", response.EmailCliente);
    }

    [TestMethod]
    public void TodasPropriedades_DevemConterAtributoMapFrom()
    {
        var props = typeof(ClienteComOrdemResponse).GetProperties();

        foreach (var prop in props)
        {
            var hasMapFrom = prop.GetCustomAttributes(true)
                .Any(a => a.GetType().Name == "MapFromAttribute");
            Assert.IsTrue(hasMapFrom, $"Propriedade {prop.Name} deve ter [MapFrom]");
        }
    }
}

#endregion

#region ClienteResume

[TestClass]
public class ClienteResumeTests
{
    [TestMethod]
    public void DeveInicializar_ComValoresPadrao()
    {
        var resume = new ClienteResume();

        Assert.AreEqual(0L, resume.Id);
        Assert.AreEqual(string.Empty, resume.Nome);
        Assert.IsNull(resume.Email);
        Assert.AreEqual(default(DateTime), resume.DataCriacao);
    }

    [TestMethod]
    public void DeveAtribuirPropriedades_Corretamente()
    {
        var id = 1018L;
        var data = new DateTime(2026, 5, 20, 8, 0, 0);

        var resume = new ClienteResume
        {
            Id = id,
            Nome = "Ana Costa",
            Email = "ana@email.com",
            DataCriacao = data
        };

        Assert.AreEqual(id, resume.Id);
        Assert.AreEqual("Ana Costa", resume.Nome);
        Assert.AreEqual("ana@email.com", resume.Email);
        Assert.AreEqual(data, resume.DataCriacao);
    }

    [TestMethod]
    public void DevePermitirEmail_Nulo()
    {
        var resume = new ClienteResume
        {
            Id = 1019L,
            Nome = "Carlos",
            Email = null
        };

        Assert.IsNull(resume.Email);
    }

    [TestMethod]
    public void DevePermitirEmail_Vazio()
    {
        var resume = new ClienteResume
        {
            Id = 1020L,
            Nome = "Carlos",
            Email = ""
        };

        Assert.AreEqual("", resume.Email);
    }

    [TestMethod]
    public void DeveModificarId_AposCriacao()
    {
        var resume = new ClienteResume();
        var novoId = 1021L;

        resume.Id = novoId;

        Assert.AreEqual(novoId, resume.Id);
    }

    [TestMethod]
    public void DeveModificarNome_AposCriacao()
    {
        var resume = new ClienteResume { Nome = "Original" };

        resume.Nome = "Atualizado";

        Assert.AreEqual("Atualizado", resume.Nome);
    }

    [TestMethod]
    public void DeveModificarEmail_AposCriacao()
    {
        var resume = new ClienteResume { Email = "old@email.com" };

        resume.Email = "new@email.com";

        Assert.AreEqual("new@email.com", resume.Email);
    }

    [TestMethod]
    public void DeveModificarDataCriacao_AposCriacao()
    {
        var resume = new ClienteResume();
        var novaData = new DateTime(2025, 1, 1);

        resume.DataCriacao = novaData;

        Assert.AreEqual(novaData, resume.DataCriacao);
    }

    [TestMethod]
    public void TodasPropriedades_DevemConterAtributoMapFrom()
    {
        var props = typeof(ClienteResume).GetProperties();

        foreach (var prop in props)
        {
            var hasMapFrom = prop.GetCustomAttributes(true)
                .Any(a => a.GetType().Name == "MapFromAttribute");
            Assert.IsTrue(hasMapFrom, $"Propriedade {prop.Name} deve ter [MapFrom]");
        }
    }
}

#endregion
