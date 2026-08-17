{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 01/02/2001                                 }
{                                                       }
{*******************************************************}

unit uDbMovContrCAGED;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbMovContrCAGED = class(TCmDbObject)
  private
    FIdMovContrCAGED: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdMovContrCAGED: TCmDbField read FIdMovContrCAGED write FIdMovContrCAGED;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbMovContrCAGED }

constructor TDbMovContrCAGED.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'MOVCONTRCAGED';

  FIdMovContrCAGED := CreateCmDbField('IDMOVCONTRCAGED',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
end;

end.
