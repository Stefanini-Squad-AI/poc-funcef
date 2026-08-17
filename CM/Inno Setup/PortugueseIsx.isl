; My Inno Setup Extensions messages - Português/Brasil (versão 1.3.25)

; Traduzido por: Sérgio de Araujo Farias
; Atualização..: 05/01/2001
; E-mail.......: sergiofarias@bol.com.br

; Important note: Make sure that all messages also work for the classic
; wizard style. If you want to use more text for a message but you can't
; because it gets truncated, please email me at mlaan@cs.vu.nl and I'll
; probably create two seperate messages: one for the classic style and one
; for the modern style. Thanks.

; Note: When translating this text, do not add periods (.) to the end of
; messages that didn't have them already, because on those messages Inno
; Setup adds the periods automatically (appending a period would result in
; two periods being displayed).

[Messages]

; *** My Inno Setup Extensions messages
WizardSelectComponents=Selecione Componentes
SelectComponentsLabel=Selecione os componentes que você quer instalar, desmarque os componentes que você não quer instalar:
FullInstallation=Instalação Completa
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=Instalação Compacta
CustomInstallation=Instalação Personalizada
ReadyMemoDir=Diretório Destino:
ReadyMemoType=Tipo de Instalação:
ReadyMemoComponents=Componentes Selecionados:
ReadyMemoGroup=Grupo de Programas:
; FinishedRestartMessage should be the same as FinishedRestartLabel below with two %n's added
FinishedRestartMessage=Para completar a instalação de [name], o Instalador terá que reiniciar seu computador.%n%nVocê gostaria de reiniciar agora?

; *** My Inno Setup Extensions messages - 1.3.9
; used for example as 'Run MyProg.exe'
RunEntryExec=Executar %1
; used for example as 'View Readme.txt'
RunEntryShellExec=Visualizar %1

; *** My Inno Setup Extensions messages - 1.3.9.1
; first part of old WelcomeLabel
WelcomeLabel1=Bem vindo ao instalador de [name].
; second part of old WelcomeLabel
WelcomeLabel2=[name/ver] será instalado em seu computador.%n%nÉ recomendável que você feche todas as outras aplicações que você estiver executando antes de continuar. Isto ajudará a previnir contra qualquer conflito durante o processo de instalação.
; first part of old PasswordLabel
PasswordLabel1=Esta instalação esta protegida por senha.
; second part of old PasswordLabel
PasswordLabel2=Por Favor forneça a senha.
; similar to InfoBeforeLabel and InfoAfterLabel
LicenseLabel=Por favor leia a seguinte informação importante antes de continuar.

; *** My Inno Setup Extensions messages - 1.3.10
; _WelcomeFont=Arial,12
ClickNextModern=Clique em Prosseguir para continuar, ou em Cancelar para encerrar a instalação.

; *** My Inno Setup Extensions messages - 1.3.10.1
WizardInstalling=Progresso da instalação
InstallingLabel=Por favor aguarde enquanto o instalador estiver instalando [name] em seu computador.
NoUninstallWarningTitle=Componentes Existem
NoUninstallWarning=O instalador detectou que os seguintes componentes estão instalados em seu computador:%n%n%1%n%nDesmarcando estes componentes eles não serão desinstalados.%n%nVocê gostaria de continuar assim mesmo ?

; *** My Inno Setup Extensions messages - 1.3.12.1
ComponentSize1=%1 KB

; *** My Inno Setup Extensions messages - 1.3.13
ComponentSize2=%1 MB
WizardUninstalling=Progresso da Desinstalação
StatusUninstalling=Desinstalando %1...

; *** My Inno Setup Extensions messages - 1.3.17
; similar to Inno Setup's DiskSpaceMBLabel
ComponentsDiskSpaceMBLabel=Seleção atual requer pelo menos [mb] MB de espaço de disco.
; the %1 below is changed to ProgramManagerNew
NoProgramGroupCheck=&Não criar o grupo %1 
WizardSelectTasks=Selecione Tarefas Adicionais
SelectTasksLabel=Selecione as tarefas adicionais que você gostaria que o instalador executasse enquanto instala [name]:
ReadyMemoTasks=Tarefas adicionais:

