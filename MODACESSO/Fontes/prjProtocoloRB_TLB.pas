unit prjProtocoloRB_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 28/03/2006 16:40:45 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Documentos\SistemasRH\Catracas\Rodbel\2701_DLL\ProtocoloRB.dll (1)
// LIBID: {77F20CB9-C963-43B2-A513-079644B1AA94}
// LCID: 0
// Helpfile: 
// HelpString: Rodbel - Protocolo 2701
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// Errors:
//   Error creating palette bitmap of (TcRBDll) : No Server registered for this CoClass
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
//*{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
//*{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  prjProtocoloRBMajorVersion = 1;
  prjProtocoloRBMinorVersion = 0;

  LIBID_prjProtocoloRB: TGUID = '{77F20CB9-C963-43B2-A513-079644B1AA94}';

  IID__cRBDll: TGUID = '{40FB9001-1B72-4A7F-BF02-490489614050}';
  CLASS_cRBDll: TGUID = '{A4609C15-1AB9-41A1-B9CE-14E11303BA39}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum EnTipoAcinamento
type
  EnTipoAcinamento = TOleEnum;
const
  SemAcionamento = $00000000;
  FechaduraSemSensor = $00000002;
  FechaduraComSensor = $00000007;
  CatracaDeEntrada = $00000008;
  CatracaDeSaida = $00000009;
  CatracaBidirecionalDepSensor = $0000000A;
  CatracaEntradaSaidaLivre = $0000000B;
  CatracaBidirecionalIndepSensor = $0000000D;
  CatracaCofre3Leitores = $0000000F;
  CatracaCofre2Leitores = $00000010;
  FechaduraDuplaSemSensor = $00000011;

// Constants for enum EnTipoLiberacao
type
  EnTipoLiberacao = TOleEnum;
const
  NaoLiberaAcesso = $00000000;
  LiberaAcesso = $00000001;
  LiberaAcessoComSenha = $00000002;
  LiberaAcessoRespNumCartao = $00000003;

// Constants for enum EnDirecao
type
  EnDirecao = TOleEnum;
const
  NaoLibera = $FFFFFFFF;
  LiberaEntrada = $00000000;
  LiberaSaida = $00000001;
  LiberaAmbos = $00000002;

// Constants for enum EnSinalSonoro
type
  EnSinalSonoro = TOleEnum;
const
  AcessoLiberado = $00000000;
  AcessoNegado = $00000001;
  Atencao = $00000002;
  Alarme = $00000003;
  LeituraOK = $00000004;
  Silencio = $00000005;

// Constants for enum EnViolacao
type
  EnViolacao = TOleEnum;
const
  NaoSinaliza = $00000000;
  SonoroInterno = $00000001;
  AcionamentoSirene = $00000002;
  SonoroInternoSirene = $00000003;

// Constants for enum EnLibEntradaSaida
type
  EnLibEntradaSaida = TOleEnum;
const
  LiberaTodosCartoes = $00000000;
  BloqueiaTodosCartoes = $00000001;
  ConsultaListaCartao = $00000002;
  ConsultaListaCartaoSenha = $00000004;

// Constants for enum EnHabilitar
type
  EnHabilitar = TOleEnum;
const
  Desabilitada = $00000000;
  Habilitada = $00000001;

// Constants for enum EnPermissoesLocais
type
  EnPermissoesLocais = TOleEnum;
const
  ListaPermissoes = $00000000;
  ListaBloqueios = $00000001;

// Constants for enum EnFinalizador
type
  EnFinalizador = TOleEnum;
const
  SemFinalizador = $00000000;
  FinalizadorEnter = $00000001;

// Constants for enum EnMascara
type
  EnMascara = TOleEnum;
const
  SemMascara = $00000000;
  ZerosEsquerda = $00000001;
  Senha = $00000002;

// Constants for enum TipoLista
type
  TipoLista = TOleEnum;
const
  Todas = $00000000;
  CartoesCodAlternativo = $00000001;
  CodAlternativo = $00000002;
  Feriados = $00000003;
  Turnos = $00000004;
  Jornadas = $00000005;
  MensagensFuncoes = $00000006;
  Sirene = $00000007;

// Constants for enum EnMensagem
type
  EnMensagem = TOleEnum;
