@echo off

echo ----------------------------------------------------------------------------------
echo Iniciando a instalacao do Projeto WebEmprestimo (Camada de negocio)
echo Configurando o ambiente ...

call VariaveisService

echo Instalando o software com as seguintes configuracoes:
echo   Diretorio com os arquivos de Instalacao: %AppInstallDirectory%
echo   Diretorio da aplicacao web (IIS): %IISWebDirectory%
echo   Diretorio de backup web: %BackupDirectory%
echo   Diretorio do framework (ASP.NET): %Net20Dir%
echo   Fonte de Eventos (para Log no EventViewer): %EventSourceName%
echo -----------------------------------------------------------------------------------

echo Para continuar a instalacao com estas configuracoes, pressione "Enter"
echo Para alterar as configuracoes, cancele esta instalacao (Crtl+C) e edite o arquivo VariaveisService.bat
pause

echo -----------------------------------------------------------------
echo               Iniciando a instalacao
echo -----------------------------------------------------------------

echo Parando o IIS para a instalacao...
iisreset /stop

echo Efetuando backup da aplicacao (em caso de atualizacao)...
xcopy %IISWebDirectory% %BackupDirectory% /i /s /e /h /y

echo Atualizando a versao...
echo   - Excluindo os arquivos atuais...
del /Q /S /F "%IISWebDirectory%\*.*"

echo   - Copiando os novos arquivos...
xcopy %AppInstallDirectory% %IISWebDirectory% /i /s /e /h /y

echo Criptografando as secoes do Web.Config...
%Net20Dir%\aspnet_regiis.exe -pef "connectionStrings" "%IISWebDirectory%" -prov DataProtectionConfigurationProvider
%Net20Dir%\aspnet_regiis.exe -pef "appSettings" "%IISWebDirectory%" -prov DataProtectionConfigurationProvider

echo Criando a fonte de eventos (Log de eventos no EventViewer)...
SuporteInstalacao.exe -createEventSource "%EventSourceName%"

echo Reiniciando o IIS...
iisreset /start

echo Restaurando o ambiente...

set AppInstallDirectory=
set IISWebDirectory=
set BackupDirectory=
set BackupDirectory=
set Net20Dir=
set EventSourceName=

echo Finalizando a instalacao...

echo -----------------------------------------------------------------
echo               Fim da instalacao
echo -----------------------------------------------------------------

pause

