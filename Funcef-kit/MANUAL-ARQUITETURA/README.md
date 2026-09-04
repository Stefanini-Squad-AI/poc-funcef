# Manual de Arquitetura FUNCEF

Portal HTML de leitura humana — sintetiza e indexa a Doutrina sem substituí-la.

## Abrir

Abra [`index.html`](index.html) no navegador (duplo clique ou `start index.html`).

## Estrutura

```
Manual-Arquitetura/
  index.html              Portal + trilhas por persona
  assets/style.css        Estilo compartilhado
  editorial/              Páginas síntese (visão, ADRs, componentes, processos)
  generated/              Capítulos gerados a partir da Doutrina (MD → HTML)
  manifest.yaml           Lista de fontes e trilhas
```

## Regenerar capítulos gerados

Na raiz do repositório `DoutrinaFUNCEF`:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Doutrina/_shared/scripts/Build-Manual-Arquitetura.ps1
```

Requisitos: PowerShell 5.1+. Pandoc é usado se estiver no PATH; caso contrário, conversor embutido no script.

## Copiar para kit offline

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Doutrina/_shared/scripts/Copy-Manual-Arquitetura-To-Kit.ps1 -KitRoot C:\RepoGit\funcef-kit-offline-2026-08-26
```

A copia para o kit **nao e espelho literal**: aplica redacao de infra interna (runners, IPs, PDBs, URLs de Key Vault) e bloqueia a entrega se detectar PAT, JWT, connection string ou chave PEM. Detalhes em `SANITIZACAO-KIT.md` (gerado apenas na pasta do kit).

## Manutenção

1. Alterou capítulo na Doutrina → rerun do script de build.
2. Alterou síntese editorial → edite `editorial/*.html` diretamente.
3. Novo capítulo no manual → adicione em `manifest.yaml` (`sources` + trilha) e regenere.

## Relação com outros docs

| Documento | Papel |
|---|---|
| Este manual | Leitura humana, trilhas, síntese |
| `Doutrina/` | Fonte da verdade completa |
| `onboarding-fabrica/` | Playbooks de implementação (fábrica) |
| Kit `MANUAL/` | Operacional offline (feeds, restore) |
