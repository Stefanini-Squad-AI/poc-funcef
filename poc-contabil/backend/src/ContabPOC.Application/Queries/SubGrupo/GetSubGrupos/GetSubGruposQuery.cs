using ContabPOC.Application.DTOs.SubGrupoDto;
using FuncefEssenciais.Application.Queries;

namespace ContabPOC.Application.Queries.SubGrupo.GetSubGrupos;

/// <summary>
/// Query para obter a lista de sub-grupos
/// Migração de: FCadContasContabMT.pas → CdsSubGrupo
///   dblkSubGrupo1..4 (TwwDBLookupCombo) → LookupTable = CdsSubGrupo
/// Delphi: SELECT CODSUBGRP, DESCSUBGRP FROM SUBGRUPO ORDER BY 2
/// </summary>
public class GetSubGruposQuery : IQuery<IEnumerable<SubGrupoResponse>>
{
}
