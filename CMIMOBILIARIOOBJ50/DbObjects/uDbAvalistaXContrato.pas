{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 13/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbAvalistaXContrato;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbAvalistaXContrato = class(TCmDbObject)

  private
    FIdcontratoimovel: TCmDbField;
    FIdavalista: TCmDbField;
    procedure SetIdavalista(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);

  public

     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property Idavalista: TCmDbField read FIdavalista write SetIdavalista;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAvalistaXContrato }

constructor TDbAvalistaXContrato.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;
  _UpdateKeyFields      := True;  


  TableName := 'AVALISTAXCONTRATO';

   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,True,True,False,True,'');
   fIdavalista := CreateCmDbField('IDAVALISTA',ftfloat,True,True,False,True,'');
end;

function TDbAvalistaXContrato.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbAvalistaXContrato.SetIdavalista(const Value: TCmDbField);
begin
  FIdavalista := Value;
end;

procedure TDbAvalistaXContrato.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

end.



