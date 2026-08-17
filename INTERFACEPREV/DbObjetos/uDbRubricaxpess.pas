{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbRubricaxpess;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbRubricaxpess = class(TCmDbObject)

  private
    FIdrubrica: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodprovdesc: TCmDbField;
    FDescrprovdesc: TCmDbField;
    procedure SetCodprovdesc(const Value: TCmDbField);
    procedure SetDescrprovdesc(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdrubrica(const Value: TCmDbField);

  public

     Property Idrubrica: TCmDbField read FIdrubrica write SetIdrubrica;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Descrprovdesc: TCmDbField read FDescrprovdesc write SetDescrprovdesc;
     Property Codprovdesc: TCmDbField read FCodprovdesc write SetCodprovdesc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRubricaxpess }

constructor TDbRubricaxpess.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RUBRICAXPESS';

   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fDescrprovdesc := CreateCmDbField('DESCRPROVDESC',ftString,False,False,False,True,'');
   fCodprovdesc := CreateCmDbField('CODPROVDESC',ftString,False,False,False,True,'');
end;

function TDbRubricaxpess.Insert: Boolean;
begin


   Result := Inherited Insert;

end;


procedure TDbRubricaxpess.SetCodprovdesc(const Value: TCmDbField);
begin
  FCodprovdesc := Value;
end;

procedure TDbRubricaxpess.SetDescrprovdesc(const Value: TCmDbField);
begin
  FDescrprovdesc := Value;
end;

procedure TDbRubricaxpess.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRubricaxpess.SetIdrubrica(const Value: TCmDbField);
begin
  FIdrubrica := Value;
end;

end.



