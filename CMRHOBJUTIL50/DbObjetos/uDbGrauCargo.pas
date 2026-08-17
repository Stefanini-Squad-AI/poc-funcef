{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 27/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbGrauCargo;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbGrauCargo = class(TCmDbObject)
  private
    FIdFatorAval: TCmDbField;
    FIdCargo: TCmDbField;
    FGrau: TCmDbField;    
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdFatorAval: TCmDbField read FIdFatorAval write FIdFatorAval;
    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property Grau: TCmDbField read FGrau write FGrau;
  end;

implementation

{ TDbGrauCargo }

constructor TDbGrauCargo.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'GRAUCARGO';

  FIdFatorAval := CreateCmDbField('IDFATORAVAL',ftFloat,true,true,false,true,'');
  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,true,true,false,true,'');
  FGrau := CreateCmDbField('GRAU',ftFloat,false,false,false,false,'');
end;

end.
