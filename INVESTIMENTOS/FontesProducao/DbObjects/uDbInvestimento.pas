{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 01/11/2005                             }
{                                                       }
{*******************************************************}

unit uDbInvestimento;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbInvestimento = class(TCmDbObject)

  private
    FCodisin: TCmDbField;
    FDescclassinvest: TCmDbField;
    FDescinvestimento: TCmDbField;
    FIdinvestprp: TCmDbField;
    FFlgativo: TCmDbField;
    FStaopcao: TCmDbField;
    FFlgrfxantigo: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FIdemissor: TCmDbField;
    FFlginvestprp: TCmDbField;
    FFlgrepactua: TCmDbField;
    FIdclassetit: TCmDbField;
    FObsinvestimento: TCmDbField;
    FIdcarteiraspc: TCmDbField;
    FIdmoedacontab: TCmDbField;
    FCarencia: TCmDbField;
    FIdinvestimento: TCmDbField;
    procedure SetCarencia(const Value: TCmDbField);
    procedure SetCodisin(const Value: TCmDbField);
    procedure SetDescclassinvest(const Value: TCmDbField);
    procedure SetDescinvestimento(const Value: TCmDbField);
    procedure SetFlgativo(const Value: TCmDbField);
    procedure SetFlginvestprp(const Value: TCmDbField);
    procedure SetFlgrepactua(const Value: TCmDbField);
    procedure SetFlgrfxantigo(const Value: TCmDbField);
    procedure SetIdcarteiraspc(const Value: TCmDbField);
    procedure SetIdclassetit(const Value: TCmDbField);
    procedure SetIdemissor(const Value: TCmDbField);
    procedure SetIdinvestimento(const Value: TCmDbField);
    procedure SetIdinvestprp(const Value: TCmDbField);
    procedure SetIdmoedacontab(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetObsinvestimento(const Value: TCmDbField);
    procedure SetStaopcao(const Value: TCmDbField);

  public

     Property Staopcao: TCmDbField read FStaopcao write SetStaopcao;
     Property Obsinvestimento: TCmDbField read FObsinvestimento write SetObsinvestimento;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idmoedacontab: TCmDbField read FIdmoedacontab write SetIdmoedacontab;
     Property Idinvestprp: TCmDbField read FIdinvestprp write SetIdinvestprp;
     Property Idinvestimento: TCmDbField read FIdinvestimento write SetIdinvestimento;
     Property Idemissor: TCmDbField read FIdemissor write SetIdemissor;
     Property Idclassetit: TCmDbField read FIdclassetit write SetIdclassetit;
     Property Idcarteiraspc: TCmDbField read FIdcarteiraspc write SetIdcarteiraspc;
     Property Flgrfxantigo: TCmDbField read FFlgrfxantigo write SetFlgrfxantigo;
     Property Flgrepactua: TCmDbField read FFlgrepactua write SetFlgrepactua;
     Property Flginvestprp: TCmDbField read FFlginvestprp write SetFlginvestprp;
     Property Flgativo: TCmDbField read FFlgativo write SetFlgativo;
     Property Descinvestimento: TCmDbField read FDescinvestimento write SetDescinvestimento;
     Property Descclassinvest: TCmDbField read FDescclassinvest write SetDescclassinvest;
     Property Codisin: TCmDbField read FCodisin write SetCodisin;
     Property Carencia: TCmDbField read FCarencia write SetCarencia;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbInvestimento }

constructor TDbInvestimento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INVESTIMENTO';

   fStaopcao         := CreateCmDbField('STAOPCAO',ftString,False,False,False,True,'');
   fObsinvestimento  := CreateCmDbField('OBSINVESTIMENTO',ftString,False,False,False,True,'');
   fIdtipoinvest     := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'');
   fIdmoedacontab    := CreateCmDbField('IDMOEDACONTAB',ftfloat,False,False,False,True,'');
   fIdinvestprp      := CreateCmDbField('IDINVESTPRP',ftfloat,False,False,False,True,'');
   fIdinvestimento   := CreateCmDbField('IDINVESTIMENTO',ftfloat,True,True,False,True,'');
   fIdemissor        := CreateCmDbField('IDEMISSOR',ftfloat,False,False,False,True,'');
   fIdclassetit      := CreateCmDbField('IDCLASSETIT',ftfloat,False,False,False,True,'');
   fIdcarteiraspc    := CreateCmDbField('IDCARTEIRASPC',ftfloat,False,False,False,True,'');
   fFlgrfxantigo     := CreateCmDbField('FLGRFXANTIGO',ftString,False,False,False,True,'');
   fFlgrepactua      := CreateCmDbField('FLGREPACTUA',ftString,False,False,False,True,'');
   fFlginvestprp     := CreateCmDbField('FLGINVESTPRP',ftString,False,False,False,True,'');
   fFlgativo         := CreateCmDbField('FLGATIVO',ftString,False,False,False,True,'');
   fDescinvestimento := CreateCmDbField('DESCINVESTIMENTO',ftString,False,False,False,True,'');
   fDescclassinvest  := CreateCmDbField('DESCCLASSINVEST',ftString,False,False,False,True,'');
   fCodisin          := CreateCmDbField('CODISIN',ftString,False,False,False,True,'');
   fCarencia         := CreateCmDbField('CARENCIA',ftfloat,False,False,False,True,'');
end;

function TDbInvestimento.Insert: Boolean;
begin

   fIdinvestimento.AsFloat := GetSequence('INVESTIMENTO');
   Result := Inherited Insert;

end;


procedure TDbInvestimento.SetCarencia(const Value: TCmDbField);
begin
  FCarencia := Value;
end;

procedure TDbInvestimento.SetCodisin(const Value: TCmDbField);
begin
  FCodisin := Value;
end;

procedure TDbInvestimento.SetDescclassinvest(const Value: TCmDbField);
begin
  FDescclassinvest := Value;
end;

procedure TDbInvestimento.SetDescinvestimento(const Value: TCmDbField);
begin
  FDescinvestimento := Value;
end;

procedure TDbInvestimento.SetFlgativo(const Value: TCmDbField);
begin
  FFlgativo := Value;
end;

procedure TDbInvestimento.SetFlginvestprp(const Value: TCmDbField);
begin
  FFlginvestprp := Value;
end;

procedure TDbInvestimento.SetFlgrepactua(const Value: TCmDbField);
begin
  FFlgrepactua := Value;
end;

procedure TDbInvestimento.SetFlgrfxantigo(const Value: TCmDbField);
begin
  FFlgrfxantigo := Value;
end;

procedure TDbInvestimento.SetIdcarteiraspc(const Value: TCmDbField);
begin
  FIdcarteiraspc := Value;
end;

procedure TDbInvestimento.SetIdclassetit(const Value: TCmDbField);
begin
  FIdclassetit := Value;
end;

procedure TDbInvestimento.SetIdemissor(const Value: TCmDbField);
begin
  FIdemissor := Value;
end;

procedure TDbInvestimento.SetIdinvestimento(const Value: TCmDbField);
begin
  FIdinvestimento := Value;
end;

procedure TDbInvestimento.SetIdinvestprp(const Value: TCmDbField);
begin
  FIdinvestprp := Value;
end;

procedure TDbInvestimento.SetIdmoedacontab(const Value: TCmDbField);
begin
  FIdmoedacontab := Value;
end;

procedure TDbInvestimento.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbInvestimento.SetObsinvestimento(const Value: TCmDbField);
begin
  FObsinvestimento := Value;
end;

procedure TDbInvestimento.SetStaopcao(const Value: TCmDbField);
begin
  FStaopcao := Value;
end;

end.



