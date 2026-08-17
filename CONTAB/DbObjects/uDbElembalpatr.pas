{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 28/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbElembalpatr;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbElembalpatr = class(TCmDbObject)

  private
    FIddemonstrativo: TCmDbField;
    FEbpdescricao: TCmDbField;
    FIdelembalpatr: TCmDbField;
    FIdelemdemonstrat: TCmDbField;
    FEleposicao: TCmDbField;
    procedure SetEbpdescricao(const Value: TCmDbField);
    procedure SetEleposicao(const Value: TCmDbField);
    procedure SetIddemonstrativo(const Value: TCmDbField);
    procedure SetIdelembalpatr(const Value: TCmDbField);
    procedure SetIdelemdemonstrat(const Value: TCmDbField);

  public

     Property Idelemdemonstrat:TCmDbField read FIdelemdemonstrat write SetIdelemdemonstrat;
     Property Idelembalpatr   :TCmDbField read FIdelembalpatr    write SetIdelembalpatr;
     Property Iddemonstrativo :TCmDbField read FIddemonstrativo  write SetIddemonstrativo;
     Property Eleposicao      :TCmDbField read FEleposicao       write SetEleposicao;
     Property Ebpdescricao    :TCmDbField read FEbpdescricao     write SetEbpdescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbElembalpatr }

constructor TDbElembalpatr.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ELEMBALPATR';

   fIdelemdemonstrat := CreateCmDbField('IDELEMDEMONSTRAT',ftfloat,True,False,False,True);
   fIdelembalpatr    := CreateCmDbField('IDELEMBALPATR',ftfloat,False,True,False,True);
   fIddemonstrativo  := CreateCmDbField('IDDEMONSTRATIVO',ftfloat,True,False,False,True);
   fEleposicao       := CreateCmDbField('ELEPOSICAO',ftfloat,True,False,False,True);
   fEbpdescricao     := CreateCmDbField('EBPDESCRICAO',ftString,True,False,False,True);
end;

function TDbElembalpatr.Insert: Boolean;
begin

   fIdelembalpatr.AsFloat := GetSequence('ELEMBALPATR');
   Result := Inherited Insert;

end;

function TDbElembalpatr.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbElembalpatr.SetEbpdescricao(const Value: TCmDbField);
begin
  FEbpdescricao := Value;
end;

procedure TDbElembalpatr.SetEleposicao(const Value: TCmDbField);
begin
  FEleposicao := Value;
end;

procedure TDbElembalpatr.SetIddemonstrativo(const Value: TCmDbField);
begin
  FIddemonstrativo := Value;
end;

procedure TDbElembalpatr.SetIdelembalpatr(const Value: TCmDbField);
begin
  FIdelembalpatr := Value;
end;

procedure TDbElembalpatr.SetIdelemdemonstrat(const Value: TCmDbField);
begin
  FIdelemdemonstrat := Value;
end;


end.



