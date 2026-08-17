{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 31/10/2003                             }
{                                                       }
{*******************************************************}

unit uDbDeparacr;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDeparacr = class(TCmDbObject)

  private
    FIddeparacr: TCmDbField;
    FCodcrfim: TCmDbField;
    FIdplancrfim: TCmDbField;
    FIdempresaprop: TCmDbField;
    FCodcrini: TCmDbField;
    FIdplancrini: TCmDbField;
    procedure SetCodcrfim(const Value: TCmDbField);
    procedure SetCodcrini(const Value: TCmDbField);
    procedure SetIddeparacr(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdplancrfim(const Value: TCmDbField);
    procedure SetIdplancrini(const Value: TCmDbField);

  public

     Property Idplancrini: TCmDbField read FIdplancrini write SetIdplancrini;
     Property Idplancrfim: TCmDbField read FIdplancrfim write SetIdplancrfim;
     Property Idempresaprop: TCmDbField read FIdempresaprop write SetIdempresaprop;
     Property Iddeparacr: TCmDbField read FIddeparacr write SetIddeparacr;
     Property Codcrini: TCmDbField read FCodcrini write SetCodcrini;
     Property Codcrfim: TCmDbField read FCodcrfim write SetCodcrfim;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbDeparacr }

constructor TDbDeparacr.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DEPARACR';

   fIdplancrini := CreateCmDbField('IDPLANCRINI',ftfloat,False,False,False,True,'');
   fIdplancrfim := CreateCmDbField('IDPLANCRFIM',ftfloat,False,False,False,True,'');
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'');
   fIddeparacr := CreateCmDbField('IDDEPARACR',ftfloat,True,False,False,True,'');
   fCodcrini := CreateCmDbField('CODCRINI',ftString,False,False,False,True,'');
   fCodcrfim := CreateCmDbField('CODCRFIM',ftString,False,False,False,True,'');
end;

function TDbDeparacr.Insert: Boolean;
begin
   fIddeparacr.AsFloat := GetSequence('DEPARACR');
   Result := Inherited Insert;
end;


procedure TDbDeparacr.SetCodcrfim(const Value: TCmDbField);
begin
  FCodcrfim := Value;
end;

procedure TDbDeparacr.SetCodcrini(const Value: TCmDbField);
begin
  FCodcrini := Value;
end;

procedure TDbDeparacr.SetIddeparacr(const Value: TCmDbField);
begin
  FIddeparacr := Value;
end;

procedure TDbDeparacr.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDbDeparacr.SetIdplancrfim(const Value: TCmDbField);
begin
  FIdplancrfim := Value;
end;

procedure TDbDeparacr.SetIdplancrini(const Value: TCmDbField);
begin
  FIdplancrini := Value;
end;

end.
