{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbLocatario;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbLocatario = class(TCmDbObject)

  private
    FIdlocatario: TCmDbField;
    FFlgstatus: TCmDbField;
    FCodsubconta: TCmDbField;
    FIdpessoa: TCmDbField;
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetFlgstatus(const Value: TCmDbField);
    procedure SetIdlocatario(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);

  public

     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idlocatario: TCmDbField read FIdlocatario write SetIdlocatario;
     Property Flgstatus: TCmDbField read FFlgstatus write SetFlgstatus;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLocatario }

constructor TDbLocatario.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LOCATARIO';

   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdlocatario := CreateCmDbField('IDLOCATARIO',ftfloat,True,True,False,True,'');
   fFlgstatus := CreateCmDbField('FLGSTATUS',ftString,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
end;

function TDbLocatario.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbLocatario.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbLocatario.SetFlgstatus(const Value: TCmDbField);
begin
  FFlgstatus := Value;
end;

procedure TDbLocatario.SetIdlocatario(const Value: TCmDbField);
begin
  FIdlocatario := Value;
end;

procedure TDbLocatario.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

end.



