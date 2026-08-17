{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 04/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbHistoContab;

interface

Uses uCmCustomCdbObject, uCMDbObject,  DB, uDataBase;

Type
  TDbHistoContab = class(TCmDbObject)

  private
     FIdusuarioinclusao : TCmDbField;
     FIdpessoa          : TCmDbField;
     FHitdescr1         : TCmDbField;
     FHitcodhist        : TCmDbField;
     procedure SetIdusuarioinclusao(const Value: TCmDbField);
     procedure SetIdpessoa         (const Value: TCmDbField);
     procedure SetHitdescr1        (const Value: TCmDbField);
     procedure SetHitcodhist       (const Value: TCmDbField);
  public
     Property IdUsuarioInclusao :TCmDbField  Read FIdUsuarioInclusao Write SetIdUsuarioInclusao;
     Property Idpessoa          :TCmDbField  Read FIdpessoa          Write SetIdpessoa;
     Property Hitdescr1         :TCmDbField  Read FHitdescr1         Write SetHitdescr1;
     Property Hitcodhist        :TCmDbField  Read FHitcodhist        Write SetHitcodhist;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbHistopadrao }

constructor TDbHistoContab.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTOPADRAO';

  FIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,True,False,False,False);
  FIdpessoa          := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,False);
  FHitdescr1         := CreateCmDbField('HITDESCR1',ftString,False,False,False);
  FHitcodhist        := CreateCmDbField('HITCODHIST',ftString,True,True,False);
end;

function TDbHistoContab.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbHistoContab.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbHistoContab.SetIdpessoa(const Value: TCmDbField);
begin
   FIdpessoa := Value;
end;


procedure TDbHistoContab.SetHitdescr1(const Value: TCmDbField);
begin
   FHitdescr1 := Value;
end;

procedure TDbHistoContab.SetHitcodhist(const Value: TCmDbField);
begin
   FHitcodhist := Value;
end;

procedure TDbHistoContab.SetIdUsuarioInclusao(const Value: TCmDbField);
begin
   FIdUsuarioInclusao := Value;
end;

end.



