{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 03/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbAvalCargo;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbAvalCargo = class(TCmDbObject)
  private
    FAvaliacao: TCmDbField;
    FCodTipoAval: TCmDbField;
    FIdCargo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property CodTipoAval: TCmDbField read FCodTipoAval write FCodTipoAval;
    property Avaliacao: TCmDbField read FAvaliacao write FAvaliacao;
  end;

implementation

{ TDbAvalCargo }

constructor TDbAvalCargo.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'AVALCARGO';

  FIdCargo := CreateCmDbField('IdCargo',ftFloat,true,true,false,false,'');
  FCodTipoAval := CreateCmDbField('CodTipoAval',ftFloat,true,true,false,false,'');
  FAvaliacao := CreateCmDbField('Avaliacao',ftFloat,true,false,false,false,'');
end;

end.
