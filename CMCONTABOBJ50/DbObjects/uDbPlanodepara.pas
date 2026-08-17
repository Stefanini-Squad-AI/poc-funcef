{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/08/2002                             }
{                                                       }
{*******************************************************}

unit uDbPlanodepara;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPlanodepara = class(TCmDbObject)

  private
    FIdempresa1: TCmDbField;
    FConta2: TCmDbField;
    FCentrocusto2: TCmDbField;
    FPlano1: TCmDbField;
    FIdplanodepara: TCmDbField;
    FCentrocusto1: TCmDbField;
    FConta1: TCmDbField;
    FIdempresa2: TCmDbField;
    FPlano2: TCmDbField;
    procedure SetCentrocusto1(const Value: TCmDbField);
    procedure SetCentrocusto2(const Value: TCmDbField);
    procedure SetConta1(const Value: TCmDbField);
    procedure SetConta2(const Value: TCmDbField);
    procedure SetIdempresa1(const Value: TCmDbField);
    procedure SetIdempresa2(const Value: TCmDbField);
    procedure SetIdplanodepara(const Value: TCmDbField);
    procedure SetPlano1(const Value: TCmDbField);
    procedure SetPlano2(const Value: TCmDbField);

  public

     Property Plano2: TCmDbField read FPlano2 write SetPlano2;
     Property Plano1: TCmDbField read FPlano1 write SetPlano1;
     Property Idplanodepara: TCmDbField read FIdplanodepara write SetIdplanodepara;
     Property Idempresa2: TCmDbField read FIdempresa2 write SetIdempresa2;
     Property Idempresa1: TCmDbField read FIdempresa1 write SetIdempresa1;
     Property Conta2: TCmDbField read FConta2 write SetConta2;
     Property Conta1: TCmDbField read FConta1 write SetConta1;
     Property Centrocusto2: TCmDbField read FCentrocusto2 write SetCentrocusto2;
     Property Centrocusto1: TCmDbField read FCentrocusto1 write SetCentrocusto1;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPlanodepara }

constructor TDbPlanodepara.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANODEPARA';

   fPlano2 := CreateCmDbField('PLANO2',ftfloat,True,False,False,True,'');
   fPlano1 := CreateCmDbField('PLANO1',ftfloat,True,False,False,True,'');
   fIdplanodepara := CreateCmDbField('IDPLANODEPARA',ftfloat,True,True,False,True,'');
   fIdempresa2 := CreateCmDbField('IDEMPRESA2',ftfloat,False,False,False,True,'');
   fIdempresa1 := CreateCmDbField('IDEMPRESA1',ftfloat,False,False,False,True,'');
   fConta2 := CreateCmDbField('CONTA2',ftString,True,False,False,True,'');
   fConta1 := CreateCmDbField('CONTA1',ftString,True,False,False,True,'');
   fCentrocusto2 := CreateCmDbField('CENTROCUSTO2',ftString,False,False,False,True,'');
   fCentrocusto1 := CreateCmDbField('CENTROCUSTO1',ftString,False,False,False,True,'');
end;

function TDbPlanodepara.Insert: Boolean;
begin

   fIdplanodepara.AsFloat := GetSequence('PLANODEPARA');
   Result := Inherited Insert;

end;


procedure TDbPlanodepara.SetCentrocusto1(const Value: TCmDbField);
begin
  FCentrocusto1 := Value;
end;

procedure TDbPlanodepara.SetCentrocusto2(const Value: TCmDbField);
begin
  FCentrocusto2 := Value;
end;

procedure TDbPlanodepara.SetConta1(const Value: TCmDbField);
begin
  FConta1 := Value;
end;

procedure TDbPlanodepara.SetConta2(const Value: TCmDbField);
begin
  FConta2 := Value;
end;

procedure TDbPlanodepara.SetIdempresa1(const Value: TCmDbField);
begin
  FIdempresa1 := Value;
end;

procedure TDbPlanodepara.SetIdempresa2(const Value: TCmDbField);
begin
  FIdempresa2 := Value;
end;

procedure TDbPlanodepara.SetIdplanodepara(const Value: TCmDbField);
begin
  FIdplanodepara := Value;
end;

procedure TDbPlanodepara.SetPlano1(const Value: TCmDbField);
begin
  FPlano1 := Value;
end;

procedure TDbPlanodepara.SetPlano2(const Value: TCmDbField);
begin
  FPlano2 := Value;
end;

end.



