{
=========================================================================================
 Analista.....: Cássio Rovaroto
SIG..........: 123574
Data.........: 04/03/2022
Descrição....: Inclusão do campo para tratamento de rubrica Extracontábil.            
===============================================================================
 Autor.....: Marcelo Cardoso Santos Filho
 SIG.......: 26555
 Data      : 16/02/2017
 Descrição : Inclusão do grupo Patrimônio Social e inclusão do campo Conta para
             Aglutinação.
 =========================================================================================
=========================================================================================
 Autor.....: Arnaldo Vicente Scarin
 SOL.......: 122624
 Kintana...: 603582
 Data      : 24/08/2009
 Descrição : Criação dos campos solicitados de acordo com o SOL, para implementacao
             CGPC 28.
=========================================================================================}
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 10/02/2002                             }
{                                                       }
{*******************************************************}
{
// Atualizado em : 11/05/2005 - Alex - Pend 18688 - criado campo IDPROGRAMA
// Atualizado em : 12/08/2003 - Alex - Pend 14451 - criado campo IDSEGREGACRITER
// Correção pendência 14842 - Alex - retirado FFlgContaRetif
// Atualizado em : 05/08/2003 - André Tavares - pendência 14616
// Atualizado em : 02/09/2003 - André Tavares - pendência 14842

}
unit uDbPlanoconta;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbPlanoconta = class(TCmDbObject)

  private
    FPlamutacoes: TCmDbField;
    FPlasecretaria: TCmDbField;
    FPlabloquedata: TCmDbField;
    FPlatipconvgeren1: TCmDbField;
    FPlatxjuros: TCmDbField;
    FPlasubgr4: TCmDbField;
    FPlagrupo: TCmDbField;
    FPlabloque: TCmDbField;
    FPlanome: TCmDbField;
    FPlaaltera: TCmDbField;
    FPlaconta: TCmDbField;
    FPlacontrapartida: TCmDbField;
    FPlarateioap: TCmDbField;
    FPlatipconvgeren2: TCmDbField;
    FPlatipo: TCmDbField;
    FPlaconcorresp: TCmDbField;
    FPlanomeoutling: TCmDbField;
    FPlainativa: TCmDbField;
    FPlano: TCmDbField;
    FPlatipconvoficial: TCmDbField;
    FPlagrau: TCmDbField;
    FFlgestatcomlanc: TCmDbField;
    FPlaconcilia: TCmDbField;
    FPlaordalf: TCmDbField;
    FPlaccust: TCmDbField;
    FPlatipconvger: TCmDbField;
    FPlareduz: TCmDbField;
    FPlaimprelatevol: TCmDbField;
    FPlanatureza: TCmDbField;
    FPlasubconta: TCmDbField;
    FPlacontraptxjuros: TCmDbField;
    FIdrateioapextra: TCmDbField;
    Fplacontasegreg : TCmDbField;
    FPlasubgr2: TCmDbField;
    FPlasubgr1: TCmDbField;
    FPlasumariza: TCmDbField;
    FPlasubgr3: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FPlamoedahistorica: TCmDbField;
    FIdRatAdmPlanPatro: TCmDbField;
    FObservacao       : TCmDbField;
    FIdSegregaCriter: TCmDbField;
    FIdPrograma: TCmDbField;
    // Alterado por Arnaldo V. Scarin em 24/08/2009
    // SOL: 122624 Kintana: 603582
    FFlgUsoExcPGA: TCMDbField;
    FSEGFDOADMDebito: TCMDbField;
    FSEGFDOADMCredito: TCMDbField;
    FPLAAGLUTINACAO: TCMDbField;
    FPlaExtraContabil: TCmDbField;  //MARCELO CARDOSO - SIG26555
    // 05/08/2003 - André Tavares - pendência 14616

    procedure SetObservacao(const Value: TCmDbField); // 05/08/2003 - André Tavares - pendência 14616
    procedure SetFlgestatcomlanc(const Value: TCmDbField);
    procedure SetIdrateioapextra(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetPlaaltera(const Value: TCmDbField);
    procedure SetPlabloque(const Value: TCmDbField);
    procedure SetPlabloquedata(const Value: TCmDbField);
    procedure SetPlaccust(const Value: TCmDbField);
    procedure SetPlaconcilia(const Value: TCmDbField);
    procedure SetPlaconcorresp(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlacontasegreg(const Value: TCmDbField);
    procedure SetPlacontrapartida(const Value: TCmDbField);
    procedure SetPlacontraptxjuros(const Value: TCmDbField);
    procedure SetPlagrau(const Value: TCmDbField);
    procedure SetPlagrupo(const Value: TCmDbField);
    procedure SetPlaimprelatevol(const Value: TCmDbField);
    procedure SetPlainativa(const Value: TCmDbField);
    procedure SetPlamoedahistorica(const Value: TCmDbField);
    procedure SetPlamutacoes(const Value: TCmDbField);
    procedure SetPlanatureza(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlanome(const Value: TCmDbField);
    procedure SetPlanomeoutling(const Value: TCmDbField);
    procedure SetPlaordalf(const Value: TCmDbField);
    procedure SetPlarateioap(const Value: TCmDbField);
    procedure SetPlareduz(const Value: TCmDbField);
    procedure SetPlasecretaria(const Value: TCmDbField);
    procedure SetPlasubconta(const Value: TCmDbField);
    procedure SetPlasubgr1(const Value: TCmDbField);
    procedure SetPlasubgr2(const Value: TCmDbField);
    procedure SetPlasubgr3(const Value: TCmDbField);
    procedure SetPlasubgr4(const Value: TCmDbField);
    procedure SetPlasumariza(const Value: TCmDbField);
    procedure SetPlatipconvger(const Value: TCmDbField);
    procedure SetPlatipconvgeren1(const Value: TCmDbField);
    procedure SetPlatipconvgeren2(const Value: TCmDbField);
    procedure SetPlatipconvoficial(const Value: TCmDbField);
    procedure SetPlatipo(const Value: TCmDbField);
    procedure SetPlatxjuros(const Value: TCmDbField);
    procedure SetIdRatAdmPlanPatro(const Value: TCmDbField);
    procedure SetIdSegregaCriter(const Value: TCmDbField);
    procedure SetIdPrograma(const Value: TCmDbField);
    // Alterado por Arnaldo V. Scarin em 24/08/2009
    // SOL: 122624 Kintana: 603582
    procedure SetFlgUsoExcPGA(const Value: TCMDbField);
    procedure SetSEGFDOADMCredito(const Value: TCMDbField);
    procedure SetSEGFDOADMDebito(const Value: TCMDbField);
    procedure SetPLAAGLUTINACAO(const Value: TCMDbField);
    procedure SetPlaExtraContabil(const Value: TCmDbField); //MARCELO CARDOSO - SIG26555

  public

     // 12/08/2003 - Alexx - pend 14451 - Nova segregação
     Property IdSegregaCriter: TCmDbField read FIdSegregaCriter write SetIdSegregaCriter;
     // 11/05/05 - Alex - 18688
     Property IdPrograma: TCmDbField read FIdPrograma write SetIdPrograma;
     // 05/08/2003 - André Tavares - pendência 14616
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Platxjuros: TCmDbField read FPlatxjuros write SetPlatxjuros;
     Property Platipo: TCmDbField read FPlatipo write SetPlatipo;
     Property Platipconvoficial: TCmDbField read FPlatipconvoficial write SetPlatipconvoficial;
     Property Platipconvgeren2: TCmDbField read FPlatipconvgeren2 write SetPlatipconvgeren2;
     Property Platipconvgeren1: TCmDbField read FPlatipconvgeren1 write SetPlatipconvgeren1;
     Property Platipconvger: TCmDbField read FPlatipconvger write SetPlatipconvger;
     Property Plasumariza: TCmDbField read FPlasumariza write SetPlasumariza;
     Property Plasubgr4: TCmDbField read FPlasubgr4 write SetPlasubgr4;
     Property Plasubgr3: TCmDbField read FPlasubgr3 write SetPlasubgr3;
     Property Plasubgr2: TCmDbField read FPlasubgr2 write SetPlasubgr2;
     Property Plasubgr1: TCmDbField read FPlasubgr1 write SetPlasubgr1;
     Property Placontasegreg: TCmDbField read FPlacontasegreg write SetPlacontasegreg;
     Property Plasubconta: TCmDbField read FPlasubconta write SetPlasubconta;
     Property Plasecretaria: TCmDbField read FPlasecretaria write SetPlasecretaria;
     Property Plareduz: TCmDbField read FPlareduz write SetPlareduz;
     Property Plarateioap: TCmDbField read FPlarateioap write SetPlarateioap;
     Property Plaordalf: TCmDbField read FPlaordalf write SetPlaordalf;
     Property Planomeoutling: TCmDbField read FPlanomeoutling write SetPlanomeoutling;
     Property Planome: TCmDbField read FPlanome write SetPlanome;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Planatureza: TCmDbField read FPlanatureza write SetPlanatureza;
     Property Plamutacoes: TCmDbField read FPlamutacoes write SetPlamutacoes;
     Property Plamoedahistorica: TCmDbField read FPlamoedahistorica write SetPlamoedahistorica;
     Property Plainativa: TCmDbField read FPlainativa write SetPlainativa;
     Property Plaimprelatevol: TCmDbField read FPlaimprelatevol write SetPlaimprelatevol;
     Property Plagrupo: TCmDbField read FPlagrupo write SetPlagrupo;
     Property Plagrau: TCmDbField read FPlagrau write SetPlagrau;
     Property Placontraptxjuros: TCmDbField read FPlacontraptxjuros write SetPlacontraptxjuros;
     Property Placontrapartida: TCmDbField read FPlacontrapartida write SetPlacontrapartida;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Placoncorresp: TCmDbField read FPlaconcorresp write SetPlaconcorresp;
     Property Placoncilia: TCmDbField read FPlaconcilia write SetPlaconcilia;
     Property Placcust: TCmDbField read FPlaccust write SetPlaccust;
     Property IdRatAdmPlanPatro : TCmDbField read FIdRatAdmPlanPatro write SetIdRatAdmPlanPatro;
     Property Plabloquedata: TCmDbField read FPlabloquedata write SetPlabloquedata;
     Property Plabloque: TCmDbField read FPlabloque write SetPlabloque;
     Property Plaaltera: TCmDbField read FPlaaltera write SetPlaaltera;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idrateioapextra: TCmDbField read FIdrateioapextra write SetIdrateioapextra;
     Property Flgestatcomlanc: TCmDbField read FFlgestatcomlanc write SetFlgestatcomlanc;

     // Alterado por Arnaldo V. Scarin em 24/08/2009
     // SOL: 122624 Kintana: 603582
     Property FlgUsoExcPGA : TCMDbField read FFlgUsoExcPGA write SetFlgUsoExcPGA;
     Property SEGFDOADMDebito : TCMDbField read FSEGFDOADMDebito write SetSEGFDOADMDebito;
     Property SEGFDOADMCredito : TCMDbField read FSEGFDOADMCredito write SetSEGFDOADMCredito;
     Property PLAAGLUTINACAO : TCMDbField read FPLAAGLUTINACAO write SetPLAAGLUTINACAO;   //MARCELO CARDOSO - SIG26555
     property PlaExtraContabil: TCmDbField read FPlaExtraContabil write SetPlaExtraContabil;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPlanoconta }

constructor TDbPlanoconta.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANOCONTA';

   // 08/12/03 - Alex - Pend 14451 - Nova Segregação
   FIdSegregaCriter := CreateCmDbField('IDSEGREGACRITER',ftfloat,False,False,False,True,'');

   // 05/11/05 - Alex - Pend 18688 - Nova estrutura IdPrograma
   FIdSegregaCriter := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');

// Início - 05/08/2003 - André Tavares - pendência 14616
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
// Fim - 05/08/2003 - André Tavares - pendência 14616

   fPlatxjuros := CreateCmDbField('PLATXJUROS',ftfloat,False,False,False,True,'');
   fPlatipo := CreateCmDbField('PLATIPO',ftString,True,False,False,True,'');
   fPlatipconvoficial := CreateCmDbField('PLATIPCONVOFICIAL',ftString,True,False,False,True,'');
   fPlatipconvgeren2 := CreateCmDbField('PLATIPCONVGEREN2',ftString,True,False,False,True,'');
   fPlatipconvgeren1 := CreateCmDbField('PLATIPCONVGEREN1',ftString,True,False,False,True,'');
   fPlatipconvger := CreateCmDbField('PLATIPCONVGER',ftString,True,False,False,True,'');
   fPlasumariza := CreateCmDbField('PLASUMARIZA',ftString,False,False,False,True,'');
   fPlasubgr4 := CreateCmDbField('PLASUBGR4',ftfloat,False,False,False,True,'');
   fPlasubgr3 := CreateCmDbField('PLASUBGR3',ftfloat,False,False,False,True,'');
   fPlasubgr2 := CreateCmDbField('PLASUBGR2',ftfloat,False,False,False,True,'');
   fPlasubgr1 := CreateCmDbField('PLASUBGR1',ftfloat,False,False,False,True,'');
   fPlasubconta := CreateCmDbField('PLASUBCONTA',ftString,False,False,False,True,'');
   fPlasecretaria := CreateCmDbField('PLASECRETARIA',ftString,False,False,False,True,'');
   fPlareduz := CreateCmDbField('PLAREDUZ',ftfloat,True,False,False,True,'');
   fPlarateioap := CreateCmDbField('PLARATEIOAP',ftString,False,False,False,True,'');
   fPlaordalf := CreateCmDbField('PLAORDALF',ftString,False,False,False,True,'');
   fPlanomeoutling := CreateCmDbField('PLANOMEOUTLING',ftString,False,False,False,True,'');
   fPlanome := CreateCmDbField('PLANOME',ftString,True,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,True,True,False,True,'');
   fPlanatureza := CreateCmDbField('PLANATUREZA',ftString,False,False,False,True,'');
   fPlamutacoes := CreateCmDbField('PLAMUTACOES',ftString,False,False,False,True,'');
   fPlamoedahistorica := CreateCmDbField('PLAMOEDAHISTORICA',ftfloat,False,False,False,True,'');
   fPlainativa := CreateCmDbField('PLAINATIVA',ftString,True,False,False,True,'');
   fPlaimprelatevol := CreateCmDbField('PLAIMPRELATEVOL',ftString,False,False,False,True,'');
   fPlagrupo := CreateCmDbField('PLAGRUPO',ftString,True,False,False,True,'');
   fPlagrau := CreateCmDbField('PLAGRAU',ftfloat,True,False,False,True,'');
   fPlacontraptxjuros := CreateCmDbField('PLACONTRAPTXJUROS',ftString,False,False,False,True,'');
   fPlacontrapartida := CreateCmDbField('PLACONTRAPARTIDA',ftString,False,False,False,True,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,True,True,False,True,'');
   fPlacontasegreg := CreateCmDbField('PLACONTASEGREG',ftString,False,False,False,True,'');
   fPlaconcorresp := CreateCmDbField('PLACONCORRESP',ftString,False,False,False,True,'');
   fPlaconcilia := CreateCmDbField('PLACONCILIA',ftString,False,False,False,True,'');
   fPlaccust := CreateCmDbField('PLACCUST',ftString,False,False,False,True,'');
   fPlabloquedata := CreateCmDbField('PLABLOQUEDATA',ftDateTime,False,False,False,True,'');
   fPlabloque := CreateCmDbField('PLABLOQUE',ftString,False,False,False,True,'');
   fPlaaltera := CreateCmDbField('PLAALTERA',ftString,True,False,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'');
   fIdrateioapextra := CreateCmDbField('IDRATEIOAPEXTRA',ftfloat,False,False,False,True,'');
   fIdratadmplanpatro := CreateCmDbField('IDRATADMPLANPATRO',ftfloat,False,False,False,True,'');
   fFlgestatcomlanc := CreateCmDbField('FLGESTATCOMLANC',ftString,False,False,False,True,'');

   // Alterado por Arnaldo V. Scarin em 24/08/2009
   // SOL: 122624 Kintana: 603582
   fFlgUsoExcPGA := CreateCmDbField('FlgUsoExcPGA',ftString,False,False,False,True,'');
   fSEGFDOADMDebito := CreateCmDbField('SEGFDOADMDebito',ftString,False,False,False,True,'');
   fSEGFDOADMCredito := CreateCmDbField('SEGFDOADMCredito',ftString,False,False,False,True,'');
   fPLAAGLUTINACAO := CreateCmDbField('PLAAGLUTINACAO',ftString,False,False,False,True,''); //MARCELO CARDOSO - SIG26555
   FPlaExtraContabil := CreateCmDbField('PLAEXTRACONTABIL', ftString, False, False, False, True, '');
end;

function TDbPlanoconta.Insert: Boolean;
begin
   Result := Inherited Insert;

end;

function TDbPlanoconta.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbPlanoconta.SetFlgestatcomlanc(const Value: TCmDbField);
begin
  FFlgestatcomlanc := Value;
end;


// Alterado por Arnaldo V. Scarin em 24/08/2009
// SOL: 122624 Kintana: 603582
procedure TDbPlanoconta.SetFlgUsoExcPGA(const Value: TCMDbField);
begin
  FFlgUsoExcPGA := Value;
end;

procedure TDbPlanoconta.SetIdPrograma(const Value: TCmDbField);
begin
  FIdPrograma := Value;
end;

procedure TDbPlanoconta.SetIdRatAdmPlanPatro(const Value: TCmDbField);
begin
  FIdRatAdmPlanPatro := Value;
end;

procedure TDbPlanoconta.SetIdrateioapextra(const Value: TCmDbField);
begin
  FIdrateioapextra := Value;
end;

procedure TDbPlanoconta.SetIdSegregaCriter(const Value: TCmDbField);
begin
  FIdSegregaCriter := Value;
end;

procedure TDbPlanoconta.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

// Início - 05/08/2003 - André Tavares - pendência 14616
procedure TDbPlanoconta.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;
// Fim - 05/08/2003 - André Tavares - pendência 14616

procedure TDbPlanoconta.SetPlaaltera(const Value: TCmDbField);
begin
  FPlaaltera := Value;
end;

procedure TDbPlanoconta.SetPlabloque(const Value: TCmDbField);
begin
  FPlabloque := Value;
end;

procedure TDbPlanoconta.SetPlabloquedata(const Value: TCmDbField);
begin
  FPlabloquedata := Value;
end;

procedure TDbPlanoconta.SetPlaccust(const Value: TCmDbField);
begin
  FPlaccust := Value;
end;

procedure TDbPlanoconta.SetPlaconcilia(const Value: TCmDbField);
begin
  FPlaconcilia := Value;
end;

procedure TDbPlanoconta.SetPlaconcorresp(const Value: TCmDbField);
begin
  FPlaconcorresp := Value;
end;

procedure TDbPlanoconta.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbPlanoconta.SetPlacontasegreg(const Value: TCmDbField);
begin
   Fplacontasegreg := Value;
end;

procedure TDbPlanoconta.SetPlacontrapartida(const Value: TCmDbField);
begin
  FPlacontrapartida := Value;
end;

procedure TDbPlanoconta.SetPlacontraptxjuros(const Value: TCmDbField);
begin
  FPlacontraptxjuros := Value;
end;

procedure TDbPlanoconta.SetPlagrau(const Value: TCmDbField);
begin
  FPlagrau := Value;
end;

procedure TDbPlanoconta.SetPlagrupo(const Value: TCmDbField);
begin
  FPlagrupo := Value;
end;

procedure TDbPlanoconta.SetPlaimprelatevol(const Value: TCmDbField);
begin
  FPlaimprelatevol := Value;
end;

procedure TDbPlanoconta.SetPlainativa(const Value: TCmDbField);
begin
  FPlainativa := Value;
end;

procedure TDbPlanoconta.SetPlamoedahistorica(const Value: TCmDbField);
begin
  FPlamoedahistorica := Value;
end;

procedure TDbPlanoconta.SetPlamutacoes(const Value: TCmDbField);
begin
  FPlamutacoes := Value;
end;

procedure TDbPlanoconta.SetPlanatureza(const Value: TCmDbField);
begin
  FPlanatureza := Value;
end;

procedure TDbPlanoconta.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbPlanoconta.SetPlanome(const Value: TCmDbField);
begin
  FPlanome := Value;
end;

procedure TDbPlanoconta.SetPlanomeoutling(const Value: TCmDbField);
begin
  FPlanomeoutling := Value;
end;

procedure TDbPlanoconta.SetPlaordalf(const Value: TCmDbField);
begin
  FPlaordalf := Value;
end;

procedure TDbPlanoconta.SetPlarateioap(const Value: TCmDbField);
begin
  FPlarateioap := Value;
end;

procedure TDbPlanoconta.SetPlareduz(const Value: TCmDbField);
begin
  FPlareduz := Value;
end;

procedure TDbPlanoconta.SetPlasecretaria(const Value: TCmDbField);
begin
  FPlasecretaria := Value;
end;

procedure TDbPlanoconta.SetPlasubconta(const Value: TCmDbField);
begin
  FPlasubconta := Value;
end;

procedure TDbPlanoconta.SetPlasubgr1(const Value: TCmDbField);
begin
  FPlasubgr1 := Value;
end;

procedure TDbPlanoconta.SetPlasubgr2(const Value: TCmDbField);
begin
  FPlasubgr2 := Value;
end;

procedure TDbPlanoconta.SetPlasubgr3(const Value: TCmDbField);
begin
  FPlasubgr3 := Value;
end;

procedure TDbPlanoconta.SetPlasubgr4(const Value: TCmDbField);
begin
  FPlasubgr4 := Value;
end;

procedure TDbPlanoconta.SetPlasumariza(const Value: TCmDbField);
begin
  FPlasumariza := Value;
end;

procedure TDbPlanoconta.SetPlatipconvger(const Value: TCmDbField);
begin
  FPlatipconvger := Value;
end;

procedure TDbPlanoconta.SetPlatipconvgeren1(const Value: TCmDbField);
begin
  FPlatipconvgeren1 := Value;
end;

procedure TDbPlanoconta.SetPlatipconvgeren2(const Value: TCmDbField);
begin
  FPlatipconvgeren2 := Value;
end;

procedure TDbPlanoconta.SetPlatipconvoficial(const Value: TCmDbField);
begin
  FPlatipconvoficial := Value;
end;

procedure TDbPlanoconta.SetPlatipo(const Value: TCmDbField);
begin
  FPlatipo := Value;
end;

procedure TDbPlanoconta.SetPlatxjuros(const Value: TCmDbField);
begin
  FPlatxjuros := Value;
end;

// Alterado por Arnaldo V. Scarin em 24/08/2009
// SOL: 122624 Kintana: 603582
procedure TDbPlanoconta.SetSEGFDOADMCredito(const Value: TCMDbField);
begin
  FSEGFDOADMCredito := Value;
end;

// Alterado por Arnaldo V. Scarin em 24/08/2009
// SOL: 122624 Kintana: 603582
procedure TDbPlanoconta.SetSEGFDOADMDebito(const Value: TCMDbField);
begin
  FSEGFDOADMDebito := Value;
end;

//INICIO - MARCELO CARDOSO - SIG26555
procedure TDbPlanoconta.SetPLAAGLUTINACAO(const Value: TCMDbField);
begin
  FPLAAGLUTINACAO:= Value;
end;
//INICIO - MARCELO CARDOSO - SIG26555
procedure TDbPlanoconta.SetPlaExtraContabil(const Value: TCmDbField);
begin
  FPlaExtraContabil := Value;
end;

end.



