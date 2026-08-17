{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/07/2002                             }
{                                                       }
{*******************************************************}

unit uDb_EndPess;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDb_EndPess = class(TCmDbObject)

  private
    FIdpais: TCmDbField;
    FCodestado: TCmDbField;
    FIdcidades: TCmDbField;
    FIdendereco: TCmDbField;
    FNome: TCmDbField;
    FBairro: TCmDbField;
    FComplemento: TCmDbField;
    FCep: TCmDbField;
    FNumero: TCmDbField;
    FCidade: TCmDbField;
    FLogradouro: TCmDbField;
    FIdpessoa: TCmDbField;
    FTipoEndereco: TCmDbField;
    procedure SetBairro(const Value: TCmDbField);
    procedure SetCep(const Value: TCmDbField);
    procedure SetCidade(const Value: TCmDbField);
    procedure SetCodestado(const Value: TCmDbField);
    procedure SetComplemento(const Value: TCmDbField);
    procedure SetIdcidades(const Value: TCmDbField);
    procedure SetIdendereco(const Value: TCmDbField);
    procedure SetIdpais(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetLogradouro(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetNumero(const Value: TCmDbField);
    procedure SetTipoEndereco(const Value: TCmDbField);

  public

     Property Numero: TCmDbField read FNumero write SetNumero;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Logradouro: TCmDbField read FLogradouro write SetLogradouro;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpais: TCmDbField read FIdpais write SetIdpais;
     Property Idendereco: TCmDbField read FIdendereco write SetIdendereco;
     Property Idcidades: TCmDbField read FIdcidades write SetIdcidades;
     Property Complemento: TCmDbField read FComplemento write SetComplemento;
     Property Codestado: TCmDbField read FCodestado write SetCodestado;
     Property Cidade: TCmDbField read FCidade write SetCidade;
     Property Cep: TCmDbField read FCep write SetCep;
     Property Bairro: TCmDbField read FBairro write SetBairro;
     Property TipoEndereco: TCmDbField read FTipoEndereco write SetTipoEndereco;

     Constructor Create( AOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDb_EndPess }

constructor TDb_EndPess.Create( AOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ENDPESS';

   fNumero := CreateCmDbField('NUMERO',ftString,False,False,False,True,'Número');
   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'Nome');
   fLogradouro := CreateCmDbField('LOGRADOURO',ftString,False,False,False,True,'Logradouro');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'Id. Pessoa');
   fIdpais := CreateCmDbField('IDPAIS',ftfloat,False,False,False,True,'Id. País');
   fIdendereco := CreateCmDbField('IDENDERECO',ftfloat,True,True,False,True,'Id. Endereço');
   fIdcidades := CreateCmDbField('IDCIDADES',ftfloat,False,False,False,True,'Id. Cidade');
   fComplemento := CreateCmDbField('COMPLEMENTO',ftString,False,False,False,True,'Complemento');
   fCodestado := CreateCmDbField('CODESTADO',ftString,False,False,False,True,'Cod. Estado');
   fCidade := CreateCmDbField('CIDADE',ftString,False,False,False,True,'Cidade');
   fCep := CreateCmDbField('CEP',ftString,False,False,False,True,'CEP');
   fBairro := CreateCmDbField('BAIRRO',ftString,False,False,False,True,'Bairro');
   FTipoEndereco := CreateCmDbField('TIPOENDERECO',ftString,False,False,False,True,'Tipo');
end;

function TDb_EndPess.Insert: Boolean;
begin

   fIdendereco.AsFloat := GetSequence('ENDPESS');
   Result := Inherited Insert;

end;

function TDb_EndPess.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDb_EndPess.SetBairro(const Value: TCmDbField);
begin
  FBairro := Value;
end;

procedure TDb_EndPess.SetCep(const Value: TCmDbField);
begin
  FCep := Value;
end;

procedure TDb_EndPess.SetCidade(const Value: TCmDbField);
begin
  FCidade := Value;
end;

procedure TDb_EndPess.SetCodestado(const Value: TCmDbField);
begin
  FCodestado := Value;
end;

procedure TDb_EndPess.SetComplemento(const Value: TCmDbField);
begin
  FComplemento := Value;
end;

procedure TDb_EndPess.SetIdcidades(const Value: TCmDbField);
begin
  FIdcidades := Value;
end;

procedure TDb_EndPess.SetIdendereco(const Value: TCmDbField);
begin
  FIdendereco := Value;
end;

procedure TDb_EndPess.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDb_EndPess.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDb_EndPess.SetLogradouro(const Value: TCmDbField);
begin
  FLogradouro := Value;
end;

procedure TDb_EndPess.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDb_EndPess.SetNumero(const Value: TCmDbField);
begin
  FNumero := Value;
end;

procedure TDb_EndPess.SetTipoEndereco(const Value: TCmDbField);
begin
  FTipoEndereco := Value;
end;

end.
