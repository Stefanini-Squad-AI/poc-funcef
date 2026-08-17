{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbRadgrprespon;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadgrprespon = class(TCmDbObject)

  private
    FNivel: TCmDbField;
    FNome: TCmDbField;
    FIdgrprespon: TCmDbField;
    procedure SetIdgrprespon(const Value: TCmDbField);
    procedure SetNivel(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);

  public

     Property Nome: TCmDbField read FNome write SetNome;
     Property Nivel: TCmDbField read FNivel write SetNivel;
     Property Idgrprespon: TCmDbField read FIdgrprespon write SetIdgrprespon;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadgrprespon }

constructor TDbRadgrprespon.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADGRPRESPON';

   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fNivel := CreateCmDbField('NIVEL',ftfloat,False,False,False,True,'');
   fIdgrprespon := CreateCmDbField('IDGRPRESPON',ftfloat,True,True,False,True,'');
end;

function TDbRadgrprespon.Insert: Boolean;
begin

   fIdgrprespon.AsFloat := GetSequence('RADGRPRESPON');
   Result := Inherited Insert;

end;


procedure TDbRadgrprespon.SetIdgrprespon(const Value: TCmDbField);
begin
  FIdgrprespon := Value;
end;

procedure TDbRadgrprespon.SetNivel(const Value: TCmDbField);
begin
  FNivel := Value;
end;

procedure TDbRadgrprespon.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

end.



