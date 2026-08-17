{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 30/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbRamoFornecedor;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRamoFornecedor = class(TCmDbObject)

  private
    FDescramofornecedor: TCmDbField;
    FIdramofornecedor: TCmDbField;
    procedure SetDescramofornecedor(const Value: TCmDbField);
    procedure SetIdramofornecedor(const Value: TCmDbField);

  public
    Property Idramofornecedor: TCmDbField read FIdramofornecedor write SetIdramofornecedor;
    Property Descramofornecedor: TCmDbField read FDescramofornecedor write SetDescramofornecedor;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbRamoFornecedor }

constructor TDbRamoFornecedor.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RAMOFORNECEDOR';

  fIdramofornecedor   := CreateCmDbField('IDRAMOFORNECEDOR',ftfloat,True,True,False,True,'Código');
  fDescramofornecedor := CreateCmDbField('DESCRAMOFORNECEDOR',ftString,False,False,False,True,'Descrição');
end;

function TDbRamoFornecedor.Insert: Boolean;
begin
  fIdramofornecedor.AsFloat := GetSequence('RAMOFORNECEDOR');
  Result := Inherited Insert;
end;

function TDbRamoFornecedor.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbRamoFornecedor.SetDescramofornecedor(const Value: TCmDbField);
begin
  FDescramofornecedor := Value;
end;

procedure TDbRamoFornecedor.SetIdramofornecedor(const Value: TCmDbField);
begin
  FIdramofornecedor := Value;
end;

end.

