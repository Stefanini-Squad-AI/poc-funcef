using FuncefEssenciais.Application.Commands;

namespace ContabPOC.Application.Commands.ContasxSC.Disassociate;

/// <summary>
/// Command para desassociar sub-contas de uma conta contábil
/// Migração de: FCadContasContabMT.pas → btnVoltaUm2Click / btnVoltaTodos2Click
///   Remove registro de CONTASXSUBC
/// </summary>
public class DisassociateContasxSCCommand : ICommand<bool>
{
    /// <summary>Plano contábil (Delphi: iPlano)</summary>
    public int Plano { get; init; }

    /// <summary>Código da conta contábil (Delphi: sConta)</summary>
    public string PlacConta { get; init; } = string.Empty;

    /// <summary>ID da empresa (Delphi: Sistema.IdEmpresa)</summary>
    public int IdEmpresa { get; init; }

    /// <summary>
    /// Lista de códigos de sub-conta a desassociar.
    /// Se vazia, desassocia todas (btnVoltaTodos2Click).
    /// </summary>
    public List<int> CodSubContas { get; init; } = new();
}
