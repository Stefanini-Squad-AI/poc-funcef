{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbRamoxdesemb;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbRamoxdesemb = class(TCmDbObject)

  private
    FRecpag: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FIdramofornecedor: TCmDbField;
    FIdramoxdesemb: TCmDbField;
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdramofornecedor(const Value: TCmDbField);
    procedure SetIdramoxdesemb(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idramoxdesemb: TCmDbField read FIdramoxdesemb write SetIdramoxdesemb;
     Property Idramofornecedor: TCmDbField read FIdramofornecedor write SetIdramofornecedor;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbRamoxdesemb }

constructor TDbRamoxdesemb.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RAMOXDESEMB';

   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fIdramoxdesemb := CreateCmDbField('IDRAMOXDESEMB',ftfloat,True,True,False,True,'');
   fIdramofornecedor := CreateCmDbField('IDRAMOFORNECEDOR',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
end;

function TDbRamoxdesemb.Insert: Boolean;
begin

   fIdramoxdesemb.AsFloat := GetSequence('RAMOXDESEMB');
   Result := Inherited Insert;

end;

function TDbRamoxdesemb.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbRamoxdesemb.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbRamoxdesemb.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRamoxdesemb.SetIdramofornecedor(const Value: TCmDbField);
begin
  FIdramofornecedor := Value;
end;

procedure TDbRamoxdesemb.SetIdramoxdesemb(const Value: TCmDbField);
begin
  FIdramoxdesemb := Value;
end;

procedure TDbRamoxdesemb.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



