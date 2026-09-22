using FuncefEssenciais.Application.Commands;

namespace ContabPOC.Application.Commands.ContasxCC.Associate;

/// <summary>
/// Command para associar um centro de custo a uma conta contábil
/// Migração de: FCadContasContabMT.pas → btnVaiUmClick / btnVaiTodosClick
///   Insere registro em CONTASXCC com: PLANO, PLACONTA, CODCENTROCUSTO, IDEMPRESA, IDUSUARIOINCLUSAO
/// </summary>
public class AssociateContasxCCCommand : ICommand<bool>
{
    /// <summary>Plano contábil (Delphi: iPlano)</summary>
    public int Plano { get; init; }

    /// <summary>Código da conta contábil (Delphi: sConta)</summary>
    public string PlacConta { get; init; } = string.Empty;

    /// <summary>ID da empresa (Delphi: Sistema.IdEmpresa)</summary>
    public int IdEmpresa { get; init; }

    /// <summary>ID do usuário (Delphi: Sistema.IdUsuario)</summary>
    public int IdUsuarioInclusao { get; init; }

    /// <summary>
    /// Lista de códigos de centro de custo a associar.
    /// Se vazia, associa todos os disponíveis (btnVaiTodosClick).
    /// </summary>
    public List<string> CodCentrosCusto { get; init; } = new();
}
