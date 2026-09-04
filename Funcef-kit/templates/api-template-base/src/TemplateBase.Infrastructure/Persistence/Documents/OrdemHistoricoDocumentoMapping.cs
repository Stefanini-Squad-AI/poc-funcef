// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
//
// O PADRAO que ele demonstra (mapeamento Bson na Infrastructure, POCO limpo na Application)
// e permanente — mantenha o padrao ao trocar o documento.
// ==============================================================================================
using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Bson.Serialization.IdGenerators;
using MongoDB.Bson.Serialization.Serializers;
using TemplateBase.Application.Documents;

namespace TemplateBase.Infrastructure.Persistence.Documents;

/// <summary>
/// Mapeamento MongoDB do <see cref="OrdemHistoricoDocumento"/>, declarado via <c>BsonClassMap</c>.
/// </summary>
/// <remarks>
/// <para>
/// <strong>Por que class map em vez de atributos <c>[Bson*]</c> no documento:</strong> os atributos
/// obrigariam a Application a referenciar o driver do MongoDB, colocando uma dependência de
/// infraestrutura na camada de aplicação. O documento é o modelo de leitura devolvido por
/// <c>GetOrdemHistoricoQuery</c> e precisa continuar na Application; o mapeamento é detalhe de
/// persistência e fica aqui. Efeito idêntico ao dos atributos originais:
/// </para>
/// <list type="bullet">
///   <item><description><c>Id</c> como <c>_id</c> com representação <c>ObjectId</c> — o driver gera o valor na inserção;</description></item>
///   <item><description>campos extras no documento são ignorados na desserialização, em vez de lançar.</description></item>
/// </list>
/// <para>
/// <strong>Idempotente</strong> (<see cref="BsonClassMap.IsClassMapRegistered"/>): pode ser chamado
/// mais de uma vez sem lançar — cenário real em testes, que constroem vários containers no mesmo
/// processo.
/// </para>
/// </remarks>
public static class OrdemHistoricoDocumentoMapping
{
    /// <summary>
    /// Registra o class map do documento. Deve ser chamado <strong>antes</strong> do primeiro uso do
    /// tipo pelo driver — o serializador é construído uma única vez e cacheado.
    /// </summary>
    public static void Register()
    {
        if (BsonClassMap.IsClassMapRegistered(typeof(OrdemHistoricoDocumento)))
        {
            return;
        }

        BsonClassMap.RegisterClassMap<OrdemHistoricoDocumento>(map =>
        {
            map.AutoMap();
            map.SetIgnoreExtraElements(true);

            // O gerador é explícito de propósito: a convenção que o atribuiria automaticamente roda
            // dentro do AutoMap(), ANTES de o serializador ObjectId ser aplicado — sem esta linha o
            // Id ficaria nulo na inserção em vez de receber o ObjectId gerado pelo driver.
            map.MapIdMember(documento => documento.Id)
                .SetSerializer(new StringSerializer(BsonType.ObjectId))
                .SetIdGenerator(StringObjectIdGenerator.Instance);
        });
    }
}
