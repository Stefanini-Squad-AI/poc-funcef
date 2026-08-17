{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbRadgrupoprocesso;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadgrupoprocesso = class(TCmDbObject)

  private
    FDescgrupoprocesso: TCmDbField;
    FIdgrupoprocesso: TCmDbField;
    procedure SetDescgrupoprocesso(const Value: TCmDbField);
    procedure SetIdgrupoprocesso(const Value: TCmDbField);

  public

     Property Idgrupoprocesso: TCmDbField read FIdgrupoprocesso write SetIdgrupoprocesso;
     Property Descgrupoprocesso: TCmDbField read FDescgrupoprocesso write SetDescgrupoprocesso;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadgrupoprocesso }

constructor TDbRadgrupoprocesso.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADGRUPOPROCESSO';

   fIdgrupoprocesso := CreateCmDbField('IDGRUPOPROCESSO',ftfloat,True,True,False,True,'');
   fDescgrupoprocesso := CreateCmDbField('DESCGRUPOPROCESSO',ftString,False,False,False,True,'');
end;

function TDbRadgrupoprocesso.Insert: Boolean;
begin

   fIdgrupoprocesso.AsFloat := GetSequence('RADGRUPOPROCESSO');
   Result := Inherited Insert;

end;


procedure TDbRadgrupoprocesso.SetDescgrupoprocesso(
  const Value: TCmDbField);
begin
  FDescgrupoprocesso := Value;
end;

procedure TDbRadgrupoprocesso.SetIdgrupoprocesso(const Value: TCmDbField);
begin
  FIdgrupoprocesso := Value;
end;

end.



