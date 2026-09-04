// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using FuncefEssenciais.Exceptions;
using FuncefORM.Audit.Attributes;
using FuncefORM.Data.Attributes;

namespace TemplateBase.Domain.Entities;

/// <summary>
/// Representa uma pessoa ou empresa que realiza pedidos no sistema.
/// É a entidade central para gestão de clientes e suas ordens.
/// </summary>
/// <remarks>
/// <para>
/// Mapeada para a tabela <c>TEMPLATETESTE.TB_CLIENTES</c> no Oracle. A entidade é auditável
/// via <c>[Auditable("Cliente")]</c>, permitindo rastreamento de alterações. A navegação
/// <see cref="Ordens"/> é carregada automaticamente quando se usa
/// <c>GetByIdWithAutoIncludesAsync</c> com <c>IncluirOrdens = true</c>.
/// </para>
/// <para>
/// <strong>Entidade rica (DDD)</strong>: o estado só muda por métodos de negócio —
/// <see cref="Criar"/> para nascer válida e <see cref="AtualizarDados"/> para alterar.
/// Os setters são <c>internal</c>: o EF Core materializa via backing fields e o projeto de
/// testes tem acesso via <c>InternalsVisibleTo</c>, mas as camadas de Application/Infrastructure
/// não conseguem colocar a entidade em estado inválido. As invariantes (nome obrigatório,
/// limites de tamanho) são garantidas aqui — os validators FluentValidation da borda
/// continuam existindo para respostas 400 amigáveis; a entidade é a última linha de defesa.
/// </para>
/// </remarks>
/// <seealso cref="Ordem"/>
[Table("TB_CLIENTES", Schema = "TEMPLATETESTE")]
[Auditable("Cliente")]
public class Cliente
{
    /// <summary>Tamanho máximo do nome (coluna <c>NOME</c>).</summary>
    public const int NomeTamanhoMaximo = 100;

    /// <summary>Tamanho máximo do e-mail (coluna <c>EMAIL</c>).</summary>
    public const int EmailTamanhoMaximo = 150;

    /// <summary>
    /// Construtor de infraestrutura: usado pelo EF Core na materialização e pelos testes
    /// (via <c>InternalsVisibleTo</c>). Código de produção cria clientes por <see cref="Criar"/>.
    /// </summary>
    internal Cliente()
    {
    }

    /// <summary>
    /// Identificador surrogate do cliente (PK, identity).
    /// Representa o registro de forma inequívoca e é gerado pelo banco na inserção.
    /// </summary>
    /// <remarks>
    /// Coluna Oracle: <c>CLIENTE_ID</c> (NUMBER, IDENTITY). O atributo
    /// <see cref="DatabaseGeneratedOption.Identity"/> indica que o valor é gerado
    /// pelo banco; não deve ser definido pela aplicação antes da persistência.
    /// </remarks>
    [Key]
    [Column("CLIENTE_ID")]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public long Id { get; internal set; }

    /// <summary>
    /// Nome completo ou razão social do cliente.
    /// Obrigatório para identificação e cadastro.
    /// </summary>
    /// <remarks>
    /// Coluna Oracle: <c>NOME</c> (VARCHAR2 implícito). Invariante garantida por
    /// <see cref="Criar"/>/<see cref="AtualizarDados"/>: obrigatório e até
    /// <see cref="NomeTamanhoMaximo"/> caracteres.
    /// </remarks>
    [Required]
    [Column("NOME")]
    [MaxLength(NomeTamanhoMaximo)]
    public string Nome { get; internal set; } = string.Empty;

    /// <summary>
    /// Endereço de e-mail para contato e comunicação.
    /// Opcional; quando informado, deve ser um e-mail válido.
    /// </summary>
    /// <remarks>
    /// Coluna Oracle: <c>EMAIL</c> (VARCHAR2 implícito). O domínio garante o limite de
    /// <see cref="EmailTamanhoMaximo"/> caracteres; o formato é validado na borda
    /// (FluentValidation, <c>RuleForOptionalEmail</c>). A unicidade é regra que envolve
    /// outros registros — vive no <c>ClienteService</c> (e no índice <c>UK_CLIENTES_EMAIL</c>).
    /// </remarks>
    /// <example>joao.silva@empresa.com.br</example>
    [Column("EMAIL")]
    [MaxLength(EmailTamanhoMaximo)]
    public string? Email { get; internal set; }

