{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 08/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbDdTable;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDdTable = class(TCmDbObject)

  private
    FTablealias: TCmDbField;
    FDescricao: TCmDbField;
    FIdddtable: TCmDbField;
    FTablename: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdddtable(const Value: TCmDbField);
    procedure SetTablealias(const Value: TCmDbField);
    procedure SetTablename(const Value: TCmDbField);

  public
    Property CTableName: TCmDbField read FTablename write SetTablename;
    Property Tablealias: TCmDbField read FTablealias write SetTablealias;
    Property Idddtable: TCmDbField read FIdddtable write SetIdddtable;
    Property Descricao: TCmDbField read FDescricao write SetDescricao;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

implementation

{ TDbDdTable }

constructor TDbDdTable.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DDTABLE';

  fTablename  := CreateCmDbField('TABLENAME',ftString,True,False,False,True,'Nome da Tabela');
  fTablealias := CreateCmDbField('TABLEALIAS',ftString,False,False,False,True,'Alias da Tabela');
  fIdddtable  := CreateCmDbField('IDDDTABLE',ftfloat,True,True,False,True,'Código');
  fDescricao  := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'Descrição');
end;

function TDbDdTable.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

procedure TDbDdTable.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbDdTable.SetIdddtable(const Value: TCmDbField);
begin
  FIdddtable := Value;
end;

procedure TDbDdTable.SetTablealias(const Value: TCmDbField);
begin
  FTablealias := Value;
end;

procedure TDbDdTable.SetTablename(const Value: TCmDbField);
begin
  FTablename := Value;
end;

end.

