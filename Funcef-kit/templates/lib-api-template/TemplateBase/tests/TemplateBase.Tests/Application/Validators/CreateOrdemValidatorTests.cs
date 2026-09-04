// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FluentValidation.TestHelper;
using TemplateBase.Application.Commands.Ordem.Create;
using TemplateBase.Application.DTOs.OrdemDto.Request;

namespace TemplateBase.Tests.Application.Validators;

/// <summary>
/// Testes para o validador CreateOrdemValidator.
/// </summary>
[TestClass]
public class CreateOrdemValidatorTests
{
    private CreateOrdemValidator _validator = null!;

    [TestInitialize]
    public void Setup()
    {
        _validator = new CreateOrdemValidator();
    }

    [TestMethod]
    public void DevePassar_ComDadosValidos()
    {
        var command = new CreateOrdemCommand
        {
            Request = new CreateOrdemRequest
            {
                ClienteId = 1001L,
                Valor = 100.00m,
                Observacoes = "Entrega rápida"
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldNotHaveAnyValidationErrors();
    }

    [TestMethod]
    public void DevePassar_SemObservacoes()
    {
        var command = new CreateOrdemCommand
        {
            Request = new CreateOrdemRequest
            {
                ClienteId = 1002L,
                Valor = 50.00m,
                Observacoes = null
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldNotHaveAnyValidationErrors();
    }

    [TestMethod]
    public void DeveFalhar_ClienteIdVazio()
    {
        var command = new CreateOrdemCommand
        {
            Request = new CreateOrdemRequest
            {
                ClienteId = 0L,
                Valor = 100.00m
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldHaveValidationErrorFor(x => x.Request.ClienteId);
    }

    [TestMethod]
    public void DeveFalhar_ValorZero()
    {
        var command = new CreateOrdemCommand
        {
            Request = new CreateOrdemRequest
            {
                ClienteId = 1003L,
                Valor = 0m
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldHaveValidationErrorFor(x => x.Request.Valor);
    }

    [TestMethod]
    public void DeveFalhar_ValorNegativo()
    {
        var command = new CreateOrdemCommand
        {
            Request = new CreateOrdemRequest
            {
                ClienteId = 1004L,
                Valor = -10m
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldHaveValidationErrorFor(x => x.Request.Valor);
    }

    [TestMethod]
    public void DeveFalhar_ObservacoesMuitoLongas()
    {
        var command = new CreateOrdemCommand
        {
            Request = new CreateOrdemRequest
            {
                ClienteId = 1005L,
                Valor = 100m,
                Observacoes = new string('x', 501)
            }
        };

        var result = _validator.TestValidate(command);

        result.ShouldHaveValidationErrorFor(x => x.Request.Observacoes);
    }
}
