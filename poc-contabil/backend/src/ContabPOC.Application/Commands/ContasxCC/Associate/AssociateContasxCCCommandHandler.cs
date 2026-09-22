using ContabPOC.Application.Commands.ContasxCC.Associate;
using FuncefEssenciais.Application.Commands;
using FuncefORM.Contracts;
using CentroCustoEntity = ContabPOC.Domain.Entities.CentroCusto;
using ContasxCCEntity = ContabPOC.Domain.Entities.ContasxCC;

namespace ContabPOC.Application.Commands.ContasxCC.Associate;

/// <summary>
/// Handler para associar centros de custo a uma conta contábil.
/// Migração de: FCadContasContabMT.pas → btnVaiUmClick (líneas 1057-1095)
///   e btnVaiTodosClick (líneas 1015-1055)
///
/// Regras Delphi:
/// 1. Sintéticos (STATUSGRUPOCDC='S') NÃO podem ser relacionados → msg de aviso
/// 2. btnVaiTodos: move todos os analíticos disponíveis
/// 3. btnVaiUm: move apenas o selecionado (se analítico)
/// </summary>
public class AssociateContasxCCCommandHandler : ICommandHandler<AssociateContasxCCCommand, bool>
{
    private readonly IUnitOfWork _unitOfWork;

    public AssociateContasxCCCommandHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<bool> Handle(
        AssociateContasxCCCommand command,
        CancellationToken cancellationToken)
    {
        var ccRepository = _unitOfWork.GetRepository<CentroCustoEntity>();
        var contasxCCRepository = _unitOfWork.GetRepository<ContasxCCEntity>();

        // Buscar centros de custo da empresa
        var centrosCusto = await ccRepository.FindAsync(
            c => c.IdPessoa == command.IdEmpresa
                && (c.Ativo == "S" || c.Ativo == null),
            true,
            cancellationToken);

        // Buscar centros já associados (para não duplicar)
        var jaAssociados = await contasxCCRepository.FindAsync(
            cc => cc.Plano == command.Plano
                && cc.PlacConta.Trim() == command.PlacConta.Trim()
                && cc.IdEmpresa == command.IdEmpresa,
            true,
            cancellationToken);

        var codigosJaAssociados = jaAssociados
            .Select(cc => cc.CodCentroCusto.Trim())
            .ToHashSet();

        // Determinar quais centros de custo associar
        List<string> codigosParaAssociar;

        if (command.CodCentrosCusto.Count == 0)
        {
            // btnVaiTodosClick: todos os analíticos disponíveis
            codigosParaAssociar = centrosCusto
                .Where(c => c.StatusGrupoCdc == "A"
                         && !codigosJaAssociados.Contains(c.CodCentroCusto.Trim()))
                .Select(c => c.CodCentroCusto)
                .ToList();
        }
        else
        {
            // btnVaiUmClick: apenas os selecionados
            // Regra: Sintéticos não podem ser relacionados
            var sinteticos = centrosCusto
                .Where(c => command.CodCentrosCusto.Contains(c.CodCentroCusto)
                         && c.StatusGrupoCdc == "S")
                .ToList();

            if (sinteticos.Any())
            {
                var nomes = string.Join(", ", sinteticos.Select(s => s.Nome));
                throw new InvalidOperationException(
                    $"Centros de Custo Sintéticos não podem ser relacionados a contas contábeis: {nomes}");
            }

            codigosParaAssociar = command.CodCentrosCusto
                .Where(cod => !codigosJaAssociados.Contains(cod.Trim()))
                .ToList();
        }

        // Inserir relações em CONTASXCC
        foreach (var cod in codigosParaAssociar)
        {
            var novaRelacao = new ContasxCCEntity
            {
                Plano = command.Plano,
                PlacConta = command.PlacConta,
                CodCentroCusto = cod,
                IdEmpresa = command.IdEmpresa,
                IdUsuarioInclusao = command.IdUsuarioInclusao,
                DtInclusao = DateTime.UtcNow
            };

            await contasxCCRepository.AddAsync(novaRelacao, cancellationToken);
        }

        await _unitOfWork.SaveChangesAsync(cancellationToken);

        return true;
    }
}
