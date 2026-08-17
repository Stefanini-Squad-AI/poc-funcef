{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 23/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbCidade;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCidade = class(TCmDbObject)

  private
    FUf: TCmDbField;
    FCodmunicipio: TCmDbField;
    FNome: TCmDbField;
    FNumseed: TCmDbField;
    FCodestado: TCmDbField;
    FIdpais: TCmDbField;
    FCodigo_sabre: TCmDbField;
    FIdicone: TCmDbField;
    FIdestado: TCmDbField;
    FDdd: TCmDbField;
    FIdcidade: TCmDbField;
    FCodMunicipioIBGE: TCmDbField;
    procedure SetCodestado(const Value: TCmDbField);
    procedure SetCodigo_sabre(const Value: TCmDbField);
    procedure SetCodmunicipio(const Value: TCmDbField);
    procedure SetDdd(const Value: TCmDbField);
    procedure SetIdcidade(const Value: TCmDbField);
    procedure SetIdestado(const Value: TCmDbField);
    procedure SetIdicone(const Value: TCmDbField);
    procedure SetIdpais(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetNumseed(const Value: TCmDbField);
    procedure SetUf(const Value: TCmDbField);
    procedure SetCodMunicipioIbge(const Value: TCmDbField);

  public
    Property Uf: TCmDbField read FUf write SetUf;
    Property Numseed: TCmDbField read FNumseed write SetNumseed;
    Property Nome: TCmDbField read FNome write SetNome;
    Property Idpais: TCmDbField read FIdpais write SetIdpais;
    Property Idicone: TCmDbField read FIdicone write SetIdicone;
    Property Idestado: TCmDbField read FIdestado write SetIdestado;
    Property Idcidade: TCmDbField read FIdcidade write SetIdcidade;
    Property Ddd: TCmDbField read FDdd write SetDdd;
    Property Codmunicipio: TCmDbField read FCodmunicipio write SetCodmunicipio;
    Property Codigo_sabre: TCmDbField read FCodigo_sabre write SetCodigo_sabre;
    Property Codestado: TCmDbField read FCodestado write SetCodestado;
    Property CodMunicipioIbge: TCmDbField read FCodMunicipioIbge write SetCodMunicipioIbge;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCidade }

constructor TDbCidade.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CIDADES';

  fUf               := CreateCmDbField('UF',ftString,False,False,False,True,'U.F.');
  fNumseed          := CreateCmDbField('NUMSEED',ftString,False,False,False,True,'Num. Seed');
  fNome             := CreateCmDbField('NOME',ftString,False,False,False,True,'Nome');
  fIdpais           := CreateCmDbField('IDPAIS',ftfloat,False,False,False,True,'Id. País');
  fIdicone          := CreateCmDbField('IDICONE',ftfloat,False,False,False,True,'Id. Ícone');
  fIdestado         := CreateCmDbField('IDESTADO',ftfloat,True,False,False,True,'Id. Estado');
  fIdcidade         := CreateCmDbField('IDCIDADES',ftfloat,True,True,False,True,'Id Cidade');
  fDdd              := CreateCmDbField('DDD',ftString,False,False,False,True,'DDD');
  fCodmunicipio     := CreateCmDbField('CODMUNICIPIO',ftString,False,False,False,True,'Cód. Município');
  fCodigo_sabre     := CreateCmDbField('CODIGO_SABRE',ftString,False,False,False,True,'Cód. Sabre');
  fCodestado        := CreateCmDbField('CODESTADO',ftString,False,False,False,True,'Cód. Estado');
  fCodMunicipioIBGE := CreateCmDbField('CODMUNICIPIOIBGE',ftString,False,False,False,True,'Cód. Minicípio IBGE');
end;

function TDbCidade.Insert: Boolean;
begin
  //fIdcidade.AsFloat := GetSequence('CIDADES');
  //Result := Inherited Insert;
  //Brunno Mattos - SOL 148787 - KTN 1055436 - Início
  if (fIdcidade.AsFloat = 0) then
    fIdcidade.AsFloat := GetSequence('CIDADES');
  Result := Inherited Insert;
  //Brunno Mattos - SOL 148787 - KTN 1055436 - Fim
end;

function TDbCidade.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbCidade.SetCodestado(const Value: TCmDbField);
begin
  FCodestado := Value;
end;

procedure TDbCidade.SetCodigo_sabre(const Value: TCmDbField);
begin
  FCodigo_sabre := Value;
end;

procedure TDbCidade.SetCodmunicipio(const Value: TCmDbField);
begin
  FCodmunicipio := Value;
end;

procedure TDbCidade.SetCodMunicipioIbge(const Value: TCmDbField);
begin
  FCodMunicipioIbge := Value;
end;

procedure TDbCidade.SetDdd(const Value: TCmDbField);
begin
  FDdd := Value;
end;

procedure TDbCidade.SetIdcidade(const Value: TCmDbField);
begin
  FIdcidade := Value;
end;

procedure TDbCidade.SetIdestado(const Value: TCmDbField);
begin
  FIdestado := Value;
end;

procedure TDbCidade.SetIdicone(const Value: TCmDbField);
begin
  FIdicone := Value;
end;

procedure TDbCidade.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDbCidade.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbCidade.SetNumseed(const Value: TCmDbField);
begin
  FNumseed := Value;
end;

procedure TDbCidade.SetUf(const Value: TCmDbField);
begin
  FUf := Value;
end;

end.



