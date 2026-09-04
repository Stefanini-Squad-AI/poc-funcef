// ==============================================================================================
// ARQUIVO DE EXEMPLO
// Este arquivo faz parte do dominio de exemplo (Cliente/Ordem) incluido no template FUNCEF
// para demonstrar os padroes e convencoes do projeto.
// Use como referencia, crie seus proprios arquivos e depois EXCLUA este.
// ==============================================================================================
using FuncefORM.Contracts;
using TemplateBase.Domain.Entities;

namespace TemplateBase.Infrastructure.Persistence.Seeders;

/// <summary>
/// Seeder responsável por popular dados iniciais de clientes.
/// Executado automaticamente em desenvolvimento pelo AddFuncefORMDevelopment.
/// </summary>
/// <remarks>
/// A PK <c>CLIENTE_ID</c> é identity (gerada pelo banco); por isso o <see cref="Cliente.Id"/>
/// NÃO é definido aqui. O e-mail funciona como chave de negócio para os seeders dependentes
/// (ex.: <c>OrdemSeeder</c>) resolverem o Id gerado.
/// </remarks>
public class ClienteSeeder : EntitySeederBase<Cliente>
{
    public override int Order => 1;

    public override IEnumerable<Cliente> GetSeedData()
    {
        // Entidades ricas: até o seed nasce pela factory, com as invariantes garantidas.
        yield return Cliente.Criar("Cliente Exemplo", "cliente@exemplo.com.br");
        yield return Cliente.Criar("Empresa Teste LTDA", "contato@empresateste.com.br");
    }
}