const
  Padrao = $00000000;
  MsgUsuario1 = $00000001;
  MsgUsuario2 = $00000002;
  MsgUsuario3 = $00000003;
  MsgUsuario4 = $00000004;
  MsgUsuario5 = $00000005;
  MsgUsuario6 = $00000006;
  MsgUsuario7 = $00000007;
  BloqueioInstalacao = $00000008;
  BloqueioVia = $00000009;
  BloqueioLista = $0000000A;
  BloqueioHorario = $0000000B;
  BloqueioSabado = $0000000C;
  BloqueioDomingo = $0000000D;
  BloqueioContadorAcesso = $0000000E;
  Entrada = $0000000F;
  Saida = $00000010;
  SemAcesso = $00000011;
  Sorteio = $00000012;
  SenhaInvalida = $00000013;
  BloqueioReentrada = $00000014;
  AcessoPermitido = $00000015;
  Funcao00 = $00000050;
  Funcao01 = $00000051;
  Funcao02 = $00000052;
  Funcao03 = $00000053;
  Funcao04 = $00000054;
  Funcao05 = $00000055;
  Funcao06 = $00000056;
  Funcao07 = $00000057;
  Funcao08 = $00000058;
  Funcao09 = $00000059;
  Funcao10 = $0000005A;
  Funcao11 = $0000005B;
  Funcao12 = $0000005C;
  Funcao13 = $0000005D;
  Funcao14 = $0000005E;
  Funcao15 = $0000005F;
  Funcao16 = $00000060;
  Funcao17 = $00000061;
  Funcao18 = $00000062;
  Funcao19 = $00000063;

// Constants for enum EnToqueSirene
type
  EnToqueSirene = TOleEnum;
const
  Ligado = $00000000;
  Desligado = $00000001;

// Constants for enum EnTipoSirene
type
  EnTipoSirene = TOleEnum;
const
  Interno = $00000000;
  Externo = $00000001;
  Auxiliar = $00000002;

// Constants for enum EnResposta
type
  EnResposta = TOleEnum;
const
  Aguardando = $00000000;
  OK = $00000001;
  Erro = $00000002;

// Constants for enum FuncaoRelogio
type
  FuncaoRelogio = TOleEnum;
const
  MensagemStatus = $00000000;
  MensagemNaoTemDados = $00000001;
  MensagemTemDados = $00000002;
  MensagemOK = $00000003;
  MensagemErro = $00000004;
  MensagemDesconhecida = $00000005;

// Constants for enum EnLimite
type
  EnLimite = TOleEnum;
const
  AcessoNaoPermitido = $00000000;
  AcessosQtd1 = $00000001;
  AcessosQtd2 = $00000002;
  AcessosQtd3 = $00000003;
  AcessosQtd4 = $00000004;
  AcessosQtd5 = $00000005;
  AcessosQtd6 = $00000006;
  AcessosQtd7 = $00000007;
  AcessosQtd8 = $00000008;
  AcessoLivre = $00000009;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _cRBDll = interface;
  _cRBDllDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  cRBDll = _cRBDll;


