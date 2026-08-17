{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbItemContratual;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbItemContratual = class(TCmDbObject)

  private
    FTipocobranca: TCmDbField;
    FNome_item: TCmDbField;
    FIditem: TCmDbField;
    FIdpessoa: TCmDbField;
  public

     Property Tipocobranca: TCmDbField read FTipocobranca write FTipocobranca;
     Property Nome_item: TCmDbField read FNome_item write FNome_item;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Iditem: TCmDbField read FIditem write FIditem;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbItemContratual }

constructor TDbItemContratual.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ITEMCONTRATUAL';

   fTipocobranca := CreateCmDbField('TIPOCOBRANCA',ftString,True,False,False,True,'');
   fNome_item := CreateCmDbField('NOME_ITEM',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIditem := CreateCmDbField('IDITEM',ftfloat,True,True,False,True,'');
end;

function TDbItemContratual.Insert: Boolean;
begin
   fIditem.AsFloat := GetSequence('ITEMCONTRATUAL');
   Result := Inherited Insert;
end;

end.



