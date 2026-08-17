{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 12/05/2006                             }
{                                                       }
{*******************************************************}

unit uDbApurresultado;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbApurresultado = class(TCmDbObject)

  private
    FIdplanoprev: TCmDbField;
    FPlncodigo: TCmDbField;
    FPlndatdia: TCmDbField;
    FPernumero: TCmDbField;
    FPerexercicio: TCmDbField;
    FIdapurresultado: TCmDbField;
    FIdpatro: TCmDbField;
    procedure SetIdapurresultado(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetPerexercicio(const Value: TCmDbField);
    procedure SetPernumero(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetPlndatdia(const Value: TCmDbField);

  public

     Property Plndatdia: TCmDbField read FPlndatdia write SetPlndatdia;
     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Pernumero: TCmDbField read FPernumero write SetPernumero;
     Property Perexercicio: TCmDbField read FPerexercicio write SetPerexercicio;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idapurresultado: TCmDbField read FIdapurresultado write SetIdapurresultado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbApurresultado }

constructor TDbApurresultado.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'APURRESULTADO';

   fPlndatdia := CreateCmDbField('PLNDATDIA',ftDateTime,False,False,False,True,'');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fPernumero := CreateCmDbField('PERNUMERO',ftfloat,False,False,False,True,'');
   fPerexercicio := CreateCmDbField('PEREXERCICIO',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdapurresultado := CreateCmDbField('IDAPURRESULTADO',ftfloat,True,True,False,True,'');
end;

function TDbApurresultado.Insert: Boolean;
begin

   fIdapurresultado.AsFloat := GetSequence('APURRESULTADO');
   Result := Inherited Insert;

end;


procedure TDbApurresultado.SetIdapurresultado(const Value: TCmDbField);
begin
  FIdapurresultado := Value;
end;

procedure TDbApurresultado.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbApurresultado.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbApurresultado.SetPerexercicio(const Value: TCmDbField);
begin
  FPerexercicio := Value;
end;

procedure TDbApurresultado.SetPernumero(const Value: TCmDbField);
begin
  FPernumero := Value;
end;

procedure TDbApurresultado.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDbApurresultado.SetPlndatdia(const Value: TCmDbField);
begin
  FPlndatdia := Value;
end;

end.



