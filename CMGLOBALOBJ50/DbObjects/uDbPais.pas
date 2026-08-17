{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 17/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbPais;

{--------------------------------------------------------------------------------
Rotina......: FCodigoeSocial
N. Sol......: 229353-16212
N. Kintana..: 434575
Data........: 18-09-2014
Responsável.: Higor Nayde
Descrição...: ajuste referente ao e-social
--------------------------------------------------------------------------------}


interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPais = class(TCmDbObject)

  private
    FNomepais: TCmDbField;
    FIdpais: TCmDbField;
    FCodigoeSocial: TCmDbField;
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
    procedure SetCodigoeSocial(const Value: TCmDbField);

  public
    Property Nomepais: TCmDbField read FNomepais write SetNomepais;
    Property Nomenacionalidade: TCmDbField read FNomenacionalidade write SetNomenacionalidade;
    Property Mascaracpostal: TCmDbField read FMascaracpostal write SetMascaracpostal;
    Property Idpais: TCmDbField read FIdpais write SetIdpais;
    Property Codregiao: TCmDbField read FCodregiao write SetCodregiao;
    Property Codreceitafederal: TCmDbField read FCodreceitafederal write SetCodreceitafederal;
    Property Codinternacional: TCmDbField read FCodinternacional write SetCodinternacional;
    Property CodigoeSocial: TCmDbField read FCodigoeSocial write SetCodigoeSocial;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

implementation

{ TDbPais }

constructor TDbPais.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PAIS';

  fIdpais            := CreateCmDbField('IDPAIS',ftfloat,True,True,False,True,'Código do País');
  fNomepais          := CreateCmDbField('NOMEPAIS',ftString,True,False,False,True,'Nome');
  fNomenacionalidade := CreateCmDbField('NOMENACIONALIDADE',ftString,False,False,False,True,'Nacionalidade');
  fMascaracpostal    := CreateCmDbField('MASCARACPOSTAL',ftString,False,False,False,True,'Máscara do Código Postal');
  fCodregiao         := CreateCmDbField('CODREGIAO',ftfloat,False,False,False,True,'Código da Região');
  fCodreceitafederal := CreateCmDbField('CODRECEITAFEDERAL',ftInteger,False,False,False,True,'Código da Receita Federal');
  fCodinternacional  := CreateCmDbField('CODINTERNACIONAL',ftString,False,False,False,True,'Código Internacional');
  FCodigoeSocial     := CreateCmDbField('CODIGOESOCIAL',ftInteger,False,False,False,True,'Código do eSocial');
end;

function TDbPais.Insert: Boolean;
begin
  fIdpais.AsFloat := GetSequence('PAIS');
  Result := Inherited Insert;
end;

function TDbPais.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbPais.SetCodigoeSocial(const Value: TCmDbField);
begin
 FCodigoeSocial := Value;
end;

procedure TDbPais.SetCodinternacional(const Value: TCmDbField);
begin
  FCodinternacional := Value;
end;

procedure TDbPais.SetCodreceitafederal(const Value: TCmDbField);
begin
  FCodreceitafederal := Value;
end;

procedure TDbPais.SetCodregiao(const Value: TCmDbField);
begin
  FCodregiao := Value;
end;

procedure TDbPais.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDbPais.SetMascaracpostal(const Value: TCmDbField);
begin
  FMascaracpostal := Value;
end;

procedure TDbPais.SetNomenacionalidade(const Value: TCmDbField);
begin
  FNomenacionalidade := Value;
end;

procedure TDbPais.SetNomepais(const Value: TCmDbField);
begin
  FNomepais := Value;
end;

end.



