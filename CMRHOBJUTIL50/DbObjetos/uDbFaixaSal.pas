{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 06/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbFaixaSal;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbFaixaSal = class(TCmDbObject)
  private
    FIdFaixaSalarial: TCmDbField;
    FDataEfetiv: TCmDbField;
    FStep1: TCmDbField;
    FStep2: TCmDbField;
    FStep3: TCmDbField;
    FStep4: TCmDbField;
    FStep5: TCmDbField;
    FStep6: TCmDbField;
    FStep7: TCmDbField;
    FStep8: TCmDbField;
    FStep9: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdFaixaSalarial: TCmDbField read FIdFaixaSalarial write FIdFaixaSalarial;
    property DataEfetiv: TCmDbField read FDataEfetiv write FDataEfetiv;
    property Step1: TCmDbField read FStep1 write FStep1;
    property Step2: TCmDbField read FStep2 write FStep2;
    property Step3: TCmDbField read FStep3 write FStep3;
    property Step4: TCmDbField read FStep4 write FStep4;
    property Step5: TCmDbField read FStep5 write FStep5;
    property Step6: TCmDbField read FStep6 write FStep6;
    property Step7: TCmDbField read FStep7 write FStep7;
    property Step8: TCmDbField read FStep8 write FStep8;
    property Step9: TCmDbField read FStep9 write FStep9;
  end;

implementation

{ TDbFaixaSal }

constructor TDbFaixaSal.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'FAIXASAL';

  FIdFaixaSalarial := CreateCmDbField('IDFAIXASALARIAL',ftFloat,true,true,false,false,'');
  FDataEfetiv := CreateCmDbField('DATAEFETIV',ftDateTime,true,false,false,true,'');
  FStep1 := CreateCmDbField('STEP1',ftFloat,false,false,false,false,'');
  FStep2 := CreateCmDbField('STEP2',ftFloat,false,false,false,false,'');
  FStep3 := CreateCmDbField('STEP3',ftFloat,false,false,false,false,'');
  FStep4 := CreateCmDbField('STEP4',ftFloat,false,false,false,false,'');
  FStep5 := CreateCmDbField('STEP5',ftFloat,false,false,false,false,'');
  FStep6 := CreateCmDbField('STEP6',ftFloat,false,false,false,false,'');
  FStep7 := CreateCmDbField('STEP7',ftFloat,false,false,false,false,'');
  FStep8 := CreateCmDbField('STEP8',ftFloat,false,false,false,false,'');
  FStep9 := CreateCmDbField('STEP9',ftFloat,false,false,false,false,'');
end;

end.
