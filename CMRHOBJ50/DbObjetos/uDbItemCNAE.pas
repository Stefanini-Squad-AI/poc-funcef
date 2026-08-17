{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/03/2002                                 }
{                                                       }
{*******************************************************}
{-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
Nº SOL............: 229878.16779
Nº PPM............: 610132
Data da Alteração.: 25/02/2015
Responsável.......: William Santana
Descrição.........: Desenvolvimento do produto referente ao SOL 229878.
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------}


unit uDbItemCNAE;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbItemCNAE = class(TCmDbObject)
  private
    FIdItemCNAE: TCmDbField;
    FIdCatCNAE: TCmDbField;
    FDescricao: TCmDbField;
    FAliquota: TCmDbField; //William Santana - SOL 229878.16779 PPM 610132
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdItemCNAE: TCmDbField read FIdItemCNAE write FIdItemCNAE;
    property IdCatCNAE: TCmDbField read FIdCatCNAE write FIdCatCNAE;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property Aliquota: TCmDbField read FAliquota write FAliquota; //William Santana - SOL 229878.16779 PPM 610132
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
  FIdCatCNAE := CreateCmDbField('ALIQUOTA',ftFloat,false,false,false,true,'');  //William Santana - SOL 229878.16779 PPM 610132
end;

end.
