using ContabPOC.Application.DTOs.ParamContabDto;
using FuncefEssenciais.Application.Queries;

namespace ContabPOC.Application.Queries.ParamContab.GetParamContab;

/// <summary>
/// Query para obter os parâmetros contábeis de uma empresa
/// Migração de: uCtrlContab.pas → TCtrlContab:
///   SELECT PACMOEDAOFICIAL, PACMOEDAGERENCIAL, PACMOEDAGEREN1, PACMOEDAGEREN2
///   FROM PARAMCONTAB WHERE IDPESSOA = IdEmpresa
/// </summary>
public class GetParamContabQuery : IQuery<ParamContabResponse?>
{
    /// <summary>
    /// ID da empresa (Delphi: Sistema.IdEmpresa)
    /// </summary>
    public int IdEmpresa { get; init; }
}
