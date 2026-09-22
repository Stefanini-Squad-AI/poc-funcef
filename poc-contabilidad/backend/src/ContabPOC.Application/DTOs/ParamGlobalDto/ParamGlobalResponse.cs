namespace ContabPOC.Application.DTOs.ParamGlobalDto;

/// <summary>
/// DTO de resposta para Parâmetros Globais por Empresa
/// Migração de: uCtrlParamIntegra.pas → GetParams(IdEmpresa)
/// Tabela: PARAMGLOBAL WHERE IDPESSOA = IdEmpresa
/// </summary>
public record ParamGlobalResponse
{
    /// <summary>
    /// ID da empresa/pessoa (Delphi: IDPESSOA = Sistema.IdEmpresa)
    /// </summary>
    public int IdPessoa { get; init; }

    /// <summary>
    /// S=Segregação Virtual (novo), N=Rateio (antigo)
    /// Delphi: FLGSEGREGAVIRTUAL
    /// </summary>
    public bool SegregaVirtual { get; init; }

    /// <summary>
    /// S=Segrega OR Administrativo (Delphi: FLGSEGREGAORADM)
    /// </summary>
    public bool SegregaOrAdm { get; init; }

    /// <summary>
    /// S=Segrega OR Comum (Delphi: FLGSEGREGAORCOMUM)
    /// </summary>
    public bool SegregaOrComum { get; init; }

    /// <summary>
    /// ID do plano prev. administrativo (Delphi: IDPLANOPREVADM)
    /// </summary>
    public int? IdPlanoPrevAdm { get; init; }

    /// <summary>
    /// ID da patrocinadora global (Delphi: IDPATRO)
    /// </summary>
    public int? IdPatro { get; init; }

    /// <summary>
    /// ID do plano prev. global (Delphi: IDPLANOPREV)
    /// </summary>
    public int? IdPlanoPrev { get; init; }

    /// <summary>
    /// S=Obriga centro de custo (Delphi: FLGOBRIGACC)
    /// </summary>
    public bool ObrigaCC { get; init; }
}