    /// <summary>
    /// Momento em que o cliente foi cadastrado no sistema.
    /// Usado para auditoria e relatórios de novos cadastros.
    /// </summary>
    /// <remarks>
    /// Coluna Oracle: <c>DATA_CRIACAO</c> (DATE). Obrigatório; definido em <see cref="Criar"/>
    /// como <see cref="DateTime.UtcNow"/> para garantir consistência em ambientes distribuídos.
    /// </remarks>
    [Required]
    [Column("DATA_CRIACAO")]
    public DateTime DataCriacao { get; internal set; } = DateTime.UtcNow;

    /// <summary>
    /// Data de inclusão ou última alteração do registro.
    /// Coluna de controle obrigatória do PadraoBD (carga incremental).
    /// </summary>
    /// <remarks>
    /// Coluna Oracle: <c>DATA_INCLUSAO_ALTERACAO</c> (DATE, DEFAULT SYSDATE NOT NULL).
    /// Atualizada pela própria entidade em todo método de negócio que muda estado.
    /// </remarks>
    [Required]
    [Column("DATA_INCLUSAO_ALTERACAO")]
    public DateTime DataInclusaoAlteracao { get; internal set; } = DateTime.UtcNow;

    /// <summary>
    /// Coleção de ordens/pedidos realizados pelo cliente.
    /// Permite consultar o histórico de compras e o relacionamento cliente-ordem.
    /// </summary>
    /// <remarks>
    /// Navegação inversa de <see cref="Ordem.Cliente"/>. O atributo <c>[AutoInclude]</c>
    /// faz com que seja carregada automaticamente ao usar
    /// <c>GetByIdWithAutoIncludesAsync</c> com <c>IncluirOrdens = true</c>.
    /// </remarks>
    /// <seealso cref="Ordem"/>
    [InverseProperty(nameof(Ordem.Cliente))]
    [AutoInclude]
    public ICollection<Ordem> Ordens { get; internal set; } = new List<Ordem>();

    /// <summary>
    /// Cria um novo cliente válido. Única forma de nascer um <see cref="Cliente"/> nas camadas
    /// de produção — as invariantes valem desde o primeiro instante.
    /// </summary>
    /// <param name="nome">Nome ou razão social (obrigatório, até <see cref="NomeTamanhoMaximo"/> caracteres).</param>
    /// <param name="email">E-mail de contato (opcional, até <see cref="EmailTamanhoMaximo"/> caracteres).</param>
    /// <exception cref="BusinessException">Quando alguma invariante é violada.</exception>
    public static Cliente Criar(string nome, string? email = null)
    {
        ValidarNome(nome);
        ValidarEmail(email);

        var agora = DateTime.UtcNow;

        // O Id é gerado pelo banco (coluna identity CLIENTE_ID); não é definido aqui.
        return new Cliente
        {
            Nome = nome.Trim(),
            Email = NormalizarEmail(email),
            DataCriacao = agora,
            DataInclusaoAlteracao = agora
        };
    }

    /// <summary>
    /// Atualiza os dados cadastrais mantendo as invariantes e a coluna de controle.
    /// </summary>
    /// <exception cref="BusinessException">Quando alguma invariante é violada.</exception>
    public void AtualizarDados(string nome, string? email)
    {
        ValidarNome(nome);
        ValidarEmail(email);

        Nome = nome.Trim();
        Email = NormalizarEmail(email);
        DataInclusaoAlteracao = DateTime.UtcNow;
    }

    private static void ValidarNome(string nome)
    {
        if (string.IsNullOrWhiteSpace(nome))
        {
            throw new BusinessException("O nome do cliente é obrigatório", "CLIENTE_NOME_OBRIGATORIO");
        }

        if (nome.Trim().Length > NomeTamanhoMaximo)
        {
            throw new BusinessException(
                $"O nome do cliente deve ter no máximo {NomeTamanhoMaximo} caracteres",
                "CLIENTE_NOME_TAMANHO_MAXIMO");
        }
    }

    private static void ValidarEmail(string? email)
    {
        if (!string.IsNullOrWhiteSpace(email) && email.Trim().Length > EmailTamanhoMaximo)
        {
            throw new BusinessException(
                $"O e-mail do cliente deve ter no máximo {EmailTamanhoMaximo} caracteres",
                "CLIENTE_EMAIL_TAMANHO_MAXIMO");
        }
    }

    private static string? NormalizarEmail(string? email) =>
        string.IsNullOrWhiteSpace(email) ? null : email.Trim();
}
