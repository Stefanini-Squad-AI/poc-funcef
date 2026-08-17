unit uDbCarteiraSpc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCarteiraSpc = class(TCmDbObject)

  private
    FCodtipocart: TCmDbField;
    FDescarteiraspc: TCmDbField;
    FCodsegmento: TCmDbField;
    FIdcarteiraspc: TCmDbField;
    procedure SetCodsegmento(const Value: TCmDbField);
    procedure SetCodtipocart(const Value: TCmDbField);
    procedure SetDescarteiraspc(const Value: TCmDbField);
    procedure SetIdcarteiraspc(const Value: TCmDbField);

  public

     Property Idcarteiraspc: TCmDbField read FIdcarteiraspc write SetIdcarteiraspc;
     Property Descarteiraspc: TCmDbField read FDescarteiraspc write SetDescarteiraspc;
     Property Codtipocart: TCmDbField read FCodtipocart write SetCodtipocart;
     Property Codsegmento: TCmDbField read FCodsegmento write SetCodsegmento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCarteiraSpc }

constructor TDbCarteiraSpc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CARTEIRASPC';

   fIdcarteiraspc := CreateCmDbField('IDCARTEIRASPC',ftfloat,True,True,False,True,'');
   fDescarteiraspc := CreateCmDbField('DESCARTEIRASPC',ftString,true,False,False,True,'Descrição da Carteira');
   fCodtipocart := CreateCmDbField('CODTIPOCART',ftString,False,False,False,True,'');
   fCodsegmento := CreateCmDbField('CODSEGMENTO',ftfloat,True,False,False,True,'Segmento SPC');
end;

function TDbCarteiraSpc.Insert: Boolean;
begin

   fIdcarteiraspc.AsFloat := GetSequence('CARTEIRASPC');
   Result := Inherited Insert;

end;


procedure TDbCarteiraSpc.SetCodsegmento(const Value: TCmDbField);
begin
  FCodsegmento := Value;
end;

procedure TDbCarteiraSpc.SetCodtipocart(const Value: TCmDbField);
begin
  FCodtipocart := Value;
end;

procedure TDbCarteiraSpc.SetDescarteiraspc(const Value: TCmDbField);
begin
  FDescarteiraspc := Value;
end;

procedure TDbCarteiraSpc.SetIdcarteiraspc(const Value: TCmDbField);
begin
  FIdcarteiraspc := Value;
end;

end.



