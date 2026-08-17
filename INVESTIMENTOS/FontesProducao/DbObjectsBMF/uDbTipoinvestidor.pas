{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/11/2005                             }
{                                                       }
{*******************************************************}

unit uDbTipoinvestidor;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipoinvestidor = class(TCmDbObject)

  private
    FDesctpinvestidor: TCmDbField;
    FIdtipoinvestidor: TCmDbField;
    procedure SetDesctpinvestidor(const Value: TCmDbField);
    procedure SetIdtipoinvestidor(const Value: TCmDbField);

  public

     Property Idtipoinvestidor: TCmDbField read FIdtipoinvestidor write SetIdtipoinvestidor;
     Property Desctpinvestidor: TCmDbField read FDesctpinvestidor write SetDesctpinvestidor;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTipoinvestidor }

constructor TDbTipoinvestidor.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOINVESTIDOR';

   fIdtipoinvestidor := CreateCmDbField('IDTIPOINVESTIDOR',ftfloat,True,True,False,True,'');
   fDesctpinvestidor := CreateCmDbField('DESCTPINVESTIDOR',ftString,False,False,False,True,'');
end;

function TDbTipoinvestidor.Insert: Boolean;
begin

   fIdtipoinvestidor.AsFloat := GetSequence('TIPOINVESTIDOR');
   Result := Inherited Insert;

end;


procedure TDbTipoinvestidor.SetDesctpinvestidor(const Value: TCmDbField);
begin
  FDesctpinvestidor := Value;
end;

procedure TDbTipoinvestidor.SetIdtipoinvestidor(const Value: TCmDbField);
begin
  FIdtipoinvestidor := Value;
end;

end.



