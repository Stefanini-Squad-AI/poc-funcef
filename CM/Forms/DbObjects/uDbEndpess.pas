{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/02/2002                             }
{                                                       }
{*******************************************************
Nº SIG...........: 20673
Data da Alteração: 08/06/2016
Responsável......: Michelle Mota
Descrição........: ER180 e ER141 - Inclusão da flag "Ativo" - exclusão lógica.
--------------------------------------------------------------------------------------------------
Nº SOL: 229871/16137
Nº PPM: 407073
Data da Alteração: 02/10/2014
Alteração Form: Incluido o campo tipo de logradouro.
Responsável: Felipe A. Santos
Descrição: Incluido o campo tipo de logradouro, para gravar na base de dados o tipo de logradouro
           na ENDPESS.
--------------------------------------------------------------------------------------------------
Nº SOL......: 215475
Nº KINTANA..: 2044512
Data........: 03/09/2013
Responsável.: Fernando Xavier
Descrição...: Erro no cadastro de favorecido Campo Cidade e Estado não inseridos na ENDPESS
--------------------------------------------------------------------------------------------------
}

unit uDbEndpess;

interface

Uses uCmCustomCdbObject, SysUtils, uCmDbObject, DB;

Type
  TDbEndpess = class(TCmDbObject)

  private
    FCodestado: TCmDbField;
    FComplemento: TCmDbField;
    FTipoendereco: TCmDbField;
    FBairro: TCmDbField;
    FIdendereco: TCmDbField;
    FNumero: TCmDbField;
    FCep: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdpais: TCmDbField;
    FIdcidades: TCmDbField;
    FCidade: TCmDbField;
    FNome: TCmDbField;
    FLogradouro: TCmDbField;
    FIdTipoLogradouro: TCmDbField; // Felipe A. Santos SOL 229871.16137 PPM 407073
    FFlgAtivo: TCmDbField; // Michelle Mota - SIG 20673
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
    procedure SetTipoendereco(const Value: TCmDbField);
    procedure SetIdTipoLogradouro(const Value: TCmDbField); // Felipe A. Santos SOL 229871.16137
    procedure SetFlgAtivo(const Value: TCmDbField); // Michelle Mota - SIG 20673

  public

     Property Tipoendereco: TCmDbField read FTipoendereco write SetTipoendereco;
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
     property IdTipoLogradouro : TCmDbField read FIdTipoLogradouro write SetIdTipoLogradouro; // Felipe A. Santos SOL 229871.16137
     property FlgAtivo : TCmDbField read FFlgAtivo write SetFlgAtivo; // Michelle Mota - SIG 20673

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

     function GetSelectForPessoa: String;

     function DeleteForPessoa(rIdPessoa: Double): Boolean;
  End;

implementation

Uses uCmControlObject;

{ TDbEndpess }

constructor TDbEndpess.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ENDPESS';

   fTipoendereco := CreateCmDbField('TIPOENDERECO',ftString,False,False,False,True,'Tipo de Endereço');
   fNumero := CreateCmDbField('NUMERO',ftString,False,False,False,True,'Número');
   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'Endereço');
   fLogradouro := CreateCmDbField('LOGRADOURO',ftString,False,False,False,True,'Logradouro');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'Identificador da Pessoa');
   fIdpais := CreateCmDbField('IDPAIS',ftfloat,False,False,False,True,'Identificador do País');
   fIdendereco := CreateCmDbField('IDENDERECO',ftfloat,True,True,False,True,'Identificador do Endereço');
   fIdcidades := CreateCmDbField('IDCIDADES',ftfloat,False,False,False,True,'Identificador da Cidade');
   fComplemento := CreateCmDbField('COMPLEMENTO',ftString,False,False,False,True,'Complemento');
   fCodestado := CreateCmDbField('CODESTADO',ftString,False,False,False,True,'Estado');
   fCidade := CreateCmDbField('CIDADE',ftString,False,False,False,True,'Cidade');
   fCep := CreateCmDbField('CEP',ftString,False,False,False,True,'CEP');
   fBairro := CreateCmDbField('BAIRRO',ftString,False,False,False,True,'Bairro');
   fIdTipoLogradouro := CreateCmDbField('IDTIPO_LOGRADOURO', ftfloat, False, False, False, True, 'Tipo de Logradouro'); // Felipe A. Santos SOL 229871.16137
   fFlgAtivo := CreateCmDbField('FLGATIVO', ftString, False, False, False, True, 'Ativo'); // Michelle Mota - SIG 20673
end;

