{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 24/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbItemavaliacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbItemavaliacao = class(TCmDbObject)

  private
    FIdAvaliacao: TCmDbField;
    FPeso: TCmDbField;
    FIdCritAvaliacao: TCmDbField;
    FNota: TCmDbField;
    procedure SetIdAvaliacao(const Value: TCmDbField);
    procedure SetIdCritAvaliacao(const Value: TCmDbField);
    procedure SetNota(const Value: TCmDbField);
    procedure SetPeso(const Value: TCmDbField);

  public

     Property Peso            : TCmDbField read FPeso write SetPeso;
     Property Nota            : TCmDbField read FNota write SetNota;
     Property IdCritAvaliacao : TCmDbField read FIdCritAvaliacao write SetIdCritAvaliacao;
     Property IdAvaliacao     : TCmDbField read FIdAvaliacao write SetIdAvaliacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbItemavaliacao }

constructor TDbItemavaliacao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ITEMAVALIACAO';

   fPeso := CreateCmDbField('PESO',ftfloat,True,False,False,True,'');
   fNota := CreateCmDbField('NOTA',ftfloat,True,False,False,True,'');
   fIdcritavaliacao := CreateCmDbField('IDCRITAVALIACAO',ftfloat,True,True,False,True,'');
   fIdavaliacao := CreateCmDbField('IDAVALIACAO',ftfloat,True,True,False,True,'');
end;

function TDbItemavaliacao.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbItemavaliacao.SetIdAvaliacao(const Value: TCmDbField);
begin
  FIdAvaliacao := Value;
end;

procedure TDbItemavaliacao.SetIdCritAvaliacao(const Value: TCmDbField);
begin
  FIdCritAvaliacao := Value;
end;

procedure TDbItemavaliacao.SetNota(const Value: TCmDbField);
begin
  FNota := Value;
end;

procedure TDbItemavaliacao.SetPeso(const Value: TCmDbField);
begin
  FPeso := Value;
end;

end.



