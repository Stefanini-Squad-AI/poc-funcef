{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbTelcontato;

interface

Uses uCmCustomCdbObject, SysUtils, uCmDbObject, DB;

Type
  TDbTelcontato = class(TCmDbObject)

  private
    FIdtelcontato: TCmDbField;
    FIdtelefone: TCmDbField;
    FIdcontato: TCmDbField;
    FRamal: TCmDbField;
    procedure SetIdcontato(const Value: TCmDbField);
    procedure SetIdtelcontato(const Value: TCmDbField);
    procedure SetIdtelefone(const Value: TCmDbField);
    procedure SetRamal(const Value: TCmDbField);

  public

     Property Ramal: TCmDbField read FRamal write SetRamal;
     Property Idtelefone: TCmDbField read FIdtelefone write SetIdtelefone;
     Property Idtelcontato: TCmDbField read FIdtelcontato write SetIdtelcontato;
     Property Idcontato: TCmDbField read FIdcontato write SetIdcontato;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

     function GetSelectForPessoa(rIdPessoa: Double): String;
     function DeleteForEndPess(rIdEndPess: Double): Boolean;
  End;

implementation

Uses uCmControlObject;

{ TDbTelcontato }

constructor TDbTelcontato.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TELCONTATO';

   fRamal := CreateCmDbField('RAMAL',ftString,False,False,False,True,'Ramal');
   fIdtelefone := CreateCmDbField('IDTELEFONE',ftfloat,True,False,False,True,'Identificador do Telefone');
   fIdtelcontato := CreateCmDbField('IDTELCONTATO',ftfloat,True,True,False,True,'Identificador do Tel/Contato');
   fIdcontato := CreateCmDbField('IDCONTATO',ftfloat,True,False,False,True,'Identificador do Contato');
end;

function TDbTelcontato.DeleteForEndPess(rIdEndPess: Double): Boolean;
begin
  Result := TCmControlObject(Owner).ExecSql('DELETE FROM TELCONTATO WHERE ' +
                    ' (IDTELEFONE IN (SELECT IDTELEFONE FROM TELENDPESS WHERE IDENDERECO = ' + FloatToStr(rIdEndPess) + ')) OR ' +
                    ' (IDCONTATO IN (SELECT IDCONTATO FROM CONTATOPESS WHERE IDENDERECO = ' + FloatToStr(rIdEndPess) + '))');
end;

function TDbTelcontato.GetSelectForPessoa(rIdPessoa: Double): String;
begin
   Result := ' SELECT ' +
             '   TELCONTATO.IDTELCONTATO, ' +
             '   TELCONTATO.IDCONTATO , ' +
             '   TELCONTATO.IDTELEFONE , ' +
             '   TELCONTATO.RAMAL , ' +
             '   TELENDPESS.NUMERO , ' +
             '   CONTATOPESS.NOME ' +
             ' FROM ' +
             '   CONTATOPESS , ENDPESS ,TELCONTATO , TELENDPESS ' +
             ' WHERE ' +
             '   ( ENDPESS.IDPESSOA = ' + FloatToStr(rIdPessoa) + ' ) AND ' +
             '   ( TELCONTATO.IDCONTATO = CONTATOPESS.IDCONTATO ) AND ' +
             '   ( TELCONTATO.IDTELEFONE = TELENDPESS.IDTELEFONE ) AND ' +
             '   ( CONTATOPESS.IDENDERECO = ENDPESS.IDENDERECO ) AND ' +
             '   ( TELENDPESS.IDENDERECO = ENDPESS.IDENDERECO ) ';
end;

function TDbTelcontato.Insert: Boolean;
begin
   fIdtelcontato.AsFloat := GetSequence('TELCONTATO');
   Result := Inherited Insert;
end;

function TDbTelcontato.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbTelcontato.SetIdcontato(const Value: TCmDbField);
begin
  FIdcontato := Value;
end;

procedure TDbTelcontato.SetIdtelcontato(const Value: TCmDbField);
begin
  FIdtelcontato := Value;
end;

procedure TDbTelcontato.SetIdtelefone(const Value: TCmDbField);
begin
  FIdtelefone := Value;
end;

procedure TDbTelcontato.SetRamal(const Value: TCmDbField);
begin
  FRamal := Value;
end;

end.



