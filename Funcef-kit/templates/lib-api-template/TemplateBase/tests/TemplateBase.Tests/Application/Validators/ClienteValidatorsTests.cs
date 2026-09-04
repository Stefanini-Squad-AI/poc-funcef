// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FluentValidation.TestHelper;
using TemplateBase.Application.Commands.Cliente.CreateComOrdemEf;
using TemplateBase.Application.Commands.Cliente.Delete;
using TemplateBase.Application.Commands.Cliente.Update;
using TemplateBase.Application.DTOs.ClienteDto.Request;

namespace TemplateBase.Tests.Application.Validators;

[TestClass]
public class ClienteUpdateValidatorTests
{
    private UpdateClienteValidator _validator = null!;

    [TestInitialize]
    public void Setup() => _validator = new UpdateClienteValidator();

    [TestMethod]
    public void DevePassar_ComDadosValidos()
    {
        var command = new UpdateClienteCommand
        {
            Id = 1001L,
            Request = new ClienteRequest { Nome = "João Silva", Email = "joao@email.com" }
        };
        _validator.TestValidate(command).ShouldNotHaveAnyValidationErrors();
    }

    [TestMethod]
    public void DeveFalhar_ComIdVazio()
    {
        var command = new UpdateClienteCommand
        {
            Id = 0L,
            Request = new ClienteRequest { Nome = "João" }
        };
        _validator.TestValidate(command).ShouldHaveValidationErrorFor(x => x.Id);
    }

    [TestMethod]
    public void DeveFalhar_ComNomeVazio()
    {
        var command = new UpdateClienteCommand
        {
            Id = 1002L,
            Request = new ClienteRequest { Nome = "", Email = "joao@email.com" }
        };
        _validator.TestValidate(command).ShouldHaveValidationErrorFor(x => x.Request.Nome);
    }

    [TestMethod]
    public void DeveFalhar_ComNomeMuitoLongo()
    {
        var command = new UpdateClienteCommand
        {
            Id = 1003L,
            Request = new ClienteRequest { Nome = new string('a', 101) }
        };
        _validator.TestValidate(command).ShouldHaveValidationErrorFor(x => x.Request.Nome);
    }

    [TestMethod]
    public void DeveFalhar_ComEmailInvalido()
    {
        var command = new UpdateClienteCommand
        {
            Id = 1004L,
            Request = new ClienteRequest { Nome = "João", Email = "invalido" }
        };
        _validator.TestValidate(command).ShouldHaveValidationErrorFor(x => x.Request.Email);
    }

    [TestMethod]
    public void DevePassar_SemEmail()
    {
        var command = new UpdateClienteCommand
        {
            Id = 1005L,
            Request = new ClienteRequest { Nome = "João", Email = null }
        };
        _validator.TestValidate(command).ShouldNotHaveAnyValidationErrors();
    }
}

[TestClass]
public class ClienteDeleteValidatorTests
{
    private DeleteClienteValidator _validator = null!;

    [TestInitialize]
    public void Setup() => _validator = new DeleteClienteValidator();

    [TestMethod]
    public void DevePassar_ComIdValido()
    {
        var command = new DeleteClienteCommand { Id = 1006L };
        _validator.TestValidate(command).ShouldNotHaveAnyValidationErrors();
    }

    [TestMethod]
    public void DeveFalhar_ComIdVazio()
    {
        var command = new DeleteClienteCommand { Id = 0L };
        _validator.TestValidate(command).ShouldHaveValidationErrorFor(x => x.Id);
    }
}

[TestClass]
public class ClienteCreateComOrdemValidatorTests
{
    private CreateClienteComOrdemEfValidator _validator = null!;

    [TestInitialize]
    public void Setup() => _validator = new CreateClienteComOrdemEfValidator();

    [TestMethod]
    public void DevePassar_ComDadosValidos()
    {
        var command = new CreateClienteComOrdemEfCommand
        {
            Request = new ClienteComOrdemRequest
            {
                NomeCliente = "João Silva",
                EmailCliente = "joao@email.com",
                ValorOrdem = 150.00m,
                ObservacoesOrdem = "Entrega rápida"
            }
        };
        _validator.TestValidate(command).ShouldNotHaveAnyValidationErrors();
    }

    [TestMethod]
    public void DevePassar_SemEmailESemObservacoes()
    {
        var command = new CreateClienteComOrdemEfCommand
        {
            Request = new ClienteComOrdemRequest
            {
                NomeCliente = "Maria",
                ValorOrdem = 100.00m
            }
        };
        _validator.TestValidate(command).ShouldNotHaveAnyValidationErrors();
    }

    [TestMethod]
    public void DeveFalhar_SemNomeCliente()
    {
        var command = new CreateClienteComOrdemEfCommand
        {
            Request = new ClienteComOrdemRequest
            {
                NomeCliente = "",
                ValorOrdem = 100.00m
            }
        };
        _validator.TestValidate(command).ShouldHaveValidationErrorFor(x => x.Request.NomeCliente);
    }

    [TestMethod]
    public void DeveFalhar_NomeClienteMuitoLongo()
    {
        var command = new CreateClienteComOrdemEfCommand
        {
            Request = new ClienteComOrdemRequest
            {
                NomeCliente = new string('a', 101),
                ValorOrdem = 100.00m
            }
        };
        _validator.TestValidate(command).ShouldHaveValidationErrorFor(x => x.Request.NomeCliente);
    }

    [TestMethod]
    public void DeveFalhar_ComEmailInvalido()
    {
        var command = new CreateClienteComOrdemEfCommand
        {
            Request = new ClienteComOrdemRequest
            {
                NomeCliente = "João",
                EmailCliente = "invalido",
                ValorOrdem = 100.00m
            }
        };
        _validator.TestValidate(command).ShouldHaveValidationErrorFor(x => x.Request.EmailCliente);
    }

    [TestMethod]
    public void DeveFalhar_ValorOrdemZero()
    {
        var command = new CreateClienteComOrdemEfCommand
        {
            Request = new ClienteComOrdemRequest
            {
                NomeCliente = "João",
                ValorOrdem = 0m
            }
        };
        _validator.TestValidate(command).ShouldHaveValidationErrorFor(x => x.Request.ValorOrdem);
    }

    [TestMethod]
    public void DeveFalhar_ValorOrdemNegativo()
    {
        var command = new CreateClienteComOrdemEfCommand
        {
            Request = new ClienteComOrdemRequest
            {
                NomeCliente = "João",
                ValorOrdem = -50m
            }
        };
        _validator.TestValidate(command).ShouldHaveValidationErrorFor(x => x.Request.ValorOrdem);
    }

    [TestMethod]
    public void DeveFalhar_ObservacoesMuitoLongas()
    {
        var command = new CreateClienteComOrdemEfCommand
        {
            Request = new ClienteComOrdemRequest
            {
                NomeCliente = "João",
                ValorOrdem = 100m,
                ObservacoesOrdem = new string('x', 501)
            }
        };
        _validator.TestValidate(command).ShouldHaveValidationErrorFor(x => x.Request.ObservacoesOrdem);
    }
}
