using ContabPOC.Application.DTOs.ContasxSCDto;
using FuncefEssenciais.Application.Queries;

namespace ContabPOC.Application.Queries.ContasxSC.GetContasxSC;

/// <summary>
/// Query para listar sub-contas já associadas a uma conta contábil
/// Migração de: FCadContasContabMT.pas → CdsContasxSC (grid direito)
///   ListContasxSC: SELECT ... FROM CONTASXSUBC WHERE PLANO = :plano AND PLACONTA = :conta AND IDPESSOA = :emp
/// </summary>
public class GetContasxSCQuery : IQuery<IEnumerable<ContasxSCResponse>>
{
    /// <summary>ID da empresa (Delphi: Sistema.IdEmpresa)</summary>
    public int IdEmpresa { get; init; }

    /// <summary>Plano contábil (Delphi: iPlano)</summary>
    public int Plano { get; init; }

    /// <summary>Código da conta contábil (Delphi: sConta)</summary>
    public string PlacConta { get; init; } = string.Empty;
}
