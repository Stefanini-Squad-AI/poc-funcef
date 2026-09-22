using ContabPOC.Application.Commands.ContaContabil.Create;
using ContabPOC.Application.DTOs.ContaContabilDto;
using ContabPOC.Application.Commands.ContaContabil.Update;
using FuncefEssenciais.Application.Commands;
using FuncefORM.Contracts;
using ContaContabilEntity = ContabPOC.Domain.Entities.ContaContabil;

namespace ContabPOC.Application.Commands.ContaContabil.Update;

/// <summary>
/// Handler para processar o comando de atualização de conta contábil
/// Migração de: FCadContasContabMT.pas → CmeCadastroApplyEdit (linha 1479)
///   accept := CtrlPlanoConta.Gravar;
/// </summary>
public class UpdateContaContabilCommandHandler : ICommandHandler<UpdateContaContabilCommand, ContaContabilResponse>
{
    private readonly IUnitOfWork _unitOfWork;

    public UpdateContaContabilCommandHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<ContaContabilResponse> Handle(
        UpdateContaContabilCommand command,
        CancellationToken cancellationToken)
    {
        var request = command.Request;
        var repository = _unitOfWork.GetRepository<ContaContabilEntity>();

        // Buscar a conta existente
        // Delphi: CmeCadastroFind → CtrlPlanoConta.ListCdsPlanoContas
        var conta = await repository.FindAsync(
            c => c.Plano == command.Plano && c.Codigo == command.Codigo,
            false,
            cancellationToken);

        var contaExistente = conta.FirstOrDefault()
            ?? throw new KeyNotFoundException($"Conta contábil {command.Plano}/{command.Codigo} não encontrada.");

        // Atualizar todos os campos
        // Delphi: CmeCadastroApplyEdit → CtrlPlanoConta.Gravar
        contaExistente.Descricao = request.Descricao;
        contaExistente.DescricaoIdioma = request.DescricaoIdioma;
        contaExistente.Tipo = request.Tipo;
        contaExistente.Grupo = request.Grupo;
        contaExistente.Nivel = request.Nivel;
        contaExistente.CodigoReduzido = request.CodigoReduzido;
        contaExistente.Natureza = request.Natureza;
        contaExistente.ContaCorrespondente = request.ContaCorrespondente;
        contaExistente.OrdemAlfabetica = request.OrdemAlfabetica;
        contaExistente.AceitaCentroCusto = request.AceitaCentroCusto;
        contaExistente.PermiteAlteracao = request.PermiteAlteracao;
        contaExistente.Inativa = request.Inativa;
        contaExistente.Conciliavel = request.Conciliavel;
        contaExistente.SumarizaLancamentos = request.SumarizaLancamentos;
        contaExistente.ObrigaSubconta = request.ObrigaSubconta;
        contaExistente.ContaPadraoSecretaria = request.ContaPadraoSecretaria;
        contaExistente.ImprimeRelEvolucao = request.ImprimeRelEvolucao;
        contaExistente.AceitaMutacoes = request.AceitaMutacoes;
        contaExistente.UsoExclusivoPga = request.UsoExclusivoPga;
        contaExistente.EstatisticaComLancamento = request.EstatisticaComLancamento;
        contaExistente.Bloqueada = request.Bloqueada;
        contaExistente.DataBloqueio = request.DataBloqueio;
        contaExistente.AceitaRateio = request.AceitaRateio;
        contaExistente.ConversaoOficial = request.ConversaoOficial ?? "N";
        contaExistente.ConversaoGerencial = request.ConversaoGerencial ?? "N";
        contaExistente.ConversaoGerencial2 = request.ConversaoGerencial2 ?? "N";
        contaExistente.ConversaoGerencial3 = request.ConversaoGerencial3 ?? "N";
        contaExistente.SubGrupo1 = request.SubGrupo1;
        contaExistente.SubGrupo2 = request.SubGrupo2;
        contaExistente.SubGrupo3 = request.SubGrupo3;
        contaExistente.SubGrupo4 = request.SubGrupo4;
        contaExistente.MoedaId = request.MoedaId;
        contaExistente.ContrapartidaJuros = request.ContrapartidaJuros;
        contaExistente.TaxaJuros = request.TaxaJuros;
        contaExistente.Contrapartida = request.Contrapartida;
        contaExistente.ContaSegregacao = request.ContaSegregacao;
        contaExistente.ContaSegregacaoFdoAdmCred = request.ContaSegregacaoFdoAdmCred;
        contaExistente.ContaSegregacaoFdoAdmDeb = request.ContaSegregacaoFdoAdmDeb;
        contaExistente.ContaAglutinacao = request.ContaAglutinacao;
        contaExistente.ContaExtracontabil = request.ContaExtracontabil;
        contaExistente.SegregacaoCriterId = request.SegregacaoCriterId;
        contaExistente.ProgramaId = request.ProgramaId;
        contaExistente.RateioPlanoAdmId = request.RateioPlanoAdmId;
        contaExistente.Observacoes = request.Observacoes;
        contaExistente.UpdatedAt = DateTime.UtcNow;

        // Salvar
        await repository.UpdateAsync(contaExistente, cancellationToken);
        await _unitOfWork.SaveChangesAsync(cancellationToken);

        return CreateContaContabilCommandHandler.MapToResponse(contaExistente);
    }
}
