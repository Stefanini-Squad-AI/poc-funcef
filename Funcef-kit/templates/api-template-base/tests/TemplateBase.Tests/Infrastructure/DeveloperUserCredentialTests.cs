using Azure.Core;
using FuncefAutenticacao.Configuration;
using NSubstitute;
using TemplateBase.Infrastructure.Credentials;

namespace TemplateBase.Tests.Infrastructure;

/// <summary>
/// Testes da credencial secretless de desenvolvimento local. O contrato tem duas metades bem
/// distintas: o token app-only vira token DELEGADO do desenvolvedor (aceito por recursos que admitem
/// delegado, como o Microsoft Graph), enquanto os campos de autenticação de client ficam VAZIOS —
/// mesmo comportamento que a lib aplica em <c>ClientSecret</c> sem segredo (public client / PKCE puro),
/// preservando as mensagens de erro da própria lib nos fluxos que exigem credencial do app.
/// </summary>
[TestClass]
public class DeveloperUserCredentialTests
{
    private const string EscopoGraph = "https://graph.microsoft.com/.default";

    private static readonly EntraIdOptions Opcoes = new();

    private static (DeveloperUserCredential Credencial, TokenCredential Fonte) Criar(
        string token = "token-delegado-do-az-login")
    {
        var fonte = Substitute.For<TokenCredential>();
        fonte.GetTokenAsync(Arg.Any<TokenRequestContext>(), Arg.Any<CancellationToken>())
            .Returns(new ValueTask<AccessToken>(new AccessToken(token, DateTimeOffset.UtcNow.AddHours(1))));

        return (new DeveloperUserCredential(fonte), fonte);
    }

    [TestMethod]
    public async Task AcquireAppTokenAsync_DeveDevolverOTokenDoUsuarioParaOEscopoPedido()
    {
        var (credencial, fonte) = Criar();

        var token = await credencial.AcquireAppTokenAsync(Opcoes, EscopoGraph, TestContext.CancellationToken);

        Assert.AreEqual("token-delegado-do-az-login", token);
        _ = fonte.Received(1).GetTokenAsync(
            Arg.Is<TokenRequestContext>(c => c.Scopes.Length == 1 && c.Scopes[0] == EscopoGraph),
            Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task AcquireAppTokenAsync_DevePropagarOCancellationToken()
    {
        using var cts = new CancellationTokenSource();
        var (credencial, fonte) = Criar();

        await credencial.AcquireAppTokenAsync(Opcoes, EscopoGraph, cts.Token);

        _ = fonte.Received(1).GetTokenAsync(Arg.Any<TokenRequestContext>(), cts.Token);
    }

    [TestMethod]
    public async Task AcquireAppTokenAsync_SemEscopo_DeveFalharAntesDeChamarOAzure()
    {
        var (credencial, fonte) = Criar();

        await Assert.ThrowsExactlyAsync<ArgumentException>(
            () => credencial.AcquireAppTokenAsync(Opcoes, "   ", TestContext.CancellationToken));

        _ = fonte.DidNotReceive().GetTokenAsync(Arg.Any<TokenRequestContext>(), Arg.Any<CancellationToken>());
    }

    [TestMethod]
    public async Task GetClientAuthFieldsAsync_NaoDeveProduzirCredencialDeClient()
    {
        // Um token de usuário não pode autenticar o APP como client OAuth2 (o Entra rejeita com
        // AADSTS700222). Devolver vazio reproduz o contrato de public client / PKCE da lib, em vez de
        // fabricar um campo inválido que só falharia no endpoint de token.
        var (credencial, _) = Criar();

        var campos = await credencial.GetClientAuthFieldsAsync(
            Opcoes, "https://login.microsoftonline.com/tenant/oauth2/v2.0/token", TestContext.CancellationToken);

        Assert.AreEqual(0, campos.Count);
    }

    [TestMethod]
    public void Construtor_SemCredencial_DeveFalhar()
    {
        Assert.ThrowsExactly<ArgumentNullException>(() => new DeveloperUserCredential(null!));
    }

    /// <summary>
    /// Injetado pelo MSTest; usado para propagar o cancelamento do teste às chamadas assíncronas
    /// (MSTEST0049).
    /// </summary>
    public TestContext TestContext { get; set; } = null!;
}
