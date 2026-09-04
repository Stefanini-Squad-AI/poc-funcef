using TemplateBase.API;
using TemplateBase.API.Diagnostics;
using TemplateBase.Infrastructure.Configuration;

var builder = WebApplication.CreateBuilder(args);

// Resolve segredos do Key Vault e os injeta no IConfiguration ANTES de qualquer registro.
// Necessário porque alguns componentes leem segredos direto de IConfiguration/IOptions, ignorando a
// resolução das referências *FromKeyVault (SecretRef) — ver KeyVaultConfigurationExtensions. Mantém
// os segredos no cofre, sem gravá-los em appsettings.
builder.Configuration.AddAuthSecretsFromKeyVault();

// Registro de TODOS os serviços: API + Application + Infrastructure.
// Ver TemplateBase.API.DependencyInjection.
builder.AddApiServices();

var app = builder.Build();

// Diagnóstico não-fatal de conectividade (apenas Development/Homologation).
await app.LogDatabaseConnectivityAsync();

// Pipeline HTTP e mapeamento de endpoints, na ordem correta. Ver TemplateBase.API.ApiPipeline.
app.UseApiPipeline();

app.Run();