// *********************************************************************//
// Interface: _cRBDll
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {40FB9001-1B72-4A7F-BF02-490489614050}
// *********************************************************************//
  _cRBDll = interface(IDispatch)
    ['{40FB9001-1B72-4A7F-BF02-490489614050}']
    function InitComPort(Port: Integer; BaudRate: Integer; const Parity: WideString; 
                         ByteSize: Integer; const StopBit: WideString): WordBool; safecall;
    function PortOpen: OleVariant; safecall;
    procedure ClosePort; safecall;
    procedure setTipoComunicacao(Tipo: Integer); safecall;
    procedure setTempoDTR(var Tx: Integer; var Rx: Integer); safecall;
    function chegaramDadosRelogio(Relogio: Integer): EnResposta; safecall;
    function getDadosRelogio(Relogio: Integer): WideString; safecall;
    function getFuncaoRelogio(Relogio: Integer): FuncaoRelogio; safecall;
    procedure ResetaFeriados; safecall;
    procedure IncluiFeriado(Dia: Integer; Mes: Integer); safecall;
    procedure rtInsereCartao(Relogio: Integer; const Cartao: WideString; const Senha: WideString); safecall;
    procedure rtRetiraCartao(Relogio: Integer; const Cartao: WideString); safecall;
    procedure rtLimpaListaControle(Relogio: Integer); safecall;
    procedure rtAtualizaData(Relogio: Integer; Data: OleVariant); safecall;
    procedure rtTipoAcionamento(Relogio: Integer; tipoAcionamento: EnTipoAcinamento); safecall;
    procedure rtColetaMantendo(Relogio: Integer); safecall;
    procedure rtColetaEliminando(Relogio: Integer); safecall;
    procedure rtEnviaMsg(Relogio: Integer; const msgDisplay: WideString); safecall;
    procedure rtEnviaLiberacao(Relogio: Integer; TipoLiberacao: EnTipoLiberacao; 
                               const Senha: WideString; const Cartao: WideString; Direcao: EnDirecao); safecall;
    procedure rtEnviaSinalSonoro(Relogio: Integer; SinalSonoro: EnSinalSonoro); safecall;
    procedure rtTipoViolacao(Relogio: Integer; ViolacaoEntrada: EnViolacao; 
                             ViolacaoSaida: EnViolacao); safecall;
    procedure rtParametros(Relogio: Integer; tipoLiberacaoEntrada: EnLibEntradaSaida; 
                           tipoLiberacaoSaida: EnLibEntradaSaida; ConsultaPorSenha: EnHabilitar; 
                           ConsultaporMestre: EnHabilitar; PermissoesLocais: EnPermissoesLocais; 
                           DigitosDoCartao: Integer); safecall;
    procedure rtLerTeclado(Relogio: Integer; Finalizador: EnFinalizador; Mascara: EnMascara; 
                           numeroDigitos: Integer); safecall;
    procedure baInsereCartao(Relogio: Integer; const Cartao: WideString; Limite: EnLimite; 
                             NumeroMsg: Integer; Jornada: Integer); safecall;
    procedure baRetiraCartao(Relogio: Integer; const Cartao: WideString); safecall;
    procedure baLimpaProgramacao(Relogio: Integer; Lista: TipoLista); safecall;
    procedure baAtualizaFeriados(Relogio: Integer); safecall;
    procedure baAtualizaData(Relogio: Integer; Data: OleVariant); safecall;
    procedure baProgramaMsg(Relogio: Integer; msgNumero: EnMensagem; const msgDisplay: WideString); safecall;
    procedure baProgramaAcionamento(Relogio: Integer; Tipo: EnTipoAcinamento; 
                                    const tempoAcionamento: WideString); safecall;
    procedure baAlteraTurno(Relogio: Integer; Codigo: Integer; iHora1: Integer; iMinuto1: Integer; 
                            fHora1: Integer; fMinuto1: Integer; iHora2: Integer; iMinuto2: Integer; 
                            fHora2: Integer; fMinuto2: Integer; iHora3: Integer; iMinuto3: Integer; 
                            fHora3: Integer; fMinuto3: Integer; iHora4: Integer; iMinuto4: Integer; 
                            fHora4: Integer; fMinuto4: Integer); safecall;
    procedure baProgramaSirene(Relogio: Integer; Codigo: Integer; horaToque: Integer; 
                               minutoToque: Integer; Tipo: EnTipoSirene; Duracao: Integer; 
                               Segunda: EnToqueSirene; Terca: EnToqueSirene; Quarta: EnToqueSirene; 
                               Quinta: EnToqueSirene; Sexta: EnToqueSirene; Sabado: EnToqueSirene; 
                               Domingo: EnToqueSirene); safecall;
    procedure baLimpaBufferColeta(Relogio: Integer); safecall;
    procedure baSalvaPonteiroColeta(Relogio: Integer); safecall;
    procedure baRestauraPonteiroColeta(Relogio: Integer); safecall;
    procedure baColetaEliminando(Relogio: Integer); safecall;
    procedure baColetaMantendo(Relogio: Integer); safecall;
    procedure baAlteraJornada(Relogio: Integer; Codigo: Integer; Segunda: Integer; Terca: Integer; 
                              Quarta: Integer; Quinta: Integer; Sexta: Integer; Sabado: Integer; 
                              Domingo: Integer); safecall;
    procedure baInsereCodAlternativo(Relogio: Integer; const CodAlternativo: WideString; 
                                     const Cartao: WideString); safecall;
    procedure baRetiraCodAlternativo(Relogio: Integer; const CodAlternativo: WideString); safecall;
    procedure baIniciaBackUp(Relogio: Integer); safecall;
    procedure baProgramaContadorAcesso(Relogio: Integer; Hora: Integer; Minuto: Integer); safecall;
    procedure baProgramaAmostragem(Relogio: Integer; Amostragem: Integer); safecall;
    procedure baProgramaHorarioVerao(Relogio: Integer; diaInicio: Integer; mesInicio: Integer; 
                                     diaFim: Integer; mesFim: Integer); safecall;
    procedure baSolicitaStatus(Relogio: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  _cRBDllDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {40FB9001-1B72-4A7F-BF02-490489614050}
// *********************************************************************//
  _cRBDllDisp = dispinterface
    ['{40FB9001-1B72-4A7F-BF02-490489614050}']
    function InitComPort(Port: Integer; BaudRate: Integer; const Parity: WideString; 
                         ByteSize: Integer; const StopBit: WideString): WordBool; dispid 1610809346;
    function PortOpen: OleVariant; dispid 1610809347;
    procedure ClosePort; dispid 1610809348;
    procedure setTipoComunicacao(Tipo: Integer); dispid 1610809351;
    procedure setTempoDTR(var Tx: Integer; var Rx: Integer); dispid 1610809352;
    function chegaramDadosRelogio(Relogio: Integer): EnResposta; dispid 1610809356;
    function getDadosRelogio(Relogio: Integer): WideString; dispid 1610809357;
    function getFuncaoRelogio(Relogio: Integer): FuncaoRelogio; dispid 1610809358;
    procedure ResetaFeriados; dispid 1610809363;
    procedure IncluiFeriado(Dia: Integer; Mes: Integer); dispid 1610809365;
    procedure rtInsereCartao(Relogio: Integer; const Cartao: WideString; const Senha: WideString); dispid 1610809367;
    procedure rtRetiraCartao(Relogio: Integer; const Cartao: WideString); dispid 1610809368;
    procedure rtLimpaListaControle(Relogio: Integer); dispid 1610809369;
    procedure rtAtualizaData(Relogio: Integer; Data: OleVariant); dispid 1610809370;
    procedure rtTipoAcionamento(Relogio: Integer; tipoAcionamento: EnTipoAcinamento); dispid 1610809371;
    procedure rtColetaMantendo(Relogio: Integer); dispid 1610809372;
    procedure rtColetaEliminando(Relogio: Integer); dispid 1610809373;
    procedure rtEnviaMsg(Relogio: Integer; const msgDisplay: WideString); dispid 1610809374;
    procedure rtEnviaLiberacao(Relogio: Integer; TipoLiberacao: EnTipoLiberacao; 
                               const Senha: WideString; const Cartao: WideString; Direcao: EnDirecao); dispid 1610809375;
    procedure rtEnviaSinalSonoro(Relogio: Integer; SinalSonoro: EnSinalSonoro); dispid 1610809376;
    procedure rtTipoViolacao(Relogio: Integer; ViolacaoEntrada: EnViolacao; 
                             ViolacaoSaida: EnViolacao); dispid 1610809377;
    procedure rtParametros(Relogio: Integer; tipoLiberacaoEntrada: EnLibEntradaSaida; 
                           tipoLiberacaoSaida: EnLibEntradaSaida; ConsultaPorSenha: EnHabilitar; 
                           ConsultaporMestre: EnHabilitar; PermissoesLocais: EnPermissoesLocais; 
                           DigitosDoCartao: Integer); dispid 1610809378;
    procedure rtLerTeclado(Relogio: Integer; Finalizador: EnFinalizador; Mascara: EnMascara; 
                           numeroDigitos: Integer); dispid 1610809379;
    procedure baInsereCartao(Relogio: Integer; const Cartao: WideString; Limite: EnLimite; 
                             NumeroMsg: Integer; Jornada: Integer); dispid 1610809380;
    procedure baRetiraCartao(Relogio: Integer; const Cartao: WideString); dispid 1610809381;
    procedure baLimpaProgramacao(Relogio: Integer; Lista: TipoLista); dispid 1610809382;
    procedure baAtualizaFeriados(Relogio: Integer); dispid 1610809383;
    procedure baAtualizaData(Relogio: Integer; Data: OleVariant); dispid 1610809384;
    procedure baProgramaMsg(Relogio: Integer; msgNumero: EnMensagem; const msgDisplay: WideString); dispid 1610809385;
    procedure baProgramaAcionamento(Relogio: Integer; Tipo: EnTipoAcinamento; 
                                    const tempoAcionamento: WideString); dispid 1610809386;
    procedure baAlteraTurno(Relogio: Integer; Codigo: Integer; iHora1: Integer; iMinuto1: Integer; 
                            fHora1: Integer; fMinuto1: Integer; iHora2: Integer; iMinuto2: Integer; 
                            fHora2: Integer; fMinuto2: Integer; iHora3: Integer; iMinuto3: Integer; 
                            fHora3: Integer; fMinuto3: Integer; iHora4: Integer; iMinuto4: Integer; 
                            fHora4: Integer; fMinuto4: Integer); dispid 1610809387;
    procedure baProgramaSirene(Relogio: Integer; Codigo: Integer; horaToque: Integer; 
                               minutoToque: Integer; Tipo: EnTipoSirene; Duracao: Integer; 
                               Segunda: EnToqueSirene; Terca: EnToqueSirene; Quarta: EnToqueSirene; 
                               Quinta: EnToqueSirene; Sexta: EnToqueSirene; Sabado: EnToqueSirene; 
                               Domingo: EnToqueSirene); dispid 1610809388;
    procedure baLimpaBufferColeta(Relogio: Integer); dispid 1610809389;
    procedure baSalvaPonteiroColeta(Relogio: Integer); dispid 1610809390;
    procedure baRestauraPonteiroColeta(Relogio: Integer); dispid 1610809391;
    procedure baColetaEliminando(Relogio: Integer); dispid 1610809392;
    procedure baColetaMantendo(Relogio: Integer); dispid 1610809393;
    procedure baAlteraJornada(Relogio: Integer; Codigo: Integer; Segunda: Integer; Terca: Integer; 
                              Quarta: Integer; Quinta: Integer; Sexta: Integer; Sabado: Integer; 
                              Domingo: Integer); dispid 1610809394;
    procedure baInsereCodAlternativo(Relogio: Integer; const CodAlternativo: WideString; 
                                     const Cartao: WideString); dispid 1610809395;
    procedure baRetiraCodAlternativo(Relogio: Integer; const CodAlternativo: WideString); dispid 1610809396;
    procedure baIniciaBackUp(Relogio: Integer); dispid 1610809397;
    procedure baProgramaContadorAcesso(Relogio: Integer; Hora: Integer; Minuto: Integer); dispid 1610809398;
    procedure baProgramaAmostragem(Relogio: Integer; Amostragem: Integer); dispid 1610809399;
    procedure baProgramaHorarioVerao(Relogio: Integer; diaInicio: Integer; mesInicio: Integer; 
                                     diaFim: Integer; mesFim: Integer); dispid 1610809400;
    procedure baSolicitaStatus(Relogio: Integer); dispid 1610809401;
  end;

// *********************************************************************//
// The Class CocRBDll provides a Create and CreateRemote method to          
// create instances of the default interface _cRBDll exposed by              
// the CoClass cRBDll. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CocRBDll = class
    class function Create: _cRBDll;
    class function CreateRemote(const MachineName: string): _cRBDll;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TcRBDll
// Help String      : 
// Default Interface: _cRBDll
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TcRBDllProperties= class;
{$ENDIF}
  TcRBDll = class(TOleServer)
  private
    FIntf:        _cRBDll;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TcRBDllProperties;
    function      GetServerProperties: TcRBDllProperties;
{$ENDIF}
    function      GetDefaultInterface: _cRBDll;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _cRBDll);
    procedure Disconnect; override;
    function InitComPort(Port: Integer; BaudRate: Integer; const Parity: WideString; 
                         ByteSize: Integer; const StopBit: WideString): WordBool;
    function PortOpen: OleVariant;
    procedure ClosePort;
    procedure setTipoComunicacao(Tipo: Integer);
    procedure setTempoDTR(var Tx: Integer; var Rx: Integer);
    function chegaramDadosRelogio(Relogio: Integer): EnResposta;
    function getDadosRelogio(Relogio: Integer): WideString;
    function getFuncaoRelogio(Relogio: Integer): FuncaoRelogio;
    procedure ResetaFeriados;
    procedure IncluiFeriado(Dia: Integer; Mes: Integer);
    procedure rtInsereCartao(Relogio: Integer; const Cartao: WideString; const Senha: WideString);
    procedure rtRetiraCartao(Relogio: Integer; const Cartao: WideString);
    procedure rtLimpaListaControle(Relogio: Integer);
    procedure rtAtualizaData(Relogio: Integer); overload;
    procedure rtAtualizaData(Relogio: Integer; Data: OleVariant); overload;
    procedure rtTipoAcionamento(Relogio: Integer; tipoAcionamento: EnTipoAcinamento);
    procedure rtColetaMantendo(Relogio: Integer);
    procedure rtColetaEliminando(Relogio: Integer);
    procedure rtEnviaMsg(Relogio: Integer; const msgDisplay: WideString);
    procedure rtEnviaLiberacao(Relogio: Integer; TipoLiberacao: EnTipoLiberacao; 
                               const Senha: WideString; const Cartao: WideString; Direcao: EnDirecao);
    procedure rtEnviaSinalSonoro(Relogio: Integer; SinalSonoro: EnSinalSonoro);
    procedure rtTipoViolacao(Relogio: Integer; ViolacaoEntrada: EnViolacao; 
                             ViolacaoSaida: EnViolacao);
    procedure rtParametros(Relogio: Integer; tipoLiberacaoEntrada: EnLibEntradaSaida; 
                           tipoLiberacaoSaida: EnLibEntradaSaida; ConsultaPorSenha: EnHabilitar; 
                           ConsultaporMestre: EnHabilitar; PermissoesLocais: EnPermissoesLocais; 
                           DigitosDoCartao: Integer);
    procedure rtLerTeclado(Relogio: Integer; Finalizador: EnFinalizador; Mascara: EnMascara; 
                           numeroDigitos: Integer);
    procedure baInsereCartao(Relogio: Integer; const Cartao: WideString; Limite: EnLimite; 
                             NumeroMsg: Integer; Jornada: Integer);
    procedure baRetiraCartao(Relogio: Integer; const Cartao: WideString);
    procedure baLimpaProgramacao(Relogio: Integer; Lista: TipoLista);
    procedure baAtualizaFeriados(Relogio: Integer);
    procedure baAtualizaData(Relogio: Integer); overload;
    procedure baAtualizaData(Relogio: Integer; Data: OleVariant); overload;
    procedure baProgramaMsg(Relogio: Integer; msgNumero: EnMensagem; const msgDisplay: WideString);
    procedure baProgramaAcionamento(Relogio: Integer; Tipo: EnTipoAcinamento; 
                                    const tempoAcionamento: WideString);
    procedure baAlteraTurno(Relogio: Integer; Codigo: Integer; iHora1: Integer; iMinuto1: Integer; 
                            fHora1: Integer; fMinuto1: Integer; iHora2: Integer; iMinuto2: Integer; 
                            fHora2: Integer; fMinuto2: Integer; iHora3: Integer; iMinuto3: Integer; 
                            fHora3: Integer; fMinuto3: Integer; iHora4: Integer; iMinuto4: Integer; 
                            fHora4: Integer; fMinuto4: Integer);
    procedure baProgramaSirene(Relogio: Integer; Codigo: Integer; horaToque: Integer; 
                               minutoToque: Integer; Tipo: EnTipoSirene; Duracao: Integer; 
                               Segunda: EnToqueSirene; Terca: EnToqueSirene; Quarta: EnToqueSirene; 
                               Quinta: EnToqueSirene; Sexta: EnToqueSirene; Sabado: EnToqueSirene; 
                               Domingo: EnToqueSirene);
    procedure baLimpaBufferColeta(Relogio: Integer);
    procedure baSalvaPonteiroColeta(Relogio: Integer);
    procedure baRestauraPonteiroColeta(Relogio: Integer);
    procedure baColetaEliminando(Relogio: Integer);
    procedure baColetaMantendo(Relogio: Integer);
    procedure baAlteraJornada(Relogio: Integer; Codigo: Integer; Segunda: Integer; Terca: Integer; 
                              Quarta: Integer; Quinta: Integer; Sexta: Integer; Sabado: Integer; 
                              Domingo: Integer);
    procedure baInsereCodAlternativo(Relogio: Integer; const CodAlternativo: WideString; 
                                     const Cartao: WideString);
    procedure baRetiraCodAlternativo(Relogio: Integer; const CodAlternativo: WideString);
    procedure baIniciaBackUp(Relogio: Integer);
    procedure baProgramaContadorAcesso(Relogio: Integer; Hora: Integer; Minuto: Integer);
    procedure baProgramaAmostragem(Relogio: Integer; Amostragem: Integer);
    procedure baProgramaHorarioVerao(Relogio: Integer; diaInicio: Integer; mesInicio: Integer; 
                                     diaFim: Integer; mesFim: Integer);
    procedure baSolicitaStatus(Relogio: Integer);
    property DefaultInterface: _cRBDll read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TcRBDllProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TcRBDll
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TcRBDllProperties = class(TPersistent)
  private
    FServer:    TcRBDll;
    function    GetDefaultInterface: _cRBDll;
    constructor Create(AServer: TcRBDll);
  protected
  public
    property DefaultInterface: _cRBDll read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CocRBDll.Create: _cRBDll;
