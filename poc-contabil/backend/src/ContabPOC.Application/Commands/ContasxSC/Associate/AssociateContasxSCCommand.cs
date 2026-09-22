using FuncefEssenciais.Application.Commands;

namespace ContabPOC.Application.Commands.ContasxSC.Associate;

/// <summary>
/// Command para associar sub-contas a uma conta contábil
/// Migração de: FCadContasContabMT.pas → btnVaiUm2Click / btnVaiTodos2Click
///   Insere registro em CONTASXSUBC com: IDPESSOA, IDUSUARIO, PLANO, PLACONTA, CODSUBCONTA, NOMESUBCONTA
/// </summary>
public class AssociateContasxSCCommand : ICommand<bool>
{
    /// <summary>Plano contábil (Delphi: iPlano)</summary>
    public int Plano { get; init; }

    /// <summary>Código da conta contábil (Delphi: sConta)</summary>
    public string PlacConta { get; init; } = string.Empty;

    /// <summary>ID da empresa (Delphi: Sistema.IdEmpresa)</summary>
    public int IdEmpresa { get; init; }

    /// <summary>ID do usuário (Delphi: Sistema.IdUsuario)</summary>
    public int IdUsuario { get; init; }

    /// <summary>
    /// Lista de códigos de sub-conta a associar.
    /// Se vazia, associa todas as disponíveis (btnVaiTodos2Click).
    /// </summary>
    public List<int> CodSubContas { get; init; } = new();
}