; *** My Inno Setup Extensions messages - other
; append your own notes to this message if you want to, starting with two %n's
AboutSetupNote=My Inno Setup Extensions homepage:%nhttp://www.wintax.nl/isx/
BeveledLabel=CM Soluções Informática

; *** Inno Setup version 1.3.14 Brazilian Portuguese messages ***
; 
; Author: Josue Andrade Gomes 
; Last update: September 10, 2000
; Please send corrections, suggestions, etc. to <josuegomes@hotmail.com>
;
; I did try to make this translation as generic as possible. If you want a better work
; I strongly suggest you to customize the messages with help of a professional translator.
;
; The correct translation for ClickNext message is too wide to be used:
;   
;   ClickNext=Clique em Avançar para continuar ou em Cancelar para terminar.
;
; This one will work but it's not so good:
;
;   ClickNext=Clique em Avançar ou em Cancelar para terminar.
;
; (March, 22 2000) Thanks to André Viol <andre@viol.net> for a better translation to ClickNext
;
;   ClickNext=Clique Avançar para continuar, Cancelar para terminar.
;
; WARNING:
;
;  This translation is not suitable for European Portuguese.
;

; If the language you are translating to requires special font faces or
; sizes, uncomment any of the following entries and change them accordingly.
; _DialogFont=MS Sans Serif,8
; _TitleFont=Arial,29
; _CopyrightFont=Arial,8

; *** Application titles
SetupAppTitle=Programa de Instalação
SetupWindowTitle=Programa de Instalação - %1
UninstallAppTitle=Desinstalar
UninstallAppFullTitle=Desinstalar %1

; *** Icons
DefaultUninstallIconName=Desinstalar %1

; *** Misc. common
InformationTitle=Informação
ConfirmTitle=Confirmação
ErrorTitle=Erro
DirectoryOld=diretório
DirectoryNew=pasta
ProgramManagerOld=Gerenciador de Programas
ProgramManagerNew=Menu Iniciar

; *** SetupLdr messages
SetupLdrStartupMessage=Este programa irá instalar %1. Você gostaria de continuar ?
LdrCannotCreateTemp=Não foi possível criar um arquivo temporário. Instalação abortada
LdrCannotExecTemp=Não foi possível executar um arquivo na pasta de arquivos temporários. Instalação abortada

; *** Startup error messages
LastErrorMessage=%1.%n%nErro %2: %3
SetupFileMissing=O arquivo %1 está faltando na pasta de instalação. Corrija o problema ou obtenha uma nova cópia do programa.
SetupFileCorrupt=Os arquivos de instalação estão corrompidos. Obtenha uma cópia nova do programa.
SetupFileCorruptOrWrongVer=Os arquivos de instalação estão corrompidos ou são incompatíveis com esta versão do Programa de Instalação. Corrija o problema ou obtenha uma cópia nova.
NotOnThisPlatform=Este programa não irá executar no %1.
OnlyOnThisPlatform=Este programa deverá executar no %1.
WinVersionTooLowError=Este programa exige o %1 versão %2 ou mais nova.
WinVersionTooHighError=Este programa não pode ser instalado no %1 versão %2 ou mais nova.
AdminPrivilegesRequired=Você deverá estar logado como administrador para instalar este programa.
SetupAppRunningError=O programa de instalação detectou que %1 está executando.%n%nPor favor, feche todas as suas instâncias agora, e então clique em OK para continuar, ou Cancelar para sair.
UninstallAppRunningError=O programa de desinstalação detectou que %1 está executando.%n%nPor favor, feche todas as suas instâncias agora, e então clique em OK para continuar, ou Cancelar para sair.

; *** Misc. errors
ErrorCreatingDir=O Programa de Instalação não pode criar a pasta "%1"
ErrorTooManyFilesInDir=Não foi possível criar um arquivo no pasta "%1" - muitos arquivos
ErrorThunk=Thunk failed; code %1.

