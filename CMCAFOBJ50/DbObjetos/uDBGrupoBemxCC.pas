{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 17/11/2003                             }
{                                                       }
{*******************************************************}
unit uDBGrupoBemxCC;

interface

uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

Type
  TDBGrupoBemxCC = class(TCmDbObject)

  private
    FCodcentrocusto: TCmDbField;
    FIdgrupo: TCmDbField;
    FIdempresa: TCmDbField;
    FIdpessoa: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);

  public

     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBGrupoBemxCC }

constructor TDBGrupoBemxCC.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;
   TableName := 'GRUPOBEMXCC';
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,True,True,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,True,True,False,True,'');
end;

function TDBGrupoBemxCC.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBGrupoBemxCC.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBGrupoBemxCC.SetCodcentrocusto(const Value: TCmDbField);
begin
   FCodcentrocusto := Value;
end;

procedure TDBGrupoBemxCC.SetIdempresa(const Value: TCmDbField);
begin
   FIdempresa := Value;
end;

procedure TDBGrupoBemxCC.SetIdgrupo(const Value: TCmDbField);
begin
   FIdgrupo := Value;
end;

procedure TDBGrupoBemxCC.SetIdpessoa(const Value: TCmDbField);
begin
   FIdpessoa := Value;
end;

end.

