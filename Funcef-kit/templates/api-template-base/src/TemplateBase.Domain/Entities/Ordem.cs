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
using Microsoft.EntityFrameworkCore;

namespace TemplateBase.Domain.Entities;

/// <summary>
/// Representa um pedido ou ordem de compra vinculada a um cliente.
/// Registra o valor, status e demais informações da transação comercial.
/// </summary>
/// <remarks>
/// <para>
/// Mapeada para a tabela <c>TEMPLATETESTE.TB_ORDENS</c> no Oracle. A entidade é auditável
/// via <c>[Auditable("Ordem")]</c>. Índices em <c>ClienteId</c>, <c>Status</c> e
/// <c>DataPedido</c> otimizam consultas por cliente, filtros de status e ordenação
/// por data. A navegação <see cref="Cliente"/> é carregada automaticamente com
/// <c>GetByIdWithAutoIncludesAsync</c>.
/// </para>
/// <para>
/// <strong>Entidade rica (DDD)</strong>: o ciclo de vida é governado por métodos de negócio —
/// <see cref="Criar(Entities.Cliente, decimal, string?, DateTime?)"/> para nascer válida
/// (sempre <c>Pendente</c>), <see cref="Atualizar"/>/<see cref="AlterarStatus"/> para evoluir
/// respeitando a máquina de estados de <see cref="StatusOrdem"/>, e
/// <see cref="ValidarExclusao"/> para a regra de remoção. Os setters são <c>internal</c>
/// (EF materializa via backing fields; testes acessam por <c>InternalsVisibleTo</c>) — as
/// camadas de produção não conseguem pular uma transição de status nem gravar valor inválido.
/// </para>
/// </remarks>
/// <seealso cref="Cliente"/>
/// <seealso cref="StatusOrdem"/>
[Table("TB_ORDENS", Schema = "TEMPLATETESTE")]
[Auditable("Ordem")]
[Index(nameof(ClienteId))]
[Index(nameof(Status))]
[Index(nameof(DataPedido))]
public class Ordem
{
    /// <summary>Menor valor aceito para uma ordem (coluna <c>VALOR NUMBER(10,2)</c> com CHECK &gt; 0).</summary>
    public const decimal ValorMinimo = 0.01m;

    /// <summary>Maior valor representável na coluna <c>VALOR NUMBER(10,2)</c>.</summary>
    public const decimal ValorMaximo = 99999999.99m;

    /// <summary>Tamanho máximo das observações (coluna <c>OBSERVACOES</c>).</summary>
    public const int ObservacoesTamanhoMaximo = 500;

    /// <summary>
    /// Construtor de infraestrutura: usado pelo EF Core na materialização e pelos testes
    /// (via <c>InternalsVisibleTo</c>). Código de produção cria ordens por <c>Criar(...)</c>.
    /// </summary>
    internal Ordem()
    {
    }

    /// <summary>
    /// Identificador surrogate da ordem (PK, identity).
    /// Representa o registro de forma inequívoca e é gerado pelo banco na inserção.
    /// </summary>
    /// <remarks>
    /// Coluna Oracle: <c>ORDEM_ID</c> (NUMBER, IDENTITY). O atributo
    /// <see cref="DatabaseGeneratedOption.Identity"/> indica que o valor é gerado
    /// pelo banco; não deve ser definido pela aplicação antes da persistência.
    /// </remarks>
    [Key]
    [Column("ORDEM_ID")]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public long Id { get; internal set; }

    /// <summary>
    /// Referência ao cliente que realizou o pedido.
    /// Define a relação muitos-para-um entre ordem e cliente.
    /// </summary>
    /// <remarks>
    /// Coluna Oracle: <c>CLIENTE_ID</c> (NUMBER). Obrigatório; toda ordem deve
    /// estar vinculada a um cliente existente. Chave estrangeira para
    /// <see cref="Cliente"/>; usa o mesmo nome da PK referenciada.
    /// </remarks>
    /// <seealso cref="Cliente"/>
    [Required]
    [Column("CLIENTE_ID")]
    public long ClienteId { get; internal set; }