; *** Setup common messages
ExitSetupTitle=Finalizar instalação
ExitSetupMessage=A instalação não está completa. Se você terminar agora, o programa não será instalado.%n%nVocê poderá tentar novamente mais tarde para completar a instalação.%n%nTerminar instalação ?
AboutSetupMenuItem=&Sobre o Programa de Instalação...
AboutSetupTitle=Sobre o Programa de Instalação
AboutSetupMessage=%1 versão %2%n%3%n%n%1 home page:%n%4
AboutSetupNote=

; *** Buttons
ButtonBack=< &Voltar
ButtonNext=&Avançar >
ButtonInstall=&Instalar
ButtonOK=OK
ButtonCancel=Cancelar
ButtonYes=&Sim
ButtonYesToAll=Sim para &Todos
ButtonNo=&Não
ButtonNoToAll=Nã&o para Todos
ButtonFinish=&Concluir
ButtonBrowse=&Procurar...

; *** Common wizard text
ClickNext=Clique em Avançar para continuar ou em Cancelar para terminar.

; *** "Welcome" wizard page
WizardWelcome=Bem-vindo
WelcomeLabel=Bem-vindo ao Programa de Instalação de [name]. Este programa irá instalar [name/ver] no seu computador.%n%nÉ recomendado que você feche todas as outras aplicações antes de continuar. Isto evitará algum conflito durante a instalação.

; *** "Password" wizard page
WizardPassword=Senha
PasswordLabel=Esta instalação é protegida por senha. Por favor digite a senha.%n%nLetras maiúsculas e minúsculas nas senhas são consideradas diferentes.
PasswordEditLabel=&Senha:
IncorrectPassword=A senha que você digitou não está correta. Tente novamente.

; *** "License Agreement" wizard page
WizardLicense=Contrato de Licença de Uso
LicenseLabel1=Leia o contrato de licença a seguir. Use a barra de rolagem ou pressione Page Down para ver a continuação do texto.
LicenseLabel2=Você aceita todos os termos do Contrato de Licença acima ? Se escolher Não, o Programa de Instalação será fechado. Para instalar [name], você precisa aceitar este contrato.

; *** "Information" wizard page
WizardInfoBefore=Informação
InfoBeforeLabel=Leia as seguintes informações importantes antes de continuar.
InfoBeforeClickLabel=Quando você estiver pronto para continuar clique em Avançar.
WizardInfoAfter=Informação
InfoAfterLabel=Leia as seguintes informações importantes antes de continuar.
InfoAfterClickLabel=Quando você estiver pronto para continuar clique em Avançar.

; *** "Select Destination Directory" wizard page
WizardSelectDir=Escolha a pasta destino
; the %1 below is changed to either DirectoryOld or DirectoryNew
; depending on whether the user is running Windows 3.x, or 95 or NT 4.0
SelectFolderLabel=Escolha a %1 onde você quer instalar [name]:
DiskSpaceMBLabel=Este programa exige [mb] MB de espaço.
ToUNCPathname=O Programa de Instalação não pode instalar em um caminho UNC. Se você está tentando instalar em uma rede, você precisa mapear uma unidade da rede.
InvalidPath=Você deve entrar um caminho completo com a letra da unidade; por exemplo:%nC:\APP
InvalidDrive=A unidade não existe. Escolha outra.
DiskSpaceWarningTitle=Não há espaço suficiente.
DiskSpaceWarning=O Programa de Instalação exige %1 KB de espaço livre para instalar, mas a unidade selecionada tem somente %2 KB disponíveis.%n%você quer continuar ?
BadDirName32=O nome da pasta não pode conter os seguintes caracteres:%n%n%1
BadDirName16=O nome da pasta não pode conter espaços ou os seguintes caracters::%n%n%1
DirExistsTitle=A pasta já existe
DirExists=A pasta%n%n%1%n%njá existe. Você gostaria de instalar nesta pasta ?
DirDoesntExistTitle=A pasta não existe.
DirDoesntExist=A pasta :%n%n%1%n%nnão existe. Você gostaria de criar a pasta ?

