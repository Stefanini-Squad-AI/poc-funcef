using FuncefEssenciais.Application.Commands;

namespace ContabPOC.Application.Commands.ContasxCC.Disassociate;

/// <summary>
/// Command para desassociar um centro de custo de uma conta contábil
/// Migração de: FCadContasContabMT.pas → btnVoltaUmClick / btnVoltaTodosClick
///   Remove registro de CONTASXCC
/// </summary>
public class DisassociateContasxCCCommand : ICommand<bool>
{
    /// <summary>Plano contábil (Delphi: iPlano)</summary>
    public int Plano { get; init; }

    /// <summary>Código da conta contábil (Delphi: sConta)</summary>
    public string PlacConta { get; init; } = string.Empty;

    /// <summary>ID da empresa (Delphi: Sistema.IdEmpresa)</summary>
    public int IdEmpresa { get; init; }

    /// <summary>
    /// Lista de códigos de centro de custo a desassociar.
    /// Se vazia, desassocia todos (btnVoltaTodosClick).
    /// </summary>
    public List<string> CodCentrosCusto { get; init; } = new();
}
