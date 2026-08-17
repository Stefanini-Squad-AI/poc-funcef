{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/11/2005                             }
{                                                       }
{*******************************************************}

unit uDbTipofundoinvest;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipofundoinvest = class(TCmDbObject)

  private
    FIdtipoinvest: TCmDbField;
    FIdtipofundoinvest: TCmDbField;
    FDataultfech: TCmDbField;
    FDesctipofundoinv: TCmDbField;
    procedure SetDataultfech(const Value: TCmDbField);
    procedure SetDesctipofundoinv(const Value: TCmDbField);
    procedure SetIdtipofundoinvest(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);

  public

     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idtipofundoinvest: TCmDbField read FIdtipofundoinvest write SetIdtipofundoinvest;
     Property Desctipofundoinv: TCmDbField read FDesctipofundoinv write SetDesctipofundoinv;
     Property Dataultfech: TCmDbField read FDataultfech write SetDataultfech;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTipofundoinvest }

constructor TDbTipofundoinvest.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOFUNDOINVEST';

   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'');
   fIdtipofundoinvest := CreateCmDbField('IDTIPOFUNDOINVEST',ftfloat,True,True,False,True,'');
   fDesctipofundoinv := CreateCmDbField('DESCTIPOFUNDOINV',ftString,False,False,False,True,'');
   fDataultfech := CreateCmDbField('DATAULTFECH',ftDateTime,False,False,False,True,'');
end;

function TDbTipofundoinvest.Insert: Boolean;
begin

   fIdtipofundoinvest.AsFloat := GetSequence('TIPOFUNDOINVEST');
   Result := Inherited Insert;

end;


procedure TDbTipofundoinvest.SetDataultfech(const Value: TCmDbField);
begin
  FDataultfech := Value;
end;

procedure TDbTipofundoinvest.SetDesctipofundoinv(const Value: TCmDbField);
begin
  FDesctipofundoinv := Value;
end;

procedure TDbTipofundoinvest.SetIdtipofundoinvest(const Value: TCmDbField);
begin
  FIdtipofundoinvest := Value;
end;

procedure TDbTipofundoinvest.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

end.



