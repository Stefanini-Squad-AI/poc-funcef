{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 10/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbDemlinha;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDemlinha = class(TCmDbObject)

  private
    FNomelinha: TCmDbField;
    FFlgnatureza: TCmDbField;
    FFlgpassatraco: TCmDbField;
    FOrdemlinha: TCmDbField;
    FFlgmonetaria: TCmDbField;
    FIdlinha: TCmDbField;
    FIddemonstrativo: TCmDbField;
    procedure SetFlgmonetaria(const Value: TCmDbField);
    procedure SetFlgnatureza(const Value: TCmDbField);
    procedure SetFlgpassatraco(const Value: TCmDbField);
    procedure SetIddemonstrativo(const Value: TCmDbField);
    procedure SetIdlinha(const Value: TCmDbField);
    procedure SetNomelinha(const Value: TCmDbField);
    procedure SetOrdemlinha(const Value: TCmDbField);

  public

     Property Ordemlinha     : TCmDbField read FOrdemlinha write SetOrdemlinha;
     Property Nomelinha      : TCmDbField read FNomelinha write SetNomelinha;
     Property Idlinha        : TCmDbField read FIdlinha write SetIdlinha;
     Property Iddemonstrativo: TCmDbField read FIddemonstrativo write SetIddemonstrativo;
     Property Flgpassatraco  : TCmDbField read FFlgpassatraco write SetFlgpassatraco;
     Property Flgnatureza    : TCmDbField read FFlgnatureza write SetFlgnatureza;
     Property Flgmonetaria   :  TCmDbField read FFlgmonetaria write SetFlgmonetaria;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbDemlinha }

constructor TDbDemlinha.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DEMLINHA';

   fOrdemlinha      := CreateCmDbField('ORDEMLINHA',ftfloat,False,False,False,True,'');
   fNomelinha       := CreateCmDbField('NOMELINHA',ftString,False,False,False,True,'');
   fIdlinha         := CreateCmDbField('IDLINHA',ftfloat,True,True,False,True,'');
   fIddemonstrativo := CreateCmDbField('IDDEMONSTRATIVO',ftfloat,False,False,False,True,'');
   fFlgpassatraco   := CreateCmDbField('FLGPASSATRACO',ftString,False,False,False,True,'');
   fFlgnatureza     := CreateCmDbField('FLGNATUREZA',ftString,False,False,False,True,'');
   fFlgmonetaria    := CreateCmDbField('FLGMONETARIA',ftString,False,False,False,True,'');
end;

function TDbDemlinha.Insert: Boolean;
begin

   fIdlinha.AsFloat := GetSequence('DEMLINHA');
   Result := Inherited Insert;

end;

function TDbDemlinha.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbDemlinha.SetFlgmonetaria(const Value: TCmDbField);
begin
  FFlgmonetaria := Value;
end;

procedure TDbDemlinha.SetFlgnatureza(const Value: TCmDbField);
begin
  FFlgnatureza := Value;
end;

procedure TDbDemlinha.SetFlgpassatraco(const Value: TCmDbField);
begin
  FFlgpassatraco := Value;
end;

procedure TDbDemlinha.SetIddemonstrativo(const Value: TCmDbField);
begin
  FIddemonstrativo := Value;
end;

procedure TDbDemlinha.SetIdlinha(const Value: TCmDbField);
begin
  FIdlinha := Value;
end;

procedure TDbDemlinha.SetNomelinha(const Value: TCmDbField);
begin
  FNomelinha := Value;
end;

procedure TDbDemlinha.SetOrdemlinha(const Value: TCmDbField);
begin
  FOrdemlinha := Value;
end;

end.



