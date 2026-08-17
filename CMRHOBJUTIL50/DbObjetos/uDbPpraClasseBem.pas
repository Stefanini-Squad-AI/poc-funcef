{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbPpraClasseBem;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbPpraClasseBem = class(TCmDbObject)
  private
    FIdclassebem: TCmDbField;
    FIndequiprot: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;
    
    property IndEquiprot: TCmDbField read FIndequiprot write FIndequiprot;
    property IdClasseBem: TCmDbField read FIdclassebem write FIdclassebem;
  end;

implementation

{ TDbPpraClasseBem }

constructor TDbPpraClasseBem.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PPRACLASSEBEM';

  FIndequiprot := CreateCmDbField('INDEQUIPROT',ftString,false,false,false,True,'');
  FIdclassebem := CreateCmDbField('IDCLASSEBEM',ftFloat,True,True,false,true,'');
end;

end.
