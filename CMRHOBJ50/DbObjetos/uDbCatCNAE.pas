{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/03/2002                                 }
{                                                       }
{*******************************************************}

unit uDbCatCNAE;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbCatCNAE = class(TCmDbObject)
  private
    FIdCatCNAE: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdCatCNAE: TCmDbField read FIdCatCNAE write FIdCatCNAE;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbCatCNAE }

constructor TDbCatCNAE.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CatCNAE';

  FIdCatCNAE := CreateCmDbField('IdCatCNAE',ftFloat,true,true,false,true,'');
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,true,'');
end;

end.
