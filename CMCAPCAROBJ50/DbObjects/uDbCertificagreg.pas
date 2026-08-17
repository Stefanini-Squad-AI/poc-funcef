{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbCertificagreg;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCertificagreg = class(TCmDbObject)

  private
    FCodtipocustagreg: TCmDbField;
    FOrigemcm: TCmDbField;
    FIdcertificagreg: TCmDbField;
    FDesccertificagreg: TCmDbField;
    FIdreports: TCmDbField;
    FMascara: TCmDbField;
    procedure SetCodtipocustagreg(const Value: TCmDbField);
    procedure SetDesccertificagreg(const Value: TCmDbField);
    procedure SetIdcertificagreg(const Value: TCmDbField);
    procedure SetIdreports(const Value: TCmDbField);
    procedure SetMascara(const Value: TCmDbField);
    procedure SetOrigemcm(const Value: TCmDbField);

  public

     Property Origemcm: TCmDbField read FOrigemcm write SetOrigemcm;
     Property Mascara: TCmDbField read FMascara write SetMascara;
     Property Idreports: TCmDbField read FIdreports write SetIdreports;
     Property Idcertificagreg: TCmDbField read FIdcertificagreg write SetIdcertificagreg;
     Property Desccertificagreg: TCmDbField read FDesccertificagreg write SetDesccertificagreg;
     Property Codtipocustagreg: TCmDbField read FCodtipocustagreg write SetCodtipocustagreg;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCertificagreg }

constructor TDbCertificagreg.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CERTIFICAGREG';

   fOrigemcm := CreateCmDbField('ORIGEMCM',ftfloat,False,False,False,False,'');
   fMascara := CreateCmDbField('MASCARA',ftString,False,False,False,True,'');
   fIdreports := CreateCmDbField('IDREPORTS',ftfloat,False,False,False,True,'');
   fIdcertificagreg := CreateCmDbField('IDCERTIFICAGREG',ftfloat,True,True,False,True,'');
   fDesccertificagreg := CreateCmDbField('DESCCERTIFICAGREG',ftString,False,False,False,True,'');
   fCodtipocustagreg := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat,False,False,False,True,'');
end;

function TDbCertificagreg.Insert: Boolean;
begin

   fIdcertificagreg.AsFloat := GetSequence('CERTIFICAGREG');
   Result := Inherited Insert;

end;


procedure TDbCertificagreg.SetCodtipocustagreg(const Value: TCmDbField);
begin
  FCodtipocustagreg := Value;
end;

procedure TDbCertificagreg.SetDesccertificagreg(const Value: TCmDbField);
begin
  FDesccertificagreg := Value;
end;

procedure TDbCertificagreg.SetIdcertificagreg(const Value: TCmDbField);
begin
  FIdcertificagreg := Value;
end;

procedure TDbCertificagreg.SetIdreports(const Value: TCmDbField);
begin
  FIdreports := Value;
end;

procedure TDbCertificagreg.SetMascara(const Value: TCmDbField);
begin
  FMascara := Value;
end;

procedure TDbCertificagreg.SetOrigemcm(const Value: TCmDbField);
begin
  FOrigemcm := Value;
end;

end.



