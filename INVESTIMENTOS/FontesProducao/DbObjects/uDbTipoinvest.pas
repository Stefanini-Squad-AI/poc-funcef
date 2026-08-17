{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 27/06/2006                             }
{                                                       }
{*******************************************************}

unit uDbTipoinvest;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipoinvest = class(TCmDbObject)

  private
    FDesctipoinvest: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FDtatravactb: TCmDbField;
    procedure SetDesctipoinvest(const Value: TCmDbField);
    procedure SetDtatravactb(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);

  public

     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Dtatravactb: TCmDbField read FDtatravactb write SetDtatravactb;
     Property Desctipoinvest: TCmDbField read FDesctipoinvest write SetDesctipoinvest;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTipoinvest }

constructor TDbTipoinvest.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOINVEST';

   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,True,False,False,True,'IDTIPOINVEST');
   fDtatravactb := CreateCmDbField('DTATRAVACTB',ftDateTime,False,False,False,True,'DTATRAVACTB');
   fDesctipoinvest := CreateCmDbField('DESCTIPOINVEST',ftString,True,False,False,True,'DESCTIPOINVEST');
end;

function TDbTipoinvest.Insert: Boolean;
begin

   fIdtipoinvest.AsFloat := GetSequence('IDTIPOINVEST');
   fDtatravactb.AsFloat := GetSequence('DTATRAVACTB');
   fDesctipoinvest.AsFloat := GetSequence('DESCTIPOINVEST');
   Result := Inherited Insert;

end;


procedure TDbTipoinvest.SetDesctipoinvest(const Value: TCmDbField);
begin
  FDesctipoinvest := Value;
end;

procedure TDbTipoinvest.SetDtatravactb(const Value: TCmDbField);
begin
  FDtatravactb := Value;
end;

procedure TDbTipoinvest.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

end.



