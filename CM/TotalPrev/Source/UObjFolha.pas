{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit UObjFolha;

interface

uses wwquery, sysutils, udatabase;

type
  TObjSistemaFolha = class
  private
    FMASCARAMATRICULA          : String;
    FIDRUBCREDSALFAM           : Integer;
    FVALORSALFAM               : Real;
    FTETOSALFAM                : Real;
    FFLGNUMLOTES               : Integer;
    FFLGCAPCONTROLACPMF        : Integer;
    FCODCCUSTOFINAN            : String;
    FIdProgramaFolha           : Integer;
    FFlgEnviaContribConcessao  : Integer;
    FFlgEnviaContribManutencao : Integer;
    FIDRUBCPMFPAINSS           : Integer;
    FIDRUBCPMFPAINSSDESC       : Integer;
    FFlgApagaPrevia            : Integer;
    FCodCentroRespon           : String;
    FCodPortForma              : String;
    FCodTipRecDes              : String;
    FCodTipRecDesFav           : String;
    FUnidNegoc                 : String;
    FSubConta                  : String;
    FCodCentroCustoC           : String;
    FCodCentroCustoD           : String;
    FPlaContaD                 : String;
    FPlaContaC                 : String;
    FSeparadorContraCheque     : String;
    FContraChequePorPagina     : Integer;
    FRUBRICACONTRACHEQUE       : Integer;
    FMODOCPAGARCONVENIOS       : Integer;
    FFlgVerificaParm           : Integer;
    FFlgNumDepIRNumDepSalFam   : Integer;     //Bruno Bastos 25/06/2002
    FFlgEstadoRub              : Integer;     //Bruno Bastos 09/07/2002
    FIdGrupoRegraFolha         : Integer;     //Bruno Bastos 10/07/2002
    FFlgUsaRegraxRub           : Integer;     //Bruno Bastos 10/07/2002
    FFlgAgrupaRubrica          : Integer;     //Bruno Bastos 07/08/2002
    FFLGINTEGRACONTABIL        : Integer;
    FFLGINTEGRAFINANC          : Integer;
    FFLGUSAMARGEM3070          : Integer;
    FIDESTRUTM30               : Integer;
    FIDESTRUTM70               : Integer;
    FFLGZERABASENEGATIVAPREVIA : integer;
    FFLGUSACODRUBEXT           : integer;
    FFLGMENSERROVALREGRA       : Integer;     //Bruno Bastos 20/11/2002

    procedure SetFLGUSAMARGEM3070 (Const Value : Integer);
    procedure SetIDESTRUTM30 (Const Value : Integer);
    procedure SetIDESTRUTM70 (Const Value : Integer);
    procedure SetIDRUBCREDSALFAM (Const Value : Integer);
    procedure SetVALORSALFAM (Const Value : real);
    procedure SetTETOSALFAM  (Const Value : real);
    procedure SetFLGNUMLOTES (Const Value : Integer);
    procedure SetFLGCAPCONTROLACPMF (Const Value : Integer);
    procedure SetIdProgramaFolha (Const Value : Integer);
    procedure SetFLGINTEGRACONTABIL(const Value: integer);
    procedure SetFLGINTEGRAFINANC(const Value: integer);
    procedure SetFlgEnviaContribConcessao(const Value: integer);
    procedure SetFlgEnviaContribManutencao(const Value: integer);
    procedure SetIDRUBCPMFPAINSS(const Value: Integer);
    procedure SetIDRUBCPMFPAINSSDESC(const Value: Integer);
    procedure SetFlgApagaPrevia(const Value: integer);
    procedure SetMASCARAMATRICULA(const Value: String);
    procedure SetCodCentroRespon(const value : String);
    procedure SetCODCCUSTOFINAN(const value : String);
    procedure SetCodPortForma(const value : String);
    procedure SetCodTipRecDes(const value : String);
    procedure SetCodTipRecDesFav(const value : String);
    procedure SetUnidNegoc(const value : String);
    procedure SetSubConta(const value : String);
    procedure SetCodCentroCustoC(const value : String);
    procedure SetCodCentroCustoD(const value : String);
    procedure SetPlaContaD(const value : String);
    procedure SetPlaContaC(const value : String);
    procedure SetSeparadorContraCheque(const Value: string);
    procedure SetContraChequePorPagina(const Value: integer);
    procedure SetRUBRICACONTRACHEQUE(const Value: integer);
    procedure SetMODOCPAGARCONVENIOS(const Value: integer);
    procedure SetFlgVerificaParm(const Value: integer);
    procedure SetFlgNumDepIRNumDepSalFam(const Value: integer); //Bruno Bastos 25/06/2002
    procedure SetFlgEstadoRub(const Value: integer);            //Bruno Bastos 09/07/2002
    procedure SetIdGrupoRegraFolha(const Value: Integer);       //Bruno Bastos 10/07/2002
    procedure SetFlgUsaRegraxRub(const Value: Integer);         //Bruno Bastos 10/07/2002
    procedure SetFlgAgrupaRubrica(const Value: Integer);        //Bruno Bastos 07/08/2002
    procedure SetFLGZERABASENEGATIVAPREVIA(const Value: integer);   //P.RAMOS 02.09.2002
    procedure SetFLGUSACODRUBEXT(const Value: integer);   //FERNANDO 31/10/2002
    procedure SetFLGMENSERROVALREGRA(const Value: integer);   //Bruno Bastos 20/11/2002

  protected
  public

    property FLGUSAMARGEM3070: Integer read FFLGUSAMARGEM3070  write SetFLGUSAMARGEM3070;
    property IDESTRUTM30: Integer read FIDESTRUTM30  write SetIDESTRUTM30;
    property IDESTRUTM70: Integer read FIDESTRUTM70  write SetIDESTRUTM70;
    property MASCARAMATRICULA: String read FMASCARAMATRICULA write SetMASCARAMATRICULA;
    property IDRUBCREDSALFAM : Integer read FIDRUBCREDSALFAM  write SetIDRUBCREDSALFAM;
    property VALORSALFAM : Real read FVALORSALFAM write SetVALORSALFAM;
    property TETOSALFAM : real read FTETOSALFAM write SetTETOSALFAM;
    property FLGNUMLOTES: integer read FFLGNUMLOTES write SetFLGNUMLOTES;
    property FLGCAPCONTROLACPMF: integer read FFLGCAPCONTROLACPMF write SetFLGCAPCONTROLACPMF;
    property IDPROGRAMAFOLHA: integer read FIDPROGRAMAFOLHA write SetIDPROGRAMAFOLHA;
    property FLGINTEGRACONTABIL: integer read FFLGINTEGRACONTABIL write SetFLGINTEGRACONTABIL;
    property FLGINTEGRAFINANC: integer read FFLGINTEGRAFINANC write SetFLGINTEGRAFINANC;
    property FlgEnviaContribConcessao: integer read FFlgEnviaContribConcessao write SetFlgEnviaContribConcessao;
    property FlgEnviaContribManutencao: integer read FFlgEnviaContribManutencao write SetFlgEnviaContribManutencao;
    property IDRUBCPMFPAINSS: Integer read FIDRUBCPMFPAINSS write SetIDRUBCPMFPAINSS;
    property IDRUBCPMFPAINSSDESC: Integer read FIDRUBCPMFPAINSSDESC write SetIDRUBCPMFPAINSSDESC;
    property FlgApagaPrevia: integer read FFlgApagaPrevia write SetFlgApagaPrevia;
    property CodCentroRespon: String read FCodCentroRespon write SetCodCentroRespon;
    property CODCCUSTOFINAN: String read FCODCCUSTOFINAN write SetCODCCUSTOFINAN;
    property CodPortForma: String read FCodPortForma write SetCodPortForma;
    property CodTipRecDes: String read FCodTipRecDes write SetCodTipRecDes;
    property CodTipRecDesFav: String read FCodTipRecDesFav write SetCodTipRecDesFav;
    property UnidNegoc: String read FUnidNegoc write SetUnidNegoc;
    property SubConta: String read FSubConta write SetSubConta;
    property CodCentroCustoC: String read FCodCentroCustoC write SetCodCentroCustoC;
    property CodCentroCustoD: String read FCodCentroCustoD write SetCodCentroCustoD;
    property PlaContaD: String read FPlaContaD write SetPlaContaD;
    property PlaContaC: String read FPlaContaC write SetPlaContaC;
    property SeparadorContraCheque: string read FSeparadorContraCheque write SetSeparadorContraCheque;
    property ContraChequePorPagina: integer read FContraChequePorPagina write SetContraChequePorPagina;
    property RUBRICACONTRACHEQUE: integer read FRUBRICACONTRACHEQUE write SetRUBRICACONTRACHEQUE;
    property MODOCPAGARCONVENIOS: integer read FMODOCPAGARCONVENIOS write SetMODOCPAGARCONVENIOS;
    property FlgVerificaParm: integer read FFlgVerificaParm write SetFlgVerificaParm;
    property FlgNumDepIRNumDepSalFam: integer read FFlgNumDepIRNumDepSalFam write SetFlgNumDepIRNumDepSalFam; //Bruno Bastos 25/06/2002
    property FlgEstadoRub: integer read FFlgEstadoRub write SetFlgEstadoRub;                                  //Bruno Bastos 09/07/2002
    property IdGrupoRegraFolha: Integer read FIdGrupoRegraFolha write SetIdGrupoRegraFolha;                   //Bruno Bastos 10/07/2002
    property FlgUsaRegraxRub: Integer read FFlgUsaRegraxRub write SetFlgUsaRegraxRub;                         //Bruno Bastos 10/07/2002
    property FlgAgrupaRubrica: Integer read FFlgAgrupaRubrica write SetFlgAgrupaRubrica;                      //Bruno Bastos 07/08/2002
    property FlgZeraBaseNegativaPrevia: integer read FFLGZERABASENEGATIVAPREVIA write SetFLGZERABASENEGATIVAPREVIA;
    property FlgUsaCodRubExt: integer read FFLGUSACODRUBEXT write SetFLGUSACODRUBEXT;
    property FLGMENSERROVALREGRA: integer read FFLGMENSERROVALREGRA write SetFLGMENSERROVALREGRA;

    constructor Create;

    //P.RAMOS - 26.09.2002 - MÉTODOS PARA PEGAR VALORES DE BENEFICIO DE UMA PESSOA
    function PegaSRBBeneficio(qryAux: twwquery; smes, sidtitular, sidpessoa: string): real;
    function PegaINSSBeneficio(qryAux: twwquery; smes, sidtitular, sidpessoa: string): real;
    function PegaValorIntegralBeneficio(qryAux: twwquery; smes, sidtitular, sidpessoa: string): real;
    //P.RAMOS - 26.09.2002 - ATÉ AQUI

    function OraNumero(sNumero : string):string;
    function ClienteNumero(sNumero : string):string;
  end;

var SistemaFolha: TObjSistemaFolha;

implementation

{ TObjSistemaFolha }

constructor TObjSistemaFolha.Create;
begin

end;

procedure TObjSistemaFolha.SetFLGUSAMARGEM3070(const Value: integer);
begin
  FFLGUSAMARGEM3070 := Value;
end;

procedure TObjSistemaFolha.SetIDESTRUTM30(const Value: integer);
begin
  FIDESTRUTM30 := Value;
end;

procedure TObjSistemaFolha.SetIDESTRUTM70(const Value: integer);
begin
  FIDESTRUTM70 := Value;
end;

procedure TObjSistemaFolha.SetIDRUBCREDSALFAM(const Value: integer);
begin
  FIDRUBCREDSALFAM := Value;
end;

procedure TObjSistemaFolha.SetVALORSALFAM(const Value: real);
begin
  FVALORSALFAM := Value;
end;

procedure TObjSistemaFolha.SetTETOSALFAM(const Value: real);
begin
  FTETOSALFAM := Value;
end;

procedure TObjSistemaFolha.SetIdProgramaFolha(const Value: integer);
begin
  FIDPROGRAMAFOLHA := Value;
end;

procedure TObjSistemaFolha.SetFLGNUMLOTES(const Value: integer);
begin
  FFLGNUMLOTES := Value;
end;

procedure TObjSistemaFolha.SetFLGCAPCONTROLACPMF(const Value: integer);
begin
  FFLGCAPCONTROLACPMF := Value;
end;

procedure TObjSistemaFolha.SetFLGINTEGRAFINANC(const Value: integer);
begin
  FFLGINTEGRAFINANC := Value;
end;

procedure TObjSistemaFolha.SetFLGINTEGRACONTABIL(const Value: integer);
begin
  FFLGINTEGRACONTABIL := Value;
end;

procedure TObjSistemaFolha.SetFlgApagaPrevia(const Value: integer);
begin
  FFlgApagaPrevia := Value;
end;

procedure TObjSistemaFolha.SetFlgVerificaParm(const Value: integer);
begin
  FFlgVerificaParm := Value;
end;

procedure TObjSistemaFolha.SetIDRUBCPMFPAINSS(const Value: Integer);
begin
  FIDRUBCPMFPAINSS := Value;
end;

procedure TObjSistemaFolha.SetIDRUBCPMFPAINSSDESC(const Value: Integer);
begin
  FIDRUBCPMFPAINSSDESC := Value;
end;

procedure TObjSistemaFolha.SetFlgEnviaContribConcessao(const Value: integer);
begin
  FFlgEnviaContribConcessao := Value;
end;

procedure TObjSistemaFolha.SetFlgEnviaContribManutencao(const Value: integer);
begin
  FFlgEnviaContribManutencao := Value;
end;

procedure TobjSistemaFolha.SetCodCentrorespon(const Value : String);
begin
    FCodCentroRespon := Value;
end;

procedure TobjSistemaFolha.SetCODCCUSTOFINAN(const Value : String);
begin
    FCODCCUSTOFINAN := Value;
end;

procedure TobjSistemaFolha.SetCodPortForma(const Value : String);
begin
    FCodPortForma := Value;
end;

procedure TobjSistemaFolha.SetCodTipRecDes(const Value : String);
begin
    FCodTipRecDes := Value;
end;

procedure TobjSistemaFolha.SetCodTipRecDesFav(const Value : String);
begin
    FCodTipRecDesFav := Value;
end;

procedure TobjSistemaFolha.SetMASCARAMATRICULA(const Value : String);
begin
    FMASCARAMATRICULA := Value;
end;

procedure TobjSistemaFolha.SetUnidNegoc(const Value : String);
begin
    FUnidNegoc := Value;
end;

procedure TobjSistemaFolha.SetSubConta(const Value : String);
begin
    FSubConta := Value;
end;

procedure TobjSistemaFolha.SetCodCentroCustoC(const Value : String);
begin
    FCodCentroCustoC := Value;
end;

procedure TobjSistemaFolha.SetCodCentroCustoD(const Value : String);
begin
    FCodCentroCustoD := Value;
end;

procedure TobjSistemaFolha.SetPlaContaD(const Value : String);
begin
    FPlaContaD := Value;
end;

procedure TobjSistemaFolha.SetPlaContaC(const Value : String);
begin
    FPlaContaC := Value;
end;

procedure TObjSistemaFolha.SetSeparadorContraCheque(const Value: string);
begin
  FSeparadorContraCheque := Value;
end;

procedure TObjSistemaFolha.SetContraChequePorPagina(const Value: integer);
begin
  FContraChequePorPagina := Value;
end;

procedure TObjSistemaFolha.SetRUBRICACONTRACHEQUE(const Value: integer);
begin
  FRUBRICACONTRACHEQUE := Value;
end;

procedure TObjSistemaFolha.SetMODOCPAGARCONVENIOS(const Value: integer);
begin
  FMODOCPAGARCONVENIOS := Value;
end;

//Bruno Bastos 25/06/2002 Início
procedure TObjSistemaFolha.SetFlgNumDepIRNumDepSalFam(
  const Value: integer);
begin
  FFlgNumDepIRNumDepSalFam := Value;
end;
//Bruno Bastos 25/06/2002 Fim

//Bruno Bastos 09/07/2002 Inínio
procedure TObjSistemaFolha.SetFlgEstadoRub(const Value: integer);
begin
 FFlgEstadoRub := Value;
end;
//Bruno Bastos 09/07/2002 Fim

//Bruno Bastos 10/07/2002 Início
procedure TObjSistemaFolha.SetIdGrupoRegraFolha(const Value: Integer);
begin
  FIdGrupoRegraFolha := Value;
end;
//Bruno Bastos 10/07/2002 Fim

//Bruno Bastos 10/07/2002 Início
procedure TObjSistemaFolha.SetFlgUsaRegraxRub(const Value: Integer);
begin
 FFlgUsaRegraxRub := Value;
end;
//Bruno Bastos 10/07/2002 Fim

//Bruno Bastos 07/08/2002 Início
procedure TObjSistemaFolha.SetFlgAgrupaRubrica(const Value: Integer);
begin
  FFlgAgrupaRubrica := Value;
end;
//Bruno Bastos 07/08/2002 Fim

//P.RAMOS - 02.09.2002 - PARAMETRO PARA CONTROLAR SE BASE DE CALCULO PODE FICAR NEGATIVA
procedure TObjSistemaFolha.SetFLGZERABASENEGATIVAPREVIA(const Value: integer);
begin
  FFLGZERABASENEGATIVAPREVIA:= Value;
end;
//P.RAMOS - 02.09.2002 - PARAMETRO PARA CONTROLAR SE BASE DE CALCULO PODE FICAR NEGATIVA

// FERNANDO - PARAMETRO PARA INDICAR SE A FUNDACAO VAI TRABALHAR COM CODIGO
// INTERNO OU EXTERNO DAS RUBRICAS - (MIGRAÇÃO DA UADMPREV)
procedure TObjSistemaFolha.SetFLGUSACODRUBEXT(const Value: integer);
begin
  FFLGUSACODRUBEXT:= Value;
end;


function TObjSistemaFolha.PegaINSSBeneficio(qryAux: twwquery; smes, sidtitular,
  sidpessoa: string): real;
begin
  if FazQuery(qryAux,
       'select h.valorintegral, h.mesreferencia '+
       'from hstbenefbfciario h, benefplanprev b '+
       'where h.mes = '+QuotedStr(smes)+' '+
       'and h.idtitular = '+sidtitular+' '+
       'and h.idpessoa = '+sidpessoa+' '+
       'and b.idbeneficio = h.idbeneficio '+
       'and b.idplanoprev = h.idplanoprev '+
       'and b.flgreferencia = 1 '+
       'order by h.mesreferencia') then
    result:=qryAux.fields[0].asfloat
  else
    result:=0;
end;

function TObjSistemaFolha.PegaSRBBeneficio(qryAux: twwquery; smes, sidtitular,
  sidpessoa: string): real;
begin
  if FazQuery(qryAux,
       'select h.valorsrb, h.mesreferencia '+
       'from hstbenefbfciario h, benefplanprev b, beneficio b1 '+
       'where h.mes = '+QuotedStr(smes)+' '+
       'and h.idtitular = '+sidtitular+' '+
       'and h.idpessoa = '+sidpessoa+' '+
       'and b.idbeneficio = h.idbeneficio '+
       'and b.idplanoprev = h.idplanoprev '+
       'and b1.idbeneficio = b.idbeneficio '+
       'and b1.tipobeneficio < 99'+
       'and b.flgreferencia = 0 '+
       'order by h.mesreferencia') then
    result:=qryAux.fields[0].asfloat
  else
    result:=0;
end;

function TObjSistemaFolha.PegaValorIntegralBeneficio(qryAux: twwquery;
  smes, sidtitular, sidpessoa: string): real;
begin
  if FazQuery(qryAux,
       'select h.valorintegral, h.mesreferencia '+
       'from hstbenefbfciario h, benefplanprev b, beneficio b1 '+
       'where h.mes = '+QuotedStr(smes)+' '+
       'and h.idtitular = '+sidtitular+' '+
       'and h.idpessoa = '+sidpessoa+' '+
       'and b.idbeneficio = h.idbeneficio '+
       'and b.idplanoprev = h.idplanoprev '+
       'and b1.idbeneficio = b.idbeneficio '+
       'and b1.tipobeneficio < 99'+
       'and b.flgreferencia = 0 '+
       'order by h.mesreferencia') then
    result:=qryAux.fields[0].asfloat
  else
    result:=0;
end;

function TObjSistemaFolha.OraNumero(sNumero : string):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = ','
     then begin
        if not bPrimPonto
        then begin
           sOra := sOra + '.';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> '.'
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+'.';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1
   do begin
      sResult := sResult + sOra[i];
   end;
   Result := sResult;
end;

function TObjSistemaFolha.ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   sCliente := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sCliente := sCliente + DecimalSeparator;
           bPrimPonto := True;
        end
        else sCliente := sCliente;
     end
     else begin
        if sNumero[i] <> DecimalSeparator
        then sCliente := sCliente + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sCliente := sCliente+DecimalSeparator;
              bPrimPonto := True;
           end
           else sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1
   do begin
      sResult := sResult + sCliente[i];
   end;
   Result := sResult;

end;

//Bruno Bastos 20/11/2002 - Início
procedure TObjSistemaFolha.SetFLGMENSERROVALREGRA(const Value: integer);
begin
  FFLGMENSERROVALREGRA := Value;
end;
//Bruno Bastos 20/11/2002 - Fim

initialization
  SistemaFolha:=TObjSistemaFolha.Create;
finalization
  SistemaFolha.free;
end.
{==============================================================================|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/04/2 002 A 18/04/2002                        |
| VERSÃO PARA LIBERAÇÃO: 3.02.12J                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro IDRUBCPMFPAINSS para armazenar o valor do parametro   |
|   relativo ao valor do CPMF da pensão alimenticia sobre o beneficio do inss. |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/05/2002 A 17/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12R                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro IDRUBCPMFPAINSSDESC para armazenar o valor do parametro|
|   relativo ao valor do desconto da CPMF da pensão alimenticia sobre o        |
|   beneficio do inss.                                                         |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2002 A 25/06/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  - Criação do parâmetro FLGNUMDEPIRNUMDEPSALFAM para controlar se o sistema  |
|    vai executar o cálculo autómático de dependentes para o imposto de renda  |
|    e dependentes de salário família.                                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/07/2002 A 09/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  - Criação do parâmetro FLGESTADORUB para controlar se o sistema vai usar ou |
|    não esse campo da tabela como parâmetro.                                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/07/2002 A 10/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parâmetro IDGRUPOREGRA, para saber a qual o grupo a que a regra |
|   pertence, e o parâmetro FLGUSAREGRAXRUB, que testa se o usuário irá usar   |
|   somente rubricas associadas as regra da folha ou não.                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2002 A 18/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro referente a integração com a Contabilidade            |
| - Criação do parâmetro referernte a integração com o Financeiro              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/07/2002 A 22/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro IDPROGRAMAFOLHA do contas a pagar .                   |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/07/2002 A 29/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13i                                              |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro FLGNUMLOTES que determina a quantidade de lotes que   |
|   podem estar abertos simultaneamente.                                       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/07/2002 A 31/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13k                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Inclusao dos novos parametros IDRUBCREDSALFAM, VALORSALFAM e TETOSALFAM    |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/08/2002 A 06/08/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13L                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Inclusao do novo parametro MASCARAMATRICULA                                |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/08/2002 A 07/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do novo parâmetro FlgAgrupaRubrica.                            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/08/2002 A 19/08/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13o                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Implementei os parametros relativos a margem de 30% e 70%                  |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/09/2002 A 02/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CONTROLA SE BASES CALCULADAS NA PREVIA PODEM SER NEGATIVAS                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/11/2002 A 19/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do parâmetro FlgMensErroValRegra.                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

