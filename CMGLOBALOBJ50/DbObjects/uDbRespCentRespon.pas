{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 25/05/2004                             }
{                                                       }
{*******************************************************}

unit uDbRespCentRespon;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;
                                                                     
Type
  TDbRespCentRespon = class(TCmDbObject)

  private
    FDtfimvig: TCmDbField;
    FIdempresa: TCmDbField;
    FIdrespcentrespon: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FDtiniciovig: TCmDbField;
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetDtfimvig(const Value: TCmDbField);
    procedure SetDtiniciovig(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdrespcentrespon(const Value: TCmDbField);

  public

     Property Idrespcentrespon: TCmDbField read FIdrespcentrespon write SetIdrespcentrespon;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Dtiniciovig: TCmDbField read FDtiniciovig write SetDtiniciovig;
     Property Dtfimvig: TCmDbField read FDtfimvig write SetDtfimvig;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRespCentRespon }

constructor TDbRespCentRespon.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RESPCENTRESPON';

   fIdrespcentrespon := CreateCmDbField('IDRESPCENTRESPON',ftfloat,True,True,False,True,'Id.');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'Pessoa');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False,False,True,'Empresa');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftstring,True,False,False,True,'Centro de Responsabilidade');
   fDtiniciovig := CreateCmDbField('DTINICIOVIG',ftDateTime,False,False,False,True,'Início de Vigência');
   fDtfimvig := CreateCmDbField('DTFIMVIG',ftDateTime,False,False,False,True,'Fim de Vigência');
end;

function TDbRespCentRespon.Insert: Boolean;
begin

   fIdrespcentrespon.AsFloat := GetSequence('RESPCENTRESPON');
   Result := Inherited Insert;

end;


procedure TDbRespCentRespon.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbRespCentRespon.SetDtfimvig(const Value: TCmDbField);
begin
  FDtfimvig := Value;
end;

procedure TDbRespCentRespon.SetDtiniciovig(const Value: TCmDbField);
begin
  FDtiniciovig := Value;
end;

procedure TDbRespCentRespon.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbRespCentRespon.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRespCentRespon.SetIdrespcentrespon(const Value: TCmDbField);
begin
  FIdrespcentrespon := Value;
end;

end.



