{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/03/2002                                 }
{                                                       }
{*******************************************************}

unit uDbItemDARF;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbItemDARF = class(TCmDbObject)
  private
    FIdContribDARF: TCmDbField;
    FIdItemDARF: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdItemDARF: TCmDbField read FIdItemDARF write FIdItemDARF;
    property IdContribDARF: TCmDbField read FIdContribDARF write FIdContribDARF;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbItemDARF }

constructor TDbItemDARF.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ITEMDARF';

  FIdItemDARF := CreateCmDbField('IDITEMDARF',ftFloat,true,true,false,true,'');
  FIdContribDARF := CreateCmDbField('IDCONTRIBDARF',ftFloat,true,true,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,true,'');
end;

end.
