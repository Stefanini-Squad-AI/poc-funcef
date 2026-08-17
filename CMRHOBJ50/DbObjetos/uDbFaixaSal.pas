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
*******************************************************
RESPONSÁVEL.: Marcio Sanches Spinosa
Nº SOL......: 149111
Nº KINTANA..: 1066131
Data........: 12/12/2012
Descrição...: Inclusão do campo CODFAIXAPCDS
*******************************************************
RESPONSÁVEL.: Douglas Siqueira
Nº SOL......: 171426
Nº KINTANA..: 1537613
Data........: 06/01/2012
Descrição...: Alteração do limite de faixas de 9 para 20.
*******************************************************
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
    //Douglas.Siqueira SOL 171426 Kintana 1537613
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
    //Douglas.Siqueira SOL 171426 Kintana 1537613 - FIM

    //Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Inicio
    FCodFaixaPCS: TCmDbField;
    //Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Fim

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

    //Douglas.Siqueira SOL 171426 Kintana 1537613
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
    //Douglas.Siqueira SOL 171426 Kintana 1537613

    //Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Inicio
    property CodFaixaPCS: TCmDbField read FCodFaixaPCS write FCodFaixaPCS;
    //Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Fim
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

  //Douglas.Siqueira SOL 171426 Kintana 1537613
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
  //Douglas.Siqueira SOL 171426 Kintana 1537613

  //Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Inicio
  FCodFaixaPCS := CreateCmDbField('CodFaixaPCS',ftString,false,false,false,false,'');
  //Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Fim
end;

end.
