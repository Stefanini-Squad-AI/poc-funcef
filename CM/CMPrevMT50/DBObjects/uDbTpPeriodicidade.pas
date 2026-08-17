{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/12/2007                             }
{                                                       }
{*******************************************************}

unit uDbTpPeriodicidade;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTpperiodicidade = class(TCmDbObject)

  private
    fIdtpperiodicidade : TCmDbField;
    fNome              : TCmDbField;
    fQtdemeses         : TCmDbField;

    procedure SetIdtpperiodicidade(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetQtdemeses(const Value: TCmDbField);

  public
    Property Qtdemeses         : TCmDbField read fQtdemeses         write SetQtdemeses;
    Property Nome              : TCmDbField read fNome              write SetNome;
    Property Idtpperiodicidade : TCmDbField read fIdtpperiodicidade write SetIdtpperiodicidade;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

implementation

{ TDbTpperiodicidade }

constructor TDbTpperiodicidade.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName          := 'TPPERIODICIDADE';

  fQtdemeses         := CreateCmDbField('QTDEMESES',         ftfloat,    False, False, False, False, '');
  fNome              := CreateCmDbField('NOME',              ftString,   False, False, False, False, '');
  fIdtpperiodicidade := CreateCmDbField('IDTPPERIODICIDADE', ftfloat,    True,  True,  False, False, '');
end;

function TDbTpperiodicidade.Insert: Boolean;
begin
  fIdtpperiodicidade.AsFloat := GetSequence('TPPERIODICIDADE');
  Result := Inherited Insert;
end;      

procedure TDbTpperiodicidade.SetIdtpperiodicidade(const Value: TCmDbField);
begin
  fIdtpperiodicidade := Value;
end;

procedure TDbTpperiodicidade.SetNome(const Value: TCmDbField);
begin
  fNome := Value;
end;

procedure TDbTpperiodicidade.SetQtdemeses(const Value: TCmDbField);
begin
  fQtdemeses := Value;
end;

end.



