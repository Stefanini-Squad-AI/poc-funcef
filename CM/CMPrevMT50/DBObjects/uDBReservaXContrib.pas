{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 09/04/2007                             }
{                                                       }
{*******************************************************}

unit uDBReservaXContrib;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDBReservaXContrib = class(TCmDbObject)

  private
    FValormaximorateio: TCmDbField;
    FIdregracalculore: TCmDbField;
    FPercentual: TCmDbField;
    FIdcontribuicao: TCmDbField;
    FIdrgvlrmaxrateio: TCmDbField;
    FIdplanoprev: TCmDbField;
    FAnomesrefrateio: TCmDbField;
    FIdtiporeserva: TCmDbField;
    procedure SetAnomesrefrateio(const Value: TCmDbField);
    procedure SetIdcontribuicao(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdregracalculore(const Value: TCmDbField);
    procedure SetIdrgvlrmaxrateio(const Value: TCmDbField);
    procedure SetIdtiporeserva(const Value: TCmDbField);
    procedure SetPercentual(const Value: TCmDbField);
    procedure SetValormaximorateio(const Value: TCmDbField);

  public

     Property Valormaximorateio: TCmDbField read FValormaximorateio write SetValormaximorateio;
     Property Percentual: TCmDbField read FPercentual write SetPercentual;
     Property Idtiporeserva: TCmDbField read FIdtiporeserva write SetIdtiporeserva;
     Property Idrgvlrmaxrateio: TCmDbField read FIdrgvlrmaxrateio write SetIdrgvlrmaxrateio;
     Property Idregracalculore: TCmDbField read FIdregracalculore write SetIdregracalculore;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idcontribuicao: TCmDbField read FIdcontribuicao write SetIdcontribuicao;
     Property Anomesrefrateio: TCmDbField read FAnomesrefrateio write SetAnomesrefrateio;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBReservaXContrib }

constructor TDBReservaXContrib.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RESERVAXCONTRIB';

   fValormaximorateio := CreateCmDbField('VALORMAXIMORATEIO',ftfloat,False,False,False,True,'');
   fPercentual := CreateCmDbField('PERCENTUAL',ftfloat,False,False,False,True,'');
   fIdtiporeserva := CreateCmDbField('IDTIPORESERVA',ftfloat,True,True,False,True,'');
   fIdrgvlrmaxrateio := CreateCmDbField('IDRGVLRMAXRATEIO',ftfloat,False,False,False,True,'');
   fIdregracalculore := CreateCmDbField('IDREGRACALCULORE',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdcontribuicao := CreateCmDbField('IDCONTRIBUICAO',ftfloat,True,True,False,True,'');
   fAnomesrefrateio := CreateCmDbField('ANOMESREFRATEIO',ftString,False,False,False,True,'');
end;

function TDBReservaXContrib.Insert: Boolean;
begin

   fIdtiporeserva.AsFloat := GetSequence('RESERVAXCONTRIB');
   fIdplanoprev.AsFloat := GetSequence('RESERVAXCONTRIB');
   fIdcontribuicao.AsFloat := GetSequence('RESERVAXCONTRIB');
   Result := Inherited Insert;

end;


procedure TDBReservaXContrib.SetAnomesrefrateio(const Value: TCmDbField);
begin
  FAnomesrefrateio := Value;
end;

procedure TDBReservaXContrib.SetIdcontribuicao(const Value: TCmDbField);
begin
  FIdcontribuicao := Value;
end;

procedure TDBReservaXContrib.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDBReservaXContrib.SetIdregracalculore(const Value: TCmDbField);
begin
  FIdregracalculore := Value;
end;

procedure TDBReservaXContrib.SetIdrgvlrmaxrateio(const Value: TCmDbField);
begin
  FIdrgvlrmaxrateio := Value;
end;

procedure TDBReservaXContrib.SetIdtiporeserva(const Value: TCmDbField);
begin
  FIdtiporeserva := Value;
end;

procedure TDBReservaXContrib.SetPercentual(const Value: TCmDbField);
begin
  FPercentual := Value;
end;

procedure TDBReservaXContrib.SetValormaximorateio(const Value: TCmDbField);
begin
  FValormaximorateio := Value;
end;

end.



