{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbRadandamento;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadandamento = class(TCmDbObject)

  private
    FNome: TCmDbField;
    FIdandamento: TCmDbField;
    procedure SetIdandamento(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);

  public

     Property Nome: TCmDbField read FNome write SetNome;
     Property Idandamento: TCmDbField read FIdandamento write SetIdandamento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadandamento }

constructor TDbRadandamento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADANDAMENTO';

   fNome := CreateCmDbField('NOME',ftString,True,False,False,True,'');
   fIdandamento := CreateCmDbField('IDANDAMENTO',ftfloat,True,True,False,True,'');
end;

function TDbRadandamento.Insert: Boolean;
begin

   fIdandamento.AsFloat := GetSequence('RADANDAMENTO');
   Result := Inherited Insert;

end;


procedure TDbRadandamento.SetIdandamento(const Value: TCmDbField);
begin
  FIdandamento := Value;
end;

procedure TDbRadandamento.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

end.



