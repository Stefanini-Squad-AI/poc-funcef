{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 03/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbPracaComp;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPracaComp = class(TCmDbObject)
  private
    FCodigo: TCmDbField;
    FDescricao: TCmDbField;
    FIdpracacomp: TCmDbField;
    procedure SetCodigo(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdpracacomp(const Value: TCmDbField);

  public
    Property Idpracacomp: TCmDbField read FIdpracacomp write SetIdpracacomp;
    Property Descricao: TCmDbField read FDescricao write SetDescricao;
    Property Codigo: TCmDbField read FCodigo write SetCodigo;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPracaComp }

constructor TDbPracaComp.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PRACACOMP';

  fIdpracacomp := CreateCmDbField('IDPRACACOMP',ftfloat,True,True,False,True,'Id');
  fDescricao   := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'Descrição');
  fCodigo      := CreateCmDbField('CODIGO',ftString,False,False,False,True,'Código');
end;

function TDbPracaComp.Insert: Boolean;
begin
  fIdpracacomp.AsFloat := GetSequence('PRACACOMP');
  Result := Inherited Insert;
end;

function TDbPracaComp.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbPracaComp.SetCodigo(const Value: TCmDbField);
begin
  FCodigo := Value;
end;

procedure TDbPracaComp.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbPracaComp.SetIdpracacomp(const Value: TCmDbField);
begin
  FIdpracacomp := Value;
end;

end.

