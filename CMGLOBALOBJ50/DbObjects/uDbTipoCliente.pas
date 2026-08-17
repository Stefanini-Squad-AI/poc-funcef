{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 30/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipoCliente;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipoCliente = class(TCmDbObject)

  private
    FIdtipocliente: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdtipocliente(const Value: TCmDbField);

  public
    Property IdTipoCliente: TCmDbField read FIdtipocliente write SetIdtipocliente;
    Property Descricao: TCmDbField read FDescricao write SetDescricao;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipoCliente }

constructor TDbTipoCliente.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOCLIENTE';

  fIdtipoCliente := CreateCmDbField('IDTIPOCLIENTE',ftfloat,True,True,False,True,'Código');
  fDescricao     := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'Descrição');
end;

function TDbTipoCliente.Insert: Boolean;
begin
  fIdtipocliente.AsFloat := GetSequence('TIPOCLIENTE');
  Result := Inherited Insert;
end;

function TDbTipoCliente.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbTipoCliente.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbTipoCliente.SetIdtipocliente(const Value: TCmDbField);
begin
  FIdtipocliente := Value;
end;

end.

