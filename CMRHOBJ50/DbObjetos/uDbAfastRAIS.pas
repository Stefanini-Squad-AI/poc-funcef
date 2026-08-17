{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbAfastRAIS;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbAfastRAIS = class(TCmDbObject)
  private
    FIdAfastRAIS: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdAfastRAIS: TCmDbField read FIdAfastRAIS write FIdAfastRAIS;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbAfastRAIS }

constructor TDbAfastRAIS.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'AfastRAIS';

  FIdAfastRAIS := CreateCmDbField('IdAfastRAIS',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,false,'');
end;

end.
