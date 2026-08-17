{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 10/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbPlanoconta;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

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

  public

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
     Property Plabloquedata: TCmDbField read FPlabloquedata write SetPlabloquedata;
     Property Plabloque: TCmDbField read FPlabloque write SetPlabloque;
     Property Plaaltera: TCmDbField read FPlaaltera write SetPlaaltera;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idrateioapextra: TCmDbField read FIdrateioapextra write SetIdrateioapextra;
     Property Flgestatcomlanc: TCmDbField read FFlgestatcomlanc write SetFlgestatcomlanc;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPlanoconta }

constructor TDbPlanoconta.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANOCONTA';

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
   fFlgestatcomlanc := CreateCmDbField('FLGESTATCOMLANC',ftString,False,False,False,True,'');
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


procedure TDbPlanoconta.SetIdrateioapextra(const Value: TCmDbField);
begin
  FIdrateioapextra := Value;
end;

procedure TDbPlanoconta.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

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

end.



