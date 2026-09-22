using ContabPOC.Application.DTOs.ParamGlobalDto;
using FuncefEssenciais.Application.Queries;

namespace ContabPOC.Application.Queries.ParamGlobal.GetParamGlobal;

/// <summary>
/// Query para obter os parâmetros globais de uma empresa
/// Migração de: uCtrlParamIntegra.pas → GetParams(IdEmpresa):
///   SELECT * FROM PARAMGLOBAL WHERE IDPESSOA = IdEmpresa
/// </summary>
public class GetParamGlobalQuery : IQuery<ParamGlobalResponse?>
{
    /// <summary>
    /// ID da empresa (Delphi: Sistema.IdEmpresa)
    /// </summary>
    public int IdEmpresa { get; init; }
}
