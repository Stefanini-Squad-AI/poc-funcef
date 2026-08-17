{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Vinicius Maciel          }
{ Atualizado Em: 13/06/2011                             }
{                                                       }
{*******************************************************}

unit uDbTipodocpessoaxmasc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipodocpessoaxmasc = class(TCmDbObject)

  private
      FIdtipodocpessoaxmasc: TCmDbField;
      FIddocumento: TCmDbField;
      FNome: TCmDbField;
      FMascara: TCmDbField;
      procedure SetIdtipodocpessoaxmasc(const Value: TCmDbField);
      procedure SetIddocumento(const Value: TCmDbField);
      procedure SetNome(const Value: TCmDbField);
      procedure SetMascara(const Value: TCmDbField);
  public

     Property Nome: TCmDbField read FNome write SetNome;
     Property Mascara: TCmDbField read FMascara write SetMascara;
     Property Idtipodocpessoaxmasc: TCmDbField read FIdtipodocpessoaxmasc write SetIdtipodocpessoaxmasc;
     Property Iddocumento: TCmDbField read FIddocumento write SetIddocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipodocpessoaxmasc }

constructor TDbTipodocpessoaxmasc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPODOCPESSOAXMASC';

   FNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   FMascara := CreateCmDbField('MASCARA',ftString,False,False,False,True,'');
   FIdtipodocpessoaxmasc := CreateCmDbField('IDTIPODOCPESSOAXMASC',ftfloat,True,True,False,True,'');
   FIddocumento := CreateCmDbField('IDDOCUMENTO',ftfloat,True,False,False,True,'');
end;

function TDbTipodocpessoaxmasc.Insert: Boolean;
begin

   fIdtipodocpessoaxmasc.AsFloat := GetSequence('TIPODOCPESSOAXMASC');
   Result := Inherited Insert;

end;

function TDbTipodocpessoaxmasc.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbTipodocpessoaxmasc.SetIdtipodocpessoaxmasc(const Value: TCmDbField);
begin
  FIdtipodocpessoaxmasc := Value;
end;

procedure TDbTipodocpessoaxmasc.SetIddocumento(const Value: TCmDbField);
begin
  FIddocumento := Value;
end;

procedure TDbTipodocpessoaxmasc.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbTipodocpessoaxmasc.SetMascara(const Value: TCmDbField);
begin
  FMascara := Value;
end;

end.



