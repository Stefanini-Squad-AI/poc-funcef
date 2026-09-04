// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefORM.Contracts;
using Microsoft.EntityFrameworkCore;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Infrastructure.Persistence.Seeders;

/// <summary>
/// Seeder responsável por popular dados iniciais de ordens.
/// Executado automaticamente em desenvolvimento pelo AddFuncefORMDevelopment.
/// Requer que ClienteSeeder (Order = 1) já tenha sido executado.
/// </summary>
/// <remarks>
/// Como a PK <c>ORDEM_ID</c> e a FK <c>CLIENTE_ID</c> são <c>long</c> sob coluna identity,
/// os Ids não são conhecidos em tempo de <c>GetSeedData</c>. Por isso <see cref="SeedAsync"/>
/// é sobrescrito: os clientes recém-inseridos são buscados por e-mail (chave de negócio) para
/// obter o <see cref="Cliente.Id"/> gerado e vincular cada ordem via navegação — evitando
/// depender de valores de Id fixos. <see cref="GetSeedData"/> não é usado neste seeder.
/// </remarks>
public class OrdemSeeder : EntitySeederBase<Ordem>
{
    public override int Order => 2;

    /// <summary>
    /// Não utilizado: as ordens são construídas em <see cref="SeedAsync"/> após resolver a FK.
    /// </summary>
    public override IEnumerable<Ordem> GetSeedData() => [];

    /// <summary>
    /// Idempotência explícita: como <see cref="GetSeedData"/> retorna vazio, a implementação
    /// padrão da lib (<c>count &gt;= seedCount</c>) consideraria este seeder sempre aplicado
    /// e <see cref="SeedAsync"/> nunca executaria. Aplicado = já existem ordens.
    /// </summary>
    public override async Task<bool> IsAppliedAsync(DbContext context, CancellationToken cancellationToken = default)
        => await context.Set<Ordem>().AnyAsync(cancellationToken);

    /// <inheritdoc />
    public override async Task SeedAsync(DbContext context, CancellationToken cancellationToken)
    {
        var set = context.Set<Ordem>();

        // Idempotência: se já há ordens, não reexecuta.
        if (await set.AnyAsync(cancellationToken))
            return;

        // Resolve os clientes recém-inseridos pela chave de negócio (e-mail) para obter o Id gerado.
        var clienteExemplo = await context.Set<Cliente>()
            .FirstOrDefaultAsync(c => c.Email == "cliente@exemplo.com.br", cancellationToken);
        var empresaTeste = await context.Set<Cliente>()
            .FirstOrDefaultAsync(c => c.Email == "contato@empresateste.com.br", cancellationToken);

        // Entidades ricas: as ordens nascem pela factory (sempre Pendente) e chegam ao status
        // desejado por AlterarStatus — o seed percorre transições válidas da máquina de estados.
        if (clienteExemplo is not null)
        {
            set.Add(Ordem.Criar(clienteExemplo.Id, 150.00m, "Primeira ordem de exemplo"));

            var ordemConcluida = Ordem.Criar(clienteExemplo.Id, 299.99m, dataPedido: DateTime.UtcNow.AddDays(-30));
            ordemConcluida.AlterarStatus(StatusOrdem.Concluido);
            set.Add(ordemConcluida);
        }

        if (empresaTeste is not null)
        {
            var ordemCorporativa = Ordem.Criar(empresaTeste.Id, 1500.00m, "Ordem corporativa", DateTime.UtcNow.AddDays(-5));
            ordemCorporativa.AlterarStatus(StatusOrdem.Processando);
            set.Add(ordemCorporativa);
        }

        await context.SaveChangesAsync(cancellationToken);
    }
}
