{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 30/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamintbanco;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamintbanco = class(TCmDbObject)

  private
    FIdparamintbanco: TCmDbField;
    FIdmodeloscnab: TCmDbField;
    FDescparamintbanco: TCmDbField;
    FRecpag: TCmDbField;
    procedure SetDescparamintbanco(const Value: TCmDbField);
    procedure SetIdmodeloscnab(const Value: TCmDbField);
    procedure SetIdparamintbanco(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idparamintbanco: TCmDbField read FIdparamintbanco write SetIdparamintbanco;
     Property Idmodeloscnab: TCmDbField read FIdmodeloscnab write SetIdmodeloscnab;
     Property Descparamintbanco: TCmDbField read FDescparamintbanco write SetDescparamintbanco;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamintbanco }

constructor TDbParamintbanco.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMINTBANCO';

   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fIdparamintbanco := CreateCmDbField('IDPARAMINTBANCO',ftfloat,True,True,False,True,'');
   fIdmodeloscnab := CreateCmDbField('IDMODELOSCNAB',ftfloat,False,False,False,True,'');
   fDescparamintbanco := CreateCmDbField('DESCPARAMINTBANCO',ftString,False,False,False,True,'');
end;

function TDbParamintbanco.Insert: Boolean;
begin

//   fIdparamintbanco.AsFloat := GetSequence('PARAMINTBANCO');
   Result := Inherited Insert;

end;


procedure TDbParamintbanco.SetDescparamintbanco(const Value: TCmDbField);
begin
  FDescparamintbanco := Value;
end;

procedure TDbParamintbanco.SetIdmodeloscnab(const Value: TCmDbField);
begin
  FIdmodeloscnab := Value;
end;

procedure TDbParamintbanco.SetIdparamintbanco(const Value: TCmDbField);
begin
  FIdparamintbanco := Value;
end;

procedure TDbParamintbanco.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



