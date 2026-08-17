unit uDbIrrfRegressiva;

interface

uses
   uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
   TDbIrrfRegressiva = class(TCmDbObject)

   private
     FIdirrf: TCmDbField;
     FPrazoacum: TCmDbField;
     FAliquota: TCmDbField;
     FTrguserinclusao: TCmDbField;
     FTrgdtinclusao: TCmDbField;
     FDatavigencia: TCmDbField;

     procedure SetAliquota(const Value: TCmDbField);
     procedure SetDatavigencia(const Value: TCmDbField);
     procedure SetIdirrf(const Value: TCmDbField);
     procedure SetPrazoacum(const Value: TCmDbField);
     procedure SetTrgdtinclusao(const Value: TCmDbField);
     procedure SetTrguserinclusao(const Value: TCmDbField);

   public

      property Trguserinclusao   : TCmDbField   read FTrguserinclusao   write SetTrguserinclusao;
      property Trgdtinclusao     : TCmDbField   read FTrgdtinclusao     write SetTrgdtinclusao;
      property Prazoacum         : TCmDbField   read FPrazoacum         write SetPrazoacum;
      property Idirrf            : TCmDbField   read FIdirrf            write SetIdirrf;
      property Datavigencia      : TCmDbField   read FDatavigencia      write SetDatavigencia;
      property Aliquota          : TCmDbField   read FAliquota          write SetAliquota;

      constructor Create(Aowner: TCmCustomCdbObject); override;

      function Insert: Boolean; override;

   end;



implementation
{ TDbIrrfRegressiva }



constructor TDbIrrfRegressiva.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;

   ErrorIfNoRowsAffected := False;

   TableName := 'IRRFREGRESSIVA';

   fIdirrf           := CreateCmDbField('IDIRRF',        ftfloat,    True,    True,    False,   True, 'Identificador da Tabela');
   fPrazoacum        := CreateCmDbField('PRAZOACUM',     ftfloat,    False,   False,   False,   True, 'Prazo de Acumulação');
   fDatavigencia     := CreateCmDbField('DATAVIGENCIA',  ftDateTime, False,   False,   False,   True, 'Data de Vigência');
   fAliquota         := CreateCmDbField('ALIQUOTA',      ftfloat,    False,   False,   False,   True, 'Alíquota');
end;



function TDbIrrfRegressiva.Insert: Boolean;
begin
   fIdirrf.AsFloat := GetSequence('IRRFREGRESSIVA');

   Result := Inherited Insert;
end;



procedure TDbIrrfRegressiva.SetAliquota(const Value: TCmDbField);
begin
  FAliquota := Value;
end;

procedure TDbIrrfRegressiva.SetDatavigencia(const Value: TCmDbField);
begin
  FDatavigencia := Value;
end;

procedure TDbIrrfRegressiva.SetIdirrf(const Value: TCmDbField);
begin
  FIdirrf := Value;
end;

procedure TDbIrrfRegressiva.SetPrazoacum(const Value: TCmDbField);
begin
  FPrazoacum := Value;
end;

procedure TDbIrrfRegressiva.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbIrrfRegressiva.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;



end.
