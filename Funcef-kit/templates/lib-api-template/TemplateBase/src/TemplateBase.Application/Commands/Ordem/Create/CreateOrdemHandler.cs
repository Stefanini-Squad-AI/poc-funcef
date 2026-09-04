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

namespace TemplateBase.Application.Commands.Ordem.Create;

/// <summary>
/// Handler responsável pela criação de uma nova ordem.
/// </summary>
public class CreateOrdemHandler : ICommandHandler<CreateOrdemCommand, OrdemResponse>
{
    private readonly IOrdemService _service;
    private readonly IUnitOfWork _unitOfWork;
    private readonly IOrdemHistoricoService? _historicoService;

    /// <remarks>
    /// <paramref name="historicoService"/> é opcional: só é registrado no DI quando a seção
    /// <c>NoSql:MongoDocuments</c> está configurada (MongoDB disponível).
    /// </remarks>
    public CreateOrdemHandler(
        IOrdemService service,
        IUnitOfWork unitOfWork,
        IOrdemHistoricoService? historicoService = null)
    {
        _service = service;
        _unitOfWork = unitOfWork;
        _historicoService = historicoService;
    }

    public async Task<OrdemResponse> Handle(CreateOrdemCommand command, CancellationToken cancellationToken)
    {
        var ordem = await _service.CreateAsync(command.Request, cancellationToken);
        await _unitOfWork.SaveChangesAsync(cancellationToken);

        // Histórico no MongoDB (FUNCEF.NoSql) após o commit: o ORDEM_ID (identity)
        // só existe depois do SaveChanges.
        if (_historicoService != null)
        {
            await _historicoService.RegistrarAsync(ordem.Id, statusAnterior: null, ordem.Status, cancellationToken);
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
