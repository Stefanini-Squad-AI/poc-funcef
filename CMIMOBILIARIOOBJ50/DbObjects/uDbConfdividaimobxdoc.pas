{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 11/12/2006                             }
{                                                       }
{*******************************************************}

unit uDbConfdividaimobxdoc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbConfdividaimobxdoc = class(TCmDbObject)

  private
    FCoddocumento: TCmDbField;
    FIdconfdividaimob: TCmDbField;
    FIdlanctodocumliq: TCmDbField;
    FIdcontratoimovel: TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetIdconfdividaimob(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIdlanctodocumliq(const Value: TCmDbField);

  public

     Property Idlanctodocumliq: TCmDbField read FIdlanctodocumliq write SetIdlanctodocumliq;
     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property Idconfdividaimob: TCmDbField read FIdconfdividaimob write SetIdconfdividaimob;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbConfdividaimobxdoc }

constructor TDbConfdividaimobxdoc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONFDIVIDAIMOBXDOC';

   fIdlanctodocumliq := CreateCmDbField('IDLANCTODOCUMLIQ',ftfloat,False,False,False,True,'');
   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,True,True,False,False,'');
   fIdconfdividaimob := CreateCmDbField('IDCONFDIVIDAIMOB',ftfloat,True,True,False,False,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,True,True,False,False,'');
end;

function TDbConfdividaimobxdoc.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbConfdividaimobxdoc.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbConfdividaimobxdoc.SetIdconfdividaimob(
  const Value: TCmDbField);
begin
  FIdconfdividaimob := Value;
end;

procedure TDbConfdividaimobxdoc.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbConfdividaimobxdoc.SetIdlanctodocumliq(
  const Value: TCmDbField);
begin
  FIdlanctodocumliq := Value;
end;

end.



