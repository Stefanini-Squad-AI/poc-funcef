{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 09/01/2006                             }
{                                                       }
{*******************************************************}

unit uDbMotivobloqueio;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbMotivobloqueio = class(TCmDbObject)

  private
    FDescmotbloq: TCmDbField;
    FIdmotivobloqueio: TCmDbField;
    FSiglamotbloq: TCmDbField;
    procedure SetDescmotbloq(const Value: TCmDbField);
    procedure SetIdmotivobloqueio(const Value: TCmDbField);
    procedure SetSiglamotbloq(const Value: TCmDbField);

  public

     Property Siglamotbloq: TCmDbField read FSiglamotbloq write SetSiglamotbloq;
     Property Idmotivobloqueio: TCmDbField read FIdmotivobloqueio write SetIdmotivobloqueio;
     Property Descmotbloq: TCmDbField read FDescmotbloq write SetDescmotbloq;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbMotivobloqueio }

constructor TDbMotivobloqueio.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MOTIVOBLOQUEIO';

   fSiglamotbloq     := CreateCmDbField('SIGLAMOTBLOQ',ftString,False,False,False,True,'');
   fIdmotivobloqueio := CreateCmDbField('IDMOTIVOBLOQUEIO',ftfloat,True,True,False,True,'');
   fDescmotbloq      := CreateCmDbField('DESCMOTBLOQ',ftString,False,False,False,True,'');
end;

function TDbMotivobloqueio.Insert: Boolean;
begin

   fIdmotivobloqueio.AsFloat := GetSequence('MOTIVOBLOQUEIO');
   Result := Inherited Insert;

end;


procedure TDbMotivobloqueio.SetDescmotbloq(const Value: TCmDbField);
begin
  FDescmotbloq := Value;
end;

procedure TDbMotivobloqueio.SetIdmotivobloqueio(const Value: TCmDbField);
begin
  FIdmotivobloqueio := Value;
end;

procedure TDbMotivobloqueio.SetSiglamotbloq(const Value: TCmDbField);
begin
  FSiglamotbloq := Value;
end;

end.