begin
  Result := CreateComObject(CLASS_cRBDll) as _cRBDll;
end;

class function CocRBDll.CreateRemote(const MachineName: string): _cRBDll;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_cRBDll) as _cRBDll;
end;

procedure TcRBDll.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{A4609C15-1AB9-41A1-B9CE-14E11303BA39}';
    IntfIID:   '{40FB9001-1B72-4A7F-BF02-490489614050}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TcRBDll.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _cRBDll;
  end;
end;

procedure TcRBDll.ConnectTo(svrIntf: _cRBDll);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TcRBDll.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TcRBDll.GetDefaultInterface: _cRBDll;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TcRBDll.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TcRBDllProperties.Create(Self);
{$ENDIF}
end;

destructor TcRBDll.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TcRBDll.GetServerProperties: TcRBDllProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TcRBDll.InitComPort(Port: Integer; BaudRate: Integer; const Parity: WideString; 
                             ByteSize: Integer; const StopBit: WideString): WordBool;
begin
  Result := DefaultInterface.InitComPort(Port, BaudRate, Parity, ByteSize, StopBit);
end;

function TcRBDll.PortOpen: OleVariant;
begin
  Result := DefaultInterface.PortOpen;
end;

procedure TcRBDll.ClosePort;
begin
  DefaultInterface.ClosePort;
