{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Rodolpho da Silva               }
{ Atualizado Em: 02/08/2007                             }
{                                                       }
{*******************************************************}

unit uDbDetblqentdados;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDetblqentdados = class(TCmDbObject)

  private
    FIdpessoaacesso: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FIdcenarioorcamen: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdblqentdados: TCmDbField;
    FIddetblqentdados: TCmDbField;
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetIdblqentdados(const Value: TCmDbField);
    procedure SetIdcenarioorcamen(const Value: TCmDbField);
    procedure SetIddetblqentdados(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdpessoaacesso(const Value: TCmDbField);

  public
     Property IdPessoa         : TCmDbField read FIdPessoa         write SetIdPessoa;
     Property Idpessoaacesso   : TCmDbField read FIdpessoaacesso   write SetIdpessoaacesso;
     Property Iddetblqentdados : TCmDbField read FIddetblqentdados write SetIddetblqentdados;
     Property Idcenarioorcamen : TCmDbField read FIdcenarioorcamen write SetIdcenarioorcamen;
     Property Idblqentdados    : TCmDbField read FIdblqentdados    write SetIdblqentdados;
     Property Codcentrorespon  : TCmDbField read FCodcentrorespon  write SetCodcentrorespon;


     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert: Boolean; Override;
  End;

implementation

{ TDbDetblqentdados }

constructor TDbDetblqentdados.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DETBLQENTDADOS';

  fIdpessoaacesso   := CreateCmDbField('IDPESSOAACESSO',ftfloat,False,False,False,True,'');
  fIddetblqentdados := CreateCmDbField('IDDETBLQENTDADOS',ftfloat,True,True,False,True,'');
  fIdcenarioorcamen := CreateCmDbField('IDCENARIOORCAMEN',ftfloat,False,False,False,True,'');
  fIdblqentdados    := CreateCmDbField('IDBLQENTDADOS',ftfloat,True,False,False,True,'');
  fCodcentrorespon  := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
  FIdpessoa         := CreateCmDbField('IDPESSOA',ftFloat,False,False,False,True,'');
end;

function TDbDetblqentdados.Insert: Boolean;
begin

   fIddetblqentdados.AsFloat := GetSequence('DETBLQENTDADOS');
   Result := Inherited Insert;

end;


procedure TDbDetblqentdados.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbDetblqentdados.SetIdblqentdados(const Value: TCmDbField);
begin
  FIdblqentdados := Value;
end;

procedure TDbDetblqentdados.SetIdcenarioorcamen(const Value: TCmDbField);
begin
  FIdcenarioorcamen := Value;
end;

procedure TDbDetblqentdados.SetIddetblqentdados(const Value: TCmDbField);
begin
  FIddetblqentdados := Value;
end;

procedure TDbDetblqentdados.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbDetblqentdados.SetIdpessoaacesso(const Value: TCmDbField);
begin
  FIdpessoaacesso := Value;
end;

end.



