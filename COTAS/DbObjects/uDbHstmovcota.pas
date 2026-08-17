unit uDbHstmovcota;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHstmovcota = class(TCmDbObject)

  private
    FIdativocota: TCmDbField;
    FValor: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdpatro: TCmDbField;
    FIdhstmovcota: TCmDbField;
    FData: TCmDbField;
    FIdcotatipooper: TCmDbField;
    procedure SetData(const Value: TCmDbField);
    procedure SetIdativocota(const Value: TCmDbField);
    procedure SetIdcotaimportacao(const Value: TCmDbField);
    procedure SetIdcotatipooper(const Value: TCmDbField);
    procedure SetIdhstmovcota(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);

  public

     Property Valor: TCmDbField read FValor write SetValor;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idhstmovcota: TCmDbField read FIdhstmovcota write SetIdhstmovcota;
     Property Idcotatipooper: TCmDbField read FIdcotatipooper write SetIdcotatipooper;
     Property Idativocota: TCmDbField read FIdativocota write SetIdativocota;
     Property Data: TCmDbField read FData write SetData;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     function GetSequenceIdHSTMOVCOTA : integer;


  End;

implementation

{ TDbHstmovcota }

constructor TDbHstmovcota.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HSTMOVCOTA';

   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdhstmovcota := CreateCmDbField('IDHSTMOVCOTA',ftfloat,True,True,False,True,'');
   fIdcotatipooper := CreateCmDbField('IDCOTATIPOOPER',ftfloat,False,False,False,True,'');
   fIdativocota := CreateCmDbField('IDATIVOCOTA',ftfloat,False,False,False,True,'');
   fData := CreateCmDbField('DATA',ftDateTime,False,False,False,True,'');
end;



function TDbHstmovcota.GetSequenceIdHSTMOVCOTA: integer;
var
Sequence: integer;

begin
  Sequence:= GetSequence('HSTMOVCOTA');
  Result := Sequence;

end;

function TDbHstmovcota.Insert: Boolean;
begin
   fIdhstmovcota.AsFloat := GetSequence('HSTMOVCOTA');
   Result := Inherited Insert;
end;


procedure TDbHstmovcota.SetData(const Value: TCmDbField);
begin
  FData := Value;
end;

procedure TDbHstmovcota.SetIdativocota(const Value: TCmDbField);
begin
  FIdativocota := Value;
end;

procedure TDbHstmovcota.SetIdcotaimportacao(const Value: TCmDbField);
begin
//  FIdcotaimportacao := Value;
end;

procedure TDbHstmovcota.SetIdcotatipooper(const Value: TCmDbField);
begin
  FIdcotatipooper := Value;
end;

procedure TDbHstmovcota.SetIdhstmovcota(const Value: TCmDbField);
begin
  FIdhstmovcota := Value;
end;

procedure TDbHstmovcota.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbHstmovcota.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbHstmovcota.SetTrgdtinclusao(const Value: TCmDbField);
begin

end;

procedure TDbHstmovcota.SetTrguserinclusao(const Value: TCmDbField);
begin

end;

procedure TDbHstmovcota.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.
