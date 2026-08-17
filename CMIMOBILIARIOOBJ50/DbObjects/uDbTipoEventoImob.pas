{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Gustavo Mendes                  }
{ Atualizado Em: 13/11/2007                             }
{ Pendência: 26794                                      }
{                                                       }
{*******************************************************}

unit uDbTipoEventoImob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipoEventoImob = class(TCmDbObject)

  private
    FFlgtipoevento: TCmDbField;
    FFlgrad: TCmDbField;
    FDescricao: TCmDbField;
    FIdtipoeventoimob: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgrad(const Value: TCmDbField);
    procedure SetFlgtipoevento(const Value: TCmDbField);
    procedure SetIdtipoeventoimob(const Value: TCmDbField);

  public

     Property Idtipoeventoimob: TCmDbField read FIdtipoeventoimob write SetIdtipoeventoimob;
     Property Flgtipoevento: TCmDbField read FFlgtipoevento write SetFlgtipoevento;
     Property Flgrad: TCmDbField read FFlgrad write SetFlgrad;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTipoEventoImob }

constructor TDbTipoEventoImob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOEVENTOIMOB';

   fIdtipoeventoimob := CreateCmDbField('IDTIPOEVENTOIMOB',ftfloat,True,True,False,True,'');
   fFlgtipoevento := CreateCmDbField('FLGTIPOEVENTO',ftString,False,False,False,False,'');
   fFlgrad := CreateCmDbField('FLGRAD',ftfloat,False,False,False,False,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,False,'');
end;

function TDbTipoEventoImob.Insert: Boolean;
begin

   fIdtipoeventoimob.AsFloat := GetSequence('TIPOEVENTOIMOB');
   Result := Inherited Insert;

end;


procedure TDbTipoEventoImob.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbTipoEventoImob.SetFlgrad(const Value: TCmDbField);
begin
  FFlgrad := Value;
end;

procedure TDbTipoEventoImob.SetFlgtipoevento(const Value: TCmDbField);
begin
  FFlgtipoevento := Value;
end;

procedure TDbTipoEventoImob.SetIdtipoeventoimob(const Value: TCmDbField);
begin
  FIdtipoeventoimob := Value;
end;

end.



