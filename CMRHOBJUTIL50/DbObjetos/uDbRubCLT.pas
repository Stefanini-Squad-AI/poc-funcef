{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uDbRubCLT;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbRubCLT = class(TCmDbObject)
  private
    FCodRubCLT: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodRubCLT: TCmDbField read FCodRubCLT write FCodRubCLT;    
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbRubCLT }

constructor TDbRubCLT.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'RUBRICACLT';

  FCodRubCLT := CreateCmDbField('CODRUBCLT',ftString,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
end;

end.
