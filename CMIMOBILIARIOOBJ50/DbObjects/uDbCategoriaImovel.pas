{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 27/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbCategoriaImovel;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbCategoriaImovel = class(TCmDbObject)

  private
    FIdcategoriaimovel: TCmDbField;
    FCtidescricao: TCmDbField;
    procedure SetCtidescricao(const Value: TCmDbField);
    procedure SetIdcategoriaimovel(const Value: TCmDbField);

  public

     Property Idcategoriaimovel: TCmDbField read FIdcategoriaimovel write SetIdcategoriaimovel;
     Property Ctidescricao: TCmDbField read FCtidescricao write SetCtidescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCategoriaImovel }

constructor TDbCategoriaImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CATEGORIAIMOVEL';

   fIdcategoriaimovel := CreateCmDbField('IDCATEGORIAIMOVEL',ftfloat,True,True,False,True,'');
   fCtidescricao := CreateCmDbField('CTIDESCRICAO',ftString,True,False,False,True,'Característica do Imóvel');
end;

function TDbCategoriaImovel.Insert: Boolean;
begin

   fIdcategoriaimovel.AsFloat := GetSequence('CATEGORIAIMOVEL');
   Result := Inherited Insert;

end;

function TDbCategoriaImovel.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbCategoriaImovel.SetCtidescricao(const Value: TCmDbField);
begin
  FCtidescricao := Value;
end;

procedure TDbCategoriaImovel.SetIdcategoriaimovel(const Value: TCmDbField);
begin
  FIdcategoriaimovel := Value;
end;

end.



