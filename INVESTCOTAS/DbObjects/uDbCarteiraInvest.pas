unit uDbCarteirainvest;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCarteirainvest = class(TCmDbObject)

  private
    FIdgestorcarteira: TCmDbField;
    FFlgcartprop: TCmDbField;
    FFlgcalcdiario: TCmDbField;
    FDatainicio: TCmDbField;
    FDesccartinvest: TCmDbField;
    FFlgcartterc: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FIddaieacart: TCmDbField;
    FFlgordmovinv: TCmDbField;
    FIdplanoprev: TCmDbField;
    FFlgcartlastro: TCmDbField;
    FIdmercado: TCmDbField;
    FFlgtratalote: TCmDbField;
    FDataultfech: TCmDbField;
    FIdpatrocinadora: TCmDbField;
    //AL_1
    FFlgContabiliza : TCmDbField;

    procedure SetDatainicio(const Value: TCmDbField);
    procedure SetDataultfech(const Value: TCmDbField);
    procedure SetDesccartinvest(const Value: TCmDbField);
    procedure SetFlgcalcdiario(const Value: TCmDbField);
    procedure SetFlgcartlastro(const Value: TCmDbField);
    procedure SetFlgcartprop(const Value: TCmDbField);
    procedure SetFlgcartterc(const Value: TCmDbField);
    procedure SetFlgordmovinv(const Value: TCmDbField);
    procedure SetFlgtratalote(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIddaieacart(const Value: TCmDbField);
    procedure SetIdgestorcarteira(const Value: TCmDbField);
    procedure SetIdmercado(const Value: TCmDbField);
    procedure SetIdpatrocinadora(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    //AL_1
    procedure SetFlgContabiliza(const Value: TCmDbField);

  public

     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpatrocinadora: TCmDbField read FIdpatrocinadora write SetIdpatrocinadora;
     Property Idmercado: TCmDbField read FIdmercado write SetIdmercado;
     Property Idgestorcarteira: TCmDbField read FIdgestorcarteira write SetIdgestorcarteira;
     Property Iddaieacart: TCmDbField read FIddaieacart write SetIddaieacart;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Flgtratalote: TCmDbField read FFlgtratalote write SetFlgtratalote;
     Property Flgordmovinv: TCmDbField read FFlgordmovinv write SetFlgordmovinv;
     Property Flgcartterc: TCmDbField read FFlgcartterc write SetFlgcartterc;
     Property Flgcartprop: TCmDbField read FFlgcartprop write SetFlgcartprop;
     Property Flgcartlastro: TCmDbField read FFlgcartlastro write SetFlgcartlastro;
     Property Flgcalcdiario: TCmDbField read FFlgcalcdiario write SetFlgcalcdiario;
     Property Desccartinvest: TCmDbField read FDesccartinvest write SetDesccartinvest;
     Property Dataultfech: TCmDbField read FDataultfech write SetDataultfech;
     Property Datainicio: TCmDbField read FDatainicio write SetDatainicio;
     //AL_1
     Property FlgContabiliza: TCmDbField read FFlgContabiliza write SetFlgContabiliza;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCarteirainvest }

constructor TDbCarteirainvest.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CARTEIRAINVEST';

   fIdtipoinvest     := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'');
   fIdplanoprev      := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpatrocinadora  := CreateCmDbField('IDPATROCINADORA',ftfloat,False,False,False,True,'');
   fIdmercado        := CreateCmDbField('IDMERCADO',ftfloat,False,False,False,True,'');
   fIdgestorcarteira := CreateCmDbField('IDGESTORCARTEIRA',ftfloat,False,False,False,True,'');
   fIddaieacart      := CreateCmDbField('IDDAIEACART',ftfloat,False,False,False,True,'');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,True,True,False,True,'');
   fFlgtratalote     := CreateCmDbField('FLGTRATALOTE',ftString,False,False,False,True,'');
   fFlgordmovinv     := CreateCmDbField('FLGORDMOVINV',ftString,False,False,False,True,'');
   fFlgcartterc      := CreateCmDbField('FLGCARTTERC',ftString,False,False,False,True,'');
   fFlgcartprop      := CreateCmDbField('FLGCARTPROP',ftfloat,False,False,False,True,'');
   //AL_1
   fFlgcartlastro    := CreateCmDbField('FLGCARTLASTRO',ftString,False,False,False,True,'');
   fFlgcalcdiario    := CreateCmDbField('FLGCALCDIARIO',ftString,False,False,False,True,'');
   fDesccartinvest   := CreateCmDbField('DESCCARTINVEST',ftString,False,False,False,True,'');
   fDataultfech      := CreateCmDbField('DATAULTFECH',ftDateTime,False,False,False,True,'');
   fDatainicio       := CreateCmDbField('DATAINICIO',ftDateTime,False,False,False,True,'');
   //AL_1
   flgContabiliza    := CreateCmDbField('FLGCONTABILIZA',ftString,False,False,False,True,'');
end;

function TDbCarteirainvest.Insert: Boolean;
begin

   fIdcarteirainvest.AsFloat := GetSequence('CARTEIRAINVEST');
   Result := Inherited Insert;

end;


procedure TDbCarteirainvest.SetDatainicio(const Value: TCmDbField);
begin
  FDatainicio := Value;
end;

procedure TDbCarteirainvest.SetDataultfech(const Value: TCmDbField);
begin
  FDataultfech := Value;
end;

procedure TDbCarteirainvest.SetDesccartinvest(const Value: TCmDbField);
begin
  FDesccartinvest := Value;
end;

procedure TDbCarteirainvest.SetFlgcalcdiario(const Value: TCmDbField);
begin
  FFlgcalcdiario := Value;
end;

procedure TDbCarteirainvest.SetFlgcartlastro(const Value: TCmDbField);
begin
  FFlgcartlastro := Value;
end;

procedure TDbCarteirainvest.SetFlgcartprop(const Value: TCmDbField);
begin
  FFlgcartprop := Value;
end;

procedure TDbCarteirainvest.SetFlgcartterc(const Value: TCmDbField);
begin
  FFlgcartterc := Value;
end;

//AL_1
procedure TDbCarteirainvest.SetFlgContabiliza(const Value: TCmDbField);
begin
  FFlgContabiliza := Value;
end;

procedure TDbCarteirainvest.SetFlgordmovinv(const Value: TCmDbField);
begin
  FFlgordmovinv := Value;
end;

procedure TDbCarteirainvest.SetFlgtratalote(const Value: TCmDbField);
begin
  FFlgtratalote := Value;
end;

procedure TDbCarteirainvest.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbCarteirainvest.SetIddaieacart(const Value: TCmDbField);
begin
  FIddaieacart := Value;
end;

procedure TDbCarteirainvest.SetIdgestorcarteira(const Value: TCmDbField);
begin
  FIdgestorcarteira := Value;
end;

procedure TDbCarteirainvest.SetIdmercado(const Value: TCmDbField);
begin
  FIdmercado := Value;
end;

procedure TDbCarteirainvest.SetIdpatrocinadora(const Value: TCmDbField);
begin
  FIdpatrocinadora := Value;
end;

procedure TDbCarteirainvest.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbCarteirainvest.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

end.



