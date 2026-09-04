# Endpoints de Health & Info — Rotas Unificadas

Este documento descreve os endpoints de monitoramento de saúde e informações da API TemplateBase, configurados diretamente no `Program.cs` via Minimal API (`MapHealthChecks` e `MapGet`).

## Rotas Disponíveis

| Método | Rota | Descrição | Uso típico |
|:------:|------|-----------|------------|
| `GET` | `/health` | Status mínimo, apenas checks `"live"` (texto simples) | Verificação externa/pública |
| `GET` | `/health/detalhado` | Status completo em JSON (UIResponseWriter) | Dashboards — **rede interna** |
| `GET` | `/health/live` | Liveness probe (tag `"live"`) | Kubernetes liveness probe |
| `GET` | `/health/ready` | Readiness probe (tag `"ready"`) | Kubernetes readiness probe |
| `GET` | `/health/version` | Informações de versão | CI/CD, troubleshooting |
| `GET` | `/info` | Informações da aplicação | Equivalente a `/health/version` |

## Detalhes

### `/health`
Retorna **texto simples** (`Healthy`/`Unhealthy`) e executa **somente os checks com a tag `"live"`**.

Duas decisões de segurança sustentam esse comportamento:

1. **Não expõe topologia.** Nomes, status e durações das dependências (Oracle, Redis, Mongo,
   SQL Server, Entra) e descrições de exceção não são devolvidos a quem não está autenticado —
   isso seria reconhecimento gratuito para um atacante. O detalhamento vive em `/health/detalhado`.
2. **Não amplifica carga.** Como o endpoint é público *e* está em `RateLimiting:ExcludedPaths`,
   executar os checks de dependência aqui permitiria que requests anônimos ilimitados abrissem
   conexão com cinco serviços de backing a cada chamada. A verificação de dependências fica
   restrita a `/health/ready`, consumido pelo orquestrador na rede interna.

### `/health/detalhado`
Status completo em JSON (`UIResponseWriter`), com nome, status e duração de cada check.
Exposto **apenas** em `Development` ou quando `HealthChecks:ExposeDetailed` é `true`.
Não deve ser publicado na borda — restrinja a rede interna.

### `/health/live`
Liveness probe — filtra health checks registrados com a tag `"live"`.
O template registra o check `self` (processo vivo, sem tocar dependência externa) com essa tag.
Usado pelo Kubernetes para decidir se deve reiniciar o pod.

### `/health/ready`
Readiness probe — filtra health checks registrados com a tag `"ready"`.
O template registra sob essa tag: Oracle (via `AddFuncefORMHealthCheck`) e, quando a respectiva
seção de configuração existe, Redis, MongoDB, SQL Server e Entra ID.
Para acrescentar uma dependência própria, registre com a tag `"ready"`:

```csharp
builder.Services.AddHealthChecks()
    .AddCheck<MinhaDependenciaHealthCheck>("minha-dependencia", tags: ["ready"]);
```

Usado pelo Kubernetes para roteamento de tráfego.

### `/health/version`
Retorna informações da versão da API:
```json
{
  "name": "TemplateBase API",
  "version": "1.0.0",
  "environment": "Production",
  "timestamp": "2025-02-23T12:00:00Z"
}
```

### `/info`
Retorna as mesmas informações de `/health/version`. Rota alternativa para compatibilidade e conveniência.

## Implementação

Os endpoints são configurados no `Program.cs` — não existe um `HealthController`:

```csharp
app.MapHealthChecks("/health", new HealthCheckOptions { Predicate = check => check.Tags.Contains("live") });
app.MapHealthChecks("/health/live", new HealthCheckOptions { Predicate = check => check.Tags.Contains("live") });
app.MapHealthChecks("/health/ready", new HealthCheckOptions { Predicate = check => check.Tags.Contains("ready") });
app.MapGet("/health/version", () => new { ... });
app.MapGet("/info", () => new { ... });

// Somente em Development ou com HealthChecks:ExposeDetailed = true
app.MapHealthChecks("/health/detalhado", new HealthCheckOptions
{
    Predicate = _ => true,
    ResponseWriter = UIResponseWriter.WriteHealthCheckUIResponse
});
```

## Exemplos

```bash
# Liveness
curl -k https://localhost:56055/health/live

# Readiness
curl -k https://localhost:56055/health/ready

# Versão
curl -k https://localhost:56055/health/version

# Info (equivalente a /health/version)
curl -k https://localhost:56055/info

# Status completo
curl -k https://localhost:56055/health
```

## Autenticação

Todos os endpoints de health e info são **públicos** e não requerem autenticação. São configurados como Minimal API endpoints no `Program.cs`, fora do pipeline de autorização dos controllers.

Por serem públicos, valem duas restrições:

- `/health/detalhado` só deve ser alcançável pela rede interna (mantenha `HealthChecks:ExposeDetailed` em `false` fora de Development).
- `/health` e `/info` estão em `RateLimiting:ExcludedPaths`. Isso é seguro **porque** ambos são baratos: `/health` executa apenas checks `"live"` (em memória) e `/info` só lê metadados do assembly. Ao acrescentar um check com a tag `"live"`, garanta que ele não toque rede ou banco — senão o endpoint volta a ser um vetor de amplificação anônimo.

## Health do container (Docker/Kubernetes)

O `Dockerfile` **não** define `HEALTHCHECK`: as imagens de runtime do .NET (>= 8) não trazem `curl` nem `wget`, então um `HEALTHCHECK CMD curl ...` falharia sempre e marcaria o container como permanentemente `unhealthy`. A saúde é aferida pelo orquestrador via `httpGet`, que não depende de ferramenta dentro do container (ver seção abaixo). Em `docker-compose`, declare o `healthcheck` no próprio compose.

## Configuração Kubernetes

```yaml
livenessProbe:
  httpGet:
    path: /health/live
    port: 56055
  initialDelaySeconds: 10
  periodSeconds: 5

readinessProbe:
  httpGet:
    path: /health/ready
    port: 56055
  initialDelaySeconds: 5
  periodSeconds: 3
```
