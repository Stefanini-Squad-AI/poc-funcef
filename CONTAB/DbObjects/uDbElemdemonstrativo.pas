{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 07/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbElemdemonstrativo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbElemdemonstrativo = class(TCmDbObject)

  private
    FFlgdecimais: TCmDbField;
    FEletipoelem: TCmDbField;
    FEledescelem: TCmDbField;
    FFlgacumulado: TCmDbField;
    FEleordemlinha: TCmDbField;
    FFlgsaltapagina: TCmDbField;
    FElecodigo: TCmDbField;
    FFlgtraco: TCmDbField;
    FIdelemdemonstrat: TCmDbField;
    FIddemonstrativo: TCmDbField;
    FIdelemanavertical: TCmDbField;
    FIdelemanavert1: TCmDbField;
    FFlgnatureza: TCmDbField;
    FFlgtiponegativo: TCmDbField;
    FEleordem: TCmDbField;
    FFlgmonetaria: TCmDbField;
    FFlgnegrito: TCmDbField;
    FFlgtipolinha: TCmDbField;
    FFlgindentacao: TCmDbField;
    procedure SetElecodigo(const Value: TCmDbField);
    procedure SetEledescelem(const Value: TCmDbField);
    procedure SetEleordem(const Value: TCmDbField);
    procedure SetEleordemlinha(const Value: TCmDbField);
    procedure SetEletipoelem(const Value: TCmDbField);
    procedure SetFlgacumulado(const Value: TCmDbField);
    procedure SetFlgdecimais(const Value: TCmDbField);
    procedure SetFlgindentacao(const Value: TCmDbField);
    procedure SetFlgmonetaria(const Value: TCmDbField);
    procedure SetFlgnatureza(const Value: TCmDbField);
    procedure SetFlgnegrito(const Value: TCmDbField);
    procedure SetFlgsaltapagina(const Value: TCmDbField);
    procedure SetFlgtipolinha(const Value: TCmDbField);
    procedure SetFlgtiponegativo(const Value: TCmDbField);
    procedure SetFlgtraco(const Value: TCmDbField);
    procedure SetIddemonstrativo(const Value: TCmDbField);
    procedure SetIdelemanavert1(const Value: TCmDbField);
    procedure SetIdelemanavertical(const Value: TCmDbField);
    procedure SetIdelemdemonstrat(const Value: TCmDbField);

  public

     Property Idelemdemonstrat: TCmDbField read FIdelemdemonstrat write SetIdelemdemonstrat;
     Property Idelemanavert1: TCmDbField read FIdelemanavert1 write SetIdelemanavert1;
     Property Idelemanavertical: TCmDbField read FIdelemanavertical write SetIdelemanavertical;
     Property Iddemonstrativo: TCmDbField read FIddemonstrativo write SetIddemonstrativo;
     Property Flgtraco: TCmDbField read FFlgtraco write SetFlgtraco;
     Property Flgtiponegativo: TCmDbField read FFlgtiponegativo write SetFlgtiponegativo;
     Property Flgtipolinha: TCmDbField read FFlgtipolinha write SetFlgtipolinha;
     Property Flgsaltapagina: TCmDbField read FFlgsaltapagina write SetFlgsaltapagina;
     Property Flgnegrito: TCmDbField read FFlgnegrito write SetFlgnegrito;
     Property Flgnatureza: TCmDbField read FFlgnatureza write SetFlgnatureza;
     Property Flgmonetaria: TCmDbField read FFlgmonetaria write SetFlgmonetaria;
     Property Flgindentacao: TCmDbField read FFlgindentacao write SetFlgindentacao;
     Property Flgdecimais: TCmDbField read FFlgdecimais write SetFlgdecimais;
     Property Flgacumulado: TCmDbField read FFlgacumulado write SetFlgacumulado;
     Property Eletipoelem: TCmDbField read FEletipoelem write SetEletipoelem;
     Property Eleordemlinha: TCmDbField read FEleordemlinha write SetEleordemlinha;
     Property Eleordem: TCmDbField read FEleordem write SetEleordem;
     Property Eledescelem: TCmDbField read FEledescelem write SetEledescelem;
     Property Elecodigo: TCmDbField read FElecodigo write SetElecodigo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbElemdemonstrativo }

