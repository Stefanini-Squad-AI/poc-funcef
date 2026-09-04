// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FluentValidation.TestHelper;
using TemplateBase.Application.Commands.Ordem.Delete;
using TemplateBase.Application.Commands.Ordem.UpdateStatus;
using TemplateBase.Application.DTOs.OrdemDto.Request;

namespace TemplateBase.Tests.Application.Validators;

[TestClass]
public class OrdemDeleteValidatorTests
{
    private DeleteOrdemValidator _validator = null!;

    [TestInitialize]
    public void Setup() => _validator = new DeleteOrdemValidator();

    [TestMethod]
    public void DevePassar_ComIdValido()
    {
        var command = new DeleteOrdemCommand { Id = 1001L };
        _validator.TestValidate(command).ShouldNotHaveAnyValidationErrors();
    }

    [TestMethod]
    public void DeveFalhar_ComIdVazio()
    {
        var command = new DeleteOrdemCommand { Id = 0L };
        _validator.TestValidate(command).ShouldHaveValidationErrorFor(x => x.Id);
    }
}

[TestClass]
public class OrdemUpdateStatusValidatorTests
{
    private UpdateOrdemStatusValidator _validator = null!;

    [TestInitialize]
    public void Setup() => _validator = new UpdateOrdemStatusValidator();

    [TestMethod]
    [DataRow("Pendente")]
    [DataRow("Processando")]
    [DataRow("Enviado")]
    [DataRow("Concluido")]
    [DataRow("Cancelado")]
    public void DevePassar_ComStatusValido(string status)
    {
        var command = new UpdateOrdemStatusCommand
        {
            Id = 1002L,
            Request = new UpdateOrdemStatusRequest { Status = status }
        };
        _validator.TestValidate(command).ShouldNotHaveAnyValidationErrors();
    }

    [TestMethod]
    public void DeveFalhar_ComStatusVazio()
    {
        var command = new UpdateOrdemStatusCommand
        {
            Id = 1003L,
            Request = new UpdateOrdemStatusRequest { Status = "" }
        };
        _validator.TestValidate(command).ShouldHaveValidationErrorFor(x => x.Request.Status);
    }

    [TestMethod]
    public void DeveFalhar_ComStatusInvalido()
    {
        var command = new UpdateOrdemStatusCommand
        {
            Id = 1004L,
            Request = new UpdateOrdemStatusRequest { Status = "Inexistente" }
        };
        _validator.TestValidate(command).ShouldHaveValidationErrorFor(x => x.Request.Status);
    }
}
