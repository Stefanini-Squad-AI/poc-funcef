// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefEssenciais.Application.Commands;
using FuncefORM.Contracts;
using FuncefORM.Mapping.Extensions;
using TemplateBase.Application.DTOs.ClienteDto.Resume;
using TemplateBase.Application.DTOs.OrdemDto.Response;
using TemplateBase.Application.Services;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Application.Commands.Ordem.Update;

/// <summary>
/// Handler responsável pela atualização de uma ordem existente.
/// </summary>
public class UpdateOrdemHandler : ICommandHandler<UpdateOrdemCommand, OrdemResponse>
{
    private readonly IOrdemService _service;
    private readonly IUnitOfWork _unitOfWork;
    private readonly IOrdemHistoricoService? _historicoService;

    /// <remarks>
    /// <paramref name="historicoService"/> é opcional: só é registrado no DI quando a seção
    /// <c>NoSql:MongoDocuments</c> está configurada (MongoDB disponível).
    /// </remarks>
    public UpdateOrdemHandler(
        IOrdemService service,
        IUnitOfWork unitOfWork,
        IOrdemHistoricoService? historicoService = null)
    {
        _service = service;
        _unitOfWork = unitOfWork;
        _historicoService = historicoService;
    }

    public async Task<OrdemResponse> Handle(UpdateOrdemCommand command, CancellationToken cancellationToken)
    {
        var resultado = await _service.UpdateAsync(command.Id, command.Request, cancellationToken);
        await _unitOfWork.SaveChangesAsync(cancellationToken);

        var ordem = resultado.Ordem;

        // Histórico no MongoDB (FUNCEF.NoSql) APÓS o commit: gravar antes deixaria no Mongo o
        // registro de uma mudança que nunca aconteceu no Oracle caso o SaveChanges falhasse.
        if (_historicoService != null
            && !string.Equals(resultado.StatusAnterior, ordem.Status, StringComparison.OrdinalIgnoreCase))
        {
            await _historicoService.RegistrarAsync(ordem.Id, resultado.StatusAnterior, ordem.Status, cancellationToken);
        }

        return ordem.MapTo<Domain.Entities.Ordem, OrdemResponse>(dto =>
        {
            dto.ClienteId = ordem.ClienteId;
            if (ordem.Cliente != null)
            {
                dto.NomeCliente = ordem.Cliente.Nome;
                dto.Cliente = ordem.Cliente.MapTo<Domain.Entities.Cliente, ClienteResume>();
            }
        });
    }
}
