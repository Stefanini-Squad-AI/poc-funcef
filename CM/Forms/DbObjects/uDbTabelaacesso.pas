{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbTabelaacesso;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbTabelaacesso = class(TCmDbObject)

  private
    FTable_name: TCmDbField;
    FIdespacesso: TCmDbField;
    procedure SetIdespacesso(const Value: TCmDbField);
    procedure SetTable_name(const Value: TCmDbField);

  public

     Property Table_name: TCmDbField read FTable_name write SetTable_name;
     Property Idespacesso: TCmDbField read FIdespacesso write SetIdespacesso;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbTabelaacesso }

constructor TDbTabelaacesso.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TABELAACESSO';

   fTable_name := CreateCmDbField('TABLE_NAME',ftString,True,True,False,True,'');
   fIdespacesso := CreateCmDbField('IDESPACESSO',ftfloat,True,True,False,True,'');
end;

procedure TDbTabelaacesso.SetIdespacesso(const Value: TCmDbField);
begin
  FIdespacesso := Value;
end;

procedure TDbTabelaacesso.SetTable_name(const Value: TCmDbField);
begin
  FTable_name := Value;
end;

end.