    /// <summary>
    /// Valor monetário total da ordem.
    /// Deve ser positivo e respeitar o limite máximo permitido.
    /// </summary>
    /// <remarks>
    /// Coluna Oracle: <c>VALOR</c> (NUMBER(10,2), CHECK &gt; 0). Invariante garantida pela
    /// entidade: entre <see cref="ValorMinimo"/> e <see cref="ValorMaximo"/>.
    /// </remarks>
    /// <example>1500.50</example>
    [Required]
    [Column("VALOR", TypeName = "NUMBER(10,2)")]
    public decimal Valor { get; internal set; }

    /// <summary>
    /// Situação atual da ordem no fluxo de processamento.
    /// Sempre um dos valores de <see cref="StatusOrdem.Validos"/>.
    /// </summary>
    /// <remarks>
    /// Coluna Oracle: <c>STATUS</c> (VARCHAR2, CHECK em <c>CK_ORDENS_STATUS</c>). Valor inicial
    /// <see cref="StatusOrdem.Pendente"/>; transições passam por <see cref="AlterarStatus"/>,
    /// que normaliza a capitalização para a forma canônica da constraint.
    /// </remarks>
    /// <example>Pendente</example>
    [Required]
    [Column("STATUS")]
    [MaxLength(20)]
    public string Status { get; internal set; } = StatusOrdem.Pendente;

    /// <summary>
    /// Texto livre para anotações, instruções especiais ou observações do pedido.
    /// Opcional; útil para comunicação entre cliente e equipe interna.
    /// </summary>
    /// <remarks>
    /// Coluna Oracle: <c>OBSERVACOES</c> (VARCHAR2 implícito). Aceita até
    /// <see cref="ObservacoesTamanhoMaximo"/> caracteres.
    /// </remarks>
    [Column("OBSERVACOES")]
    [MaxLength(ObservacoesTamanhoMaximo)]
    public string? Observacoes { get; internal set; }

    /// <summary>
    /// Data e hora em que o pedido foi registrado no sistema.
    /// Usado para ordenação, relatórios e prazos.
    /// </summary>
    /// <remarks>
    /// Coluna Oracle: <c>DATA_PEDIDO</c> (DATE). Obrigatório; definido na criação
    /// (<see cref="DateTime.UtcNow"/> por padrão). O índice nesta coluna otimiza consultas
    /// ordenadas por data.
    /// </remarks>
    [Required]
    [Column("DATA_PEDIDO")]
    public DateTime DataPedido { get; internal set; } = DateTime.UtcNow;

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
    /// Navegação para o cliente associado à ordem.
    /// Permite acessar dados do cliente sem consultas adicionais.
    /// </summary>
    /// <remarks>
    /// Relacionamento com <see cref="Cliente"/> via <see cref="ClienteId"/>. O
    /// <c>[ForeignKey(nameof(ClienteId))]</c> define a chave estrangeira. O
    /// <c>[AutoInclude]</c> faz o carregamento automático em
    /// <c>GetByIdWithAutoIncludesAsync</c>.
    /// </remarks>
    /// <seealso cref="Cliente"/>
    [ForeignKey(nameof(ClienteId))]
    [AutoInclude]
    public Cliente? Cliente { get; internal set; }

    /// <summary>
    /// Cria uma nova ordem válida vinculada a um cliente já carregado (rastreado pelo EF).
    /// Toda ordem nasce <see cref="StatusOrdem.Pendente"/>.
    /// </summary>
    /// <param name="cliente">Cliente dono da ordem (obrigatório).</param>
    /// <param name="valor">Valor monetário (entre <see cref="ValorMinimo"/> e <see cref="ValorMaximo"/>).</param>
    /// <param name="observacoes">Observações opcionais (até <see cref="ObservacoesTamanhoMaximo"/> caracteres).</param>
    /// <param name="dataPedido">Data do pedido; padrão <see cref="DateTime.UtcNow"/>.</param>
    /// <exception cref="BusinessException">Quando alguma invariante é violada.</exception>
    public static Ordem Criar(Cliente cliente, decimal valor, string? observacoes = null, DateTime? dataPedido = null)
    {
        ArgumentNullException.ThrowIfNull(cliente);

        var ordem = Criar(cliente.Id, valor, observacoes, dataPedido);
        ordem.Cliente = cliente;
        return ordem;
    }