end;

procedure TcRBDll.setTipoComunicacao(Tipo: Integer);
begin
  DefaultInterface.setTipoComunicacao(Tipo);
end;

procedure TcRBDll.setTempoDTR(var Tx: Integer; var Rx: Integer);
begin
  DefaultInterface.setTempoDTR(Tx, Rx);
end;

function TcRBDll.chegaramDadosRelogio(Relogio: Integer): EnResposta;
begin
  Result := DefaultInterface.chegaramDadosRelogio(Relogio);
end;

function TcRBDll.getDadosRelogio(Relogio: Integer): WideString;
begin
  Result := DefaultInterface.getDadosRelogio(Relogio);
end;

function TcRBDll.getFuncaoRelogio(Relogio: Integer): FuncaoRelogio;
begin
  Result := DefaultInterface.getFuncaoRelogio(Relogio);
end;

procedure TcRBDll.ResetaFeriados;
begin
  DefaultInterface.ResetaFeriados;
end;

procedure TcRBDll.IncluiFeriado(Dia: Integer; Mes: Integer);
begin
  DefaultInterface.IncluiFeriado(Dia, Mes);
end;

procedure TcRBDll.rtInsereCartao(Relogio: Integer; const Cartao: WideString; const Senha: WideString);
begin
  DefaultInterface.rtInsereCartao(Relogio, Cartao, Senha);
