{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
SIG       : 121285
Analista  : Everson Cunha
Descrição : Melhoria na VersaoOk para que só faça validação em base de PRODUCAO
--------------------------------------------------------------------------------
SIG       : 120917
Analista  : Everson Cunha
Descrição : Possibilitar a leitura do Alias por meio do arquivo conexao.ini
            Criar uma nova função para ler um arquivo a parte, conexao_hom.ini
--------------------------------------------------------------------------------
Analista  : Everson Cunha
Método    : VersaoOk
Pendência : SIG 77836 Tibero
Descrição : Inclusão da validação se a oci.dll que está no diretório local do
            usuário é a mesma oci.dll disponível no \\ALTARF 
--------------------------------------------------------------------------------
Analista  : Vinícius
Método    : Diversos
Pendência : 17429
Descrição : Inclusão do parâmetro Sistema.TipoCliente para identificação de
            customizações específicas
--------------------------------------------------------------------------------
Analista  : Marchetti
Método    : Diversos
Pendência : 17031
Descrição : Caso não consiga gravar o Register não paralisar o sistema
--------------------------------------------------------------------------------
Analista  : Marchetti
Método    : Diversos
Pendência : Acesso único a Banco de Dados - VALIA
Descrição : Criados varios metodos para contemplar acesso unico ao BD
--------------------------------------------------------------------------------
Analista  : Alex e Flávio Dias
Método    : Diversos
Pendência : 16652 - Não permitir a entrada do sistema caso o usuário não
            atualize o  sistema automaticamente - ATUVERSAO
Descrição : Corrigido ainda a verificação de bpls liberadas
            Corrigido o diretório
-------------------------------------------------------------------------------}

{******************************************************************************}
{                                                                              }
{ Padrões de Desenvolvimento                                                   }
{ Copyright © 1998,2002 - CM Soluções Informática                              }
{                                                                              }
{ - Atualização para o padrão MT (3 Camadas)                                   }
{                                                                              }
{ Analista Responsável: Gustavo Viegas                                         }
{ Atualizado Em: 10/04/2002                                                    }
{ Atualizado em 02.02.2004 por Flavio Dias                                     }
{                                                                              }
{******************************************************************************}

unit USistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  registry, shellapi, consts, dbTables, dbclient, sconnect, mconnect, menus,
  filectrl, uCMTypes, UFuncaoGeral, UDiasUteis,

  JclSysInfo, JclDateTime,
  // Controle de acesso ao BD
  IniFiles, uCripto;

