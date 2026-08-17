{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/03/2002                                 }
{                                                       }
{*******************************************************}

unit uDbItemCNAE;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbItemCNAE = class(TCmDbObject)
  private
    FIdItemCNAE: TCmDbField;
    FIdCatCNAE: TCmDbField;
    FDescricao: TCmDbField;    
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdItemCNAE: TCmDbField read FIdItemCNAE write FIdItemCNAE;
    property IdCatCNAE: TCmDbField read FIdCatCNAE write FIdCatCNAE;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbItemCNAE }

constructor TDbItemCNAE.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ITEMCNAE';

  FIdItemCNAE := CreateCmDbField('IDITEMCNAE',ftFloat,true,true,false,true,'');
  FIdCatCNAE := CreateCmDbField('IDCATCNAE',ftFloat,true,true,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,true,'');
end;

end.
