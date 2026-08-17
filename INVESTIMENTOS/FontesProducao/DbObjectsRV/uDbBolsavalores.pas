{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 01/11/2005                             }
{                                                       }
{*******************************************************}

unit uDbBolsavalores;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbBolsavalores = class(TCmDbObject)

  private
    FIdbolsavalores: TCmDbField;
    FSglbolsavalores: TCmDbField;
    FMoecodigo: TCmDbField;
    FIdcustodiante: TCmDbField;
    procedure SetIdbolsavalores(const Value: TCmDbField);
    procedure SetIdcustodiante(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetSglbolsavalores(const Value: TCmDbField);

  public

     Property Sglbolsavalores: TCmDbField read FSglbolsavalores write SetSglbolsavalores;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idcustodiante: TCmDbField read FIdcustodiante write SetIdcustodiante;
     Property Idbolsavalores: TCmDbField read FIdbolsavalores write SetIdbolsavalores;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbBolsavalores }

constructor TDbBolsavalores.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BOLSAVALORES';

   fSglbolsavalores := CreateCmDbField('SGLBOLSAVALORES',ftString,True,False,False,True,'');
   fMoecodigo       := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fIdcustodiante   := CreateCmDbField('IDCUSTODIANTE',ftfloat,False,False,False,True,'');
   fIdbolsavalores  := CreateCmDbField('IDBOLSAVALORES',ftfloat,True,True,False,True,'');
end;

function TDbBolsavalores.Insert: Boolean;
begin

   fIdbolsavalores.AsFloat := GetSequence('BOLSAVALORES');
   Result := Inherited Insert;

end;


procedure TDbBolsavalores.SetIdbolsavalores(const Value: TCmDbField);
begin
  FIdbolsavalores := Value;
end;

procedure TDbBolsavalores.SetIdcustodiante(const Value: TCmDbField);
begin
  FIdcustodiante := Value;
end;

procedure TDbBolsavalores.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbBolsavalores.SetSglbolsavalores(const Value: TCmDbField);
begin
  FSglbolsavalores := Value;
end;

end.



