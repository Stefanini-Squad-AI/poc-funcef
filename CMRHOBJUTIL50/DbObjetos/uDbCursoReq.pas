{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 03/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbCursoReq;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbCursoReq = class(TCmDbObject)
  private
    FFlgImprescind: TCmDbField;
    FIdCargo: TCmDbField;
    FIdCurso: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property IdCurso: TCmDbField read FIdCurso write FIdCurso;
    property FlgImprescind: TCmDbField read FFlgImprescind write FFlgImprescind;
  end;

implementation

{ TDbCursoReq }

constructor TDbCursoReq.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CURSOREQ';

  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,true,true,false,false,'');
  FIdCurso := CreateCmDbField('IDCURSO',ftFloat,true,true,false,false,'');
  FFlgImprescind := CreateCmDbField('FLGIMPRESCIND',ftFloat,true,false,false,false,'');
end;

end.