    /// <summary>
    /// Cria uma nova ordem válida a partir da FK do cliente — para cenários em que a entidade
    /// <see cref="Cliente"/> não está carregada (ex.: seeders). Toda ordem nasce
    /// <see cref="StatusOrdem.Pendente"/>.
    /// </summary>
    /// <exception cref="BusinessException">Quando alguma invariante é violada.</exception>
    public static Ordem Criar(long clienteId, decimal valor, string? observacoes = null, DateTime? dataPedido = null)
    {
        ValidarValor(valor);
        ValidarObservacoes(observacoes);

        var agora = DateTime.UtcNow;

        // O Id é gerado pelo banco (coluna identity ORDEM_ID); não é definido aqui.
        return new Ordem
        {
            ClienteId = clienteId,
            Valor = valor,
            Observacoes = observacoes,
            Status = StatusOrdem.Pendente,
            DataPedido = dataPedido ?? agora,
            DataInclusaoAlteracao = agora
        };
    }

    /// <summary>
    /// Atualiza valor, status e observações respeitando as invariantes e a máquina de estados.
    /// </summary>
    /// <exception cref="BusinessException">Valor/observações/status inválidos (<c>INVALID_STATUS</c>).</exception>
    /// <exception cref="ConflictException">Transição de status não permitida.</exception>
    public void Atualizar(decimal valor, string status, string? observacoes)
    {
        ValidarValor(valor);
        ValidarObservacoes(observacoes);
        var novoStatus = ValidarTransicao(status);

        Valor = valor;
        Status = novoStatus;
        Observacoes = observacoes;
        DataInclusaoAlteracao = DateTime.UtcNow;
    }

    /// <summary>
    /// Altera exclusivamente o status, respeitando a máquina de estados de <see cref="StatusOrdem"/>:
    /// status precisa ser conhecido e ordens em status terminal não mudam mais.
    /// </summary>
    /// <exception cref="BusinessException">Status desconhecido (<c>INVALID_STATUS</c>).</exception>
    /// <exception cref="ConflictException">Transição a partir de status terminal.</exception>
    public void AlterarStatus(string novoStatus)
    {
        Status = ValidarTransicao(novoStatus);
        DataInclusaoAlteracao = DateTime.UtcNow;
    }

    /// <summary>
    /// Garante que a ordem pode ser excluída: apenas ordens <c>Pendente</c> ou <c>Cancelado</c>.
    /// Ordens em processamento ou já cumpridas são registro de negócio e não podem sumir.
    /// </summary>
    /// <exception cref="ConflictException">Quando o status atual protege a ordem contra exclusão.</exception>
    public void ValidarExclusao()
    {
        if (!StatusOrdem.PermiteExclusao(Status))
        {
            throw new ConflictException("Ordem",
                $"Não é possível excluir ordem com status '{Status}'. Apenas ordens com status 'Pendente' ou 'Cancelado' podem ser excluídas.");
        }
    }

    /// <summary>
    /// Valida o status candidato (existência + transição) e devolve a forma canônica.
    /// Mesma regra do serviço original: status terminal não transiciona (mesmo valor é no-op).
    /// </summary>
    private string ValidarTransicao(string status)
    {
        var novoStatus = StatusOrdem.Normalizar(status);

        if (StatusOrdem.EhTerminal(Status)
            && !string.Equals(Status, novoStatus, StringComparison.OrdinalIgnoreCase))
        {
            throw new ConflictException("Ordem",
                $"Não é possível alterar status de ordem '{Status}'");
        }

        return novoStatus;
    }

    private static void ValidarValor(decimal valor)
    {
        if (valor < ValorMinimo || valor > ValorMaximo)
        {
            throw new BusinessException(
                $"O valor da ordem deve estar entre {ValorMinimo} e {ValorMaximo}",
                "ORDEM_VALOR_INVALIDO");
        }
    }

    private static void ValidarObservacoes(string? observacoes)
    {
        if (observacoes is not null && observacoes.Length > ObservacoesTamanhoMaximo)
        {
            throw new BusinessException(
                $"As observações da ordem devem ter no máximo {ObservacoesTamanhoMaximo} caracteres",
                "ORDEM_OBSERVACOES_TAMANHO_MAXIMO");
        }
    }
}
