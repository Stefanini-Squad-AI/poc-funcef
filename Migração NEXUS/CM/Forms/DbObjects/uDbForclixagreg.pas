{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbForclixagreg;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbForclixagreg = class(TCmDbObject)

  private
    FCodtipocustagreg: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdforcli: TCmDbField;
    FRecpag: TCmDbField;
    procedure SetCodtipocustagreg(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Codtipocustagreg: TCmDbField read FCodtipocustagreg write SetCodtipocustagreg;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbForclixagreg }

constructor TDbForclixagreg.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FORCLIXAGREG';

   fRecpag := CreateCmDbField('RECPAG',ftString,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,True,True,False,True,'');
   fCodtipocustagreg := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat,True,True,False,True,'');
end;

function TDbForclixagreg.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbForclixagreg.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbForclixagreg.SetCodtipocustagreg(const Value: TCmDbField);
begin
  FCodtipocustagreg := Value;
end;

procedure TDbForclixagreg.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbForclixagreg.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbForclixagreg.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



