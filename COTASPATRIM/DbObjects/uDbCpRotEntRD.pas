{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 09/10/2007                             }
{                                                       }
{*******************************************************}

unit uDbCpRotEntRD;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCprotentrd = class(TCmDbObject)

  private
    FIdcprotentrd: TCmDbField;
    FIdrateiodocum: TCmDbField;
    FIdcprotaprent: TCmDbField;
    FIdrateiofinanc: TCmDbField;
    procedure SetIdcprotaprent(const Value: TCmDbField);
    procedure SetIdcprotentrd(const Value: TCmDbField);
    procedure SetIdrateiodocum(const Value: TCmDbField);
    procedure SetIdrateiofinanc(const Value: TCmDbField);

  public

     Property Idrateiodocum: TCmDbField read FIdrateiodocum write SetIdrateiodocum;
     Property Idcprotentrd: TCmDbField read FIdcprotentrd write SetIdcprotentrd;
     Property Idcprotaprent: TCmDbField read FIdcprotaprent write SetIdcprotaprent;
     Property Idrateiofinanc: TCmDbField read FIdrateiofinanc write SetIdrateiofinanc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCprotentrd }

constructor TDbCprotentrd.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CPROTENTRD';

   fIdrateiodocum := CreateCmDbField('IDRATEIODOCUM',ftfloat,False,False,False,True,'Id. Rateio do Documento');
   fIdcprotentrd := CreateCmDbField('IDCPROTENTRD',ftfloat,True,True,False,True,'Id. Entrada x Rateio');
   fIdcprotaprent := CreateCmDbField('IDCPROTAPRENT',ftfloat,False,False,False,True,'Id. Entrada');
   fIdrateiofinanc := CreateCmDbField('IDRATEIOFINANC',ftfloat,False,False,False,True,'Id. Rateio Financeiro');
end;

function TDbCprotentrd.Insert: Boolean;
begin

   fIdcprotentrd.AsFloat := GetSequence('CPROTENTRD');
   Result := Inherited Insert;

end;


procedure TDbCprotentrd.SetIdcprotaprent(const Value: TCmDbField);
begin
  FIdcprotaprent := Value;
end;

procedure TDbCprotentrd.SetIdcprotentrd(const Value: TCmDbField);
begin
  FIdcprotentrd := Value;
end;

procedure TDbCprotentrd.SetIdrateiodocum(const Value: TCmDbField);
begin
  FIdrateiodocum := Value;
end;

procedure TDbCprotentrd.SetIdrateiofinanc(const Value: TCmDbField);
begin
  FIdrateiofinanc := Value;
end;

end.



