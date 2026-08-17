{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 24/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbSitContImob;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbSitContImob = class(TCmDbObject)

  private
    FDescricao: TCmDbField;
    FIdsitcontimob: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdsitcontimob(const Value: TCmDbField);

  public

     Property Idsitcontimob: TCmDbField read FIdsitcontimob write SetIdsitcontimob;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbSitContImob }

constructor TDbSitContImob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SITCONTIMOB';

   fIdsitcontimob := CreateCmDbField('IDSITCONTIMOB',ftfloat,True,True,False,True,'ID da Situação Contratual');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'Descrição');
end;

function TDbSitContImob.Insert: Boolean;
begin

   fIdsitcontimob.AsFloat := GetSequence('SITCONTIMOB');
   Result := Inherited Insert;

end;

function TDbSitContImob.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbSitContImob.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbSitContImob.SetIdsitcontimob(const Value: TCmDbField);
begin
  FIdsitcontimob := Value;
end;

end.



