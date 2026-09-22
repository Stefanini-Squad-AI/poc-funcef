using ContabPOC.Application.DTOs.ContasxCCDto;
using FuncefEssenciais.Application.Queries;

namespace ContabPOC.Application.Queries.ContasxCC.GetContasxCC;

/// <summary>
/// Query para obter a lista de centros de custo já associados a uma conta
/// Migração de: FCadContasContabMT.pas → CdsContasxCC
///   ListContasxCC (uCtrlContaContabil.pas líneas 466-517):
///     SELECT C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC, CC.PLANO, CC.IDEMPRESA,
///            CC.PLACONTA, CC.IDUSUARIOINCLUSAO, C.CODEXTERNO
///     FROM CENTCUST C, CONTASXCC CC
///     WHERE CC.PLANO = :plano AND RTRIM(CC.PLACONTA) = :conta AND CC.IDEMPRESA = :emp
///       AND CC.CODCENTROCUSTO = C.CODCENTROCUSTO AND CC.IDEMPRESA = C.IDPESSOA
///       AND ((C.ATIVO = 'S') OR (C.ATIVO IS NULL))
/// </summary>
public class GetContasxCCQuery : IQuery<IEnumerable<ContasxCCResponse>>
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
