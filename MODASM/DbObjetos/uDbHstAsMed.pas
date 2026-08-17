{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio / Raniere               }
{ Atualizado Em: 19/08/2002                             }
{                                                       }
{*******************************************************}

unit uDbHstAsMed;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbHstAsMed = class(TCmDbObject)

  private
    FDatareal: TCmDbField;
    FExaminador: TCmDbField;
    FAvaliacao: TCmDbField;
    FIdexaminador: TCmDbField;
    FDataplan: TCmDbField;
    FNumseq: TCmDbField;
    FCodcid: TCmDbField;
    FObservacao: TCmDbField;
    FIdpessoa: TCmDbField;
    FLicenca: TCmDbField;
    FCodtipoocmed: TCmDbField;
  public

     Property Observacao: TCmDbField read FObservacao write FObservacao;
     Property Numseq: TCmDbField read FNumseq write FNumseq;
     Property Licenca: TCmDbField read FLicenca write FLicenca;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idexaminador: TCmDbField read FIdexaminador write FIdexaminador;
     Property Examinador: TCmDbField read FExaminador write FExaminador;
     Property Datareal: TCmDbField read FDatareal write FDatareal;
     Property Dataplan: TCmDbField read FDataplan write FDataplan;
     Property Codtipoocmed: TCmDbField read FCodtipoocmed write FCodtipoocmed;
     Property Codcid: TCmDbField read FCodcid write FCodcid;
     Property Avaliacao: TCmDbField read FAvaliacao write FAvaliacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbHstAsMed }

constructor TDbHstAsMed.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HSTASMED';

   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,true,False,true,'');
   fCodtipoocmed := CreateCmDbField('CODTIPOOCMED',ftfloat,True,true,False,true,'');
   fNumseq := CreateCmDbField('NUMSEQ',ftfloat,True,true,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftBlob,False,False,False,true,'');
   fLicenca := CreateCmDbField('LICENCA',ftfloat,False,False,False,true,'');
   fIdexaminador := CreateCmDbField('IDEXAMINADOR',ftfloat,False,False,False,true,'');
   fExaminador := CreateCmDbField('EXAMINADOR',ftString,False,False,False,true,'');
   fDatareal := CreateCmDbField('DATAREAL',ftDateTime,False,False,False,true,'');
   fDataplan := CreateCmDbField('DATAPLAN',ftDateTime,False,False,False,true,'');
   fCodcid := CreateCmDbField('CODCID',ftString,False,False,False,true,'');
   fAvaliacao := CreateCmDbField('AVALIACAO',ftfloat,False,False,False,true,'');
end;

end.
