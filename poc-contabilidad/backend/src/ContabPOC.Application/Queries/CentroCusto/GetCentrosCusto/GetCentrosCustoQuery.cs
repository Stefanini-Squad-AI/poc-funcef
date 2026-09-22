using ContabPOC.Application.DTOs.CentroCustoDto;
using FuncefEssenciais.Application.Queries;

namespace ContabPOC.Application.Queries.CentroCusto.GetCentrosCusto;

/// <summary>
/// Query para obter a lista de centros de custo disponíveis (não associados)
/// Migração de: FCadContasContabMT.pas → CdsCCusto
///   ListCCustoCadContas: SELECT C.CODEXTERNO, C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC
///   FROM CENTCUST C
///   WHERE C.IDEMPRESA = :emp AND NOT EXISTS (SELECT CC.CODCENTROCUSTO FROM CONTASXCC CC WHERE ...)
///   AND (C.ATIVO = 'S') ORDER BY CODEXTERNO
/// </summary>
public class GetCentrosCustoQuery : IQuery<IEnumerable<CentroCustoResponse>>
{
    /// <summary>
    /// ID da empresa (Delphi: Sistema.IdEmpresa)
    /// </summary>
    public int IdEmpresa { get; init; }

    /// <summary>
    /// Plano contábil (Delphi: iPlano)
    /// </summary>
    public int Plano { get; init; }

    /// <summary>
    /// Código da conta contábil (Delphi: sConta)
    /// </summary>
    public string PlacConta { get; init; } = string.Empty;
}
