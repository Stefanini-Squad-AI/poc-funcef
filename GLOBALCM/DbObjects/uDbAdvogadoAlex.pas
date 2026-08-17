{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 15/01/2008                             }
{                                                       }
{*******************************************************}

unit uDbAdvogadoAlex;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbAdvogadoAlex = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FFatorhonoradvog: TCmDbField;
    procedure SetFatorhonoradvog(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);

  public

     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Fatorhonoradvog: TCmDbField read FFatorhonoradvog write SetFatorhonoradvog;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAdvogadoAlex }

constructor TDbAdvogadoAlex.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ADVOGADO';

   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fFatorhonoradvog := CreateCmDbField('FATORHONORADVOG',ftfloat,False,False,False,True,'');
end;

function TDbAdvogadoAlex.Insert: Boolean;
begin

//   fIdpessoa.AsFloat := GetSequence('ADVOGADO');
   Result := Inherited Insert;

end;


procedure TDbAdvogadoAlex.SetFatorhonoradvog(const Value: TCmDbField);
begin
  FFatorhonoradvog := Value;
end;

procedure TDbAdvogadoAlex.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

end.



