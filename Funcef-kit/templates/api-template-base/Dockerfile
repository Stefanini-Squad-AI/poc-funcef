FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base
WORKDIR /app
EXPOSE 8080
EXPOSE 8443

FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
# Nome do ARG alinhado ao que os reusable workflows de funcef-devops/pipelines passam por
# --build-arg. O default Release vale para build local e para qualquer pipeline que nao informe o
# valor. ATENCAO: um valor que nao seja "Release" (ex.: "Homologation") e uma CONFIGURACAO DE BUILD
# nao declarada nos projetos — compila, mas sem as otimizacoes do Release. Para HML otimizado,
# mantenha Release aqui e diferencie o ambiente por ASPNETCORE_ENVIRONMENT em runtime.
ARG ASPNETCORE_ENVIRONMENT=Release
WORKDIR /src

COPY Directory.Build.props Directory.Packages.props nuget.config global.json ./
COPY TemplateBase.slnx .
COPY src/TemplateBase.API/TemplateBase.API.csproj src/TemplateBase.API/
COPY src/TemplateBase.Application/TemplateBase.Application.csproj src/TemplateBase.Application/
COPY src/TemplateBase.Domain/TemplateBase.Domain.csproj src/TemplateBase.Domain/
COPY src/TemplateBase.Infrastructure/TemplateBase.Infrastructure.csproj src/TemplateBase.Infrastructure/
COPY tests/TemplateBase.Tests/TemplateBase.Tests.csproj tests/TemplateBase.Tests/

# FUNCEF_PACKAGES_TOKEN (build secret) é necessário para restaurar os pacotes FUNCEF do GitHub
# Packages — o id do secret e o nome da variável seguem o que os reusable workflows de
# funcef-devops/pipelines injetam; divergir aqui faz o restore falhar por 401 dentro do container.
# A forma `env=` dispensa o `cat` e mantém o valor fora das camadas da imagem.
RUN --mount=type=secret,id=FUNCEF_PACKAGES_TOKEN,env=FUNCEF_PACKAGES_TOKEN \
      dotnet nuget list source && \
      dotnet restore "TemplateBase.slnx"

COPY . .

RUN dotnet build src/TemplateBase.API/TemplateBase.API.csproj -c $ASPNETCORE_ENVIRONMENT --no-restore

FROM build AS publish
ARG ASPNETCORE_ENVIRONMENT=Release
RUN dotnet publish src/TemplateBase.API/TemplateBase.API.csproj -c $ASPNETCORE_ENVIRONMENT -o /app/publish --no-build /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

ENV ASPNETCORE_URLS=http://+:8080
ENV DOTNET_RUNNING_IN_CONTAINER=true

# Sem HEALTHCHECK no Dockerfile: as imagens de runtime do .NET (>= 8) nao incluem curl nem
# wget, portanto um "HEALTHCHECK CMD curl ..." falha sempre e marca o container como
# permanentemente unhealthy. A saude e verificada pelo orquestrador via httpGet, que nao
# depende de ferramenta dentro do container:
#   livenessProbe  -> GET /health/live   (self-check leve)
#   readinessProbe -> GET /health/ready  (dependencias: Oracle, Redis, Mongo, SQL Server, Entra)
# Ver docs/ENDPOINTS_HEALTH.md. Em docker-compose, prefira declarar o healthcheck no compose.

# Executa como usuario nao-root (Aikido CKV_DOCKER_3). A imagem base do .NET define
# APP_UID=1654 (usuario "app"); root no container facilita escalonamento apos um comprometimento.
USER $APP_UID

ENTRYPOINT ["dotnet", "TemplateBase.API.dll"]
