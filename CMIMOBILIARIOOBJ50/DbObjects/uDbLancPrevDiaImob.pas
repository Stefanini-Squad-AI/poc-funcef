{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 24/10/2002                             }
{                                                       }
{*******************************************************}

unit uDbLancPrevDiaImob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLancPrevDiaImob = class(TCmDbObject)

  private
    FIdlancprevdiaimob: TCmDbField;
    FLancnumlan: TCmDbField;
    FIdtipocustorecimo: TCmDbField;
    FVlrdia: TCmDbField;
    FIdlancprevcontimob: TCmDbField;
    FCodtipimovel: TCmDbField;
    FFlgAjusteAnual: TCmDbField;
    procedure SetCodtipimovel(const Value: TCmDbField);
    procedure SetIdlancprevcontimob(const Value: TCmDbField);
    procedure SetIdlancprevdiaimob(const Value: TCmDbField);
    procedure SetIdtipocustorecimo(const Value: TCmDbField);
    procedure SetLancnumlan(const Value: TCmDbField);
    procedure SetVlrdia(const Value: TCmDbField);
    procedure SetFlgAjusteAnual(const Value: TCmDbField);

  public

     Property Vlrdia: TCmDbField read FVlrdia write SetVlrdia;
     Property Lancnumlan: TCmDbField read FLancnumlan write SetLancnumlan;
     Property Idtipocustorecimo: TCmDbField read FIdtipocustorecimo write SetIdtipocustorecimo;
     Property Idlancprevdiaimob: TCmDbField read FIdlancprevdiaimob write SetIdlancprevdiaimob;
     Property Idlancprevcontimob: TCmDbField read FIdlancprevcontimob write SetIdlancprevcontimob;
     Property Codtipimovel: TCmDbField read FCodtipimovel write SetCodtipimovel;
     Property FlgAjusteAnual: TCmDbField read FFlgAjusteAnual write SetFlgAjusteAnual;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLancPrevDiaImob }

constructor TDbLancPrevDiaImob.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'LANCPREVDIAIMOB';

   fVlrdia := CreateCmDbField('VLRDIA',ftfloat,False,False,False,True,'');
   fLancnumlan := CreateCmDbField('LANCNUMLAN',ftfloat,False,False,False,True,'');
   fIdtipocustorecimo := CreateCmDbField('IDTIPOCUSTORECIMO',ftfloat,False,False,False,True,'');
   fIdlancprevdiaimob := CreateCmDbField('IDLANCPREVDIAIMOB',ftfloat,True,True,False,True,'');
   fIdlancprevcontimob := CreateCmDbField('IDLANCPREVCONTIMOB',ftfloat,False,False,False,True,'');
   fCodtipimovel := CreateCmDbField('CODTIPIMOVEL',ftString,False,False,False,True,'');
   fFlgAjusteAnual := CreateCmDbField('FLGAJUSTEANUAL',ftString,False,False,False,True,'');
end;

function TDbLancPrevDiaImob.Insert: Boolean;
begin
   fIdlancprevdiaimob.AsFloat := GetSequence('LANCPREVDIAIMOB');
   Result := Inherited Insert;
end;


procedure TDbLancPrevDiaImob.SetCodtipimovel(const Value: TCmDbField);
begin
  FCodtipimovel := Value;
end;

procedure TDbLancPrevDiaImob.SetFlgAjusteAnual(const Value: TCmDbField);
begin
  FFlgAjusteAnual := Value;
end;

procedure TDbLancPrevDiaImob.SetIdlancprevcontimob(
  const Value: TCmDbField);
begin
  FIdlancprevcontimob := Value;
end;

procedure TDbLancPrevDiaImob.SetIdlancprevdiaimob(const Value: TCmDbField);
begin
  FIdlancprevdiaimob := Value;
end;

procedure TDbLancPrevDiaImob.SetIdtipocustorecimo(const Value: TCmDbField);
begin
  FIdtipocustorecimo := Value;
end;

procedure TDbLancPrevDiaImob.SetLancnumlan(const Value: TCmDbField);
begin
  FLancnumlan := Value;
end;

procedure TDbLancPrevDiaImob.SetVlrdia(const Value: TCmDbField);
begin
  FVlrdia := Value;
end;

end.



