{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/12/2007                             }
{                                                       }
{*******************************************************}

unit uDbTpPagtoBeneficio;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTppagtobeneficio = class(TCmDbObject)

  private
    fNome              : TCmDbField;
    fIdtppagtobenefic  : TCmDbField;
    fFlgprazocerto     : TCmDbField;
    fIdtpperiodicidade : TCmDbField;
    fFlgfrequencia     : TCmDbField;
    fQtdemeses         : TCmDbField;

    procedure SetFlgfrequencia(const Value: TCmDbField);
    procedure SetFlgprazocerto(const Value: TCmDbField);
    procedure SetIdtppagtobenefic(const Value: TCmDbField);
    procedure SetIdtpperiodicidade(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetQtdemeses(const Value: TCmDbField);

  public   
    Property Qtdemeses         : TCmDbField read fQtdemeses         write SetQtdemeses;
    Property Nome              : TCmDbField read fNome              write SetNome;
    Property Idtpperiodicidade : TCmDbField read fIdtpperiodicidade write SetIdtpperiodicidade;
    Property Idtppagtobenefic  : TCmDbField read fIdtppagtobenefic  write SetIdtppagtobenefic;
    Property Flgprazocerto     : TCmDbField read fFlgprazocerto     write SetFlgprazocerto;
    Property Flgfrequencia     : TCmDbField read fFlgfrequencia     write SetFlgfrequencia;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

implementation

{ TDbTppagtobeneficio }

constructor TDbTppagtobeneficio.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName          := 'TPPAGTOBENEFICIO';

  fQtdemeses         := CreateCmDbField('QTDEMESES',         ftfloat,    False, False, False, True, '');
  fNome              := CreateCmDbField('NOME',              ftString,   False, False, False, True, '');
  fIdtpperiodicidade := CreateCmDbField('IDTPPERIODICIDADE', ftfloat,    False, False, False, True, '');
  fIdtppagtobenefic  := CreateCmDbField('IDTPPAGTOBENEFIC',  ftfloat,    True,  True,  False, True, '');
  fFlgprazocerto     := CreateCmDbField('FLGPRAZOCERTO',     ftfloat,    False, False, False, True, '');
  fFlgfrequencia     := CreateCmDbField('FLGFREQUENCIA',     ftString,   False, False, False, True, '');
end;

function TDbTppagtobeneficio.Insert: Boolean;
begin
  fIdtppagtobenefic.AsFloat := GetSequence('TPPAGTOBENEFICIO');
  Result                    := Inherited Insert;
end;

procedure TDbTppagtobeneficio.SetFlgfrequencia(const Value: TCmDbField);
begin
  fFlgfrequencia := Value;
end;

procedure TDbTppagtobeneficio.SetFlgprazocerto(const Value: TCmDbField);
begin
  fFlgprazocerto := Value;
end;

procedure TDbTppagtobeneficio.SetIdtppagtobenefic(const Value: TCmDbField);
begin
  fIdtppagtobenefic := Value;
end;

procedure TDbTppagtobeneficio.SetIdtpperiodicidade(
  const Value: TCmDbField);
begin
  fIdtpperiodicidade := Value;
end;

procedure TDbTppagtobeneficio.SetNome(const Value: TCmDbField);
begin
  fNome := Value;
end;

procedure TDbTppagtobeneficio.SetQtdemeses(const Value: TCmDbField);
begin
  fQtdemeses := Value;
end;

end.



