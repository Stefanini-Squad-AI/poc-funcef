{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/10/2003                             }
{                                                       }
{*******************************************************}

unit uDbPlancentrespon;

interface

uses
   uCmCustomCdbObject, uCmDbObject, DB, uDataBase;


type
  TDbPlancentrespon = class(TCmDbObject)

   private
      FIdplanoanterior: TCmDbField;
      FMascara: TCmDbField;
      FIdplancrespon: TCmDbField;
      FDataini: TCmDbField;
      FDatafim: TCmDbField;
      FTrgdtinclusao: TCmDbField;
      FDescplancrespon: TCmDbField;
      FTrguserinclusao: TCmDbField;

      procedure SetDatafim(const Value: TCmDbField);
      procedure SetDataini(const Value: TCmDbField);
      procedure SetDescplancrespon(const Value: TCmDbField);
      procedure SetIdplancrespon(const Value: TCmDbField);
      procedure SetIdplanoanterior(const Value: TCmDbField);
      procedure SetMascara(const Value: TCmDbField);
      procedure SetTrgdtinclusao(const Value: TCmDbField);
      procedure SetTrguserinclusao(const Value: TCmDbField);


   public

      property Trguserinclusao   : TCmDbField   read FTrguserinclusao   write SetTrguserinclusao;
      property Trgdtinclusao     : TCmDbField   read FTrgdtinclusao     write SetTrgdtinclusao;
      property Mascara           : TCmDbField   read FMascara           write SetMascara;
      property Idplanoanterior   : TCmDbField   read FIdplanoanterior   write SetIdplanoanterior;
      property Idplancrespon     : TCmDbField   read FIdplancrespon     write SetIdplancrespon;
      property Descplancrespon   : TCmDbField   read FDescplancrespon   write SetDescplancrespon;
      property Dataini           : TCmDbField   read FDataini           write SetDataini;
      property Datafim           : TCmDbField   read FDatafim           write SetDatafim;

      constructor Create(Aowner: TCmCustomCdbObject); override;

      function Insert :Boolean; Override;


   end;



implementation
{ TDbPlancentrespon }



constructor TDbPlancentrespon.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName         := 'PLANCENTRESPON';

   fTrguserinclusao  := CreateCmDbField('TRGUSERINCLUSAO',  ftString,   False, False, False, True, '');
   fTrgdtinclusao    := CreateCmDbField('TRGDTINCLUSAO',    ftDateTime, False, False, False, True, '');
   fMascara          := CreateCmDbField('MASCARA',          ftString,   False, False, False, True, '');
   fIdplanoanterior  := CreateCmDbField('IDPLANOANTERIOR',  ftfloat,    False, False, False, True, '');
   fIdplancrespon    := CreateCmDbField('IDPLANCRESPON',    ftfloat,    True,  True,  False, True, '');
   fDescplancrespon  := CreateCmDbField('DESCPLANCRESPON',  ftString,   False, False, False, True, '');
   fDataini          := CreateCmDbField('DATAINI',          ftDateTime, False, False, False, True, '');
   fDatafim          := CreateCmDbField('DATAFIM',          ftDateTime, False, False, False, True, '');
end;



function TDbPlancentrespon.Insert: Boolean;
begin
   fIdplancrespon.AsFloat := GetSequence('PLANCENTRESPON');
   Result := Inherited Insert;
end;



procedure TDbPlancentrespon.SetDatafim(const Value: TCmDbField);
begin
  FDatafim := Value;
end;

procedure TDbPlancentrespon.SetDataini(const Value: TCmDbField);
begin
  FDataini := Value;
end;

procedure TDbPlancentrespon.SetDescplancrespon(const Value: TCmDbField);
begin
  FDescplancrespon := Value;
end;

procedure TDbPlancentrespon.SetIdplancrespon(const Value: TCmDbField);
begin
  FIdplancrespon := Value;
end;

procedure TDbPlancentrespon.SetIdplanoanterior(const Value: TCmDbField);
begin
  FIdplanoanterior := Value;
end;

procedure TDbPlancentrespon.SetMascara(const Value: TCmDbField);
begin
  FMascara := Value;
end;

procedure TDbPlancentrespon.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbPlancentrespon.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;



end.



