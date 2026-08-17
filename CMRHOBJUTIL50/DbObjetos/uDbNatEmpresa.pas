{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbNatEmpresa;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbNatEmpresa = class(TCmDbObject)
  private
    FIdNatEmpre: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdNatEmpre: TCmDbField read FIdNatEmpre write FIdNatEmpre;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbNatEmpresa }

constructor TDbNatEmpresa.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'NATEMPRESA';

  FIdNatEmpre := CreateCmDbField('IDNATEMPRE',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
end;

end.
