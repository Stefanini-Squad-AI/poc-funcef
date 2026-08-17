{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 21/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbBorderocaixapeq;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBorderocaixapeq = class(TCmDbObject)

  private
    FCoddocumento: TCmDbField;
    FDataefetbordero: TCmDbField;
    FPlncodigo: TCmDbField;
    FIdborderocxpeq: TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetDataefetbordero(const Value: TCmDbField);
    procedure SetIdborderocxpeq(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);

  public

     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Idborderocxpeq: TCmDbField read FIdborderocxpeq write SetIdborderocxpeq;
     Property Dataefetbordero: TCmDbField read FDataefetbordero write SetDataefetbordero;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbBorderocaixapeq }

constructor TDbBorderocaixapeq.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BORDEROCAIXAPEQ';

   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fIdborderocxpeq := CreateCmDbField('IDBORDEROCXPEQ',ftfloat,True,True,False,True,'');
   fDataefetbordero := CreateCmDbField('DATAEFETBORDERO',ftDateTime,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
end;

function TDbBorderocaixapeq.Insert: Boolean;
begin

   fIdborderocxpeq.AsFloat := GetSequence('BORDEROCAIXAPEQ');
   Result := Inherited Insert;

end;


procedure TDbBorderocaixapeq.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbBorderocaixapeq.SetDataefetbordero(const Value: TCmDbField);
begin
  FDataefetbordero := Value;
end;

procedure TDbBorderocaixapeq.SetIdborderocxpeq(const Value: TCmDbField);
begin
  FIdborderocxpeq := Value;
end;

procedure TDbBorderocaixapeq.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

end.



