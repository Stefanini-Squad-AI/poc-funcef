using ContabPOC.Application.DTOs.MoedaDto;
using FuncefEssenciais.Application.Queries;

namespace ContabPOC.Application.Queries.Moeda.GetMoedas;

/// <summary>
/// Query para obter a lista de moedas
/// Migração de: FCadContasContabMT.pas → CdsMoeda
///   dblkMoeda (TwwDBLookupCombo) → LookupTable = CdsMoeda
/// Delphi: SELECT MOECODIGO, MOEDESC, MOESIGLA FROM MOEDA ORDER BY 2
/// </summary>
public class GetMoedasQuery : IQuery<IEnumerable<MoedaResponse>>
{
}
