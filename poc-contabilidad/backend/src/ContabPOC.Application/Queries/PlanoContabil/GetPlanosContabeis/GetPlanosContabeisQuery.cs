using ContabPOC.Application.DTOs.PlanoContabilDto;
using FuncefEssenciais.Application.Queries;

namespace ContabPOC.Application.Queries.PlanoContabil.GetPlanosContabeis;

/// <summary>
/// Query para obter a lista de planos contábeis ativos
/// Migração de: uCtrlContaContabil.pas → ListPlanosContas (linha 121-152)
/// Delphi: SELECT PLANO, DESCPLANO, MASCARA FROM PLANO WHERE ATIVO = 'S' ORDER BY DESCPLANO
/// </summary>
public class GetPlanosContabeisQuery : IQuery<IEnumerable<PlanoContabilResponse>>
{
    /// <summary>
    /// Incluir planos inativos na listagem
    /// </summary>
    public bool IncluirInativos { get; set; } = false;
}
