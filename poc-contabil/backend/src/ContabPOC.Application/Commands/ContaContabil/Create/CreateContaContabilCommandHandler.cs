using System.Linq;
using ContabPOC.Application.DTOs.ContaContabilDto;
using ContabPOC.Domain.Entities;
using FuncefEssenciais.Application.Commands;
using FuncefORM.Contracts;
using ContaContabilEntity = ContabPOC.Domain.Entities.ContaContabil;

namespace ContabPOC.Application.Commands.ContaContabil.Create;

/// <summary>
/// Handler para processar o comando de criação de conta contábil
/// Migração de: FCadContasContabMT.pas → CmeCadastroApplyInsert (linha 1386)
///   accept := CtrlPlanoConta.Gravar;
/// </summary>
public class CreateContaContabilCommandHandler : ICommandHandler<CreateContaContabilCommand, ContaContabilResponse>
{
    private readonly IUnitOfWork _unitOfWork;

    public CreateContaContabilCommandHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<ContaContabilResponse> Handle(
        CreateContaContabilCommand command,
        CancellationToken cancellationToken)
    {
        var request = command.Request;
        var repository = _unitOfWork.GetRepository<ContaContabilEntity>();

        // Verificar se a conta já existe
        // Delphi: dbeCodigoExit → CtrlPlanoConta.ContaExiste
        var existe = await repository.ExistsAsync(
            c => c.Plano == request.Plano && c.Codigo == request.Codigo,
            false,
            cancellationToken);

        if (existe)
        {
            throw new InvalidOperationException("Conta já cadastrada.");
        }

        // Regra: Se a conta tem pai (nível > 1), validar:
        //   (a) O pai deve existir (Delphi: dbeCodigoExit líneas 541-546)
        //   (b) O pai deve ser Sintético (Delphi: dbeCodigoExit líneas 549-555)
        //   (c) Se o pai tem Grupo='E' (Estatística), a conta filha também deve ter Grupo='E'
        //       (Delphi: dbeCodigoExit líneas 600-607)
        if (request.Nivel > 1)
        {
            var codigoPai = ExtrairCodigoPai(request.Codigo);
            if (!string.IsNullOrEmpty(codigoPai))
            {
                var contasPai = await repository.FindAsync(
                    c => c.Plano == request.Plano && c.Codigo == codigoPai,
                    false,
                    cancellationToken);

                var contaPai = contasPai.FirstOrDefault();
                if (contaPai == null)
                {
                    throw new InvalidOperationException(
                        $"Conta pai '{codigoPai}' não existe no plano {request.Plano}.");
                }
                if (contaPai.Tipo == "A")
                {
                    throw new InvalidOperationException(
                        $"Conta pai '{codigoPai}' é Analítica. Deve ser Sintética.");
                }
                if (contaPai.Grupo == "E" && request.Grupo != "E")
                {
                    throw new InvalidOperationException(
                        "Conta pai é Estatística (Grupo E). A conta filha também deve ser Estatística.");
                }
            }
        }

        // SEMPRE auto-gerar PLAREDUZ no backend (fonte de verdade).
        // Migração de: uCtrlPlanoContaPer.pas → CriaCodReduz (linhas 840-921)
        //   O backend lê PARAMCONTAB.PACREDUZ{GRUPO} + 1 e incrementa imediatamente.
        //
        // O frontend pré-calcula o valor para UX (mostrar no campo antes de salvar),
        // mas o backend é a fonte de verdade — ignora o valor do frontend e sempre
        // gera a partir do contador PARAMCONTAB. Isso evita race conditions e
        // colisões com contas seed (PLAREDUZ=1,2,3,4,5).
        var idEmpresa = command.IdEmpresa;

        var paramRepository = _unitOfWork.GetRepository<ParamContab>();
        var paramList = await paramRepository.FindAsync(
            p => p.IdPessoa == idEmpresa,
            false,
            cancellationToken);

        var paramContab = paramList.FirstOrDefault();
        if (paramContab == null)
        {
            throw new InvalidOperationException(
                $"Parâmetros contábeis não encontrados para empresa {idEmpresa}.");
        }

        // Sempre gerar a partir do contador (ignora request.CodigoReduzido)
        var codigoReduzido = ObterProximoCodigoReduzido(paramContab, request.Grupo);

        // Criar a entidade com todos os campos
        var conta = new ContaContabilEntity
        {
            Plano = request.Plano,
            Codigo = request.Codigo,
            Descricao = request.Descricao,
            DescricaoIdioma = request.DescricaoIdioma,
            Tipo = request.Tipo,
            Grupo = request.Grupo,
            Nivel = request.Nivel,
            CodigoReduzido = codigoReduzido,
            Natureza = request.Natureza,
            ContaCorrespondente = request.ContaCorrespondente,
            OrdemAlfabetica = request.OrdemAlfabetica,
            AceitaCentroCusto = request.AceitaCentroCusto,
            PermiteAlteracao = request.PermiteAlteracao,
            Inativa = request.Inativa,
            Conciliavel = request.Conciliavel,
            SumarizaLancamentos = request.SumarizaLancamentos,
            ObrigaSubconta = request.ObrigaSubconta,
            ContaPadraoSecretaria = request.ContaPadraoSecretaria,
            ImprimeRelEvolucao = request.ImprimeRelEvolucao,
            AceitaMutacoes = request.AceitaMutacoes,
            UsoExclusivoPga = request.UsoExclusivoPga,
            EstatisticaComLancamento = request.EstatisticaComLancamento,
            Bloqueada = request.Bloqueada,
            DataBloqueio = request.DataBloqueio,
            AceitaRateio = request.AceitaRateio,
            ConversaoOficial = request.ConversaoOficial ?? "N",
            ConversaoGerencial = request.ConversaoGerencial ?? "N",
            ConversaoGerencial2 = request.ConversaoGerencial2 ?? "N",
            ConversaoGerencial3 = request.ConversaoGerencial3 ?? "N",
            SubGrupo1 = request.SubGrupo1,
            SubGrupo2 = request.SubGrupo2,
            SubGrupo3 = request.SubGrupo3,
            SubGrupo4 = request.SubGrupo4,
            MoedaId = request.MoedaId,
            ContrapartidaJuros = request.ContrapartidaJuros,
            TaxaJuros = request.TaxaJuros,
            Contrapartida = request.Contrapartida,
            ContaSegregacao = request.ContaSegregacao,
            ContaSegregacaoFdoAdmCred = request.ContaSegregacaoFdoAdmCred,
            ContaSegregacaoFdoAdmDeb = request.ContaSegregacaoFdoAdmDeb,
            ContaAglutinacao = request.ContaAglutinacao,
            ContaExtracontabil = request.ContaExtracontabil,
            SegregacaoCriterId = request.SegregacaoCriterId,
            ProgramaId = request.ProgramaId,
            RateioPlanoAdmId = request.RateioPlanoAdmId,
            Observacoes = request.Observacoes,
        };

        // Adicionar e salvar
        await repository.AddAsync(conta, cancellationToken);

        // Sempre atualizar PARAMCONTAB.PACREDUZ{GRUPO} após criar a conta
        // Migração de: uCtrlPlanoConta.pas (linhas 367-375)
        // O contador é incrementado para que a próxima conta receba o próximo PLAREDUZ.
        IncrementarCodigoReduzido(paramContab, request.Grupo);
        await paramRepository.UpdateAsync(paramContab, cancellationToken);

        await _unitOfWork.SaveChangesAsync(cancellationToken);

        return MapToResponse(conta);
    }

