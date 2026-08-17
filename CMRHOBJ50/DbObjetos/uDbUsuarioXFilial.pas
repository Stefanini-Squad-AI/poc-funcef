{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbUsuarioXFilial;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbUsuarioXFilial = class(TCmDbObject)
  private
    FIdFilialPessoa: TCmDbField;
    FIdUsuario: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdUsuario: TCmDbField read FIdUsuario write FIdUsuario;
    property IdFilialPessoa: TCmDbField read FIdFilialPessoa write FIdFilialPessoa;
  end;

implementation

{ TDbUsuarioXFilial }

constructor TDbUsuarioXFilial.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'USUARIOXFILIAL';

  FIdUsuario := CreateCmDbField('IDUSUARIO',ftFloat,true,true,false,false,'');
  FIdFilialPessoa := CreateCmDbField('IDFILIALPESSOA',ftFloat,true,true,false,false,'');
end;

end.
