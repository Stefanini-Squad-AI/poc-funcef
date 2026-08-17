{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 12/10/2006                             }
{                                                       }
{*******************************************************}

unit uDbRadEtapaDest;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadEtapaDest = class(TCmDbObject)

  private
    FIdradetapa: TCmDbField;
    FIdpessoa: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdradetapa(const Value: TCmDbField);

  public

     Property Idradetapa: TCmDbField read FIdradetapa write SetIdradetapa;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbRadEtapaDest }

constructor TDbRadEtapaDest.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADETAPADEST';

   fIdradetapa := CreateCmDbField('IDRADETAPA',ftfloat,True,True,False,True,'Id. Etapa');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Id. Pessoa');
end;

procedure TDbRadEtapaDest.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRadEtapaDest.SetIdradetapa(const Value: TCmDbField);
begin
  FIdradetapa := Value;
end;

end.



