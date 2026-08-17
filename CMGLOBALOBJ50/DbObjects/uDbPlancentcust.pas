{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/10/2003                             }
{                                                       }
{*******************************************************}

unit uDbPlancentcust;

interface

uses
   uCmCustomCdbObject, uCmDbObject, DB, uDataBase;


type
   TDbPlancentcust = class(TCmDbObject)

   private
      FDescplancentcust: TCmDbField;
      FMascara: TCmDbField;
      FDataini: TCmDbField;
      FIdplanoanterior: TCmDbField;
      FDatafim: TCmDbField;
      FIdplancentcust: TCmDbField;
      FTrguserinclusao: TCmDbField;
      FTrgdtinclusao: TCmDbField;

      procedure SetDatafim(const Value: TCmDbField);
      procedure SetDataini(const Value: TCmDbField);
      procedure SetDescplancentcust(const Value: TCmDbField);
      procedure SetIdplancentcust(const Value: TCmDbField);
      procedure SetIdplanoanterior(const Value: TCmDbField);
      procedure SetMascara(const Value: TCmDbField);

   public

       property Mascara: TCmDbField          read FMascara           write SetMascara;
       property Idplanoanterior: TCmDbField  read FIdplanoanterior   write SetIdplanoanterior;
       property Idplancentcust: TCmDbField   read FIdplancentcust    write SetIdplancentcust;
       property Descplancentcust: TCmDbField read FDescplancentcust  write SetDescplancentcust;
       property Dataini: TCmDbField          read FDataini           write SetDataini;
       property Datafim: TCmDbField          read FDatafim           write SetDatafim;

       constructor Create(Aowner: TCmCustomCdbObject); override;

       function Insert: Boolean; override;

   end;



implementation
{ TDbPlancentcust }



constructor TDbPlancentcust.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName            := 'PLANCENTCUST';

   fMascara             := CreateCmDbField('MASCARA',          ftString,   False, False, False, True, '');
   fIdplanoanterior     := CreateCmDbField('IDPLANOANTERIOR',  ftfloat,    False, False, False, True, '');
   fIdplancentcust      := CreateCmDbField('IDPLANCENTCUST',   ftfloat,    True,  True,  False, True, '');
   fDescplancentcust    := CreateCmDbField('DESCPLANCENTCUST', ftString,   False, False, False, True, '');
   fDataini             := CreateCmDbField('DATAINI',          ftDateTime, False, False, False, True, '');
   fDatafim             := CreateCmDbField('DATAFIM',          ftDateTime, False, False, False, True, '');
end;



function TDbPlancentcust.Insert: Boolean;
begin
   fIdplancentcust.AsFloat := GetSequence('PLANCENTCUST');
   Result := Inherited Insert;
end;



procedure TDbPlancentcust.SetDatafim(const Value: TCmDbField);
begin
  FDatafim := Value;
end;

procedure TDbPlancentcust.SetDataini(const Value: TCmDbField);
begin
  FDataini := Value;
end;

procedure TDbPlancentcust.SetDescplancentcust(const Value: TCmDbField);
begin
  FDescplancentcust := Value;
end;

procedure TDbPlancentcust.SetIdplancentcust(const Value: TCmDbField);
begin
  FIdplancentcust := Value;
end;

procedure TDbPlancentcust.SetIdplanoanterior(const Value: TCmDbField);
begin
  FIdplanoanterior := Value;
end;

procedure TDbPlancentcust.SetMascara(const Value: TCmDbField);
begin
  FMascara := Value;
end;



end.



