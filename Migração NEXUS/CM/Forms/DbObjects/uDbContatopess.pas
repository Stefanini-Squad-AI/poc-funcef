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
--------------------------------------------------------------------------------------------------}

unit uDbContatopess;

interface

Uses uCmCustomCdbObject, Sysutils, uCmDbObject, DB;

Type
  TDbContatopess = class(TCmDbObject)

  private
    FNome: TCmDbField;
    FNascimento: TCmDbField;
    FEmail: TCmDbField;
    FIdcontato: TCmDbField;
    FSetor: TCmDbField;
    FObs: TCmDbField;
    FIdendereco: TCmDbField;
    FCargo: TCmDbField;
    FFlgAtivo: TCmDbField; // Michelle Mota - SIG 20673
    procedure SetCargo(const Value: TCmDbField);
    procedure SetEmail(const Value: TCmDbField);
    procedure SetIdcontato(const Value: TCmDbField);
    procedure SetIdendereco(const Value: TCmDbField);
    procedure SetNascimento(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetObs(const Value: TCmDbField);
    procedure SetSetor(const Value: TCmDbField);
    procedure SetFlgAtivo(const Value: TCmDbField); // Michelle Mota - SIG 20673

  public

     Property Setor: TCmDbField read FSetor write SetSetor;
     Property Obs: TCmDbField read FObs write SetObs;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Nascimento: TCmDbField read FNascimento write SetNascimento;
     Property Idendereco: TCmDbField read FIdendereco write SetIdendereco;
     Property Idcontato: TCmDbField read FIdcontato write SetIdcontato;
     Property Email: TCmDbField read FEmail write SetEmail;
     Property Cargo: TCmDbField read FCargo write SetCargo;
     property FlgAtivo: TCmDbField read FFlgAtivo write SetFlgAtivo; // Michelle Mota - SIG 20673

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

     Function GetSelectForPessoa(rIdPessoa: Double): String;

     Function DeleteForEndPess(rIdEndPess: Double): Boolean;
  End;

implementation

{ TDbContatopess }

Uses uCmControlObject;

constructor TDbContatopess.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTATOPESS';

   fSetor := CreateCmDbField('SETOR',ftString,False,False,False,True,'Setor');
   fObs := CreateCmDbField('OBS',ftString,False,False,False,True,'Obs');
   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'Nome do Contato');
   fNascimento := CreateCmDbField('NASCIMENTO',ftDateTime,False,False,False,True,'Data de Nascimento');
   fIdendereco := CreateCmDbField('IDENDERECO',ftfloat,False,False,False,True,'Endereço');
   fIdcontato := CreateCmDbField('IDCONTATO',ftfloat,True,True,False,True,'Identificador do Contato');
   fEmail := CreateCmDbField('EMAIL',ftString,False,False,False,True,'e-mail');
   fCargo := CreateCmDbField('CARGO',ftString,False,False,False,True,'Cargo');
   FFlgAtivo := CreateCmDbField('FLGATIVO',ftString,False,False,False,True,'Ativo'); // Michelle Mota - SIG 20673
end;

function TDbContatopess.DeleteForEndPess(rIdEndPess: Double): Boolean;
begin
  Result := TCmControlObject(Owner).ExecSql('DELETE FROM CONTATOPESS WHERE IDENDERECO = ' + FloatToStr(rIdEndPess));
end;

function TDbContatopess.GetSelectForPessoa(rIdPessoa: Double): String;
begin
   Result := ' SELECT ' +
             '  CONTATOPESS.IDCONTATO , ' +
             '  ENDPESS.IDPESSOA , ' +
             '  CONTATOPESS.IDENDERECO , ' +
             '  CONTATOPESS.NOME , ' +
             '  CONTATOPESS.EMAIL , ' +
             '  CONTATOPESS.CARGO , ' +
             '  CONTATOPESS.SETOR, ' +
             '  CONTATOPESS.NASCIMENTO, ' +
             '  CONTATOPESS.OBS ' +
             '  , CONTATOPESS.FLGATIVO ' + // Michelle Mota - SIG 20673
             ' FROM ' +
             '   CONTATOPESS , ENDPESS ' +
             'WHERE ' +
             '   ( ENDPESS.IDPESSOA = ' + FloatToStr(rIdPessoa) + ' ) AND ' +
             '   ( CONTATOPESS.IDENDERECO = ENDPESS.IDENDERECO ) ';
end;

function TDbContatopess.Insert: Boolean;
begin

   fIdcontato.AsFloat := GetSequence('CONTATOPESS');
   Result := Inherited Insert;

end;

function TDbContatopess.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbContatopess.SetCargo(const Value: TCmDbField);
begin
  FCargo := Value;
end;

procedure TDbContatopess.SetEmail(const Value: TCmDbField);
begin
  FEmail := Value;
end;

procedure TDbContatopess.SetIdcontato(const Value: TCmDbField);
begin
  FIdcontato := Value;
end;

procedure TDbContatopess.SetIdendereco(const Value: TCmDbField);
begin
  FIdendereco := Value;
end;

procedure TDbContatopess.SetNascimento(const Value: TCmDbField);
begin
  FNascimento := Value;
end;

procedure TDbContatopess.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbContatopess.SetObs(const Value: TCmDbField);
begin
  FObs := Value;
end;

procedure TDbContatopess.SetSetor(const Value: TCmDbField);
begin
  FSetor := Value;
end;

// Início - Michelle Mota - SIG 20673
procedure TDbContatopess.SetFlgAtivo(const Value: TCmDbField);
begin
  FFlgAtivo := Value;
end;
// Término - Michelle Mota - SIG 20673

end.



