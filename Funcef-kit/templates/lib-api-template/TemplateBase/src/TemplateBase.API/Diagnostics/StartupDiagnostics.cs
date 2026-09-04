using Funcef.Abstractions.Telemetry;
using Microsoft.EntityFrameworkCore;
using TemplateBase.Application.Abstractions.Configuration;
using TemplateBase.Infrastructure.Persistence.Context;

namespace TemplateBase.API.Diagnostics;

/// <summary>
/// Diagnósticos de startup — verificações informativas, executadas uma vez, que ajudam a identificar
/// erro de configuração antes da primeira requisição.
/// </summary>
/// <remarks>
/// <para>
/// <strong>Não-fatais por definição.</strong> Falha aqui é <em>logada</em>, nunca lançada: banco
/// indisponível no momento do startup é condição transitória em ambiente conteinerizado (ordem de
/// subida dos containers), e derrubar o processo por isso transformaria um atraso em indisponibilidade.
/// Quem decide se a aplicação pode receber tráfego é o probe <c>/health/ready</c>, avaliado
/// continuamente.
/// </para>
/// <para>
/// <strong>Só em Development e Homologation.</strong> Em produção, o probe de readiness já cobre a
/// conectividade e o custo é desnecessário no caminho de subida.
/// </para>
/// </remarks>
internal static class StartupDiagnostics
{
    /// <summary>
    /// Verifica a conectividade com os bancos configurados e registra o resultado na telemetria.
    /// </summary>
    internal static async Task LogDatabaseConnectivityAsync(this WebApplication app)
    {
        if (!app.Environment.IsDevelopment() && !app.Environment.IsEnvironment("Homologation"))
        {
            return;
        }

        using var scope = app.Services.CreateScope();
        var telemetry = scope.ServiceProvider.GetRequiredService<ITelemetry>();

        await LogConnectivityAsync(
            scope.ServiceProvider.GetRequiredService<AppDbContext>(),
            "Oracle (AppDbContext)",
            "Configure KeyVault:Url ou FuncefORM:Connection:DirectConnectionString",
            telemetry);

        if (ConfigurationSections.IsSqlServerEnabled(app.Configuration))
        {
            await LogConnectivityAsync(
                scope.ServiceProvider.GetRequiredService<SqlServerDbContext>(),
                "SQL Server (SqlServerDbContext)",
                "Configure SqlServer:ConnectionStringFromKeyVault ou SqlServer:DirectConnectionString",
                telemetry);
        }
    }

    private static async Task LogConnectivityAsync(
        DbContext context,
        string nome,
        string dicaDeConfiguracao,
        ITelemetry telemetry)
    {
        try
        {
            if (await context.Database.CanConnectAsync())
            {
                telemetry.LogInformation($"Banco de dados conectado com sucesso: {nome}");
            }
            else
            {
                telemetry.LogWarning(
                    $"Banco de dados não está acessível: {nome}. {dicaDeConfiguracao}");
            }
        }
        catch (Exception ex)
        {
            telemetry.LogError(
                $"Erro ao verificar o banco de dados no startup: {nome}. {dicaDeConfiguracao}",
                ex,
                new Dictionary<string, object?> { ["message"] = ex.Message });
        }
    }
}