type
  TSistema = class
  private
    fSuperUsuario,
    FPedeLogin,
    FFezLogin,
    FSeqCliente,
    FSeqServidor,
    FConectaRemoto,
    FSenhaLetra,
    FSenhaNumero,
    FSenhaRepete,
    FSenhaAlteraSuper,
    FUsaRAD,
    FUsaPlanoPatro : Boolean;
    fIdModulo,
    FSenhaTamMin,
    FSenhaTamHistorico,
    FIdiomaAtivo : SmallInt;
    fIdUsuario,
    fIdEmpresa,
    fIdEspAcesso,
    FTempoProtecao,
    FIdRad : LongInt;
    fNomeUsuario,
    fNomeEmpresa,
    fRazaoSocial,
    fNomeFantasia,
    fSenhaSuper,
    fNumDocEmpresa,
    fNomeModulo,
    fNomeAplicativo,
    fVersao,
    fDriverServidor,
    fDriverServidorRemoto,
    fOwnerServidor,
    fOwnerServidorRemoto,
    fAliasServidor,
    fAliasServidorRemoto,
    fTempPath,
    FDirVersao,
    FUltScript,
    FDirSys : String;
    fNomeDPL,
    fVersaoDPL,
    fDataDPL,
    fArqDPL : TStringList;
    fSoUpperPessoa :Boolean;
    fUsaEnderecoPessoa :Boolean;
    fObrigaDocPessoa :Boolean;
    fDuplicaDocPessoa :Boolean;
    fTipoEmpresa :String;
    fTipoCliente :Integer;
    fLogoCM :Boolean;
    Registry: TRegistry;
    Key: String;
    FViculaModuloxPessoa: boolean;
    FUsaLogOperacoes: Boolean;
    FConnectionSide: TConnectionSide;
    FConnectionType: TDbConnectionType;
    FMidleWareConnection: TMidleWareConnection;
    FWebUrl: String;
    FDcomComputerName: String;
    FSocketHost: String;

    FAppRemoteServer: TDispatchConnection;
    FEmailOnError: String;
    FValidaSenhaNome: Boolean;
    FPedeLoginEmpresa: boolean;
    FNomeServidor: String;
    FNomeServidorSecundario: String;
    FMudouUsuario: Boolean;
    FMudouEmpresa: Boolean;
    FUsaTecladoLogin: Boolean;
    FLoadOldReport: Boolean;
    FTipoFiltroUsuario: TFiltroUsu;

    FOwner           : String;
    FUserUnico       : String;
    FSenhaUserUnico  : String;
    FUsuarioUnico    : Boolean;
    FUserID          : String;
    FGravaRegister   : Boolean;
    FVersaoRad: String;

    function GetNomeCompleto: String;
    procedure SetNomeModulo(n: String);
    procedure SetIdiomaAtivo(n: smallint);
    function GetIdiomaAtivo : smallint;
    function DiretorioVersao : string;
    procedure SetConnectionSide(const Value: TConnectionSide);
    procedure SetViculaModuloxPessoa(const Value: boolean);
    procedure SetUsaLogOperacoes(const Value: Boolean);
    procedure SetConnectionType(const Value: TDbConnectionType);
    procedure SetMidleWareConnection(const Value: TMidleWareConnection);
    procedure SetDcomComputerName(const Value: String);
    procedure SetSocketHost(const Value: String);
    procedure SetWebUrl(const Value: String);

    procedure SetEmailOnError(const Value: String);
    function GetEmailOnError: String;
    function GetAppRemoteServer: TDispatchConnection;
    procedure SetAppRemoteServer(const Value: TDispatchConnection);
    procedure SetPedeLoginEmpresa(const Value: boolean);
    procedure SetNomeServidor(const Value: String);
    procedure SetNomeServidorSecundario(const Value: String);
    procedure SetMudouEmpresa(const Value: Boolean);
    procedure SetMudouUsuario(const Value: Boolean);
    procedure SetUsaTecladoLogin(const Value: Boolean);
    procedure SetLoadOldReport(const Value: Boolean);
    procedure SetTipoFiltroUsuario(const Value: TFiltroUsu);
    procedure SetVersaoRad(const Value: String);
  protected

  public
    constructor Create;
    destructor Destroy; override;

    property UsaTecladoLogin: Boolean read FUsaTecladoLogin write SetUsaTecladoLogin;

    property ConnectionSide :TConnectionSide read FConnectionSide write SetConnectionSide;
    {Identificador do usuario logado}
    property IdUsuario: LongInt read FIdUsuario write FIdUsuario;
    {Nome do usuário logado}
    property NomeUsuario: string read FNomeUsuario write FNomeUsuario;
    {Nome do módulo executado}
    property NomeModulo: string read FNomeModulo write SetNomeModulo;
    {Nome do aplicativo (.exe) executado}
    property NomeAplicativo: string read FNomeAplicativo write FNomeAplicativo;
    {Identificador do módulo executado}
    property IdModulo: SmallInt read fIdModulo write fIdModulo;
    {Versão do módulo executado}
    property Versao: String read fVersao write fVersao;
    {Versão das BPL's vinculadas ao módulo}
    property VersaoDPL: TStringList read fVersaoDPL;
    {Nome das BPL's vinculadas ao módulo}
    property NomeDPL: TStringList read fNomeDPL;
    {Data de Compilação das BPL's vinculadas ao módulo}
    property DataDPL: TStringList read fDataDPL;
    {Nome dos arquivos das BPL's vinculadas ao módulo}
    property ArqDPL: TStringList read fArqDPL;
    {Diretório da versão para atualização automática na rede}
    property DirVersao: String read fDirVersao;
    {Diretório de execução dos sistemas}
    property DirSys: String read fDirSys;
    {Controla a execução da tela de login do sistema. Caso não seja exibida loga como CM0}
    property PedeLogin: boolean read FPedeLogin write FPedeLogin;
    {Controla a execução da tela de login por empresa}
    property PedeLoginEmpresa: boolean read FPedeLoginEmpresa write SetPedeLoginEmpresa;
    {Informa o suscesso da velidação de usuário e senha no login da aplicação}
    property FezLogin: boolean read FFezLogin write FFezLogin;
    {Informa se o usuário logado é o SUPER}
    property SuperUsuario: Boolean read FSuperUsuario write FSuperUsuario;
    {Informa se a empresa proprietária logada obriga a indicação de plano\patrocinadora (EMPRESAPROP.FLGPLANOPATRO)}
    property UsaPlanoPatro: Boolean read FUsaPlanoPatro write FUsaPlanoPatro;
    {IdEspAcesso do Usuário logado no sistema, utilizado para a autorização}
    property IdEspAcesso: Integer read FIdEspAcesso write FIdEspAcesso;
    {Identificador da empresa proprietária logada no sistema, atribuído pela tela de seleciona empresa
    ou de forma automática caso a instalação não seja multi-empresa}
    property IdEmpresa: Integer read FIdEmpresa write FIdEmpresa;

    property MudouUsuario: Boolean read FMudouUsuario write SetMudouUsuario;
    property MudouEmpresa: Boolean read FMudouEmpresa write SetMudouEmpresa;

    {Tipo da empresa logada I - Incicial, P - Previdência, H - Hotelaria}
    Property TipoEmpresa: String  read fTipoEmpresa Write fTipoEmpresa;
    {Tipo de cliente para identificação de customizações específicas}
    Property TipoCliente: Integer read fTipoCliente Write fTipoCliente;
    {Nome da empresa proprietária logada no sistema, atribuído pela tela de seleciona empresa
    ou de forma automática caso a instalação não seja multi-empresa}
    property NomeEmpresa: string read FNomeEmpresa write FNomeEmpresa;
    {Razão Social da empresa proprietária logada no sistema, atribuído pela tela de seleciona empresa
    ou de forma automática caso a instalação não seja multi-empresa}
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    {Nome Fantasia empresa proprietária logada no sistema, atribuído pela tela de seleciona empresa
    ou de forma automática caso a instalação não seja multi-empresa}
    property NomeFantasia: string read fNomeFantasia write fNomeFantasia;
    {Número do documento principal da empresa proprietária logada no sistema}
    property NumDocEmpresa: string read fNumDocEmpresa write fNumDocEmpresa;
    {Identifica se a empresa proprietária esta autoriza a usar o sistema RAD (EMPRESAPROP.FLGRAD}
    property UsaRAD: boolean read FUsaRAD write FUsaRAD;
    {Identificador do processo do rad a ser atualizado, exibido ou consultado}
    property VersaoRad: String read FVersaoRad write SetVersaoRad;
    {Identificador do processo do RAD Plus}
    property IdRAD: integer read FIdRAD write FIdRAD;
    {Nome do módulo  + versão da empresa logada}
    property NomeCompleto: String read GetNomeCompleto;
    {Tipo de servidor de banco de dados a ser acessado (ORACLE, DBS, SQL) informação gravada no register do sistema }
    property DriverServidor: String read fDriverServidor;
    {Tipo de servidor de banco de dados remoto a ser acessado (ORACLE, DBS, SQL) informação gravada no register do sistema}
    property DriverServidorRemoto: String read fDriverServidorRemoto;
    {Alias de servidor de banco de dados a ser acessado - (ORACLE, DBS, SQL) informação gravada no register do sistema}
    property AliasServidor: String read fAliasServidor  write fAliasServidor;
    {Alias de servidor de banco de dados remoto a ser acessado - (ORACLE, DBS, SQL) informação gravada no register do sistema}
    property AliasServidorRemoto: String read fAliasServidorRemoto;
    {Nome do usuário 'OWNER' dos objetos de banco - Default CM}
    property PrefixoServidor: String read fOwnerServidor;
    {Nome do usuário 'OWNER' dos objetos de banco remoto - Default CM}
    property PrefixoServidorRemoto: String read fOwnerServidorRemoto;
    {Diretório local temporário do windows}
    property TempDir: String read fTempPath;
    {Incidca se o sistema utilizará a conexão com o DataBase remoto}
    property ConectaRemoto: boolean read FConectaRemoto write FConectaRemoto;
    {Indica se no cadastro de pessoa os campos NOME e RAZAOSOCIAL serão inclusos sempre com Caixa Alta}
    property SoUpperPessoa: boolean     read fSoUpperPessoa     write fSoUpperPessoa;
    {Indica se nas procuras de pessoa será permitida a seleção pelo endereço de forma automática (PARAMGLOBAL.FLGUSAENDPESSOA)}
    property UsaEnderecoPessoa: boolean read fUsaEnderecoPessoa write fUsaEnderecoPessoa;
    {Indica se é obrigatório a indicação do número do documento do pessoa (PARAMGLOBAL.FLGOBRIDOCPESSOA)}
    property ObrigaDocPessoa: boolean   read fObrigaDocPessoa   write fObrigaDocPessoa;
    {Indica se é permitido a diplicação do número do documento principal no pessoa (PARAMGLOBAL.FLGDUPLDOCPESSOA)}
    property DuplicaDocPessoa: boolean   read fDuplicaDocPessoa   write fDuplicaDocPessoa;
    {Indica se o vínculo de módulo responsável ao pessoa será utilizado (PARAMGLOBAL.FLGUSAMODRESPON). O Vículo do módulo fica
     associado ao subtipo, ou seja, mesmo que o sistema esteja habilitado para vincular ModuloXPessoa o mesmo só ocorre se o
     subtipo também estiver habilitado para tal vinculo }
     property ViculaModuloxPessoa: boolean read FViculaModuloxPessoa write SetViculaModuloxPessoa;
    {Último script executado pelo mensageiro para atuzalição de banco}
    property UltScript: String          read FUltScript         write FUltScript;
    {Idioma ativo do sistema qdo instalado como mult-language}
    property IdiomaAtivo: smallint read FIdiomaAtivo write SetIdiomaAtivo;
    {Controla a logo da tela de splash como sendo da CM ou 'outra'}
    property LogoCM :Boolean read fLogoCM write fLogoCM;
    {Nome do usuário do banco logado - A informação está encriptada com algoritomo Two-Fish de 128 bits}
    property SenhaLetra: Boolean Read FSenhaLetra;
    {Incializa a propriedade de obrigatoriedade de numero na senha}
    property SenhaNumero: Boolean Read FSenhaNumero;
    {Indica a permissão de senha contendo partes do nome ou sobrenome do Usuário/Login}
    property ValidaSenhaNome: Boolean read FValidaSenhaNome;
    {Incializa a propriedade de permissão de repetir a senha quando da alteração da mesma}
    property SenhaRepete: Boolean Read FSenhaRepete;
    {Incializa a propriedade de obrigatoriedade de alteração da senha}
    property SenhaAlteraSuper: Boolean Read FSenhaAlteraSuper;
    {Incializa a propriedade do tamanho minimo da senha}
    property SenhaTamMin: SmallInt Read FSenhaTamMin;
    {Incializa a propriedade do tamanho do historico de senhas}
    property SenhaTamHistorico: SmallInt Read FSenhaTamHistorico;
    {Incializa a propriedade do tempo de proteção do aplicação (OnIdle)}
    property TempoProtecao: LongInt Read FTempoProtecao;
    {Incializa as propriedade de Senha do Super usuario}
    property SenhaSuper: String Read FSenhaSuper write FSenhaSuper;
    {Indica se o sistema utilizará a tela de consulta do Log de Operações gravado pela função GravaLogOperacoes
     A tela de log fiuca no menu "Consulta\Log de Operações"}
    property UsaLogOperacoes: Boolean read FUsaLogOperacoes write SetUsaLogOperacoes;
    {Indica a forma de coneção com o banco utilizad pelo sistema: BDE, ADO, IBX, DOA}
    property ConnectionType: TDbConnectionType read FConnectionType write SetConnectionType;
    {Indica o meio utilizado para coneção com aplicação servidora: Socke, DCOM, Web}
    property MidleWareConnection: TMidleWareConnection read FMidleWareConnection write SetMidleWareConnection;
    {IP Host onde está instalado a Aplicação Servidora}
    property SocketHost: String read FSocketHost write SetSocketHost;
    {Nome do computador onde está instalada a Aplicação Servidora}
    property DcomComputerName: String read FDcomComputerName write SetDcomComputerName;
    {Nome do Site onde está hospedada a Aplicação Servidora;}
    property WebUrl: String read FWebUrl write SetWebUrl;
    {Custom Connection responsável pelo acesso a aplicação servidora.
     É inicializado a partir dos parâmetros de Tipo E Meio de Connexão quando a aplicação acessa
     os dados de um servidor de aplicações: Vide tela de parâmetros chamando o executável com -p}
    //property RemoteServer: TDispatchConnection read GetRemoteServer write SetRemoteServer;
    property AppRemoteServer: TDispatchConnection read GetAppRemoteServer write SetAppRemoteServer;
    property LoadOldReport: Boolean read FLoadOldReport write SetLoadOldReport;

    { Email a ser configurado pelo CLIENTE para envio das mensagens de erro Genéricas do Sistema }
    property EmailOnError: String read GetEmailOnError write SetEmailOnError;

    property NomeServidor: String read FNomeServidor write SetNomeServidor;
    property NomeServidorSecundario: String read FNomeServidorSecundario write SetNomeServidorSecundario;
    property TipoFiltroUsuario: TFiltroUsu read FTipoFiltroUsuario write SetTipoFiltroUsuario;
    
    {Grava o log de Operações de Acordo com o módulo, usuário e data do sistema}
    function GravaLogOperacoes( sDescOperacao: String; bCommit: Boolean = False ): Boolean;
    {Incializa a propriedade do tempo de proteção do aplicação (OnIdle)}
    function GetInfoServidor(const bMudaAlias : Boolean): Boolean;
    {Lê como string valores da chave global dos sistemas cm HKEY_CURRENT_USER\Software\CM}
    function GetGlobalRegString(Item: String; var Value: String): Boolean;
    {Lê como Inteiro valores da chave global dos sistemas cm HKEY_CURRENT_USER\Software\CM}
    function GetGlobalRegInteger(Item: String; var Value: Integer): Boolean;
    {Lê como Float valores da chave global dos sistemas cm HKEY_CURRENT_USER\Software\CM}
    function GetGlobalRegFloat(Item: String; var Value: Double): Boolean;
    {Lê como Boolean valores da chave global dos sistemas cm HKEY_CURRENT_USER\Software\CM}
    function GetGlobalRegBoolean(Item: String; var Value: Boolean): Boolean;
    {Lê como DateTime valores da chave global dos sistemas cm HKEY_CURRENT_USER\Software\CM}
    function GetGlobalRegDateTime(Item: String; var Value: TDateTime): Boolean;
    {Lê como string valores da chave do sistema cm em execução HKEY_CURRENT_USER\Software\CM\NomeModulo}
    function GetRegString(SubKey: String; Item: String; var Value: String): Boolean;
    {Lê como Integer valores da chave do sistema cm em execução HKEY_CURRENT_USER\Software\CM\NomeModulo}
    function GetRegInteger(SubKey: String; Item: String; var Value: Integer): Boolean;
    {Lê como Float valores da chave do sistema cm em execução HKEY_CURRENT_USER\Software\CM\NomeModulo}
    function GetRegFloat(SubKey: String; Item: String; var Value: Double): Boolean;
    {Lê como Boolean valores da chave do sistema cm em execução HKEY_CURRENT_USER\Software\CM\NomeModulo}
    function GetRegBoolean(SubKey: String; Item: String; var Value: Boolean): Boolean;
    {Lê como DateTime valores da chave do sistema cm em execução HKEY_CURRENT_USER\Software\CM\NomeModulo}
    function GetRegDateTime(SubKey: String; Item: String; var Value: TDateTime): Boolean;
    {Lê valores da chave do sistema cm em execução referente a configuração específicas da BDE para o driver utilizado
    HKEY_CURRENT_USER\Software\CM\NomeModulo\Parametros Servidor}
    function GetServidorParams(TipoServidor : TTipoServidor; var ListaNomes, ListaValores : TStringList): Boolean;
    {Valida as informações atribuídas ao Diretório versão para atualização automática de versões pela rede}
    function VersaoOk : boolean;
    {Valida as informações atribuídas ao Diretório das BPL's para atualização automática de versões pela rede}
    function DPLOk : boolean;
    {Inicializa propriedades referentes a tabela de segurança}
    procedure SetParametrosSeguranca;


    //---------------------------------------------------------------------------------------------
    // Metodos para acesso único ao BD
    //---------------------------------------------------------------------------------------------
    property Owner          : String  read FOwner           write FOwner;
    property UserUnico      : String  read FUserUnico       write FUserUnico;
    property SenhaUserUnico : String  read FSenhaUserUnico  write FSenhaUserUnico;
    property UsuarioUnico   : Boolean read FUsuarioUnico    write FUsuarioUnico;
    property UserID         : String  read FUserID          write FUserID;

    procedure CarregaDadosConexao;
    procedure AtualizaCMUserID(iTipo      : Integer;
                               iIDUsuario : Int64
                              );
    function RetornaTipoConexao : Boolean;


    //Cássio - Inicio
    function RetornaCaminhoArquivos(iIdEmpresa: Integer): String;
    //Cássio - Fim


    property GravaRegister : Boolean    read FGravaRegister   write FGravaRegister;

  published
    { Published declarations }

  end;

  procedure AbreItemMenu(ItemMenu : String);


var
   Sistema: TSistema;
   FuncaoGeral: TFuncaoGeral;
   DiasUteis: TDiasUteis;

implementation

uses uMidasUtil, fParamSysPadrao, uString, uVersoes, JclFileUtils,
     uCtrlPadroes, uMensErro, uDataBase, uCMFileUtils, uCmRegister, uCMSQL50, dBaseDados;

constructor  TSistema.Create;
var i : integer;
begin
     inherited Create;

     FGravaRegister     := True;

     FTipoFiltroUsuario := fuALL;

     FLoadOldReport := True;

     FUsaTecladoLogin := False;

     FEmailOnError := '';
     fNomeModulo := '';

     fVersaoDPL := TStringList.Create;
     fNomeDPL   := TStringList.Create;
     fDataDPL   := TStringList.Create;
     fArqDPL    := TStringList.Create;

     FUsaPlanoPatro := False;

     for i := 0 to V_DPL do
     begin
          fNomeDPL.Add(V_BIBLIOTECAS[i, NOME_DPL]);
          fVersaoDPL.Add(V_BIBLIOTECAS[i, VERSAO_DPL]);
          fDataDPL.Add(V_BIBLIOTECAS[i, DATA_DPL]);
          fArqDPL.Add(V_BIBLIOTECAS[i,PROJETO_DPL]);
     end;

     FPedeLoginEmpresa := True;

     Registry := TRegistry.Create;
     Registry.RootKey := HKEY_CURRENT_USER;
     fIdEmpresa := -1;
     fIdUsuario := -1;
     fMudouEmpresa := false;
     fMudouUsuario := false;
     fSoUpperPessoa := false;
     fUsaEnderecoPessoa := false;
     fObrigaDocPessoa := false;
     fDuplicaDocPessoa := True;
     fViculaModuloxPessoa := false;
     FPedeLogin := true;
     FFezLogin := false;
     fTempPath := cmGetTempPath;
     FDirVersao := PathAddSeparator(DiretorioVersao);
     FIdRad := 0;
     fSenhaLetra        := True;
     fSenhaNumero       := True;
     fSenhaRepete       := False;
     fSenhaAlteraSuper  := False;
     fSenhaTamMin       := 6;
     fSenhaTamHistorico := 5;
     fTempoProtecao     := -1;
     fSenhaSuper        := '';
     fValidaSenhaNome   := False;


     if not GetEnvironmentVar('CMBplPath', FDirSys, true) then
       FDirSys := cmGetSysPath;
     FDirSys := FDirSys + '\';

     FIdiomaAtivo := GetIdiomaAtivo;

     Application.UpdateFormatSettings := False;

     ShortDateFormat := 'dd/mm/yyyy';

     ShortMonthNames[1]  := 'Jan';
     ShortMonthNames[2]  := 'Fev';
     ShortMonthNames[3]  := 'Mar';
     ShortMonthNames[4]  := 'Abr';
     ShortMonthNames[5]  := 'Mai';
     ShortMonthNames[6]  := 'Jun';
     ShortMonthNames[7]  := 'Jul';
     ShortMonthNames[8]  := 'Ago';
     ShortMonthNames[9]  := 'Set';
     ShortMonthNames[10] := 'Out';
     ShortMonthNames[11] := 'Nov';
     ShortMonthNames[12] := 'Dez';

     LongMonthNames[1]  := 'Janeiro';
     LongMonthNames[2]  := 'Fevereiro';
     LongMonthNames[3]  := 'Março';
     LongMonthNames[4]  := 'Abril';
     LongMonthNames[5]  := 'Maio';
     LongMonthNames[6]  := 'Junho';
     LongMonthNames[7]  := 'Julho';
     LongMonthNames[8]  := 'Agosto';
     LongMonthNames[9]  := 'Setembro';
     LongMonthNames[10] := 'Outubro';
     LongMonthNames[11] := 'Novembro';
     LongMonthNames[12] := 'Dezembro';

     ShortDayNames[1] := 'Dom';
     ShortDayNames[2] := 'Seg';
     ShortDayNames[3] := 'Ter';
     ShortDayNames[4] := 'Qua';
     ShortDayNames[5] := 'Qui';
     ShortDayNames[6] := 'Sex';
     ShortDayNames[7] := 'Sab';

     LongDayNames[1]  := 'Domingo';
     LongDayNames[2]  := 'Segunda';
     LongDayNames[3]  := 'Terça';
     LongDayNames[4]  := 'Quarta';
     LongDayNames[5]  := 'Quinta';
     LongDayNames[6]  := 'Sexta';
     LongDayNames[7]  := 'Sábado';

     FSeqCliente    := false;
     FSeqServidor   := false;
     FConectaRemoto := false;
     FUsaRAD        := false;
     FUltScript     := '';

     try
       If Registry.OpenKey('Software\CM', True) then
       begin
          Try
             fLogoCM := Registry.ReadBool(KEY_TIPO_SPLASH);
          Except
             fLogoCM := True;
             Registry.WriteBool(KEY_TIPO_SPLASH,True);
          End;
       end
       else
       begin
          fLogoCM := True;
          If Registry.OpenKeyReadOnly('Software\CM') then
          begin
             Try
                fLogoCM := Registry.ReadBool(KEY_TIPO_SPLASH);
             Except
                fLogoCM := True;
                Registry.WriteBool(KEY_TIPO_SPLASH,True);
             End;
          end
          else
          begin
             FGravaRegister := False;
          end;
       end;
     except

     end;

     Registry.CloseKey;

     SetConnectionSide(cnsServer);
     SetConnectionType(cntBDE);
     SetMidleWareConnection(mwcSocket);

     FWebUrl := '';
     FDcomComputerName := '';
     FSocketHost := 'LOCALHOST';

     FNomeServidorSecundario := '';
     FNomeServidor := '';
     FUsuarioUnico := False;

end;

destructor TSistema.Destroy;
begin
     Registry.free;
     fVersaoDPL.free;
     fNomeDPL.free;
     fDataDPL.free;
     fArqDPL.free;


     inherited Destroy;
end;

procedure TSistema.SetNomeModulo(n : String);
Var
   bShowParam: Boolean;

  //Everson Cunha - SIG120917 - Ini
  procedure CarregaDadosConexao_Hom;
  var
     Ini      : TIniFile;
     sBaseAux : String;
  begin
    if FileExists(ExtractFilePath(Application.ExeName) + 'CONEXAO_HOM.INI') then
    begin
      Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'CONEXAO_HOM.INI');

      sBaseAux := Ini.ReadString('Conexao', 'Alias', '');

      if sBaseAux <> '' then
        fAliasServidor := sBaseAux;

      Ini.Free;
    end;
  end;
  //Everson Cunha - SIG120917 - Fim
begin
   if (fNomeModulo = '') then
   begin
      fNomeModulo := n;
      If Trim(nomemodulo) <> '' Then
      Begin
         GetInfoServidor(True);

         With TCmRegister.Create Do
            Try
               bShowParam := (LerNumeroReg(HKEY_CURRENT_USER,'Software\CM',KEY_SHOWPARAM,0) = 1);
            finally
               Free;
            End;

         if not FGravaRegister then bShowParam := True;

         If (UpperCase(ParamStr(1)) = '-P') Or bShowParam Then
         Begin
            With TFrmParamSysPadrao.Create(Application) Do
              Try
                ShowModal;
              finally
                Free;
              End;
         End;

         //Atualizar o splash
         if UpperCase(ExtractFilePath(Application.ExeName)) <> 'C:\CMSOLUCOES\EXECUTAVEIS\BIN\' then //Everson Cunha - SIG120917
           CarregaDadosConexao_Hom;                                                                  //Everson Cunha - SIG120917
      End;
   end;
end;

procedure TSistema.SetIdiomaAtivo(n : smallint);
begin
     if FIdiomaAtivo <> n then
     begin
          FIdiomaAtivo := n;
          with Registry do
          begin
             try
               OpenKey('Software\CM', True);
               try
                  WriteInteger(KEY_IDIOMA_ATIVO, n);
               except
                  FGravaRegister := False;
               end;
             except
               OpenKeyReadOnly('Software\CM');
               FGravaRegister := False;
             end;
             CloseKey;
          end;
     end;
end;

function TSistema.GetIdiomaAtivo : SmallInt;
begin
     with Registry do
     begin
        try
          OpenKey('Software\CM', True);
        except
          OpenKeyReadOnly('Software\CM');
          FGravaRegister := False;
        end;
          try
             Result := ReadInteger(KEY_IDIOMA_ATIVO);
          except
             Result := 1;
             try
                WriteInteger(KEY_IDIOMA_ATIVO, 1);
              except
                 FGravaRegister := False;
              end;
          end;
        CloseKey;
     end;
end;

function TSistema.GetNomeCompleto: String;
begin
     Result := fNomeModulo + ' v.' + fVersao;
end;

function TSistema.GetInfoServidor(const bMudaAlias : Boolean): Boolean;
var fParam : string;
begin
     fDriverServidor := DriverOracle;
     fConnectionSide := TConnectionSide(0);
     FConnectionType := TDbConnectionType(0);
     FSocketHost     := 'LOCALHOST';
     SetMidleWareConnection(TMidleWareConnection(0));

     with Registry do
     begin
          try
            OpenKey('Software\CM\'+fNomeModulo, True);
          except
            OpenKeyReadOnly('Software\CM\'+fNomeModulo);
            FGravaRegister := False;
          end;

          try
             fDriverServidor := ReadString(KEY_DRIVER_SERVIDOR);
             if FDriverServidor = '' then
             begin
                fDriverServidor := DriverOracle;
                try
                   WriteString(KEY_DRIVER_SERVIDOR, FDriverServidor);
                except
                   FGravaRegister := False;
                end;
             end;

             FNomeServidor := ReadString(KEY_NOME_SERVIDOR);
             if FNomeServidor = '' then
             begin
                FNomeServidor := '';
                try
                   WriteString(KEY_NOME_SERVIDOR, FNomeServidor);
                except
                   FGravaRegister := False;
                end;
             end;

             Try
               fConnectionSide := TConnectionSide(StrToIntDef(ReadString(KEY_CONNECTION_SIDE),0));
             Except
               fConnectionSide := TConnectionSide(0);
               try
                  WriteString(KEY_CONNECTION_SIDE, IntToStr(Integer(fConnectionSide)));
               except
                  FGravaRegister := False;
               end;
             End;

             Try
               FConnectionType :=  TDbConnectionType(StrToIntDef(ReadString(KEY_CONNECTION_TYPE),0));
             Except
               FConnectionType := TDbConnectionType(0);
               try
                  WriteString(KEY_CONNECTION_TYPE, IntToStr(Integer(FConnectionType)));
               except
                  FGravaRegister := False;
               end;
             End;

             FWebUrl  := ReadString(KEY_WEB_URL);
             if FWebUrl = '' then
             begin
                FWebUrl := '';
                try
                   WriteString(KEY_WEB_URL, FWebUrl);
                except
                   FGravaRegister := False;
                end;
             end;

             FDcomComputerName := ReadString(KEY_DCOM_COMPUTERNAME);

             if FDcomComputerName = '' then
             begin
                FDcomComputerName := '';
                try
                   WriteString(KEY_DCOM_COMPUTERNAME, FDcomComputerName);
                except
                   FGravaRegister := False;
                end;
             end;

             FSocketHost := ReadString(KEY_SOCKET_HOST);
             if FSocketHost = '' then
             begin
                FSocketHost := 'LOCALHOST';
                try
                   WriteString(KEY_SOCKET_HOST, FSocketHost);
                except
                   FGravaRegister := False;
                end;
             end;

             Try
               SetMidleWareConnection(TMidleWareConnection(StrToIntDef(ReadString(KEY_MIDLEWARE_CONNECTION),0)));
             Except
               SetMidleWareConnection(TMidleWareConnection(0));
               try
                  WriteString(KEY_MIDLEWARE_CONNECTION, IntToStr(Integer(FMidleWareConnection)));
               except
                  FGravaRegister := False;
               end;
             End;

             if bMudaAlias then
             begin
                fAliasServidor  := ReadString(KEY_ALIAS_SERVIDOR);
                if FAliasServidor = '' then
                begin
                   FAliasServidor := 'PRODUCAO';
                   try
                      WriteString(KEY_ALIAS_SERVIDOR, FAliasServidor);
                   except
                      FGravaRegister := False;
                   end;
                end;
             end;
          except
                fDriverServidor := DriverOracle;
                FAliasServidor  := 'PRODUCAO';
                try
                   WriteString(KEY_DRIVER_SERVIDOR, FDriverServidor);
                   WriteString(KEY_ALIAS_SERVIDOR, FAliasServidor);
                   WriteString(KEY_NOME_SERVIDOR, FNomeServidor);
                except
                   FGravaRegister := False;
                end;
          end;
          CloseKey;

          try
             OpenKey('\Software\CM\'+fNomeModulo+'\Parametros Servidor', True);
          except
             OpenKeyReadOnly('\Software\CM\'+fNomeModulo+'\Parametros Servidor');
          end;

          try
             fParam := ReadString(KEY_LANGDRIVER);
             if fParam = '' then
                try
                   WriteString(KEY_LANGDRIVER,'BLLT1PT0');
                except
                   FGravaRegister := False;
                end;
          except
              try
                WriteString(KEY_LANGDRIVER,'BLLT1PT0');
              except
                FGravaRegister := False;
              end;
          end;
          CloseKey;

          if CompareText(fDriverServidor, DriverOracle) = 0 then
             fOwnerServidor := 'CM.'
          else
              fOwnerServidor := '';

          try
             OpenKey('Software\CM\'+fNomeModulo, True);
          except
             OpenKeyReadOnly('Software\CM\'+fNomeModulo);
          end;
          try
             FNomeServidorSecundario := ReadString(KEY_NOME_SERVIDOR_SECUNDARIO);
             if FNomeServidorSecundario = '' then
             begin
                  FNomeServidorSecundario := '';
                  try
                     WriteString(KEY_NOME_SERVIDOR_SECUNDARIO, FNomeServidorSecundario);
                  except
                     FGravaRegister := False;
                  end;
             end;

             fDriverServidorRemoto := ReadString(KEY_DRIVER_SERVIDOR_REMOTO);
             if fDriverServidorRemoto = '' then
             begin
                  fDriverServidorRemoto := DriverOracle;
                  try
                     WriteString(KEY_DRIVER_SERVIDOR_REMOTO, fDriverServidorRemoto);
                  except
                     FGravaRegister := False;
                  end;
             end;

             fAliasServidorRemoto  := ReadString(KEY_ALIAS_SERVIDOR_REMOTO);
             if fAliasServidorRemoto = '' then
             begin
                  fAliasServidorRemoto := 'PRODUCAO';
                  try
                     WriteString(KEY_ALIAS_SERVIDOR_REMOTO, fAliasServidorRemoto);
                  except
                     FGravaRegister := False;
                  end;
             end;

          except
                  fDriverServidorRemoto := DriverOracle;
                  fAliasServidorRemoto := 'PRODUCAO';
                  try
                     WriteString(KEY_DRIVER_SERVIDOR_REMOTO, fDriverServidorRemoto);
                     WriteString(KEY_ALIAS_SERVIDOR_REMOTO, fAliasServidorRemoto);
                     WriteString(KEY_NOME_SERVIDOR_SECUNDARIO, FNomeServidorSecundario);
                  except
                     FGravaRegister := False;
                  end;
          end;
          CloseKey;

          try
             OpenKey('\Software\CM\'+fNomeModulo+'\Parametros Servidor Remoto', True);
          except
             OpenKeyReadOnly('\Software\CM\'+fNomeModulo+'\Parametros Servidor Remoto');
          end;
          try
             fParam := ReadString(KEY_LANGDRIVER);
             if fParam = '' then
                try
                   WriteString(KEY_LANGDRIVER,'BLLT1PT0');
                except
                   FGravaRegister := False;
                end;
          except
             try
                WriteString(KEY_LANGDRIVER,'BLLT1PT0');
             except
                FGravaRegister := False;
             end;
          end;
          CloseKey;

          if CompareText(fDriverServidorRemoto, DriverOracle) = 0 then
             fOwnerServidorRemoto := 'CM.'
          else
              fOwnerServidorRemoto := '';

          If (fDriverServidor = DriverOracle) Then
              iTipoBD_Padrao := 0
          Else
             If (fDriverServidor = DriverDb2) Then
             Begin
                 IsDB2_Padrao := True;
                 iTipoBD_Padrao := 1;
             End
             Else
                If (fDriverServidor = DriverSQL) Then
                    iTipoBD_Padrao := 2
                Else
                   If (fDriverServidor = DriverSQLODBC) Then
                      iTipoBD_Padrao := 3
                   Else
                      If (fDriverServidor = DriverPGODBC) Then
                         iTipoBD_Padrao := 4;
     end;

     Result := true;
end;

function TSistema.GetGlobalRegString(Item: String; var Value: String): Boolean;
begin
     Result := False;
     Key := 'Software\CM';
     try

        if Registry.OpenKeyReadOnly(Key) then
        begin
             if Registry.ValueExists(Item) then
             begin
                  Value := Registry.ReadString(Item);
                  Result := True;
             end
             else
                 ShowMessage('Chave: '+ Item +' não encontrada');
        end
        else
            ShowMessage('Chave: '+ Key+' não encontrada');
     except
         FGravaRegister := False;
     end;
     Registry.CloseKey;
end;

function TSistema.GetGlobalRegInteger(Item: String; var Value: Integer): Boolean;
begin
	Result := False;
	Key := 'Software\CM';
        try

         if Registry.OpenKeyReadOnly(Key) then begin
	    if Registry.ValueExists(Item) then begin
	       Value := Registry.ReadInteger(Item);
	       Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
         else ShowMessage('Chave: '+ Key+' não encontrada');
      except
          FGravaRegister := False;
      end;
      Registry.CloseKey;
end;

function TSistema.GetGlobalRegFloat(Item: String; var Value: Double): Boolean;
begin
   Result := False;
   Key := 'Software\CM';
   try

      if Registry.OpenKeyReadOnly(Key) then begin
         if Registry.ValueExists(Item) then begin
            Value := Registry.ReadFloat(Item);
           Result := True;
      end
      else ShowMessage('Chave: '+ Item +' não encontrada');
             end
      else ShowMessage('Chave: '+ Key+' não encontrada');
   except
        FGravaRegister := False;
   end;
   Registry.CloseKey;
end;

function TSistema.GetGlobalRegBoolean(Item: String; var Value: Boolean): Boolean;
begin
	Result := False;
 	Key := 'Software\CM';
        try

		if Registry.OpenKeyReadOnly(Key) then begin
			if Registry.ValueExists(Item) then begin
				Value := Registry.ReadBool(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
        except
          FGravaRegister := False;
        end;
   Registry.CloseKey;
end;

function TSistema.GetGlobalRegDateTime(Item: String; var Value: TDateTime): Boolean;
begin
	Result := False;
 	Key := 'Software\CM';
        try

		if Registry.OpenKeyReadOnly(Key) then begin
			if Registry.ValueExists(Item) then begin
				Value := Registry.ReadDateTime(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
         except
            FGravaRegister := False;
         end;
   Registry.CloseKey;
end;

function TSistema.GetRegString(SubKey: String; Item: String; var Value: String): Boolean;
begin
	Result := False;
 	Key := 'Software\CM\'+fNomeModulo;
        try
	if not (SubKey = '') then Key := Key+'\'+SubKey;

		if Registry.OpenKeyReadOnly(Key) then begin
			if Registry.ValueExists(Item) then begin
				Value := Registry.ReadString(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
         except
          FGravaRegister := False;
         end;
   Registry.CloseKey;
end;

function TSistema.GetRegInteger(SubKey: String; Item: String; var Value: Integer): Boolean;
begin
	Result := False;
 	Key := 'Software\CM\'+fNomeModulo;
	if not (SubKey = '') then Key := Key+'\'+SubKey;
        try

		if Registry.OpenKeyReadOnly(Key) then begin
			if Registry.ValueExists(Item) then begin
				Value := Registry.ReadInteger(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
         except
          FGravaRegister := False;
         end;

   Registry.CloseKey;
end;

function TSistema.GetRegFloat(SubKey: String; Item: String; var Value: Double): Boolean;
begin
	Result := False;
 	Key := 'Software\CM\'+fNomeModulo;
	if not (SubKey = '') then Key := Key+'\'+SubKey;
        try

		if Registry.OpenKeyReadOnly(Key) then begin

			if Registry.ValueExists(Item) then begin
				Value := Registry.ReadFloat(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
         except
          FGravaRegister := False;
         end;

   Registry.CloseKey;
end;

function TSistema.GetRegBoolean(SubKey: String; Item: String; var Value: Boolean): Boolean;
begin
	Result := False;
 	Key := 'Software\CM\'+fNomeModulo;
	if not (SubKey = '') then Key := Key+'\'+SubKey;
        try

		if Registry.OpenKeyReadOnly(Key) then begin

			if Registry.ValueExists(Item) then begin
				Value := Registry.ReadBool(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
         except
          FGravaRegister := False;
         end;
   Registry.CloseKey;
end;

function TSistema.GetRegDateTime(SubKey: String; Item: String; var Value: TDateTime): Boolean;
begin
	Result := False;
 	Key := 'Software\CM\'+fNomeModulo;
	if not (SubKey = '') then Key := Key+'\'+SubKey;
        try

		if Registry.OpenKeyReadOnly(Key) then begin

			if Registry.ValueExists(Item) then begin
				Value := Registry.ReaddateTime(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
         except
          FGravaRegister := False;
         end;

   Registry.CloseKey;
end;


function TSistema.GetServidorParams(TipoServidor : TTipoServidor; var ListaNomes, ListaValores : TStringList): Boolean;
var i : integer;
    sufxServidor : string;
begin
     if TipoServidor = tsRemoto then
        sufxServidor := ' Remoto'
     else
         sufxServidor := '';

     ListaNomes.Clear ;
     ListaValores.Clear ;
     Key := 'Software\CM\'+fNomeModulo+'\Parametros Servidor'+sufxServidor;
     try

        if Registry.OpenKeyReadOnly(Key) then
        begin
           Registry.GetValueNames(ListaNomes);
           for i := 0 to ListaNomes.count-1 do
               ListaValores.Add(Registry.ReadString(ListaNomes[i]));
           Result := true;
           Registry.CloseKey;
        end
        else
           Result := false;
     except
        FGravaRegister := False;
        Result := false;
     end;

end;

function TSistema.VersaoOk : boolean;
var batualizado : boolean;
begin
     Result := true;
     batualizado :=false;
     CarregaDadosConexao;

     //if FDirVersao <> '' then                                                       //Everson Cunha - SIG121285
     if (FDirVersao <> '') and (Pos('PRODUCAO', UpperCase(fAliasServidor)) <> 0) then //Everson Cunha - SIG121285
     begin
          if not FileExists(FDirVersao+ExtractFileName(Application.ExeName)) then

          else
          begin
               if (FileAge(FDirVersao+ExtractFileName(Application.ExeName)) > FileAge(Application.ExeName)) Or
                  (Not DPLOk)
               then
               begin
                    if MsgDlg('Existe uma versão mais recente do Módulo: '+AnsiUpperCase(Sistema.NomeAplicativo) + #10#13+
                              'Deseja atualizar agora?', 'Atualização de Versão', mtConfirmation ,[mbYes, mbNo],0) = mrYes then
                    begin
                         ExecuteFile(FDirVersao+'AtuVersaoCM', FDirVersao+' '+ParamStr(0), false, true);
                         Result := false;
                         batualizado :=true;
                    end else begin

                         MsgDlg('Contate a área de Infraestrutura.', 'Atualização de Versão', mtConfirmation ,[mbOk],0);
                         Result := false;
                    end;
               end;


               if FUsuarioUnico then
               begin
                   if (FileAge(FDirVersao+'CONEXAO.INI') > FileAge(ExtractFilePath(Application.ExeName)+'CONEXAO.INI') ) and (batualizado = false) then

                  begin
                  if MsgDlg('Existe uma versão mais recente da conexão: CONEXAO.INI'+ #10#13+
                             'Deseja atualizar agora?', 'Atualização de Versão', mtConfirmation ,[mbYes, mbNo],0) = mrYes then
                              begin
                         ExecuteFile(FDirVersao+'AtuVersaoCM', FDirVersao+' '+ParamStr(0), false, true);
                         Result := false;
                    end else begin

                         MsgDlg('Contate a área de Infraestrutura.', 'Atualização de Versão', mtConfirmation ,[mbOk],0);
                         Result := false;
                    end;
                  end;
               end;
          end;

          //Everson Cunha - SIG 77836 Tibero - 04/11/2018 - Início
          if FileExists(FDirVersao + 'oci.dll') then
          begin
            if (FileAge(FDirVersao + 'oci.dll') <> FileAge(GetCurrentDir + '\oci.dll')) or (FileAge(GetCurrentDir + '\oci.dll') = -1) then
            begin
              if MsgDlg('É necessário atualizar as bibliotecas do sistema para que funcione corretamente' + #10#13+
                        'Deseja atualizar agora?', 'Atualização de Versão', mtConfirmation ,[mbYes, mbNo],0) = mrYes then
              begin
                ExecuteFile(FDirVersao+'AtuVersaoCM', FDirVersao+' '+ParamStr(0), false, true);
                Result := false;
                batualizado :=true;
              end
              else
              begin
                MsgDlg('Contate a área de Infraestrutura.', 'Atualização de Versão', mtConfirmation ,[mbOk],0);
                Result := false;
              end;
            end;
          end;
          //Everson Cunha - SIG 77836 Tibero - 04/11/2018 - Fim
     end;
end;


function TSistema.DPLOk : boolean;

Var
   NomeDpls : Array [0..15] of String;
   X :Integer;
   FileHandle : integer;
   i : integer;
   LstFile :TStrings;

begin

    Result := true;

    if DirectoryExists(FDirVersao+ '..\lib\') then
    begin
      LstFile := TStringList.Create;
      Try
        BuildFileList(FDirVersao+ '..\lib\' + '*.bpl' ,faAnyFile,LstFile);

        For i:=0 To LstFile.Count - 1 Do
        Begin

          if FileExists(FDirSys + lstFile[i]) then begin

            if FileAge(FDirVersao+'..\lib\' + lstFile[i]) > FileAge(FDirSys + lstFile[i])  then Begin
               Result := False;
               Break;
            end;
          end;
        end;
      finally
        LstFile.Free;
      end;
    end;
end;


function TSistema.DiretorioVersao : string;
begin
     with Registry do
     begin
        try
          try
             OpenKey('Software\CM', True);
          except
             OpenKeyReadOnly('Software\CM');
          end;

          Result := ReadString(KEY_DIR_VERSAO);
          if Result = '' then
          begin
             try
                WriteString(KEY_DIR_VERSAO, '')
             except
                FGravaRegister := False;
             end;
          end
          else
              if Copy(Result,Length(Result),1) <> '\' then
                 Result := Result+'\';
        except
          FGravaRegister := False;
        end;

          CloseKey;
     end;
end;

procedure AbreItemMenu(ItemMenu : String);
begin
  TMenuItem(Application.MainForm.FindComponent(ItemMenu)).Click;
end;

procedure TSistema.SetConnectionSide(const Value: TConnectionSide);
begin
  FConnectionSide := Value;
end;

procedure TSistema.SetViculaModuloxPessoa(const Value: boolean);
begin
  FViculaModuloxPessoa := Value;
end;

procedure TSistema.SetUsaLogOperacoes(const Value: Boolean);
begin
  FUsaLogOperacoes := Value;
end;

function TSistema.GravaLogOperacoes(sDescOperacao: String;  bCommit: Boolean = False): Boolean;
Begin
   Result := Padroes.GravaLogOperacoes(fidEmpresa, fidModulo, fidUsuario, sDescOperacao, bCommit);
end;

procedure TSistema.SetConnectionType(const Value: TDbConnectionType);
begin
  FConnectionType := Value;
end;

procedure TSistema.SetMidleWareConnection(
  const Value: TMidleWareConnection);
begin
  If (FMidleWareConnection <> Value) And (fConnectionSide = cnsClient) Then
  Begin

     FAppRemoteServer.free;

     Case Value of
       mwcSocket:
       Begin


          FAppRemoteServer := TSocketConnection.Create(nil);
          TSocketConnection(FAppRemoteServer).Host := SocketHost;
       End;
       mwcDCOM:
       Begin


          FAppRemoteServer := TDCOMConnection.Create(nil);
          TDCOMConnection(FAppRemoteServer).ComputerName := DcomComputerName;
          TDCOMConnection(FAppRemoteServer).LoginPrompt := false;
       End;
       mwcWEB:
       Begin


          FAppRemoteServer := TWebConnection.Create(nil);
          TWebConnection(FAppRemoteServer).url := WebUrl;
       End;
     End;
  End;

  FMidleWareConnection := Value;
end;

procedure TSistema.SetDcomComputerName(const Value: String);
begin
  FDcomComputerName := Value;
end;

procedure TSistema.SetSocketHost(const Value: String);
begin
  FSocketHost := Value;
end;

procedure TSistema.SetWebUrl(const Value: String);
begin
  FWebUrl := Value;
end;



procedure TSistema.SetEmailOnError(const Value: String);
begin
  FEmailOnError := Value;
end;

function TSistema.GetEmailOnError: String;
begin
  //Henrique Massão 12/01/2009
  If FEmailOnError = '' Then
     FEmailOnError := 'suporteplanus@funcef.com.br';

  Result := FEmailOnError;
end;

procedure TSistema.SetParametrosSeguranca;
Begin
   With TClientDataSet.Create(nil) Do
     Try
       Data := Padroes.GetDataPacket(' SELECT ' +
                   '   FLGSENHALETRAS, FLGSENHANUMEROS, FLGREPETESENHA, ' +
                   '   FLGALTSENHASUPER, TAMMINSENHA, TAMHISTORICOSENHA, ' +
                   '   TEMPOTRAVA, SENHASUPER, FLGVALSENHANOME ' +
                   ' FROM ' +
                   '    SEGURANCA ');
       If IsEmpty Then
       Begin
         fSenhaLetra        := True;
         fSenhaNumero       := True;
         fSenhaRepete       := False;
         fSenhaAlteraSuper  := False;
         fSenhaTamMin       := 6;
         fSenhaTamHistorico := 5;
         fTempoProtecao     := 0;  // 10 (dez) minutos
         fSenhaSuper        := '';
         fValidaSenhaNome   := false;
       End
       Else
       Begin
         fSenhaLetra        := ( FieldByName('FLGSENHALETRAS').AsString = 'S' );
         fSenhaNumero       := ( FieldByName('FlgSenhaNumeros').AsString = 'S' );
         fSenhaRepete       := ( FieldByName('FlgRepeteSenha').AsString = 'S' );
         fSenhaAlteraSuper  := ( FieldByName('FlgAltSenhaSuper').AsString = 'S' );
         fSenhaTamMin       := FieldByName('TamMinSenha').AsInteger;
         fSenhaTamHistorico := FieldByName('TamHistoricoSenha').AsInteger;
         fTempoProtecao     := FieldByName('TempoTrava').AsInteger;
         fSenhaSuper        := FieldByName('SenhaSuper').AsString;
         fValidaSenhaNome   := (FieldByName('FLGVALSENHANOME').AsString = 'S');
       End;

       Close;
     finally
       Free;
     End;
End;

function TSistema.GetAppRemoteServer: TDispatchConnection;
begin
   Case FMidleWareConnection of
     mwcSocket:
        Result := TSocketConnection(FAppRemoteServer);
     mwcDCOM:
        Result := TDCOMConnection(FAppRemoteServer);
     mwcWEB:
        Result := TWebConnection(FAppRemoteServer);
     Else
        Result := nil;
   End;
end;

procedure TSistema.SetAppRemoteServer(const Value: TDispatchConnection);
begin
   FAppRemoteServer := Value;
end;

procedure TSistema.SetPedeLoginEmpresa(const Value: boolean);
begin
  FPedeLoginEmpresa := Value;
end;

procedure TSistema.SetNomeServidor(const Value: String);
begin
  FNomeServidor := Value;
end;

procedure TSistema.SetNomeServidorSecundario(const Value: String);
begin
  FNomeServidorSecundario := Value;
end;

procedure TSistema.SetMudouEmpresa(const Value: Boolean);
begin
  FMudouEmpresa := Value;
end;

procedure TSistema.SetMudouUsuario(const Value: Boolean);
begin
  FMudouUsuario := Value;
end;

procedure TSistema.SetUsaTecladoLogin(const Value: Boolean);
begin
  FUsaTecladoLogin := Value;
end;

procedure TSistema.SetLoadOldReport(const Value: Boolean);
begin
  FLoadOldReport := Value;
end;

procedure TSistema.SetTipoFiltroUsuario(const Value: TFiltroUsu);
begin
  FTipoFiltroUsuario := Value;
end;



procedure TSistema.AtualizaCMUserID(iTipo: Integer; iIDUsuario: Int64);
begin
   if FUsuarioUnico then
   begin
      dtmBaseDados.spAtualizaCMUserID.ParamByName('ITIPO').AsInteger    := iTipo;
      dtmBaseDados.spAtualizaCMUserID.ParamByName('SSESSION').AsString  := FUserID;
      dtmBaseDados.spAtualizaCMUserID.ParamByName('IUSUARIO').AsInteger := iIDUsuario;
      dtmBaseDados.spAtualizaCMUserID.ExecProc;
   end;
end;



procedure TSistema.CarregaDadosConexao;
var
   Ini    : TIniFile;
begin
   if FileExists(ExtractFilePath(Application.ExeName) + 'CONEXAO.INI') then
   begin
      Ini              := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'CONEXAO.INI');
      FOwner           := Ini.ReadString('Conexao','Owner','CM');
      FUserUnico       := Ini.ReadString('Conexao','UserUnico','CM0');
      FSenhaUserUnico  := DeCriptografarString(Ini.ReadString('Conexao','SenhaUserUnico',''),CKEYCRIPTO);

      fOwnerServidor   := FOwner + '.';
      Ini.Free;
      FUsuarioUnico := True;
   end
   else
      FUsuarioUnico := False;
end;



function TSistema.RetornaTipoConexao: Boolean;
begin
   dtmBaseDados.qryParametroGlobal.Open;
   Result := (dtmBaseDados.qryParametroGlobal.FieldByName('FLGTIPOCONEXAO').AsInteger = 1);
   dtmBaseDados.qryParametroGlobal.Close;

   if Result then
   begin
      dtmBaseDados.spUserId.ExecProc;
      FUserID := dtmBaseDados.spUserId.ParamByName('Result').AsString;
   end;
end;



procedure TSistema.SetVersaoRad(const Value: String);
begin
  FVersaoRad := Value;
end;

function TSistema.RetornaCaminhoArquivos(iIdEmpresa: Integer): String;
var
  qry : TQuery;
  sSQL: string;
begin
  qry := TQuery.Create(nil);
  try
    qry.Databasename := 'BaseDados';
    sSQL := 'SELECT CAMINHOARQUIVO ' + #13#10 +
            '  FROM PARAMGLOBAL    ' + #13#10 +
            ' WHERE IDPESSOA = ' + IntToStr(iIdEmpresa);
    qry.SQL.Text := sSQL;
    qry.Open;
    Result:= qry.FieldByName('CAMINHOARQUIVO').AsString;

  //Ádler - Inicio
  if not DirectoryExists(Result) then
    if not ForceDirectories(Result) then
      showmessage('Não foi possível criar diretório');
  //Ádler - Fim
  finally
    FreeAndNil(qry);
  end;
end;

end.



