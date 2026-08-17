{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbWebEndPess;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbWebEndPess = class(TCmDbObject)

  private
    FIdendereco: TCmDbField;
    FCodestado: TCmDbField;
    FTipoendereco: TCmDbField;
    FBairro: TCmDbField;
    FIdpessoa: TCmDbField;
    FNumero: TCmDbField;
    FComplemento: TCmDbField;
    FIdcidades: TCmDbField;
    FCidade: TCmDbField;
    FIdpais: TCmDbField;
    FLogradouro: TCmDbField;
    FColuna: TCmDbField;
    FNome: TCmDbField;
    FCep: TCmDbField;
    FIdWebLogAlteracao: TCmDbField;
    procedure SetBairro(const Value: TCmDbField);
    procedure SetCep(const Value: TCmDbField);
    procedure SetCidade(const Value: TCmDbField);
    procedure SetCodestado(const Value: TCmDbField);
    procedure SetColuna(const Value: TCmDbField);
    procedure SetComplemento(const Value: TCmDbField);
    procedure SetIdcidades(const Value: TCmDbField);
    procedure SetIdendereco(const Value: TCmDbField);
    procedure SetIdpais(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetLogradouro(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetNumero(const Value: TCmDbField);
    procedure SetTipoendereco(const Value: TCmDbField);
    procedure SetIdWebLogAlteracao(const Value: TCmDbField);

  public

     Property IdWebLogAlteracao: TCmDbField read FIdWebLogAlteracao write SetIdWebLogAlteracao;
     Property Tipoendereco: TCmDbField read FTipoendereco write SetTipoendereco;
     Property Numero: TCmDbField read FNumero write SetNumero;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Logradouro: TCmDbField read FLogradouro write SetLogradouro;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpais: TCmDbField read FIdpais write SetIdpais;
     Property Idendereco: TCmDbField read FIdendereco write SetIdendereco;
     Property Idcidades: TCmDbField read FIdcidades write SetIdcidades;
     Property Complemento: TCmDbField read FComplemento write SetComplemento;
     Property Coluna: TCmDbField read FColuna write SetColuna;
     Property Codestado: TCmDbField read FCodestado write SetCodestado;
     Property Cidade: TCmDbField read FCidade write SetCidade;
     Property Cep: TCmDbField read FCep write SetCep;
     Property Bairro: TCmDbField read FBairro write SetBairro;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbWebEndPess }

constructor TDbWebEndPess.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBENDPESS';

   fIdWebLogAlteracao := CreateCmDbField('IDWEBLOGALTERACAO',ftFloat,True,True,False,True,'Id. Alteracao');
   fTipoendereco := CreateCmDbField('TIPOENDERECO',ftString,False,False,False,True,'');
   fNumero := CreateCmDbField('NUMERO',ftString,False,False,False,True,'');
   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fLogradouro := CreateCmDbField('LOGRADOURO',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpais := CreateCmDbField('IDPAIS',ftfloat,False,False,False,True,'');
   fIdendereco := CreateCmDbField('IDENDERECO',ftfloat,True,True,False,True,'Id. Endereço');
   fIdcidades := CreateCmDbField('IDCIDADES',ftfloat,False,False,False,True,'');
   fComplemento := CreateCmDbField('COMPLEMENTO',ftString,False,False,False,True,'');
   fColuna := CreateCmDbField('COLUNA',ftString,False,False,False,True,'');
   fCodestado := CreateCmDbField('CODESTADO',ftString,False,False,False,True,'');
   fCidade := CreateCmDbField('CIDADE',ftString,False,False,False,True,'');
   fCep := CreateCmDbField('CEP',ftString,False,False,False,True,'');
   fBairro := CreateCmDbField('BAIRRO',ftString,False,False,False,True,'');
end;

procedure TDbWebEndPess.SetBairro(const Value: TCmDbField);
begin
  FBairro := Value;
end;

procedure TDbWebEndPess.SetCep(const Value: TCmDbField);
begin
  FCep := Value;
end;

procedure TDbWebEndPess.SetCidade(const Value: TCmDbField);
begin
  FCidade := Value;
end;

procedure TDbWebEndPess.SetCodestado(const Value: TCmDbField);
begin
  FCodestado := Value;
end;

procedure TDbWebEndPess.SetColuna(const Value: TCmDbField);
begin
  FColuna := Value;
end;

procedure TDbWebEndPess.SetComplemento(const Value: TCmDbField);
begin
  FComplemento := Value;
end;

procedure TDbWebEndPess.SetIdcidades(const Value: TCmDbField);
begin
  FIdcidades := Value;
end;

procedure TDbWebEndPess.SetIdendereco(const Value: TCmDbField);
begin
  FIdendereco := Value;
end;

procedure TDbWebEndPess.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDbWebEndPess.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbWebEndPess.SetIdWebLogAlteracao(const Value: TCmDbField);
begin
  FIdWebLogAlteracao := Value;
end;

procedure TDbWebEndPess.SetLogradouro(const Value: TCmDbField);
begin
  FLogradouro := Value;
end;

procedure TDbWebEndPess.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbWebEndPess.SetNumero(const Value: TCmDbField);
begin
  FNumero := Value;
end;

procedure TDbWebEndPess.SetTipoendereco(const Value: TCmDbField);
begin
  FTipoendereco := Value;
end;

end.