; *** "Select Program Group" wizard page
WizardSelectProgramGroup=Escolha o grupo de programa
; the %1 below is changed to either ProgramManagerOld or ProgramManagerNew
; depending on whether the user is running Windows 3.x, or 95 or NT 4.0
IconsLabel=O Programa de Instalação irá adicionar os ícones do programa no seguinte grupo do %1.
NoIconsCheck=Não criar ícones
MustEnterGroupName=Você deve entrar com um nome de grupo.
BadGroupName=O nome do grupo não pode incluir os seguintes caracteres:%n%n%1

; *** "Ready to Install" wizard page
WizardReady=Pronto para Instalar
ReadyLabel1=O Programa de Instalação está pronto para iniciar a instalar [name] no seu computador.
ReadyLabel2a=Clique em Instalar para continuar a instalação, ou clique Voltar se você quer rever ou verificar suas opções.
ReadyLabel2b=Clique em Instalar para continuar a instalação.

; *** "Setup Completed" wizard page
WizardFinished=Instalação Terminada
FinishedLabelNoIcons=O Programa de Instalação terminou de instalar [name] no seu computador.
FinishedLabel=O Programa de Instalação terminou de instalar [name] no seu computador. A aplicação pode ser iniciada escolhendo os ícones instalados.
ClickFinish=Clique em Concluir para finalizar o Programa de Instalação.
FinishedRestartLabel=Para terminar a instalação de [name], o Programa de Instalação deverá reiniciar o seu computador. Você gostaria de reiniciar agora ?
ShowReadmeCheck=Sim, eu quero ver o arquivo LEIAME
YesRadio=&Sim, reiniciar o computador agora
NoRadio=&Não, eu reiniciarei o computador mais tarde

; *** "Setup Needs the Next Disk" stuff
ChangeDiskTitle=O Programa de Instalação precisa do próximo disco
SelectDirectory=Escolha a Pasta
; the %2 below is changed to either SDirectoryOld or SDirectoryNew
; depending on whether the user is running Windows 3.x, or 95 or NT 4.0
SelectDiskLabel=Insira o disco %1 e clique OK.%n%nSe os arquivos deste disco estiverem em uma outra %2, digite o caminho correto ou clique Procurar.
PathLabel=&Caminho:
; the %3 below is changed to either SDirectoryOld or SDirectoryNew
; depending on whether the user is running Windows 3.x, or 95 or NT 4.0
FileNotInDir=O arquivo "%1" não pôde ser encontrado em "%2". Insira o disco correto ou escolha outra %3.
SelectDirectoryLabel=Indique a localização do próximo disco.

; *** Installation phase messages
SetupAborted=A instalação não foi completada.%n%nCorrija o problema e execute o Programa de Instalação novamente.
EntryAbortRetryIgnore=Clique Repetir para tentar novamente, Ignorar para continuar, Anular para cancelar.

; *** Installation status messages
StatusCreateDirs=Criando pastas...
StatusExtractFiles=Extraindo arquivos...
StatusCreateIcons=Criando ícones...
StatusCreateIniEntries=Criando entradas INI...
StatusCreateRegistryEntries=Criando entradas no registro...
StatusRegisterFiles=Registrando arquivos...
StatusSavingUninstall=Salvando informação para desinstalação...

; *** Misc. errors
ErrorInternal=Erro interno %1
ErrorFunctionFailedNoCode=%1 falhou
ErrorFunctionFailed=%1 falhou; código %2
ErrorFunctionFailedWithMessage=%1 falhou; código %2.%n%3
ErrorExecutingProgram=Não foi possível executar:%n%1

; *** DDE errors
ErrorDDEExecute=DDE: Erro durante a transação "execute" (código: %1)
ErrorDDECommandFailed=DDE: Comando não executou com sucesso
ErrorDDERequest=DDE: Erro durante a transação "request" (código: %1)

; *** Registry errors
ErrorRegOpenKey=Erro ao abrir a chave de registro:%n%1\%2
ErrorRegCreateKey=Erro ao criar a chave de registro:%n%1\%2
ErrorRegWriteKey=Erro ao escrever na chave de registro:%n%1\%2

