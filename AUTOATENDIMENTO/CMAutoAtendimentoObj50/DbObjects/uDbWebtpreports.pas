{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/07/2007                             }
{                                                       }
{*******************************************************}

unit uDbWebtpreports;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbWebtpreports = class(TCmDbObject)

  private
    FFlgtipo: TCmDbField;
    FIdwebreports: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgtipo(const Value: TCmDbField);
    procedure SetIdwebreports(const Value: TCmDbField);

  public

     Property Idwebreports: TCmDbField read FIdwebreports write SetIdwebreports;
     Property Flgtipo: TCmDbField read FFlgtipo write SetFlgtipo;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbWebtpreports }

constructor TDbWebtpreports.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBTPREPORTS';

   fIdwebreports := CreateCmDbField('IDWEBREPORTS',ftfloat,True,True,False,True,'Identificador do relatório');
   fFlgtipo := CreateCmDbField('FLGTIPO',ftfloat,False,False,False,True,'Tipo (S)istema / (U)suário');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'Descrição do relatório');
end;

function TDbWebtpreports.Insert: Boolean;
begin

   fIdwebreports.AsFloat := GetSequence('WEBTPREPORTS');
   Result := Inherited Insert;

end;


procedure TDbWebtpreports.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbWebtpreports.SetFlgtipo(const Value: TCmDbField);
begin
  FFlgtipo := Value;
end;

procedure TDbWebtpreports.SetIdwebreports(const Value: TCmDbField);
begin
  FIdwebreports := Value;
end;

end.



