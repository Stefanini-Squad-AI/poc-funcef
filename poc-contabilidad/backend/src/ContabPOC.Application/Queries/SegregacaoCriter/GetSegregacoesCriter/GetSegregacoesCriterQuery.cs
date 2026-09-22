using ContabPOC.Application.DTOs.SegregacaoCriterDto;
using FuncefEssenciais.Application.Queries;

namespace ContabPOC.Application.Queries.SegregacaoCriter.GetSegregacoesCriter;

/// <summary>
/// Query para obter a lista de critérios de segregação de recursos
/// Migração de: FCadContasContabMT.pas linha 379:
///   cdsSegregaCriter.Data := CtrlSegregacao.ListaSegregaCriter;
/// Delphi: SELECT IDSEGREGACRITER, DESCRICAO FROM SEGREGACRITER ORDER BY DESCRICAO
/// </summary>
public class GetSegregacoesCriterQuery : IQuery<IEnumerable<SegregacaoCriterResponse>>
{
}
