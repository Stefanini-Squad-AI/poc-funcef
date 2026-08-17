unit uDbCota;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCota = class(TCmDbObject)

  private
    FIdplanoprev: TCmDbField;
    FDescricao: TCmDbField;
    FDataprimeira: TCmDbField;
    FIdcota: TCmDbField;
    FIdcotaperfil: TCmDbField;
    procedure SetDataprimeira(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdcota(const Value: TCmDbField);
    procedure SetIdcotaperfil(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);

  public

     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idcotaperfil: TCmDbField read FIdcotaperfil write SetIdcotaperfil;
     Property Idcota: TCmDbField read FIdcota write SetIdcota;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Dataprimeira: TCmDbField read FDataprimeira write SetDataprimeira;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCota }

constructor TDbCota.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COTA';

   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdcotaperfil := CreateCmDbField('IDCOTAPERFIL',ftfloat,True,False,False,True,'');
   fIdcota := CreateCmDbField('IDCOTA',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fDataprimeira := CreateCmDbField('DATAPRIMEIRA',ftDateTime,False,False,False,True,'');
end;

function TDbCota.Insert: Boolean;
begin

   fIdcota.AsFloat := GetSequence('COTA');
   Result := Inherited Insert;

end;


procedure TDbCota.SetDataprimeira(const Value: TCmDbField);
begin
  FDataprimeira := Value;
end;

procedure TDbCota.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbCota.SetIdcota(const Value: TCmDbField);
begin
  FIdcota := Value;
end;

procedure TDbCota.SetIdcotaperfil(const Value: TCmDbField);
begin
  FIdcotaperfil := Value;
end;

procedure TDbCota.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

end.



