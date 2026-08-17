{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio                         }
{ Criado Em: 10/07/2003                                 }
{                                                       }
{*******************************************************}

unit uDbCursoxFatorAval;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbCursoxFatorAval = class(TCmDbObject)
  private
    FIdFatorAval: TCmDbField;
    FIdCurso: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdFatorAval: TCmDbField read FIdFatorAval write FIdFatorAval;
    property IdCurso: TCmDbField read FIdCurso write FIdCurso;
  end;

implementation

{ TDbCursoxFatorAval }

constructor TDbCursoxFatorAval.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CURSOXFATORAVAL';

  FIdFatorAval := CreateCmDbField('IDFATORAVAL',ftFloat,true,true,false,false,'');
  FIdCurso := CreateCmDbField('IDCURSO',ftFloat,true,true,false,false,'');
end;

end.