end;

procedure TcRBDll.rtRetiraCartao(Relogio: Integer; const Cartao: WideString);
begin
  DefaultInterface.rtRetiraCartao(Relogio, Cartao);
end;

procedure TcRBDll.rtLimpaListaControle(Relogio: Integer);
begin
  DefaultInterface.rtLimpaListaControle(Relogio);
end;

procedure TcRBDll.rtAtualizaData(Relogio: Integer);
begin
  DefaultInterface.rtAtualizaData(Relogio, EmptyParam);
end;

procedure TcRBDll.rtAtualizaData(Relogio: Integer; Data: OleVariant);
begin
  DefaultInterface.rtAtualizaData(Relogio, Data);
end;

procedure TcRBDll.rtTipoAcionamento(Relogio: Integer; tipoAcionamento: EnTipoAcinamento);
begin
  DefaultInterface.rtTipoAcionamento(Relogio, tipoAcionamento);
end;

procedure TcRBDll.rtColetaMantendo(Relogio: Integer);
begin
  DefaultInterface.rtColetaMantendo(Relogio);
end;

procedure TcRBDll.rtColetaEliminando(Relogio: Integer);
begin
  DefaultInterface.rtColetaEliminando(Relogio);
end;

procedure TcRBDll.rtEnviaMsg(Relogio: Integer; const msgDisplay: WideString);
begin
  DefaultInterface.rtEnviaMsg(Relogio, msgDisplay);
