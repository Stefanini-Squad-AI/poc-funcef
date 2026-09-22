using ContabPOC.Application.Commands.ContasxSC.Associate;
using FuncefEssenciais.Application.Commands;
using FuncefORM.Contracts;
using SubContaEntity = ContabPOC.Domain.Entities.SubConta;
using ContasxSCEntity = ContabPOC.Domain.Entities.ContasxSC;

namespace ContabPOC.Application.Commands.ContasxSC.Associate;

/// <summary>
/// Handler para associar sub-contas a uma conta contábil.
/// Migração de: FCadContasContabMT.pas → btnVaiUm2Click (líneas 1187-1219)
///   e btnVaiTodos2Click (líneas 1150-1185)
///
/// Regras Delphi:
/// 1. btnVaiTodos2Click: move todas as sub-contas disponíveis
/// 2. btnVaiUm2Click: move apenas a selecionada (verifica duplicidade via Locate)
/// </summary>
public class AssociateContasxSCCommandHandler : ICommandHandler<AssociateContasxSCCommand, bool>
{
    private readonly IUnitOfWork _unitOfWork;

    public AssociateContasxSCCommandHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<bool> Handle(
        AssociateContasxSCCommand command,
        CancellationToken cancellationToken)
    {
        var subContaRepository = _unitOfWork.GetRepository<SubContaEntity>();
        var contasxSCRepository = _unitOfWork.GetRepository<ContasxSCEntity>();

        // Buscar sub-contas da empresa
        var subContas = await subContaRepository.FindAsync(
            s => s.IdPessoa == command.IdEmpresa
                && (s.Ativo == "S" || s.Ativo == null),
            true,
            cancellationToken);

        // Buscar sub-contas já associadas (para não duplicar)
        var jaAssociados = await contasxSCRepository.FindAsync(
            sc => sc.Plano == command.Plano
                && sc.PlacConta.Trim() == command.PlacConta.Trim()
                && sc.IdPessoa == command.IdEmpresa,
            true,
            cancellationToken);

        var codigosJaAssociados = jaAssociados
            .Select(sc => sc.CodSubConta)
            .ToHashSet();

        // Determinar quais sub-contas associar
        List<int> codigosParaAssociar;

        if (command.CodSubContas.Count == 0)
        {
            // btnVaiTodos2Click: todas as sub-contas disponíveis
            codigosParaAssociar = subContas
                .Where(s => !codigosJaAssociados.Contains(s.CodSubConta))
                .Select(s => s.CodSubConta)
                .ToList();
        }
        else
        {
            // btnVaiUm2Click: apenas as selecionadas
            codigosParaAssociar = command.CodSubContas
                .Where(cod => !codigosJaAssociados.Contains(cod))
                .ToList();
        }

        // Inserir relações em CONTASXSUBC
        foreach (var cod in codigosParaAssociar)
        {
            var subConta = subContas.First(s => s.CodSubConta == cod);

            var novaRelacao = new ContasxSCEntity
            {
                IdPessoa = command.IdEmpresa,
                IdUsuario = command.IdUsuario,
                Plano = command.Plano,
                PlacConta = command.PlacConta,
                CodSubConta = cod,
                NomeSubConta = subConta.NomeSubConta,
                DtInclusao = DateTime.UtcNow
            };

            await contasxSCRepository.AddAsync(novaRelacao, cancellationToken);
        }

        await _unitOfWork.SaveChangesAsync(cancellationToken);

        return true;
    }
}
