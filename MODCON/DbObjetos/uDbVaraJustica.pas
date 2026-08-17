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

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbVaraJustica = class(TCmDbObject)
  private
    FIdVaraJustica: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdVaraJustica: TCmDbField read FIdVaraJustica write FIdVaraJustica;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbVaraJustica }

constructor TDbVaraJustica.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'VaraJustica';

  FIdVaraJustica := CreateCmDbField('IdVaraJustica',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,false,'');
end;

end.
