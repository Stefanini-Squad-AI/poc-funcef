{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 06/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTipoBenSal;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbTipoBenSal = class(TCmDbObject)
  private
    FIdBenefSalar: TCmDbField;
    FDescrBenefSalar: TCmDbField;    
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdBenefSalar: TCmDbField read FIdBenefSalar write FIdBenefSalar;
    property DescrBenefSalar: TCmDbField read FDescrBenefSalar write FDescrBenefSalar;
  end;

implementation

{ TDbTipoBenSal }

constructor TDbTipoBenSal.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TIPOBENSAL';

  FIdBenefSalar := CreateCmDbField('IDBENEFSALAR',ftFloat,true,true,false,false,'');
  FDescrBenefSalar := CreateCmDbField('DESCRBENEFSALAR',ftString,true,false,false,false,'');
end;

end.
