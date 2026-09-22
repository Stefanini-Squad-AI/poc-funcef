using ContabPOC.Application.DTOs.RateioPlanoPatroDto;
using FuncefEssenciais.Application.Queries;

namespace ContabPOC.Application.Queries.RateioPlanoPatro.GetRateiosPlanoPatro;

/// <summary>
/// Query para obter a lista de rateios administrativos por plano/patrocinadora
/// Migração de: FCadContasContabMT.pas → cdsRateioPlanoPatro.Data := CtrlProcessaTotalPrev.ListaRatAdm
/// Delphi: SELECT IDRATADMPLANPATRO, DESCRICAO FROM RATADMPLANPATRO WHERE ATIVO = 'S' ORDER BY DESCRICAO
/// </summary>
public class GetRateiosPlanoPatroQuery : IQuery<IEnumerable<RateioPlanoPatroResponse>>
{
    /// <summary>
    /// Incluir rateios inativos na listagem
    /// </summary>
    public bool IncluirInativos { get; set; } = false;
}