end;

procedure TcRBDll.rtEnviaLiberacao(Relogio: Integer; TipoLiberacao: EnTipoLiberacao; 
                                   const Senha: WideString; const Cartao: WideString; 
                                   Direcao: EnDirecao);
begin
  DefaultInterface.rtEnviaLiberacao(Relogio, TipoLiberacao, Senha, Cartao, Direcao);
end;

procedure TcRBDll.rtEnviaSinalSonoro(Relogio: Integer; SinalSonoro: EnSinalSonoro);
begin
  DefaultInterface.rtEnviaSinalSonoro(Relogio, SinalSonoro);
end;

procedure TcRBDll.rtTipoViolacao(Relogio: Integer; ViolacaoEntrada: EnViolacao; 
                                 ViolacaoSaida: EnViolacao);
begin
  DefaultInterface.rtTipoViolacao(Relogio, ViolacaoEntrada, ViolacaoSaida);
end;

procedure TcRBDll.rtParametros(Relogio: Integer; tipoLiberacaoEntrada: EnLibEntradaSaida; 
                               tipoLiberacaoSaida: EnLibEntradaSaida; 
                               ConsultaPorSenha: EnHabilitar; ConsultaporMestre: EnHabilitar; 
                               PermissoesLocais: EnPermissoesLocais; DigitosDoCartao: Integer);
begin
  DefaultInterface.rtParametros(Relogio, tipoLiberacaoEntrada, tipoLiberacaoSaida, 
                                ConsultaPorSenha, ConsultaporMestre, PermissoesLocais, 
                                DigitosDoCartao);
end;

procedure TcRBDll.rtLerTeclado(Relogio: Integer; Finalizador: EnFinalizador; Mascara: EnMascara; 
                               numeroDigitos: Integer);
begin
  DefaultInterface.rtLerTeclado(Relogio, Finalizador, Mascara, numeroDigitos);
end;

procedure TcRBDll.baInsereCartao(Relogio: Integer; const Cartao: WideString; Limite: EnLimite; 
                                 NumeroMsg: Integer; Jornada: Integer);
begin
  DefaultInterface.baInsereCartao(Relogio, Cartao, Limite, NumeroMsg, Jornada);
end;

procedure TcRBDll.baRetiraCartao(Relogio: Integer; const Cartao: WideString);
begin
  DefaultInterface.baRetiraCartao(Relogio, Cartao);
end;

procedure TcRBDll.baLimpaProgramacao(Relogio: Integer; Lista: TipoLista);
begin
  DefaultInterface.baLimpaProgramacao(Relogio, Lista);
end;

procedure TcRBDll.baAtualizaFeriados(Relogio: Integer);
begin
  DefaultInterface.baAtualizaFeriados(Relogio);
end;

procedure TcRBDll.baAtualizaData(Relogio: Integer);
begin
  DefaultInterface.baAtualizaData(Relogio, EmptyParam);
end;

procedure TcRBDll.baAtualizaData(Relogio: Integer; Data: OleVariant);
begin
  DefaultInterface.baAtualizaData(Relogio, Data);
end;

procedure TcRBDll.baProgramaMsg(Relogio: Integer; msgNumero: EnMensagem; 
                                const msgDisplay: WideString);
begin
  DefaultInterface.baProgramaMsg(Relogio, msgNumero, msgDisplay);
end;

