// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
namespace TemplateBase.Application.Documents;

/// <summary>
/// Documento com o histórico de mudanças de status de uma ordem. Também é o modelo de leitura
/// devolvido por <c>GetOrdemHistoricoQuery</c> — por isso vive na Application.
/// </summary>
/// <remarks>
/// <para>
/// Persistido na coleção <c>ordens_historico</c> do banco configurado em
/// <c>NoSql:MongoDocuments</c> (container Docker local em desenvolvimento).
/// O histórico é um caso natural de documento: gravação append-only, leitura por
/// <c>OrdemId</c>, sem participação nas transações relacionais.
/// </para>
/// <para>
/// <strong>Sem atributos <c>[Bson*]</c> aqui, de propósito:</strong> o mapeamento para o MongoDB
/// (nome de <c>_id</c>, representação <c>ObjectId</c>, tolerância a campos extras) é declarado na
/// Infrastructure por <c>OrdemHistoricoDocumentoMapping</c> via <c>BsonClassMap</c>. Assim a
/// Application permanece um POCO livre do driver do Mongo — nenhum
/// <c>PackageReference</c> de infraestrutura NoSQL nesta camada.
/// </para>
/// </remarks>
public sealed class OrdemHistoricoDocumento
{
    /// <summary>
    /// Identificador do documento (ObjectId gerado pelo MongoDB na inserção).
    /// </summary>
    public string? Id { get; set; }

    /// <summary>
    /// Identificador da ordem (ORDEM_ID no Oracle) a que o evento se refere.
    /// </summary>
    public long OrdemId { get; set; }

    /// <summary>
    /// Status anterior da ordem; nulo no evento de criação.
    /// </summary>
    public string? StatusAnterior { get; set; }

    /// <summary>
    /// Status vigente após o evento.
    /// </summary>
    public string StatusNovo { get; set; } = string.Empty;

    /// <summary>
    /// Momento em que o evento ocorreu (UTC).
    /// </summary>
    public DateTime DataEvento { get; set; } = DateTime.UtcNow;
}
