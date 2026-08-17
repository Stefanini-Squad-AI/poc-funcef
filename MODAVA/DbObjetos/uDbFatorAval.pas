{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbFatorAval;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbFatorAval = class(TCmDbObject)
  private
    FIdFatorAval: TCmDbField;
    FDescrFatorAval: TCmDbField;
    FIdGrupoFatorAval: TCmDbField;
    FObsFatorAval: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); Override;

    property IdFatorAval: TCmDbField read FIdFatorAval write FIdFatorAval;
    property DescrFatorAval: TCmDbField read FDescrFatorAval write FDescrFatorAval;
    property ObsFatorAval: TCmDbField read FObsFatorAval write FObsFatorAval;
    property IdGrupoFatorAval: TCmDbField read FIdGrupoFatorAval write FIdGrupoFatorAval;
  end;

implementation

{ TDbFatorAval }

constructor TDbFatorAval.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'FATORAVAL';

  FIdFatorAval := CreateCmDbField('IDFATORAVAL',ftFloat,true,true,false,false,'');
  FIdGrupoFatorAval := CreateCmDbField('IDGRUPOFATORAVAL',ftFloat,false,false,false,true,'');
  FDescrFatorAval := CreateCmDbField('DESCRFATORAVAL',ftString,true,false,false,false,'');
  FObsFatorAval := CreateCmDbField('OBSFATORAVAL',ftBlob,false,false,false,false,'');
end;

end.
