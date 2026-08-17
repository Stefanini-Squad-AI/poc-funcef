{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 15/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbContratoXLoja;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbContratoXLoja = class(TCmDbObject)

  private
    FIdcontrato: TCmDbField;
    FIdloja: TCmDbField;
    procedure SetIdcontrato(const Value: TCmDbField);
    procedure SetIdloja(const Value: TCmDbField);

  public

     Property Idloja: TCmDbField read FIdloja write SetIdloja;
     Property Idcontrato: TCmDbField read FIdcontrato write SetIdcontrato;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbContratoXLoja }

constructor TDbContratoXLoja.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDCONTRATOXLOJA';

   fIdloja := CreateCmDbField('IDLOJA',ftfloat,True,True,False,True,'ID da Loja');
   fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,True,True,False,True,'ID do Contrato');
end;

function TDbContratoXLoja.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbContratoXLoja.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbContratoXLoja.SetIdcontrato(const Value: TCmDbField);
begin
  FIdcontrato := Value;
end;

procedure TDbContratoXLoja.SetIdloja(const Value: TCmDbField);
begin
  FIdloja := Value;
end;

end.



