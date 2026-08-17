{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor                            }
{ Atualizado Em: 20/11/2001                             }
{                                                       }
{*******************************************************}

unit uDbRADEtapa;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbRADEtapa = class(TCmDbObject)

  private
    FDatafimprev: TCmDbField;
    FDatafimetapa: TCmDbField;
    FIdetapa: TCmDbField;
    FDatainietapa: TCmDbField;
    FIdetapaant: TCmDbField;
    FIdprocesso: TCmDbField;
    FIdtipoetapa: TCmDbField;
    procedure SetDatafimetapa(const Value: TCmDbField);
    procedure SetDatafimprev(const Value: TCmDbField);
    procedure SetDatainietapa(const Value: TCmDbField);
    procedure SetIdetapa(const Value: TCmDbField);
    procedure SetIdetapaant(const Value: TCmDbField);
    procedure SetIdprocesso(const Value: TCmDbField);
    procedure SetIdtipoetapa(const Value: TCmDbField);

  public

     Property Idtipoetapa: TCmDbField read FIdtipoetapa write SetIdtipoetapa;
     Property Idprocesso: TCmDbField read FIdprocesso write SetIdprocesso;
     Property Idetapaant: TCmDbField read FIdetapaant write SetIdetapaant;
     Property Idetapa: TCmDbField read FIdetapa write SetIdetapa;
     Property Datainietapa: TCmDbField read FDatainietapa write SetDatainietapa;
     Property Datafimprev: TCmDbField read FDatafimprev write SetDatafimprev;
     Property Datafimetapa: TCmDbField read FDatafimetapa write SetDatafimetapa;

     Constructor Create (Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbRADEtapa }

constructor TDbRADEtapa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'RADINSTETAPA';

   fIdetapa      := CreateCmDbField('IDETAPA'     ,ftfloat,False,True);
   fIdtipoetapa  := CreateCmDbField('IDTIPOETAPA' ,ftfloat,True,False);
   fIdprocesso   := CreateCmDbField('IDPROCESSO'  ,ftfloat,False,True);
   fIdetapaant   := CreateCmDbField('IDETAPAANT'  ,ftfloat,False,False);
   fDatainietapa := CreateCmDbField('DATAINIETAPA',ftDateTime,False,False);
   fDatafimprev  := CreateCmDbField('DATAFIMPREV' ,ftDateTime,False,False);
   fDatafimetapa := CreateCmDbField('DATAFIMETAPA',ftDateTime,False,False);
end;

function TDbRADEtapa.Insert: Boolean;
begin
   fIdetapa.AsFloat := GetSequence('RADINSTETAPA');
   Result := Inherited Insert;

end;

function TDbRADEtapa.LoadFromDb: Boolean;
begin
    Result := Inherited LoadFromDb;
end;

procedure TDbRADEtapa.SetDatafimetapa(const Value: TCmDbField);
begin
  FDatafimetapa := Value;
end;

procedure TDbRADEtapa.SetDatafimprev(const Value: TCmDbField);
begin
  FDatafimprev := Value;
end;

procedure TDbRADEtapa.SetDatainietapa(const Value: TCmDbField);
begin
  FDatainietapa := Value;
end;

procedure TDbRADEtapa.SetIdetapa(const Value: TCmDbField);
begin
  FIdetapa := Value;
end;

procedure TDbRADEtapa.SetIdetapaant(const Value: TCmDbField);
begin
  FIdetapaant := Value;
end;

procedure TDbRADEtapa.SetIdprocesso(const Value: TCmDbField);
begin
  FIdprocesso := Value;
end;

procedure TDbRADEtapa.SetIdtipoetapa(const Value: TCmDbField);
begin
  FIdtipoetapa := Value;
end;

end.



