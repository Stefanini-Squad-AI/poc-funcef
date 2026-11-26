{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbColunaacesso;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbColunaacesso = class(TCmDbObject)

  private
    FColumn_name: TCmDbField;
    FTable_name: TCmDbField;
    FIdespacesso: TCmDbField;
    procedure SetColumn_name(const Value: TCmDbField);
    procedure SetIdespacesso(const Value: TCmDbField);
    procedure SetTable_name(const Value: TCmDbField);

  public

     Property Table_name: TCmDbField read FTable_name write SetTable_name;
     Property Idespacesso: TCmDbField read FIdespacesso write SetIdespacesso;
     Property Column_name: TCmDbField read FColumn_name write SetColumn_name;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbColunaacesso }

constructor TDbColunaacesso.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COLUNAACESSO';

  fTable_name := CreateCmDbField('TABLE_NAME',ftString,True,True,False,True,'');
  fIdespacesso := CreateCmDbField('IDESPACESSO',ftfloat,True,True,False,True,'');
  fColumn_name := CreateCmDbField('COLUMN_NAME',ftString,True,True,False,True,'');
end;

procedure TDbColunaacesso.SetColumn_name(const Value: TCmDbField);
begin
  FColumn_name := Value;
end;

procedure TDbColunaacesso.SetIdespacesso(const Value: TCmDbField);
begin
  FIdespacesso := Value;
end;

procedure TDbColunaacesso.SetTable_name(const Value: TCmDbField);
begin
  FTable_name := Value;
end;

end.



