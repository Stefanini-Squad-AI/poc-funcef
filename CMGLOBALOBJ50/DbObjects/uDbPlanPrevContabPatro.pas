{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marchetti                       }
{ Atualizado Em: 31/03/2004                             }
{                                                       }
{*******************************************************}

unit uDbPlanPrevContabPatro;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPlanPrevContabPatro = class(TCmDbObject)

  private
     FIdplanprevctbpatr : TCmDbField;
     FIdplanoprev       : TCmDbField;
     FIdpatro           : TCmDbField;

     procedure SetIdplanprevctbpatr(const Value: TCmDbField);
     procedure SetIdplanoprev(const Value: TCmDbField);
     procedure SetIdpatro(const Value: TCmDbField);

  public

     Property Idplanprevctbpatr : TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Idplanoprev       : TCmDbField read FIdplanoprev       write setIdplanoprev;
     Property Idpatro           : TCmDbField read FIdpatro           write setIdpatro;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     function LoadFromDb: Boolean; override;

  End;

implementation

{ TDbPlanPrevContabPatro }



constructor TDbPlanPrevContabPatro.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANPREVCONTABPATRO';

   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,True,True,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
end;



function TDbPlanPrevContabPatro.Insert: Boolean;
begin

   fIdplanprevctbpatr.AsFloat := GetSequence('PLANPREVCONTABPATRO');
   Result := Inherited Insert;

end;



function TDbPlanPrevContabPatro.LoadFromDb: Boolean;
begin
   Result := inherited LoadFromDB;

end;



procedure TDbPlanPrevContabPatro.setIdpatro(const Value: TCmDbField);
begin
   FIdpatro := Value;
end;



procedure TDbPlanPrevContabPatro.SetIdplanoprev(const Value: TCmDbField);
begin
   FIdplanoprev := Value;
end;



procedure TDbPlanPrevContabPatro.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
   FIdplanprevctbpatr := Value;
end;



end.



