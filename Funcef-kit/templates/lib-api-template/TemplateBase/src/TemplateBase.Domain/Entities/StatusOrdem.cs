// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Exceptions;

namespace TemplateBase.Domain.Entities;

/// <summary>
/// Catálogo canônico de status de <see cref="Ordem"/> e das regras de transição/exclusão.
/// </summary>
/// <remarks>
/// <para>
/// <strong>Fonte única de verdade</strong> da máquina de estados da ordem. Antes deste arquivo,
/// o conjunto de status válidos existia em três lugares (serviço + dois validators) e as regras
/// de transição/exclusão em arrays privados do serviço — adicionar um status exigia três edições
/// e nada falhava ao esquecer uma. Os validators FluentValidation referenciam
/// <see cref="Validos"/> e a entidade <see cref="Ordem"/> aplica as regras.
/// </para>
/// <para>
/// Os literais casam com a constraint <c>CK_ORDENS_STATUS</c> do banco
/// (<c>scripts/banco-dados/01-tabelas/002_TB_ORDENS.sql</c>) — defesa em profundidade:
/// domínio valida primeiro, banco garante por último. A constraint é case-sensitive, por isso
/// <see cref="Normalizar"/> converte qualquer capitalização de entrada para a forma canônica
/// antes de persistir.
/// </para>
/// <para>
/// Modelado como classe de constantes <c>string</c> (e não <c>enum</c>) porque a coluna
/// <c>STATUS</c> é <c>VARCHAR2</c> e os contratos da API expõem o valor textual — evita
/// conversores de tipo no EF e no mapeamento de DTOs. Num domínio real com mais estados,
/// avalie um enum com <c>HasConversion&lt;string&gt;()</c> ou um Value Object.
/// </para>
/// </remarks>
public static class StatusOrdem
{
    public const string Pendente = "Pendente";
    public const string Processando = "Processando";
    public const string Enviado = "Enviado";
    public const string Concluido = "Concluido";
    public const string Cancelado = "Cancelado";

    /// <summary>Todos os status aceitos pelo domínio (e pela constraint do banco).</summary>
    public static IReadOnlyList<string> Validos { get; } =
        [Pendente, Processando, Enviado, Concluido, Cancelado];

    /// <summary>
    /// Status terminais: uma ordem <c>Concluido</c> ou <c>Cancelado</c> não muda mais de status.
    /// </summary>
    public static IReadOnlyList<string> Terminais { get; } = [Concluido, Cancelado];

    /// <summary>
    /// Status que impedem a exclusão da ordem. Apenas <c>Pendente</c> e <c>Cancelado</c>
    /// podem ser excluídas — ordens em processamento ou já cumpridas são registro de negócio.
    /// </summary>
    public static IReadOnlyList<string> ProtegidosContraExclusao { get; } =
        [Concluido, Enviado, Processando];

    /// <summary>Indica se o valor informado é um status conhecido (ignora capitalização).</summary>
    public static bool EhValido(string? status) =>
        status is not null && Validos.Contains(status, StringComparer.OrdinalIgnoreCase);

    /// <summary>Indica se o status é terminal (não admite mais transições).</summary>
    public static bool EhTerminal(string status) =>
        Terminais.Contains(status, StringComparer.OrdinalIgnoreCase);

    /// <summary>Indica se uma ordem neste status pode ser excluída.</summary>
    public static bool PermiteExclusao(string status) =>
        !ProtegidosContraExclusao.Contains(status, StringComparer.OrdinalIgnoreCase);

    /// <summary>
    /// Converte o status informado para a forma canônica (capitalização exata da constraint
    /// do banco), lançando <see cref="BusinessException"/> (<c>INVALID_STATUS</c>) se não for
    /// um status conhecido.
    /// </summary>
    public static string Normalizar(string status)
    {
        var canonico = Validos.FirstOrDefault(
            s => string.Equals(s, status, StringComparison.OrdinalIgnoreCase));

        return canonico ?? throw new BusinessException(
            $"Status '{status}' inválido. Status válidos: {string.Join(", ", Validos)}",
            "INVALID_STATUS");
    }
}
