// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Exceptions;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Tests.Domain;

/// <summary>
/// Testes de COMPORTAMENTO do domínio rico (DDD): factories, invariantes e máquina de estados.
/// Diferente dos testes de propriedade (ClienteTests/OrdemTests), aqui o alvo são as regras
/// de negócio que as entidades passaram a garantir por construção.
/// </summary>
[TestClass]
public class StatusOrdemTests
{
    [TestMethod]
    public void Validos_DeveConterExatamenteOsCincoStatusDaConstraint()
    {
        CollectionAssert.AreEquivalent(
            new[] { "Pendente", "Processando", "Enviado", "Concluido", "Cancelado" },
            StatusOrdem.Validos.ToArray());
    }

    [TestMethod]
    [DataRow("pendente", "Pendente")]
    [DataRow("PROCESSANDO", "Processando")]
    [DataRow("Concluido", "Concluido")]
    public void Normalizar_CapitalizacaoDiferente_DeveRetornarFormaCanonica(string entrada, string esperado)
    {
        // A constraint CK_ORDENS_STATUS é case-sensitive: a normalização evita ORA-02290.
        Assert.AreEqual(esperado, StatusOrdem.Normalizar(entrada));
    }

    [TestMethod]
    public void Normalizar_StatusDesconhecido_DeveLancarBusinessExceptionComCodigo()
    {
        var ex = Assert.ThrowsExactly<BusinessException>(() => StatusOrdem.Normalizar("Devolvido"));

        Assert.AreEqual("INVALID_STATUS", ex.ErrorCode);
    }

    [TestMethod]
    [DataRow("Concluido", true)]
    [DataRow("Cancelado", true)]
    [DataRow("Pendente", false)]
    [DataRow("Processando", false)]
    public void EhTerminal_DeveRefletirAMaquinaDeEstados(string status, bool esperado)
    {
        Assert.AreEqual(esperado, StatusOrdem.EhTerminal(status));
    }

    [TestMethod]
    [DataRow("Pendente", true)]
    [DataRow("Cancelado", true)]
    [DataRow("Processando", false)]
    [DataRow("Enviado", false)]
    [DataRow("Concluido", false)]
    public void PermiteExclusao_DeveProtegerOrdensEmProcessamentoOuCumpridas(string status, bool esperado)
    {
        Assert.AreEqual(esperado, StatusOrdem.PermiteExclusao(status));
    }
}

[TestClass]
public class ClienteComportamentoTests
{
    [TestMethod]
    public void Criar_DadosValidos_DeveNascerComDatasEDadosNormalizados()
    {
        var antes = DateTime.UtcNow;

        var cliente = Cliente.Criar("  João da Silva  ", "  joao@email.com  ");

        Assert.AreEqual("João da Silva", cliente.Nome);
        Assert.AreEqual("joao@email.com", cliente.Email);
        Assert.IsTrue(cliente.DataCriacao >= antes);
        Assert.IsTrue(cliente.DataInclusaoAlteracao >= antes);
        // O Id é identity do banco: a factory nunca o define.
        Assert.AreEqual(0L, cliente.Id);
    }

    [TestMethod]
    public void Criar_EmailVazio_DeveNormalizarParaNull()
    {
        var cliente = Cliente.Criar("João", "   ");

        Assert.IsNull(cliente.Email);
    }

    [TestMethod]
    [DataRow(null)]
    [DataRow("")]
    [DataRow("   ")]
    public void Criar_NomeAusente_DeveLancarBusinessException(string? nome)
    {
        var ex = Assert.ThrowsExactly<BusinessException>(() => Cliente.Criar(nome!));

        Assert.AreEqual("CLIENTE_NOME_OBRIGATORIO", ex.ErrorCode);
    }

    [TestMethod]
    public void Criar_NomeAcimaDoLimite_DeveLancarBusinessException()
    {
        var nomeGrande = new string('a', Cliente.NomeTamanhoMaximo + 1);

        var ex = Assert.ThrowsExactly<BusinessException>(() => Cliente.Criar(nomeGrande));

        Assert.AreEqual("CLIENTE_NOME_TAMANHO_MAXIMO", ex.ErrorCode);
    }

    [TestMethod]
    public void AtualizarDados_DadosValidos_DeveAtualizarETocarColunaDeControle()
    {
        var cliente = Cliente.Criar("João", "joao@email.com");
        var dataOriginal = cliente.DataInclusaoAlteracao;

        cliente.AtualizarDados("Maria", "maria@email.com");

        Assert.AreEqual("Maria", cliente.Nome);
        Assert.AreEqual("maria@email.com", cliente.Email);
        Assert.IsTrue(cliente.DataInclusaoAlteracao >= dataOriginal);
    }

    [TestMethod]
    public void AtualizarDados_NomeInvalido_DeveLancarSemAlterarEstado()
    {
        var cliente = Cliente.Criar("João", "joao@email.com");

        Assert.ThrowsExactly<BusinessException>(() => cliente.AtualizarDados("", "novo@email.com"));

        // Falha de invariante não pode deixar a entidade meio-atualizada.
        Assert.AreEqual("João", cliente.Nome);
        Assert.AreEqual("joao@email.com", cliente.Email);
    }
}

[TestClass]
public class OrdemComportamentoTests
{
    private static Cliente NovoCliente() => new() { Id = 1001L, Nome = "João" };

