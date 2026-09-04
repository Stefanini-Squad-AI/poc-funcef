using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using TemplateBase.Application.Documents;
using TemplateBase.Infrastructure.Persistence.Documents;

namespace TemplateBase.Tests.Infrastructure;

/// <summary>
/// Verifica o mapeamento MongoDB do <see cref="OrdemHistoricoDocumento"/>.
/// </summary>
/// <remarks>
/// <para>
/// O documento vive na Application como POCO, <strong>sem</strong> atributos <c>[Bson*]</c> — o
/// mapeamento é declarado na Infrastructure por <c>OrdemHistoricoDocumentoMapping</c> via
/// <c>BsonClassMap</c>. Estes testes garantem que o class map produz o mesmo resultado que os
/// atributos produziam: sem eles, a troca seria uma quebra silenciosa, detectada só em runtime contra
/// um MongoDB real.
/// </para>
/// <para>
/// O class map é registrado pelo <c>TestAssemblySetup</c> (uma vez por processo, como em produção:
/// antes do primeiro uso do tipo pelo driver).
/// </para>
/// </remarks>
[TestClass]
public class OrdemHistoricoDocumentoMappingTests
{
    [TestMethod]
    public void ClassMap_DeveEstarRegistrado()
    {
        Assert.IsTrue(BsonClassMap.IsClassMapRegistered(typeof(OrdemHistoricoDocumento)),
            "O class map deve ser registrado antes do primeiro uso do tipo pelo driver.");
    }

    [TestMethod]
    public void Id_DeveSerMapeadoComo_Underscore_Id()
    {
        var classMap = BsonClassMap.LookupClassMap(typeof(OrdemHistoricoDocumento));

        Assert.IsNotNull(classMap.IdMemberMap, "O membro Id deve ser o identificador do documento.");
        Assert.AreEqual("_id", classMap.IdMemberMap.ElementName);
    }

    [TestMethod]
    public void Id_DeveTerGeradorDeObjectId()
    {
        var classMap = BsonClassMap.LookupClassMap(typeof(OrdemHistoricoDocumento));

        // Sem gerador, o Id ficaria nulo na inserção em vez de receber o ObjectId do driver — era o
        // comportamento que o atributo [BsonRepresentation(ObjectId)] garantia por convenção.
        Assert.IsNotNull(classMap.IdMemberMap!.IdGenerator,
            "O Id deve ter um gerador de ObjectId associado.");
    }

    [TestMethod]
    public void Serializacao_DeveGravarIdComoObjectId()
    {
        var documento = new OrdemHistoricoDocumento
        {
            Id = ObjectId.GenerateNewId().ToString(),
            OrdemId = 42L,
            StatusAnterior = "PENDENTE",
            StatusNovo = "APROVADA",
            DataEvento = new DateTime(2026, 7, 30, 12, 0, 0, DateTimeKind.Utc)
        };

        var bson = documento.ToBsonDocument();

        Assert.AreEqual(BsonType.ObjectId, bson["_id"].BsonType,
            "O Id deve ser serializado como ObjectId, não como string.");
        Assert.AreEqual(42L, bson["OrdemId"].AsInt64);
        Assert.AreEqual("APROVADA", bson["StatusNovo"].AsString);
    }

    [TestMethod]
    public void Desserializacao_DeveIgnorarCamposExtras()
    {
        var bson = new BsonDocument
        {
            ["_id"] = ObjectId.GenerateNewId(),
            ["OrdemId"] = 7L,
            ["StatusNovo"] = "CANCELADA",
            ["DataEvento"] = new DateTime(2026, 7, 30, 12, 0, 0, DateTimeKind.Utc),
            // Campo que não existe no POCO: com IgnoreExtraElements a desserialização segue; sem ele,
            // documentos gravados por uma versão anterior do schema derrubariam a leitura.
            ["CampoQueNaoExisteNoPoco"] = "valor"
        };

        var documento = BsonSerializer.Deserialize<OrdemHistoricoDocumento>(bson);

        Assert.AreEqual(7L, documento.OrdemId);
        Assert.AreEqual("CANCELADA", documento.StatusNovo);
        Assert.IsNull(documento.StatusAnterior);
    }

    [TestMethod]
    public void Registro_DeveSerIdempotente()
    {
        // Cenário real: vários containers construídos no mesmo processo (testes) ou a extensão chamada
        // mais de uma vez. Uma segunda chamada não pode lançar "class map already registered".
        OrdemHistoricoDocumentoMapping.Register();
        OrdemHistoricoDocumentoMapping.Register();

        Assert.IsTrue(BsonClassMap.IsClassMapRegistered(typeof(OrdemHistoricoDocumento)));
    }
}
