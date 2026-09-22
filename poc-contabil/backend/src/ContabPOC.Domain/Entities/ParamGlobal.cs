using FuncefORM.Audit.Attributes;

namespace ContabPOC.Domain.Entities;

/// <summary>
/// Entidade Parâmetros Globais por Empresa
/// Migração de: uDbParamGlobal.pas / uCtrlParamIntegra.pas
/// Tabela Oracle: PARAMGLOBAL
///   IDPESSOA          → IdPessoa (PK, ID da empresa)
///   FLGSEGREGAVIRTUAL → SegregaVirtual (S/N)
///   FLGSEGREGAORADM   → SegregaOrAdm (S/N)
///   FLGSEGREGAORCOMUM → SegregaOrComum (S/N)
///   IDPLANOPREVADM    → IdPlanoPrevAdm
///   IDPATRO           → IdPatro
///   IDPLANOPREV       → IdPlanoPrev
///   FLGOBRIGACC       → ObrigaCC (S/N)
///   IDPLANCENTCUST    → IdPlanCentCust
///   IDPLANCRESPON     → IdPlanCRespon
/// </summary>
[Auditable]
public class ParamGlobal
{
    /// <summary>
    /// ID da empresa/pessoa (PK)
    /// Delphi: IDPESSOA (= Sistema.IdEmpresa)
    /// </summary>
    public int IdPessoa { get; set; }

    /// <summary>
    /// S=Segregação Virtual (novo), N=Rateio (antigo)
    /// Delphi: FLGSEGREGAVIRTUAL
    /// </summary>
    public string SegregaVirtual { get; set; } = "N";

    /// <summary>
    /// S=Segrega OR Administrativo
    /// Delphi: FLGSEGREGAORADM
    /// </summary>
    public string SegregaOrAdm { get; set; } = "N";

    /// <summary>
    /// S=Segrega OR Comum
    /// Delphi: FLGSEGREGAORCOMUM
    /// </summary>
    public string SegregaOrComum { get; set; } = "N";

    /// <summary>
    /// ID do plano prev. administrativo
    /// Delphi: IDPLANOPREVADM
    /// </summary>
    public int? IdPlanoPrevAdm { get; set; }

    /// <summary>
    /// ID da patrocinadora global
    /// Delphi: IDPATRO
    /// </summary>
    public int? IdPatro { get; set; }

    /// <summary>
    /// ID do plano prev. global
    /// Delphi: IDPLANOPREV
    /// </summary>
    public int? IdPlanoPrev { get; set; }

    /// <summary>
    /// S=Obriga centro de custo
    /// Delphi: FLGOBRIGACC
    /// </summary>
    public string ObrigaCC { get; set; } = "N";

    /// <summary>
    /// ID do plano de centro de custo
    /// Delphi: IDPLANCENTCUST
    /// </summary>
    public int? IdPlanCentCust { get; set; }

    /// <summary>
    /// ID do plano de centro de responsabilidade
    /// Delphi: IDPLANCRESPON
    /// </summary>
    public int? IdPlanCRespon { get; set; }
}