function TDbEndpess.DeleteForPessoa(rIdPessoa: Double): Boolean;
begin
  Result := TCmControlObject(Owner).ExecSql(' DELETE FROM TELCONTATO WHERE ' +
                    ' IDTELEFONE IN (SELECT IDTELEFONE FROM TELENDPESS WHERE IDENDERECO IN (SELECT IDENDERECO FROM ENDPESS WHERE IDPESSOA = ' + FloatToStr(rIdPessoa) + ')) OR ' +
                    ' IDCONTATO IN (SELECT IDCONTATO FROM CONTATOPESS WHERE IDENDERECO IN (SELECT IDENDERECO FROM ENDPESS WHERE IDPESSOA = ' + FloatToStr(rIdPessoa) + '))') AND
            TCmControlObject(Owner).ExecSql('DELETE FROM TELENDPESS WHERE IDENDERECO IN (SELECT IDENDERECO FROM ENDPESS WHERE IDPESSOA =  ' + FloatToStr(rIdPessoa) + ')') AND
            TCmControlObject(Owner).ExecSql('DELETE FROM CONTATOPESS WHERE IDENDERECO IN (SELECT IDENDERECO FROM ENDPESS WHERE IDPESSOA =  ' + FloatToStr(rIdPessoa) + ')') AND
            TCmControlObject(Owner).ExecSql('DELETE FROM ENDPESS WHERE IDPESSOA = ' + FloatToStr(rIdPessoa));
end;

function TDbEndpess.GetSelectForPessoa: String;
begin
   Result := ' SELECT ' +
             '   ENDPESS.IDPESSOA , ' +
             '   ENDPESS.IDENDERECO , ' +
             '   ENDPESS.IDCIDADES , ' +
             '   ENDPESS.LOGRADOURO , ' +
             '   ENDPESS.NUMERO , ' +
             '   ENDPESS.COMPLEMENTO , ' +
             '   ENDPESS.BAIRRO , ' +
             '   ENDPESS.CIDADE , ' +
             '   ENDPESS.NOME , ' +
             '   ENDPESS.CEP , ' +
             '   ENDPESS.FLGATIVO , ' + // Michelle Mota - SIG 20673
             '   C.NOME AS NOMECIDADE, ' +
             '   C.CODMUNICIPIO, ' + // Felipe A. Santos SOL 229871.16137
             '   E.CODESTADO, ' +   // SOL 215475 KTN 2044512
             '   E.NOMEESTADO, ' +
             '   P.NOMEPAIS, ' +
             '   TL.NOME AS TIPOLOGRADOURO, ' + // Felipe A. Santos SOL 229871.16137
             '   TL.IDTIPO_LOGRADOURO ' + // Felipe A. Santos SOL 229871.16137
             ' FROM ' +
             '   ENDPESS, ' +
             '   CIDADES C, ' +
             '   ESTADO E, ' +
             '   PAIS P, ' +
             '   TIPO_LOGRADOURO TL ' + // Felipe A. Santos SOL 229871.16137
             ' WHERE ' +
             '  (E.IDPAIS = P.IDPAIS(+)) AND ' +
             '  (E.IDESTADO(+) = C.IDESTADO) AND ' +
             '  (C.IDCIDADES(+) = ENDPESS.IDCIDADES ) AND ' +
             '  ( ENDPESS.IDTIPO_LOGRADOURO = TL.IDTIPO_LOGRADOURO(+)) AND ' + // Felipe A. Santos SOL 229871.16137
             '  ( ENDPESS.IDPESSOA = ' + Idpessoa.AsString + ' ) ';
end;

function TDbEndpess.Insert: Boolean;
begin
   fIdendereco.AsFloat := GetSequence('ENDPESS');
   Result := Inherited Insert;
end;

function TDbEndpess.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbEndpess.SetBairro(const Value: TCmDbField);
begin
  FBairro := Value;
end;

procedure TDbEndpess.SetCep(const Value: TCmDbField);
begin
  FCep := Value;
end;

procedure TDbEndpess.SetCidade(const Value: TCmDbField);
begin
  FCidade := Value;
end;

procedure TDbEndpess.SetCodestado(const Value: TCmDbField);
begin
  FCodestado := Value;
end;

procedure TDbEndpess.SetComplemento(const Value: TCmDbField);
begin
  FComplemento := Value;
end;

procedure TDbEndpess.SetIdcidades(const Value: TCmDbField);
begin
  FIdcidades := Value;
end;

procedure TDbEndpess.SetIdendereco(const Value: TCmDbField);
begin
  FIdendereco := Value;
end;

procedure TDbEndpess.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDbEndpess.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

// Felipe A. Santos SOL 229871.16137 - início
procedure TDbEndpess.SetIdTipoLogradouro(const Value: TCmDbField);
begin
  FIdTipoLogradouro := Value;
end;
// Felipe A. Santos SOL 229871.16137 - fim

procedure TDbEndpess.SetLogradouro(const Value: TCmDbField);
begin
  FLogradouro := Value;
end;

procedure TDbEndpess.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbEndpess.SetNumero(const Value: TCmDbField);
begin
  FNumero := Value;
end;

procedure TDbEndpess.SetTipoendereco(const Value: TCmDbField);
begin
  FTipoendereco := Value;
end;

// Início - Michelle Mota - SIG 20673
procedure TDbEndpess.SetFlgAtivo(const Value: TCmDbField);
begin
  FFlgAtivo := Value;
end;
// Término - Michelle Mota - SIG 20673

end.



