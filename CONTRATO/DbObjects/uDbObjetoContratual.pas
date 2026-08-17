{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 18/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbObjetoContratual;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbObjetoContratual = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FCodartigo: TCmDbField;
    FNomeobjeto: TCmDbField;
    FIdobjeto: TCmDbField;
    FTipoobjeto: TCmDbField;
  public

     Property Tipoobjeto: TCmDbField read FTipoobjeto write FTipoobjeto;
     Property Nomeobjeto: TCmDbField read FNomeobjeto write FNomeobjeto;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idobjeto: TCmDbField read FIdobjeto write FIdobjeto;
     Property Codartigo: TCmDbField read FCodartigo write FCodartigo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbObjetoContratual }

constructor TDbObjetoContratual.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OBJETOCONTRATUAL';

   fTipoobjeto := CreateCmDbField('TIPOOBJETO',ftString,False,False,False,True,'');
   fNomeobjeto := CreateCmDbField('NOMEOBJETO',ftString,True,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdobjeto := CreateCmDbField('IDOBJETO',ftfloat,True,True,False,True,'');
   fCodartigo := CreateCmDbField('CODARTIGO',ftString,False,False,False,True,'');
end;

function TDbObjetoContratual.Insert: Boolean;
begin
   fIdobjeto.AsFloat := GetSequence('OBJETOCONTRATUAL');
   Result := Inherited Insert;
end;

end.



