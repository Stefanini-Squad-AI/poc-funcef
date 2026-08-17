{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 15/01/2008                             }
{                                                       }
{*******************************************************}

unit uDbPaisAlex;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPaisAlex = class(TCmDbObject)

  private
    FNomepais: TCmDbField;
    FIdpais: TCmDbField;
    FCodinternacional: TCmDbField;
    FCodreceitafederal: TCmDbField;
    FMascaracpostal: TCmDbField;
    FNomenacionalidade: TCmDbField;
    FCodregiao: TCmDbField;
    procedure SetCodinternacional(const Value: TCmDbField);
    procedure SetCodreceitafederal(const Value: TCmDbField);
    procedure SetCodregiao(const Value: TCmDbField);
    procedure SetIdpais(const Value: TCmDbField);
    procedure SetMascaracpostal(const Value: TCmDbField);
    procedure SetNomenacionalidade(const Value: TCmDbField);
    procedure SetNomepais(const Value: TCmDbField);

  public

     Property Nomepais: TCmDbField read FNomepais write SetNomepais;
     Property Nomenacionalidade: TCmDbField read FNomenacionalidade write SetNomenacionalidade;
     Property Mascaracpostal: TCmDbField read FMascaracpostal write SetMascaracpostal;
     Property Idpais: TCmDbField read FIdpais write SetIdpais;
     Property Codregiao: TCmDbField read FCodregiao write SetCodregiao;
     Property Codreceitafederal: TCmDbField read FCodreceitafederal write SetCodreceitafederal;
     Property Codinternacional: TCmDbField read FCodinternacional write SetCodinternacional;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPaisAlex }

constructor TDbPaisAlex.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PAIS';

   fNomepais := CreateCmDbField('NOMEPAIS',ftString,False,False,False,True,'');
   fNomenacionalidade := CreateCmDbField('NOMENACIONALIDADE',ftString,False,False,False,True,'');
   fMascaracpostal := CreateCmDbField('MASCARACPOSTAL',ftString,False,False,False,True,'');
   fIdpais := CreateCmDbField('IDPAIS',ftfloat,True,True,False,True,'');
   fCodregiao := CreateCmDbField('CODREGIAO',ftfloat,False,False,False,True,'');
   fCodreceitafederal := CreateCmDbField('CODRECEITAFEDERAL',ftfloat,False,False,False,True,'');
   fCodinternacional := CreateCmDbField('CODINTERNACIONAL',ftString,False,False,False,True,'');
end;

function TDbPaisAlex.Insert: Boolean;
begin

   fIdpais.AsFloat := GetSequence('PAIS');
   Result := Inherited Insert;

end;


procedure TDbPaisAlex.SetCodinternacional(const Value: TCmDbField);
begin
  FCodinternacional := Value;
end;

procedure TDbPaisAlex.SetCodreceitafederal(const Value: TCmDbField);
begin
  FCodreceitafederal := Value;
end;

procedure TDbPaisAlex.SetCodregiao(const Value: TCmDbField);
begin
  FCodregiao := Value;
end;

procedure TDbPaisAlex.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDbPaisAlex.SetMascaracpostal(const Value: TCmDbField);
begin
  FMascaracpostal := Value;
end;

procedure TDbPaisAlex.SetNomenacionalidade(const Value: TCmDbField);
begin
  FNomenacionalidade := Value;
end;

procedure TDbPaisAlex.SetNomepais(const Value: TCmDbField);
begin
  FNomepais := Value;
end;

end.



