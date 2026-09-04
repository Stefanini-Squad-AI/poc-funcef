# FUNCEF Kit Offline (2026-08-26)

Pacote de integração para fornecedores **sem acesso** ao Git FUNCEF nem ao GitHub Packages / npm privado.

## Conteúdo

| Pasta | O quê |
|---|---|
| [MANUAL/](MANUAL/index.html) | Handbook operacional (feeds, restore, troubleshooting) |
| [MANUAL-ARQUITETURA/](MANUAL-ARQUITETURA/index.html) | Manual de arquitetura (trilhas, camadas, componentes FUNCEF.*) |
| `feeds/nuget-local/` | Pacotes NuGet `FUNCEF.*` (.NET 10) |
| `feeds/npm-local/` | Pacotes npm `@funcef-componentes/*` |
| `feeds/nuget.config` | Feed local + nuget.org |
| `feeds/.npmrc.example` | Exemplo de registry offline |
| `templates/` | Código-fonte: `api-template-base`, `lib-api-template`, `web-template` |
| `VERSIONS.md` | Commits/versões inclusas |

## Pré-requisitos

- .NET SDK **10**
- Node.js **≥ 22** e **pnpm**
- Acesso a **nuget.org** e **registry.npmjs.org** (dependências públicas). Este kit traz apenas os artefatos **FUNCEF**.

## Início rápido

1. Abra `MANUAL/index.html` no navegador.
   - Operacional: `MANUAL/` · Arquitetura: `MANUAL-ARQUITETURA/`
2. Backend: copie `feeds/nuget.config` para a raiz do `templates/api-template-base` (ou ajuste o path `./nuget-local`) e rode `dotnet restore`.
3. Frontend: siga o MANUAL para instalar os `.tgz` e o `web-template`.

## Segurança

Valores de ambiente FUNCEF reais foram substituídos por placeholders (`kv-<sistema>-<env>-001`, `operador@exemplo.local`, etc.). **Não** há Client Secrets nem connection strings neste kit.

**MANUAL-ARQUITETURA:** copia sanitizada para fornecedor - runners, IPs, PDBs e URLs de Key Vault internos sao substituidos por placeholders genericos; um scan bloqueia PATs, JWTs, connection strings e chaves antes da entrega (ver `MANUAL-ARQUITETURA/SANITIZACAO-KIT.md`).
