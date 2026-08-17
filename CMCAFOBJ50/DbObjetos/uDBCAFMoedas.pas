{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 18/08/2004                             }
{                                                       }
{*******************************************************}

unit uDBCAFMoedas;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBCAFMoedas = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FIdtipomoeda: TCmDbField;
    FMoecodigo: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtipomoeda(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);

  public

     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idtipomoeda: TCmDbField read FIdtipomoeda write SetIdtipomoeda;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBCAFMoedas }

constructor TDBCAFMoedas.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CAFMOEDAS';

   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdtipomoeda := CreateCmDbField('IDTIPOMOEDA',ftfloat,True,False,False,False,'');
end;

function TDBCAFMoedas.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDBCAFMoedas.SetIdpessoa(const Value: TCmDbField);
begin
   FIdpessoa := Value;
end;

procedure TDBCAFMoedas.SetIdtipomoeda(const Value: TCmDbField);
begin
   FIdtipomoeda := Value;
end;

procedure TDBCAFMoedas.SetMoecodigo(const Value: TCmDbField);
begin
   FMoecodigo := Value;
end;

end.



