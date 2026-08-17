{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 14/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbContasxsubc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbContasxsubc = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FCodsubconta: TCmDbField;
    FPlano: TCmDbField;
    FIdusuario: TCmDbField;
    FPlaconta: TCmDbField;
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);

  public

     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbContasxsubc }

constructor TDbContasxsubc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTASXSUBC';

   fPlano := CreateCmDbField('PLANO',ftfloat,True,True,False,True,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,True,True,False,True,'');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,True,True,False,True,'');
end;

function TDbContasxsubc.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbContasxsubc.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbContasxsubc.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbContasxsubc.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbContasxsubc.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbContasxsubc.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbContasxsubc.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

end.



