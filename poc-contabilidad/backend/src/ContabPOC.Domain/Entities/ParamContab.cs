using FuncefORM.Audit.Attributes;

namespace ContabPOC.Domain.Entities;

/// <summary>
/// Entidade Parâmetros Contábeis por Empresa
/// Migração de: uDbParamcontab.pas / uCtrlContab.pas
/// Tabela Oracle: PARAMCONTAB
///   IDPESSOA            → IdPessoa (PK, ID da empresa)
///   PACMOEDAOFICIAL     → MoedaOficial (0 = desabilita combo dbcmbTipOfi)
///   PACMOEDAGERENCIAL   → MoedaGerencial (0 = desabilita combo dbcmbTipGer)
///   PACMOEDAGEREN1      → MoedaGeren1 (0 = desabilita combo dbcmbTipGer2)
///   PACMOEDAGEREN2      → MoedaGeren2 (0 = desabilita combo dbcmbTipGer3)
///
/// En el legacy, FCadContasContabMT.pas FormShow (líneas 740-762) usa CtrlContab
/// (TCtrlContab) que lee de PARAMCONTAB, NO de PARAMGLOBAL.
/// </summary>
[Auditable]
public class ParamContab
{
    /// <summary>
    /// ID da empresa/pessoa (PK)
    /// Delphi: IDPESSOA (= Sistema.IdEmpresa)
    /// </summary>
    public int IdPessoa { get; set; }

    /// <summary>
    /// ID da Moeda Oficial (0 = desabilita combo dbcmbTipOfi)
    /// Delphi: CtrlContab.MoedaOficial → PACMOEDAOFICIAL
    /// </summary>
    public int MoedaOficial { get; set; } = 0;

    /// <summary>
    /// ID da Moeda Gerencial 1 (0 = desabilita combo dbcmbTipGer)
    /// Delphi: CtrlContab.MoedaGerencial → PACMOEDAGERENCIAL
    /// </summary>
    public int MoedaGerencial { get; set; } = 0;

    /// <summary>
    /// ID da Moeda Gerencial 2 (0 = desabilita combo dbcmbTipGer2)
    /// Delphi: CtrlContab.MoedaGeren1 → PACMOEDAGEREN1
    /// </summary>
    public int MoedaGeren1 { get; set; } = 0;

    /// <summary>
    /// ID da Moeda Gerencial 3 (0 = desabilita combo dbcmbTipGer3)
    /// Delphi: CtrlContab.MoedaGeren2 → PACMOEDAGEREN2
    /// </summary>
    public int MoedaGeren2 { get; set; } = 0;

    // ===== Contadores de PLAREDUZ por grupo (legacy: uDbParamcontab.pas) =====
    // Próximo PLAREDUZ = PACREDUZ{GRUPO} + 1
    // Atualizado após cada nova conta criada (uCtrlPlanoConta.pas linhas 367-375)

    /// <summary>
    /// Último PLAREDUZ usado para grupo A (Ativo). Delphi: PACREDUZA
    /// </summary>
    public int PacReduzA { get; set; } = 0;

    /// <summary>
    /// Último PLAREDUZ usado para grupo P (Passivo). Delphi: PACREDUZP
    /// </summary>
    public int PacReduzP { get; set; } = 0;

    /// <summary>
    /// Último PLAREDUZ usado para grupo R (Receita). Delphi: PACREDUZR
    /// </summary>
    public int PacReduzR { get; set; } = 0;

    /// <summary>
    /// Último PLAREDUZ usado para grupo D (Despesa). Delphi: PACREDUZD
    /// </summary>
    public int PacReduzD { get; set; } = 0;

    /// <summary>
    /// Último PLAREDUZ usado para grupo C (Custo). Delphi: PACREDUZC
    /// </summary>
    public int PacReduzC { get; set; } = 0;

    /// <summary>
    /// Último PLAREDUZ usado para grupo E (Estatística). Delphi: PACREDUZE
    /// </summary>
    public int PacReduzE { get; set; } = 0;

    /// <summary>
    /// Último PLAREDUZ usado para grupo O (Outros). Delphi: PACREDUZO
    /// </summary>
    public int PacReduzO { get; set; } = 0;
}
