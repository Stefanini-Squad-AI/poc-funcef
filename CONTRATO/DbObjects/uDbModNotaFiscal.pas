{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 15/05/2003                             }
{                                                       }
{*******************************************************}

unit uDbModNotaFiscal;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbModNotaFiscal = class(TCmDbObject)

  private
    FIdmodelonf: TCmDbField;
    FFlgcondensado: TCmDbField;
    FLindetinicial: TCmDbField;
    FDescricao: TCmDbField;
    FIdpessoa: TCmDbField;
    FLindetfinal: TCmDbField;
    FNumlinhasnota: TCmDbField;
  public
     Property Numlinhasnota: TCmDbField read FNumlinhasnota write FNumlinhasnota;
     Property Lindetinicial: TCmDbField read FLindetinicial write FLindetinicial;
     Property Lindetfinal: TCmDbField read FLindetfinal write FLindetfinal;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idmodelonf: TCmDbField read FIdmodelonf write FIdmodelonf;
     Property Flgcondensado: TCmDbField read FFlgcondensado write FFlgcondensado;
     Property Descricao: TCmDbField read FDescricao write FDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbModNotaFiscal }

constructor TDbModNotaFiscal.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;
   TableName := 'MODNOTAFISCAL';
   fNumlinhasnota := CreateCmDbField('NUMLINHASNOTA',ftfloat,False,False,False,True,'');
   fLindetinicial := CreateCmDbField('LINDETINICIAL',ftfloat,True,False,False,True,'');
   fLindetfinal := CreateCmDbField('LINDETFINAL',ftfloat,True,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdmodelonf := CreateCmDbField('IDMODELONF',ftfloat,True,True,False,True,'');
   fFlgcondensado := CreateCmDbField('FLGCONDENSADO',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbModNotaFiscal.Insert: Boolean;
begin
   fIdmodelonf.AsFloat := GetSequence('MODNOTAFISCAL');
   Result := Inherited Insert;
end;

end.



