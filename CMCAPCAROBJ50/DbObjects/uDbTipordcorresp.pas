{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipordcorresp;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTipordcorresp = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FCodcorresp: TCmDbField;
    FIdtipordcorresp: TCmDbField;
    FRecpag: TCmDbField;
    procedure SetCodcorresp(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtipordcorresp(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idtipordcorresp: TCmDbField read FIdtipordcorresp write SetIdtipordcorresp;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Codcorresp: TCmDbField read FCodcorresp write SetCodcorresp;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipordcorresp }

constructor TDbTipordcorresp.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPORDCORRESP';

   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fIdtipordcorresp := CreateCmDbField('IDTIPORDCORRESP',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
   fCodcorresp := CreateCmDbField('CODCORRESP',ftString,False,False,False,True,'');
end;

function TDbTipordcorresp.Insert: Boolean;
begin

   fIdtipordcorresp.AsFloat := GetSequence('TIPORDCORRESP');
   Result := Inherited Insert;

end;

function TDbTipordcorresp.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTipordcorresp.SetCodcorresp(const Value: TCmDbField);
begin
  FCodcorresp := Value;
end;

procedure TDbTipordcorresp.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbTipordcorresp.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbTipordcorresp.SetIdtipordcorresp(const Value: TCmDbField);
begin
  FIdtipordcorresp := Value;
end;

procedure TDbTipordcorresp.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