    [TestMethod]
    public void Criar_ComCliente_DeveNascerPendenteVinculadaAoCliente()
    {
        var cliente = NovoCliente();

        var ordem = Ordem.Criar(cliente, 150.00m, "obs");

        Assert.AreEqual(StatusOrdem.Pendente, ordem.Status);
        Assert.AreEqual(cliente.Id, ordem.ClienteId);
        Assert.AreSame(cliente, ordem.Cliente);
        Assert.AreEqual(150.00m, ordem.Valor);
        Assert.AreEqual("obs", ordem.Observacoes);
        Assert.AreEqual(0L, ordem.Id);
    }

    [TestMethod]
    [DataRow(0)]
    [DataRow(-10)]
    public void Criar_ValorNaoPositivo_DeveLancarBusinessException(double valor)
    {
        var ex = Assert.ThrowsExactly<BusinessException>(
            () => Ordem.Criar(NovoCliente(), (decimal)valor));

        Assert.AreEqual("ORDEM_VALOR_INVALIDO", ex.ErrorCode);
    }

    [TestMethod]
    public void Criar_ValorAcimaDoMaximoDaColuna_DeveLancarBusinessException()
    {
        var ex = Assert.ThrowsExactly<BusinessException>(
            () => Ordem.Criar(NovoCliente(), Ordem.ValorMaximo + 0.01m));

        Assert.AreEqual("ORDEM_VALOR_INVALIDO", ex.ErrorCode);
    }

    [TestMethod]
    public void AlterarStatus_TransicaoValida_DeveNormalizarCapitalizacao()
    {
        var ordem = Ordem.Criar(NovoCliente(), 100m);

        // Entrada em minúsculas não pode chegar ao banco (CK_ORDENS_STATUS é case-sensitive).
        ordem.AlterarStatus("processando");

        Assert.AreEqual(StatusOrdem.Processando, ordem.Status);
    }

    [TestMethod]
    public void AlterarStatus_StatusDesconhecido_DeveLancarBusinessException()
    {
        var ordem = Ordem.Criar(NovoCliente(), 100m);

        var ex = Assert.ThrowsExactly<BusinessException>(() => ordem.AlterarStatus("Inexistente"));

        Assert.AreEqual("INVALID_STATUS", ex.ErrorCode);
        Assert.AreEqual(StatusOrdem.Pendente, ordem.Status);
    }

    [TestMethod]
    [DataRow("Concluido")]
    [DataRow("Cancelado")]
    public void AlterarStatus_DeStatusTerminal_DeveLancarConflict(string terminal)
    {
        var ordem = Ordem.Criar(NovoCliente(), 100m);
        ordem.AlterarStatus(terminal);

        Assert.ThrowsExactly<ConflictException>(() => ordem.AlterarStatus(StatusOrdem.Pendente));
        Assert.AreEqual(terminal, ordem.Status);
    }

    [TestMethod]
    public void AlterarStatus_MesmoStatusTerminal_DeveSerNoOpPermitido()
    {
        var ordem = Ordem.Criar(NovoCliente(), 100m);
        ordem.AlterarStatus(StatusOrdem.Concluido);

        // Reafirmar o mesmo status não é transição — comportamento preservado do serviço original.
        ordem.AlterarStatus(StatusOrdem.Concluido);

        Assert.AreEqual(StatusOrdem.Concluido, ordem.Status);
    }

    [TestMethod]
    public void Atualizar_DadosValidos_DeveAplicarTudoETocarColunaDeControle()
    {
        var ordem = Ordem.Criar(NovoCliente(), 100m);
        var dataOriginal = ordem.DataInclusaoAlteracao;

        ordem.Atualizar(250.50m, StatusOrdem.Enviado, "atualizada");

        Assert.AreEqual(250.50m, ordem.Valor);
        Assert.AreEqual(StatusOrdem.Enviado, ordem.Status);
        Assert.AreEqual("atualizada", ordem.Observacoes);
        Assert.IsTrue(ordem.DataInclusaoAlteracao >= dataOriginal);
    }

    [TestMethod]
    public void Atualizar_ObservacoesAcimaDoLimite_DeveLancarSemAlterarEstado()
    {
        var ordem = Ordem.Criar(NovoCliente(), 100m, "original");
        var observacoesGrandes = new string('x', Ordem.ObservacoesTamanhoMaximo + 1);

        var ex = Assert.ThrowsExactly<BusinessException>(
            () => ordem.Atualizar(200m, StatusOrdem.Enviado, observacoesGrandes));

        Assert.AreEqual("ORDEM_OBSERVACOES_TAMANHO_MAXIMO", ex.ErrorCode);
        Assert.AreEqual(100m, ordem.Valor);
        Assert.AreEqual(StatusOrdem.Pendente, ordem.Status);
        Assert.AreEqual("original", ordem.Observacoes);
    }

    [TestMethod]
    [DataRow("Processando")]
    [DataRow("Enviado")]
    [DataRow("Concluido")]
    public void ValidarExclusao_StatusProtegido_DeveLancarConflict(string status)
    {
        var ordem = Ordem.Criar(NovoCliente(), 100m);
        ordem.AlterarStatus(status);

        Assert.ThrowsExactly<ConflictException>(() => ordem.ValidarExclusao());
    }

    [TestMethod]
    [DataRow("Pendente")]
    [DataRow("Cancelado")]
    public void ValidarExclusao_StatusPermitido_NaoDeveLancar(string status)
    {
        var ordem = Ordem.Criar(NovoCliente(), 100m);
        if (status != StatusOrdem.Pendente)
        {
            ordem.AlterarStatus(status);
        }

        ordem.ValidarExclusao();
    }
}
