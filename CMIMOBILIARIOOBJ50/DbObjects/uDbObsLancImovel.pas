{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 31/10/2003                             }
{                                                       }
{*******************************************************}

unit uDbObsLancImovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbObsLancImovel = class(TCmDbObject)

  private
    FIddocumento: TCmDbField;
    FObs: TCmDbField;
    procedure SetIddocumento(const Value: TCmDbField);
    procedure SetObs(const Value: TCmDbField);

  public

     Property Obs: TCmDbField read FObs write SetObs;
     Property Iddocumento: TCmDbField read FIddocumento write SetIddocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbObsLancImovel }

constructor TDbObsLancImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OBSLANCIMOVEL';

   fObs := CreateCmDbField('OBS',ftString,False,False,False,True,'');
   fIddocumento := CreateCmDbField('IDDOCUMENTO',ftfloat,True,True,False,True,'');
end;

function TDbObsLancImovel.Insert: Boolean;
begin
  Result := Inherited Insert;
end;


procedure TDbObsLancImovel.SetIddocumento(const Value: TCmDbField);
begin
  FIddocumento := Value;
end;

procedure TDbObsLancImovel.SetObs(const Value: TCmDbField);
begin
  FObs := Value;
end;

end.



