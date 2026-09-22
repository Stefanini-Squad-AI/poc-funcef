namespace ContabPOC.Application.DTOs.ParamContabDto;

/// <summary>
/// DTO de resposta para Parâmetros Contábeis por Empresa
/// Migração de: uCtrlContab.pas → TCtrlContab (PARAMCONTAB)
/// Tabela: PARAMCONTAB WHERE IDPESSOA = IdEmpresa
/// Colunas: PACMOEDAOFICIAL, PACMOEDAGERENCIAL, PACMOEDAGEREN1, PACMOEDAGEREN2
/// </summary>
public record ParamContabResponse
{
    /// <summary>
    /// ID da empresa/pessoa (Delphi: IDPESSOA = Sistema.IdEmpresa)
    /// </summary>
    public int IdPessoa { get; init; }

    /// <summary>
    /// ID da Moeda Oficial (0 = desabilita combo). Delphi: CtrlContab.MoedaOficial → PACMOEDAOFICIAL
    /// </summary>
    public int MoedaOficial { get; init; }

    /// <summary>
    /// ID da Moeda Gerencial 1 (0 = desabilita combo). Delphi: CtrlContab.MoedaGerencial → PACMOEDAGERENCIAL
    /// </summary>
    public int MoedaGerencial { get; init; }

    /// <summary>
    /// ID da Moeda Gerencial 2 (0 = desabilita combo). Delphi: CtrlContab.MoedaGeren1 → PACMOEDAGEREN1
    /// </summary>
    public int MoedaGeren1 { get; init; }

    /// <summary>
    /// ID da Moeda Gerencial 3 (0 = desabilita combo). Delphi: CtrlContab.MoedaGeren2 → PACMOEDAGEREN2
    /// </summary>
    public int MoedaGeren2 { get; init; }

    // ===== Contadores de PLAREDUZ por grupo (legacy: uDbParamcontab.pas) =====
    /// <summary>Último PLAREDUZ grupo A (Ativo). Próximo = +1</summary>
    public int PacReduzA { get; init; }

    /// <summary>Último PLAREDUZ grupo P (Passivo). Próximo = +1</summary>
    public int PacReduzP { get; init; }

    /// <summary>Último PLAREDUZ grupo R (Receita). Próximo = +1</summary>
    public int PacReduzR { get; init; }

    /// <summary>Último PLAREDUZ grupo D (Despesa). Próximo = +1</summary>
    public int PacReduzD { get; init; }

    /// <summary>Último PLAREDUZ grupo C (Custo). Próximo = +1</summary>
    public int PacReduzC { get; init; }

    /// <summary>Último PLAREDUZ grupo E (Estatística). Próximo = +1</summary>
    public int PacReduzE { get; init; }

    /// <summary>Último PLAREDUZ grupo O (Outros). Próximo = +1</summary>
    public int PacReduzO { get; init; }
}
