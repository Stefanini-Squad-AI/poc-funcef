{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio C. Frioli               }
{ Criado Em: 26/12/2003                                 }
{                                                       }
{*******************************************************}

unit uDbAdvogado;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbAdvogado = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FFatorHonorAdvog: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property FatorHonorAdvog: TCmDbField read FFatorHonorAdvog write FFatorHonorAdvog;
  end;

implementation

{ TDbAdvogado }

constructor TDbAdvogado.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ADVOGADO';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FFatorHonorAdvog := CreateCmDbField('FATORHONORADVOG',ftFloat,false,false,false,false,'');
end;

end.
