// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FluentValidation.TestHelper;
using TemplateBase.Application.Commands.Ordem.Update;
using TemplateBase.Application.DTOs.OrdemDto.Request;

namespace TemplateBase.Tests.Application.Validators;

/// <summary>
/// Testes para o validador UpdateOrdemValidator.
/// </summary>
[TestClass]
public class UpdateOrdemValidatorTests
{
    private UpdateOrdemValidator _validator = null!;

    [TestInitialize]
    public void Setup()
    {
        _validator = new UpdateOrdemValidator();
    }

    [TestMethod]
    public void DevePassar_ComDadosValidos()
    {
        var command = new UpdateOrdemCommand
        {
            Id = 1001L,
            Request = new UpdateOrdemRequest
            {
                Valor = 150.00m,
                Status = "Processando",
                Observacoes = "Atualização"
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldNotHaveAnyValidationErrors();
    }

    [TestMethod]
    public void DeveFalhar_StatusInvalido()
    {
        var command = new UpdateOrdemCommand
        {
            Id = 1002L,
            Request = new UpdateOrdemRequest
            {
                Valor = 100m,
                Status = "StatusInvalido"
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldHaveValidationErrorFor(x => x.Request.Status);
    }

    [TestMethod]
    [DataRow("Pendente")]
    [DataRow("Processando")]
    [DataRow("Enviado")]
    [DataRow("Concluido")]
    [DataRow("Cancelado")]
    public void DevePassar_ComStatusValidos(string status)
    {
        var command = new UpdateOrdemCommand
        {
            Id = 1003L,
            Request = new UpdateOrdemRequest
            {
                Valor = 100m,
                Status = status
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldNotHaveValidationErrorFor(x => x.Request.Status);
    }

    [TestMethod]
    public void DeveFalhar_ValorZero()
    {
        var command = new UpdateOrdemCommand
        {
            Id = 1004L,
            Request = new UpdateOrdemRequest
            {
                Valor = 0m,
                Status = "Pendente"
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldHaveValidationErrorFor(x => x.Request.Valor);
    }

    [TestMethod]
    public void DeveFalhar_ObservacoesMuitoLongas()
    {
        var command = new UpdateOrdemCommand
        {
            Id = 1005L,
            Request = new UpdateOrdemRequest
            {
                Valor = 100m,
                Status = "Pendente",
                Observacoes = new string('x', 501)
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldHaveValidationErrorFor(x => x.Request.Observacoes);
    }
}
