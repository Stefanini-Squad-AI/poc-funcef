{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 15/05/2003                             }
{                                                       }
{*******************************************************}

unit uDbCompNotaFiscal;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCompNotaFiscal = class(TCmDbObject)

  private
    FIdmodelonf: TCmDbField;
    FFlgimposto: TCmDbField;
    FColuna: TCmDbField;
    FFlgtotalizada: TCmDbField;
    FLinha: TCmDbField;
    FNummaxlinhas: TCmDbField;
    FFlgalinhamento: TCmDbField;
    FValordefault: TCmDbField;
    FTamanho: TCmDbField;
    FIdcompnf: TCmDbField;
    FDescricao: TCmDbField;
  public
     Property Valordefault: TCmDbField read FValordefault write FValordefault;
     Property Tamanho: TCmDbField read FTamanho write FTamanho;
     Property Nummaxlinhas: TCmDbField read FNummaxlinhas write FNummaxlinhas;
     Property Linha: TCmDbField read FLinha write FLinha;
     Property Idmodelonf: TCmDbField read FIdmodelonf write FIdmodelonf;
     Property Idcompnf: TCmDbField read FIdcompnf write FIdcompnf;
     Property Flgtotalizada: TCmDbField read FFlgtotalizada write FFlgtotalizada;
     Property Flgimposto: TCmDbField read FFlgimposto write FFlgimposto;
     Property Flgalinhamento: TCmDbField read FFlgalinhamento write FFlgalinhamento;
     Property Descricao: TCmDbField read FDescricao write FDescricao;
     Property Coluna: TCmDbField read FColuna write FColuna;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCompNotaFiscal }

constructor TDbCompNotaFiscal.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;
   TableName := 'COMPNOTAFISCAL';
   fValordefault := CreateCmDbField('VALORDEFAULT',ftfloat,False,False,False,False,'');
   fTamanho := CreateCmDbField('TAMANHO',ftfloat,True,False,False,False,'');
   fNummaxlinhas := CreateCmDbField('NUMMAXLINHAS',ftfloat,True,False,False,False,'');
   fLinha := CreateCmDbField('LINHA',ftfloat,True,False,False,False,'');
   fIdmodelonf := CreateCmDbField('IDMODELONF',ftfloat,True,True,False,False,'');
   fIdcompnf := CreateCmDbField('IDCOMPNF',ftfloat,True,True,False,False,'');
   fFlgtotalizada := CreateCmDbField('FLGTOTALIZADA',ftString,False,False,False,True,'');
   fFlgimposto := CreateCmDbField('FLGIMPOSTO',ftString,False,False,False,True,'');
   fFlgalinhamento := CreateCmDbField('FLGALINHAMENTO',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'');
   fColuna := CreateCmDbField('COLUNA',ftfloat,True,False,False,False,'');
end;

function TDbCompNotaFiscal.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

end.



