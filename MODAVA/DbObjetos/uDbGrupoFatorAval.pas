{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 24/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrupoFatorAval;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbGrupoFatorAval = class(TCmDbObject)
  private
    FIdGrupoFatorAval: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdGrupoFatorAval: TCmDbField read FIdGrupoFatorAval write FIdGrupoFatorAval;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbGrupoFatorAval }

constructor TDbGrupoFatorAval.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'GrupoFatorAval';

  FIdGrupoFatorAval := CreateCmDbField('IdGrupoFatorAval',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,false,'');
end;

end.
