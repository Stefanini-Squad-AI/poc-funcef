using ContabPOC.Application.DTOs.ContaContabilDto;
using FuncefEssenciais.Application.Commands;

namespace ContabPOC.Application.Commands.ContaContabil.Create;

public class CreateContaContabilCommand : ICommand<ContaContabilResponse>
{
    public ContaContabilRequest Request { get; set; } = new();

    /// <summary>
    /// ID da empresa (Delphi: Sistema.IdEmpresa).
    /// Usado para auto-gerar PLAREDUZ via PARAMCONTAB.PACREDUZ{GRUPO}.
    /// Default: 1 (empresa padrão do POC).
    /// </summary>
    public int IdEmpresa { get; set; } = 1;
}
