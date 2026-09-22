using ContabPOC.Application.DTOs.ProgramaDto;
using FuncefEssenciais.Application.Queries;

namespace ContabPOC.Application.Queries.Programa.GetProgramas;

/// <summary>
/// Query para obter a lista de programas do critério
/// Migração de: FCadContasContabMT.pas linha 452-453:
///   SqlPrograma.Prepare; SqlPrograma.Open;
/// Delphi: SELECT IDPROGRAMA, DESCPROGRAMA FROM PROGRAMA ORDER BY 2
/// </summary>
public class GetProgramasQuery : IQuery<IEnumerable<ProgramaResponse>>
{
}
