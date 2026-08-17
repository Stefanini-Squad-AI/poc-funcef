{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/12/2003                             }
{                                                       }
{*******************************************************}

unit uDbLancOperImob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLancOperImob = class(TCmDbObject)

  private
    FIdoperacao: TCmDbField;
    FLancnumlan: TCmDbField;
    FIdLancOperContImo: TCmDbField;
    FIdmodulo: TCmDbField;
    FVlrdia: TCmDbField;
    FCodtipimovel: TCmDbField;
    FIdlancoperimob: TCmDbField;
    FDataoper: TCmDbField;
    FIdcontratoimovel: TCmDbField;
    FIdPlanoPrev: TCmDbField;
    FIdPatro: TCmDbField;
    procedure SetCodtipimovel(const Value: TCmDbField);
    procedure SetDataoper(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIdLancOperContImo(const Value: TCmDbField);
    procedure SetIdlancoperimob(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdoperacao(const Value: TCmDbField);
    procedure SetLancnumlan(const Value: TCmDbField);
    procedure SetVlrdia(const Value: TCmDbField);
    procedure SetIdPatro(const Value: TCmDbField);
    procedure SetIdPlanoPrev(const Value: TCmDbField);

  public

     Property Vlrdia: TCmDbField read FVlrdia write SetVlrdia;
     Property Lancnumlan: TCmDbField read FLancnumlan write SetLancnumlan;
     Property Idoperacao: TCmDbField read FIdoperacao write SetIdoperacao;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idlancoperimob: TCmDbField read FIdlancoperimob write SetIdlancoperimob;
     Property IdLancOperContImo: TCmDbField read FIdLancOperContImo write SetIdLancOperContImo;
     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property Dataoper: TCmDbField read FDataoper write SetDataoper;
     Property Codtipimovel: TCmDbField read FCodtipimovel write SetCodtipimovel;
     //Cássio - SOL Nº92381 KINTANA Nº394180 - Início
     property IdPatro : TCmDbField read FIdPatro write SetIdPatro;
     property IdPlanoPrev: TCmDbField read FIdPlanoPrev write SetIdPlanoPrev;
     //Cássio - SOL Nº92381 KINTANA Nº394180 - Fim

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLancOperImob }

constructor TDbLancOperImob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LANCOPERIMOB';

   fVlrdia := CreateCmDbField('VLRDIA',ftfloat,False,False,False,False,'');
   fLancnumlan := CreateCmDbField('LANCNUMLAN',ftfloat,False,False,False,True,'');
   fIdoperacao := CreateCmDbField('IDOPERACAO',ftfloat,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,False,False,True,'');
   fIdlancoperimob := CreateCmDbField('IDLANCOPERIMOB',ftfloat,True,True,False,True,'');
   fIdLancOperContImo := CreateCmDbField('IDLANCOPERCONTIMO',ftfloat,False,False,False,True,'');
   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,False,False,False,True,'');
   fDataoper := CreateCmDbField('DATAOPER',ftDateTime,False,False,False,True,'');
   fCodtipimovel := CreateCmDbField('CODTIPIMOVEL',ftString,False,False,False,True,'');
   //Cássio - SOL Nº92381 KINTANA Nº394180 - Início
   FIdPatro := CreateCmDbField('IDPATRO', ftInteger, False,False,False,True,'');
   FIdPlanoPrev := CreateCmDbField('IDPLANOPREV', ftInteger, False,False,False,True,'');
   //Cássio - SOL Nº92381 KINTANA Nº394180 - Fim
end;

function TDbLancOperImob.Insert: Boolean;
begin

   fIdlancoperimob.AsFloat := GetSequence('LANCOPERIMOB');
   Result := Inherited Insert;

end;


procedure TDbLancOperImob.SetCodtipimovel(const Value: TCmDbField);
begin
  FCodtipimovel := Value;
end;

procedure TDbLancOperImob.SetDataoper(const Value: TCmDbField);
begin
  FDataoper := Value;
end;

procedure TDbLancOperImob.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbLancOperImob.SetIdLancOperContImo(const Value: TCmDbField);
begin
  FIdLancOperContImo := Value;
end;

procedure TDbLancOperImob.SetIdlancoperimob(const Value: TCmDbField);
begin
  FIdlancoperimob := Value;
end;

procedure TDbLancOperImob.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbLancOperImob.SetIdoperacao(const Value: TCmDbField);
begin
  FIdoperacao := Value;
end;

procedure TDbLancOperImob.SetIdPatro(const Value: TCmDbField);
begin
  FIdPatro := Value;
end;

procedure TDbLancOperImob.SetIdPlanoPrev(const Value: TCmDbField);
begin
  FIdPlanoPrev := Value;
end;

procedure TDbLancOperImob.SetLancnumlan(const Value: TCmDbField);
begin
  FLancnumlan := Value;
end;

procedure TDbLancOperImob.SetVlrdia(const Value: TCmDbField);
begin
  FVlrdia := Value;
end;

end.



