{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 11/03/2002                             }
{                                                       }
{*******************************************************}

unit uDBResponsavel;

interface

Uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

Type
  TDBResponsavel = class(TCmDbObject)

  private
    FFlgprojeto: TCmDbField;
    FFlgcontrato: TCmDbField;
    FIdresponsavel: TCmDbField;
    FFlgadmprev: TCmDbField;
    FFlgimobiliario: TCmDbField;
    FFlgtpresponsavel: TCmDbField;
    FFlgativofixo: TCmDbField;
    procedure SetFlgadmprev(const Value: TCmDbField);
    procedure SetFlgativofixo(const Value: TCmDbField);
    procedure SetFlgcontrato(const Value: TCmDbField);
    procedure SetFlgimobiliario(const Value: TCmDbField);
    procedure SetFlgprojeto(const Value: TCmDbField);
    procedure SetFlgtpresponsavel(const Value: TCmDbField);
    procedure SetIdresponsavel(const Value: TCmDbField);

  public

     Property Idresponsavel: TCmDbField read FIdresponsavel write SetIdresponsavel;
     Property Flgtpresponsavel: TCmDbField read FFlgtpresponsavel write SetFlgtpresponsavel;
     Property Flgprojeto: TCmDbField read FFlgprojeto write SetFlgprojeto;
     Property Flgimobiliario: TCmDbField read FFlgimobiliario write SetFlgimobiliario;
     Property Flgcontrato: TCmDbField read FFlgcontrato write SetFlgcontrato;
     Property Flgativofixo: TCmDbField read FFlgativofixo write SetFlgativofixo;
     Property Flgadmprev: TCmDbField read FFlgadmprev write SetFlgadmprev;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBResponsavel }

constructor TDBResponsavel.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'RESPONSAVEL';

   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,True,True,False,True,'');
   fFlgtpresponsavel := CreateCmDbField('FLGTPRESPONSAVEL',ftfloat,False,False,False,False,'');
   fFlgprojeto := CreateCmDbField('FLGPROJETO',ftfloat,False,False,False,False,'');
   fFlgimobiliario := CreateCmDbField('FLGIMOBILIARIO',ftfloat,False,False,False,False,'');
   fFlgcontrato := CreateCmDbField('FLGCONTRATO',ftfloat,False,False,False,False,'');
   fFlgativofixo := CreateCmDbField('FLGATIVOFIXO',ftfloat,False,False,False,False,'');
   fFlgadmprev := CreateCmDbField('FLGADMPREV',ftfloat,False,False,False,False,'');
end;

function TDBResponsavel.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBResponsavel.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBResponsavel.SetFlgadmprev(const Value: TCmDbField);
begin
   FFlgadmprev := Value;
end;

procedure TDBResponsavel.SetFlgativofixo(const Value: TCmDbField);
begin
   FFlgativofixo := Value;
end;

procedure TDBResponsavel.SetFlgcontrato(const Value: TCmDbField);
begin
   FFlgcontrato := Value;
end;

procedure TDBResponsavel.SetFlgimobiliario(const Value: TCmDbField);
begin
   FFlgimobiliario := Value;
end;

procedure TDBResponsavel.SetFlgprojeto(const Value: TCmDbField);
begin
   FFlgprojeto := Value;
end;

procedure TDBResponsavel.SetFlgtpresponsavel(const Value: TCmDbField);
begin
   FFlgtpresponsavel := Value;
end;

procedure TDBResponsavel.SetIdresponsavel(const Value: TCmDbField);
begin
   FIdresponsavel := Value;
end;

end.