; *** INI errors
ErrorIniEntry=Error creating INI entry in file %1.

; *** File copying errors
FileAbortRetryIgnore=Clique Repetir para tentar novamente, Ignorar para ignorar este arquivo (não recomendado), ou Anular para cancelar a instalação.
FileAbortRetryIgnore2=Clique Repetir para tentar novamente, Ignorar para continuar assim mesmo (não recomendado), ou Anular para cancelar a instalação.
SourceIsCorrupted=O arquivo de origem está corrompido
SourceDoesntExist=O arquivo de origem "%1" não existe
ExistingFileReadOnly=O arquivo existente no seu computador está marcado como somente para leitura.%n%nClique em Repetir para remover o atributo de somente leitura e tentar novamente, Ignorar para continuar, ou Anular para cancelar a instalação.
ErrorReadingExistingDest=Um erro ocorreu ao tentar ler o arquivo existente no seu computador.
FileExists=O arquivo já existe.%n%nVocê gostaria de sobrescrevê-lo ?
ExistingFileNewer=O arquivo existente no seu computador é mais novo que aquele que o Programa de Instalação está tentando instalar. É recomendado que você mantenha o arquivo existente.%n%nVocê quer manter o arquivo existente ?
ErrorChangingAttr=Um erro ocorreu ao tentar mudar os atributos do arquivo existente no seu computador.
ErrorCreatingTemp=Um erro ocorreu ao tentar criar um arquivo na pasta destino.
ErrorReadingSource=Um erro ocorreu ao tentar ler o arquivo fonte:
ErrorCopying=Um erro ocorreu ao tentar compiar um arquivo.
ErrorReplacingExistingFile=Um erro ocorreu ao tentar substituir um arquivo existente:
ErrorRestartReplace=RestartReplace falhou:
ErrorRenamingTemp=Um erro ocorreu ao tentar renomear um arquivo na pasta destino:
ErrorRegisterServer=Não foi possível registrar DLL/OCX: %1
ErrorRegisterServerMissingExport=DllRegisterServer não encontrado
ErrorRegisterTypeLib=Não foi possível registrar a biblioteca de tipos: %1

; *** Post-installation errors
ErrorOpeningReadme=Um erro ocorreu ao tentar abrir o arquivo LEIAME.
ErrorRestartingComputer=O Programa de Instalação não conseguiu reiniciar o computador. Por favor faça isso manualmente.

; *** Uninstaller messages
UninstallNotFound=O arquivo "%1" não existe. Não é possível desinstalar.
UninstallUnsupportedVer=O arquivo de log de desinstação "%1" está em um formato que não é reconhecido por esta versão do desinstalador. Não é possível desinstalar
UninstallUnknownEntry=Uma entrada desconhecida (%1) foi encontrada no log de desinstalação
ConfirmUninstall=Você tem certeza que quer remover completamente %1 e todos os seus componentes ?
OnlyAdminCanUninstall=Está instalação só pode ser desinstalada por um usuário com privilégios administrativos.
UninstallStatusLabel=Por favor aguarde enquanto %1 é removido do seu computador.
UninstalledAll=%1 foi removido com sucesso do seu computador.
UninstalledMost=A desinstalação de %1 terminou.%n%nAlguns elementos não podem ser removidos. Estes elementos podem ser removidos manualmente.
UninstallDataCorrupted=O arquivo "%1" está corrompido. Não pode desinstalar

; *** Uninstallation phase messages
ConfirmDeleteSharedFileTitle=Remover arquivo compartilhado ?
ConfirmDeleteSharedFile2=O sistema indicou que o seguinte arquivo compartilhado não está mais sendo usando por nenhum outro programa. Você gostaria de remover este arquivo compartilhado ?%n%n%Se qualquer programa ainda estiver usando este arquivo e ele for removido, este programa pode não funcionar corretamente. Se você não tiver certeza, escolha Não. Manter o arquivo no computador não causará nenhum problema.
SharedFileNameLabel=Nome do Arquivo:
SharedFileLocationLabel=Localização:
