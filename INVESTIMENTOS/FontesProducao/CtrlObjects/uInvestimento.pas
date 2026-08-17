//******************************************************************************
// Data      : 16/01/2007
// Código    : AL_6
// Pendencia :
// SOL       :
// Desc      :
//
//               ---------------   NÃO IMPLEMENTAR MAIS NADA   --------------------
//               - UNIT EM DESUSO  -- ESTÁ SENDO SUBSTITUIDA PELA CTRLPARAMINVEST -
//               ------------------------------------------------------------------
//
//******************************************************************************
// Data      : 06/11/2006
// Código    : AL_5
// Pendencia : 22492
// SOL       :
// Desc      : Implementação de Contabilização em dias úteis para ativos de
//             Renda Fixa que geram registros em dias não uteis
//             Contabiliza FLGCONTABDIAUTIL
//******************************************************************************
// Data     : 23/02/2006
// Código   : AL_4
// Motivo   : Criação da pasta de CPMF e dos campos PZORECCPMF na PARAMINVEST
//            para identificar o dia para recolhimento do CPMF
//******************************************************************************
// Data     : 03/02/2006
// Código   : AL_3
// Motivo   : Criação do campo MASCSCLASSIFANBID na PARAMINVEST para tratar a máscara
//            do código da Classificacao ANBID
//******************************************************************************
// Data     : 10/01/2006
// Código   : AL_2
// Pendencia:
// Sol      :
// Motivo   : Criação das propriedades NomeUsuario e NomeModulo
//******************************************************************************
// Data     : 06/12/2005
// Código   : AL_1
// Pendencia: 20901
// Sol      : 38821
// Motivo   : Criação do campo IDTIPOOPERDIRDSA, IDTIPOOPERDIRDSR, FLGREGIMECXCOMP
//            e DTAREGIMECXCOMP na PARAMINVEST
//******************************************************************************

unit uInvestimento;

interface

uses
  SysUtils, controls, uMensErro, Dialogs, Graphics, Math, ExtCtrls, uCMControlObject,
  uCMClientDataSet, uCtrlPadroes;

type TParamInvest = Record
        IDPARAMINVEST     : LongInt;
        MASCSETOREMISSOR  : String;
        MOECODIGO         : LongInt;
        MASCCLASSIFINV    : String;
        VLRDIVERG         : Extended;
        VLRCOTAINICART    : Extended;
        DATAULTFECH       : TDateTime;
        FLGORDMOVINV      : String;
        PERCPUORDMOVINV   : Extended;
        PERCIMPRENDA      : Extended;
        MOEDAATU          : LongInt;
        PERCPARTICEMPR    : Extended;
        PERCPARTICRECUR   : Extended;
        IDPARAMPATRLIQ    : LongInt;
        TIPOMENU          : String;
        DATAULTFECHRF     : TDateTime;
        IDTIPODESPIRAPU   : LongInt;
        IDTIPODESPINVEST  : LongInt;
        MOEDAGER          : LongInt;
        FLGPROVISIONAIRRF : String;
        FLGPROVISIONAIRRV : String;
        PUCDB             : Extended;
        DATAMOVCDBLIB     : TDateTime;
        IDTIPODESPIRPROV  : LongInt;
        MOEDAATULIT       : LongInt;
        IDPROGRAMA        : LongInt;
        IDTIPOCLIENTECOR  : LongInt;
        IDTIPOOPERDIRINC  : LongInt;
        IDTIPOOPERDIRCIS  : LongInt;
        IDTIPOOPERDIRDES  : LongInt;
        IDTIPOOPERDIRGRU  : LongInt;
        IDTIPOOPERDIRPER  : LongInt;
        IDTIPOOPERDIRBON  : LongInt;
        IDTIPOOPERDIRDIV  : LongInt;
        IDTIPOOPERDIRSUB  : LongInt;
        IDTIPOINVEST      : LongInt;
        IDTIPOOPERDIRJUR  : LongInt;
        IDTIPOCLIENTEEMI  : LongInt;
        IDTIPOCLIENTECUS  : LongInt;
        IDTIPOCONTRRF     : LongInt;
        IDBVSP            : LongInt;
        IDTIPOINVESTIDOR  : LongInt;
        IDMERCADO         : LongInt;
        IDTIPOOPERLIQPEND : LongInt;
        IDBMF             : LongInt;
        IDTIPOCONTRFIN    : LongInt;
        DATAULTFECHFDO    : TDateTime;
        DATAULTFECHBMF    : TDateTime;
        IDTPPERIODICIDADE : LongInt;
        DATAULTIMPCOT     : TDateTime;
        IDTIPOOPERDIRALT  : LongInt;
        IDRAMOFORCOR      : LongInt;
        IDRAMOFOREMI      : LongInt;
        IDRAMOFORCUS      : LongInt;
        FLGLIBERAIDLOTE   : String;
        IDTIPOOPERDIRRES  : LongInt;
        FLGUSASUBCONTA    : String;
        PERCDEVRV         : Extended;
        PERCDEVBMF        : Extended;
        DIASEMANACPMF     : String;
        DIASUTEISCPMF     : LongInt;
        IDCUSTODIARENFIX  : LongInt;
        IDTIPOREGRARV     : LongInt;
        IDTIPOREGRARF     : LongInt;
        IDTIPOREGRABMF    : LongInt;
        FLGIMPLANTARF     : String;
        FLGCONTABILIZA    : String;
        FLGINTCAPCAR      : String;
        IDCONTRAPARTERF   : LongInt;
        IDAUTORIZAORDEM   : LongInt;
        IDCLASSEPOUP      : LongInt;
        FLGEMPACOES       : String;
        IDCARTEMPACOES    : LongInt;
        IDREGRAEMPACOES   : LongInt;
        IDMOTBLOQEMPAC    : LongInt;
        FLGCARTGERENC     : String;
        IDINDEXPOUPANCA   : LongInt;
        JUROSPOUPANCA     : Extended;
        IDTIPOOPERDIRMUL  : LongInt;
        IDPLANPREVCTBPATR : LongInt;
        IDOPERAMORTPRINC  : LongInt;
        IDOPERINCJUROS    : LongInt;
        IDOPERPAGTOJUROS  : LongInt;
        FLGESPECFUNDO     : String;
        FLGCOMPVARRV      : String;
        PRZVENCBMF        : LongInt;
        PRZVENCCFIANCA    : LongInt;
        IDTIPOREGRAFND    : LongInt;
        IDCLASSPOUPBLOQ   : LongInt;
        IDTIPOREGRARENT   : LongInt;
        DATAMOVTORV       : TDateTime;
        IDTIPOREGRAATUAR  : LongInt;
        FLGPLANPREVCTBPAT : String;
        IDCLASSNTN        : LongInt;
        IDTIPOOPERDIRREE  : LongInt;
        DATAULTFECHEMP    : TDateTime;
        IDTIPOOPERDIRPROV : LongInt;
        IDTIPOOPEROPCCP   : LongInt;
        IDTIPOOPEROPCVD   : LongInt;
        MOEDAEQM          : LongInt;
        STARET            : String;
        DATAULTRET        : TDateTime;
        IDCARTOPCIND      : LongInt;
        IDCARTOPC         : LongInt;
        IDMOTBLOQOPC      : LongInt;
        IDCARTAVISTA      : LongInt;
        DIFMAXOPCIND      : Extended;
        IDTIPOREGRAOPCIN  : LongInt;
        IDTIPOREGRAEMPAC  : LongInt;
        IDTIPODESPDVCOR   : LongInt;
        IDGRUPOREGRAINV   : LongInt;
        FLGDEMO           : String;
        FLGINTFINLIQ      : String;
        DTMUDACPMF        : TDateTime;
        FLGRECPAGRV       : String;
        IDTIPOOPERDIRDSU  : Integer;
        DIFRESGFUNDOS     : Integer;
        FLGPOUPAPROPDIA   : String;
        IDTIPOOPERRFRAC   : Integer;
        //AL_1
        IDTIPOOPERDIRDSA  : Integer;
        IDTIPOOPERDIRDSR  : Integer;
        FLGREGIMECXCOMP   : String;
        DTAREGIMECXCOMP   : TDateTime;
        //AL_3
        MASCSCLASSIFANBID : String;
        //AL_4
        PZORECCPMF        : Integer;
        DATAINIRECCPMF    : TDateTime;
        //AL_5
        FLGCONTABDIAUTIL  : String;
end;

type
   // Classe de controle global do Investimento
   TInvestimentos = class
   private
      FLogotipo     : TImage;
      FIDEmpresa    : Integer;
      FIDUsuario    : Integer;
      FIDEspAcesso  : Integer;
      FIDModulo     : Integer;
      FNomeEmpresa  : String;
      FNomeModulo   : String;
      FNomeUsuario  : String;


      procedure SetLogotipo(const Value: TImage);
      procedure SetIDEmpresa(const Value: Integer);
      procedure SetIDEspAcesso(const Value: Integer);
      procedure SetIDModulo(const Value: Integer);
      procedure SetIDUsuario(const Value: Integer);
      procedure SetNomeEmpresa(const Value: String);
      procedure SetNomeModulo(const Value: String);
      procedure SetNomeUsuario(const Value: String);

   public

      Params  : TParamInvest;
      constructor create;
      destructor  destroy; override;

      property  Logotipo      : TImage   read FLogotipo    write SetLogotipo;
      property  IDEmpresa     : Integer  read FIDEmpresa   write SetIDEmpresa;
      property  IDUsuario     : Integer  read FIDUsuario   write SetIDUsuario;
      property  IDEspAcesso   : Integer  read FIDEspAcesso write SetIDEspAcesso;
      property  IDModulo      : Integer  read FIDModulo    write SetIDModulo;
      property  NomeEmpresa   : String   read FNomeEmpresa write SetNomeEmpresa;
      property  NomeUsuario   : String   read FNomeUsuario write SetNomeUsuario;
      property  NomeModulo    : String   read FNomeModulo  write SetNomeModulo;
   end;

var
  Investimentos : TInvestimentos;
  TipoMenuInvest: Char;
implementation

{ TInvestimento }


procedure TInvestimentos.SetLogotipo(const Value: TImage);
begin
  FLogotipo := Value;
end;

constructor TInvestimentos.create;
begin
  inherited;
  FLogotipo  := TImage.Create(nil);
end;

destructor TInvestimentos.destroy;
begin
  FreeAndNil(FLogotipo);
  inherited;
end;

procedure TInvestimentos.SetIDEmpresa(const Value: Integer);
begin
   FIDEmpresa := Value;
end;

procedure TInvestimentos.SetIDEspAcesso(const Value: Integer);
begin
   FIDEspAcesso := Value;
end;

procedure TInvestimentos.SetIDModulo(const Value: Integer);
begin
   FIDModulo := Value;
end;

procedure TInvestimentos.SetIDUsuario(const Value: Integer);
begin
   FIDUsuario := Value;
end;

procedure TInvestimentos.SetNomeEmpresa(const Value: String);
begin
   FNomeEmpresa := Value;
end;

procedure TInvestimentos.SetNomeModulo(const Value: String);
begin
  FNomeModulo := Value;
end;

procedure TInvestimentos.SetNomeUsuario(const Value: String);
begin
  FNomeUsuario := Value;
end;

end.
