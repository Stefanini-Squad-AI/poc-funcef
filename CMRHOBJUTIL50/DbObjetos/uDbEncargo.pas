{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 07/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbEncargo;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbEncargo = class(TCmDbObject)
  private
    FIdEncargo: TCmDbField;
    FDescrEncargo: TCmDbField;
    FPercEncargo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdEncargo: TCmDbField read FIdEncargo write FIdEncargo;
    property DescrEncargo: TCmDbField read FDescrEncargo write FDescrEncargo;
    property PercEncargo: TCmDbField read FPercEncargo write FPercEncargo;
  end;

implementation

{ TDbEncargo }

constructor TDbEncargo.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ENCARGO';

  FIdEncargo := CreateCmDbField('IDENCARGO',ftFloat,true,true,false,false,'');
  FDescrEncargo := CreateCmDbField('DESCRENCARGO',ftString,true,false,false,false,'');
  FPercEncargo := CreateCmDbField('PERCENCARGO',ftFloat,false,false,false,false,'');  
end;

end.
