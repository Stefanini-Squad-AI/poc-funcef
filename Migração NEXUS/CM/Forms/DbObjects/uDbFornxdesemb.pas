{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 07/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbFornxdesemb;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbFornxdesemb = class(TCmDbObject)

  private
    FRecpag: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdfornxdesemb: TCmDbField;
    FIdempresaprop: TCmDbField;
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdfornxdesemb(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idfornxdesemb: TCmDbField read FIdfornxdesemb write SetIdfornxdesemb;
     Property Idempresaprop: TCmDbField read FIdempresaprop write SetIdempresaprop;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbFornxdesemb }

constructor TDbFornxdesemb.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FORNXDESEMB';

   fRecpag := CreateCmDbField('RECPAG',ftString,True,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdfornxdesemb := CreateCmDbField('IDFORNXDESEMB',ftfloat,True,True,False,True,'');
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,True,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,True,False,False,True,'');
end;

function TDbFornxdesemb.Insert: Boolean;
begin

   fIdfornxdesemb.AsFloat := GetSequence('FORNXDESEMB');
   Result := Inherited Insert;

end;

function TDbFornxdesemb.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbFornxdesemb.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbFornxdesemb.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDbFornxdesemb.SetIdfornxdesemb(const Value: TCmDbField);
begin
  FIdfornxdesemb := Value;
end;

procedure TDbFornxdesemb.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbFornxdesemb.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



