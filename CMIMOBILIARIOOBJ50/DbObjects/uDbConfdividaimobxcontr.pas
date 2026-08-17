{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 11/12/2006                             }
{                                                       }
{*******************************************************}

unit uDbConfdividaimobxcontr;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbConfdividaimobxcontr = class(TCmDbObject)

  private
    FIdconfdividaimob: TCmDbField;
    FIdcontratoimovel: TCmDbField;
    procedure SetIdconfdividaimob(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);

  public

     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property Idconfdividaimob: TCmDbField read FIdconfdividaimob write SetIdconfdividaimob;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbConfdividaimobxcontr }

constructor TDbConfdividaimobxcontr.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONFDIVIDAIMOBXCONTR';

   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,True,True,False,False,'');
   fIdconfdividaimob := CreateCmDbField('IDCONFDIVIDAIMOB',ftfloat,True,True,False,False,'');
end;

function TDbConfdividaimobxcontr.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbConfdividaimobxcontr.SetIdconfdividaimob(
  const Value: TCmDbField);
begin
  FIdconfdividaimob := Value;
end;

procedure TDbConfdividaimobxcontr.SetIdcontratoimovel(
  const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

end.