    /// <summary>
    /// Obtém o próximo PLAREDUZ baseado no grupo, lendo PARAMCONTAB.PACREDUZ{GRUPO}.
    /// Migração de: uCtrlPlanoConta.pas → CriaCodReduz (linhas 422-431)
    /// </summary>
    private static int ObterProximoCodigoReduzido(ParamContab param, string? grupo)
    {
        return grupo?.ToUpperInvariant() switch
        {
            "A" => param.PacReduzA + 1,
            "P" => param.PacReduzP + 1,
            "R" => param.PacReduzR + 1,
            "D" => param.PacReduzD + 1,
            "C" => param.PacReduzC + 1,
            "E" => param.PacReduzE + 1,
            "O" => param.PacReduzO + 1,
            _ => throw new InvalidOperationException($"Grupo '{grupo}' não possui contador PACREDUZ.")
        };
    }

    /// <summary>
    /// Incrementa o contador PACREDUZ{GRUPO} em PARAMCONTAB.
    /// Migração de: uCtrlPlanoConta.pas (linhas 367-375)
    /// </summary>
    private static void IncrementarCodigoReduzido(ParamContab param, string? grupo)
    {
        switch (grupo?.ToUpperInvariant())
        {
            case "A": param.PacReduzA++; break;
            case "P": param.PacReduzP++; break;
            case "R": param.PacReduzR++; break;
            case "D": param.PacReduzD++; break;
            case "C": param.PacReduzC++; break;
            case "E": param.PacReduzE++; break;
            case "O": param.PacReduzO++; break;
        }
    }

