{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/02/2002                             }
{                                                       }
{*******************************************************
Nº SIG...........: 99908
Data da Alteração: 20/05/2020
Responsável......: Edilaine
Descrição........: inclusão IDPESSOA
---------------------------------------------------------------------------------------------------
Nº SIG...........: 20673
Data da Alteração: 08/06/2016
Responsável......: Michelle Mota
Descrição........: ER180 e ER141 - Inclusão da flag "Ativo" - exclusão lógica.
--------------------------------------------------------------------------------------------------}

unit uDbTelendpess;

interface

Uses uCmCustomCdbObject, SysUtils, uCmDbObject, DB;

Type
  TDbTelendpess = class(TCmDbObject)

  private
    FNumero: TCmDbField;
    FIdendereco: TCmDbField;
    FIdtelefone: TCmDbField;
    FDdi: TCmDbField;
    FDdd: TCmDbField;
    FTipo: TCmDbField;
    FFlgAtivo: TCmDbField;
    FIdPessoa: TCmDbField; // Michelle Mota - SIG 20673
    procedure SetDdd(const Value: TCmDbField);
    procedure SetDdi(const Value: TCmDbField);
    procedure SetIdendereco(const Value: TCmDbField);
    procedure SetIdtelefone(const Value: TCmDbField);
    procedure SetNumero(const Value: TCmDbField);
    procedure SetTipo(const Value: TCmDbField);
    procedure SetFlgAtivo(const Value: TCmDbField); // Michelle Mota - SIG 20673
    procedure SetIdPessoa(const Value: TCmDbField);  //edilaine SIG99908

  public

     Property Tipo: TCmDbField read FTipo write SetTipo;
     Property Numero: TCmDbField read FNumero write SetNumero;
     Property Idtelefone: TCmDbField read FIdtelefone write SetIdtelefone;
     Property Idendereco: TCmDbField read FIdendereco write SetIdendereco;
     Property Ddi: TCmDbField read FDdi write SetDdi;
     Property Ddd: TCmDbField read FDdd write SetDdd;
     Property FlgAtivo: TCmDbField read FFlgAtivo write SetFlgAtivo; // Michelle Mota - SIG 20673
     Property IdPessoa : TCmDbField read FIdPessoa write SetIdPessoa;  //edilaine SIG99908

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

     Function GetSelectForPessoa(rIdPessoa: Double): String;

     Function DeleteForEndPess(rIdEndPess: Double): Boolean;          
  End;

implementation

Uses uCmControlObject;

{ TDbTelendpess }

constructor TDbTelendpess.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TELENDPESS';

   fTipo := CreateCmDbField('TIPO',ftString,False,False,False,True,'Tipo');
   fNumero := CreateCmDbField('NUMERO',ftString,False,False,False,True,'Número');
   fIdtelefone := CreateCmDbField('IDTELEFONE',ftfloat,True,True,False,True,'Telefone');
   fIdendereco := CreateCmDbField('IDENDERECO',ftfloat,False,False,False,True,'Endereço');
   fDdi := CreateCmDbField('DDI',ftString,False,False,False,True,'DDI');
   fDdd := CreateCmDbField('DDD',ftString,False,False,False,True,'DDD');
   FFlgAtivo := CreateCmDbField('FLGATIVO',ftString,False,False,False,True,'Ativo'); // Michelle Mota - SIG 20673
   fIdPessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'Pessoa');    //edilaine SIG99908

end;

function TDbTelendpess.DeleteForEndPess(rIdEndPess: Double): Boolean;
begin
  Result := TCmControlObject(Owner).ExecSql('DELETE FROM TELENDPESS WHERE IDENDERECO = ' + FloatToStr(rIdEndPess));
end;

function TDbTelendpess.GetSelectForPessoa(rIdPessoa: Double): String;
begin
   Result :=  ' SELECT ' +
              '   TELENDPESS.IDTELEFONE , ' +
              '   ENDPESS.IDPESSOA , ' +
              '   TELENDPESS.IDENDERECO , ' +
              '   TELENDPESS.DDI , TELENDPESS.DDD , ' +
              '   TELENDPESS.NUMERO , ' +
              '   TELENDPESS.TIPO ' +
              '   , TELENDPESS.FLGATIVO ' + // Michelle Mota - SIG 20673
              ' FROM ' +
              '   TELENDPESS , ENDPESS ' +
              ' WHERE ' +
              '   ( ENDPESS.IDPESSOA = ' + FloatToStr(rIdPessoa) + ' ) AND ' +
              '   ( TELENDPESS.IDENDERECO = ENDPESS.IDENDERECO ) ';
end;

function TDbTelendpess.Insert: Boolean;
begin
   fIdtelefone.AsFloat := GetSequence('TELENDPESS');
   Result := Inherited Insert;
end;

function TDbTelendpess.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbTelendpess.SetDdd(const Value: TCmDbField);
begin
  FDdd := Value;
end;

procedure TDbTelendpess.SetDdi(const Value: TCmDbField);
begin
  FDdi := Value;
end;

procedure TDbTelendpess.SetIdendereco(const Value: TCmDbField);
begin
  FIdendereco := Value;
end;

procedure TDbTelendpess.SetIdtelefone(const Value: TCmDbField);
begin
  FIdtelefone := Value;
end;

procedure TDbTelendpess.SetNumero(const Value: TCmDbField);
begin
  FNumero := Value;
end;

procedure TDbTelendpess.SetTipo(const Value: TCmDbField);
begin
  FTipo := Value;
end;

// Início - Michelle Mota - SIG 20673
procedure TDbTelendpess.SetFlgAtivo(const Value: TCmDbField);
begin
  FFlgAtivo := Value;
end;
// Término - Michelle Mota - SIG 20673

procedure TDbTelendpess.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

end.