procedure TcRBDll.baProgramaAcionamento(Relogio: Integer; Tipo: EnTipoAcinamento; 
                                        const tempoAcionamento: WideString);
begin
  DefaultInterface.baProgramaAcionamento(Relogio, Tipo, tempoAcionamento);
end;

procedure TcRBDll.baAlteraTurno(Relogio: Integer; Codigo: Integer; iHora1: Integer; 
                                iMinuto1: Integer; fHora1: Integer; fMinuto1: Integer; 
                                iHora2: Integer; iMinuto2: Integer; fHora2: Integer; 
                                fMinuto2: Integer; iHora3: Integer; iMinuto3: Integer; 
                                fHora3: Integer; fMinuto3: Integer; iHora4: Integer; 
                                iMinuto4: Integer; fHora4: Integer; fMinuto4: Integer);
begin
  DefaultInterface.baAlteraTurno(Relogio, Codigo, iHora1, iMinuto1, fHora1, fMinuto1, iHora2, 
                                 iMinuto2, fHora2, fMinuto2, iHora3, iMinuto3, fHora3, fMinuto3, 
                                 iHora4, iMinuto4, fHora4, fMinuto4);
end;

procedure TcRBDll.baProgramaSirene(Relogio: Integer; Codigo: Integer; horaToque: Integer; 
                                   minutoToque: Integer; Tipo: EnTipoSirene; Duracao: Integer; 
                                   Segunda: EnToqueSirene; Terca: EnToqueSirene; 
                                   Quarta: EnToqueSirene; Quinta: EnToqueSirene; 
                                   Sexta: EnToqueSirene; Sabado: EnToqueSirene; 
                                   Domingo: EnToqueSirene);
begin
  DefaultInterface.baProgramaSirene(Relogio, Codigo, horaToque, minutoToque, Tipo, Duracao, 
                                    Segunda, Terca, Quarta, Quinta, Sexta, Sabado, Domingo);
end;

procedure TcRBDll.baLimpaBufferColeta(Relogio: Integer);
begin
  DefaultInterface.baLimpaBufferColeta(Relogio);
end;

procedure TcRBDll.baSalvaPonteiroColeta(Relogio: Integer);
begin
  DefaultInterface.baSalvaPonteiroColeta(Relogio);
end;

procedure TcRBDll.baRestauraPonteiroColeta(Relogio: Integer);
begin
  DefaultInterface.baRestauraPonteiroColeta(Relogio);
end;

procedure TcRBDll.baColetaEliminando(Relogio: Integer);
begin
  DefaultInterface.baColetaEliminando(Relogio);
end;

procedure TcRBDll.baColetaMantendo(Relogio: Integer);
begin
  DefaultInterface.baColetaMantendo(Relogio);
end;

procedure TcRBDll.baAlteraJornada(Relogio: Integer; Codigo: Integer; Segunda: Integer; 
                                  Terca: Integer; Quarta: Integer; Quinta: Integer; Sexta: Integer; 
                                  Sabado: Integer; Domingo: Integer);
begin
  DefaultInterface.baAlteraJornada(Relogio, Codigo, Segunda, Terca, Quarta, Quinta, Sexta, Sabado, 
                                   Domingo);
end;

procedure TcRBDll.baInsereCodAlternativo(Relogio: Integer; const CodAlternativo: WideString; 
                                         const Cartao: WideString);
begin
  DefaultInterface.baInsereCodAlternativo(Relogio, CodAlternativo, Cartao);
end;

procedure TcRBDll.baRetiraCodAlternativo(Relogio: Integer; const CodAlternativo: WideString);
begin
  DefaultInterface.baRetiraCodAlternativo(Relogio, CodAlternativo);
end;

procedure TcRBDll.baIniciaBackUp(Relogio: Integer);
begin
  DefaultInterface.baIniciaBackUp(Relogio);
end;

procedure TcRBDll.baProgramaContadorAcesso(Relogio: Integer; Hora: Integer; Minuto: Integer);
begin
  DefaultInterface.baProgramaContadorAcesso(Relogio, Hora, Minuto);
end;

procedure TcRBDll.baProgramaAmostragem(Relogio: Integer; Amostragem: Integer);
begin
  DefaultInterface.baProgramaAmostragem(Relogio, Amostragem);
end;

procedure TcRBDll.baProgramaHorarioVerao(Relogio: Integer; diaInicio: Integer; mesInicio: Integer; 
                                         diaFim: Integer; mesFim: Integer);
begin
  DefaultInterface.baProgramaHorarioVerao(Relogio, diaInicio, mesInicio, diaFim, mesFim);
end;

procedure TcRBDll.baSolicitaStatus(Relogio: Integer);
begin
  DefaultInterface.baSolicitaStatus(Relogio);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TcRBDllProperties.Create(AServer: TcRBDll);
begin
  inherited Create;
  FServer := AServer;
end;

function TcRBDllProperties.GetDefaultInterface: _cRBDll;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TcRBDll]);
end;

end.
