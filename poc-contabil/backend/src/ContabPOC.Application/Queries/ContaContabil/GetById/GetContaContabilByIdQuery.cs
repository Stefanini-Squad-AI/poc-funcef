using ContabPOC.Application.DTOs.ContaContabilDto;
using FuncefEssenciais.Application.Queries;

namespace ContabPOC.Application.Queries.ContaContabil.GetById;

/// <summary>
/// Query para obter uma conta contábil específica por PK
/// Migração de: FCadContasContabMT.pas → CmeCadastroFind (linha 846)
///   Cds.Data := CtrlPlanoConta.ListCdsPlanoContas(plano, conta);
/// </summary>
public class GetContaContabilByIdQuery : IQuery<ContaContabilResponse?>
{
    public int Plano { get; init; }
    public string Codigo { get; init; } = string.Empty;
}
