{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbVaraJustica;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbVaraJustica = class(TCmDbObject)
  private
    FIdVaraJustica: TCmDbField;
    FDescricao: TCmDbField;
    FIdEstado: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdVaraJustica: TCmDbField read FIdVaraJustica write FIdVaraJustica;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property IdEstado: TCmDbField read FIdEstado write FIdEstado;
  end;

implementation

{ TDbVaraJustica }

constructor TDbVaraJustica.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'VARAJUSTICA';

  FIdVaraJustica := CreateCmDbField('IDVARAJUSTICA',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
  FIdEstado := CreateCmDbField('IDESTADO',ftFloat,false,false,false,true,'');
end;

end.
