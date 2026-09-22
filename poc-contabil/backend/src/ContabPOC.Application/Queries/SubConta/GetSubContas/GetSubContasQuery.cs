using ContabPOC.Application.DTOs.SubContaDto;
using FuncefEssenciais.Application.Queries;

namespace ContabPOC.Application.Queries.SubConta.GetSubContas;

/// <summary>
/// Query para listar sub-contas disponíveis (não associadas à conta)
/// Migração de: FCadContasContabMT.pas → CdsSubConta (grid esquerdo)
///   ListSubContaCadContas: SELECT CODSUBCONTA, NOMESUBCONTA FROM SUBCONTA
///     WHERE IDPESSOA = :emp AND ATIVO = 'S'
///       AND NOT EXISTS (SELECT CODSUBCONTA FROM CONTASXSUBC WHERE ...)
/// </summary>
public class GetSubContasQuery : IQuery<IEnumerable<SubContaResponse>>
{
    /// <summary>ID da empresa (Delphi: Sistema.IdEmpresa)</summary>
    public int IdEmpresa { get; init; }

    /// <summary>Plano contábil (Delphi: iPlano)</summary>
    public int Plano { get; init; }

    /// <summary>Código da conta contábil (Delphi: sConta)</summary>
    public string PlacConta { get; init; } = string.Empty;
}
