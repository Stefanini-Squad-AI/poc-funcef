{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbFornserv;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbFornserv = class(TCmDbObject)

  private
    FFlgass: TCmDbField;
    FCodcorresp: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdclasfisclifor: TCmDbField;
    FCodnatureza: TCmDbField;
    FNumdependentes: TCmDbField;
    procedure SetCodcorresp(const Value: TCmDbField);
    procedure SetCodnatureza(const Value: TCmDbField);
    procedure SetFlgass(const Value: TCmDbField);
    procedure SetIdclasfisclifor(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNumdependentes(const Value: TCmDbField);

  public

     Property Numdependentes: TCmDbField read FNumdependentes write SetNumdependentes;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idclasfisclifor: TCmDbField read FIdclasfisclifor write SetIdclasfisclifor;
     Property Flgass: TCmDbField read FFlgass write SetFlgass;
     Property Codnatureza: TCmDbField read FCodnatureza write SetCodnatureza;
     Property Codcorresp: TCmDbField read FCodcorresp write SetCodcorresp;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbFornserv }


constructor TDbFornserv.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FORNSERV';

   fNumdependentes := CreateCmDbField('NUMDEPENDENTES',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdclasfisclifor := CreateCmDbField('IDCLASFISCLIFOR',ftfloat,False,False,False,True,'');
   fFlgass := CreateCmDbField('FLGASS',ftfloat,False,False,False,True,'');
   fCodnatureza := CreateCmDbField('CODNATUREZA',ftString,False,False,False,True,'');
   fCodcorresp := CreateCmDbField('CODCORRESP',ftString,False,False,False,True,'');
end;

function TDbFornserv.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbFornserv.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbFornserv.SetCodcorresp(const Value: TCmDbField);
begin
  FCodcorresp := Value;
end;

procedure TDbFornserv.SetCodnatureza(const Value: TCmDbField);
begin
  FCodnatureza := Value;
end;

procedure TDbFornserv.SetFlgass(const Value: TCmDbField);
begin
  FFlgass := Value;
end;

procedure TDbFornserv.SetIdclasfisclifor(const Value: TCmDbField);
begin
  FIdclasfisclifor := Value;
end;

procedure TDbFornserv.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbFornserv.SetNumdependentes(const Value: TCmDbField);
begin
  FNumdependentes := Value;
end;

end.



