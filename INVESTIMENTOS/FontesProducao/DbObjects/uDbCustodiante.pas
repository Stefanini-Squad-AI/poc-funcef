{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 02/09/2005                             }
{                                                       }
{*******************************************************}

unit uDbCustodiante;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCustodiante = class(TCmDbObject)

  private
    FFlgcodativocust: TCmDbField;
    FIdcustodiante: TCmDbField;
    FSglcustodiante: TCmDbField;
    procedure SetFlgcodativocust(const Value: TCmDbField);
    procedure SetIdcustodiante(const Value: TCmDbField);
    procedure SetSglcustodiante(const Value: TCmDbField);

  public

     Property Sglcustodiante: TCmDbField read FSglcustodiante write SetSglcustodiante;
     Property Idcustodiante: TCmDbField read FIdcustodiante write SetIdcustodiante;
     Property Flgcodativocust: TCmDbField read FFlgcodativocust write SetFlgcodativocust;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCustodiante }

constructor TDbCustodiante.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CUSTODIANTE';

   fSglcustodiante := CreateCmDbField('SGLCUSTODIANTE',ftString,True,False,False,True,'');
   fIdcustodiante := CreateCmDbField('IDCUSTODIANTE',ftfloat,True,True,False,True,'');
   fFlgcodativocust := CreateCmDbField('FLGCODATIVOCUST',ftString,False,False,False,True,'');
end;

function TDbCustodiante.Insert: Boolean;
begin

   fIdcustodiante.AsFloat := GetSequence('CUSTODIANTE');
   Result := Inherited Insert;

end;


procedure TDbCustodiante.SetFlgcodativocust(const Value: TCmDbField);
begin
  FFlgcodativocust := Value;
end;

procedure TDbCustodiante.SetIdcustodiante(const Value: TCmDbField);
begin
  FIdcustodiante := Value;
end;

procedure TDbCustodiante.SetSglcustodiante(const Value: TCmDbField);
begin
  FSglcustodiante := Value;
end;

end.



