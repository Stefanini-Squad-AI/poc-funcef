{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 28/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamRelats;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbParamRelats = class(TCmDbObject)

  private
    FNomecompo: TCmDbField;
    FValor: TCmDbField;
    FNomerelatorio: TCmDbField;
    FIdmodulo: TCmDbField;
    FDescricao: TCmDbField;
    FIdparamrelats: TCmDbField;
    FIdpessoa: TCmDbField;

  public

     Property Valor: TCmDbField read FValor write FValor;
     Property Nomerelatorio: TCmDbField read FNomerelatorio write FNomerelatorio;
     Property Nomecompo: TCmDbField read FNomecompo write FNomecompo;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idparamrelats: TCmDbField read FIdparamrelats write FIdparamrelats;
     Property Idmodulo: TCmDbField read FIdmodulo write FIdmodulo;
     Property Descricao: TCmDbField read FDescricao write FDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbParamRelats }

constructor TDbParamRelats.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMRELATS';

   fValor := CreateCmDbField('VALOR',ftString,False,False,False,True,'');
   fNomerelatorio := CreateCmDbField('NOMERELATORIO',ftString,False,False,False,True,'');
   fNomecompo := CreateCmDbField('NOMECOMPO',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdparamrelats := CreateCmDbField('IDPARAMRELATS',ftfloat,True,True,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbParamRelats.Insert: Boolean;
begin
   fIdparamrelats.AsFloat := GetSequence('PARAMRELATS');
   Result := Inherited Insert;
end;

function TDbParamRelats.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

end.



