using FluentValidation.TestHelper;
using TemplateBase.Application.Commands.Cliente.Create;
using TemplateBase.Application.DTOs.ClienteDto.Request;

namespace TemplateBase.Tests.Application.Validators;

/// <summary>
/// Testes para o validador CreateClienteValidator.
/// </summary>
[TestClass]
public class CreateClienteValidatorTests
{
    private CreateClienteValidator _validator = null!;

    [TestInitialize]
    public void Setup()
    {
        _validator = new CreateClienteValidator();
    }

    [TestMethod]
    public void DevePassar_ComDadosValidos()
    {
        var command = new CreateClienteCommand
        {
            Request = new ClienteRequest
            {
                Nome = "João Silva",
                Email = "joao@email.com"
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldNotHaveAnyValidationErrors();
    }

    [TestMethod]
    public void DevePassar_SemEmail()
    {
        var command = new CreateClienteCommand
        {
            Request = new ClienteRequest
            {
                Nome = "João Silva",
                Email = null
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldNotHaveAnyValidationErrors();
    }

    [TestMethod]
    public void DeveFalhar_SemNome()
    {
        var command = new CreateClienteCommand
        {
            Request = new ClienteRequest
            {
                Nome = string.Empty,
                Email = "joao@email.com"
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldHaveValidationErrorFor(x => x.Request.Nome);
    }

    [TestMethod]
    public void DeveFalhar_NomeMuitoLongo()
    {
        var command = new CreateClienteCommand
        {
            Request = new ClienteRequest
            {
                Nome = new string('a', 101),
                Email = "joao@email.com"
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldHaveValidationErrorFor(x => x.Request.Nome);
    }

    [TestMethod]
    public void DeveFalhar_EmailInvalido()
    {
        var command = new CreateClienteCommand
        {
            Request = new ClienteRequest
            {
                Nome = "João Silva",
                Email = "email-invalido"
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldHaveValidationErrorFor(x => x.Request.Email);
    }

    [TestMethod]
    public void DeveFalhar_EmailMuitoLongo()
    {
        var command = new CreateClienteCommand
        {
            Request = new ClienteRequest
            {
                Nome = "João Silva",
                Email = new string('a', 141) + "@email.com"
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldHaveValidationErrorFor(x => x.Request.Email);
    }
}
