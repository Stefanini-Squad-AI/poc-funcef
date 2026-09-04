// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Queries;
using TemplateBase.Application.Documents;

namespace TemplateBase.Application.Queries.Ordem.GetHistorico;

/// <summary>
/// Query para obtenção do histórico de status de uma ordem (MongoDB via FUNCEF.NoSql).
/// </summary>
public class GetOrdemHistoricoQuery : IQuery<List<OrdemHistoricoDocumento>>
{
    public long OrdemId { get; set; }
}
