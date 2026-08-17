{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/03/2002                                 }
{                                                       }
{*******************************************************}

unit uDbConvPrevid;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbConvPrevid = class(TCmDbObject)
  private
    FDescricao: TCmDbField;
    FPercConvPrevid: TCmDbField;
    FIdFPAS: TCmDbField;
    FIdConvPrevid: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdFPAS: TCmDbField read FIdFPAS write FIdFPAS;
    property IdConvPrevid: TCmDbField read FIdConvPrevid write FIdConvPrevid;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property PercConvPrevid: TCmDbField read FPercConvPrevid write FPercConvPrevid;
  end;

implementation

{ TDbConvPrevid }

constructor TDbConvPrevid.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CONVPREVID';

  FIdFPAS := CreateCmDbField('IDFPAS',ftFloat,true,true,false,false,'');
  FIdConvPrevid := CreateCmDbField('IDCONVPREVID',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
  FPercConvPrevid := CreateCmDbField('PERCCONVPREVID',ftFloat,true,false,false,false,'');
end;

end.
