{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbRateioplanpatro;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRateioplanpatro = class(TCmDbObject)

  private
    FQtdecotas: TCmDbField;
    FIdpatro: TCmDbField;
    FIdpessoa: TCmDbField;
    FPernumero: TCmDbField;
    FIdplanoprev: TCmDbField;
    FPerexercicio: TCmDbField;
    FIdrateioplanpatro: TCmDbField;
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdrateioplanpatro(const Value: TCmDbField);
    procedure SetPerexercicio(const Value: TCmDbField);
    procedure SetPernumero(const Value: TCmDbField);
    procedure SetQtdecotas(const Value: TCmDbField);

  public

     Property Qtdecotas: TCmDbField read FQtdecotas write SetQtdecotas;
     Property Pernumero: TCmDbField read FPernumero write SetPernumero;
     Property Perexercicio: TCmDbField read FPerexercicio write SetPerexercicio;
     Property Idrateioplanpatro: TCmDbField read FIdrateioplanpatro write SetIdrateioplanpatro;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRateioplanpatro }

constructor TDbRateioplanpatro.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RATEIOPLANPATRO';

   fQtdecotas := CreateCmDbField('QTDECOTAS',ftfloat,False,False,False,True,'');
   fPernumero := CreateCmDbField('PERNUMERO',ftfloat,False,False,False,True,'');
   fPerexercicio := CreateCmDbField('PEREXERCICIO',ftfloat,False,False,False,True,'');
   fIdrateioplanpatro := CreateCmDbField('IDRATEIOPLANPATRO',ftfloat,True,True,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
end;

function TDbRateioplanpatro.Insert: Boolean;
begin

   fIdrateioplanpatro.AsFloat := GetSequence('RATEIOPLANPATRO');
   Result := Inherited Insert;

end;


procedure TDbRateioplanpatro.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbRateioplanpatro.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRateioplanpatro.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbRateioplanpatro.SetIdrateioplanpatro(const Value: TCmDbField);
begin
  FIdrateioplanpatro := Value;
end;

procedure TDbRateioplanpatro.SetPerexercicio(const Value: TCmDbField);
begin
  FPerexercicio := Value;
end;

procedure TDbRateioplanpatro.SetPernumero(const Value: TCmDbField);
begin
  FPernumero := Value;
end;

procedure TDbRateioplanpatro.SetQtdecotas(const Value: TCmDbField);
begin
  FQtdecotas := Value;
end;

end.



