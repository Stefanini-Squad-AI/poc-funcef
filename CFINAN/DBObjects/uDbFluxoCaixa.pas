{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 12/08/2003                             }
{                                                       }
{*******************************************************}

unit uDbFluxoCaixa;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbFluxoCaixa = class(TCmDbObject)

  private
    FDescricao: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdfluxocaixa: TCmDbField;
  public
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idfluxocaixa: TCmDbField read FIdfluxocaixa write FIdfluxocaixa;
     Property Descricao: TCmDbField read FDescricao write FDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbFluxoCaixa }

constructor TDbFluxoCaixa.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'FLUXOCAIXA';

    fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
    fIdfluxocaixa := CreateCmDbField('IDFLUXOCAIXA',ftfloat,True,True,False,True,'');
    fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbFluxoCaixa.Insert: Boolean;
begin
   fIdfluxocaixa.AsFloat := GetSequence('FLUXOCAIXA');
   Result := Inherited Insert;
end;

end.



