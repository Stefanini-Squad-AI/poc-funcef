{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/03/2002                                 }
{                                                       }
{*******************************************************}

unit uDbContribDARF;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbContribDARF = class(TCmDbObject)
  private
    FIdContribDARF: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdContribDARF: TCmDbField read FIdContribDARF write FIdContribDARF;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbContribDARF }

constructor TDbContribDARF.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ContribDARF';

  FIdContribDARF := CreateCmDbField('IdContribDARF',ftFloat,true,true,false,true,'');
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,true,'');
end;

end.
