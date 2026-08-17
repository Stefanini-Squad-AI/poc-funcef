{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Atualizado Em: 28/08/2007                             }
{ Pendencia 25678                                                      }
{*******************************************************}

unit uDbParamCalcMKT;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamCalcMKT = class(TCmDbObject)

  private
    FIdformacalcmkt: TCmDbField;
    FIdparamcalcmkt: TCmDbField;
    FIdclassetit: TCmDbField;
    procedure SetIdclassetit(const Value: TCmDbField);
    procedure SetIdformacalcmkt(const Value: TCmDbField);
    procedure SetIdparamcalcmkt(const Value: TCmDbField);

  public

     Property Idparamcalcmkt: TCmDbField read FIdparamcalcmkt write SetIdparamcalcmkt;
     Property Idformacalcmkt: TCmDbField read FIdformacalcmkt write SetIdformacalcmkt;
     Property Idclassetit: TCmDbField read FIdclassetit write SetIdclassetit;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamCalcMKT }

constructor TDbParamCalcMKT.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMCALCMKT';

   fIdparamcalcmkt := CreateCmDbField('IDPARAMCALCMKT',ftfloat,True,True,False,True,'');
   fIdformacalcmkt := CreateCmDbField('IDFORMACALCMKT',ftfloat,True,False,False,True,'');
   fIdclassetit := CreateCmDbField('IDCLASSETIT',ftfloat,True,False,False,True,'');
end;

function TDbParamCalcMKT.Insert: Boolean;
begin

   fIdparamcalcmkt.AsFloat := GetSequence('PARAMCALCMKT');
   Result := Inherited Insert;

end;


procedure TDbParamCalcMKT.SetIdclassetit(const Value: TCmDbField);
begin
  FIdclassetit := Value;
end;

procedure TDbParamCalcMKT.SetIdformacalcmkt(const Value: TCmDbField);
begin
  FIdformacalcmkt := Value;
end;

procedure TDbParamCalcMKT.SetIdparamcalcmkt(const Value: TCmDbField);
begin
  FIdparamcalcmkt := Value;
end;

end.



