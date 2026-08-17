{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbClixreceb;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbClixreceb = class(TCmDbObject)

  private
    FRecpag: TCmDbField;
    FIdclixreceb: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FIdempresa: TCmDbField;
    FIdpessoa: TCmDbField;
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetIdclixreceb(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idclixreceb: TCmDbField read FIdclixreceb write SetIdclixreceb;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;


     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbClixreceb }

constructor TDbClixreceb.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CLIXRECEB';

   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIdclixreceb := CreateCmDbField('IDCLIXRECEB',ftfloat,True,True,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
end;

function TDbClixreceb.Insert: Boolean;
begin

   fIdclixreceb.AsFloat := GetSequence('CLIXRECEB');
   Result := Inherited Insert;

end;

function TDbClixreceb.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbClixreceb.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbClixreceb.SetIdclixreceb(const Value: TCmDbField);
begin
  FIdclixreceb := Value;
end;

procedure TDbClixreceb.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbClixreceb.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbClixreceb.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



