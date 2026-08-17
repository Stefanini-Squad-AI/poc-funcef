{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 08/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbCaixapequeno;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCaixapequeno = class(TCmDbObject)

  private
    FVlrmaxlanc: TCmDbField;
    FCodtipdoc: TCmDbField;
    FVlrtotcaixapeq: TCmDbField;
    FIdcaixapequeno: TCmDbField;
    FNumdiasvenc: TCmDbField;
    FCodforma: TCmDbField;
    FDesccaixapeq: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdforcli: TCmDbField;
    procedure SetCodforma(const Value: TCmDbField);
    procedure SetCodtipdoc(const Value: TCmDbField);
    procedure SetDesccaixapeq(const Value: TCmDbField);
    procedure SetIdcaixapequeno(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNumdiasvenc(const Value: TCmDbField);
    procedure SetVlrmaxlanc(const Value: TCmDbField);
    procedure SetVlrtotcaixapeq(const Value: TCmDbField);

  public

     Property Vlrtotcaixapeq: TCmDbField read FVlrtotcaixapeq write SetVlrtotcaixapeq;
     Property Vlrmaxlanc: TCmDbField read FVlrmaxlanc write SetVlrmaxlanc;
     Property Numdiasvenc: TCmDbField read FNumdiasvenc write SetNumdiasvenc;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Idcaixapequeno: TCmDbField read FIdcaixapequeno write SetIdcaixapequeno;
     Property Desccaixapeq: TCmDbField read FDesccaixapeq write SetDesccaixapeq;
     Property Codtipdoc: TCmDbField read FCodtipdoc write SetCodtipdoc;
     Property Codforma: TCmDbField read FCodforma write SetCodforma;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCaixapequeno }

constructor TDbCaixapequeno.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CAIXAPEQUENO';

   fVlrtotcaixapeq := CreateCmDbField('VLRTOTCAIXAPEQ',ftfloat,False,False,False,True,'');
   fVlrmaxlanc := CreateCmDbField('VLRMAXLANC',ftfloat,False,False,False,True,'');
   fNumdiasvenc := CreateCmDbField('NUMDIASVENC',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'');
   fIdcaixapequeno := CreateCmDbField('IDCAIXAPEQUENO',ftfloat,True,True,False,True,'');
   fDesccaixapeq := CreateCmDbField('DESCCAIXAPEQ',ftString,False,False,False,True,'');
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
   fCodforma := CreateCmDbField('CODFORMA',ftfloat,False,False,False,True,'');
end;

function TDbCaixapequeno.Insert: Boolean;
begin

   fIdcaixapequeno.AsFloat := GetSequence('CAIXAPEQUENA');
   Result := Inherited Insert;

end;


procedure TDbCaixapequeno.SetCodforma(const Value: TCmDbField);
begin
  FCodforma := Value;
end;

procedure TDbCaixapequeno.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDbCaixapequeno.SetDesccaixapeq(const Value: TCmDbField);
begin
  FDesccaixapeq := Value;
end;

procedure TDbCaixapequeno.SetIdcaixapequeno(const Value: TCmDbField);
begin
  FIdcaixapequeno := Value;
end;

procedure TDbCaixapequeno.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbCaixapequeno.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbCaixapequeno.SetNumdiasvenc(const Value: TCmDbField);
begin
  FNumdiasvenc := Value;
end;

procedure TDbCaixapequeno.SetVlrmaxlanc(const Value: TCmDbField);
begin
  FVlrmaxlanc := Value;
end;

procedure TDbCaixapequeno.SetVlrtotcaixapeq(const Value: TCmDbField);
begin
  FVlrtotcaixapeq := Value;
end;

end.