constructor TDbElemdemonstrativo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'ELEMDEMONSTRATIVO';

   fIdelemdemonstrat  := CreateCmDbField('IDELEMDEMONSTRAT',ftfloat,True,True,False,True,'');
   fIdelemanavert1    := CreateCmDbField('IDELEMANAVERT1',ftfloat,False,False,False,True,'');
   fIdelemanavertical := CreateCmDbField('IDELEMANAVERTICAL',ftfloat,False,False,False,True,'');
   fIddemonstrativo   := CreateCmDbField('IDDEMONSTRATIVO',ftfloat,False,False,False,True,'');
   fFlgtraco          := CreateCmDbField('FLGTRACO',ftString,False,False,False,True,'');
   fFlgtiponegativo   := CreateCmDbField('FLGTIPONEGATIVO',ftString,False,False,False,True,'');
   fFlgtipolinha      := CreateCmDbField('FLGTIPOLINHA',ftString,False,False,False,True,'');
   fFlgsaltapagina    := CreateCmDbField('FLGSALTAPAGINA',ftString,False,False,False,True,'');
   fFlgnegrito        := CreateCmDbField('FLGNEGRITO',ftString,False,False,False,True,'');
   fFlgnatureza       := CreateCmDbField('FLGNATUREZA',ftString,False,False,False,True,'');
   fFlgmonetaria      := CreateCmDbField('FLGMONETARIA',ftString,False,False,False,True,'');
   fFlgindentacao     := CreateCmDbField('FLGINDENTACAO',ftString,False,False,False,True,'');
   fFlgdecimais       := CreateCmDbField('FLGDECIMAIS',ftString,False,False,False,True,'');
   fFlgacumulado      := CreateCmDbField('FLGACUMULADO',ftString,False,False,False,True,'');
   fEletipoelem       := CreateCmDbField('ELETIPOELEM',ftString,False,False,False,True,'');
   fEleordemlinha     := CreateCmDbField('ELEORDEMLINHA',ftfloat,False,False,False,True,'');
   fEleordem          := CreateCmDbField('ELEORDEM',ftString,False,False,False,True,'');
   fEledescelem       := CreateCmDbField('ELEDESCELEM',ftString,False,False,False,True,'');
   fElecodigo         := CreateCmDbField('ELECODIGO',ftString,False,False,False,True,'');
end;

function TDbElemdemonstrativo.Insert: Boolean;
begin

   fIdelemdemonstrat.AsFloat := GetSequence('ELEMDEMONSTRATIVO');
   Result := Inherited Insert;

end;

function TDbElemdemonstrativo.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbElemdemonstrativo.SetElecodigo(const Value: TCmDbField);
begin
  FElecodigo := Value;
end;

procedure TDbElemdemonstrativo.SetEledescelem(const Value: TCmDbField);
begin
  FEledescelem := Value;
end;

procedure TDbElemdemonstrativo.SetEleordem(const Value: TCmDbField);
begin
  FEleordem := Value;
end;

procedure TDbElemdemonstrativo.SetEleordemlinha(const Value: TCmDbField);
begin
  FEleordemlinha := Value;
end;

procedure TDbElemdemonstrativo.SetEletipoelem(const Value: TCmDbField);
begin
  FEletipoelem := Value;
end;

procedure TDbElemdemonstrativo.SetFlgacumulado(const Value: TCmDbField);
begin
  FFlgacumulado := Value;
end;

procedure TDbElemdemonstrativo.SetFlgdecimais(const Value: TCmDbField);
begin
  FFlgdecimais := Value;
end;

procedure TDbElemdemonstrativo.SetFlgindentacao(const Value: TCmDbField);
begin
  FFlgindentacao := Value;
end;

procedure TDbElemdemonstrativo.SetFlgmonetaria(const Value: TCmDbField);
begin
  FFlgmonetaria := Value;
end;

procedure TDbElemdemonstrativo.SetFlgnatureza(const Value: TCmDbField);
begin
  FFlgnatureza := Value;
end;

procedure TDbElemdemonstrativo.SetFlgnegrito(const Value: TCmDbField);
begin
  FFlgnegrito := Value;
end;

procedure TDbElemdemonstrativo.SetFlgsaltapagina(const Value: TCmDbField);
begin
  FFlgsaltapagina := Value;
end;

procedure TDbElemdemonstrativo.SetFlgtipolinha(const Value: TCmDbField);
begin
  FFlgtipolinha := Value;
end;

procedure TDbElemdemonstrativo.SetFlgtiponegativo(const Value: TCmDbField);
begin
  FFlgtiponegativo := Value;
end;

procedure TDbElemdemonstrativo.SetFlgtraco(const Value: TCmDbField);
begin
  FFlgtraco := Value;
end;

procedure TDbElemdemonstrativo.SetIddemonstrativo(const Value: TCmDbField);
begin
  FIddemonstrativo := Value;
end;

procedure TDbElemdemonstrativo.SetIdelemanavert1(const Value: TCmDbField);
begin
  FIdelemanavert1 := Value;
end;

procedure TDbElemdemonstrativo.SetIdelemanavertical(
  const Value: TCmDbField);
begin
  FIdelemanavertical := Value;
end;

procedure TDbElemdemonstrativo.SetIdelemdemonstrat(
  const Value: TCmDbField);
begin
  FIdelemdemonstrat := Value;
end;

end.



