{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 06/02/2002                                 }
{                                                       }
{*******************************************************}

{
Nº SOL......: 171426/7601
Nº KINTANA..: 1544392
Data........: 06/01/2012
Responsável........: Douglas.Siqueira
Descrição...: - Alteração do limite de faixas de 9 para 20.
}


unit uDbFaixaSal;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

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
//Douglas.Siqueira SOL 171426/7601 Kintana 1544392

    FStep10: TCmDbField;
    FStep11: TCmDbField;
    FStep12: TCmDbField;
    FStep13: TCmDbField;
    FStep14: TCmDbField;
    FStep15: TCmDbField;
    FStep16: TCmDbField;
    FStep17: TCmDbField;
    FStep18: TCmDbField;
    FStep19: TCmDbField;
    FStep20: TCmDbField;

//Douglas.Siqueira SOL 171426/7601 Kintana 1544392


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

//Douglas.Siqueira SOL 171426/7601 Kintana 1544392

    property Step10: TCmDbField read FStep10 write FStep10;
    property Step11: TCmDbField read FStep11 write FStep11;
    property Step12: TCmDbField read FStep12 write FStep12;
    property Step13: TCmDbField read FStep13 write FStep13;
    property Step14: TCmDbField read FStep14 write FStep14;
    property Step15: TCmDbField read FStep15 write FStep15;
    property Step16: TCmDbField read FStep16 write FStep16;
    property Step17: TCmDbField read FStep17 write FStep17;
    property Step18: TCmDbField read FStep18 write FStep18;
    property Step19: TCmDbField read FStep19 write FStep19;
    property Step20: TCmDbField read FStep20 write FStep20;


//Douglas.Siqueira SOL 171426/7601 Kintana 1544392

  end;

implementation

{ TDbFaixaSal }

constructor TDbFaixaSal.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'FaixaSal';

  FIdFaixaSalarial := CreateCmDbField('IdFaixaSalarial',ftFloat,true,true,false,false,'');
  FDataEfetiv := CreateCmDbField('DataEfetiv',ftDateTime,true,false,false,true,'');
  FStep1 := CreateCmDbField('Step1',ftFloat,false,false,false,false,'');
  FStep2 := CreateCmDbField('Step2',ftFloat,false,false,false,false,'');
  FStep3 := CreateCmDbField('Step3',ftFloat,false,false,false,false,'');
  FStep4 := CreateCmDbField('Step4',ftFloat,false,false,false,false,'');
  FStep5 := CreateCmDbField('Step5',ftFloat,false,false,false,false,'');
  FStep6 := CreateCmDbField('Step6',ftFloat,false,false,false,false,'');
  FStep7 := CreateCmDbField('Step7',ftFloat,false,false,false,false,'');
  FStep8 := CreateCmDbField('Step8',ftFloat,false,false,false,false,'');
  FStep9 := CreateCmDbField('Step9',ftFloat,false,false,false,false,'');
//Douglas.Siqueira SOL 171426/7601 Kintana 1544392

  FStep10 := CreateCmDbField('Step10',ftFloat,false,false,false,false,'');
  FStep11 := CreateCmDbField('Step11',ftFloat,false,false,false,false,'');
  FStep12 := CreateCmDbField('Step12',ftFloat,false,false,false,false,'');
  FStep13 := CreateCmDbField('Step13',ftFloat,false,false,false,false,'');
  FStep14 := CreateCmDbField('Step14',ftFloat,false,false,false,false,'');
  FStep15 := CreateCmDbField('Step15',ftFloat,false,false,false,false,'');
  FStep16 := CreateCmDbField('Step16',ftFloat,false,false,false,false,'');
  FStep17 := CreateCmDbField('Step17',ftFloat,false,false,false,false,'');
  FStep18 := CreateCmDbField('Step18',ftFloat,false,false,false,false,'');
  FStep19 := CreateCmDbField('Step19',ftFloat,false,false,false,false,'');
  FStep20 := CreateCmDbField('Step20',ftFloat,false,false,false,false,'');

//Douglas.Siqueira SOL 171426/7601 Kintana 1544392

end;

end.
