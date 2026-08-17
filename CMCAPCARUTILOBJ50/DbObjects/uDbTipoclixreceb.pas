{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 28/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipoclixreceb;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTipoclixreceb = class(TCmDbObject)

  private
    FCodtiprecdes: TCmDbField;
    FIdpessoa: TCmDbField;
    FRecpag: TCmDbField;
    FIdtipoclixreceb: TCmDbField;
    FIdtipocliente: TCmDbField;
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtipocliente(const Value: TCmDbField);
    procedure SetIdtipoclixreceb(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idtipoclixreceb: TCmDbField read FIdtipoclixreceb write SetIdtipoclixreceb;
     Property Idtipocliente: TCmDbField read FIdtipocliente write SetIdtipocliente;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipoclixreceb }

constructor TDbTipoclixreceb.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOCLIXRECEB';

   fRecpag          := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fIdtipoclixreceb := CreateCmDbField('IDTIPOCLIXRECEB',ftfloat,True,True,False,True,'');
   fIdtipocliente   := CreateCmDbField('IDTIPOCLIENTE',ftfloat,False,False,False,True,'');
   fIdpessoa        := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fCodtiprecdes    := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
end;

function TDbTipoclixreceb.Insert: Boolean;
begin

   fIdtipoclixreceb.AsFloat := GetSequence('TIPOCLIXRECEB');
   Result := Inherited Insert;

end;

function TDbTipoclixreceb.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTipoclixreceb.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbTipoclixreceb.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbTipoclixreceb.SetIdtipocliente(const Value: TCmDbField);
begin
  FIdtipocliente := Value;
end;

procedure TDbTipoclixreceb.SetIdtipoclixreceb(const Value: TCmDbField);
begin
  FIdtipoclixreceb := Value;
end;

procedure TDbTipoclixreceb.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