    internal static ContaContabilResponse MapToResponse(ContaContabilEntity conta)
    {
        return new ContaContabilResponse
        {
            Plano = conta.Plano,
            Codigo = conta.Codigo,
            Descricao = conta.Descricao,
            DescricaoIdioma = conta.DescricaoIdioma,
            Tipo = conta.Tipo,
            Grupo = conta.Grupo,
            Nivel = conta.Nivel,
            CodigoReduzido = conta.CodigoReduzido,
            Natureza = conta.Natureza,
            ContaCorrespondente = conta.ContaCorrespondente,
            OrdemAlfabetica = conta.OrdemAlfabetica,
            AceitaCentroCusto = conta.AceitaCentroCusto,
            PermiteAlteracao = conta.PermiteAlteracao,
            Inativa = conta.Inativa,
            Conciliavel = conta.Conciliavel,
            SumarizaLancamentos = conta.SumarizaLancamentos,
            ObrigaSubconta = conta.ObrigaSubconta,
            ContaPadraoSecretaria = conta.ContaPadraoSecretaria,
            ImprimeRelEvolucao = conta.ImprimeRelEvolucao,
            AceitaMutacoes = conta.AceitaMutacoes,
            UsoExclusivoPga = conta.UsoExclusivoPga,
            EstatisticaComLancamento = conta.EstatisticaComLancamento,
            Bloqueada = conta.Bloqueada,
            DataBloqueio = conta.DataBloqueio,
            AceitaRateio = conta.AceitaRateio,
            ConversaoOficial = conta.ConversaoOficial,
            ConversaoGerencial = conta.ConversaoGerencial,
            ConversaoGerencial2 = conta.ConversaoGerencial2,
            ConversaoGerencial3 = conta.ConversaoGerencial3,
            SubGrupo1 = conta.SubGrupo1,
            SubGrupo2 = conta.SubGrupo2,
            SubGrupo3 = conta.SubGrupo3,
            SubGrupo4 = conta.SubGrupo4,
            MoedaId = conta.MoedaId,
            ContrapartidaJuros = conta.ContrapartidaJuros,
            TaxaJuros = conta.TaxaJuros,
            Contrapartida = conta.Contrapartida,
            ContaSegregacao = conta.ContaSegregacao,
            ContaSegregacaoFdoAdmCred = conta.ContaSegregacaoFdoAdmCred,
            ContaSegregacaoFdoAdmDeb = conta.ContaSegregacaoFdoAdmDeb,
            ContaAglutinacao = conta.ContaAglutinacao,
            ContaExtracontabil = conta.ContaExtracontabil,
            SegregacaoCriterId = conta.SegregacaoCriterId,
            ProgramaId = conta.ProgramaId,
            RateioPlanoAdmId = conta.RateioPlanoAdmId,
            Observacoes = conta.Observacoes,
            UsuarioInclusao = conta.UsuarioInclusao,
            CreatedAt = conta.CreatedAt,
            UpdatedAt = conta.UpdatedAt
        };
    }

    /// <summary>
    /// Extrai o código da conta pai removendo o último nível do código.
    /// Migração de: FCadContasContabMT.pas → dbeCodigoExit (cálculo de código pai)
    /// Ex: "1.1.1.01" → "1.1.1", "1.1" → "1", "1" → "" (sem pai)
    /// </summary>
    private static string? ExtrairCodigoPai(string codigo)
    {
        if (string.IsNullOrEmpty(codigo)) return null;
        var partes = codigo.Split('.').Where(s => !string.IsNullOrWhiteSpace(s)).ToList();
        if (partes.Count <= 1) return null;
        return string.Join(".", partes.Take(partes.Count - 1));
    }
}
