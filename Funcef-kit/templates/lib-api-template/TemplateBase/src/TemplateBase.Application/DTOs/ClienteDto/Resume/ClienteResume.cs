// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefORM.Mapping.Attributes;

namespace TemplateBase.Application.DTOs.ClienteDto.Resume;

/// <summary>
/// DTO resumido do cliente para uso em listagens e referências aninhadas.
/// </summary>
/// <remarks>
/// Utilizado quando é necessário exibir apenas os dados essenciais do cliente, como em listas,
/// combos ou como objeto aninhado em outras respostas (ex.: dentro de OrdemResponse).
/// Não inclui a lista de ordens para manter o payload leve.
/// </remarks>
public class ClienteResume
{
    /// <summary>
    /// Identificador único do cliente. Mapeado da propriedade Id da entidade.
    /// </summary>
    [MapFrom("Id")]
    public long Id { get; set; }

    /// <summary>
    /// Nome completo do cliente. Mapeado da propriedade Nome da entidade.
    /// </summary>
    [MapFrom("Nome")]
    public string Nome { get; set; } = string.Empty;

    /// <summary>
    /// Endereço de e-mail do cliente. Opcional. Mapeado da propriedade Email da entidade.
    /// </summary>
    [MapFrom("Email")]
    public string? Email { get; set; }

    /// <summary>
    /// Data e hora em que o cliente foi cadastrado no sistema. Mapeado da propriedade DataCriacao da entidade.
    /// </summary>
    [MapFrom("DataCriacao")]
    public DateTime DataCriacao { get; set; }
}
