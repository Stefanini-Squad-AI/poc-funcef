unit uDbAusenciaAtende;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbAusenciaAtende = class(TCmDbObject)

  private
    FDatahorafim: TCmDbField;
    FIdausenciaatende: TCmDbField;
    FIdatendeagenda: TCmDbField;
    FDatahorainicio: TCmDbField;
    FMotivo: TCmDbField;
    procedure SetDatahorafim(const Value: TCmDbField);
    procedure SetDatahorainicio(const Value: TCmDbField);
    procedure SetIdatendeagenda(const Value: TCmDbField);
    procedure SetIdausenciaatende(const Value: TCmDbField);
    procedure SetMotivo(const Value: TCmDbField);

  public

     Property Idausenciaatende: TCmDbField read FIdausenciaatende write SetIdausenciaatende;
     Property Idatendeagenda: TCmDbField read FIdatendeagenda write SetIdatendeagenda;
     Property Datahorainicio: TCmDbField read FDatahorainicio write SetDatahorainicio;
     Property Datahorafim: TCmDbField read FDatahorafim write SetDatahorafim;
     Property Motivo: TCmDbField read FMotivo write SetMotivo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAusenciaAtende }

constructor TDbAusenciaAtende.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'AUSENCIAATENDE';

   fIdausenciaatende := CreateCmDbField('IDAUSENCIAATENDE',ftfloat,True,True,False,True,'Id. Ausência');
   fIdatendeagenda := CreateCmDbField('IDATENDEAGENDA',ftfloat,True,False,False,True,'Id. Atendente');
   fDatahorainicio := CreateCmDbField('DATAHORAINICIO',ftDateTime,True,False,False,True,'Data Inicial',-1,True);
   fDatahorafim := CreateCmDbField('DATAHORAFIM',ftDateTime,True,False,False,True,'Data Final',-1,True);
   fMotivo := CreateCmDbField('MOTIVO',ftString,False,False,False,True,'Motivo');
end;

function TDbAusenciaAtende.Insert: Boolean;
begin

   fIdausenciaatende.AsFloat := GetSequence('AUSENCIAATENDE');
   Result := Inherited Insert;

end;


procedure TDbAusenciaAtende.SetDatahorafim(const Value: TCmDbField);
begin
  FDatahorafim := Value;
end;

procedure TDbAusenciaAtende.SetDatahorainicio(const Value: TCmDbField);
begin
  FDatahorainicio := Value;
end;

procedure TDbAusenciaAtende.SetIdatendeagenda(const Value: TCmDbField);
begin
  FIdatendeagenda := Value;
end;

procedure TDbAusenciaAtende.SetIdausenciaatende(const Value: TCmDbField);
begin
  FIdausenciaatende := Value;
end;

procedure TDbAusenciaAtende.SetMotivo(const Value: TCmDbField);
begin
  FMotivo := Value;
end;

end.



